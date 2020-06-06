#############################################################################
##
#A  ratclass.g                  GAP library                    Heiko Thei"sen
##
#A  @(#)$Id: ratclass.g,v 3.6.1.6 1995/05/16 08:17:22 htheisse Rel $
##
#Y  Copyright 1993-1994,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains  functions  that  calculate  the rational  classes  of
##  groups.
##
#H  $Log: ratclass.g,v $
#H  Revision 3.6.1.6  1995/05/16  08:17:22  htheisse
#H  fixed a minor bug in 'AGPRO.SubgroupProperty'
#H
#H  Revision 3.6.1.5  1995/04/13  15:05:43  htheisse
#H  replaced '{ complement }' with '* projection' and
#H  fixed the bug in 'CompleteGaloisGroupPElement' and
#H  added another 'SylowSubgroup' in 'RationalClassesPElements'
#H
#H  Revision 3.6.1.4  1994/11/22  16:35:33  htheisse
#H  fixed a bug with the determination of the p-part of the Galois group
#H
#H  Revision 3.6.1.3  1994/10/06  10:38:40  htheisse
#H  replaced 'RationalClassesAgGroup' with generic method
#H
#H  Revision 3.6.1.2  1994/08/22  12:28:27  sam
#H  fixed bug in 'FusionRationalClassesPSubgroup'
#H
#H  Revision 3.6.1.1  1994/08/16  15:10:27  sam
#H  replaced calls of 'RowSpace'
#H
#H  Revision 3.6  1994/07/05  12:32:46  htheisse
#H  fixed a problem with Sylow normalizers due to (G/N).naturalHom.source
#H
#H  Revision 3.5  1994/06/27  15:53:47  htheisse
#H  handled a trivial case to avoid a bug with 'LargestMovedPointPerm'
#H
#H  Revision 3.4  1994/06/13  09:56:22  htheisse
#H  added a 'ShallowCopy' to avoid unwanted changes/saved 'size' thru isom.
#H
#H  Revision 3.3  1994/05/24  15:14:58  htheisse
#H  avoided the use of 'RatClassesElementaryAbelianSubgroup' in one case
#H
#H  Revision 3.2  1994/04/23  16:14:45  htheisse
#H  corrected the algorithm for operation on a projective vector space
#H
#H  Revision 3.1  1994/02/21  13:36:10  sam
#H  initial revision under RCS
#H
##

#############################################################################
##
#F  InfoClasses?  . . . . . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoClasses1 )  then InfoClasses1 := Ignore; fi;
if not IsBound( InfoClasses2 )  then InfoClasses2 := Ignore; fi;


#############################################################################
##
#F  InjectionPrimeResidues( <facs>, <res>, <pos> )  . . . . . . . . . . local
##
InjectionPrimeResidues := function( facs, res, pos )
    local  resi;

    resi := List( facs, i -> 1 );
    resi[pos] := res;
    return ChineseRem( facs, resi );
end;


#############################################################################
##
#V  GroupsPrimeResidues . . . . . . . . . . . .  list of prime residue groups
##
GroupsPrimeResidues := [];

#############################################################################
##
#V  AgGroupPrimeResiduesOps . . .  op. record for ag groups of prime residues
##
AgGroupPrimeResiduesOps := Copy(AgGroupOps);

AgGroupPrimeResiduesOps.Print := function( obj )
    if IsParent( obj )  then
        Print( "GroupPrimeResidues( ", obj.modulus, " )" );
    else
        AgGroupOps.Print( obj );
    fi;
end;

#############################################################################
##
#F  AgGroupPrimeResiduesOps.SubgroupProperty( <H>, <prop> )  subgrp with prop
##
##  If <H> is  a subgroup of a  prime residue class  group mod <p> ^ <r> then
##  <H> is either cyclic or a direct product of a  cyclic 2-group with a Z_2.
##  For this reason the subgroup  of <H> that consists  of the elements which
##  have the property  <prop> can easily be  determined.  It  is assumed that
##  <H> has either one or two generators.
##
AgGroupPrimeResiduesOps.SubgroupProperty := function( H, prop )
    local   pow,  i,  inv,  gen;

    # if there are many prime factors  be stupid
    if not IsPrimePowerInt(Parent(H).modulus)  then
        return Subgroup( H, Filtered( Elements(H), prop ) );
    fi;

    # if <H> is trivial the subgroup is although trivial
    if Size(H) = 1  then
        return ShallowCopy(H);
    fi;
    
    # get first generator
    gen := Cgs(H)[1];

    # if <H> is cyclic,  then so is the subgroup
    if H.modulus mod 2 <> 0  or  Length( H.cgs ) = 1  then
        pow := List( DivisorsInt(H.size), e -> gen^e );
        return Subgroup( Parent(H), [ First( pow, prop ) ] );
    fi;

    # there is an involution among the generators of H
    inv := gen;
    gen := H.cgs[2];

    pow := List( DivisorsInt(H.size/2), e -> gen^e );
    i   := PositionProperty( pow, prop );
    if prop(inv)  then
        return Subgroup( H, [ pow[i], inv ] );
    elif i > 1 and prop(pow[i-1]*inv)  then
        return Subgroup( H, [ pow[i-1]*inv ] );
    else
        return Subgroup( H, [ pow[i] ] );
    fi;

end;

  
#############################################################################
##
#F  GroupPrimeResidues( <m> ) . . . . . . . . prime residue group as ag group
##
GroupPrimeResidues := function( m )
    local  G,  i,  j,  powers,  factors,  invs,  res,  ord,  gen;

    # if the group has already been constructed, return it
    if IsBound( GroupsPrimeResidues[ m ] )  then
	return ShallowCopy( GroupsPrimeResidues[ m ] );
    fi;

    # handle the trivial case
    if m <= 2  then
        G            := CyclicGroup( AgWords, 1 );
        G.modulus    := m;
        G.residues   := [];
        G.factors    := [];
        G.operations := AgGroupPrimeResiduesOps;
        return G;
    fi;

    # get the  generators  and corresponding  residues for  each  non-trivial
    # cyclic factor
    powers  := Collected( FactorsInt( m ) );
    factors := List( powers, f -> f[ 1 ] ^ f[ 2 ] );
    invs    := List( powers, f -> f[ 1 ] ^ ( f[ 2 ] - 1 ) * ( f[ 1 ] - 1 ) );
    
    # If <m> is divisible by 8, the corresponding factor is not cyclic.
    if powers[ 1 ][ 1 ] = 2  and  powers[ 1 ][ 2 ] >= 3  then
        G := AbelianGroup( AgWords, Concatenation( [ 2, invs[ 1 ] / 2 ],
                                    invs{ [ 2 .. Length( powers ) ] } ) );
        G.factorResidues := [ 5 mod factors[ 1 ] ];
        G.residues       := [ InjectionPrimeResidues( factors, -1, 1 ) ];
        
    # If  <m> is divisible by  2 but  not  by 4,  the corresponding factor is
    # trivial.
    elif factors[ 1 ] = 2  then
        G := AbelianGroup( AgWords, invs{ [ 2 .. Length( powers ) ] } );
        G.factorResidues := [ 1 ];
        G.residues       := [  ];
    
    # <m> is odd or divisible by 4 but not by 8.
    else
        G := AbelianGroup( AgWords, invs );
        G.factorResidues := [ PrimitiveRootMod( factors[ 1 ] ) ];
        G.residues       := [  ];
    fi;
    
    G.operations := AgGroupPrimeResiduesOps;
    G.modulus    := m;
    G.size       := Phi( m );
    G.factors    := factors;

    # Set '<G>.factorResidues' for each   factor in '<G>.factors'.  The first
    # factor has already been treated.
    for j  in [ 2 .. Length( factors ) ]  do
        G.factorResidues[ j ] := PrimitiveRootMod( factors[ j ] );
    od;

    # Set '<G>.residues' for each generator of <G> (if <m> is divisible by 8,
    # the  first     generator    has already    been    treated),  and   set
    # '<G>.factorGenerators' for each factor in '<G>.factors'.
    if factors[ 1 ] = 2  then
        G.factorGenerators :=[ G.identity ];
    else
        G.factorGenerators := [  ];
    fi;
    i := Length( G.residues ) + 1;
    j := Length( G.factorGenerators ) + 1;
    while i <= Length( G.generators )  do
        gen := G.generators[ i ];
        Add( G.factorGenerators, gen );
        res := InjectionPrimeResidues( factors, G.factorResidues[ j ], j );
        while res <> 1  do
            G.residues[ i ] := res;
            ord := RelativeOrderAgWord( gen );
            gen := gen ^ ord;
            res := PowerModInt( res, ord, m );
            i   := i + 1;
        od;
        j := j + 1;
    od;

    # store the group for further reference
    GroupsPrimeResidues[ m ] := G;
    return ShallowCopy( G );

end;


#############################################################################
##
#F  ResidueAgWord( <G>, <word> )  . . . . . . .  convert ag word into residue
##
#N  fceller: this should be a homomorphism not a function
##
ResidueAgWord := function( G, word )
    local   exp,  res,  l;

    G   := Parent(G);
    exp := ExponentsAgWord(word);
    res := 1;
    for l  in [ 1 .. Length(exp) ]  do
        res := res * PowerModInt( G.residues[l], exp[l], G.modulus )
               mod G.modulus;
    od;
    return res;
end;


#############################################################################
##
#F  AgWordResidue( <G>, <res> ) . . . . . . . .  convert residue into ag word
##
#N  fceller: this should be a homomorphism not a function
##
AgWordResidue := function( G, res )
    local   word,  i,  odd,  m,  n,  r,  x,  l;
    
    G    := Parent(G);
    word := G.identity;
    for i  in [ 1 .. Length(G.factors) ]  do
        m := G.factors[i];
        n := res mod m;
        r := G.factorResidues[i];
        x := 1;
        l := 0;
        odd := m mod 2 <> 0;
        while x <> n and ( odd or x <> m - n )  do
            x := x * r mod m;
            l := l + 1;
            if l = m  then Error( "<res> is not a prime residue" );  fi;
        od;
        if not ( odd or x = n )  then
            word := word * G.generators[1];
        fi;
        word := word * G.factorGenerators[i]^l;
    od;
    return word;
end;


#############################################################################
##
#F  AgOrbitTransversalStabilizer( <U>, <gens>, <p>, <op> )  . . . . . . orbit
##
#N  fceller: This should be part of 'AgOrbitStabilizer'
##
AgOrbitTransversalStabilizer := function( arg )

    local   O,          # complete Orbit
            prod,       # Auxiliary Variable to compute agword rep
            n,          # Auxiliary Variable to compute agword rep
            S,          # Agword stabilizer
            T,          # complete transversal
            i, j, k,    # Loop
            G,
            len,
            l1, l2,
            V,          # Parameter <gens>
            U,          # Generating system of <U>
            p,          # Our start point
            o,          # relative order of next generators
            op,         # operation
            useOp,      # must we use a new operation (0=*, 1=^, 2=<op>)
            mi,
            np,         # New point
            r,          # Temp
            e;          # Temp

    # Catch trivial cases.
    if arg[ 1 ].generators = []  then
        return rec( orbit       := [ arg[ 3 ] ],
                    transversal := [ arg[ 1 ].identity ],
                    stabilizer  := arg[ 1 ] );
    fi;

    # Get generators.
    U := arg[ 1 ];
    G := Parent( U );
    U := Igs( U );
    V := arg[ 2 ];
    p := arg[ 3 ];

    # Get the operation, set flag <useOp> (0=*, 1=^, 2^<op>).
    if Length( arg ) = 4  then
        op := arg[ 4 ];
        if IsBool( op )  then
            if op  then
                useOp := 0;
            else
                useOp := 1;
            fi;
        elif op = OnRight  then
            useOp := 0;
        elif op = OnPoints then
            useOp := 1;
        else
            useOp := 2;
        fi;
    else
        useOp := 0;
    fi;
    if Length( U ) <> Length( V ) then
        Error( "not enough homomorphic generators for <U>" );
    fi;

    # Initialize all.
    O    := [ p ];
    T    := [ G.identity ];
    prod := [ 1 ];
    n    := [ ];
    S    := [ ];

    # Start constructing orbit.
    for i  in Reversed( [ 1 .. Length( V ) ] )  do
        mi := V[ i ];
        if useOp = 0  then
            np := p * mi;
        elif useOp = 1  then
            np := p ^ mi;
        else
            np := op( p, mi );
        fi;

        # Is <np> really a new point or is it in <O>.
        j := Position( O, np );

        # Let's see if it is new (j = false).
        if j = false  then
            o := RelativeOrderAgWord( U[i] );
            Add( prod, prod[ Length( prod ) ] * o );
            Add( n, i );
            len := Length( O );
            if useOp = 0  then
                l1 := 0;
                O[ o * len ] := true;
                for k  in [ 1 .. o - 1 ]  do
                    l2 := l1 + len;
                    for j  in [ 1 .. len ]  do
                        O[ j + l2 ] := O[ j + l1 ] * mi;
                    od;
                    l1 := l2;
                od;
            elif useOp = 1  then
                l1 := 0;
                O[ o * len ] := true;
                for k  in [ 1 .. o - 1 ]  do
                    l2 := l1 + len;
                    for j  in [ 1 .. len ]  do
                        O[ j + l2 ] := O[ j + l1 ] ^ mi;
                    od;
                    l1 := l2;
                od;
            else
                l1 := 0;
                O[ o * len ] := true;
                for k  in [ 1 .. o - 1 ]  do
                    l2 := l1 + len;
                    for j  in [ 1 .. len ]  do
                        O[ j + l2 ] := op( O[ j + l1 ], mi );
                    od;
                    l1 := l2;
                od;
            fi;
            l1 := 0;
            for k  in [ 1 .. o - 1 ]  do
                l2 := l1 + len;
                for j  in [ 1 .. len ]  do
                    T[ j + l2 ] := T[ j + l1 ] * U[ i ];
                od;
                l1 := l2;
            od;
        elif j = 1 then
            Add( S, U[i] );
        else
            r := G.identity;
            j := j - 1;
            len := Length( prod );
            for k  in [ 1 .. len - 1 ]  do
                e := QuoInt( j, prod[ len - k ] );
                r := U[ n[ len - k ] ] ^ e * r;
                j := j mod prod[ len - k ];
            od;
            Add( S, U[i] * r ^ -1 );
        fi;
    od;

    # <S> is a reversed IGS.
    S := AgSubgroup( G, Reversed( S ), false );

    return rec( orbit := O, transversal := T, stabilizer := S );

end;


#############################################################################
##


#V  RationalClassPermGroupOps . . . .  operations record for rational classes
##
RationalClassPermGroupOps := ShallowCopy( RationalClassGroupOps );

RationalClassPermGroupOps.\in := function( g, cl )
    local  irr;

    if g = cl.group.identity  then
        return g = cl.representative;
    fi;
    return RationalClass( cl.group, g ) = cl;
end;

RationalClassPermGroupOps.\= := function( cl1, cl2 )
    local  isEql;

    if IsRationalClass(cl1)  then
        if IsRationalClass(cl2)  then
            
            # Trivial cases first.
            if cl1.representative = ()  then
                return cl2.representative = ();
            elif cl2.representative = ()  then
                return false;
            fi;
            
            if not IsBound(cl1.cycles)  then
                cl1.cycles := Cycles( cl1.representative,
                    cl1.group.operations.MovedPoints( cl1.group ) );
                Sort( cl1.cycles, function( l, r )
                      return Length( l ) > Length( r ); end );
            fi;
            if not IsBound( cl2.cycles )  then
                cl2.cycles := Cycles( cl2.representative,
                    cl2.group.operations.MovedPoints( cl2.group ) );
                Sort( cl2.cycles, function( l, r )
                      return Length( l ) > Length( r ); end );
            fi;
            isEql :=
               false
               <>
               cl1.group.operations.RepresentativeConjugationRationalClasses(
                       cl1, cl2 );
        else
            isEql := false;
        fi;
    else
        if IsRationalClass( cl2 )  then
            isEql := false;
        else
            Error( "panic, neither <cl1> nor <cl2> is a rational class" );
        fi;
    fi;
    return isEql;
end;


#############################################################################
##
#F  PermGroupOps.RationalClass( <G>, <g> )  . .  rational class of an element
##
PermGroupOps.RationalClass := function( arg )
    local   class;

    # unravel arguments
    if Length(arg) = 1  then
        arg := arg[1];
    fi;

    # construct the class record
    class                 := rec();
    class.group           := arg[1];
    class.representative  := arg[2];
    class.isDomain        := true;
    class.isRationalClass := true;
    class.operations      := RationalClassPermGroupOps;
    
    # a third parameter is the centralizer
    if Length(arg) >= 3  then
        class.centralizer := arg[3];
    fi;

    # a fourth parameter is the galois group
    if Length(arg) = 4  then
        class.galoisGroup := arg[4];
    fi;

    # bind the order an return
    class.order := Order( class.group, class.representative );
    return class;

end;


#############################################################################
##
#F  PermGroupOps.RepresentativeConjugationRationalClasses(...) 	. . . . local
##
##  The function returns an element of <cl1>.group conjugation <cl1> to <cl2>
##
PermGroupOps.RepresentativeConjugationRationalClasses := function( cl1, cl2 )
    local   G,          # <cl1>.group = <cl2>.group
            g,          # <cl1>.representative
            h,          # <cl2>.representative
            hpow,       # powers of <h> with coprime exponents
            irrh,       # irrational exponents of <h> 
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
            RepresentativeRatConjElmsCoset;

RepresentativeRatConjElmsCoset := function ( S, s, L )
    local  exps, pnts, p, ss, LL, elm;

    # if $S$ is the trivial group check whether  $s$  has  the  property.
    if S.generators = [  ]  then
        if g ^ s in hpow  then
            return s;
        else
            return false;
        fi;
    fi;

    # let $p = S.orbit[ 1 ]$ be  the  basepoint  of  this  stabilizer  $S$.
    p := S.orbit[ 1 ];

    # If $i := img[ p ]$ is an integer  then $p$ is the image of the earlier
    # basepoint <i > , so the choice of possible images is restricted.
    if IsInt( img[ p ] )  then

        # If $img[ i ]$ is also an integer  then we have already chosen two
        # points from one cycle, so the image of <p> is unique.
        if IsInt( img[ img[ p ] ] )  then
            exps := [ Position( Cycle( h, img[ img[ p ] ] ^ s ), 
                img[ p ] ^ s ) - 1 ];

        # Otherwise we must allow <p > ^( <h > ^ < l> ) where <l> is an
        # irrational exponent of <h > .
        else
            exps := irrh;
        fi;

        pnts := Intersection( OnTuples( S.orbit, s ), List( exps, e -> 
              ( img[ p ] ^ s ) ^ ( h ^ e ) ) );

    # otherwise it is a list of possible  images  of  $p$,  i.e.,  points
    # that lie in orbits under $h$ of the same length as $p$  under  $g$.
    else
        pnts := Intersection( OnTuples( S.orbit, s ), img[ p ] );
    fi;

    # run through the cosets of  the  stabilizer  in  the  standard  way.
    while pnts <> [  ]  do
        p := pnts[ 1 ];
        ss := s;
        while S.orbit[ 1 ] ^ ss <> p  do
            ss := S.transversal[ p / ss ] mod ss;
        od;
        LL := Subgroup( Parent( G ), Filtered( L.generators, l -> p^l=p ) );
        elm := RepresentativeRatConjElmsCoset( S.stabilizer, ss, LL );
        if elm <> false  then
            return elm;
        fi;
        pnts := Difference( pnts, G.operations.Orbit( L, p, OnPoints ) );
    od;

    # there is no  element  with  the  property  in  the  coset  $S * s$.
    return false;

end;

    # get the arguments
    G := cl1.group;
    g := cl1.representative;
    h := cl2.representative;
    irrh := Filtered( [ 1 .. cl2.order ], i -> GcdInt( i, cl2.order ) = 1 );
    hpow := List( irrh, x -> h ^ x );

    # handle trivial cases.
    if g in hpow  then
        return G.identity;
    fi;
    if g = G.identity  or h = G.identity  then
        return false;
    fi;

    if IsBound( cl2.galoisGroup )  then
        irrh := cl2.operations.IrrationalExponents( cl2 );
    fi;

    # get the cyclestructures and compare them.
    if IsBound( cl1.cycles )  then
        orbsg := cl1.cycles;
    else
        orbsg := Cycles( g, G.operations.MovedPoints( G ) );
        Sort( orbsg, function ( o1, o2 )
            return Length( o2 ) < Length( o1 );  end );
    fi;
    if IsBound( cl2.cycles )  then
        orbsh := cl2.cycles;
    else
        orbsh := Cycles( h, G.operations.MovedPoints( G ) );
        Sort( orbsh, function ( o1, o2 )
            return Length( o2 ) < Length( o1 );  end );
    fi;
    if List( orbsg, Length ) <> List( orbsh, Length )  then
        return false;
    fi;

    # compute a  stabchain for $G$.  we  take a  base that  has  as often  as
    # possible $\beta_i ^ g = \beta_{i + 1}$.
    MakeStabChain( G, Concatenation( orbsg ) );
    base := G.operations.Base( G );

    # for each length make a set of points  in orbits of that length under $h$
    lensh := [  ];
    for orb  in orbsh  do
        if not IsBound( lensh[ Length( orb ) ] )  then
            lensh[ Length( orb ) ] := Set( orb );
        else
            UniteSet( lensh[ Length( orb ) ], orb );
        fi;
    od;

    # for each basepoint
    img := [  ];
    for bpt  in base  do

        # if this basepoint is the image of an earlier  basepoint  store  it, 
        if bpt / g in base  and  Position( base, bpt / g )
                               < Position( base, bpt )  then
            img[ bpt ] := bpt / g;

        # otherwise store the points in orbits under $h$ of the same  length.
        else
            img[ bpt ] := lensh[ OrbitLength( Group( g ), bpt ) ];
        fi;

    od;

    # find a subgroup  $K$ of $G$ which  preserves the conjugation  property,
    # i.e., $g ^ x = h$ implies $g ^ {x * k} = h$ for all $x \in G, k \in K$.
    # any subgroup of $Centralizer(  G, h )$ will do, for  example  $Group( h
    # )$, we add powers of $h$ so that we know  generators for stabilizers of
    # $K$.
    if IsBound( cl2.centralizer )  then
        K := cl2.centralizer;
    else
        K := Subgroup( Parent( G ), [ h ] );
        for gen  in  G.operations.StrongGenerators( G )  do
            if h ^ gen = h and gen in G  then
                for len  in  DivisorsInt( OrderPerm( gen ) )  do
                    if    gen ^ len <> G.identity
                        and not gen ^ len in K.generators  then
                        Add( K.generators, gen ^ len );
                    fi;
                od;
            fi;
        od;
    fi;

    # search through the whole group $G = G * Id$  for a  conjugating  element.
    elm := RepresentativeRatConjElmsCoset( G, G.identity, K );

    # return the element.
    return elm;
end;

#############################################################################
##
#F  CompleteGaloisGroupPElement( <G>, <cl>, <power>, <p> )  . add the p'-part
##
##  This  function assumes  that  the <p>-part  of the Galois  group  of  the
##  rational class <cl>  is already  bound  to  '<cl>.galoisGroup'.  It  then
##  computes  the  <p>'-part  and finds an  element  of the  normalizer which
##  induces an inner automorphism representing the generating residue of  the
##  Galois group.  <power> must the <p>-th power of <cl> .  If <p> = 2, there
##  is nothing to be done, since the Galois group is a 2-group then.
##
CompleteGaloisGroupPElement := function( G, class, power, p )
    local  prcg,            # prime residue class group modulo 'class.order'
           phi,             # size of the prime residue class group
           primitiveRoot,   # generator of the cyclic prime residue class group
           sizeKnownPart,   # size of the known part of the Galois group
           sizeUnknownPart, # size of the unknown part of the Galois group
           generatorUnknownPart, 
                            # generator of the unknown part of the prime
                            # residue class group, whose powers are tested
                            # one by one
           exp,             # some power of 'generatorP_Part'
           div,             # divisors of $p-1$
           q,               # variable used in division test
           fusingElement,   # element that  does the generating automorphism
           i;               # loop variable

    # If <p>=2 or the class is central, there is nothing to  do.
    if p > 2  then
        if not IsBound( class.isCentral )  then

	    # Get the size of the  prime residue class group and of the known
	    # part  of the Galois group ( already known from  the calculation
	    # in the Sylow subgroup ).
	    phi                  := class.order / p * ( p - 1 );
	    sizeKnownPart        := Size( class.galoisGroup );
	    sizeUnknownPart      := GcdInt( p - 1, phi / sizeKnownPart );
	    primitiveRoot        := PrimitiveRootMod( class.order );
	    generatorUnknownPart := PowerModInt( primitiveRoot,
					         phi / sizeUnknownPart, 
					         class.order );
	    q                    := Size( G ) / Size( class.centralizer ) /
				    sizeKnownPart;

	    # Now  run  through all the  divisors  <d>  of  'sizeUnknownPart'
	    # testing if there  is an automorphism of  order 'sizeKnownPart *
	    # <d>'.
	    div           := Reversed( DivisorsInt( sizeUnknownPart ) );
	    i             := 0;
	    fusingElement := false;
	    repeat
		i := i + 1;

		# If  such  an  automorphism  exists,  its  order  times  the
		# centralizer order must divide the group order.
		if q mod div[ i ] = 0  then
		    exp := PowerModInt( generatorUnknownPart,
                                        sizeUnknownPart / div[i],
                                        class.order);

		    # If $C_G(g) = C_G(g^p)$, then Gal(<g>) must be generated
		    # by a power of the generator of Gal(<g>^<p>).
		    if Size(class.centralizer)=Size(power.centralizer)  then
                        if sizeKnownPart*div[i] > Size(power.galoisGroup)
                           then
                            fusingElement := false;
                        else
                            fusingElement := power.fusingElement ^
			    (Size(power.galoisGroup)/(sizeKnownPart*div[i]));
                            if class.representative ^ fusingElement <>
                               class.representative ^ exp  then
                                fusingElement := false;
                            fi;
                        fi;

		    elif class.order = p  or  AgWordResidue
			( power.galoisGroup, exp ) in power.galoisGroup  then
			if IsPerm( class.representative )  then
			    fusingElement :=
				PermGroupOps.RepresentativeConjugationElements
				    ( G, class.representative, 
					 class.representative ^ exp, 
					 class.centralizer );
			else
			    fusingElement := RepresentativeOperation
				( G, class.representative, 
				     class.representative ^ exp );
			fi;
		    fi;
		fi;

	    until fusingElement <> false;

	    # Construct the Galois group as subgroup of a prime residue class
	    # group  and  enter the conjugating  element  which  induces  the
	    # generating automorphism into the class record.
	    prcg                := GroupPrimeResidues( class.order );
	    class.galoisGroup   := Subgroup( prcg, [ prcg.generators[ 1 ] ^ 
                                   ( phi / sizeKnownPart / div[ i ] ) ] );
	    class.fusingElement := fusingElement;
 
	fi;
        Unbind( class.irrationalExponents );
    fi;

end;

#############################################################################
##
#F  OrbitsVectorSpace( <G>, [<gens>,] <K>,<pro>,<long>) .  special orbit alg.
##
##  This  function determines orbit  representatives  and stabilizers of  the
##  group <G>  acting  on the finite vector  space  <K>. If <pro>  is 'true',
##  action on the  projective space 'P(<K>)' is  assumed, but the stabilizers
##  returned are *still* point stabilizers. In the  projective case the index
##  of the Galois  group (i.e.  the point  stabilizer) in the line stabilizer
##  is returned as '.galoisIndices'.  If <G> is an ag group, <gens> must be a
##  the image of the  cgs of <G> under  the operation homomorphism into  some
##  group (e.g.  matrices), otherwise  the elements  of  <G> must operate  on
##  <K>.  If  <long>  is 'true',  the  full orbits  and transversals  of  the
##  operation  are  also returned,  this  is only  possible  if <G> is  an ag
##  group.
##
OrbitsVectorSpace := function( arg )
    local  G, gens, K, opr, pro, primitiveRoot, long,
    	   space, reps, orbits, trans, stabs, gals, spsize, orb, v, w, z,
           next, enum, orbs, i, c;

    # Get the arguments.
    G := arg[ 1 ];
    if IsAgGroup( G )  then
    	gens := arg[ 2 ];
    	i := 3;
    else
	opr := function( v, g )
		   return PreImagesRepresentative( K.bijection,
			  ( v ^ K.bijection ) ^ g );
		   end;
    	i := 2;
    fi;
    K    := arg[ i ];
    pro  := arg[ i + 1 ];
    long := arg[ i + 2 ];
    
    reps   := [  ];
    orbits := [  ];
    trans  := [  ];
    stabs  := [  ];
    gals   := [  ];
    spsize := Size( K );
    enum   := Enumeration( K );

    if pro  then
    	primitiveRoot := PrimitiveRootMod( K.field.char );
    fi;

    orbs  := 0;
    space := BlistList( [ 1 .. spsize ], [  ] );
    next  := Position( space, false );
    while next <> false  do
	v := enum.element( enum, next );
        orbs := orbs + 1;
    	if IsAgGroup( G )  then
    	    if long  then
		orb := AgOrbitTransversalStabilizer( G, gens, v, OnPoints );
    	    else
    	    	orb := AgOrbitStabilizer( G, gens, v, OnPoints );
    	    fi;
    	else
    	    if long  then
    	    	Error( "transversal only possible for ag groups" );
    	    else
    	    	orb := rec( orbit := Orbit( G, v, opr ),
    	    	       stabilizer := Stabilizer( G, v, opr ) );
    	    fi;
    	fi;
    	    
        gals[ orbs ] := 1;

    	# If the  operation in on  lines, find 'galoisIndices' and delete the
    	# whole line from the bit-list 'space'.
        if pro  then
            c := primitiveRoot;
            while        IsAgGroup( K )  and  not v ^ c in orb.orbit
    	    	  or not IsAgGroup( K )  and  not c * v in orb.orbit  do
                c := c * primitiveRoot mod K.field.char;
                gals[ orbs ] := gals[ orbs ] + 1;
            od;
	    for w  in orb.orbit  do
                for c  in [ 1 .. K.field.char - 1 ]  do
                    if IsAgGroup( K )  then
                        space[ enum.number( enum, w ^ c ) ] := true;
                    else
                        space[ enum.number( enum, c * w ) ] := true;
                    fi;
		od;
	    od;

    	else
    	    for w  in orb.orbit  do
    	    	space[ enum.number( enum, w ) ] := true;
    	    od;
    	fi;

        reps  [ orbs ] := v;
        stabs [ orbs ] := orb.stabilizer;
	if long  then
	    orbits[ orbs ] := orb.orbit;
	    trans [ orbs ] := orb.transversal;
	fi;
        next := Position( space, false, next );
    od;
    if long  then
	return rec( 
	    representatives := reps, 
	    galoisIndices   := gals,
	    orbits          := orbits,
	    transversals    := trans,
	    stabilizers     := stabs 
	);
    else
	return rec( 
	    representatives := reps, 
	    galoisIndices   := gals,
	    stabilizers     := stabs 
	);
    fi;
end;

#############################################################################
##
#F  ConstructList( <T>, <list>, <roots>, <power> )  . . . . . . . . . . local
##
ConstructList := function( T, list, roots, power )
    local  i,  j,  allRoots;
    allRoots := [ power ];
    for i  in [ 2 .. Length( T ) ]  do
        if T[ i ].power = power  then
            j := Length( list ) + 1;
            list[ j ] := i;
            roots[ j ] := [  ];
            Append( roots[ j ], ConstructList( T, list, roots, i ) );
            Append( allRoots, roots[ j ] );
        fi;
    od;
    return allRoots;
end;

#############################################################################
##
#F  SubspaceVectorSpaceAgGroup( <N>, <vectors> )  . . . . . . . . . . . local
##
##  This function creates a record  containing information about a complement
##  in <N> to the span of <vectors>.
##
SubspaceVectorSpaceAgGroup := function( N, vectors )
    local  P,  Q,  v,  cg,  i,  j;

    if vectors = [  ]  then
        return rec(
            baseComplement := [ 1 .. Length( N.cgs ) ],
            projection     := IdentityMat( Length( N.cgs ), N.field ),
            active         := [  ] );
    fi;

    P := [  ];
    Q := Copy( vectors );
    for v  in vectors  do
        if     P =  [  ]  and  v <> 0 * v
           or  P <> [  ]  and  SolutionMat( P, v ) = false  then
            Add( P, v );
        fi;
    od;
    cg := CommutatorGauss( Copy( Q ), N.field );
    cg.projection := IdentityMat( Length( N.cgs ), N.field );

    # An improvement in naming the components.
    cg.baseComplement := cg.commutatorFactor;
    Unbind(cg.commutatorFactor);

    # Find a right pseudo inverse for <Q>.
    Append( Q, Copy( cg.projection ) );
    Q := TransposedMat( Q );
    TriangulizeMat( Q );
    Q := TransposedMat( Q );
    cg.inverse := Q{ [ Length( vectors ) + 1 ..
		       Length( vectors ) + Length( N.cgs ) ] };
    cg.active := [  ];
    i := 1;
    j := 1;
    while i <= Length( N.cgs )  do
        while j <= Length( vectors ) and Q[ j ][ i ] = N.field.zero  do
            j := j + 1;
        od;
        if j <= Length( vectors ) and Q[ j ][ i ] <> N.field.zero  then
            cg.active[ i ] := j;
        else

            # If <Q> does  not  have full rank, terminate when the bottom row
            # is reached.
            i := Length( N.cgs );

        fi;
        i := i + 1; 
    od;

    if Length( cg.baseComplement ) > 0  then

        # Complete <P> to  give  a base change matrix for the projection onto
        # the complement.
        for i  in [ 1 .. Length( P ) ]  do
            cg.projection[ i ][ i ] := N.field.zero;
        od;
        for i  in [ Length( P ) + 1 .. Length( N.cgs ) ]  do
            P[ i ] := [  ];
            for j  in [ 1 .. Length( N.cgs ) ]  do
                if j = cg.baseComplement[ i - Length( N.cgs ) +
                           Length( cg.baseComplement ) ]  then
                    P[ i ][ j ] := N.field.one;
                else
                    P[ i ][ j ] := N.field.zero;
                fi;
            od;
        od;
        cg.projection := TransposedMat
                          ( TransposedMat( cg.projection ^ P )
				{ cg.baseComplement } );

    fi;
    return cg;

end;

#############################################################################
##
#F  PreImageProjectionSubspace( <N>, <C>, <v> ) . . . . . . . . . . . . local
##
##  If    '<N>.subspace'    has     bound    a    record    constructed    by
##  'SubspaceVectorSpaceAgGroup( <N>, <vectors> )' where <vectors>  is a list
##  of  images of  '<C>.cgs'  under  a homomorphism of  groups, this function
##  calculates a preimage of the vector <v>  under this homomorphism.  Except
##  for the case of the zero map, it is *not* tested whether <v> really has a
##  preimage.
##
PreImageProjectionSubspace := function( N, C, v )
    local  preimg,  ll,  i,  z;
    preimg := List( v, row -> C.identity );
    if N.subspace.active = [  ]  then
       	if v <> [  ]  and  v <> 0 * v  then
	    Error( "these elements have no preimages under the zero map" );
	else
	    return preimg;
	fi;
    fi;
    if v <> [  ]  then
        v := v * N.subspace.inverse;
    fi;
    for i  in [ 1 .. Length( v ) ]  do
        for ll  in [ 1 .. Length( v[ i ] ) ]  do
            z := IntVecFFE( v[i], ll );
            if z <> 0  then
                 preimg[ i ] := preimg[ i ] *
                     C.cgs[ N.subspace.active[ ll ] ] ^ z;
            fi;
        od;
    od;
    return preimg;
end;

#############################################################################
##
#F  CentralStepConjugatingElement( ... )  . . . . . . . . . . . . . . . local
##
##  This function returns an element of <G> conjugating <hk1> to <hk2>^<l>.
##
CentralStepConjugatingElement := function
                                 ( G, C, N, h, k1, k2, l, genimage )
    local  asList,  conj,  i,  exp,  ll,  z;

    exp    := [  ];
    asList := true;
    if not IsList( k1 )  then
        asList := false;
        k1     := [ k1 ];
        k2     := [ k2 ];
        l      := [ l  ];
        genimage := [ genimage ];
    fi;
    for i  in [ 1 .. Length( k1 ) ]  do
        exp[ i ] := Exponents( N,
            h ^ -l[ i ] * h ^ FactorAgWord( genimage[ i ], G.identity )
                * k1[ i ] * k2[ i ] ^ -l[ i ],
            N.field );
    od;
    conj := PreImageProjectionSubspace( N, C, exp );
    for i  in [ 1 .. Length( k1 ) ]  do
        conj[ i ] := FactorAgWord
            ( conj[ i ] mod genimage[ i ], G.identity );
    od;
    if asList  then
        return conj;
    else
        return conj[ 1 ];
    fi;

end;

#############################################################################
##
#F  CentralStepRationalClasses2Group( <G>, <F>, <N>, <h>, <C>, <Gal> )  local
##
CentralStepRationalClasses2Group := function
                                    ( source, range, N, h, C, galoisGroup )
    local  newRepresentatives, 
           newCentralizers, # result 
           newGaloisGroups, #
           order,           # order of <hN> in <range> 
           newOrder,        # order of <h> in <source> 
           trivialGaloisGroup,
           newGaloisGroup,  # Galois group of <h> 
           centralizer,     # centralizer of preimages of <h>
           tmp, v, g, g2,   # auxiliary variables in calc. of <centralizer>
           K,               # a complement to $[h,C]$ in <N>
           r,               # dimension of <K> 
           prcg,            # prime residue class group modulo order of <h> 
           Q,               # subspace matrix to be triangulized, its rank
           preimage,        # preimage of $Gal(hN)$ under <pi> 
           representatives, # representatives of affine action
           transversal,     # elements conjugating candidates to certain
                            # powers of their canonical representatives
           exponents,       # these certain powers
           stabilizer,      # stabilizer of affine action
           gen, ll,         #\ auxiliary variables in calculation of
           residues,        # }<galoisGroup>
           genimages,       #/
           k, rep,          # representative in <N>, ag word and vector
           exp, preimg,     # auxiliary variables in calculation in <N> 
           i, j, j2, l;     # loop variables

    newRepresentatives := [  ];
    newCentralizers    := [  ];
    newGaloisGroups    := [  ];
    order              := Order( range, h );
    h                  := FactorAgWord( h, source.identity );
    newOrder           := Order( source, h );
    if newOrder = 1  then

        # Special case: <h> is trivial.
        trivialGaloisGroup           := GroupPrimeResidues( 1 );
        trivialGaloisGroup.genimages := [  ];
        galoisGroup                  := TrivialSubgroup
                                        ( GroupPrimeResidues( 2 ) );
        galoisGroup.genimages        := [  ];
	Add( newRepresentatives, source.identity    );
	Add( newCentralizers   , source             );
	Add( newGaloisGroups   , trivialGaloisGroup );
	for i  in Reversed( [ 1 .. Length( Cgs( N ) ) ] )  do
	    for exp  in Tuples( [ 0, 1 ], Length( N.cgs ) - i )  do
		k := N.cgs[ i ];
		for ll  in [ 1 .. Length( exp ) ]  do
		    k := k * N.cgs[ i + ll ] ^ exp[ ll ];
		od;
		Add( newRepresentatives, k           );
		Add( newCentralizers   , source      );
		Add( newGaloisGroups   , galoisGroup );
	    od;
        od;

    else

        # Calculate $[ h, pC ]$ where <pC> is the preimage of <C> and find  a
        # complement <K>= <cg>.baseComplement to $[ h, pC ]$ in <N>.
        Q := [  ];
        for i  in [ 1 .. Length( Cgs( C ) ) ]  do
            exp  := Exponents
                ( N,
                  Comm( h, FactorAgWord( C.cgs[ i ], source.identity ) ),
                  N.field );
            Add( Q, exp );
        od;
        N.subspace := SubspaceVectorSpaceAgGroup( N, Q );
        r := Length( N.subspace.baseComplement );

        # Calculate the centralizer of <h>.
        tmp := [  ];
        for i  in [ N.subspace.commutator + 1 .. 
                    N.subspace.commutator + N.subspace.centralizer ]  do
            v := N.subspace.matrix[ i ];
            g := range.identity;
            for j  in [ N.subspace.dimensionN + 1 ..
                        N.subspace.dimensionN + N.subspace.dimensionC ]
                do
                if v[ j ] <> N.field.zero  then
                    g := g * C.cgs[ j - N.subspace.dimensionN ];
                fi;
            od;
            tmp[ i - N.subspace.commutator ] :=
                FactorAgWord( g, source.identity );
        od;
        Append( tmp, N.cgs );
        centralizer := AgSubgroup( Parent( source ), tmp, false );

        # Construct the group $Z_o( h  )^ * $ as extension of $Z_o( hN )^ * $
        # by the normal subgroup $\{1, o( h ) +  1, ...\}$ ( i.e. prolong the
        # ag generating system ).
        prcg := GroupPrimeResidues( newOrder );

        # Get the preimage of  Gal( <hN>  )  in $Z_o( h )^ * $ and  find  the
        # affine action  of  each generator  of  that preimage on  the vector
        # space <K> .
        preimage := AgSubgroup( prcg, Concatenation
            ( List( Cgs( galoisGroup ), gen ->
                    FactorAgWord( gen, prcg.identity ) ), 
              prcg.generators
                  { [ Length( Parent( galoisGroup ).generators ) + 1 .. 
		      Length( prcg.generators ) ] } ),
              true );

        # If <K> is trivial, there is only the rational class of <h>.
        if r = 0  then
            representatives := [ N.identity ];
            stabilizer := preimage;

        else

            # Since $p = 2$,  the affine mappings are simply translations and
            # a transversal is given  by  a complement to the space generated
            # by the (at most two) translation vectors.
            Q := [  ];
            for j  in [ 1 .. 2 ]  do
                if j <= Length( Cgs( preimage ) )  then
                    g := ResidueAgWord( preimage, preimage.cgs[ j ] );
                    if j <= Length( galoisGroup.cgs )  then
                        exp := Exponents( N, h ^ g mod h ^ FactorAgWord
                            ( galoisGroup.genimages[ j ], source.identity ),
                            N.field ) * N.subspace.projection;
                    else
                        exp := Exponents( N, h ^ g mod h, N.field ) *
                               N.subspace.projection;
                    fi;
                    Add( Q, exp );
                fi;
            od;

	    if Q <> [  ]  then
		K := rec( subspace := CommutatorGauss( Copy( Q ),
						       N.field ) );
		K.subspace.baseComplement := K.subspace.commutatorFactor;
		Unbind( K.subspace.commutatorFactor );
		representatives := Elements( AgSubgroup
		    ( Parent( source ),
		      Cgs( N ){ N.subspace.baseComplement
				{ K.subspace.baseComplement } },
		      true ) );

                # Get the stabilizer  of  the zero vector as the nullspace of
                # <Q>.
                stabilizer := [  ];
                for exp  in NullspaceMat( Q )  do
                    g := preimage.identity;
                    for ll  in [ 1 .. Length( exp ) ]  do
                        if exp[ ll ] <> N.field.zero  then
                            g := g * preimage.cgs[ ll ];
                        fi;
                    od;
                    Add( stabilizer, g );
                od;
                stabilizer := Subgroup( prcg, stabilizer );

	    else
		representatives := Elements( AgSubgroup
		    ( Parent( source ),
		      Cgs( N ){ N.subspace.baseComplement },
		      true ) );
                stabilizer := preimage;
	    fi;

        fi;

        # Find residues and conjugating elements for the first two generators
        # of the Galois group.
        residues  := [  ];
        genimages := [  ];
        for j  in [ 1 .. Length( Cgs( stabilizer ) ) ]  do
            if j = 1  or  j = 2  and  residues[ 1 ] = newOrder - 1  then
                residues[ j ] := ResidueAgWord( stabilizer,
                                                stabilizer.cgs[ j ] );
                exp := Exponents( galoisGroup,
                    FactorAgWord( stabilizer.cgs[ j ],
                                  galoisGroup.identity ) );
                genimages[ j ] := range.identity;
                for ll  in [ 1 .. Length( exp ) ]  do
                    genimages[ j ] := genimages[ j ] *
                        galoisGroup.genimages[ ll ] ^ exp[ ll ];
                od;
            fi;
        od;

        # If <R> is a set of representatives of the orbits then <hR> is a set
        # of representatives of the rational classes in <hN>.
        for k  in representatives  do

            # Get  the  Galois group of <hr> as the stabilizer of  the vector
            # <r>.
            newGaloisGroup := ShallowCopy( stabilizer );
            if not IsBound( Parent( newGaloisGroup ).residues )  then
                Parent( newGaloisGroup ).residues :=
                    Parent( preimage ).residues;
            fi;

            # The  Galois group is generated by at most 2 elements, all other
            # generators are powers of the first resp. second.
            newGaloisGroup.genimages := CentralStepConjugatingElement
                ( source, C, N, h,
                  List( residues, r -> k ),
                  List( residues, r -> k ),
                  residues,
                  genimages );
            for j  in [ Length( residues ) + 1 ..
                        Length( newGaloisGroup.cgs ) ]  do
                newGaloisGroup.genimages[ j ] :=
                    newGaloisGroup.genimages[ j - 1 ] ^ 
                    RelativeOrderAgWord( newGaloisGroup.cgs[ j - 1 ] );
            od;

            Add( newRepresentatives, h * k          );
            Add( newCentralizers   , centralizer    );
            Add( newGaloisGroups   , newGaloisGroup );
	od;

    fi;

    return rec( representatives := newRepresentatives, 
                centralizers    := newCentralizers   , 
                galoisGroups    := newGaloisGroups   );

end;
  
#############################################################################
##
#F  CentralStepIdentifyRationalClasses2Group( ... ) . . . . . . . . . . local
##
CentralStepIdentifyRationalClasses2Group := function
    ( source, range, N, candidates, C, galoisGroup )
    local  newRepresentatives, 
           newCentralizers, # result 
           newGaloisGroups, #
    	   h,               # image of <candidates> in <range>
           order,           # order of <hN> in <range> 
           newOrder,        # order of <h> in <source> 
           trivialGaloisGroup,
           newGaloisGroup,  # Galois group of <h> 
           centralizer,     # centralizer of preimages of <h>
           tmp, v, g, g2,   # auxiliary variables in calc. of <centralizer>
           K,               # a complement to $[h,C]$ in <N>
           r,               # dimension of <K> 
           prcg,            # prime residue class group modulo order of <h> 
           Q,               # subspace matrix to be triangulized, its rank
           preimage,        # preimage of $Gal(hN)$ under <pi> 
           representatives, # representatives of affine action
           transversal,     # elements conjugating candidates to certain
                            # powers of their canonical representatives
           exponents,       # these certain powers
           stabilizer,      # stabilizer of affine action
           gen, ll,         #\ auxiliary variables in calculation of
           residues,        # }<galoisGroup>
           genimages,       #/
           k, rep,          # representative in <N>, ag word and vector
           exp, preimg,     # auxiliary variables in calculation in <N> 
           i, j, j2, l;     # loop variables

    # <h> is the common image  of <candidates> under the natural homomorphism
    # onto <range>.
    h := FactorAgWord( candidates[ 1 ], range.identity );

    newRepresentatives := [  ];
    newCentralizers    := [  ];
    newGaloisGroups    := [  ];
    order              := Order( range, h );
    h                  := FactorAgWord( h, source.identity );
    newOrder           := Order( source, h );
    if newOrder = 1  then

        # Special case: <h> is trivial.
        trivialGaloisGroup           := GroupPrimeResidues( 1 );
        trivialGaloisGroup.genimages := [  ];
        galoisGroup                  := TrivialSubgroup
                                        ( GroupPrimeResidues( 2 ) );
        galoisGroup.genimages        := [  ];
	newRepresentatives := candidates;
	newCentralizers    := List( candidates, c -> source );
	transversal        := List( candidates, c -> source.identity );
	exponents          := List( candidates, c -> 1 );
	for k  in candidates  do
	    if k = source.identity  then
		Add( newGaloisGroups, trivialGaloisGroup );
	    else
		Add( newGaloisGroups, galoisGroup );
	    fi;
	od;

    else

        # Calculate $[ h, pC ]$ where <pC> is the preimage of <C> and find  a
        # complement <K>= <cg>.baseComplement to $[ h, pC ]$ in <N>.
        Q := [  ];
        for i  in [ 1 .. Length( Cgs( C ) ) ]  do
            exp  := Exponents
                ( N,
                  Comm( h, FactorAgWord( C.cgs[ i ], source.identity ) ),
                  N.field );
            Add( Q, exp );
        od;
        N.subspace := SubspaceVectorSpaceAgGroup( N, Q );
        r := Length( N.subspace.baseComplement );

        # Calculate the centralizer of <h>.
        tmp := [  ];
        for i  in [ N.subspace.commutator + 1 .. 
                    N.subspace.commutator + N.subspace.centralizer ]  do
            v := N.subspace.matrix[ i ];
            g := range.identity;
            for j  in [ N.subspace.dimensionN + 1 ..
                        N.subspace.dimensionN + N.subspace.dimensionC ]
                do
                if v[ j ] <> N.field.zero  then
                    g := g * C.cgs[ j - N.subspace.dimensionN ];
                fi;
            od;
            tmp[ i - N.subspace.commutator ] :=
                FactorAgWord( g, source.identity );
        od;
        Append( tmp, N.cgs );
        centralizer := AgSubgroup( Parent( source ), tmp, false );

        # Construct the group $Z_o( h  )^ * $ as extension of $Z_o( hN )^ * $
        # by the normal subgroup $\{1, o( h ) +  1, ...\}$ ( i.e. prolong the
        # ag generating system ).
        prcg := GroupPrimeResidues( newOrder );

        # Get the preimage of  Gal( <hN>  )  in $Z_o( h )^ * $ and  find  the
        # affine action  of  each generator  of  that preimage on  the vector
        # space <K> .
        preimage := AgSubgroup( prcg, Concatenation
            ( List( Cgs( galoisGroup ), gen ->
                    FactorAgWord( gen, prcg.identity ) ), 
              prcg.generators
                  { [ Length( Parent( galoisGroup ).generators ) + 1 .. 
		      Length( prcg.generators ) ] } ),
              true );

        # If <K> is trivial, there is only the rational class of <h>.
        if r = 0  then
	    representatives := List( candidates, c -> N.identity );
	    exponents       := List( candidates, c -> 1 );
	    transversal := CentralStepConjugatingElement
		( source, C, N, h, 
		  List( candidates, c -> h mod c ),
		  List( candidates, c -> N.identity ),
		  exponents,
		  List( candidates, c -> range.identity ) );
            stabilizer := preimage;

        else

            # Since $p = 2$,  the affine mappings are simply translations and
            # a transversal is given  by  a complement to the space generated
            # by the (at most two) translation vectors.
            Q := [  ];
            for j  in [ 1 .. 2 ]  do
                if j <= Length( Cgs( preimage ) )  then
                    g := ResidueAgWord( preimage, preimage.cgs[ j ] );
                    if j <= Length( galoisGroup.cgs )  then
                        exp := Exponents( N, h ^ g mod h ^ FactorAgWord
                            ( galoisGroup.genimages[ j ], source.identity ),
                            N.field ) * N.subspace.projection;
                    else
                        exp := Exponents( N, h ^ g mod h, N.field ) *
                               N.subspace.projection;
                    fi;
                    Add( Q, exp );
                fi;
            od;

            # Find the  canonical   representatives  of  the   candidates  by
            # projecting onto <complement>.
	    K := ShallowCopy( AgSubgroup( N,
                                          N.cgs{ N.subspace.baseComplement },
			                  true ) );
	    K.field := N.field;
	    K.subspace := SubspaceVectorSpaceAgGroup( K, Q );
	    representatives := [  ];
	    exp := [  ];
	    for i  in [ 1 .. Length( candidates ) ]  do
		representatives[ i ] := K.identity;
		v := Exponents
		    ( N, 
		      h mod candidates[ i ],
		      N.field ) * N.subspace.projection;
		if K.subspace.baseComplement = [  ]  then
		    rep := [  ];
		else
		    rep := v * K.subspace.projection;
		fi;
		for ll  in [ 1 .. Length( rep ) ]  do
		    if rep[ ll ] <> K.field.zero  then
			representatives[ i ] := representatives[ i ]
			* K.cgs[ K.subspace.baseComplement[ ll ] ];
			v[ K.subspace.baseComplement[ ll ] ] :=
			    v[ K.subspace.baseComplement[ ll ] ]
			    - rep[ ll ];
		    fi;
		od;

		# The difference between <v> and  $pr_Q(v)$ is  needed to
		# calculate the exponent of the rational conjugation.
		exp[ i ] := v;

	    od;

	    # Get the exponents and the  genimages for the conjugation of
	    # <hk1>   to    <hk2>^<l>    for   all   pairs    (candidate,
	    # representative).
	    preimg := PreImageProjectionSubspace( K, preimage, exp );
	    genimages := [  ];
	    exponents := [  ];
	    for i  in [ 1 .. Length( preimg ) ]  do
		exponents[ i ] := ResidueAgWord( preimage,
						 preimg[ i ] );
		genimages[ i ] := range.identity;
		v := Exponents( galoisGroup, 
		    FactorAgWord( preimg[ i ],
				  galoisGroup.identity ) );
		for ll  in [ 1 .. Length( v ) ]  do
		    genimages[ i ] := genimages[ i ] *
			galoisGroup.genimages[ ll ] ^ v[ ll ];
		od;
	    od;
	    transversal := CentralStepConjugatingElement
		( source, C, N, h, 
		  List( candidates, c -> h mod c ),
		  representatives,
		  exponents,
		  genimages );

            if Q <> [  ]  then

                # Get the stabilizer  of  the zero vector as the nullspace of
                # <Q>.
                stabilizer := [  ];
                for exp  in NullspaceMat( Q )  do
                    g := preimage.identity;
                    for ll  in [ 1 .. Length( exp ) ]  do
                        if exp[ ll ] <> N.field.zero  then
                            g := g * preimage.cgs[ ll ];
                        fi;
                    od;
                    Add( stabilizer, g );
                od;
                stabilizer := Subgroup( prcg, stabilizer );

            else
                stabilizer := preimage;
            fi;

        fi;

        # Find residues and conjugating elements for the first two generators
        # of the Galois group.
        residues  := [  ];
        genimages := [  ];
        for j  in [ 1 .. Length( Cgs( stabilizer ) ) ]  do
            if j = 1  or  j = 2  and  residues[ 1 ] = newOrder - 1  then
                residues[ j ] := ResidueAgWord( stabilizer,
                                                stabilizer.cgs[ j ] );
                exp := Exponents( galoisGroup,
                    FactorAgWord( stabilizer.cgs[ j ],
                                  galoisGroup.identity ) );
                genimages[ j ] := range.identity;
                for ll  in [ 1 .. Length( exp ) ]  do
                    genimages[ j ] := genimages[ j ] *
                        galoisGroup.genimages[ ll ] ^ exp[ ll ];
                od;
            fi;
        od;

        # If <R> is a set of representatives of the orbits then <hR> is a set
        # of representatives of the rational classes in <hN>.
        for k  in representatives  do

            # Get  the  Galois group of <hr> as the stabilizer of  the vector
            # <r>.
            newGaloisGroup := ShallowCopy( stabilizer );
            if not IsBound( Parent( newGaloisGroup ).residues )  then
                Parent( newGaloisGroup ).residues :=
                    Parent( preimage ).residues;
            fi;

            # The  Galois group is generated by at most 2 elements, all other
            # generators are powers of the first resp. second.
            newGaloisGroup.genimages := CentralStepConjugatingElement
                ( source, C, N, h,
                  List( residues, r -> k ),
                  List( residues, r -> k ),
                  residues,
                  genimages );
            for j  in [ Length( residues ) + 1 ..
                        Length( newGaloisGroup.cgs ) ]  do
                newGaloisGroup.genimages[ j ] :=
                    newGaloisGroup.genimages[ j - 1 ] ^ 
                    RelativeOrderAgWord( newGaloisGroup.cgs[ j - 1 ] );
            od;

            Add( newRepresentatives, h * k          );
            Add( newCentralizers   , centralizer    );
            Add( newGaloisGroups   , newGaloisGroup );
	od;

    fi;

    return rec( representatives := newRepresentatives, 
		transversal     := transversal       ,
		exponents       := exponents         ,
		centralizers    := newCentralizers   , 
		galoisGroups    := newGaloisGroups   );

end;

#############################################################################
##
#F  CentralStepRationalClassesPGroup( <G>, <F>, <N>, <h>, <C>, <Gal> )  local
##
CentralStepRationalClassesPGroup := function
                                    ( source, range, N, h, C, galoisGroup )
    local  newRepresentatives, 
           newCentralizers, # result 
           newGaloisGroups, #
           p,               # exponent of <N> 
           order,           # order of <hN> in <range> 
           newOrder,        # order of <h> in <source> 
           weight,          # weight of an element of <N>
           trivialGaloisGroup,
           newGaloisGroup,  # Galois group of <h> 
           centralizer,     # centralizer of preimages of <h>
           Q,tmp,v,g,g2,z,  # auxiliary variables in calc. of <centralizer>
           K,               # a complement to $[h,C]$ in <N>
           r,               # dimension of <K> 
           prcg,            # prime residue class group modulo order of <h> 
           preimage,        # preimage of $Gal( hN )$ under <pi> 
           inv, genimages,  # aux. variables in calculation of affine action
           orbits,          # orbits under this action
           orbit,           # one orbit of this action with transversal
           pos,             # position of one element in <orbit>
           representatives, # representatives of affine action
           transversal,     # elements conjugating candidates to certain
                            # powers of their canonical representatives
           exponents,       # these certain powers
           conjElms,        # like <transversal>, but for <range>
           stabilizers,     # stabilizers of affine action
           res, gen, ll,    # aux. variables in calculation of <galoisGroup> 
           exp, k,          # auxiliary variables in calculation in <N> 
           i, j, j2, l;     # loop variables

    p := N.field.char;
    if p = 2  then
        return CentralStepRationalClasses2Group
                   ( source, range, N, h, C, galoisGroup );
    fi;

    newRepresentatives := [  ];
    newCentralizers    := [  ];
    newGaloisGroups    := [  ];
    order              := Order( range, h );
    h                  := FactorAgWord( h, source.identity );
    newOrder           := Order( source, h );
    if newOrder = 1  then

        # Special case: <h> is trivial.
        trivialGaloisGroup                   := GroupPrimeResidues(1);
        trivialGaloisGroup.genimage          := source.identity;
        trivialGaloisGroup.generatingResidue := 1;
        galoisGroup                          := TrivialSubgroup
                                             (GroupPrimeResidues(p));
        galoisGroup.genimage                 := source.identity;
        galoisGroup.generatingResidue        := 1;
	Add( newRepresentatives, source.identity    );
	Add( newCentralizers   , source             );
	Add( newGaloisGroups   , trivialGaloisGroup );
	for i  in Reversed( [ 1 .. Length( Cgs( N ) ) ] )  do
	    for exp  in Tuples( [ 0 .. p - 1 ], Length( N.cgs ) - i )  do
		k := N.cgs[ i ];
		for ll  in [ 1 .. Length( exp ) ]  do
		    k := k * N.cgs[ i + ll ] ^ exp[ ll ];
		od;
		Add( newRepresentatives, k           );
		Add( newCentralizers   , source      );
		Add( newGaloisGroups   , galoisGroup );
	    od;
	od;

    else

        # Calculate $[ h, pC ]$ where <pC> is the preimage of <C> and find  a
        # complement <K>= <cg>.baseComplement to $[ h, pC ]$ in <N>.
        Q := [  ];
        for i  in [ 1 .. Length( Cgs( C ) ) ]  do
            exp  := Exponents
                ( N,
                  Comm( h, FactorAgWord( C.cgs[ i ], source.identity ) ),
                  N.field );
            Add( Q, exp );
        od;
        N.subspace := SubspaceVectorSpaceAgGroup( N, Q );
        r := Length( N.subspace.baseComplement );

        # Calculate the centralizer of <h>.
        tmp := [  ];
        for i  in [ N.subspace.commutator + 1 .. 
                    N.subspace.commutator + N.subspace.centralizer ]  do
            v := N.subspace.matrix[ i ];
            g := range.identity;
            for j  in [ N.subspace.dimensionN + 1 ..
                        N.subspace.dimensionN + N.subspace.dimensionC ]
                do
                z := IntVecFFE( v, j );
                if z <> 0  then
                    g := g * C.cgs[ j - N.subspace.dimensionN ] ^ z;
                fi;
            od;
            tmp[ i - N.subspace.commutator ] :=
                FactorAgWord( g, source.identity );
        od;
        Append( tmp, N.cgs );
        centralizer := AgSubgroup( Parent( source ), tmp, false );

        # Construct the group $Z_o( h )^ * $ as  extension of $Z_o( hN )^ * $
        # by the normal subgroup $\{1, o( h ) + 1, ...\}$ ( i.e. prolong  the
        # ag generating system ) and get the preimage of Gal( <hN> ).
        prcg     := GroupPrimeResidues( newOrder );
        preimage := AgSubgroup( prcg, Concatenation
            ( List( Cgs( galoisGroup ), gen ->
                    FactorAgWord( gen, prcg.identity ) ), 
              prcg.generators
                  { [ Length( Parent( galoisGroup ).generators ) + 1 .. 
                      Length( prcg.generators ) ] } ),
              true );

        # If <K> is trivial, there is only the rational class of <h>.
        if r = 0  then
	    representatives := [ N.identity ];
	    stabilizers     := [ preimage ];

        else

            # Since <K>  is  non-trivial, get the action of the generators of
            # <preimage> on <K>.
            K := N.field ^ r;
            genimages := [  ];

            # Construct the affine mapping x -> x /  g +  v / g for the first
            # generator.
            if preimage.cgs <> [  ]  then
                inv := ResidueAgWord( preimage, preimage.cgs[ 1 ] );
                v := Exponents( N,
    	    	    	        h ^ inv mod h ^ FactorAgWord
    	    	    	    	  ( galoisGroup.genimage, source.identity ),
    	    	    	        N.field ) * N.subspace.projection;
                inv := ( inv * N.field.one ) ^ -1;
                genimages[ 1 ] := STMapping( K, inv, inv * v );
            fi;

            # All other generators  are powers of the first since  the Galois
            # group is cyclic.
            for j  in [ 2 .. Length( preimage.cgs ) ]  do
                genimages[ j ] := genimages[ j - 1 ] ^ RelativeOrderAgWord
                  ( preimage.cgs[ j - 1 ] );
            od;

            orbits := OrbitsVectorSpace( preimage, genimages, K, false,
    	    	          false );
    	    representatives := [  ];
	    for l  in [ 1 .. Length( orbits.representatives ) ]  do
		representatives[ l ] := N.identity;
		for ll  in [ 1 .. Length( orbits.representatives[ l ] ) ]  do
		    z := IntVecFFE( orbits.representatives[ l ], ll );
		    if z <> 0  then
			representatives[ l ] := representatives[ l ]
			    * Cgs( N )[ N.subspace.baseComplement[ ll ] ]^z;
		    fi;
		od;     
	    od;
	    stabilizers := orbits.stabilizers;

        fi;

        # If <R> is a set of representatives of the orbits then <hR> is a set
        # of representatives of the rational classes in <hN>.
	res := [  ];
        for l  in [ 1 .. Length( representatives ) ]  do
	    k := representatives[ l ];

            # Get  the Galois group of <hr>  as the  stabilizer of the vector
            # <r>.
            newGaloisGroup := stabilizers[ l ];
            if Cgs( newGaloisGroup ) = [  ]  then
                newGaloisGroup.generatingResidue := 1;
            else
                newGaloisGroup.generatingResidue := ResidueAgWord( prcg, 
                  newGaloisGroup.cgs[ 1 ] );
            fi;
	    res[ l ] := newGaloisGroup.generatingResidue;
            Add( newRepresentatives, h * k          );
            Add( newCentralizers   , centralizer    );
            Add( newGaloisGroups   , newGaloisGroup );
        od;

	# Find the elements that conjugate <hk> to <hk>^<l>.
        genimages := CentralStepConjugatingElement
	    ( source, C, N, h,
	      representatives,
	      representatives,
	      res,
	      List( res, r -> galoisGroup.genimage ^ LogMod
		  ( r, galoisGroup.generatingResidue, order ) ) );
	for l  in [ 1 .. Length( representatives ) ]  do
	    newGaloisGroups[ l ].genimage := genimages[ l ];
	od;

    fi;

    return rec( representatives := newRepresentatives, 
		centralizers    := newCentralizers   , 
		galoisGroups    := newGaloisGroups   );

end;

#############################################################################
##
#F  CentralStepIdentifyRationalClassesPGroup( ... ) . . . . . . . . . . local
##
CentralStepIdentifyRationalClassesPGroup := function
    ( source, range, N, candidates, C, galoisGroup )
    local  newRepresentatives, 
           newCentralizers, # result 
           newGaloisGroups, #
    	   h,               # image of <candidates> in <range>
           p,               # exponent of <N> 
           order,           # order of <hN> in <range> 
           newOrder,        # order of <h> in <source> 
           weight,          # weight of an element of <N>
           trivialGaloisGroup,
           newGaloisGroup,  # Galois group of <h> 
           centralizer,     # centralizer of preimages of <h>
           Q,tmp,v,g,g2,z,  # auxiliary variables in calc. of <centralizer>
           K,               # a complement to $[h,C]$ in <N>
           r,               # dimension of <K> 
           prcg,            # prime residue class group modulo order of <h> 
           preimage,        # preimage of $Gal( hN )$ under <pi> 
           inv, genimages,  # aux. variables in calculation of affine action
           orbits,          # orbits under this action
           orbit,           # one orbit of this action with transversal
           pos,             # position of one element in <orbit>
           representatives, # representatives of affine action
           transversal,     # elements conjugating candidates to certain
                            # powers of their canonical representatives
           exponents,       # these certain powers
           conjElms,        # like <transversal>, but for <range>
           stabilizers,     # stabilizers of affine action
           res, gen, ll,    # aux. variables in calculation of <galoisGroup> 
           exp, k,          # auxiliary variables in calculation in <N> 
           i, j, j2, l;     # loop variables

    p := N.field.char;
    if p = 2  then
        return CentralStepIdentifyRationalClasses2Group
                   ( source, range, N, candidates, C, galoisGroup );
    fi;

    # <h> is the common image  of <candidates> under the natural homomorphism
    # onto <range>.
    h := FactorAgWord( candidates[ 1 ], range.identity );

    newRepresentatives := [  ];
    newCentralizers    := [  ];
    newGaloisGroups    := [  ];
    order              := Order( range, h );
    h                  := FactorAgWord( h, source.identity );
    newOrder           := Order( source, h );
    if newOrder = 1  then

        # Special case: <h> is trivial.
        trivialGaloisGroup                   := GroupPrimeResidues(1);
        trivialGaloisGroup.genimage          := source.identity;
        trivialGaloisGroup.generatingResidue := 1;
        galoisGroup                          := TrivialSubgroup
                                             (GroupPrimeResidues(p));
        galoisGroup.genimage                 := source.identity;
        galoisGroup.generatingResidue        := 1;
	transversal := [  ];
	exponents   := [  ];

	# Normalize the elements of the vector space <N>.
	for i  in [ 1 .. Length( candidates ) ]  do
	    if candidates[ i ] = source.identity  then
		weight := 1;
	    else
		weight := ExponentsAgWord( candidates[ i ] )
					 [ Depth( candidates[ i ] ) ];
	    fi;
	    newRepresentatives[ i ] := candidates[ i ] ^
				       ( 1 / weight mod p );
	    newCentralizers   [ i ] := source;
	    transversal       [ i ] := source.identity;
	    exponents         [ i ] := weight;
	od;

	for k  in candidates  do
	    if k = source.identity  then
		Add( newGaloisGroups, trivialGaloisGroup );
	    else
		Add( newGaloisGroups, galoisGroup );
	    fi;
	od;

    else

        # Calculate $[ h, pC ]$ where <pC> is the preimage of <C> and find  a
        # complement <K>= <cg>.baseComplement to $[ h, pC ]$ in <N>.
        Q := [  ];
        for i  in [ 1 .. Length( Cgs( C ) ) ]  do
            exp  := Exponents
                ( N,
                  Comm( h, FactorAgWord( C.cgs[ i ], source.identity ) ),
                  N.field );
            Add( Q, exp );
        od;
        N.subspace := SubspaceVectorSpaceAgGroup( N, Q );
        r := Length( N.subspace.baseComplement );

        # Calculate the centralizer of <h>.
        tmp := [  ];
        for i  in [ N.subspace.commutator + 1 .. 
                    N.subspace.commutator + N.subspace.centralizer ]  do
            v := N.subspace.matrix[ i ];
            g := range.identity;
            for j  in [ N.subspace.dimensionN + 1 ..
                        N.subspace.dimensionN + N.subspace.dimensionC ]
                do
                z := IntVecFFE( v, j );
                if z <> 0  then
                    g := g * C.cgs[ j - N.subspace.dimensionN ] ^ z;
                fi;
            od;
            tmp[ i - N.subspace.commutator ] :=
                FactorAgWord( g, source.identity );
        od;
        Append( tmp, N.cgs );
        centralizer := AgSubgroup( Parent( source ), tmp, false );

        # Construct the group $Z_o( h )^ * $ as  extension of $Z_o( hN )^ * $
        # by the normal subgroup $\{1, o( h ) + 1, ...\}$ ( i.e. prolong  the
        # ag generating system ) and get the preimage of Gal( <hN> ).
        prcg     := GroupPrimeResidues( newOrder );
        preimage := AgSubgroup( prcg, Concatenation
            ( List( Cgs( galoisGroup ), gen ->
                    FactorAgWord( gen, prcg.identity ) ), 
              prcg.generators
                  { [ Length( Parent( galoisGroup ).generators ) + 1 .. 
                      Length( prcg.generators ) ] } ),
              true );

        # If <K> is trivial, there is only the rational class of <h>.
        if r = 0  then
	    representatives := List( candidates, c -> N.identity );
	    exponents       := List( candidates, c -> 1 );
	    transversal := CentralStepConjugatingElement
		( source, C, N, h, 
		  List( candidates, c -> h mod c ),
		  List( candidates, c -> N.identity ),
		  exponents,
		  List( candidates, c -> range.identity ) );
	    stabilizers     := List( candidates, c -> preimage );

        else

            # Since <K>  is  non-trivial, get the action of the generators of
            # <preimage> on <K>.
            K := N.field ^ r;
            genimages := [  ];

            # Construct the affine mapping x -> x /  g +  v / g for the first
            # generator.
            if preimage.cgs <> [  ]  then
                inv := ResidueAgWord( preimage, preimage.cgs[ 1 ] );
                v := Exponents( N,
    	    	    	        h ^ inv mod h ^ FactorAgWord
    	    	    	    	  ( galoisGroup.genimage, source.identity ),
    	    	    	        N.field ) * N.subspace.projection;
                inv := ( inv * N.field.one ) ^ -1;
                genimages[ 1 ] := STMapping( K, inv, inv * v );
            fi;

            # All other generators  are powers of the first since  the Galois
            # group is cyclic.
            for j  in [ 2 .. Length( preimage.cgs ) ]  do
                genimages[ j ] := genimages[ j - 1 ] ^ RelativeOrderAgWord
                  ( preimage.cgs[ j - 1 ] );
            od;

            orbits := OrbitsVectorSpace( preimage, genimages, K, false,
    	    	    	  true );

            # Get the  canonical  representatives of  the candidates  as  the
            # first elements of the corresponding orbits.
	    representatives := [  ];
	    stabilizers     := [  ];
	    exponents       := [  ];
	    conjElms        := [  ];
	    for i  in [ 1 .. Length( candidates ) ]  do
		exp := Exponents( N, h mod candidates[ i ], N.field ) *
			   N.subspace.projection;
		j := 0;
		repeat
		    j := j + 1;
		    pos := Position( orbits.orbits[ j ], exp );
		until pos <> false;
    	    	representatives[ i ] := N.identity;
		for ll  in [ 1 .. Length( orbits.representatives[ j ] ) ]  do
		    z := IntVecFFE( orbits.representatives[ j ], ll );
		    if z <> false  then
			representatives[ i ] := representatives[ i ]
			    * Cgs(N)[N.subspace.baseComplement[ll]]^z;
		    fi;
		od;     
		stabilizers    [ i ] := orbits.stabilizers    [ j ];
		exponents      [ i ] := ResidueAgWord( preimage, 
		    orbits.transversals[ j ][pos] ^ -1 );
		conjElms       [ i ] := galoisGroup.genimage ^
		    LogMod( exponents[ i ],
			    galoisGroup.generatingResidue,
			    order );
	    od;

        fi;

        # If <R> is a set of representatives of the orbits then <hR> is a set
        # of representatives of the rational classes in <hN>.
	res := [  ];
        for l  in [ 1 .. Length( representatives ) ]  do
	    k := representatives[ l ];

            # Get  the Galois group of <hr>  as the  stabilizer of the vector
            # <r>.
            newGaloisGroup := stabilizers[ l ];
            if Cgs( newGaloisGroup ) = [  ]  then
                newGaloisGroup.generatingResidue := 1;
            else
                newGaloisGroup.generatingResidue := ResidueAgWord( prcg, 
                  newGaloisGroup.cgs[ 1 ] );
            fi;
	    res[ l ] := newGaloisGroup.generatingResidue;
            Add( newRepresentatives, h * k          );
            Add( newCentralizers   , centralizer    );
            Add( newGaloisGroups   , newGaloisGroup );
        od;

	# Find the elements that conjugate <hk> to <hk>^<l>.
        genimages := CentralStepConjugatingElement
	    ( source, C, N, h,
	      representatives,
	      representatives,
	      res,
	      List( res, r -> galoisGroup.genimage ^ LogMod
		  ( r, galoisGroup.generatingResidue, order ) ) );
	for l  in [ 1 .. Length( representatives ) ]  do
	    newGaloisGroups[ l ].genimage := genimages[ l ];
	od;

        # Finally construct the transversal in the case <r> <> 0.
        if r <> 0  then
            transversal := CentralStepConjugatingElement
                ( source, C, N, h, 
                  List( candidates, c -> h mod c ),
                  representatives,
                  exponents,
                  conjElms );
        fi;

    fi;

    return rec( representatives := newRepresentatives, 
		transversal     := transversal       ,
		exponents       := exponents         ,
		centralizers    := newCentralizers   , 
		galoisGroups    := newGaloisGroups   );

end;

#############################################################################
##
#F  SortRationalClasses( <rationalClasses>, <p> ) . .  sort a list of classes
##
##  Sort the classes according to increasing  order, then decreasing <p>-part
##  of centralizer order, then decreasing <p>-part of Galois group order.
##
SortRationalClasses := function( rationalClasses, p )
    Sort( rationalClasses, function( cl1, cl2 )
        local  ppart;
        if cl1.order < cl2.order  then
            return true;
        elif cl1.order > cl2.order  then
            return false;
        else
            ppart := 1;
            while Size( cl1.centralizer ) mod ( ppart * p ) = 0  do
                ppart := ppart * p;
            od;
            if Size( cl2.centralizer ) mod ppart <> 0  then
                return true;
            elif Size( cl2.centralizer ) mod ( ppart * p ) = 0  then
                return false;
            else
                ppart := 1;
                while Size( cl1.galoisGroup ) mod ( ppart * p ) = 0  do
                    ppart := ppart * p;
                od;
                return Size( cl2.galoisGroup ) mod ppart <> 0;
            fi;
        fi;
      end );
    return rationalClasses;
end;

#############################################################################
##

#F  RationalClassesPAgGroup( <G>, <reps>, <flag> )  . rational classes of <G>
##
##  This function determines the rational classes of a <p>-group <G> given by
##  an AG-presentation which corresponds to  a central  series  of <G>.   The
##  Galois groups of the rational classes are also determined.
##
RationalClassesPAgGroup := function( arg )
    local  G, H,            # group and supergroup, arguments
           powertree,       # flag whether also to calculate the power tree
           rationalClasses, # rational classes of <G>, result
           trickHom,        # tricky isomorphism if <G> is no parent group
           Iso,             # isomorphism of <G> according to central series
	   centralSeries,   # central series for <G>
           dimensions,      # dimensions of elementary abelian factors in <G>
	   m, oldm,         # loop vars in calculation of <centralSeries>
           p,               # prime and composition length of <G> 
           prcg,            # trivial prime residue class group
           source, range,   # factor groups by elements of central series 
           N,               # kernel of natural homomorphism
                            # <source> -> <range> 
           representatives, #\ 
           centralizers,    # }rational classes in <range> 
           galoisGroups,    #/ 
        newRepresentatives, # representatives of the classes in <source>
           candidates,      # candidates whose canonical reps is asked for
           transversal,     # elements conjugating candidates to certain
                            # powers of their canonical representatives
           exponents,       # these certain powers
           candRange,       # image of one candidate in <range>
           nextInd,         # indices of next candidates to be treated
           nextSet,         # next candidates to be treated
           ind,             # position of a candidate in <nextSet>
           powers,          # position of <p>-th power of a class in list
           power,           # auxiliary variable in calculation of <powers> 
           new,             # result of central step calculation
           galgenerators,   #\auxiliary variables in Galois group conversion
           exp, rep,        #/and class construction
           order,           # order of a class
           gen, i, j, l,    # loop variables
           step, r, cl;

    # Get the arguments.
    G := arg[ 1 ];
    if Length( arg ) = 2  and  IsList( arg[ 2 ] )  then
        candidates := ShallowCopy( arg[ 2 ] );
        i := 3;
    else
        i := 2;
    fi;
    if Length( arg ) >= i  then
        powertree := arg[ i ];
    else
        powertree := false;
    fi;

    # Make sure that <G> is a parent group (otherwise 'FactorAgWord' will not
    # work properly).
    if not IsParent( G )  then
        G        := G / TrivialSubgroup( G );
        trickHom := G.naturalHomomorphism;
        if IsBound( candidates )  then
            candidates := List( candidates, c -> c ^ trickHom );
        fi;
    else
        trickHom := IdentityMapping( G );
    fi;

    # Treat the trivial case.
    if G.generators = [  ]  then
        cl := RationalClass( G, G.identity, G,
                             GroupPrimeResidues( 1 ) );
        if IsBound( candidates )  then
            return List( candidates, c -> cl );
        fi;
        if powertree  then
            cl.power := cl;
        fi;
        cl.isCentral := true;
        return [ cl ];
    fi;

    # Calculate a central series with elementary abelian factors for <G>.
    if Length( Set( FactorsInt( Size( G ) ) ) ) > 1  then
        Error( "<G> must be a <p>-group" );
    fi;
    p             := RelativeOrderAgWord( G.generators[ 1 ] );  
    Iso 	  := IdentityMapping( G );
    centralSeries := [ TrivialSubgroup( G ) ];
    dimensions    := [  ];
    m 		  := Length( G.cgs );
    while m > 0  do
	oldm := m;
	while	  m > 0
	      and Depth( G.cgs[ m ] ^ p ) > oldm
	      and ForAll( G.cgs{ [ 1 .. m - 1 ] },
		  gen -> Depth( Comm( G.cgs[ m ], gen ) ) > oldm )  do
	    m := m - 1;
	od;
	if m = oldm  then
	    InfoClasses1( "#I  Calculating <p>-central series for <G>\n" );
	    Iso := IsomorphismAgGroup( PCentralSeries( G, p ) );
     
            # This  nasty  trick is  due  to the  new  concept of *normalized
            # structures*.
            Iso.source := G;
     
	    if not IsParent( trickHom.source )  then
		trickHom.source.pCentralSeries := [  ];
		trickHom.source.pCentralSeries[ p ] := List
		    ( G.pCentralSeries[ p ], g -> PreImage( trickHom, g ) );
	    fi;
	    G := Iso.range;
	    dimensions := [  ];
	    m := 1;
	    for step  in [ 1 .. Length( Iso.source.pCentralSeries[ p ] )
				- 1 ]  do
		dimensions[ step ] :=
		    Length( Iso.source.pCentralSeries[ p ][ step ].cgs ) -
		    Length( Iso.source.pCentralSeries[ p ][ step + 1 ].cgs );
		centralSeries[ step ] := AgSubgroup( G,
		    G.cgs{ [ m .. Length( G.cgs ) ] },
		    true );
		m := m + dimensions[ step ];
	    od;
	    if IsBound( candidates )  then
		candidates := List( candidates, c -> c ^ Iso );
	    fi;
	    m := 0;
	else
	    centralSeries := Concatenation
		( [ AgSubgroup( G,
		    G.cgs{ [ m + 1 .. Length( G.cgs ) ] },
		    true ) ],
		  centralSeries );
	    dimensions := Concatenation( [ oldm - m ], dimensions );
	fi;
    od;
    InfoClasses1( "#I  Going down a chain with dimensions ", dimensions,
		  "\n" );

    # Initialize the algorithm for the trivial group.
    source := G / G;
    prcg   := GroupPrimeResidues( 1 );
    if IsBound( candidates )  then
        representatives := List( candidates, c -> source.identity );
        transversal     := List( candidates, c -> source.identity );
        exponents       := List( candidates, c -> 1 );
        centralizers    := List( candidates, c -> source );
        galoisGroups    := List( candidates, c -> prcg );
        powers          := [  ];
    else
        representatives := [ source.identity ];
        centralizers    := [ source ];
        galoisGroups    := [ prcg ];
        powers          := [ 1 ];
    fi;

    # Now go back through the factors by all groups in the central series.
    for step  in [ 1 .. Length( dimensions ) ]  do
        range  := source;
        if step = Length( dimensions )  then
            source := G;
        else
            source := G / centralSeries[ step + 1 ];
        fi;
        N := AgSubgroup( source, Cgs( source )
                 { [ Length( source.cgs ) - dimensions[ step ] + 1 ..
		     Length( source.cgs ) ] }, true );
        N.field := GF( p );
        if IsBound( candidates )  then

            # If  the task  is to  find  canonical  representatives  of  some
            # candidates, update the representatives.
            newRepresentatives := [  ];

            # Conjugate the candidates as far as already known.
            for i  in [ 1 .. Length( candidates ) ]  do
                candidates[ i ] := ( candidates[ i ] ^
                    FactorAgWord( transversal[ i ], G.identity ) ) ^
                    ( 1 / exponents[ i ] mod Order( G, candidates[ i ] ) );
                newRepresentatives[ i ] := FactorAgWord( candidates[ i ],
                                                         source.identity );
            od;

            for candRange  in Set( representatives )  do
                nextInd := Filtered( [ 1 .. Length( candidates ) ], x ->
                               representatives[ x ] = candRange );
                nextSet := Set( newRepresentatives{ nextInd } );
                new := CentralStepIdentifyRationalClassesPGroup
                    ( source,
                      range,
                      N,
                      nextSet,
                      centralizers[ nextInd[ 1 ] ],
                      galoisGroups[ nextInd[ 1 ] ] );
                for i  in [ 1 .. Length( nextInd ) ]  do
                    ind := PositionSorted( nextSet,
                        newRepresentatives[ nextInd[ i ] ] );
                    newRepresentatives[ nextInd[ i ] ] :=
                         new.representatives[ ind ];
                    transversal [ nextInd[ i ] ] := new.transversal [ ind ];
                    exponents   [ nextInd[ i ] ] := new.exponents   [ ind ];
                    centralizers[ nextInd[ i ] ] := new.centralizers[ ind ];
                    galoisGroups[ nextInd[ i ] ] := new.galoisGroups[ ind ];
                od;
            od;
            representatives := newRepresentatives;

        else

            # Otherwise  pull back  the  rational  classes  from  <range>  to
            # <source>.
            new := [  ];
            for i  in [ 1 .. Length( representatives ) ]  do
                new[ i ] := CentralStepRationalClassesPGroup
                    ( source, 
                      range, 
                      N, 
                      representatives[ i ], 
                      centralizers   [ i ], 
                      galoisGroups   [ i ] );
                if powertree  then
                    power := RationalClass( source,
                                 new[ i ].representatives[ 1 ] ^ p );
                    new[ i ].power := Sum
                        ( new{ [ 1 .. powers[ i ] - 1 ] }, 
                        r -> Length( r.representatives ) ) + 
                        PositionProperty( new[ powers[ i ] ].representatives,
                        r -> r in power );
                fi;
            od;

            representatives := [  ];
            centralizers    := [  ];
            galoisGroups    := [  ];
            powers          := [  ];
            for r  in new  do
                for i  in [ 1 .. Length( r.representatives ) ]  do
                    Add( representatives, r.representatives[ i ] );
                    Add( centralizers   , r.centralizers   [ i ] );
                    Add( galoisGroups   , r.galoisGroups   [ i ] );
                    if powertree  then
                      Add( powers       , r.power             );
                    fi;
                od;
            od;

        fi;
    od;

    # The final  values are the correct ones.  Construct the rational classes
    # from them.
    rationalClasses := [  ];
    for i in [ 1 .. Length( representatives ) ] do
        rep := PreImagesRepresentative( trickHom,
               PreImagesRepresentative( Iso, representatives[ i ] ) );

        # For class identification, return only the representatives.
        if IsBound( candidates )  then
            rationalClasses[ i ] := rep;

        else
            rationalClasses[ i ] := RationalClass
                ( trickHom.source,
                  rep,
                  PreImage( trickHom,
                  PreImage( Iso, centralizers[ i ] ) ),
                  galoisGroups[ i ] );
            if powers <> [  ] then
                rationalClasses[ i ].power := rationalClasses[ powers[ i ] ];
            fi;
            if ForAll( trickHom.source.generators,
                       gen -> gen ^ rep = gen )  then
                rationalClasses[ i ].isCentral := true;
            fi;
        fi;
    od;
    if not IsBound( candidates )  then
	InfoClasses1( "#I  ", Length( rationalClasses ),
		      " rational classes\n" );
    fi;

    return rationalClasses;

end;

#############################################################################
##
#F  RationalClassesElementaryAbelianSubgroup( <G>, <E> )  .  rational classes
##
RationalClassesElementaryAbelianSubgroup := function( G, E )
    local  p,  prcg,  orbits,  rationalClasses,  i,  rep;

    rationalClasses := [ RationalClass
        ( G, G.identity, G, GroupPrimeResidues( 1 ) ) ];
    rationalClasses[ 1 ].power := rationalClasses[ 1 ];

    # Treat the trivial case.
    if IsTrivial( E )  then
        return rationalClasses;
    fi;

    p       := RelativeOrderAgWord( Cgs( E )[ 1 ] );
    E.field := GF(p);
    prcg    := GroupPrimeResidues( p );
    if IsAgGroup( G )  then
	orbits := OrbitsVectorSpace( G, Cgs( G ), E, true, false );
    else
    	orbits := OrbitsVectorSpace( G, E, true, false );
    fi;

    # Construct the rational classes  from the  orbit representatives and the
    # centralizers from the stabilizers.
    for i  in [ 2 .. Length( orbits.representatives ) ]  do
        rep := orbits.representatives[ i ];
    	if not IsAgGroup( G )  then
    	    rep := rep ^ E.bijection;
    	fi;
        if p = 2  then
            rationalClasses[ i ] := RationalClass
                ( G,
                  rep,
                  Subgroup( Parent( G ), Centralizer
                      ( orbits.stabilizers[ i ], rep ).generators ),
                  prcg );
        else
            rationalClasses[ i ] := RationalClass
                ( G,
                  rep,
                  Subgroup( Parent( G ), Centralizer
                      ( orbits.stabilizers[ i ], rep ).generators ),
                  Subgroup( prcg, [ prcg.generators[ 1 ] ^
                      orbits.galoisIndices[ i ] ] ) );
        fi;
	rationalClasses[ i ].isCentral := true;
        rationalClasses[ i ].power := rationalClasses[ 1 ];
    od;

    return rationalClasses;

end;

#############################################################################
##
#F  FusionRationalClassesPSubgroup( <H>,<rationalClasses> ) fusion of classes
##
##  This function determines  the action of <H>  on the set <rationalClasses>
##  of rational  classes in  a normal p-subgroup  <P>  of <H>  and  returns a
##  transversal for this action. Either <H> is an ag group and <P> a subgroup
##  of <H> or <H> is a perm group such that the image of '<P>.bijection' is a
##  subgroup of <H>.
##
FusionRationalClassesPSubgroup := function( H, P, rationalClasses )
    local  p,  representatives,  classreps,  classimages,
    	   genimages,  gen,  prm,  i,  fusionGroup,  orbits,
           fusedClasses,  cl,  pos,  porb;

    if rationalClasses = [  ]  then
    	return rationalClasses;
    fi;

    P := ShallowCopy( P );
    if IsTrivial( P )  then
    	return rationalClasses;
    fi;
    p := RelativeOrderAgWord( Cgs( P )[ 1 ] );

    # If <H> is a perm group, use a bijection from <P> to a subgroup of <H>.
    if IsAgGroup( H )  then
    	P.bijection := IdentityMapping( P );
    fi;

    if Size( H ) > Size( P )  then

        # Construct the fusing operation of the group <H>.
        InfoClasses1( "#I  Identifying classes for pre-fusion\n");
        representatives := List( rationalClasses, cl ->
            cl.representative ^ P.bijection );
        classreps := [  ];
        for gen  in H.generators  do
            Append( classreps, List( representatives, r -> 
                PreImagesRepresentative( P.bijection, r ^ gen ) ) );
        od;
        classimages     := RationalClassesPAgGroup( P, classreps );
        genimages       := [  ];
        representatives := List( rationalClasses, Representative );
        for i  in [ 1 .. Length( H.generators ) ]  do
            prm := List( [ 1 + ( i - 1 ) * Length( rationalClasses )
                           ..        i   * Length( rationalClasses ) ],
                   x -> Position( representatives, classimages[ x ] ) );
            Add( genimages, PermList( prm ) );
        od;
        fusionGroup := Group( genimages, () );
        orbits := Orbits
            ( fusionGroup,
              [ 1 .. Length( rationalClasses ) ] );
        fusedClasses := rationalClasses{ List( orbits, orb -> orb[ 1 ] ) };

        # Update the '.isCentral' and '.power' entries.
        porb := [  ];
        for i  in [ 1 .. Length( fusedClasses ) ]  do
    	    if IsBound( fusedClasses[ i ].isCentral )  then
    	    	fusedClasses[ i ].isCentral := true;
    	    fi;
            pos := Position( representatives,
                             fusedClasses[ i ].power.representative );
            porb[ i ] := PositionProperty( orbits, o -> pos in o );
        od;
        for i  in [ 1 .. Length( fusedClasses ) ]  do
            fusedClasses[ i ].power := fusedClasses[ porb[ i ] ];
        od;

        rationalClasses := fusedClasses;

    fi;

    return rationalClasses;

end;

#############################################################################
##
#F  RationalClassesAgGroup( <G> [, <primes>] ) rational classes for ag groups
##
RationalClassesAgGroup := function( G )
    return GroupOps.RationalClasses( G );
end;

#############################################################################
##
#F  RationalClassesPermGroup(<G>[,<primes>]) rational classes for perm groups
##
RationalClassesPermGroup := function( arg )
    local  G,  primes,       # group and list of primes, arguments
           rationalClasses,  # rational classes of <G > , result
           p,                # next (largest) prime to be processed
           pRationalClasses, # rational classes of <p >-elements in <G> 
           pClass,           # one class from <pRationalClasses > 
           z, r,             # <z> is the repr. of <pClass> of order <p>^<r>
           C,                # the centralizer of <z> in <G> 
           Hom,              # block homomorphism determined by the cycles
                             # of <z> 
           C_,               # image of <C> under <Hom> 
           rationalClasses_, # rational classes in <C_> 
           found,            # classes whose preimages are already found
           pos,              # position of class among constructed classes
           class_,           # one class from <rationalClasses_> 
           y_, t,            # <y_> is the repr. of <class_> of order <t> 
           y,                # preimage of <y_> that is a root of <z> 
           s, rs, a, b, gcd, # auxiliary variables in the calculation of <y> 
           class,            # class to be constructed from <y> 
           prcg,             # prime residue class group modulo $p ^ rt$
           m,                # generator of the cyclic Galois group of <z> 
           g,                # element inducing the conjugation corr. to <m> 
	   conj,             # result of conjugacy test $Hom(y^g)$ to $y_^m$
           exp,              # auxiliary variable in the calculation with <m> 
           i, j, k, l, cl;   # loop variables
      
    # Get the arguments.
    G := arg[ 1 ];
    if Length( arg ) = 2  then
        primes := arg[ 2 ];
    else
        primes := Reversed( Set( FactorsInt( Size( G ) ) ) );
    fi;

    # Treat the trivial case.
    rationalClasses := [ RationalClass( G, G.identity, G, 
        GroupPrimeResidues( 1 ) ) ];
    if IsTrivial( G )  then
        return rationalClasses;
    fi;
    
    for k  in [ 1 .. Length( primes ) ]  do
        p := primes[ k ];
        if Size( G ) mod p = 0  then
            if k = Length( primes )  then
                pRationalClasses := RationalClassesPElements( G, p,
                                        Sum( rationalClasses, Size ) );
            else
                pRationalClasses := RationalClassesPElements( G, p );
            fi;
            Append( rationalClasses, pRationalClasses );
            if k < Length( primes )  then
                if p = 2  then
                    Error( "case p = 2 not yet implemented" );
                fi;
                for pClass  in pRationalClasses  do
                    z := pClass.representative;
                    C := pClass.centralizer;
                    r := LogInt( Order( G, z ), p );

                    # Set  up the  blocks homomorphism  C  -> C_ and find the
                    # rational classes in C_.
                    Hom := OperationHomomorphism
                        ( C,
                          Operation( C, List( Cycles( z, 
                              G.operations.MovedPoints( G ) ), Set ),
                              OnSets ) );
                    C_ := Hom.range;
                    rationalClasses_ := RationalClassesPermGroup
                        ( C_, primes{ [ k + 1 .. Length( primes ) ] } );

                    # Pull  back the rational classes and  the  Galois groups
                    # from C_ to C.
                    InfoClasses2( "#I  Lifting back from |C_| = ",
                        Size( C_ ), " to |G| = ", Size( G ), "\n" );
                    found := [  ];

                    # Ignore the trivial class.
                    for i  in [ 2 .. Length( rationalClasses_ ) ]  do
                        if not i in found  then
                            class_ := rationalClasses_[ i ];
                            y_ := class_.representative;
                            t := Order( C_, y_ );

                            # Find a preimage of <y_> that  really  is a root
                            # of <z>.
                            y     := PreImagesRepresentative( Hom, y_ );
                            s     := LogInt( Order( C, y ), p );
                            rs    := Maximum( r, s );
                            gcd   := Gcdex( t, p ^ rs );
                            a     := gcd.coeff1;
                            b     := gcd.coeff2;
                            y     := y ^ ( b * p ^ rs ) * z ^ a;
                            class := RationalClass( G, y );
                            class.centralizer := Centralizer
				( PreImage( Hom, class_.centralizer ), y );

                            # Let  <g> be an element which induces  an  inner
                            # automorphism on <z> representing the generating
                            # residue of  the Galois group of <z>.   Find the
                            # smallest power $g^i$ such that Hom( $y^{g^i}$ )
                            # is  rationally conjugate to Hom(  <y> ).   Then
                            # $g^i$ times  a cofactor is the generator of one
                            # direct factor of the Galois  group of <y>.  All
                            # preimages of elements Hom(  $y^{g^j}$ ) with $j
                            # < i$ are rationally conjugate to <y>.
			    g := G.identity;
			    m := pClass.galoisGroup.identity;
                            if not IsTrivial( pClass.galoisGroup )  then
	 			repeat
				    g  := g * pClass.fusingElement;
				    m  := m * Cgs( pClass.galoisGroup )[ 1 ];
				    cl := RationalClass( C_,
							 ( y ^ g ) ^ Hom );
				    pos := i - 1;
				    repeat
					pos := pos + 1;
					conj := PermGroupOps.RepresentativeConjugationRationalClasses
						( cl,
						  rationalClasses_[ pos ] );
				    until conj <> false;
				    AddSet( found, pos );
				until pos = i;
			    else
				cl   := class_;
				conj := G.identity;
                            fi;

                            # Now Hom( $y^{g^i}$ ) is conjugate  to Hom(  <y>
                            # )^<l> for some <l>.  The Galois group of <y> is
                            # the direct product of $Gal( Hom( y ) )$ and the
                            # subgroup generated by $ml$.
                            prcg := GroupPrimeResidues( p ^ r * t );
                            exp  := ExponentsAgWord( m );
                            j    := Position( prcg.generators, 
                                        prcg.factorGenerators
                                        [ Length( prcg.factors ) ] ) - 1;
                            g    := prcg.identity;
                            for l  in [ 1 .. Length( exp ) ]  do
                                g := g * prcg.generators[ j + l ] ^ exp[ l ];
                            od;
                            g := g * FactorAgWord( AgWordResidue
                                ( class_.galoisGroup, First
                                ( [ 1 .. t - 1 ], e -> GcdInt( e, t ) = 1
                                  and cl.representative ^ conj =
                                      class_.representative ^ e ) ),
                                prcg.identity );
                            if class_.galoisGroup.generators = [  ]  then
                                class.galoisGroup := Subgroup( prcg, [ g ] );
                            else
                                class.galoisGroup := Subgroup( prcg,
                                    Concatenation
                                    ( List( class_.galoisGroup.generators,
                                      gen -> FactorAgWord( gen,
                                                           prcg.identity ) ),
                                      [ g ] ) );
                            fi;

                            Add( rationalClasses, class );
                        fi;
                    od;
                od;
            fi;
        fi;
    od;
    return rationalClasses;
end;

#############################################################################
##
#F  RationalClassesPElements( <G>, <p> )  . .  rational classes of p-elements
##
RationalClassesPElements := function( arg )
    local  G,               # the group
           p,               # the prime
           sumSizes,        # sum of all class lengths known so far, optional
           rationalClasses, # rational classes of <p>-elements, result
           S, S1,           # Sylow <p> subgroup of <G> as perm and ag group
	   gen,             # generator of <S> in the cyclic case
           N, N1,           # solvable subgroup of N_G(S), perm and ag group
           rationalClasses1,# rational <S1>-classes under conjugation by <N1>
           rationalSClasses,# rational <S>-classes under conjugation by <N>
    	   all, sub,        # subset of classes invariant under normalizer
           class,           # class to be processed
           list,            # list of class indices for order of treatment
           roots,           # list of indices of roots of a class
           found,           # classes already found
           movedTo,         # list of new positions of fused classes
           divisors,        # divisors of group order, for solvability tests
           i, j, cl;        # loop variables
    
    # Get the arguments.
    G := arg[ 1 ];
    p := arg[ 2 ];
    if Length( arg ) > 2  then
        sumSizes := arg[ 3 ];
    else
        sumSizes := -1;
    fi;
    
    InfoClasses2( "#I  Calculating ", p, " Sylow subgroup of |G| = ", 
	Size( G ), "\n" );
    S := SylowSubgroup( G, p );
    S.isNilpotent := true;

    # Treat the cyclic case.
    if IsCyclic( S )  then

	# Find a generator that generates the whole cyclic group.
	if IsTrivial( S )  then
	    gen := S.identity;
	else
	    gen := First( S.generators, gen -> Order( S, gen ) = Size( S ) );
	fi;

        rationalClasses := [ RationalClass( G, G.identity, G, 
            GroupPrimeResidues( 1 ) ) ];
        rationalClasses[ 1 ].fusingElement := G.identity;
        j := LogInt( S.size, p );
        for i  in [ 1 .. j ]  do

            class := RationalClass
                ( G,
                  gen ^ ( p ^ ( j - i ) ),
                  S, 
                  TrivialSubgroup( GroupPrimeResidues( p ^ i ) ) );
            class.centralizer := Centralizer( G, class.representative );
            CompleteGaloisGroupPElement( G, class, rationalClasses[ i ], p );
            rationalClasses[ i + 1 ] := class;
        od;
        return rationalClasses{ [ 2 .. j + 1 ] };
    fi;

    N := Normalizer( G, S );
    divisors := Set( FactorsInt( Index( N, S ) ) );
    if    not 2 in divisors         # Feit, Thompson
       or Length( divisors ) <= 2   # Burnside's solvability theorem
       or Index( N, S ) mod ( divisors[ 1 ] * divisors[ 1 ] ) <> 0  then
        	    	    	    # Burnside's transfer theorem
        N.isSolvable := true;
    fi;
    
    if IsBound( N.isSolvable )  and  N.isSolvable  then
	InfoClasses2( "#I  Converting to ag group\n" );
	N1 := AgGroup( N );
        S1 := SylowSubgroup( N1, p );
    	S1.bijection := N1.bijection;
    else
    	S1 := AgGroup( S );
    fi;    	

    if     IsElementaryAbelian( S1 )
       and IsBound( N.isSolvable )
       and N.isSolvable  then
        rationalClasses1 := RationalClassesElementaryAbelianSubgroup
                            ( N1, S1 );
    else
	InfoClasses2("#I  Calculating rational classes in Sylow subgroup\n");
	rationalClasses1 := RationalClassesPAgGroup( S1, true );

	# Fuse the classes with the Sylow normalizer.
        if IsBound( N.isSolvable )  and  N.isSolvable  then
	    rationalClasses1 := FusionRationalClassesPSubgroup
				    ( N1, S1, rationalClasses1 );
	else
	    rationalClasses1 := FusionRationalClassesPSubgroup
				    ( N, S1, rationalClasses1 );
	fi;

    fi;

    # Now convert the classes to classes in the perm group <G>.
    rationalSClasses := [  ];
    for cl  in rationalClasses1  do 
        class := RationalClass( G, cl.representative ^ S1.bijection, 
                     Image( S1.bijection, cl.centralizer ) );
        class.galoisGroup := SylowSubgroup( cl.galoisGroup, p );
        class.centralizer.size := Size( cl.centralizer );
    	class.power := RationalClass( G,
    	    cl.power.representative ^ S1.bijection,
    	    Image( S1.bijection, cl.power.centralizer ) );
        class.power.galoisGroup := SylowSubgroup( cl.power.galoisGroup, p );
        if IsBound( cl.fusingElement )  then
            class.fusingElement := cl.fusingElement ^ S1.bijection;
        fi;
        if IsBound( cl.isCentral )  then
            class.isCentral := true;
        fi;
	Add( rationalSClasses, class );
    od;

    # Sort the  classes.  Change the  '.group'   entries to <G>   and the
    # '.power' entries   so  that they  contain  the index  of  the power
    # class.
    SortRationalClasses( rationalSClasses, p );
    for cl  in rationalSClasses  do
	cl.group := G;
	cl.power := PositionProperty( rationalSClasses, 
	    c -> c.representative = cl.power.representative );
    od;
    InfoClasses1( "#I  ", Length( rationalSClasses ), " classes to fuse\n" );

    # Determine the order in which to process the <S>-classes.
    InfoClasses2( "#I  Determining fusion\n" );
    list  := [ 1 ];
    roots := [ [  ] ];
    ConstructList( rationalSClasses, list, roots, 1 );
    found   := [ 1 ];
    movedTo := [ 1 ];
    rationalClasses := [ RationalClass( G, G.identity, G, 
      GroupPrimeResidues( 1 ) ) ];
    rationalClasses[ 1 ].fusingElement := G.identity;

    # Make <G>-classes out of the <N>-classes, putting them in a new list.
    j := 1;
    while     j < Length( list )
          and sumSizes < G.size  do
        j := j + 1;
        if not list[ j ] in found  then
            class := ShallowCopy( rationalSClasses[ list[ j ] ] );

            # If the class is  central, since we  have already considered the
            # Sylow  normalizer, it will not fuse to any other central class,
            # so it can be added to the list.
            if IsBound( class.isCentral )  then
                i := Length( rationalClasses ) + 1;
            else
                i := 1;
            fi;

            while     i <= Length( rationalClasses )
                  and class <> rationalClasses[ i ]  do
                i := i + 1;
            od;
            movedTo[ list[ j ] ] := i;
            if i > Length( rationalClasses )  then
                class.centralizer := PermGroupOps.Centralizer
                    ( G,
                      class.representative, 
                      class.centralizer );
                rationalClasses[ i ] := class;
                if sumSizes >= 0  then
		    sumSizes := sumSizes + Size( class );
		    InfoClasses1( "#I  Still missing ", G.size-sumSizes,
				  " elements\n" );
                fi;
            else
                UniteSet( found, roots[ j ] );
            fi;
        fi;
    od;

    # Update  the '.power' entries according  to  the  new  positions  of the
    # classes and complete the Galois groups.
    for j  in [ 2 .. Length( rationalClasses ) ]  do
        rationalClasses[ j ].powers      := [  ];
        rationalClasses[ j ].powers[ p ] := rationalClasses[ movedTo
          [ rationalClasses[ j ].power ] ];
        Unbind( rationalClasses[ j ].power    );
        Unbind( rationalClasses[ j ].isCentral );
        CompleteGaloisGroupPElement( G, rationalClasses[ j ], 
          rationalClasses[ j ].powers[ p ], p );
    od;

    return rationalClasses{ [ 2 .. Length( rationalClasses ) ] };
end;

#############################################################################
##
#E  Emacs variables . . . . . . . . . . . . . . . . . . local emacs variables
##  Local Variables:
##  mode:             outline-minor
##  outline-regexp:   "#[AEFTV]"
##  fill-column:      77
##  eval:             (hide-body)
##  End:

