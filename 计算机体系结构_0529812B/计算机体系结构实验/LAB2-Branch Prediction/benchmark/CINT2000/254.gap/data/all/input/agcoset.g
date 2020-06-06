#############################################################################
##
#A  agcoset.g                   GAP library                      Frank Celler
##
#A  @(#)$Id: agcoset.g,v 3.11.1.1 1994/09/30 11:34:48 ahulpke Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This  file  contains  all  functions  for  creating cosets of ag groups.
##
#H  $Log: agcoset.g,v $
#H  Revision 3.11.1.1  1994/09/30  11:34:48  ahulpke
#H  Fixed GenRelOrdersAgGroup to work always with the parent
#H
#H  Revision 3.11  1994/06/14  13:58:31  ahulpke
#H  fixed trivial case in AscendingChain
#H
#H  Revision 3.10  1994/01/25  15:01:19  fceller
#H  changed 'ElementVector' to use 'IntFFE' instead of 'IntFFE2'
#H
#H  Revision 3.9  1993/07/27  11:40:37  fceller
#H  moved 'RightTransversal' to "agcoset.g"
#H
#H  Revision 3.8  1993/03/09  13:39:56  ahulpke
#H  Use of Igs instead of generators for affine operation
#H
#H  Revision 3.7  1993/01/18  18:44:40  martin
#H  added double coset functions
#H
#H  Revision 3.6  1993/01/04  11:17:47  fceller
#H  changed 'DepthAgWord'
#H
#H  Revision 3.5  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.4  1992/11/25  15:29:18  fceller
#H  fixed a minor bug
#H
#H  Revision 3.3  1992/07/01  11:46:52  fceller
#H  'LeftCoset' now uses 'CanonicalAgWord'
#H
#H  Revision 3.2  1992/04/03  13:10:09  fceller
#H  changed 'Shifted...' into 'Sifted...'
#H
#H  Revision 3.1  1992/02/07  18:11:23  fceller
#H  Initial GAP 3.1 release.
##


#############################################################################
##
#F  InfoAgGroup1( <arg> ) . . . . . . . . . . . . . . . . package information
#F  InfoAgGroup2( <arg> ) . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoAgGroup1 )  then InfoAgGroup1 := Ignore;  fi;
if not IsBound( InfoAgGroup2 )  then InfoAgGroup2 := Ignore;  fi;


#############################################################################
##

#F  AgGroupOps.RightTransversal( <G>, <H> ) . . determine a right transversal
##
##  returns
##
##      <list>
##
AgGroupOps.RightTransversal := function( G, H )
    local elements, g, u, e, i;

    elements := [ G.identity ];
    for g in Reversed( FactorArg( G, H ).generators ) do
        u := G.identity;
        e := ShallowCopy( elements );
        for i  in [ 1 .. RelativeOrderAgWord( g ) - 1 ]  do
            u := u * g;
            UniteSet( elements, e * u );
        od;
    od;
    return elements;
end;


#############################################################################
##

#V  RightCosetAgGroupOps  . . . . . . . . . . . ops record of ag group cosets
##
RightCosetAgGroupOps := Copy( RightCosetGroupOps );


#############################################################################
##
#F  RightCosetAgGroupOps.\<  . . . . . . . . . . . .  right coset comparison
##
RightCosetAgGroupOps.\< := function( C, D )
    local   L,  G,  x,  y,  g;

    if not IsRightCoset( C ) or not IsRightCoset( D )  then
    	return RightCosetGroupOps.\<( C, D );
    elif C.group <> D.group  then
    	return RightCosetGroupOps.\<( C, D );
    else
    	G := C.group;
    	L := Parent( G ).cgs;
    	x := SiftedAgWord( G, C.representative );
    	y := SiftedAgWord( G, D.representative );
    	while not x/y in G  do
    	    if DepthAgWord(x) <> DepthAgWord(y)  then
    	    	return x < y;
    	    elif LeadingExponent(x) <> LeadingExponent(y)  then
    	    	return x < y;
    	    fi;
    	    g := L[ DepthAgWord(x) ] ^ LeadingExponent(x);
    	    G := G ^ g;
    	    g := g ^ -1;
    	    x := SiftedAgWord( G, g * x );
    	    y := SiftedAgWord( G, g * y );
    	od;
    	return false;
    fi;

end;


#############################################################################
##
#F  AgGroupOps.RightCoset( <G>, <u> ) . . . . . . . . . right coset <G> * <u>
##
AgGroupOps.RightCoset := function( G, u )
    local   C;

    C := rec();
    C.isDomain       := true;
    C.isRightCoset   := true;
    C.group          := G;
    C.representative := u;
    C.isFinite       := true;
    C.operations     := RightCosetAgGroupOps;
    return C;

end;


#############################################################################
##
#F  AgGroupOps.RightCosets <S>, <U> ) . . . . . .  cosets <U>*s of <U> in <S>
##
AgGroupOps.RightCosets := function( S, U )
    local   C, d, cosets, id, g, u, i, old, new;

    if not IsSubgroup( S, U )  then
       return GroupOps.RightCosets( S, U );
    fi;

    # Get the generators of <U> with weight not in <V>.
    U := Normalized( U );
    d := List( Igs(U), DepthAgWord );
    C := Filtered( Cgs( S ), x -> not DepthAgWord(x) in d );

    # Multiply all generators reversed canonically (we want Ug not gU).
    old := [ U.identity ];
    for g  in Reversed( C )  do
        new := Copy( old );
        for i  in [ 1 .. RelativeOrderAgWord( g ) - 1 ]  do
            for u  in old  do
                Add( new, u * g ^ i );
            od;
        od;
        old := new;
    od;
    cosets := old;

    # Return not only the agwords but also the operation.
    id := RightCoset( U );
    return List( cosets, x -> id * x );

end;

AgGroupOps.Cosets := AgGroupOps.RightCosets;


#############################################################################
##

#V  LeftCosetAgGroupOps . . . . . . . . . . . . ops record of ag group cosets
##
LeftCosetAgGroupOps := Copy( LeftCosetGroupOps );


#############################################################################
##
#F  LeftCosetAgGroupOps.\< . . . . . . . . . . . . . . left coset comparison
##
LeftCosetAgGroupOps.\< := function( C, D )

    if not IsLeftCoset(C) or not IsLeftCoset(D)  then
    	return LeftCosetGroupOps.\<(C, D);
    elif C.group <> D.group  then
    	return LeftCosetGroupOps.\<(C, D);
    else
    	return C.representative < D.representative;
    fi;

end;


#############################################################################
##
#F  LeftCosetAgGroupOps.\= . . . . . . . . . . . . . . left coset comparison
##
LeftCosetAgGroupOps.\= := function( C, D )
    local   isEql;

    # compare a left coset
    if IsLeftCoset(C)  then

        # with another left coset
        if IsLeftCoset(D)  then
            isEql := C.group=D.group and C.representative=D.representative;

        # with a subgroup, which is a special left coset
        elif IsGroup(D)  then
            isEql := C.group=D and C.representative=C.group.identity;

        # with something else
        else
            isEql := DomainOps.\=(C, D);
        fi;

    # compare a subgroup, which is a special left coset
    elif IsGroup(C)  then

        # with a left coset
        if IsLeftCoset(D)  then
            isEql := C=D.group and D.representative=C.identity;

        # with something else
        else
            Error("panic, neither <C> nor <D> is a left coset");
        fi;

    # compare something else
    else

        # with a left coset
        if IsLeftCoset(D)  then
            isEql := DomainOps.\=(C, D);

        # with another something else
        else
            Error("panic, neither <C> nor <D> is a left coset");
        fi;

    fi;

    # return the result
    return isEql;

end;


#############################################################################
##
#F  LeftCosetAgGroupOps.\*  . . . . . . . . . . . . . .  multiply two cosets
LeftCosetAgGroupOps.\* := function ( C, D )
    local   E;

    if IsLeftCoset(D)  and C in Parent(D.group)  then
        E := D.group.operations.LeftCoset(D.group, C*D.representative);
    elif IsLeftCoset(D)  then
        E := C * Elements(D);
    elif IsLeftCoset(C)  then
        E := Elements(C) * D;
    else
        Error("product of <C> and <D> is not defined");
    fi;
    return E;

end;


#############################################################################
##
#F  AgGroupOps.LeftCoset( <G>, <u> )  . . . . . . . . .  left coset <u> * <G>
##
AgGroupOps.LeftCoset := function( G, u )
    local   C;

    C := rec();
    C.isDomain       := true;
    C.isLeftCoset    := true;
    C.group          := G;
    C.representative := CanonicalAgWord(G, u);
    C.isFinite       := true;
    C.operations     := LeftCosetAgGroupOps;
    return C;

end;


#############################################################################
##
#F  InfoCoset1  . . . . . . . . . . . . . . . information for coset functions
##
if not IsBound(InfoCoset1)  then InfoCoset1:=Ignore; fi;


#############################################################################
##

#F  AGDoubleCosets( <G>, <L>, <R> ) . . . . . . .  double cosets for aggroups
##
##  Double Coset calculation for AgGroups, inductive scheme, according to
##  Mike Slattery
##
AGDoubleCosets := function(G,L,R)
  local A,B,eas,fg,fgi,r,st,nr,nst,ind,N,H,K,sff,f,mat,m,i,j,ao,ng,v,isi,img,
        b,wbase,neubas,wproj,wg,gen,W,x,xg,gi,U,mats,u,nu,sf,dr,U,flip,hom;

  # force elementary abelian Series
  if not(IsElementaryAbelianAgSeries(G)) then
    hom:=IsomorphismAgGroup(ElementaryAbelianSeries(G));
    A:=Image(hom,L);
    B:=Image(hom,R);
    G:=hom.range;
    img:=true;
  else
    img:=false;
    A:=L;
    B:=R;
  fi;

  # if a is small and b large, compute cosets b\G/a and take inverses of the
  # representatives: Since we compute stabilizers in B and a chain down to
  # A, this is remarkable faster

  if 3*Size(A)<2*Size(B) then
    m:=B;
    B:=A;
    A:=m;
    flip:=true;
    InfoCoset1("#I DoubleCosetFlip\n");
  else
    flip:=false;
  fi;

  gi:=G.identity;
  eas:=ElementaryAbelianSeries(G);
  fg:=G/eas[1]; #eas[1]=G
  r:=[fg.identity];
  st:=[B];
  for ind in [2..Length(eas)] do
    # G/<1> \not= G for GAP, thus avoid G/<1>
    if ind<Length(eas) then
      fg:=G/eas[ind];
    else
      fg:=G;
    fi;
    fgi:=fg.identity;
    N:=FactorAgSubgroup(fg,eas[ind-1]);
    H:=FactorAgSubgroup(fg,A);
    K:=FactorAgSubgroup(fg,B);
    if IsSubgroup(H,N) then
      if ind=Length(eas) then
	# calculation of preImages is only necessary in the last step
	for i in [1..Length(r)] do
	  r[i]:=FactorAgWord(r[i],fgi);
	od;
      fi;
    #elif IsSubgroup(K,N) then
      #Print("new Part\n"); contains errors!
      # If N\subseteq K, then W\subset N=N^x\subset Stab^x=U (note, that N\cap K
      # \subset Stab). Thus we get one Orbit. The Stabilizer is the
      # Stabilizer of H in U, i.e. H-part of U, which is the conjugation of
      # the A-part of the conjugated Stabilizer.
      #for i in [1..Length(r)] do
	#xg:=FactorAgWord(r[i],gi);
	#r[i]:=FactorAgWord(r[i],fgi);
	#st[i]:=Closure(eas[ind],Intersection(Subgroup(G,List(st[i].generators,i->i^(xg^(-1)))),A))^xg;
    else
      sff:=SumFactorizationFunctionAgGroup(H,N);
      ng:=Cgs(N);
      if not IsBound(N.field) then
	N.field:=GF(RelativeOrderAgWord(N.generators[1]));
      fi;
      f:=N.field;
      v:=RowSpace(Length(ng),f);
      if Size(sff.intersection)=1 then
	isi:=RowSpace([v.zero],f);
      else
	isi:=RowSpace(List(sff.intersection.generators,i->Exponents(N,i,f)),f);
      fi;
      # compute complement W
      b:=BaseSteinitz(v,isi);
      wbase:=b.factorspace;
      dr:=[1..Length(wbase)]; # 3 for stripping the affine 1
      neubas:=Concatenation(wbase,isi.base);
      wproj:=List(neubas^(-1),i->Sublist(i,[1..Length(wbase)]));
      wg:=[];
      for i in wbase do
	Add(wg,ElementVector(ng,i));
      od;
      W:=Subgroup(fg,wg);
      InfoCoset1("#I Step:",Size(W),"\n");

      nr:=[];
      nst:=[];
      for i in [1..Length(r)] do
	x:=FactorAgWord(r[i],fgi);
	xg:=FactorAgWord(x,gi);
        U:=st[i]^(xg^(-1));
	mats:=[];
        for u in List(Igs(U),i->FactorAgWord(i,fgi)) do
          m:=[]; 
          for j in wg do
	    Add(m,Concatenation(Exponents(N,j^u,f)*wproj,[f.zero])); 
	  od;
	  Add(m,Concatenation(Exponents(N,sff.factorization(u).n,f)*wproj,
		[f.one])); 
	  Add(mats,m);
	od;
	# modify later: if U trivial
	if Length(mats)>0 then
	  ao:=AffineOrbitsAgGroup(U,mats,f);
	  Apply(ao.representatives,
		 i->ElementVector(ng,Sublist(i,dr)*wbase));
	else
	  ao:=rec(
                  representatives:=Elements(W),
                  stabilizers:=List(Elements(W),i->U)
	      ); 
	fi;
	for j in [1..Length(ao.representatives)] do
	  Add(nr,ao.representatives[j]*x);
	  Add(nst,ao.stabilizers[j]^xg);
	od;
      od;
      r:=nr;
      st:=nst;
    fi;
  od;
  sf:=Size(A)*Size(B);
  for i in [1..Length(r)] do
    if img then
      r[i]:=PreImagesRepresentative(hom,r[i]);
    fi;
    if flip then
      f:=G.operations.DoubleCoset(R,r[i]^(-1),L);
    else
      f:=G.operations.DoubleCoset(L,r[i],R);
    fi;
    f.size:=sf/Size(st[i]);
    r[i]:=f;
  od;
  return r;
end;

AgGroupOps.DoubleCosets := function(G,A,B)
  if Size(G)<=500 then
    return CalcDoubleCosets(G,A,B);
  else
    return AGDoubleCosets(G,A,B);
  fi;
end;


#############################################################################
##
#F  FactorAgSubgroup( <F>, <S> )  . . . . .  map <S> into factor group <F> by
#F                                                    stripping the exponents
##
FactorAgSubgroup := function(F,S)
  return Subgroup(F,List(S.generators,i->FactorAgWord(i,F.identity)));
end;


#############################################################################
##
#F  ElementVector( <cgs>, <e> ) . . . . . element orresponding to a ff vector
##
ElementVector := function( cgs, e )
    local   el, i;

    el := cgs[1]^0;
    for i  in [ 1 .. Length(e) ]  do
        el := el*cgs[i]^IntFFE(e[i]);
    od;
    return el;
end;


#############################################################################
##
#F  AscendingChain(<G>,<U>) . . . . . . .  chain of subgroups G=G_1>...>G_n=U
##
AgGroupOps.AscendingChain := function(G,s)
  local c,cc,e,bound,k,i,j,neu,olg;

  # special handling for trivial case
  if Size(G)=Size(s) then
    return [G,G];
  fi;

  c:=[s];
  e:=s;
  k:=Reversed(CompositionSeries(G));
  olg:=[];
  for i in [1..Length(k)-1] do
    if Size(e)>Size(k[i]) and IsSubset(k[i].generators,olg) then
      e:=Closure(e,k[i]);
    else
      e:=Closure(k[i],s);
    fi;
    olg:=k[i].generators;
    neu:=true;
    j:=1;
    while j<=Length(c) and neu do
      if Size(c[j])=Size(e) then
	neu:=false;
      fi;
      j:=j+1;
    od;
    if neu then
      Add(c,e);
    fi; 
  od;
  if Size(e)<Size(G) then
    Add(c,G);
  fi;
  return RefinedChain(G,c);
end;


#############################################################################
##
#F  AgGroupOps.CanonicalCosetElement( <U>, <g> )  . . . .  CCEs for ag groups
##
## Set up a CGS and relative orders of the generators for MainEntryCCEAgGroup
##
AgGroupOps.CanonicalCosetElement := function(U,g)
  local G;
  G:=Parent(U);
  # force computation of CGS for U and of genRelOrders of G
  Cgs(U);
  GenRelOrdersAgGroup(G);
  return MainEntryCCEAgGroup( G, U, g );
end;


#############################################################################
##
#F  AgGroupOps.OnCanonicalCosetElements(<G>,<U>)  . create operation function
#F                                                      for CCEs for aggroups
##
##  this routine returns a *function*, that can be used like OnPoints.
##
AgGroupOps.OnCanonicalCosetElements := function(G,U)
  GenRelOrdersAgGroup(G);
  Cgs(U);
  return function(a,b)
	   return MainEntryCCEAgGroup(G,U,a*b);
	 end;
end;


#############################################################################
##
#F  MainEntryCCEAgGroup( <G>, <U>, <g> )  . . . . . . . . .  cce for aggroups
##
##  Main part of the computation of a canonical coset representative in a
##  AgGroup. This is done by factoring with the canonical generators of the
##  subgroup to set the appropriate exponents to zero. Since the
##  representation as an AgWord is "from left to right", we can multiply with
##  subgroup elements from _right_, without changing exponents of the
##  generators with lower depth (that are supposedly in canonical form yet).
##  Since we want _right_ cosets, everything is done with the _inverse_
##  elements, which are representatives for the left cosets.  The routine
##  supposes, that an Cgs has been set up and the relative orders of the
##  generators have been computed by the calling routine.
##
MainEntryCCEAgGroup := function(G,U,g)
  local a,d1,d,u,e;
  a:=g^(-1);
  d1:=Depth(a);
  for u in U.cgs do
    d:=Depth(u);
    if d>=d1 then
      e:=ExponentsAgWord(a);
      a:=a*u^(G.genRelOrders[d]-e[d]);
      d1:=Depth(a);
    fi;
  od;
  return a^(-1);
end;

AgGroupOps.MainEntryCCE:=MainEntryCCEAgGroup;


#############################################################################
##
#F  GenRelOrdersAgGroup( <G> )  . . .  relative orders of the generators of G
##
GenRelOrdersAgGroup := function(G)
  if not IsBound(G.genRelOrders) then
    G.genRelOrders:=List(Cgs(Parent(G)),i->RelativeOrderAgWord(i));
  fi;
  return G.genRelOrders;
end;
