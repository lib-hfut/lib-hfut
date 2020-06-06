#############################################################################
##
#A  onecohom.g                  GAP library                      Frank Celler
##
#A  @(#)$Id: onecohom.g,v 3.13 1994/02/02 10:11:30 fceller Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains all polymorph functions for groups.
##
#H  $Log: onecohom.g,v $
#H  Revision 3.13  1994/02/02  10:11:44  fceller
#H  replaced 'LogVecFFE' by 'IntVecFFE'
#H
#H  Revision 3.12  1993/03/01  11:36:14  fceller
#H  fixed a bug occuring in coprime case
#H
#H  Revision 3.11  1992/10/14  09:53:14  fceller
#H  fixed a bug in 'OneCocycles' using 'pPrimeSet'
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
#H  Revision 3.7  1992/03/26  15:14:33  martin
#H  changed 'SemiDirectProduct' to 'SemidirectProduct'
#H
#H  Revision 3.6  1992/02/20  14:26:18  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/09/24  15:41:55  fceller
#H  Initial Release under RCS
##


#############################################################################
##
#F  Info1Coh1( <arg> )  . . . . . . . . . . . . . . . . . package information
#F  Info1Coh2( <arg> )  . . . . . . . . . . . . . . package debug information
#F  Info1Coh3( <arg> )  . . . . . . . . . . . . . . package debug information
##
if not IsBound( Info1Coh1 )  then Info1Coh1 := Ignore;  fi;
if not IsBound( Info1Coh2 )  then Info1Coh2 := Ignore;  fi;
if not IsBound( Info1Coh3 )  then Info1Coh3 := Ignore;  fi;


#############################################################################
##
#V  OCAgGroupOps  . . . . . . . . . . . . .  one cohomology ops for ag groups
#V  OCPermGroupOps  . . . . . . . . . . .  one cohomology ops for perm groups
##
OCAgGroupOps := rec();
OCPermGroupOps := rec();


#############################################################################
##
#F  AddGenerators( <ocr> )  . . . . . . . . . . . . . add genenerators, local
##
OCAgGroupOps.AddGenerators := function( ocr )
    local   gens;

    if IsBound( ocr.generators )  then
    	gens := ocr.generators;
    else
    	Info1Coh2( "#I  AddGenerators: using standard generators\n" );
    	if IsBound( ocr.pPrimeSet )  then
    	    Print( "#W  AddGenerators: p prime set is given ",
                   "for standard generating set\n" );
        fi;
        if IsBound( ocr.smallGeneratingSet )  then
           Print( "#W  AddGenerators: small generating set is given ",
                  "for standard generating set\n" );
        fi;
        gens := FactorArg( ocr.group, ocr.module ).generators;
    fi;

    Info1Coh2( "#I  AddGenerators: ", Length( gens ), " generators\n" );
    ocr.generators := gens;

    if IsBound( ocr.normalIn )  then
    	if not IsSubgroup( ocr.normalIn, ocr.module )  then
    	    gens := Igs( ocr.normalIn );
    	else
    	    gens := FactorArg( ocr.normalIn, ocr.module ).generators;
    	fi;
    	ocr.normalGenerators := gens;
    fi;

end;

OCPermGroupOps.AddGenerators := function( ocr )
    local   gens;

    if IsBound( ocr.generators )  then
    	gens := ocr.generators;
    else
    	Info1Coh2( "#I  AddGenerators: using standard generators\n" );
    	if IsBound( ocr.pPrimeSet )  then
    	    Error( "p prime set given for perm group" );
        fi;
        if IsBound( ocr.smallGeneratingSet )  then
           Print( "#W  AddGenerators: small generating set is given ",
                  "for standard generating set\n" );
        fi;
        gens := ocr.group.generators;
    fi;

    Info1Coh2( "#I  AddGenerators: ", Length( gens ), " generators\n" );
    ocr.generators := gens;

    if IsBound( ocr.normalIn )  then
    	Error( "normalizing subgroup not allowed for perm grousp" );
    fi;

end;


#############################################################################
##
#F  AddMatrices( <ocr> )  . . . . . . . . . . . add operation matrices, local
##
OCAgGroupOps.AddMatrices := function( ocr )
    local   V,  base,  gens,  i;

    # If <ocr> has a record component 'matrices', nothing is done.
    if IsBound( ocr.matrices )  then
        return;
    fi;
    Info1Coh2( "#I  AddMatrices: computes linear operations\n" );

    # Construct field and log table.
    base := Igs( ocr.module );
    if base = []  then
    	Print( "#W  AddMatricesAgGroupOC: module is trivial\n" );
    	return;
    else
    	ocr.field := GF( RelativeOrderAgWord( base[1] ) );
    	ocr.module.field := ocr.field;
	ocr.logTable := [];
    	for i  in [ 1 .. ocr.field.char - 1 ]  do
    	    ocr.logTable[ LogFFE( i * ocr.field.one ) + 1 ] := i;
    	od;
    fi;    

    # 'moduleMap' is constructed using 'Exponents'.
    ocr.moduleMap := x -> ocr.module.operations.Exponents( 
    	    	    	      ocr.module, 
    	    	    	      x,
    	    	    	      ocr.field );
    V := rec( isDomain := true, base := base );
    ocr.matrices := LinearOperation(
    	    	        AgSubgroup( ocr.group, ocr.generators, false ),
    	    	    	V, function( x, a )  
                        return ocr.moduleMap(x^a);  end ).images;
    ocr.identityMatrix := IdentityMat( Length( base ), ocr.field );
    List( ocr.matrices, IsMat );
    IsMat( ocr.identityMatrix );

    # Do the same for the operations of 'normalIn' if present.
    if IsBound( ocr.normalIn )  then
        if not IsBound( ocr.normalMatrices )  then
            gens := ocr.normalGenerators;
	    V := rec( isDomain := true, base := base );
            ocr.normalMatrices := LinearOperation(
                AgSubgroup( ocr.normalIn, gens, false ),
                V, function( x, a ) 
		return ocr.moduleMap( x ^ a ); end ).images;
    	    List( ocr.normalMatrices, IsMat );
        fi;
    fi;

    # Construct the inverse of 'moduleMap'.
    ocr.vectorMap := function( v )
    	local   wrd,  i;
    	wrd := ocr.module.identity;
        for i  in [ 1 .. Length( v ) ]  do
    	    if IntVecFFE(v,i) <> 0  then
    	    	wrd := wrd * base[i] ^ IntVecFFE(v,i);
    	    fi;
    	od;
    	return wrd;
    end;

end;

OCPermGroupOps.AddMatrices := function( ocr )

    if IsBound( ocr.matrices )  then
        return;
    else
        Error( "'AddMatrices' not implement yet" );
    fi;

end;


#############################################################################
##
#F  AddToFunctions( <ocr> ) . . . . . . . . . . . . . . add conversion, local
##
##  If 'group'  is a permutation group,  'complementToCocycle'  will  NOT (!)
##  be added. ( When more function for perm groups  are  supported  this  may
##  change.)
##
OCAgGroupOps.AddToFunctions := function( ocr )
    local   base,  dim,  gens;

    # Get the module generators.
    base := Igs( ocr.module );
    dim  := Length( base );

    # If 'smallGeneratingSet' is given, neither 'cocycle' nor 'list' need the
    # entries at the nongenerators.
    if not IsBound( ocr.cocycleToList )  then
    	Info1Coh2( "#I  AddToFunctions: adding 'cocycleToList'\n" );
        ocr.cocycleToList := function( c )
            local   w,  i,  j,  k,  L;
            L := [];
    	    k := 0;
            for i  in [ 1 .. Length( c ) / dim ]  do
    	    	w := ocr.module.identity;
            	for j  in [ 1 .. dim ]  do
    	    	    if IntVecFFE(c,k+j) <> 0  then
    	    	    	w := w * base[j]^IntVecFFE(c,k+j);
    	    	    fi;
    	    	od;
                Add( L, w );
    	    	k := k + dim;
            od;
            return L;
        end;
    fi;

    # 'listToCocycle' is almost trivial.
    if not IsBound( ocr.listToCocycle )  then
    	Info1Coh2( "#I  AddToFunctions: adding 'listToCocycle'\n" );
        ocr.listToCocycle := function( L )
    	    local   c,  n;
    	    c := [];
    	    for n  in L  do
    	    	Append( c, ocr.moduleMap( n ) );
    	    od;
    	    IsVector( c );
    	    return c;
        end;
    fi;

    # If 'complement' is unknown, the following  function dos not make sense,
    # so just return.
    if not IsBound( ocr.complement )  then
    	Info1Coh2( "#I  AddToFunctions: no complement, returning\n" );
        return;
    fi;
    gens := Igs( ocr.complement );

    # If  'smallGeneratingSet'  is  not present, just correct 'complement' by
    # the  list  'cocycleToList'. Otherwise we need to compute the correction
    # with the use of 'bigMatrices' and 'bigVectors'.
    if not IsBound( ocr.cocycleToComplement )  then
    	Info1Coh2( "#I  AddToFunctions: adding 'cocycleToComplement\n" );
        if not IsBound( ocr.smallGeneratingSet )  then
    	    ocr.cocycleToComplement := function( c )
    	    	local   L,  i;
    	    	L := ocr.cocycleToList( c );
    	    	for i  in [ 1 .. Length( L ) ]  do
    	    	    L[ i ] := gens[ i ] * L[ i ];
    	    	od;
    	    	return AgSubgroup( Parent(ocr.complement), L, false );
    	    end;
        else

            # Get  the correcting list. The nongenerator correction are given
            # by  m_i  +  n_1 * C_ij + ... for i a nongenerator index and j a
            # generator  index.  m_i  is  stored  in <bigVectors> and C_ij is
            # stored in <bigMatrices>.
            ocr.cocycleToComplement := function( c )
                local   L,  i,  n,  j;
                L := [];
                for i  in [ 1 .. Length( c ) / dim ]  do
    	    	    n := Sublist( c, [ (i-1)*dim+1 .. i*dim ] );
                    L[ ocr.smallGeneratingSet[ i ] ] := n;
                od;
                for i  in [ 1 .. Length( gens ) ]  do
                    if not IsBound( L[ i ] )  then
                        n := ocr.bigVectors[ i ];
                        for j  in ocr.smallGeneratingSet  do
                            n := n + L[ j ] * ocr.bigMatrices[ i ][ j ];
                        od;
                        L[ i ] := n;
                    fi;
                od;
                for i  in [ 1 .. Length( L ) ]  do
                    L[ i ] := gens[i] * ocr.vectorMap( L[i] );
                od;
    	    	return AgSubgroup( ocr.complement, L, false );
            end;
        fi;
    fi;

    if not IsBound( ocr.complementToCocycle )  then
    	Info1Coh2( "#I  AddToFunctions: adding 'complementToCocycle'\n" );
        if not IsBound( ocr.smallGeneratingSet )  then
            ocr.complementToCocycle := function( K )
                local   L,  i;
                L := ShallowCopy( K.operations.Igs( K ) );
                for i  in [ 1 .. Length( gens ) ]  do
                    L[ i ] := gens[ i ] mod L[ i ];
                od;
                return ocr.listToCocycle( L );
            end;
        else
            ocr.complementToCocycle := function( K )
                local   L,  S,  i,  j;
                L := ShallowCopy( K.operations.Igs( K ) );
                S := [];
                for i  in [ 1 .. Length( ocr.smallGeneratingSet ) ]  do
    	    	    j := ocr.smallGeneratingSet[ i ];
                    S[ i ] := gens[ j ] mod L[ j ];
                od;
                return ocr.listToCocycle( S );
            end;
        fi;
    fi;

end;

OCPermGroupOps.AddToFunctions := function( ocr )
    Error( "'AddToFunctions' not implement yet" );
end;


#############################################################################
##
#F  AddCentralizer( <ocr>, <B> )  . . . . . . . . . . . . add centralizer <B>
##
OCAgGroupOps.AddCentralizer := function( ocr, B )
    ocr.centralizer := AgSubgroup(ocr.module, List(B,ocr.vectorMap), false);
end;

OCPermGroupOps.AddCentralizer := function( ocr, B )
    ocr.centralizer := Group( List( B, ocr.vectorMap ), () );
end;


#############################################################################
##
#F  OneCoboundariesOC( <ocr> )	. . . . . . . . . . one cobounds main routine
##
OneCoboundariesOC := function( ocr )
    local   B,  S,  L,  T,  i,  j;

    # Add the important record components for coboundaries.
    if IsBound( ocr.oneCoboundaries )  then
        return ocr.oneCoboundaries;
    elif not IsBound( ocr.operations )  then
    	if IsAgGroup( ocr.group )  then
    	    ocr.operations := OCAgGroupOps;
    	    Info1Coh2( "#I  OneCoboundariesOC: using ag group ops\n" );
    	elif IsPermGroup( ocr.group )  then
    	    ocr.operations := OCPermGroupOps;
    	    Info1Coh2( "#I  OneCoboundariesOC: using perm group ops\n" );
    	else
            Error( "group must be permutation group or ag group" );
    	fi;
    fi;
    Info1Coh1("#I  OneCoboundariesOC: coboundaries and centralizer\n");
    ocr.operations.AddGenerators( ocr );
    ocr.operations.AddMatrices( ocr );

    # Construct ( 1 - M[1],  ..., 1 - M[n] ).
    if IsBound( ocr.smallGeneratingSet )  then
    	S := ocr.smallGeneratingSet;
    else
    	S := [ 1 .. Length( ocr.generators ) ];
    fi;
    L := [];
    T := ocr.identityMatrix;
    for i  in [ 1 .. Length( T ) ]  do
    	L[i] := [];
    	for j  in S  do
    	    Append( L[i], T[i] - ocr.matrices[j][i] );
    	od;
    od;
    IsMat( L );

    # If there are no equations, return.
    if Length( S ) = 0  then
    	Info1Coh1( "#W  OneCoboundariesOC: group is trivial\n" );
        ocr.oneCoboundaries := VectorSpace( [], ocr.field, [] );
        ocr.centralizer := ocr.module;
        return ocr.oneCoboundaries;
    fi;

    # Find a base for the one coboundaries.
    B := AbstractBaseMat( Igs( ocr.module ), L, ocr.field );
    ocr.oneCoboundaries := VectorSpace(B[2],ocr.field,ocr.field.zero*L[1]);
    ocr.oneCoboundaries.base := B[2];
    ocr.triangulizedBase := B[1];
    Info1Coh1( "#I  OneCoboundariesOC: |B^1| = ", ocr.module.field.char,
    	       "^", Length( Base( ocr.oneCoboundaries ) ), "\n" );
    ocr.heads := [];
    j := 1;
    i := 1;
    while i <= Length(B[2]) and j <= Length(B[2][1])  do
    	if IntVecFFE( B[2][i], j ) <> 0  then
    	    ocr.heads[i] := j;
	    i := i+1;
    	fi;
	j := j+1;
    od;

    # Now get the nullspace,  this is the centralizer.
    ocr.operations.AddCentralizer( ocr, NullspaceMat( L ) );
    Info1Coh1( "#I  OneCoboundariesOC: |C| = ", ocr.module.field.char,
    	       "^", Length( ocr.centralizer.generators ), "\n" );
    ocr.operations.AddToFunctions( ocr );
    return ocr.oneCoboundaries;

end;


#############################################################################
##
#F  ConjugatingWordOC( <ocr>, <c1>, <c2> )  . . . . . . . . . . . . . . local
##
##  Compute a Word n in <ocr.module> such that <c1> ^ n = <c2>.
##
ConjugatingWordOC := function( ocr, c1, c2 )
    local   B,  w,  v,  j;

    B := ocr.triangulizedBase;
    w := ocr.module.identity;
    v := c2 - c1;
    for j  in [ 1 .. Length(ocr.heads) ]  do
    	if IntVecFFE( v, ocr.heads[j] ) <> false  then
    	    w := w * B[j]^IntVecFFE(v,ocr.heads[j]);
    	fi;
    od;
    return w;

end;


#############################################################################
##
#F  AddRelations( <ocr> ) . . . . . . . . . . . . . . .  add relations, local
##
OCAgGroupOps.AddRelations := function( ocr )
    local   H,  G,  p,  w,  r,  i,  j,  k;

    # If <ocr> has a  record component 'relators', nothing is done.
    if IsBound( ocr.relators )  then
        return;
    fi;
    Info1Coh2( "#I  AddRelations: computes pc-presentation\n" );

    # Construct the factorgroup.
    H := AgSubgroup( ocr.group, ocr.generators, false ) mod ocr.module;

    # Start  with the power-relations. If g1 ^ p = g2 ^ 3 * g4 ^ 5 * g5, then
    # the  relator  g1  ^  -p  *  g2  ^  3  * g4 ^ 5 * g5 is used, because it
    # contains only one negative exponent.
    ocr.relators := [];
    for i  in [ 1 .. Length( ocr.generators ) ]  do
        p := RelativeOrderAgWord( ocr.generators[ i ] );
        r := rec( generators := [ i ], powers := [ -p ]  );
        w := H.operations.Exponents( H, ocr.generators[i]^p, Integers );
        for j  in [ 1 .. Length( w ) ]  do
            if w[ j ] <> 0  then
                Add( r.generators, j );
                Add( r.powers, w[ j ] );
            fi;
        od;
        r.usedGenerators := Set( r.generators );
        Add( ocr.relators, r );
    od;

    # Now  compute  the  conjugated words. If g1 ^ g2 = g3 ^ 5 * g4 ^ 2, then
    # the  relator ( g1 ^ -1 ) ^ g2 * g3 ^ 5 * g4 ^ 2 is used, as it contains
    # only two negative exponents.
    for i  in [ 1 .. Length( ocr.generators ) - 1 ]  do
        for j  in [ i + 1 .. Length( ocr.generators ) ]  do
            r := rec( generators := [ i, j, i ], powers := [ -1, -1, 1 ] );
    	    w := ocr.generators[ j ] ^ ocr.generators[ i ];
            w := H.operations.Exponents( H, w, Integers );
            for k  in [ 1 .. Length( w ) ]  do
                if w[ k ] <> 0  then
                    Add( r.generators, k );
                    Add( r.powers, w[ k ] );
                fi;
            od;
            r.usedGenerators := Set( r.generators );
            Add( ocr.relators, r );
        od;
    od;

end;


#############################################################################
##
#F  NormalRelations( <ocr>, <gens> )  . .  rels for normal complements, local
##
AgGroupOps.NormalRelations := function( ocr, gens )

    local   i, j, k,
            relations,
            r,
            H,
            w;

    Info1Coh2("#I  NormalRelations: computes rels for normal complements\n");

    # Construct  the  factorgroup  <H>  using the 'generators' and the normal
    # subgroup  'module'.  Assume 'generators' are already given. Compute the
    # shift-function for this factorgroup.
    H := AgSubgroup( ocr.group, ocr.generators, false ) mod ocr.module;

    # Compute  g_i ^ s_j for all generators s_j in 'normalGenerators' and all
    # i in <generators>.
    relations := [];
    for i  in [ 1 .. Length( gens ) ]  do
        for j  in [ 1 .. Length( ocr.normalGenerators ) ]  do
            r := rec( generators := [],
    	    	      powers     := [],
                      conjugated := [ i, j ] );
    	    w := ocr.generators[ gens[i] ] ^ ocr.normalGenerators[ j ];
            w := H.operations.Exponents( H, w, Integers );
            for k  in [ 1 .. Length( w ) ]  do
                if w[ k ] <> 0  then
                    Add( r.generators, k );
                    Add( r.powers, w[ k ] );
                fi;
            od;
            r.usedGenerators := Set( r.generators );
            Add( relations, r );
        od;
    od;
    return relations;

end;


#############################################################################
##
#F  AddSumMatrices( <ocr> ) . . . . . . . . . . . . . . . . . add sums, local
##
OCAgGroupOps.AddSumMatrices := function( ocr )
    local   i,  j;

    # the factorgroup otherwise.
    if not IsBound( ocr.maximalPowers )  then
    	Info1Coh2("#I  AddSumMatrices: maximal powers = relative orders\n");
    	ocr.maximalPowers := List( ocr.generators, RelativeOrderAgWord );
    fi;

    # At  first  add  all  powers,  such  that  powerMatrices[  i  ][  j ] is
    # matrices[  i  ]  ^ j for j = 1 ... p, if p is the maximal power for the
    # i.th generator.
    if not IsBound( ocr.powerMatrices )  then
        Info1Coh2( "#I  AddSumMatrices: adding power matrices\n" );
        ocr.powerMatrices := [];
        for i  in [ 1 .. Length( ocr.matrices ) ]  do
            ocr.powerMatrices[ i ] := [ ocr.matrices[ i ] ];
            for j  in [ 2 .. ocr.maximalPowers[ i ] ]  do
                ocr.powerMatrices[ i ][ j ] :=
                    ocr.powerMatrices[ i ][ j - 1 ] * ocr.matrices[ i ];
            od;
        od;
    fi;

    # Now  all  sums,  such  that sumMatrices[ i ][ j ] is the sum from k = 0
    # upto j - 1 over matrices[ i ] ^ k for j = 1 ... p.
    if not IsBound( ocr.sumMatrices )  then
    	Info1Coh2( "#I  AddSumMatrices: adding sum matrices\n" );
        ocr.sumMatrices := [];
        for i  in [ 1 .. Length( ocr.matrices ) ]  do
            ocr.sumMatrices[ i ] := [ ocr.identityMatrix ];
            for j  in [ 2 .. ocr.maximalPowers[ i ] ]  do
                ocr.sumMatrices[ i ][ j ] :=
                    ocr.sumMatrices[i][ j-1 ] + ocr.powerMatrices[i][ j-1 ];
            od;
        od;
    fi;

end;

OCPermGroupOps.AddSumMatrices := function( ocr )
    local   i, j;

    if not IsBound( ocr.maximalPowers )  then
    	Info1Coh2( "#I  AddSumMatrices: maximal power = 1\n" );
    	ocr.maximalPowers := List( ocr.generators, x -> 1 );
    fi;

    # At  first  add  all  powers,  such  that  powerMatrices[  i  ][  j ] is
    # matrices[  i  ]  ^ j for j = 1 ... p, if p is the maximal power for the
    # i.th generator.
    if not IsBound( ocr.powerMatrices )  then
        Info1Coh2( "#I  AddSumMatrices: adding power matrices\n" );
        ocr.powerMatrices := [];
        for i  in [ 1 .. Length( ocr.matrices ) ]  do
            ocr.powerMatrices[ i ] := [ ocr.matrices[ i ] ];
            for j  in [ 2 .. ocr.maximalPowers[ i ] ]  do
                ocr.powerMatrices[ i ][ j ] :=
                    ocr.powerMatrices[ i ][ j - 1 ] * ocr.matrices[ i ];
            od;
        od;
    fi;

    # Now  all  sums,  such  that sumMatrices[ i ][ j ] is the sum from k = 0
    # upto j - 1 over matrices[ i ] ^ k for j = 1 ... p.
    if not IsBound( ocr.sumMatrices )  then
    	Info1Coh2( "#I  AddSumMatrices: adding sum matrices\n" );
        ocr.sumMatrices := [];
        for i  in [ 1 .. Length( ocr.matrices ) ]  do
            ocr.sumMatrices[ i ] := [ ocr.identityMatrix ];
            for j  in [ 2 .. ocr.maximalPowers[ i ] ]  do
                ocr.sumMatrices[ i ][ j ] :=
                    ocr.sumMatrices[i][ j-1 ] + ocr.powerMatrices[i][ j-1 ];
            od;
        od;
    fi;

end;


#############################################################################
##
#F  EquationMatrixOC( <ocr>, <r>, <n> )  . . . . . . . . . . . . . . .  local
##
EquationMatrixOC := function( ocr, r, n )
    local   mat,  i,  j,  v,  vv;

    Info1Coh3( "#I  EquationMatrixOC: matrix number ", n, "\n" );
    mat := ocr.identityMatrix - ocr.identityMatrix;
    if not n in r.usedGenerators  then return mat;  fi;

    #  For j := generators[ i ],  v := powers[ i ],  M operations:
    #
    #    if j = n and v > 0, then
    #           mat = mat * M[j] ^ v + sum_{k=0}^{v-1} M[j] ^ k
    #    if j = n and v < 0, then
    #           mat = ( mat - sum_{k=0}^{-v-1} M[j] ^ k ) * M[j] ^ v
    #    if j <> n, then
    #           mat = mat * M[j] ^ v
    #
    for i  in [ 1 .. Length( r.generators ) ]  do
        j  := r.generators[ i ];
        vv := r.powers[ i ];

        # Repeat, until we used up all powers.
        while vv <> 0  do
            if AbsInt( vv ) > AbsInt( ocr.maximalPowers[ j ] )  then
                v  := SignInt( vv ) * ocr.maximalPowers[ j ];
                vv := vv - v;
            else
                v  := vv;
                vv := 0;
            fi;
            if j = n and v > 0   then
                mat := mat * ocr.powerMatrices[j][v] + ocr.sumMatrices[j][v];
            elif j = n and v < 0  then
                mat :=   ( mat - ocr.sumMatrices[ j ][ -v ] )
    	    	       * ( ocr.powerMatrices[ j ][ -v ] ^ -1 );
            elif j <> n and v > 0  then
                mat := mat * ocr.powerMatrices[ j ][ v ];
            elif j <> n and v < 0  then
                mat := mat * ( ocr.powerMatrices[ j ][ -v ] ^ -1 );
            else
                Print( "#W  EquationMatrixOC: zero power\n" );
            fi;
        od;
    od;

    # if <r>   has an entry   'conjugated'  the records  is  no relator for a
    # presentation, but belongs to relation
    #         (g_i n_i) ^ s_j = r
    # which is used to determinate  normal  complements.  [i,j]  is bound  to
    # 'conjugated'.  If i <> <n>, we can  forget about it, but otherwise -s_j
    # must be added.
    if IsBound( r.conjugated ) and r.conjugated[1] = n  then
        mat := mat - ocr.normalMatrices[ r.conjugated[ 2 ] ];
    fi;
    return mat;

end;


#############################################################################
##
#F  AddBigMatrices( <ocr> ) . . . . . . . . . . . . . . . . . . . . . . local
##
OCAgGroupOps.AddBigMatrices := function( ocr )
    local   i,  j,  n,  w,  small,  nonSmall;

    # If no small generating set is known simply return.
    if not IsBound( ocr.smallGeneratingSet )  then
    	Print( "#W  AddBigMatrices: no small generating set\n" );
        return;
    fi;
    small := ocr.smallGeneratingSet;
    nonSmall := Difference( [ 1 .. Length( ocr.generators ) ], small );
    if not IsBound( ocr.bigMatrices )  then
        ocr.bigMatrices := List( [1 .. Length( ocr.generators )], x -> [] );
    	Info1Coh2( "#I  AddBigMatrices: adding bigMatrices\n" );
        for i  in nonSmall  do
            for j  in small  do
                ocr.bigMatrices[ i ][ j ] := EquationMatrixOC( ocr,
                    ocr.generatorsInSmall[ i ], j );
            od;
        od;
    fi;

    # Compute n_(i) for non small generators i.
    if not IsBound( ocr.bigVectors )  then
    	Info1Coh2( "#I  AddBigMatricesOC: adding bigVectors\n" );
        ocr.bigVectors := [];
        for i  in nonSmall do
            n := ocr.generators[ i ] ^ -1;
            w := ocr.generatorsInSmall[ i ];
            for j  in [ 1 .. Length( w.generators ) ]  do
                n := n * ocr.generators[ w.generators[ j ] ] ^ w.powers[ j ];
            od;
            ocr.bigVectors[ i ] := ocr.moduleMap( n );
        od;
    fi;

end;

OCPermGroupOps.AddBigMatrices := OCAgGroupOps.AddBigMatrices;


#############################################################################
##
#F  SmallEquationMatrixOC( <ocr>, <r>, <n> )  . . . . . . . . . . . . . local
##
SmallEquationMatrixOC := function( ocr, r, n )
    local   mat,  i,  j,  v,  vv;

    Info1Coh3( "#I  SmallEquationMatrixOC: matrix number ", n, "\n" );
    mat := ocr.identityMatrix - ocr.identityMatrix;

    # <n> must a small generator.
    if not n in ocr.smallGeneratingSet  then
        Error( "<n> is no small generator" );
    fi;

    # Warning: if <n> is not in  <r.usedGenerators> we cannot  return, as the
    # nonsmall generators may yield a result.

    # For j := generators[ i ],  v := powers[ i ],  M operations:
    #
    # If j is a small generator, everthing is as usuall.
    #
    #    if j = n and v > 0,  then
    #          mat = mat * M[j] ^ v + sum_{k=0}^{v-1} M[j] ^ k
    #    if j = n and v < 0,  then
    #          mat = ( mat - sum_{k=0}^{-v-1} M[j] ^ k ) * M[j] ^ v
    #    if j <> n, then
    #          mat = mat * M[j] ^ v
    #
    # If j is not  a small generator,  then j <> n.   But  we need to correct
    # <mat> using the <bigMatrices>:
    #
    # 	n_j = n_(j) + ... + n_n ^ C_jn + ...
    #
    # 	if v > 0, then
    #         mat = mat * M[j] ^ v + C_jn * sum_{k=0}^{v-1} M[j] ^ k
    #   If v < 0, then
    #         mat = ( mat - C_jn * sum_{k=0}^{-v-1} M[j] ^ k ) * M[j] ^ v
    #
    for i  in [ 1 .. Length( r.generators ) ]  do
        j  := r.generators[ i ];
        vv := r.powers[ i ];
        while vv <> 0  do
            if AbsInt( vv ) > AbsInt( ocr.maximalPowers[ j ] )  then
                v  := SignInt( vv ) * ocr.maximalPowers[ j ];
                vv := vv - v;
            else
                v  := vv;
                vv := 0;
            fi;
            if j in ocr.smallGeneratingSet  then
                if j = n and v > 0   then
                    mat := mat * ocr.powerMatrices[ j ][ v ]	
    	    	    	   + ocr.sumMatrices[ j ][ v ];
                elif j = n and v < 0  then
                    mat := ( mat - ocr.sumMatrices[ j ][ -v ] )
    	    	    	   * ( ocr.powerMatrices[ j ][ -v ] ^ -1 );
                elif j <> n and v > 0  then
                    mat := mat * ocr.powerMatrices[ j ][ v ];
                elif j <> n and v < 0  then
                    mat := mat * ( ocr.powerMatrices[ j ][-v] ^ -1 );
                else
                    Print( "#W  EquationMatrixOC: zero power\n" );
                fi;
            else
                if v > 0  then
                    mat := mat * ocr.powerMatrices[ j ][ v ]
    	    	    	   + ocr.bigMatrices[j][n] * ocr.sumMatrices[j][v];
                elif v < 0  then
                    mat := (mat-ocr.bigMatrices[j][n]*ocr.sumMatrices[j][-v])
    	    	    	   * ( ocr.powerMatrices[ j ][ -v ] ^ -1 );
                else
                    Print( "#W  EquationMatrixOC: zero power\n" );
                fi;
            fi;
        od;
    od;

    # If <r>   has an entry   <conjugated>  the records  is  no relator for a
    # presentation, but belongs to relation
    #         (g_i n_i) ^ s_j = <r>
    # which is  used to determinate  normal complements.   [i,j] is  bound to
    # 'conjugated'.  If i <> <n>, we can  forget about it, but  otherwise s_j
    # must be added. i is always a small generator.
    if IsBound( r.conjugated ) and r.conjugated[1] = n  then
        mat := mat - ocr.normalMatrices[ r.conjugated[ 2 ] ];
    fi;
    return mat;

end;


#############################################################################
##
#F  EquationVectorOC( <ocr>, <r> )  . . . . . . . . . . . . . . . . . . local
##
EquationVectorOC := function( ocr, r )
    local   n, i;

    # If <r> has   an entry 'conjugated'   the records is  no relator  for  a
    # presentation, but belongs to relation
    #       (g_i n_i) ^ s_j = <r>
    # which is  used to determinate  normal  complements.   [i,j] is bound to
    # <conjugated>.
    if IsBound( r.conjugated )  then
        n := ( ocr.generators[ r.conjugated[ 1 ] ]
    	       ^ ocr.normalGenerators[ r.conjugated[ 2 ] ] ) ^ -1;
    else
        n := ocr.identity;
    fi;

    for i  in [ 1 .. Length( r.generators ) ]  do
        n := n * ocr.generators[ r.generators[ i ] ] ^ r.powers[ i ];
    od;
    return ocr.moduleMap( n );

end;


#############################################################################
##
#F  SmallEquationVectorOC( <ocr>, <r> )	. . . . . . . . . . . . . . . . local
##
SmallEquationVectorOC := function( ocr, r )
    local   n,  a,  i,  nonSmall,  v,  vv,  j;

    # if <r> has  an entry 'conjugated'  the  records  is no relator   for  a
    # presentation, but belongs to relation
    #     (g_i n_i) ^ s_j = <r>
    # which is used to determinate normal complements.  [i,j] is bound  to to
    # 'conjugated'. i is always a small generator.
    if IsBound( r.conjugated )  then
        n := ( ocr.generators[ r.conjugated[ 1 ] ]
    	       ^ ocr.normalGenerators[ r.conjugated[ 2 ] ] ) ^ -1;
    else
        n := ocr.identity;
    fi;

    # At first the vector of the relator itself.
    for i  in [ 1 .. Length( r.generators ) ]  do
        n := n * ocr.generators[ r.generators[ i ] ] ^ r.powers[ i ];
    od;
    n := ocr.moduleMap( n );

    # Each  non  small generators in <r> gives an additional vector. It
    # must be shifted through the relator.
    nonSmall := Difference( [ 1 .. Length( ocr.generators ) ],
                            ocr.smallGeneratingSet );
    a := n - n;
    for i  in [ 1 .. Length( r.generators ) ]  do
        j  := r.generators[ i ];
        vv := r.powers[ i ];
        while vv <> 0  do
            if AbsInt( vv ) > AbsInt( ocr.maximalPowers[ j ] )  then
                v  := SignInt( vv ) * ocr.maximalPowers[ j ];
                vv := vv - v;
            else
                v  := vv;
                vv := 0;
            fi;

            if j in nonSmall  then
                if v > 0  then
                    a := a * ocr.powerMatrices[j][v] + ocr.bigVectors[j]
    	    	    	 * ocr.sumMatrices[ j ][ v ];
                elif v < 0  then
                    a := ( a - ocr.bigVectors[ j ]
    	    	    	 * ocr.sumMatrices[ j ][ -v ] )
    	    	    	 * ( ocr.powerMatrices[ j ][ -v ] ^ -1 );
                else
                    Print( "#W  SmallEquationVectorOC: zero power\n" );
                fi;
            else
                if v > 0  then
                    a := a * ocr.powerMatrices[ j ][ v ];
                elif v < 0  then
                    a := a * ( ocr.powerMatrices[ j ][ -v ] ^ -1 );
                else
                    Print( "#W  SmallEquationVectorOC: zero power\n" );
                fi;
            fi;
        od;
    od;

    return n + a;

end;


#############################################################################
##
#F  AddComplement( <ocr>, <K> )	. . . . . . . . . . . . . . . . . . . . local
##
OCAgGroupOps.AddComplement := function( ocr, K )
    ocr.complement := AgSubgroup( Parent( ocr.group ), K, false );
end;

OCPermGroupOps.AddComplement := function( ocr )
    Error( "'AddComplement' not implement yet" );
end;

#############################################################################
##
#F  CoprimeComplement( <ocr> )  . . . . . . . . . . . . .  coprime complement
##
OCAgGroupOps.CoprimeComplement := function( ocr )
    local   gns,  gvn,  tmp,  cpl,  K,  exp,  new,  i,  j;

    # get given generators
    gns := List( ocr.pPrimeSet, x -> ocr.generators[x] );

    # compute a cgs for these generators
    gvn := Normalized( AgSubgroup( Parent(ocr.group), gns, false ) );

    # ignore module
    gvn := gvn mod ocr.module;

    # compute a comprime complement
    tmp := AgSubgroup( Parent(ocr.group), gns, false );
    cpl := Normalized( CoprimeComplement( tmp, ocr.module ) ).cgs;

    # create the new generators
    K := ShallowCopy(ocr.generators);

    # try to reconstruct the given p prime set
    for i  in [ 1 .. Length(ocr.pPrimeSet) ]  do
        exp := Exponents( gvn, K[ocr.pPrimeSet[i]] );
        new := ocr.group.identity;
        for j  in [ 1 .. Length(exp) ]  do
            new := new * cpl[j]^exp[j];
        od;
        K[ocr.pPrimeSet[i]] := new;
    od;

    return K;

end;

OCPermGroupOps.CoprimeComplement := function( ocr )
    Error( "'CoprimeComplement' not implement yet" );
end;


#############################################################################
##
#F  OneCocyclesOC( <ocr>, <onlySplit> ) . . . . . . one cocycles main routine
##
##  If <onlySplit>, 'OneCocyclesOC' returns 'false' as soon  as  possibly  if
##  the extension does not split.
##
OneCocyclesOC := function( ocr, onlySplit )

    local   cobounds, cocycles,     # base of one coboundaries and cocycles
    	    dim,    	    	    # dimension of module
    	    gens,   	    	    # generator numbers
    	    len,    	    	    # number of generators
    	    K,	    	    	    # list of complement generators
    	    L0,                     # null vector
            S,  R,  	    	    # linear system and right hand side
    	    rels,   	    	    # relations
    	    RS,  RR,	    	    # rel linear system and right hand side
    	    isSplit,	    	    # is split extension
    	    N,	    	    	    # correct
    	    row,    	    	    # one row
    	    tmp, i, g, j, k, n;

    # If we know our cocycles return them.
    if IsBound( ocr.oneCocycles )  then
        return ocr.oneCocycles;
    fi;

    # Assume it does split. This maybe change later.
    isSplit := true;

    ocr.identity := ocr.group.identity;
    Info1Coh1( "#I  OneCocyclesOC: computes cocycles and cobounds\n" );

    # We  need the generators of the factorgroup with relations, all matrices
    # and  the  cobounds.  If  the 'smallGeneratingSet' is given, get the big
    # matrices and vectors.
    cobounds := Base( OneCoboundariesOC( ocr ) );

    # If  we  are only want normal complements, the group of cobounds must be
    # trivial,   otherwise  there  are  no  normal  ones  as  the  conjugated
    # complements correspond with the cobounds.
    if IsBound( ocr.normalIn ) and cobounds <> []  then
    	Info1Coh1( "#I  OneCocyclesCO: no normal complements\n" );
        return false;
    fi;

    # Initialize the relations and sum/big matrices.
    ocr.operations.AddRelations( ocr );
    ocr.operations.AddSumMatrices( ocr );
    if IsBound( ocr.smallGeneratingSet )  then
        ocr.operations.AddBigMatrices( ocr );
    fi;

    # Now  initialize  a  matrix  with  will  hold the triangulized system of
    # linear  equations.  If  'smallGeneratingSet'  is  given  use  this,  if
    # 'pPrimeSet' is given do not use those.
    dim := Length( Factors( Size( ocr.module ) ) );
    if IsBound( ocr.smallGeneratingSet )  then
        gens := ocr.smallGeneratingSet;
        len  := Length( ocr.smallGeneratingSet );
        K    := ShallowCopy( ocr.generators );
    elif IsBound( ocr.pPrimeSet )  then
    	Info1Coh2( "#I  OneCocyclesOC: computing coprime complement\n" );
        gens := Difference( [ 1 .. Length(ocr.generators) ], ocr.pPrimeSet );
    	gens := Set( gens );
        len  := Length( ocr.generators ) - Length( ocr.pPrimeSet );
    	K    := ocr.operations.CoprimeComplement( ocr );
        ocr.generators := ShallowCopy( K );
    else
        len  := Length( ocr.generators );
        gens := [ 1 .. len ];
        K    := ShallowCopy( ocr.generators );
    fi;
    Info1Coh2( "#I  OneCocyclesOC: ", len, " generators\n" );

    # Initialize system.
    tmp := ocr.moduleMap( ocr.identity );
    L0  := Concatenation( List( [ 1 .. len ], x -> tmp ) );
    IsVector( L0 );
    S := List( [ 1 .. len * dim ], x -> L0 );
    R := List( [ 1 .. len * dim ], x -> ocr.field.zero );

    # Get  the  linear  system  for one relation and append it to the already
    # triangulized system.
    Info1Coh2( "#I  OneCocyclesOC: constructing linear equations\n" );

    # Get all relations.
    if IsBound( ocr.normalIn )  then
        rels := Concatenation( ocr.relators,
    	    	    	       ocr.operations.NormalRelations( ocr, gens ) );
    else
        rels := ocr.relators;
    fi;

    for i  in [ 1 .. Length( rels ) ]  do
    	Info1Coh2("#I  OneCocyclesOC: relation ", i, " (",Length(rels),")\n");
        RS := [];
        if IsBound( ocr.smallGeneratingSet )  then
            for g  in gens  do
                Append( RS, SmallEquationMatrixOC( ocr, rels[i], g ) );
            od;
            RR := -SmallEquationVectorOC( ocr, rels[ i ] );
        else
            for g  in gens  do
                Append( RS, EquationMatrixOC( ocr, rels[ i ], g ) );
            od;
            RR := -EquationVectorOC( ocr, rels[ i ] );
        fi;

        # The is a system for x M = v so transpose.
        RS := TransposedMat( RS );
    	IsMat( RS );

        # Now append this to the triangulized system.
        for j  in [ 1 .. Length( RS ) ]  do
            k := 1;
            while RS[j] <> L0  do
                while IntVecFFE( RS[j], k ) = 0  do
    	    	    k := k + 1;
    	    	od;
          if IntVecFFE( S[k], k ) <> 0  then
                    RR[j] := RR[j] - RS[j][k] * R[k];
                    RS[j] := RS[j] - RS[j][k] * S[k];
                else
                    R[k] := RS[j][k] ^ -1 * RR[j];
                    S[k] := RS[j][k] ^ -1 * RS[j];
                    RS[j] := L0;
                    RR[j] := 0 * RR[j];
                fi;
            od;
            if IntVecFFE( RR, j ) <> 0  then
    	    	Info1Coh1( "#I  OneCocyclesOC: no split extension\n" );
                isSplit := false;
                if onlySplit  then
    	    	    return isSplit;
    	    	fi;
            fi;
        od;
    od;

    # Now remove all  entries above the  diagonal.  Let's see  if a  solution
    # exist.  As system <S> is triangulized all we have to do, is to check if
    # right side <R> is null, where the diagonal is null.
    Info1Coh2( "#I  OneCocyclesOC: computing nullspace and solution\n" );
    for i  in [ 1 .. Length(S) ]  do
        if IntVecFFE( S[i], i ) <> 0  then
            for k  in [ 1 .. i-1 ]  do
                if IntVecFFE( S[k], i ) <> 0  then
                    R[k] := R[k] - S[k][i] * R[i];
                    S[k] := S[k] - S[k][i] * S[i];
                fi;
            od;
        else
            if IntVecFFE( R, i ) <> 0  then
    	    	Info1Coh1( "#I  OneCocyclesOC: no split extension\n" );
                isSplit := false;
                if onlySplit  then  
    	    	    return isSplit;
    	    	fi;
            fi;
        fi;
    od;

    # As  <system> is triangulized, the right side is now the solution. So if
    # 'smallGeneratingSet'   is  not  given,  we  only  need  to  modify  the
    # <complement>  generators,  which  are  not in 'pPrimeSet'. Otherwise we
    # must  blow  up  the  cocycle to cover all generators not only the small
    # ones.
    if isSplit  then
        if not IsBound( ocr.smallGeneratingSet )  then
            N := ocr.cocycleToList( R );
            for i  in [ 1 .. Length( N ) ]  do
                K[ gens[i] ] := K[ gens[i] ] * N[ i ];
            od;
        else
            N := [];
            for i  in [ 1 .. Length( R ) / dim ]  do
    	    	n := Sublist( R, [ (i-1)*dim+1 .. i*dim ] );
                N[ ocr.smallGeneratingSet[i] ] := n;
            od;
            for i  in [ 1 .. Length( K ) ]  do
                if not IsBound( N[ i ] )  then
                    n := ocr.bigVectors[ i ];
                    for j  in ocr.smallGeneratingSet  do
                        n := n + N[ j ] * ocr.bigMatrices[ i ][ j ];
                    od;
                else
                    n := N[ i ];
                fi;
                K[ i ] := K[ i ] * ocr.vectorMap( n );
            od;
        fi;
    	ocr.operations.AddComplement( ocr, K );
    	ocr.operations.AddToFunctions( ocr );
    fi;

    # System <S> is triangulized,  get the nullspace.
    cocycles := [];
    for i  in [ 1 .. Length( S[1] ) ]  do
        if IntVecFFE( S[i], i ) = 0  then
            row := ShallowCopy( L0 );
            for k  in [ 1 .. i-1 ]  do	
    	    	row[k] := S[k][i];
    	    od;
            row[i] := -ocr.field.one;
            Add( cocycles, row );
        fi;
    od;
    IsMat( cocycles );

    # If  'pPrimeSet'  is  given,  we  need  to  add  zeros to cocycle at the
    # positions  of  the pPrimeGenerators. Then the cobounds must be added in
    # order to get all cocycles.
    if IsBound( ocr.pPrimeSet )  then
        tmp := ocr.moduleMap( ocr.identity );
        for j  in [ 1 .. Length( cocycles ) ]  do
            k := 0;
            row := [];
            for i  in [ 1 .. Length( ocr.generators ) ]  do
                if not i in ocr.pPrimeSet  then
    	    	    n := Sublist( cocycles[ j ], [k*dim+1 .. (k+1)*dim ] );
                    Append( row, n );
                    k := k + 1;
                else
                    Append( row, tmp );
                fi;
            od;
    	    IsVector( row );
            cocycles[ j ] := row;
        od;
        Append( cocycles, cobounds );
        if cocycles <> []  then
    	    cocycles := BaseMat( cocycles );
    	fi;
    else
        if cocycles <> []  then
    	    TriangulizeMat( cocycles );
    	fi;
    fi;
    ocr.oneCocycles := VectorSpace( cocycles,
    	    	    	    	    ocr.field,
    	    	    	    	    ocr.oneCoboundaries.zero);
    ocr.oneCocycles.base := cocycles;
    Info1Coh1( "#I  OneCocyclesOC: order of cocycles ", ocr.field.char,
               " ^ ", Length( Base( ocr.oneCocycles ) ), "\n" );
    return ocr.oneCocycles;

end;


#############################################################################
##
#F  OneCoboundaries( <G>, <M> )	. . . . . . . . . . one cobounds of <G> / <M>
##
AgGroupOps.OneCoboundaries := function( L )
    local   G,  GG,  M,  MM,  f,  ocr,  em;

    if Length( L ) = 2  then
    	G := CopyAgGroup( L[ 1 ] );
    	M := CopyAgGroup( L[ 2 ] );
    	ocr := rec( group := G, module := M, operations := OCAgGroupOps );
    	OneCoboundariesOC( ocr );
    	return rec(
    	    oneCoboundaries := ocr.oneCoboundaries,
    	    generators      := ocr.generators,
    	    cocycleToList   := ocr.cocycleToList,
    	    listToCocycle   := ocr.listToCocycle );
    else
    	G  := L[1];
    	M  := L[3];
    	f  := L[2];
    	GG := SemidirectProduct( G, f, M );
        em := Embedding( M, GG );
    	MM := Image( em );
    	ocr := rec( group := GG, module := MM, operations := OCAgGroupOps );
    	OneCoboundariesOC( ocr );
    	return rec(
    	    oneCoboundaries := ocr.oneCoboundaries,
    	    generators      := List( ocr.generators, x -> GG.mapping(x)[1] ),
    	    cocycleToList   := function( c )
    	    	    	    	   local n, L;
    	    	    	    	   L := [];
    	    	    	           for n  in ocr.cocycleToList( c )  do
    	    	    	    	       Add(L, PreImagesRepresentative(em,n));
    	    	    	    	   od;
    	    	    	    	   return L;
    	    	    	       end,
    	    listToCocycle   := function( l )
    	    	    	           local n, L;
    	    	    	    	   L := [];
    	    	    	    	   for n  in l  do
    	    	    	    	       Add( L, Image( em, n ) );
    	    	    	           od;
    	    	    	    	   return ocr.listToCocycle( L );
    	    	    	       end );
    fi;

end;

OneCoboundaries := function( arg )

    if not IsElementaryAbelian( arg[ Length(arg) ] )  then
    	Error( "<M> must be elementary abelian" );
    elif Length( arg ) = 2 and not IsSubgroup( arg[1], arg[2] )  then
    	Error( "<M> must be a subgroup of <G>" );
    fi;
    return arg[1].operations.OneCoboundaries( arg );

end;


#############################################################################
##
#F  OneCocycles( <G>, <M> ) . . . . . . . . . . . . one cocycles of <G> / <M>
##
AgGroupOps.OneCocycles := function( L )
    local   G,  GG,  M,  MM,  f,  ocr,  em;

    if Length( L ) = 2  then
    	G := CopyAgGroup( L[ 1 ] );
    	M := CopyAgGroup( L[ 2 ] );
    	ocr := rec( group := G, module := M, operations := OCAgGroupOps );
        OneCocyclesOC( ocr, false );
        if IsBound( ocr.complement )  then
            return rec(
    	    	oneCoboundaries     := ocr.oneCoboundaries,
    	    	oneCocycles         := ocr.oneCocycles,
    	        generators          := ocr.generators,
    	    	isSplitExtension    := true,
    	    	complement          := ocr.complement,
    	    	cocycleToList       := ocr.cocycleToList,
    	    	listToCocycle       := ocr.listToCocycle,
    	    	cocycleToComplement := ocr.cocycleToComplement,
    	    	complementToCocycle := ocr.complementToCocycle );
        else
            return rec(
    	    	oneCoboundaries     := ocr.oneCoboundaries,
    	    	oneCocycles         := ocr.oneCocycles,
    	        generators          := ocr.generators,
    	    	isSplitExtension    := false );
    	fi;
    else
    	G  := L[1];
    	M  := L[3];
    	f  := L[2];
    	GG := SemidirectProduct( G, f, M );
    	em := Embedding( M, GG );
    	MM := Image( em );
    	ocr := rec( group := GG, module := MM, operations := OCAgGroupOps );
        OneCocyclesOC( ocr, false );
    	return rec(
    	    oneCoboundaries := ocr.oneCoboundaries,
    	    oneCocycles     := ocr.oneCocycles,
    	    generators      := List( ocr.generators, x -> GG.mapping(x)[1] ),
    	    cocycleToList   := function( c )
    	    	    	    	   local n, L;
    	    	    	    	   L := [];
    	    	    	           for n  in ocr.cocycleToList( c )  do
    	    	    	    	       Add(L,PreImagesRepresentative(em,n));
    	    	    	    	   od;
    	    	    	    	   return L;
    	    	    	       end,
    	    listToCocycle   := function( l )
    	    	    	           local n, L;
    	    	    	    	   L := [];
    	    	    	    	   for n  in l  do
    	    	    	    	       Add( L, Image( em, n ) );
    	    	    	           od;
    	    	    	    	   return ocr.listToCocycle( L );
    	    	    	       end );
    fi;

end;

OneCocycles := function( arg )

    if not IsElementaryAbelian( arg[ Length(arg) ] )  then
    	Error( "<M> must be elementary abelian" );
    elif Length( arg ) = 2 and not IsSubgroup( arg[1], arg[2] )  then
    	Error( "<M> must be a subgroup of <G>" );
    fi;
    return arg[1].operations.OneCocycles( arg );

end;


#############################################################################
##
#F  PPrimeSetsOC( <U> ) . . . . . . . . . . . . . . . . . . . . . . . . local
##
##  Construct  a  generating  set, which has the generators of Hall-subgroups
##  of a sylowcomplement system as sublist.
##
PPrimeSetsOC := function( U )
    local   i,  j,  SS,  ps,  p,  gens,  pps;

    # At  first  get  a  sylow  system  [S_1, ...]. The generators of all S_i
    # except one j generate a sylow complement.
    InfoAgGroup1( "#I  PPrimeSetsOC: computing a sylow system\n" );
    SS := SylowSystem( U );
    ps := SS.primes;

    # Concatenate all generators and sort them according to their weight.
    gens := [];
    for i  in [ 1 .. Length( SS.sylowSubgroups ) ]  do
        Append( gens, Cgs( SS.sylowSubgroups[ i ] ) );
    od;
    Sort( gens,
          function( x, y ) return DepthAgWord( x ) < DepthAgWord( y ); end );

    # As  the  indices  of  the  generators are primes, they tell us to which
    # sylow complement systems a generator belongs.
    pps := List( ps, x -> [] );
    for i  in [ 1 .. Length( gens ) ]  do
        p := RelativeOrderAgWord( gens[ i ] );
        for j  in [ 1 .. Length( ps ) ]  do
            if p <> ps[ j ]  then
                Add( pps[ j ], i );
            fi;
        od;
    od;
    return rec( primes := ps, generators := gens, pPrimeSets := pps );

end;


#N  The following ag/perm group function worked for GAP 2.4  but they are not
#N  implement in GAP 3.1 yet.  They should however easly adapt.

#############################################################################
##
#F  RelatorRecordOC( <gens>, <igens>, <word> )  . . . . . . . . . . . . local
##
##  Let <gens> be a list of abstract generators, <igens> their inverses.  Let
##  <word> be a word  gen[i]^e * ...  in those generators.  Then the function
##  returns a record
##
##              rec( generators     := [ i, ... ],
##                   powers         := [ e, ... ],
##                   usedGenerators := { i, ... } )
##
##  which describes this word.
##
#XRelatorRecordOC := function( gen, igen, word )
#X
#X    local   relator,
#X            power,
#X            sword,
#X            where,
#X            i;
#X
#X    relator := rec( generators := [], powers := [] );
#X    i := 1;
#X    while i <= LengthWord( word )  do
#X        power := 1;
#X
#X        # Determine the power of the entry at position <i>.
#X        sword := Subword( word, i, i );
#X        while i < LengthWord( word ) and
#X              sword = Subword( word, i + 1, i + 1 )
#X        do
#X            i := i +  1;
#X            power := power + 1;
#X        od;
#X
#X        # Determine  if  the  generator is an inverse generator or not. If it
#X        # is an invers one, get the power negative.
#X        where := Position( gen, sword );
#X        if where = 0  then
#X            where := Position( igen, sword );
#X            power := -power;
#X        fi;
#X        Add( relator.generators, where );
#X        Add( relator.powers, power );
#X        i := i + 1;
#X    od;
#X
#X    # Add the used generator numbers.
#X    relator.usedGenerators := Set( relator.generators );
#X
#X    return relator;
#X
#Xend;
#X
#X
#############################################################################
##
#F  AddRelationsPermGroupOC( ocr )  . . . . . . . . . . . . . . . . . . local
##
##  Compute the relations for the  permutation group assuming that we already
##  know  a  presentation  for  the  whole group and a generating system ( as
##  normal subgroup ) for module.
##
#XAddRelationsPermGroupOC := function( ocr )
#X
#X    local   abstractGenerators,
#X            inverseAbstractGenerators,
#X            relations;
#X
#X  # Let  us  see if we know a presentation for 'ocr.group' and a generating
#X  # system for 'ocr.module'.
#X    if not IsBound( ocr.group.abstractGenerators )  then
#X        Error( "AddRelationsPermGroupOC: no abstract generators ",
#X               "for permutation group given" );
#X    elif not IsBound( ocr.group.relations )  then
#X        Error( "AddRelationsPermGroupOC: no relations for permutation ",
#X               "group given" );
#X    elif not IsBound( ocr.module.normalAbstractGenerators )  then
#X        Error( "AddRelationsPermGroupOC: no abstract generators ",
#X               "for module given" );
#X    fi;
#X    if VERBOSE  then
#X        Print( "#I  AddRelationsPermGroupOC: construct relations for ",
#X               "factorgroup from presentation\n" );
#X    fi;
#X
#X  # Join  the  relation  for  the whole group and set all module generators
#X  # equal to 1, this will be a presentation for the factorgroup.
#X    relations := Concatenation( ocr.group.relations,
#X                                ocr.module.normalAbstractGenerators );
#X
#X  # Convert   this   relations  to  the  relator-records  as  described  in
#X  # 'RelatorRecordOC' and bind the result to 'relations'.
#X    abstractGenerators        := ocr.group.abstractGenerators;
#X    inverseAbstractGenerators := List( abstractGenerators, x -> x ^ -1 );
#X    ocr.relations := List( relations, x -> RelatorRecordOC(
#X                           abstractGenerators,
#X                           inverseAbstractGenerators,
#X                           x ) );
#X
#Xend;
#X
#X
#############################################################################
##
#F  SmallWordOC( <word>, <agens>, <iagens> )  . . . . . . . . . . . . . local
##
##  Convert  an  abstract word in the abstract generators to a record used in
##  'OneCyclesOC'.
##
#XSmallWordOC := function( w, gens, igens )
#X
#X    local   genNrs,
#X            i, k, p,
#X            power,
#X            generators,
#X            powers;
#X
#X    # Loop over every generator of <w>.
#X    genNrs := [];
#X    for i  in [ 1 .. LengthWord( w ) ]  do
#X        p := Position( gens, Subword( w, i, i ) );
#X        if p > 0  then
#X            Add( genNrs, p );
#X        else
#X            Add( genNrs, -Position( igens, Subword( w, i, i ) ) );
#X        fi;
#X    od;
#X
#X    # Convert to power/exponent form.
#X    generators := [];
#X    powers     := [];
#X    k := 1;
#X    while k <= Length( genNrs )  do
#X        power := 1;
#X        while k < Length( genNrs ) and genNrs[ k ] = genNrs[ k + 1 ]  do
#X            power := power + 1;
#X            k     := k + 1;
#X        od;
#X        if genNrs[ k ] > 0  then
#X            Add( generators, genNrs[ k ] );
#X            Add( powers, power );
#X        else
#X            Add( generators, -genNrs[ k ] );
#X            Add( powers, -power );
#X        fi;
#X        k := k + 1;
#X    od;
#X
#X    return rec( generators     := generators,
#X                powers         := powers,
#X                usedGenerators := Set( generators ) );
#X
#Xend;
#X
#X
#############################################################################
##
#F  GeneratorsInSmallOC( <aggroup>, <sgs> ) . . . . . . . . . . . . . . local
##
##  Get the records usable by 'OneCocyclesOC'  for  a  small  generating  set
##  <sgs>. The set must contain normed (with leading exponent 1)  agwords  of
##  different weights.
##
#XGeneratorsInSmallOC := function( U, sgs )
#X
#X    local   igs,
#X            ags, invGens,
#X            absGens,
#X            cgs,
#X            position,
#X            weights,
#X            smallSet,
#X            smallWords,
#X            i;
#X
#X    # Typecheck arguments.
#X    if Length( Set( List( sgs, IndexAgWord ) ) ) <> Length( sgs )  then
#X        Error( "GeneratorsInSmall: generatos must have different weights" );
#X    elif Set( List( sgs, LeadingExponentAgWord ) ) <> [ 1 ]  then
#X        Error( "GeneratorsInSmall: all generators must have leading exp 1" );
#X    fi;
#X
#X  # Enter  the  elements  of  <sgs>  into the generating system of <U>. Get
#X  # some  abstract  generators  for  the  small  generators in <sgs>. These
#X  # generators  are  only  temporary. They will be converted to a record as
#X  # described in 'OneCocyclesOC'.
#X    igs      := GeneratorsAgGroup( U );
#X    ags      := List( igs, x -> Word( "emil" ) );
#X    weights  := List( igs, DepthAgWord );
#X    smallSet := [];
#X    absGens  := [];
#X    for i  in [ 1 .. Length( sgs ) ]  do
#X        position        := Position( weights, DepthAgWord( sgs[ i ] ) );
#X        igs[ position ] := sgs[ i ];
#X        absGens[ i ]    := Word( "hugo" );
#X        ags[ position ] := absGens[ i ];
#X        Add( smallSet, position );
#X    od;
#X    U := AgSubgroup( Parent( U ), igs );
#X
#X    # Use 'AbstractCgs' to get a complete generating system for <U>.
#X    cgs := AbstractCgs( U, sgs, absGens );
#X
#X    # Convert the abstract generators into records.
#X    if VERBOSE  then
#X        Print( "#I  GeneratorsInSmallOC: converting abstract words\n" );
#X    fi;
#X    invGens    := List( ags, x -> x^-1 );
#X    smallWords := List( cgs.abstractGenerators,
#X                        x -> SmallWordOC( x, ags, invGens ) );
#X
#X    return( rec( generators := cgs.generators, smallGeneratingSet :=
#X        smallSet, generatorsInSmall := smallWords ) );
#X
#Xend;
