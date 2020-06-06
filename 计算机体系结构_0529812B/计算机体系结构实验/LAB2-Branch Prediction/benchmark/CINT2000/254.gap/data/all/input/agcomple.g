#############################################################################
##
#A  agcomple.g                  GAP library                      Frank Celler
##
#A  @(#)$Id: agcomple.g,v 3.11.1.3 1996/05/13 09:24:39 fceller Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains all polymorph functions for groups.
##
#H  $Log: agcomple.g,v $
#H  Revision 3.11.1.3  1996/05/13  09:24:39  fceller
#H  undid temporary fix 3.11.1.2, fixed coprime complement case
#H
#H  Revision 3.11.1.2  1996/02/22  10:59:28  ahulpke
#H  disabled erraneous coprime case (only temporary fix)
#H
#H  Revision 3.11.1.1  1995/10/09  09:51:50  fceller
#H  fixed the parameter sequence of 'SumAgGroup' (normal subgroup first)
#H
#H  Revision 3.11  1994/01/07  09:23:08  fceller
#H  fixed typo
#H
#H  Revision 3.10  1993/03/01  11:36:14  fceller
#H  fixed a bug occuring in coprime case
#H
#H  Revision 3.9  1992/10/27  14:41:29  fceller
#H  fixed a bug in 'Complements'
#H
#H  Revision 3.8  1992/05/25  07:57:59  fceller
#H  added condition test, fixed one more bug
#H
#H  Revision 3.7  1992/05/22  07:16:11  fceller
#H  fixed missing 'RowSpace' in call to 'Elements',
#H  add missing conversion using 'logTable'
#H
#H  Revision 3.6  1992/04/07  14:28:07  fceller
#H  fixed a few typos
#H
#H  Revision 3.5  1992/04/07  12:53:37  fceller
#H  changed comparison with '0'
#H
#H  Revision 3.4  1992/02/07  18:11:40  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/09/24  15:41:55  fceller
#H  Initial Release under RCS
##


#############################################################################
##
#F  InfoAgCo1( <arg> ) . . . . . . . . . . . . . . . . .  package information
#F  InfoAgCo2( <arg> )  . . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoAgCo1 )  then InfoAgCo1 := Ignore;  fi;
if not IsBound( InfoAgCo2 )  then InfoAgCo2 := Ignore;  fi;


#############################################################################
##
#F  BaseSteinitz( <V>, <U> )  . . . . . . . . . . . . . . . base of <V> / <U>
##
##  Let <V> be a row space, <U> be a subspace. Then 'BaseSteinitz'  returns a
##  record  describing  a base  for the factorspace   and ways   to decompose
##  vectors:
##
##  zero:   	    zero of <V> and <U>
##  factorzero:	    zero of <V> / <U>
##  field:  	    field of <V> and <U>
##  vectorspace:    base of <V>
##  subspace:	    base of <U>
##  factorspace:    base of a complement of <U> in <V>
##  heads:  	    a list of integers i_j, such that  if i_j>0 then a vector
##   	    	    with head j is at position i_j  in factorspace.  If i_j<0
##  	    	    then the vector is in subspace.
##
BaseSteinitz := function( V, U )
    local   BV,  BU,  F,  i,  j;

    BV := Base( V );
    BU := Base( U );
    F  := rec( field := V.field, zero := V.zero, heads := [],
    	       subspace := BU, vectorspace := BV, factorspace := []  );
    for i  in [ 1 .. Length(BU) ]  do
        j := 1;
        while BU[i][j] = F.field.zero  do j := j+1;  od;
        F.heads[j] := -i;
    od;
    for i  in [ 1 .. Length(BV) ]  do
        j := 1;
        while BV[i][j] = F.field.zero  do j := j+1;  od;
    	if not IsBound( F.heads[j] )  then
    	    Add( F.factorspace, BV[i] );
            F.heads[j] := Length(F.factorspace);
    	fi;
    od;
    F.factorzero := List( [ 1 .. Length(BV)-Length(BU) ], x->F.field.zero );
    return F;

end;


#############################################################################
##
#F  AffineBlocksCO( <S>, <mats> ) . . . . . . . . . . . . . . . . . . . local
##
##  Divide the vectorspace  into blocks using  the  affine operations of  <S>
##  described by <mats>.  Return representative  for  these blocks and  their
##  normalizers in <S>.
##
AffineBlocksCO := function( S, mats )
    local   dim, p, nul, one, C, L, blt, B, O, Q, i, j, v, w, n, z;

    # The affine operation of <S> is described via <mats> as
    #
    #      ( lll 0 )
    #      ( lll 0 )
    #      ( ttt 1 )
    #
    # where l  describes  the   linear operation and  t  the  translation the
    # dimension  of   the  vectorspace  is of   dimension  one less  than the
    # matrices <mats>.
    #
    dim := Length(mats[1]) - 1;
    one := mats[1][1][1]^0;
    nul := 0 * one;
    p := CharFFE( mats[ 1 ][ 1 ][ 1 ] );
    C := List( [ 1 .. dim ], x -> p );
    Q := List( [ 1 .. dim ], x -> p ^ ( dim - x ) );
    L := [];
    for i  in [ 1 .. p-1 ]  do
    	L[ LogFFE( one * i ) + 1 ] := i;
    od;

    # Make a boolean list of length <p> ^ <dim>.
    blt := BlistList( [ 1 .. p ^ dim ], [] );
    InfoAgCo2( "#I  AffineBlocksCO: ", p^dim, " elements in H^1\n" );
    i := Position( blt, false );
    B := [];

    # Run through this boolean list.
    while i <> false  do
    	v := CoefficientsInt( C, ( i - 1 ) ) * one;
    	w := ShallowCopy( v );
        Add( v, one );
        O := AgOrbitStabilizer( S, mats, v );
        for v  in O.orbit  do
    	    n := 1;
    	    for j  in [ 1 .. dim ]  do
    	    	z := v[j];
    	    	if z <> nul  then
      	    	    n := n + Q[j] * L[ LogFFE( z ) + 1 ];
    	    	fi;
    	    od;
    	    blt[ n ] := true;
        od;
    	InfoAgCo2( "#I  AffineBlockCO: |block| = ", Length(O.orbit), "\n" );
        Add( B, rec( vector := w, stabilizer := O.stabilizer ) );
        i := Position( blt, false );
    od;
    InfoAgCo2( "#I  AffineBlockCO: ", Length( B ), " blocks found\n" );
    return B;

end;


#############################################################################
##
#F  NextCentralizerCO( <ocr>, <S>, <H> )  . . . . . . . . . . . . . . . local
##
##  Correct the blockstabilizer and return the stabilizer of <H> in <S>
##
NextCentralizerCO := function( ocr, S, H )
    local   gens,  pnt,  i;

    # Get the generators of <S> and correct them.
    InfoAgCo2( "#I  NextCentralizerCO: correcting blockstabilizer\n" );
    gens := ShallowCopy( Igs( S ) );
    pnt  := ocr.complementToCocycle( H );
    for i  in [ 1 .. Length( gens ) ]  do
        gens[ i ] := gens[ i ] *
            ConjugatingWordOC( ocr,
    	    	    	       ocr.complementToCocycle( H ^ gens[ i ] ),
                               pnt );
    od;
    InfoAgCo2( "#I  NextCentralizerCO: blockstabilizer corrected\n" );
    return SumAgGroup( ocr.centralizer, AgSubgroup( S, gens, false ) );

end;


#############################################################################
##
#F  NextCocyclesCO( <cor>, <ocr>, <S> )	. . . . . . . . . . . . . . . . local
##
##  Get the next conjugacy classes of  complements  under  operation  of  <S>
##  using affine operation on the onecohomologygroup of <K>  and  <N>,  where
##  <ocr> := rec( group := <K>, module := <N> ).
##
##  <ocr>  is a  record  as  described  in 'OneCocyclesOC'.  The classes  are
##  returned as list of records rec( complement, centralizer ).
##
NextCocyclesCO := function( cor, ocr, S )
    local   K, N, Z, SN, B, L, LL, tau, phi, mats, i;

    # Try to split <K> over <M>, if it does not split return.
    InfoAgCo2( "#I  NextCocyclesCO: computing cocycles\n" );
    K := ocr.group;
    N := ocr.module;
    Z := OneCocyclesOC( ocr, true );
    if IsBool( Z )  then
    	if IsBound( ocr.normalIn )  then
    	    InfoAgCo2( "#I  NextCocyclesCO: no normal complements\n" );
    	else
    	    InfoAgCo2( "#I  NextCocyclesCO: no split extension\n" );
        fi;
        return [];
    fi;

    ocr.generators := ocr.complement.generators;

    # If there is only one complement this is normal.
    if Base( Z ) = []  then
    	InfoAgCo2( "#I  NextCocyclesCO: group of cycles is trivial\n" );
    	K := ocr.complement;
    	if IsBound(cor.condition) and not cor.condition(cor, K)  then
    	    return [];
    	else
           return [ rec( complement := K, centralizer := S ) ];
    	fi;
    fi;

    # If  the  one  cohomology  group  is trivial, there is only one class of
    # complements.  Correct  the  blockstabilizer and return. If we only want
    # normal complements, this case cannot happen, as cobounds are trivial.
    SN := AgSubgroup( S, FactorArg( S, N ).generators, false );
    if Length(Base(ocr.oneCoboundaries))=Length(Base(ocr.oneCocycles))  then
    	InfoAgCo2( "#I  NextCocyclesCO: H^1 is trivial\n" );
    	K := ocr.complement;
    	if IsBound(cor.condition) and not cor.condition(cor, K)  then
    	    return [];
    	fi;
    	S := NextCentralizerCO( ocr, SN, ocr.complement );
        return [ rec( complement := K, centralizer := S ) ];
    fi;

    # If <S> = <N>, there are  no new blocks  under the operation  of <S>, so
    # get  all elements of  the one cohomology  group and return. If  we only
    # want normal complements,  there also are no  blocks under the operation
    # of <S>.
    B := BaseSteinitz( ocr.oneCocycles, ocr.oneCoboundaries );
    if SN.generators = [] or IsBound(ocr.normalIn)  then
    	L := Elements(RowSpace(B.factorspace, B.field, B.zero));
    	InfoAgCo2("#I  NextCocyclesCO: ",Length(L)," complements found\n");
        if IsBound(ocr.normalIn)  then
    	    InfoAgCo2("#I  NextCocyclesCO: normal complements, using H^1\n");
    	    LL := [];
    	    if IsBound(cor.condition)  then
    	    	for i  in L  do
    	    	    K := ocr.cocycleToComplement(i);
    	    	    if cor.condition(cor, K)  then    
    	    	    	Add(LL, rec(complement := K, centralizer := S));
    	    	    fi;
    	    	od;
    	    else
    	    	for i  in L  do
    	    	    K := ocr.cocycleToComplement(i);
    	    	    Add(LL, rec(complement := K, centralizer := S));
    	    	od;
    	    fi;
    	    return LL;
        else
    	    InfoAgCo2("#I  NextCocyclesCO: S meets N, using H^1\n");
    	    LL := [];
    	    if IsBound(cor.condition)  then
    	    	for i  in L  do
    	    	    K := ocr.cocycleToComplement(i);
    	    	    if cor.condition(cor, K)  then
    	    	        S := ocr.centralizer;
    	    	    	Add(LL, rec(complement := K, centralizer := S));
    	    	    fi;
    	    	od;
    	    else
    	    	for i  in L  do
    	    	    K := ocr.cocycleToComplement(i);
    	    	    S := ocr.centralizer;
    	    	    Add(LL, rec(complement := K, centralizer := S));
    	    	od;
    	    fi;
    	    return LL;
        fi;
    fi;

    # The situation is as follows.
    #
    #  S                   As <N>  does act trivial  on  the  onecohomology
    #   \   K              group,  compute first blocks of this group under
    #    \ / \             the operation of  <S>/<N>. But  as <S>/<N>  acts
    #     N   ?            affine,  this can be done using affine operation
    #      \ /             (given as matrices).
    #       1
    # Get  the  matrices describing the affine operations. The linear  part
    # of the  operation  is just conjugation of the entries of cocycle. The
    # translation are  commuators  with the  generators.  So check if <ocr>
    # has a small generating set. Use only these to form the commutators.

    # Translation: (.. h ..) -> (.. [h,c] ..)
    if IsBound( ocr.smallGeneratingSet )  then
        tau := function( c )
    	    local   l,  i,  j,  z,  v;
    	    l := [];
    	    for i  in ocr.smallGeneratingSet  do
    	    	Add( l, Comm( ocr.generators[i], c ) );
    	    od;
    	    l := ocr.listToCocycle( l );
    	    v := ShallowCopy( B.factorzero );
    	    for i  in [ 1 .. Length(l) ]  do
    	    	if LogVecFFE(l, i) <> false  then
        	    z := l[i];
    	    	    j := B.heads[i];
    	    	    if j > 0  then
    	    	    	l := l - z * B.factorspace[j];
    	    	    	v[j] := z;
    	    	    else
    	    	    	l := l - z * B.subspace[-j];
    	    	    fi;
    	    	fi;
    	    od;
    	    IsVector( v );
    	    return v;
    	end;
    else
        tau := function( c )
    	    local   l,  i,  j,  z,  v;
    	    l := [];
    	    for i  in ocr.generators  do
    	    	Add( l, Comm( i, c ) );
    	    od;
    	    l := ocr.listToCocycle( l );
    	    v := ShallowCopy( B.factorzero );
    	    for i  in [ 1 .. Length(l) ]  do
    	    	if LogVecFFE(l, i) <> false  then
    	    	    z := l[i];
    	    	    j := B.heads[i];
    	    	    if j > 0  then
    	    	    	l := l - z * B.factorspace[j];
    	    	    	v[j] := z;
    	    	    else
    	    	    	l := l - z * B.subspace[-j];
    	    	    fi;
    	    	fi;
    	    od;
    	    IsVector( v );
    	    return v;
    	end;
    fi;

    # Linear Operation: (.. hm ..) -> (.. (hm)^c ..)
    phi := function( z, c )
        local   l,  i,  j,  z,  v;
        l := ocr.listToCocycle( List( ocr.cocycleToList( z ), x -> x ^ c ) );
        v := ShallowCopy( B.factorzero );
        for i  in [ 1 .. Length( l ) ]  do
            if LogVecFFE( l, i ) <> false  then
                z := l[i];
                j := B.heads[i];
                if j > 0  then
                    l := l - z * B.factorspace[j];
                    v[j] := z;
                else
                    l := l - z * B.subspace[-j];
                fi;
            fi;
        od;
        IsVector( v );
        return v;
    end;

    # Fake things, <SN> and '<B>.factorspace' are not empty.
    L := rec( base := B.factorspace, isDomain := true );

    # Construct the affine operations and blocks under them.
    mats := AffineOperation( SN, L, phi, tau ).images;
    L    := AffineBlocksCO( SN, mats );
    InfoAgCo2( "#I  NextCocyclesCO:", Length( L ), " complements found\n" );

    # choose a representative from each block and correct the blockstab
    LL := [];
    for i  in L  do
        K := ocr.cocycleToComplement(i.vector*B.factorspace);
    	if not IsBound(cor.condition) or cor.condition(cor, K)  then
            if Z = []  then
                S := SumAgGroup( ocr.centralizer, i.stabilizer );
            else
                S := NextCentralizerCO(ocr, i.stabilizer, K);
            fi;
            Add(LL, rec(complement := K, centralizer := S));
    	fi;
    od;
    return LL;

end;


#############################################################################
##
#F  NextCentralCO( <cor>, <ocr>, <S> ) 	. . . . . . . . . . . . . . . . local
##
##  Get the conjugacy classes of complements in case <ocr.module> is central.
##
NextCentralCO := function( cor, ocr, S )
    local   z,K,N,Z,SN,B,L,tau,gens,imgs,A,T,heads,dim,s,v,j,i;

    # Try to split <ocr.group>
    K := ocr.group;
    N := ocr.module;

    # If  <K>  is no split extension of <N> return the trivial list, as there
    # are  no  complements.  We  compute  the cocycles only if the extenstion
    # splits.
    Z := OneCocyclesOC( ocr, true );
    if IsBool( Z )  then
    	if IsBound( ocr.normalIn )  then
    	    InfoAgCo2( "#I  NextCentralCO: no normal complements\n" );
    	else
    	    InfoAgCo2( "#I  NextCentralCO: no split extension\n" );
        fi;
        return [];
    fi;

    ocr.generators := ocr.complement.generators;

    # if there is only one complement it must be normal
    if Base(Z) = []  then
    	InfoAgCo2("#I  NextCentralCO: Z^1 is trivial\n");
    	K := ocr.complement;
    	if IsBound(cor.condition) and not cor.condition(cor, K)  then
    	    return [];
    	else
            return [ rec(complement := K, centralizer := S) ];
    	fi;
    fi;

    # If  the  one  cohomology  group  is trivial, there is only one class of
    # complements.  Correct  the  blockstabilizer and return. If we only want
    # normal complements, this cannot happen, as the cobounds are trivial.
    SN := AgSubgroup(S, FactorArg(S, N).generators, false);
    if Length(Base(ocr.oneCoboundaries))=Length(Base(ocr.oneCocycles))  then
    	InfoAgCo2( "#I  NextCocyclesCO: H^1 is trivial\n" );
    	K := ocr.complement;
    	if IsBound(cor.condition) and not cor.condition(cor, K)  then
    	    return [];
    	else
    	    S := NextCentralizerCO( ocr, SN, ocr.complement );
            return [ rec(complement := K, centralizer := S) ];
    	fi;
    fi;

    # If  <S>  =  <N>, there are no new blocks under the operation of <S>, so
    # get  all elements of the onecohomologygroup and return. If we only want
    # normal  complements,  there  also  are no blocks under the operation of
    # <S>.
    B := BaseSteinitz( ocr.oneCocycles, ocr.oneCoboundaries );
    if SN.generators = [] or IsBound( ocr.normalIn )  then
    	if IsBound( ocr.normalIn )  then
    	    InfoAgCo2("#I  NextCocyclesCO: normal complements, using H^1\n");
    	else
    	    InfoAgCo2( "#I  NextCocyclesCO: S meets N, using H^1\n" );
    	    S := ocr.centralizer;
        fi;
    	L := Elements( RowSpace( B.factorspace, B.field, B.zero ) );
    	T := [];
    	for i  in L  do
    	    K := ocr.cocycleToComplement(i);
    	    if not IsBound(cor.condition) or cor.condition(cor, K)  then
    	    	Add(T, rec(complement := K,  centralizer := S));
            fi;
    	od;
    	InfoAgCo2( "#I  NextCocyclesCO: ",Length(T)," complements found\n" );
    	return T;
    fi;

    # The  conjugacy  classes  of  complements  are cosets of the cocycles of
    # 0^S. If 'smallGeneratingSet' is given, do not use this gens.

    # Translation: (.. h ..) -> (.. [h,c] ..)
    if IsBound( ocr.smallGeneratingSet )  then
    	tau := function( c )
    	    local   l;
    	    l := [];
    	    for i  in ocr.smallGeneratingSet  do
    	    	Add( l, Comm( ocr.generators[ i ], c ) );
    	    od;
    	    return ocr.listToCocycle( l );
        end;
    else
    	tau := function( c )
    	    local   l;
    	    l := [];
    	    for i  in ocr.generators  do
    	    	Add( l, Comm( i, c ) );
    	    od;
    	    return ocr.listToCocycle( l );
        end;
    fi;
    gens := Igs( SN );
    imgs := List( gens, tau );

    # Now get a base for the subspace 0^S. For those zero  images which are
    # not part of a base a generators of the stabilizer can be generated.
    #     B   holds the base,
    #     A   holds the correcting elements for the base vectors,
    #     T   holds the stabilizer generators.
    dim := Length( imgs[ 1 ] );
    A := [];
    B := [];
    T := [];
    heads := [ 1 .. dim ] * 0;

    # Get the base starting with the last one and go up.
    for i  in Reversed( [ 1 .. Length(imgs) ] )  do
        s := gens[i];
        v := imgs[i];
        j := 1;
        while j <= dim and LogVecFFE( v, j ) = false  do
    	    j := j + 1;
    	od;
        while j <= dim and heads[j] <> 0  do
    	    z := v[j] / B[heads[j]][j];
    	    if z <> 0*z  then
                s := s / A[heads[j]] ^ ocr.logTable[LogFFE(z)+1];
    	    fi;
            v := v - v[j] / B[heads[j]][j] * B[heads[j]];
            while j <= dim and LogVecFFE( v, j ) = false  do
    	    	j := j + 1;
    	    od;
        od;
        if j > dim  then
            Add( T, s );
        else
            Add( B, v );
            Add( A, s );
            heads[ j ] := Length( B );
        fi;
    od;

    # So  <T>  now  holds a reversed list of generators for a stabilizer. <B>
    # is  a  base for 0^<S> and <cocycles>/0^<S> are the conjugacy classes of
    # complements.
    S := SumAgGroup(N, AgSubgroup(S, Reversed(T), false));
    if B = []  then
        B := Elements(Z);
    else
    	B := BaseSteinitz(Z, RowSpace(B, Z.field, Z.zero));
        B := Elements(RowSpace(B.factorspace, B.field, B.zero));
    fi;
    L := [];
    for i  in B  do
    	K := ocr.cocycleToComplement(i);
    	if not IsBound(cor.condition) or cor.condition(cor, K)  then
    	    Add(L, rec(complement := K, centralizer := S));
    	fi;
    od;
    InfoAgCo2("#I  NextCentralCO: ", Length(L), " complements found\n");
    return L;

end;


#############################################################################
##
#F  NextNormalCO( <cor>, <ocr>, <S>, <L> )  . . . . . . . . . . . . . . local
##
##  Compute  the  conjugacy  classes,  if  <L>  is  a  normal subgroup of the
##  intersection of all complements.
##
NextNormalCO := function( cor, ocr, S, L )
    local   K,  N,  T,  i,  new,  B;

    K := ocr.group;
    N := ocr.module;

    # The situtation is as follows.
    #
    #   SL                We first compute the conjugacy  classes
    #   / \               modulo <L>. Then the complements modulo
    #  S   \              1 are the complete preimages.
    #   \   A   K         The centralizer <B> is the intersection
    #    \ / \ / \        of <S> and the stabilizer  <A>. As  <S>
    #     B   NL  ?       is normal (S = C_M(K)) this is easy.
    #      \ / \ /
    #       N   L
    #        \ /
    #         1
    #
    new := rec();
    new.group := AgSubgroup(K, FactorArg(K, L).generators, false);
    new.module:= AgSubgroup(K,FactorArg(SumAgGroup(N,L),L).generators,false);
    S := AgSubgroup(S, FactorArg(S, L).generators, false);

    # give some information about the new groups
    InfoAgCo2("#I  NextNormalCO: old composition length: ",
    	      Length(Igs(ocr.group)),", new: ",Length(Igs(new.group)),"\n");

    # The   information  of   <pPrimeSets>  or  <smallGeneratingSets>  cannot
    # be mantained  without  much   effort.  So get  the   complements  using
    # 'NextCocyclesCO'.
    B := NextCocyclesCO(cor, new, S);
    T := [];
    InfoAgCo2( "#I  NextNormalCO: computing preimages and intersections\n" );
    for i  in B  do
    	K := SumAgGroup(L, i.complement.group);
    	if not IsBound(cor.condition) or cor.condition(cor, K)  then
    	    Add(T, rec(complement  := K,
    	    	       centralizer := NormalIntersection(S, i.centralizer)));
    	fi;
    od;
    return T;

end;


#############################################################################
##
#F  NextComplementsCO( <cor>, <S>, <K>, <M> ) . . . . . . . . . . . . . local
##
NextComplementsCO := function( cor, S, K, M )
    local   L,  p,  C,  ocr;

    if M.generators = []  then
    	if IsBound(cor.condition) and not cor.condition(cor, K)  then
    	    return [];
    	else
            return [ rec( complement := K, centralizer := S ) ];
    	fi;
    elif IntersectionSet( FactorsAgGroup(M), FactorsAgGroup(K,M) ) = []  then

        # If <K> and <M> are coprime, <K> splits.
    	InfoAgCo2( "#I  NextComplementsCO: coprime case, <K> splits\n" );
        ocr := rec( group := K, module := M );
        if IsBound( cor.generators )  then
            ocr.generators := cor.generators;
        fi;
        if IsBound( cor.smallGeneratingSet )  then
            ocr.smallGeneratingSet := cor.smallGeneratingSet;
            ocr.generatorsInSmall  := cor.generatorsInSmall;
        elif IsBound( cor.primes )  then
            p := RelativeOrderAgWord( M.generators[ 1 ] );
            if p in cor.primes  then
                ocr.pPrimeSet := cor.pPrimeSets[ Position( cor.primes, p ) ];
            fi;
        fi;
        if IsBound( cor.relators )  then
            ocr.relators := cor.relators;
        fi;
        OneCocyclesOC( ocr, true );
        OneCoboundariesOC( ocr );
    	if     IsBound( cor.normalComplements )
    	   and cor.normalComplements
    	   and Base( ocr.oneCoboundaries ) <> []
    	then
    	    return [];
    	else
    	    K := ocr.complement;
    	    if IsBound(cor.condition) and not cor.condition(cor, K)  then
    	    	return [];
    	    fi;
    	    S := AgSubgroup( S, FactorArg( S, M ).generators, false );
    	    S := NextCentralizerCO( ocr, S, K );
    	    return [ rec( complement := K, centralizer := S ) ];
    	fi;
    else

    	# In the non-coprime case, we must construct cocycles.
    	ocr := rec( group := K, module := M );
    	if IsBound( cor.generators )  then
            ocr.generators := cor.generators;
    	fi;
    	if IsBound( cor.normalComplement ) and cor.normalComplements  then
            ocr.normalIn := S;
    	fi;
    	if IsBound( cor.normalSubgroup )  then
            L := cor.normalSubgroup( S, K, M );
            if L.generators = []  then
            	return NextCocyclesCO(cor, ocr, S);
            else
            	return NextNormalCO(cor, ocr, S, L);
            fi;
    	else
    	    if IsBound( cor.smallGeneratingSet )  then
       	    	ocr.smallGeneratingSet := cor.smallGeneratingSet;
            	ocr.generatorsInSmall  := cor.generatorsInSmall;
    	    elif IsBound( cor.primes )  then
            	p := RelativeOrderAgWord( M.generators[ 1 ] );
            	if p in cor.primes  then
            	    ocr.pPrimeSet := cor.pPrimeSets[Position(cor.primes,p)];
		fi;
            fi;
    	    if IsBound( cor.relators )  then
            	ocr.relators := cor.relators;
    	    fi;
    	    if    ( cor.useCentral and IsCentral( Parent(M), M ) )
      	       or ( cor.useCentralSK and IsCentral(S,M) and IsCentral(K,M) )
    	    then
            	return NextCentralCO(cor, ocr, S);
    	    else
            	return NextCocyclesCO(cor, ocr, S);
    	    fi;
    	fi;
    fi;

end;


#############################################################################
##
#F  ComplementsCO( <cor>, <G>, <n>, <all> ) . . . . . . . . . . . . . . local
##
##  Compute the complements in <G> of the  <n>.th elementary abelian subgroup
##  in  the elementary abelian  series of <G>.  If  <all>  is  true, find all
##  (conjugacy classes) of  complements.  Otherwise   try  to find  just  one
##  complement.
##
ComplementsCO := function( cor, G, n, all )
    local   time, E, C, r, a, a0, FG, FE, nextStep, found, i, j;

    # this function will only work for parent groups
    if not IsParent( G )  then
    	Error( "<G> must be a parent group" );
    fi;

    # give some information and start timing
    InfoAgCo2( "#I  Complements: initialize factorgroups\n" );
    time := Runtime();

    # compute the complement of <n>.th element of <E>
    if not IsBound(cor.elementaryAbelianSeries)  then
        cor.elementaryAbelianSeries := ElementaryAbelianSeries(G);
    fi;
    if not ForAll( cor.elementaryAbelianSeries, IsElementAgSeries ) then
        Error( "the ag series must refine elementary abelian series" );
    fi;

    # we only need the series beginning from position <n>
    E := cor.elementaryAbelianSeries;
    E := Sublist( E, [ n .. Length(E) ] );
    r := Length(E);

    # Construct the homomorphisms <a>[i] = <G>/<E>[i+1] -> <G>/<E>[i].
    a  := HomomorphismsSeries( G, E );
    a0 := a[1];
    a  := Sublist( a, [ 2 .. r ] );

    # <FG> contains the factorgroups <G>/<E>[1], ..., <G>/<E>[<r>].
    FG := List( a, x -> x.range );
    Add( FG, a[r-1].source );

    # <FE> contains the modules -, <E>[1]/<E>[2], ..., <E>[r-1]/<E>[r].
    FE := [];
    FE[r] := E[r-1];
    for i  in [ 2 .. r-1 ]  do
        FE[i] := E[i-1];
        for j  in Reversed( [ i .. r-1 ] )  do
            FE[i] := Image( a[j], FE[i] );
        od;
    od;

    # As all entries in <cor> are optional, initialize them if they are not
    # present in <cor> with the following defaults.
    #
    #     'elementaryAbelianSeries' : standard elementary abelian series
    #                                 (this happened already above)
    #     'generators'              : standard generators
    #     'relators'                : pc-relators
    #     'useCentral'              : false
    #     'useCentralSK'            : false
    #     'normalComplements'       : false
    #
    if not IsBound( cor.useCentral )  then
        cor.useCentral := false;
    fi;
    if not IsBound( cor.useCentralSK )  then
        cor.useCentralSK := false;
    fi;
    if not IsBound( cor.normalComplements )  then
        cor.normalComplements := false;
    fi;
    if IsBound( cor.generators )  then
        cor.generators := List( cor.generators, x -> Image(a0, x) );
    else
        cor.generators := Cgs( FG[1] );
    fi;
    if not IsBound( cor.normalSubgroup )  then
        cor.group  := FG[1];
        cor.module := TrivialSubgroup( FG[1] );
        OCAgGroupOps.AddRelations(cor);
    fi;

    # The  following  function will be called recursively in order to descend
    # the tree and reach a complement.  <nr> is the current level.
    nextStep := function( S, K, nr )
        local   M,  NC,  X;

        # give information about the level reached
    	InfoAgCo1( "#I  Complements: reached level ", nr, " of ", r, "\n" );

    	# if this is the last level we have a complement, add it to <C>
        if nr = r  then
            Add( C, rec( complement := K, centralizer := S ) );
    	    InfoAgCo1( "#I  Complements: next class found, ",
                       "total ", Length(C), " complement(s), ",
    	    	       "time=", Runtime() - time, "\n" );
            found := true;

    	# otherwise try to split <K> over <M> = <FE>[<nr>+1]
     	else
            S := PreImage( a[nr], S );
            M := FE[nr+1];
    	    cor.module := M;

    	    # we cannot take the 'PreImage' as this changes the gens
    	    cor.generators := List( K.generators, x ->
    	    	    	    	    PreImagesRepresentative(a[nr],x) );
    	    K := Subgroup( FG[nr+1], cor.generators );

    	    # now 'NextComplementsCO' will try to find the complements
            NC := NextComplementsCO( cor, S, K, M );

    	    # try to step down as fast as possible
            for X  in NC  do
            	nextStep( X.centralizer, X.complement, nr+1 );
            	if found and not all  then
    	    	    return;
    	    	fi;
            od;
    	fi;
    end;

    # in <C> we will collect the complements modulo <E>[r]
    C := [];

    # ok, start 'nextStep'  with trivial module
    InfoAgCo1("#I  Complements: starting search, time=",Runtime()-time,"\n");
    found := false;
    nextStep( AgSubgroup( FG[ 1 ], [], true ),
    	      AgSubgroup( FG[ 1 ], cor.generators, false ),
              1 );

    # some timings
    InfoAgCo1( "#I  Complements: ",Length(C)," complement(s) found, ",
    	       "time=", Runtime()-time, "\n" );

    # add the normalizer
    InfoAgCo2( "#I  Complements: adding normalizers\n" );
    for i  in [ 1 .. Length(C) ]  do
    	C[i].complement.normalizer := SumAgGroup( C[i].centralizer,
                                                  C[i].complement );
    od;
    return C;

end;


#############################################################################
##
#F  ComplementsCO2( <G>, <N>, <all>, <fun> )  . . . . . . . . . . . . . local
##
##  Prepare arguments for 'ComplementCO'.
##
ComplementsCO2 := function( G, N, all, fun )
    local   E,  L,  cor,  a,  i,  l;

    # if <G>  is  not  a parent or  <N>  not  part  of  the  ag series
    # construct   a   new  group  with   this   properties   and   use
    # 'ComplementCO2' again.
    if    not IsParent( G )
       or not IsElementaryAbelianAgSeries( G )
       or not IsElementAgSeries( N )
    then
        a := IsomorphismAgGroup( [ G, N, TrivialSubgroup(G) ] );
    	G := Image( a, G );
    	N := Image( a, N );
        return List( ComplementsCO2( G, N, all, fun ), x -> rec(
    	        complement  := PreImage( a, x.complement ),
    	    	centralizer := PreImage( a, x.centralizer ) ) );
    fi;

    # Get the elementary abelian series through <N>.
    E := ElementaryAbelianSeries( G );
    if not N in E  then
        L := [];
        i := 1;
        l := Length( E );
        while i <= l and IsSubgroup( E[ i ], N )  do
            Add( L, E[ i ] );
            i := i + 1;
        od;
        Add( L, N );
        Append( L, Sublist( E, [ i .. l ] ) );
        E := L;
    fi;

    # if <G> and <N> are coprime <G> splits over <N>
    if IntersectionSet( FactorsAgGroup(N), FactorsAgGroup(G,N) ) = []  then
    	InfoAgCo2( "#I  Complements: coprime case, <G> splits\n" );
    	cor := rec();

    # otherwise we compute a hall system for <G>/<N>
    else
    	InfoAgCo2( "#I  Complements: computing p prime sets\n" );
        a   := NaturalHomomorphism( G, G / N );
        cor := PPrimeSetsOC( Image( a ) );
        cor.generators := List( cor.generators, x -> 
    	    	    	    	PreImagesRepresentative( a, x ) );
    	cor.useCentralSK := true;
    fi;

    # we want our nice elementary abelian series
    cor.elementaryAbelianSeries := E;

    # if a condition was given use it
    if IsFunc(fun)  then cor.condition := fun;  fi;

    # 'ComplementsCO' will do most of the work
    return ComplementsCO( cor, G, Position(E,N), all );

end;


#############################################################################
##
#F  Complementclasses( <G>, <N> ) . . . . . . . . . . . . find all complement
##
AgGroupOps.Complementclasses := function( G, N )
    local   C;

    # if <G> and <N> are equal the only complement is trivial
    if G = N  then
    	C := [ TrivialSubgroup(G) ];

    # if <N> is trivial the only complement is <G>
    elif N.generators = []  then
    	C := [ G ];

    # otherwise we have to work
    else
        C := List( ComplementsCO2(G, N, true, false), G -> G.complement );
    fi;

    # return what we have found
    return C;

end;

Complementclasses := function( G, N )
    return G.operations.Complementclasses(G, N);
end;


#############################################################################
##
#F  ComplementAgGroup( <G>, <N> ) . . . . . . . . . . . . find one complement
##
AgGroupOps.Complement := function( G, N )
    local   C;

    # if <G> and <N> are equal the only complement is trivial
    if G = N  then
    	C := TrivialSubgroup(G);

    # if <N> is trivial the only complement is <G>
    elif N.generators = []  then
    	C := G;

    # otherwise we have to work
    else
        C := ComplementsCO2( G, N, false, false );
    	if 0 < Length(C)  then
    	    C := C[1].complement;
    	else
    	    C := false;
    	fi;
    fi;

    # return what we have found
    return C;

end;

Complement := function( G, N )
    return G.operations.Complement( G, N );
end;


#N  The  following worked in  GAP 2.4  but needs to be implemented in GAP 3.1


#############################################################################
##
#F  NormalSubgroup1CO( <S>, <K>, <M> )
##
##  Let C = C_K( M ), then the subgroup C^P[C,C] lies in every
##  complement.
##
#X
#XNormalSubgroup1CO := function( S, K, M )
#X
#X    local C, CK, cCK,
#X          p,
#X          i, j,
#X          gens;
#X
#X    ## At first get the centralizer in the whole group. This is a normal
#X    ## subgroup. So C_K(M) is the normal intersection.
#X    C  := CentralizerAgGroup( M );
#X    CK := NormalIntersectionAgGroup( C, K );
#X
#X    ## Now add the p-power of the generators to the commutator subgroup.
#X    p    := IndexAgWord( GeneratorsAgGroup( M )[ 1 ] );
#X    cCK  := GeneratorsAgGroup( CK );
#X    gens := [];
#X    for i  from 1  to length( cCK ) - 1  do
#X        for j  from i + 1  to length( cCK )  do
#X            Add( gens, Comm( cCK[i], cCK[j] ) );
#X        od;
#X        Add( gens, cCK[ i ] ^ p );
#X    od;
#X
#X    #3 return( Cgs( K, Set( gens ) ) );
#X    return( Cgs( K, cras( gens ) ) );
#X
#Xend;
