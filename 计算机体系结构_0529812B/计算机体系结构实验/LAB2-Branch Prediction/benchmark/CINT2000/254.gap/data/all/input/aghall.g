#############################################################################
##
#A  aghall.g                    GAP library                      Frank Celler
##
#A  @(#)$Id: aghall.g,v 3.20.1.2 1996/05/13 09:23:21 fceller Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This files contains functions computing hall subgroups.
##
#H  $Log: aghall.g,v $
#H  Revision 3.20.1.2  1996/05/13  09:23:21  fceller
#H  fixed 'SylowComplements' and 'SylowSystem'
#H
#H  Revision 3.20.1.1  1995/05/04  11:16:44  fceller
#H  fixed 'CoprimeComplementGS'
#H
#H  Revision 3.20  1994/02/16  14:39:07  fceller
#H  replaced 'LogVecFFE' by 'IntVecFFE'
#H
#H  Revision 3.19  1994/02/02  10:16:35  sam
#H  moved 'SylowSystems', 'SylowComplements' to 'dispatch.g'
#H
#H  Revision 3.18  1993/05/19  09:47:19  fceller
#H  fixed a bug in 'CoprimeComplement'
#H
#H  Revision 3.17  1992/04/07  12:53:37  fceller
#H  changed comparison with '0'
#H
#H  Revision 3.16  1992/04/03  13:10:09  fceller
#H  changed 'Shifted...' into 'Sifted...'
#H
#H  Revision 3.15  1992/03/30  07:47:09  fceller
#H  changed 'Exponents' slightly.
#H
#H  Revision 3.14  1992/02/10  13:45:50  fceller
#H  'Order' takes two arguments: domain and element.
#H
#H  Revision 3.13  1992/02/07  18:11:40  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/05/30  16:48:42  fceller
#H  Initial revision
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

#V  GS_LIMIT  . . . . . . . . . .  'ConjugatingWordGS' or 'ConjugatingWordCN'
##
##  If <p>  is  bigger  the  <GS_LIMIT>,  then  'ComplementConjugatingAgWord'
##  selects 'ConjugatingWordCN' instead of 'ConjugatingWordGS'.
##
GS_LIMIT := 20;


#############################################################################
##
#F  ConjugatingWordGS( <N>, <U>, <V>, <K> ) . . . . . . . . . . . . . . local
##
##  Let <U> / <K> and <V> / <K> be two p-groups such  that  <U>*<N> = <V>*<N>
##  and let <N> be an elementary abelian q-group with q <> p. Then a word <n>
##  of <N> with <U> ^ <n> = <V> is returned. <K> must be normal in <U>*<N>.
##
##  It is important, that the weights of <K> are less than those of <N>.
##
ConjugatingWordGS := function( N, U, V, K )
    local   i, j, t, q, p, m, mm, v, x, xx;

    # If  <N>  or  <U>  / <K> is trivial, just return identity. Otherwise get
    # get the canonical generating system for <U> / <K> and <V> / <K>.
    U := FactorArg( U, K ).generators;
    V := FactorArg( V, K ).generators;
    N := Igs( N );
    if U = [] or N = []  then
        return K.identity;
    fi;

    # Find  the  word  <n>  using the algorithm of Kantor. See S.P.Glasby and
    # Michael  C.  Slattery,  "Computing  intersections  and  normalizers  in
    # soluble groups", 1989.
    x := K.identity;
    for i  in Reversed( [ 1 .. Length( U ) ] )  do

        # The orders must be coprime.
        p := RelativeOrderAgWord( U[i] );
        q := RelativeOrderAgWord( N[1] );
        if q = p  then
            Error( "groups <U> and <N> are not coprime" );
        fi;

        # Compute an integer <t> such that <t> * <p> = -1 mod <q>.
        t := -Gcdex( p, q ).coeff1;
        while t > q  do t := t - q;  od;
        while t < 0  do t := t + q;  od;

        m  := SiftedAgWord( K, ( U[ i ] ^ x ) ^ -1 * V[ i ] );
        v  := K.identity;
        mm := K.identity;
        xx := K.identity;

        # Construct the product m^v * (m^2)^(v^2) * ... * (m^p-1)^(v^p-1).
        for j  in [ 1 .. p - 1 ]  do
            v  := v * V[ i ];
            mm := mm * m;
            xx := xx * v^-1 * mm * v;
        od;
        x := x * ( xx ^ t );
    od;

    return x;

end;


#############################################################################
##
#F  ConjugatingWordCN( <N>, <U>, <V>, <K> ) . . . . . . . . . . . . . . local
##
##  Let <U> / <K> and <V> / <K> be two p-groups such  that  <U>*<N> = <V>*<N>
##  and let <N> be an elementary abelian q-group with q <> p. Then a word <n>
##  of <N> with <U> ^ <n> = <V> is returned. <K> must be normal in <U>*<N>.
##
ConjugatingWordCN := function( N, U, V, K )
    local   B, i, A, R, S, n;

    # Get generators and catch trivial cases.
    U := FactorArg( U, K ).generators;
    V := FactorArg( V, K ).generators;
    if U = V  then
        return K.identity;
    fi;

    # The  following  few  lines  can  be  used  in  order to ensure that the
    # returned  element  lies  in  <U>  *  <V>  and to reduce the size of the
    # linear system. However 'Cgs' needs a critical amount of time.
    #
    # if K.generators <> []  then
    #     UN := SumAgGroup( N, U );
    #     UV := Cgs( UN, [ U, V ] );
    #     if not IsEqualAgGroup( UN, UV )  then
    #         N := NormalIntersection( N, UV );
    #     fi;
    # fi;
    #

    N := ShallowCopy( N );
    B := Igs( N );
    if B = []  then
        return K.identity;
    fi;
    N.field := GF( RelativeOrderAgWord( B[ 1 ] ) );

    # All we need are the operations ( 1 - <U> ).
    A := List( B, x -> Concatenation( List( U, y -> 
    	    	  N.operations.Exponents( N, Comm(y,x), N.field ) ) ) );
    R := Concatenation( List( [ 1 .. Length( U ) ], x -> 
                  N.operations.Exponents( N, U[x]^-1*V[x], N.field ) ) );

    # Solve the linear system <A> * X = <R>.
    S := SolutionMat( A, R );
    if IsBool(S)  then
        return false;
    fi;

    # Get <S> back to <N>.
    n := N.identity;
    for i  in [ 1 .. Length(S) ]  do
        if IntVecFFE(S,i) <> 0  then
            n := n * B[i] ^ IntVecFFE(S,i);
        fi;
    od;
    return n;

end;


#############################################################################
##
#F  ComplementConjugatingAgWord( <N>, <U>, <V>, <K> ) . . . . .  find ag word
##
ComplementConjugatingAgWord := function( arg )
    local   N,  U,  V,  K,  cK,  cN,  x,  q,  p;

    # Check the arguments and catch trivial cases.
    if Length( arg ) < 3 or Length( arg ) > 4  then
        Error( "usage: ComplementConjugatingAgWord( ",
               "<N>, <U>, <V> [,<K>] )" );
    fi;
    N := arg[ 1 ];
    U := Normalized( arg[ 2 ] );
    V := Normalized( arg[ 3 ] );

    InfoAgGroup1( "#I  ComplementConjugatingAgWord: ",
                  "|<U>| = ", StringPP( Size( U ) ), ", ",
		  "|<N>| = ", StringPP( AgGroupOps.Size( N ) ), "\n" );

    if U = V  then
        InfoAgGroup1( "#I  ComplementConjugatingAgWord: ",
	              "returns '1' because <U> = <V>\n" );
        return N.identity;
    elif N.generators = []  then
        InfoAgGroup1( "#I  ComplementConjugatingAgWord: ",
	              "raises an error because |<N>| = 1 and <U> <> <V>",
		      "\n" );
        x := false;
    else

        # Get the prime of <N> and <U> / <K>. We must use "CN" if both have
        # the  same  prime.  If not use "CN" for prime of <U> / <K> greater
        # <GS_LIMIT>.
        q := RelativeOrderAgWord( Igs( N )[1] );
        if    Length( arg ) = 3
           or ( Length( arg ) = 4 and arg[ 4 ].generators = [] )
        then
            K := AgSubgroup( U, [], true );
            p := RelativeOrderAgWord( Igs( U )[ 1 ] );
            if q = p or p > GS_LIMIT  then
	        InfoAgGroup2( "#I  ComplementConjugatingAgWord: ",
		              "'CN' as ", q, "=", p, " or ", p, ">",
    	    	    	      GS_LIMIT, "\n" );
                x := ConjugatingWordCN( N, U, V, K );
            else
	        InfoAgGroup2( "#I  ComplementConjugatingAgWord: ",
		              "'GS' as ", q, "<>", p, " and ", p, "<",
    	    	    	      GS_LIMIT+1, "\n" );
                x := ConjugatingWordGS( N, U, V, K );
            fi;
        elif Length( arg ) = 4  then
            K  := Normalized( arg[ 4 ] );
            p  := RelativeOrderAgWord( FactorArg( U, K ).generators[ 1 ] );
            cK := Igs( K );
            cN := Igs( N );

            # Weights  of  K must be bigger than those of <N> in order to use
            # "GS". If they are, disptach as above.
            if    q = p
               or p > GS_LIMIT
               or ( DepthAgWord( cK[ Length(cK) ] ) >= DepthAgWord( cN[1] ) )
            then
	        InfoAgGroup2( "#I  ComplementConjugatingAgWord: ",
		              "'CN' as ", q, "=", p, ", ", p, ">",
    	    	    	      GS_LIMIT, " or mixed depths", "\n" );
                x := ConjugatingWordCN( N, U, V, K );
            else
	        InfoAgGroup2( "#I  ComplementConjugatingAgWord: ",
		              "'GS' as ", q, "<>", p, " and ", p, "<",
    	    	    	      GS_LIMIT+1, "\n" );
                x := ConjugatingWordGS( N, U, V, K );
            fi;
        else
            Error( "usage: ComplementConjugatingAgWord(",
                   " <N>, <U>, <V> [,<K>] )" );
        fi;
    fi;

    # If <x> is 'false' we did not find a word. Otherwise return <x>.
    if IsBool( x )  then
        Error( "cannot find a conjugating word" );
    else
        InfoAgGroup1("#I  ComplementConjugatingAgWord: found ",x,"\n");
        return x;
    fi;

end;


#############################################################################
##
#F  CoprimeComplement( <G>, <N> ) . . . . . . . . .  complement to <N> in <G>
##
CoprimeComplement := function( arg )
    return arg[1].operations.CoprimeComplement( arg );
end;

AgGroupOps.CoprimeComplement := function( L )
    local   G, N, M, K, U, V, x, y, o, o2, p, i;

    if Length( L ) = 2  then

        # Catch some trivial cases.
        G := L[ 1 ];
        N := L[ 2 ];
        if N.generators = []  then
            return G;
        fi;
        U := FactorArg( G, N ).generators;
        if U = []  then
            return AgSubgroup( G, [], true );
        fi;
        p := RelativeOrderAgWord( Igs( N )[ 1 ] );

        # Start with the lowest composition factor.
        x  := U[ Length( U ) ];
        o  := AgWordsOps.Order( AgWords, x );
        o2 := o;
        while o mod p = 0  do o := QuoInt( o, p );  od;
        y  := x ^ ( o2 / o );
        if LeadingExponentAgWord( x ) <> LeadingExponentAgWord( y )  then
            y := y ^ ( LeadingExponentAgWord( x )
                         / LeadingExponentAgWord( y )
                       mod RelativeOrderAgWord( y ) );
        fi;
        K := AgSubgroup( G, [ y ], false );

        # Step up the composition series.
        for i  in Reversed( [ 1 .. Length( U ) - 1 ] )  do

            ## if CHECK  then
            ##     Print( "#I  CoprimeComplement: K = ",K.igs,"\n" );
            ## fi;

            V := ConjugateSubgroup( K, U[ i ] );
            x := U[ i ] * ComplementConjugatingAgWord( N, V, K );

            o  := Order( AgWords, x );
            o2 := o;
            while o mod p = 0  do o := QuoInt( o, p );  od;
            y  := x ^ ( o2 / o );
            if LeadingExponentAgWord( x ) <> LeadingExponentAgWord( y )  then
                y := y ^ ( LeadingExponentAgWord( x )
                             / LeadingExponentAgWord( y )
                           mod RelativeOrderAgWord( y ) );
            fi;
            K := AgSubgroup( G, Concatenation( [y], Igs( K ) ), false );
        od;

        return K;

    else

        # Catch some trivial cases.
        G := L[ 1 ];
        N := L[ 2 ];
        M := L[ 3 ];
        if N = M  then
            return G;
        fi;
        U := FactorArg( G, N ).generators;
        if U = []  then
            return M;
        fi;
        p := RelativeOrderAgWord( FactorArg( N, M ).generators[ 1 ] );

        # Start with the lowest composition factor.
        x  := U[ Length( U ) ];
        o  := AgWordsOps.Order( AgWords, x );
        o2 := o;
        while o mod p = 0  do o := QuoInt( o, p );  od;
        y  := x ^ ( o2 / o );
        if LeadingExponentAgWord( x ) <> LeadingExponentAgWord( y )  then
            y := y ^ ( LeadingExponentAgWord( x )
                         / LeadingExponentAgWord( y )
                       mod RelativeOrderAgWord( y ) );
        fi;
        K := AgSubgroup( G, [ y ], false );

        # The   following  is surely  a  hack.   You   should  never  use  it
        # unless    you  know what   you  do.  It   heavyly  depends  on  the
        # ways 'ComplementConjugatingAgWord' works.
        N := N mod M;
        N.igs := N.generators;

        # Step up the composition series.
        for i  in Reversed( [ 1 .. Length( U ) - 1 ] )  do

            ##  if CHECK  then
            ##      Print( "#I  CoprimeComplement: K = ",K.igs,"\n" );
            ##  fi;

            V  := ConjugateSubgroup( K, U[ i ] );
            x  := ComplementConjugatingAgWord( N, V, K );
            x  := U[ i ] * CanonicalAgWord( M, x );
            o  := AgWordsOps.Order( AgWords, x );
            o2 := o;
            while o mod p = 0  do o := QuoInt( o, p );  od;
            y  := x ^ ( o2 / o );
            if LeadingExponentAgWord( x ) <> LeadingExponentAgWord( y )  then
                y := y ^ ( LeadingExponentAgWord( x )
                             / LeadingExponentAgWord( y )
                           mod RelativeOrderAgWord( y ) );
            fi;
            K := AgSubgroup( G, Concatenation( [y], Igs(K) ), false );
        od;

        return SumAgGroup( M, K );

    fi;

end;


#############################################################################
##

#F  HallEAS( <U>, <primes> )  . . . . . . .  hall without factorgroups, local
##
HallEAS := function( U, primes )
    local E, H, i, p;

    # Get the elementary abelian series of <U>.
    E := ElementaryAbelianSeries( U );

    # We start with <U> / <eas>[ 2 ] and step down.
    H := U;
    for i  in [ 1 .. Length( E ) - 1 ]  do
        p := RelativeOrderAgWord( FactorArg( E[i], E[i+1] ).generators[1] );
        if not ( p in primes )  then
            H := CoprimeComplement( H, E[ i ], E[ i + 1 ] );
        fi;
    od;

    return H;

end;


#############################################################################
##
#F  HallComposition( <G>, <primes> )  . . . . . hall with factorgroups, local
##
HallComposition := function( G, primes )
    local   homs, H, f, i, p;

    # Get the homomorphisms along the elementary abelian series.
    homs := HomomorphismsSeries( G, ElementaryAbelianSeries(G) );

    # Start with trivial group and work down the chain.
    H := homs[ 1 ].img( G );
    for i  in [ 2 .. Length( homs ) ]  do
        H := homs[ i ].pre( H );
        p := RelativeOrderAgWord( homs[ i ].kernel.generators[ 1 ] );
        if not p in primes  then
            H := CoprimeComplement( H, homs[ i ].kernel );
        fi;
    od;

    return H;

end;


#############################################################################
##
#F  HallSubgroup( <G>, <primes> ) . . . . . . . . . . .  hall subgroup of <G>
##
AgGroupOps.HallSubgroup := function( G, primes )
    local   f;

    f := Set( FactorsAgGroup( G ) );

    if G.generators = []  then
        return G;
    elif IntersectionSet( primes, f ) = []  then
        return AgSubgroup( G, [], true );
    elif IsSubset( primes, f )  then
    	return G;
    elif not IsNormalized( G )  then
    	G := Normalized( G );
    fi;

    # 'HallEAS' is faster, so we use it instead of 'HallComposition'.
    return HallEAS( G, primes );

end;

HallSubgroup := function( G, primes )

    if IsInt( primes )  then
        primes := Set( Factors( primes ) );
    else
    	primes := Set( Concatenation( List( primes, Factors ) ) );
    fi;
    return G.operations.HallSubgroup( G, primes );

end;

#############################################################################
##
#F  HallConjugatingAgWord( <G>, <U>, <V> )  . . . . .  conjugate <U> into <V>
##
HallConjugatingAgWord := function( G, V, U )
    local   W,  WW,  UU,  N,  primes,  g,  n,  i,  E;

    # Get the primes of <U> and <V>.
    if Size( U ) <> Size( V )  then
        Error( "groups <U> and <V> have different sizes" );
    fi;
    primes := Set( FactorsAgGroup( U ) );
    if Intersection( primes, FactorsAgGroup( G, U ) ) <> []  then
        Error( "groups <U> and <V> must be hall subgroups of <G>" );
    fi;

    # Conjugate stepping down the elementary abelian series of <G>.
    E := ElementaryAbelianSeries( G );
    g := G.identity;
    W := V;
    for i  in [ 2 .. Length( E ) ]  do

        # The  following is surely a hack. You should never use it unless you
        # are  either (1) fc or (2) you know what you do. It  heavyly depends
        # on the ways 'ComplementConjugatingAgWord' works. Until now I am not
    	# not convinced that it works,  but I have hope.
        N := E[ i - 1 ] mod E[ i ];
        N.igs := N.generators;
        if not RelativeOrderAgWord( N.igs[ 1 ] ) in primes  then
    	    WW := AgSubgroup( G, FactorArg( W, E[ i ] ).generators, false );
    	    UU := AgSubgroup( G, FactorArg( U, E[ i ] ).generators, false );
            n  := ComplementConjugatingAgWord( N, WW, UU );
            W  := ConjugateSubgroup( W, n );
            g  := g * n;
        fi;
    od;

    return g;

end;


#############################################################################
##
#F  AgGroupOps.SylowSystem( <U> ) . . . . . . . . . . . . sylow system of <U>
##
AgGroupOps.SylowSystem := function( U )
    local   sys, com, i, L, R;

    # Get  a  sylow  complement system. If it does not contain a sylow system
    # compute all intersections to get it.
    sys := SylowComplements( U );
    if not IsBound( sys.sylowSubgroups )  then
        com := sys.sylowComplements;
        L := [ U ];
        for i  in [ 2 .. Length( sys.primes ) ]  do
            L[ i ] := Intersection( L[ i - 1 ], com[ i - 1 ] );
        od;
        R := [];
        R[ Length( sys.primes ) ] := U;
        for i  in Reversed( [ 1 .. Length( sys.primes ) - 1 ] )  do
            R[ i ] := Intersection( R[ i + 1 ], com[ i + 1 ] );
        od;
        sys.sylowSubgroups := [];
        for i  in [ 1 .. Length( sys.primes ) ]  do
            sys.sylowSubgroups[i] := Intersection( L[i], R[i] );
        od;

    fi;

    return sys;

end;


#############################################################################
##
#F  AgGroupOps.SylowComplements( <U> )  . . . . . . . sylow complement system
##
AgGroupOps.SylowComplements := function( U )
    local   i, primes, p, com, syl, sys, K, L;

    # catch the trivial case
    if 0 = Length(U.generators)  then
        return rec( primes := [],
                    sylowSubgroups := [],
                    sylowComplements := [] );
    fi;

    # if we know a system use it
    if IsBound( U.syslowSystem )  then
        if IsBound( U.syslowSystem.sylowComplements )  then
            return U.syslowSystem;
        elif IsBound( U.sylowSystem.sylowSubgroups )  then
            com := [];
            syl := U.sylowSystem.sylowSubgroups;
            primes := U.sylowSystem.primes;
            K := [];
            L := [];
            K[1] := AgSubgroup( U, [], true );
            for i  in [ 2 .. Length(primes) ]  do
                K[i] := Closure( K[i-1], syl[i-1] );
            od;
            L[Length(primes)] := AgSubgroup( U, [], true );
            for i  in Reversed( [ 1 .. Length(primes)-1 ] )  do
                L[ i ] := Closure( L[i+1], syl[i+1] );
            od;
            for i  in [ 1 .. Length(primes) ]  do
                com[i] := Closure( K[i], L[i] );
            od;
            U.sylowSystem.sylowComplements := com;
            return U.sylowSystem;
        fi;
    fi;

    # Compute a hall-p'-subgroup for each prime divisor p.
    primes := Set( FactorsAgGroup( U ) );
    sys := rec( primes := [], sylowComplements := [] );
    for p  in primes  do
        K := U.operations.HallSubgroup( U, Difference( primes, [p] ) );
        Add( sys.primes, p );
        Add( sys.sylowComplements, K );
    od;
    U.sylowSystem := sys;

    return sys;

end;


#############################################################################
##
#F  SylowSubgroup( <G>, <p> ) . . . . . . . . . . . . . sylow subgroup of <G>
##
AgGroupOps.SylowSubgroup := function( G, p )
    return G.operations.HallSubgroup( G, Set( Factors( p ) ) );
end;
