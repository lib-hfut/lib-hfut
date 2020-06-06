#############################################################################
##
#A  agclass.g                   GAP library                    J\"urgen Mnich
##
#A  @(#)$Id: agclass.g,v 3.17.1.1 1995/06/26 10:59:36 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions for calculating classes of elements in
##  groups given by a pcp-presentation.
##
#H  $Log: agclass.g,v $
#H  Revision 3.17.1.1  1995/06/26  10:59:36  sam
#H  removed statistics variables,
#H  fixed that canonical representatives are *not* necessarily known
#H  in the computation of conjugacy classes;
#H  (this change was 3.24 -> 3.25 in GAP-3.5)
#H
#H  Revision 3.17  1994/06/16  13:55:42  sam
#H  moved 'NumberConjugacyClasses' to 'group.g'
#H
#H  Revision 3.16  1994/05/31  13:01:36  ahulpke
#H  force Normalized EASeries (which is supposed by some routines)
#H
#H  Revision 3.15  1994/02/15  16:30:26  sam
#H  'in' for conjugacy classes of small groups will cause a call of
#H  'Elements' if necessary
#H
#H  Revision 3.14  1994/02/02  10:04:59  fceller
#H  fixed 'MakeVecFFE'
#H
#H  Revision 3.13  1993/05/12  08:50:54  sam
#H  improved 'NumberConjugacyClasses']
#H
#H  Revision 3.12  1993/03/17  13:42:59  ahulpke
#H  Use of canonical class elements
#H
#H  Revision 3.11  1993/03/16  11:30:43  ahulpke
#H  Abelian case for ConjugacyClasses, use of .elements field in
#H  ConjugacyClassOps.\in
#H
#H  Revision 3.10  1993/03/05  14:17:42  fceller
#H  fixed 'NumberConjugacyClasses'
#H
#H  Revision 3.9  1993/01/15  12:06:27  fceller
#H  fixed ".domain" entry, but the 'ConjugacyClass' command
#H  is still very strange (and maybe buggy) and should be
#H  correct soon
#H
#H  Revision 3.8  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.7  1992/05/12  11:45:54  jmnich
#H  inserted missing 'return' statement.
#H
#H  Revision 3.6  1992/04/07  16:15:32  jmnich
#H  adapted to changes in the finite field module
#H
#H  Revision 3.5  1992/04/01  06:50:42  jmnich
#H  changed use of 'Exponents'
#H
#H  Revision 3.4  1992/03/17  12:31:20  jmnich
#H  minor style changes, more bug fixes
#H
#H  Revision 3.3  1992/02/29  13:25:11  jmnich
#H  general library review, some bug fixes
#H
#H  Revision 3.1  1992/02/12  15:37:22  martin
#H  initial revision under RCS
##


#############################################################################
##
#F  InfoAgClass1(...) . . . . . . . . . . . . . . . . . . package information
#F  InfoAgClass2(...) . . . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoAgClass1 )  then  InfoAgClass1 := Ignore;  fi;
if not IsBound( InfoAgClass2 )  then  InfoAgClass2 := Ignore;  fi;


#############################################################################
##
#F  InHomSolutions( <oldmat>, <newmat>, <vec>, <field> )  . . . . . . . . . .
##
##  'InHomSolutions' solves the inhomogeneous system of linear equations that
##  is given by the concatenation of the first two arguments as the left side
##  and the third argument as the part of the right side belonging to the
##  second argument. The triangulized matrix (for iterative use) is returned
##  as well as the cardinality of the set of solutions.
##
##  returns
##
##      rec(
##          matrix      := [ [ <ffelem> ] ],
##          cardinality := <integer>
##      )
##
InHomSolutions := function( A, B, b, field )
    local   len, bad, pos, num, v, i;

    len := Length( B[1] ) + 1;
    for i in [1..Length( b )] do  B[i][len] := b[i];  od;

    Append( A, B );
    TriangulizeMat( A );

    bad := false;
    pos := 0;
    i   := 1;
    for v in A do
        while i <= len and v[i] = field.zero do  i   := i   + 1;  od;
        if    i <= len then                      pos := pos + 1;  fi;
        if    i  = len then                      bad := true;     fi;
    od;

    if bad then  num := 0;
    else         num := field.char ^ (len - 1 - pos);
    fi;

    return rec(
        matrix      := A,
        cardinality := num
    );
end;


#############################################################################
##
#F  CommutatorGauss( <mat>, <field> ) . . . . . . . . . . . . . . . . . . . .
##
##  'CommutatorGauss' performs a gauss algorithm on the supplied finite field
##  matrix and extracts all information from the triangulized form which
##  may be interpreted as a special way of calculating centralizers and
##  commutator groups under certain conditions.
##
##  returns
##
##      rec(
##          commutator       := [ [ <integer> ] ],
##          commutatorFactor := [ [ <integer> ] ],
##          centralizer      := [ [ <integer> ] ],
##      )
##
CommutatorGauss := function( A, field )
    local   res, ndim, cdim, pos, v, i, j;

    cdim  := Length( A );
    ndim  := Length( A[1] );

    for i in [ndim+1..ndim+cdim] do
        for j in [1..cdim] do
            A[j][i] := field.zero;
        od;
        A[i-ndim][i] := field.one;
    od;

#T    as soon as martin fixes the 'Append' bug
#T
#T    local   c;
#T
#T    c     := [];
#T    for i in [1..cdim] do
#T        c[i] := field.zero;
#T    od;
#T    IsVector( c );
#T
#T
#T    for i in [1..cdim] do
#T        Append( A[i], c );
#T        A[i][ndim+i] := field.one;
#T    od;

    TriangulizeMat( A );

    res := rec(
        matrix           := A,
        commutator       := 0,
        commutatorFactor := [1..ndim],
        centralizer      := 0,
        integers         := [],
        dimensionN       := ndim,
        dimensionC       := cdim
    );

    pos := [];
    i   := 1;
    for v in A do
        while v[i] = field.zero do  i := i + 1;  od;
        Add( pos, i );
        if i <= ndim then  res.commutator  := res.commutator  + 1;
        else               res.centralizer := res.centralizer + 1;
        fi;
    od;
    SubtractSet( res.commutatorFactor, pos );

    res.integers := IntegerTable( field );

    return res;
end;


#############################################################################
##
#F  CorrectedStabilizer( <mat>, <N>, <S>, <M>, <h>, <n>, <hom> )  . . . . . .
##
##  'CorrectedStabilizer' solves a special problem that arises when the
##  classes of elements are calculated for a solvable group using linear
##  methods. For short, a stabilizer of an affine operation on a factor group
##  has to be modified (corrected) to eliminate a non-trivial operation in
##  the normal subgroup. Of course this must be possible by theory.
##
##  returns
##
##      <list>
##
CorrectedStabilizer := function( A, N, S, M, h, n, hom )
    local   integers, pos, v, res, sol, s, g, gens, len, map, z, i;

    InfoAgClass2( "#I  ecs: correcting stabilizer ", S, "\n" );

    if hom = false then  map := x -> x;
    else                 map := x -> FactorAgWord( x, hom.source.identity );
    fi;

    integers := IntegerTable( N.field );

    A    := AbstractBaseMat( M, A, N.field );
    gens := A[1];
    A    := A[2];

    pos := [];
    i   := 1;
    for v in A do
        while v[i] = N.field.zero do  i := i + 1;  od;
        Add( pos, i );
    od;
    len := Length( pos );

    res := [];
    for s in S do
        s   := map( s );
        sol := Exponents( N, Comm( n, s ) * Comm( h, s ), N.field );
        g   := N.identity;
        for i in [1..len] do
            z := LogVecFFE( sol, pos[i] );
            if z <> false then
                g := g * gens[i] ^ integers[z+1];
            fi;
        od;
        Add( res, s / g );
    od;

#T    alternative avoiding AbstractBaseMat
#T
#T    gens := M;
#T    len  := Length( gens );
#T    res  := [];
#T    for s in S do
#T        s   := map( s );
#T        sol := SolutionMat( A, Exponents( N, Comm( n, s ) * Comm( h, s ), N.field ) );
#T        g   := N.identity;
#T        for i in [1..len] do
#T            z := LogVecFFE( sol, i );
#T            if z <> false then
#T                g := g * gens[i] ^ integers[z+1];
#T            fi;
#T        od;
#T        Add( res, s / g );
#T    od;

    InfoAgClass2( "#I  ecs: correcting stabilizer done\n" );

    return res;
end;


#############################################################################
##
#F  AffineOrbitsAgGroup( <G>, <matrices>, <field> ) . . . . . . . . . . . . .
##
##  This function is one of those that are mainly used by the author's
##  ag-modules. It determines all the orbits of a soluble group acting affine
##  on a full vector space.
##
##  returns
##
##      rec(
##          representatives := <vectors>,
##          stabilizers     := <aggroups>,
##          orbits          := <integer>,
##          integers        := <list>
##      )
##
AffineOrbitsAgGroup := function( G, mats, field )
    local   space, reps, stabs, spsize, orb, vs, v, w, z, next, enum, num,
            orbs, dim, i;

    reps   := [];
    stabs  := [];
    dim    := Length( mats[1] ) - 1;
    vs     := RowSpace( dim, field );
    spsize := Size( vs );
    enum   := Enumeration( vs );

    orbs  := 0;
    space := BlistList( [1..spsize], [] );
    next  := Position( space, false );
    while next <> false do
        v := CoefficientsInt( enum.exponents, next-1 );
        MakeVecFFE( v, enum.field.one );

#T        testing the performance enhancement of 'CoefficientsInt'
#T
#T        v    := ShallowCopy( enum.exponents );
#T        next := next - 1;
#T        for i in Reversed( [1..dim] ) do
#T            v[i] := next mod enum.exponents[i];
#T            next := QuoInt( next, enum.exponents[i] );
#T        od;
#T        MakeVecFFE( v, enum.field.one );

        v[dim+1] := field.one;
        orb := AgOrbitStabilizer( G, mats, v );
        for w in orb.orbit do
#T            num := 1;
#T            for i in [1..enum.dimension] do
#T                z := LogVecFFE( w, i );
#T                if z <> false then
#T                    num := num + enum.powers[i] * enum.integers[z+1];
#T                fi;
#T            od;
            num := NumberVecFFE( w, enum.powers, enum.integers );
            space[num] := true;
        od;
        orbs := orbs + 1;
        reps[orbs]  := v;
        stabs[orbs] := orb.stabilizer;
        next := Position( space, false, next );
    od;
    return rec(
        representatives := reps,
        stabilizers     := stabs,
        orbits          := orbs,
        integers        := enum.integers
    );
end;


#############################################################################
##
#F  MinimalVectorAgOrbit( <G>, <matrices>, <vector>, <field> )  . . . . . . .
##
##  This function is more or less only used by the author's ag modules.
##  It determines the 'smallest' vector in the orbit under an affine action
##  of an aggroup on a vector space. This is necessary, when using linear
##  methods for soluble groups, to determine a canonical class representative
##  for the conjugacy classes.
##
##  returns
##
##      rec(
##          vector     := <vector>
##          operator   := <agword>,
##          stabilizer := <aggroup>
##      )
##
MinimalVectorAgOrbit := function( group, mats, vec, field )
    local   vs, orbit, torbit, stab, gen, orbpos, operator, pv, gn,
            dim, enum, mvec, mnum, num, p, z, i, j, k;

    dim  := Length( mats[1] ) - 1;
    vs   := RowSpace( dim, field );
    enum := Enumeration( vs );

    orbit := [ vec ];
    stab  := [];
    pv    := [ 1 ];
    gn    := [];

    for i in Reversed( [1..Length( group.generators )] ) do
        gen    := group.generators[i];
        orbpos := Position( orbit, vec * mats[i] );
        if orbpos = false then
            p := RelativeOrderAgWord( gen );
            Add( pv, pv[Length( pv )] * p );
            Add( gn, i );
            torbit := ShallowCopy( orbit );
            for j in [1..p-1] do
                for k in [1..Length( torbit )] do
                    torbit[k] := torbit[k] * mats[i];
                od;
                Append( orbit, torbit );
            od;
        elif orbpos = 1 then   Add( stab, gen );
        else
            operator := group.identity;
            orbpos   := orbpos - 1;
            j        := Length( pv ) - 1;
            while orbpos > 0 and j > 0 do
                operator := group.generators[gn[j]] ^ QuoInt( orbpos, pv[j] ) * operator;
                orbpos   := orbpos mod pv[j];
                j        := j - 1;
            od;
            Add( stab, gen / operator );
        fi;
    od;

    mvec := vec;
#T    mnum := 1;
#T    for i in [1..enum.dimension] do
#T        z := LogVecFFE( vec, i );
#T        if z <> false then
#T            mnum := mnum + enum.powers[i] * enum.integers[z+1];
#T        fi;
#T    od;
    mnum := NumberVecFFE( vec, enum.powers, enum.integers );

    orbpos := 1;
    j      := Length( orbit );
    while j > 1 and mnum > 1 do
#T        num := 1;
#T        for i in [1..enum.dimension] do
#T            z := LogVecFFE( orbit[j], i );
#T            if z <> false then
#T                num := num + enum.powers[i] * enum.integers[z+1];
#T            fi;
#T        od;
        num := NumberVecFFE( orbit[j], enum.powers, enum.integers );

        if num < mnum then
            mnum   := num;
            mvec   := orbit[j];
            orbpos := j;
        fi;
        j := j - 1;
    od;
    operator := group.identity;
    orbpos   := orbpos - 1;
    j        := Length( pv ) - 1;
    while orbpos > 0 and j > 0 do
        operator := group.generators[gn[j]] ^ QuoInt( orbpos, pv[j] ) * operator;
        orbpos   := orbpos mod pv[j];
        j        := j - 1;
    od;

    return rec(
        vector     := mvec,
        operator   := operator,
        stabilizer := AgSubgroup( group, Reversed( stab ), false )
    );
end;


#############################################################################
##
#F  CentralCaseECSAgGroup( <G>, <N>, <C>, <M>, <h>, <hom> ) . . . . . . . . .
##
##  'CentralCaseECSAgGroup' implements the central part of the
##  algorithm for the calculation of conjugacy classes in soluble groups using
##  linear methods.
##  In the case where the elementary abelian normal subgroup is central in
##  a (somehow defined) group, the algorithm basically simplifies to solving
##  a system of linear equations.
##
##  returns
##
##      rec(
##          representatives := [ <agword> ],
##          centralizers    := [ [ <agword> ] ]
##      )
##
CentralCaseECSAgGroup := function( G, N, C, M, h, hom )
    local   h_C_comm, cg, rep2, cent2, ncgs, cigs, migs, tmp, v, z, g, i, j;

    InfoAgClass1( "#I  ecs: central case main dispatcher\n" );

    if not IsBound( N.field ) then
        N.field := GF( RelativeOrderAgWord( N.generators[1] ) );
    fi;

    if C.generators = [] then
        InfoAgClass2( "#I  ecs: central_1\n" );

        h := FactorAgWord( h, hom.source.identity );
        rep2  := Elements( N );
        cent2 := ShallowCopy( rep2 );
        for i in [1..Length( rep2 )] do
            rep2[i]  := h * rep2[i];
            cent2[i] := M;
        od;
    else
        InfoAgClass2( "#I  ecs: central_2\n" );

        ncgs := Cgs( N );
        cigs := ShallowCopy( Igs( C ) );
        migs := Igs( M );

        h := FactorAgWord( h, hom.source.identity );
        h_C_comm := [];
        for i in [1..Length( cigs )] do
            cigs[i] := FactorAgWord( cigs[i], hom.source.identity );
            h_C_comm[i] := Exponents( N, Comm( h, cigs[i] ), N.field );
        od;

        cg := CommutatorGauss( Copy( h_C_comm ), N.field );

        cg.commutatorFactor := AgSubgroup(
            G,
            Sublist( ncgs, cg.commutatorFactor ),
            true
        );

        tmp := [];
        for i in [cg.commutator+1..cg.commutator+cg.centralizer] do
            v := cg.matrix[i];
            g := G.identity;
            for j in [cg.dimensionN+1..cg.dimensionN+cg.dimensionC] do
                z := LogVecFFE( v, j );
                if z <> false then
                    g := g * cigs[j-cg.dimensionN] ^ cg.integers[z+1];
                fi;
            od;
            tmp[i-cg.commutator] := g;
        od;
        Append( tmp, migs );
        cg.centralizer := AgSubgroup( G, tmp, false );

        rep2  := Elements( cg.commutatorFactor );
        cent2 := ShallowCopy( rep2 );
        for i in [1..Length( rep2 )] do
            rep2[i]  := h * rep2[i];
            cent2[i] := cg.centralizer;
        od;
    fi;

    return rec(
        representatives := rep2,
        centralizers    := cent2
    );
end;


#############################################################################
##
#F  GeneralCaseECSAgGroup( <G>, <N>, <C>, <M>, <h>, <hom> ) . . . . . . . . .
##
##  'GeneralCaseECSAgGroup' implements the non-central part of the
##  algorithm for the calculation of conjugacy classes in soluble groups using
##  linear methods.
##
##  returns
##
##      rec(
##          representatives := [ <agword> ],
##          centralizers    := [ <aggroup> ]
##      )
##
GeneralCaseECSAgGroup := function( G, N, C, M, h, hom )
    local   ncgs, cigs, migs, centrala, centralb, N_C_pow, h_M_comm, h_C_comm,
            ndim, clen, mlen, N2, n2cgs, wn2cgs, n2dim, N2_C_pow, cg, cg2,
            orb, rep2, cent2, tmp, v, z, g, i, j;

    InfoAgClass1( "#I  ecs: general case main dispatcher\n" );

    if not IsBound( N.field ) then
        N.field := GF( RelativeOrderAgWord( N.generators[1] ) );
    fi;

    ncgs := Cgs( N );
    cigs := ShallowCopy( Igs( C ) );
    migs := Igs( M );
    ndim := Length( ncgs );
    clen := Length( cigs );
    mlen := Length( migs );

    centrala := true;
    centralb := true;
    N_C_pow  := [];
    for i in [1..clen] do
        cigs[i] := FactorAgWord( cigs[i], hom.source.identity );
        N_C_pow[i] := [];
        for j in [1..ndim] do
            N_C_pow[i][j] := ncgs[j] ^ cigs[i];
            if N_C_pow[i][j] <> ncgs[j] then  centrala := false;  fi;
        od;
    od;

    h_M_comm := [];
    h := FactorAgWord( h, hom.source.identity );
    for i in [1..mlen] do
        h_M_comm[i] := Comm( h, migs[i] );
        if h_M_comm[i] <> N.identity then  centralb := false;  fi;
    od;

    if centrala and centralb then
        InfoAgClass2( "#I  ecs: non_central_1 ->\n" );

        return CentralCaseECSAgGroup( G, N, C, M, h, hom );
    fi;

    if centralb then
        InfoAgClass2( "#I  ecs: non_central_2\n" );

        for i in [1..clen] do
            tmp := N_C_pow[i];
            for j in [1..ndim] do
                tmp[j] := Exponents( N, tmp[j], N.field );
                tmp[j][ndim+1] := N.field.zero;
            od;
            tmp[ndim+1] := Exponents( N, Comm( h, cigs[i] ), N.field );
            tmp[ndim+1][ndim+1] := N.field.one;
        od;
        orb := AffineOrbitsAgGroup( C, N_C_pow, N.field );

        rep2  := orb.representatives;
        cent2 := orb.stabilizers;
        for i in [1..orb.orbits] do
            g := h;
            for j in [1..ndim] do
                z := LogVecFFE( rep2[i], j );
                if z <> false then
                    g := g * ncgs[j] ^ orb.integers[z+1];
                fi;
            od;
            rep2[i] := g;
            tmp := ShallowCopy( Igs( cent2[i] ) );
            for j in [1..Length( tmp )] do
                tmp[j] := FactorAgWord( tmp[j], hom.source.identity );
            od;
            Append( tmp, migs );
            cent2[i] := AgSubgroup( G, tmp, false );
        od;

        return rec(
            representatives := rep2,
            centralizers    := cent2
        );
    fi;

    for i in [1..mlen] do
        h_M_comm[i] := Exponents( N, h_M_comm[i], N.field );
    od;

    if centrala then
        InfoAgClass2( "#I  ecs: non_central_3\n" );

        h_C_comm := [];
        for i in [1..clen] do
            h_C_comm[i] := Exponents( N, Comm( h, cigs[i] ), N.field );
        od;
        Append( cigs, migs );
        Append( h_C_comm, h_M_comm );

        cg := CommutatorGauss( Copy( h_C_comm ), N.field );
        cg.commutatorFactor := AgSubgroup(
            G,
            Sublist( ncgs, cg.commutatorFactor ),
            true
        );

        tmp := [];
        for i in [cg.commutator+1..cg.commutator+cg.centralizer] do
            v := cg.matrix[i];
            g := G.identity;
            for j in [cg.dimensionN+1..cg.dimensionN+cg.dimensionC] do
                z := LogVecFFE( v, j );
                if z <> false then
                    g := g * cigs[j-cg.dimensionN] ^ cg.integers[z+1];
                fi;
            od;
            tmp[i-cg.commutator] := g;
        od;
        cg.centralizer := AgSubgroup( G, tmp, false );

        rep2  := Elements( cg.commutatorFactor );
        cent2 := ShallowCopy( rep2 );
        for i in [1..Length( rep2 )] do
            rep2[i]  := h * rep2[i];
            cent2[i] := cg.centralizer;
        od;

        return rec(
            representatives := rep2,
            centralizers    := cent2
        );
    fi;

    cg := CommutatorGauss( Copy( h_M_comm ), N.field );

    if cg.commutatorFactor = [] then
        InfoAgClass2( "#I  ecs: non_central_4\n" );

        rep2  := [ h ];
        cent2 := [
            AgSubgroup(
                G,
                CorrectedStabilizer( h_M_comm, N, Igs( C ), Igs( M ), h, N.identity, hom ),
                false
            )
        ];
    else
        tmp := [];
        for i in [1..cg.commutator] do
            v := cg.matrix[i];
            g := G.identity;
            for j in [1..cg.dimensionN] do
                z := LogVecFFE( v, j );
                if z <> false then
                    g := g * ncgs[j] ^ cg.integers[z+1];
                fi;
            od;
            tmp[i] := g;
        od;

        # don't bound cg.commutator to tmp here. this field is re-used later.

        N2       := N mod AgSubgroup( G, tmp, false );
        N2.field := N.field;
        n2cgs    := N2.generators;
        n2dim    := Length( n2cgs );
        tmp      := DepthAgWord( ncgs[1] ) - 1;
        wn2cgs   := List( n2cgs, x -> DepthAgWord( x ) - tmp );
        centrala := true;

        N2_C_pow := [];
        for i in [1..clen] do
            N2_C_pow[i] := [];
            for j in [1..n2dim] do
                N2_C_pow[i][j] := N_C_pow[i][wn2cgs[j]];
                if centrala
                 and not N2_C_pow[i][j] / n2cgs[j] in N2.factorDen then
                    centrala := false;
                fi;
            od;
        od;

        if centrala then
            InfoAgClass2( "#I  ecs: non_central_5\n" );

            h_C_comm := [];
            for i in [1..clen] do
                h_C_comm[i] := Exponents( N2, Comm( h, cigs[i] ), N2.field );
            od;

            cg2 := CommutatorGauss( Copy( h_C_comm ), N.field );

            tmp := [];
            for i in [cg.commutator+1..cg.commutator+cg.centralizer] do
                v := cg.matrix[i];
                g := G.identity;
                for j in [cg.dimensionN+1..cg.dimensionN+cg.dimensionC] do
                    z := LogVecFFE( v, j );
                    if z <> false then
                        g := g * migs[j-cg.dimensionN] ^ cg.integers[z+1];
                    fi;
                od;
                tmp[i-cg.commutator] := g;
            od;
            cg.centralizer := tmp;

            tmp := [];
            for i in [cg2.commutator+1..cg2.commutator+cg2.centralizer] do
                v := cg2.matrix[i];
                g := C.identity;
                for j in [cg2.dimensionN+1..cg2.dimensionN+cg2.dimensionC] do
                    z := LogVecFFE( v, j );
                    if z <> false then
                        g := g * C.generators[j-cg2.dimensionN] ^ cg2.integers[z+1];
                    fi;
                od;
                tmp[i-cg2.commutator] := g;
            od;
            cg2.centralizer      := tmp;
            cg2.commutatorFactor := Sublist( n2cgs, cg2.commutatorFactor );

            rep2  := Elements( AgSubgroup( N, cg2.commutatorFactor, true ) );
            cent2 := ShallowCopy( rep2 );
            for i in [1..Length( rep2 )] do
                cent2[i] := CorrectedStabilizer( h_M_comm, N, cg2.centralizer, Igs( M ), h, rep2[i], hom );
                Append( cent2[i], cg.centralizer );
                cent2[i] := AgSubgroup( G, cent2[i], false );
                rep2[i]  := h * rep2[i];
            od;
        else
            InfoAgClass2( "#I  ecs: non_central_6\n" );

            for i in [1..clen] do
                tmp := N2_C_pow[i];
                for j in [1..n2dim] do
                    tmp[j] := Exponents( N2, tmp[j], N2.field );
                    tmp[j][n2dim+1] := N.field.zero;
                od;
                tmp[n2dim+1] := Exponents( N2, Comm( h, cigs[i] ), N2.field );
                tmp[n2dim+1][n2dim+1] := N.field.one;
            od;

            tmp := [];
            for i in [cg.commutator+1..cg.commutator+cg.centralizer] do
                v := cg.matrix[i];
                g := G.identity;
                for j in [cg.dimensionN+1..cg.dimensionN+cg.dimensionC] do
                    z := LogVecFFE( v, j );
                    if z <> false then
                        g := g * migs[j-cg.dimensionN] ^ cg.integers[z+1];
                    fi;
                od;
                tmp[i-cg.commutator] := g;
            od;
            cg.centralizer := tmp;

            orb := AffineOrbitsAgGroup( C, N2_C_pow, N2.field );

            rep2  := orb.representatives;
            cent2 := orb.stabilizers;
            for i in [1..orb.orbits] do
                g := G.identity;
                for j in [1..n2dim] do
                    z := LogVecFFE( rep2[i], j );
                    if z <> false then
                        g := g * n2cgs[j] ^ orb.integers[z+1];
                    fi;
                od;
                tmp := CorrectedStabilizer( h_M_comm, N, Igs( cent2[i] ), Igs( M ), h, g, hom );
                Append( tmp, cg.centralizer );
                cent2[i] := AgSubgroup( G, tmp, false );
                rep2[i]  := h * g;
            od;
        fi;
    fi;

    return rec(
        representatives := rep2,
        centralizers    := cent2
    );
end;


#############################################################################
##
#F  MainEntryECSAgGroup( <G>, <U>, <H>, <ser>, <skip> ) . . . . . . . . . . .
#F  . . . . . . . . . . . . main entry point for the conjugacy class function
##
##  This is main routine for the computation of conjugacy classes in soluble
##  groups. It handles all initialization, takes care of the inductive nature
##  of the algorithm and dispatches to the case-handling functions as
##  far as centrality is obvious.
##
##  returns
##
##      rec(
##          representatives := [ <agword> ],
##          centralizers    := [ <aggroup> ]
##      )
##  or
##      rec(
##          representatives         := [ <agword> ],
##          centralizers            := [ <aggroup> ]
##          naturalHomomorphisms    := [ <aghom> ],
##          domains                 := [ <aggroup> ],
##          nextStep                := <integer>,
##          elementaryAbelianSeries := [ <aggroup> ]
##      )
##
##  A short explanation of the arguments for those who decide to go through
##  this function rather than using the supplied top-level funtion.
##  By the way, greetings to H.U.   8-) 
##
##  G           the supergroup
##  U           the subgroup of G acting on H
##  H           a normal composition subgroup of G, an element of elabser
##  elabser     an elementary abelian composition series of G containing H
##  skip        the number of steps to skip at the end of the algorithm
##
##  the last argument is basically implemented to provide programs such as
##  the computation of the number of conjugacy classes with an easy way to
##  compute the classes of the whole group modulo the last elementary abelian
##  normal subgroup. If this feature is used, i.e. 'skip' is positive, the
##  second form of the return record is returned otherwise always a return
##  record of the first type is returned.
##
##  Remark: the conditions that are implicitly given by the above description
##          of the arguments is not tested by the function.
##          So you hacker, be aware !
##
MainEntryECSAgGroup := function( G, U, H, elabser, skip )
    local   rep, cent, step, repnum, newclasses, newrep, newcent,
            fachom, facU, facN, facC, fach, fhom, tmpU, idx;

    if U.generators = [] then
        rep  := Elements( H );
        cent := List( rep, x -> U );
        return rec(
            representatives := rep,
            centralizers    := cent
        );
    fi;

    if H.generators = [] then
        return rec(
            representatives := [ H.identity ],
            centralizers    := [ U ]
        );
    fi;


    idx := 1;
    while elabser[idx] <> H do                idx := idx + 1;  od;
    while IsSubgroup( elabser[idx+1], U ) do  idx := idx + 1;  od;

    if idx <> 1 then
        elabser := Sublist( elabser, [idx..Length( elabser )] );
    fi;
    fachom := HomomorphismsSeries( G, elabser );


    # initialize the inductive algorithm

    tmpU := Image( fachom[1], U );
    rep  := Elements( Image( fachom[1], H ) );
    cent := List( rep, x -> tmpU );

    # prepare the involved data for each following step

    tmpU := U;
    U    := [];
    U[Length( elabser )] := tmpU;
    for step in Reversed( [2..Length( elabser )] ) do
        tmpU := Image( fachom[step], tmpU );
        U[step-1] := tmpU;
    od;

    # loop over the elementary abelian series

    for step in [2..Length( elabser )-skip] do

        InfoAgClass1( "#I  ecs: step ", step, " / (", Length( elabser ), "-", skip, ")\n" );

        # get the appropriate new data

        fhom := fachom[step];
        facN := PreImage( fhom, TrivialSubgroup( fhom.range ) );
        facU := Intersection( U[step], facN );

        # initialize data for this step

        newrep  := [];
        newcent := [];

        if IsCentral( fhom.source, facN ) then
            for repnum in [1..Length( rep )] do
                InfoAgClass2( "#I  ecs: coset ", repnum, " / ", Length( rep ), "\n" );
                newclasses := CentralCaseECSAgGroup(
                                fhom.source, facN, cent[repnum], facU, rep[repnum], fhom );
                Append( newrep,  newclasses.representatives );
                Append( newcent, newclasses.centralizers );
            od;
        else
            for repnum in [1..Length( rep )] do
                InfoAgClass2( "#I  ecs: coset ", repnum, " / ", Length( rep ), "\n" );
                newclasses := GeneralCaseECSAgGroup(
                                fhom.source, facN, cent[repnum], facU, rep[repnum], fhom );
                Append( newrep,  newclasses.representatives );
                Append( newcent, newclasses.centralizers );
            od;
        fi;

        rep  := newrep;
        cent := newcent;
    od;

    if skip = 0 then
        return rec(
            representatives         := rep,
            centralizers            := cent
        );
    else
        return rec(
            representatives         := rep,
            centralizers            := cent,
            naturalHomomorphisms    := fachom,
            domains                 := U,
            nextStep                := Length( elabser ) - skip + 1,
            elementaryAbelianSeries := elabser
        );
    fi;
end;


#############################################################################
##
#F  AgGroupOps.ConjugacyClasses( [<U>, ]<obj> ) . . . . . . . . . . . . . . .
#F  . . . . . . . . . . . compute conjugacyclasses of elements in an ag-group
##
##  This function determines all conjugacyclasses of elements of an ag-group
##  under the operation of an other ag-group which may be passed as an
##  optional first argument. The function implements an algorithm that uses
##  linear methods for calculations in a soluble group.
##  If <obj> is a list of elements instead of an ag group, the classes of the
##  elements, i.e. especially their canonical representative is determined.
##
##  returns
##
##      <list>
##
AgGroupOps.ConjugacyClasses := function( arg )
    local   G, H, U, HU, T, elabser, natisom, classes, res, i;

    if    Length( arg ) = 1 then  H := arg[1]; U := H;
    elif  Length( arg ) = 2 then  H := arg[2]; U := arg[1];
    else
        Error( "usage: ConjugacyClasses( [<U>, ]<obj> )" );
    fi;

    if U=H and IsAbelian(U) then
      classes := List( Elements( U ), 
	 i -> U.operations.ConjugacyClass( U, i ) );
      for i in classes do
	i.elements := [ i.representative ];
	i.centralizer := i.group;
      od;
    else
      G := Parent( U );
      T := TrivialSubgroup( G );

      if IsList( H ) then
	  if not IsElementaryAbelianAgSeries( G ) then
	      elabser := List(ElementaryAbelianSeries( G ),Normalized);
	      natisom := IsomorphismAgGroup( elabser );
	      elabser := List(ElementaryAbelianSeries( natisom.range ),
			      Normalized);
	      res     := MainEntryECAgWords( natisom.range,
			  Image( natisom, U ), List( H, x -> Image( natisom, x ) ), elabser );

	      # now construct the conjugacy classes with additional entries
	      # from the data returned in 'res'.

	      classes := ShallowCopy( res.representatives );

	      for i in [1..Length( classes )] do
		  classes[i] :=
		   U.operations.ConjugacyClass( U,
		   PreImagesRepresentative( natisom, res.representatives[i] ) );
		  classes[i].element :=
		   PreImagesRepresentative( natisom, res.elements[i] );
		  classes[i].conjugand :=
		   PreImagesRepresentative( natisom, res.conjugands[i] );
		  classes[i].centralizer :=
		   PreImage( natisom, res.centralizers[i] );
	      od;
	  else
	      elabser := List(ElementaryAbelianSeries( G ), Normalized);
	      res     := MainEntryECAgWords( G, U, H, elabser );

	      classes := ShallowCopy( res.representatives );

	      for i in [1..Length( classes )] do
		  classes[i] :=
		   U.operations.ConjugacyClass( U,
		   res.representatives[i] );
		  classes[i].element := res.elements[i];
		  classes[i].conjugand := res.conjugands[i];
		  classes[i].centralizer := res.centralizers[i];
	      od;
	  fi;
      elif IsNormal( G, H ) then
	  if IsElementaryAbelianAgSeries( G )
	   and IsElementAgSeries( H ) then
	      elabser := List(ElementaryAbelianSeries( [ G, H, T ] ),
			      Normalized);
	      res     := MainEntryECSAgGroup( G, U, H, elabser, 0 );

	      classes := ShallowCopy( res.representatives );

	      for i in [1..Length( classes )] do
		  classes[i] :=
		   U.operations.ConjugacyClass( U,
		   res.representatives[i] );
		  classes[i].centralizer := res.centralizers[i];
	      od;
	  else
	      elabser := List(ElementaryAbelianSeries( [ G, H, T ] ),
			      Normalized);
	      natisom := IsomorphismAgGroup( elabser );
	      elabser := List(ElementaryAbelianSeries( natisom.range ),
			      Normalized);
	      res     := MainEntryECSAgGroup( natisom.range,
		  Image( natisom, U ), Image( natisom, H ), elabser, 0 );

	      classes := ShallowCopy( res.representatives );

	      for i in [1..Length( classes )] do
		  classes[i] := 
		   U.operations.ConjugacyClass( U,
		   PreImagesRepresentative( natisom, res.representatives[i] ) );
		  classes[i].centralizer :=
		   PreImage( natisom, res.centralizers[i] );
	      od;
	  fi;
      elif IsNormal( U, H ) then
	  HU := SumAgGroup( H, U );
	  elabser := List(ElementaryAbelianSeries( [ HU, H, T ] ),
			  Normalized);
	  natisom := IsomorphismAgGroup( elabser );
	  elabser := List(ElementaryAbelianSeries( natisom.range ),
			  Normalized);
	  res     := MainEntryECSAgGroup( natisom.range,
		      Image( natisom, U ), Image( natisom, H ), elabser, 0 );

	  classes := ShallowCopy( res.representatives );

	  for i in [1..Length( classes )] do
	      classes[i] := 
	       U.operations.ConjugacyClass( U,
	       PreImagesRepresentative( natisom, res.representatives[i] ) );
	      classes[i].centralizer :=
	       PreImage( natisom, res.centralizers[i] );
	  od;
      else
	  Error( "sorry, U must operate on H" );
      fi;

    fi;
    return classes;
end;


#############################################################################
##
#F  FusionsECSAgGroup( <G>, <U>, <H>, <ser>, <split> )  . . . . . . . . . . .
#F  . . . . . . . . . . . . . . . . . . compute conjugacy classes and fusions
##
##
##  returns
##
##      rec(
##          representatives         := [ <agword> ],
##          centralizers            := [ <aggroup> ]
##          naturalHomomorphisms    := [ <aghom> ],
##          domains                 := [ <aggroup> ],
##          elementaryAbelianSeries := [ <aggroup> ]
##          representativeTree      := [ <agword> ],
##          centralizerTree         := [ <aggroup> ],
##          fusionTree              := [ <integer> ]
##      )
##
##  A short explanation of the arguments.
##
##  G           the supergroup
##  U           the subgroup of G acting on H
##  H           a normal composition subgroup of G, an element of elabser
##  elabser     an elementary abelian composition series of G containing H
##  split       steps in which a check for a complete split is performed
##              only classes that completely split are considered in further
##              computations
##
##
##  Remark: the conditions that are implicitly given by the above description
##          of the arguments is not tested by the function.
##
FusionsECSAgGroup := function( G, U, H, elabser, split )
    local   rep, cent, step, repnum, newclasses, newrep, newcent, fachom,
            facU, facN, facC, fach, fhom, tmpU, idx, rtree, ctree, ftree;


    if U.generators = [] then
        rep  := Elements( H );
        cent := List( rep, x -> U );
        return rec(
            representatives := rep,
            centralizers    := cent
        );
    fi;

    if H.generators = [] then
        return rec(
            representatives := [ H.identity ],
            centralizers    := [ U ]
        );
    fi;


    idx := 1;
    while elabser[idx] <> H do                idx := idx + 1;  od;
    while IsSubgroup( elabser[idx+1], U ) do  idx := idx + 1;  od;

    if idx <> 1 then
        elabser := Sublist( elabser, [idx..Length( elabser )] );
    fi;
    fachom := HomomorphismsSeries( G, elabser );

    if split <> [] then  split := split + 1 - idx; fi;


    # initialize the inductive algorithm

    tmpU := Image( fachom[1], U );
    rep  := Elements( Image( fachom[1], H ) );
    cent := List( rep, x -> tmpU );

    rtree := [ rep ];
    ctree := [ cent ];
    ftree := [ [] ];

    # prepare the involved data for each following step

    tmpU := U;
    U    := [];
    U[Length( elabser )] := tmpU;
    for step in Reversed( [2..Length( elabser )] ) do
        tmpU := Image( fachom[step], tmpU );
        U[step-1] := tmpU;
    od;

    # loop over the elementary abelian series

    for step in [2..Length( elabser )] do

        InfoAgClass1( "#I  becs: step ", step, " / ", Length( elabser ), "\n" );

        # get the appropriate new data

        fhom := fachom[step];
        facN := PreImage( fhom, TrivialSubgroup( fhom.range ) );
        facU := Intersection( U[step], facN );

        # initialize data for this step

        newrep      := [];
        newcent     := [];
        ftree[step] := [];

        if IsCentral( fhom.source, facN ) then
            for repnum in [1..Length( rep )] do
                InfoAgClass2( "#I  becs: coset ", repnum, " / ", Length( rep ), "\n" );
                newclasses := CentralCaseECSAgGroup(
                                fhom.source, facN, cent[repnum], facU, rep[repnum], fhom );
                if not step in split
                  or Length( newclasses.representatives ) = Size( facN ) then
                    Append( newrep,  newclasses.representatives );
                    Append( newcent, newclasses.centralizers );

                    Append( ftree[step],
                            List( newclasses.representatives, x -> repnum ) );
                fi;
            od;
        else
            for repnum in [1..Length( rep )] do
                InfoAgClass2( "#I  becs: coset ", repnum, " / ", Length( rep ), "\n" );
                newclasses := GeneralCaseECSAgGroup(
                                fhom.source, facN, cent[repnum], facU, rep[repnum], fhom );
                if not step in split
                  or Length( newclasses.representatives ) = Size( facN ) then
                    Append( newrep,  newclasses.representatives );
                    Append( newcent, newclasses.centralizers );

                    Append( ftree[step],
                            List( newclasses.representatives, x -> repnum ) );
                fi;
            od;
        fi;

        rep  := newrep;
        cent := newcent;

        rtree[step] := newrep;
        ctree[step] := newcent;
    od;

    return rec(
        representatives         := rep,
        centralizers            := cent,
        naturalHomomorphisms    := fachom,
        domains                 := U,
        elementaryAbelianSeries := elabser,
        representativeTree      := rtree,
        centralizerTree         := ctree,
        fusionTree              := ftree
    );
end;


#############################################################################
##
#F  Fusions2ECSAgGroup( <G>, <U>, <H>, <ser>, <idx>, <reps>, <cents>, <split> )
#F  . . . . . . . . .  compute conjugacy classes and fusions from lower level
##
##
##  returns
##
##      rec(
##          representatives         := [ <agword> ],
##          centralizers            := [ <aggroup> ]
##          naturalHomomorphisms    := [ <aghom> ],
##          domains                 := [ <aggroup> ],
##          elementaryAbelianSeries := [ <aggroup> ]
##          representativeTree      := [ <agword> ],
##          centralizerTree         := [ <aggroup> ],
##          fusionTree              := [ <integer> ]
##      )
##
##  A short explanation of the arguments.
##
##  G           the supergroup
##  U           the subgroup of G acting on H
##  H           a normal composition subgroup of G, an element of elabser
##  elabser     an elementary abelian composition series of G containing H
##  idx         start index to begin computation
##  rep         list of representatives so far
##  cent        list of centralizers (as groups !) relative to rep
##  split       steps in which a check for a complete split is performed
##              only classes that completely split are considered in further
##              computations
##
##
##  Remark: the conditions that are implicitly given by the above description
##          of the arguments is not tested by the function.
##
Fusions2ECSAgGroup := function( G, U, H, elabser, idx, rep, cent, split )
    local   step, repnum, newclasses, newrep, newcent, fachom,
            facU, facN, facC, fach, fhom, tmpU, rtree, ctree, ftree;


    if U.generators = [] then
        cent := List( rep, x -> U );
        return rec(
            representatives := rep,
            centralizers    := cent
        );
    fi;

    if H.generators = [] then
        return rec(
            representatives := [ H.identity ],
            centralizers    := [ U ]
        );
    fi;


    if idx <> 1 then
        elabser := Sublist( elabser, [idx..Length( elabser )] );
    fi;
    fachom := HomomorphismsSeries( G, elabser );

    if split <> [] then  split := split + 1 - idx; fi;


    # initialize the inductive algorithm

    Apply(  rep, x -> Image( fachom[1], x ) );
    Apply( cent, x -> Image( fachom[1], x ) );

    rtree := [ rep ];
    ctree := [ cent ];
    ftree := [ [] ];

    # prepare the involved data for each following step

    tmpU := U;
    U    := [];
    U[Length( elabser )] := tmpU;
    for step in Reversed( [2..Length( elabser )] ) do
        tmpU := Image( fachom[step], tmpU );
        U[step-1] := tmpU;
    od;

    # loop over the elementary abelian series

    for step in [2..Length( elabser )] do

        InfoAgClass1( "#I  becs2: step ", step, " / ", Length( elabser ), "\n" );

        # get the appropriate new data

        fhom := fachom[step];
        facN := PreImage( fhom, TrivialSubgroup( fhom.range ) );
        facU := Intersection( U[step], facN );

        # initialize data for this step

        newrep      := [];
        newcent     := [];
        ftree[step] := [];

        if IsCentral( fhom.source, facN ) then
            for repnum in [1..Length( rep )] do
                InfoAgClass2( "#I  becs2: coset ", repnum, " / ", Length( rep ), "\n" );
                newclasses := CentralCaseECSAgGroup(
                                fhom.source, facN, cent[repnum], facU, rep[repnum], fhom );
                if not step in split
                  or Length( newclasses.representatives ) = Size( facN ) then
                    Append( newrep,  newclasses.representatives );
                    Append( newcent, newclasses.centralizers );

                    Append( ftree[step],
                            List( newclasses.representatives, x -> repnum ) );
                fi;
            od;
        else
            for repnum in [1..Length( rep )] do
                InfoAgClass2( "#I  becs2: coset ", repnum, " / ", Length( rep ), "\n" );
                newclasses := GeneralCaseECSAgGroup(
                                fhom.source, facN, cent[repnum], facU, rep[repnum], fhom );
                if not step in split
                  or Length( newclasses.representatives ) = Size( facN ) then
                    Append( newrep,  newclasses.representatives );
                    Append( newcent, newclasses.centralizers );

                    Append( ftree[step],
                            List( newclasses.representatives, x -> repnum ) );
                fi;
            od;
        fi;

        rep  := newrep;
        cent := newcent;

        rtree[step] := newrep;
        ctree[step] := newcent;
    od;

    return rec(
        representatives         := rep,
        centralizers            := cent,
        naturalHomomorphisms    := fachom,
        domains                 := U,
        elementaryAbelianSeries := elabser,
        representativeTree      := rtree,
        centralizerTree         := ctree,
        fusionTree              := ftree
    );
end;


#############################################################################
##
#F  SubEntryNECSAgGroup( <G>, <N>, <C>, <M>, <h>, <cl>, <hom> ) . . . . . . .
##
##  This  is  the basic subroutine of the function for calculating the number
##  of conjugacy classes in a  soluble group.  Its main duty is to solve some
##  inhomogeneous  systems  of linear equations and determine the cardinality
##  of the corresponding set of solutions.
##
##  returns
##
##      <integer>
##
SubEntryNECSAgGroup := function( G, N, C, M, h, cl, hom )
    local   num, ncgs, cigs, migs, ndim, clen, mlen, central, h_M_comm,
            N2, n2cgs, N2_c_comm, cg, sol, repnum, rep, tmp, v, g, z, i, j;

    if not IsBound( N.field ) then
        N.field := GF( RelativeOrderAgWord( N.generators[1] ) );
    fi;

    num  := 0;

    ncgs := Cgs( N );
    cigs := ShallowCopy( Igs( C ) );
    migs := Igs( M );
    ndim := Length( ncgs );
    clen := Length( cigs );
    mlen := Length( migs );

    central  := true;
    h_M_comm := [];
    h := FactorAgWord( h, hom.source.identity );
    for i in [1..mlen] do
        h_M_comm[i] := Comm( h, migs[i] );
        if h_M_comm[i] <> N.identity then  central := false;  fi;
    od;

    if central then

        N2    := N;
        n2cgs := ncgs;
    else
        for i in [1..mlen] do
            h_M_comm[i] := Exponents( N, h_M_comm[i], N.field );
        od;
        cg := CommutatorGauss( Copy( h_M_comm ), N.field );
        if cg.commutatorFactor = [] then

            return 1;
        else

            tmp := [];
            for i in [1..cg.commutator] do
                v := cg.matrix[i];
                g := G.identity;
                for j in [1..cg.dimensionN] do
                    z := LogVecFFE( v, j );
                    if z <> false then
                        g := g * ncgs[j] ^ cg.integers[z+1];
                    fi;
                od;
                tmp[i] := g;
            od;
            cg.commutator := tmp;

            N2       := N mod AgSubgroup( G, cg.commutator, true );
            n2cgs    := N2.generators;
            N2.field := N.field;
        fi;
    fi;

    for repnum in [1..Length( cl.representatives )] do
        rep := FactorAgWord( cl.representatives[repnum], hom.source.identity );
        N2_c_comm := [];
        for i in [1..Length( n2cgs )] do
            N2_c_comm[i] := Exponents( N2, Comm( n2cgs[i], rep ), N2.field );
        od;

        sol := SolutionMat( N2_c_comm, Exponents( N2, Comm( h, rep ), N2.field ) );

        if sol <> false then
            num := num + cl.classlengths[repnum]
                * Size( RowSpace( NullspaceMat( N2_c_comm ), N2.field, 0 * sol ) );
        fi;
    od;

    return num / Size( C );
end;


#############################################################################
##
#F  MainEntryNECSAgGroup( <G>, <U>, <H>, <E> )
##
##  This is the main function of the  algorithm for calculating the number of
##  conjugacy  classes in  a soluble group. Due to  the used  algorithm, this
##  function  makes  calls  to  'MainEntryECSAgGroup'  described   above  for
##  calculating the conjugacy classes  of the found  centralizers in the last
##  factorgroup  and  then  calls its  only  special subroutine to determine,
##  following the lemma of cauchy/frobenius, the number of conjugacy  classes
##  that are found in each coset.
##
##  returns
##
##      <integer>
##
MainEntryNECSAgGroup := function( G, U, H, E )
    local   num, cl, cl2, ec, step, rep, cent, fhom, facN, facU, h, ser, cnum,
            grp, isom, order, tmp, tmp2, i;

    if U.generators = [] then  return Size(H);  fi;
    if H.generators = [] then  return       1;  fi;

    # get the conjugacy classes for the biggest factorgroup

    cl  := MainEntryECSAgGroup( G, U, H, E, 1 );
    ec  := Equivalenceclasses(  cl.centralizers,
                                function ( x, y ) return x = y; end );
    Apply( ec.classes, x -> [ x[1], Length( x ) ] );

    rep  := cl.representatives;
    step := cl.nextStep;
    fhom := cl.naturalHomomorphisms[step];
    facN := PreImage( fhom, TrivialSubgroup( fhom.range ) );
    facU := Intersection( cl.domains[step], facN );
    ser  := cl.elementaryAbelianSeries;

    # compute elementary abelian series for factor group

    E := [];
    for i in [1..Length( ser )-1] do  Add( E, Image( fhom, ser[i] ) );  od;

    # initialize the inductive algorithm

    num := 0;

    # loop over all conjugacy classes of the factor group

    for cnum in [1..Length( ec.classes )] do
        cent := ec.classes[cnum][1];
        tmp  := TrivialSubgroup( fhom.range );
        ser  := [];
        for grp in E  do
	    tmp2 := Intersection( grp, cent );
            if tmp <> tmp2  then
                Add( ser, tmp2 );
                tmp := tmp2;
            fi;
        od;
        if ser = []  then ser := [ tmp ];  fi;
        if ser[1] <> cent  then ser := Concatenation([cent],ser);  fi;

        isom  := IsomorphismAgGroup( ser );
        ser   := List(ElementaryAbelianSeries( isom.range ),Normalized);
        cl2   := MainEntryECSAgGroup( isom.range,
                                      isom.range,
                                      isom.range,
                                      ser,
                                      0 );
        order := Size( isom.range );
        cl2   := rec(
                     representatives := List(
	                 cl2.representatives, 
                             x -> PreImagesRepresentative( isom, x ) ),
                     classlengths := List(
			 cl2.centralizers,
			     x -> order / Size( x ) ) );

        for i in [1..ec.classes[cnum][2]] do
            h   := rep[ec.indices[cnum][i]];
            num := num + SubEntryNECSAgGroup( fhom.source, 
                       facN, cent, facU, h, cl2, fhom );
        od;
    od;
    return num;
end;


#############################################################################
##
#F  SubEntrySECSAgGroup( <G>, <N>, <C>, <M>, <h>, <latt>, <mat>, <integer>, <hom> )
##
##  This is the basic subroutine for the function that calculates the types
##  of conjugacy classes in a soluble group. It uses the subgroup lattice of the
##  operating centralizer to determine the transitive constituents of the
##  operation, which itself is computed via inhomogeneous systems of linear
##  equations. From this information the desired results are computed.
##
##  returns
##
##      rec(
##          classlengths := [ <integer> ],
##          occurences   := [ <integer> ]
##      )
##
SubEntrySECSAgGroup := function( G, N, C, M, h, latt, bs, opord, hom )
    local   ncgs, cigs, migs, ndim, clen, mlen, v, g, z,
            central, h_M_comm, N2, n2cgs, cg, facord, bsvec, cllen,
            clnum, group, ugens, gennum, res, N2_c_comm, tmp, i, j;

    if not IsBound( N.field ) then
        N.field := GF( RelativeOrderAgWord( N.generators[1] ) );
    fi;

    ncgs := Cgs( N );
    cigs := ShallowCopy( Igs( C ) );
    migs := Igs( M );
    ndim := Length( ncgs );
    clen := Length( cigs );
    mlen := Length( migs );

    central  := true;
    h_M_comm := [];
    h := FactorAgWord( h, hom.source.identity );
    for i in [1..mlen] do
        h_M_comm[i] := Comm( h, migs[i] );
        if h_M_comm[i] <> N.identity then  central := false;  fi;
    od;

    if central then

        N2     := N;
        n2cgs  := ncgs;
        facord := Size( N2 );
    else
        for i in [1..mlen] do
            h_M_comm[i] := Exponents( N, h_M_comm[i], N.field );
        od;
        cg := CommutatorGauss( Copy( h_M_comm ), N.field );
        if cg.commutatorFactor = [] then

            return rec(
                classlengths := [ opord / Size( latt.group ) ],
                occurences   := [ 1 ]
            );
        else

            tmp := [];
            for i in [1..cg.commutator] do
                v := cg.matrix[i];
                g := G.identity;
                for j in [1..cg.dimensionN] do
                    z := LogVecFFE( v, j );
                    if z <> false then
                        g := g * ncgs[j] ^ cg.integers[z+1];
                    fi;
                od;
                tmp[i] := g;
            od;
            cg.commutator := tmp;

            N2       := N mod AgSubgroup( G, cg.commutator, true );
            n2cgs    := N2.generators;
            N2.field := N.field;
            facord   := Size( N2.factorNum ) / Size( N2.factorDen );
        fi;
    fi;

    bsvec  := [ facord ];
    cllen  := [ opord / facord ];
    for clnum in [2..Length( latt.classes )] do
        group := latt.classes[clnum].representative;
        ugens := group.generators;
        Apply( ugens, x -> FactorAgWord( x, hom.source.identity ) );
        cllen[clnum] := opord / (Size( group ) * facord);
        gennum := 1;
        res    := rec( matrix := [] );
        repeat
            N2_c_comm := [];
            for i in [1..Length( n2cgs )] do
                N2_c_comm[i] := Exponents( N2, Comm( n2cgs[i], ugens[gennum] ), N2.field );
            od;
            res := InHomSolutions( res.matrix, N2_c_comm,
                    Exponents( N2, Comm( h, ugens[gennum] ), N2.field ), N2.field );
            gennum := gennum + 1;
        until gennum > Length( ugens ) or res.cardinality = 0;
        bsvec[clnum] := res.cardinality;
    od;
    for i in Reversed( [1..Length( bsvec )-1] ) do
        for j in [i+1..Length( bsvec )] do
            bsvec[i] := bsvec[i] - bsvec[j] * bs[j][i];
        od;
        bsvec[i] := bsvec[i] / bs[i][i];
    od;
    return rec(
        classlengths := cllen,
        occurences   := bsvec
    );
end;


#############################################################################
##
#F  MainEntrySECSAgGroup( <aggroup>, <aggroup>, <aggroup>, [ <aggroup> ] )  .
##
##  This is the main function for the calculation of the types of
##  conjugacy classes in a soluble group. This function makes calls to
##  'MainEntryECSAgGroup' to determine the classes of elements up to the last
##  factorgroup and then calculates for each centralizer the whole lattice
##  of subgroups and the burnside matrix using the author's lattice module.
##  This information is then passed to the subgoup 'SubEntrySECSAgGroup' which finally
##  determines the desired result.
##
##  returns
##
##      rec(
##          classlengths := [ <integer> ],
##          occurences   := [ <integer> ]
##      )
##
MainEntrySECSAgGroup := function( G, U, H, elabser )
    local   cllen, clcnt, cl, ec, step, rep, cent, h, facN, facU,
            ser, cnum, fhom, isom, uord, latt, bs, layer, crep, res, tmp, tmp2, i;

    if U.generators = [] then
        return rec(
            classlengths := [ 1 ],
            occurences   := [ Size( H ) ]
        );
    fi;

    if H.generators = [] then
        return rec(
            classlengths := [ 1 ],
            occurences   := [ 1 ]
        );
    fi;


    # get the conjugacy classes for the biggest factorgroup

    cl  := MainEntryECSAgGroup( G, U, H, elabser, 1 );
    ec  := Equivalenceclasses(  cl.centralizers,
                                function ( x, y ) return x = y; end );
    Apply( ec.classes, x -> [ x[1], Length( x ) ] );

    rep  := cl.representatives;
    step := cl.nextStep;
    fhom := cl.naturalHomomorphisms[step];
    facN := PreImage( fhom, TrivialSubgroup( fhom.range ) );
    facU := Intersection( cl.domains[step], facN );
    ser  := cl.elementaryAbelianSeries;
    uord := Size( U );

    # compute elementary abelian series for factor group

    elabser := [];
    for i in [1..Length( ser )-1] do  Add( elabser, Image( fhom, ser[i] ) );  od;

    # initialize the inductive algorithm

    cllen := [];
    clcnt := [];

    # loop over all conjugacy classes of the factor group

    for cnum in [1..Length( ec.classes )] do
        cent := ec.classes[cnum][1];
        isom := NaturalHomomorphism( cent, cent / TrivialSubgroup( cent ) );
        latt := Lattice( isom.range );
        Sort( latt.classes,
                function ( x, y )
                    return x.representative.size < y.representative.size;
                end );
        bs := TableOfMarks( latt );
        Apply( latt.classes, x -> ConjugacyClassSubgroups( isom.source,
                PreImage( isom, x.representative ) ) );

        for i in [1..ec.classes[cnum][2]] do
            h   := rep[ec.indices[cnum][i]];
            res := SubEntrySECSAgGroup( fhom.source, facN, cent, facU, h, latt, bs, uord, fhom );
            Append( cllen, res.classlengths );
            Append( clcnt, res.occurences );
        od;
    od;

    # now sort out those entries that do not occur really, i.e. which have
    # an occurence count of zero

    tmp   := cllen;
    tmp2  := clcnt;
    cllen := [];
    clcnt := [];
    for i in [1..Length( tmp )] do
        if tmp2[i] <> 0 then
            Add( cllen, tmp[i] );
            Add( clcnt, tmp2[i] );
        fi;
    od;

    return rec(
        classlengths := cllen,
        occurences   := clcnt
    );
end;


#############################################################################
##
#F  AgGroupOps.NumberConjugacyClasses( [<U>, ]<H> ) . . . . . . . . . . . . .
#F  . . .  compute the number of conjugacy classes of elements in an ag-group
##
##  This  function  determines the number of conjugacy classes of elements in
##  an  ag-group using linear methods.  First the conjugacy classes of the group
##  modulo  the  last  normal  subgroup  in  an elementary abelian series are
##  computed  using  'MainEntryECSAgGroup'.   Then  for  each coset and corresponding
##  centralizer  the  number  of classes in that coset under the operation of
##  the  centralizer is determined using the lemma of cauchy/frobenius.  This
##  may,  for  soluble  groups,  efficiently be done by solving inhomogeneous
##  systems  of linear equations and by determining the conjugacy classes of the
##  centralizer.
##
##  returns
##
##      <integer>
##
AgGroupOps.NumberConjugacyClasses := function( arg )
    local   usage, G, H, U, HU, T, elabser, natisom, number;

    if    Length( arg ) = 1 then  H := arg[1]; U := H;
    elif  Length( arg ) = 2 then  H := arg[2]; U := arg[1];
    else
        Error( "usage: NumberConjugacyClasses( [<U>, ]<H> )" );
    fi;

    G := Parent( H );
    T := TrivialSubgroup( G );

    if IsNormal( G, H ) then
        if IsElementaryAbelianAgSeries( G )
          and IsElementAgSeries( H ) then
            elabser := List(ElementaryAbelianSeries( [ G, H, T ] ),
			    Normalized);
            number  := MainEntryNECSAgGroup( G, U, H, elabser );
        else
            elabser := List(ElementaryAbelianSeries( [ G, H, T ] ),
			    Normalized);
            natisom := IsomorphismAgGroup( elabser );
            elabser := List(ElementaryAbelianSeries( natisom.range ),
			    Normalized);
            number  := MainEntryNECSAgGroup(
                natisom.range, Image( natisom, U ), Image( natisom, H ),
                elabser );
        fi;
    elif IsNormal( U, H ) then
        HU := SumAgGroup( H, U );
        elabser := List(ElementaryAbelianSeries( [ HU, H, T ] ),
			Normalized);
        natisom := IsomorphismAgGroup( elabser );
        elabser := List(ElementaryAbelianSeries( natisom.range ),
			Normalized);
        number  := MainEntryNECSAgGroup(
            natisom.range, Image( natisom, U ), Image( natisom, H ), elabser );
    else
        Error( "sorry, U must operate on H" );
    fi;

    return number;
end;


#############################################################################
##
#F  StructureConjugacyClasses( [<U>, ]<H> ) . . . . . . . . . . . . . . . . .
#F  . . . . compute the structure of conjugacy classes of elements in a group
##
StructureConjugacyClasses := function( arg )
    if Length( arg ) = 1 then
        return arg[1].operations.StructureConjugacyClasses( arg[1] );
    elif Length( arg ) = 2 then
        return arg[1].operations.StructureConjugacyClasses( arg[1], arg[2] );
    else
        Error( "usage: StructureConjugacyClasses( [<U>, ]<H> )" );
    fi;
end;


#############################################################################
##
#F  AgGroupOps.StructureConjugacyClasses( [<U>, ]<H> )  . . . . . . . . . . .
#F  . determine the structure of conjugacy classes of elements in an ag-group
##
##  This  function  determines the structure of conjugacy classes of elements
##  in  an  ag-group  using  linear methods.  First the conjugacy classes of the
##  group modulo the last normal subgroup in an elementary abelian series are
##  computed  using  'MainEntryECSAgGroup'.   Then  for  each coset and corresponding
##  centralizer the structure of classes in that coset under the operation of
##  the   centralizer   is  determined  using  the  burnside  matrix  of  the
##  centralizer.
##
##  returns
##
##      rec(
##          classlengths := [ <integer> ],
##          occurences   := [ <integer> ]
##      )
##
AgGroupOps.StructureConjugacyClasses := function( arg )
    local   usage, G, H, U, HU, T, elabser, natisom, strct;

    if    Length( arg ) = 1 then  H := arg[1]; U := H;
    elif  Length( arg ) = 2 then  H := arg[2]; U := arg[1];
    else
        Error( "usage: StructureConjugacyClasses( [<U>, ]<H> )" );
    fi;

    G := Parent( H );
    T := TrivialSubgroup( G );

    if IsNormal( G, H ) then
        if IsElementaryAbelianAgSeries( G )
          and IsElementAgSeries( H ) then
            elabser := List(ElementaryAbelianSeries( [ G, H, T ] ),
			    Normalized);
            strct   := MainEntrySECSAgGroup( G, U, H, elabser );
        else
            elabser := List(ElementaryAbelianSeries( [ G, H, T ] ),
			    Normalized);
            natisom := IsomorphismAgGroup( elabser );
            elabser := List(ElementaryAbelianSeries( natisom.range ),
			    Normalized);
            strct   := MainEntrySECSAgGroup(
                natisom.range, Image( natisom, U ), Image( natisom, H ),
                elabser );
        fi;
    elif IsNormal( U, H ) then
        HU := SumAgGroup( H, U );
        elabser := List(ElementaryAbelianSeries( [ HU, H, T ] ),
			Normalized);
        natisom := IsomorphismAgGroup( elabser );
        elabser := List(ElementaryAbelianSeries( natisom.range ),
			Normalized);
        strct   := MainEntrySECSAgGroup(
            natisom.range, Image( natisom, U ), Image( natisom, H ), elabser );
    else
        Error( "sorry, U must operate on H" );
    fi;

    return strct;
end;


AgGroupOps.ConjugacyClass := function( G, g )
   local c;

   c := GroupOps.ConjugacyClass( G, g );
   c.operations := ConjugacyClassAgGroupOps;
   return c;
end;


ConjugacyClassAgGroupOps := Copy( ConjugacyClassGroupOps );


ConjugacyClassAgGroupOps.\= := function( C, D )
    local   isEql;

    if     IsRec( C ) and IsBound( C.isConjugacyClass )
       and IsRec( D ) and IsBound( D.isConjugacyClass )
       and C.group = D.group
    then
    	isEql := CanonicalRepresentative(C)
	         = CanonicalRepresentative(D);
    else
    	isEql := DomainOps.\=( C, D );
   fi;
   return isEql;
end;


ConjugacyClassAgGroupOps.\in := function( g, C )
    if IsBound( C.elements ) then
      return g in C.elements;
    elif Size( C.group ) <= 1000 then
      return g in Elements( C );
    else
      return  C.group.operations.CanonicalClassElement( C.group, g ) 
	      = CanonicalRepresentative(C);
    fi;
end;

ConjugacyClassAgGroupOps.CanonicalRepresentative := function( C )
  return C.group.operations.CanonicalClassElement( C.group,
						   C.representative );
end;

