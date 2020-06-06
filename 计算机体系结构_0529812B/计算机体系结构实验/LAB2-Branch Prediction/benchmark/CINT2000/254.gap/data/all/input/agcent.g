#############################################################################
##
#A  agcent.g                    GAP library                    J\"urgen Mnich
##
#A  @(#)$Id: agcent.g,v 3.17.1.1 1995/11/22 08:55:36 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions for calculating centralizers in groups given
##  by a pcp-presentation and related problems.
##
#H  $Log: agcent.g,v $
#H  Revision 3.17.1.1  1995/11/22  08:55:36  sam
#H  changed from MatGroup & CompositionFactors to MTXOps.CompositionFactors
#H
#H  Revision 3.17  1994/05/31  13:01:36  ahulpke
#H  force Normalized EASeries (which is supposed by some routines)
#H
#H  Revision 3.16  1994/03/21  13:10:24  beick
#H  Changed 'GeneratorsCentrePGroup' slightly again
#H
#H  Revision 3.15  1994/03/11  11:05:42  beick
#H  changed 'GeneratorsCentrePGroup' slightly
#H
#H  Revision 3.14  1994/03/09  14:07:59  beick
#H  Added 'AgGroupOps.GeneratorsCentrePGroup'
#H
#H  Revision 3.13  1994/02/01  10:30:18  fceller
#H  fixed another bug in 'MainEntryACAgWords'
#H
#H  Revision 3.12  1994/01/25  14:46:28  ahulpke
#H  fixed faulty usage of AgSubgroup in MainEntryCSAgGroup
#H  and removed the statistical variables
#H
#H  Revision 3.11  1993/06/23  16:28:55  fceller
#H  fixed 'AgGroupOps.CanonicalClassElement'
#H
#H  Revision 3.10  1993/03/17  13:42:59  ahulpke
#H  Use of canonical class elements
#H
#H  Revision 3.9  1993/01/15  12:06:27  fceller
#H  fixed ".domain" entry, but the 'ConjugacyClass' command
#H  is still very strange (and maybe buggy) and should be
#H  correct soon
#H
#H  Revision 3.8  1992/10/28  14:04:00  fceller
#H  fixed a bug 'MainEntryCentAgGroup'
#H
#H  Revision 3.7  1992/04/07  16:15:32  jmnich
#H  adapted to changes in the finite field module
#H
#H  Revision 3.6  1992/04/03  09:11:20  jmnich
#H  added 'field' to factorgroups
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
#F  InfoAgCent1(...)  . . . . . . . . . . . . . . . . . . package information
#F  InfoAgCent2(...)  . . . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoAgCent1 )  then  InfoAgCent1 := Ignore;  fi;
if not IsBound( InfoAgCent2 )  then  InfoAgCent2 := Ignore;  fi;

#############################################################################
##
#F  MainEntryCSAgGroup( <G>, <U>, <H>, <elabser> )  . . . . . . . . . . . . .
##
##  This  is the main routine for the computation of a chiefseries in soluble
##  groups.  (However there are no subroutines.  Nearly.  8-) )
##  The  author's  MeatAxe module is used to decompose the elementary abelian
##  factors of the given group.
##
##  returns
##
##      <list>
##
##  Again,  for  those  who wish to use this function directly, without going
##  through the top-level function, here is what you need:
##
##  G           the parentgroup
##  U           the subgroup of G acting on H
##  H           a normal composition subgroup of G, an element of elabser
##  elabser     an elementary abelian composition series of G containing H
##
MainEntryCSAgGroup := function( G, U, H, elabser )
    local   series, subser, fachom, tmpU, facU, facN, fhom,
            idx, step, ints, nigs, ndim, tmp, v, g, z, i, j;

    if U.generators = [] then  return CompositionSeries( H );  fi;
    if H.generators = [] then  return [ H ];                   fi;

    idx := 1;
    while elabser[idx] <> H do  idx := idx + 1;  od;

    if idx <> 1 then
        elabser := Sublist( elabser, [idx..Length( elabser )] );
    fi;
    fachom := HomomorphismsSeries( G, elabser );


    # initialize the inductive algorithm

    series := [];

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

        InfoAgCent1( "#I  cs: step ", step, " / ", Length( elabser ), "\n" );

        # get the appropriate new data

        fhom := fachom[step];
        facN := PreImage( fhom, TrivialSubgroup( fhom.range ) );
        facU := U[step-1];

        # map results from last step to current step

        Apply( series, x -> PreImage( fhom, x ) );

        if Length( facN.generators ) = 1 then
            Add( series, facN );
        elif facU.generators = [] then
            Append( series, CompositionSeries( facN ) );
        else
            facN.field := GF( RelativeOrderAgWord( facN.generators[1] ) );

            nigs   := Igs( facN );
            ndim   := Length( nigs );
            tmp    := List( Igs( facU ), x -> FactorAgWord( x, fhom.source.identity ) );
            tmp    := List( tmp, x -> List( nigs, y -> Exponents( facN, y ^ x, facN.field ) ) );
            subser := MTXOps.CompositionFactors(
                           [ tmp, facN.field, Length( tmp[1] ) ] ).bases;
            ints   := IntegerTable( facN.field );

            for tmp in subser do
                for i in [1..Length( tmp )] do
                    v := tmp[i];
                    g := facN.identity;
                    for j in [1..ndim] do
                        z := LogVecFFE( v, j );
                        if z <> false then
                            g := g * nigs[j] ^ ints[z+1];
                        fi;
                    od;
                    tmp[i] := g;
                od;
            od;
            for i in Reversed( [1..Length( subser )-1] ) do
                Append( subser[i], subser[i+1] );
            od;
            Apply( subser, x -> Subgroup( Parent(facN), x ) );
            Append( series, subser );
        fi;
    od;
    Add( series, TrivialSubgroup( G ) );
    return series;
end;


#############################################################################
##
#F  AgGroupOps.ChiefSeries( [<U>, ]<H> )  . . . . chiefseries for an ag-group
##
##  This function determines a chiefseries for a given ag-group with respect
##  to the operation of the optional argument <U> which is an ag-group that acts
##  on <H> by conjugation. The author's MeatAxe module is used to
##  determine the simple factormodules in the elementary abelian factors of
##  <H> and the result is recomputed in terms of factorgroups for
##  <H>.
##
##  returns
##
##      <list>
##
AgGroupOps.ChiefSeries := function( arg )
    local   usage, G, H, U, HU, T, elabser, natisom, series;

    if    Length( arg ) = 1 then  H := arg[1]; U := H;
    elif  Length( arg ) = 2 then  H := arg[2]; U := arg[1];
    else
        Error( "usage: ChiefSeries( [<U>, ]<H> )" );
    fi;

    G := Parent( H );
    T := TrivialSubgroup( G );

    if IsNormal( G, H ) then
        if IsElementaryAbelianAgSeries( G )
          and IsElementAgSeries( H ) then
            elabser := List(ElementaryAbelianSeries( [ G, H, T ] ),
			    Normalized);
            series  := MainEntryCSAgGroup( G, U, H, elabser );
        else
            elabser := List(ElementaryAbelianSeries( [ G, H, T ] ),
			    Normalized);
            natisom := IsomorphismAgGroup( elabser );
            elabser := List(ElementaryAbelianSeries( natisom.range ),
			    Normalized);
            series  := MainEntryCSAgGroup( natisom.range,
                        Image( natisom, U ), Image( natisom, H ), elabser );
            Apply( series, x -> PreImage( natisom, x ) );
        fi;
    elif IsNormal( U, H ) then
        HU := SumAgGroup( H, U );
        elabser := List(ElementaryAbelianSeries( [ HU, H, T ] ),
			Normalized);
        natisom := IsomorphismAgGroup( elabser );
        elabser := List(ElementaryAbelianSeries( natisom.range ),
			Normalized);
        series  := MainEntryCSAgGroup( natisom.range,
                    Image( natisom, U ), Image( natisom, H ), elabser );
        Apply( series, x -> PreImage( natisom, x ) );
    else
        Error( "sorry, U must operate on H" );
    fi;

    return series;
end;


#############################################################################
##
#F  CentralCaseCentAgGroup( <G>, <N>, <C>, <M>, <h>, <n> )  . . . . . . . . .
##
##  returns
##
##      rec(
##          C := <aggroup>,
##          M := <aggroup>
##      )
##
CentralCaseCentAgGroup := function( G, N, C, M, h, n )
    local   h_C_comm, cg, newC, newM, cigs, tmp, v, g, z, i, j;

    InfoAgCent1( "#I  cent: central case main dispatcher\n" );

    if not IsBound( N.field ) then
        N.field := GF( RelativeOrderAgWord( N.generators[1] ) );
    fi;

    if C = [] then
        InfoAgCent2( "#I  cent: central_1\n" );
        newC := C;
        newM := M;
    else
        InfoAgCent2( "#I  cent: central_2\n" );
        h_C_comm := [];
        for i in [1..Length( C )] do
            h_C_comm[i] := Exponents( N, Comm( h, C[i] ), N.field );
        od;

        cg  := CommutatorGauss( Copy( h_C_comm ), N.field );
        tmp := [];
        for i in [cg.commutator+1..cg.commutator+cg.centralizer] do
            v := cg.matrix[i];
            g := G.identity;
            for j in [cg.dimensionN+1..cg.dimensionN+cg.dimensionC] do
                z := LogVecFFE( v, j );
                if z <> false then
                    g := g * C[j-cg.dimensionN] ^ cg.integers[z+1];
                fi;
            od;
            tmp[i-cg.commutator] := g;
        od;
        cg.centralizer := tmp;

        newC := cg.centralizer;
        newM := M;
    fi;

    return rec( C := newC, M := newM );
end;


#############################################################################
##
#F  GeneralCaseCentAgGroup( <G>, <N>, <C>, <M>, <h>, <n> )  . . . . . . . . .
##
##  returns
##
##      rec(
##          C := <aggroup>,
##          M := <aggroup>
##      )
##
GeneralCaseCentAgGroup := function( G, N, C, M, h, n )
    local   N_C_pow, h_M_comm, centrala, centralb, ncgs, cigs, migs, n2cgs,
            ndim, clen, mlen, n2dim, orb, v, g, z, newC, newM, cg, cg2,
            wn2cgs, comm_h_M, N2_C_pow, h_C_comm, N2, tmp, i, j;

    InfoAgCent1( "#I  cent: general case main dispatcher\n" );

    if not IsBound( N.field ) then
        N.field := GF( RelativeOrderAgWord( N.generators[1] ) );
    fi;

    ncgs := Cgs( N );
    cigs := C;
    migs := M;
    ndim := Length( ncgs );
    clen := Length( cigs );
    mlen := Length( migs );

    centrala := true;
    centralb := true;
    N_C_pow  := [];
    for i in [1..clen] do
        N_C_pow[i] := [];
        for j in [1..ndim] do
            N_C_pow[i][j] := ncgs[j] ^ cigs[i];
            if N_C_pow[i][j] <> ncgs[j] then  centrala := false;  fi;
        od;
    od;

    h_M_comm := [];
    for i in [1..mlen] do
        h_M_comm[i] := Comm( h, migs[i] );
        if h_M_comm[i] <> N.identity then  centralb := false;  fi;
    od;

    if centrala and centralb then
        InfoAgCent2( "#I  cent: non_central_1 ->\n" );
        return CentralCaseCentAgGroup( G, N, C, M, h, n );
    fi;

    if centralb then
        InfoAgCent2( "#I  cent: non_central_2\n" );
        for i in [1..clen] do
            tmp := N_C_pow[i];
            for j in [1..ndim] do
                tmp[j] := Exponents( N, tmp[j], N.field );
                tmp[j][ndim+1] := N.field.zero;
            od;
            tmp[ndim+1] := Exponents( N, Comm( h, cigs[i] ), N.field );
            tmp[ndim+1][ndim+1] := N.field.one;
        od;
        v    := Exponents( N, n, N.field );
        v[ndim+1] := N.field.one;
        orb  := AgOrbitStabilizer( AgSubgroup( G, C, false ), N_C_pow, v );
        newC := Igs( orb.stabilizer );
        newM := M;

        return rec( C := newC, M := newM );
    fi;

    for i in [1..mlen] do
        h_M_comm[i] := Exponents( N, h_M_comm[i], N.field );
    od;

    if centrala then
        InfoAgCent2( "#I  cent: non_central_3\n" );
        h_C_comm := [];
        for i in [1..clen] do
            h_C_comm[i] := Exponents( N, Comm( h, cigs[i] ), N.field );
        od;
        Append( cigs, migs );
        Append( h_C_comm, h_M_comm );

        cg := CommutatorGauss( Copy( h_C_comm ), N.field );

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
        cg.centralizer := tmp;

        newC := cg.centralizer;
        newM := [];

        return rec( C := newC, M := newM );
    fi;

    cg := CommutatorGauss( Copy( h_M_comm ), N.field );

    if cg.commutatorFactor = [] then
        InfoAgCent2( "#I  cent: non_central_4\n" );
        newC := CorrectedStabilizer( h_M_comm, N, C, M, h, n, false );
        newM := [];
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
            InfoAgCent2( "#I  cent: non_central_5\n" );
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
                g := G.identity;
                for j in [cg2.dimensionN+1..cg2.dimensionN+cg2.dimensionC] do
                    z := LogVecFFE( v, j );
                    if z <> false then
                        g := g * C[j-cg2.dimensionN] ^ cg2.integers[z+1];
                    fi;
                od;
                tmp[i-cg2.commutator] := g;
            od;
            cg2.centralizer := tmp;
 
            newC := Concatenation(
               CorrectedStabilizer( h_M_comm, N, cg2.centralizer, M, h, n, false ),
               cg.centralizer
            );
            newM := [];
        else
            InfoAgCent2( "#I  cent: non_central_6\n" );
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

            v    := Exponents( N2, n, N2.field );
            v[n2dim+1] := N.field.one;
            orb  := AgOrbitStabilizer( AgSubgroup( G, C, false ), N2_C_pow, v );
            newC := Concatenation(
               CorrectedStabilizer( h_M_comm, N, Igs( orb.stabilizer ), M, h, n, false ),
               cg.centralizer
            );
            newM := [];
        fi;
    fi;

    return rec( C := newC, M := newM );
end;


#############################################################################
##
#F  MainEntryCentAgGroup( <G>, <U>, <H>, <ser> )  . . . . . . . . . . . . . .
##
##  returns
##
##      <aggroup>
##
MainEntryCentAgGroup := function( G, U, H, elabser )
    local   tmpU, tmpH, fachom, fhom, C, hn, h, n, facU, facN, idx,
            step, repnum, res, i;

    if U.generators = [] then  return U;  fi;
    if H.generators = [] then  return U;  fi;

    idx := 1;
    while IsSubgroup( elabser[idx+1], H ) do  idx := idx + 1;  od;
    while IsSubgroup( elabser[idx+1], U ) do  idx := idx + 1;  od;

    if idx <> 1 then
        elabser := Sublist( elabser, [idx..Length( elabser )] );
    fi;
    fachom := HomomorphismsSeries( G, elabser );

    # initialize the inductive algorithm

    C := Igs( Image( fachom[1], U ) );

    # prepare the involved data for each following step

    tmpU := U;
    tmpH := H.generators;
    U    := [];
    H    := [];
    U[Length( elabser )] := tmpU;
    H[Length( elabser )] := tmpH;
    for step in Reversed( [2..Length( elabser )] ) do
        tmpU := Image( fachom[step], tmpU );
        U[step-1] := tmpU;
        tmpH := List( tmpH, x -> Image( fachom[step], x ) );
        H[step-1] := tmpH;
    od;

    # loop over the elementary abelian series

    for step in [2..Length( elabser )] do

        InfoAgCent1( "#I  cent: step ", step, " / ", Length( elabser ), "\n" );

        # get the appropriate new data

        fhom := fachom[step];
        facN := PreImage( fhom, TrivialSubgroup( fhom.range ) );

        # map results from last step to current step

        tmpU := SumFactorizationFunctionAgGroup( U[step], facN );
        facU := Igs( tmpU.intersection );
        Apply( C, x -> tmpU.factorization( FactorAgWord( x, 
                       fhom.source.identity ) ).u );
        res := rec( C := C, M := facU );

        hn  := H[step];
        h   := List( H[step-1], x -> FactorAgWord( x, fhom.source.identity ) );
        n   := [];
        for i in [1..Length( h )] do  n[i] := h[i]^-1 * hn[i];   od;

        if IsCentral( fhom.source, facN ) then
            for repnum in [1..Length( h )] do
                res := CentralCaseCentAgGroup(
                        fhom.source, facN, res.C, res.M, h[repnum], n[repnum] );
            od;
        else
            for repnum in [1..Length( h )] do
                res := GeneralCaseCentAgGroup(
                        fhom.source, facN, res.C, res.M, h[repnum], n[repnum] );
            od;
        fi;

        C := Concatenation( res.C, res.M );
    od;
    return AgSubgroup( G, C, false );
end;


#############################################################################
##
#F  AgGroupOps.Centralizer( [<U>, ]<H> )  . . . . . . . . . . . . . . . . . .
##
##
##  returns
##
##      <aggroup>
##
AgGroupOps.Centralizer := function( arg )
    local   G, U, H, elabser, natisom, res;

    if    Length( arg ) = 1 then
        H := arg[1];
        G := Parent( H );
        U := G;
    elif  Length( arg ) = 2 then
        if IsAgWord( arg[2] ) then
            U := arg[1];
            H := U.operations.Subgroup( U, [ arg[2] ] );
            G := Parent( H );
        else
            U := arg[1];
            H := arg[2];
            G := Parent( H );
        fi;
    else
        Error( "usage: Centralizer( [<U>, ]<H> )" );
    fi;

    if not IsElementaryAbelianAgSeries( G ) then
        elabser := ElementaryAbelianSeries( G );
        natisom := IsomorphismAgGroup( elabser );
        elabser := List(ElementaryAbelianSeries( natisom.range ),
			Normalized);
        res     := MainEntryCentAgGroup(
                    natisom.range, Image( natisom, U ), Image( natisom, H ),
                    elabser );
        res     := PreImage( natisom, res );
    else
        elabser := List(ElementaryAbelianSeries( G ), Normalized);
        res     := MainEntryCentAgGroup( G, U, H, elabser );
    fi;

    return res;
end;


#############################################################################
##
#F  AgGroupOps.Centralizer2( [<U>, ]<H> ) . . . . . . . . . . . . . . . . . .
##
##  returns
##
##      <aggroup>
##
AgGroupOps.Centralizer2 := function( arg )
    local   G, U, H, rep, res;

    if    Length( arg ) = 1 then
        H := arg[1];
        G := Parent( H );
        U := G;
    elif  Length( arg ) = 2 then
        if IsAgWord( arg[2] ) then
            U := arg[1];
            H := AgSubgroup( U, [ arg[2] ], false );
            G := Parent( H );
        else
            U := arg[1];
            H := arg[2];
            G := Parent( H );
        fi;
    else
        Error( "usage: Centralizer( [<U>, ]<H> )" );
    fi;

    if U.generators = [] then  return U;  fi;
    if H.generators = [] then  return U;  fi;

    for rep in H.generators do
        res := ConjugacyClasses( U, [ rep ] );
        U   := res[1].centralizer ^ (res[1].conjugand^-1);
    od;

    return U;
end;


#############################################################################
##
#F  CentralCaseECAgWords( <G>, <N>, <C>, <M>, <h>, <n> )  . . . . . . . . . .
##
##  returns
##
##      rec(
##          representative := <agword>,
##          centralizer    := [ <agword> ],
##          conjugand      := <agword>
##      )
##
CentralCaseECAgWords := function( G, N, C, M, h, n )
   local    h_C_comm, ncgs, cigs, migs, N2, n2cgs, cg, rep, cent, conj,
            tmp, v, g, z, i, j;


    if not IsBound( N.field ) then
        N.field := GF( RelativeOrderAgWord( N.generators[1] ) );
    fi;

    if C = [] then
        rep  := h * n;
        cent := M;
        conj := G.identity;
    else
        ncgs := Cgs( N );
        cigs := C;
        migs := M;

        h_C_comm := [];
        for i in [1..Length( cigs )] do
            h_C_comm[i] := Exponents( N, Comm( h, cigs[i] ), N.field );
        od;

        cg := CommutatorGauss( Copy( h_C_comm ), N.field );

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
        cg.centralizer := tmp;

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
        N2.field := N.field;
        n2cgs    := N2.generators;

        v := Exponents( N2, n );
        g := G.identity;
        for j in [1..Length( n2cgs )] do
            z := v[j];
            if z <> 0 then
                g := g * n2cgs[j] ^ z;
            fi;
        od;
        rep := g;

        v := SolutionMat( h_C_comm, Exponents( N, n^-1 * rep, N.field ) );
        g := G.identity;
        for j in [1..Length( cigs )] do
            z := LogVecFFE( v, j );
            if z <> false then
                g := g * cigs[j] ^ cg.integers[z+1];
            fi;
        od;

        conj := g;
        rep  := h * rep;
        cent := Concatenation( cg.centralizer, migs );
   fi;
   return rec(
      representative := rep,
      centralizer    := cent,
      conjugand      := conj
   );
end;


#############################################################################
##
#F  GeneralCaseECAgWords( <G>, <N>, <C>, <M>, <h>, <n> )  . . . . . . . . . .
##
##  returns
##
##      rec(
##          representative := <agword>,
##          centralizer    := [ <agword> ],
##          conjugand      := <agword>
##      )
##
GeneralCaseECAgWords := function( G, N, C, M, h, n )
   local    N_C_pow, h_M_comm, ncgs, cigs, migs, ndim, clen, mlen,
            centrala, centralb, orb, v, g, z, cent, rep, conj, cg, cg2,
            comm_h_M, N2_C_pow, h_C_comm, N2, N3, n2cgs, n2dim, n3cgs,
            minp, comm_h_CM, wn2cgs, tmp, i, j;

    if not IsBound( N.field ) then
        N.field := GF( RelativeOrderAgWord( N.generators[1] ) );
    fi;

    ncgs := Cgs( N );
    cigs := C;
    migs := M;
    ndim := Length( ncgs );
    clen := Length( cigs );
    mlen := Length( migs );

    centrala := true;
    centralb := true;
    N_C_pow  := [];
    for i in [1..clen] do
        N_C_pow[i] := [];
        for j in [1..ndim] do
            N_C_pow[i][j] := ncgs[j] ^ cigs[i];
            if N_C_pow[i][j] <> ncgs[j] then  centrala := false;  fi;
        od;
    od;

    h_M_comm := [];
    for i in [1..mlen] do
        h_M_comm[i] := Comm( h, migs[i] );
        if h_M_comm[i] <> N.identity then  centralb := false;  fi;
    od;

    if centrala and centralb then
        return CentralCaseECAgWords( G, N, C, M, h, n );
    fi;

    if centralb then
        for i in [1..clen] do
            tmp := N_C_pow[i];
            for j in [1..ndim] do
                tmp[j] := Exponents( N, tmp[j], N.field );
                tmp[j][ndim+1] := N.field.zero;
            od;
            tmp[ndim+1] := Exponents( N, Comm( h, cigs[i] ), N.field );
            tmp[ndim+1][ndim+1] := N.field.one;
        od;
        v    := Exponents( N, n, N.field );
        v[ndim+1] := N.field.one;
        orb  := MinimalVectorAgOrbit( AgSubgroup( G, C, false ), N_C_pow, v, N.field );
        cg   := IntegerTable( N.field );

        v := orb.vector;
        g := G.identity;
        for j in [1..ndim] do
            z := LogVecFFE( v, j );
            if z <> false then
                g := g * ncgs[j] ^ cg[z+1];
            fi;
        od;
        rep  := h * g;
        conj := orb.operator;
        cent := Concatenation( Igs( orb.stabilizer ^ conj ), migs );

        return rec(
            representative := rep,
            centralizer    := cent,
            conjugand      := conj
        );
    fi;

    for i in [1..mlen] do
        h_M_comm[i] := Exponents( N, h_M_comm[i], N.field );
    od;

    if centrala then
        h_C_comm := [];
        for i in [1..clen] do
            h_C_comm[i] := Exponents( N, Comm( h, cigs[i] ), N.field );
        od;
        Append( cigs, migs );
        Append( h_C_comm, h_M_comm );

        cg := CommutatorGauss( Copy( h_C_comm ), N.field );

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
        cg.centralizer := tmp;

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
        N2.field := N.field;
        n2cgs    := N2.generators;

        v := Exponents( N2, n );
        g := G.identity;
        for j in [1..Length( n2cgs )] do
            z := v[j];
            if z <> 0 then
                g := g * n2cgs[j] ^ z;
            fi;
        od;
        rep := g;

        v := SolutionMat( h_C_comm, Exponents( N, n^-1 * rep, N.field ) );
        g := G.identity;
        for j in [1..Length( cigs )] do
            z := LogVecFFE( v, j );
            if z <> false then
                g := g * cigs[j] ^ cg.integers[z+1];
            fi;
        od;

        conj := g;
        rep  := h * rep;
        cent := cg.centralizer;

        return rec(
            representative := rep,
            centralizer    := cent,
            conjugand      := conj
        );
    fi;

    cg := CommutatorGauss( Copy( h_M_comm ), N.field );

    if cg.commutatorFactor = [] then
        rep := h;

        v := SolutionMat( h_M_comm, Exponents( N, n^-1, N.field ) );
        g := G.identity;
        for j in [1..mlen] do
            z := LogVecFFE( v, j );
            if z <> false then
                g := g * migs[j] ^ cg.integers[z+1];
            fi;
        od;

        conj := g;
        cent := CorrectedStabilizer( h_M_comm, N, C, migs, h, N.identity, false );
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
                g := G.identity;
                for j in [cg2.dimensionN+1..cg2.dimensionN+cg2.dimensionC] do
                    z := LogVecFFE( v, j );
                    if z <> false then
                        g := g * C[j-cg2.dimensionN] ^ cg2.integers[z+1];
                    fi;
                od;
                tmp[i-cg2.commutator] := g;
            od;
            cg2.centralizer := tmp;

            tmp := [];
            for i in [1..cg2.commutator] do
                v := cg2.matrix[i];
                g := G.identity;
                for j in [1..cg2.dimensionN] do
                    z := LogVecFFE( v, j );
                    if z <> false then
                        g := g * n2cgs[j] ^ cg2.integers[z+1];
                    fi;
                od;
                tmp[i] := g;
            od;
            cg2.commutator := tmp;

            N3 := N mod MergedIgs( N, N2.factorDen, cg2.commutator, false );
            N3.field := N.field;
            n3cgs    := N3.generators;

            v := Exponents( N3, n );
            g := G.identity;
            for j in [1..Length( n3cgs )] do
                z := v[j];
                if z <> 0 then
                    g := g * n3cgs[j] ^ z;
                fi;
            od;
            rep := g;

            v := SolutionMat( h_C_comm, Exponents( N2, n^-1 * rep, N2.field ) );
            g := G.identity;
            for j in [1..clen] do
                z := LogVecFFE( v, j );
                if z <> false then
                    g := g * cigs[j] ^ cg.integers[z+1];
                fi;
            od;
            conj := g;

            v := SolutionMat( h_M_comm,
                              Exponents( N, ((h * rep)^-1 * (h * n)^conj)^-1, N.field ) );
            g := G.identity;
            for j in [1..mlen] do
                z := LogVecFFE( v, j );
                if z <> false then
                    g := g * migs[j] ^ cg.integers[z+1];
                fi;
            od;
            conj := conj * g;

            cent := Concatenation(
                CorrectedStabilizer( h_M_comm, N, cg2.centralizer, migs, h, rep, false ),
                cg.centralizer
            );
            rep := h * rep;
        else
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

            v    := Exponents( N2, n, N2.field );
            v[n2dim+1] := N.field.one;
            orb  := MinimalVectorAgOrbit( AgSubgroup( G, C, false ), N2_C_pow, v, N.field );

            v := orb.vector;
            g := G.identity;
            for j in [1..n2dim] do
                z := LogVecFFE( v, j );
                if z <> false then
                    g := g * n2cgs[j] ^ cg.integers[z+1];
                fi;
            od;
            rep  := g;
            conj := orb.operator;
            cent := orb.stabilizer ^ conj;
            cent := Concatenation(
                CorrectedStabilizer( h_M_comm, N, Igs( cent ), migs, h, rep, false ),
                cg.centralizer
            );

            v := SolutionMat( h_M_comm,
                              Exponents( N, ((h * rep)^-1 * (h * n)^conj)^-1, N.field ) );
            g := G.identity;
            for j in [1..mlen] do
                z := LogVecFFE( v, j );
                if z <> false then
                    g := g * migs[j] ^ cg.integers[z+1];
                fi;
            od;
            conj := conj * g;
            rep  := h * rep;
       fi;
   fi;
   return rec(
      representative := rep,
      centralizer    := cent,
      conjugand      := conj
   );
end;


#############################################################################
##
#F  MainEntryECAgWords( <G>, <U>, <elems>, <elabser> )  . . . . . . . . . . .
##
##  returns
##
##      rec(
##          elements        := [ <agword> ],
##          representatives := [ <agword> ],
##          centralizers    := [ <aggroups> ],
##          conjugands      := [ <agword> ]
##      )
##
MainEntryECAgWords := function( G, U, elems, elabser )
    local   tmpU, tmpe, fachom, fhom, rep, cent, conj, facU, face, felems,
            step, facN, ctrly, repnum, idx, res;

    if U.generators = [] or Set( elems ) = [ G.identity ] then
        return rec(
            elements        := elems,
            representatives := elems,
            centralizers    := List( elems, x -> U ),
            conjugands      := List( elems, x -> U.identity )
        );
    fi;

    idx := 1;
    while IsSubgroup( elabser[idx+1], U ) do  idx := idx + 1;  od;
    while not false in List( elems, x -> x in elabser[idx+1] ) do
        idx := idx + 1;
    od;

    if idx <> 1 then
        elabser := Sublist( elabser, [idx..Length( elabser )] );
    fi;
    fachom := HomomorphismsSeries( G, elabser );


    # initialize the inductive algorithm

    tmpU := Image( fachom[1], U );
    rep  := List( elems, x -> Image( fachom[1], x ) );
    cent := List( elems, x -> tmpU.generators );
    conj := List( elems, x -> tmpU.identity );

    # prepare the involved data for each following step

    tmpU := U;
    tmpe := elems;
    U     := [];
    elems := [];
    U[Length( elabser )]     := tmpU;
    elems[Length( elabser )] := tmpe;
    for step in Reversed( [2..Length( elabser )] ) do
        tmpU := Image( fachom[step], tmpU );
        U[step-1] := tmpU;
        tmpe := List( tmpe, x -> Image( fachom[step], x ) );
        elems[step-1] := tmpe;
    od;

    # loop over the elementary abelian series

    for step in [2..Length( elabser )] do

        InfoAgCent1( "#I  ec: step ", step, " / ", Length( elabser ), "\n" );

        # get the appropriate new data

        fhom := fachom[step];
        facN := PreImage( fhom, TrivialSubgroup( fhom.range ) );
        facU := Igs( Intersection( U[step], facN ) );
        face := elems[step];

        # map results from last step to current step

        Apply( rep,  x -> FactorAgWord( x, fhom.source.identity ) );
        Apply( cent, x -> List( x, y -> FactorAgWord( y, fhom.source.identity ) ) );
        Apply( conj, x -> FactorAgWord( x, fhom.source.identity ) );

        if IsCentral( fhom.source, facN ) then
            for repnum in [1..Length( rep )] do
                res := CentralCaseECAgWords( fhom.source, facN, cent[repnum], facU, rep[repnum],
                        rep[repnum]^-1 * (face[repnum] ^ conj[repnum]) );
                cent[repnum] := res.centralizer;
                rep[repnum]  := res.representative;
                conj[repnum] := conj[repnum] * res.conjugand;
            od;
        else
            for repnum in [1..Length( rep )] do
                res := GeneralCaseECAgWords( fhom.source, facN, cent[repnum], facU, rep[repnum],
                        rep[repnum]^-1 * (face[repnum] ^ conj[repnum]) );
                cent[repnum] := res.centralizer;
                rep[repnum]  := res.representative;
                conj[repnum] := conj[repnum] * res.conjugand;
            od;
        fi;
    od;
    Apply( cent, x -> AgSubgroup( G, x, false ) );

    return rec(
        elements        := elems[Length( elabser )],
        representatives := rep,
        centralizers    := cent,
        conjugands      := conj
    );
end;


#############################################################################
##
#F  MainEntryACAgWords( <G>, <U>, <elems>, <elabser> ) . . . . . . . . . . . .
##
##  returns
##
##      rec(
##          areConjugate    := <boolean>,
##          elements        := [ <agword> ],
##          representative  := <agword>,
##          centralizer     := <aggroups>,
##          conjugands      := [ <agword> ]
##      )
##
MainEntryACAgWords := function( G, U, elems, elabser )
    local   tmpU, tmpe, fachom, fhom, felems, rep, cent, conj, facU,
            step, facN, face, ctrly, elnum, res, rep2, cent2, idx, uhom;

    if U.generators = [] then
        if Length( Set( elems ) ) = 1 then
            return rec(
                areConjugate   := true,
                elements       := elems,
                representative := elems[1],
                centralizer    := U,
                conjugands     := List( elems, x -> U.identity )
            );
        else
            return rec( areConjugate := false );
        fi;
    fi;

    if Set( elems ) = [ G.identity ] then
        return rec(
            areConjugate   := true,
            elements       := elems,
            representative := elems[1],
            centralizer    := U,
            conjugands     := List( elems, x -> U.identity )
        );
    fi;

    idx := 1;
    while IsSubgroup( elabser[idx+1], U ) do  idx := idx + 1;  od;
    while not false in List( elems, x -> x in elabser[idx+1] ) do
        idx := idx + 1;
    od;

    if idx <> 1 then
        elabser := Sublist( elabser, [idx..Length( elabser )] );
    fi;
    fachom := HomomorphismsSeries( G, elabser );

    felems := List( elems, x -> Image( fachom[1], x ) );
    rep    := felems[1];
    cent   := Image( fachom[1], U );
    conj   := List( elems, x -> cent.identity );
    cent   := cent.generators;

    if Length( Set( felems ) ) <> 1 then
        return rec( areConjugate := false );
    fi;

    tmpU := U;
    tmpe := elems;
    U     := [];
    elems := [];
    U[Length( elabser )]     := tmpU;
    elems[Length( elabser )] := tmpe;
    for step in Reversed( [2..Length( elabser )] ) do
        tmpU := Image( fachom[step], tmpU );
        U[step-1] := tmpU;
        tmpe := List( tmpe, x -> Image( fachom[step], x ) );
        elems[step-1] := tmpe;
    od;

    for step in [2..Length( elabser )] do

        fhom := fachom[step];
        facN := PreImage( fhom, TrivialSubgroup( fhom.range ) );
        facU := Igs( Intersection( U[step], facN ) );
        face := elems[step];
        uhom := GroupHomomorphismByImages( U[step], Image(fhom),
                        Igs(U[step]), 
                        List( Igs(U[step]), x -> Image(fhom,x) ) );

        rep  := FactorAgWord( rep, fhom.source.identity );
        # Apply( cent, x -> FactorAgWord( x, fhom.source.identity ) );
        Apply( cent, x -> PreImagesRepresentative( uhom, x ) );
        # Apply( conj, x -> FactorAgWord( x, fhom.source.identity ) );
        Apply( conj, x -> PreImagesRepresentative( uhom, x ) );

        if IsCentral( fhom.source, facN ) then
            for elnum in [1..Length( face )] do
                res := CentralCaseECAgWords( fhom.source,
                        facN, cent, facU, rep, rep^-1 * (face[elnum] ^ conj[elnum]) );

                conj[elnum] := conj[elnum] * res.conjugand;
                if elnum = 1 then
                    rep2  := res.representative;
                    cent2 := res.centralizer;
                elif rep2 <> res.representative then
                    return rec( areConjugate := false );
                fi;
            od;
            rep  := rep2;
            cent := cent2;
        else
            for elnum in [1..Length( face )] do
                res := GeneralCaseECAgWords( fhom.source,
                        facN, cent, facU, rep, rep^-1 * (face[elnum] ^ conj[elnum]) );

                conj[elnum] := conj[elnum] * res.conjugand;
                if elnum = 1 then
                    rep2  := res.representative;
                    cent2 := res.centralizer;
                elif rep2 <> res.representative then
                    return rec( areConjugate := false );
                fi;
            od;
            rep  := rep2;
            cent := cent2;
        fi;
    od;
    cent := AgSubgroup( G, cent, false );

    return rec(
        areConjugate   := true,
        elements       := elems[Length( elabser )],
        representative := rep,
        centralizer    := cent,
        conjugands     := conj
    );
end;


#############################################################################
##
#F  AgGroupOps.ConjugacyTest( <U>, <elems> )  . . . . . . . . . . . . . . . .
##
##  returns
##
##      <false>
##
##    or
##
##      <conjugacy class>
##      .elements   := <list>
##      .conjugands := <list>
##
AgGroupOps.ConjugacyTest := function( U, elems )
    local   G, elabser, natisom, res, class;

    if not IsAgGroup( U ) or not IsList( elems ) or Length( elems ) < 2 then
        Error( "usage: ConjugacyTest( <U>, <elems> )" );
    fi;

    G := Parent( U );

    if not IsElementaryAbelianAgSeries( G ) then
        elabser := ElementaryAbelianSeries( G );
        natisom := IsomorphismAgGroup( elabser );
        elabser := List(ElementaryAbelianSeries( natisom.range ),
			Normalized);
        res     := MainEntryACAgWords( natisom.range,
                    Image( natisom, U ), List( elems, x -> Image( natisom, x ) ), elabser );

        if res.areConjugate then
            Apply( res.elements, x -> PreImagesRepresentative( natisom, x ) );
            res.representative := PreImagesRepresentative( natisom, res.representative );
            res.centralizer    := PreImage( natisom, res.centralizer );
            Apply( res.conjugands, x -> PreImagesRepresentative( natisom, x ) );
            class := ConjugacyClass( U, res.representative );
            class.elements := res.elements;
            class.conjugands := res.conjugands;
            class.centralizer := res.centralizer;

            return class;
        else
            return false;
        fi;
    else
        elabser := List(ElementaryAbelianSeries( G ), Normalized);
        res     := MainEntryACAgWords( G, U, elems, elabser );

        if res.areConjugate then
            class := ConjugacyClass( U, res.representative );
            class.elements := res.elements;
            class.conjugands := res.conjugands;
            class.centralizer := res.centralizer;

            return class;
        else
            return false;
        fi;
    fi;

    return res;
end;


#############################################################################
##
#F  AgGroupOps.CanonicalClassElement( <U>, <u> )  . . . . . . . canonical <u>
##
##
AgGroupOps.CanonicalClassElement := function( U, u )
    local   G,  E,  f,  r;

    if not IsAgGroup(U)  then
        Error( "usage: CanonicalClassElement( <U>, <u> )" );
    elif not u in U  then
    	Error( "<u> must be an element of <U>" );
    fi;
    G := Parent(U);

    if not IsElementaryAbelianAgSeries(G) then
        E := List(ElementaryAbelianSeries(G), Normalized);
        f := IsomorphismAgGroup(E);
        E := List(ElementaryAbelianSeries(f.range), Normalized);
        r := MainEntryACAgWords( f.range, Image(f,U), [Image(f,u)], E );
	return PreImagesRepresentative( f, r.representative );
    else
        E := List(ElementaryAbelianSeries(G), Normalized);
        r := MainEntryACAgWords( G, U, [ u ], E );
        return r.representative;
    fi;
end;

#############################################################################
##
#F  AgGroupOps.GeneratorsCentrePGroup( <P>, <p> ) . . . . centre of <p>-group
##
##  'GeneratorsCentrePGroup' calculates a set of generators of the centre  of 
##  the  <p>-group <P>. Usually  it  is  much  more  efficient  to  use  this 
##  function to calculate the centre of a p-group  than  using  the  function
##  'AgGroupOps.Centre'. Anyway, it is even  more  efficient,  if  <P>  is  a 
##  special ag group.
##
AgGroupOps.GeneratorsCentrePGroup := function(P, p)

    local L,         # lower central series of <P>
          NM,        # factorgroup of the series 
          field,     # field with <p> elements
          gensP,     # minimal generating set of <P>
          g,         # element of gensP
          gensZ,     # generating set of the centre modulo layer
          newgens,   # new generating set of the centre modulo next layer
          elm,       # element of newgens
          comm,      # commutator as exponentvector
          matlist,   # list of comms
          index,     # to filter matlist
          null,      # nullspace of comms
          i, j, k, h; 
    
    # catch trivial case
    if IsAbelian(P)  then
        return P.generators;
    fi;

    # if P is a special ag group then get Leedham-Green series
    if IsBound( P.isSagGroup )  and P.isSagGroup  then
        Unbind( P.elementaryAbelianSeries );
        L := P.operations.ElementaryAbelianSeries( P );

    # otherwise get p-central series
    else
        L := PCentralSeries(P,p);
    fi;

    field := GF( p );
    NM    := L[1] mod L[2];
    gensP := Copy( NM.generators );
    gensZ := Copy( gensP );

    # step down p-central series
    for i  in [2..Length( L )-1]  do
        NM := L[i] mod L[i+1];
        h := 1;
        while h <= Length( gensP )  and not 0 = Length( gensZ )  do

            # get operation of g on NM
            g       := gensP[h];
            newgens := [];
            matlist := [];
            index   := [];
            for j  in [1..Length( gensZ )]  do
                comm := Exponents( NM, Comm( gensZ[j], g ), field );
                if comm = field.zero * comm  then
                    Add( newgens, gensZ[j] );
                else
                    Add( matlist, comm );
                    Add( index, j );
                fi;
            od;
           
            if Length( matlist ) > 0  then
      
                # get nullspace
                null    := List( NullspaceMat( matlist ), IntVecFFE );

                # calculate elements corresponding to null
                for j  in [1..Length(null)]  do
                    elm := P.identity;
                    for k  in [1..Length(null[1])]  do
                        elm := elm * gensZ[index[k]]^null[j][k];
                    od;
                    Add( newgens, elm );
                od;
                gensZ := Copy( newgens );
            fi;
            h := h + 1;
        od;

        # append the elements of the layer since they are central
        Append(gensZ, NM.generators);
    od;

    # return generators of the centre
    return gensZ;
end;
