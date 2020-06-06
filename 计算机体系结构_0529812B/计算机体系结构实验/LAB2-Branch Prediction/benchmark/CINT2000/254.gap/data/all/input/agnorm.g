#############################################################################
##
#A  agnorm.g                    GAP library                      Frank Celler
##
#A  @(#)$Id: agnorm.g,v 3.15.1.1 1994/11/04 12:28:00 ahulpke Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the ag group normalizer algorithm.
##
#H  $Log: agnorm.g,v $
#H  Revision 3.15.1.1  1994/11/04  12:28:00  ahulpke
#H  slight modification for Conjugacy test of Ag Subgroups
#H
#H  Revision 3.15  1994/02/16  14:39:48  fceller
#H  replaced 'LogVecFFE' by 'IntVecFFE'
#H
#H  Revision 3.14  1993/03/15  10:37:42  fceller
#H  'Lattice' needs that the parent group of the normalizer is
#H  identical to the parent group of the arguments.
#H
#H  Revision 3.13  1993/03/12  13:31:01  fceller
#H  normalizers in small groups are computed directly
#H
#H  Revision 3.12  1992/04/16  08:22:33  fceller
#H  fixed a bug in a call to 'G.operations.Exponents'
#H
#H  Revision 3.11  1992/04/09  06:30:01  fceller
#H  fixed one more comparison with '0'
#H
#H  Revision 3.10  1992/04/07  14:28:07  fceller
#H  fixed a few typos
#H
#H  Revision 3.9  1992/04/07  12:53:37  fceller
#H  changed comparison with '0'
#H
#H  Revision 3.8  1992/03/30  07:47:09  fceller
#H  changed 'Exponents' slightly.
#H
#H  Revision 3.7  1992/02/29  15:04:09  fceller
#H  use 'LogVecFFE'
#H
#H  Revision 3.6  1992/02/26  14:19:41  fceller
#H  'AgGroupOps.Normalizer' now uses normalized args for NormalizerNO
#H
#H  Revision 3.5  1992/02/07  18:11:40  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/09/09  07:44:51  fceller
#H  Initial Release under RCS
##


#############################################################################
##
#F  InfoAgNorm1( <arg> )  . . . . . . . . . . . . . . . . package information
#F  InfoAgNorm2( <arg> )  . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoAgNorm1 )  then InfoAgNorm1 := Ignore;  fi;
if not IsBound( InfoAgNorm2 )  then InfoAgNorm2 := Ignore;  fi;


#############################################################################
##

#F  NormalizeIgs( <igs> ) . . . . . . . . . . . . . normalize an <igs>, local
##
#NormalizeIgs := function( igs )
#    local   i,  j,  exp;
#
#    # Normalize leading exponent to one.
#    for i  in [ 1 .. Length( igs ) ]  do
#        igs[ i ] := igs[ i ] ^ ( 1 / LeadingExponentAgWord( igs[ i ] )
#                                  mod RelativeOrderAgWord( igs[ i ] ) );
#    od;
#
#    # Make zeros above the diagonale.
#    for i  in [ 1 .. Length( igs ) - 1 ]  do
#        for j  in [ i + 1 .. Length( igs ) ]  do
#            exp := ExponentAgWord( igs[ i ], DepthAgWord( igs[ j ] ) );
#            if exp <> 0  then
#                exp := RelativeOrderAgWord( igs[ j ] ) - exp;
#                igs[ i ] := igs[ i ] * igs[ j ] ^ exp;
#            fi;
#        od;
#    od;
#
# end;

NormalizeIgsMod := function( U, igs )
    local   D,  di,  dj,  i,  j,  exp,  cgs,  mix;

    # Normalize leading exponent to one.
    for i  in [ 1 .. Length( igs ) ]  do
        igs[ i ] := igs[ i ] ^ ( 1 / LeadingExponentAgWord( igs[ i ] )
                                  mod RelativeOrderAgWord( igs[ i ] ) );
    od;

    # Mix <U> and <igs>.
    cgs := Cgs( U );
    mix := [];
    D := [];
    i := 1;
    j := 1;
    while i <= Length( igs ) and j <= Length( cgs )  do
    	di := DepthAgWord( igs[ i ] );
    	dj := DepthAgWord( cgs[ j ] );
    	if di < dj  then
    	    Add( mix, igs[ i ] );
    	    D[ di ] := Length( mix );
	    i := i + 1;
    	elif dj < di  then
    	    Add( mix, cgs[ j ] );
    	    D[ dj ] := Length( mix );
	    j := j + 1;
    	else
    	    Error( "common depth in <igs> and <U>" );
    	fi;
    od;
    while i <= Length( igs )  do
	Add( mix, igs[ i ] );
	D[ DepthAgWord( igs[ i ] ) ] := Length( mix );
	i := i + 1;
    od;
    while j <= Length( cgs )  do
	Add( mix, cgs[ j ] );
	D[ DepthAgWord( cgs[ j ] ) ] := Length( mix );
	j := j + 1;
    od;	    

    # Make zeros above the diagonale.
    for i  in [ 1 .. Length( igs ) ]  do
        for j  in [ D[ DepthAgWord(igs[i]) ] + 1 .. Length( mix ) ]  do
            exp := ExponentAgWord( igs[ i ], DepthAgWord( mix[ j ] ) );
            if exp <> 0  then
                exp := RelativeOrderAgWord( mix[ j ] ) - exp;
                igs[ i ] := igs[ i ] * mix[ j ] ^ exp;
            fi;
        od;
    od;

end;

NormalizeIgsModLess := function( U, igs )
    local   i,  j,  exp,  cgs;

    # Normalize leading exponent to one.
    for i  in [ 1 .. Length( igs ) ]  do
        igs[ i ] := igs[ i ] ^ ( 1 / LeadingExponentAgWord( igs[ i ] )
                                  mod RelativeOrderAgWord( igs[ i ] ) );
    od;


    # Make zeros above the diagonale.
    cgs := Cgs( U );
    for i  in [ 1 .. Length( igs ) ]  do
        for j  in [ i + 1 .. Length( igs ) ]  do
            exp := ExponentAgWord( igs[ i ], DepthAgWord( igs[ j ] ) );
            if exp <> 0  then
                exp := RelativeOrderAgWord( igs[ j ] ) - exp;
                igs[ i ] := igs[ i ] * igs[ j ] ^ exp;
            fi;
        od;
        for j  in [ 1 .. Length( cgs ) ]  do
            exp := ExponentAgWord( igs[ i ], DepthAgWord( cgs[ j ] ) );
            if exp <> 0  then
                exp := RelativeOrderAgWord( cgs[ j ] ) - exp;
                igs[ i ] := igs[ i ] * cgs[ j ] ^ exp;
            fi;
        od;
    od;

end;


#############################################################################
##
#F  StabilizerNO( <S>, <U>, <K> ) . . . . . . . . . . . . . normalizer, local
##
##  Compute the normalizer  of <U>/<K> in  <S>/<K>  using a simple stabilizer
##  orbit algorithm. Choose between
##
##  'Stabilizer1NO': orbits are not explict calculated, this uses fewer space
##  	    	     but takes more time.
##  'Stabilizer2NO': orbits are calculated, this is faster but it uses a  lot
##  	    	     more space. (default)
##
StabilizerOp1 := function( L, x )
    L := HomomorphicIgs( L, x );
    NormalizeIgs( L );
    return L;
end;

StabilizerOp2 := function( a, x )
    a := a ^ x;
    return a^( 1 / LeadingExponentAgWord( a ) mod RelativeOrderAgWord( a ) );
end;

Stabilizer1NO := function( arg )
    local   U,  G,  op,  K,  cgs;

    InfoAgNorm2( "#I  StabilizerNO: stabilizer algorithm\n" );

    if Length( arg ) = 2  then
    	cgs := Cgs( arg[2] );
    	if Length( cgs ) = 1  then
    	    return Stabilizer( arg[1], cgs[1], StabilizerOp2 );
    	else
    	    return Stabilizer( arg[1], cgs, StabilizerOp1 );
    	fi;
    else

    	# The following is surely a hack, but it should work.
	G := Parent( arg[1], arg[2], arg[3] );
        K := arg[3];
	U := AgSubgroup( G, FactorArg( arg[1], K ).generators, false );
	cgs := FactorArg( arg[2], K ).generators;
    	if K.generators = []  then
    	    if Length( cgs ) = 1  then
    	    	U := Stabilizer( U, cgs[1], StabilizerOp2 );
    	    else
    	    	U := Stabilizer( U, cgs, StabilizerOp1 );
    	    fi;
    	elif DepthAgWord(cgs[Length(cgs)])<DepthAgWord(Igs(K)[1]) then
    	    op := function( L, x )
	    	L := HomomorphicIgs( L, x );
	    	NormalizeIgsModLess( K, L );
	    	return L;
	    end;
    	    NormalizeIgsModLess( K, cgs );
    	    U := Stabilizer( U, cgs, op );
    	else
    	    op := function( L, x )
	    	L := HomomorphicIgs( L, x );
	    	NormalizeIgsMod( K, L );
	    	return L;
	    end;
    	    NormalizeIgsMod( K, cgs );
    	    U := Stabilizer( U, cgs, op );
    	fi;
	return SumAgGroup( U, K );
    fi;

end;

Stabilizer2NO := function( arg )
    local   U,  G,  op,  K,  cgs;

    InfoAgNorm2( "#I  StabilizerNO: orbit and stabilizer algorithm\n" );

    if Length( arg ) = 2  then
    	cgs := Cgs( arg[2] );
    	if Length( cgs ) = 1  then
    	    cgs := cgs[1];
    	    op  := StabilizerOp2;
    	else
    	    op := StabilizerOp1;
    	fi;
    	return AgOrbitStabilizer( arg[1],
    	    	    	    	  Igs( arg[1] ),
    	    	    	    	  cgs,
				  op ).stabilizer;
    else

    	# The following is surely a hack, but it should work.
	G := Parent( arg[1], arg[2], arg[3] );
        K := arg[3];
	U := AgSubgroup( G, FactorArg( arg[1], K ).generators, false );
	cgs := FactorArg( arg[2], K ).generators;
    	if K.generators = []  then
    	    if Length( cgs ) = 1  then
    	    	cgs := cgs[1];
    	    	op  := StabilizerOp2;
    	    else
    	    	op := StabilizerOp1;
    	    fi;
    	    U := AgOrbitStabilizer( U, U.igs, cgs, op ).stabilizer;
    	elif DepthAgWord(cgs[Length(cgs)])<DepthAgWord(Igs(K)[1]) then
    	    op := function( L, x )
	    	L := HomomorphicIgs( L, x );
	    	NormalizeIgsModLess( K, L );
	    	return L;
	    end;
	    NormalizeIgsModLess( K, cgs );
    	    U := AgOrbitStabilizer( U, U.igs, cgs, op ).stabilizer;
    	else
    	    op := function( L, x )
	    	L := HomomorphicIgs( L, x );
	    	NormalizeIgsMod( K, L );
	    	return L;
	    end;
	    NormalizeIgsMod( K, cgs );
    	    U := AgOrbitStabilizer( U, U.igs, cgs, op ).stabilizer;
    	fi;
	return SumAgGroup( U, K );
    fi;

end;

StabilizerNO := Stabilizer2NO;


#############################################################################
##
#F  GlasbyNO( <S>, <NiS>, <U1>, <U2> ) 	. . .  normalizer of <U1>/<U2>, local
##
GlasbyNO := function( S, NiS, U1, U2 )
    local   G,  L,  T,  V,  U,  K,  Ns,  mats,  stb,  i,  j,  s,  v;

    # The situtation is as follows:
    #
    #	    	S
    #	    	 \
    #	    	  \
    #	    	   Us
    #	    	  /  \
    #	    	 /    \
    #	       U1      Ns       N
    #	    	 \    /  \     /
    #	    	  \  /	  \   /
    #	    	   U2	   NiS
    #                \	  /
    #	    	      \	 /
    #	    	       Un
    #
    G := Parent( U1, U2 );
    T := AgSubgroup( G, [], true );
    L := FactorArg( U1, U2 ).generators;
    NormalizeIgsMod( U2, L );
    U := AgSubgroup( G, L, true );
    stb := ShallowCopy( FactorArg( S, NiS ).generators );
    InfoAgNorm2( "#I  GlasbyNO: correcting blockstabilizer\n" );
    for i  in [ 1 .. Length( stb ) ]  do
    	K := HomomorphicIgs( L, stb[i] );
    	NormalizeIgsMod( U2, K );
    	V := AgSubgroup( G, K, true );
    	stb[i] := stb[i] * ConjugatingWordGS( NiS, V, U, T );
    od;

    # Now compute the stabilizer in <NiS>.
    InfoAgNorm2( "#I  GlasbyNO: computing centralizer in <NiS>\n" );
    Ns := NiS mod U2;
    Ns.field := GF( RelativeOrderAgWord( Ns.generators[1] ) );
    V := rec( isDomain := true, base := Ns.generators );
    mats := LinearOperation( U, V, function( x, a ) 
                return Exponents( Ns, x ^ a, Ns.field ); end ).images;
    T := mats[1]^0;
    L := [];
    for i  in [ 1 .. Length( mats[1] ) ]  do
    	L[i] := [];
    	for j  in [ 1 .. Length( mats ) ]  do
    	    Append( L[i], T[ i ] - mats[j][i] );
    	od;
    od;
    IsMat( L );
    V := NullspaceMat( L );
    L := Ns.generators;
    for v  in V  do
    	s := Ns.identity;
    	for i  in [ 1 .. Length( v ) ]  do
    	    if IntVecFFE(v,i) <> 0  then
    	    	s := s * L[i]^IntVecFFE(v,i);
    	    fi;
    	od;
    	Add( stb, s );
    od;

    # Now we have the normalizer in <S> / <U2>.  Get the complete preimage.
    return SumAgGroup( AgSubgroup( G, stb, false ), U2 );

end;


#############################################################################
##
#F  AbstractBaseMat( <A>, <L>, <F> )  . . . . . . . triangulize and make base
##
AbstractBaseMat := function ( A, L, F )
    local   A,  L,  m,  n,  i,  j,  k,  a,  r,  P,  F,  z,  z0;

    P := IntegerTable( F );

    # get the size of the matrix
    A := ShallowCopy(A);
    L := ShallowCopy(L);
    m := Length(L);
    n := Length(L[1]);
    InfoAgNorm2( "#I  AbstractBaseMat: nonzero columns: \c" );

    # run through all columns of the matrix
    z0 := F.zero;
    i  := 0;
    for k  in [ 1 .. n ]  do
        j := i + 1;
        while j <= m and IntVecFFE( L[j], k ) = 0 do
            j := j + 1;
        od;
        if j <= m  then
            InfoAgNorm2( k," \c" );
            i := i + 1;
            z := L[j][k]^-1;
            a := A[j];  A[j] := A[i];  A[i] := a ^ IntFFE(z);
            r := L[j];  L[j] := L[i];  L[i] := z * r;
            for j  in [ 1 .. m ] do
                z := L[j][k];
                if  i <> j and z <> z0  then
                    A[j] := A[j] / ( A[i] ^ IntFFE(z) );
                    L[j] := L[j] - z * L[i];
                fi;
            od;

        fi;
    od;
    InfoAgNorm2( "\n" );

    n := [ [], [] ];
    r := 0 * L[ 1 ];
    for i  in [ 1 .. m ]  do
        if L[ i ] <> r  then
            Add( n[1], A[i] );
            Add( n[2], L[i] );
        fi;
    od;
    return n;

end;


#############################################################################
##
#F  CoboundsNO( <S>, <NiS>, <U1>, <U2> )  . . . . . . . . . . . . . . . local
##
CoboundsNO := function( S, NiS, U1, U2 )

    local   B,	    	# base for coboundaries
    	    G,	    	# parent group
    	    U,	    	# <U1> / <U2>
    	    Ui,	    	# cgs inverse
    	    NB,	    	# trianglized ops for <NiS>
    	    C,	    	# base for centralizer
    	    K,	    	# field GF(p) of <NiS>
    	    T,	    	# log table for GF(p)
    	    Us,	    	# <U1> * <NiS>
    	    mats,   	# operation matrices
    	    heads,  	# heads of <B>
    	    V,	    	# nullspace
    	    op,	    	# operation on cocycles
    	    Ns,
    	    L,
    	    ln1, ln2,
    	    v,  s,
    	    i,  j,  k;


    # The situtation is as follows:
    #
    #	    	S
    #	    	 \
    #	    	  \
    #	    	   Us
    #	    	  /  \
    #	    	 /    \
    #	       U1      Ns       N
    #	    	 \    /  \     /
    #	    	  \  /	  \   /
    #	    	   U2	   NiS
    #                \	  /
    #	    	      \	 /
    #	    	       Un
    #
    G  := Parent( U1, U2 );
    Us := SumAgGroup( NiS, U1 );
    U2 := Normalized( U2 );
    L  := FactorArg( U1, U2 ).generators;
    NormalizeIgsModLess( U2, L );
    U := AgSubgroup( G, L, true );
    if U2.cgs<>[] and DepthAgWord(L[Length(L)])>=DepthAgWord(U2.cgs[1])  then
    	Error( "internal error, depth are not less" );
    fi;
    InfoAgNorm2("#I  CoboundsNO: computing coboundaries and centralizer\n");

    # Now compute the stabilizer in <NiS> and the coboundaries.
    NiS := Normalized( NiS );
    U2  := Normalized( U2 );
    Ns  := NiS mod U2;
    Ns.field := GF( RelativeOrderAgWord( Ns.generators[1] ) );
    V := rec( isDomain := true, base := Ns.generators );
    mats := LinearOperation( U, V, function( x, a ) 
                return Exponents( Ns, x ^ a, Ns.field ); end ).images;
    T := mats[1]^0;
    L := [];
    for i  in [ 1 .. Length( mats[1] ) ]  do
    	L[i] := [];
    	for j  in [ 1 .. Length( mats ) ]  do
    	    Append( L[i], T[i] - mats[j][i] );
    	od;
    od;
    IsMat( L );
    B  := AbstractBaseMat( Ns.generators, L, Ns.field );
    NB := B[1];
    B  := B[2];
    if B = []  then
    	InfoAgNorm2( "#I  CoboundsNO: coboundaries are trivial\n" );
    	return StabilizerNO( S, U1, U2 );
    fi;
    InfoAgNorm2( "#I  CoboundsNO: order of coboundaries ", Ns.field.char,
	         "^", Length( B ), "\n" );
    V := NullspaceMat( L );
    K := Ns.field;
    L := Ns.generators;
    C := [];
    for v  in V  do
    	s := Ns.identity;
    	for i  in [ 1 .. Length(v) ]  do
    	    if IntVecFFE(v,i) <> 0  then
    	    	s := s * L[i]^IntVecFFE(v,i);
    	    fi;
    	od;
    	Add( C, s );
    od;

    # Compute the heads of the coboundaries.
    heads := [];
    k := 1;
    i := 1;
    while i <= Length(B) and k <= Length(B[1])  do
    	if IntVecFFE(B[i],k) <> 0  then
    	    heads[i] := k;
	    i := i+1;
    	fi;
	k := k+1;
    od;

    # Now the function which operates on the coboundaries.
    U  := U.cgs;
    Ui := List( U, x -> x^-1 );
    Ns := NiS mod U2;
    ln1 := Length( Ns.generators );
    ln2 := Length( U );
    op := function( v, x )
    	local	w,  k,  i,  j;

    	w := ShallowCopy( U );
    	k := 0;
    	for i  in [ 1 .. ln2 ]  do
    	    for j  in [ 1 .. ln1 ]  do
    	    	if IntVecFFE(v,k+j) <> 0  then
    	    	    w[i] := w[i]*Ns.generators[j]^IntVecFFE(v,k+j);
    	    	fi;
    	    od;
    	    k := k + ln1;
    	od;
    	w := HomomorphicIgs( w, x );
    	NormalizeIgsModLess( U2, w );
    	v := [];
    	for i  in [ 1 .. ln2 ]  do
    	    Append( v, Ns.operations.Exponents( Ns, Ui[i]*w[i], Integers ) );
    	od;
    	v := v * K.one;
    	for i  in [ 1 .. Length(heads) ]  do
    	    if IntVecFFE(v,heads[i]) <> 0  then
    	    	v := v - v[heads[i]] * B[i];
    	    fi;
    	od;
    	return v;
    end;

    # Compute and correct the blockstabilizer
    InfoAgNorm2( "#I  CoboundsNO: computing blockstabilizer\n" );
    L := Stabilizer( AgSubgroup( G, FactorArg( S, Us ).generators, false ),
    	    	     B[ 1 ] * 0,
    	    	     op ).generators;

    InfoAgNorm2( "#I  CoboundsNO: correcting blockstabilizer\n" );
    NB := List( NB, x -> x ^ -1 );
    for i  in [ 1 .. Length( L ) ]  do
    	s := HomomorphicIgs( U, L[ i ] );
    	NormalizeIgsModLess( U2, s );
    	v := [];
    	for j  in [ 1 .. ln2 ]  do
    	    Append( v, Ns.operations.Exponents( Ns, Ui[j]*s[j], Integers ) );
    	od;
    	for j  in [ 1 .. Length( heads ) ]  do
    	    if v[ heads[ j ] ] <> 0  then
    	    	L[ i ] := L[ i ] * ( NB[ j ] ^ v[ heads[ j ] ] );
    	    fi;
    	od;
    od;

    # Return sum of <L>, <C> and <U1>.
    L := AgSubgroup( G, L, false );
    C := AgSubgroup( G, C, false );
    return SumAgGroup( SumAgGroup( U1, C ), L );

end;


#############################################################################
##
#F  LinearNO( <U>, <N>, <M> ) . . . . . stabilizer of <M> < <N> in <U>, local
##
LinearNO := function( U, N, M )

    local   B,	    # base of <M> & vectorspace
            op,	    # operation of <U> on <M>
            gens,   # generators of <N>
            mats;   # linear operation on <N>

    # Linear operation of <U> on the <N> as matrices over a finite field.
    gens := Cgs( N );
    N.field := GF( RelativeOrderAgWord( gens[1] ) );
    B := rec( isDomain := true, base := gens );
    mats := LinearOperation( U, B, function( x, a ) 
    	return Exponents( N, x ^ a, N.field ); end ).images;

    # Each subgroup of <N> is identified by  a triangulized natrix.  So first
    # get this matrix for <M>. The operation on this base is given by <mats>,
    # but the new base must be triangulized.
    B := List( Cgs( M ), x -> N.operations.Exponents( N, x, N.field ) );
    TriangulizeMat( B );
    op := function( L, A )
    	IsMat( L );
    	IsMat( A );
        L := L * A;
        TriangulizeMat( L );
        return L;
    end;

    # Compute the stabilizer using an orbitalgorithm
    return AgOrbitStabilizer( U, mats, B, op ).stabilizer;

end;


#############################################################################
##
#F  NormalizerNO( <U>, <f1>, <f2>, <f3>, <f4> )	. . . . . . normalizer, local
##
##  Compute  the  normalizer  of  <U>  in its parent group.
##
##  <f1>    if  set, intersections with  the same prime  than  the module are
##  	    computed  using    one  cobounds.   Otherwise a   ordinary  orbit
##  	    stabilizer algorithm is used.
##
##  <f2>    if set, intersections  with different prime  than the module  are
##  	    computed using one cobounds.  Otherwise the method of computation
##  	    depends on the flag <f3>.
##
##  <f3>    if  set and <f2> is  'false',   then intersections with different
##  	    prime than  the  module  are computed  using Glasby's  algorithm.
##  	    Otherwise a ordinary orbit stabilizer algorithm is used.
##
##  <f4>    if set, the  first   intersection   is computed   using    linear
##  	    operations.  Otherwise a ordinary orbit  stabilizer  algorithm is
##  	    used.
##
NormalizerNO := function( U, f1, f2, f3, f4 )

    local   A,	    	    # homomorphisms ai : <G>/Ei -> <G>/Ei-1
            G,	    	    # parent group of <U>
            E,  r,   	    # elementary abelian series of <G> and its length
            UE,  GE,	    # factorgroups <X>Ei/Ei
    	    W,	    	    # depths identifying Ei
            Uk,  Uj,  Ui_1, # intersections of <U> with E
            S,  Si_1,	    # stabilizer and its intersection with Ei-1
            Ej,  Ek,  Ei_1, # elements of E
            pj, pi_1,	    # primes of Ej and Ei-1
            ST,	    	    # used for checking the algorithm
            i, j, k;

    # Get the parent group and elementary abelian series.
    G := Parent( U );
    if not IsElementaryAbelianAgSeries( G )  then
        Error("agseries of parent group of <U> is not elementary abelian\n");
    fi;
    E := ElementaryAbelianSeries( G );
    r := Length( E );

    # If <r> = 2,  <G> is abelian, so we can return <G>.
    if r = 2  then
    	return G;
    fi;

    # If <E>  =  [E1,...,Er]  is the  elementary   abelian series, the  first
    # factorgroup we  must consider is <G>/E3   (<G>/E2 is abelian).   So  we
    # construct all factorgroups <G>/E3 downto <G>/Er along with <U>Ei/Ei and
    # homomorphisms  ai : <G>/Ei ->  <G>/Ei-1.  The homomorphisms are store a
    # list <A> = [ , , a3, ..., ar ]. The factorgroups <U>Ei/Ei are stored in
    # list <UE> = [ , <U>E2/E2, ..., <U>Er/Er ].  The factorgroups <G>/Ei are
    # stored in a list <GE>  = [ , <G>/E2, ...,  <G>/Er ].  As the elementary
    # ablian  series  is  refined by   the  agseries, the  elementary abelian
    # subgroups are identified by their depths.  <W> contains  a  sequence of
    # depths such that Ei/Ej  is the <W>[i].th  composition subgroup  of G[j]
    # for 1 <= i <= j <= r.
    InfoAgNorm2( "#I  Normalizer: constructing the ",r," factorgroups\n" );
    A := [];  UE := [];  GE := [];  W := [];
    W[ r ] := Length( G.generators ) + 1;
    for i  in [ 1 .. r - 1 ]  do
        W[ i ] := DepthAgWord( E[ i ].generators[ 1 ] );
    od;
    GE[ r ] := G;
    UE[ r ] := U;
    for i  in Reversed( [ 3 .. r ] )  do
        A[ i ] := NaturalHomomorphism( GE[i], GE[i] / W[i-1] );
        GE[ i-1 ] := Image( A[i] );
        UE[ i-1 ] := Image( A[i], UE[i] );
    od;

    # We start with <G>/E2.  In this factorgroup nothing is to be done.
    S := GE[ 2 ];
    InfoAgNorm2( "#I  Normalizer: starting with <G>/E2\n" );
    for i  in [ 3 .. r ]  do

    	# <S> = N_<G>/Ei-1( <U> ) and <A>[i] = ai : <G>/Ei -> G/Ei-1
    	#
    	# The first step looks like
    	#
    	#   	    S
    	#   	      \
    	#   	       \
    	#   	U        Ei-1
    	#   	 \  	/
    	#   	  \    /
    	#   	   Ui-1
    	#   	       \
    	#   	    	\
    	#   	    	 Ei
    	#
        # Get  the complete preimage of <S>  in   <G>/Ei and  start the whole
        # computation for that factorgroup. <A>[i] = ai : <G>/Ei -> <G>/Ei-1.
        S := PreImage( A[i], S );
    	InfoAgNorm2( "#I  Normalizer: factorgroup <G>/E", i, "\n",
	             "#I  Normalizer: <S> = ", S.generators, "\n" );
	ST := S;

        # If Ei-1 is a subgroup of <U>Ei or <U> is a subgroup of Ei (<U>Ei/Ei
        # is trivial), then we can skip this step.
        Ei_1 := CompositionSubgroup( GE[ i ], W[ i - 1 ] );
        pi_1 := RelativeOrderAgWord( Ei_1.generators[ 1 ] ); 
        if UE[ i ].generators = []  then
    	    InfoAgNorm2( "#I  Normalizer: <U>E",i,"/E",i," is trivial\n" );
        elif IsSubgroup( UE[ i ], Ei_1 )  then
    	    InfoAgNorm2( "#I  Normalizer: E",i-1," < <U>E",i,"\n" );
        else

            # If  <U> /\ Ei-1 = <S> /\ Ei-1, then <U> is normal in <S>.
            Ui_1 := NormalIntersection( Ei_1, UE[ i ] );
            Si_1 := NormalIntersection( Ei_1, S );
            if Ui_1 = Si_1  then
    	    	InfoAgNorm2( "#I  Normalizer: <U> /\\ E", i-1, " = ",
    	    	    	     "<S> /\\ E", i-1, "\n" );
            else

                # If the  intersection <U>Ei /\  Ei-1 is not trivial computed
                # the  stabilizer   of  this    intersection  with   an orbit
                # stabilizer  algorithm.  <f4> says, if  we should use linear
                # operations.
                if Ui_1.generators = []  then
    	    	    InfoAgNorm2( "#I  Normalizer: <U>E", i, " /\\ E",
    	    	    	    	 i-1, " is trivial\n" );
                elif f4  then
    	    	    InfoAgNorm2( "#I  Normalizer: stabilize <U>E",i," /\\",
    	    	    	    	 " E",i-1," with linear operations\n" );
                    S := LinearNO( S, Ei_1, Ui_1 );
                else
    	    	    InfoAgNorm2( "#I  Normalizer: stabilize <U>E",i," /\\",
    	    	        	 " E",i-1," with ag operations\n" );
                    S := StabilizerNO( S, Ui_1 );
                fi;
            fi;

            # Get the next intersection <U>Ei/\Ej which is != <U>Ei/\Ei-1.
            j  := i - 2;
            Ej := CompositionSubgroup( GE[ i ], W[ j ] );
            Uj := NormalIntersection( Ej, UE[ i ] );
            k  := i - 1;
            Uk := Ui_1;
            while j > 0 and Uk = Uj  do
    	    	InfoAgNorm2( "#I  Normalizer: <U>E", i, " /\\ E", k,
    	    	  	     " = <U>E", i, " /\\ E", j, "\n" );
                j := j - 1;
                if j > 0  then
                    Ej := CompositionSubgroup( GE[ i ], W[ j ] );
                    Uj := NormalIntersection( Ej, UE[ i ] );
                fi;
            od;

    	    # The next step looks like ( <S> = N(Uk) )
    	    #
    	    #       S
    	    #        \    Ej
    	    #         \  /  \
    	    #   U      **    \
    	    #    \    /  \    Ek
    	    #     \  /    \  /  \
    	    #      Uj      **    \
    	    #        \    /  \    Ei-1
    	    #         \  /    \  /
    	    # 	       Uk      Si-1
    	    #            \     /
    	    #             \   /
    	    #              Ui-1
    	    #	    	     \
    	    #                 \
    	    #                  Ei
    	    #
            # If <j> = 0 or <S> and <U>  have the  same Ei-1  intersection we
            # are finished with this step.
            while j > 0 and not Si_1 = Ui_1  do
                pj := RelativeOrderAgWord( Ej.generators[ 1 ] );
                if ( pj = pi_1 and f1 ) or ( pj <> pi_1 and f2 )  then
    	    	    InfoAgNorm2( "#I  Normalizer: stabilize <U>E", i,
                                 " /\\ E", j, " using cobounds\n" );
                    S := CoboundsNO( S, Si_1, Uj, Uk );
                elif pj <> pi_1 and f3  then
                    InfoAgNorm2( "#I  Normalizer: stabilize <U>E", i,
                                 " /\\ E", j, " using Glasby\n" );
                    S := GlasbyNO( S, Si_1, Uj, Uk );
                else
                    InfoAgNorm2( "#I  Normalizer: stabilize <U>E", i,
                                 " /\\ E", j, " using orbit\n" );
                    S := StabilizerNO( S, Uj, Uk );
                fi;

                ## if CHECK  then
                ##     InfoAgNorm2( "#I  Normalizer: stabilizer CHECK\n" );
                ##     ST := Stabilizer( ST, Uj );
		##     Cgs( S );
		##     Cgs( ST );
                ##     if ST <> S  then
    	    	##         InfoAgNorm2( "#I  CHECK: wanted ",ST.cgs,"\n" );
                ##         InfoAgNorm2( "#I  CHECK: got ", S.cgs, "\n" );
                ##         Error("Normalizer: incorrect stabilizer, FAILED");
                ##     else
                ##         InfoAgNorm2("#I  CHECK: ok ", S.cgs, "\n");
                ##     fi;
                ## fi;

                # Get the next intersection.
                k  := j;
                Uk := Uj;
                while j > 0 and Uk = Uj  do
                    if k <> j  then
                        InfoAgNorm2( "#I  Normalizer: <U>E",i," /\\ E", k,
                                     " = <U>E", i, " /\\ E", j, "\n" );
                    fi;
                    j := j - 1;
                    if j > 0  then
                        Ej := CompositionSubgroup( GE[ i ], W[ j ] );
                        Uj := NormalIntersection( Ej, UE[ i ] );
                    fi;
                od;

                # Now we know our new <S>, if <j>-1 is still nonzero, compute
                # the intersection in order to see, if we are ready.
                if j > 0  then
                    Si_1 := NormalIntersection( Ei_1, S );
                fi;

            od;

        fi;

    od;

    Normalize( S );
    if S = U  then
    	return U;
    else
    	return S;
    fi;

end;


#############################################################################
##
#F  Normalizer( <G>, <U> )  . . . . . . . . . . . .  normalizer of <U> in <G>
##
AgGroupOps.Normalizer := function( G, U )
    local   oldU,  P,  N;

    # for small groups use direct calculation
    if G.generators = [] or U.generators = [] or U = G  then
    	return G;
    elif Size(G) < 1000  then
    	return Stabilizer2NO( G, U );
    fi;

    # compute the parent of <U> and <G>
    P := Parent( G, U );

    # the elementary abelian series must be refined by the composition series
    if not IsElementaryAbelianAgSeries(P)  then
    	Print( "#W  no elementary abelian agseries,  computing orbit\n" );
    	return StabilizerNO( G, U );
    fi;

    # normalize <G> and <U>
    if not IsNormalized( G ) or G.generators <> G.cgs  then
    	G := Normalized( G );
    	G.generators := G.cgs;
    fi;

    # save the original <U>,  so that we can store the normalizer there
    oldU := U;
    if not IsNormalized( U ) or U.generators <> U.cgs  then
    	U := Normalized( U );
    	U.generators := U.cgs;
    fi;

    # compute the normalizer in the supergroup, then the intersection
    if not IsBound( oldU.normalizer )  then
    	oldU.normalizer := NormalizerNO( U, true, false, true, true );
    fi;
    N := Intersection( G, oldU.normalizer );

    # set parent group to <P>,  this is used in the lattice program
    if IsBound(N.parent)  then N.parent := P;  fi;

    # and return
    return N;

end;

#############################################################################
##
#F  ConjugacyClassSubgroupsAgGroupOps . . . . . . operations record for classes
##
ConjugacyClassSubgroupsAgGroupOps := OperationsRecord
    ( "ConjugacyClassSubgroupsAgGroupOps", ConjugacyClassSubgroupsGroupOps );

ConjugacyClassSubgroupsAgGroupOps.\in := function ( H, C )
    if not IsBound( C.normalizer )  then
        C.normalizer := Normalizer( C.group, C.representative );
    fi;
    return ForAny( RightTransversal( C.group, C.normalizer ),
                      t -> H=C.representative^t );
end;

AgGroupOps.ConjugacyClassSubgroups := function ( G, H )
    local   C;

    # make the conjugacy class
    C := rec( );
    C.isDomain                  := true;
    C.isConjugacyClassSubgroups := true;

    # enter the identifying information
    C.group          := G;
    C.representative := H;

    # enter the operations record
    C.operations     := ConjugacyClassSubgroupsAgGroupOps;

    # return the conjugacy class
    return C;

end;
