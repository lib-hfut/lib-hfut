#############################################################################
##
#A  aginters.g                  GAP library                      Frank Celler
##
#A  @(#)$Id: aginters.g,v 3.17.1.4 1995/10/09 09:48:55 fceller Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This files contains the intersection algorithm.
##
#H  $Log: aginters.g,v $
#H  Revision 3.17.1.4  1995/10/09  09:48:55  fceller
#H  fixed 'Intersection' to use the correct parameter sequence for
#H  'NormalIntersection'
#H
#H  Revision 3.17.1.3  1995/10/04  08:52:53  fceller
#H  fixed 'NormalIntersection'
#H
#H  Revision 3.17.1.2  1995/03/29  14:51:34  sam
#H  do no longer fake space records ...
#H
#H  Revision 3.17.1.1  1994/11/17  14:39:09  sam
#H  changed access to 'zero' and 'one' components to function calls
#H
#H  Revision 3.17  1994/03/22  13:13:25  beick
#H  Changed GlasbyIntersection to AgGroupOps.GlasbyIntersection
#H  Changed AgGroupOps.Intersection slightly
#H
#H  Revision 3.16  1992/06/10  21:41:51  fceller
#H  fixed a minor bug in 'NormalIntersection'
#H
#H  Revision 3.15  1992/04/03  13:10:09  fceller
#H  changed 'Shifted...' into 'Sifted...'
#H
#H  Revision 3.14  1992/03/30  07:47:09  fceller
#H  changed 'Exponents' slightly.
#H
#H  Revision 3.13  1992/02/07  18:11:40  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/05/26  12:06:26  fceller
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
#V  GS_SIZE . . . . . . . . . . . . . . . .  size from which on we use glasby
##
GS_SIZE := 20;


#############################################################################
##
#F  ExtendedIntersectionSumAgGroup( <N>, <U> )  . . . . . . . . .  zassenhaus
##
ExtendedIntersectionSumAgGroup := function( N, U )
    local   G, I, ls, rs, is, tmp, id, al, ar, z, g, i, M;

    # Get  the  number of supergroup generators and the generators of <U> and
    # <N>.
    G  := Parent( N, U );
    id := G.identity;

    # What  follows  is a Zassenhausalgorithm. <ls> and <rs> are the left and
    # rights  sides. They are initialized with [ n, n ] and [ u, 1 ]. <is> is
    # the  intersection.  <I>  contains  the  words  [ u, 1 ]  which  must be
    # Sifted through [ <ls>, <rs> ].
    if IsBound( G.isFactorArg ) and G.isFactorArg  then
        M  := G.factorDen;
        ls := [];
        rs := [];
        is := [];
        for i  in [ 1 .. Length( G.factorNum.cgs ) ] do
            ls[ i ] := id;
            rs[ i ] := id;
            is[ i ] := id;
        od;
        for g  in U.generators  do
            ls[ DepthAgWord( g ) ] := g;
            rs[ DepthAgWord( g ) ] := g;
        od;
        I := [];
        for g  in N.generators  do
            if ls[ DepthAgWord( g ) ] = id  then
                ls[ DepthAgWord( g ) ] := g;
            else
                Add( I, g );
            fi;
        od;

        # Enter the pairs [ u, 1 ] of <I> into [ <ls>, <rs> ].
        for al  in I  do
            ar := id;
            al := SiftedAgWord( M, al );
            z  := DepthAgWord( al );

            # Shift through and reduced from the left.
            while al <> id and ls[ z ] <> id  do
                tmp := LeadingExponentAgWord( al )
                         / LeadingExponentAgWord( ls[ z ] )
                       mod RelativeOrderAgWord( al );
                al := SiftedAgWord( M, ls[ z ] ^ tmp mod al );
                ar := rs[ z ] ^ -tmp * ar;
                z  := DepthAgWord( al );
            od;

            # Have we a new sum or intersection generator.
            if al <> id  then
                ls[ z ] := al;
                rs[ z ] := ar;
            else
                z  := DepthAgWord( ar );
                while ar <> id and is[ z ] <> id  do
                    ar := SiftedAgWord( M, ReducedAgWord( ar, is[ z ] ) );
                    z  := DepthAgWord( ar );
                od;
                if ar <> id  then
                    is[ z ] := ar;
                fi;
            fi;
        od;

        # Construct  the sum and intersection aggroups. Return left and right
        # sides, so one can decompose words of <N> * <U>.
        return rec( leftSide     := ls,
                    rightSide    := rs,
                    sum          := Filtered( ls, x -> x <> id ),
                    intersection := Filtered( is, x -> x <> id ) );
    else
        ls := [];
        rs := [];
        is := [];
        for i  in [ 1 .. Length( G.cgs ) ] do
            ls[ i ] := id;
            rs[ i ] := id;
            is[ i ] := id;
        od;
        for g  in Igs( U )  do
            ls[ DepthAgWord( g ) ] := g;
            rs[ DepthAgWord( g ) ] := g;
        od;
        I := [];
        for g  in Igs( N )  do
            if ls[ DepthAgWord( g ) ] = id  then
                ls[ DepthAgWord( g ) ] := g;
            else
                Add( I, g );
            fi;
        od;

        # Enter the pairs [ u, 1 ] of <I> into [ <ls>, <rs> ].
        for al  in I  do
            ar := id;
            z  := DepthAgWord( al );

            # Shift through and reduced from the left.
            while al <> id and ls[ z ] <> id  do
                tmp := LeadingExponentAgWord( al )
                         / LeadingExponentAgWord( ls[ z ] )
                       mod RelativeOrderAgWord( al );
                al := ls[ z ] ^ tmp mod al;
                ar := rs[ z ] ^ tmp mod ar;
                z  := DepthAgWord( al );
            od;

            # Have we a new sum or intersection generator.
            if al <> id  then
                ls[ z ] := al;
                rs[ z ] := ar;
            else
                z := DepthAgWord( ar );
                while ar <> id and is[ z ] <> id  do
                    ar := ReducedAgWord( ar, is[ z ] );
                    z  := DepthAgWord( ar );
                od;
                if ar <> id  then
                    is[ z ] := ar;
                fi;
            fi;
        od;

        # Construct  the sum and intersection aggroups. Return left and right
        # sides, so one can decompose words of <N> * <U>.
        return rec(
    	    leftSide     := ls,
    	    rightSide    := rs,
    	    sum          := AgSubgroup(G, Filtered(ls, x->x<>id),false),
    	    intersection := AgSubgroup(G, Filtered(is, x->x<>id),false) );
    fi;
end;


#############################################################################
##
#F  SumFactorizationFunctionAgGroup( <U>, <N> ) . . . .  g = u*n in <U> * <N>
##
SumFactorizationFunctionAgGroup := function( U, N )
    local   G, f, id, S;

    G := Parent( N, U );
    id := G.identity;

    # Never  change  <N>  and  <U>  in  the  function call. Otherwise we will
    # decompose <N> * <U>.
    S := ExtendedIntersectionSumAgGroup( N, U );

    # Decompose  a  word  of  <U> * <N>. See 'ExtendedIntersectionSumAgGroup'
    # for details on 'rightSide' and 'leftSide'.
    f := function( un )
        local a, u, w, z;

        # Catch trivial case.
        if un = id  then
            return rec( u := id, n := id );
        fi;

        # Shift  through  'leftSide'  and  do  the  inverse  operations  with
        # 'rightSide'. This will give the <N> part.
        u := id;
        a := un;
        w := DepthAgWord( a );
        while a <> id and S.leftSide[ w ] <> id  do
            z := LeadingExponentAgWord( a )
                   / LeadingExponentAgWord( S.leftSide[ w ] )
                 mod RelativeOrderAgWord( a );
            a := S.leftSide[ w ] ^ z mod a;
            u := u * S.rightSide[ w ] ^ z;
            w := DepthAgWord( a );
        od;
        return rec( u := u, n := u^-1 * un );

    end;

    # Return the sum, intersection and the function.
    return rec( sum           := S.sum,
                intersection  := S.intersection,
                factorization := f );

end;


#############################################################################
##
#F  GlasbyCover( <S>, <A>, <B>, <H>, <K> )  . . . . . . . . . . . . . . local
##
##  Glasby's  generalized  covering  algorithmus.  <S> := <H>/\<N> * <K>/\<N>
##  and <A> < <H>, <B> < <K>. <A> ( and also <B> ) generate the  intersection
##  modulo <S>.
##
GlasbyCover := function( S, A, B, H, K )
    local   Am, Bm, z, i;

    # Decompose the intersection <H> /\ <K> /\ <N>.
    Am := S.intersection;
    Bm := List( Am, x -> x / SiftedAgWord( K, x ) );

    # Now cover the other generators.
    for i  in [ 1 .. Length( A ) ]  do
        z := S.factorization( A[i] ^ -1 * B[i] );
        A[ i ] := A[ i ] * z.u;
        B[ i ] := B[ i ] * ( z.n / SiftedAgWord( K, z.n ) ) ^ -1;
    od;

    # Concatenate them and return. The are not normalized.
    Append( A, Am );
    Append( B, Bm );

end;


#############################################################################
##
#F  GlasbyShift( <G>, <C>, <B> )  . . . . . . . . . . . . . . . . . . . local
##
GlasbyShift := function( G, C, B )
    local z;

    B := AgSubgroup( G, B, false );
    return List( C, x -> x / SiftedAgWord( B, x ) );

end;


#############################################################################
##
#F  GlasbyStabilizer( <G>, <A>, <B>, <N>, <R> ) . . . . . . . . . . . . local
##
GlasbyStabilizer := function( G, A, B, N, R )

    local   base,
            field,
            mA,
            L,
    	    V,
            pt,
            tau,
            phi;


    L       := FactorArg( AgSubgroup( G, N, false ), R );
    base    := L.generators;
    field   := GF( RelativeOrderAgWord( base[ 1 ] ) );
    L.field := field;

    # Operate affine. Construct matrices of dimension one more.
    A := AgSubgroup( G, A, false );
    B := AgSubgroup( G, B, false );
    tau := function( a )
        return L.operations.Exponents( L, SiftedAgWord( B, a ), L.field );
    end;
    phi := function( x, a )
        return L.operations.Exponents( L, x ^ a, L.field );
    end;

#   # Fake vectorspace, <base> is not empty.
#   V := rec( base := base, isDomain := true );
    mA := AffineOperation( A, base, phi, tau ).images;

    # Stabilize point (0,...,0,1).
    pt := List( base, x -> Zero( field ) );
    Add( pt, One( field ) );

    return AgOrbitStabilizer( A, mA, pt ).stabilizer.generators;

end;


#############################################################################
##
#F  GlasbyIntersection( <H>, <K> )  . . . . . . . . . . Glasby's intersection
##
AgGroupOps.GlasbyIntersection := function( H, K )
    local   G, A, B, C, D, HmN, KmN, N, R, E, sum, i, s, e;

    # The supergroup must have an elementary abelian agseries.
    G := Parent( H, K );
    Cgs( H );
    Cgs( K );
    if not IsElementaryAbelianAgSeries( G )  then
        Error( "GlasbyIntersection: needs an elementary abelian agseries" );
    fi;
    E := ElementaryAbelianSeries( G );

    # Go down the elementary abelian series. <A> < <H>, <B> < <K>.
    A := [];
    B := [];
    for i  in [ 1 .. Length( E ) - 1 ]  do

        Cgs( E[ i + 1 ] );
        N := FactorArg( E[ i ], E[ i + 1 ] ).generators;

        ##  if CHECK  then
        ##      Print( "#I  GlasbyIntersection: step number ", i, "\n" );
        ##      Print( "#I  GlasbyIntersection: A = <", A, ">\n" );
        ##      Print( "#I  GlasbyIntersection: B = <", B, ">\n" );
        ##      Print( "#I  GlasbyIntersection: N = <", N, ">\n" );
        ##  fi;

        s := DepthAgWord( N[ 1 ] );
        e := DepthAgWord( N[ Length( N ) ] );
        HmN := Filtered( H.cgs, x -> s <= DepthAgWord( x )
                                      and DepthAgWord( x ) <= e );
        KmN := Filtered( K.cgs, x -> s <= DepthAgWord( x )
                                      and DepthAgWord( x ) <= e );
        HmN := FactorArg( AgSubgroup( G, HmN, false ), E[ i + 1 ] );
        KmN := FactorArg( AgSubgroup( G, KmN, false ), E[ i + 1 ] );

        sum := SumFactorizationFunctionAgGroup( HmN, KmN );

        ##  if CHECK  then
        ##      Print( "#I  GlasbyIntersection: R = <", sum.sum, ">\n" );
        ##  fi;

        # Maybe there is nothing left to stabilize.
        if Length( sum.sum ) = Length( N ) then
            C := A;
            D := B;
         else
            R := AgSubgroup( G, Concatenation(sum.sum, E[i+1].cgs), false );
            C := GlasbyStabilizer( G, A, B, N, R );
            D := GlasbyShift( G, C, B );

            ##  if CHECK  then
            ##      Print( "#I  GlasbyIntersection: C = <", C, ">\n" );
            ##      Print( "#I  GlasbyIntersection: D = <", D, ">\n" );
            ##  fi;

        fi;

        # Now we can cover <C> and <D>.
        GlasbyCover( sum, C, D, H, K );
        A := C;
        B := D;
    od;

    # <A> is the unnormalized intersection.
    A := AgSubgroup( G, A, false );
    Normalize( A );
    return A;

end;


#############################################################################
##
#F  IntersectionSumAgGroup( <N>, <U> )  . . . . . . . . . . . . .  Zassenhaus
##
IntersectionSumAgGroup := function( N, U )
    local   G, g, tmp, sw, ins, sum;

    # Typecheck arguments. Catch trivial cases.
    G := Parent( N, U );
    if N.generators = []  then
        return rec( intersection := N, sum := U );
    elif U.generators = []  then
        return rec( intersection := U, sum := N );
    fi;

    # If  <N>  is  composition subgroup, no calculation is needed. We can use
    # weights  instead.  Otherwise  'ExtendedIntersectionSumAgGroup'  will do
    # the work.
    if IsElementAgSeries( N )  then
        sw  := DepthAgWord( Igs( N )[ 1 ] );
        ins := [];
        sum := [];
        for g  in Igs( U )  do
            if DepthAgWord( g ) < sw  then
                Add( sum, g );
            else
                Add( ins, g );
            fi;
        od;
        Append( sum, Igs( N ) );
    else
        tmp := ExtendedIntersectionSumAgGroup( N, U );
        sum := tmp.sum.igs;
        ins := tmp.intersection.igs;
    fi;

    sum := AgSubgroup( G, sum, false );
    ins := AgSubgroup( G, ins, false );
    return rec( sum := sum, intersection := ins );

end;


#############################################################################
##
#F  NormalIntersection( <N>, <U> )  . . . . . . . . Zassenhaus (intersection)
##
AgGroupOps.NormalIntersection := function( N, U )
    local   G, g, sw, ins;

    # Typecheck arguments. Catch trivial cases.
    G := Parent( N, U );
    if N.generators = [] or U.generators = []  then
        return AgSubgroup( G, [], true );
    elif IsParent( N ) then
        return U;
    elif IsParent( U ) then
        return N;
    fi;

    # If  <N>  is  composition subgroup, no calculation is needed. We can use
    # weights instead. Otherwise 'IntersectionSumAgGroup' will do the work.
    if IsElementAgSeries( N )  then
        sw  := DepthAgWord( Igs( N )[ 1 ] );
        ins := [];
        for g  in Igs(U)  do
            if DepthAgWord( g ) >= sw  then
                Add( ins, g );
            fi;
        od;
        ins := AgSubgroup( G, ins, false );
        return ins;
    else
       return IntersectionSumAgGroup( N, U ).intersection;
    fi;

end;


#############################################################################
##
#F  SumAgGroup( <N>, <U> )  . . . . . . . . . . . . . . . .  Zassenhaus (sum)
##
SumAgGroup := function( N, U )
    return IntersectionSumAgGroup( N, U ).sum;
end;


#############################################################################
##
#F  Intersection( <U>, <V> )  . . . . . . . . . . . . . . . . . <U> meets <V>
##
##  Dispatcher  for  intersection.  'GlasbyIntersection'  should  be used for
##  big groups.
##
AgGroupOps.Intersection := function( U, V )

    # Catch some trivial cases and check <GS_SIZE>.
    if   not IsAgGroup( U ) or not IsAgGroup( V )  then
    	return GroupOps.Intersection( U, V );
    elif Size( U ) < GS_SIZE or Size( V ) < GS_SIZE  then
    	return GroupOps.Intersection( U, V );
    elif Parent( V ) <> Parent( U )  then
    	return [];
    elif U.generators = [] or IsParent( V )  then
        return U;
    elif V.generators = [] or IsParent( U )  then
        return V;
    elif U = V  then
        return U;
    fi;

    # If  one group is normal use 'NormalIntersectionAgGroup', this needs one
    # (commutative) gauss step.
    if IsBound(U.isNormal) and U.isNormal  then
        return NormalIntersection( U, V );
    fi;
    if IsBound(V.isNormal) and V.isNormal  then
        return NormalIntersection( V, U );
    fi;

    #N The  elemntary abelian series must be refined by the agseries in order
    #N to use Glasbys algorithm. This could be changed with some effort.
    if not IsElementaryAbelianAgSeries( Parent( U, V ) )  then
        Print( "#W  IntersectionAgGroup: no elementery abelian agseries, ",
               "computing whole orbit\n" );
        return GroupOps.Intersection( U, V );
    else
        return Parent(U, V).operations.GlasbyIntersection( U, V );
    fi;

end;

