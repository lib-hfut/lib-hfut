#############################################################################
##
#A  ctsymmet.g                  GAP library                    Goetz Pfeiffer
##
#A  @(#)$Id: ctsymmet.g,v 3.22 1994/06/10 04:45:03 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
#H  $Log: ctsymmet.g,v $
#H  Revision 3.22  1994/06/10  04:45:03  sam
#H  fixed size component
#H
#H  Revision 3.21  1994/04/21  12:10:20  sam
#H  introduced 'identifier' component
#H
#H  Revision 3.20  1993/08/26  15:56:13  goetz
#H  replaced 'Sublist' calls.
#H
#H  Revision 3.19  1993/04/30  13:30:56  goetz
#H  Adapted new string concept.
#H
#H  Revision 3.18  1993/01/25  15:58:51  goetz
#H  'CharTableWreathSymmetric' now installs 'irredinfo' and 'classparam'.
#H
#H  Revision 3.17  1992/06/23  17:04:12  goetz
#H  corrected 'CharValueWreathSymmetric'.
#H
#H  Revision 3.16  1992/06/23  16:34:03  goetz
#H  completely rewritten the package.
#H
#H  Revision 3.15  1992/03/13  13:20:32  goetz
#H  moved 'PartitionTuples' to 'combinat.g'.
#H
#H  Revision 3.14  1992/03/13  13:07:45  goetz
#H  moved som functions to 'combinat.g'
#H
#H  Revision 3.13  1992/03/13  13:04:03  goetz
#H  changed 'InfoCtSymmet?' into 'InfoCharTable?'.
#H
#H  Revision 3.12  1992/03/10  15:24:02  goetz
#H  added 'CharTableOps' to some tables.
#H
#H  Revision 3.11  1991/12/13  13:16:53  sam
#H  replaced 'IsPrime' by 'IsPrimeInt'
#H
#H  Revision 3.10  1991/12/10  14:24:09  sam
#H  replaced 'CharTableCyclic' by 'CharTable( "Cyclic", )'
#H
#H  Revision 3.9  1991/12/04  17:13:32  goetz
#H  changed usage of 'Position'.
#H
#H  Revision 3.8  1991/12/04  13:08:50  sam
#H  indented ':=' in function definitions, removed 'CharTableSymmetric'
#H
#H  Revision 3.7  1991/11/08  15:23:04  goetz
#H  replaced 'Partations' by 'Partitions'.
#H
#H  Revision 3.6  1991/09/06  17:24:41  goetz
#H  added fast computation of the table of symmetric wreaths.
#H
#H  Revision 3.5  1991/09/06  11:17:26  goetz
#H  replaced 'SeqOfParts' by 'PartitionTuples'.
#H
#H  Revision 3.4  1991/09/05  17:20:44  goetz
#H  changed Quo, Transposed, LcmList to QuoInt, TransposedMat, Lcm.
#H
#H  Revision 3.3  1991/09/05  17:18:50  goetz
#H  added info-functions
#H
#H  Revision 3.2  1991/09/05  12:12:07  goetz
#H  added fast computation of table of Sn.
#H
#H  Revision 3.1  1991/09/03  13:45:51  goetz
#H  changed 'reps' to 'orders'.
#H
#H  Revision 3.0  1991/09/03  13:32:40  goetz
#H  Initial Revision.
#H
##
##  This file contains  the  functions   needed  for a  direct computation of
##  the  character values of  wreath  products  of a  group  $G$  with $S_n$,
##  the   symmetric group  on   n points. Special   cases  are  the symmetric
##  group $S_n$ itself  and the Weyl group  of type  $B_n$ which is  a wreath
##  product of a   cyclic group $C_2$  of order  2  with  the symmetric group
##  $S_n$.
##  
##  Moreover the character values of   alternating groups $A_n$ are  obtained
##  by  restriction from $S_n$ and  the  character  values of Weyl  groups of
##  type $D_n$ are obtained from those of type $B_n$.
##  
##  The values are computed by a generalized Murnaghan-Nakayama formula.
##
##  For a good reference of used formulae see:
##  G. James, A.Kerber: The Representation Theory of the Symmetric Group,
##  Addison-Wesley, 1981.
##  A. Kerber, Representations of Permutation Groups I, Springer 1971.
##  A. Kerber, Representations of Permutation Groups II, Springer 1975.
## 
##  Now  the classes (as  well  as the  characters)  of $S_n$ are indexed  by
##  partitions (i.e.  the  cycle structure of  the elements in  that  class).
##  In  general the   classes  (and  again  the  characters)  of  the  wreath
##  product $G  wr S_n$ are indexed  by  $r$-tuples of partitions,  where $r$
##  is  the number of   classes   of  the  group  $G$  and  these  partitions
##  together form a  partition of $n$.  That is  after distributing  $n$ over
##  $r$ places each place is partitioned.
## 
##  There are different  ways  to  represent a  partition and we  make use of
##  two of them.
##
##  First there is  the  partition as  a   finite  nonincreasing sequence  of
##  numbers which sum up  to  $n$.  This representation serves to  compute  a
##  complete  list of  partitions  of $n$   and is stored in  the   resulting
##  table in the record field <classtext>.
##
##  The most beautiful way to treat  Young  tableaux and hooks of  partitions
##  is their  representation  as beta-numbers.    A  beta-number   is a  set,
##  which arises  from a  partition  by reversing  the   order  and  adding a
##  sequence [0,1,2,...] of   the  same    length.    Since this     reversed
##  partition  is   allowed to have   leading zeros,   its   beta-set  is not
##  uniquely  determined.  Each beta-set    however   determines  a    unique
##  partition.   For   example  a   beta-set for  the partition    [4,2,1] is
##  [1,3,6], another  one  [0,1,3,5,8].   To  remove    a  $k$-hook from  the
##  corresponding  Young  tableau  the beta-numbers  are  placed  as beads on
##  $k$ strings.
##
##  xxxx         _________      _________      _________        xxxx
##  xx            0  1  2        |  o  |        o  o  |          
##  x             3  4  5        o  |  |   ->   |  |  |          
##                6  |  |        o  |  |        o  |  |          
##
##  To  find a removable  $k$-hook now  simply  means  to find a  free  place
##  for  a bead  one step  up  on its string,  the  hook is  then  removed by
##  lifting this  bead.  (You see  how  this process   can   produce  leading
##  zeros.)  Beta-numbers are used to parametrize the characters.
##
##  The case $2  wr S-n$  uses pairs  of these  objects  while  the   general
##  wreath product  uses  lists of them. A list  of beta-numbers is  called a
##  symbol.
##


#############################################################################
##
#F  InfoCharTable2( ... ) . . . . . . . . . . . . . . .  package information.
##
if not IsBound(InfoCharTable2) then InfoCharTable2:= Ignore; fi;


#############################################################################
##
#F  BetaSet( <alpha> )  . . . . . . . . . . . . . . . . . . . . . . beta set.
##
BetaSet := function(alpha)

   local i, la, beta;

   la:= Length(alpha);
   beta:= [];
   for i in [0 .. la-1] do
      Add(beta, alpha[la-i] + i);
   od;

   return beta;

end;


#############################################################################
##
#F  CentralizerWreath( <sub_cen>, <ptuple> )  . . . . centralizer in G wr Sn.
##
CentralizerWreath := function(sub_cen, ptuple)

   local p, i, j, k, last, res;

   res:= 1;
   for i in [1..Length(ptuple)] do
      last:= 0; k:= 1;
      for p in ptuple[i] do
         res:= res * sub_cen[i] * p;
         if p = last then
            k:= k+1;
            res:= res * k;
         else
            k:= 1;
         fi;
         last:= p;
      od;
   od;

   return res;

end;


#############################################################################
##
#F  PowerWreath( <sub_pm>, <ptuple>, <p> )  . . . . . .  powermap in G wr Sn.
##
PowerWreath := function(sub_pm, ptuple, p)

   local power, k, i, j;

   power:= List(ptuple, x-> []);
   for i in [1..Length(ptuple)] do
      for k in ptuple[i] do
         if k mod p = 0 then
            for j in [1..p] do
               Add(power[i], k/p);
            od;
         else
            Add(power[sub_pm[i]], k);
         fi;
      od;
   od;
      
   for k in power do
      Sort(k, function(a,b) return a>b; end);
   od;

   return power;

end;


#############################################################################
##
#F  InductionScheme( <n> )  . . . . . . . . . . . . . . . . removal of hooks.
##
InductionScheme := function(n)

   local scheme, pm, i, beta, hooks;

   pm:= [];
   scheme:= [];

   #  how to encode all hooks.
   hooks:= function(beta, m)
      local i, j, l, gamma, hks, sign;

      hks:= [];
      for i in [1..m] do
         hks[i]:= [];
      od;

      for  i in  beta do

         sign:= 1;

         for j in [1..i]  do
            if i-j in beta then 
               sign:= -sign;
            else
               if j = m then
                  Add(hks[m], sign);
               else
                  gamma:= Difference(beta, [i]);
                  AddSet(gamma, i-j);

                  #  remove leading zeros.
                  if i = j then
                     l:= 0;
                     while gamma[l+1] = l do
                        l:= l+1;
                     od;
                     gamma:= gamma{[l+1..Length(gamma)]} - l;
                  fi;

                  Add(hks[j], sign * Position(pm[m-j], gamma));
               fi;
            fi;
         od;

      od;
      return hks;
   end;

   #  collect hook encodings.
   for i in [1..n] do
      pm[i]:= List(Partitions(i), BetaSet);
      scheme[i]:= [];
      for beta in pm[i] do
         Add(scheme[i], hooks(beta, i));
      od;
   od;

   return scheme;

end;


#############################################################################
##
#F  MatCharsWreathSymmetric( <tbl>, <n> ) . . .  character matrix of G wr Sn.
##
MatCharsWreathSymmetric := function(tbl, n)

   local i, j, k, m, r, s, t, pm, res, col, scheme, np, charCol, hooks,
     pts, partitions;

   r:= Length(tbl.orders);

   #  encode partition tuples by positions of partitions.
   partitions:= List([1..n], Partitions);
   pts:= [];
   for i in [1..n] do
      pts[i]:= PartitionTuples(i, r);
      for j in [1..Length(pts[i])] do
	 np:= [[], []];
	 for t in pts[i][j] do
	    s:= Sum(t);
	    Add(np[1], s);
	    if s = 0 then
	       Add(np[2], 1);
	    else
	       Add(np[2], Position(partitions[s], t));
	    fi;
	 od;
	 pts[i][j]:= np;
      od;
   od;

   scheme:= InductionScheme(n);

   #  how to encode a hook.
   hooks:= function(np, n)
      local res, i, k, l, ni, pi, sign;

      res:= [];
      for i in [1..r] do
	 res[i]:= List([1..n], x-> []);
      od;

      for i in [1..r] do
	 ni:= np[1][i]; pi:= np[2][i];
	 for k in [1..ni] do
	    for l in scheme[ni][pi][k] do
	       np[1][i]:= ni-k; 
	       if l < 0 then
		  np[2][i]:= -l;
		  sign:= -1;
	       else
		  np[2][i]:= l;
		  sign:= 1;
	       fi;
	       if k = n then
		  Add(res[i][k], sign);
	       else
		  Add(res[i][k], sign * Position(pts[n-k], np));
	       fi;
	    od;
	 od;
	 np[1][i]:= ni; np[2][i]:= pi;
      od;
      return res;
   end;

   #  collect hook encodings.
   res:= [];
   InfoCharTable2("#I Scheme: \c");
   for i in [1..n] do
      InfoCharTable2(i, " \c");
      res[i]:= [];
      for np in pts[i] do
	 Add(res[i], hooks(np, i));
      od;
   od;
   scheme:= res;
   InfoCharTable2("\n");

   #  how to construct a new column.
   charCol:= function(n, t, k, p)
      local i, j, col, pi, val;

      col:= [];
      for pi in scheme[n] do
	 val:= 0;
	 for j in [1..r] do
	    for i in pi[j][k] do
	       if i < 0 then
		  val:= val - tbl.irreducibles[j][p] * t[-i];
	       else
		  val:= val + tbl.irreducibles[j][p] * t[i];
	       fi;
	    od;
	 od;
	 Add(col, val);
      od;
      return col;
   end;

   #  construct the columns.
   pm:= List([1..n-1], x->[]);
   InfoCharTable2("#I Cycles: \c");
   for m in [1..QuoInt(n,2)] do 

      # the $m$-cycle in all possible places
      InfoCharTable2(m, " \c");
      for i in [1..r] do
	 s:= [1..n]*0+1;
	 s[m]:= i;
	 Add(pm[m], rec(col:= charCol(m, [1], m, i), pos:= s));
      od;

      # add the $m$-cycle to everything you know
      for k in [m+1..n-m] do
	 for t in pm[k-m] do
	    for i in [t.pos[m]..r] do
	       s:= Copy(t.pos);
	       s[m]:= i;
	       Add(pm[k], rec(col:= charCol(k, t.col, m, i), pos:= s));
	    od;
	 od;
      od;
   od;
   InfoCharTable2("\n");

   #  collect and transpose.
   np:= Length(scheme[n]);
   res:= List([1..np], x-> []);
   InfoCharTable2("#I Tables: \c");
   for k in [1..n-1] do
      InfoCharTable2(k, " \c");
      for t in pm[n-k] do
	 for i in [t.pos[k]..r] do 
	    col:= charCol(n, t.col, k, i);
	    for j in [1..np] do
	       Add(res[j], col[j]);
	    od;
	 od;
      od;
   od;
   InfoCharTable2("\n");

   for i in [1..r] do
      col:= charCol(n, [1], n, i);
      for j in [1..np] do
	 Add(res[j], col[j]);
      od;
   od;

   return res;

end;


#############################################################################
##
#F  CharValueSymmetric( <n>, <beta>, <pi> ) . . . . . character value in S_n.
##
CharValueSymmetric := function(n, beta, pi)

   local i, j, k, o, gamma, rho, val, sign;

   #  get length of longest cycle.
   k:= pi[1];

   #  determine offset.
   o:= 0;
   while beta[o+1] = o do
      o:= o+1;
   od;

   #  degree case.
   if  k = 1  then 
      
      #  find all beads.
      val:= 1;
      for i in [o+1..Length(beta)] do
         val:= val * (beta[i] - o);
   
         #  find other free places.
         for j in [o+1..beta[i]-1] do
            if  not j in beta then
               val:= val * (beta[i]-j);
            fi;
         od;
   
      od;
   
      return Factorial(n)/val;
   fi;

   #  almost trivial case.
   if k = n then
      if  n + o in beta then
         return (-1)^(Size(beta)+o+1);
      else
         return 0;
      fi;
   fi;

   rho:= pi{[2..Length(pi)]};
   val:= 0;

   #  loop over the beta set.
   for i in beta do
      if  i >= k+o and not i-k in beta  then

         #  compute the leg parity.
         sign:= 1;
         for j in [i-k+1..i-1] do
            if j in beta then
               sign:= -sign;
            fi;
         od;

         #  compute new beta set.
         gamma:= Difference(beta, [i]);
         AddSet(gamma, i-k);
         
         #  enter recursion.
         val:= val + sign * CharValueSymmetric(n-k, gamma, rho);
      fi;
   od;

   #  return the result.
   return val;

end;


#############################################################################
##
#V  CharTableSymmetric  . . . .  generic character table of symmetric groups.
##
CharTableSymmetric := rec(
   identifier:= "Symmetric",
#T Remove this when the time of changes has arrived!
   name:= "Symmetric",
   order:= Factorial,
   size:= Factorial,
   specializedname:=  (n-> ConcatenationString("S",String(n))),
   text:= "generic character table for symmetric groups",
   libinfo:= rec(firstname:= "Symmetric", othernames:= []),
   isGenericTable:= true,
   domain:= (n-> IsInt(n) and n > 0),
   classparam:= [Partitions],
   charparam:= [Partitions],
   centralizers:= [],
   orders:= [],
   powermap:= [],
   irreducibles:= [[]]);

CharTableSymmetric.orders[1]:=  function(n, lbl) 
   return Lcm(lbl); 
end;

CharTableSymmetric.centralizers[1]:= function(n, pi)

   local k, last, p, res;

   res:= 1; last:= 0; k:= 1;
   for p in pi do
      res:= res * p;
      if p = last then 
         k:= k+1;
         res:= res * k;
      else
         k:= 1;
      fi; 
      last:= p;
   od;

   return(res);

end;

CharTableSymmetric.powermap[1]:= function(n,k,pow) 
   return [1,PowerPartition(k,pow)];
end;

CharTableSymmetric.irreducibles[1][1]:= function(n, alpha, pi)
   return CharValueSymmetric(n, BetaSet(alpha), pi);
end;

CharTableSymmetric.matrix:= function(n)

   local scheme, beta, pm, i, m, k, t, col, np, res, charCol;

   scheme:= InductionScheme(n);

   #  how to construct a new column.
   charCol:= function(m, t, k)
      local i, col, pi, val;

      col:= [];
      for pi in scheme[m] do
         val:= 0;
         for i in pi[k] do
            if i < 0 then
               val:= val - t[-i];
            else
               val:= val + t[i];
            fi;
         od;
         Add(col, val);
      od;
      return col;
   end;

   #  construct the columns.
   pm:= List([1..n-1], x-> []);
   for m in [1..QuoInt(n,2)] do
      Add(pm[m], charCol(m, [1], m));

      for k in [m+1..n-m] do
         for t in pm[k-m] do
            Add(pm[k], charCol(k, t, m));
         od;
      od;
   od;

   #  collect and transpose.
   np:= Length(scheme[n]);
   res:= List([1..np], x-> []);
   for k in [1..n-1] do
      for t in pm[n-k] do
         col:= charCol(n, t, k);
         for i in [1..np] do
            Add(res[i], col[i]);
         od;
      od;
   od;

   col:= charCol(n, [1], n);
   for i in [1..np] do
      Add(res[i], col[i]);
   od;

   return res;

end;


#############################################################################
##
#V  CharTableAlternating  . .  generic character table of alternating groups.
##
CharTableAlternating := rec(
   identifier:= "Alternating",
#T Remove this when the time of changes has arrived!
   name:= "Alternating",
   order:= (n-> Factorial(n)/2),
   size:= (n-> Factorial(n)/2),
   specializedname:= (n-> ConcatenationString("A", String(n))),
   text:= "generic character table for alternating groups",
   libinfo:= rec(firstname:= "Alternating", othernames:= []),
   isGenericTable:= true,
   domain:= (n-> IsInt(n) and n > 1),
   classparam:= [],
   charparam:= [],
   centralizers:= [],
   orders:= [],
   powermap:= [],
   irreducibles:= [[]]);

CharTableAlternating.classparam[1]:= function(n)

   local labels, pi, pdodd;

   pdodd:= function(pi)
      local i;
      if pi[1] mod 2 = 0 then
         return false;
      fi;
      for i in [2..Length(pi)] do
         if pi[i] = pi[i-1] or pi[i] mod 2 = 0 then
            return false;
         fi;
      od;
      return true;
   end;

   labels:= [];
   for pi in Partitions(n) do
      if SignPartition(pi) = 1 then
         if pdodd(pi) then
            Add(labels, [pi, '+']);
            Add(labels, [pi, '-']);
         else
            Add(labels, pi);
         fi;
      fi;
   od;

   return labels;

end;

CharTableAlternating.charparam[1]:= function(n)

   local alpha, labels;

   labels:= [];
   for alpha in Partitions(n) do
      if alpha = AssociatedPartition(alpha) then
         Add(labels, [alpha, '+']);
         Add(labels, [alpha, '-']);
      elif alpha < AssociatedPartition(alpha) then
         Add(labels, alpha);
      fi;
   od;

   return labels;

end;

CharTableAlternating.orders[1]:= function(n, lbl)
   if Length(lbl) = 2 and not IsInt(lbl[2]) then
      lbl:= lbl[1];
   fi;
   return Lcm(lbl);
end;

CharTableAlternating.centralizers[1]:= function(n, lbl)
   local cen;
   if Length(lbl) = 2 and not IsInt(lbl[2]) then
      return CharTableSymmetric.centralizers[1](n, lbl[1]);
   else
      return CharTableSymmetric.centralizers[1](n, lbl)/2;
   fi;
end;

CharTableAlternating.powermap[1]:= function(n, lbl, prime)
   local val, prod;

   #  split case.
   if Length(lbl) = 2 and not IsInt(lbl[2])  then
      prod:= Product(lbl[1]);
      
      #  coprime case needs complicated check.
      if prod mod prime <>  0 then
         val:= EB(prod);
         if val+1 = -GaloisCyc(val, prime) then
            if lbl[2] = '+' then
               return [1, [lbl[1], '-']];
            else
               return [1, [lbl[1], '+']];
            fi;
         else
            return [1, lbl];
         fi;
      else
         return [1, PowerPartition(lbl[1], prime)];
      fi;
   fi;

   #  ordinary case.
   return [1, PowerPartition(lbl, prime)];

end;

CharTableAlternating.irreducibles[1][1]:= function(n, alpha, pi)

   local val;

   if Length(alpha) = 2 and not IsInt(alpha[2]) then
      if Length(pi) = 2 and not IsInt(pi[2]) then
         val:= CharTableSymmetric.irreducibles[1][1](n, alpha[1], pi[1]);
         if val in [-1, 1] then
            if alpha[2] = pi[2] then
               val:= -val * EB(Product(pi[1]));
            else
               val:= val * (1 + EB(Product(pi[1])));
            fi;
         else
            val:=  val/2;
         fi;
      else
         val:= CharTableSymmetric.irreducibles[1][1](n, alpha[1], pi)/2;
      fi;

   else
      if Length(pi) = 2 and not IsInt(pi[2]) then
         val:= CharTableSymmetric.irreducibles[1][1](n, alpha, pi[1]);
      else
         val:= CharTableSymmetric.irreducibles[1][1](n, alpha, pi);
      fi;
   fi;

   return val;

end;


#############################################################################
##
#F  CharValueWeylB( <n>, <beta>, <pi> ) . . . . . character value in 2 wr Sn.
##
CharValueWeylB := function(n, beta, pi)

   local i, j, k, lb, o, s, t, gamma, rho, sign, val;

   #  termination condition.
   if n = 0  then
      return 1;
   fi;

   #  negative cycles first.
   if pi[2] <> [] then
      t:= 2;
   else
      t:= 1;
   fi;

   #  get length of longest cycle.
   k:= pi[t][1];

   #  construct rho.
   rho:= Copy(pi);
   rho[t]:= pi[t]{[2..Length(pi[t])]};

   val:= 0;

   #  loop over the beta sets.
   for s in [1, 2] do

      #  determine offset.
      o:= 0;  
      lb:= Length(beta[s]);
      while o < lb and beta[s][o+1] = o do
         o:= o+1;
      od;

      for i in beta[s] do
         if  i >= k+o and not i-k in beta[s]  then

            #  compute the leg parity.
            sign:= 1;
            for j in [i-k+1..i-1] do
               if j in beta[s] then
                   sign:= -sign;
               fi;
            od;

            #  consider character table of C2.
            if  s = 2 and t = 2  then
               sign:= -sign;
            fi;

            #  construct new beta set.
            gamma:= Copy(beta);
            SubtractSet(gamma[s], [i]);
            AddSet(gamma[s], i-k);

            #  enter recursion.
            val:= val + sign * CharValueWeylB(n-k, gamma, rho);
         fi;
      od;
   od;

   #  return the result.
   return val;

end;


#############################################################################
##
#V  CharTableWeylB  . . . . generic character table of Weyl groups of type B.
##
CharTableWeylB := rec(
   identifier:= "WeylB",
#T Remove this when the time of changes has arrived!
   name:= "WeylB",
   order:= (n-> 2^n * Factorial(n)),
   size:= (n-> 2^n * Factorial(n)),
   specializedname:= (n-> ConcatenationString("W(B",String(n),")")),
   text:= "generic character table for Weyl groups of type B",
   libinfo:= rec(firstname:= "WeylB", othernames:= []),
   isGenericTable:= true,
   domain:= (n-> IsInt(n) and n > 0),
   classparam:= [(n-> PartitionTuples(n, 2))],
   charparam:= [(n-> PartitionTuples(n, 2))],
   centralizers:= [],
   orders:= [],
   powermap:= [],
   irreducibles:= [[]]);

CharTableWeylB.orders[1]:= function(n, lbl)

   local ord;
   
   ord:= 1;
   if lbl[1] <> [] then
      ord:= Lcm(lbl[1]);
   fi;
   if lbl[2] <> [] then
      ord:= Lcm(ord, 2 * Lcm(lbl[2]));
   fi;

   return ord;

end;

CharTableWeylB.centralizers[1]:= function(n, lbl)
   return CentralizerWreath([2, 2], lbl);
end;

CharTableWeylB.powermap[1]:= function(n, lbl, pow)
   if pow = 2 then
      return [1, PowerWreath([1, 1], lbl, 2)];
   else
      return [1, PowerWreath([1, 2], lbl, pow)];
   fi;
end;

CharTableWeylB.irreducibles[1][1]:= function(n, alpha, pi)
   return CharValueWeylB(n, [BetaSet(alpha[1]), BetaSet(alpha[2])], pi);
end;

CharTableWeylB.matrix:= function(n)
   return MatCharsWreathSymmetric(CharTable("Cyclic", 2), n);
end;

#############################################################################
##
#V  CharTableWeylD  . . . . generic character table of Weyl groups of type D.
##
CharTableWeylD := rec(
   identifier:= "WeylD",
#T Remove this when the time of changes has arrived!
   name:= "WeylD",
   order:= (n-> 2^(n-1) * Factorial(n)),
   size:= (n-> 2^(n-1) * Factorial(n)),
   specializedname:= (n-> ConcatenationString("W(D",String(n),")")),
   text:= "generic character table for Weyl groups of type D",
   libinfo:= rec(firstname:= "WeylD", othernames:= []),
   isGenericTable:= true,
   domain:= (n-> IsInt(n) and n > 1),
   classparam:= [],
   charparam:= [],
   centralizers:= [],
   orders:= [],
   powermap:= [],
   irreducibles:= [[]]);

CharTableWeylD.classparam[1]:= function(n)

   local labels, pi;

   labels:= [];
   for pi in PartitionTuples(n, 2) do
      if Length(pi[2]) mod 2 = 0 then
         if pi[2] = [] and ForAll(pi[1], x-> x mod 2 = 0) then
            Add(labels, [pi[1], '+']);
            Add(labels, [pi[1], '-']);
         else
            Add(labels, pi);
         fi;
      fi;
   od;

   return labels;

end;

CharTableWeylD.charparam[1]:= function(n)

   local alpha, labels;

   labels:= [];
   
   for alpha in PartitionTuples(n, 2) do
      if alpha[1] = alpha[2] then
         Add(labels, [alpha[1], '+']);
         Add(labels, [alpha[1], '-']);
      elif alpha[1] < alpha[2] then
         Add(labels, alpha);
      fi;
   od;

   return labels;

end;

CharTableWeylD.orders[1]:= function(n, lbl)

   local ord;

   ord:= 1;
   if lbl[1] <> [] then
      ord:= Lcm(lbl[1]);
   fi;
   if lbl[2] <> [] and IsList(lbl[2]) then
      ord:= Lcm(ord, 2*Lcm(lbl[2]));
   fi;

   return ord;

end;

CharTableWeylD.centralizers[1]:= function(n, lbl)
   if not IsList(lbl[2]) then
      return CentralizerWreath([2,2], [lbl[1], []]);
   else
      return CentralizerWreath([2,2], lbl) / 2;
   fi;
end;

CharTableWeylD.powermap[1]:= function(n, lbl, pow)

   local power;

   if not IsList(lbl[2]) then
      power:= PowerPartition(lbl[1], pow);
      if ForAll(power, x-> x mod 2 = 0) then
         return [1, [power, lbl[2]]];   #  keep the sign.
      else
         return [1, [power, []]];
      fi;
   else
      if pow = 2 then
         return [1, PowerWreath([1, 1], lbl, 2)];
      else
         return [1, PowerWreath([1, 2], lbl, pow)];
      fi;
    fi;
end;

CharTableWeylD.irreducibles[1][1]:= function(n, alpha, pi)

   local delta, val;

   if not IsList(alpha[2]) then
      delta:= [alpha[1], alpha[1]];
      if not IsList(pi[2]) then
         val:= CharTableWeylB.irreducibles[1][1](n, delta, [pi[1], []])/2;
         if alpha[2] = pi[2] then
            val:= val + 2^(Length(pi[1])-1) *
              CharTableSymmetric.irreducibles[1][1](n/2, alpha[1], pi[1]/2);
         else
            val:= val - 2^(Length(pi[1])-1) *
              CharTableSymmetric.irreducibles[1][1](n/2, alpha[1], pi[1]/2);
         fi;
      else
         val:= CharTableWeylB.irreducibles[1][1](n, delta, pi)/2;
      fi;
   else
      if not IsList(pi[2]) then
         val:= CharTableWeylB.irreducibles[1][1](n, alpha, [pi[1], []]);
      else
         val:= CharTableWeylB.irreducibles[1][1](n, alpha, pi);
      fi;
   fi;

   return val;

end;



#############################################################################
##
#F  CharValueWreathSymmetric( <sub>, <n>, <beta>, <pi> ) . .
#F                                        . . . . character value in G wr Sn.
##
CharValueWreathSymmetric := function(sub, n, beta, pi)

   local i, j, k, lb, o, s, t, r, gamma, rho, sign, val;

   #  termination condition.
   if n = 0  then
      return 1;
   fi;

   r:= Length(pi);

   #  negative cycles first.
   t:= r;
   while pi[t] = [] do
      t:= t-1;
   od;

   #  get length of longest cycle.
   k:= pi[t][1];

   #  construct rho.
   rho:= Copy(pi);
   rho[t]:= pi[t]{[2..Length(pi[t])]};

   val:= 0;

   #  loop over the beta sets.
   for s in [1..r] do

      #  determine offset.
      o:= 0;  
      lb:= Length(beta[s]);
      while o < lb and beta[s][o+1] = o do
         o:= o+1;
      od;

      for i in beta[s] do
         if  i >= k+o and not i-k in beta[s]  then

            #  compute the leg parity.
            sign:= 1;
            for j in [i-k+1..i-1] do
               if j in beta[s] then
                   sign:= -sign;
               fi;
            od;

            #  consider character table <sub>.
            sign:= sub.irreducibles[s][t] * sign;

            #  construct new beta set.
            gamma:= Copy(beta);
            SubtractSet(gamma[s], [i]);
            AddSet(gamma[s], i-k);

            #  enter recursion.
            val:= val + sign*CharValueWreathSymmetric(sub, n-k, gamma, rho);
         fi;
      od;
   od;

   #  return the result.
   return val;

end;


#############################################################################
##
#F  CharTableWreathSymmetric( <sub>, <n> )  . . . character table of G wr Sn.
##
CharTableWreathSymmetric := function(sub, n)

   local i, j, tbl, nccs, nccl, prod, symbol, char, parts, prime, pm, spm;

   tbl:= rec(size:= sub.size^n*Factorial(n),
	     identifier:= ConcatenationString(sub.name, "wrS", String(n)),
             centralizers:= [],
             classes:= [],
             orders:= [],
             irredinfo:= []);

#T Remove this when the time of changes has arrived!
   tbl.name:= tbl.identifier;
   tbl.order:= tbl.size;

   nccs:= Length(sub.orders);
   parts:= PartitionTuples(n, nccs);
   tbl.classparam:= parts;
   nccl:= Length(parts);

   for i in [1..nccl] do
      tbl.centralizers[i]:= CentralizerWreath(sub.centralizers, parts[i]);
      tbl.classes[i]:= tbl.size / tbl.centralizers[i];
      tbl.orders[i]:= 1;
      for j in [1..nccs] do
	 if parts[i][j] <> [] then
	    tbl.orders[i]:= Lcm(tbl.orders[i], sub.orders[j]*Lcm(parts[i][j]));
	 fi;
      od;
      tbl.irredinfo[i]:= rec(charparam:= parts[i]);
   od;

   tbl.powermap:= [];
   for prime in Set(Factors(tbl.size)) do
      pm:= [];
      if  IsBound(sub.powermap[prime]) then
	 spm:= sub.powermap[prime];
      else
	 spm:= Parametrized(Powermap(sub,prime,rec(quick:=true)));
      fi;
      for i in [1..nccl] do
         pm[i]:= Position(parts, PowerWreath(spm, parts[i], prime));
      od;
      tbl.powermap[prime]:= pm;
   od;

   tbl.irreducibles:= MatCharsWreathSymmetric(sub, n);
   tbl.operations:= CharTableOps;

   return(tbl);

end;
