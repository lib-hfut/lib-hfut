#############################################################################
##
#A  agctbl.g                    GAP library                  Alexander Hulpke
##
#H  @(#)$Id: agctbl.g,v 3.5 1993/07/21 18:21:17 ahulpke Rel $
##
#Y  Copyright (C)  1993,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains AgGroup specific parts of the Dixon-Schneider.
##
#H  $Log: agctbl.g,v $
#H  Revision 3.5  1993/07/21  18:21:17  ahulpke
#H  fixed calling convention of Enumeration
#H
#H  Revision 3.4  1993/06/02  15:43:38  ahulpke
#H  Applied (forgotten) fix for using galois conjugate columns
#H
#H  Revision 3.3  1993/02/24  12:04:09  ahulpke
#H  Added missing 'Ag' to GroupOps.CharacterDegreePool
#H
#H  Revision 3.2  1993/02/09  14:25:55  martin
#H  made undefined globals local
#H
#H  Revision 3.1  1993/01/18  18:46:52  martin
#H  initial revision under RCS
#H
##

#############################################################################
##
#F  AgGroupClassMatrixColumn(<D>,<mat>,<r>,<t>) . . calculate the t-th column
#F       of the r-th class matrix and store it in the appropriate column of M
##
AgGroupClassMatrixColumn := function(D,M,r,t)
  local orb, # orbits of Stab_Gal(r) etc.
        p,   # class permutation, position in a list
        c,   # class number
        T,   # List of the identefees and their multiples
        z,   # representative of class t
        l,   # length of (elementary) abelian series
        fg,  # factor group
        fgh, # 1 in factor group G/N2 \ where N2<N1
        fgi, # 1 in factor group G/N1 /
        n,   # image of N1 in G/N2
        ng,  # IGS of n
        es,  # canonical class representatives in factor group
        rep, # one of them
        conju, # conjugating elements
        conj,  # one of them
        res, # rec(conjugating correction,new centralizer)
        ci,  # numbers of the corresponding centralizers
        cent,# centralizers
        newcent,# centralizers for next step
        ce,  # one of them
        i,j, # loop variables
        ic,  # indicator for central step
        fxt, # yet calculated images in factor group
        xt,  # tail part of the identifee
        uniques; # heads, that identify a class uniquely

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
        for i in [1..D.klanz] do
          M[i^p][t]:=M[i][c];
        od;
        InfoCharTable2("by GaloisImage");
        return;
      fi;
    fi;

    T:=DoubleCentralizerOrbit(D,r,t);
    InfoCharTable2(Length(T[1])," instead of ",D.conjugacyClasses[r].size);

    Apply(T[1],i->i*z);

    fgi:=D.facs[1].identity;
    l:=Length(D.facs);
  # as long as abelian, classes are the same, as elements
    es:=List(T[1],i->FactorAgWord(i,fgi));
    conju:=List(es,i->fgi);
    ci:=List(es,i->1);
    cent:=[ShallowCopy(D.facs[1].generators)];
    uniques:=D.uniques;

    for i in [2..l] do
      fg:=D.facs[i];
      fgi:=fg.identity;
      fgh:=D.facs[i-1].identity;
      n:=D.imgs[i];
      ng:=Igs(n);
      ic:=D.iscentral[i];

      for j in [1..Length(cent)] do
	Apply(cent[j],x->FactorAgWord(x,fgi));
      od;

      newcent:=[];
      fxt:=[];

      for j in [1..Length(T[1])] do

	if es[j] in uniques then
	  if i=l then
	    es[j]:=FactorAgWord(es[j],fgi);
	    D.shorttests:=D.shorttests+1;
	  fi;
	else
	  # es contains the canonical form one step above

	  xt:=FactorAgWord(T[1][j],fgi);
	  # have we yet considered this element ?
	  p:=Position(fxt,xt);
	  if p=false then
	    fxt[j]:=xt;
	    rep:=FactorAgWord(es[j],fgi);
	    conj:=FactorAgWord(conju[j],fgi);
	    xt:=rep^(-1)*xt^conj;

	    if ic then
	      res:=CentralCaseECAgWords(fg,n,cent[ci[j]],ng,rep,xt);
	    else
	      res:=GeneralCaseECAgWords(fg,n,cent[ci[j]],ng,rep,xt);
	    fi;

	    conju[j]:=conj*res.conjugand;
	    es[j]:=res.representative;
	    ce:=res.centralizer;

	    p:=Position(newcent,ce);
	    if p=false then
	      Add(newcent,ce);
	      ci[j]:=Length(newcent);
	    else
	      ci[j]:=p;
	    fi;
	  else
	    conju[j]:=conju[p];
	    es[j]:=es[p];
	    ci[j]:=ci[p];
	  fi;
	fi;

      od;
      cent:=newcent;
    od;

    # evaluate

    rep:=D.replist;
    for i in [1..Length(es)] do
      p:=Position(rep,es[i]);
      M[p][t]:=M[p][t]+T[2][i];
    od;

  fi;
end;


#############################################################################
##
#F  IdentificationAgGroup(<D>,<el>)  calculate canonical class representative
#F                                                                 of el in G
##
IdentificationAgGroup := function(D,el)
  local fgi,l,es,conj,cent,fg,n,ng,rep,res,xt,i;

  fgi:=D.facs[1].identity;
  l:=Length(D.facs);
  # as long as abelian, classes are the same, as elements
  es:=FactorAgWord(el,fgi);
  conj:=fgi;
  cent:=ShallowCopy(D.facs[1].generators);

  for i in [2..l] do

    xt:=FactorAgWord(el,fgi);
    # can we shorten the procedure ?
    if xt in D.uniques then
      D.shorttests:=D.shorttests+1;
      return FactorAgWord(xt,D.group.identity);
    fi;

    fg:=D.facs[i];
    fgi:=fg.identity;
    n:=D.imgs[i];
    ng:=Igs(n);

    Apply(cent,x->FactorAgWord(x,fgi));

    rep:=FactorAgWord(es,fgi);
    conj:=FactorAgWord(conj,fgi);

    xt:=rep mod FactorAgWord(el,fgi)^conj;

    if D.iscentral[i] then
      res:=CentralCaseECAgWords(fg,n,cent,ng,rep,xt);
    else
      res:=GeneralCaseECAgWords(fg,n,cent,ng,rep,xt);
    fi;

    conj:=conj*res.conjugand;
    es:=res.representative;
    cent:=res.centralizer;

  od;

  return es;

end;


#############################################################################
##
#F  AgGroupOps.DxPreparation(<G>) . specific initialisation for PAG presented
#F                                                                     groups
##
##  Set up some functions. Initialize the computation of canonic
##  class representatives
##
AgGroupOps.DxPreparation := function(G)
  local i,j,k,orb,hom,D;

  # falls n"otig bessere Reihe berechnen

  if not(IsParent(G) and IsElementaryAbelianAgSeries(G)) then
    InfoCharTable1("#I Calculating ElementaryAbelianSeries\n");
    hom:=IsomorphismAgGroup(ElementaryAbelianSeriesThrough(
           [G,DerivedSubgroup(G)]));
    hom.isMapping:=true;
    hom.isGroupHomomorphism:=true;
    hom.isInjective:=true;
    hom.isSurjective:=true;
    hom.isBijection:=true;
    hom.kernel:=TrivialSubgroup(G);
    hom.range.oldG:=G;
    if IsBound(G.name) then
      hom.range.name:=G.name;
    fi;
    G:=hom.range; # hom on the range
    # force canonical representatives
    G.conjugacyClasses:=AgGroupOps.ConjugacyClasses(G,List(
          ConjugacyClasses(G.oldG),i->i.representative^hom));
  fi;

  D:=DixonRecord(G);

  InitAgConjugacyTest(D);

  if IsBound(G.oldG) then
    D.oldG:=G.oldG;
    Unbind(G.oldG);
  fi;

  # Don't care about LARGE groups
  D.ClassElement:=ClassElementLargeGroup;
  D.ClassMatrixColumn:=AgGroupClassMatrixColumn;
  D.identification:=IdentificationAgGroup;
  D.rationalidentification:=IdentificationAgGroup;

  D.ids:=[];
  for i in [1..D.klanz] do
    # representatives are identification
    D.ids[i]:=D.conjugacyClasses[i].representative;
  od;
  D.rids:=D.ids;

  return D;

end;


#############################################################################
##
#F  InitAgConjugacyTest( <D> ) . . prepare for fast computations of canonical
#F                                                             class elements
##
InitAgConjugacyTest := function(D)
  local G,    # the group
        eas,  # elementary abelian series
        offs, # offset of the series we are starting with (the first factor
              # need not to be elementary abelian but only abelian)
        facs, # factor groups
        l,    # length of this
        imgs, # images of the normal subgroups in next factorgroup
        iscentral, # central step indicator
        i,j,  # loop variables
        f,    # factor group
        uniques, # representatives of classes in factor group, which do not
                 # split
        uniquecands, # candidates therefore
        stilluniques, # still candidates in former factorgroup
        adduniques, # unique in factor, but not in higher factor
        p,   # position
        fe,  # factor group element
        fgi, # factor group identity
        fused; # representatives of classes, that fuse together

  G:=D.group;
# suppose, we have an elementary abelian Ag Series
  eas:=ElementaryAbelianSeries(G);
# factor Groups
  facs:=[];
  j:=1;
  offs:=-1;
  for i in [1..Length(eas)-1] do
    f:=G/eas[i];
    if (j=2) and IsAbelian(f) then
      j:=1;
      # still abelian factor, starting lower in the row
      offs:=offs+1;
    fi;
    facs[j]:=f;
    j:=j+1;
  od;
  Add(facs,G);
  l:=Length(facs);
# images of previous eas-step as normal abelian subgroup
  imgs:=[];
  iscentral:=[];
  for i in [2..l] do
    f:=facs[i];
    imgs[i]:=Subgroup(f,List(eas[i+offs].generators,
                      j->FactorAgWord(j,f.identity)));
    iscentral[i]:=IsCentral(f,imgs[i]);
  od;
  D.facs:=facs;
  D.imgs:=imgs;
  D.iscentral:=iscentral;
  D.replist:=List(D.conjugacyClasses,i->i.representative);
  uniquecands:=D.replist;
  uniques:=[];
  for i in Reversed([1..l-1]) do
    f:=facs[i];
    fgi:=f.identity;
    imgs:=[];
    fused:=[];
    for j in D.replist do
      fe:=FactorAgWord(j,fgi);
      p:=Position(imgs,fe);
      if p<>false then
        Add(fused,fe);
      else
        Add(imgs,fe);
      fi;
    od;

    adduniques:=[];
    stilluniques:=[];

    for j in uniquecands do
      fe:=FactorAgWord(j,fgi);
      # does uniqueness extend to factor?
      if fe in fused then
        Add(adduniques,j);
      else
        Add(stilluniques,fe);
      fi;
    od;
    uniquecands:=stilluniques;

    if i<(l-1) then
      Append(uniques,adduniques);
    fi;
  od;
  # note those, that stayed unique during the whole run

  Append(uniques,stilluniques);
  D.uniques:=Set(uniques);
  D.shorttests:=0;
end;


#############################################################################
##
#F  CharacterDegreePool(G)  . . character degrees of the Group
##
AgGroupOps.CharacterDegreePool:=function(G)
  return Copy(CharDegAgGroup(G));
end;


#############################################################################
##
#F  AgGroupOps.Enumeration(<G>) . . . . . . . . .  enumeration for an aggroup
##
##  enumerate elements of a AgGroup G, using the representation of an
##  element as product of the generators and identifying the exponents
##  of the generators with an multi-adic expansion of the
##  number.
##
AgGroupOps.Enumeration:=function ( G )
local indices,steps,i,U,V;
  steps:=Length(G.generators);
  indices:=[];
  U:=Subgroup(Parent(G),[]);
  i:=steps;
  while i>0 do
    V:=Closure(U,G.generators[i]);
    indices:=Concatenation([Index(V,U)],indices);
    U:=V;
    i:=i-1;
  od;
  return rec(
    group := G,
    number := function(r,elem)
     local num,ind,i;
     ind:=Exponents(r.group,elem);
     num:=0;
     for i in [1..steps] do
       num:=num*indices[i]+ind[i];
     od;
     return num+1;
  end,
    element := function (r,num)
	 local  n, elem, coef, i;
	 n:=num-1;
	 coef:=[];
	 for i in Reversed(indices) do
	   Add(coef,n mod i);
	   n:=QuoInt(n,i);
	 od;
	 coef := Reversed(coef);
	 elem:=G.identity;
	 for i in [1..steps] do
	   elem:=elem*r.group.generators[i]^coef[i];
	 od;
    return elem;
  end );
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



