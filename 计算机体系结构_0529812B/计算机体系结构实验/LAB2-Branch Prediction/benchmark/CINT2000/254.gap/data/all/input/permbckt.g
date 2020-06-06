#############################################################################
##
#A  permbckt.g                  GAP library                         Udo Polis
#A                                                         & Martin Schoenert
##
#A  @(#)$Id: permbckt.g,v 3.21.1.1 1997/01/06 13:41:46 htheisse Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file  contains  the  backtrack  functions  for  permutation  groups.
##
#H  $Log: permbckt.g,v $
#H  Revision 3.21.1.1  1997/01/06  13:41:46  htheisse
#H  avoided non-redundant bases in centraliser/element conjugacy
#H
#H  Revision 3.21  1994/06/20  11:29:09  ahulpke
#H  Transfer of .stabChainOps.random
#H
#H  Revision 3.20  1992/07/07  12:43:17  martin
#H  fixed a minor problem in 'Intersection'
#H
#H  Revision 3.19  1992/02/19  13:07:04  martin
#H  added the new Sylow subgroup algorithm
#H
#H  Revision 3.18  1992/01/29  09:09:38  martin
#H  changed 'Order' to take two arguments, group and element
#H
#H  Revision 3.17  1991/12/12  09:19:59  martin
#H  changed 'ONPOINTS' to 'OnPoints', etc
#H
#H  Revision 3.16  1991/12/07  12:58:32  martin
#H  changed 'Centralizer' to accept approximation of the centralizer
#H
#H  Revision 3.15  1991/12/07  12:48:38  martin
#H  removed superfluous copy in 'Centralizer'
#H
#H  Revision 3.14  1991/12/05  16:10:01  martin
#H  added temporary 'RepresentativeConjugationGroups'
#H
#H  Revision 3.13  1991/12/03  09:02:38  martin
#H  added emacs outline mode
#H
#H  Revision 3.12  1991/11/28  16:06:41  martin
#H  added 'PermGroupOps.SylowSubgroup'
#H
#H  Revision 3.11  1991/10/24  11:41:46  martin
#H  improved 'Centralizer' for central elements
#H
#H  Revision 3.10  1991/10/15  16:26:22  martin
#H  changed usage of 'Difference' to 'SubtractSet'
#H
#H  Revision 3.9  1991/10/11  10:52:06  martin
#H  moved 'MakeStabChain', etc into the 'PermGroupOps' record
#H
#H  Revision 3.8  1991/10/02  15:39:38  martin
#H  fixed 'RepresentativeConjugationElements', <h> need not belong to <G>
#H
#H  Revision 3.7  1991/10/02  15:03:31  martin
#H  added a 'Parent(G)' to centralizer
#H
#H  Revision 3.6  1991/10/02  14:45:01  martin
#H  changed 'RepresentativeConjugationElements' to accept centralizer
#H
#H  Revision 3.5  1991/10/02  14:42:28  martin
#H  added 'Centralizer'
#H
#H  Revision 3.4  1991/10/01  14:59:23  martin
#H  changed stabchain, stabilizer are no subgroups
#H
#H  Revision 3.3  1991/09/30  13:28:58  martin
#H  changed 'Intersection' to return a subgroup if possible
#H
#H  Revision 3.2  1991/09/30  13:13:18  martin
#H  fixed a minor bug in 'Intersection'
#H
#H  Revision 3.1  1991/09/30  12:24:23  martin
#H  changed 'PermGroup' calls to 'Subgroup' calls
#H
#H  Revision 3.0  1991/09/30  11:40:15  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  InfoPermGroup?( ... ) . .  information function for the permgroup package
##
if not IsBound( InfoPermGroup1 )  then InfoPermGroup1 := Ignore;  fi;
if not IsBound( InfoPermGroup2 )  then InfoPermGroup2 := Ignore;  fi;


#############################################################################
##
#F  PermGroupOps.ElementProperty(<G>,<prop>[,<K>])  . . . . .  element of <G>
#F                                                   with the property <prop>
#F                                <K> can be a subgroup that preserves <prop>
##
PermGroupOps.ElementProperty := function ( arg )
    local   G,          # group <G>, first argument
            prop,       # property <prop>, second argument
            K,          # subgroup <K> preserving <prop>, optional third arg
            elm,        # element with <prop>, result
            ElementPropertyCoset;

    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    # $L$ is a subgroup of $G$ that fixes $S * s$, i.e., $S * s * L = S * s$,
    # preserving <prop>, $prop( x )$ implies $prop( x*l )$ for all $l \in L$.
    ElementPropertyCoset := function ( S, s, L )
        local   pnts, p, ss, LL, elm;

        # if $S$ is the trivial group check whether  $s$  has  the  property.
        if S.generators = []  then
            if prop( s )  then
                return s;
            else
                return false;
            fi;
        fi;

        # make $pnts$  a  subset  of  $S.orbit ^ s$  of  those  points  which
        # correspond to cosets that might contain elements with the property.
        # make  this  set  as  small  as  possible  with  reasonable  effort!
        pnts := OnTuples( S.orbit, s );

        # run through the points, i.e., through the cosets of the stabilizer.
        while pnts <> []  do

            # take a point $p$.
            p := pnts[1];

            # find coset representant, i.e., $ss \in S*s, S.orbit[1]^ss = p$.
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;

            # find a subgroup $LL$  of  $L$  which fixes $S.stabilizer * ss$,
            # i.e., an approximation (subgroup) $LL$ of $Stabilizer( L, p )$.
            # note $LL$ preserves the property since it is a subgroup of $L$.
            # compute a better aproximation,  for example using a basechange.
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );

            # search the coset $S.stabilizer * ss$ and  return if successful.
            elm := ElementPropertyCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                return elm;
            fi;

            # if there was no element in $S.stab * Rep(p)$ with the  property
            # there can be none in  $S.stab * Rep(p^l) = S.stab * Rep(p) * l$
            # for any $l \in L$ because we know $L$ preserves  the  property.
            # thus we can remove the entire $L$ orbit of $p$ from the points.
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );

        od;

        # there is no  element  with  the  property  in  the  coset  $S * s$.
        return false;
    end;

    # get the arguments
    G := arg[1];
    prop := arg[2];
    InfoPermGroup1("#I  ElementProperty called\n");

    # compute a stabchain for $G$.
    # select an optimal base that allows us to prune  the  tree  efficiently!
    MakeStabChain( G );

    # find a subgroup $K$ of the group  $G$  which  preserves  the  property,
    # i.e., $prop( x )$ implies $prop( x * k )$  for all  $x \in G, k \in K$.
    # make this  subgroup  as  large  as  possible  with  reasonable  effort!
    if IsBound(arg[3])  then
        K := arg[3];
    else
        K := Subgroup( Parent(G), [] );
    fi;

    # search through the group $G = G*Id$ for an element with  the  property.
    elm := ElementPropertyCoset( G, G.identity, K );

    # return the element
    return elm;
end;


#############################################################################
##
#F  PermGroupOps.SubgroupProperty(<G>,<prop>[,<K>]) . . . . . subgroup of <G>
#F                                       of elements with the property <prop>
#F                         <K> can be a known subgroup of the wanted subgroup
##
PermGroupOps.SubgroupProperty := function ( arg )
    local   G,          # group <G>, first argument
            prop,       # property <prop>, second argument
            K,          # known subgroup <K>, optional third argument, result
            ElementPropertyCoset,
            FindSubgroupProperty;

    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    # $L$ fixes $S*s$, i.e., $S*s*L = S*s$ and is a subgroup  of  the  wanted
    # subgroup $K$, thus $prop( x )$ implies $prop( x*l )$ for all $l \in L$.
    ElementPropertyCoset := function ( S, s, L )
        local   pnts, p, ss, LL, elm;

        # if $S$ is the trivial group check whether  $s$  has  the  property.
        if S.generators = []  then
            if prop( s )  then
                return s;
            else
                return false;
            fi;
        fi;

        # make $pnts$  a  subset  of  $S.orbit ^ s$  of  those  points  which
        # correspond to cosets that might contain elements with the property.
        # make  this  set  as  small  as  possible  with  reasonable  effort!
        pnts := OnTuples( S.orbit, s );

        # run through the points, i.e., through the cosets of the stabilizer.
        while pnts <> []  do

            # take a point $p$.
            p := pnts[1];

            # find coset representantive, i.e.,  $ss \in S, S.orbit[1]^ss=p$.
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;

            # find a subgroup $LL$  of  $L$  which fixes $S.stabilizer * ss$,
            # i.e., an approximation (subgroup) $LL$ of $Stabilizer( L, p )$.
            # note $LL$ preserves the property since it is a subgroup of $L$.
            # compute a better aproximation,  for example using a basechange.
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );

            # search the coset $S.stabilizer * ss$ and  return if successful.
            elm := ElementPropertyCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                return elm;
            fi;

            # if there was no element in $S.stab * Rep(p)$ with the  property
            # there can be none in  $S.stab * Rep(p^l) = S.stab * Rep(p) * l$
            # for any $l \in L$ because we know $L$ preserves  the  property.
            # thus we can remove the entire $L$ orbit of $p$ from the points.
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );

        od;

        # there is no  element  with  the  property  in  the  coset  $S * s$.
        return false;
    end;

    # make $L$ the subgroup with the property of some stabilizer $S$ of  $G$.
    # upon  entry  $L$  is  already  a  subgroup  of  this  wanted  subgroup.
    FindSubgroupProperty := function ( S, L )
        local  pnts, p, ss, LL, elm;

        # if $S$ is the trivial group, then so  is  $L$  and  we  are  ready.
        if S.generators = []  then
            return;
        fi;

        # make  $pnts$  a  subset  of  $S.orbit$   of   those  points   which
        # correspond to cosets that might contain elements with the property.
        # make  this  set  as  small  as  possible  with  reasonable  effort!
        pnts := S.orbit;

        # make $L.stab$ the full subgroup  of  $S.stab$  with  the  property.
        FindSubgroupProperty( S.stabilizer, L.stabilizer );

        # add the generators of $L.stabilizer$ to the generating set of  $L$.
        for elm  in L.stabilizer.generators  do
            if not elm in L.generators  then
                PermGroupOps.AddGensExtOrb( L, [ elm ] );
            fi;
        od;

        # suppose  an  $x \in S.stab * Rep(S.orbit[1]^l)$  satisfies  <prop>,
        # since $S.stab*Rep(S.orbit[1]^l)=S.stab*l$ we have $x/l \in S.stab$.
        # because $l \in L$ it follows that $x/l$ satisfies <prop> also,  and
        # since $L.stab$ is the full subgroup of $S.stab$  satisfying  <prop>
        # it follows that $x/l \in L.stab$  and so  $x \in L.stab * l \<= L$.
        # thus we can remove the entire orbit $S.orbit[1]^L$ from the points.
        pnts := Difference(pnts,G.operations.Orbit(L,S.orbit[1],OnPoints));

        # run through the points, i.e., through the cosets of the stabilizer.
        while pnts <> []  do

            # take a point $p$.
            p := pnts[1];

            # find coset representant, i.e., $ss  \in  S, S.orbit[1]^ss = p$.
            ss := S.identity;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;

            # find a subgroup $LL$  of  $L$  which fixes $S.stabilizer * ss$,
            # i.e., an approximation (subgroup) $LL$ of $Stabilizer( L, p )$.
            # note $LL$ preserves the property since it is a subgroup of $L$.
            # compute a better aproximation,  for example using a basechange.
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );

            # search the coset $S.stabilizer * ss$  and  add  if  successful.
            elm := ElementPropertyCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                PermGroupOps.AddGensExtOrb( L, [ elm ] );
            fi;

            # suppose an $x \in S.stab * Rep(S.orbit[1]^l)$ satisfies <prop>,
            # as $S.stab*Rep(S.orbit[1]^l)=S.stab*l$ we have $x/l\in S.stab$.
            # since $l\in L$ it follows that $x/l$ satisfies <prop> also, and
            # now $L.stab$ is the full subgroup of $S.stab$ satisfying <prop>
            # it follows that $x/l \in L.stab$ and so $x \in L.stab*l \<= L$.
            # thus we can remove the entire orbit $S.orbit[1]^L$ from points.
            # note $p$ is in the orbit $S.orbit[1]^L$, so $S.orbit[1]^L=p^L$.
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );

        od;

    end;

    # get and check the arguments.
    G := arg[1];
    prop := arg[2];
    if IsBound(arg[3])  and not ForAll(arg[3].generators, g->prop(g) )  then
        Error("<K> must be a subgroup satisfying <prop>");
    fi;
    InfoPermGroup1("#I  SubgroupProperty called\n");

    # compute a stabchain for $G$.
    # select an optimal base that allows us to prune  the  tree  efficiently!
    MakeStabChain( G );

    # find a subgroup $K$ of the group  $G$  which  preserves  the  property,
    # i.e., $prop( x )$ implies $prop( x * k )$  for all  $x \in G, k \in K$.
    # since this subgroup is changed in the algorithm use 'Copy' or  'Group'.
    # make this  subgroup  as  large  as  possible  with  reasonable  effort!
    if IsBound(arg[3])  then
        K := Subgroup( Parent(G), arg[3].generators );
        if IsBound( arg[3].orbit )  then
            K.orbit       := ShallowCopy( arg[3].orbit );
            K.transversal := ShallowCopy( arg[3].transversal );
            K.stabilizer  := Copy( arg[3].stabilizer );
        fi;
    else
        K := Subgroup( Parent(G), [] );
    fi;
    MakeStabChain(   K, G.operations.Base(G) );
    ExtendStabChain( K, G.operations.Base(G) );

    # search the whole group $G$ for the  subgroup  $K$  with  the  property.
    FindSubgroupProperty( G, K );

    # clean up the stabchains again.
    ReduceStabChain( K );

    # return the subgroup.
    return K;
end;


#############################################################################
##
#F  PermGroupOps.RepresentativeSet(<G>,<d>,<e>) .  element mapping one set to
#F                                             another of a permutation group
##
PermGroupOps.RepresentativeSet := function ( G, d, e )
    local   K,          # subgroup <K> fixing <e> elementwise
            elm,        # element mapping <d> to <e>, result
            RepresentativeSetCoset;

    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    RepresentativeSetCoset := function ( S, s, L )
        local   pnts, p, ss, LL, elm;

        # if the basepoint is not in $d$ or $e$, $S$ stabilizes the set  $e$.
        if S.generators = []  or not (S.orbit[1] in d  or S.orbit in e)  then
            if OnSets(d,s) = e  then
                return s;
            else
                return false;
            fi;
        fi;

        # if the basepoint is in $d$, it must be mapped to a  point  in  $e$.
        if S.orbit[1] in d  then
            pnts := IntersectionSet( OnTuples( S.orbit, s ), e );
        else
            pnts := OnTuples( S.orbit, s );
        fi;

        # run through the cosets of  the  stabilizer  in  the  standard  way.
        while pnts <> []  do
            p := pnts[1];
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );
            elm := RepresentativeSetCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                return elm;
            fi;
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );
        od;

        # there is no  element  with  the  property  in  the  coset  $S * s$.
        return false;
    end;

    # get and check the arguments.
    d := Set( d );
    e := Set( e );
    if Length(d) <> Length(e)  then
        Error("<d> and <e> must have the same size");
    fi;
    InfoPermGroup1("#I  RepresentativeSet called\n");

    # compute a stabchain for $G$, the base must  start  with  $d$  and  $e$.
    MakeStabChain( G, Concatenation(d,e) );

    # take the elementwise stabilizer of $e$ as subgroup fixing the  mapping.
    K := G;
    while K.generators <> []  and (K.orbit[1] in d  or K.orbit[1] in e)  do
        K := K.stabilizer;
    od;
    K := Subgroup( Parent(G), K.generators );

    # search through the group $G = G*Id$ for an element mapping  $d$ to $e$.
    elm := RepresentativeSetCoset( G, G.identity, K );

    # return the element.
    return elm;
end;


#############################################################################
##
#F  PermGroupOps.RepresentativeConjugationElements(<G>,<g>,<h>) . . . . . . .
#F                                      element of <G> conjugating <g> to <h>
##
PermGroupOps.RepresentativeConjugationElements := function ( arg )
    local   G,          # group <G>, first argument
            g,          # element <g>, second argument
            h,          # element <h>, third argument
            K,          # subgroup <K> preserving conjugation
            elm,        # element conjugating <g> to <h>, result
            orbsg,      # orbits of <g>
            orbsh,      # orbits of <h>
            orb,        # one orbit of <h>
            lensh,      # points in orbits of length <l> under <h>
            base,       # base of <G>
            img,        # possible images of a basepoint of <G>
            bpt,        # one basepoint of <G>
            gen,        # one generator of <K>
            len,        # length of a cycle of <gen>
            RepresentativeConjElmsCoset;

    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    RepresentativeConjElmsCoset := function ( S, s, L )
        local   pnts, p, ss, LL, elm;

        # if $S$ is the trivial group check whether  $s$  has  the  property.
        if S.generators = []  then
            if  g^s = h  then
                return s;
            else
                return false;
            fi;
        fi;

        # let $p = S.orbit[1]$ be  the  basepoint  of  this  stabilizer  $S$.
        p := S.orbit[1];

        # if $i = img[p]$ is an integer it is an earlier  basepoint  that  is
        # mapped to $p$ by $g$.  For it we have already fixed an image $i^s$;
        # so we have $p^x = (i^g)^x = i^(g*x) = i^(x*h) = (i^x)^h = (i^s)^h$.
        if IsInt(img[p])  then
             pnts:=Intersection( OnTuples(S.orbit,s), [ (img[p]^s)^h ] );

        # otherwise it is a list of possible  images  of  $p$,  i.e.,  points
        # that lie in orbits under $h$ of the same length as $p$  under  $g$.
        else
             pnts:=Intersection( OnTuples(S.orbit,s), img[p] );
        fi;

        # run through the cosets of  the  stabilizer  in  the  standard  way.
        while pnts <> []  do
            p := pnts[1];
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );
            elm := RepresentativeConjElmsCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                return elm;
            fi;
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );
        od;

        # there is no  element  with  the  property  in  the  coset  $S * s$.
        return false;
    end;

    # get the arguments
    G := arg[1];
    g := arg[2];
    h := arg[3];

    # handle trivial cases.
    if g = h  then
        return G.identity;
    fi;
    if g = G.identity  or h = G.identity  then
        return false;
    fi;

    # compute the cyclestructures and compare them.
    orbsg := Orbits( Group(g), G.operations.MovedPoints(G) );
    Sort( orbsg, function ( o1, o2 )  return Length(o2) < Length(o1);  end );
    orbsh := Orbits( Group(h), G.operations.MovedPoints(G) );
    Sort( orbsh, function ( o1, o2 )  return Length(o2) < Length(o1);  end );
    if List( orbsg, Length ) <> List( orbsh, Length )  then
        return false;
    fi;

    # compute a stabchain for $G$.
    # we take a base that has as often as possible $\beta_i^g = \beta_{i+1}$.
    base := G.operations.Base( StabChain( G,
        rec( base := Concatenation( orbsg ) ) ) );

    # for each length make a set of points in orbits of that length under $h$
    lensh := [];
    for orb  in orbsh  do
        if not IsBound(lensh[Length(orb)])  then
            lensh[Length(orb)] := Set(orb);
        else
            UniteSet( lensh[Length(orb)], orb );
        fi;
    od;

    # for each basepoint
    img := [];
    for bpt  in base  do

        # if this basepoint is the image of an earlier  basepoint  store  it,
        if bpt/g in base  and Position(base,bpt/g) < Position(base,bpt)  then
            img[bpt] := bpt/g;

        # otherwise store the points in orbits under $h$ of the same  length.
        else
            img[bpt] := lensh[ OrbitLength( Group(g), bpt ) ];
        fi;
        
    od;

    # find a subgroup  $K$  of  $G$ which preserves the conjugation property,
    # i.e., $g^x = h$ implies $g^{x * k} = h$  for  all  $x \in G,  k \in K$.
    # any subgroup of $Centralizer( G, h )$ will do,  for example $Group(h)$,
    # we add powers of $h$ so that we know generators for stabilizers of $K$.
    if Length(arg) = 3  then
        K := Subgroup( Parent(G), [] );
        for gen  in Union( [h], G.operations.StrongGenerators(G) )  do
            if h^gen = h  and gen in G  then
                for len  in  DivisorsInt( OrderPerm(gen) )  do
                    if    gen^len <> G.identity
                      and not gen^len in K.generators  then
                        Add( K.generators, gen^len );
                    fi;
                od;
            fi;
        od;
    else
        K := arg[4];
    fi;

    # search through the whole group $G = G*Id$  for a  conjugating  element.
    elm := RepresentativeConjElmsCoset( G, G.identity, K );

    # return the element.
    return elm;
end;


#############################################################################
##
#F  PermGroupOps.RepresentativeConjugationGroups(<G>,<U>,<V>) . . . . . . . .
#F                                      element of <G> conjugating <U> to <V>
##
#N  05-Dec-91 martin this is only a temporary solution
##
PermGroupOps.RepresentativeConjugationGroups := function ( G, U, V )
    return PermGroupOps.ElementProperty( G, g -> U^g = V, V );
end;


#############################################################################
##
#F  PermGroupOps.Intersection(<G>,<H>)  . . . . . . . . . . . .  intersection
#F                                                  of two permutation groups
##
PermGroupOps.Intersection := function ( G, H )
    local   K,          # intersection, result
            ElementIntersectionCoset,
            FindIntersection;

    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    ElementIntersectionCoset := function ( S, s, T, t, L )
        local   pnts, p, ss, tt, LL, elm;

        # if $S$ is trivial test whether $s$ and $t$ are equal, i.e., common.
        if  S.generators = []  and T.generators = []  then
            if s = t  then
                return s;
            else
                return false;
            fi;
        fi;

        # common elements can only lie in common  cosets  of  $S$  and  $T$.
        pnts := IntersectionSet( OnTuples(S.orbit,s), OnTuples(T.orbit,t) );

        # run through the cosets of  the  stabilizer  in  the  standard  way.
        while pnts <> []  do
            p := pnts[1];
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;
            tt := t;
            while T.orbit[1]^tt <> p do tt := T.transversal[p/tt] mod tt; od;
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );
            elm := ElementIntersectionCoset( S.stabilizer, ss,
                                             T.stabilizer, tt, LL );
            if elm <> false  then
                return elm;
            fi;
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );
        od;

        # there is no  element  with  the  property  in  the  coset  $S * s$.
        return false;
    end;

    # make $L$ the subgroup with the property of some stabilizer $S$ of  $G$.
    FindIntersection := function ( S, T, L )
        local  pnts, p, ss, tt, LL, elm;

        # if $S$ is the trivial group, then so  is  $L$  and  we  are  ready.
        if  S.generators = []  and T.generators = []  then
            return;
        fi;

        # common elements can only lie in common  cosets  of  $S$  and  $T$.
        pnts := IntersectionSet( S.orbit, T.orbit );

        # make $L.stab$ the full subgroup  of  $S.stab$  with  the  property.
        FindIntersection( S.stabilizer, T.stabilizer, L.stabilizer );
        for elm  in L.stabilizer.generators  do
            if not elm in L.generators  then
                PermGroupOps.AddGensExtOrb( L, [ elm ] );
            fi;
        od;
        pnts := Difference(pnts,G.operations.Orbit(L,S.orbit[1],OnPoints));

        # run through the cosets of  the  stabilizer  in  the  standard  way.
        while pnts <> []  do
            p := pnts[1];
            ss := S.identity;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;
            tt := T.identity;
            while T.orbit[1]^tt <> p do tt := T.transversal[p/tt] mod tt; od;
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );
            elm := ElementIntersectionCoset( S.stabilizer, ss,
                                             T.stabilizer, tt, LL );
            if elm <> false  then
                PermGroupOps.AddGensExtOrb( L, [ elm ] );
            fi;
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );
        od;

    end;

    # check the arguments.
    if not IsPermGroup(G)  or not IsPermGroup(H)  then
        return GroupOps.Intersection( G, H );
    fi;
    InfoPermGroup1("#I  Intersection called\n");

    # find an approximation of the intersection.
    if IsBound(G.parent)  and IsBound(H.parent)  and G.parent=H.parent  then
        K := Subgroup( G.parent,
                       IntersectionSet( G.operations.StrongGenerators(G),
                                        H.operations.StrongGenerators(H) ) );
    elif not IsBound(G.parent)  and IsBound(H.parent)  and G=H.parent  then
        K := ShallowCopy( H );
        K.generators      := ShallowCopy( K.generators );
        if IsBound( K.orbit )  then
            K.orbit       := ShallowCopy( K.orbit );
            K.transversal := ShallowCopy( K.transversal );
            K.stabilizer  := Copy( K.stabilizer );
        fi;
        return K;
    elif IsBound(G.parent)  and not IsBound(H.parent)  and G.parent=H  then
        K := ShallowCopy( G );
        K.generators      := ShallowCopy( K.generators );
        if IsBound( K.orbit )  then
            K.orbit       := ShallowCopy( K.orbit );
            K.transversal := ShallowCopy( K.transversal );
            K.stabilizer  := Copy( K.stabilizer );
        fi;
        return K;
    else
        K := Group( IntersectionSet( G.operations.StrongGenerators(G),
                                     H.operations.StrongGenerators(H) ),
                    G.identity );
	# note use of random methods
	if IsBound(G.stabChainOptions)
	   and IsBound(G.stabChainOptions.random) then
	  if IsBound(H.stabChainOptions)
	     and IsBound(H.stabChainOptions.random) then
	    K.stabChainOptions:=rec( random:=
	      Minimum(G.stabChainOptions.random,H.stabChainOptions.random)
	    );
	  else
	    K.stabChainOptions:=rec(random:=G.stabChainOptions.random);
	  fi;
	elif IsBound(H.stabChainOptions)
	  and IsBound(H.stabChainOptions.random) then
	    K.stabChainOptions:=rec(random:=H.stabChainOptions.random);
	fi;
	   
    fi;

    # compute stabchains for $G$  and  $H$,  the  bases  must  be  identical.
    MakeStabChain( G );
    MakeStabChain(   H, G.operations.Base(G) );
    ExtendStabChain( H, G.operations.Base(G) );
    ExtendStabChain( G, H.operations.Base(H) );

    # compute a stabchain for $K$, for the same base.
    MakeStabChain(   K, G.operations.Base(G) );
    ExtendStabChain( K, G.operations.Base(G) );

    # search the groups $G$  and $H$ for the intersection.
    FindIntersection( G, H, K );

    # clean up the stabchains again.
    ReduceStabChain( G );
    ReduceStabChain( H );
    ReduceStabChain( K );

    # return the intersection.
    return K;
end;


#############################################################################
##
#F  PermGroupOps.StabilizerSet(<G>,<set>) . . . . . . . . . .  set stabilizer
#F                                                     of a permutation group
##
PermGroupOps.StabilizerSet := function ( G, set )
    local   K,          # stabilizer, result
            S,          # stabilizer of <G>, not a subgroup
            ElementStabilizerSetCoset,
            FindStabilizerSet;

    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    ElementStabilizerSetCoset := function ( S, s, L )
        local   pnts, p, ss, LL, elm;

        # if the basepoint is not in $set$,  $S$ is the pointwise stabilizer.
        if S.generators = []  or not S.orbit[1] in set  then
            if OnSets( set, s ) = set  then
                return s;
            else
                return false;
            fi;
        fi;

        # a basepoint in $set$ can only be mapped to other points  of  $set$.
        pnts := IntersectionSet( OnTuples( S.orbit, s ), set );

        # run through the cosets of  the  stabilizer  in  the  standard  way.
        while pnts <> []  do
            p := pnts[1];
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );
            elm := ElementStabilizerSetCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                return elm;
            fi;
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );
        od;

        # there is no  element  with  the  property  in  the  coset  $S * s$.
        return false;
    end;

    # make $L$ the subgroup with the property of some stabilizer $S$ of  $G$.
    FindStabilizerSet := function ( S, L )
        local  pnts, p, ss, LL, elm;

        # if the basepoint is not in $set$,  $S$ is the pointwise stabilizer.
        if S.generators = []  or not S.orbit[1] in set  then
            return;
        fi;

        # a basepoint in $set$ can only be mapped to other points  of  $set$.
        pnts := IntersectionSet( S.orbit, set );

        # make $L.stab$ the full subgroup  of  $S.stab$  with  the  property.
        FindStabilizerSet( S.stabilizer, L.stabilizer );
        for elm  in L.stabilizer.generators  do
            if not elm in L.generators  then
                PermGroupOps.AddGensExtOrb( L, [ elm ] );
            fi;
        od;
        pnts := Difference(pnts,G.operations.Orbit(L,S.orbit[1],OnPoints));

        # run through the cosets of  the  stabilizer  in  the  standard  way.
        while pnts <> []  do
            p := pnts[1];
            ss := S.identity;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );
            elm := ElementStabilizerSetCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                PermGroupOps.AddGensExtOrb( L, [ elm ] );
            fi;
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );
        od;

    end;

    # get the arguments.
    set := Set( set );
    InfoPermGroup1("#I  StabilizerSet called\n");

    # compute a stabchain for $G$, the base must start with points in  $set$.
    MakeStabChain( G, set );

    # take the elementwise stabilizer as approximation of the set stabilizer.
    S := G;
    while S.generators <> []  and S.orbit[1] in set  do
        S := S.stabilizer;
    od;
    K := Subgroup( Parent(G), S.generators );
    if IsBound( S.orbit )  then
        K.orbit       := ShallowCopy( S.orbit );
        K.transversal := ShallowCopy( S.transversal );
        K.stabilizer  := Copy( S.stabilizer );
    fi;
    ExtendStabChain( K, G.operations.Base(G) );

    # search the whole group $G$ for the set stabilizer $K$.
    FindStabilizerSet( G, K );

    # clean up the stabchains again.
    ReduceStabChain( K );

    # return the set stabilizer.
    return K;
end;


#############################################################################
##
#F  PermGroupOps.Centralizer(<G>,<g>) . . . . .  centralizer of a permutation
#F                                       or a subgroup in a permutation group
##
PermGroupOps.Centralizer := function ( arg )
    local   G,          # group <G>, first argument
            H,          # subgroup or element <H>, second argument
            K,          # centralizer, result
            orbsH,      # orbits of <H>
            orb,        # one orbit of <H>
            lensH,      # points in orbits of length <l> under <H>
            base,       # base of <G>
            img,        # possible images of a basepoint of <G>
            bpt,        # one basepoint of <G>
            gen,        # one generator of <K>
            len,        # length of a cycle of <gen>
            i,          # loop variable
            ElementCentralizerCoset,
            FindCentralizer;

    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    ElementCentralizerCoset := function ( S, s, L )
        local   pnts, p, ss, LL, elm;

        # if $S$ is the trivial group  check  whether  $s$  centralizes  $g$.
        if S.generators = []  then
            if ForAll( H.generators, gen -> gen^s = gen )  then
                return s;
            else
                return false;
            fi;
        fi;

        # let $p = S.orbit[1]$ be  the  basepoint  of  this  stabilizer  $S$.
        p := S.orbit[1];

        # if $h=img[p]$ is a perm, it is an  element of $H$ taking an earlier
        # basepoint $q$, for which the image $q^s$ is  already fixed, to $p$;
        # so we have $p^x = (q^h)^x = q^(h*x) = q^(x*h) = (q^x)^h = (q^s)^h$.
        if IsPerm(img[p])  then
             pnts := Intersection( OnTuples(S.orbit,s),
                                   [ ((p/img[p])^s)^img[p] ] );

        # otherwise it is a list of possible  images  of  $p$,  i.e.,  points
        # that lie in orbits under $g$ of the same length as $p$  under  $g$.
        else
             pnts := Intersection( OnTuples(S.orbit,s), img[p] );
        fi;

        # run through the cosets of  the  stabilizer  in  the  standard  way.
        while pnts <> []  do
            p := pnts[1];
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );
            elm := ElementCentralizerCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                return elm;
            fi;
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );
        od;

        # there is no  element  with  the  property  in  the  coset  $S * s$.
        return false;
    end;

    # make $L$ the subgroup with the property of some stabilizer $S$ of  $G$.
    FindCentralizer := function ( S, L )
        local  pnts, p, ss, LL, elm;

        # if $S$ is the trivial group, then so  is  $L$  and  we  are  ready.
        if S.generators = []  then
            return;
        fi;

        # let $p = S.orbit[1]$ be  the  basepoint  of  this  stabilizer  $S$.
        p := S.orbit[1];

        # if $h=img[p]$ is a perm, it is an  element of $H$ taking an earlier
        # basepoint $q$, for which the image $q^s$ is  already fixed, to $p$;
        # so we have $p^x = (q^h)^x = q^(h*x) = q^(x*h) = (q^x)^h = (q^s)^h$.
        if IsPerm(img[p])  then
             pnts := [ p ];

        # otherwise it is a list of possible  images  of  $p$,  i.e.,  points
        # that lie in orbits under $g$ of the same length as $p$  under  $g$.
        else
             pnts := Intersection( S.orbit, img[p] );
        fi;

        # make $L.stab$ the full subgroup  of  $S.stab$  with  the  property.
        FindCentralizer( S.stabilizer, L.stabilizer );
        for elm  in L.stabilizer.generators  do
            if not elm in L.generators  then
                PermGroupOps.AddGensExtOrb( L, [ elm ] );
            fi;
        od;
        pnts := Difference(pnts,G.operations.Orbit(L,S.orbit[1],OnPoints));

        # run through the cosets of  the  stabilizer  in  the  standard  way.
        while pnts <> []  do
            p := pnts[1];
            ss := S.identity;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );
            elm := ElementCentralizerCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                PermGroupOps.AddGensExtOrb( L, [ elm ] );
            fi;
            pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );
        od;

    end;

    # get the arguments.
    G := arg[1];
    H := arg[2];
    if IsPerm(H)  then
        H := Subgroup( Parent(G), [H] );
    fi;

    # handle trivial case.
    if ForAll(G.generators,gen->OnTuples(H.generators,gen)=H.generators) then
        return G;
    fi;

    # compute the cyclestructures and compare them.
    orbsH := Orbits( H, G.operations.MovedPoints(G) );
    Sort( orbsH, function ( o1, o2 )  return Length(o2) < Length(o1);  end );

    # compute a stabchain for $G$.
    # we take a base that has as often as possible $\beta_i^g = \beta_{i+1}$.
    base := G.operations.Base( StabChain( G,
        rec( base := Concatenation( orbsH ) ) ) );

    # for each length make a set of points in orbits of that length under $g$
    lensH := [];
    for orb  in orbsH  do
        if not IsBound(lensH[Length(orb)])  then
            lensH[Length(orb)] := Set(orb);
        else
            UniteSet( lensH[Length(orb)], orb );
        fi;
    od;

    # for each basepoint
    img := [];
    for bpt  in base  do

        # try to find a gen that takes an earlier point of the base to bpt
        i := 1;
        while i <= Length(H.generators)
          and (not bpt/H.generators[i] in base
               or Position( base, bpt )
                  <= Position( base, bpt/H.generators[i] ))  do
            i := i + 1;
        od;

        # take a generator if we found one
        if i <= Length(H.generators)  then
            img[bpt] := H.generators[i];

        # otherwise store the points in orbits under $h$ of the same  length.
        else
            img[bpt] := lensH[ OrbitLength( H, bpt ) ];
        fi;
        
    od;

    # find an approximation of  the  centralizer  and  compute  a  stabchain.
    if Length(arg) = 2  then
        K := Subgroup( Parent(G), [] );
    else
        K := Subgroup( Parent(G), arg[3].generators );
    fi;
    for gen  in Union(G.operations.StrongGenerators(G),H.generators)  do
        if ForAll( H.generators, g -> g^gen = g )  and gen in G  then
            Add( K.generators, gen );
        fi;
    od;
    MakeStabChain(   K, G.operations.Base(G) );
    ExtendStabChain( K, G.operations.Base(G) );

    # search the whole group $G$ for the set stabilizer $K$.
    FindCentralizer( G, K );

    # clean up the stabchains again.
    ReduceStabChain( K );

    # return the centralizer.
    return K;
end;


#############################################################################
##
#F  PermGroupOps.SylowSubgroup(<G>,<p>) . . . . . . . . . . .  Sylow subgroup
#F                                                     of a permutation group
##
PermGroupOps.SylowSubgroupOld := function ( G, P )
    local   K,          # sylow subgroup, result
            orbsK,      # orbits of <K>
            lensK,      # 'lensK[<l>]' is the union of orbits of length <l>
            orbK,       # 'orbK[<p>]' is the <K> orbit of <p>
            orb,        # one orbit of <K>
            img,        # possible images of a basepoint of <G>
            base,       # base of <G>
            bpt,        # one basepoint of <G>
            gen,        # one generator of <K>
            len,        # length of a cycle of <gen>
            i,          # loop variable
            ElementSylowSubgroupCoset,
            FindSylowSubgroup;

    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    ElementSylowSubgroupCoset := function ( S, s, L )
        local   pnts, p, ss, LL, elm, o;

        # check whether $s$ or a power of $s$ is a normalizing  $P$  element.
        if S.generators = []  then
            o := Order(G,s);
            while o mod P = 0  do o := o / P;  od;
            s := s ^ o;
            while not s in K and not ForAll( K.generators, g -> g^s in K ) do
                s := s ^ P;
            od;
            if not s in K  then
                return s;
            else
                return false;
            fi;
        fi;

        # let $p$ be $S.orbit[1]$ the basepoint of  the  current  stabilizer.
        # if $c =  img[p]$  is an  integer,  it is an earlier  basepoint, for
        # which $c^s$ is already fixed, that is mapped to $p$ by a $g \in K$;
        # so we have $p^x = c^g^x = c^{g x} = c^{x g'} = c^s^g' \in (c^s)^K$.
        p := S.orbit[1];
        if IsPerm( img[p] )  then
            pnts := IntersectionSet(OnTuples(S.orbit,s),orbK[(p/img[p])^s]);

        # else $img[p]$ is the union of $K$ orbits of the  length  of  $p^P$.
        else
            pnts := IntersectionSet(OnTuples(S.orbit,s),img[p]);
        fi;

        # run through the cosets of  the  stabilizer  in  the  standard  way.
        while pnts <> []  do
            p := pnts[1];
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );
            elm := ElementSylowSubgroupCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                return elm;
            fi;
            SubtractSet( pnts, G.operations.Orbit( L, p, OnPoints ) );
        od;

        # there is no  element  with  the  property  in  the  coset  $S * s$.
        return false;
    end;

    # make $L$ the full $P$-Sylowsubgroup of  some  stabilizer  $S$  of  $G$.
    FindSylowSubgroup := function ( S, L )
        local   pnts, p, ss, LL, elm;

        # if $S$ is the trivial group  then  so  is  $L$  and  we  are  done.
        if S.generators = []  then
            return;
        fi;

        # let $p$ be $S.orbit[1]$ the basepoint of  the  current  stabilizer.
        # if $c =  img[p]$  is an  integer,  it is an earlier  basepoint, for
        # which $c^s$ is already fixed, that is mapped to $p$ by a $g \in L$;
        # so we have $p^x = c^g^x = c^{g x} = c^{x g'} = c^s^g' \in (c^s)^L$.
        p := S.orbit[1];
        if IsInt( img[p] )  then
            pnts := IntersectionSet(S.orbit,orbK[p/img[p]]);

        # else $img[p]$ is the union of $L$ orbits of the  length  of  $p^L$.
        else
            pnts := IntersectionSet(S.orbit,img[p]);
        fi;

        # make   $L.stabilizer$  the   $P$-Sylowsubgroup  of  $S.stabilizer$.
        FindSylowSubgroup( S.stabilizer, L.stabilizer );

        # pull up the generators of the stabilizer  to  the  stabilizer  $L$,
        # we dont need to change $K$, because $L.generators$ is  empty  here.
        for elm  in L.stabilizer.generators  do
            if not elm in L.generators  then
                PermGroupOps.AddGensExtOrb( L, [elm] );
            fi;
        od;

        # return if  $L$  is  already  the  full  $P$-Sylowsubgroup  of  $S$.
        if (G.operations.Size(S) / G.operations.Size(K)) mod P <> 0  then
            return;
        fi;

        SubtractSet( pnts, G.operations.Orbit( L, S.orbit[1], OnPoints ) );

        # run through the cosets of  the  stabilizer  in  the  standard  way.
        while pnts <> []  do
            p := pnts[1];
            ss := S.identity;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;
            LL := Subgroup( Parent(G), Filtered(L.generators,l->p^l=p) );
            elm := ElementSylowSubgroupCoset( S.stabilizer, ss, LL );
            if elm <> false  then
                PermGroupOps.AddGensExtOrb( L, [ elm ] );
                LL := K;
                while not elm in LL.generators  do
                    Add( LL.generators, elm );
                    LL := LL.stabilizer;
                od;
                # recompute 'orbK' and 'img'
                orbsK := Orbits( K, G.operations.MovedPoints(G) );
                orbK := [];
                for orb  in orbsK  do
                    for bpt  in orb  do
                        orbK[bpt] := orb;
                    od;
                od;
                lensK := [];
                for orb  in orbsK  do
                    if not IsBound(lensK[Length(orb)])  then
                        lensK[Length(orb)] := Set(orb);
                    else
                        UniteSet( lensK[Length(orb)], orb );
                    fi;
                od;
                img := [];
                for bpt  in base  do
                    i := 1;
                    while i <= Length(K.generators)
                      and (not bpt/K.generators[i] in base
                           or Position( base, bpt )
                              <= Position( base, bpt/K.generators[i] ))  do
                        i := i + 1;
                    od;
                    if i <= Length(K.generators)  then
                        img[bpt] := K.generators[i];
                    else
                        img[bpt] := lensK[ Length( orbK[ bpt ] ) ];
                    fi;
                od;
                if (G.operations.Size(S)/G.operations.Size(K)) mod P<>0  then
                   return;
                fi;
                p := S.orbit[1];
                if IsPerm( img[p] )  then
                    pnts := IntersectionSet(S.orbit,orbK[p/img[p]]);
                else
                    pnts := IntersectionSet(S.orbit,img[p]);
                fi;
            fi;
            SubtractSet( pnts, G.operations.Orbit( L, p, OnPoints ) );
        od;

    end;

    # compute a stabchain for $G$.
    MakeStabChain( G );
    base := G.operations.Base( G );

    # initialize the $P$-Sylow subgroup, we must start with the trivial group
    K := Subgroup( Parent(G), [] );
    MakeStabChain(   K, base );
    ExtendStabChain( K, base );
    orb := G.operations.MovedPoints(G);
    img := [];
    for bpt  in base  do
        img[bpt] := orb;
    od;

    # search the whole group $G$ for the $P$-Sylow subgroup.
    FindSylowSubgroup( G, K );

    # clean up the stabchains again.
    ReduceStabChain( K );

    # return the $P$-Sylow subgroup.
    return K;
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



