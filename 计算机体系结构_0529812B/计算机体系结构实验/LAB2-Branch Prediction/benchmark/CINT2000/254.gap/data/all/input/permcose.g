#############################################################################
##
#A  permcose.g                  GAP library                         Udo Polis
#A                                                         & Martin Schoenert
##
#H  @(#)$Id: permcose.g,v 3.4.1.3 1994/10/11 12:19:40 ahulpke Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the functions to  work  with  cosets  of subgroups  in
##  permutation groups.
##
#H  $Log: permcose.g,v $
#H  Revision 3.4.1.3  1994/10/11  12:19:40  ahulpke
#H  Changed 'smallestBase' to 'MinimalStabChain'
#H
#H  Revision 3.4.1.2  1994/10/06  09:01:23  ahulpke
#H  fixed (again...) Ascending chain if G=s
#H
#H  Revision 3.4.1.1  1994/10/04  10:47:35  ahulpke
#H  improved AscendingChain
#H
#H  Revision 3.4  1993/07/28  16:44:27  martin
#H  moved 'RightTransversal' to "permcose"
#H
#H  Revision 3.3  1993/06/07  17:24:15  martin
#H  fixed bound for very small groups
#H
#H  Revision 3.2  1993/01/18  18:55:42  martin
#H  added double coset functions
#H
#H  Revision 3.1  1993/01/18  17:39:12  martin
#H  initial revision under RCS (moved from 'permgrp.g')
#H
##


#############################################################################
##
#F  PermGroupOps.RightTransversal(<G>,<U>)  . . . . . . . . right transversal
##
PermGroupOps.RightTransversal := function ( G, U )
    local   T;          # transversal of <U> in <G>, result

    # make sure we have a stabchain for <G> and a compatible for <U>
    MakeStabChain( G );
    MakeStabChain(   U, G.operations.Base( G ) );
    ExtendStabChain( U, G.operations.Base( G ) );

    # compute the transversal
    T := G.operations.RightCosetRepsStab( G, U );

    # reduce the stabilizer chain of <U> again
    ReduceStabChain( U );

    # return the transversal
    return T;

end;


#############################################################################
##
#F  PermGroupOps.RightCoset(<U>,<g>)  . . . . . . . . .  create a right coset
#V  RightCosetPermGroupOps  operations record of right cosets in a perm group
##
##  'PermGroupOps.RightCoset' is  the  function to create a   right  coset in
##  a  permutation group.  It  computes the  smallest  element of   the coset
##  and  stores <U> together  with  this smallest  element  as representative
##  in a record, and enters the operations record 'RightCosetGroupOps'.
##
##  'RightCosetPermGroupOps'  is the  operations record of   right  cosets in
##  a  permutation    group.   It   inherits  the   default functions    from
##  'RightCosetGroupOps', and  overlays   the   two    comparison  functions,
##  using the  fact   that permutation   group  cosets have    their smallest
##  element as representative.
##
PermGroupOps.RightCoset := function ( U, g )
    local   C,          # right coset of <U> and <g>, result
            S,          # stabilizer of <U>
            p;          # miminal image of basepoint of <S> under '<U>\*<g>'

    # compute the smallest element of the coset
    S:=PermGroupOps.MinimalStabChain(U);
    while Length(S.generators) > 0  do
        p := Minimum( OnTuples( S.orbit, g ) );
        while S.orbit[1]^g <> p  do g := S.transversal[p/g] mod g;  od;
        S := S.stabilizer;
    od;

    # make the domain
    C := rec( );
    C.isDomain          := true;
    C.isRightCoset      := true;

    # enter the identifying information
    C.group             := U;
    C.representative    := g;
    C.smallest          := g;

    # enter knowledge
    if IsBound( U.isFinite )  then
        C.isFinite      := U.isFinite;
    fi;
    if IsBound( U.size )  then
        C.size          := U.size;
    fi;

    # enter the operations record
    C.operations        := RightCosetPermGroupOps;

    # return the coset
    return C;
end;

RightCosetPermGroupOps := Copy( RightCosetGroupOps );

RightCosetPermGroupOps.\= := function ( C, D )
    local   isEql;

    # compare a right coset with minimal representative
    if IsRightCoset( C )  and IsBound( C.smallest )  then

        # with another right coset with minimal representative
        if IsRightCoset( D )  and IsBound( D.smallest )  then
            if C.group = D.group  then
                isEql := C.smallest = D.smallest;
            else
                isEql := RightCosetGroupOps.\=( C, D );
            fi;

        # with a subgroup, which is a special right coset
        elif IsGroup( D )  then
            if C.group = D  then
                isEql := C.smallest = D.identity;
            else
                isEql := RightCosetGroupOps.\=( C, D );
            fi;

        # with something else
        else
            isEql := RightCosetGroupOps.\=( C, D );
        fi;

    # compare a subgroup, which is a special right coset
    elif IsGroup( C )  then

        # with a right coset with minimal representative
        if IsRightCoset( D )  and IsBound( D.smallest )  then
            if C = D.group  then
                isEql := C.identity = D.smallest;
            else
                isEql := RightCosetGroupOps.\=( C, D );
            fi;

        # with something else
        else
            isEql := RightCosetGroupOps.\=( C, D );
        fi;

    # compare something else
    else
        isEql := RightCosetGroupOps.\=( C, D );
    fi;

    # return the result
    return isEql;
end;

RightCosetPermGroupOps.\< := function ( C, D )
    local   isLess;

    # compare a right coset with minimal representative
    if IsRightCoset( C )  and IsBound( C.smallest )  then

        # with another right coset with minimal representative
        if IsRightCoset( D )  and IsBound( D.smallest )  then
            if C.group = D.group  then
                isLess := C.smallest < D.smallest;
            else
                isLess := RightCosetGroupOps.\<( C, D );
            fi;

        # with a subgroup, which is a special right coset
        elif IsGroup( D )  then
            if C.group = D  then
                isLess := C.smallest < D.identity;
            else
                isLess := RightCosetGroupOps.\<( C, D );
            fi;

        # with something else
        else
            isLess := RightCosetGroupOps.\<( C, D );
        fi;

    # compare a subgroup, which is a special right coset
    elif IsGroup( C )  then

        # with a right coset with minimal representative
        if IsRightCoset( D )  and IsBound( D.smallest )  then
            if C = D.group  then
                isLess := C.identity < D.smallest;
            else
                isLess := RightCosetGroupOps.\<( C, D );
            fi;

        # with something else
        else
            isLess := RightCosetGroupOps.\<( C, D );
        fi;

    # compare something else
    else
        isLess := RightCosetGroupOps.\<( C, D );
    fi;

    # return the result
    return isLess;
end;


#############################################################################
##
#F  PermGroupOps.RightCosets(<G>,<U>) . . . . . . . . .  cosets of a subgroup
#F                                                     in a permutation group
##
PermGroupOps.RightCosets := function ( G, U )
    local   C,          # cosets of <U> in <G>, result
            R;          # representative of <U> in <G>

    # make sure we have a stabchain for <G> and a compatible for <U>
    MakeStabChain( G );
    MakeStabChain(   U, G.operations.Base( G ) );
    ExtendStabChain( U, G.operations.Base( G ) );

    # compute the representatives
    R := G.operations.RightCosetRepsStab( G, U );

    # and the cosets
    C := List( R, g -> Coset( U, g ) );

    # reduce the stabilizer chain of <U> again
    ReduceStabChain( U );

    # return the list of cosets
    return C;
end;

PermGroupOps.RightCosetRepsStab := function ( G, U )
    local   R,          # representatives for <U> in <G>, result
            r,          # one candidate for <R>
            S,          # representatives for <U>.stab in <G>.stab
            s,          # index into <S>
            T,          # representatives for <G>.stab in <G>
            t,          # index into <T>
            i;          # loop variable

    # if <U> is trivial, then the elements of <G>/<U> are the elements of <G>
    if U.generators = []  then

        R := PermGroupOps.ElementsStab( G );

    # otherwise
    else

        # compute a transversal for <U>.stab in <G>.stab
        S := PermGroupOps.RightCosetRepsStab( G.stabilizer, U.stabilizer );

        # initializer the new transversal with this
        R := ShallowCopy( S );

        # run through the representatives of '<G>.stab' in <G>
        T := [];
        T[G.orbit[1]] := G.identity;
        t := 2;
        while Length(R) < Length(S)*Length(G.orbit)/Length(U.orbit)  do
            T[G.orbit[t]] := T[ G.orbit[t] ^ G.transversal[G.orbit[t]] ]
                             / G.transversal[G.orbit[t]];

            # run through the representatives of '<U>.stab' in '<G>.stab'
            s := 1;
            while s <= Length(S)
              and Length(R) < Length(S)*Length(G.orbit)/Length(U.orbit)  do

                # compute $r in S * T$
                r := S[s] * T[G.orbit[t]];

                # test $r$
                i := 1;
                while i < t  and not G.orbit[i]/r in U.orbit  do
                    i := i + 1;
                od;

                # if $r$ is new add if to the transversal
                if i = t  then
                    Add( R, r );
                fi;

                s := s + 1;
            od;

            t := t + 1;
        od;
    fi;

    # return the list of representatives
    return R;
end;


#############################################################################
##
#F  InfoCoset1  . . . . . . . . . . . . . . . information for coset functions
##
if not IsBound(InfoCoset1)  then InfoCoset1:=Ignore; fi;


#############################################################################
##

#F  PermGroupOps.DoubeCosets  . . . . .  double cosets for permutation groups
##
PermGroupOps.DoubleCosets := CalcDoubleCosets;


#############################################################################
##
#F  AscendingChain(<G>,<U>) . . . . . . .  chain of subgroups G=G_1>...>G_n=U
##
PermGroupOps.AscendingChain := function(G,s)
  local np,a,b,c;
  np:=Difference(PermGroupOps.MovedPoints(G),PermGroupOps.MovedPoints(s));
  StabChain(G,rec(base:=np,reduced:=true));
  c:=[G];
  a:=G;
  while Size(a)>1 and a.orbit[1] in np do
    b:=a.stabilizer;
    if b.generators=[] then
      a:=TrivialSubgroup(G);
    else
      a:=Subgroup(Parent(G),b.generators);
    fi;
    Add(c,a);
  od;
  if s=G or not s in c then
    Add(c,s);
  fi;
  return PermRefinedChain(G,Reversed(c));
end;


#############################################################################
##
#F  PermRefinedChain(<G>,<c>) . . . . . . . . . . . . . .  refine chain links
##
##  <c> is an ascending chain in the Group <G>. The task of this routine is
##  to refine c, i.e. if there is a "link" U>L in c with [U:L] too big,
##  this procedure tries to find Subgroups G_0,...,G_n of G; such that 
##  U=G_0>...>G_n=L. This is done by extending L inductively: Since normal
##  steps can help in further calculations, the routine first tries to
##  extend to the normalizer in U. If the subgroup is self-normalizing,
##  the group is extended via a random element. If this results in a step
##  too big, it is repeated several times to find hopefully a small
##  extension!
##
PermRefinedChain := function(G,cc)
local bound,a,b,c,cnt,r,i,j,bb,ranfl;
  bound:=(10*LogInt(Size(G),10)+1)*Maximum(Factors(Size(G)));
  c:=[];  
  for i in [2..Length(cc)] do  
    Add(c,cc[i-1]);
    if Index(cc[i],cc[i-1]) > bound then
      # c:=Concatenation(c,RefinedChainLink(G,cc[i],cc[i-1]));
      a:=cc[i-1];
      while Index(cc[i],a)>bound do
	# try extension via normalizer
	b:=Normalizer(cc[i],a);
	if b<>a then
	 # extension by normalizer surely is a normal step
	  a.normalStep:=true;
	  bb:=b;
        else
	  bb:=cc[i];
	  a.normalStep:=false;
        fi;
	if b=a then
	  b:=Normalizer(cc[i],Centre(a));
	fi;
	if b=a or Index(b,a)>bound then
	  cnt:=8+2^(LogInt(Index(bb,a),5)+2);
	  repeat
	    if Index(bb,a)<3000 then
	      b:=Extension(bb,a);
	      if b=false then
		b:=bb;
	      fi;
	      cnt:=0;
	    else
	    # larger indices may take more tests...
	      InfoCoset1("#W Random\n");
	      ranfl:=false;
	      repeat
		r:=Random(bb);
	      until not(r in a);
	      if a.normalStep then
		b:=Closure(a,r);
              else
		# self normalizing subgroup: thus every element not in <a>
     		# will surely map one generator out
	        j:=0;
		repeat
		  j:=j+1;
                until not(a.generators[j]^r in a);
		r:=a.generators[j]^r;

		#b:=Closure(a,r);
		b:=Subgroup(Parent(a),Union(a.generators,[r]));
                MakeStabChainRandom(b);
		ranfl:=true;
	      fi;
	      if Size(b)<Size(bb) then
		if ranfl then
		  # force correct Schreier Sims
		  b:=Closure(a,r);
                fi;
		bb:=b;
		InfoCoset1("#I improvement found\n");
	      fi;
	      cnt:=cnt-1;
	    fi;
	  until Index(bb,a)<=bound or cnt<1;
	fi;
	a:=b;
	if a<>cc[i] then #not upper level
	  Add(c,a);
	fi;
      od;
    fi;
  od;
  Add(c,cc[Length(cc)]);
  return c;
end;


#############################################################################
##
#F  PermGroupOps.CanonicalCosetElement(<U>,<g>) . . . . .  CCE for permgroups
##
PermGroupOps.CanonicalCosetElement := function(U,g)
  # prepare special base for CCE
  PermGroupOps.MinimalStabChain(U);
  return MainEntryCCEPermGroup( U, U, g );
end;


#############################################################################
##
#F  PermGroupOps.OnCanonicalCosetElements(<G>,<U>)  create operation function
#F                                                    for CCEs for permgroups
##
##  this routine returns a *function*, that can be used like OnPoints.
##
PermGroupOps.OnCanonicalCosetElements := function(G,U)
  # prepare special base for CCE
  PermGroupOps.MinimalStabChain(U);
  return function(a,b)
	   return MainEntryCCEPermGroup(G,U,a*b);
	 end;
end;


#############################################################################
##
#F  MainEntryCCEPermGroup( <G>, <U>, <g> )  . . . . . . .  cce for permgroups
##
##  Main part of the computation of a canonical coset representative in a
##  PermGroup. This is done, by factoring with the strong generators, that
##  move points the same way, as the coset representative. The routine
##  supposes, that an appropriate base has been set up by the calling
##  routine.
##
MainEntryCCEPermGroup := function(G,U,g)
  local   p,    # miminal image of basepoint of <S> under '<U>\*<g>'
          i,img;

  # get the minimal stab chain
  U:=U.minimalStabChain;
  while U.generators <> []  do
    # calculate p := Minimum( OnTuples( U.orbit, g ) );
    p := "infinity";
    for i in U.orbit do
      img:=i^g;
      if img<p then
	p:=img;
      fi;
    od;
    while U.orbit[1]^g <> p  do g := U.transversal[p/g] mod g;  od;
    U := U.stabilizer;
  od;
  return g;
end;

PermGroupOps.MainEntryCCE := MainEntryCCEPermGroup;


#############################################################################
##
#E  Emacs . . . . . . . . . . . . . . . . . . . . . . . local emacs variables
##
##  Local Variables:
##  mode:               outline
##  outline-regexp:     "#A\\|#F\\|#V\\|#E\\|#R"
##  fill-column:        73
##  fill-prefix:        "##  "
##  eval:               (hide-body)
##  End:
##



