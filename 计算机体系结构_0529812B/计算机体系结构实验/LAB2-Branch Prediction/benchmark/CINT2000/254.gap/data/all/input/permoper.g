#############################################################################
##
#A  permoper.g                  GAP library                  Martin Schoenert
##
#A  @(#)$Id: permoper.g,v 3.33.1.2 1995/09/27 11:27:42 htheisse Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the functions that mainly deal with the  operation  of
##  permutation groups.
##
##  Some of them fall back to functions from 'operatio.g', others  require  a
##  stabilizer chain computed in 'permgrp.g'.
##
#H  $Log: permoper.g,v $
#H  Revision 3.33.1.2  1995/09/27  11:27:42  htheisse
#H  RepresentativeOperation: subgroups of symmetric groups are not symmetric
#H
#H  Revision 3.33.1.1  1995/04/01  11:11:21  aseress
#H  added a flag to operation descriptor for blocks homomorphisms
#H
#H  Revision 3.33  1994/06/27  16:46:20  sam
#H  added a few 'ShallowCopy' calls in 'PermGroupOps.Stabilizer',
#H  moved assignments of 'stabChain' components outside the 'if' branch
#H
#H  Revision 3.32  1994/06/24  19:15:33  aseress
#H  corrected random info transfer in Operation
#H
#H  Revision 3.31  1994/06/24  15:43:43  aseress
#H   Operation with 'OnSets' checks whether given lists are sets
#H
#H  Revision 3.30  1994/06/20  10:17:39  ahulpke
#H  Transfer of .stabChainOps.random
#H
#H  Revision 3.29  1994/06/18  18:51:13  aseress
#H  fixed Stabilizer
#H
#H  Revision 3.28  1994/06/14  18:36:01  sam
#H  fixed 'PermGroupOps.NrMovedPoints' (performance killer,
#H  noticed by Akos)
#H
#H  Revision 3.27  1994/04/21  11:59:25  sam
#H  fixed 'operation' component
#H
#H  Revision 3.26  1994/02/02  10:21:18  sam
#H  'operationImages' replaced by 'operation.images'
#H
#H  Revision 3.25  1993/05/04  11:59:22  fceller
#H  added 'Openeration( <G>, [], <func> )' and
#H  'Operation( <G>, [[]], OnSets )'
#H
#H  Revision 3.24  1993/02/07  17:21:20  martin
#H  fixed operations on ranges
#H
#H  Revision 3.23  1992/10/13  16:02:44  martin
#H  added '<G>.operationImages'
#H
#H  Revision 3.22  1992/06/03  16:29:42  martin
#H  added 'MaximalBlocks'
#H
#H  Revision 3.21  1992/06/03  16:12:19  martin
#H  improved 'PermGroupOps.Operation' for operation on disjoint sets of ints
#H
#H  Revision 3.20  1992/06/02  11:56:37  martin
#H  improved the selection of random elements in 'BlocksNoSeed'
#H
#H  Revision 3.19  1992/06/01  19:11:16  martin
#H  added a new method to compute block systems
#H
#H  Revision 3.18  1992/03/10  11:36:16  martin
#H  added 'IsRegular' and 'IsSemiRegular'
#H
#H  Revision 3.17  1992/01/24  14:48:16  martin
#H  renamed 'Representative' to 'RepresentativeOperation'
#H
#H  Revision 3.16  1991/12/12  09:19:59  martin
#H  changed 'ONPOINTS' to 'OnPoints', etc
#H
#H  Revision 3.15  1991/11/28  09:41:59  martin
#H  fixed 'OrbitLength' from thinking that 'Max(<orb1>) \< Max(<orb2>)'
#H
#H  Revision 3.14  1991/10/04  14:00:48  martin
#H  fixed a trivial problem in 'Stabilizer'
#H
#H  Revision 3.13  1991/10/02  15:43:51  martin
#H  fixed 'Stabilizer', the stabilizer of a subgroup is the normalizer
#H
#H  Revision 3.12  1991/10/02  15:42:21  martin
#H  fixed a stupid bug in 'Representative'
#H
#H  Revision 3.11  1991/10/01  14:59:23  martin
#H  changed stabchain, stabilizer are no subgroups
#H
#H  Revision 3.10  1991/09/28  12:17:50  martin
#H  changed all functions to require the operation as argument
#H
#H  Revision 3.9  1991/09/27  13:34:55  martin
#H  'Position' now returns 'false'
#H
#H  Revision 3.8  1991/09/27  09:12:56  martin
#H  'Representative' now may return 'false'
#H
#H  Revision 3.7  1991/09/27  09:07:40  martin
#H  made some minor name changes
#H
#H  Revision 3.6  1991/09/26  11:26:18  martin
#H  added 'Representative'
#H
#H  Revision 3.5  1991/09/25  13:32:01  martin
#H  added 'MovedPoints', ...
#H
#H  Revision 3.4  1991/09/25  13:26:00  martin
#H  improved 'Stabilizer'
#H
#H  Revision 3.3  1991/09/23  15:49:31  martin
#H  improved 'OrbitLength'
#H
#H  Revision 3.2  1991/09/23  15:47:09  martin
#H  changed to use 'PermGroupOps'
#H
#H  Revision 3.1  1991/09/03  08:06:43  martin
#H  fixed a small bug in 'OrbitsPermGroup'
#H
#H  Revision 3.0  1991/08/08  15:32:59  martin
#H  initial revision under RCS
#H
##

#############################################################################
##
#F  InfoOperation1(...) . . .  information function for the operation package
#F  InfoOperation2(...) . . .  information function for the operation package
##
if not IsBound(InfoOperation1)  then InfoOperation1 := Ignore;  fi;
if not IsBound(InfoOperation2)  then InfoOperation2 := Ignore;  fi;


#############################################################################
##
#F  PermGroupOps.IsSemiRegular(<G>,<D>) . . . . . test if a permutation group
#F                                                       operates semiregular
##
PermGroupOps.IsSemiRegular := function ( G, D, opr )
    local   used,       #
            perm,       #
            orbs,       # orbits of <G> on <D>
            gen,        # one of the generators of <G>
            orb,        # orbit of '<D>[1]'
            pnt,        # one point in the orbit
            new,        # image of <pnt> under <gen>
            img,        # image of '<prm>[<i>][<pnt>]' under <gen>
            p, n,       # loop variables
            i, l;       # loop variables

    # handle special case of standard operation on a list of integers
    if opr = OnPoints  and ForAll( D, IsInt )  then

        # compute the orbits and check that they all have the same length
        orbs := Orbits( G, D );
        if Length( Set( List( orbs, Length ) ) ) <> 1  then
            return false;
        fi;

        # initialize the permutations that act like the generators
        used := [];
        perm := [];
        for i  in [ 1 .. Length( G.generators ) ]  do
            used[i] := [];
            perm[i] := [];
            for pnt  in orbs[1]  do
                used[i][pnt] := false;
            od;
            perm[i][ orbs[1][1] ] := orbs[1][1] ^ G.generators[i];
            used[i][ orbs[1][1] ^ G.generators[i] ] := true;
        od;

        # initialize the permutation that permutes the orbits
        l := Length( G.generators ) + 1;
        used[l] := [];
        perm[l] := [];
        for orb  in orbs  do
            for pnt  in orb  do
                used[l][pnt] := false;
            od;
        od;
        for i  in [ 1 .. Length(orbs)-1 ]  do
            perm[l][orbs[i][1]] := orbs[i+1][1];
            used[l][orbs[i+1][1]] := true;
        od;
        perm[l][orbs[Length(orbs)][1]] := orbs[1][1];
        used[l][orbs[1][1]] := true;

        # compute the orbit of the first representative
        orb := [ orbs[1][1] ];
        for pnt  in orb  do
            for gen  in G.generators  do

                # if the image is new
                new := pnt ^ gen;
                if not new in orb  then

                    # add the new element to the orbit
                    Add( orb, new );

                    # extend the permutations that act like the generators
                    for i  in [ 1 .. Length( G.generators ) ]  do
                        img := perm[i][pnt] ^ gen;
                        if used[i][img]  then
                            return false;
                        else
                            perm[i][new] := img;
                            used[i][img] := true;
                        fi;
                    od;

                    # extend the permutation that permutates the orbits
                    p := pnt;
                    n := new;
                    for i  in [ 1 .. Length( orbs ) ]  do
                        img := perm[l][p] ^ gen;
                        if used[l][img]  then
                            return false;
                        else
                            perm[l][n] := img;
                            used[l][img] := true;
                        fi;
                        p := perm[l][p];
                        n := img;
                    od;

                fi;

            od;
        od;

        # check that the permutations commute with the generators
        for i  in [ 1 .. Length( G.generators ) ]  do
            for gen  in G.generators  do
                for pnt  in orb  do
                    if perm[i][pnt] ^ gen <> perm[i][pnt ^ gen]  then
                        return false;
                    fi;
                od;
            od;
        od;

        # check that the permutation commutes with the generators
        for gen  in G.generators  do
            for orb  in orbs  do
                for pnt  in orb  do
                    if perm[l][pnt] ^ gen <> perm[l][pnt ^ gen]  then
                        return false;
                    fi;
                od;
            od;
        od;

        # everything is ok, the representation is semiregular
        return true;

    # delegate nonstandard case
    else
        return GroupOps.IsSemiRegular( G, D, opr );
    fi;

end;


#############################################################################
##
#F  PermGroupOps.Orbit(<G>,<d>)  . orbit of a point under a permutation group
##
#N  13-Jun-91 martin 'PermGroupOps.Orbit' should handle 'OnPairs'
#N  by keeping for all first points a list of known second points
##
PermGroupOps.Orbit := function ( G, d, opr )
    local   orb,        # orbit of <d> under <G>, result
            max,        # largest point moved by the group <G>
            new,        # boolean list indicating whether a point is new
            gen,        # generator of the group <G>
            pnt,        # point in the orbit <orb>
            img;        # image of the point <pnt> under the generator <gen>

    # standard operation
    if   opr = OnPoints  and IsInt(d)  then
        InfoOperation1("#I  Orbit |<d>^<G>|=\c");

        # get the largest point <max> moved by the group <G>
        max := 0;
        for gen  in G.generators  do
            if max < LargestMovedPointPerm(gen)  then
                max := LargestMovedPointPerm(gen);
            fi;
        od;

        # handle fixpoints
        if not d in [1..max]  then
            return [ d ];
        fi;

        # start with the singleton orbit
        orb := [ d ];
        new := BlistList( [1..max], [1..max] );
        new[d] := false;

        # loop over all points found
        for pnt  in orb  do

            # apply all generators <gen>
            for gen  in G.generators  do
                img := pnt ^ gen;

                # add the image <img> to the orbit if it is new
                if new[img]  then
                    Add( orb, img );
                    new[img] := false;
                fi;

            od;

        od;
        InfoOperation1("\r#I  Orbit |<d>^<G>|=",Length(orb),"\n");

    # other operation, fall back on default function
    else
        orb := GroupOps.Orbit( G, d, opr );
    fi;

    # return the orbit <orb>
    return orb;
end;


#############################################################################
##
#F  PermGroupOps.OrbitLength(<G>,<d>) . . length of the orbit of a perm group
##
PermGroupOps.OrbitLength := function ( G, d, opr )
    local   len,        # length of orbit, result
            rep,        # element of <G> mapping <d>[1] to <G>.orbit[1]
            d1, d2;     # first and second point of a pair

    # standard operation, watch out if we know the orbit
    if  opr = OnPoints  then
        if IsBound(G.orbit)  and d in G.orbit  then
            len := Length(G.orbit);
        else
            len := GroupOps.OrbitLength( G, d, OnPoints );
        fi;

    # operation on trivial tuple
    elif opr = OnTuples  and Length(d) = 0  then
        len := 1;

    # operation on singleton tuples
    elif opr = OnTuples  and Length(d) = 1  then
        if IsBound(G.orbit)  and d[1] in G.orbit  then
            len := Length(G.orbit);
        else
            len := GroupOps.OrbitLength( G, d[1], OnPoints );
        fi;

    # operation on pairs $|d^G| = |{d_1}^G||{d_2}^G_{d_1}|$
    elif opr = OnPairs  or (opr = OnTuples  and Length(d) = 2)  then
        if IsBound(G.orbit)  and d[1] in G.orbit  then
            d2 := d[2];
            d1 := d[1];
            while d1 <> G.orbit[1]  do
                d2 := d2 ^ G.transversal[d1];
                d1 := d1 ^ G.transversal[d1];
            od;
            len := Length( G.orbit )
                   * G.operations.OrbitLength(
                        G.operations.Stabilizer( G, G.orbit[1], OnPoints ),
                        d2,
                        OnPoints );
        else
            len := GroupOps.OrbitLength( G, d, OnPairs );
        fi;

    # operation on longer tuples $|d^G| = |{d_1}^G||{d_2..d_k}^G_{d_1}|$
    elif opr = OnTuples  then
        if IsBound(G.orbit)  and d[1] in G.orbit  then
            rep := G.transversal[d[1]];
            while d[1]^rep <> G.orbit[1]  do
                rep := rep * G.transversal[d[1]^rep];
            od;
            len := Length( G.orbit )
                   * G.operations.OrbitLength(
                        G.operations.Stabilizer( G, G.orbit[1], OnPoints ),
                        OnTuples( Sublist(d,[2..Length(d)]), rep ),
                        OnTuples );
        else
            len := GroupOps.OrbitLength( G, d, OnTuples );
        fi;

    # other operation, fall back to group operations
    else
        len := GroupOps.OrbitLength( G, d, opr );
    fi;

    return len;
end;


#############################################################################
##
#F  PermGroupOps.Orbits(<G>,<D>) orbits of a domain under a permutation group
##
PermGroupOps.Orbits := function ( G, D, opr )
    local   orbs,       # orbits, result
            orb,        # orbit
            max,        # largest point moved by the group <G>
            dom,        # intersection of <D> and [1..<max>] as boolean list
            new,        # boolean list indicating whether a point is new
            gen,        # generator of the group <G>
            pnt,        # point in the orbit <orb>
            fst,        # first point in the orbit <orb>
            img;        # image of the point <pnt> under the generator <gen>

    # standard operation
    if   opr = OnPoints  and ForAll( D, IsInt )  then
        InfoOperation1("#I  Orbits |orbs|=\c");

        # get the group <G> and the domain <D>
        D := Set( D );

        # get the largest point <max> moved by the group <G>
        max := 0;
        for gen  in G.generators  do
            if max < LargestMovedPointPerm(gen)  then
                max := LargestMovedPointPerm(gen);
            fi;
        od;
        dom := BlistList( [1..max], D );
        new := BlistList( [1..max], [1..max] );
        orbs := [];

        # repeat until the domain is exhausted
        fst := Position( dom, true );
        while fst <> false  do

            # start with the singleton orbit
            orb := [ fst ];
            new[fst] := false;
            dom[fst] := false;

            # loop over all points found
            for pnt  in orb  do

                # apply all generators <gen>
                for gen  in G.generators  do
                    img := pnt ^ gen;

                    # add the image <img> to the orbit if it is new
                    if new[img]  then
                        Add( orb, img );
                        new[img] := false;
                        dom[img] := false;
                    fi;

                od;

            od;

            # add the orbit to the list of orbits and take next point
            Add( orbs, orb );
            fst := Position( dom, true, fst );
            InfoOperation2("\r#I  Orbits |orbs|=",Length(orbs),"\c");

        od;

        # add the remaining points of <D>, they are fixed
        for pnt  in [ PositionSorted( D, max+1 ) .. Length(D) ]  do
            Add( orbs, [ D[pnt] ] );
        od;
        InfoOperation1("\r#I  Orbits |orbs|=",Length(orbs),"\n");

    # the domain <D> contains other stuff
    else
        orbs := GroupOps.Orbits( G, D, opr );
    fi;

    # return the orbits <orbs>
    return orbs;
end;


#############################################################################
##
#F  PermGroupOps.OrbitLengths(<G>,<D>) . .  lengths of orbits of a perm group
##
PermGroupOps.OrbitLengths := function ( G, D, opr )
    local   lens,       # orbit lengths, result
            orb,        # orbit
            max,        # largest point moved by the group <G>
            dom,        # intersection of <D> and [1..<max>] as boolean list
            new,        # boolean list indicating whether a point is new
            gen,        # generator of the group <G>
            pnt,        # point in the orbit <orb>
            fst,        # first point in the orbit <orb>
            img;        # image of the point <pnt> under the generator <gen>

    # standard operation
    if   opr = OnPoints  and ForAll( D, IsInt )  then
        InfoOperation1("#I  OrbitLengths |orbs|=\c");

        # get the group <G> and the domain <D>
        D := Set( D );

        # get the largest point <max> moved by the group <G>
        max := 0;
        for gen  in G.generators  do
            if max < LargestMovedPointPerm(gen)  then
                max := LargestMovedPointPerm(gen);
            fi;
        od;
        dom := BlistList( [1..max], D );
        new := BlistList( [1..max], [1..max] );
        lens := [];

        # repeat until the domain is exhausted
        fst := Position( dom, true );
        while fst <> false  do

            # start with the singleton orbit
            orb := [ fst ];
            new[fst] := false;
            dom[fst] := false;

            # loop over all points found
            for pnt  in orb  do

                # apply all generators <gen>
                for gen  in G.generators  do
                    img := pnt ^ gen;

                    # add the image <img> to the orbit if it is new
                    if new[img]  then
                        Add( orb, img );
                        new[img] := false;
                        dom[img] := false;
                    fi;

                od;

            od;

            # add the length to the list of lengths and take next point
            Add( lens, Length(orb) );
            fst := Position( dom, true, fst );
            InfoOperation2("\r#I  OrbitLengths |orbs|=",
                           Length(lens),"\c");

        od;

        # add the remaining points of <D>, they are fixed
        for pnt  in [ PositionSorted( D, max+1 ) .. Length(D) ]  do
            Add( lens, 1 );
        od;
        InfoOperation1("\r#I  OrbitLengths |orbs|=",
                       Length(lens),"\n");

    # other operation
    else
        lens := GroupOps.OrbitLengths( G, D, opr );
    fi;

    # return the orbit lengths <lens>
    return lens;
end;


#############################################################################
##
#F  PermGroupOps.Operation(<G>,<D>)   . operation of a perm group on a domain
##
PermGroupOps.Operation := function ( G, D, opr )
    local   grp,        # operation group, result
            prms,       # generators of the operation group <grp>
            prm,        # generator of the operation group <grp>
            gen,        # generator of the group <G>
            pos,        # inverse of the domain <D>
            inc,        # increment if <D> is a range
            disjoint,   # <D> is a list of disjoint sets of integers
            i, k;       # loop variable

    # if <D> is trivial return the trivial group
    if 0 = Length(D)  then
        InfoOperation2("\r#I  Operation(<G>,<range>) make trivial perm");
        grp := Group( () );
        grp.operation := rec( genimages := List( G.generators, x -> () ) );
        InfoOperation1("\r#I  Operation(<G>,<range>) returns   \n");

    # standard operation on a range
    elif opr = OnPoints  and IsRange(D)  then
        InfoOperation1("#I  Operation(<G>,<range>) \c");
        if Length(D) = 1  then
            inc := 1;
        else
            inc := D[2] - D[1];
        fi;

        # for each generator <gen> of the group <G>
        InfoOperation2("\r#I  Operation(<G>,<range>) make perm");
        prms := [];
        for gen  in G.generators  do

            # compute the permutation <prm>
            prm := [];
            for i  in [1..Length(D)]  do
                prm[i] := (D[i]^gen - D[1]) / inc + 1;
            od;

            # add it to the list of generators <prms>
            Add( prms, PermList( prm ) );
            InfoOperation2("\r#I  Operation(<G>,<range>) make perm",
                           Position( G.generators, gen ), "\c" );

        od;

        # make the operation group <grp>
        grp := Group( prms, () );
        grp.operation := rec( genimages := prms );
        InfoOperation1("\r#I  Operation(<G>,<range>) returns   \n");
				    
    # standard operation on a domain <D> that is not a range
    elif opr = OnPoints  and ForAll( D, IsInt )  then
        InfoOperation1("#I  Operation(<G>,<D>) \c");

        # find the inverse <pos> of the domain <D>
        pos := [];
        for i  in [1..Length(D)]  do
            pos[D[i]] := i;
        od;

        # for each generator <gen> of the group <G>
        InfoOperation2("\r#I  Operation(<G>,<D>) make perm");
        prms := [];
        for gen  in G.generators  do

            # compute the permutation <prm>
            prm := [];
            for i  in [1..Length(D)]  do
                prm[i] := pos[ D[i]^gen ];
            od;

            # add it to the list of generators <prms>
            Add( prms, PermList( prm ) );
            InfoOperation2("\r#I  Operation(<G>,<D>) make perm",
                           Position( G.generators, gen ), "\c" );

        od;

        # make the operation group <grp>
        grp := Group( prms, () );
        grp.operation := rec( genimages := prms );
        InfoOperation1("\r#I  Operation(<G>,<D>) returns   \n");

    # operation on sets of integers
    elif  opr = OnSets  and ForAll( D, d -> ForAll( d, IsInt ) )  then
        InfoOperation1("#I  Operation(<G>,<D>) \c");

        # remember the block in which each element lies
        disjoint := true;
        pos := [];
        for i  in [ 1 .. Length(D) ]  do
            if not IsSet( D[i] ) then
                Error( "elements of D must be sets" );
            fi;
            for k  in D[i]  do
                disjoint := disjoint and not IsBound( pos[k] );
                if disjoint  then
                    pos[k] := i;
                fi;
            od;
        od;

        # we can only handle this case if all the sets are disjoint
        if not disjoint  then
            return GroupOps.Operation( G, D, opr );
        fi;

        # for each generator <gen> of the group <G>
        InfoOperation2("\r#I  Operation(<G>,<D>) make perm");
        prms := [];
        for gen  in G.generators  do

            # compute the permutation <prm>
            prm := [];
            for i  in [1..Length(D)]  do
    	    	if 0 = Length(D[i])  then
    	    	    prm[i] := i;
    	    	else
                    prm[i] := pos[ D[i][1]^gen ];
    	    	fi;
            od;

            # add it to the list of generators <prms>
            Add( prms, PermList( prm ) );
            InfoOperation2("\r#I  Operation(<G>,<D>) make perm",
                           Position( G.generators, gen ), "\c" );

        od;

        # make the operation group <grp>
        grp := Group( prms, () );
        grp.operation := rec( genimages := prms,
                              isBlocksOperation := true );
        InfoOperation1("\r#I  Operation(<G>,<D>) returns   \n");

    # other operation
    else
        grp := GroupOps.Operation( G, D, opr );
    fi;

    # transfer stabchain options
    if IsBound(G.stabChainOptions) 
       and IsBound(G.stabChainOptions.random) then
      grp.stabChainOptions:=rec(
	random:=G.stabChainOptions.random
      );
    elif IsBound(Parent(G).stabChainOptions)
       and IsBound(Parent(G).stabChainOptions.random) then
      grp.stabChainOptions:=rec(
        random:=Parent(G).stabChainOptions.random
      );

    fi;

    # return the operation group <grp>
    return grp;
end;


#############################################################################
##
#F  PermGroupOps.Blocks( <G>, <D> [, <seed>] [, <operation>] )
##
PermGroupOps.BlocksNoSeed := function ( G, D )
    local   blocks,     # block system of <G>, result
            orbit,      # orbit of 1 under <G>
            trans,      # factored inverse transversal for <orbit>
            eql,        # '<i> = <eql>[<k>]' means $\beta(i)  = \beta(k)$,
            next,       # the points that are equivalent are linked
            last,       # last point on the list linked through 'next'
            leq,        # '<i> = <leq>[<k>]' means $\beta(i) <= \beta(k)$
            gen,        # one generator of <G> or 'Stab(<G>,1)'
            rnd,        # random element of <G>
            pnt,        # one point in an orbit
            img,        # the image of <pnt> under <gen>
            cur,        # the current representative of an orbit
            rep,        # the representative of a block in the block system
            block,      # the block, result
            changed,    # number of random Schreier generators
            nrorbs,     # number of orbits of subgroup $H$ of $G_1$
            i;          # loop variable

    # handle trivial domain
    if Length( D ) = 1  or IsPrime( Length( D ) )  then
        return [ D ];
    fi;
 
    # handle trivial group
    if IsTrivial( G )  then
        Error("<G> must operate transitively on <D>");
    fi;

    # compute the orbit of $G$ and a factored transversal
    orbit := [ D[1] ];
    trans := [];
    trans[ D[1] ] := ();
    for pnt  in orbit  do
        for gen  in G.generators  do
            if not IsBound( trans[ pnt / gen ] )  then
                Add( orbit, pnt / gen );
                trans[ pnt / gen ] := gen;
            fi;
        od;
    od;

    # check that the group is transitive
    if Length( orbit ) <> Length( D )  then
        Error("<G> must operate transitively on <D>");
    fi;
    InfoOperation1("#I  BlocksNoSeed transversal computed\n");
    nrorbs := Length( orbit );

    # since $i \in k^{G_1}$ implies $\beta(i)=\beta(k)$,  we initialize <eql>
    # so that the connected components are orbits of some subgroup  $H < G_1$
    eql := [];
    leq := [];
    next := [];
    last := [];
    for pnt  in orbit  do
        eql[pnt]  := pnt;
        leq[pnt]  := pnt;
        next[pnt] := 0;
        last[pnt] := pnt;
    od;

    # repeat until we have a block system
    changed := 0;
    cur := orbit[2];
    rnd := ();
    repeat

        # compute such an $H$ by taking random  Schreier generators  of $G_1$
        # and stop if 2 successive generators dont change the orbits any more
        while changed < 2  do

            # compute a random Schreier generator of $G_1$
            i := Length( orbit );
            while 1 <= i  do
                rnd := rnd * Random( G.generators );
                i   := QuoInt( i, 2 );
            od;
            gen := rnd;
            while D[1] ^ gen <> D[1]  do
                gen := gen * trans[ D[1] ^ gen ];
            od;
            changed := changed + 1;

            # compute the image of every point under <gen>
            for pnt  in orbit  do
                img := pnt ^ gen;

                # find the representative of the orbit of <pnt>
                while eql[pnt] <> pnt  do
                    pnt := eql[pnt];
                od;

                # find the representative of the orbit of <img>
                while eql[img] <> img  do
                    img := eql[img];
                od;

                # if the don't agree merge their orbits
                if   pnt < img  then
                    eql[img] := pnt;
                    next[ last[pnt] ] := img;
                    last[pnt] := last[img];
                    nrorbs := nrorbs - 1;
                    changed := 0;
                elif img < pnt  then
                    eql[pnt] := img;
                    next[ last[img] ] := pnt;
                    last[img] := last[pnt];
                    nrorbs := nrorbs - 1;
                    changed := 0;
                fi;

            od;

        od;
        InfoOperation1("#I  BlocksNoSeed ",
                       "number of orbits of <H> < <G>_1 is ",nrorbs,"\n");

        # take arbitrary point <cur>,  and an element <gen> taking 1 to <cur>
        while eql[cur] <> cur  do
            cur := eql[cur];
        od;
        gen := [];
        img := cur;
        while img <> D[1]  do
            Add( gen, trans[img] );
            img := img ^ trans[img];
        od;
        gen := Reversed( gen );

        # compute an alleged block as orbit of 1 under $< H, gen >$
        pnt := cur;
        while pnt <> 0  do

            # compute the representative of the block containing the image
            img := pnt;
            for i  in gen  do
                img := img / i;
            od;
            while eql[img] <> img  do
                img := eql[img];
            od;

            # if its not our current block but a minimal block
            if   img <> D[1]  and img <> cur  and leq[img] = img  then

                # then try <img> as a new start
                leq[cur] := img;
                cur := img;
                gen := [];
                img := cur;
                while img <> D[1]  do
                    Add( gen, trans[img] );
                    img := img ^ trans[img];
                od;
                gen := Reversed( gen );
                pnt := cur;

            # otherwise if its not our current block but contains it
            # by construction a nonminimal block contains the current block
            elif img <> D[1]  and img <> cur  and leq[img] <> img  then

                # then merge all blocks it contains with <cur>
                while img <> cur  do
                    eql[img] := cur;
                    next[ last[cur] ] := img;
                    last[ cur ] := last[ img ];
                    img := leq[img];
                    while img <> eql[img]  do
                        img := eql[img];
                    od;
                od;
                pnt := next[pnt];

            # go on to the next point in the orbit
            else

                pnt := next[pnt];

            fi;

        od;

        # make the alleged block
        block := [ D[1] ];
        pnt := cur;
        while pnt <> 0  do
            Add( block, pnt );
            pnt := next[pnt];
        od;
        block := Set( block );
        blocks := [ block ];
        InfoOperation1("#I  BlocksNoSeed ",
                       "length of alleged block is ",Length(block),"\n");

        # quick test to see if the group is primitive
        if Length( block ) = Length( orbit )  then
            InfoOperation1("#I  BlocksNoSeed <G> is primitive\n");
            return [ D ];
        fi;

        # quick test to see if the orbit can be a block
        if Length( orbit ) mod Length( block ) <> 0  then
            InfoOperation1("#I  BlocksNoSeed ",
                           "alleged block is clearly not a block\n");
            changed := -1000;
        fi;

        # '<rep>[<i>]' is the representative of the block containing <i>
        rep := [];
        for pnt  in orbit  do
            rep[pnt] := 0;
        od;
        for pnt  in block  do
            rep[pnt] := 1;
        od;

        # compute the block system with an orbit algorithm
        i := 1;
        while 0 <= changed  and i <= Length( blocks )  do

            # loop over the generators
            for gen  in G.generators  do

                # compute the image of the block under the generator
                img := OnSets( blocks[i], gen );

                # if this block is new
                if rep[ img[1] ] = 0  then

                    # add the new block to the list of blocks
                    Add( blocks, img );

                    # check that all points in the image are new
                    for pnt  in img  do
                        if rep[pnt] <> 0  then
                            InfoOperation1("#I  BlocksNoSeed ",
                                           "alleged block is not a block\n");
                            changed := -1000;
                        fi;
                        rep[pnt] := img[1];
                    od;

                # if this block is old
                else

                    # check that all points in the image lie in the block
                    for pnt  in img  do
                        if rep[pnt] <> rep[img[1]]  then
                           InfoOperation1("#I  BlocksNoSeed ",
                                           "alleged block is not a block\n");
                            changed := -1000;
                        fi;
                    od;

                fi;

            od;

            # on to the next block in the orbit
            i := i + 1;
        od;

    until 0 <= changed;

    # return the block system
    return blocks;
end;

PermGroupOps.BlocksSeed := function ( G, D, seed )
    local   blks,       # list of blocks, result
            rep,        # representative of a point
            siz,        # siz[a] of the size of the block with rep <a>
            fst,        # first point still to be merged into another block
            nxt,        # next  point still to be merged into another block
            lst,        # last  point still to be merged into another block
            gen,        # generator of the group <G>
            nrb,        # number of blocks so far
            a, b, c, d; # loop variables for points

    nrb := Length(D) - Length(seed) + 1;
    InfoOperation1("#I  BlocksSeed |<blocks>|=",nrb,"  \c");

    # in the beginning each point <d> is in a block by itself
    rep := [];
    siz := [];
    for d  in D  do
        rep[d] := d;
        siz[d] := 1;
    od;

    # except the points in <seed>, which form one block with rep <seed>[1]
    fst := 0;
    nxt := siz;
    lst := 0;
    c   := seed[1];
    for d  in seed  do
        if d <> c  then
            rep[d] := c;
            siz[c] := siz[c] + siz[d];
            if fst = 0  then
                fst      := d;
            else
                nxt[lst] := d;
            fi;
            lst      := d;
            nxt[lst] := 0;
        fi;
    od;

    # while there are points still to be merged into another block
    while fst <> 0  do

        # get this point <a> and its repesentative <b>
        a := fst;
        b := rep[fst];

        # for each generator <gen> merge the blocks of <a>^<gen>, <b>^<gen>
        for gen  in G.generators  do
            c := a^gen;
            while rep[c] <> c  do
                c := rep[c];
            od;
            d := b^gen;
            while rep[d] <> d  do
                d := rep[d];
            od;
            if c <> d  then
                if Length(D) < 2*(siz[c] + siz[d])  then
                    InfoOperation1("\r#I  BlocksSeed |<blocks>|=1 ",
                                   "(one block too large)\n");
                    return [ D ];
                fi;
                nrb := nrb - 1;
                InfoOperation2("\r#I  BlocksSeed |<blocks>|=",
                               nrb,"  \c");
                if siz[d] <= siz[c]  then
                    rep[d]   := c;
                    siz[c]   := siz[c] + siz[d];
                    nxt[lst] := d;
                    lst      := d;
                    nxt[lst] := 0;
                else
                    rep[c]   := d;
                    siz[d]   := siz[d] + siz[c];
                    nxt[lst] := c;
                    lst      := c;
                    nxt[lst] := 0;
                fi;
            fi;
        od;

        # on to the next point still to be merged into another block
        fst := nxt[fst];
    od;

    # turn the list of representatives <rep> into a list of blocks <blks>
    blks := [];
    for d  in D  do
        c := d;
        while rep[c] <> c  do
           c := rep[c];
        od;
        if IsInt( nxt[c] )  then
            nxt[c] := [ d ];
            Add( blks, nxt[c] );
        else
            AddSet( nxt[c], d );
        fi;
    od;

    # return the set of blocks <blks>
    InfoOperation1("\r#I  BlocksSeed |<blocks>|=",nrb,"  \n");
    return Set( blks );
end;

PermGroupOps.Blocks := function ( G, D, seed, opr )
    local   blks,       # blocks, result
            i;          # loop variable

    # standard operation on points
    if   opr = OnPoints  and ForAll( D, IsInt )  then
        InfoOperation1("#I  Blocks called\n");

        # dispatch to appropriate function
        if seed = []  then
            blks := G.operations.BlocksNoSeed( G, D );
        else
            blks := G.operations.BlocksSeed( G, D, seed );
        fi;

        # give some information
        InfoOperation1("#I  Blocks |<blocks>|=",Length(blks),"\n");

    # other operation
    else
        blks := GroupOps.Blocks( G, D, seed, opr );
    fi;

    # return the blocks <blks>
    return blks;
end;


#############################################################################
##
#F  PermGroupOps.MaximalBlocks( <G>, <D> [, <seed>] [, <operation>] )
##
PermGroupOps.MaximalBlocks := function ( G, D, seed, opr )
    local   blks,       # blocks, result
            H,          # image of <G>
            blksH,      # blocks of <H>
            i;          # loop variable

    # standard operation on points
    if   opr = OnPoints  and ForAll( D, IsInt )  then
        InfoOperation1("#I  MaximalBlocks called\n");

        # dispatch to appropriate function
        if seed = []  then
            blks := G.operations.BlocksNoSeed( G, D );
        else
            blks := G.operations.BlocksSeed( G, D, seed );
        fi;

        # iterate until the operation becomes primitive
        H := G;
        blksH := blks;
        while Length( blksH ) <> 1  do
            H     := Operation( H, blksH, OnSets );
            blksH := Blocks( H, [1..Length(blksH)] );
            if Length( blksH ) <> 1  then
                blks := List( blksH, bl -> Union( Sublist( blks, bl ) ) );
            fi;
        od;

        # give some information
        InfoOperation1("#I  MaximalBlocks |<blocks>|=",Length(blks),"\n");

    # other operation
    else
        blks := GroupOps.MaximalBlocks( G, D, seed, opr );
    fi;

    # return the blocks <blks>
    return blks;
end;


#############################################################################
##
#F  PermGroupOps.Stabilizer(<G>,<d>)  . . . stabilizer of a permutation group
##
PermGroupOps.Stabilizer := function ( G, d, opr )
    local   K,          # stabilizer <K>, result
            C;          # stabilizer chain of G

    # standard operation on points, make a stabchain beginning with <d>
    if   opr = OnPoints  and IsInt(d)  then
        MakeStabChain( G, [d] );
        if G.generators <> []  and G.orbit[1] = d  then
            K := Subgroup( Parent(G), ShallowCopy( G.stabilizer.generators ) );
            K.stabChain := Copy( G.stabChain.stabilizer );
            if IsBound( G.stabilizer.orbit )  then
                K.orbit       := K.stabChain.orbit;
                K.transversal := K.stabChain.transversal;
                K.stabilizer  := K.stabChain.stabilizer;
            fi;
        else
            K := ShallowCopy( G );
            K.stabChain := Copy( G.stabChain );
            if IsBound( G.orbit )  then
                K.orbit       := K.stabChain.orbit;
                K.transversal := K.stabChain.transversal;
                K.stabilizer  := K.stabChain.stabilizer;
            fi;
        fi;
        if IsBound(G.stabChainOptions) and IsBound(G.stabChainOptions.random)
           then K.stabChainOptions := rec (random :=G.stabChainOptions.random);
        fi;

    # standard operation on a permutation, take the centralizer
    elif opr = OnPoints  and IsPerm(d)  then
        K := G.operations.Centralizer( G, d );

    # standard operation on a permutation group, take the normalizer
    elif opr = OnPoints  and IsPermGroup(d)  then
        K := G.operations.Normalizer( G, d );

    # operation on tuples of points, make a stabchain beginning with <d>
    elif (opr = OnPairs  or opr = OnTuples)  and ForAll( d, IsInt )  then
        MakeStabChain( G, d );
        C := G.stabChain;
        while C.generators <> []  and C.orbit[1] in d  do
            C := C.stabilizer;
        od;
        K := Subgroup( Parent(G), ShallowCopy( C.generators ) );
        K.stabChain := Copy( C );
        if IsBound( C.orbit )  then
                K.orbit       := K.stabChain.orbit;
                K.transversal := K.stabChain.transversal;
                K.stabilizer  := K.stabChain.stabilizer;
        fi;
        if IsBound(G.stabChainOptions) and IsBound(G.stabChainOptions.random)
           then K.stabChainOptions := rec (random :=G.stabChainOptions.random);
        fi;

    # operation on pairs or tuples of permutations, take the centralizer
    elif (opr = OnPairs  or opr = OnTuples)  and ForAll( d, IsPerm )  then
        K := G.operations.Centralizer( G, Subgroup( Parent(G), d ) );

    # operation on sets of points, use a backtrack
    elif opr = OnSets  and ForAll( d, IsInt )  then
        K := G.operations.StabilizerSet( G, d );

    # other operation
    else
        K := GroupOps.Stabilizer( G, d, opr );
    fi;

    # return the stabilizer
    return K;
end;


#############################################################################
##
#F  PermGroupOps.RepresentativeOperation(<G>,<d>,<e>,<opr>) .  representative
#F                                          of a point in a permutation group
##
PermGroupOps.RepresentativeOperation := function ( G, d, e, opr )
    local   rep,                # representative, result
            S,                  # stabilizer of <G>
            rep2,               # representative in <S>
            i;                  # loop variable

    # standard operation on points, make a basechange and trace the rep
    if   opr = OnPoints  and IsInt(d)  then
        MakeStabChain( G, [d] );
        rep := G.identity;
        if G.generators <> []  and d = G.orbit[1]  then
            if e in G.orbit  then
                while d^rep <> e  do
                    rep := G.transversal[e/rep] mod rep;
                od;
            else
                rep := false;
            fi;
        elif d <> e  then
            rep := false;
        fi;

    # operation on permutations, use backtrack
    elif opr = OnPoints  and IsPerm(d)  then
        rep := G.operations.RepresentativeConjugationElements( G, d, e );

    # operation on permgroups, use backtrack
    elif opr = OnPoints  and IsPermGroup(d)  then
        rep := G.operations.RepresentativeConjugationGroups( G, d, e );

    # operation on pairs or tuples of points, iterate
    elif (opr = OnPairs  or opr = OnTuples)  and ForAll( d, IsInt )  then
        MakeStabChain( G, d );
        rep := G.identity;
        S   := G;
        i   := 1;
        while i <= Length(d)  and rep <> false  do
            if S.generators <> []  and S.orbit[1] = d[i]  then
                if e[i]/rep in S.orbit  then
                    while d[i]^rep <> e[i]  do
                        rep := S.transversal[e[i]/rep] mod rep;
                    od;
                else
                    rep := false;
                fi;
                S := S.stabilizer;
            elif d[i] <> e[i]/rep  then
                rep := false;
            fi;
            i := i + 1;
        od;

    # operation on pairs on tuples of other objects, iterate
    elif opr = OnPairs  or opr = OnTuples  then
        rep := G.identity;
        S   := G;
        i   := 1;
        while i <= Length(d)  and rep <> false  do
            rep2 := S.operations.RepresentativeOperation(
                                          S, d[i], e[i]^(rep^-1), OnPoints );
            if rep2 <> false  then
                rep := rep2 * rep;
                S   := S.operations.Stabilizer( S, d[i], OnPoints );
            else
                rep := false;
            fi;
            i := i + 1;
        od;

    # operation on sets of points, use backtrack
    elif opr = OnSets  and ForAll( d, IsInt )  then
        rep := G.operations.RepresentativeSet( G, d, e );

    # other operation, fall back on default representative
    else
        rep := GroupOps.RepresentativeOperation( G, d, e, opr );
    fi;

    # return the representative
    return rep;
end;


#############################################################################
##
#F  PermGroupOps.SmallestMovedPoint( <G> )  . . . . . .  smallest point moved
#F                                                     by a permutation group
##
PermGroupOps.SmallestMovedPoint := function ( G )
    local   min,  minp,  i;
    if G.generators = []  then
        Error("<G> must not be trivial");
    else
        min := SmallestMovedPointPerm( G.generators[1] );
        for i  in [2..Length(G.generators)]  do
            minp := SmallestMovedPointPerm( G.generators[i] );
            if minp < min  then
                min := minp;
            fi;
        od;
    fi;
    return min;
end;


#############################################################################
##
#F  PermGroupOps.LargestMovedPoint( <G> ) . . . . . . . . largest point moved
#F                                                     by a permutation group
##
PermGroupOps.LargestMovedPoint := function ( G )
    local   max,  maxp,  i;
    if G.generators = []  then
        Error("<G> must not be trivial");
    else
        max := LargestMovedPointPerm( G.generators[1] );
        for i  in [2..Length(G.generators)]  do
            maxp := LargestMovedPointPerm( G.generators[i] );
            if max < maxp  then
                max := maxp;
            fi;
        od;
    fi;
    return max;
end;


#############################################################################
##
#F  PermGroupOps.MovedPoints( <G> ) . . . . . . . . . . . set of points moved
#F                                                     by a permutation group
##
PermGroupOps.MovedPoints := function ( G )
    local   mov, gen, pnt;
    mov := [];
    for gen  in G.generators  do
        for pnt  in [1..LargestMovedPointPerm(gen)]  do
            if pnt ^ gen <> pnt  then
                mov[ pnt ]:= pnt;
            fi;
        od;
    od;
    return Set( mov );
end;


#############################################################################
##
#F  PermGroupOps.NrMovedPoints( <G> ) . . . . . . . .  number of points moved
#F                                                     by a permutation group
##
PermGroupOps.NrMovedPoints := function ( G )
    local   mov, gen, pnt;
    mov := [];
    for gen  in G.generators  do
        for pnt  in [1..LargestMovedPointPerm(gen)]  do
            if pnt ^ gen <> pnt  then
                mov[ pnt ]:= pnt;
            fi;
        od;
    od;
    return Length( Set( mov ) );
end;


#############################################################################
##
#E  Emacs . . . . . . . . . . . . . . . . . . . . . . . local emacs variables
##
##  Local Variables:
##  mode:               outline
##  outline-regexp:     "#F\\|#V\\|#E"
##  fill-column:        73
##  fill-prefix:        "##  "
##  eval:               (hide-body)
##  End:
##



