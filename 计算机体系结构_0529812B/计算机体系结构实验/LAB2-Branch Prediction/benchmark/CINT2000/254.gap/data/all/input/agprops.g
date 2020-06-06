#############################################################################
##
#A  agprops.g                   GAP library                      Frank Celler
##
#A  @(#)$Id: agprops.g,v 3.32 1994/02/02 10:17:35 sam Rel $
##
#Y  Copyright 1993-1995,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This  file contains all  functions dealing  with properties and  property
##  tests for  aggroups.  It  also  contains  'AbelianInvariantsAgGroup'  and
##  'ElementsAgGroup'.
##
#H  $Log: agprops.g,v $
#H  Revision 3.32  1994/02/02  10:17:35  sam
#H  moved 'MaximalElement' to 'dispatch.g'
#H
#H  Revision 3.31  1993/03/30  12:43:37  fceller
#H  removed '.elementaryAbelianFactors'
#H
#H  Revision 3.30  1993/01/04  11:16:53  fceller
#H  added 'Exponent'
#H
#H  Revision 3.29  1992/12/29  08:43:37  fceller
#H  changed 'IsElementAgSeries' to check for ranges with
#H  stepsize greater one
#H
#H  Revision 3.28  1992/05/08  09:15:51  fceller
#H  added a missing 'Parent' in a call to 'Subgroup'
#H
#H  Revision 3.27  1992/04/23  10:34:19  fceller
#H  moved 'PrimePowers' to "finpoly.g"
#H
#H  Revision 3.26  1992/04/03  13:10:09  fceller
#H  changed 'Shifted...' into 'Sifted...'
#H
#H  Revision 3.25  1992/02/29  15:01:34  fceller
#H  change 'AgGroupOps.Parent'
#H
#H  Revision 3.24  1992/02/10  13:45:50  fceller
#H  'Order' takes two arguments: domain and element.
#H
#H  Revision 3.23  1992/02/07  18:11:40  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/05/05  21:40:34  fceller
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

#F  IsAgGroup( <U> )  . . . . . . . . . . . . . . . . . . . is <U> an aggroup
##
IsAgGroup := function( U )
    return IsRec( U ) and IsBound( U.isAgGroup ) and U.isAgGroup;
end;


#############################################################################
##
#F  IsElementAgSeries( <U> )  . . . . . . . . . . . . is element of ag series
##
IsElementAgSeries := function( U )
    local   depths;

    # In order to avoid computing an cgs we take a closer look at the depths.
    if U.generators = []  then
        return true;
    fi;
    depths := List( Igs( U ), DepthAgWord );
    if depths[ Length( depths ) ] <> Length( Parent( U ).cgs )  then
        return false;
    fi;
    return IsRange(depths) and (Length(depths)=1 or depths[1]=depths[2]-1);

end;


#############################################################################
##
#F  IsConsistent( <G> ) . . . . . . . . . . . . .  is ag group <G> consistent
##
IsConsistent := function( arg )
    local   G,  all,  isCon;

    # Evalute the argument.
    G   := arg[ 1 ];
    all := Length( arg ) = 2 and arg[ 2 ];

    # <G> must be a parent group.
    if not IsParent( G )  then
        Error( "<G> must be a parent group" );
    elif not all and IsBound( G.isConsistent )  then
        isCon := G.isConsistent;
    elif G.generators = []  then
        isCon := true;
    else
    	isCon := G.operations.IsConsistent( G, all );
    fi;

    G.isConsistent := isCon;
    return isCon;

end;

AgGroupOps.IsConsistent := function( G, all )
    local   gi,  gj,  gk,  exps,  gens,  i,  j,  k,  rels,  r;

    gens := G.generators;
    exps := List( gens, RelativeOrderAgWord );

    # <rels> will hold the inconsistencies when <all> is 'true'.
    rels := [];

    # Consistency relations: gk * ( gj * gi ) = ( gk * gj ) * gi
    for k  in [ 1 .. Length( gens ) ]  do
        gk := gens[ k ];
        for j  in [ 1 .. k - 1 ]  do
            gj := gens[ j ];
            for i  in [ 1 .. j - 1 ]  do
                gi := gens[ i ];
                r  := [ gk * ( gj * gi ), ( gk * gj ) * gi ];
                if r[ 1 ] <> r[ 2 ]  then
                    InfoAgGroup2(
                        "#I  IsConsistent: ", gk, " * ( ", gj, " * ",
                        gi, " ) <> ( ", gk, " * ", gj, " ) * ", gi, "\n" );
                    if all  then
                        Add( rels, r );
                    else
                        return false;
                    fi;
                fi;
            od;
        od;
    od;

    # Consistency relations: gj^ej-1 * ( gj * gi ) = ( gj^ej-1 * gj ) * gi
    for j  in [ 1 .. Length( gens ) ]  do
        gj := gens[ j ];
        for i  in [ 1 .. j - 1 ]  do
            gi := gens[ i ];
            r  := [ gj^(exps[j]-1)*(gj*gi), (gj^(exps[j]-1)*gj)*gi ];
            if r[ 1 ] <> r[ 2 ]  then
                if exps[ j ] = 2  then
                    InfoAgGroup2(
                        "#I  IsConsistent: ", gj, " * ( ", gj, " * ",
                        gi, " ) <> ( ", gj, " * ", gj, " ) * ", gi, "\n" );
                else
                    InfoAgGroup2(
                        "#I  IsConsistent: ", gj, " ^ ", exps[j] - 1,
                        " * ( ", gj, " * ", gi, " ) <> ( ", gj, " ^ ",
                        exps[j] - 1, " * ", gj, ") * ", gi, "\n" );
                fi;
                if all  then
                    Add( rels, r );
                else
                    return false;
                fi;
            fi;
        od;
    od;

    # Consistency relations: gj * ( gi^ei-1 * gi ) = ( gj * gi^ei-1 ) * gi
    for j  in [ 1 .. Length( gens ) ]  do
        gj := gens[ j ];
        for i  in [ 1 .. j - 1 ]  do
            gi := gens[ i ];
            r := [ gj*(gi^(exps[i]-1)*gi), (gj*gi^(exps[i]-1))*gi ];
            if r[ 1 ] <> r[ 2 ]  then
                if exps[ i ] = 2  then
                    InfoAgGroup2(
                        "#I  IsConsistent: ", gj, " * ( ", gi, " * ",
                        gi, " ) <> ( ", gj, " * ", gi, " ) * ", gi, "\n" );
                else
                    InfoAgGroup2(
                        "#I  IsConsistent: ", gj, " * ( ", gi, " ^ ",
                        exps[ i ] - 1, " * ", gi, " ) <> ( ", gj, " * ", gi,
                        " ^ ", exps[ i ] - 1, " ) * ", gi, "\n" );
                fi;
                if all  then
                    Add( rels, r );
                else
                    return false;
                fi;
            fi;
        od;
    od;

    # Consistency relations: gj * ( gi^ei-1 * gi ) = ( gj * gi^ei-1 ) * gi
    for i  in [ 1 .. Length( gens ) ]  do
        gi := gens[ i ];
        r := [ gi*(gi^(exps[i]-1)*gi), (gi*gi^(exps[i]-1))*gi ];
        if r[ 1 ] <> r[ 2 ]  then
            if exps[ i ] = 2  then
                InfoAgGroup2(
                    "#I  IsConsistent: ", gi, " * ( ", gi, " * ", gi,
                    " ) <> ( ", gi, " * ", gi, " ) * ", gi, "\n" );
            else
                InfoAgGroup2(
                    "#I  IsConsistent: ", gi, " * ( ", gi, " ^ ",
                    exps[ i ] - 1, " * ", gi, " ) <> ( ", gi, " * ", gi,
                    " ^ ", exps[ i ] - 1, " ) * ", gi, "\n" );
            fi;
            if all  then
                Add( rels, r );
            else
                return false;
            fi;
        fi;
    od;

    # Report if one check failed and <all> was set.
    if all  then G.inconsistencies := rels;  fi;
    return rels = [];

end;


#############################################################################
##
#F  IsElementaryAbelianAgSeries( <G> )  . . .  is agseries elementary abelian
##
IsElementaryAbelianAgSeries := function( G )
    local   i, j, k, l, gens, eStp, lStp, minSublist, U, z, id, coms;

    # <G> must be an ag group
    if not IsAgGroup(G)  then
        Error( "usage: IsElementaryAbelianAgSeries( <G> )" );
        
    # <G> must be a parent group
    elif not IsParent(G)  then
        Error( "<G> must be a parent group" );
        
    # if <G> is trivial return 'true'
    elif 0 = Length(G.generators)  then
        G.elementaryAbelianSeries := [G];
        return true;
    fi;

    # If we know an elementary abelian series,  check it
    if IsBound(G.elementaryAbelianSeries)  then
        for U  in G.elementaryAbelianSeries  do
            if not IsElementAgSeries(U)  then
                l := G.elementaryAbelianSeries;
                Unbind(G.elementaryAbelianSeries);
                if IsElementaryAbelianAgSeries(G)  then
                    Print( "#W  the elementary abelian series of <G> has ",
                           "been changed\n" );
                    return true;
                else
                    G.elementaryAbelianSeries := l;
                    return false;
                fi;
            fi;
        od;
        return true;
    fi;

    # try to construct an elementary abelian series through the agseries
    id := G.identity;
    gens := Igs(G);
    coms := List( [ 1 .. Length(gens) ], x -> List( [ 1 .. x - 1 ],
        function( y )
            return DepthAgWord( Comm( gens[x], gens[y] ) );
        end ) );

    # make a list with step of the composition we can take.
    lStp := Length(gens) + 1;
    eStp := [ lStp ];

    # as we do not want to generate a mess of sublist:
    minSublist := function( list, upto )
        local min, i;
        if upto = 0  then return 1;  fi;
        min := list[ 1 ];
        for i  in [ 2 .. upto ]  do
            if min > list[ i ]  then min := list[ i ];  fi;
        od;
        return min;
    end;

    # if <lStp> reaches 1, we are can stop
    repeat

        # look for a normal composition subgroup
        k := lStp;
        l := k - 1;
        repeat
            k := k - 1;
            l := Minimum( l, minSublist( coms[k], k-1 ) );
        until l = k;

        # we have found a normal composition subgroup
        for i  in [ k .. lStp-1 ]  do
            z := gens[i] ^ RelativeOrderAgWord( gens[i] );
            if z <> id and DepthAgWord(z) < lStp  then
                return false;
            fi;
        od;
        for i  in [ k .. lStp-2 ]  do
            for j  in [ i+1 .. lStp-1 ]  do
                if coms[j][i] < lStp  then
                    return false;
                fi;
            od;
        od;

        # ok, we have an elementary normal step
        Add( eStp, k );
        lStp := k;
    until k = 1;

    # add the subgroups we have found to the group record and return 'true'
    G.elementaryAbelianSeries := List( Reversed(eStp),
                                       x -> CompositionSubgroup( G, x ) );
    return true;
    
end;


#############################################################################
##
#F  PiPowerSubgroupAgGroup( <U>, <pi> ) . . . . . . . . . . . . . . . . local
##
PiPowerSubgroupAgGroup := function( U, pi )
    local   pi, p, o, u, gens;

    # Make <pi> a set.
    pi := Set( pi );

    # Get the right powers.
    gens := [];
    for u  in Igs( U )  do
        p := RelativeOrderAgWord( u );
        if p in pi  then
            o := Order( AgWords, u );
            while QuoInt( o, p ) * p = o  do o := QuoInt( o, p );  od;
            Add( gens, u ^ o );
        fi;
    od;
    return Subgroup( Parent(U), gens );

end;


#############################################################################
##
#F  IsPNilpotent( <U>, <p> )  . . . . . . . . . . . . . . . p-nilpotency test
##
AgGroupOps.IsPNilpotent := function( U, p )
    local   o, H;

    # Ctch trivial cases.
    if U.generators = []  then
        return true;
    fi;

    # <p>' powers subgroup must be normal.
    o := Size( U );
    H := PiPowerSubgroupAgGroup( U, Difference( Factors( o ), [ p ] ) );
    while QuoInt( o, p ) * p = o  do o := QuoInt( o, p );  od;

    if Size( H ) <> o or not IsNormal( U, H )  then
        return false;
    fi;
    return true;

end;

IsPNilpotent := function( U, p )

    if not IsPrimeInt( p )  then
        Error( "<p> must be a prime" );
    else
    	return U.operations.IsPNilpotent( U, p );
    fi;

end;


#############################################################################
##
#F  FactorsAgGroup( <U> ) . . . . . . . .  factors of the order of an aggroup
##
FactorsAgGroup := function( arg )
    local   L;

    if Length( arg ) = 1  then
    	L := Igs( arg[1] );
    else
    	L := FactorArg( arg[1], arg[2] ).generators;
    fi;

    L := Flat( List( L, x -> Factors( RelativeOrderAgWord( x ) ) ) );
    Sort( L );
    return L;

end;


#############################################################################
##
#F  AgGroupOps.MaximalElement( <U> )  . . . . . . .  maximal exponents in <U>
##
AgGroupOps.MaximalElement := function( U )
    local   x, u, dx, ox, eu;

    if not IsNormalized( U )  then
        U := Normalized( U );
    fi;

    u := U.identity;
    for x  in U.cgs  do
        dx := DepthAgWord( x );
        eu := ExponentAgWord( u, dx );
        ox := RelativeOrderAgWord( x );
        u  := u * x ^ ( ox - eu - 1 );
    od;

    return u;

end;


#############################################################################
##
#F  SmallGeneratingSetAgGroup( <G> )  . . . . .  small generating set for <G>
##
SmallGeneratingSetAgGroup := function( G )
    local   i,  E,  S,  L,  gens,  g;

    E := ElementaryAbelianSeries( G );
    if Length( E ) <= 2 then
        return Cgs( G );
    else
        L := FactorArg( E[ 1 ], E[ 2 ] ).generators;
    	S := MergedIgs( G, rec(), L, true );
    fi;

    gens := [];
    for i  in [ 2 .. Length( E ) - 1 ]  do
        Append( gens, FactorArg( E[ i ], E[ i + 1 ] ).generators );
    od;

    for g  in gens  do
        if G = S  then
            return L;
        else
            if not g in S  then
                S := MergedIgs( G, S, [ g ], true );
                Add( L, g );
            fi;
        fi;
    od;
    return L;

end;


#############################################################################
##

#F  AgGroupOps.AbelianInvariants( <G> ) . . . . . . abelian invariants of <G>
##
AgGroupOps.AbelianInvariants := function( G )
    local   G,  H,  p,  l,  r,  i,  j,  gns,  inv,  ranks;

    if G.generators = []  then return [];  fi;
    gns := Cgs( G );
    inv := [];
    for p  in Set( Factors( Size( G ) ) )  do
        ranks := [];
        repeat
            H := AgSubgroup( G, HomomorphicIgs( gns, p ), false );
            r := Size( G ) / Size( H );
            InfoAgGroup2( "#I  AbelianInvariants: |<G>| = ", Size( G ),
                          ", |<H>| = ", Size( H ), "\n" );
            G   := H;
            gns := Igs( G );
            if r <> 1  then  Add( ranks, Length( Factors( r ) ) );  fi;
        until r = 1;
        InfoAgGroup2( "#I  AbelianInvariants: <ranks> = ", ranks, "\n" );
        l := List( [ 1 .. ranks[1] ], x -> 1 );
        for i  in ranks  do
            for j  in [ 1 .. i ]  do
                l[ j ] := l[ j ] * p;
            od;
        od;
        Append( inv, l );
    od;

    Sort( inv );
    return inv;

end;


#############################################################################
##
#F  AgGroupOps.Elements( <U> )  . . . . . . . . . . . . set of group elements
##
AgGroupOps.Elements := function( U )
    local   e,  g,  i,  u,  elements;

    elements := [ U.identity ];
    for g  in Cgs( U )  do
        u := U.identity;
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
#F  AgGroupOps.Exponent( <G> )  . . . . . . . . . . . . . . . exponent of <G>
##
AgGroupOps.Exponent := function( G )
    return Lcm( Set( List( ConjugacyClasses(G),
	        x -> Order( G, Representative(x) ) ) ) );
end;


#############################################################################
##
#F  AgGroupOps.SmallestGenerators( <U> )  . . . .  smallest generators of <U>
##
AgGroupOps.SmallestGenerators := function( U )
    return Reversed( Cgs( U ) );
end;


#############################################################################
##
#F  AgGroupOps.IsCyclic( <G> )  . . . . . . . . . . . . . . . . is <G> cyclic
##
AgGroupOps.IsCyclic := function( G )

    local   inv,    # abelian inveriants
            gns,    # generators
            H,      # <p>-power of <G>
            szG,    # size of <G>
            p;      # one prime factor

    if not IsAbelian( G )  then
        return false;
    elif Length( G.generators ) < 2  then
        return true;
    else
        szG := Size( G );
        gns := Cgs( G );
        for p  in Set( Factors( szG ) )  do
            H := AgSubgroup( G, HomomorphicIgs( gns, p ), false );
            if szG <> p * Size( H )  then
                return false;
            fi;
        od;
        return true;
    fi;

end;


#############################################################################
##
#F  AgGroupOps.IsFinite( <G> )  . . . . . . . . . . . . . if <G> finite (yes)
##
AgGroupOps.IsFinite := G -> true;


#############################################################################
##
#F  AgGroupOps.IsNilpotent( <U> ) . . . . . . . . . . . . . . nilpotency test
##
AgGroupOps.IsNilpotent := function( U )
    local   ps, i, j, Vs;

    # The <p>-power subgroups must centralize each other.
    ps := Set( Factors( Size( U ) ) );
    if Length( ps ) = 1 then
        return true;
    fi;
    Vs := List( ps, x -> PiPowerSubgroupAgGroup( U, [ x ] ) );

    for i  in [ 1 .. Length( Vs ) ]  do
        for j  in [ i + 1 .. Length( Vs ) ]  do
            if not IsCentral( Vs[ i ], Vs[ j ] )  then
                return false;
            fi;
        od;
    od;
    return true;

end;


#############################################################################
##
#F  AgGroupOps.IsNormal( <G>, <U> ) . . . . . . . . . .  is <U> normal in <G>
##
AgGroupOps.IsNormal := function( G, U )
    local   id, u, g, gens;

    # If  has  'isNormal'  and  <G>  is its supergroup, return. Catch trivial
    # cases.
    if U.generators = []  then
        return true;
    elif IsParent( U ) then
        return true;
    elif IsBound( U.isNormal )  then
        if U.isNormal or IsParent( G )  then
            return U.isNormal;
        fi;
    fi;

    # if <G> is the supergroup, we only need the generators not in <U>.
    if IsParent( G )  then
        gens := FactorArg( G, U ).generators;
    else
        gens := G.generators;
    fi;

    # Conjugate every generators of <U> with every <gens>.
    id := U.identity;
    for g  in gens  do
        for u  in U.generators  do
            if SiftedAgWord( U, Comm( u, g ) ) <> id  then
                return false;
            fi;
        od;
    od;

    # <G> normalizes <U>.
    return true;

end;


#############################################################################
##
#F  AgGroupOps.IsPerfect( <G> ) . . . . . . . . is <G> perfect (almost never)
##
AgGroupOps.IsPerfect := G -> 0 = Length(G.generators);


#############################################################################
##
#F  AgGroupOps.IsSolvable( <G> )  . . . . . . . . . . . is <G> solvable (yes)
##
AgGroupOps.IsSolvable := G -> true;


#############################################################################
##
#F  AgGroupOps.IsSubgroup( <G>, <U> ) . . . . . . . .  is <U> subgroup of <G>
##
AgGroupOps.IsSubgroup := function( G, U )
    local   id, u;

    # Catch trivial cases.
    if Parent( G, U ) = G  then
        return true;
    elif  Length( Cgs(U) ) > Length( Cgs(G) )  then
        return false;
    elif U.cgs = G.cgs  then
        return true;
    fi;

    # Check if all generators of <U> are elements of <G>.
    id := U.identity;
    for u  in U.cgs  do
        if SiftedAgWord( G, u ) <> id  then
            return false;
        fi;
    od;
    return true;

end;


#############################################################################
##
#F  AgGroupOps.Size( <U> )  . . . . . . . . . . . . . .  order of an ag group
##
AgGroupOps.Size := function( U )
    local   u, o;

    if IsBound( U.isFactorArg )  then
	return Index( U.factorNum, U.factorDen );
    else

        # the product of the indices of an igs of <U> is its order
        o := 1;
        for u  in Igs( U )  do
            o := o * RelativeOrderAgWord( u );
        od;
        return o;
    fi;

end;


#############################################################################
##
#F  AgGroupOps.Parent( <U>, ... ) . . . . . . . parent group of the arguments
##
AgGroupOps.Parent := function( L )

    local   G,      # parent group
            N,      # normal subgroup
            tmp,    # temporary
            H;      # loop

    if IsBound( L[ 1 ].isFactorArg ) then

        # All  arguments  must  be  subgroups  with  same super and subgroup.
        # Otherwise raise an error.
        if IsBound( L[ 1 ].factorNum.parent )  then
            G := L[ 1 ].factorNum.parent;
        else
            G := L[ 1 ].factorNum;
        fi;
        N := L[ 1 ].factorDen;
        for H  in L  do
            if IsBound( H.factorNum.parent )  then
                tmp := H.factorNum.parent;
            else
                tmp := H.factorNum;
            fi;
            if tmp.cgs <> G.cgs  then
                Error( "<G> and <H> must have a common parent group" );
            fi;
            if N <> H.factorDen  then
                Error( "<G> and <H> must have a common subgroup" );
            fi;
        od;
        G := G mod N;
    else

        # All groups must have the same parent group.
        if IsBound( L[ 1 ].parent )  then
            G := L[ 1 ].parent;
        else
            G := L[ 1 ];
        fi;
        for H  in L  do
            if IsBound( H.parent )  then
                tmp := H.parent;
            else
                tmp := H;
            fi;
            if G.cgs <> tmp.cgs then
                Error( "<G> and <H> must have a common parent group" );
            fi;
        od;

    fi;

    return G;

end;


#############################################################################
##
#F  AgGroupOps.AddShiftInfo( <U> )  . . . . . . . . . . . . . . . . . . local
##
##  Add  the  record  component  'shiftInfo'  to  <U>. This is a record  with
##  various components and a flag 'method' describing the method used by  the
##  shift process. 'method' =
##
##  1: <U>  is  a factorarg G/N, such that G and N are composition subgroups.
##     'first'  is  the  depth  of the first generator of G and 'last' is the
##     depth of the last generator of G not contained in N.
##
##  2: <U>  is a factorarg G/N, such that the depths of generators of G/N are
##     smaller  than  the  depths  of generators of N. 'last' is the depth of
##     the  last  generator  of G/N. 'depths' is a list of integers such that
##     if  g  has  depth  i,  than 'j := depths[ i ]' is positive, if g is no
##     element  of  N  and  the  j.th  generator of G has depth i, if g is an
##     element  of  N,  then  j  is negative and the -j.th generator of N has
##     depth i.
##
##  3: <U>   is   a   factorarg   G/N.  'depths'  is  a  list  as  above  and
##     'factorDepths'  is  a list of integers, such that if g has depth i and
##     is  no element of N, then the j.th generator of G/N has depth i for 'j
##     = factorDepths[ i ]'.
##
##  4: <U> is the supergroup with cgs.
##
##  5: <U> is a composition subgroup with cgs.  'first'  is the depth of  the
##     first generator and 'last' of the last one.
##
##  6: <U> is a subgroup. 'depths' is list as in 2 with positive entries only.
##
##  7:  <U> is a trivial factorgroup or subgroup.
##
##  In all cases 'list' contains a prototype null list.
##
AgGroupOps.AddShiftInfo := function( U )

    local   inf,        # shift info record
            seen,       # subgroup depths seen
            subs,       # subgroup generators
            gens,       # generators
            G, N,       # <U> = <G> / <N>
            l,          # number of generators in <G> / <N>
            i, j;       # loops

    # Initialize a record 'shiftInfo'.
    inf := rec();

    # Determinate which method we use.
    if IsBound( U.isFactorArg ) and U.isFactorArg  then

        G := U.factorNum;
        N := U.factorDen;
        l := Length( U.generators );
        if l = 0  then
            inf.method := 7;
        elif IsElementAgSeries( G )
             and IsNormalized( G )
             and IsElementAgSeries( N )
             and IsNormalized( N )
        then
            inf.method := 1;
            inf.first  := DepthAgWord( U.generators[ 1 ] );
            inf.last   := DepthAgWord( U.generators[ l ] );
        else
            inf.depths := [];
            gens := Igs( G );
            subs := Igs( N );
            for i  in [ 1 .. Length( gens ) ]  do
                inf.depths[ DepthAgWord( gens[ i ] ) ] := i;
            od;
            for i  in [ 1 .. Length( subs ) ]  do
                inf.depths[ DepthAgWord( subs[ i ] ) ] := -i;
            od;
            inf.method := 2;
            inf.gens   := gens;
            inf.subs   := subs;
            seen := false;
            for i  in inf.depths  do
                if i > 0 and seen  then
                    inf.method := 3;
                elif i < 0  then
                    seen := true;
                fi;
            od;
            if inf.method = 2  then
                inf.last := DepthAgWord( U.generators[ l ] );
            else # inf.method = 3  then
                inf.factorDepths := [];
                j := 1;
                for i  in List( gens, DepthAgWord )  do
                    if inf.depths[ i ] > 0  then
                        inf.factorDepths[ i ] := j;
                        j := j + 1;
                    fi;
                od;
            fi;
        fi;
        inf.list := List( [ 1 .. l ], x -> 0 );

    else # not IsBound( U.isFactorArg ) or not U.isFactorArg  then

        if U.generators = []  then
            inf.method := 7;
        elif IsParent( U ) and IsNormalized( U )  then
            inf.method := 4;
            inf.first  := 1;
            inf.last   := Length( U.cgs );
        elif IsElementAgSeries(U) and IsNormalized(U)  then
            inf.method := 5;
            inf.first  := DepthAgWord( U.cgs[ 1 ] );
            inf.last   := DepthAgWord( U.cgs[ Length( U.cgs ) ] );
        else
            inf.method := 6;
            inf.depths := [];
            gens := Igs( U );
            for i  in [ 1 .. Length( gens ) ]  do
                inf.depths[ DepthAgWord( gens[ i ] ) ] := i;
            od;
            inf.gens := gens;
        fi;
        inf.list := List( Igs( U ), x -> 0 );

    fi;
    U.shiftInfo := inf;

    # Check if we did not miss a case.
    if not IsBound( inf.method )  then
        Error( "AddShiftInfo: one case missed (internal error)\n" );
    fi;

end;


#############################################################################
##
#F  AgGroupOps.Random( <U> )  . . . . . . . . . . . . a random element of <U>
##
AgGroupOps.Random := function( U )
    local   gens;

    # Get  the  group  generators.  For  each generator use a random exponent
    # upto its relative order.
    gens := Igs( U );
    return Product( gens, x -> x ^ Random( [1 .. RelativeOrderAgWord(x)] ) );

end;


#############################################################################
##

#E  Emacs . . . . . . . . . . . . . . . . . . . . . . . local emacs variables
##
## Local Variables:
## mode:           outline
## outline-regexp: "#F\\|#V\\|#E"
## eval:           (hide-body)
## End:
##
