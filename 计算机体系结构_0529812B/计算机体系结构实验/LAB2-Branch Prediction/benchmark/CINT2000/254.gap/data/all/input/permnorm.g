#############################################################################
##
#A  permnorm.g                  GAP library                         Udo Polis
##
#A  @(#)$Id: permnorm.g,v 3.28 1994/06/12 14:11:30 mschoene Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains a normalizer algorithm for permutation groups
##
#H  $Log: permnorm.g,v $
#H  Revision 3.28  1994/06/12  14:11:30  mschoene
#H  fixed 'Normalizer' for the case that <G> is not a parent group
#H
#H  Revision 3.27  1994/04/20  10:17:23  mschoene
#H  fixed 'PGO.Normalizer' for the trivial group
#H
#H  Revision 3.26  1993/09/17  09:19:46  martin
#H  fixed problem if base of <G> is shorter than the base of <H>
#H
#H  Revision 3.25  1993/03/25  14:26:41  upolis
#H  corrected: K := Closure ...
#H
#H  Revision 3.24  1992/05/27  13:09:19  upolis
#H  bug fixed in 'BaseFor..'
#H
#H  Revision 3.23  1992/05/07  13:10:23  upolis
#H  fixed bug bypass!
#H
#H  Revision 3.22  1992/03/19  12:41:04  upolis
#H  fixed bug in 'BaseForNormalizerStab'
#H
#H  Revision 3.21  1992/03/07  17:00:56  upolis
#H  fixed bug with 'Orbits'
#H
#H  Revision 3.20  1992/02/29  11:58:33  upolis
#H  fixed bug in 'SortedOrbitsPermGroup' (BlistList)
#H
#H  Revision 3.19  1992/01/29  09:09:38  martin
#H  changed 'Order' to take two arguments, group and element
#H
#H  Revision 3.18  1992/01/22  11:39:46  upolis
#H  'Subgroup' -> 'G.operations.Subgroup'
#H
#H  Revision 3.17  1992/01/22  10:45:51  upolis
#H  moved position of 'PermGroupOps.Normalizer'
#H
#H  Revision 3.16  1992/01/21  13:28:56  upolis
#H  'BaseFor..' new formatted
#H
#H  Revision 3.15  1992/01/16  19:20:13  upolis
#H  some bugs fixed
#H
#H  Revision 3.14  1992/01/08  20:07:23  upolis
#H  fixed bug in 'BaseForNormalizerPermGroup'
#H
#H  Revision 3.13  1992/01/07  14:45:19  upolis
#H  initial revision under RCS
#H
#H  Revision 3.12  1991/08/29  09:09:07  upolis
#H  bug fixed in the initialisation of K (e.g. if F has the entry F.elements
#H  K should not have it)
#H
#H  Revision 3.11  1991/08/26  14:52:18  upolis
#H  bug fixed in 'BaseFor...': Intersection( MovedPoints(S_G),orbit[1])
#H
#H  Revision 3.10  1991/08/23  15:49:26  upolis
#H  bug fixed: compute all moved points of S_G for int
#H
#H  Revision 3.9  1991/08/22  09:11:11  upolis
#H  F needs not to be a subgroup of G further on;
#H  dealing with the trivial cases
#H
#H  Revision 3.8  1991/08/08  17:28:51  upolis
#H  bug fixed in 'BaseForNormalizerPermGroup'
#H     G := M(12), g := (1,10)(2,6,9,12)(3,11,4,7)(5,8),
#H     n := (1,8,10,5)(2,6,9,12)   |Norm of <g> in G| = 64
#H
#H  Revision 3.7  1991/06/27  11:20:53  upolis
#H  number of function-calls 'Orbit' reduced
#H
#H  Revision 3.6  1991/06/25  16:54:26  upolis
#H  fixed a serious bug in BaseForNormalizerPermGroup (From_F_orbit)
#H
#H  Revision 3.5  1991/06/13  11:08:01  upolis
#H  The first version which is faster than Cayley in (all) cases; even
#H  the normalizer of a 3-element in the J3 on 6156 points.
#H  Fewer garbage collections since Append( list1, list2 ) is used instead
#H  of UniteSet() in SortedOrbitsPermGroup(); the kernel has been modified:
#H  the size of the object increases logarithmically.
#H
#H  Revision 3.4  1991/06/12  12:04:35  upolis
#H  uses blistlists to cope with the orbits, function 'SortedOrbitsButler'
#H  added; 'SortedOrbitsPermGroup' returns all orbits of F^(i);
#H  F_orbit[i] contains all orbits of F^(i) if bound; a new 'SigmaSet'-
#H  routine; better performance of the computation of Delta.
#H
#H  Revision 3.3  1991/06/10  13:28:21  upolis
#H  Testrevision: reduced number of unions for the computation of 'Delta'
#H
#H  Revision 3.2  1991/06/10  13:20:32  upolis
#H  Testrevision: new 'SigmaSets', error 'From_F_orbit' corrected
#H
#H  Revision 3.1  1991/06/10  12:55:42  upolis
#H  Initial revision
##


#############################################################################
##
#F  InfoPermGroup1( ... ) . .  information function for the permgroup package
#F  InfoPermGroup2( ... ) . .  information function for the permgroup package
##
if not IsBound( InfoPermGroup1 )  then InfoPermGroup1 := Ignore;  fi;
if not IsBound( InfoPermGroup2 )  then InfoPermGroup2 := Ignore;  fi;


#############################################################################
##
#F  PermGroupOps.Normalizer(<G>,<F>)  . . stabilizer-chain for the normalizer
#F                                                              of <F> in <G>
##
PermGroupOps.Normalizer := function ( G, F )
    local  ElementNormalizerCoset,  FindSubgroupNormalizer, K, orb,
           struct, base, F_list, From_F_orbit, F_orbit,
           sigma, Omega, t, p, o, no, F_orbit_no, F_BP_orbits,
           sigmaSets, sigmaNo, gen, sg, nelm, bp_pos;


    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    # $L$ fixes $S*s$, i.e., $S*s*L = S*s$ and is a subgroup  of  the  wanted
    # subgroup $K$, thus $prop( x )$ implies $prop( x*l )$ for all $l \in L$.
    ElementNormalizerCoset := function ( S, s, L, fixlevel, prevfixed )
        # fixlevel is equivalent to 's' in the Butler-paper
        local  fixed, fix, points, p, ss, LL, elm, l, j, t, x, Gamma, Delta,
               Sigma, double_orbits, pos, ffo;

        # if $S$ is the trivial group check whether  $s$  has  the  property.
        if S.generators = []  then
            if ForAny( F.generators, x -> not ( x^s in F ) ) then
                return false;
            else
                return s;
            fi;
        fi;

        # make 'points' a subset  of  $S.orbit ^ s$  of  those  points  which
        # correspond to cosets that might contain elements satisfying <prop>.
        # make  this  set  as  small  as  possible  with  reasonable  effort!

        if IsBound( From_F_orbit[bp_pos[S.orbit[1]]] ) then

            ffo := From_F_orbit[bp_pos[S.orbit[1]]];
            j := ffo[1];
            t := ffo[2];

            if t > fixlevel then t := fixlevel; fi;
            # compute Gamma
            if t = 1 then
                Gamma:=F_orbit[1][F_orbit_no[base[j]^s]];
            else
                Gamma:=Set(F.operations.Orbit(F_list[t],base[j]^s,OnPoints));
            fi;
            # compute Delta
            Delta := [];
            double_orbits := [];
            for pos  in [j+1 .. bp_pos[S.orbit[1]]-1] do
                x := base[pos];
                if not F_orbit_no[x^s] in double_orbits then
                    UniteSet(Delta,F_orbit[1][F_orbit_no[x^s]]);
                    Add( double_orbits, F_orbit_no[x^s] );
                fi;
            od;
            if t < fixlevel then
                UniteSet(Delta,
                         F.operations.Orbit(F_list[t+1],base[j]^s,OnPoints));
            fi;

            # compute Sigma
            Sigma := Set( OnTuples( S.orbit, s ) );
            double_orbits := [];
            for x in [t..fixlevel] do
                if IsBound( sigmaNo[x] ) then
                    pos := sigmaNo[x][bp_pos[S.orbit[1]]];
                    if     not pos in double_orbits
                       and not Length(sigmaSets[x][pos]) = Length(Omega)
                    then
                        IntersectSet( Sigma, sigmaSets[x][pos] );
                        Add( double_orbits, pos );
                    fi;
                fi;
            od;
        else
            # compute Gamma
            Gamma := OnTuples( S.orbit, s );
            Sigma := Set( Gamma );

            # compute Delta
            Delta := [];
            double_orbits := [];
            for pos  in [1 .. bp_pos[S.orbit[1]]-1] do
                x := base[pos];
                if not F_orbit_no[x^s] in double_orbits then
                    UniteSet(Delta,F_orbit[1][F_orbit_no[x^s]]);
                    Add( double_orbits, F_orbit_no[x^s] );
                fi;
            od;

            # compute Sigma
            #   init s. above!
            double_orbits := [];
            for x in [1..fixlevel] do
                if IsBound( sigmaNo[x] ) then
                    pos := sigmaNo[x][bp_pos[S.orbit[1]]];
                    if     not pos in double_orbits
                       and not Length(sigmaSets[x][pos]) = Length(Omega)
                    then
                        IntersectSet( Sigma, sigmaSets[x][pos] );
                        Add( double_orbits, pos );
                    fi;
                fi;
            od;
        fi;

        # 'Sigma' has been intersected with X(T) yet
        points := Intersection( Difference( Gamma, Delta ), Sigma);

        # run through the points, i.e., through the cosets of the stabilizer.
        while points <> []  do

            # take a point $p$.
            p  := points[1];

            # find coset representant, i.e., $ss  \in  S, S.orbit[1]^ss = p$.
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;

            fix := fixlevel;
            if prevfixed and S.orbit[1]^ss = S.orbit[1] then
                fix := fix + 1;
                fixed := true;
            else
                fixed := false;
            fi;

            # find a subgroup $LL$  of  $L$  which fixes $S.stabilizer * ss$,
            # i.e., an approximation (subgroup) $LL$ of $Stabilizer( L, p )$.
            # note that $LL$ preserves <prop> since it is a subgroup  of $L$.
            # compute a better aproximation, for example using  'ChangeBase'!
            LL := G.operations.Subgroup(
                             Parent(G),Filtered(L.generators, l -> p^l = p));

            # search the coset $S.stabilizer * ss$ and  return if successful.
            elm := ElementNormalizerCoset( S.stabilizer, ss, LL, fix, fixed);
            if elm <> false  then return elm;  fi;

            # if there was no element in $S.stab * Rep(p)$ satisfying  <prop>
            # there can be none in  $S.stab * Rep(p^l) = S.stab * Rep(p) * l$
            # for any $l \in L$ because $L$ preserves  the  property  <prop>.
            # thus we can remove the entire $L$ orbit of $p$ from the points.
            if Length( L.generators ) = 0 then
                SubtractSet( points, [p] );
            else
                SubtractSet( points, G.operations.Orbit( L, p, OnPoints ) );
            fi;

        od;

        # there is no element with the property <prop> in the coset  $S * s$.
        return false;

    end;

    # make $L$ the subgroup with the property of some stabilizer $S$ of  $G$.
    # upon  entry  $L$  is  already  a  subgroup  of  this  wanted  subgroup.
    FindSubgroupNormalizer := function ( S, L, fixlevel, prevfixed )
        # fixlevel is equivalent to 's' in the Butler-paper
        local  gens, gen, points, p, ss, LL, elm, l, i, j, t, Gamma, len, k,
               x, Delta, fixed, fix, Sigma, double_orbits, pos, ffo;

        # if $S$ is the trivial group, then so  is  $L$  and  we  are  ready.
        if S.generators = []  then return;  fi;

        # make  'points'  a  subset  of  $S.orbit$  of  those  points   which
        # correspond to cosets that might contain elements satisfying <prop>.
        # make  this  set  as  small  as  possible  with  reasonable  effort!
        if IsBound( From_F_orbit[bp_pos[S.orbit[1]]] ) then

            ffo := From_F_orbit[bp_pos[S.orbit[1]]];
            j := ffo[1];
            t := ffo[2];

            # compute Gamma
            if t = 1 then
                Gamma := F_orbit[1][F_orbit_no[base[j]]];
            else
                Gamma := F.operations.Orbit( F_list[t], base[j], OnPoints );
            fi;
            # compute Delta
            Delta := [];
            double_orbits := [];
            for pos  in [j+1 .. bp_pos[S.orbit[1]]-1] do
                x := base[pos];
                if not F_orbit_no[x] in double_orbits then
                    UniteSet(Delta,F_orbit[1][F_orbit_no[x]]);
                    Add( double_orbits, F_orbit_no[x] );
                fi;
            od;
            if t < fixlevel then
                UniteSet(Delta,
                         F.operations.Orbit(F_list[t+1],base[j],OnPoints));
            fi;
            # compute Sigma
            Sigma := Set( S.orbit );
            double_orbits := [];
            for x in [t..fixlevel] do
                if IsBound( sigmaNo[x] ) then
                    pos := sigmaNo[x][bp_pos[S.orbit[1]]];
                    if     not pos in double_orbits
                       and not Length(sigmaSets[x][pos]) = Length(Omega)
                    then
                        IntersectSet( Sigma, sigmaSets[x][pos] );
                        Add( double_orbits, pos );
                    fi;
                fi;
            od;
        else
            # compute Gamma
            Gamma := S.orbit;

            # compute Delta
            Delta := [];
            double_orbits := [];
            for pos  in [1 .. bp_pos[S.orbit[1]]-1] do
                x := base[pos];
                if not F_orbit_no[x] in double_orbits then
                    UniteSet(Delta,F_orbit[1][F_orbit_no[x]]);
                    Add( double_orbits, F_orbit_no[x] );
                fi;
            od;

            # compute Sigma
            Sigma := Set( S.orbit );
            double_orbits := [];
            for x in [1..fixlevel] do
                if IsBound( sigmaNo[x] ) then
                    pos := sigmaNo[x][bp_pos[S.orbit[1]]];
                    if     not pos in double_orbits
                       and not Length(sigmaSets[x][pos]) = Length(Omega)
                    then
                        IntersectSet( Sigma, sigmaSets[x][pos] );
                        Add( double_orbits, pos );
                    fi;
                fi;
            od;
        fi;

        # 'Sigma' has been intersected with X(T) yet
        points := Intersection( Difference( Gamma, Delta ), Sigma );

        # make $L.stab$ the full  subgroup  of  $S.stab$  satisfying  <prop>.

        FindSubgroupNormalizer( S.stabilizer, L.stabilizer, fixlevel+1,true);

        # add L.stabilizer.generators to L, since they my move any points of
        # L.orbit
        for gen in L.stabilizer.generators do
            if not gen in L.generators then
                K.operations.AddGensExtOrb( L, [ gen ] );
            fi;
        od;

        # suppose that $x \in S.stab * Rep(S.orbit[1]^l)$  satisfies  <prop>,
        # since $S.stab*Rep(S.orbit[1]^l)=S.stab*l$ we have $x/l \in S.stab$.
        # because $l \in L$ it follows that $x/l$ satisfies <prop> also,  and
        # since $L.stab$ is the full subgroup of $S.stab$  satisfying  <prop>
        # it follows that $x/l \in L.stab$  and so  $x \in L.stab * l \<= L$.
        # thus we can remove the entire $L$ orbit of  $p$  from  the  points.
        SubtractSet( points, G.operations.Orbit( L, S.orbit[1], OnPoints ) );

        # run through the points, i.e., through the cosets of the stabilizer.
        while points <> []  do

            # take a point $p$.
            p := points[1];

            # find coset representant, i.e., $ss  \in  S, S.orbit[1]^ss = p$.
            ss := S.identity;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;

            fix := fixlevel;
            if prevfixed and S.orbit[1]^ss = S.orbit[1] then
                fix := fix + 1;
                fixed := true;
            else
                fixed := false;
            fi;

            # find a subgroup $LL$  of  $L$  which fixes $S.stabilizer * ss$,
            # i.e., an approximation (subgroup) $LL$ of $Stabilizer( L, p )$.
            # note that $LL$ preserves <prop> since it is a subgroup  of $L$.
            # compute a better aproximation, for example using  'ChangeBase'!
            LL := G.operations.Subgroup(
                             Parent(G),Filtered(L.generators, l -> p^l = p));

            # search the coset $S.stabilizer * ss$  and  add  if  successful.
            elm := ElementNormalizerCoset( S.stabilizer, ss, LL, fix, fixed);
            if elm <> false then
                K.operations.AddGensExtOrb( L, [ elm ] );
            fi;

            # if there was no element in $S.stab * Rep(p)$ satisfying  <prop>
            # there can be none in  $S.stab * Rep(p^l) = S.stab * Rep(p) * l$
            # for any $l \in L$ because $L$ preserves  the  property  <prop>.
            # thus we can remove the entire $L$ orbit of $p$ from the points.
            SubtractSet( points, G.operations.Orbit( L, p, OnPoints ) );

        od;

        # there is no element with the property <prop> in the coset  $S * s$.
        return false;

    end;

    # compute a stabilizer chain for $G$.
    # select an optimal base that allows us to prune  the  tree  efficiently!
    if not (IsPermGroup(G) and (IsPermGroup(F) or IsPerm(F))) then
        Error("usage: PermGroupOps.Normalizer( <G>, <F> )");
    fi;

    # I hope this fixes the known bug in 'Normalizer'
    #N  1994/06/10 mschoene this needs a complete rewrite though
    if not IsParent( G )  then
        return Intersection( G, Normalizer( Parent(G), F ) );
    fi;

    InfoPermGroup1("#I  PermGroupOps.Normalizer\n");

    if IsPerm( F ) then F := Group( F ); fi;

    # test whether F is normal in G
    nelm := [];
    sg   := G.operations.StrongGenerators( G );
    for gen  in sg do

        # store the normalizing elements of G
        if ForAll( F.generators, f -> f^gen in F ) then
            Add( nelm, gen );
        fi;

    od;

    # dealing with the trivial cases
    if    G.generators = []
       or F.generators = []
       or sg = nelm
    then
        InfoPermGroup2("#I    trivial\n");
        if not IsBound( G.stabilizer ) then
            MakeStabChain( G );
        fi;
        K := G.operations.Subgroup( Parent( G ), G.generators );
        if IsBound( G.orbit )  then
            K.orbit := Copy( G.orbit );
            K.transversal := ShallowCopy( G.transversal );
            K.stabilizer  := Copy( G.stabilizer );
        fi;
        return K;
    fi;

    # compute the centralizer for cyclic groups of order 2
    if Length( F.generators ) = 1 and Order( F, F.generators[1] ) = 2 then

        # return the centralizer since |cent| = |norm|
        return G.operations.Centralizer( G, F );

    fi;

    Omega := G.operations.MovedPoints( G );

    # search for an optimal base
    struct := BaseForNormalizerPermGroup( G, F, Omega );
    base   := struct.Base;
    F_orbit:= struct.F_orbit;
    F_orbit_no := [];
    for o in F_orbit[1] do
        no := Position(F_orbit[1],o);
        for p in o do
            F_orbit_no[p] := no;
        od;
    od;

    From_F_orbit := struct.From_F_orbit;
    F_BP_orbits := struct.F_BP_orbits;
    F_list := ListStabChain(F);

    # find a subgroup  $K$  of  $G$  which  preserves  the  property  <prop>,
    # i.e., $prop( x )$ implies $prop( x * k )$  for all  $x \in G, k \in K$.
    # since this subgroup is changed in the algorithm use 'Copy' or  'Group'.
    # make this  subgroup  as  large  as  possible  with  reasonable  effort!
    if IsSubgroup( G, F ) then
       #C Aug 29, 91: udo fixed a serious bug:  K := Copy( F );
       K := G.operations.Subgroup( Parent( G ), F.generators );
       K.orbit      := Copy( F.orbit );
       K.transversal:= ShallowCopy( F.transversal );
       K.stabilizer := Copy( F.stabilizer );
    else
       K := Intersection( G, F );
    fi;

    MakeStabChain( K, base );
    ExtendStabChain( K, base );

    for gen  in nelm do
        if not gen in K then
            K := K.operations.Closure( K, gen );
        fi;
    od;

    # K.operations.Closure adds 'gen' relative to the known base of 'K' and
    # adds new points at the tail; i.e. the beginning of the base of 'K' is
    # o.k. Only the new points at the end have to be changed!
    MakeStabChain( K, base );
    ExtendStabChain( K, base );

    # compute the "basic-sets" for Sigma, s. Butler p. 166
    sigma := SigmaSets(F_list,Omega,base,F_orbit,F_BP_orbits);
    sigmaSets := sigma.sigmaSets;
    sigmaNo := sigma.sigmaNo;

    # do not use 'Position(base,bp)' while backtracking!
    bp_pos := [];
    for no  in [1..Length(base)] do
        bp_pos[base[no]] := no;
    od;

    # search through the whole group $G = G * Id$ for an element with <prop>.
    FindSubgroupNormalizer( G, K, 1, true );
    ReduceStabChain( K );

    return K;

end;


#############################################################################
##
#F  SortedOrbitsButler( OrbitsToSort ) . . . . . sorted list of orbits sorted
#F                                                        according to Butler
##
SortedOrbitsButler := function( OrbitsToSort )
    local lengths, no_occ, len_occ, lenpos, o, l, i, sortedorbits;

    # compute the number of occurences of the different orbit lengths
    no_occ := [];

    # lenpos[length] = pos
    lenpos := [];
    lengths := [];

    for o in OrbitsToSort do
        l := Length(o);
        if not l in lengths then
            Add( lengths, l );
            lenpos[l] := Length( lengths );
            no_occ[lenpos[l]] := 1;
        else
            no_occ[lenpos[l]]:= no_occ[lenpos[l]] + 1;
        fi;
    od;

    # GAP induces a lexicographically order on lists
    len_occ := [];
    for l in lengths do
        Add( len_occ, [ no_occ[Position(lengths,l)], l ] );
    od;

    # sort lexicographically
    len_occ := Set( len_occ );

    lenpos := [];
    # lenpos[ length ] = pos
    for i in [1 .. Length( len_occ )] do
        lenpos[ len_occ[i][2] ] := i;
    od;

    sortedorbits := [];
    for o in OrbitsToSort do
        if not IsBound( sortedorbits[lenpos[Length(o)]] ) then
            sortedorbits[ lenpos[Length(o)] ] := [];
        fi;
        Add( sortedorbits[ lenpos[Length(o)] ], o );
    od;

    return Concatenation( sortedorbits );

end;

#############################################################################
##
#F  SortedOrbitsPermGroup( <G>, <domain> [, <subdomain>] ) . . .  record with
#F                              the entries notSortedOrbits and SortedOrbits.
##
##  The list  'SortedOrbits' is  sorted  according to  the  butler- paper and
##  contains  the orbits of  <G> on <subdomain>   if this argument  is given;
##  otherwise the orbits of <G> on <domain>  is being sorted.  'SortedOrbits'
##  and 'notSortedOrbits' together are all orbits of <G> on <domain>.
##
SortedOrbitsPermGroup := function( arg )
    local orb, lengths, no_occ,  i, o, l, len_occ, lenpos, sortedorbits,
          points, G, domain, OrbitsToSort, OrbitsNotToSort, g, e, new, p,
          max;

    # check the arguments
    if    Length(arg) < 2 or Length(arg) > 3
       or not IsBound( arg[1].generators ) or not IsList( arg[2] )
       or ( IsBound(arg[3]) and not IsList(arg[3]) )
    then
        Error("usage: SortedOrbitsPermGroup(<G>,<domain> [, <subdomain>])");
    fi;

    # for easier access
    G := arg[1];
    domain := arg[2];

    # dealing with the trivial case
    if G.generators = [] then return "trivial"; fi;

    # compute the orbits of <G> on <domain>
    OrbitsToSort := [];
    OrbitsNotToSort := [];

    # compute the maximum of 'domain'
    max := Set(domain)[Length(domain)];

    new := BlistList( [1..max], domain );

    # repeat until the domain is exhausted
    p   := Position( new, true );
    while p <> false  do

        # start with the singleton orbit
        orb    := [ p ];
        new[p] := false;

        # loop over all points found
        for e  in orb  do

            # apply all generators
            for g  in G.generators  do
                i := e ^ g;

                # add the image to the orbit if it is new
                if new[i]  then
                    Add( orb, i );
                    new[i] := false;
                fi;
            od;
        od;

        # add the orbit to the list of orbits and take next point
        orb := Set(orb);

        # compress if possible
        IsRange( orb );

        if IsBound(arg[3]) then
            if orb[1] in arg[3] then
                Add( OrbitsToSort, orb );
            else
                Add( OrbitsNotToSort, orb );
            fi;
        else
            Add( OrbitsToSort, orb );
        fi;
        p := Position( new, true, p );

    od;

    return rec( sortedOrbits := SortedOrbitsButler( OrbitsToSort ),
                notSortedOrbits := OrbitsNotToSort );
end;


#############################################################################
##
#F  BaseForNormalizerPermGroup( G, F, G_domain ) . . .  computes an "optimal"
#F                base for G and F to compute $N_{G}(F)$ according to Butler.
##
##  Returns a record with the entries:
##                   Base         = Base for G
##                   From_F_orbit = entries:
##                                       [j,t]; i.e. basepoint form the orbit
##                                                        ${x_{j}}^{F^{(t)}}$
##                                    or unbound, if no j,t exist
##                   F_orbit[i]   = contains the orbits of $F^{(i)}$ on
##                                  G_domain if computed
##                   F_BP_orbits[level][i] = orbit of $F^(level)$  on $x_{i}$
##                                                                if computed
##
##  Since this function usually is used within the "normalizer" backtrack the
##  input G_domain is given; G_domain is needed in the backtrack as well.
##
BaseForNormalizerPermGroup := function( G, F, G_domain )
    local BaseForNormalizerStab, F_list, G_list, orbit, base, From_F_orbit,
          F_BP_orbits, fixpoints, F_orbit, FG_list;  # global

    BaseForNormalizerStab := function( level, orbit )
        local points, i, ii, orb_back, orb, o, found, t, tt, bp, sortedorbits,
              j, int, F_tmp, orbits, mpts, S_G, S_F, SS_G, Ft;

        S_G := G_list[level];
        S_F := F_list[level];

        # dealing with the trivial case
        if S_G.generators = [] then
            return;
        fi;

        # for the operations we need a proper group
        SS_G := G.operations.Subgroup( Parent( G ), S_G.generators );

        if not IsBound( F_BP_orbits[level] ) then
           F_BP_orbits[level] := [];
        fi;

        if S_F.generators = [] then

            if level = 1 then
                Error("F should not be the 1-Group");
            fi;

            # search for   the  \underline{first}  point   that satisfies
            # Butlers prop;  search  maximal j  and then maximal   t with
            # $base[level]   \in base[j]^{F^{(t)}}$; first is  important,
            # since  later  there  is searched  from  that orbit[2]; i.e.
            # [j,t]
            i := level - 1;
            while not IsBound( base[level] ) and i > 0 do
                orb_back := [];

                # operates $F^(1)$ transitively on G_domain?
                if Length(F_orbit[1]) = 1 then
                    orb := F_orbit[1][1];
                else
                    orb := Set(F.operations.Orbit(F,base[i],OnPoints));
                fi;

                # search a basepoint in orb
                ii := 1;

                # did we find a basepoint?
                found := false;
                points := Difference(Difference(orb,base),fixpoints);
                while ii <= Length(points) and not found do

                    if not IsFixpoint(SS_G,points[ii]) then
                        bp := points[ii];
                        found := true;
                    else
                        AddSet(fixpoints,points[ii]);
                    fi;
                    ii := ii + 1;
                od;
                if found then
                    # compute the best t
                    found := true;
                    t := 2;
                    while found and IsBound( F_list[t] ) do
                        orb_back := orb;
                        IsRange(orb_back); # compress if possible

                        # operates $F^(t)$ transitively on G_domain?
                        if     IsBound( F_orbit[t] ) 
                           and Length(F_orbit[t]) = 1 
                        then
                            orb := F_orbit[t][1];
                        else
                            orb := Set( F.operations.Orbit(
                                        FG_list[t], base[i], OnPoints ) );
                        fi;

                        # store orb if $F^(t)$ operates transitive
                        if     Length(orb) = Length(G_domain)
                           and not IsBound( F_orbit[t] )
                        then
                            F_orbit[t] := [ orb ];
                        fi;

                        if not IsBound( F_BP_orbits[t] ) then
                            F_BP_orbits[t] := [];
                        fi;
                        F_BP_orbits[t][i] := orb;

                        if not bp in orb then
                            found := false;
                        fi;

                        t := t + 1;
                    od;
                    base[level] := bp;
                    From_F_orbit[level] := [i,t-2];
                    # June 24, 91; upolis fixed a serious bug
                    # orbit := [ orb_back, [i,t-2] ];
                    orbit := [ orb_back, [level,t-2] ];
                fi;
                i := i - 1;
            od;

            # situtation:
            # there is no basepoint in the F_orbits of the basepoints
            if not IsBound( base[level] ) then
                base[level] := S_G.orbit[1];

                # From_F_orbit[level] = unbound
                orbit := [[],[0,0]];
            fi;
        else # if S_F ...
            # situation: S_F <> Id
            # how does $F^{(level)}$ operate on domain(S_G)
            if orbit[1] = [] then
                if level = 1 then
                    mpts := Copy( G_domain );
                    orbits := SortedOrbitsPermGroup(F_list[level],mpts);
                    sortedorbits   := orbits.sortedOrbits;
                    F_orbit[level] := orbits.sortedOrbits;
                else
                    mpts := G.operations.MovedPoints( S_G );

                    # F_list[level] = F_list[level-1]?
                    if IsBound( F_orbit[level] ) then
                        orbits := [];
                        for o in F_orbit[level] do
                            if o[1] in mpts then
                                Add( orbits, o );
                            fi;
                        od;
                        sortedorbits := SortedOrbitsButler( orbits );
                    else
                        orbits := SortedOrbitsPermGroup( S_F,G_domain,mpts );
                        sortedorbits := orbits.sortedOrbits;
                        F_orbit[level] := Concatenation( orbits.sortedOrbits,
                                                     orbits.notSortedOrbits);
                    fi;
                fi;

                # S_F is a non-trivial subgroup of  S_G; i.e. S_F has to move
                # at least one  point of  domain(S_G). Note  that we  have to
                # think recursively;  i.e.   G   and F just   have  the  same
                # (level-1) basepoints in the  beginning.  S_F is not trivial
                # but there is no orbit from the  level  before therefore the
                # basepoint cannot  occur in an orbit ${x_{j}}^{F^{(t)}}$ per
                # construction;   i.e. From_F_orbit[level]  does  not get  an
                # entry
                if Length( sortedorbits[1] ) = 1 then
                    i := 1;
                    while     not IsBound(base[level])
                          and Length(sortedorbits[i]) = 1
                    do
                        if not (sortedorbits[i][1] in fixpoints) then

                            base[level] := sortedorbits[i][1];
                            F_BP_orbits[level][level] := sortedorbits[i];

                            # F_list[level] fixes the new basepoint; does a t
                            # exist with the   property that F_list[t]  moves
                            # the new basep?
                            t := level - 1;
                            found := false;
                            while not found and t >= 1 do
                                if IsBound( F_orbit[ t ] ) then
                                    ii := 1;
                                    while ii <= Length( F_orbit[t] ) do
                                        if base[level] in F_orbit[t][ii] then
                                            orb := F_orbit[t][ii];

                                            # exit!
                                            ii := Length( F_orbit[t] ) + 1;
                                        fi;
                                        ii := ii + 1;
                                    od;
                                else
                                    orb := F.operations.Orbit(
                                           FG_list[t], base[level],OnPoints);
                                fi;

                                if Length( orb ) > 1 then
                                    found := true;
                                    orbit := [ orb, [level,t] ];
                                fi;
                                t := t - 1;
                            od;
                            if not found then orbit := [[],[0,0]]; fi;
                        else
                            AddSet( fixpoints, sortedorbits[i][1] );
                            i := i + 1;
                        fi;
                    od;

                    # all S_F-fixpoints are  also fixed  by  S_G; i.e.  there
                    # must exist a non-trivial orbit
                    if not IsBound(base[level]) then
                        base[level]               := sortedorbits[i][1];
                        F_BP_orbits[level][level] := sortedorbits[i];
                        orbit := [sortedorbits[i],[level,level]];
                    fi;
                else
                    base[level] := sortedorbits[1][1];
                    F_BP_orbits[level][level] := sortedorbits[1];
                    orbit := [sortedorbits[1],[level,level]];
                fi;

                # orbit <> [[],[0,0]]
            else
                # make sure that it is possible  to find a basepoint in orbit
                # comp the moved points of S_G
                int := Intersection( G.operations.MovedPoints(S_G),orbit[1]);
                if int = [] then
                    i := orbit[2][1];
                    t := orbit[2][2];
                    if t = 1 and i = 1 then
                        BaseForNormalizerStab( level, [[],[0,0]] );
                        return;
                    fi;
                    while not IsBound( base[level] ) and i > 0 do
                        orb_back := [];

                        # operates $F^(1)$ transitively on G_domain?
                        if Length(F_orbit[1]) = 1 then
                            orb:=F_orbit[1][1];
                        else
                            orb:=Set(F.operations.Orbit(F,base[i],OnPoints));
                        fi;

                        # search a basepoint in orb
                        ii := 1;

                        # did we find a basepoint?
                        found := false;
                        points := Difference(Difference(orb,base),fixpoints);
                        while ii <= Length(points) and not found do

                            if not IsFixpoint(SS_G,points[ii]) then
                                bp := points[ii];
                                found := true;
                            else
                                AddSet(fixpoints,points[ii]);
                            fi;
                            ii := ii + 1;
                        od;
                        if found then
                            # compute the best t
                            found := true;
                            t := 2;
                            while found and IsBound( F_list[t] ) do
                                orb_back := orb;
                                IsRange(orb_back); # compress if possible

                                # operates $F^(t)$ transitively on G_domain?
                                if     IsBound( F_orbit[t] ) 
                                   and Length(F_orbit[t]) = 1 
                                then
                                    orb := F_orbit[t][1];
                                else
                                    orb := Set( F.operations.Orbit(
                                                         FG_list[t], base[i],
                                                                OnPoints ) );
                                fi;
    
                                # store orb if $F^(t)$ operates transitive
                                if     Length(orb) = Length(G_domain)
                                   and not IsBound( F_orbit[t] )
                                then
                                    F_orbit[t] := [ orb ];
                                fi;

                                if not IsBound( F_BP_orbits[t] ) then
                                    F_BP_orbits[t] := [];
                                fi;
                                F_BP_orbits[t][i] := orb;

                                if not bp in orb then
                                    found := false;
                                fi;

                                t := t + 1;
                            od;
                            base[level] := bp;
                            if not IsBound( F_orbit[level] ) then
                                orbits:=SortedOrbitsPermGroup(S_F,G_domain);
                                F_orbit[level] := orbits.sortedOrbits;
                            fi;
                            From_F_orbit[level] := [i,t-2];
                            # June 24, 91; upolis fixed a serious bug
                            # orbit := [ orb_back, [i,t-2] ];
                            orbit := [ orb_back, [level,t-2] ];
                        fi;
                        i := i - 1;
                    od;

                    if not IsBound( base[level] ) then
                        BaseForNormalizerStab( level, [[],[0,0]] );
                        return;
                    fi;

                fi;
                # situation: int <> []
                if not IsBound( base[level] ) then
                    # how does S_F operate on orbit

                    # F_list[level] = F_list[level-1]?
                    if IsBound( F_orbit[level] ) then
                        orbits := [];
                        for o in F_orbit[level] do
                            if o[1] in int then
                                Add( orbits, o );
                            fi;
                        od;
                        sortedorbits := SortedOrbitsButler( orbits );
                    else
                        orbits := SortedOrbitsPermGroup(S_F,G_domain,int);
                        sortedorbits := orbits.sortedOrbits;
                        F_orbit[level] := Concatenation( orbits.sortedOrbits,
                                                    orbits.notSortedOrbits );
                    fi;
                    if Length( sortedorbits[1] ) = 1 then
                        i := 1;
                        while     not IsBound(base[level])
                              and Length(sortedorbits[i])=1
                        do
                            if not (sortedorbits[i][1] in fixpoints) then
                                base[level] := sortedorbits[i][1];
                                F_BP_orbits[level][level] := sortedorbits[i];
                                # bypass!!!
                                j := orbit[2][1];
                                tt := orbit[2][2];
                                orb := orbit[1];
                                while     base[level-1] in orb
                                      and base[level] in orb
                                do
                                    tt := tt + 1;
                                    orb := F.operations.Orbit(
                                          FG_list[tt], base[level], OnPoints);
                                od;

                                From_F_orbit[level] := [j, tt-1];

                                # F_list[level] fixes the new basepoint;
                                # which F_list[t] moves the new basep?

                                t := level - 1;
                                found := false;
                                while (not found) and t >= 1 do
                                    if IsBound( F_orbit[ t ] ) then
                                        ii := 1;
                                        while ii <= Length( F_orbit[t] ) do
                                            if base[level] in F_orbit[t][ii]
                                            then
                                                orb := F_orbit[t][ii];

                                                # exit!
                                                ii:=Length( F_orbit[t] ) + 1;
                                            fi;
                                            ii := ii + 1;
                                        od;
                                    else
                                        orb := F.operations.Orbit(
                                                      FG_list[t], base[level],
                                                                    OnPoints);
                                    fi;
                                    if Length( orb ) > 1 then
                                        found := true;
                                        orbit := [ orb, [level,t] ];
                                    fi;
                                    t := t - 1;
                                od;

                            else
                                AddSet(fixpoints,sortedorbits[i][1]);
                            fi;
                            i := i + 1;
                        od;

                        if not IsBound(base[level]) then
                            base[level] := sortedorbits[i][1];
                            F_BP_orbits[level][level] := sortedorbits[i];

                            # basepoint is element of
                            #                 ${x_{level-1}}^{F^{(level-1)}}$
                            From_F_orbit[level] := Copy( orbit[2] );
                            orbit := [sortedorbits[i],[level,level]];
                        fi;
                    # Length(sortedorbits[1]) <> 1
                    else
                        base[level] := sortedorbits[1][1];
                        F_BP_orbits[level][level] := sortedorbits[1];

                        # bypass!!!
                        j := orbit[2][1];
                        tt := orbit[2][2];
                        orb := orbit[1];
                        while     base[level-1] in orb
                              and base[level] in orb
                        do
                            tt := tt + 1;
                            orb := F.operations.Orbit(
                                          FG_list[tt], base[level], OnPoints);
                        od;

                        From_F_orbit[level] := [j, tt-1];
                        orbit := [sortedorbits[1],[level,tt-1]];
                    fi;
                fi;
            fi;

        fi; # F_list[level] = "trivial" ..

        # change the base now
        if S_G.orbit[1] <> base[level] then

            MakeStabChain( G, base );
            G_list := ListStabChain( G );

        fi;
        if    not IsBound( S_F.orbit )
           or S_F.orbit <> base[level]
        then

            MakeStabChain( F, base );
            ExtendStabChain( F, base );
            F_list := ListStabChain( F );
            FG_list := List( F_list, s ->
                           F.operations.Subgroup( Parent(F), s.generators) );

        fi;

        # is base[level] fixed by S_F; i.e. F_orbit[level] = F_orbit[level+1]
        if     not S_F.generators = []
           and Length(S_F.orbit) = 1
        then
            F_orbit[level+1] := F_orbit[level];
        fi;

        BaseForNormalizerStab( level+1, orbit );
        return;

    end;

    # main part of the program
    if F.generators = [] then
        Error("F must not be trivial!");
    fi;
    if not IsBound( G.stabilizer ) then
        MakeStabChain( G );
    fi;
    if not IsBound( F.stabilizer ) then
        MakeStabChain( F );
    fi;
    # generate a list of the G/F-stabilizer-chain to have easy access to them
    G_list := ListStabChain( G );
    F_list := ListStabChain( F );
    FG_list := List( F_list, s -> F.operations.Subgroup( Parent(F),
                                                             s.generators) );

    base := [];
    From_F_orbit := [];
    F_BP_orbits := [];
    F_orbit := [];

    # next basepoint should be taken form orbit.
    # orbit[1] = [] <=> no possibility to find a basepoint in
    #                                   ${x_{level-1}}^{F^{(level-1)}}$
    orbit := [[],[0,0]];

    # fixpoints already considered in upper levels
    fixpoints := [];
    BaseForNormalizerStab( 1, orbit );
    return rec( Base := base,
                From_F_orbit := From_F_orbit,
                F_orbit := F_orbit,
                F_BP_orbits := F_BP_orbits );

end;


#############################################################################
##
#F  SigmaSets( F_list, Omega, base, F_orbit, F_BP_orbits ) . . the basic sets
#F                                              for Sigma (cf. Butler p.166).
##
##  returns a record with the entries 'sigmaSets' and 'sigmaNo':
##  sigmaNo[i][Position(base,bp)] returns    an  integer  pos     (only   for
##  non-trivial F^(i)), that is the position of the corresponding 'basic set'
##  in sigmaSets[i]; i.e. sigmaSets[i][pos] contains the  'basic set' for the
##  basepoint bp.  input: cf. 'BaseForNormalizerPermGroup'
##
SigmaSets := function( F_list, Omega, base, F_orbit, F_BP_orbits )
    local Indices, i, fixpoints, sigmano, ii, BasePointOrbitLengths, orb,
          Lengths, Sigmas, o, p, l, pos, orbits;

    Indices := [];
    i := 1;
    while     IsBound( F_list[i] )
          and not F_list[i] = "trivial"
          and not F_list[i].generators = []
          and i <= Length(base)
    do
        Add( Indices, Length( F_list[i].orbit ) );
        i := i + 1;
    od;
    fixpoints := [];
    sigmano := [];
    Sigmas := [];

    i := 1;
    while     IsBound( F_list[i] )
          and F_list[i] <> "trivial"
          and not F_list[i].generators=[]
          and i <= Length(base)
    do
        if i > 1 and Indices[i-1] = 1 then
            sigmano[i] := sigmano[i-1];
            Sigmas[i] := Sigmas[i-1];
            # operates F_list[i] transitive on G_domain?
        elif IsBound(F_orbit[i]) and Length(F_orbit[i]) = 1 then
            Sigmas[i] := [];
            Sigmas[i][1] := Omega;
            sigmano[i] := [];
            for ii in [1..Length(base)] do
                sigmano[i][ii] := 1;
            od;
        else
            BasePointOrbitLengths := [];
            for pos  in [1..Length(base)] do
                if IsBound( F_BP_orbits[i][pos] ) then
                    Add(BasePointOrbitLengths, Length(F_BP_orbits[i][pos]));
                else
                    orb := Set( F_list[1].operations.Orbit(F_list[i],
                                                     base[pos], OnPoints) );
                    Add( BasePointOrbitLengths, Length( orb ) );
                fi;
            od;

            # situation:
            # BasePointOrbitLengths[t] =  Length(  Orbit(F_list[t],bp)     ).
            # basepoints with the same orbitlengths have the same sigmasets!
            Lengths := Set( BasePointOrbitLengths );
            Sigmas[i] := [];
            if IsBound( F_orbit[i] ) then
                for o in F_orbit[i] do
                    l := Length( o );
                    if l = 1 then
                        AddSet( fixpoints, o[1] );
                    fi;
                    pos := Position( Lengths, l );
                    if l in Lengths then
                        if not IsBound( Sigmas[i][pos] ) then
                            Sigmas[i][pos] := Copy(o);
                        else
                            # this is better than UniteSet
                            Append( Sigmas[i][pos], o );
                        fi;
                    fi;
                od;

                # form sets
                for pos in [1..Length(Lengths)] do
                    Sigmas[i][pos] := Set( Sigmas[i][pos] );
                    IsRange( Sigmas[i][pos] ); # compress if possible
                od;
            else
                orbits := F_list[1].operations.Orbits( F_list[i], Difference(Omega,fixpoints), OnPoints );
                for p in fixpoints do
                    Add( orbits, [p] );
                od;
                for o in orbits do
                    l := Length( o );
                    if l = 1 then
                        AddSet( fixpoints, o[1] );
                    fi;
                    pos := Position( Lengths, l );
                    if l in Lengths then
                        if not IsBound( Sigmas[i][pos] ) then
                            Sigmas[i][pos] := o;
                        else
                            # this is better than UniteSet
                            Append( Sigmas[i][pos], o );
                        fi;
                    fi;
                od;
                # form sets
                for pos in [1..Length(Lengths)] do
                    Sigmas[i][pos] := Set( Sigmas[i][pos] );
                    IsRange( Sigmas[i][pos] ); # compress if possible
                od;
            fi;
            sigmano[i] := [];
            for pos  in [1..Length(base)] do
                l := BasePointOrbitLengths[pos];
                sigmano[i][pos] := Position(Lengths,l);
            od;
        fi;
        i := i + 1;
    od;
    return rec( sigmaSets := Sigmas, sigmaNo := sigmano );
end;



