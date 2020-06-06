#############################################################################
##
#A  grpctbl.g                   GAP library                  Alexander Hulpke
##
#H  @(#)$Id: grpctbl.g,v 3.17.1.1 1994/11/25 09:16:21 ahulpke Rel $
##
#Y  Copyright (C)  1993,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains  the Dixon-Schneider Algorithm for computing
##  character tables of groups
##
#H  $Log: grpctbl.g,v $
#H  Revision 3.17.1.1  1994/11/25  09:16:21  ahulpke
#H  avoid class sort when no sizes available
#H
#H  Revision 3.17  1994/04/21  12:11:55  sam
#H  introduced 'identifier' component,
#H  replaced incomplete 'automorphisms' by 'galomorphisms'
#H
#H  Revision 3.16  1994/02/15  11:04:48  sam
#H  replaced 'order' component by 'size';
#H  (for the moment, 'order' is still valid)
#H
#H  Revision 3.15  1994/01/25  15:10:58  fceller
#H  replaced 'IntFFE2' by 'IntFFE'
#H
#H  Revision 3.14  1993/10/19  16:45:45  sam
#H  all tables returned by 'CharTableDixonSchneider' have
#H  a component 'powermap' now
#H
#H  Revision 3.13  1993/08/18  14:19:35  sam
#H  fixed handling of permutations in 'CharTableDixonSchneider'
#H
#H  Revision 3.12  1993/07/21  18:21:17  ahulpke
#H  fixed calling convention of 'Enumeration'
#H
#H  Revision 3.11  1993/07/12  19:32:55  ahulpke
#H  fixed call of CharTablePGroup for ugly groups
#H
#H  Revision 3.10  1993/06/23  21:55:46  ahulpke
#H  Provided solution for an almost impossible case for bad split mod p
#H
#H  Revision 3.9  1993/06/23  21:07:16  ahulpke
#H  fixed weird error, when split mod p is not as good as in char 0
#H
#H  Revision 3.8  1993/05/12  13:58:14  ahulpke
#H  fixed degree bound limitation
#H
#H  Revision 3.7  1993/03/15  15:14:40  ahulpke
#H  special handling of abelian groups
#H
#H  Revision 3.6  1993/02/19  11:57:30  gap
#H  fixed a bug in 'DxLinearCharacter'
#H
#H  Revision 3.5  1993/02/09  14:25:55  martin
#H  made undefined globals local
#H
#H  Revision 3.4  1993/01/25  08:24:14  ahulpke
#H  fixed a bug in' SplitDegree'
#H
#H  Revision 3.3  1993/01/21  14:45:35  ahulpke
#H  worked around a bug in 'CharTablePGroup'
#H
#H  Revision 3.2  1993/01/19  12:50:48  ahulpke
#H  threw out some debugging stuff
#H
#H  Revision 3.1  1993/01/18  18:46:52  martin
#H  initial revision under RCS
##

#############################################################################
##
#F  InfoCharTable1 . . . . . . . .  information function for character tables
#F  InfoCharTable2 . . . . . . . .  information function for character tables
##
if not IsBound(InfoCharTable1) then InfoCharTable1:=Ignore; fi;
if not IsBound(InfoCharTable2) then InfoCharTable2:=Ignore; fi;

#############################################################################
##
#G  USECTPGROUP . . . . . . . . . . indicates, whether CharTablePGroup should
##                                  always be called
USECTPGROUP := false;

#############################################################################
##
#F  IsLargeGroup(<G>) . . . . . . . . . . . .  test, whether a group is small
##
##  If a group is small, we may use enumerations of the elements to speed up
##  the computations. The criterion is the size, compared to the global
##  variable LARGEGROUPORDER.
##
if not IsBound(LARGEGROUPORDER) then
  LARGEGROUPORDER:=10000;
fi;

IsLargeGroup := function(G)
  # note: if the size of a Group is <1000, ConjugacyClasses stores
  # the elements. Thus the enumeration feature is unnecessary.
  return G.size<1000 or G.size>LARGEGROUPORDER;
end;

#############################################################################
##
#F  CharTableDixonSchneider(<G>) . . . . .  character table of finite Group G
##
##  Compute the table of the irreducible characters of G, using the
##  Dixon/Schneider method.
##
CharTableDixonSchneider := function(arg)
  local G,k,C,D,Gi,opt;

  G:=arg[1];
  if Length(arg)>1 then
    opt:=arg[2];
  else
    opt:=rec();
  fi;
  if IsBound(G.charTable) and
     not IsBound(G.conjugacyClasses) then
Error("if characters are given, you must also provide the\nconjugacy Classes");
  fi;

  D:=DixonInit(G,opt);
  k:=D.klanz;
  C:=D.charTable;

  # iterierte Schleife

  while Length(C.irreducibles)<k do

    DixonSplit(D);
    OrbitSplit(D);

  od;

  G:=DixontinI(D);

  # bad hack, I admit;
  # of course it would be desirable to handle the permutations carefully
  # enough to end up with the identity here ...
  Unbind( G.charTable.permutation );

  if not IsBound( G.charTable.powermap ) then
    G.charTable.powermap:= [];
  fi;

  return G.charTable;
end;

GroupOps.CharTable := CharTableDixonSchneider;


#############################################################################
##
#F  DixonRecord( <G> ) . . . . . . . . . .  prepare record .dixon and note it
#F                                                               in the group
##
DixonRecord := function(G)
  local D,cl,pl;
  D:=rec( group:=G, # workgroup
          oldG:=G, # the group for which computation should take place
          deg:=Size(G),
          yetmats:=[],
          modulars:=[],
	  operations:=DixonRecordOps);
  if IsBound(G.name) then 
    D.name:=ConcatenationString("DixonRecord(",G.name,")");
  else
    D.name:="DixonRecord of nameless group";
  fi;
  G.dixon:=D;
  cl:=ShallowCopy(ConjugacyClasses(G));
  D.klanz:=Length(ConjugacyClasses(G));

  pl:=[1..D.klanz];

  # when available cheap, then sort classes.
  if ForAll(cl,i->IsBound(i.size)) then
    SortParallel(cl,pl,ClassComparison);
  fi;

  D.classPermutation:=PermList(pl);

  D.conjugacyClasses:=cl;

  # force computation of the derived Subgroup
  G.isPerfect:=Size(G)=Size(DerivedSubgroup(G));
  return D;
end;


#############################################################################
##
#V  DixonRecordOps . . . . . . . . . . . . . . .  operations for DixonRecords
##
DixonRecordOps := rec(Print:=function(r)
			       Print(r.name);
			     end);


#############################################################################
##
#F  DixonInit(<G>) . . . . . . . . . . . initialize Dixon-Schneider algorithm
##
DixonInit := function(arg)
  local k,z,exp,prime,C,M,cg,moli,m,f,r,pl,pa,ga,cpool,D,G,opt,i;

  G:=arg[1];
  if Length(arg)>1 then
    opt:=arg[2];
  else
    opt:=rec();
  fi;
  # force computation of the size of the group
  Size(G);

  if IsAbelian(G) then
    D:=DxAbelianPreparation(G);
  else
    # force computation of Conjugacy classes of $G$ and their sizes
    List(ConjugacyClasses(G),Size);
    D:=G.operations.DxPreparation(G);
  fi;

  G:=D.group;

  k:=D.klanz;
  InfoCharTable1("#I  ",k," classes\n");

  D.currentInverseClassNo:=0;

  if not IsBound(D.oldG.charTable) then
    C:=rec(size := D.group.size,
	 centralizers:=List(D.conjugacyClasses,cl->D.group.size/Size(cl)),
	 orders := List(D.conjugacyClasses,
			c->Order(D.group,c.representative)),
	 classes := List(D.conjugacyClasses,Size),
	 irreducibles:=[],
	 #group    := D.group,
	 operations := CharTableOps);

    if IsBound(D.group.name) then
      C.identifier:=D.group.name;
    else
      Print("#W  Warning: Group has no name\n");
      C.identifier:="";
    fi;

#T Let the wind of change blow this away!
     C.order:= C.size;
     C.name:= C.identifier;

    cpool:=[];
  else
    C:=D.oldG.charTable;
    Unbind(C.group); # don't mess with the classes when resorting
    SortClassesCharTable(C,D.classPermutation^(-1));
    C.group:=G;
    m:=C.irreducibles;
    C.irreducibles:=[];
    cpool:=m;
  fi;

  D.charTable:=C;

  if IsAbelian(G) then
    # special hack for abelian groups
    C.irreducibles:=DxLinearCharacters(D);
  else

    if not IsBound(C.powermap) then
      C.powermap:=[];
    fi;

    if not IsBound(C.inversemap) then
      C.inversemap:=[1];
      for i in [2..k] do
	C.inversemap[i]:=DxPowerClass(D,i,-1);
      od;
    fi;

    DxCalcPowerMap(D);

    # Galoisgroup operating on the columns
    ga:=Group(Set(List(List(PrimeResidueClassGroup(Exponent(G)).generators,
			     i->i.representative),
	 i->PermList(List([1..k],j->DxPowerClass(D,j,i))))),());
    ga.maybeIncomplete:=true;
    C.galomorphisms:= ga;

    D.galoisOrbits:=List([1..k],i->Set(Orbit(ga,i)));

    D.matrices:=Difference(Set(List(D.galoisOrbits,i->i[1])),[1]);

    D.galOp:=[];

    # estimate the irrationality of the table
    exp:=Exponent(G);
    #if exp>500 then
      # compute irrationality from powermap: Lcm of rep.orders of non-
      # rational classes.
      #exp:=Lcm(List(PermGroupOps.MovedPoints(ga),i->C.orders[i]));
    #fi;
    #D.irrexp:=exp;
    prime:=exp+1;

    if IsBound(opt.prime) then
      prime:=Maximum(prime,opt.prime);
    fi;

    while prime<100 do
      prime:=prime+exp;
    od;

    if IsBound(opt.maxdeg) then
      z:=2*opt.maxdeg;
      D.degreePool:=List(Filtered(DivisorsInt(G.size),i->i<=z),i->[i,k]);
    else
      z:=RootInt(G.size);
      if z<30000 then
	D.degreePool:=List(Filtered(DivisorsInt(G.size),i->i<=z),i->[i,k]);
      else
	# try to calculate approximate degrees
	D.degreePool:=G.operations.CharacterDegreePool(G);
      fi;
      z:=2*Maximum(List(D.degreePool,i->i[1]));

    fi;
    # throw away (unneeded) linear degrees!
    D.degreePool:=Filtered(D.degreePool,i->i[1]>1 and i[1]<=z/2);

    while prime<z do
      prime:=prime+exp;
    od;
    while not IsPrime(prime) do
      prime:=prime+exp;
    od;
    if prime>65535 then
      Error("sorry, GAP does not support fields of sufficient size");
    fi;
    f:=GF(prime); # probably later IntegersModP
    z:=PowerModInt(PrimitiveRootMod(prime),(prime-1)/exp,prime);
    D.modularMap:=GeneratePrimeCyclotomic(exp,z*f.one);
    D.num:=D.klanz;
    D.prime:=prime;
    D.field:=f;
    D.fone:=f.one;
    D.z:=z;
    r:=RowSpace(k,f);
    D.raeume:= [r];

    M:=IdentityMat(k);
    for i in [1..k] do
      M[i][i]:=Size(D.conjugacyClasses[i]) mod prime;
    od;
    D.projectionMat:=M*(D.fone/(Size(D.group) mod prime));

    IncludeIrreducibles(D,DxLinearCharacters(D));

    if (USECTPGROUP or Size(G)<2000 or k*10>=Size(G))
       and IsBound(G.isAgGroup) and G.isAgGroup
	then # Anfangscharaktere ausrechnen

      m:=List(CharTablePGroup(G,"meckere nicht").irreducibles,
	       i->Permuted(i,D.classPermutation^(-1)) );
      if Length(m)<k then

	C.irreducibles:=[];
	IncludeIrreducibles(D,m);
      else
	C.irreducibles:=m;
	D.raeume:=[];
	cpool:=[];
      fi;
    fi;

    if Length(D.raeume)>0 then
      # indicate Stabilizer of the whole orbit, simultaneously compute
      # CharacterMorphisms.
      D.raeume[1].stabilizer:=CharacterMorphismGroup(D);
      m:=First(D.conjugacyClasses,i->Size(i)>1);
      if Size(m)>8 then 
	D.maycent:=true;
      fi;
    fi;

    if Length(cpool)>0 then
      IncludeIrreducibles(D,cpool);
    fi;

  fi;

  return D;
end;


#############################################################################
##
#F  RegisterNewCharacter( <D>, <c> )  . . . . .  note newly found irreducible
#F                                                     character modulo prime
##
RegisterNewCharacter := function(D,c)
  local d,p;
  # it may happen, that an irreducible character will be registered twice:
  # 2-dim space, 1 Orbit, combinatoric split. Avoid this!
  if not(c in D.modulars) then
    Add(D.modulars,c);
    d:=IntFFE(c[1]);
    D.deg:=D.deg-d^2;
    D.num:=D.num-1;
    p:=1;
    while p<=Length(D.degreePool) do
      if D.degreePool[p][1]=d then
	D.degreePool[p][2]:=D.degreePool[p][2]-1;
	# filter still possible character degrees:
	p:=1;
	d:=1;
	# determinate smallest possible degree (nonlinear)
	while p<=Length(D.degreePool) and d=1 do
	  if D.degreePool[p][2]>1 then
	    d:=D.degreePool[p][1];
	  fi;
	  p:=p+1;  
	od;
	# degreeBound
	d:=RootInt(D.deg-(D.num-1)*d);
	D.degreePool:=Filtered(D.degreePool,i->i[2]>0 and i[1]<=d);
	p:=Length(D.degreePool)+1;
      fi;
      p:=p+1;
    od;
  fi;
end;


#############################################################################
##
#F  DixontinI( <D> )  . . . . . . . . . . . . . . . .  reverse initialisation
##
##  Return everything modified by the Dixon-Algorithm to its former status.
##  the old group is returned, character table is sorted according to its 
##  classes
##
DixontinI := function(D)
  local C,p,u;

  if IsBound(D.shorttests) then
    InfoCharTable2("#I  ",D.shorttests," shortened conjugation tests\n");
  fi;
  InfoCharTable1("#I  Total:",Length(D.yetmats)," matrices, ",
                 D.yetmats,"\n");
  C:=D.charTable;
  C.text:="origin: Dixon's Algorithm";

  SortCharactersCharTable(C);

  Unbind(C.group);
  p:=D.classPermutation;
  SortClassesCharTable(C,p);
  #C.inversemap:=Permuted(List(C.inversemap,i->i^p),p);
  Unbind(C.inversemap);

  C.group:=D.oldG;
  D.conjugacyClasses:=D.oldG.conjugacyClasses;
  D.group:=D.oldG;

  # throw away not any longer used record fields
  for u in Difference(RecFields(D),
    ["ClassElement","centmulCandidates","charTable","classMap",
    "facs","fingerprintCandidates",
    "group","identification","ids","iscentral","klanz","name","operations",
    "replist","shorttests","uniques"])
    do
    Unbind(D.(u));
  od;
  D.Permutation:=();
  SortDixonRecord(D);
  D.group.dixon:=D;

  D.group.charTable:=C;
  return D.group;
end;


#############################################################################
##
#F  SortDixonRecord( <D> )  . . . . . sort DixonRecord <D> to character table
#F                                                                permutation
##
SortDixonRecord := function(D)
  local p,cp;
  if IsBound(D.charTable.permutation) then
    cp:=D.charTable.permutation;
  else
    cp:=();
  fi;
  p:=D.Permutation^(-1)*cp;
  if not(p<>()) then
    if IsBound(D.centmulCandidates) then
      Apply(D.centmulCandidates,
	function(l)
	local m,i;
	  m:=[l[1]];
	  for i in [2..Length(l)] do
	    m[i]:=l[i]^p;
	  od;
	  return m;
	end);
    fi;
    if IsBound(D.classMap) then
      Apply(D.classMap,i->i^p);
    fi;
    D.ids:=Permuted(D.ids,p);
    D.Permutation:=cp;
  fi;
end;


#############################################################################
##
#F  DixonSplit(<D>) . .  calculate matrix, split spaces and obtain characters
##
DixonSplit := function(D)
  local r,i,j,ch,ra;

  SplitStep(D,BestSplittingMatrix(D));

  for i in [1..Length(D.raeume)] do
    r:=D.raeume[i];
    if r.dim=1 then
      InfoCharTable2("#I  lifting character no.",
                      Length(D.charTable.irreducibles)+1,"\n");
      if IsBound(r.char) then
        ch:=r.char[1];
      else
	r.generators[1]:=r.generators[1]
			  *ModularCharacterDegree(D,r.generators[1]);
	for j in Orbit(D.characterMorphisms,
			  r.generators[1],D.asCharacterMorphism) do
	  RegisterNewCharacter(D,j);
	od;
        ch:=DxLiftCharacter(D,r.generators[1]);
      fi;
      for j in Orbit(D.characterMorphisms,ch,D.asCharacterMorphism) do
        Add(D.charTable.irreducibles,j);
      od;
      Unbind(D.raeume[i]);
    fi;
  od;
  # Throw away lifted spaces
  ra:=[];
  for i in D.raeume do
    Add(ra,i);
  od;
  D.raeume:=ra;
  CombinatoricSplit(D);
end;


#############################################################################
##
#F  OrbitSplit(<D>) . . . . . . . . . . . . . . try to split two-orbit-spaces
##
OrbitSplit := function(D)
  local i,j,s,ni,nm;
  ni:=[];
  nm:=[];
  for i in D.raeume do
    if i.dim=3 and not IsBound(i.twofail) and
       CharacterMorphismOrbits(D,i).number=2 then
      s:=SplitTwoSpace(D,i);
      if Length(s)=2 and s[1].d=1 then
        # character extracted
        Add(ni,s[1].char[1]);
        Add(nm,s[1].base[1]);
      fi;
    fi;
  od;
  if ni<>[] then
    IncludeIrreducibles(D,ni,nm);
  fi;
  CombinatoricSplit(D);
end;


#############################################################################
##
#F  CombinatoricSplit( <D> )  . . . . . . . . .  split two-dimensional spaces
##
CombinatoricSplit := function(D)
  local i,newRaeume,raum,neuer,j,ch,irrs,mods,incirrs,incmods,nb,rt,k,neuc;
  newRaeume:=[];
  incirrs:=[];
  incmods:=[];
  for i in [1..Length(D.raeume)] do
    raum:=D.raeume[i];
    if raum.dim=2 and not IsBound(raum.twofail) then
      neuer:=SplitTwoSpace(D,raum);
    else
      neuer:=[];
      if raum.dim=2 then
	# next attempt might work due to fewer degrees
	Unbind(raum.twofail);
      fi;
    fi;
    if Length(neuer)=2 then
      rt:=Difference(RightTransversal(D.characterMorphisms,
           CharacterMorphismOrbits(D,raum).stabilizer),
           [D.characterMorphisms.identity]);
      mods:=[];
      irrs:=[];
      for j in [1,2] do
        InfoCharTable2("#I  lifting character no.",
                        Length(D.charTable.irreducibles)+1,"\n");
        if IsBound(neuer[j].char) then
          ch:=neuer[j].char[1];
        else
          ch:=DxLiftCharacter(D,neuer[j].base[1]);
        fi;
	if not ch in D.charTable.irreducibles then
	  Add(mods,neuer[j].base[1]);
	  RegisterNewCharacter(D,neuer[j].base[1]);
	  Add(irrs,ch);
	  Add(D.charTable.irreducibles,ch);
	fi;
      od;
      for j in rt do
        InfoCharTable1("#I  TwoDimSpace image\n");
        nb:=D.asCharacterMorphism(raum.base[1],j);
        neuc:=List(irrs,i->D.asCharacterMorphism(i,j));
        if not ForAny([i+1..Length(D.raeume)],i->nb in D.raeume[i]) then
          incirrs:=Union(incirrs,neuc);
          incmods:=Union(incmods,List(mods,i->D.asCharacterMorphism(i,j)));
        else
          InfoCharTable1(
            "#W strange spaces due to inclusion of irreducibles!");
          Add(D.charTable.irreducibles,neuc[1]);
          Add(D.charTable.irreducibles,neuc[2]);
        fi;
      od;
    else
      Add(newRaeume,raum);
    fi;
  od;
  D.raeume:=newRaeume;
  if Length(incirrs)>0 then
    IncludeIrreducibles(D,incirrs,incmods);
  fi;
end;


#############################################################################
##
#F  SplitCharacters( <D>, <list> )   split characters according to the spaces
##
SplitCharacters := function(D,l)
  local ml,nu,ret,r,p,v,alo,ofs,i,j,inv,b;
  b:=Filtered(l,i->(i[1]>1) and (i[1]<D.prime/2));
  l:=Difference(l,b);
  ml:=List(b,i->List(i,D.modularMap));
  nu:=List(D.conjugacyClasses,i->D.field.zero);
  ret:=[];
  b:=ShallowCopy(D.modulars);
  alo:=Length(b);
  ofs:=[];
  for r in D.raeume do
    # recreate all images
    for i in Orbit(D.characterMorphisms,r,D.asCharacterMorphism) do
      b:=Concatenation(b,Base(i));
      Add(ofs,[alo+1..Length(b)]);
      alo:=Length(b);
    od;
  od;
  inv:=b^(-1);
  for i in ml do
    v:=i*inv;
    for r in [1..Length(D.raeume)] do
      p:=ShallowCopy(nu);
      for j in ofs[r] do
        p[j]:=v[j];
      od;
      p:=p*b;
      if p<>nu then
        AddSet(ret,DxLiftCharacter(D,p));
      fi;
    od;
  od;
  return Union(ret,l);
end;


#############################################################################
##
#F  IncludeIrreducibles(<D>,<new>,[<newmod>]) . . . . . handle (newly?) found
#F                                                               irreducibles
##
##  This routine will do all handling, whenever characters have been found
##  by other means, than the Dixon/Schneider algorithm. First the routine
##  checks, which characters are not new (this allows, to include huge bulks
##  of irreducibles, got by tensoring). Then the characters are closed under
##  images of the CharacterMorphisms. Afterwards the character spaces are
##  stripped of the new characters, the characters are included as
##  irreducibles and possible degrees etc. are corrected. If the modular
##  images of the irreducibles are known, they may be given in newmod.
##
IncludeIrreducibles := function(arg)
  local i,pcomp,m,r,D,neue,tm,nm,news;
  D:=arg[1];
  # force computation of all images under $\cal T$. We will need this
  # (among others), to be sure, that we can keep the stabilizers
  neue:=arg[2];
  if IsBound(D.characterMorphisms) then
    tm:=D.characterMorphisms;
    news:=Union(List(neue,i->Orbit(tm,i,D.asCharacterMorphism)));
    if Length(news)>Length(neue) then
      InfoCharTable1("#I  new Characters by CharacterMorphisms found\n");
    fi;
    neue:=news;
  fi;
  neue:=Difference(neue,D.charTable.irreducibles);
  D.charTable.irreducibles:=Concatenation(D.charTable.irreducibles,neue);
  if Length(arg)=3 then
    m:=Difference(arg[3],D.modulars);
    nm:=true;
  else
    m:=List(neue,i->List(i,D.modularMap));
    nm:=false;
  fi;
  if nm and IsBound(D.characterMorphisms) then
    m:=Union(List(m,i->Orbit(tm,i,D.asCharacterMorphism)));
  fi;
  for i in m do
    RegisterNewCharacter(D,i);
  od;

  pcomp:=RowSpace(NullspaceMat(D.projectionMat*TransposedMat(D.modulars)),
                  D.field,List([1..D.klanz],i->D.field.zero));

  for i in [1..Length(D.raeume)] do
    r:=D.raeume[i];
    if ForAny(m,i->i in r) then
      if Dimension(r)=Length(r.generators[1]) then
        # trivial case: Intersection with full space in the beginning
        r:=pcomp;
      else
        r:=Intersection(pcomp,r);
      fi;
      r.dim:=Dimension(r);
      # note stabilizer
      if IsBound(D.raeume[i].stabilizer) then
        r.stabilizer:=D.raeume[i].stabilizer;
      fi;
      ActiveCols(r);
      D.raeume[i]:=r;
    fi;
  od;
  D.raeume:=Filtered(D.raeume,i->i.dim>0);
end;


#############################################################################
##
#F  DxLinearCharacters( <D> ) . . . .   calculate characters of G of degree 1
##
##  These characters are computed as characters of G/G'. This can be done
##  easily by using the fact, that an abelian group is direct product of
##  cyclic groups. Thus we get the characters as "direct products" of the
##  characters of cyclic groups, which can be easily computed. They are
##  lifted afterwards back to G.
##
DxLinearCharacters := function(D)
  local H,T,c,a,e,f,i,j,k,l,m,p,ch,el,ur,s,hom,gens,onc,G;
  G:=D.group;
  onc:=List([1..D.klanz],i->1);
  H:=CommutatorFactorGroup(G);
  e:=ShallowCopy(Elements(H));
  s:=Length(e); # Size(H)
  if s=1 then # perfekter Fall
    return [onc];
  else
    a:=Reversed(AbelianInvariants(H));
    gens:=[];
    T:=Subgroup(H,gens);
    for i in a do
      # was: m:=First(e,el->Order(H,el)=i);
      m:=First(e,
	  el->Order(H,el)=i and ForAll([2..Order(H,el)-1],i->el^i in e));
      T:=Closure(T,m);
      e:=Difference(e,Elements(T));
      Add(gens,m);
    od;
    e:=Elements(H);
    f:=List(e,i->[]);
    hom:=NaturalHomomorphism(G,H);
    for i in [1..D.klanz] do # create classimages
      Add(f[Position(e,Image(hom,D.conjugacyClasses[i].representative))],i);
   od;

    m:=Length(a);
    c:=List([1..m],i->[]);
    i:=m;
    # run through all Elements of H by trying every combination of the
    # generators
    p:=List([1..m],i->0);
    while i>0 do
      el:=H.identity; # Element berechnen
      for j in [1..m] do
        el:=el*gens[j]^p[j];
      od;
      ur:=f[Position(e,el)];
      for j in [1..m] do # all character values for this element
        ch:=E(a[j])^p[j];
        for l in ur do
          c[j][l]:=ch;
        od;
      od;
      while (i>0) and (p[i]=a[i]-1) do
        p[i]:=0;
        i:=i-1;
      od;
      if i>0 then
        p[i]:=p[i]+1;
        i:=m;
      fi;
    od;

    ch:=[];
    i:=m;
    # run through all characters trying every combination of the generators
    p:=List([1..m],i->0);
    while i>0 do
      # construct tensor product systematically
      el:=ShallowCopy(onc);
      for j in [1..m] do
        for k in [1..D.klanz] do
          el[k]:=el[k]*c[j][k]^p[j];
        od;
      od;
      Add(ch,[ShallowCopy(p),el]);
      while (i>0) and (p[i]=a[i]-1) do
        p[i]:=0;
        i:=i-1;
      od;
      if i>0 then
        p[i]:=p[i]+1;
        i:=m;
      fi;
    od;
    D.tensorMorphisms:=rec(a:=a,
                                 c:=c,
                                 els:=ch);

    return List(ch,i->i[2]);
  fi;
end;


#############################################################################
##
#F  ClassComparison(<c>,<d>)  . . . . . . . . . . . . compare classes c and d
##
##  comparison is based first on the size of the class and afterwards on the
##  order of the representatives. Thus the 1-Class is in the first position,
##  as required. Since sorting is primary by the class sizes, smaller
##  classes are in earlier positions, making the active columns those to
##  smaller classes, reducing the work for calculating class matrices!
##  Additionally galois conjugated classes are together, thus increasing the
##  chance, that with one columns of them active to be several acitive,
##  reducing computation time !
##
ClassComparison := function(c,d)
  if Size(c)=Size(d) then
    return Order(c.group,c.representative)<Order(d.group,d.representative);
  else
    return Size(c)<Size(d);
  fi;
end;


#############################################################################
##
#F  DxCalcPowerMap(<D>) . . . . . . .  calculate powermap for character table
#F                                                                D.charTable
##
DxCalcPowerMap := function(D)
  local primes,classes,class,i,j,p,ex,primeClasses,cl,pi,C;
  C:=D.charTable;
  primes:=Set(Filtered([1..Maximum(C.orders)],IsPrime));
  classes:=[1..D.klanz];
  for pi in [1..Length(primes)] do
    p:=primes[pi];
    if not IsBound(C.powermap[p]) then
      # calculate approximation of powermap
      C.powermap[p]:=InitPowermap(C,p);
      for i in classes do
        if not IsInt(C.powermap[p][i]) then
          cl:=i;
          ex:=p mod C.orders[i];
          if ex>C.orders[i]/2 then
            # can we get it cheaper via the inverse
            ex:=AbsInt(C.orders[i]-ex);
            cl:=C.inversemap[i];
          fi;
          if ex<p or (ex=p and IsInt(C.powermap[p][cl])) then
            C.powermap[p][i]:=DxPowerClass(D,cl,ex);
          fi;
        fi;
      od;
      for i in classes do
        if not IsInt(C.powermap[p][i]) then
            C.powermap[p][i]:=D.ClassElement(D,
          D.conjugacyClasses[i].representative^(p mod C.orders[i]));
          # note following powers: (x^a)^b=(x^b)^a
          for j in [1..pi-1] do
            cl:=C.powermap[primes[j]][i];
            if cl>i then
              C.powermap[p][cl]:=C.powermap[primes[j]][C.powermap[p][i]];
            fi;
          od;
        fi;
      od;
    fi;
  od;
  primeClasses:=[];
  for i in classes do
    primeClasses[i]:=[];
    class:=i;
    j:=1;
    while class>1 do
      if class<>i then
        Unbind(classes[class]);
      fi;
      primeClasses[i][j]:=class;
      j:=j+1;
      class:=DxPowerClass(D,i,j);
    od;
  od;
  D.primeClasses:=[];
  for i in classes do
    Add(D.primeClasses,primeClasses[i]);
  od;
  D.primeClasses[1]:=[1];
end;


#############################################################################
##
#F  DxPowerClass(<D>,<cl>,<pow>)  . . . . . . . . . . . . . evaluate powermap
##
DxPowerClass := function(D,nu,power)
  local p,primes,cl;
  cl:=nu;
  power:=power mod D.charTable.orders[cl];
  if power=0 then
    return 1;
  elif power=1 then
    return cl;
  else
    primes:=Factors(power);
    for p in primes do
      if not IsBound(D.charTable.powermap[p]) then
        return D.ClassElement(D,
          D.conjugacyClasses[nu].representative^power);
      else
        cl:=D.charTable.powermap[p][cl];
      fi;
    od;
    return cl;
  fi;
end;


#############################################################################
##
#F  SplitStep(<D>,<bestMat>)  . . . . . .  calculate matrix bestMat as far as
#F                                                    needed and split spaces
##
SplitStep := function(D,bestMat)
  local raeume,base,M,bestMatCol,bestMatSplit,i,j,k,N,row,col,Row,o,dim,
        newRaeume,raum,ra,f,activeCols,eigenbase,eigen,v,vo,gens;

  if not bestMat in D.matrices then
    Error("matrix <bestMat> not indicated for splitting");
  fi;

  k:=D.klanz;

  f:=D.field;
  o:=f.one;
  raeume:=D.raeume;

  if ForAny(raeume,i->i.dim>1) then
    bestMatCol:=D.requiredCols[bestMat];
    bestMatSplit:=D.splitBases[bestMat];
    M:=IdentityMat(k,1)*0;
    InfoCharTable1("#I  Matrix ",bestMat,", Representative of Order ",
       Order(D.group,D.conjugacyClasses[bestMat].representative),
       ", Centralizer: ",Size(D.conjugacyClasses[bestMat].centralizer),
       "\n");

    Add(D.yetmats,bestMat);
    for col in bestMatCol do
      InfoCharTable2("#I  Computing column ",col,": ");
      D.ClassMatrixColumn(D,M,bestMat,col);
      InfoCharTable2("\n");
    od;

    M:=M*o;

    # note, that we will have calculated yet one!
    D.maycent:=true;

    newRaeume:=[];
    SubtractSet(D.matrices,[bestMat]);
    for i in bestMatSplit do
      raum:=raeume[i];
      base:=Base(raum);
      dim:=Length(base);
      activeCols:=raum.activeCols;
      N:=0*IdentityMat(dim,o);
      for row in [1..dim] do
        Row:=base[row]*M;
        for col in [1..dim] do
          N[row][col]:=Row[activeCols[col]];
        od;
      od;
      eigen:=Eigenbase(N,f);
      # Base umrechnen
      eigenbase:=List(eigen.base,i->List(i,j->j*base));
    #eigenvalues:=List(eigen.values,i->i/Size(D.conjugacyClasses[bestMat]));

      if Length(eigenbase)=1 then
        InfoCharTable1("#W This should not happen !\n");
        Add(newRaeume,raum);
      else
        ra:=List(eigenbase,i->RowSpace(i,f));

        # throw away Galois-images
        for i in [1..Length(ra)] do
          if IsBound(ra[i]) then
            vo:=Orbit(raum.stabilizer,ra[i].generators[1],
                     D.asCharacterMorphism);
            for v in vo do
              for j in [i+1..Length(ra)] do
                if IsBound(ra[j])
                  # In characteristic p the split may be
	          # not as well, as in characteristic 0. In this
		  # case, we may find a smaller image in another space.
                  # As (charactermorphisms are a group!) we will also
		  # have the inverse image of the complement, we can
		  # thow away the space, without doing harm!
		  # the only ugly disadvantage is, that we will have to
		  # do some more inclusion tests.
		  and Dimension(ra[i])<=Dimension(ra[j])
                  and v in ra[j] then
		    Unbind(ra[j]);
                fi;
              od;
            od;
          fi;
        od;
        for i in ra do
          Base(i); # force computation of base
          i.dim:=Dimension(i);
          if IsBound(raum.stabilizer) then
            i.approxStab:=raum.stabilizer;
          fi;
          Add(newRaeume,i);
        od;
      fi;
    od;
    for i in [1..Length(raeume)] do
      if not i in bestMatSplit then
        Add(newRaeume,raeume[i]);
      fi;
    od;
    raeume:=newRaeume;
  fi;

  for i in [1..Length(raeume)] do
    if raeume[i].dim>1 then
      ActiveCols(raeume[i]);
    fi;
  od;

  InfoCharTable1("#I  Dimensions: ",List(raeume,i->i.dim),"\n");
  D.raeume:=raeume;
end;


#############################################################################
##
#F  SplitTwoSpace(<D>,<raum>) . . . split two-dim space by combinatoric means
##
##  If the room is 2-dimensional, this is ment to be the standard split.
##  Otherwise, the two-dim invariant space of raum is to be split
##
SplitTwoSpace := function(D,raum)
  local v1,v2,v1v1,v1v2,v2v1,v2v2,degrees,d1,d2,deg2,prime,o,f,d,degrees2,f,
        lift,root,p,q,n,char,char1,char2,a1,a2,i,j,NotFailed,k,l,m,test,ol,
        di,rp,mdeg2,mult;

  mult:=Index(D.characterMorphisms,CharacterMorphismOrbits(D,raum).stabilizer);
  f:=Dimension(raum)=2; # space or invariant space split indicator flag
  prime:=D.prime;
  rp:=Int(prime/2);
  o:=D.fone;
  if f then
    v1:=Base(raum)[1];
    v2:=raum.base[2];
    ol:=[1];
  else
    InfoCharTable1("#I  Attempt:",Dimension(raum),"\n");
    v1:=raum.invariantbase[1];
    v2:=raum.invariantbase[2];
    ol:=Filtered(DivisorsInt(Size(raum.stabilizer)),i->i<raum.dim/2+1);
  fi;
  v1v1:=ModProduct(D,v1,v1);
  v1v2:=ModProduct(D,v1,v2);
  v2v1:=ModProduct(D,v2,v1);
  v2v2:=ModProduct(D,v2,v2);
  char:=[];
  char2:=[];
  NotFailed:=true;
  di:=1;
  while di<=Length(ol) and NotFailed do
    d:=ol[di];
    degrees:=DegreeCandidates(D,d*mult);
    if f then
      degrees2:=degrees;
    else
      degrees2:=DegreeCandidates(D,(raum.dim-d)*mult);
    fi;
    mdeg2:=List(degrees2,i->i mod prime);
    i:=1;
    while i<=Length(degrees) and NotFailed do
      lift:=true;
      d1:=degrees[i];
      if d1*d>rp then
        lift:=false;
      fi;
      p:=(v2v1+v1v2)/v2v2;
      q:=(v1v1-o/(d*(d1^2) mod D.prime))/v2v2;
      for root in ModRoots((p/2)^2-q) do
        a1:=(-p/2+root);
        n:=v1v2+a1*v2v2;
        if (n=0*o) then
          # proceeding would force a division by zero
          NotFailed:=false;
        else
          a2:=-(v1v1+a1*v2v1)/n;
          n:=v1v1+a2*(v1v2+v2v1)+a2^2*v2v2;
          if n<>0*o then
            deg2:=List(ModRoots(o/(raum.dim-d)/n),IntFFE);
            for d2 in deg2 do
              if d2 in mdeg2 then
                if not d2 in degrees2 or d2*(raum.dim-d)>rp then
                  # degree is too big for lifting
                  lift:=false;
                fi;
                char1:=[d*d1*(v1+a1*v2),(raum.dim-d)*d2*(v1+a2*v2)];

                if Length(char)>0 and
                  (char[1].base[1]=char1[2]) and
                  (char[2].base[1]=char1[1]) then
                    test:=false;
                else
                  test:=true;
                fi;
                l:=1;
                while (l<3) and test do
                  if f then
                    n:=1;
                  elif l=1 then
                    n:=d;
                  else
                    n:=raum.dim-d;
                  fi;
                  if not FrobSchurInd(D,char1[l]) in o*[-n..n]
                    then test:=false;
                  fi;
		  m:=DxLiftCharacter(D,char1[l]);
		  char2[l]:=m;
                  if test and lift then
                    for k in [2..Length(m)] do
                      if IsInt(m[k]) and AbsInt(m[k])>m[1] then
                        test:=false;
                      fi;
                    od;
                    if test and not IsInt(Sum(m)) then
                      test:=false;
                    fi;
                  fi;
                  l:=l+1;
                od;

                if test then
                  if Length(char)>0 then
                    NotFailed:=false;
                  else
                    char:=[rec(base:=[char1[1]],
			       char:=[char2[1]],
                               d:=d),
                           rec(base:=[char1[2]],
			       char:=[char2[2]],
                               d:=raum.dim-d)];
                  fi;
                fi;
              fi;
            od;
          fi;
        fi;
      od;
      i:=i+1;
    od;
    di:=di+1;
  od;
  if f then
    InfoCharTable1("#I  Two-dim ");
  else
    InfoCharTable1("#I  Two orbit ");
  fi;
  if NotFailed then
    InfoCharTable1("space split\n");
    return char;
  else
    InfoCharTable1("split failed\n");
    raum.twofail:=true;
    return [];
  fi;
end;


#############################################################################
##
#F  DxLiftCharacter(<D>,<modChi>) . recalculate character in characteristic 0
##
DxLiftCharacter := function(D,modular)
  local modularChi,Chi,zeta,degree,sum,M,y,l,s,n,j,p,polynom,Chipolynom,
        family,prime;
  prime:=D.prime;
  modularChi:=List(modular,IntFFE);
  degree:=modularChi[1];
  Chi:=[degree];
  for family in D.primeClasses do
    # we need to compute the polynomial only for prime classes. Powers are
    # obtained by simpy inserting powers in this polynomial
    j:=family[1];
    l:=Order(D.group,D.conjugacyClasses[j].representative);
    zeta:=E(l);
    polynom:=[degree,modularChi[j]];
    for n in [2..l-1] do
      s:=family[n];
      polynom[n+1]:=modularChi[s];
    od;
    Chipolynom:=[];
    s:=0;
    sum:=degree;
    while sum>0 do
      M:=ModularValuePol(polynom,
                         PowerModInt(D.z,-s*Exponent(D.group)/l,prime),
                         #PowerModInt(D.z,-s*D.irrexp/l,prime),
                         prime)/l mod prime;
      Add(Chipolynom,M);
      sum:=sum-M;
      s:=s+1;
    od;
    for n in [1..l-1] do
      s:=family[n];
      if not IsBound(Chi[s]) then
        Chi[s]:=ValuePol(Chipolynom,zeta^n);
      fi;
    od;
  od;
  return Chi;
end;


#############################################################################
##
#F  GeneratePrimeCyclotomic( <e>, <r> ) . . . . . . . . .  ring homomorphisms
##
##  $\Q(\varepsilon_e)\to\F_p$. r is e-th root in F_p.
##
GeneratePrimeCyclotomic := function(e,r) # exponent, Primitive Root
  return function(a)
  local l,n,w,s,i,o;
    l:=COEFFSCYC(a);
    n:=Length(l);
    o:=r^0;
    w:=0*o;
    s:=r^(e/n); # calculate corresponding power of modular root of unity
   for i in [1..n] do
      if i=1 then
        w:=w+l[i]*o;
      else
        w:=w+s^(i-1)*l[i];
      fi;
    od;
    return w;
  end;
end;


#############################################################################
##
#F  ModProduct(<D>,<vector1>,<vector2>) . . . product of two characters mod p
##
ModProduct := function(D,v1,v2)
  local prod,i;
  prod:=0*D.fone;
  for i in [1..D.klanz] do
    prod:=prod+ (Size(D.conjugacyClasses[i]) mod D.prime)*v1[i]
		*v2[D.charTable.inversemap[i]];
  od;
  prod:=prod/(D.group.size mod D.prime);
  return prod;
end;


#############################################################################
##
#F  ModularCharacterDegree(<D>,<Chi>) . . . . . . . . .  degree of normalized
#F                                                         character modulo p
##
ModularCharacterDegree := function(D,chi)
  local j,j1,d,sum,prime;
  prime:=D.prime;
  sum:=0*D.fone;
  for j in [1..D.klanz] do
    j1:=D.charTable.inversemap[j];
    sum:=sum+chi[j]*chi[j1]*(Size(D.conjugacyClasses[j]) mod prime);
  od;
  d:=RootMod(D.group.size/IntFFE(sum) mod prime,prime);
  # take correct (smaller) root
  if 2*d>prime then
    d:=prime-d;
  fi;
  return d;
end;


#############################################################################
##
#F  DegreeCandidates(<D>,[<anz>]) . . Potential degrees for anz characters of
#F     same degree, if num characters of total degree deg are yet to be found
##
DegreeCandidates := function(arg)
  local D,anz,degrees,divisors,i,r;
  D:=arg[1];
  if Length(arg)>1 then
    anz:=arg[2];
    degrees:=[];
    if Length(D.degreePool)=0 then 
      return [];
    fi;
    r:=RootInt(Int((D.deg-(D.num-anz)*D.degreePool[1][1]^2)/anz));
    i:=1;
    while i<=Length(D.degreePool) and D.degreePool[i][1]<=r do
      if D.degreePool[i][2]>anz then
	Add(degrees,D.degreePool[i][1]);
      fi;
      i:=i+1;
    od;
    return degrees;
  else
    return List(D.degreePool,i->i[1]);
  fi;
end;


#############################################################################
##
#F  FrobSchurInd( <D>, <char> ) . . . . . . modular Frobenius-Schur indicator
##
FrobSchurInd := function(D,char)
  local FSInd,classes,l,ll,L,family;
  FSInd:=char[1];
  classes:=[2..D.klanz];
  for family in D.primeClasses do
    L:=Length(family)+1;
    for l in [1..L-1] do
      if family[l] in classes then
        ll:=2*l mod L;
        if ll=0 then
          FSInd:=FSInd+(Size(D.conjugacyClasses[family[l]]) mod D.prime)
		       *char[1];
        else
          FSInd:=FSInd+(Size(D.conjugacyClasses[family[l]]) mod D.prime)
		       *char[family[ll]];
       fi;
        SubtractSet(classes,[family[l]]);
      fi;
    od;
  od;
  return FSInd/(D.group.size mod D.prime);
end;


#############################################################################
##
#F  BestSplittingMatrix(<D>) . number of the matrix, that will yield the best
#F                                                                      split
##
##  This routine calculates also all required columns etc. and stores the
##  result in D
##
BestSplittingMatrix := function(D)
  local n,dim,i,val,b,requiredCols,splitBases,wert,nu,r,rs,rc,bn,bw,split,
        orb,os;

  nu:=D.field.zero;
  requiredCols:=[];
  splitBases:=[];
  wert:=[];
  os:=ForAll(D.raeume,i->i.dim<20); #only small spaces left?

  for n in D.matrices do
    requiredCols[n]:=[];
    splitBases[n]:=[];
    wert[n]:=0;
    # dont start with central classes in small groups!
    if D.charTable.classes[n]>1 or IsBound(D.maycent) then
      for i in [1..Length(D.raeume)] do
        r:=D.raeume[i];
        if IsBound(r.splits) then
          rs:=r.splits;
        else
          rs:=[];
          r.splits:=rs;
        fi;

        if r.dim>1 then

          if IsBound(rs[n]) then
            split:=rs[n].split;
            val:=rs[n].val;
          else
            b:=Base(r);
            split:=ForAny(Sublist(b,[2..r.dim]),i->i[n]<>nu);
	    if split then
	      if r.dim<4 then
		# very small spaces will split nearly perfect
		val:=8;
	      else
		bn:=SplitDegree(D,r,n);
		if os then
		  if D.group.isPerfect then
		    # G is perfect, no linear characters
		    # we can't predict much about the splitting
		    val:=Maximum(1,9-r.dim/bn);
		  else
		    val:=bn*Maximum(1,9-r.dim/bn);
		  fi;
		else
		  val:=bn;
		fi;
	      fi;
	      # note the images, which split as well
	      val:=val*Index(D.characterMorphisms,
			     CharacterMorphismOrbits(D,r).stabilizer);
            else
	      val:=0;
	    fi;
            rs[n]:=rec(split:=split,val:=val);
          fi;
          if split then
            wert[n]:=wert[n]+val;
            Add(splitBases[n],i);
            requiredCols[n]:=Union(requiredCols[n],
                                    D.raeume[i].activeCols);
          fi;
        fi;
      od;
      if Length(splitBases[n])>0 then
        # can we use Galois-Conjugation
        orb:=GaloisOrbits(D,n);
        rc:=[];
        for i in requiredCols[n] do
          rc:=Union(rc,[orb.orbits[i][1]]);
        od;

        wert[n]:=wert[n]*Size(D.conjugacyClasses[n].centralizer) # *G/|K|
                 /(Length(rc)); # We count -mistakening - also the first
	   # column, that is availiable for free. Its "costs" are ment to
	   # compensate for the splitting process.
      fi;
    fi;
  od;

  for r in D.raeume do
    if Number(r.splits)=1 then
      # is room split by only ONE matrix?(then we need this sooner or later)
      n:=PositionProperty(r.splits,IsBound);
      wert[n]:=wert[n]*10; #arbitrary increase of value
    fi;
  od;

  bn:=D.matrices[1];
  bw:=0;
  InfoCharTable2("#I  ");
  for n in D.matrices do
    InfoCharTable2(n,":",Int(wert[n])," ");
    if wert[n]>=bw then
      bn:=n;
      bw:=wert[n];
    fi;
  od;
  InfoCharTable2("\n");
  D.requiredCols:=requiredCols;
  D.splitBases:=splitBases;

  return bn;
end;


#############################################################################
##
#F  SplitDegree( <D>, <space>, <r> )  estimate number of parts when splitting
##                space with matrix number r, according to charactermorphisms
##
SplitDegree := function(D,space,r)
  local a,b,s,o,fix,k,l,i,j,gorb,v,w;
  # is perfect split guaranteed ?
  if IsBound(space.split) then
    return space.split;
  fi;
  o:=D.fone;
  a:=CharacterMorphismOrbits(D,space);
  if a.number=space.dim then
    return 2; #worst possible split
  fi;
  if a.number=1 and IsPrime(space.dim) then
    # spaces of prime dimension with one orbit must split perfectly
    space.split:=space.dim;
    return space.dim;
  fi;
  # both cases, but MultiOrbit is not as effective
  s:=a.stabilizer;
  b:=a.invariantbase;
  gorb:=D.galoisOrbits[r];
  fix:=Length(gorb)=1;
  if not fix then
    # Galoisgroup operates trivial ? (seen if constant values on 
    # rational class)
    i:=1;
    fix:=true;
    while fix and i<=Length(space.base) do
      v:=space.base[i];
      w:=v[r];
      for j in gorb do
        if v[j]<>w then
          fix:=false;
        fi;
      od;
      i:=i+1;
    od;
  fi;
  if fix then
    #l:=List(s.generators,i->i.tens[r]);
    l:=List(s.generators,i->D.asCharacterMorphism(1,i).tens[r]);
    v:=[o];
    for i in v do
      for j in l do
        w:=i*j;
        if not w in v then
          Add(v,w);
        fi;
      od;
    od;
    return Length(v); #Length(Set(List(Elements(s),i->i.tens[r])));
  else
    # nonfix
    # v is an element from the space with non-galois-fix parts.
    l:=Maximum(List(TransposedMat(List(Orbit(s,v,D.asCharacterMorphism),
               i->Sublist(i,D.galoisOrbits[r]))),i->Length(Set(i))));
    if a.number=1 then
# One orbit: number of resultant spaces must be a divisor of the dimension
      k:=DivisorsInt(space.dim);
      while l<space.dim and not l in k do
        l:=l+1;
      od;
    fi;
    return l;
  fi;
end;


#############################################################################
##
#F  CharacterMorphismGroup( <D> ) . . . . create group of character morphisms
##
##  The group is stored in .characterMorphisms. It is an AgGroup,
##  according to the decomposition K=tens:gal as semidirect product. The
##  group works as linear mappings that permute characters via the operation
##  .asCharacterMorphism.
##
CharacterMorphismGroup := function(D)
  local C,e,gens,rels,p,gals,f,er,tm,tme,i,j,k,l,offset,op,ob,o,tl,komm,el,h;
  C:=D.charTable;
  p:= AgGroup( C.galomorphisms );
  gals:=List(p.generators,i->Image(p.bijection,i));
  # obtain Ag presentation for galois part
  f:=AgGroupOps.FpGroup(p,"g");
  gens:=f.generators;
  rels:=f.relators;

  if IsBound(D.tensorMorphisms) then
    er:=[1..D.klanz];
    tm:=D.tensorMorphisms;
    tme:=tm.els;
    # create generators and decompose orders in prime powers
    for i in [1..Length(tm.a)] do
      op:=Factors(tm.a[i]);
      gens:=Concatenation(gens,List([1..Length(op)],j->AbstractGenerator(
              ConcatenationString(String(i),"t",String(j)))));
      ob:=op[1];
      for j in tme do
        j[1][i]:=Reversed(PadicInt(j[1][i],Length(op),ob));
      od;
    od;
    # remove iterated lists in the p-adic part
    for i in tme do
      e:=[];
      for j in i[1] do
        e:=Concatenation(e,j);
      od;
      i[1]:=e;
    od;

    tl:=Length(gens)-Length(gals);

    offset:=Length(gals);
    for i in [1..Length(tm.a)] do
      # decompose each generator (which has prime power order, since
      # obtained via 'AbelianInvariants') in power parts.
      o:=tm.a[i];
      e:=tm.c[i];
      op:=Factors(o);
      ob:=op[1];
      op:=Length(op);
      for j in [offset+1..offset+op] do
        # first generator is original tensor generator, the following ones
        # are its images
        if j<offset+op then
          Add(rels,gens[j]^ob/gens[j+1]);
        else
          Add(rels,gens[j]^ob);
        fi;

        # Add relators for operation of galois part on tensor part
        el:=[]; # compute representative for AgGenerator -> power
        for k in er do
          el[k]:=e[k]^(ob^(j-1-offset));
        od;
        for k in [1..Length(gals)] do
          h:=Permuted(ShallowCopy(el),gals[k]);
          for l in er do
            h[l]:=el[l]^(-1)*h[l];
          od;
          l:=1;
          while tme[l][2]<>h do
            l:=l+1;
          od;
          h:=tme[l][1];
          komm:=IdWord;
          for l in [1..tl] do
            komm:=komm*gens[Length(gals)+l]^h[l];
          od;

          Add(rels,Comm(gens[j],gens[k])/komm);
        od;
      od;
      offset:=offset+op;
    od;
    for i in tme do
      # store modular tensor part
      i[3]:=List(i[2],j->D.modularMap(j));
    od;
  else
    tme:=[[[],List(D.conjugacyClasses,i->1),
              List(D.conjugacyClasses,i->D.fone)]];
  fi;
  tm:=AgGroupFpGroup(rec(generators:=gens,
                         relators:=rels));
  D.characterMorphisms:=tm;
  D.asCharacterMorphism:=AsCharacterMorphismFunction(gals,tme);
  D.tensorMorphisms:=tme;
  return tm;
end;


#############################################################################
##
#F  AsCharacterMorphismFunction( <gals>, <tensormorphisms>)  create operation
#F                               function for operation of charactermorphisms
##
AsCharacterMorphismFunction := function(gals,tme)
  local i,j,k,x,g,c,lg;
  lg:=Length(gals);
  return function(p,e)
    x:=ExponentsAgWord(e);
    g:=();
    for i in [1..lg] do
      g:=g*gals[i]^x[i];
    od;
    x:=Sublist(x,[lg+1..Length(x)]);
    i:=1;
    while tme[i][1]<>x do
      i:=i+1;
    od;
    x:=tme[i][3];
    if IsInt(p) then # integer works only as indicator: return galois and
                     # tensor part
      return rec(gal:=g,
                 tens:=x);
    elif IsList(p) then
      if not IsFFE(p[1]) then
        # operation on characteristic 0 characters;
        x:=tme[i][2];
      fi;
      c:=[];
      for i in [1..Length(p)] do
        j:=i^g;
        c[j]:=p[i]*x[j];
      od;
      return c;
    else # RowSpace
      c:=List(p.generators,i->[]);
      for i in [1..Length(p.zero)] do
        j:=i^g;
        for k in [1..Length(p.generators)] do
          c[k][j]:=p.generators[k][i]*x[j];
        od;
      od;

    # simulate: RowSpace(gens,a.field);
      return rec(generators:=c,
                 field:=p.field,
                 zero:=p.zero,
                 isDomain:=true,
                 isVectorSpace:=true,
                 isRowSpace:=true,
                 isFinite:=true,
                 operations:=RowSpaceOps);

    fi;
  end;
end;


#############################################################################
##
#F  CharacterMorphismOrbits( <D>, <space> ) . . stabilizer and invariantspace
##
CharacterMorphismOrbits := function(D,space)
  local a,b,s,o,gen;
  if not IsBound(space.stabilizer) then
    if IsBound(space.approxStab) then
      a:=space.approxStab;
    else
      a:=D.characterMorphisms;
    fi;
    space.stabilizer:=Stabilizer(a,space,D.asCharacterMorphism);
  fi;
  if not IsBound(space.invariantbase) then
    o:=D.fone;
    s:=space.stabilizer;
    b:=Base(space);
    a:=ActiveCols(space);
    # calculate invariant space as intersection of E.S to E.V. 1
    for gen in s.generators do
      b:=NullspaceMat(List(b,i->Sublist(D.asCharacterMorphism(i,gen),a))
                       -IdentityMat(Length(b),o))*b;
      TriangulizeMat(b);
      a:=ActiveCols(b);
    od;
    space.invariantbase:=b;
  fi;
  return rec(invariantbase:=space.invariantbase,
             number:=Length(space.invariantbase),
             stabilizer:=space.stabilizer);
end;


#############################################################################
##
#F  GaloisOrbits(<D>,<f>) .  orbits of Stab_Gal(f) when acting on the classes
##
GaloisOrbits := function(D,f)
  local i,k,l,u,h,ga,galOp,p;
  k:=Length(D.conjugacyClasses);
  if not IsBound(D.galOp[f]) then
    galOp:=D.galOp;
    if f in PermGroupOps.MovedPoints( D.charTable.galomorphisms ) then
      ga:= Stabilizer( D.charTable.galomorphisms, f );
    else
      ga:= D.charTable.galomorphisms;
    fi;
    p:=true;
    i:=1;
    while p and i<=Length(galOp) do
      if IsBound(galOp[i]) and
         galOp[i].group=ga then
          galOp[f]:=galOp[i];
          p:=false;
      else
        i:=i+1;
      fi;
    od;
    if p then
      galOp[f]:=rec(group:=ga);
      l:=List([1..k],i->Set(Orbit(ga,i)));
      galOp[f].orbits:=l;
      u:=List(Filtered(Collected(
        List(Set(List(l,i->i[1])),j->D.rids[j])),n->n[2]=1),t->t[1]);
      galOp[f].uniqueIdentifications:=u;
      galOp[f].identifees:=Filtered([1..k],i->D.rids[i] in u);
    fi;
  fi;
  return D.galOp[f];
end;


#############################################################################
##
#F  RootsOfPol(<pol>) . . . . . . . . . . . . . . . . . roots of a polynomial
##
RootsOfPol := function(f)
  local roots,factor;
  roots:=[];
  for factor in Factors(f) do
    if EuclideanDegree(factor)=1 then
      # work around new representation of polynomials
      if factor.valuation=0 then
	Add(roots,-factor.coefficients[1]);
      else
	Add(roots,0*factor.coefficients[1]);
      fi;
    fi;
  od;
  return roots;
end;


#############################################################################
##
#F  ModRoots(<n>) . . . . . . . . . computes, if possible, the roots of FFE n
##
ModRoots := function(n)
  local r,f,e;
  if n=0*n then
    return [n];
  fi;
  e:=LogFFE(n)/2;
  if IsInt(e) then
    r:=Z(CharFFE(n)^DegreeFFE(n))^e;
    return Set([r,-r]);
  else
    return [];
  fi;
end;


#############################################################################
##
#F  ModularValuePol( <f>, <x>, <p> )  . evaluate polynomial at a point, mod p
##
##  'ModularValuePol' returns the value of the polynomial <f> at <x>,
##  regarding the result modulo p. <x> must be an integer number.
##
##  'ModularValuePol' uses Horners rule to evaluate the polynom.
##
ModularValuePol := function ( f, x,p )
  local  value, i;
  value := 0;
  i := Length(f);
  while i > 0  do
    value := (value * x + f[i]) mod p;
    i := i-1;
  od;
  return value;
end;


############################################################################
##
#F  BMminpol(<seq>,<p>) . . . . . . . . . . . . .  Berlekamp-Massey Algorithm
##
##  calculate minimal polynomial of the linear homogenous recurring
##  sequence <seq> modulo <p>
##  Lit.: Lidl/Niederreiter: Finite Fields, Ch. 8
##
BMminpol := function(seq,f)
  local M,newg,k,m,g,h,b,r,i,l,j,o,z,mi;
  k:=QuoInt(Length(seq),2);
  o:=f.one;
  z:=f.zero;
  g:=[o];
  h:=[z,o];
  m:=0;
  for i in [1..2*k] do
    b:=z;
    # compute coefficient in product without computing the product itself
    for j in [1..i] do
      if Length(g)>=i-j+1 then
        b:=b+seq[j]*g[i-j+1];
      fi;
    od;
    if b<>z then
      # newg:=limo(DifferencePol(g,b*h),prime);
      mi:=Minimum(Length(g),Length(h));
      newg:=[];
      newg[mi]:=z;
      for j in [1..mi] do
        newg[j]:=g[j]-b*h[j];
      od;
      if Length(g)>Length(h) then
        for j in [mi+1..Length(g)] do
          newg[j]:=g[j];
        od;
      elif Length(g)<Length(h) then
        for j in [mi+1..Length(h)] do
          newg[j]:=-b*h[j];
        od;
      else
        while newg[Length(newg)]=z do
          Unbind(newg[Length(newg)]);
        od;
      fi;
    else
      newg:=g;
    fi;
    if(b<>z)and(m>=0)then
      h:=Concatenation([z],b^(-1)*g);
      m:=-m;
    else
      h:=Concatenation([z],h);
      m:=m+1;
    fi;
    g:=newg;
  od;
  l:=Length(g);
  r:=QuoInt(2*k+1-m,2);
  M:=[];
  for i in [l..r] do
    Add(M,z);
  od;
  for i in [0..l-1] do
    Add(M,g[l-i]);
  od;
  return Polynomial(f,M);
end;


#############################################################################
##
#F  KrylovSequence(<vec>,<mat>) . . . . . . . . list of images of <vec> under
#F                                                    multiplication by <mat>
##
KrylovSequence := function(w,A)
  local i,l,k;
  k:=Length(A);
  l:=[w];
  for i in [1..2*k] do
    w:=w*A;
    Add(l,w);
  od;
  return l;
end;


#############################################################################
##
#F  Eigenbase(<mat>,<base>,<o>) . . . . . components of Eigenvects resp. base
##
Eigenbase := function(M,f)
  local dim,v,w,i,k,KS,scalarSeq,eigenvalues,base,minpol,bases;
  k:=Length(M);
  repeat
    repeat
      w:=List([1..k],x->Random(f));
    until w<>0*w;
    repeat
      v:=List([1..k],x->Random(f));
    until v<>0*v;
    KS:=KrylovSequence(w,M);
    scalarSeq:=[];
    for i in [1..2*k+1] do
      scalarSeq[i]:=KS[i]*v;
    od;
    minpol:=BMminpol(scalarSeq,f);
    eigenvalues:=Set(RootsOfPol(minpol));
    dim:=0;
    bases:=[];
    for i in eigenvalues do
      base:=NullspaceMat(M-i*M^0);
      if base=[] then
        Error("This can`t happen: Wrong Eigenvalue ???");
      else
        #TriangulizeMat(base);
        dim:=dim+Length(base);
        Add(bases,base);
      fi;
    od;
    if dim<k then
      InfoCharTable2("#I  Failed to calculate eigenspaces.\n");
    fi;
  until dim=k;
  return rec(base:=bases,
             values:=eigenvalues);
end;


#############################################################################
##
#F  ActiveCols(<space|base>)  . . . . . . . . active columns of space or base
##
ActiveCols := function(raum)
  local base,activeCols,j,n,l;
  activeCols:=[];
  if IsRec(raum) then
    n:=raum.field.zero;
    if IsBound(raum.activeCols) then
      return raum.activeCols;
    fi;
    base:=Base(raum);
  else
    n:=Field(raum[1]).zero;
    base:=raum;
  fi;
  l:=1;
  for j in [1..Length(base)] do
    while base[j][l]=n do
      l:=l+1;
    od;
    Add(activeCols,l);
  od;
  if IsRec(raum) then
    raum.activeCols:=activeCols;
  fi;
  return activeCols;
end;


#############################################################################
##
#F  PadicInt( <n>, <len>, <b> ) . . . . . . . . . . . . . convert n to base b
##
##  n is converted in a list of exponents in base b, maximum length len
##  (thus taking m mod b^len).
##
PadicInt := function(n,l,b)
  local i,p;
  p:=[];
  for i in [1..l] do
    p[l-i+1]:=RemInt(n,b);
    n:=QuoInt(n,b);
  od;
  return p;
end;


#############################################################################
##
#F  ClassElementLargeGroup(D,<el>)  . . . . . identify class of el in D.group
##
##  First, the (hopefully) cheap identification is used, to filter the
##  possible classes. If still not unique, a hard conjugacy test is applied
##
ClassElementLargeGroup := function(D,el)
  local possible,structure,i,id;
  id:=D.identification(D,el);
  possible:=Filtered([1..D.klanz],i->D.ids[i]=id);
  i:=1;
  while i<Length(possible) do
    if el in D.conjugacyClasses[possible[i]] then
      return possible[i];
    else
      i:=i+1;
    fi;
  od;
  return possible[i];
end;


#############################################################################
##
#F  ClassElementSmallGroup( <D>, <el> ) . . . identify class of el in D.group
##
##  Since we have stored the complete classmap, this is done by simply
##  looking the class number up in this list.
##
ClassElementSmallGroup := function(D,el)
  return D.classMap[D.group.enumeration.number(D.group.enumeration,el)];
end;


#############################################################################
##
#F  DoubleCentralizerOrbit( <D>, <c1>, <c2> )
##
##  Let g_i be the representative of Class i.
##  Compute orbits of C(g_2) on (g_1^(-1))^G. Since we want to evaluate
##  x^(-1)*z for x\in Cl(g_1), and we only need the class of the result, we
##  may conjugate with z-centralizing elements and still obtain the same
##  results! The orbits are calculated either by simple orbit algorithms or
##  whenever they might become bigger using double cosets of the
##  centralizers.
##
DoubleCentralizerOrbit := function(D,c1,c2)
  local often,trans,e,neu,i,inv,cent,l,s,s1,x;
  inv:=D.charTable.inversemap[c1];
  s1:=D.charTable.classes[c1];
  # criteria for using simple orbit part: only for small groups, note that
  # computing ascending chains can be very expensive.
  if s1<500 or
     (not IsBound(D.conjugacyClasses[inv].centralizer.ascendingChain)
        and s1<1000)

  then
    if D.currentInverseClassNo<>c1 then
      D.currentInverseClassNo:=c1;
      # compute (x^(-1))^G
      D.currentInverseClass:=Orbit(D.group,
                           D.conjugacyClasses[inv].representative);
    fi;
    trans:=[];
    cent:=D.conjugacyClasses[c2].centralizer;
    for e in D.currentInverseClass do
      neu:=true;
      i:=1;
      while neu and (i<=Length(trans)) do
        if e in trans[i] then neu:=false;
        fi;
        i:=i+1;
      od;
      if neu then
        Add(trans,Orbit(cent,e));
      fi;
    od;
    often:=List(trans,i->Length(i));
    return [List(trans,i->i[1]),often];
  else
    InfoCharTable2("using DoubleCosets; ");
    cent:=D.conjugacyClasses[inv].centralizer;
    l:=DoubleCosets(D.group,cent,D.conjugacyClasses[c2].centralizer);
    s1:=Size(cent);
    e:=[];
    s:=[];
    x:=D.conjugacyClasses[inv].representative;
    for i in l do
      Add(e,x^i.representative);
      Add(s,Size(i)/s1);
    od;
    return [e,s];
  fi;
end;


#############################################################################
##
#F  StandardClassMatrixColumm(<D>,<mat>,<r>,<t>)  . calculate the t-th column
#F       of the r-th class matrix and store it in the appropriate column of M
##
StandardClassMatrixColumn := function(D,M,r,t)
  local c,gt,s,z,i,T,w,e,j,p,orb;
  if t=1 then
    M[D.charTable.inversemap[r]][t]:=Size(D.conjugacyClasses[r]);
  else
    orb:=GaloisOrbits(D,r);
    z:=D.conjugacyClasses[t].representative;
    c:=orb.orbits[t][1];
    if c<>t then
      p:=RepresentativeOperation(orb.group,c,t);
      # was the first column of the galois class active?
      if ForAny(M,i->i[c]>0) then
	for i in [1..Length(D.conjugacyClasses)] do
	  M[i^p][t]:=M[i][c];
	od;
	InfoCharTable2("by GaloisImage");
	return;
      fi;
    fi;

    T:=DoubleCentralizerOrbit(D,r,t);
    InfoCharTable2(Length(T[1])," instead of ",D.conjugacyClasses[r].size);

    if IsLargeGroup(D.group) then
      # if r and t are unique, the conjugation test can be weak (i.e. up to
      # galois automorphisms )
      w:=Length(orb.orbits[t])=1;
      for i in [1..Length(T[1])] do
        if w then
          e:=T[1][i]*z;
          c:=D.rationalidentification(D,e);
          if c in orb.uniqueIdentifications then
            s:=orb.orbits[
              First([1..D.klanz],j->D.rids[j]=c)][1];
          else
            s:=D.ClassElement(D,T[1][i] * z);
          fi;
        else # only strong test possible
          s:=D.ClassElement(D,T[1][i] * z);
        fi;
        M[s][t]:=M[s][t]+T[2][i];
      od;
      if w then # weak discrimination possible ?
        gt:=Set(Filtered(orb.orbits,i->Length(i)>1));
        for i in gt do
          if i[1] in orb.identifees then
            # were these classes detected weak ?
            e:=M[i[1]][t];
            if e>0 then
              InfoCharTable2("\n#I  GaloisIdentification ",i,": ",e);
            fi;
            for j in i do
              M[j][t]:=e/Length(i);
            od;
          fi;
        od;
      fi;
    else # Small Group
      for i in [1..Length(T[1])] do
        s:=D.ClassElement(D,T[1][i] * z);
        M[s][t]:=M[s][t]+T[2][i];
      od;
    fi;
  fi;
end;


#############################################################################
##
#F  IdentificationGenericGroup( <D>, <el> ) . .  class invariants for el in G
##
IdentificationGenericGroup := function(D,el)
  return Order(D.group,el);
end;


#############################################################################
##
#F  DxAbelianPreparation(<G>) . . specific initialisation for abelian groups
##
DxAbelianPreparation := function(G)
  local D,i,a,b;
  D:=DixonRecord(G);
  D.identification:=function(a,b) return b; end;
  D.rationalidentification:=D.identification;
  D.ClassMatrixColumn:=StandardClassMatrixColumn;

  D.ids:=[];
  for i in [1..D.klanz] do
    D.ids[i]:=D.identification(D,D.conjugacyClasses[i].representative);
  od;
  D.rids:=D.ids;

  D.ClassElement:=ClassElementLargeGroup;

  return D;

end;


#############################################################################
##
#F  GroupOps.DxPreparation(<G>) . . .  specific initialisation for groups not
#F                                              fitting in any other category
##
GroupOps.DxPreparation := function(G)
  local D,i,j;
  InfoCharTable1("#W Warning: Generic Group Routines can be very slow\n");
  D:=DixonRecord(G);
  D.identification:=IdentificationGenericGroup;
  D.rationalidentification:=IdentificationGenericGroup;
  D.ClassMatrixColumn:=StandardClassMatrixColumn;

  D.ids:=[];
  for i in [1..D.klanz] do
    D.ids[i]:=D.identification(D,D.conjugacyClasses[i].representative);
  od;
  D.rids:=D.ids;

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

  return D;

end;


#############################################################################
##
##  CharacterDegreePool(G)  . . possible character degrees, using thm. of Ito
##
GroupOps.CharacterDegreePool := function(G)
  local d,k,r,s;
  r:=RootInt(Size(G));
  s:=Lcm(List(AbelianNormalSubgroups(G),i->Index(G,i)));
  k:=Length(ConjugacyClasses(G));
  return List(Filtered(DivisorsInt(s),i->i<=r),i->[i,k]);
end;

#############################################################################
##
##  AbelianNormalSubgroups(G) . . . . . list of all abelian normal subgroups
##  These subgroups are used by CharacterDegreePool to apply Ito's theorem.
##
AbelianNormalSubgroups := function(G)
local ant,aunt,tant,onk,uncl,e,n,r,s,i,j,k,o,f,l;
  ant:=[];
  for r in List(Sublist(ConjugacyClasses(G),[2..Length(G.conjugacyClasses)]),
                Representative) do
    s:=r^Random(G);
    if Comm(r,s)=G.identity then
      n:=Subgroup(G,Set([r,s]));
      f:=true;
      j:=1;
      while f and j<=Length(n.generators) do
        i:=1;
        while f and i<=Length(G.generators) do
          e:=n.generators[j]^G.generators[i];
          if not e in n then
            n:=Closure(n,e);
            if not IsAbelian(n) then
              f:=false;
            fi;
          else
            i:=i+1;
          fi;
        od;
        j:=j+1;
      od;
      if f then
        AddSet(ant,n);
      fi;
    fi;
  od;

  aunt:=[];
  for tant in [1..2^Length(ant)-1] do
    e:=LogInt(tant,2);
    onk:=tant-2^e;
    e:=e+1;
    if onk=0 then
      aunt[tant]:=ant[e];
    elif IsBound(aunt[onk]) then
      uncl:=aunt[onk];
      f:=true;
      k:=1;
      while f and k<=Length(ant[e].generators) do
        l:=1;
        while f and l<=Length(uncl.generators) do
          if Comm(ant[e].generators[k],uncl.generators[l])<>G.identity
            then
              f:=false;
          fi;
          l:=l+1;
        od;
        k:=k+1;
      od;
      if f then
        n:=Closure(uncl,ant[e]);
        if not (n in aunt) then
          aunt[tant]:=n;
        fi;
      fi;
    fi;
  od;

  ant:=[];
  for i in aunt do
    Add(ant,i);
  od;

  return ant;
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



