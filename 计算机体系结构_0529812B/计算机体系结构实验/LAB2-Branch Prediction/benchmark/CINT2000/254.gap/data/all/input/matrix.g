#############################################################################
##
#A  matrix.g                    GAP library                  Martin Schoenert
##
#A  @(#)$Id: matrix.g,v 3.33.1.3 1996/09/12 13:52:04 mschoene Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains  those  functions  that  mainly  deal  with  matrices.
##
#H  $Log: matrix.g,v $
#H  Revision 3.33.1.3  1996/09/12 13:52:04  mschoene
#H  fixed handling of abelian invariants
#H
#H  Revision 3.33.1.2  1996/05/06 12:20:27  mschoene
#H  changed 'DiagonalizeMat' to use norms to select the pivot
#H
#H  Revision 3.33.1.1  1994/08/24  15:22:00  sam
#H  improved 'TransposedMat'
#H
#H  Revision 3.33  1994/06/15  14:38:23  sam
#H  fixed 'SemiEchelonMat'
#H
#H  Revision 3.32  1994/05/19  13:07:37  sam
#H  added algebra stuff, improved 'InducedAction' functions
#H
#H  Revision 3.31  1994/04/21  12:20:22  sam
#H  added several functions for matrices
#H
#H  Revision 3.30  1994/03/09  13:43:59  beick
#H  Added 'NullspaceModQ' and 'SimultaneousEigenvalues'
#H
#H  Revision 3.29  1994/03/09  13:24:51  sam
#H  added 'PermutationMat', dispatcher 'BaseNullspace',
#H  'Algebra'; introduced 'OperationsRecord' instead of copying
#H
#H  Revision 3.28  1994/01/25  10:45:18  fceller
#H  added Bettina's 'BaseFixedSpace'
#H
#H  Revision 3.27  1994/01/20  12:10:25  sam
#H  back to revision 3.25
#H
#H  Revision 3.26  1993/07/16  07:04:37  sam
#H  made 'DimensionsMat' a dispatcher
#H
#H  Revision 3.25  93/05/17  07:43:14  fceller
#H  renamed 'OrderScalar' to 'ProjectiveOrder'
#H  
#H  Revision 3.24  93/05/04  11:35:51  fceller
#H  fixed a spelling error
#H  
#H  Revision 3.23  1993/04/27  08:11:43  martin
#H  fixed incorrect 'RandomList' call in 'RandomUnimodularMat'
#H
#H  Revision 3.22  1993/02/16  12:39:55  sam
#H  allowed '[]' as arguments in 'TriangulizeMat' etc.
#H  (although '[]' is not a matrix in the sense of GAP)
#H
#H  Revision 3.21  1993/01/22  12:10:53  fceller
#H  fixed 'NullMat' and 'IdentityMat' to allow ring argument
#H
#H  Revision 3.20  1993/01/20  18:25:25  sam
#H  moved added functions to directory grp ...
#H
#H  Revision 3.19  1993/01/18  17:18:58  sam
#H  added GL, SL, SP, GU, SU in 'MatricesOps'
#H
#H  Revision 3.18  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.17  1992/11/25  13:41:51  fceller
#H  improved 'MinimalPolynomial' (this is due to CRLG and EOB)
#H
#H  Revision 3.16  1992/10/19  14:08:50  fceller
#H  renamed 'WeightVecFFE' to 'DepthVector'
#H
#H  Revision 3.15  1992/09/10  11:14:47  martin
#H  changed 'DiagonalizeMat' to use a better pivoting strategy
#H
#H  Revision 3.14  1992/07/02  11:48:20  fceller
#H  improved 'FiniteFieldMatricesOps.*Polynomial'
#H
#H  Revision 3.13  1992/07/01  11:39:07  fceller
#H  added 'FiniteFieldMatricesOps.MinimalPolynomial' and
#H  'FiniteFieldMatricesOps.CharacteristicPolynomial'
#H
#H  Revision 3.12  1992/06/05  09:53:08  fceller
#H  added dispatchers for minimal and characteristic polynomial
#H
#H  Revision 3.11  1992/05/07  11:03:15  fceller
#H  added 'OrderScalar'
#H
#H  Revision 3.10  1992/04/23  10:34:46  fceller
#H  added functions for finite field matrices
#H
#H  Revision 3.9  1992/04/07  16:15:32  jmnich
#H  adapted to changes in the finite field module
#H
#H  Revision 3.8  1992/04/03  16:25:56  martin
#H  fixed 'MatricesOps.in'
#H
#H  Revision 3.7  1992/02/19  12:36:28  martin
#H  fixed another bug in 'NullspaceMat'
#H
#H  Revision 3.6  1992/01/29  14:58:42  sam
#H  changed 'TransposedMat' (does no longer abuse 'Add')
#H
#H  Revision 3.5  1992/01/16  12:57:00  martin
#H  changed 'Matrices' to inherit from 'GroupElements'
#H
#H  Revision 3.4  1991/12/04  13:25:13  martin
#H  added 'KroneckerProduct'
#H
#H  Revision 3.3  1991/11/08  16:13:41  martin
#H  changed 'matrix.g' to read 'matgrp.g' and 'matring.g' automatically
#H
#H  Revision 3.2  1991/11/08  15:56:11  martin
#H  changed everything for new domain concept
#H
#H  Revision 3.1  1991/06/03  10:47:23  fceller
#H  added 'Solution'
#H
#H  Revision 3.0  1991/05/31  13:48:28  martin
#H  initial revision under RCS
##


#############################################################################
##
#F  InfoMatrix1(...)  . . . . . . . . . . . information function for matrices
#F  InfoMatrix2(...)  . . . . . . . . . . . information function for matrices
##
if not IsBound(InfoMatrix1)  then InfoMatrix1 := Ignore;  fi;
if not IsBound(InfoMatrix2)  then InfoMatrix2 := Ignore;  fi;
if not IsBound(InfoMatrix3)  then InfoMatrix3 := Ignore;  fi;


#############################################################################
##
#F  IsMatrix( <obj> )
##
IsMatrix := function( obj )
    return IsMat( obj ) or ( IsRec( obj ) and IsBound( obj.isMatrix )
                                          and obj.isMatrix );
    end;

#############################################################################
##
#V  Matrices  . . . . . . . . . . . . . . . . . . . .  domain of all matrices
#V  MatricesOps . . . . . . .  operation record of the domain of all matrices
##
MatricesOps := OperationsRecord( "MatricesOps", GroupElementsOps );

Matrices := rec(
    isDomain            := true,

    name                := "Matrices",

    isFinite            := false,
    size                := "infinity",

    operations          := MatricesOps
);

MatricesOps.\in := function ( obj, Matrices )
    return IsMat( obj );
end;


#############################################################################
##
#F  MatricesOps.SpecialLinearGroup( Matrices, <n>, <q> )  . .  SL( <n>, <q> )
#F  MatricesOps.GeneralLinearGroup( Matrices, <n>, <q> )  . .  GL( <n>, <q> )
#F  MatricesOps.SymplecticGroup( Matrices, <n>, <q> ) . . . .  Sp( <n>, <q> )
#F  MatricesOps.GeneralUnitaryGroup( Matrices, <n>, <q> ) . .  GU( <n>, <q> )
#F  MatricesOps.SpecialUnitaryGroup( Matrices, <n>, <q> ) . .  SU( <n>, <q> )
##
MatricesOps.SpecialLinearGroup := function ( M, n, q )
    return MatGroupLib( "SpecialLinearGroup", n, q );
end;

MatricesOps.GeneralLinearGroup := function ( M, n, q )
    return MatGroupLib( "GeneralLinearGroup", n, q );
end;

MatricesOps.SymplecticGroup := function ( M, n, q )
    return MatGroupLib( "SymplecticGroup", n, q );
end;

MatricesOps.GeneralUnitaryGroup := function ( M, n, q )
    return MatGroupLib( "GeneralUnitaryGroup", n, q );
end;

MatricesOps.SpecialUnitaryGroup := function ( M, n, q )
    return MatGroupLib( "SpecialUnitaryGroup", n, q );
end;

#############################################################################
##
#F  MatricesOps.IsMonomial( <M> )
##
MatricesOps.IsMonomial := function( M )

    local zero,  # zero of the base ring
          len,   # length of rows
          row,   # loop over rows
          j,     # loop over row until nonzero element is found
          i;     # loop over the rest of the row

    zero:= 0 * M[1][1];
    len:= Length( M[1] );
    for row in M do
      j:= 1;
      while j <= len and row[j] = zero do
        j:= j+1;
      od;
      if j > len then
        return false;
      fi;
      for i in [ j+1 .. len ] do
        if row[i] <> zero then
          return false;
        fi;
      od;
    od;
    return true;
    end;

#############################################################################
##
#F  MatricesOps.Algebra( <F>, Matrices, <gens>, <zero> )
##
MatricesOps.Algebra := function ( F, Matrices, gens, zero )
    local   A;

    # make the algebra record
    A:= AlgebraElementsOps.Algebra( F, AlgebraElements, gens, zero );
    A.isMatAlgebra  := true;
    A.isVectorSpace := true;
    A.operations    := MatAlgebraOps;

    # return the algebra record
    return A;
    end;

#############################################################################
##
#F  MatricesOps.UnitalAlgebra( <F>, Matrices, <gens>, <zero> )
##
MatricesOps.UnitalAlgebra := function ( F, Matrices, gens, zero )
    local   A;

    # make the algebra record
    A:= AlgebraElementsOps.UnitalAlgebra( F, AlgebraElements, gens, zero );
    A.isMatAlgebra  := true;
    A.isVectorSpace := true;
    A.operations    := UnitalMatAlgebraOps;

    # return the algebra record
    return A;
    end;

#############################################################################
##
#F  MatricesOps.AsAlgebra( <F>, <D> )
##
MatricesOps.AsAlgebra := AlgebraElementsOps.AsAlgebra;
    
#############################################################################
##
#F  MatricesOps.AsUnitalAlgebra( <F>, <D> )
##
MatricesOps.AsUnitalAlgebra := AlgebraElementsOps.AsUnitalAlgebra;

#############################################################################
##
#F  DimensionsMat( <mat> )  . . . . . . . . . . . . .  dimensions of a matrix
##
DimensionsMat := function ( mat )
    return [ Length(mat), Length(mat[1]) ];
    end;


#############################################################################
##
#F  IdentityMat( <m> [, <F>] )  . . . . . . . identity matrix of a given size
##
IdentityMat := function ( arg )
    local   id, m, zero, one, row, i, k;

    # check the arguments and get dimension, zero and one
    if Length(arg) = 1  then
        m    := arg[1];
        zero := 0;
        one  := 1;
    elif Length(arg) = 2  and IsField(arg[2])  then
        m    := arg[1];
        zero := arg[2].zero;
        one  := arg[2].one;
    elif Length(arg) = 2  and IsRing(arg[2])  then
    	if not IsBound(arg[2].one)  then
    	    Error( "ring must be a ring-with-one" );
    	fi;
    	m    := arg[1];
    	zero := arg[2].zero;
    	one  := arg[2].one;
    elif Length(arg) = 2  then
        m    := arg[1];
        zero := arg[2] - arg[2];
        one  := arg[2] ^ 0;
    else
        Error("usage: IdentityMat( <m> [, <F>] )");
    fi;

    # make an empty row
    row := [];
    for k  in [1..m]  do row[k] := zero;  od;

    # make the identity matrix
    id := [];
    for i  in [1..m]  do
        id[i] := ShallowCopy( row );
        id[i][i] := one;
    od;

    # return the identity matrix
    return id;
end;


#############################################################################
##
#F  NullMat( <m>, <n> [, <F>] ) . . . . . . . . . null matrix of a given size
##
NullMat := function ( arg )
    local   null, m, n, zero, row, i, k;

    if Length(arg) = 2  then
        m    := arg[1];
        n    := arg[2];
        zero := 0;
    elif Length(arg) = 3  and IsField(arg[3])  then
        m    := arg[1];
        n    := arg[2];
        zero := arg[3].zero;
    elif Length(arg) = 3  and IsRing(arg[3])  then
    	m    := arg[1];
    	n    := arg[2];
    	zero := arg[3].zero;
    elif Length(arg) = 3  then
        m    := arg[1];
        n    := arg[2];
        zero := arg[3] - arg[3];
    else
        Error("usage: NullMat( <m>, <n> [, <F>] )");
    fi;

    # make an empty row
    row := [];
    for k  in [1..n]  do row[k] := zero;  od;

    # make the null matrix
    null := [];
    for i  in [1..m]  do
        null[i] := ShallowCopy( row );
    od;

    # return the null matrix
    return null;
end;


#############################################################################
##
#F  RandomMat( <m>, <n> [, <R>] ) . . . . . . . . . . .  make a random matrix
##
##  'RandomMat' returns a random matrix with <m> rows and  <n>  columns  with
##  elements taken from the ring <R>, which defaults to 'Integers'.
##
RandomMat := function ( arg )
    local   mat, m, n, R, i, row, k;

    # check the arguments and get the list of elements
    if Number(arg) = 2  then
        m := arg[1];
        n := arg[2];
        R := Integers;
    elif Number(arg) = 3  then
        m := arg[1];
        n := arg[2];
        R := arg[3];
    else
        Error("usage: RandomMat( <m>, <n> [, <F>] )");
    fi;

    # now construct the random matrix
    mat := [];
    for i  in [1..m]  do
        row := [];
        for k  in [1..n]  do
            row[k] := Random( R );
        od;
        mat[i] := row;
    od;

    return mat;
end;


#############################################################################
##
#F  RandomInvertableMat( <m> [, <R>] )  . . . make a random invertable matrix
##
##  'RandomInvertableMat' returns a invertable   random matrix with  <m> rows
##  and columns  with elements  taken from  the  ring <R>, which defaults  to
##  'Integers'.
##
RandomInvertableMat := function ( arg )
    local   mat, m, R, i, row, k;

    # check the arguments and get the list of elements
    if Number(arg) = 1  then
        m := arg[1];
        R := Integers;
    elif Length(arg) = 2  then
        m := arg[1];
        R := arg[2];
    else
        Error("usage: RandomInvertableMat( <m> [, <R>] )");
    fi;

    # now construct the random matrix
    mat := [];
    for i  in [1..m]  do
        repeat
            row := [];
            for k  in [1..m]  do
                row[k] := Random( R );
            od;
            mat[i] := row;
        until NullspaceMat( mat ) = [];
    od;

    return mat;
end;


#############################################################################
##
#F  RandomUnimodularMat( <m> )  . . . . . . . . . .  random unimodular matrix
##
RandomUnimodularMat := function ( m )
    local  mat, c, i, j, k, l, a, b, v, w, gcd;

    # start with the identity matrix
    mat := IdentityMat( m );

    for c  in [1..m]  do

        # multiply two random rows with a random? unimodular 2x2 matrix
        i := RandomList([1..m]);
        repeat
            j := RandomList([1..m]);
        until j <> i;
        repeat
            a := Random( Integers );  b := Random( Integers );
            gcd := Gcdex( a, b );
        until gcd.gcd = 1;
        v := mat[i];  w := mat[j];
        mat[i] := gcd.coeff1 * v + gcd.coeff2 * w;
        mat[j] := gcd.coeff3 * v + gcd.coeff4 * w;

        # multiply two random cols with a random? unimodular 2x2 matrix
        k := RandomList([1..m]);
        repeat
            l := RandomList([1..m]);
        until l <> k;
        repeat
            a := Random( Integers );  b := Random( Integers );
            gcd := Gcdex( a, b );
        until gcd.gcd = 1;
        for i  in [1..m]  do
            v := mat[i][k];  w := mat[i][l];
            mat[i][k] := gcd.coeff1 * v + gcd.coeff2 * w;
            mat[i][l] := gcd.coeff3 * v + gcd.coeff4 * w;
        od;

    od;

    return mat;
end;


#############################################################################
##
#F  TransposedMat( <mat> )  . . . . . . . . . . . . .  transposed of a matrix
##
##  'TransposedMat' returns the transposed of the matrix  <mat>,  i.e., a new
##  matrix <trans> such that '<trans>[<i>][<k>]' is '<mat>[<k>][<i>]'.
##
TransposedMat := function ( mat )

    local trn, n, m, j;

    m:= Length( mat );
    if m = 0 then return []; fi;

    # initialize the transposed
    m:= [ 1 .. m ];
    n:= [ 1 .. Length( mat[1] ) ];
    trn:= [];

    # copy the entries
    for j in n do
      trn[j]:= mat{ m }[j];
    od;

    # return the transposed
    return trn;
    end;

############################################################################
##
##  PermutationMat( <perm>, <dim> [, <F> ] ) . . . . . .  permutation matrix
##
PermutationMat := function( arg )

    local i,       # loop variable
          perm,    # permutation
          dim,     # desired dimension of the permutation matrix
          F,       # field of the matrix entries (defauled to 'Rationals')
          mat;     # matrix corresponding to 'perm', result

    if not ( ( Length( arg ) = 2 or Length( arg ) = 3 )
             and IsPerm( arg[1] ) and IsInt( arg[2] ) ) then
      Error( "usage: PermutationMat( <perm>, <dim> [, <F> ] )" );
    fi;

    perm:= arg[1];
    dim:= arg[2];
    if Length( arg ) = 2 then
      F:= Rationals;
    else
      F:= arg[3];
    fi;

    mat:= NullMat( dim, dim, F );

    for i in [ 1 .. dim ] do
      mat[i][ i^perm ]:= F.one;
    od;

    return mat;
    end;

#############################################################################
##
#F  MatricesOps.KroneckerProduct( <mat1>, <mat2> )
##
MatricesOps.KroneckerProduct := function ( mat1, mat2 )
    local i, row1, row2, row, kroneckerproduct;
    kroneckerproduct := [];
    for row1  in mat1  do
        for row2  in mat2  do
            row := [];
            for i  in row1  do
                Append( row, i * row2 );
            od;
            Add( kroneckerproduct, row );
        od;
    od;
    return kroneckerproduct;
    end;

#############################################################################
##
#F  InvariantForm( <struct> )
##
InvariantForm := function( struct )
    if IsRec( struct ) then
      if not IsBound( struct.invariantForm ) then
        struct.invariantForm:= struct.operations.InvariantForm( struct );
      fi;
      return struct.invariantForm;
    else
      return Domain( struct ).operations.InvariantForm( struct );
    fi;
    end;

#############################################################################
##
#F  MatricesOps.InvariantForm( <D> )
##
MatricesOps.InvariantForm := function( D )
    local F,          # field
          q,          # size of 'F'
          A,          # 'F'-algebra generated by 'D'
          nr,         # word number
          word,       # loop over algebra elements
          i,          # loop variable
          ns,         # file for a nullspace
          sb1,        # standard basis of 'D'
          T,          # contragredient representation
          sb2,        # standard basis of 'T'
          M;          # invariant form, result

    if   not ( IsList( D ) and ForAll( D, IsMatrix ) ) then
      Error( "<D> must be a list of matrices" );
    elif Length( D ) = 0 then
      Error( "need at least one matrix" );
    fi;

    F:= Field( Flat( D ) );
    if not IsFinite( F ) then
      Error( "sorry, for finite fields only" );
    fi;
    q:= Size( F );

    # Search for an algebra element of nullity 1.
    # Use normed words only, that is, words of the form $I + w$.
    # Write the 'D' nullspace of the nullity 1 word to 'ns'.
    A:= Algebra( F, D );
    nr:= 1;
    repeat
      nr:= nr + q;
      word:= ElementAlgebra( A, nr );
      ns:= NullspaceMat( word );
    until Length( ns ) = 1;
      
    # Compute the standard basis for the natural module of 'D',
    # starting with the word of nullity 1, write output to 'sb1'
    sb1:= StandardBasis( Module( A, ns ) ).vectors;

    # Check whether the whole space is spanned.
    if Length( sb1 ) < Length( ns[1] ) then
      Error( "representation is reducible" );
    fi;

    # Make the contragredient representation 'T'.
    T:= Algebra( A.field, List( D, x -> TransposedMat( x^-1 ) ) );

    # Write the 'T' nullspace of the nullity 1 word to 'ns'.
    ns:= NullspaceMat( ElementAlgebra( T, nr ) );

    # Compute the standard basis for the natural module of 'T',
    # starting with the word of nullity 1, write output to 'sb2'
    sb2:= StandardBasis( Module( T, ns ) ).vectors;

    # If 'D' and 'T' are equivalent then
    # the invariant matrix is 'M = sb1^(-1) * sb2',
    # since 'sb1 * D[i] * sb1^(-1) = sb2 * T[i] * sb2^(-1)' implies
    # that 'D[i] * M * D^{tr} = M'.
    M:= sb1^-1 * sb2;

    # Check for equality.
    for i in [ 1 .. Length( D ) ] do
      if D[i] * M * TransposedMat( D[i] ) <> M then
        return false;
      fi;
    od;  

    # Return the result.
    return M;
    end;

#############################################################################
##
#F  OrderMat( <mat> ) . . . . . . . . . . . . . . . . . . . order of a matrix
#F  MatricesOps.Order(<Matrices>,<mat>) . . . . . . . . . . order of a matrix
##
OrderMatLimit := 1000;

OrderMat := function ( mat )
    local   ord, m, id, vec, v, o, i;

    # check that the argument is an invertable square matrix
    m := Length(mat);
    if m <> Length(mat[1])  then
        Error("OrderMat: <mat> must be a square matrix");
    fi;
    if RankMat( mat ) <> m  then
        Error("OrderMat: <mat> must be invertable");
    fi;
    id := mat ^ 0;

    # loop over the standard basis vectors
    ord := 1;
    for i  in [1..m]  do

        # compute the length of the orbit of the <i>th standard basis vector
        vec := mat[i];
        v   := vec * mat;
        o   := 1;
        while v <> vec  do
            v := v * mat;
            o := o + 1;
            if OrderMatLimit = o  then
                Print("#W  OrderMat: warning, order might be infinite\n");
            fi;
        od;

        # raise the matrix to this length (new mat will fix basis vector)
        mat := mat ^ o;
        ord := ord * o;
    od;

    # return the order
    return ord;
end;

MatricesOps.Order := function ( Matrices, mat )
    return OrderMat( mat );
end;


#############################################################################
##
#F  DiagonalOfMat(<mat>)  . . . . . . . . . . . . . . . .  diagonal of matrix
##
##  'DiagonalOfMat' returns  the diagonal of  the matrix <mat>.  The diagonal
##  has the same length  as the rows  of <mat>, it  is padded with  zeroes if
##  <mat> has fewer rows than columns.
##
DiagonalOfMat := function ( mat )
    local   diag, i;
    diag := [];
    i := 1;
    while i <= Length(mat) and i <= Length(mat[1]) do
        diag[i] := mat[i][i];
        i := i + 1;
    od;
    while 1 <= Length(mat) and i <= Length(mat[1]) do
        diag[i] := mat[1][1] - mat[1][1];
        i := i + 1;
    od;
    return diag;
end;


#############################################################################
##
#F  TraceMat( <mat> ) . . . . . . . . . . . . . . . . . . . trace of a matrix
##
TraceMat := function ( mat )
    local   trc, m, i;

    # check that the element is a square matrix
    m := Length(mat);
    if m <> Length(mat[1])  then
        Error("TraceMat: <mat> must be a square matrix");
    fi;

    # sum all the diagonal entries
    trc := mat[1][1];
    for i  in [2..m]  do
        trc := trc + mat[i][i];
    od;

    # return the trace
    return trc;
end;


#############################################################################
##
#F  RankMat( <mat> )  . . . . . . . . . . . . . . . . . . .  rank of a matrix
##
RankMat := function ( mat )
    local   m, n, i, j, k, row, zero;

    # make a copy to avoid changing the original argument
    m := Length(mat);
    n := Length(mat[1]);
    zero := 0*mat[1][1];
    mat := ShallowCopy( mat );
    InfoMatrix1("#I  RankMat called\n");
    InfoMatrix2("#I    nonzero columns: \c");

    # run through all columns of the matrix
    i := 0;
    for k  in [1..n]  do

        # find a nonzero entry in this column
        #N  26-Oct-91 martin if <mat> is an rational matrix look for a pivot
        j := i + 1;
        while j <= m and mat[j][k] = zero  do j := j+1;  od;

        # if there is a nonzero entry
        if j <= m  then

            # increment the rank
            InfoMatrix2(k," \c");
            i := i + 1;

            # make its row the current row and normalize it
            row := mat[j];  mat[j] := mat[i];  mat[i] := row[k]^-1 * row;

            # clear all entries in this column
            for j  in [i+1..m] do
                if  mat[j][k] <> zero  then
                    mat[j] := mat[j] - mat[j][k] * mat[i];
                fi;
            od;

        fi;

    od;

    # return the rank (the number of linear independent rows)
    InfoMatrix2("\n");
    InfoMatrix1("#I  RankMat returns ",i,"\n");
    return i;
end;


#############################################################################
##
#F  DeterminantMat( <mat> ) . . . . . . . . . . . . . determinant of a matrix
##
DeterminantMat := function ( mat )
    local   det, sgn, row, zero, m, i, j, k, l;

    # check that the argument is a square matrix and get the size
    m := Length(mat);
    zero := 0*mat[1][1];
    if m <> Length(mat[1])  then
        Error("DeterminantMat: <mat> must be a square matrix");
    fi;

    # make a copy to avoid changing the orginal argument
    mat := ShallowCopy( mat );
    InfoMatrix1("#I  DeterminantMat called\n");
    InfoMatrix2("#I    nonzero columns: \c");

    # run through all columns of the matrix
    i := 0;  det := 1;  sgn := 1;
    for k  in [1..m]  do

        # find a nonzero entry in this column
        #N  26-Oct-91 martin if <mat> is an rational matrix look for a pivot
        j := i + 1;
        while j <= m and mat[j][k] = zero  do j := j+1;  od;

        # if there is a nonzero entry
        if j <= m  then

            # increment the rank
            InfoMatrix2(k," \c");
            i := i + 1;

            # make its row the current row
            if i <> j  then
                row := mat[j];  mat[j] := mat[i];  mat[i] := row;
                sgn := -sgn;
            fi;

            # clear all entries in this column
            for j  in [i+1..m]  do
                mat[j] := (mat[i][k]*mat[j]-mat[j][k]*mat[i])/det;
            od;

            det := mat[i][k];
        fi;

    od;

    # return the determinant
    if i < m  then det := zero;  fi;
    InfoMatrix2("\n");
    InfoMatrix1("#I  DeterminantMat returns ",sgn*det,"\n");
    return sgn * det;
end;


#############################################################################
##
#F  TriangulizeMat( <mat> ) . . . . . bring a matrix in upper triangular form
##
TriangulizeMat := function ( mat )
    local   m, n, i, j, k, row, zero;

    InfoMatrix1("#I  TriangulizeMat called\n");

    if mat <> [] then 

       # get the size of the matrix
       m := Length(mat);
       n := Length(mat[1]);
       zero := 0*mat[1][1];
       InfoMatrix2("#I    nonzero columns: \c");
   
       # run through all columns of the matrix
       i := 0;
       for k  in [1..n]  do
   
           # find a nonzero entry in this column
           j := i + 1;
           while j <= m and mat[j][k] = zero  do j := j + 1;  od;
   
           # if there is a nonzero entry
           if j <= m  then
   
               # increment the rank
               InfoMatrix2(k," \c");
               i := i + 1;
   
               # make its row the current row and normalize it
               row := mat[j];  mat[j] := mat[i];  mat[i] := row[k]^-1 * row;
   
               # clear all entries in this column
               for j  in [1..m] do
                   if  i <> j  and mat[j][k] <> zero  then
                       mat[j] := mat[j] - mat[j][k] * mat[i];
                   fi;
               od;
   
           fi;
   
       od;

    fi;

    InfoMatrix2("\n");
    InfoMatrix1("#I  TriangulizeMat returns\n");
end;


#############################################################################
##
#F  BaseMat( <mat> )  . . . . . . . . . .  base for the row space of a matrix
##
BaseMat := function ( mat )
    local  base, m, n, i, k, zero;

    base := [];

    if mat <> [] then

       # make a copy to avoid changing the original argument
       mat := ShallowCopy( mat );
       m := Length(mat);
       n := Length(mat[1]);
       zero := 0*mat[1][1];
   
       # triangulize the matrix
       TriangulizeMat( mat );
   
       # and keep only the nonzero rows of the triangular matrix
       i := 1;
       for k  in [1..n]  do
           if i <= m  and mat[i][k] <> zero  then
               Add( base, mat[i] );
               i := i + 1;
           fi;
       od;

    fi;

    # return the base
    return base;
end;

#############################################################################
##
#F  MatricesOps.Base( <mat> )
##
MatricesOps.Base := BaseMat;

#############################################################################
##
#F  SemiEchelonMat( <mat> )
##
##  returns a record that contains information about a semi-echelonized form
##  of the matrix <mat>.  The components of this record are
##
##  'vectors': \\
##        list of vectors, each with pivot element 'one',
##
##  'heads' : \\
##        list that contains at position <i>, if bound, the number of the
##        row for that the pivot element is in column <i>,
##
##  'ishead' : \\
##        boolean list, 'true' for positions <i> where 'heads[<i>]' is bound.
##
##  A matrix is in semi-echelon form if the first nonzero element in each row
##  is 'one' (of the appropriate field), and all values exactly below these
##  pivots are zero.
##
SemiEchelonMat := function( mat )

    local zero,      # zero of the field of <mat>
          nrows,     # number of rows in <mat>
          ncols,     # number of columns in <mat>
          heads,     # list of leading positions of ase rows
          base,      # list of base vectors
          ishead,    # boolean list with 'heads' info
          i,         # loop over rows
          j,         # loop over columns
          k;         # loop over 'base'

    mat:= Copy( mat );

    zero:= 0 * mat[1][1];
    nrows:= Length( mat );
    ncols:= Length( mat[1] );

    heads:= [];
    base := [];
    ishead:= BlistList( [ 1 .. ncols ], [] );

    for i in [ 1 .. nrows ] do

      # Reduce the row with the known basis vectors.
      for j in [ 1 .. ncols ] do
        if ishead[j] then
          AddCoeffs( mat[i], base[ heads[j] ], - mat[i][j] );
        fi;
      od;

      j:= DepthVector( mat[i] );
      if j <= ncols then

        # We found a new basis vector.
        Add( base, mat[i] / mat[i][j] );
        heads[j]:= Length( base );
        ishead[j]:= true;

      fi;

    od;

    return rec( heads   := heads,
                ishead  := ishead,
                vectors := base );
    end;

#############################################################################
##
#F  InducedActionSpaceMats( <basis>, <mats> )
##
##  returns the list of matrices that describe the action of the matrices in
##  the list <mats> on the row space with basis <basis>, with respect to this
##  basis.
##
InducedActionSpaceMats := function( basis, mats )

    local action,         # list of result matrices
          m;              # loop over 'mats'

    action:= [];
    for m in mats do
      Add( action, List( basis.vectors,
                         x -> Coefficients( basis, x * m ) ) );
    od;
    return action;
    end;

#############################################################################
##
#F  SumIntersectionMat( <M1>, <M2> )  . .  sum and intersection of two spaces
##
##  performs a Zassenhaus algorithm to compute bases for the sum and the
##  intersection of spaces generated by the rows of the matrices <M1>, <M2>.
##
##  returns a list of length 2, at first position a base of the sum,
##  at second position a base of the intersection.
##  Both bases are in semi-echelon form.
##
SumIntersectionMat := function( M1, M2 )

    local n,      # number of columns
          mat,    # matrix for Zassenhaus algorithm
          zero,   # zero vector
          v,      # loop over 'M1' and 'M2'
          heads,  # list of leading positions
          sum,    # base of the sum
          i,      # loop over rows of 'mat'
          int;    # base of the intersection

    if   Length( M1 ) = 0 then
      return [ M2, M1 ];
    elif Length( M2 ) = 0 then
      return [ M1, M2 ];
    elif Length( M1[1] ) <> Length( M2[1] ) then
      Error( "dimensions of matrices are not compatible" );
    elif 0 * M1[1][1] <> 0 * M2[1][1] then
      Error( "fields of matrices are not compatible" );
    fi;

    n:= Length( M1[1] );
    mat:= [];
    zero:= 0 * M1[1];
 
    # Set up the matrix for the Zassenhaus algorithm.
    mat:= [];
    for v in M1 do
      v:= ShallowCopy( v );
      Append( v, v );
      IsVector( v );
      Add( mat, v );
    od;
    for v in M2 do
      v:= ShallowCopy( v );
      Append( v, zero );
      IsVector( v );
      Add( mat, v );
    od;

    # Transform 'mat' into semi-echelon form.
    mat   := SemiEchelonMat( mat );
    heads := mat.heads;
    mat   := mat.vectors;

    # Extract the bases for the sum \ldots
    sum:= [];
    for i in [ 1 .. n ] do
      if IsBound( heads[i] ) then
        Add( sum, mat[ heads[i] ]{ [ 1 .. n ] } );
      fi;
    od;

    # \ldots and the intersection.
    int:= [];
    for i in [ n+1 .. Length( heads ) ] do
      if IsBound( heads[i] ) then
        Add( int, mat[ heads[i] ]{ [ n+1 .. 2*n ] } );
      fi;
    od;
    
    # return the result
    return [ sum, int ];
    end;

#############################################################################
##
#F  BaseFixedSpace( <mats> )  . . . . . . . . . . . .  calculate fixed points
##
##  'BaseFixedSpace' returns a base  of the vectorspace V  such that M*v  = v
##  for all v in V and all matrices M of the list
##
BaseFixedSpace := function( matrices )

    local I,            # Identitymatrix
          size,         # dimension of vector space
          E,            # linear system
          M,            # one matrix of matrices
          N,            # M - I
          j;

    I := matrices[1]^0;
    size := Length(I);
    E := List( [1..size], x -> [] );
    for M  in matrices  do
        N := M - I;
        for j  in [ 1..size ]  do
            Append( E[ j ], N[ j ] );
        od;
    od;
    return NullspaceMat(E);

end;


###############################################################################
##
#F  NullspaceMat( <mat> ) . . . . . . basis of solutions of <vec> * <mat> = 0
##
NullspaceMat := function ( mat )
    local   nullspace, m, n, min, empty, i, k, row, tmp, zero, one;

    # triangulize the transposed of the matrix
    mat := TransposedMat( Reversed( mat ) );
    TriangulizeMat( mat );
    m := Length(mat);
    n := Length(mat[1]);
    zero := 0*mat[1][1];
    one  := mat[1][1]^0;
    min := Minimum( m, n );

    # insert empty rows to bring the leading term of each row on the diagonal
    empty := 0*mat[1];
    i := 1;
    while i <= Length(mat)  do
        if i < n  and mat[i][i] = zero  then
            for k in Reversed([i..Minimum(Length(mat),n-1)])  do
                mat[k+1] := mat[k];
            od;
            mat[i] := empty;
        fi;
        i := i+1;
    od;
    for i  in [ Length(mat)+1 .. n ]  do
        mat[i] := empty;
    od;

    # 'mat' now  looks  like  [ [1,2,0,2], [0,0,0,0], [0,0,1,3], [0,0,0,0] ],
    # and the solutions can be read in those columns with a 0 on the diagonal
    # by replacing this 0 by a -1, in  this  example  [2,-1,0,0], [2,0,3,-1].
    nullspace := [];
    for k  in Reversed([1..n]) do
        if mat[k][k] = zero  then
            row := [];
            for i  in [1..k-1]  do row[n-i+1] := -mat[i][k];  od;
            row[n-k+1] := one;
            for i  in [k+1..n]  do row[n-i+1] := zero;  od;
            Add( nullspace, row );
        fi;
    od;

    return nullspace;
end;

#############################################################################
##
#F  NullspaceModQ( <E>, <q> ) . . . . . . . . . . . .nullspace of <E> mod <q>
##
##  <E> must be a matrix of integers modulo <q> and <q> a prime power. 
##  Then 'NullspaceModQ' returns the set of all vectors in of integers modulo 
##  <q>, which solve the homogeneous equationsystem given by <E> modulo <q>.
##
NullspaceModQ := function( E, q )

    local  facs,         # factors of <q>
           p,            # prime of facs
           n,            # <q> = p^n
           field,        # field with p elements
           B,            # E over GF(p)
           null,         # basis of nullspace of B
           elem,         # all elements solving E mod p^i-1
           e,            # one elem
           r,            # inhomogenous part mod p^i-1
           newelem,      # all elements solving E mod p^i
           sol,          # solution of E * x = r mod p^i
           j, i; 

    # factorize q
    facs  := Factors( q );
    p     := facs[1];
    n     := Length( facs );
    field := GF(p);

    # solve homogeneous system mod p
    B    := field.one * E;
    null := NullspaceMat( B );
    if null = []  then
        return [];
    fi;

    # set up
    elem    := List( Elements( RowSpace( null, field ) ), IntVecFFE );
    newelem := [ ];

    # run trough powers
    for i  in [ 2..n ]  do
        for e  in elem  do
            r   := field.one * ( - (e * E) / (p ^ ( i - 1 ) ) );
            sol := SolutionMat( B, r );
            if not IsBool( sol )  then
                for j  in [ 1..Length( elem ) ]  do
                    AddSet( newelem, e+(p^(i-1) * IntVecFFE(elem[j] + sol)));
                od;
            fi;
        od;
        if Length( newelem ) = 0  then
            return [];
        fi;
        elem    := Copy( newelem );
        newelem := [ ];
    od;
    return elem;
end;
    
#############################################################################
##
#F  SimultaneousEigenvalues( <matlist>, <expo> ) . . . . . . . . .eigenvalues
##
##  The matgroup generated by <matlist> must be an abelian p-group of 
##  exponent <expo>. The matrices in matlist must be matrices over GF(<q>)
##  for some prime <q>. Then the eigenvalues of <mat> in the splitting field
##  GF(<q>^r) for some r are powers of an element ksi in the splitting field, 
##  which is of order <expo>. 
##  'SimultaneousEigenspaces' returns a matrix of intergers mod <expo>, say
##  (a_{i,j}), such that the power ksi^a_{i,j} is an eigenvalue of the i-th
##  matrix in <matlist> and the eigenspaces of the different matrices to
##  the eigenvalues ksi^a_{i,j} for fixed j are equal.
## 
SimultaneousEigenvalues := function( matlist, expo )

    local   q,       # characteristic of field of matrices
            r,       # such that <q>^r is splitting field 
            field,   # GF(<q>^r)
            ksi,     # <expo>-root of field
            eival,   # exponents of eigenvalues of the matrices
            eispa,   # eigenspaces of the matrices
            eigen,   # exponents of simultaneous eigenvalues
            I,       # identity matrix
            w,       # ksi^w is candidate for a eigenvalue
            null,    # basis of nullspace
            space,   # nullspace
            i, Split; 

    Split := function( space, i )
        local   int,   # intersection of two rowspaces
                base,  # base of int
                j;

        for j  in [1..Length(eival[i])]  do
            if 0 < Length( eispa[i][j].base )  then
                int  := Intersection( space, eispa[i][j] );
                base := Base( int );
                if 0 < Length( base )  then
                    Append( eigen[i], List( base, x -> eival[i][j] ) );
                    if i < Length( matlist )  then
                        Split( int, i+1 );
                    fi;
                fi;
            fi;
        od;
    end;

    # get characteritic
    q := CharFFE( matlist[1][1][1] );
  
    # get splitting field
    r := 1;
    while EuclideanRemainder( q^r - 1, expo ) <> 0  do
        r := r+1;
    od;
    field := GF(q^r);
    ksi   := field.root^((q^r - 1) / expo);

    # set up eigenvalues and spaces and Idmat
    eival  := List( matlist, x -> [] );
    eispa  := List( matlist, x -> [] );
    I      := matlist[1]^0;

    # calculate eigenvalues and spaces for each matrix
    for i in [1..Length(matlist)]  do
        for w in [0..expo-1]  do
            null := NullspaceMat( matlist[i] - (ksi^w * I) );
            if 0 < Length(null)  then
                Add( eival[i], w );
                space      := RowSpace( null, field );
                space.base := null;
                Add( eispa[i], space );
            fi;
        od;
    od;
    
    # now make the eigenvalues simultaneous
    eigen := List( matlist, x -> [] );
    for i  in [1..Length(eival[1])]  do
        Append( eigen[1], List( eispa[1][i].base, x -> eival[1][i] ) );
        if Length( matlist ) > 1  then
            Split( eispa[1][i], 2 );
        fi;
    od;
    
    # return
    return eigen;
end;  

##############################################################################
##
#F  BaseNullspace( <struct> )
##
BaseNullspace := function( struct )
    if   IsMat( struct ) then
      return NullspaceMat( struct );
    elif IsRec( struct ) then
      if not IsBound( struct.baseNullspace ) then
        if not IsBound( struct.operations ) then
          Error( "<struct> must have 'operations' entry" );
        fi;
        struct.baseNullspace:=
            struct.operations.BaseNullspace( struct );
      fi;
      return struct.baseNullspace;
    else
      Error( "<struct> must be a matrix or a record" );
    fi;
    end;


#############################################################################
##
#F  BestQuoInt(<n>,<m>)
##
##  'BestQuoInt' returns the best quotient <q> of the integers  <n> and  <m>.
##  This is the quotient such that '<n>-<q>\*<m>' has minimal absolute value.
##  If there are two quotients whose remainders have the same absolute value,
##  then the quotient with the smaller absolute value is choosen.
##
BestQuoInt := function ( n, m )
    if   0 <= m  and 0 <= n  then
        return QuoInt( n + QuoInt( m - 1, 2 ), m );
    elif 0 <= m  then
        return QuoInt( n - QuoInt( m - 1, 2 ), m );
    elif 0 <= n  then
        return QuoInt( n - QuoInt( m + 1, 2 ), m );
    else
        return QuoInt( n + QuoInt( m + 1, 2 ), m );
    fi;
end;


#############################################################################
##
#F  DiagonalizeIntMatNormDriven(<mat>)  . . . . diagonalize an integer matrix
##
##  'DiagonalizeIntMatNormDriven'  diagonalizes  the  integer  matrix  <mat>.
##
##  It tries to keep the entries small  through careful  selection of pivots.
##
##  First it selects a nonzero entry for which the  product of row and column
##  norm is minimal (this need not be the entry with minimal absolute value).
##  Then it brings this pivot to the upper left corner and makes it positive.
##
##  Next it subtracts multiples of the first row from the other rows, so that
##  the new entries in the first column have absolute value at most  pivot/2.
##  Likewise it subtracts multiples of the 1st column from the other columns.
##
##  If afterwards not  all new entries in the  first column and row are zero,
##  then it selects a  new pivot from those  entries (again driven by product
##  of norms) and reduces the first column and row again.
##
##  If finally all offdiagonal entries in the first column  and row are zero,
##  then it  starts all over again with the submatrix  '<mat>{[2..]}{[2..]}'.
##
##  It is  based  upon  ideas by  George Havas  and code by  Bohdan Majewski.
##  G. Havas and B. Majewski, Integer Matrix Diagonalization, JSC, to appear 
##
DiagonalizeIntMatNormDriven := function ( mat )
    local   nrrows,     # number of rows    (length of <mat>)
            nrcols,     # number of columns (length of <mat>[1])
            rownorms,   # norms of rows
            colnorms,   # norms of columns
            d,          # diagonal position
            pivk, pivl, # position of a pivot
            norm,       # product of row and column norms of the pivot
            clear,      # are the row and column cleared
            row,        # one row
            col,        # one column
            ent,        # one entry of matrix
            quo,        # quotient
            h,          # gap width in shell sort
            k, l,       # loop variables
            max, omax;  # maximal entry and overall maximal entry

    # give some information
    InfoMatrix1("#I  DiagonalizeMat called\n");
    InfoMatrix2("#I    divisors: \c");
    omax := 0;

    # get the number of rows and columns
    nrrows := Length( mat );
    if nrrows <> 0  then
        nrcols := Length( mat[1] );
    else
        nrcols := 0;
    fi;
    rownorms := [];
    colnorms := [];

    # loop over the diagonal positions
    d := 1;
    while d <= nrrows and d <= nrcols  do
        InfoMatrix3("\n#I      d=",d," \c");

        # find the maximal entry
        if InfoMatrix3 <> Ignore  then
            max := 0;
            for k  in [ d .. nrrows ]  do
                for l  in [ d .. nrcols ]  do
                    ent := mat[k][l];
                    if   0 < ent and max <  ent  then
                        max :=  ent;
                    elif ent < 0 and max < -ent  then
                        max := -ent;
                    fi;
                od;
            od;
            InfoMatrix3("max=",max," \c");
            if omax < max  then omax := max;  fi;
        fi;

        # compute the Euclidean norms of the rows and columns
        for k  in [ d .. nrrows ]  do
            row := mat[k];
            rownorms[k] := row * row;
        od;
        for l  in [ d .. nrcols ]  do
            col := mat{[d..nrrows]}[l];
            colnorms[l] := col * col;
        od;
        InfoMatrix3("n\c");

        # push rows containing only zeroes down and forget about them
        for k  in [ nrrows, nrrows-1 .. d ]  do
            if k < nrrows and rownorms[k] = 0  then
                row         := mat[k];
                mat[k]      := mat[nrrows];
                mat[nrrows] := row;
                norm             := rownorms[k];
                rownorms[k]      := rownorms[nrrows];
                rownorms[nrrows] := norm;
            fi;
            if rownorms[nrrows] = 0  then
                nrrows := nrrows - 1;
            fi;
        od;

        # quit if there are no more nonzero entries
        if nrrows < d  then
            #N  1996/04/30 mschoene should 'break'
            InfoMatrix3("\n#I      overall maximal entry ",omax);
            InfoMatrix1("\n#I  DiagonalizeMat returns\n");
            return;
        fi;

        # push columns containing only zeroes right and forget about them
        for l  in [ nrcols, nrcols-1 .. d ]  do
            if l < nrcols and colnorms[l] = 0  then
                col                      := mat{[d..nrrows]}[l];
                mat{[d..nrrows]}[l]      := mat{[d..nrrows]}[nrcols];
                mat{[d..nrrows]}[nrcols] := col;
                norm             := colnorms[l];
                colnorms[l]      := colnorms[nrcols];
                colnorms[nrcols] := norm;
            fi;
            if colnorms[nrcols] = 0  then
                nrcols := nrcols - 1;
            fi;
        od;

        # sort the rows with respect to their norms
        h := 1;  while 9 * h + 4 < nrrows-(d-1)  do h := 3 * h + 1;  od;
        while 0 < h  do
            for l  in [ h+1 .. nrrows-(d-1) ]  do
                norm := rownorms[l+(d-1)];
                row := mat[l+(d-1)];
                k := l;
                while h+1 <= k  and norm < rownorms[k-h+(d-1)]  do
                    rownorms[k+(d-1)] := rownorms[k-h+(d-1)];
                    mat[k+(d-1)] := mat[k-h+(d-1)];
                    k := k - h;
                od;
                rownorms[k+(d-1)] := norm;
                mat[k+(d-1)] := row;
            od;
            h := QuoInt( h, 3 );
        od;

        # choose a pivot in the '<mat>{[<d>..]}{[<d>..]}' submatrix
        # the pivot must be the topmost nonzero entry in its column,
        # now that the rows are sorted with respect to their norm
        pivk := 0;  pivl := 0;
        norm := Maximum(rownorms) * Maximum(colnorms) + 1;
        for l  in [ d .. nrcols ]  do
            k := d;
            while mat[k][l] = 0  do
                k := k + 1;
            od;
            if rownorms[k] * colnorms[l] < norm  then
                pivk := k;  pivl := l;
                norm := rownorms[k] * colnorms[l];
            fi;
        od;
        InfoMatrix3("p\c");

        # move the pivot to the diagonal and make it positive
        if d <> pivk  then
            row       := mat[d];
            mat[d]    := mat[pivk];
            mat[pivk] := row;
        fi;
        if d <> pivl  then
            col                    := mat{[d..nrrows]}[d];
            mat{[d..nrrows]}[d]    := mat{[d..nrrows]}[pivl];
            mat{[d..nrrows]}[pivl] := col;
        fi;
        if mat[d][d] < 0  then
            mat[d] := - mat[d];
        fi;

        # now perform row operations so that the entries in the
        # <d>-th column have absolute value at most pivot/2
        clear := true;
        row := mat[d];
        for k  in [ d+1 .. nrrows ]  do
            quo := BestQuoInt( mat[k][d], mat[d][d] );
            if quo = 1  then
                mat[k] := mat[k] - row;
            elif quo = -1  then
                mat[k] := mat[k] + row;
            elif quo <> 0  then
                mat[k] := mat[k] - quo * row;
            fi;
            clear := clear and mat[k][d] = 0;
        od;
        InfoMatrix3("c\c");

        # now perform column operations so that the entries in
        # the <d>-th row have absolute value at most pivot/2
        col := mat{[d..nrrows]}[d];
        for l  in [ d+1 .. nrcols ]  do
            quo := BestQuoInt( mat[d][l], mat[d][d] );
            if quo = 1  then
                mat{[d..nrrows]}[l] := mat{[d..nrrows]}[l] - col;
            elif quo = -1  then
                mat{[d..nrrows]}[l] := mat{[d..nrrows]}[l] + col;
            elif quo <> 0  then
                mat{[d..nrrows]}[l] := mat{[d..nrrows]}[l] - quo * col;
            fi;
            clear := clear and mat[d][l] = 0;
        od;
        InfoMatrix3("r \c");

        # repeat until the <d>-th row and column are totally cleared
        while not clear  do

            # compute the Euclidean norms of the rows and columns
            # that have a nonzero entry in the <d>-th column resp. row
            for k  in [ d .. nrrows ]  do
                if mat[k][d] <> 0  then
                    row := mat[k];
                    rownorms[k] := row * row;
                fi;
            od;
            for l  in [ d .. nrcols ]  do
                if mat[d][l] <> 0  then
                    col := mat{[d..nrrows]}[l];
                    colnorms[l] := col * col;
                fi;
            od;
            InfoMatrix3("n\c");

            # choose a pivot in the <d>-th row or <d>-th column
            pivk := 0;  pivl := 0;
            norm := Maximum(rownorms) * Maximum(colnorms) + 1;
            for l  in [ d+1 .. nrcols ]  do
                if 0 <> mat[d][l] and rownorms[d] * colnorms[l] < norm  then
                    pivk := d;  pivl := l;
                    norm := rownorms[d] * colnorms[l];
                fi;
            od;
            for k  in [ d+1 .. nrrows ]  do
                if 0 <> mat[k][d] and rownorms[k] * colnorms[d] < norm  then
                    pivk := k;  pivl := d;
                    norm := rownorms[k] * colnorms[d];
                fi;
            od;
            InfoMatrix3("p\c");

            # move the pivot to the diagonal and make it positive
            if d <> pivk  then
                row       := mat[d];
                mat[d]    := mat[pivk];
                mat[pivk] := row;
            fi;
            if d <> pivl  then
                col                    := mat{[d..nrrows]}[d];
                mat{[d..nrrows]}[d]    := mat{[d..nrrows]}[pivl];
                mat{[d..nrrows]}[pivl] := col;
            fi;
            if mat[d][d] < 0  then
                mat[d] := - mat[d];
            fi;

            # now perform row operations so that the entries in the
            # <d>-th column have absolute value at most pivot/2
            clear := true;
            row := mat[d];
            for k  in [ d+1 .. nrrows ]  do
                quo := BestQuoInt( mat[k][d], mat[d][d] );
                if quo = 1  then
                    mat[k] := mat[k] - row;
                elif quo = -1  then
                    mat[k] := mat[k] + row;
                elif quo <> 0  then
                    mat[k] := mat[k] - quo * row;
                fi;
                clear := clear and mat[k][d] = 0;
            od;
            InfoMatrix3("c\c");

            # now perform column operations so that the entries in
            # the <d>-th row have absolute value at most pivot/2
            col := mat{[d..nrrows]}[d];
            for l  in [ d+1.. nrcols ]  do
                quo := BestQuoInt( mat[d][l], mat[d][d] );
                if quo = 1  then
                    mat{[d..nrrows]}[l] := mat{[d..nrrows]}[l] - col;
                elif quo = -1  then
                    mat{[d..nrrows]}[l] := mat{[d..nrrows]}[l] + col;
                elif quo <> 0  then
                    mat{[d..nrrows]}[l] := mat{[d..nrrows]}[l] - quo * col;
                fi;
                clear := clear and mat[d][l] = 0;
            od;
            InfoMatrix3("r \c");

        od;

        # print the diagonal entry (for information only)
        InfoMatrix3("div=");
        InfoMatrix2(mat[d][d]," \c");

        # go on to the next diagonal position
        d := d + 1;

    od;

    # close with some more information
    InfoMatrix3("\n#I      overall maximal entry ",omax);
    InfoMatrix1("\n#I  DiagonalizeMat returns\n");
end;

DiagonalizeIntMat := DiagonalizeIntMatNormDriven;


#############################################################################
##
#F  DiagonalizeMat(<mat>) . . . . . . . . . . convert matrix to diagonal form
##
##  'DiagonalizeMat'  converts   the   matrix  <mat>   to diagonal  form  via
##  elementary  row and  column operations.   Note that  the diagonal form is
##  generally not unique (see "SmithNormalizeMat").
##
#N  1996/05/06 M.Schoenert should be extended for other rings
##
DiagonalizeMat := DiagonalizeIntMat;


#############################################################################
##
#F  DiagonalFormMat(<mat>)  . . . . . . . . . . .  equivalent diagonal matrix
##
##  'DiagonalFormMat' returns a diagonal  matrix <diag> that is equivalent to
##  the matrix  <mat>.  Note that the  diagonal form  is generally not unique
##  (see "SmithNormalFormMat").
##
DiagonalFormMat := function ( mat )
    local   copy;
    copy := List( mat, ShallowCopy );
    DiagonalizeMat( copy );
    return copy;
end;


#############################################################################
##
#F  SmithNormalizeMat(<mat>)  . . . . . . convert matrix to Smith normal form
##
##  'SmithNormalizeMat' converts the  matrix <mat> to  Smith normal form  via
##  elementary row   and column  operations.   The Smith  normal form  is the
##  unique diagonal matrix where each diagonal entry divides the next one.
##
SmithNormalizeMat := function ( mat )
    local   zero, gcd, i, k, l;
    DiagonalizeMat( mat );
    l := Length(mat);
    if 0 < l and Length(mat[1]) < l then l := Length(mat[1]); fi;
    if 0 < l then zero := mat[1][1] - mat[1][1]; fi;
    for i  in [1..l-1]  do
        for k  in [i+1..l] do
            if mat[i][i] = zero and mat[k][k] <> zero  then
                mat[i][i] := mat[k][k];
                mat[k][k] := zero;
            elif mat[i][i] <> zero
              and EuclideanRemainder( mat[k][k], mat[i][i] ) <> zero  then
                gcd     := Gcd( mat[i][i], mat[k][k] );
                mat[k][k] := mat[k][k] / gcd * mat[i][i];
                mat[i][i] := gcd;
            fi;
        od;
        mat[i][i] := StandardAssociate( mat[i][i] );
    od;
end;


#############################################################################
##
#F  SmithNormalFormMat(<mat>) . . . . . . equivalent Smith normal form matrix
##
##  'SmithNormalFormMat'  returns the Smith norm  form  matrix <new> that  is
##  equivalent to the  matrix  <mat>.  The   Smith  norm form is   the unique
##  diagonal matrix where each diagonal entry divides the next one.
##
SmithNormalFormMat := function ( mat )
    local   copy;
    copy := List( mat, ShallowCopy );
    SmithNormalizeMat( copy );
    return copy;
end;


#############################################################################
##
#F  ElementaryDivisorsMat(<mat>)  . . . . . . elementary divisors of a matrix
##
##  'ElementaryDivisors' returns  a  list of  the elementary  divisors of the
##  matrix <mat>.   The elementary  divisors    are the unique   <divs>  with
##  '<divs>[<i>]' divides  '<divs>[<i>+1]'  and   <mat> is equivalent   to  a
##  diagonal matrix with the elements '<divs>[<i>]'  on the diagonal.  <divs>
##  has the  same length as  the rows of <mat>,  it is padded  with zeroes if
##  <mat> has fewer rows than columns.
##
ElementaryDivisorsMat := function ( mat )
    return DiagonalOfMat( SmithNormalFormMat( mat ) );
end;


#############################################################################
##
#F  ElementaryDivisorsOfList(<list>)  . . . . . elementary divisors of a list
##
ElementaryDivisorsOfList := function ( list )
    local   divs, zero, gcd, i, k, l;
    divs := ShallowCopy( list );
    l := Length(divs);
    if 0 < l then zero := divs[1] - divs[1]; fi;
    for i  in [1..l-1]  do
        for k  in [i+1..l]  do
            if divs[i] = zero and divs[k] <> zero  then
                divs[i] := divs[k];
                divs[k] := zero;
            elif divs[i] <> zero
              and EuclideanRemainder( divs[k], divs[i] ) <> zero  then
                gcd     := Gcd( divs[i], divs[k] );
                divs[k] := divs[k] / gcd * divs[i];
                divs[i] := gcd;
            fi;
        od;
        divs[i] := StandardAssociate( divs[i] );
    od;
    return divs;
end;


#############################################################################
##
#F  AbelianInvariantsOfList(<list>) . . . . . .  abelian invariants of a list
##
AbelianInvariantsOfList := function ( list )
    local   invs, elm;
    invs := [];
    for elm in list do
        if elm = 0 then
            Add( invs, 0 );
        elif 1 < elm then
            Append( invs, List( Collected(Factors( elm)), x->x[1]^x[2] ) );
        elif elm < -1 then
            Append( invs, List( Collected(Factors(-elm)), x->x[1]^x[2] ) );
        fi;
    od;
    Sort( invs );
    return invs;
end;


#############################################################################
##
#F  SolutionMat(<mat>,<vec>)  . . . . . . . . . . .  one solution of equation
##
##  One solution <x> of <x> * <mat> = <vec> or 'false'.
##
SolutionMat := function ( mat, vec )
    local   h, v, tmp, i, l, r, s, c, zero;

    # Transpose <mat> and solve <mat> * x = <vec>.
    mat  := TransposedMat( mat );
    vec  := Copy( vec );
    l    := Length( mat );
    r    := 0;
    zero := 0*mat[1][1];
    InfoMatrix1("#I  SolutionMat called\n");
    InfoMatrix2("#I    nonzero columns \c");

    # Run through all columns of the matrix.
    c := 1;
    while c <= Length( mat[ 1 ] ) and r < l  do

        # Find a nonzero entry in this column.
        s := r + 1;
        while s <= l and mat[ s ][ c ] = zero  do s := s + 1;  od;

        # If there is a nonzero entry,
        if s <= l  then

            # increment the rank.
            InfoMatrix2(c," \c");
            r := r + 1;

            # Make its row the current row and normalize it.
            tmp := mat[ s ][ c ] ^ -1;
            v := mat[ s ];  mat[ s ] := mat[ r ];  mat[ r ] := tmp * v;
            v := vec[ s ];  vec[ s ] := vec[ r ];  vec[ r ] := tmp * v;

            # Clear all entries in this column.
            for s  in [ 1 .. Length( mat ) ]  do
                if s <> r and mat[ s ][ c ] <> zero  then
                    tmp := mat[ s ][ c ];
                    mat[ s ] := mat[ s ] - tmp * mat[ r ];
                    vec[ s ] := vec[ s ] - tmp * vec[ r ];
                fi;
            od;
        fi;
        c := c + 1;
    od;

    # Find a solution.
    for i  in [ r + 1 .. l ]  do
        if vec[ i ] <> zero  then return false;  fi;
    od;
    h := [];
    s := Length( mat[ 1 ] );
    v := 0 * mat[ 1 ][ 1 ];
    r := 1;
    c := 1;
    while c <= s and r <= l  do
        while c <= s and mat[ r ][ c ] = zero  do
            c := c + 1;
            Add( h, v );
        od;
        if c <= s  then
            Add( h, vec[ r ] );
            r := r + 1;
            c := c + 1;
        fi;
    od;
    while c <= s  do Add( h, v );  c := c + 1;  od;

    InfoMatrix2("\n");
    InfoMatrix1("#I  SolutionMat returns\n");
    return h;
end;


#############################################################################
##
#R  Read  . . . . . . . . . . . . .  read other function from the other files
##
ReadLib( "matgrp" );
ReadLib( "matring" );


#############################################################################
##
#V  FieldMatricesOps
#V  FieldMatrices . . . . . . . . . . . . . . . .  matrices over finite field
##
FieldMatricesOps    := OperationsRecord( "FieldMatricesOps", MatricesOps );
FieldMatrices       := Copy( Matrices );
FieldMatrices.name  := "FieldMatrices";
FieldMatrices.operations := FieldMatricesOps;


#############################################################################
##
#F  MinimalPolynomial( <D>, <A> ) . . . . . . . . . . . .  minimal polynomial
##
MinimalPolynomial := function( arg )
    local   D,  A;

    # get the domain <D> of <A>
    if Length(arg) = 2  then
    	D := arg[1];
    	A := arg[2];
    else
    	A := arg[1];
    	D := Domain([A]);
    fi;

    # return the minimal polynomial
    return D.operations.MinimalPolynomial(D, A);

end;


#############################################################################
##
#F  FieldMatricesOps.MinimalPolynomial( <D>, <A> )  . . min polynomial of <A>
##
FieldMatricesOps.MinimalPolynomial := function( D, A )
    local   I,  F,  L,  d,  p,  P,  M,  N,  one,  R,  h,  v,  w,  i,  j,  W;

    # try to find the field of <A>
    if not IsBound(D.baseRing)  then
	F := Field( Flat(A) );
    else
	F := D.baseRing;
    fi;

    # set up the other variables
    W := [];
    d := Length( A );
    P := [ Polynomial( F, [ F.one ] ) ];
    N := F.zero * A[1];
    M := ShallowCopy( N );
    Add( M, N[1] );

    # span the whole vector space
    for i  in [ 1 .. d ]  do

	# did we already see the <i>.th base vector
        if not IsBound( W[i] )  then

    	    # clear right and left sides <R>
    	    L := [];
    	    R := [];

    	    # start with the standard base vector
    	    v := ShallowCopy( N );
    	    v[i] := F.one;

    	    # <j>-1 gives the power of <A> we are looking at
    	    j := 1;

    	    # spin vector around and construct polynomial
    	    repeat

    	    	# compute the head of <v>
    	    	h := 1;
    	    	while h <= d and v[h] = F.zero  do
    	    	    h := h + 1;
    	    	od;

  	    	# start with appropriate polynomial x^(<j>-1)
    	        p := ShallowCopy( M );
    	    	p[j] := F.one;

    	    	# divide by known left sides
    	    	w := v;
    	    	while h <= d and IsBound( L[h] )  do
  	    	    p := p - w[h] * R[h];
    	    	    w := w - w[h] * L[h];
    	    	    while h <= d and w[h] = F.zero  do
    	    	    	h := h + 1;
    	    	    od;
    	    	od;

    	    	# if <v> is not the zero vector try next power
    	    	if h <= d  then
    	    	    R[h] := p * w[h]^-1;
    	    	    L[h] := w * w[h]^-1;
    	    	    W[h] := true;
    	    	    j := j + 1;
    	    	    v := v * A;

    	    	# otherwise, we know our polynomial
    	    	else
    	    	    Add( P, Polynomial( F, p ) );
    	    	fi;
    	    until h > d;
    	fi;
    od;

    # compute LCM of all polynomials
    return Lcm( P );

end;


#############################################################################
##
#F  CharacteristicPolynomial( <D>, <A> )  . . . . . characteristic polynomial
##
CharacteristicPolynomial := function( arg )
    local   D,  A;

    # get the domain <D> of <A>
    if Length(arg) = 2  then
    	D := arg[1];
    	A := arg[2];
    else
    	A := arg[1];
    	D := Domain([A]);
    fi;

    # return the characteristic polynomial
    return D.operations.CharacteristicPolynomial(D, A);

end;


#############################################################################
##
#F  FieldMatricesOps.CharacteristicPolynomial( <D>, <A> ) . . char pol of <A>
##
FieldMatricesOps.CharacteristicPolynomial := function( D, A )
    local   F,  L,  d,  p,  P,  M,  N,  one,  R,  h,  v,  w,  i,  j;

    # try to find the field of <A>
    if not IsBound(D.baseRing)  then
	F := Field( Flat(A) );
    else
	F := D.baseRing;
    fi;

    # set up the other variables
    L := [];
    d := Length( A );
    P := [ Polynomial( F, [ F.one ] ) ];
    N := F.zero * A[1];
    M := ShallowCopy( N );
    Add( M, N[1] );

    # span the whole vector space
    for i  in [ 1 .. d ]  do

	# did we already see the <i>.th base vector
        if not IsBound( L[i] )  then

    	    # clear right sides <R>
    	    R := [];

    	    # start with the standard base vector
    	    v := ShallowCopy( N );
    	    v[i] := F.one;

    	    # <j>-1 gives the power of <A> we are looking at
    	    j := 1;

    	    # spin vector around and construct polynomial
    	    repeat

    	    	# compute the head of <v>
    	    	h := 1;
    	    	while h <= d and v[h] = F.zero  do
    	    	    h := h + 1;
    	    	od;

  	    	# start with appropriate polynomial x^(<j>-1)
    	        p := ShallowCopy( M );
    	    	p[j] := F.one;

    	    	# divide by known left sides
    	    	w := v;
    	    	while h <= d and IsBound( L[h] )  do
    	    	    if IsBound( R[h] )  then
    	    	    	p := p - w[h] * R[h];
    	    	    fi;
    	    	    w := w - w[h] * L[h];
    	    	    while h <= d and w[h] = F.zero  do
    	    	    	h := h + 1;
    	    	    od;
    	    	od;

    	    	# if <v> is not the zero vector try next power
    	    	if h <= d  then
    	    	    R[h] := p * w[h]^-1;
    	    	    L[h] := w * w[h]^-1;
    	    	    j := j + 1;
    	    	    v := v * A;

    	    	# otherwise, we know our polynomial
    	    	else
    	    	    Add( P, Polynomial( F, p ) );
    	    	fi;
    	    until h > d;
    	fi;
    od;

    # compute the product of all polynomials
    return Product( P );

end;


#############################################################################
##
#V  FiniteFieldMatricesOps
#V  FiniteFieldMatrices	. . . . . . . . . . . . . . . . finite field matrices
##
FiniteFieldMatricesOps    := OperationsRecord( "FiniteFieldMatricesOps",
                              FieldMatricesOps );
FiniteFieldMatrices       := Copy( FieldMatrices );
FiniteFieldMatrices.name  := "FiniteFieldMatrices";
FiniteFieldMatrices.operations := FiniteFieldMatricesOps;


#############################################################################
##
#F  FiniteFieldMatricesOps.ProjectiveOrder( <R>, <A> )  . . order mod scalars
##
##  Return an integer n and a finite field element e such that <A>^n = eI.
##
FiniteFieldMatricesOps.ProjectiveOrder := function( R, A )
    local   p,  R;

    # construct the minimal polynomial of <A>
    p := R.operations.MinimalPolynomial( R, A );

    # check if <A> is invertible
    if p.coefficients[1] = 0 * p.coefficients[1]  then
	Error( "<A> must be invertible" );
    fi;

    # compute the order of <p>
    R := DefaultRing( p );
    return R.operations.OrderScalar( R, p );

end;


#############################################################################
##
#F  FiniteFieldMatricesOps.Order( <R>, <A> )  . . . . . . . . .  order of <A>
##
FiniteFieldMatricesOps.Order := function( R, A )
    local   o;

    o := R.operations.ProjectiveOrder( R, A );
    return o[1] * OrderFFE(o[2]);

end;


#############################################################################
##
#F  FiniteFieldMatricesOps.MinimalPolynomial( <D>, <A> )  . .  min polynomial
##
FiniteFieldMatricesOps.MinimalPolynomial := function( D, A )
    local   I,  F,  L,  d,  p,  P,  M,  N,  one,  R,  h,  v,  w,  i,  W;

    # try to find the field of <A>
    if not IsBound(D.baseRing)  then
	F := Field( List( A, x -> Field(x).root ) );
    else
	F := D.baseRing;
    fi;

    # set up the other variables
    W := [];
    d := Length(A);
    P := [ Polynomial(F, [F.one]) ];
    N := F.zero * A[1];
    IsVector(N);

    # span the whole vector space
    for i  in [ 1 .. d ]  do

	# did we already see the <i>.th base vector
        if not IsBound(W[i])  then

    	    # clear right and left sides <R>
    	    L := [];
    	    R := [];

    	    # start with the standard base vector
    	    v := ShallowCopy(N);
    	    v[i] := F.one;

    	    # <j>-1 gives the power of <A> we are looking at
            M := [];

    	    # spin vector around and construct polynomial
    	    repeat

    	    	# compute the head of <v>
    	    	h := DepthVector(v);

  	    	# start with appropriate polynomial x^(<j>-1)
                p := Copy(M);
                Add(p, F.one);
                Add(M, F.zero);

    	    	# divide by known left sides
    	    	w := Copy(v);
    	    	while h <= Length(w) and IsBound(L[h])  do
	            AddCoeffs(p, R[h], -w[h]);
                    AddCoeffs(w, L[h], -w[h]);
    	    	    h := DepthVector(w);
    	    	od;

    	    	# if <v> is not the zero vector try next power
    	    	if h <= Length(w)  then
    	    	    R[h] := p * w[h]^-1;
    	    	    L[h] := w * w[h]^-1;

		    # enter vectors seen in <W>
    	    	    while h <= Length(w) and IsBound(W[h])  do
		    	AddCoeffs(w, W[h], -w[h]);
		       	h := DepthVector(w);
    	    	    od;
                    if h <= Length(w) then 
                       	W[h] := w * w[h]^-1;
                    fi;

		    # next power of <A>
    	    	    v := v * A;
		    h := 1;

    	    	# otherwise, we know our polynomial
    	    	else
    	    	    Add(P, Polynomial(F, p));
		    h := 0;
    	    	fi;
    	    until h = 0;
    	fi;
    od;

    # compute LCM of all polynomials
    return Lcm(P);

end;


#############################################################################
##
#F  FiniteFieldMatricesOps.CharacteristicPolynomial( <D>, <A> ) . .  char pol
##
FiniteFieldMatricesOps.CharacteristicPolynomial := function( D, A )
    local   F,  L,  d,  p,  P,  M,  N,  one,  R,  h,  v,  w,  i;

    # try to find the field of <A>
    if not IsBound(D.baseRing)  then
	F := Field( List( A, x -> Field(x).root ) );
    else
	F := D.baseRing;
    fi;

    # set up the other variables
    L := [];
    d := Length(A);
    P := [ Polynomial( F, [F.one] ) ];
    N := F.zero * A[1];
    IsVector(N);

    # span the whole vector space
    for i  in [ 1 .. d ]  do

	# did we already see the <i>.th base vector
        if not IsBound(L[i])  then

    	    # clear right sides <R>
    	    R := [];

    	    # start with the standard base vector
    	    v := ShallowCopy(N);
    	    v[i] := F.one;

    	    # <j>-1 gives the power of <A> we are looking at
    	    M := [];

    	    # spin vector around and construct polynomial
    	    repeat

    	    	# compute the head of <v>
    	    	h := DepthVector(v);

  	    	# start with appropriate polynomial x^(<j>-1)
    	        p := Copy(M);
                Add(p, F.one);
                Add(M, F.zero);

    	    	# divide by known left sides
    	    	w := Copy(v);
    	    	while h <= Length(w) and IsBound(L[h])  do
    	    	    if IsBound(R[h])  then
	                AddCoeffs(p, R[h], -w[h]);
    	    	    fi;
                    AddCoeffs(w, L[h], -w[h]);
    	    	    h := DepthVector(w);
    	    	od;

    	    	# if <v> is not the zero vector try next power
    	    	if h <= Length(w)  then
    	    	    R[h] := p * w[h]^-1;
    	    	    L[h] := w * w[h]^-1;
    	    	    v := v * A;

    	    	# otherwise, we know our polynomial
    	    	else
    	    	    Add(P, Polynomial(F, p));
    	    	fi;
    	    until h > Length(w);
    	fi;
    od;

    # compute the product of all polynomials
    return Product(P);

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
