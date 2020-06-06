#############################################################################
##
#A  tom.g                       GAP library                   Goetz Pfeiffer.
##
#A  @(#)$Id: tom.g,v 3.9.1.1 1995/07/03 10:18:04 sam Rel $
##
#Y  Copyright 1991-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file  contains  the  functions   dealing   with   Tables Of  Marks.
##
#H  $Log: tom.g,v $
#H  Revision 3.9.1.1  1995/07/03  10:18:04  sam
#H  'tomfusion' component is now used if present
#H
#H  Revision 3.9  1993/10/19  16:42:44  sam
#H  fixed possible absence of 'powermap' component
#H
#H  Revision 3.8  1993/07/29  09:53:42  martin
#H  changed 'TableOfMarks', 'GO.TableOfMarks' now returns table record
#H
#H  Revision 3.7  1993/01/20  15:40:06  goetz
#H  renamed 'DecomposeLine' and 'TestLine', adjusted layout.
#H
#H  Revision 3.6  1993/01/19  13:05:28  goetz
#H  added 'WeightsTom', extended 'DisplayTom'.
#H
#H  Revision 3.5  1993/01/18  17:19:05  goetz
#H  reorganized and renamed 'Tom' to 'TableOfMarks', added 'MatrixTom',
#H  and renamed 'TomTransformed' to 'TomMatrix'.
#H
#H  Revision 3.4  1992/11/14  17:34:41  goetz
#H  added 'Tom', made 'NrSubs' independant of the order in field 'subs'.
#H
#H  Revision 3.3  1992/11/11  11:27:21  goetz
#H  added essential change of flag 'test' in 'TestLine'.
#H
#H  Revision 3.2  1992/11/11  11:16:52  goetz
#H  renamed 'DecomposeLine' to 'DecomposedLine'.
#H
#H  Revision 3.1  1992/11/10  19:30:13  goetz
#H  added header for 'ClassTypesTom'.
#H
#H  Revision 3.0  1992/11/10  18:59:36  goetz
#H  Initial Revision.
#H
##
##  The table  of marks of  a finite group $G$  is  a  matrix whose rows  and
##  columns are labelled by  the conjugacy classes of subgroups  of  $G$  and
##  where for  two subgroups $A$ and $B$ the $(A, B)$--entry is the number of
##  fixed points of $B$ in the transitive action of  $G$ on the cosets of $A$
##  in   $G$.   So   the  table   of  marks  characterizes   all  permutation
##  representations of $G$.
##
##  Moreover  the table of marks gives a compact description  of the subgroup
##  lattice of $G$,  since from the numbers  of  fixed points the numbers  of
##  conjugates of a subgroup $B$ contained in a subgroup $A$ can be derived.
##
##  This package  provides functions that derive information about  the group
##  from the table of marks  and some functions for the generic  construction
##  of a table of marks.

#############################################################################
##
#F  InfoTom1  . . . . . . . . . . . . . . . . . . . . .  package information.
#F  InfoTom2  . . . . . . . . . . . . . . . . . . . . . .  debug information.
##
if not IsBound(InfoTom1) then InfoTom1:= Ignore; fi;
if not IsBound(InfoTom2) then InfoTom2:= Ignore; fi;


#############################################################################
##
#F  IsTom( <obj> )  . . . . . . . . . . . . . . . . . . . . . . . type check.
##
##  A Table of Marks is a record with at least a component 'subs'.
##
IsTom := function(obj)
   return IsRec(obj) and IsBound(obj.subs);
end;


#############################################################################
##
#F  TableOfMarks( <str> | <grp> ) . . . . . . . . .  return a table of marks.
##
##  In the first  form  'Tom' tries to recover a table of marks with the name
##  <str>  from the library.  In  the second  form  it  will check  the group
##  <grp>, this may take a while if  the group  is  big.
##
TableOfMarks := function( obj )
    local   tom;

    if IsString(obj)  then
        tom := TomLibrary( obj );

    elif IsGroup(obj)  then
        if not IsBound( obj.tableOfMarks )  then
            obj.tableOfMarks := obj.operations.TableOfMarks( obj );
        fi;
        tom := obj.tableOfMarks;

    else
        Error("don't know how to construct the table of marks of <obj>");
    fi;

    return tom;
end;

#############################################################################
##
#F  Marks( <tom> )  . . . . . . . . . . . . . . . . . . . . . . .  the marks.
##
##  'Marks' returns the list of lists of marks  of the table of  marks <tom>.
##  If  these are not yet stored in the  component 'marks' of <tom> then they
##  will be computed and assigned to the component 'marks'.
##
Marks := function(tom)

   local i, j, ll, nrSubs, subs, marks, ord;

   if IsBound(tom.marks) then
      return tom.marks;
   fi;

   ll:= Length(tom.order);
   ord:= tom.order[ll];
   subs:= tom.subs;
   nrSubs:= tom.nrSubs;
   marks:= [[ord]];
   for i in [2..ll] do
      marks[i]:= [ord / tom.order[i]];
      for j in [2..Length(subs[i])] do
         marks[i][j]:= nrSubs[i][j] * marks[i][1] / tom.length[subs[i][j]];
         if not IsInt(marks[i][j]) or marks[i][j] < 0 then
            Print("#W  orbit length ", i, ", ", j, ": ", marks[i][j], ".\n");
         fi;
      od;
   od;

   tom.marks:= marks;
   return marks;

end;


#############################################################################
##
#F  NrSubs( <tom> ) . . . . . . . . . . . . . . . . . . numbers of subgroups.
##
##  'NrSubs' also has to compute the orders and lengths from the marks.
##
##  'NrSubs' returns the list of lists of numbers  of subgroups of the  table
##  of marks <tom>.  If these are not yet stored in the component 'nrSubs' of
##  <tom> then they will be computed and assigned to the component 'nrSubs'.
##
NrSubs := function(tom)

   local i, j, nrSubs, subs, marks, order, length, index;

   if IsBound(tom.nrSubs) then
      return tom.nrSubs;
   fi;

   order:= [];
   length:= [];
   nrSubs:= [];
   subs:= tom.subs;
   marks:= tom.marks;
   for i in [1..Length(subs)] do
      index:= marks[i][Position(subs[i], 1)];
      order[i]:= marks[1][1] / index;
      length[i]:= index / marks[i][Position(subs[i], i)];
      nrSubs[i]:= [];
      for j in [1..Length(subs[i])] do
         nrSubs[i][j]:= marks[i][j] * length[subs[i][j]] / index;
         if not IsInt(nrSubs[i][j]) or nrSubs[i][j] < 0 then
            Print("#W  orbit length ",i, ", ",j, ": ", nrSubs[i][j], ".\n");
         fi;
      od;
   od;

   tom.order:= order;
   tom.length:= length;
   tom.nrSubs:= nrSubs;
   return nrSubs;

end;


#############################################################################
##
#F  WeightsTom( <tom> ) . . . . . . . . . . . . . . . . . . . . . .  weights.
##
WeightsTom := function(tom)

   local i, wgt, subs, marks;

   marks:= Marks(tom);
   subs:= tom.subs;

   wgt:= [];
   for i in [1..Length(subs)] do
      wgt[i]:= marks[i][Position(subs[i], i)];
   od;

   return wgt;

end;


#############################################################################
##
#F  TomMat( <mat> ) . . . . .  convert matrix into compressed table of marks.
##
TomMat := function(mat)

   local i, j, subs, marks, normalizer, tom;

   subs:= []; marks:= [];

   for i in [1..Length(mat)] do
      subs[i]:= [];
      marks[i]:= [];
      for j in [1..i] do
	 if mat[i][j] > 0 then
	    Add(subs[i], j);
	    Add(marks[i], mat[i][j]);
	 fi;
      od;
   od;

   tom:=  rec(subs:= subs, marks:= marks);

   return tom;

end;


#############################################################################
##
#F  MatTom( <tom> ) . . . . .  convert compressed table of marks into matrix.
##
MatTom := function(tom)

   local i, j, subs, marks, ll, res;

   marks:= Marks(tom);
   subs:= tom.subs;
   ll:= [1..Length(subs)];

   res:= [];
   for i in ll do
      res[i]:= 0 * ll;
      for j in [1..Length(subs[i])] do
         res[i][subs[i][j]]:= marks[i][j];
      od;
   od;

   return res;

end;


#############################################################################
##
#F  DecomposedFixedPointVector( <tom>, <fix> )  . . . . . .  decompose marks.
##
##  'DecomposedFixedPointVector' takes  a  fix  of fixed  point numbers  and
##  returns the decomposition into rows of the table of marks.
##
DecomposedFixedPointVector := function(tom, fix)

   local i, j, dec, marks, subs, working, oo;

   marks:= Marks(tom);
   subs:= tom.subs;
   oo:= marks[1][1];

   #  just for its side effects.
   NrSubs(tom);

   dec:= [];
   working:= true;
   i:= Length(fix);
   while working do
      while i>0 and fix[i] = 0 do
         i:= i-1;
      od;
      if i = 0 then
          working:= false;
      else
         dec[i]:= fix[i] * tom.length[i] * tom.order[i] / oo;
         for j in [1..Length(subs[i])] do
            fix[subs[i][j]]:= fix[subs[i][j]] - dec[i] * marks[i][j];
         od;
      fi;
   od;

   return dec;

end;


#############################################################################
##
#F  TestTom( <tom> )  . . . . . . . . . consistency check for table of marks.
##
TestRow := function(tom, n)

   local i, j, k, a, b, dec, test, marks, subs;

   test:= true;
   marks:= Marks(tom);
   subs:= tom.subs;
   a:= [];
   for i in [1..Length(subs[n])] do
      a[subs[n][i]]:= marks[n][i];
   od;
   for i in Reversed([1..n]) do
      b:= [];
      for j in [1..Length(subs[i])] do
         k:= subs[i][j];
         if IsBound(a[k]) then
            b[k]:= a[k]*marks[i][j];
         fi;
      od;
      for j in [1..Length(b)] do
         if not IsBound(b[j]) then
            b[j]:= 0;
         fi;
      od;
      dec:= DecomposedFixedPointVector(tom, b);
      if ForAny(Set(dec), x-> not IsInt(x) or (x < 0)) then
         InfoTom2("\n#W ", n, ".", i, " = ", dec, "\n");
         test:= false;
      fi;
   od;

   return test;

end;

TestTom := function(tom)

   local i, test;

   test:= true;

   InfoTom2("#I  ");
   for i in [1..Length(tom.subs)] do
      InfoTom2(i, " \c");
      if not TestRow(tom, i) then
         test:= false;
      fi;
   od;
   InfoTom2(" \n");

   return test;

end;


#############################################################################
##
#F  DisplayTom( <tom> [, <arec> ] ) . . . . . . . . . display table of marks.
##
DisplayTom := function(arg)

   local i, j, k, l, pr1, ll, lk, von, bis, pos, llength, pr, vals, subs,
         arec, tom, classes, lc, ci, wt;

   #  scan arg.
   if Length(arg) = 1 and  IsTom(arg[1]) then
      tom:= arg[1];
      arec:= rec();
   elif Length(arg) = 2 and IsTom(arg[1]) and IsRec(arg[2]) then
      tom:= arg[1];
      arec:= arg[2];
   else
      Error("usage: 'DisplayTom( <tom> [, <arec>] )'");
   fi;

   #  default values.
   subs:= tom.subs;
   ll:= Length(subs);
   classes:= [1..ll];
   vals:= Marks(tom);

   #  adjust parameters.
   if IsBound(arec.classes) and IsList(arec.classes) then
      classes:= arec.classes;
   fi;
   if IsBound(arec.form) then
      if arec.form = "supergroups" then
         vals:= ShallowCopy(vals);
         wt:= WeightsTom(tom);
         for i in [1..ll] do
            vals[i]:= vals[i]/wt[i];
         od;
      elif arec.form = "subgroups" then
         vals:= NrSubs(tom);
      fi;
   fi;

   llength:= SizeScreen()[1];
   von:= 1;
   pr1:= LogInt(ll, 10);

   #  determine column width.
   pr:= List([1..ll], x->0);
   for i in [1..ll] do
      for j in [1..Length(subs[i])] do
         pr[subs[i][j]]:= Maximum(pr[subs[i][j]], LogInt(vals[i][j], 10));
      od;
   od;

   lc:= Length(classes);
   while von <= lc do
      bis:= von;

      #  how many columns on this page?
      lk:= pr1 + 5 + pr[classes[von]];
      while bis < lc and lk+2+pr[classes[bis+1]] <= llength do
         bis:= bis+1;
         lk:= lk+2+pr[classes[bis]];
      od;

      #  loop over rows.
      for i in [von..lc] do
         ci:= classes[i];
         for k in [1 .. pr1-LogInt(ci, 10)] do
            Print(" ");
         od;
         Print(ci, ": ");

         #  loop over columns.
         for j in [von .. Minimum(i, bis)] do
            pos:= Position(subs[ci], classes[j]);
            if pos > 0 and pos <> false then
               l:= LogInt(vals[ci][pos], 10)-1;
            else
               l:= -1;
            fi;
            for k in [1 .. pr[classes[j]] - l] do
               Print(" ");
            od;
            if pos = false then
               Print(".\c");
            else
               Print(vals[ci][pos], "\c");
            fi;
         od;
         Print("\n");
      od;

      von:= bis+1;
      Print("\n");
   od;

end;




#############################################################################
##
#F  NormalizerTom( <tom>, <u> ) . . . . . . . . . . . . determine normalizer.
##
##  'NormalizerTom' tries to find the normalizer  of a subgroup <u>.  It will
##  return the list of those subgroups which have the  right size and contain
##  the subgroup <u> and all subgroups which clearly contain  <u> as a normal
##  subgroup.  If the normalizer is uniquely  determined by these  conditions
##  then only its address is returned.  The list must never be empty.
##
NormalizerTom := function(tom, u)

   local i, ll, res, nord, nn, subs, nrsubs;

   subs:= tom.subs;
   nrsubs:= NrSubs(tom);
   ll:= Length(subs);

   #  order of normalizer.
   nord:= tom.order[ll] / tom.length[u];

   #  selfnormalizing.
   if nord = tom.order[u] then
      return u;
   fi;
   #  normal.
   if tom.length[u] = 1 then
      return ll;
   fi;

   res:= [];
   for i in [u+1..ll] do
      if tom.order[i] = nord then
         Add(res, i);
      fi;
   od;

   #  the normalizer must contain <u>.
   res:= Filtered(res, x-> (u in subs[x]));

   if Length(res) = 1 then
      return res[1];
   fi;

   #  the normalizer must contain all subgroups which contain <u>
   #  as a normal subgroup, in particular those where <u> is of index 2
   #  and those which contain only one conjugate of <u>.
   nn:= [];
   for i in [u+1..Minimum(res)-1] do
      if u in subs[i] then
         if tom.order[i] = 2 * tom.order[u] or
            nrsubs[i][Position(subs[i], u)] = 1 then
            Add(nn, i);
         fi;
      fi;
   od;

   res:= Filtered(res, x-> IsSubset(subs[x], nn));

   if Length(res) = 1 then
      return res[1];
   fi;
   return res;

end;


#############################################################################
##
#F  IntersectionsTom( <tom>, <a>, <b> ) . . . . . intersections of subgroups.
##
##  The intersections of two conjugacy classes of subgroups are determined by
##  the decomposition of the tensor product of their lines of marks.
##
IntersectionsTom := function(tom, a, b)

   local i, j, k, h, line, dec, marks, subs;

   marks:= Marks(tom);
   subs:= tom.subs;
   h:= [];   line:= [];

   for i in [1..Length(subs[a])] do
      h[subs[a][i]]:= marks[a][i];
   od;
   for j in [1..Length(subs[b])] do
      k:= subs[b][j];
      if IsBound(h[k]) then
         line[k]:= h[k]*marks[b][j];
      fi;
   od;
   for j in [1..Length(line)] do
      if not IsBound(line[j]) then
         line[j]:= 0;
      fi;
   od;
   dec:= DecomposedFixedPointVector(tom, line);

   return(dec);

end;


#############################################################################
##
#F  IsCyclicTom( <tom>, <n> ) . . . . . . check whether a subgroup is cyclic.
##
##  A subgroup is cyclic if  and only if  the sum of the corresponding row of
##  the inverse table of marks is nonzero (see Kerber, S. 125).  Thus we only
##  have to decompose the corresponding idempotent.
##
IsCyclicTom := function(tom, n)

   local i, mline, mdec, sum;

   mline:= 0 * [1..n];
   mline[n]:= 1;

   #  decompose mline w.r.t. tom.
   mdec:= DecomposedFixedPointVector(tom, mline);

   #  determine sum.
   sum:= 0;
   for i in mdec do
      sum:= sum + i;
   od;

   return sum <> 0;

end;


#############################################################################
##
#F  PermCharsTom( <tom>, <fus> )  . . . . . . . . . . permutation characters.
##
##  'PermCharsTom' reads the list of permutation characters from the table of
##  marks <tom>.  It therefore has to  know  the fusion map <fus> which sends
##  each conjugacy  class of elements  of the group to the conjugacy class of
##  subgroups that they generate.
##
PermCharsTom := function(tom, fus)

   local pc, i, j, line, marks, subs;

   pc:= [];

   marks:= Marks(tom);
   subs:= tom.subs;

   #  for every class of subgroups.
   for i in [1..Length(subs)] do

      #  initialize permutation character.
      line:= 0 * fus;

      #  extract the values.
      for j in [1..Length(fus)] do
         if fus[j] in subs[i] then
            line[j]:= marks[i][Position(subs[i], fus[j])];
         fi;
      od;
      pc[i]:= line;
   od;

   return pc;

end;


#############################################################################
##
#F  FusionCharTableTom( <tbl>, <tom> )  . . . . . . . . . . . element fusion.
##
##  'FusionCharTableTom' determines  the fusion of the  classes  of  elements
##  from  the  character table <tbl> into classes of cyclic subgroups  on the
##  table of marks <tom>.
##
FusionCharTableTom := function(tbl, tom)

   local i, j, h, hh, fus, orders, cycs, ll, ind, p, pow, subs, marks;

   # If the fusion is stored on 'tbl' then take it.
   # (It is assumed that the table of marks has not been resorted.)
   if IsBound( tbl.tomfusion ) then
     if IsBound( tbl.permutation ) then
       return Permuted( tbl.tomfusion.map, tbl.permutation );
     else
       return tbl.tomfusion.map;
     fi;
   fi;

   #  get orders of elements.
   orders:= tbl.orders;

   #  determine cyclic subgroups.
   marks:= Marks(tom);
   subs:= tom.subs;
   ll:= Length(subs);
   cycs:= [];
   for i in [1..ll] do
      if tom.order[i] in orders and IsCyclicTom(tom, i) then
         Add(cycs, i);
      fi;
   od;

   #  collect candidates for each class.
   fus:= [];
   for i in [1..Length(orders)] do
      fus[i]:= [];
      for j in cycs do
         if orders[i] = tom.order[j] then
            Add(fus[i], j);
         fi;
      od;
      if Length(fus[i]) = 1 then
         fus[i]:= fus[i][1];
      fi;
   od;

   #  maybe the map is already unique.
   if IsVector(fus) then
      return fus;
   fi;

   #  check centralizers.
   for i in [1..Length(fus)] do
      if IsList(fus[i]) then
         h:= Length(ClassOrbitCharTable(tbl, i))
                                       * tbl.classes[i] / Phi(tbl.orders[i]);
         hh:= [];
         for j in fus[i] do
            if tom.length[j] = h then
               Add(hh, j);
            fi;
         od;
         if Length(hh) = 1 then
            fus[i]:= hh[1];
         else
            fus[i]:= hh;
         fi;
      fi;
   od;

   #  maybe the map is already unique.
   if IsVector(fus) then
      return fus;
   fi;

   #  check powermap against incidence.
   if IsBound( tbl.powermap ) then	

     for p in [2..Length(tbl.powermap)] do
        if IsBound(tbl.powermap[p]) and IsPrime(p) then
           pow:= [];
           for i in [1..Length(cycs)] do
              h:= tom.order[cycs[i]] / GcdInt(tom.order[cycs[i]], p);
              hh:= [];
              for j in cycs do
                 if tom.order[j] = h then
                    Add(hh, j);
                 fi;
              od;
              hh:= Intersection(hh, tom.subs[cycs[i]]);
              if Length(hh) = 1 then
                 pow[cycs[i]]:= hh[1];
              else
                 Error("No unique cyclic subgroup found");
              fi;
           od;
  
           CommutativeDiagram(fus, pow, tbl.powermap[p], fus);
  
           #  maybe the map is already unique.
           if IsVector(fus) then
              return fus;
           fi;
  
        fi;
     od;

   fi;

   #  the fusion map must onto 'cycs'.
   fus:= ContainedMaps(fus);
   hh:= [];
   for i in fus do
      if Set(i) = cycs then
         Add(hh, i);
      fi;
   od;
   fus:= hh;

   #  check powermap against incidence.
   if IsBound( tbl.powermap ) then	

     for p in [2..Length(tbl.powermap)] do
        if IsBound(tbl.powermap[p]) then
           pow:= [];
           for i in [1..Length(cycs)] do
              h:= tom.order[cycs[i]] / GcdInt(tom.order[cycs[i]], p);
              hh:= [];
              for j in cycs do
                 if tom.order[j] = h then
                    Add(hh, j);
                 fi;
              od;
              hh:= Intersection(hh, tom.subs[cycs[i]]);
              if Length(hh) = 1 then
                 pow[cycs[i]]:= hh[1];
              else
                 Error("No unique cyclic subgroup found");
              fi;
           od;
  
           hh:= [];
           for i in fus do
              if CommutativeDiagram(i, pow, tbl.powermap[p], i) <> false then
                 Add(hh, i);
              fi;
           od;
           fus:= hh;
  
           #  maybe the map is already unique.
           if Length(fus) = 1 then
              return fus[1];
           fi;
  
        fi;
     od;

   fi;

   return fus;

end;


#############################################################################
##
#F  MoebiusTom( <tom> ) . . . . . . . . . . . . . . . . . . moebius function.
##
##  'MoebiusTom' computes the Moebius values both of the subgroup  lattice of
##  the group with tabel of marks <tom> and of the poset of conjugacy classes
##  of subgroups.  It returns a record where the component 'mu'  contains the
##  Moebius  values  of the subgroup lattice  and the component 'nu' contains
##  the Moebius values of the poset.  Moreover  according to a  conjecture of
##  Isaacs et  al. the values on the poset of conjugacy classes  are  derived
##  from  those  of  the subgroup  lattice.   These  theoreticla  values  are
##  returned  in the  component  'ex'.   For  that  computation  the  derived
##  subgroup must be known in  the component 'derivedSubgroup' of <tom>.  The
##  numbers of those subgroups where the  theoretical value does not coincide
##  with the actual value are returned in the component 'hyp'.
##
MoebiusTom := function(tom)

   local i, j, mline, nline, ll, mdec, ndec, expec, done, no, comsec,
         subs, nrsubs;

   nrsubs:= NrSubs(tom);
   subs:= tom.subs;

   mline:= 0 * tom.length;
   nline:= 0 * tom.length;

   ll:= Length(mline);
   mline[ll]:= 1;
   nline[ll]:= 1;

   # decompose mline with tom
   # decompose nline w.r.t. incidence

   mdec:= [];
   done:= false;
   i:= Length(mline);
   while not done do
      while i>0 and mline[i] = 0 do
         i:= i-1;
      od;
      if i = 0 then
          done:= true;
      else
         mdec[i]:= mline[i];
         for j in [1..Length(subs[i])] do
            mline[subs[i][j]]:= mline[subs[i][j]] - mdec[i]*nrsubs[i][j];
         od;
         mdec[i]:= mdec[i] / tom.length[i];
      fi;
   od;

   ndec:= [];
   done:= false;
   i:= Length(nline);
   while not done do
      while i>0 and nline[i] = 0 do
         i:= i-1;
      od;
      if i = 0 then
          done:= true;
      else
         ndec[i]:= nline[i];
         for j in subs[i] do
            nline[j]:= nline[j] - ndec[i];
         od;
      fi;
   od;

   #  determine intersections  with derived subgroup.
   expec:= [];
   if tom.derivedSubgroup <> ll then
      comsec:= [];
      for i in [1..ll] do

         #  there is only one intersection with normal subgroups.
         comsec[i]:= Length(IntersectionsTom(tom, i, tom.derivedSubgroup));
      od;
      for i in [1..Length(ndec)] do
         if IsBound(ndec[i]) then
            no:= tom.normalizer[i];

            #  maybe the normalizer is not unique.
            if IsList(no) then
               no:= List(no, x-> tom.order[comsec[x]]);
               no:= Set(no);
               if Size(no) > 1 then
                  InfoTom2("#W  Size of normalizer ", i, "not unique.\n");
               else
                  no:= no[1];
               fi;
            else
               no:= tom.order[comsec[no]];
            fi;
            expec[i]:= ndec[i] * no / tom.order[comsec[i]];
         fi;
      od;

   #  perfect groups.
   else
      for i in [1..Length(ndec)] do
         if IsBound(ndec[i]) then
            expec[i]:= ndec[i] * tom.order[ll]/tom.order[i]/tom.length[i];
         fi;
      od;
   fi;

   return rec(mu:= mdec, nu:= ndec, ex:= expec,
              hyp:= Filtered([1..Length(expec)], function(x)
              if IsBound(expec[x]) then
               if IsBound(mdec[x]) then
                 return expec[x] <> mdec[x];
               else return true; fi;
              else
               if IsBound(mdec[x]) then
                 return true;
               else
                  return false; fi; fi; end));

end;


#############################################################################
##
#F  CyclicExtensionsTom( <tom>, <p> ) . . . . . . . . . .  cyclic extensions.
##
##  According to Dress two columns of a table of  marks mod <p> are equal  if
##  and  only  if  the  corresponding subgroups are  connected by a  chain of
##  normal  extensions  of  order  <p>.   'CyclicExtensionsTom'  returns  the
##  classes of this equivalence relation.
##
##  This  information is  not used by  'NormalizerTom' although it might give
##  additional retrictions in the search of normalizers.
##
CyclicExtensionsTom := function(tom, p)

   local i, j, h, ll, done, classes, pos, val, marks, subs;

   #  check arguments.
   if not IsPrime(p) then
      Error("<p> must be a prime.");
   fi;

   marks:= Marks(tom);
   subs:= tom.subs;
   ll:= Length(subs);

   pos:= [];
   val:= [];

   #  take marks mod <p> and transpose.
   for i in [1..ll] do
      pos[i]:= [];
      val[i]:= [];
      for j in [1..Length(subs[i])] do
         h:= marks[i][j] mod p;
         if h <> 0 then
            Add(pos[subs[i][j]], i);
            Add(val[subs[i][j]], h);
         fi;
      od;
   od;

   #  form classes
   classes:= [];
   for i in [1..ll] do
      j:= 1;
      done:= false;
      while not done and j < i do
         if pos[i] = pos[j] and val[i] = val[j] then
            Add(classes[j], i);
            done:= true;
         fi;
         j:= j+1;
      od;
      if not done then
         classes[i]:= [i];
      fi;
   od;

   return Set(classes);

end;


#############################################################################
##
#F  IdempotentsTom( <tom> ) . . . . . . . . . . . . . . . . . .  idempotents.
##
##  'IdempotentsTom' returns the list of idempotents of the integral Burnside
##  ring described  by the table of  marks  <tom>.   According to Dress these
##  idempotents correspond to the  classes of perfect subgroups and each such
##  idempotent is the  characteristic function  of  all those subgroups which
##  arise by cyclic extension from the corresponding perfect subgroup.
##
IdempotentsTom := function(tom)

   local i, c, classes, p, ext, marks;

   marks:= Marks(tom);

   classes:= [1..Length(marks)];

   for p in Set(Factors(marks[1][1])) do
      ext:= CyclicExtensionsTom(tom, p);
      for c in ext do
         for i in c do
             classes[i]:= classes[c[1]];
         od;
      od;
   od;

   for i in [1..Length(classes)] do
      classes[i]:= classes[classes[i]];
   od;

   return classes;

end;


#############################################################################
##
#F  ClassTypesTom( <tom> )  . . . . . . . . . . . . . . . types of subgroups.
##
##  'ClassTypesTom'   distinguishes  isomorphism  types  of  the  classes  of
##  subgroups of the  table of marks <tom> as  far  as this is possible.  Two
##  subgroups  are  clearly  not  isomorphic  if  they have different orders.
##  Moreover isomorphic subgroups must contain  the  same number of subgroups
##  of each type.
##
##  The types are represented by  numbers.   'ClassTypesTom' returns  a  list
##  which contains for each class of subgroups its corresponding number.
##
ClassTypesTom := function(tom)

   local i, j, done, nrsubs, subs, type, struct, nrtypes;

   nrsubs:= NrSubs(tom);
   subs:= tom.subs;

   type:= [];
   struct:= [];
   nrtypes:= 1;

   for i in [1..Length(subs)] do

      #  determine type
      struct[i]:= [];
      for j in [2..Length(subs[i])-1] do
         if IsBound(struct[i][type[subs[i][j]]]) then
            struct[i][type[subs[i][j]]]:=
                            struct[i][type[subs[i][j]]] + nrsubs[i][j];
         else
            struct[i][type[subs[i][j]]]:= nrsubs[i][j];
         fi;
      od;

      for j in [1..i-1] do
         if tom.order[j] = tom.order[i] and struct[j] = struct[i] then
            type[i]:= type[j];
         fi;
      od;

      if not IsBound(type[i]) then
         type[i]:= nrtypes;
         nrtypes:= nrtypes+1;
      fi;
   od;

   return type;

end;


#############################################################################
##
#F  ClassNamesTom( <tom> )  . . . . . . . . . . . . . . . . . .  class names.
##
##  'ClassNamesTom'  constructs generic names  for  the  conjugacy classes of
##  subgroups of the table of marks <tom>.  Each name consists of three parts
##  and  has the following form, (o)_{t}l, where o indicates the order of the
##  subgroup, t is a number that distinguishes different types  of  subgroups
##  of  the  same  order  and  l is a letter  which distinguishes classes  of
##  subgroups  of the  same  type  and order.   The  type  of a  subgroup  is
##  determined by the numbers its subgroups of other types.  This is slightly
##  weaker than isomorphism.
##
##  The letter is omitted if  there  is only  one  class of subgroups of that
##  order and type and the type is omitted if there is only one class of that
##  order.  Moreover the braces  {}  around the type are  omitted if the type
##  number has  only  one  digit.  Cyclic subgroups will have  no parenthesis
##  around the order and no type number.
##
ClassNamesTom := function(tom)

   local i, c, classes, type, name, count, ord, alp, la;

   type:= ClassTypesTom(tom);

   #  form classes.
   classes:= List([1..Maximum(type)], x-> rec(elts:= []));
   for i in [1..Length(type)] do
      Add(classes[type[i]].elts, i);
   od;

   #  determine type.
   count:= rec();
   for i in [1..Length(classes)] do
      ord:= String(tom.order[classes[i].elts[1]]);
      if IsBound(count.(ord)) then
         count.(ord).nr:= count.(ord).nr + 1;
         if count.(ord).nr < 10 then
            classes[i].type:=
               ConcatenationString("_", String(count.(ord).nr));
         else
            classes[i].type:=
           ConcatenationString("_{", String(count.(ord).nr), "}");
         fi;
      else
         count.(ord):= rec(first:= classes[i], nr:= 1);
         classes[i].type:= "_1";
      fi;

      #  cyclic?
      if Set(tom.nrSubs[classes[i].elts[1]]) = [1]
            and IsCyclicTom(tom, classes[i].elts[1]) then
         classes[i].order:= ord;
         classes[i].type:= "";
      else
         classes[i].order:= ConcatenationString("(", ord, ")");
      fi;

   od;

   #  omit unique types.
   for i in RecFields(count) do
      if count.(i).nr = 1 then
         count.(i).first.type:= "";
      fi;
   od;

   #  construct names.
   name:= [];
   alp:= ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
            "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
   la:= Length(alp);
   for c in classes do
      if Length(c.elts) = 1 then
         name[c.elts[1]]:= ConcatenationString(c.order, c.type);
      else
         for i in [1..Length(c.elts)] do
            if i <= la then
               name[c.elts[i]]:= ConcatenationString(c.order,c.type,alp[i]);
            elif i <= la * (la+1) then
               name[c.elts[i]]:= ConcatenationString(c.order, c.type,
                       alp[QuoInt(i-1, la)], alp[i mod la]);
            else
               Error("did not expect more than ", la * (la+1),
                     "classes of the same type");
            fi;
         od;
      fi;
   od;

   return name;

end;


#############################################################################
##
#F  TomCyclic( <n> )  . . . . . .  The Table of Marks of Cyclic groups $C_n$.
##
##  'TomCyclic' constructs the table of  marks of the  cyclic group of  order
##  <n>.
##
TomCyclic := function(n)

   local i, j, divs, index, name, subs, marks;

   divs:= DivisorsInt(n);

   name:= [];
   subs:= [];
   marks:= [];

   for i in [1..Length(divs)] do
      name[i]:= String(divs[i]);
      subs[i]:= [];
      marks[i]:= [];
      index:= n / divs[i];
      for j in [1..i] do
         if divs[i] mod divs[j] = 0 then
            Add(subs[i], j);
            Add(marks[i], index);
         fi;
      od;
   od;

   return rec(name:= name, subs:= subs, marks:= marks);

end;


#############################################################################
##
#F  TomDihedral( <m> )  . . . .  The Table of Marks of dihedral groups $D_m$.
##
##  'TomDihedral'  constructs the table  of  marks of the  dihedral  group of
##  order <m>.
##
TomDihedral := function(m)

   local i, j, divs, n, name, marks, subs, type, nrs, pt, d, construct, ord;

   n:= m/2;

   if not IsInt(n) then
      Error(" <m> must not be odd ");
   fi;

   divs:= DivisorsInt(m);

   construct:= [[

      function(i, j)
         if divs[i] mod divs[j] = 0 then
            Add(subs[nrs[i]], nrs[j]);
            Add(marks[nrs[i]], m/divs[i]);
         fi;
      end,

      Ignore,

      function(i, j)
         if divs[i] mod divs[j] = 0 then
            Add(subs[nrs[i]], nrs[j]);
            Add(marks[nrs[i]], m/divs[i]);
         fi;
      end], [

      function(i, j)
         if divs[i] mod divs[j] = 0 and divs[i] > divs[j] then
            Add(subs[nrs[i]], nrs[j]);
            Add(marks[nrs[i]], m/divs[i]);
         fi;
      end,

      function(i, j)
         if divs[i] mod divs[j] = 0 then
            Add(subs[nrs[i]], nrs[j]);
            Add(marks[nrs[i]], 1);
         fi;
      end,

      function(i, j)
         if divs[i] mod divs[j] = 0 then
            Append(subs[nrs[i]], [nrs[j]..nrs[j]+2]);
            Append(marks[nrs[i]], [m/divs[i], 1, 1]);
         fi;
      end], [

      function(i, j)
         if divs[i] mod (2*divs[j]) = 0 then
            Add(subs[nrs[i]], nrs[j]);
            Add(subs[nrs[i]+1], nrs[j]);
            Add(subs[nrs[i]+2], nrs[j]);
            Add(marks[nrs[i]], m/divs[i]);
            Add(marks[nrs[i]+1], m/divs[i]);
            Add(marks[nrs[i]+2], m/divs[i]);
         fi;
      end,

      Ignore,

      function(i, j)
         if divs[i] mod (2*divs[j]) = 0 then
            Add(subs[nrs[i]], nrs[j]);
            Append(subs[nrs[i]+1], [nrs[j], nrs[j]+1]);
            Append(subs[nrs[i]+2], [nrs[j], nrs[j]+2]);
            Add(marks[nrs[i]], m/divs[i]);
            Append(marks[nrs[i]+1], [m/divs[i], 2]);
            Append(marks[nrs[i]+2], [m/divs[i], 2]);
         elif divs[i] mod divs[j] = 0 then
            Add(subs[nrs[i]], nrs[j]);
            Add(subs[nrs[i]+1], nrs[j]+1);
            Add(subs[nrs[i]+2], nrs[j]+2);
            Add(marks[nrs[i]], m/divs[i]);
            Add(marks[nrs[i]+1], 2);
            Add(marks[nrs[i]+2], 2);
         fi;
      end]];

   marks:= [];
   subs:= [];
   name:= [];

   type:= [];
   nrs:= [];  pt:= 1;
   for d in divs do
      Add(nrs, pt);  pt:= pt+1;
      ord:= String(d);
      if n mod d = 0 then
         if d mod 2 = 0 then
            Add(type, 3);  pt:= pt+2;
            Add(name, ord);
            Add(name, ConcatenationString("D_{", ord, "}a"));
            Add(name, ConcatenationString("D_{", ord, "}b"));
         else
            Add(type, 1);
            Add(name, ord);
         fi;
      else
         Add(type, 2);
         Add(name, ConcatenationString("D_{", ord, "}"));
      fi;
   od;

   for i in [1..Length(divs)] do
      subs[nrs[i]]:= [];
      marks[nrs[i]]:= [];
      if type[i] = 3 then
         subs[nrs[i]+1]:= [];  subs[nrs[i]+2]:= [];
         marks[nrs[i]+1]:= [];  marks[nrs[i]+2]:= [];
      fi;
      for j in [1..i] do
         construct[type[i]][type[j]](i, j);
      od;
   od;

   return rec(name:= name, subs:= subs, marks:= marks);

end;


#############################################################################
##
#F  TomFrobenius( <p>, <q> )  . . . . The Table of Marks of Frobenius Groups.
##
##  'TomFrobenius' computes  the table of marks  of a  Frobenius group $p:q$,
##  where $p$ is a prime and $q$ divides $p-1$.
##
TomFrobenius := function(p, q)

   local i, j, n, ind, subs, marks, name, divs;

   if not IsPrime(p) then
      Error("not yet implemented");
   fi;
   if (p-1) mod q <> 0 then
      Error("not frobenius");
   fi;

   name:= [];
   subs:= [];
   marks:= [];
   n:= p*q;
   divs:= DivisorsInt(n);

   for i in [1..Length(divs)] do
      ind:= n/divs[i];
      subs[i]:= [1];
      marks[i]:= [ind];
      if ind mod p = 0 then # d
         name[i]:= String(divs[i]);
         for j in [2..i] do
            if marks[j][1] mod ind = 0 then
               Add(subs[i], j);
               Add(marks[i], ind/p);
            fi;
         od;
      else # p:d
         name[i]:= ConcatenationString(String(p), ":", String(divs[i]/p));
         for j in [2..i] do
            if marks[j][1] mod ind = 0 then
               Add(subs[i], j);
               Add(marks[i], ind);
            fi;
         od;
      fi;
   od;

   return rec(name:= name, subs:= subs, marks:= marks);

end;

