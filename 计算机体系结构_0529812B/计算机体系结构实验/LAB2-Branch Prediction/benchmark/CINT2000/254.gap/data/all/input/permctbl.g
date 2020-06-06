#############################################################################
##
#A  permctbl.g                  GAP library                  Alexander Hulpke
##
#H  @(#)$Id: permctbl.g,v 3.5.1.1 1994/11/03 15:03:10 ahulpke Rel $
##
#Y  Copyright (C)  1993,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the PermGroup specific parts for Dixon-Schneider.
##
#H  $Log: permctbl.g,v $
#H  Revision 3.5.1.1  1994/11/03  15:03:10  ahulpke
#H  changed 'Enumerator' to use 'MinimalStabChain'
#H
#H  Revision 3.5  1993/07/21  18:21:17  ahulpke
#H  fixed calling convention of Enumeration
#H
#H  Revision 3.4  1993/05/11  14:24:16  ahulpke
#H  PermGroups need not to operate on 1 and 2
#H
#H  Revision 3.3  1993/03/25  22:02:04  martin
#H  changed 'PermutationCharacter' to 'PermGroupOps.PC'
#H
#H  Revision 3.2  1993/03/10  13:18:11  fceller
#H  added dispatcher for 'PermutationCharacter'
#H
#H  Revision 3.1  1993/01/18  18:46:52  martin
#H  initial revision under RCS
#H
##

#############################################################################
##
#F  IdentificationPermGroup(<D>,<el>) . . . . .  class invariants for el in G
##
##  The class invariant consists of the cycle structure and - if computation
##  might improve results - of the Fingerprint of the permutation
##
IdentificationPermGroup := function(D,el)
  local s,t,i,l; # guter Programmier s t i l !
  s:=CycleStructurePerm(el);
  if D.group.isPerfect=false then
Add(s,D.group.operations.CanonicalCosetElement(D.group.derivedSubgroup,el));
  fi;
  t:=ShallowCopy(s);
  if t in D.centmulCandidates then
    Add(s,"c");
    l:=First(D.centmulMults,i->i[1]=t);
    for i in Sublist(l,[2..Length(l)]) do
      s:=Concatenation(s,CycleStructurePerm(
                           el*D.conjugacyClasses[i].representative));
    od;
  fi;
  if t in D.fingerprintCandidates then
    Add(s,-FingerprintPerm(D,el,D.p1,D.p2,D.fingerprintOrbitStabilizer,
                                    D.fingerprintRepresentatives));
  fi;
  return s;
end;


#############################################################################
##
#F  RationalIdentificationPermGroup( <D>, <el> )   galois-fix class invariant
##
##  When trying to use cheap identifications, we cannot use all
##  identification routines: For exaple galois conjugated elements must be
##  multiplied by the *galois conjugate* of the central element!
##
RationalIdentificationPermGroup := function(D,el)
  return CycleStructurePerm(el);
end;


#############################################################################
##
#F  FingerprintPerm( <D>, <el>, <i>, <j>, <orbitJ>, <representatives>)
#F       Entry i,j of the matrix of el in the permutation representation of G
##
FingerprintPerm := function(D,el,i,j,orbitJ,representatives)
  local x,y,a,cycle,cycles;
  a:=0;
  cycles:=Cycles(el,D.group.orbit);
  for cycle in cycles do
    x:=cycle[1];
    if x^(el*representatives[x]) in orbitJ then
      a:=a+Length(cycle);
    fi;
  od;
  return a;
end;


#############################################################################
##
#F  PermGroupOps.DxPreparation(<G>) . . . . . . . specific initialisation for
#F                                                         permutation groups
##
##  Set up some functions. Also test, whether calculating fingerprints and
##  multiplication by central elements might improve the quick
##  identification
##
PermGroupOps.DxPreparation := function(G)
  local k,sum,perm,structures,ambiguousStructures,i,j,p,e,cem,ces,z,t,cen,a,
        c,s,f,fc,fs,fos,fr,D;

  D:=DixonRecord(G);
  D.identification:=IdentificationPermGroup;
  D.rationalidentification:=RationalIdentificationPermGroup;
  D.ClassMatrixColumn:=StandardClassMatrixColumn;

  if IsLargeGroup(G) then
    D.ClassElement:=ClassElementLargeGroup;
  else
    D.ClassElement:=ClassElementSmallGroup;
    
    Enumeration(G);
    D.classMap:=List([1..Size(G)],i->D.klanz);
    for j in [1..D.klanz-1] do
      for i in Orbit(G,D.conjugacyClasses[j].representative) do
        D.classMap[G.enumeration.number(G.enumeration,i)]:=j;
      od;
    od;
  fi;

  D.fingerprintCandidates:=[];
  D.centmulCandidates:=[];
  G.degree:=PermGroupOps.LargestMovedPoint(G);
  k:=D.klanz;
  if IsLargeGroup(G) then
    # test, if cyclestructure yields no perfect result
    structures:=[];
    ambiguousStructures:=[];
    for i in [1..k] do
      s:=IdentificationPermGroup(D,D.conjugacyClasses[i].representative);
      if not s in structures then
        Add(structures,s);
      else
        AddSet(ambiguousStructures,s);
      fi;
    od;
    if ambiguousStructures<>[] then
      # Centre multiplikation test
      cem:=[];
      cen:=[];
      for i in [2..Length(D.conjugacyClasses)] do
        if Size(D.conjugacyClasses[i])=1 then
          Add(cen,i);
        fi;
      od;

      if cen<>[] then
        for s in ambiguousStructures do
          ces:=[s];
          c:=Filtered([1..Length(D.conjugacyClasses)],i->
               IdentificationPermGroup(D,
                  D.conjugacyClasses[i].representative)=s);
          a:=[[1..Length(c)]];
          for z in cen do
            t:=List(c,i->
                     CycleStructurePerm(
                                    D.conjugacyClasses[i].representative*
                                    D.conjugacyClasses[z].representative));
            if Length(Set(t))>1 then
              # improved result ?
              fc:=[];
              fs:=[];
              for i in [1..Length(t)] do
                p:=Position(fc,t[i]);
                if p=false then
                  Add(fc,t[i]);
                  p:=Length(fc);
                  fs[p]:=[];
                fi;
                Add(fs[p],i);
              od;
              fc:=[];
              for i in a do
                fc:=Concatenation(fc,Filtered(List(fs,j->Intersection(j,i)),
                                    j->j<>[]));
              od;
              fc:=Set(fc);
              if fc<>a then
                Add(ces,z);
                a:=fc;
              fi;
            fi;
          od;
          if Length(ces)>1 then
            Add(cem,ces);
          fi;
        od;
        D.centmulMults:=cem;
      fi;

      # fingerprint test
      if IsTransitive(G,G.operations.MovedPoints(G)) and
  # otherwise lotsa representatives will mess up memory
         Length(PermGroupOps.MovedPoints(G))<1500 then

        # select moved points 1 and 2
        fos:=PermGroupOps.MovedPoints(G);
        D.p1:=fos[1];
        D.p2:=fos[2]; 

        fs  := Stabilizer(G,D.p1);
        fos := First(Orbits(fs,[1..G.degree]),o->D.p2 in o);
        fr  := List([1..G.degree],x->RepresentativeOperation(G,x,D.p1));
        fc:=[];
        for s in ambiguousStructures do
          c:=Filtered([1..D.klanz],i->IdentificationPermGroup(D,
                  D.conjugacyClasses[i].representative)=s);
          f:=List(c,i->FingerprintPerm(D,
                    D.conjugacyClasses[i].representative,D.p1,D.p2,fos,fr));
          if Length(Set(f))>1 then Add(fc,s);
          fi;
        od;
        if Length(fc)>0 then
          D.fingerprintCandidates:=fc;
          D.fingerprintOrbitStabilizer:=fos;
          D.fingerprintRepresentatives:=fr;
        fi;
      fi;
      D.centmulCandidates:=Set(List(cem,i->i[1]));
    fi;
  fi;

  D.ids:=[];
  D.rids:=[];
  for i in [1..D.klanz] do
    D.ids[i]:=D.identification(D,D.conjugacyClasses[i].representative);
    D.rids[i]:=
     D.rationalidentification(D,D.conjugacyClasses[i].representative);
  od;

  return D;

end;


#############################################################################
##
#F  CharacterDegreePool(G)  . . possible character degrees, using thm. of Ito
##
PermGroupOps.CharacterDegreePool:=function(G)
  local d,k,r,s;
  r:=RootInt(Size(G));
  s:=Lcm(List(AbelianNormalSubgroups(G),i->Index(G,i)));
  k:=Length(ConjugacyClasses(G));
  return List(Filtered(DivisorsInt(s),i->i<=r),i->[i,k]);
end;


#############################################################################
##
#F  PermGroupOps.Enumeration(<G>) . . . .  enumeration for permutation groups
##
##  enumerate elements of a PermGroup G, using the representation of an
##  element as product of the strong generators and identifying the numbers
##  of the respective coset representative with an multi-adic expansion of
##  the number.
##
PermGroupOps.Enumeration:=function ( G )
  local orbits,cosetreps,indices,ptpos,idx,pos,stab,reps,steps,i;

  # prepare special base
  stab := G.operations.MinimalStabChain(G);

  orbits := [  ];
  cosetreps := [  ];
  indices := [  ];
  ptpos := [  ];

  while stab.generators <> [  ]  do
    idx := Length( stab.orbit );
    reps := [  ];
    reps[stab.orbit[1]] := ();
    for i  in stab.orbit  do
      reps[i] := stab.transversal[i] * reps[i ^ stab.transversal[i]];
    od;
    pos := [  ];
    for i  in [ 1 .. idx ]  do
      pos[stab.orbit[i]] := i - 1;
    od;
    Add( orbits, ShallowCopy( stab.orbit ) );
    Add( cosetreps, reps );
    Add( indices, idx );
    Add( ptpos, pos );
    stab := stab.stabilizer;
  od;
  steps := Length( indices );
  return rec(
    group := G,
    number := function ( r,elem )
       local  num, ipt, i;

       num := 0;
       for i  in [ 1 .. steps ]  do
	 if elem <> ()  then
	   ipt := orbits[i][1] ^ elem;
	   num := num * indices[i] + ptpos[i][ipt];
	   elem := elem * cosetreps[i][ipt];
	 else
	   num := num * indices[i];
	 fi;
       od;
       return num + 1;
    end,

    element := function ( r,num )
       local  n, elem, coef, i;

       n:=num-1;
       coef:=[];
       for i in Reversed(indices) do
	 Add(coef,n mod i);
	 n:=QuoInt(n,i);
       od;
       coef := Reversed(coef)+1;
       elem := ();
       for i  in [ 1 .. steps ]  do
	 elem := elem * cosetreps[i][orbits[i][coef[i]]];
       od;
       return elem ^ (-1);
   end  );
end;


#############################################################################
##
#F  PermGroupOps.PermutationCharacter(<G>,<U>)  . . . . permutation character
##
##  'PermutationCharacter'  will either  compute the permutation character of
##  <U> in <G> or the permutation character of the natural representation.
##
PermGroupOps.PermutationCharacter := function( arg )
    local    i,  c,  cl,  s;

    # call  'GroupOps' for two arguments
    if 2 = Length(arg)  then
        return GroupOps.PermutationCharacter( arg[1], arg[2] );

    # otherwise use 'MovedPoints'
    else
        s  := PermGroupOps.MovedPoints(arg[1]);
        c  := [Length(s)];
        cl := ConjugacyClasses(arg[1]);
        for i  in [ 2 .. Length(cl) ]  do
            Add( c, Length( Difference( s, PermGroupOps.MovedPoints(
                 Subgroup( Parent(arg[1]),[cl[i].representative] ) ) ) ) );
        od;
        return c;
    fi;
end;


#############################################################################
##
#E  Emacs . . . . . . . . . . . . . . . . . . . . . . . local emacs variables
##
##  Local Variables:
##  mode:               outline
##  outline-regexp:     "#A\\|#F\\|#V\\|#E\\|#R"
##  tab-width:          2
##  fill-column:        73
##  fill-prefix:        "##  "
##  eval:               (hide-body)
##  End:
##



