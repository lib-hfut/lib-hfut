#############################################################################
##
#A  ctcharac.g                  GAP library                     Thomas Breuer
#A                                                              & Ansgar Kaup
##
#A  @(#)$Id: ctcharac.g,v 3.52.1.4 1996/11/06 15:02:12 sam Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains those functions which mainly deal with characters.
##
#H  $Log: ctcharac.g,v $
#H  Revision 3.52.1.4  1996/11/06 15:02:12  sam
#H  fixed 'PrimeBlocks' for three arguments
#H
#H  Revision 3.52.1.3  1996/06/19 14:58:39  sam
#H  'List' does no longer accept lists with holes.
#H
#H  Revision 3.52.1.2  1995/06/28  07:03:38  sam
#H  fixed 'IntegralizedMat', 'Decomposition'
#H
#H  Revision 3.52.1.1  1995/02/16  13:54:06  sam
#H  added 'DecompositionMatrix', 'LaTeXStringDecompositionMatrix'
#H
#H  Revision 3.52  1994/05/19  13:34:58  sam
#H  moved 'Eigenvalues' to 'chartabl.g', changed some functions
#H
#H  Revision 3.51  1994/03/14  12:16:09  sam
#H  added 'MolienSeries' functions
#H
#H  Revision 3.50  1994/02/01  17:22:08  sam
#H  added some functions for characters
#H
#H  Revision 3.49  1994/02/01  17:00:32  sam
#H  fixed 'DecompositionInt'
#H
#H  Revision 3.48  1993/12/13  12:16:13  sam
#H  fixed 'DecompositionInt'
#H
#H  Revision 3.47  1993/10/19  17:07:36  sam
#H  fixed possible absence of 'powermap' component
#H
#H  Revision 3.46  1993/09/22  08:59:21  sam
#H  replaced calls of 'Sublist' by '{}'
#H
#H  Revision 3.45  1993/07/29  12:14:16  sam
#H  improved '(Anti)SymmetricParts', 'Symmetrizations'
#H
#H  Revision 3.44  1993/07/26  07:42:10  sam
#H  improved 'Reduced'
#H
#H  Revision 3.43  1993/06/22  06:47:30  sam
#H  improved dispatcher 'ScalarProduct'
#H
#H  Revision 3.42  1993/03/17  16:50:26  sam
#H  'Symmetrisations' now tries to determine missing power maps
#H
#H  Revision 3.41  1993/02/19  17:42:51  fceller
#H  changed 'Print' to 'InfoCharTable2'
#H
#H  Revision 3.40  1993/02/09  08:57:33  sam
#H  'CharTableOps' now contains the code of 'ScalarProduct'
#H
#H  Revision 3.39  1992/10/30  11:16:41  sam
#H  fixed little bug in 'Decomposition', 'IntegralizedMat'
#H
#H  Revision 3.38  1992/10/19  15:57:14  sam
#H  little change in 'Symmetrisations'
#H
#H  Revision 3.37  1992/10/12  13:30:25  sam
#H  fixed bug in 'Decomposition'
#H
#H  Revision 3.36  1992/06/24  16:31:00  goetz
#H  replaced 'CentralizerSym' in '(Anti)SymmetricParts'.
#H
#H  Revision 3.35  1992/06/04  08:01:09  sam
#H  'LLL' is now contained in file 'ctlattic.g'
#H
#H  Revision 3.34  1992/05/26  16:52:01  sam
#H  changed 'Decomposition' (added subroutines)
#H
#H  Revision 3.33  1992/04/03  17:45:36  martin
#H  changed the author line
#H
#H  Revision 3.32  1992/03/26  13:35:09  sam
#H  changed arguments of 'Reduced'
#H
#H  Revision 3.31  1992/03/13  11:14:39  sam
#H  fixed minor bug in 'IrreducibleDifferences'
#H
#H  Revision 3.30  1992/02/14  13:23:05  sam
#H  added 'Eigenvalues'
#H
#H  Revision 3.29  1992/02/05  16:09:11  sam
#H  added some comments in header of 'DecompositionInt'
#H
#H  Revision 3.28  1992/01/28  14:12:54  sam
#H  rearranged 'DecompositionInt': inversion mod p is now the function
#H  'InverseMatMod', and the local function 'vmod' was removed
#H
#H  Revision 3.27  1992/01/24  07:45:09  sam
#H  stylistic changes in 'LLL'
#H
#H  Revision 3.26  1992/01/23  11:36:09  sam
#H  changed usage of 'MatScalarProducts'
#H
#H  Revision 3.25  1992/01/23  10:32:53  sam
#H  changed 'MurnaghanComponents' as follows:
#H  now symplectic and orthogonal symmetrisations are computed by
#H  'RefinedSymmetrisations', called by 'OrthogonalComponents' or
#H  'SymplecticComponents', respectively
#H
#H  Revision 3.24  1992/01/17  09:21:56  sam
#H  changed 'MurnaghanComponents'
#H
#H  Revision 3.23  1992/01/16  16:20:44  sam
#H  changed usage of 'Tensored' and 'Symmetrizations'
#H  (now does not return sets in general)
#H
#H  Revision 3.22  1991/12/20  08:24:37  sam
#H  changed 'classtext' to 'classparam'
#H
#H  Revision 3.21  1991/12/13  13:12:52  sam
#H  replaced 'IsPrime' by 'IsPrimeInt'
#H
#H  Revision 3.20  1991/12/04  13:21:28  sam
#H  one more indent ...
#H
#H  Revision 3.19  1991/12/04  08:27:54  sam
#H  replaced 'CharTableSymmetric' by 'CharTable( "Symmetric", )'
#H
#H  Revision 3.18  1991/12/03  11:21:34  sam
#H  indented functions,
#H  changed 'Decomposition' (now <A> need not be quadratic)
#H  and 'PrimeBlocks' (now <chars> need not be a set)
#H
#H  Revision 3.17  1991/11/27  10:12:24  sam
#H  changes in 'PrimeBlocks': now returns record
#H
#H  Revision 3.16  1991/11/14  09:18:31  sam
#H  and another one (CoeffsCyc in PrimeBlocks)
#H
#H  Revision 3.15  1991/11/14  08:59:47  sam
#H  one more correction ...
#H
#H  Revision 3.14  1991/11/13  16:48:23  sam
#H  little correction (sorry)
#H
#H  Revision 3.13  1991/11/13  14:58:34  sam
#H  removed 'BlownUpCyc' (now 'CoeffsCyc' in 'cyclotom.g'),
#H  renamed and changed 'Decompose',
#H  changed 'Decomposition' (now works with number fields)
#H
#H  Revision 3.12  1991/11/06  17:06:39  sam
#H  now 'ShallowCopy' of 'powermap' in '(Anti)SymmetricParts'
#H
#H  Revision 3.11  1991/10/07  15:50:24  sam
#H  changed return of 'ScalarProduct' (now never returns unknowns)
#H
#H  Revision 3.10  1991/10/07  15:38:11  casper
#H  changed 'ScalarProduct' to '<tbl>.operations.ScalarProduct'
#H
#H  Revision 3.9  1991/10/07  11:03:29  casper
#H  changed use of 'sign' and 'abs' in 'LLL'
#H
#H  Revision 3.8  1991/10/02  13:51:08  sam
#H  corrections
#H
#H  Revision 3.7  1991/10/01  16:31:14  sam
#H  some corrections
#H
#H  Revision 3.6  1991/10/01  14:25:12  casper
#H  changed 'Gcd' to 'GcdInt'
#H
#H  Revision 3.5  1991/10/01  09:24:36  sam
#H  changed 'VERBOSE' to 'InfoCharTable2'
#H
#H  Revision 3.4  1991/09/27  16:32:41  sam
#H  'Print' in 'Reduced' changed, every found irreducible will be
#H  mentioned only once
#H
#H  Revision 3.3  1991/09/05  15:34:18  sam
#H  changed 'Transposed' to 'TransposedMat', 'NextPrime' to 'NextPrimeInt',
#H  'Log' to 'LogInt'
#H
#H  Revision 3.2  1991/09/05  11:12:46  sam
#H  changed 'RankMatrix' to 'RankMat', 'SortCharacters' to
#H  'SortCharactersCharTable',
#H  defined local variable 'k' in 'Decompose'
#H
#H  Revision 3.1  1991/09/03  15:01:57  goetz
#H  changed 'reps' to 'orders'.
#H
#H  Revision 3.0  1991/09/03  13:52:01  goetz
#H  Initial Revision.
#H
##


#############################################################################
##
#F  InfoCharTable?( ... ) . . . info function for the character table package
##
    if not IsBound( InfoCharTable1 )  then InfoCharTable1 := Ignore;  fi;
    if not IsBound( InfoCharTable2 )  then InfoCharTable2 := Ignore;  fi;

#############################################################################
##
#F  KernelChar( <char> ) . . . . . . .  the set of classes forming the kernel
##
KernelChar := function( char )
    local i, kernel;
    kernel:= [];
    for i in [ 1 .. Length( char ) ] do
      if char[i] = char[1] then Add( kernel, i ); fi;
    od;
    return kernel;
    end;

##############################################################################
##
#F  DeterminantChar( <tbl>, <chi> )
##
##  returns the determinant character of the character <chi> of the table
##  <tbl>.  This is defined to be the character obtained on taking the
##  determinant of representing matrices of a representation affording <chi>.
##
##  The determinant is computed as follows.
##  Diagonalize the matrix; the determinant is the product of the diagonal
##  entries, which can be computed by 'Eigenvalues'.
##
DeterminantChar := function( tbl, chi )

    local det,      # result list
          ev,       # eigenvalues
          ord,      # one element order
          exp,      # exponent of a root of unity
          i,        # loop over classes
          j;        # loop over different eigenvalues

    if chi[1] = 1 then

      det:= Copy( chi );

    else

      det:= [];

      for i in [ 1 .. Length( chi ) ] do
  
        ev:= Eigenvalues( tbl, chi, i );
        ord:= tbl.orders[i];
  
        # The determinant is 'E(ord)' to the 'exp'-th power,
        # where $'exp' = \sum_{j=1}^{ord} j 'ev'[j]$.
        # (Note that the $j$-th entry in 'ev' is the multiplicity of
        # 'E(ord)^j' as eigenvalue.)
        exp:= 0;
        for j in [ 1 .. ord ] do exp:= exp + j * ev[j]; od;
  
        det[i]:= E(ord)^exp;
  
      od;

    fi;

    return det;

    end;
    
##############################################################################
##
#F  CentreChar( <char> )
##
CentreChar := function( char )
    return Filtered( [ 1 .. Length( char ) ],
                     i -> char[i] = char[1] or
                          char[i] = - char[1] or
                          IsCyc( char[i] ) and ForAny( COEFFSCYC( char[i] ),
                                              x -> AbsInt( x ) = char[1] ) );
    end;

##############################################################################
##
#F  CentralChar( <tbl>, <char> )
##
CentralChar := function( tbl, char )
    return List( [ 1 .. Length( char ) ],
                 x -> tbl.classes[x] * char[x] / char[1] );
    end;

#############################################################################
##
#F  ScalarProduct( [ <D>, ] <x1>, <x2> ) . . . scalar product [in domain <D>]
##
#T move to another file ?
##
ScalarProduct := function( arg )

    if   Length( arg ) = 3 then
      return arg[1].operations.ScalarProduct( arg[1], arg[2], arg[3] );
    elif Length( arg ) = 2 then
      if IsList( arg[1] ) and IsList( arg[2] ) then
        return arg[1] * arg[2];
      else
        return arg[1].operations.ScalarProduct( "dummy", arg[1], arg[2] );
      fi;
    else
      Error( "usage: ScalarProduct( [ <D>, ] <x1>, <x2> )" );
    fi;
    end;


#############################################################################
##
#F  MatScalarProducts( <tbl>, <characters1>, <characters2> )
#F  MatScalarProducts( <tbl>, <characters> )
##
##  The first form returns the matrix of scalar products:
##
##  $'MatScalarProducts( <tbl>, <characters1>, <characters2> )[i][j]' =
##  'ScalarProduct( <tbl>, <characters1>[j], <characters2>[i] )'$,
##
##  the second form returns a lower triangular matrix of scalar products:
##
##  $'MatScalarProducts( <tbl>, <characters> )[i][j]' =
##  'ScalarProduct( <tbl>, <characters>[j], <characters>[i] )'$ for
##  $ j \leq i $.
##  
MatScalarProducts := function( arg )
    local i, j, tbl, chars, chars2, chi, nccl, weight, scprmatrix, order,
          scpr;

    if not ( Length( arg ) in [ 2, 3 ] and IsCharTable( arg[1] )
             and IsList( arg[2] )
             and ( Length( arg ) = 2 or IsList( arg[3] ) ) ) then
      Error( "usage: MatScalarProducts( <tbl>, <chars1>, <chars2> )\n",
             " resp. MatScalarProducts( <tbl>, <chars> )" );
    fi;

    tbl:= arg[1];
    chars:= arg[2];
    if Length( chars ) = 0 then return []; fi;
    nccl:= Length( chars[1] );
    weight:= tbl.classes;
    order:= tbl.order;
    scprmatrix:= [];
    if Length( arg ) = 3 then
      chars2:= arg[3];
      for i in [ 1 .. Length( chars2 ) ] do
        scprmatrix[i]:= [];
        chi:= List( chars2[i], x -> GaloisCyc(x,-1) );
        for j in [ 1 .. nccl ] do
          chi[j]:= chi[j] * weight[j];
        od;
        for j in chars do
          scpr:= ( chi * j ) / order;
          Add( scprmatrix[i], scpr );
          if not IsInt( scpr ) then
            if IsRat( scpr ) then
              InfoCharTable2( "#E MatScalarProducts: sum not divisible",
                              " by group order\n" );
            elif IsCyc( scpr ) then
              InfoCharTable2( "#E MatScalarProducts: summation not",
                              " integer valued\n");
            fi;
          fi;
        od;
      od;
    else
      for i in [ 1 .. Length( chars ) ] do
        scprmatrix[i]:= [];
        chi:= List( chars[i], x -> GaloisCyc( x, -1 ) );
        for j in [ 1 .. nccl ] do
          chi[j]:= chi[j] * weight[j];
        od;
        for j in [ 1 .. i ] do
          scpr:= ( chi * chars[j] ) / order;
          Add( scprmatrix[i], scpr );
          if not IsInt( scpr ) then
            if IsRat( scpr ) then
              InfoCharTable2( "#E MatScalarProducts: sum not divisible",
                              " by group order\n" );
            elif IsCyc( scpr ) then
              InfoCharTable2( "#E MatScalarProducts: summation not",
                              " integer valued\n");
            fi;
          fi;
        od;
      od;
    fi;
    return scprmatrix;
    end;


#############################################################################
##
#F  InverseMatMod( <intmat>, <prime> )
##
##  For a square integral matrix <intmat> and a prime <prime> (both is *not*
##  checked!), 'InverseMatMod' returns an integral matrix <mat> with
##  '<mat> \* <intmat>' congruent to the identity matrix modulo <prime>,
##  if such a matrix exists, and 'false' otherwise.
##
InverseMatMod := function( intmat, p )
    local i, j, k,              # loop variables
          n,                    # dimension
          intmatq, intmatqinv,  # matrix & inverse modulo p
          x,                    # solution of one iteration
          zline,                # help-line for exchange
          nullv,                # zero-vector
          mult,                 # multiplication table of the field
          inverse,              # list of inverses of field elements
          val;

    n:= Length( intmat );

    # inverses modulo 'p'; we have 'inverse[x] * x = 1'
    inverse:= [ 1 ];
    for i in [ 2 .. p-1 ] do
      inverse[i]:= ( 1 / i ) mod p;
    od;

    # multiplication table; we have 'mult[i][j]' congruent 'i\*j' mod 'p'
    mult:= [];
    for i in [ 1 .. p-1 ] do
      mult[i]:= [];
      for j in [ 1 .. p-1 ] do
        mult[i][j]:= ( i*j ) mod p;
      od;
    od;

    # 'intmatq'\: 'intmat' reduced mod 'p'
    intmatq := [];
    for i in [ 1 .. n ] do
      intmatq[i] := [];
      for j in [ 1 .. n ] do
        intmatq[i][j]:= intmat[i][j] mod p;
      od;
    od;
    intmatqinv := IdentityMat( n );

    for i in [ 1 .. n ] do
      j := i;
      while j <= n and intmatq[j][i] = 0 do
        j := j + 1;
      od;
      if j > n then

        # matrix is singular modulo that 'p'
        return false;
      else

        # exchange lines 'i' and 'j'
        if j <> i then
           zline := intmatq[j];
           intmatq[j] := intmatq[i];
           intmatq[i] := zline;
           zline := intmatqinv[j];
           intmatqinv[j] := intmatqinv[i];
           intmatqinv[i] := zline;
        fi;

        # normalize line 'i'
        zline:= intmatq[i];
        if zline[i] <> 1 then
          x:= mult[ inverse[ zline[i] ] ];
          zline[i]:= 1;
          for k in [ i+1 .. n ] do  
            if zline[k] <> 0 then
              zline[k]:= x[ zline[k] ];
            fi;
          od;
          zline:= intmatqinv[i];
          for k in [1 .. n] do
            if zline[k] <> 0 then
              zline[k]:= x[ zline[k] ];
            fi;
          od;
        fi;

        # elimination in column 'i'
        for j in [ 1 .. n ] do
          if j <> i and intmatq[j][i] <> 0 then
            x:= mult[ intmatq[j][i] ];
            for k in [ 1 .. n ] do
              if intmatqinv[i][k] <> 0 then
                intmatqinv[j][k]:=
                    (intmatqinv[j][k] - x[ intmatqinv[i][k] ] ) mod p;
              fi;
              if intmatq[i][k] <> 0 then
                intmatq[j][k]:=
                     (intmatq[j][k] - x[ intmatq[i][k] ] ) mod p;
              fi;
            od;
          fi;
        od;

      fi;

    od;

    return intmatqinv;
    end;

    
#############################################################################
##
#F  'PadicCoefficients( <A>, <Amodpinv>, <b>, <prime>, <depth> )'
#F                                             . . . . . p--adic coefficients
##
PadicCoefficients := function( A, Amodpinv, b, prime, depth )
    local i, n, nullv, coeff, step, p2, val;
    
    n:= Length( b );
    nullv:= List( b, x -> 0 );
    coeff:= [];
    step:= 0;
    p2:= ( prime - 1 ) / 2;
    while b <> nullv and step < depth do
      step:= step + 1;
      coeff[ step ]:= b * Amodpinv;
      for i in [ 1 .. n ] do
        val:= coeff[ step ][i] mod prime;
        if val > p2 then
          coeff[ step ][i]:= val - prime;
        else
          coeff[ step ][i]:= val;
        fi;
      od;
      b:= ( b - coeff[ step ] * A ) / prime;
    od;
    Add( coeff, b );
    return coeff;
    end;

    
#############################################################################
##
#F  'LinearIndependentColumns( <mat> )'
##
##  returns a maximal list of positions of linear independent columns in the
##  matrix <mat>
##
LinearIndependentColumns := function( mat )
    local   m, n, i, j, k, q, row, zero, val, choice;

    # make a copy to avoid changing the original argument
    m := Length(mat);
    n := Length(mat[1]);
    zero := 0*mat[1][1];
    mat := Copy( mat );
    choice:= [];

    # run through all columns of the matrix
    i:= 0;
    for k in [1..n]  do

        # find a nonzero entry in this column
        j := i + 1;
        while j <= m and mat[j][k] = zero  do j := j+1;  od;

        # if there is a nonzero entry
        if j <= m  then

            i:= i+1;

            # choose this column, swap rows 'j' and 'i'
            Add( choice, k );
            row:= mat[j];
            mat[j]:= mat[i];
            mat[i]:= row;

            # normalize column 'k'
            val:= row[k];
            for q in [ j .. m ] do mat[q][k] := mat[q][k] / val; od;
            row[k]:= 1;

            # clear all entries in row 'i'
            for j in [ k+1 .. n ] do
              if mat[i][j] <> zero  then
                val:= mat[i][j];
                for q in [ i .. m ] do
                  mat[q][j] := mat[q][j] - val * mat[q][k];
                od;
              fi;
            od;

        fi;

    od;

    # return the list of positions of linear independent columns
    return choice;
end;


#############################################################################
##
#F  DecompositionInt( <A>, <B>, <depth> )  . . . . . . . . integral solutions
##
##  by Ansgar Kaup
##
##  returns the decomposition matrix <X> with '<X> \* <A> = <B>' for <A> and
##  <B> integral matrices.
##
##  For an odd prime $p$, each integer $x$ has a unique representation
##  $x = \sum_{i=0}^{n} x_i p^i$ where  $|x_i| \leq \frac{p-1}{2}$ .
##  Let $x$ be a solution of the equation $xA = b$ where $A$ is a square
##  integral matrix and $b$ an integral vector, $\overline{A} = A \bmod p$
##  and $\overline{b} = b \bmod p$;
##  then $\overline{x} \overline{A} \equiv \overline{b} \bmod p$ for
##  $\overline{x} = x \bmod p$.
##  Assume $\overline{A}$ is regular over the field with $p$ elements; then
##  $\overline{x}$ is uniquely determined mod $p$.
##  Define $x^{\prime} = \frac{x - \overline{x}}{p}$ and
##         $b^{\prime} = \frac{b - \overline{x} A }{p}$.
##  If $y$ is a solution of the equation $x^{\prime} A = b^{\prime}$ we
##  have $( \overline{x} + p y ) A = b$ and thus $x = \overline{x} + p y$
##  is the solution of our problem.
##  Note that the process must terminate if an integral solution $x$ exists,
##  since the $p$--adic series for $y$ has one term less than that for $x$.
##
##  If $A$ is not square, it must have full rank,
##  and $'Length( <A> )' \leq 'Length( <A>[1] )'$.
##
DecompositionInt := function( A, B, depth )

    local i, j,       # loop variables
          Aqinv,      # inverse of matrix modulo p
          b,          # vector
          sol,        # solution of one step
          result,     # whole solution
          p,          # prime
          ph,         # half of ( prime minus one )
          nullv,      # zero-vector
          origA,      # store full argument 'A' in case of column choice
          n,          # dimension
          choice,
          coeff,
          val;
    
    # check input parameters
    if Length( A ) > Length( A[1] ) then
      Error( "<A> must have at least 'Length(<A>)' columns" );
    fi;
    if not IsMat( A ) and ForAll( A, x -> ForAll( x, IsInt ) ) then
      Error( "<A> must be integer matrix" );
    fi;
    if not ForAll( B, x -> x = false or ( ForAll( x, IsInt )
                                  and Length( x ) = Length( A[1] ) ) ) then
      Error( "<B> must be list of integer vectors",
             " of same dimension as in <A>" );
    fi;
    if not IsInt( depth ) and depth >= 0 then
      Error( "<depth> (of iterations) must be a nonnegative integer" );
    fi;
     
    # initialisations
    n := Length( A );
    depth := depth + 1;
    result := [];
    p := 83;
    ph := ( p -1 ) / 2;
    nullv := List( [ 1 .. n ], x -> 0 );

    # if 'A' is not square choose 'n' linear independent columns
    origA:= A;
    if Length( A[1] ) > n then

      choice:= LinearIndependentColumns( A );
      if Length( choice ) < Length( A ) then
        Error( "<A> has not full rank" );
      fi;
      A:= List( A, x -> x{ choice } );

    else
      choice:= [ 1 .. n ];
    fi;

    # compute the inverse 'Aqinv' of 'A' modulo 'p';
    Aqinv:= InverseMatMod( A, p );
    while Aqinv = false do

      # matrix is singular modulo that 'p', choose another one
      p := NextPrimeInt( p );
      Print( "#I DecompositionInt: choosing new prime : ", p, "\n" );
      Aqinv:= InverseMatMod( A, p );
    od;

    # compute the p--adic coefficients of the solutions,
    # and form the solutions
    for b in B do

      if b = false then
        Add( result, false );
      else
        b:= b{ choice };
        coeff:= PadicCoefficients( A, Aqinv, b, p, depth );
        if coeff[ Length( coeff ) ] = nullv then
  
          sol := nullv;
          for i in Reversed( [ 1 .. Length( coeff ) - 1 ] ) do
            sol := sol * p + coeff[i];
          od;
          Add( result, Copy( sol ) );
        else
          Add( result, false);
        fi;
      fi;

    od;

    # if the argument 'A' is not square test if the solutions are correct
    if Length( origA[1] ) > n then
      for i in [ 1 .. Length( result ) ] do
        if result[i] <> false and result[i] * origA <> B[i] then
          result[i]:= false;
        fi;
      od;
    fi;

    return result;
    end;

#############################################################################
##
#F  IntegralizedMat( <A> )
#F  IntegralizedMat( <A>, <inforec> )
##
IntegralizedMat := function( arg )

    local i, A, inforec, tr, f, galaut, repr, aut, conj, pos, row, intA,
          col, introw, nofcyc, coeffs;

    if Length( arg ) = 0 or Length( arg ) > 2 or not IsMat( arg[1] )
       or ( Length( arg ) = 2 and not IsRec( arg[2] ) ) then
      Error( "usage: IntegralizedMat( <A> ) resp. \n",
             "       IntegralizedMat( <A>, <inforec> )" );
    fi;
    A:= arg[1];
    if Length( arg ) = 2 then
    
      # just use 'inforec' to transform 'A'
      inforec:= arg[2];
    
    else
    
      # compute transformed matrix 'intA' and info record 'inforec'
      inforec:= rec( intcols  := [],
                     irratcols:= [],
                     fields   := [] );
      tr:= TransposedMat( A );
    
      for i in [ 1 .. Length( tr ) ] do
    
        if IsBound( tr[i] ) then
    
          if ForAll( tr[i], IsInt ) then
            Add( inforec.intcols, i );
          else
      
            # compute the field and the coefficients of values;
            # if 'tr' contains conjugates of the row, delete them
            f:= Field( tr[i] );
            nofcyc:= NofCyc( f.generators );
            galaut:= PrimeResidues( nofcyc );
            SubtractSet( galaut, f.stabilizer );
            repr:= [];
            while galaut <> [] do
              Add( repr, galaut[1] );
              SubtractSet( galaut,
                           List( f.stabilizer * galaut[1],
                                 x -> x mod nofcyc) );
            od;
            for aut in repr do
              conj:= List( tr[i], x-> GaloisCyc( x, aut ) );
              pos:= Position( tr, conj );
              if pos <> false then
                Unbind( tr[ pos ] );
              fi;
            od;
            inforec.fields[i]:= f;
            Add( inforec.irratcols, i );
    
          fi;
        fi;
      od;
    fi;
      
    intA:= [];
    for row in A do
      introw:= row{ inforec.intcols };
      for col in inforec.irratcols do
        coeffs:= inforec.fields[ col ].operations.Coefficients(
                               inforec.fields[ col ], row[ col ] );
        if coeffs <> false then
          Append( introw, coeffs );
        else
          Append( introw, List( [ 1 .. inforec.fields[ col ].dimension ],
                                x -> false ) );
        fi;
      od;
      Add( intA, introw );
    od;
    
    return rec( mat:= intA, inforec:= inforec );
    end;

#############################################################################
##
#F  Decomposition( <A>, <B>, <depth> ) . . . . . . . . . . integral solutions
#F  Decomposition( <A>, <B>, \"nonnegative\" ) . . . . . . integral solutions
##
##  For a matrix <A> of cyclotomics and a list <B> of cyclotomic vectors,
##  'Decomposition' tries to find integral solutions of the linear equation
##  systems '<x> \* <A> = <B>[i]'.
##
##  <A> must have full rank, i.e., there must be a linear independent set of
##  columns of same length as <A>.
##
##  'Decomposition( <A>, <B>, <depth> )', where <depth> is a nonnegative
##  integer, computes for every '<B>[i]' the initial part
##  $\Sum_{k=0}^{<depth>} x_k p^k$ (all $x_k$ integer vectors with entries
##  bounded by $\pm\frac{p-1}{2}$) of the $p$-adic series of a hypothetical
##  solution. The prime $p$ is 83 first; if the reduction of <A>
##  modulo $p$ is singular, the next prime is chosen automatically.
##
##  A list <X> is returned. If the computed initial part for
##  '<x> \* <A> = <B>[i]' *is* a solution, we have '<X>[i] = <x>', otherwise
##  '<X>[i] = false'.
##  
##  'Decomposition( <A>, <B>, \"nonnegative\" )' assumes that the solutions
##  have only nonnegative entries.
##  This is e.g.\ satisfied for the decomposition of ordinary characters into
##  Brauer characters.
##  If the first column of <A> consists of positive integers,
##  the necessary number <depth> of iterations can be computed. In that case
##  the 'i'-th entry of the returned list is 'false' if there *exists* no
##  nonnegative integral solution of the system '<x> \* <A> = <B>[i]', and it
##  is the solution otherwise.
##
##  *Note* that the result is a list of 'false' if <A> has not full rank,
##  even if there might be a unique integral solution for some equation
##  system.
##
Decomposition := function( A, B, depth_or_nonnegative )

    local i, j, intA, row, intB, newintA, newintB, result, choice, inforec;

    if not ( IsInt( depth_or_nonnegative ) and depth_or_nonnegative >= 0 )
       and depth_or_nonnegative <> "nonnegative" then
      Error( "usage: Decomposition( <A>,<B>,<depth> ) for integer <depth>\n",
             "        resp. Decomposition( <A>,<B>,\"nonnegative\" )\n",
             "        ( solution <X> of <X> * <A> = <B> )" );
    fi;

    # check input parameters
    if not ( IsMat(A) and IsMat(B) and Length(B[1]) = Length(A[1]) ) then
      Error( "<A>, <B> must be matrices with same number of columns" );
    fi;
    
    # transform 'A' to an integer matrix 'intA',
    intA:= IntegralizedMat( A );
    inforec:= intA.inforec;
    intA:= intA.mat;

    # transform 'B' to 'intB', choose coefficients compatible
    intB:= IntegralizedMat( B, inforec ).mat;
    
    # if 'intA' is not square choose linear independent columns
    if Length( intA ) < Length( intA[1] ) then
      choice:= LinearIndependentColumns( intA );
      newintA:= List( intA, x -> x{ choice } );
      newintB:= List( intB, x -> x{ choice } );
    elif Length( intA ) > Length( intA[1] ) then
      Error( "There must be a subset of columns forming a regular matrix" );
    else
      newintA:= intA;
      newintB:= intB;
    fi;

    for i in [ 1 .. Length( newintB ) ] do
      if not ForAll( newintB[i], IsInt ) then
        newintB[i]:= false;
      fi;
    od;
    
    # depth of iteration
    if depth_or_nonnegative = "nonnegative" then
      if not ForAll( newintA, x -> IsInt( x[1] ) and x[1] >= 0 ) then
        Error( "option \"nonnegative\" is allowed only if the first column\n",
               "       of <A> consists of positive integers" );
      fi;
    
      # The smallest value that has length 'c' in the p-adic series is
      # p^c + \Sum_{k=0}^{c-1} -\frac{p-1}{2} p^k = \frac{1}{2}(p^c + 1).
      # So if $'<B>[i][1] / Minimum( newintA[1] )' \< \frac{1}{2}(p^c + 1)$
      # we have 'depth' at most 'c-1'.

      result:= DecompositionInt( newintA, newintB,
                       LogInt( 2*Int( Maximum( List( B, x->x[1] ) )
                               / Minimum( List( A, x -> x[1]) ) ), 83 ) + 2 );
      for i in [ 1 .. Length( result ) ] do
        if IsList( result[i] ) and Minimum( result[i] ) < 0 then
          result[i]:= false;
        fi;
      od;
    else
      result:= DecompositionInt( newintA , newintB, depth_or_nonnegative );
    fi;

    # if 'intA' is not square test if the result is correct
    if Length( intA ) < Length( intA[1] ) then
      for i in [ 1 .. Length( result ) ] do
        if result[i] <> false and result[i] * A <> B[i] then
          result[i]:= false;
        fi;
      od;
    fi;

    return result;
    end;

#############################################################################
##
#F  DecompositionMatrix( <modtbl> )
#F  DecompositionMatrix( <modtbl>, <blocknr> )
##
##  Let <modtbl> be a Brauer character table.
##
##  In the first version 'DecompositionMatrix' returns the decomposition
##  matrix of <modtbl>, where the rows are indexed by the characters
##  in '<modtbl>.ordinary.irreducibles', and the columns are indexed by
##  '<modtbl>.irreducibles'.
##
##  In the second version 'DecompositionMatrix' returns the decomposition
##  matrix of the block of <modtbl> with number <blocknr>.
##
##  An ordinary irreducible character is in block $i$ if and only if all
##  characters before the first character of the same block lie in $i-1$
##  different blocks.
##  An irreducible Brauer character is in block $i$ if it has nonzero scalar
##  product with an ordinary irreducible character in block $i$.
##
DecompositionMatrix := function( arg )

    local modtbl,    # Brauer character table, first argument
          blocknr,   # number of the block, second argument
          block;     # block information

    if    Length( arg ) = 1 and IsCharTable( arg[1] ) then

      modtbl:= arg[1];
      if not IsBound( modtbl.decompositionMatrix ) then
        modtbl.decompositionMatrix:=
           Decomposition( modtbl.irreducibles,
                          Restricted( modtbl.ordinary, modtbl,
                             modtbl.ordinary.irreducibles ),
                            "nonnegative" );
      fi;
      return modtbl.decompositionMatrix;

    elif Length( arg ) = 2 and IsCharTable( arg[1] ) and IsInt( arg[2] ) then

      modtbl  := arg[1];
      blocknr := arg[2];

      if not IsBound( modtbl.blocks ) then
        Error( "<modtbl> must have 'blocks' component" );
      fi;

      if     IsInt( blocknr )
         and 0 < blocknr
         and blocknr <= Length( modtbl.blocks ) then
        block:= modtbl.blocks[ blocknr ];
      else
        Error( "<blocknr> must be in the range [ 1 .. ",
               Length( modtbl.blocks ), " ]" );
      fi;

      if not IsBound( block.decompositionMatrix ) then

        block.decompositionMatrix:=
           Decomposition( modtbl.irreducibles{ block.modchars },
                          Restricted( modtbl.ordinary, modtbl,
                             modtbl.ordinary.irreducibles{ block.ordchars } ),
                            "nonnegative" );

      fi;

      return block.decompositionMatrix;

    else
      Error( "usage: DecompositionMatrix( <modmodtbl> [, <blocknr>])" );
    fi;
    end;

#############################################################################
##
#F  LaTeXStringDecompositionMatrix( <modtbl> )
#F  LaTeXStringDecompositionMatrix( <modtbl>, <blocknr> )
##
##  is a string that contains {\LaTeX} code to print a decomposition matrix
##  (see "DecompositionMatrix") nicely.
##
LaTeXStringDecompositionMatrix := function( arg )

    local modtbl,    # Brauer character table, first argument
          blocknr,   # number of the block, second argument
          decmat,    # decomposition matrix
          block,     # block information on 'modtbl'
          modchars,  # indices of Brauer characters
          ordchars,  # indices of ordinary characters
          phi,       # string used for Brauer characters
          chi,       # string used for ordinary irreducibles
          str,       # string containing the text
          i,         # loop variable
          val;       # one value in the matrix


    if    Length( arg ) = 1 and IsCharTable( arg[1] ) then

      modtbl:= arg[1];
      decmat:= DecompositionMatrix( modtbl );
      modchars:= [ 1 .. Length( decmat[1] ) ];
      ordchars:= [ 1 .. Length( decmat ) ];

    elif Length( arg ) = 2 and IsCharTable( arg[1] ) and IsInt( arg[2] ) then

      modtbl   := arg[1];
      blocknr  := arg[2];
      decmat   := DecompositionMatrix( modtbl, blocknr );
      block    := modtbl.blocks[ blocknr ];
      modchars := block.modchars;
      ordchars := block.ordchars;

    else
      Error( "usage: ",
             "LatexStringDecompositionMatrix( <modmodtbl> [, <blocknr>])" );
    fi;

    phi:= "\\varphi";
    chi:= "\\chi";

    str:= "";

    # head of the array
    Append( str,  "\\[\n" );
    Append( str,  "\\begin{array}{l|" );
    for i in [ 1 .. Length( decmat[1] ) ] do
      Add( str, 'r' );
    od;
    Append( str, "} \\hline\n" );

    # The first line contains the Brauer character numbers.
    for i in modchars do
      Append( str, " & " );
      Append( str, phi );
      Append( str, "_{" );
      Append( str, String( i ) );
      Append( str, "}\n" );
    od;
    Append( str, " \\\\ \\hline\n" );

    # the matrix itself,
    for i in [ 1 .. Length( decmat ) ] do

      # The first column contains the numbers of ordinary irreducibles.
      Append( str, chi );
      Append( str, "_{" );
      Append( str, String( ordchars[i] ) );
      Append( str, "}" );

      for val in decmat[i] do
        Append( str, " & " );
        if val = 0 then
          Append( str, "." );
        else
          Append( str, String( val ) );
        fi;
      od;

      Append( str, " \\\\\n" );

    od;

    Append( str, "\\hline " );

    # tail of the array
    Append( str,  "\\end{array}\n" );
    Append( str,  "\\]\n" );

    # Return the result.
    return str;
    end;

#############################################################################
##
#F  Tensored( <chars1>, <chars2> )
##
##  returns the list of tensor products of <chars1> with <chars2>.
##
Tensored := function( chars1, chars2 )
    local i, j, k, nccl, tensored, single, chars, chars2;

    if Length( chars1 ) = 0 then return []; fi;
    nccl:= Length( chars1[1] );

    tensored:= [];
    for i in chars1 do
      for j in chars2 do
        single:= [];
        for k in [ 1 .. nccl ] do single[k]:= i[k] * j[k]; od;
        Add( tensored, single );
      od;
    od;
    return tensored;
    end;


#############################################################################
##
#F  Reduced( <tbl>, <constituents>, <reducibles> )
#F  Reduced( <tbl>, <reducibles> )
##
##  returns a record with fields 'remainders' and 'irreducibles', both lists:
##
##  Let 'scpr' be the value of '<tbl>.operations.ScalarProduct'.
##  Let 'rems' be the set of nonzero characters obtained from <reducibles>
##  by subtraction of
##  $\sum_{j}
##   \frac{'scpr( <tbl>, <reducibles>[i], <constituents>[j]}
##        {'scpr( <tbl>, <constituents>[j], <constituents>[j]}
##            \cdot <constituents>[j]$
##  from '<reducibles>[i]'.
##  Let 'irrs' be the list of irreducible characters in 'rems'.
##  We reduce 'rems' with 'irrs' and all found irreducibles until no new
##  irreducibles are found. Then 'irreducibles' is the set of all found
##  irreducible characters, 'remainders' is the set of all nonzero remainders.
##  
Reduced := function( arg )
    local i, j, x, tbl, normsquare, upper, constituents, found, remainders,
          reducibles, scprmatrix, single, row, mult, reduced, scpr;
    if not ( Length( arg ) in [ 2, 3 ] and IsCharTable( arg[1] )
             and IsList(arg[2]) and (Length(arg)=2 or IsList(arg[3])) ) then
      Error( "usage: Reduced( <tbl>, <constituents>, <reducibles> )\n",
             " resp. Reduced( <tbl>, <reducibles> )" );
    fi;
    tbl:= arg[1];
    upper:= [];
    constituents:= arg[2];
    normsquare:= List( constituents,
                       x-> tbl.operations.ScalarProduct( tbl, x, x ) );
    found:= [];         # found irreducibles
    remainders:= [];    # set of remainders of reducibles after subtracting
                        # <constituents>
    if Length( arg ) = 2 then
      reducibles:= arg[2];
      for i in [ 1 .. Length( reducibles ) ] do
        upper[i]:= i-1;
        if normsquare[i] = 1 then
          if reducibles[i][1] > 0 then
            AddSet( found, reducibles[i] );
          else
            AddSet( found, - reducibles[i] );
          fi;
        fi;
      od;
    else
      reducibles:= arg[3];
      x:= Length( constituents );
      for i in [ 1 .. Length( reducibles ) ] do upper[i]:= x; od;
    fi;
    for i in [ 1 .. Length( reducibles ) ] do
      single:= reducibles[i];
      for j in [ 1 .. upper[i] ] do
        scpr:= tbl.operations.ScalarProduct( tbl, single, constituents[j] );
        if not IsInt( scpr ) then
          scpr:= 0;
          Print( "#E Reduced: scalar product of X[", j, "] with Y[", i,
                 "] not integral,\n#E   ignoring this pair\n" );
        fi;
        mult:= Int( scpr / normsquare[j] );
        if mult <> 0 then single:= single - mult * constituents[j]; fi;
      od;
      if Set( single ) <> [ 0 ] then
        if single[1] < 0 then single:= - single; fi;
        if tbl.operations.ScalarProduct( tbl, single, single ) = 1 then
          if not single in found and not single in constituents then
            InfoCharTable2( "#I Reduced: irreducible character of degree ",
                            single[1], " found\n" );
            AddSet( found, single );
          fi;
        else 
          AddSet( remainders, single );
        fi;
      fi;
    od;
    if Length( found ) = 0 then
      return rec( remainders:= remainders, irreducibles:= [] );
    fi;
    reduced:= Reduced( tbl, found, remainders );
    return rec( remainders:= reduced.remainders,
                irreducibles:= Union( found, reduced.irreducibles ) );
    end;


#############################################################################
##
#F  ReducedOrdinary( <tbl>, <constituents>, <reducibles> )
##
##  like 'Reduced', but <constituents> and <reducibles> are known to be
##  ordinary characters of <tbl>, so only those scalar products must be
##  formed where the degree of the constituent is not bigger than the
##  degree of the reducibles character.
##
ReducedOrdinary := function( tbl, constituents, reducibles )
    local i, j, x, normsquare, found, remainders, scprmatrix, single, row,
          mult, reduced, scpr;

    normsquare:= List( constituents,
                       x-> tbl.operations.ScalarProduct( tbl, x, x ) );
    found:= [];         # found irreducibles
    remainders:= [];    # set of remainders of reducibles after subtracting
                        # <constituents>
    x:= Length( constituents );
    for i in [ 1 .. Length( reducibles ) ] do
      single:= reducibles[i];
      for j in [ 1 .. x ] do
        if constituents[j][1] <= single[1] then
          scpr:= tbl.operations.ScalarProduct( tbl, single, constituents[j] );
          if not IsInt( scpr ) then
            scpr:= 0;
            Print( "#E ReducedOrdinary: scalar product of X[", j, "] with Y[",
                   i, "] not integral,\n#E   ignoring this pair\n" );
          fi;
          mult:= Int( scpr / normsquare[j] );
          if mult <> 0 then single:= single - mult * constituents[j]; fi;
        fi;
      od;
      if Set( single ) <> [ 0 ] then
        if tbl.operations.ScalarProduct( tbl, single, single ) = 1 then
          if single[1] < 0 then single:= - single; fi;
          if not single in found and not single in constituents then
            InfoCharTable2( "#I ReducedOrdinary: irreducible character of",
                            " degree ", single[1], " found\n" );
          fi;
          AddSet( found, single );
        else 
          AddSet( remainders, single );
        fi;
      fi;
    od;
    if Length( found ) = 0 then
      return rec( remainders:= remainders, irreducibles:= [] );
    fi;
    reduced:= Reduced( tbl, found, remainders );
    return rec( remainders:= reduced.remainders,
                irreducibles:= Union( found, reduced.irreducibles ) );
    end;


#############################################################################
##
#F  Symmetrisations( <tbl>, <characters>, <Sn> )
#F  Symmetrisations( <tbl>, <characters>, <n> )
##
Symmetrisations := function( tbl, characters, Sn )

    local i, j, l, n, cyclestruct, symmirreds, symmclasses, symmorder, cycl,
          symmetrisations, chi, psi, powermap, prodmatrix, single, value, val;

    if IsInt( Sn ) then
      Sn:= CharTable( "Symmetric", Sn );
    elif IsCharTable( Sn ) then
      if not IsBound( Sn.classparam ) then
        Error( "partitions corresponding to classes must be stored",
               " in Sn.classparam" );
      fi;
    else
      Error( "usage: Symmetrisations( tbl, chars, n ) with integer n or\n",
             "Symmetrisations( tbl, chars, S_n ) with symmetric group S_n" );
    fi;

    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;

    cyclestruct:= [];
    for i in [ 1 .. Length( Sn.classparam ) ] do
      if Length( Sn.classparam[i][2] ) = 1 then
        n:= Sn.classparam[i][2][1];
      fi;
      cyclestruct[i]:= [];
      for j in [ 1 .. Maximum( Sn.classparam[i][2] ) ] do
         cyclestruct[i][j]:= 0;
      od;
      for j in Sn.classparam[i][2] do
        cyclestruct[i][j]:= cyclestruct[i][j] + 1;
      od;
    od;
    symmirreds  := Sn.irreducibles;
    symmclasses := Sn.classes;
    symmorder   := Sn.order;

    # Compute necessary power maps.
    for i in [ 2 .. n ] do
      if not IsBound( tbl.powermap[i] ) then
        if IsPrime( i ) then
          tbl.powermap[i]:=
                 Parametrized( Powermap( tbl, i, rec( quick:= true ) ) );
        else
          tbl.powermap[i]:= Powmap( tbl, i );
        fi;
      fi;
    od;
    powermap:= ShallowCopy( tbl.powermap );
    i:= Length( powermap[ Length( powermap ) ] );
    for j in [ 2 .. Length( powermap ) - 1 ] do
      if IsBound( powermap[j] ) and i < Length( powermap[j] ) then
        i:= Length( powermap[j] );
      fi;
    od;
    powermap[1]:= [ 1 .. i ];

    symmetrisations:= [];
    for chi in characters do

      # Symmetrize the k-th character of table ...
      prodmatrix:= [];
      for i in [ 1 .. Length( characters[1] ) ] do
        prodmatrix[i]:= [];
        for j in [ 1 .. Length( symmclasses ) ] do
          value:= symmclasses[j];
          cycl:= cyclestruct[j];
          for l in [ 1 .. Length( cycl ) ] do
            if cycl[l] <> 0 then
              if IsInt( powermap[l][i] ) then
                value:= value * ( chi[ powermap[l][i] ] ^ cycl[l] );
              else
                val:= CompositionMaps( chi, powermap[l][i] );
                if IsInt( val ) then
                  value:= value * ( val ^ cycl[l] );
                else
                  value:= Unknown();
                fi;
              fi;
            fi;
          od;
          prodmatrix[i][j]:= value;
        od;
      od;

      # ... with character psi ...
      for psi in symmirreds do
        single:= [];
        for i in [ 1 .. Length( characters[1] ) ] do

          # ... at class i
          single[i]:= psi * prodmatrix[i] / symmorder;
          if not ( IsCycInt( single[i] ) or IsUnknown( single[i] ) ) then
            single[i]:= Unknown();
            Print( "#E Symmetrisations: value not dividing group order,",
                   " set to ", single[i], "\n" );
          fi;

        od;
        Add( symmetrisations, single );
      od;
    od;

    # Return the symmetrizations.
    return symmetrisations;
    end;

Symmetrizations := Symmetrisations;

#############################################################################
##
#F  SymmetricParts( <tbl>, <character>, <n> )
##
SymmetricParts := function( tbl, characters, n )
    local i,
          j,
          k,
          nccl,
          exponents,
          symcentralizers,   # list of symmetrizations, result
          symmetricparts,
          chi,               # loop over 'characters'
          sym,
          exp,
          factor,
          powermap;          # shallow copy of 'tbl.powermap'

    if Length( characters ) = 0 then
      return [];
    fi;

    nccl:= Length( tbl.classes );
    exponents:= Partitions( n );
    symcentralizers:= CharTableSymmetric.centralizers[1];
    symcentralizers:= List( exponents, x -> symcentralizers( n, x ) );

    for i in [ 1 .. Length( exponents ) ] do

      # Transform partitions to exponent vectors.
      # At position $i$ we store the number of cycles of length $i$.
      exp:= [];
      for j in [ 1 .. Maximum( exponents[i] ) ] do exp[j]:= 0; od;
      for j in exponents[i] do exp[j]:= exp[j] + 1; od;
      exponents[i]:= exp;

    od;

    # Compute necessary power maps.
    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;
    powermap:= tbl.powermap;
    powermap[1]:= [ 1 .. Length( tbl.classes ) ];
    for i in [ 2 .. n ] do
      if not IsBound( powermap[i] ) then
        if IsPrime( i ) then
          powermap[i]:=
                 Parametrized( Powermap( tbl, i, rec( quick:= true ) ) );
        else
          powermap[i]:= Powmap( tbl, i );
        fi;
      fi;
    od;

    symmetricparts:= [];
    for chi in characters do

      InfoCharTable2("#I SymmetricParts: chi[.]\n");
      sym:= List( chi, x -> 0 );

      # Loop over the conjugacy classes of the symmetric group.
      for j in [ 1 .. Length( symcentralizers ) ] do

        exp:= exponents[j];

        for k in [ 1 .. nccl ] do
          factor:= 1;
          for i in [ 1 .. Length( exp ) ] do
            if IsBound( exp[i] ) then
              factor:= factor * chi[ powermap[i][k] ]^exp[i];
            fi;
          od;
          sym[k]:= sym[k] + factor / symcentralizers[j];
        od;
          
      od;
      Add( symmetricparts, sym );

    od;

    # Return the symmetrizations.
    return symmetricparts;
    end;

#############################################################################
##
#F  AntiSymmetricParts( <tbl>, <character>, <n> )
##
AntiSymmetricParts := function( tbl, characters, n )

    local i,
          j,
          k,
          nccl,
          exponents,
          symcentralizers,
          antisymmetricparts,
          chi,
          sym,
          exp,
          factor,
          powermap;

    if Length( characters ) = 0 then
      return [];
    fi;

    nccl:= Length( tbl.classes );
    exponents:= Partitions( n );
    symcentralizers:= CharTableSymmetric.centralizers[1];
    symcentralizers:= List( exponents, x -> symcentralizers( n, x ) );

    for i in [ 1 .. Length( exponents ) ] do

      # Transform partitions to exponent vectors.
      # At position $i$ we store the number of cycles of length $i$.

      exp:= [];
      for j in [ 1 .. Maximum( exponents[i] ) ] do exp[j]:= 0; od;
      for j in exponents[i] do exp[j]:= exp[j] + 1; od;
      exponents[i]:= exp;

    od;

    # Compute necessary power maps.
    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;
    powermap:= tbl.powermap;
    powermap[1]:= [ 1 .. Length( tbl.classes ) ];
    for i in [ 2 .. n ] do
      if not IsBound( powermap[i] ) then
        if IsPrime( i ) then
          powermap[i]:=
                 Parametrized( Powermap( tbl, i, rec( quick:= true ) ) );
        else
          powermap[i]:= Powmap( tbl, i );
        fi;
      fi;
    od;

    # Compute the symmetrizations.
    antisymmetricparts:= [];
    for chi in characters do

      InfoCharTable2("#I AntiSymmetricParts: chi[.]\n");
      sym:= List( chi, x -> 0 );
      for j in [ 1 .. Length( exponents ) ] do

        exp:= exponents[j];

        for k in [ 1 .. nccl ] do
          factor:= 1;
          for i in [ 1 .. Length( exp ) ] do
            if IsBound( exp[i] ) then
              if i mod 2 = 0 and exp[i] mod 2 = 1 then
                factor:= -factor * chi[ powermap[i][k] ]^exp[i];
              else
                factor:=  factor * chi[ powermap[i][k] ]^exp[i];
              fi;
            fi;
          od;
          sym[k]:= sym[k] + factor / symcentralizers[j];
        od;

      od;
      Add( antisymmetricparts, sym );

    od;

    # Return the symmetrizations.
    return antisymmetricparts;
    end;

#############################################################################
##
#F  MinusCharacter( <character>, <prime_powermap>, <prime> )
##
##  the (parametrized) character $<character>^{<prime>-}$, defined by
##  $\chi^{p-}(g):= ( \chi(g)^p - \chi(g^p) ) / p$
##
MinusCharacter := function( character, prime_powermap, prime )
    local i, j, minuscharacter, diff, power;

    minuscharacter:= [];
    for i in [ 1 .. Length( character ) ] do
      if IsInt( prime_powermap[i] ) then
        diff:= ( character[i]^prime - character[prime_powermap[i]] ) / prime;
        if IsCycInt( diff ) then
          minuscharacter[i]:= diff;
        else
          minuscharacter[i]:= Unknown();
          InfoCharTable2( "#E MinusCharacter: value at class ", i,
                          " not divisible by ", prime, "\n" );
        fi;
      else
        minuscharacter[i]:= [];
        power:= character[i] ^ prime;
        for j in prime_powermap[i] do
          diff:= ( power - character[j] ) / prime;
          if IsCycInt( diff ) then
            AddSet( minuscharacter[i], diff );
          else
            InfoCharTable2( "#E MinusCharacter: improvement at class ",
                            i, " found because of congruences\n" );
          fi;
        od;
        if minuscharacter[i] = [] then
          minuscharacter[i]:= Unknown();
          InfoCharTable2( "#E MinusCharacter: no value possible at class ",
                          i, "\n" );
        elif Length( minuscharacter[i] ) = 1 then
          minuscharacter[i]:= minuscharacter[i][1];
        fi;
      fi;
    od;
    return minuscharacter;
    end;

#############################################################################
##
#F  RefinedSymmetrisations( <tbl>, <chars>, <m>, <func> )
##
##  returns Murnaghan components for orthogonal ('<func>(x,y)=x', see
##  "OrthogonalComponents") or symplectic ('<func>(x,y)=x-y', see
##  "SymplecticComponents") symmetrisations.
##
##  <m> must be an integer in '[ 1 .. 6 ]' in the orthogonal case,
##  and in '[ 1 .. 5 ]' for the symplektic case.
##
##  (Note\:\ It suffices to change 'F2' and 'F4' in order to get the
##  symplectic components from the orthogonal ones.)
##
##  We have (see J.S. Frame, Recursive computation of tensor power
##  components, Bayreuther Mathematische Schriften 10, 153--159)
##
##  component   orthogonal                symplectic
##  M0        = L0                        L0  ( = 1 )
##  M1        = L1                        L1
##  M11       = L11                       L11-L0
##  M2        = L2-L0                     L2
##  M111      = L111                      L111-L1
##  M21       = L21-L1                    L21-L1
##  M3        = L3-L1                     L3
##  M1111     = L1111                     L1111-L11
##  M211      = L211-L11                  L211-L11-L2+L0
##  M22       = L22-L2                    L22-L11
##  M31       = L31-L2-L11+L0             L31-L2
##  M4        = L4-L2                     L4
##  M11111    = L11111                    L11111-L111
##  M2111     = L2111-L111                L2111-L111-L21+L1
##  M221      = L221-L21                  L221-L111-L21+L1
##  M311      = L311-L21-L111+L1          L311-L21-L3+L1
##  M32       = L32-L3-L21+L1             L32-L21
##  M41       = L41-L3-L21+L1             L41-L3
##  M5        = L5-L3                     L5
##  M111111   = L111111                   L111111-L1111
##  M21111    = L21111-L1111              L21111-L1111-L211+L11
##  M2211     = L2211-L211                L2211-L1111-L211-L22+L11+L2
##  M3111     = L3111-L211-L1111+L11      L3111-L211-L31+L11+L2-L0
##  M222      = L222-L22                  L222-L211+L11-L0
##  M321      = L321-L31-L22-L211+L2+L11  L321-L31-L22-L211+L2+L11
##  M33       = L33-L31+L2-L0             L33-L22
##  M411      = L411-L31-L211+L2+L11-L0   L411-L31-L4+L2
##  M42       = L42-L4-L31-L22+L2+L11     L42-L31
##  M51       = L51-L4-L31+L2             L51-L4
##  M6        = L6-L4                     L6
##
RefinedSymmetrisations := function( tbl, chars, m, func )
    local i, nccl, components,
          F2, F3, F4, F5, F6,
          M1, M2, M11, M3, M21, M111, M4, M31, M22, M211, M1111, M5, M41,
          M32, M311, M221, M2111, M11111, M6, M51, M42, M411, M33, M321,
          M3111, M222, M2211, M21111, M111111;

    # compute missing powermaps
    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;
    for i in Filtered( [ 2, 3, 5 ], x -> x <= m ) do
      if not IsBound( tbl.powermap[i] ) then
        InfoCharTable2( "#I RefinedSymmetrisations: Powermap( ., ", i,
                        ", rec(quick:=true) ) called\n" );
        tbl.powermap[i]:= Parametrized( Powermap( tbl, i,
                                                  rec( quick:= true ) ) );
      fi;
    od;

    # Linear characters are not allowed since their symmetrisations need not
    # to be proper characters.
    chars:= Filtered( chars, x -> x[1] > 1 );
    components:= [];
    nccl:= Length( tbl.centralizers );

    for M1 in chars do

      F2 := MinusCharacter( M1, tbl.powermap[2], 2 );

      # orthogonal case: 'M11 = F2'
      # symplectic case: 'M11 = F2 - 1'
      M11:= func( F2, 1 );
      M2 := List( [ 1 .. nccl ], x -> M1[x]^2 - M11[x] - 1 );

      Add( components, M11 );
      Add( components, M2  );

      if m > 2 then

        F3:=    MinusCharacter( M1, tbl.powermap[3], 3 );
        M21:=   F3 - M1;
        M111:=  List( [ 1 .. nccl ], x -> M1[x] * M11[x] - F3[x] );
        M3:=    List( [ 1 .. nccl ], x -> M1[x] * M2[x]  - F3[x] );

        Add( components, M21  );
        Add( components, M111 );
        Add( components, M3   );
    
        if m > 3 then
   
          F4:=    MinusCharacter( F2, tbl.powermap[2], 2 );

          # orthogonal case: 'F4 := F4'
          # symplectic case: 'F4 := F4 - M2'
          F4:=    func( F4, M2 );
          M211:=  F4 - M11;
          M31:=   List( [ 1..nccl ], x -> M11[x]*M2[x]-F4[x]-M2[x]);
          M22:=   List( [ 1..nccl ], x -> M1[x]*M21[x]-F4[x]-M2[x]-M31[x] );
          M1111:= List( [ 1..nccl ], x -> M1[x]*M111[x]-F4[x] );
          M4:=    List( [ 1..nccl ], x -> M1[x]*M3[x]-M31[x]-M2[x] );
    
          for i in [ M211, M31, M22, M1111, M4 ] do    
            Add( components, i  );
          od;
    
          if m > 4 then
    
            F5:= MinusCharacter( M1, tbl.powermap[5], 5 );
            M2111:=  List( [ 1..nccl ], x-> F5[x]-M2[x]*F3[x]-M1[x]*M11[x] );
            M311:=   List( [ 1..nccl ], x-> M2[x]*M111[x]-M2111[x]-M21[x]
                                               -M111[x] );
            M221:=   List( [ 1..nccl ], x-> M1[x]*M211[x]-M2[x]*M111[x] );
            M11111:= List( [ 1..nccl ], x-> M1[x]*M1111[x]-M2111[x]-M111[x]);
            M32:=    List( [ 1..nccl ], x-> M1[x]*M22[x]-M221[x]-M21[x] );
            M41:=    List( [ 1..nccl ], x-> M11[x]*M3[x]-M311[x]-M21[x]
                                               -M3[x] );
            M5:=     List( [ 1..nccl ], x-> M1[x]*M4[x]-M41[x]-M3[x] );

            for i in [ M2111, M311, M221, M11111, M32, M41, M5 ] do    
              Add( components, i  );
            od;
    
            if m = 6 then
    
              F6:= MinusCharacter( F2, tbl.powermap[3], 3 );
              M3111:=   List( [ 1..nccl ], x-> M21[x]*M111[x]-F6[x]+F2[x] );
              M411:=    List( [ 1..nccl ], x-> M3[x]*M111[x]-M3111[x]-M31[x]
                                              -M211[x] );
              M21111:=  List( [ 1..nccl ], x-> M2[x]*M1111[x]-M3111[x]
                                              -M211[x]-M1111[x] );
              M111111:= List( [ 1..nccl ], x-> M1[x]*M11111[x]-M21111[x]
                                              -M1111[x] );
              M2211:=   List( [ 1..nccl ], x-> M1[x]*M2111[x]-M3111[x]
                                              -M21111[x]-M211[x]-M1111[x] );
              M321:=    List( [ 1..nccl ], x-> M1[x]*M311[x]-M3111[x]
                                              -M411[x]-M31[x]-M211[x] );
              M33:=     List( [ 1..nccl ], x-> F2[x]*M22[x]-M321[x]-M2211[x]
                                              -M31[x]-M22[x]-M211[x]-F2[x] );
              M51:=     List( [ 1..nccl ], x-> F2[x]*M4[x]-M411[x]-M31[x]
                                              -M4[x] );
              M42:=     List( [ 1..nccl ], x-> M1[x]*M41[x]-M411[x]-M51[x]
                                              -M31[x]-M4[x] );
              M222:=    List( [ 1..nccl ], x-> M2[x]*M22[x]-M321[x]-M42[x]
                                              -M31[x]-M22[x]-M211[x]-M2[x] );
              M6:=      List( [ 1..nccl ], x-> M1[x]*M5[x]-M51[x]-M4[x] );
    
              for i in [ M3111, M411, M21111, M111111, M2211, M321, M33,
                         M51, M42, M222, M6 ] do    
                Add( components, i  );
              od;

            fi;
          fi;
        fi;
      fi;
    od;
    return components;
    end;


#############################################################################
##
#F  OrthogonalComponents( <tbl>, <chars>, <m> )
##
##  If $\chi$ is an irreducible character with indicator $+1$, a splitting
##  of the tensor power $\chi^m$ is given by the so-called Murnaghan
##  functions (see F. D. Murnaghan, The Orthogonal and Symplectic Groups,
##  Comm. Dublin Inst. Adv. Studies, Series A No. 13 (1958)).
##  These components in general have fewer irreducible constituents
##  than the symmetrizations with the symmetric group of degree <m>
##  (see "Symmetrizations").
##
##  'OrthogonalComponents' returns the Murnaghan components of the
##  characters <chars> of the character table <tbl> up to the power <m>,
##  where <m> is an integer between 2 and 6.
##
##  The Murnaghan functions are implemented as in J. S. Frame,
##  Recursive computation of tensor power components, Bayreuther
##  Mathematische Schriften 10, 153--159, see "RefinedSymmetrisations".
##
OrthogonalComponents := function( tbl, chars, m )

    if not ( IsCharTable( tbl ) and IsList( chars ) and IsInt( m ) and
             m > 1 and m < 7 ) then
      Error( "usage: OrthogonalComponents( <tbl>, <chars>, <m> ) with ",
             "character table <tbl>,\n    chars <chars> and",
             " integer 2 <= m <= 6" );
    fi;

    return
      RefinedSymmetrisations( tbl, chars, m, function(x,y) return x;end );
    end;


#############################################################################
##
#F  SymplecticComponents( <tbl>, <chars>, <m> )
##
##  If $\chi$ is an irreducible character with indicator $-1$, there is a
##  splitting of the tensor power $\chi^m$ similar to the so-called Murnaghan
##  functions (see F. D. Murnaghan, The Orthogonal and Symplectic Groups,
##  Comm. Dublin Inst. Adv. Studies, Series A No. 13 (1958)).
##  These components in general have fewer irreducible constituents
##  than the symmetrizations with the symmetric group of degree <m>
##  (see "Symmetrizations").
##
##  'SymplecticComponents' returns the symplectic symmetrisations of the
##  characters <chars> of the character table <tbl> up to the power <m>,
##  where <m> is an integer between 2 and 5.
##
SymplecticComponents := function( tbl, chars, m )

    if not ( IsCharTable( tbl ) and IsList( chars ) and IsInt( m ) and
             m > 1 and m < 6 ) then
      Error( "usage: SymplecticComponents( <tbl>, <chars>, <m> ) with ",
             "character table <tbl>,\n    chars <chars> and",
             " integer 2 <= m <= 5" );
    fi;

    return
      RefinedSymmetrisations( tbl, chars, m, function(x,y) return x-y;end );
    end;
    

#############################################################################
##
#F  PrimeBlocks( <tbl>, <prime> )
#F  PrimeBlocks( <tbl>, <characters>, <prime> )
##
##  Two ordinary irreducible characters $\chi, \psi$ are said to lie in the
##  same block if the images of their central characters $\omega_{\chi},
##  \omega_{\psi}$ under the homomorphism $\ast: R \rightarrow R / M$ are
##  equal.  The central character is defined by
##  $\omega_{\chi}(g) = \chi(g) \|Cl_G(g)\| / \chi(1)$.
##  $R$ denotes the ring of algebraic integers in the complex numbers, $M$ is
##  a maximal ideal in $R$ with $pR \subseteq M$.  Thus $F = R/M$ is a field
##  of characteristics $p$.
##
##  $\chi$ and $\psi$ lie in the same block if and only if there is an integer
##  $n$ with the property $(\omega_{chi}(g) - \omega_{\psi}(g))^n \in pR$
##  (see~\cite{Isaacs}, p. 271).
##
##  Following the proof in~\cite{Isaacs}, a sufficient value for $n$ is
##  $\varphi(\|g\|)$.  The test must be performed only for one class of each
##  Galois family.
##
##  It is sufficient to test $p$-regular classes. (see Feit, p. 150)
##
##  Any character $\chi$ where $p$ does not divide $\|G\| / \chi(1)$
##  (such a character is called defect-zero-character) forms a block of its
##  own.
##
##  If 'InfoCharTable2 = Print', the defect of the blocks and the height
##  of the characters are printed\:
##  
##  For $\|G\| = p^a m$ where $p$ does not divide $m$, the defect of a block
##  is that $d$ where $p^{a-d}$ is the largest power of $p$ that divides all
##  degrees of the characters in the block.
##
##  The height of a $\chi$ is then the largest exponent $h$ where $p^h$
##  divides $\chi(1) / p^{a-d}$.
##
##  'PrimeBlocks' returns a record with fields 'block' and 'defect', both
##  lists, where 'block[i] = j' means that the 'i'--th character lies in the
##  'j'--th block, and 'defect[j]' is the defect of the 'j'--th block.
##
PrimeBlocks := function( arg )
    local i, j, x, tbl, characters, prime, nccl, classes, primeblocks,
          blockreps, exponents, families, representatives, sameblock,
          central, found, ppart, inverse, d, gcd, filt, pos;

    if not ( Length( arg ) in [ 2, 3 ] and IsCharTable( arg[1] ) and
             IsPrimeInt( arg[ Length( arg ) ] ) )
       or ( Length( arg ) = 3 and not IsList( arg[2] ) ) then
      Error( "usage: PrimeBlocks( <tbl>, <prime> )\n",
             "resp.  PrimeBlocks( <tbl>, <characters>, <prime> )" );
    fi;

    tbl:= arg[1];
    prime:= arg[ Length( arg ) ];
    characters:= tbl.irreducibles;
    nccl:= Length( characters[1] );
    classes:= tbl.classes;
    primeblocks:= rec( block:= [], defect:= [] );
    blockreps:= [];
    exponents:= [];
    for i in [ 2 .. nccl ] do exponents[i]:= Phi( tbl.orders[i] ); od;
    families:= GaloisMat( TransposedMat( characters ) ).galoisfams;
    representatives:= Filtered( [ 2 .. nccl ], x -> families[x] <> 0 );
               # only check one representative for each galois family
    ppart:= 1;
    d:= tbl.order / prime;
    while IsInt( d ) do
      ppart:= ppart * prime;
      d:= d / prime;
    od;
    
    # now 'a' is the exponent of the order of the 'prime' Sylow group of 'tbl'
    
    sameblock:= function( central1, central2 )
    local i, j, value, coeffs, n;
    for i in representatives do
      value:= central1[i] - central2[i];
      if IsInt( value ) then
        if value mod prime <> 0 then return false; fi;
      elif IsCyc( value ) then
        coeffs:= List( COEFFSCYC( value ), x -> x mod prime );
        value:= 0;
        n:= Length( coeffs );
        for j in [ 1 .. Length( coeffs ) ] do
          value:= value + coeffs[j] * E( n ) ^ ( j - 1 );
        od;
        if not IsCycInt( ( value ^ exponents[i] ) / prime ) then
          return false;
        fi;
      else
        return false;
      fi;
    od;
    return true;
    end;

    for i in [ 1 .. Length( characters ) ] do
      if characters[i][1] mod ppart = 0 then  # defect-0-character
        pos:= Position( characters, characters[i] );
        if pos = i then
          Add( blockreps, characters[i] );
          primeblocks.block[i]:= Length( blockreps );
        else
          primeblocks.block[i]:= primeblocks.block[ pos ];
        fi;
      else
        central:= [];                       # the central character
        for j in [ 2 .. nccl ] do
          central[j]:= classes[j] * characters[i][j] / characters[i][1];
          if not IsCycInt( central[j] ) then
            Error( "central character ", i,
                   " is not an algebraic integer at class ", j );
          fi;
        od;
        j:= 1;
        found:= false;
        while j <= Length( blockreps ) and not found do
          if sameblock( central, blockreps[j] ) then
            primeblocks.block[i]:= j;
            found:= true;
          fi;
          j:= j + 1;
        od;
        if not found then
          Add( blockreps, central );
          primeblocks.block[i]:= Length( blockreps );
        fi;
      fi;
    od;

    if not IsBound( tbl.irredinfo ) then tbl.irredinfo:= []; fi;
    for i in [ 1 .. Length( characters ) ] do
      if not IsBound( tbl.irredinfo[i] ) then tbl.irredinfo[i]:= rec(); fi;
      if not IsBound( tbl.irredinfo[i].pblock ) then
        tbl.irredinfo[i].pblock:= [];
      fi;
      tbl.irredinfo[i].pblock[ prime ]:= primeblocks.block[i];
    od;
    InfoCharTable2( "#I PrimeBlocks: prime blocks for prime ", prime,
                    " written to the table\n" );

    # compute the defects
    inverse:= InverseMap( primeblocks.block );
    for i in inverse do
      if IsInt( i ) then
        Add( primeblocks.defect, 0 );    # defect zero character
        if Length( arg ) = 2 then
          InfoCharTable2( "#I defect 0: X[", i, "]\n" );
        fi;
      else
        d:= ppart;
        for j in i do d:= GcdInt( d, characters[j][1] ); od;
        if d = ppart then
          d:= 0;
        else
          d:= Length( FactorsInt( ppart / d ) );              # the defect
        fi;
        Add( primeblocks.defect, d );
    
        if Length( arg ) = 2 and InfoCharTable2 = Print then
    
          # print defect and heights
          Print( "#I defect ", d, ";\n" );
    
          for j in [ 0 .. d ] do
            filt:= Filtered( i, x -> GcdInt( ppart, characters[x][1] )
                                     = ppart / prime^(d-j) );
            if filt <> [] then
              Print( "#I     height ", j, ": X", filt, "\n" );
            fi;
          od;
        fi;
      fi;
    od;

    if Length( arg ) = 3 then
      characters:= List( arg[2], x -> Position( tbl.irreducibles, x ) );
      if ForAll( characters, IsInt ) then
        primeblocks.block:= primeblocks.block{ characters };
      else
        Error( "the entries of 'arg[2]' must be irreducible characters" );
      fi;
    fi;
    
    return primeblocks;
    end;

#############################################################################
##
#F  IrreducibleDifferences( <tbl>, <reducibles>, <reducibles2> )
#F  IrreducibleDifferences( <tbl>, <reducibles>, <reducibles2>, <scprmatrix> )
#F  IrreducibleDifferences( <tbl>, <reducibles>, \"triangle\" )
#F  IrreducibleDifferences( <tbl>, <reducibles>, \"triangle\", <scprmatrix> )
##
##  returns the list of irreducible characters which occur as difference
##  of two elements of <reducibles> (if \"triangle\" is specified) or of
##  an element of <reducibles> and an element of <reducibles2>.
##
##  Let 'scpr' be the value of '<tbl>.operations.ScalarProduct'.
##
##  If <scprmatrix> is not specified it will be calculated,
##  otherwise we must have
##  $'<scprmatrix>[i][j] = scpr( <tbl>, <reducibles>[j], <reducibles>[i] )'$
##  resp.
##  $'<scprmatrix>[i][j] = scpr( <tbl>, <reducibles>[j], <reducibles2>[i] )'$.
##
IrreducibleDifferences := function( arg )
    local i, j, x, tbl, reducibles, irreducibledifferences, scprmatrix,
          reducibles2, diff, norms, norms2;

    if not ( Length( arg ) in [ 3, 4 ] and IsCharTable( arg[1] ) and
             IsList( arg[2] ) and ( IsList( arg[3] ) or IsString( arg[3] ) ) )
       or ( Length( arg ) = 4 and not IsList( arg[4] ) ) then
      Error( "usage: IrreducibleDifferences(tbl,reducibles,\"triangle\")\n",
      "resp.   IrreducibleDifferences(tbl,reducibles,\"triangle\",scprmat)",
      "\n resp.    IrreducibleDifferences(tbl,reducibles,reducibles2)\nresp.",
      "   IrreducibleDifferences(tbl,reducibles,reducibles2,scprmat)" );
    fi;
    tbl:= arg[1];
    reducibles:= arg[2];
    irreducibledifferences:= [];
    if IsString( arg[3] ) then           # "triangle"
      if Length( arg ) = 3 then
        scprmatrix:= MatScalarProducts( tbl, reducibles );
      else
        scprmatrix:= arg[4];
      fi;
      for i in [ 1 .. Length( scprmatrix ) ] do
        for j in [ 1 .. i-1 ] do
          if scprmatrix[i][i] + scprmatrix[j][j] - 2*scprmatrix[i][j] = 1 then
            if reducibles[i][1] > reducibles[j][1] then
              diff:= reducibles[i] - reducibles[j];
              InfoCharTable2( "#I IrreducibleDifferences: X[",i, "] - X[",j,
                              "] found\n" );
            else
              diff:= reducibles[j] - reducibles[i];
              InfoCharTable2( "#I IrreducibleDifferences: X[",j, "] - X[",i,
                              "] found\n" );
            fi;
            AddSet( irreducibledifferences, diff );
          fi;
        od;
      od;
    else                     # not "triangle"
      reducibles2:= arg[3];
      if Length( arg ) = 3 then
        scprmatrix:= MatScalarProducts( tbl, reducibles, reducibles2 );
      else
        scprmatrix:= arg[4];
      fi;
      norms := List( reducibles , x->tbl.operations.ScalarProduct(tbl,x,x) );
      norms2:= List( reducibles2, x->tbl.operations.ScalarProduct(tbl,x,x) );
      for i in [ 1 .. Length( norms ) ] do
        for j in [ 1 .. Length( norms2 ) ] do
          if norms[i] + norms2[j] - 2 * scprmatrix[i][j] = 1 then
            if reducibles[j][1] > reducibles2[i][1] then
              diff:= reducibles[j] - reducibles2[i];
              InfoCharTable2( "#I IrreducibleDifferences: X[",j, "] - Y[",i,
                              "] found\n" );
            else
              diff:= reducibles2[i] - reducibles[j];
              InfoCharTable2( "#I IrreducibleDifferences: Y[",i, "] - X[",j,
                              "] found\n" );
            fi;
            AddSet( irreducibledifferences, diff );
          fi;
        od;
      od;
    fi;
    return irreducibledifferences;
    end;

##############################################################################
##  
#F  CoefficientTaylorSeries( <numer>, <r>, <k>, <i> )
##  
##  returns the coefficient of $z^i$ in the Taylor series expansion of
##  the quotient of polynomials $p(z) / ( 1 - z^{<r>} )^{<k>}$, where <numer>
##  is the coefficients list of the numerator polynomial $p(z)$.
##  
##  We have
##  \[ \frac{1}{( 1 - x )^k} =
##        \frac{1}{(k-1)!} \frac{d^{k-1}}{dx^{k-1}} \frac{1}{1-x}
##     \mbox{\rm\ where\ } 
##     \frac{1}{1 - x} = \sum_{j=0}^{\infty} x^j\ . \]
##  Thus we get
##  \[ \frac{c_i z^i}{( 1 - z^r )^k} =
##     \sum_{j=0}^{\infty} c_i \frac{(j+k-1)!}{(k-1)! j!} z^{r j + i}. \]
##  
##  For $p(z) = \sum_{i=0}^m c_i z^i$ where $m = u r + n$ with $0\leq n \< r$
##  we have
##  \[ \frac{p(z)}{( 1 - z^r )^k} =
##        \frac{1}{(k-1)!}\sum_{i=0}^m\sum_{j=0}^{\infty} 
##            c_i \frac{(j+k-1)!}{(k-1)! j!} z^{r j + i}. \]
##  
##  The coefficient of $z^l$ with $l = g r + v$, $0\leq v \< r$ is
##  \[ \sum_{j=0}^{\min\{g,u\}} c_{j r + v}
##                 \prod_{\mu=1}^{k-1} \frac{g-j+\mu}{\mu}\ . \]
##  
CoefficientTaylorSeries := function( numer, r, k, l )

    local i, m, u, v, g, coeff, lower, summand, mu;

    m:= Length( numer ) - 1;
    u:= Int( m / r );
    v:= l mod r;
    g:= Int( l / r );

    coeff:= 0;
    
    # lower bound for the summation
    if u > g then
      lower:= u-g;
    else
      lower:= 0;
    fi;

    for i in [ lower .. u ] do

      if IsBound( numer[ (u-i)*r + v + 1 ] ) then

        summand:= numer[ (u-i)*r + v + 1 ];
        for mu in [ 1 .. k-1 ] do
          summand:= summand * ( i - u + g + mu ) / mu; 
        od;
        coeff:= coeff + summand;
  
      fi;

    od;

    return coeff;
    end;

##############################################################################
##  
#F  SummandMolienSeries( <tbl>, <psi>, <chi>, <i> )
##  
##  returns the summand of the Molien series of <tbl> for characters <psi>
##  and <chi> that corresponds to class <i>, that is, the quotient
##  \[ \frac{\chi(g) \det(D(g))}{\det(z I - D(g))} \]
##  where $g$ is in class <i>, $D$ is a representation with character <psi>,
##  and $z$ is the indeterminate.
##  
##  The result is a record with components 'numer' and 'a', with the
##  following meaning.
##  
##  Write the denominator as a product of cyclotomic polynomials, 
##  encode this as a list 'a' where at position $r$ the multiplicity
##  of the $r$-th cyclotomic polynomial $\Phi_r$ is stored.
##  (For that, we possibly must change the numerator.)
##  We get
##  \[ \frac{1}{\det(z I - D(g))}
##               = \frac{P(z)}{\prod_{d\mid n} \Phi_d^{a_d}(z)} \ . \]
##  
SummandMolienSeries := function( tbl, psi, chi, i )

    local x,          # indeterminate
          ev,         # eigenvalues of 'psi' at class 'i'
          n,          # element order of class 'i'
          e,          # 'E(n)'
          numer,      # numerator in summands corresp. to 'i'-th class
          div,        # divisors of 'n'
          a,          # multiplicities of cycl. pol. in the denominator
          d,          # loop over 'div'
          roots,      # exponents of 'd'-th prim. roots
          r;          # loop over 'roots'

    x  := X( Cyclotomics );
    ev := Eigenvalues( tbl, psi, i );
    n  := Length( ev );
    e  := E(n);

    # numerator of summands corresponding to 'i'-th class
    numer:= chi[i] * e ^ ( Sum( [ 1 .. n ], i -> i * ev[i] ) mod n ) * x^0;

    div:= DivisorsInt( n );
    RemoveSet( div, 1 );
    a:= List( [ 1 .. n ], x -> 0 );
    a[1]:= ev[n];

    for d in div do

      # compute $a_d$, that is, the maximal multiplicity of 'ev[k]'
      # for all 'k' with $\gcd(n,k) = n / d$.
      roots:= ( n / d ) * PrimeResidues( d );
      a[d]:= Maximum( ev{ roots } );
      for r in roots do
        numer:= numer * ( x - e ^ r ) ^ ( a[d] - ev[r] );
      od;

    od;

    return rec( numer := numer,
                a     := a );
    end;

##############################################################################
##  
#F  MolienSeries( <psi> )
#F  MolienSeries( <psi>, <chi> )
#F  MolienSeries( <tbl>, <psi> )
#F  MolienSeries( <tbl>, <psi>, <chi> )
##  
##  returns a record that describes the series
##  \[ M_{\psi,\chi}(z) = \sum_{d=0}^{\infty} (\chi,\psi^{[d]}) z^d \]
##  where $\psi^{[d]}$ denotes the symmetrization of $\psi$ with the trivial
##  character of the symmetric group $S_d$ (see "SymmetricParts").
##  
##  <psi> and <chi> must be characters of the table <tbl>,
##  the default for $\chi$ is the trivial character.
##  If no character table is given, <psi> and <chi> must be class function
##  recods.
##  
##  \vspace{3mm}
##  
#F  ValueMolienSeries( <series>, <i> )
##  
##  returns the <i>-th coefficient of the Molien series <series>.
##  
##  |     gap> psi:= Irr( CharTable( "A5" ) )[3];
##       Character( CharTable( "A5" ),
##          [ 3, -1, 0, -E(5)^2-E(5)^3, -E(5)-E(5)^4 ] )
##       gap> mol:= MolienSeries( psi );;
##       gap> List( [ 1 .. 10 ], i -> ValueMolienSeries( mol, i ) );
##       [ 0, 1, 0, 1, 0, 2, 0, 2, 0, 3 ] |
##  
##  The record returned by 'MolienSeries' has components
##  
##  'summands': \\ a list of records with components 'numer', 'r', and 'k',
##                 describing the summand $'numer' / (1-z^r)^k$,
##  
##  'size':     \\ the 'size' component of the character table,
##  
##  'degree':   \\ the degree of <psi>.
##  
MolienSeries := function( arg )

    local tbl,        # character table, first argument
          psi,        # character of 'tbl', second argument
          chi,        # character of 'tbl', optional third argument
          numers,     # list of numerators   of sum of polynomial quotients
          denoms,     # list of denominators of sum of polynomial quotients
          x,          # indeterminate
          classes,    # list of classes of 'tbl' that are not yet used
          sub,        # classes that belong to one cyclic subgroup
          i,          # represenative of 'sub'
          n,          # element order of class 'i'
          summand,    #
          numer,      # numerator in summands corresp. to 'i'-th class
          div,        # divisors of 'n'
          a,          # multiplicities of cycl. pol. in the denominator
          d,          # loop over 'div'
          r,          # loop over 'roots'
          f,          # 'CF( n )'
          special,    # parameters of special factor in the denominator
          dd,         # loop over divisors of 'd'

          p, q, j, F,

          pol, qr, num,
          pos,
          denpos,
          repr,
          series;     # Molien series record, result


    # Check and get the arguments.
    if   Length( arg ) = 1 and IsClassFunction( arg[1] ) then
      tbl:= CharTable( arg[1].source );
      psi:= arg[1].values;
      chi:= List( psi, x -> 1 );
    elif Length( arg ) = 2 and IsClassFunction( arg[1] )
                           and IsClassFunction( arg[2] ) then
      tbl:= CharTable( arg[1].source );
      psi:= arg[1].values;
      chi:= List( arg[2].values, x -> 1 );
    elif Length( arg ) = 2 and IsCharTable( arg[1] )
                           and IsList( arg[2] ) then
      tbl:= arg[1];
      psi:= arg[2];
      chi:= List( psi, x -> 1 );
    elif Length( arg ) = 3 and IsCharTable( arg[1] )
                           and IsList( arg[2] )
                           and IsList( arg[3] ) then
      tbl:= arg[1];
      psi:= arg[2];
      chi:= arg[3];
    else
      Error( "usage: MolienSeries( [<tbl>,] <psi> [, <chi>] )" );
    fi;

    # Initialize lists of numerators and denominators
    # of summands of the form $p_j(z) / (z^r-1)^k$.
    # In 'numers[ <j> ]' the coefficients list of $p_j(z)$ is stored,
    # in 'denoms[ <j> ]' the pair '[ r, k ]'.
    # 'pol' is an additive polynomial.
    numers:= [];
    denoms:= [];
    x:= X( Rationals );
    pol:= 0 * x;

    classes:= [ 1 .. Length( tbl.classes ) ];

    # Take the cyclic subgroups of 'tbl'.
    while Length( classes ) <> 0 do

      # Compute the next cyclic subgroup,
      # remove the classes of the cyclic subgroup,
      # take a representative.
      sub:= ClassOrbitCharTable( tbl, classes[1] );
      SubtractSet( classes, sub );
      i:= sub[1];

      # Compute $v(g) = \frac{\chi(g) \det(D(g))}{\det(z I - D(g))}$
      # for $g$ in class 'i'.

      # This is encoded as record with components 'numer' and 'a'
      # where 'a[r]' means the multiplicity of the 'r'-th cyclotomic
      # polynomial in the denominator.
      n:= tbl.orders[i];
      summand:= SummandMolienSeries( tbl, psi, chi, i );
      numer:= summand.numer;
      a:= summand.a;
  
      # Compute the sum over class representatives of the cyclic
      # subgroup containing $g$, i.e., the relative trace of $v(g)$.
      f:= CF( n );
      numer:= Polynomial( Rationals,
                          List( numer.coefficients,
                                y -> Trace( f, y ) ) *
                          ( Length( sub ) / Phi(n) ),
                          numer.valuation );
  
      # Try to reduce the number of factors in the denominator
      # by forming one factor of the form $(z^r - 1)^k$.
      # But we still want to guarantee that the factors are pairwise
      # coprime, that is, the exponents of all involved cyclotomic
      # polynomials must be equal.

      special:= false;

      if a[1] > 0 then

        # There is such a ``special\'\' factor.

        div:= DivisorsInt( n );
        for d in Reversed( div ) do
  
          if a[1] <> 0 and ForAll( DivisorsInt(d), y -> a[y] = a[1] ) then
  
            # The special factor is $( z^d - 1 ) ^ a[d]$.
            special:= [ d, a[d] ];
            for dd in DivisorsInt( d ) do
              a[dd]:= 0;
            od;
  
          fi;

        od;

      fi;

      # Compute the product of the remaining polynomials in the denominator.
      F:= x^0;
      for j in [ 1 .. n ] do
        if a[j] <> 0 then
          F:= F * CyclotomicPolynomial( Rationals, j ) ^ a[j];
        fi;
      od;

      if special <> false then

        # Split the summand into two summands, with denominators
        # the special factor 'f' resp. the remaining factors 'F'.
        f:= ( x ^ special[1] - 1 ) ^ special[2];
        repr:= GcdRepresentation( F, f );

        # Reduce the numerators if possible.
        num:= numer * repr[1];
        if Degree( num ) > special[1] * special[2] then
          qr:= QuotientRemainder( num, f );
          pol:= pol + qr[1];
          num:= qr[2];
        fi;
          
        # Store the summand.
        denpos:= Position( denoms, special );
        if denpos = false then
          Add( denoms, special );
          Add( numers, tbl.classes[i] * num );
        else
          numers[ denpos ]:= numers[ denpos ] + tbl.classes[i] * num;
        fi;

        # The remaining term is 'numer \* repr[2] / F'.
        numer:= numer * repr[2];
        
      fi;

      # Split the quotient into a sum of quotients whose denominators are
      # cyclotomic polynomials.

      # We have $1 / \prod_{i=1}^k f_i = \sum_{i=1}^k p_i / f_i$
      # if the $f_i$ are pairwise coprime,
      # where the polynomials $p_i$ are computed by
      # $r_i \prod_{j>i} f_j + q_i f_i = 1$ for $1 \leq i \leq k-1$,
      # $r_k = 1$, and $p_i = r_i \prod_{j=1}^{i-1} q_j$.

      # In the end we have a sum of quotients with denominator of the
      # form $(z^r-1)^k$.  We store the pair $[ r, k ]$ in the list
      # 'denoms', and $(-1)^k$ times the numerator in the list 'numers'.

      pos:= 1;
      while pos <= n and a[ pos ] = 0 do
        pos:= pos + 1;
      od;

      q:= 1;

      while pos <= n do

        if a[ pos ] <> 0 then

          # $f_i$ is the next factor encoded in 'a'.
          f:= CyclotomicPolynomial( Rationals, pos ) ^ a[ pos ];
          F:= F / f;

          # $\prod_{j>i} f_j$ is stored in 'F', and $f_i$ is in 'f'.

          # at first position $r_i$, at second position $q_i$
          repr:= GcdRepresentation( F, f );

          # The numerator $p_i$.
          p:= q * repr[1];
          q:= q * repr[2];

          # We blow up the denominator $f_i$, and encode the summands.
          dd:= DivisorsInt( pos );
          RemoveSet( dd, pos );
          for r in dd do
            p:= p * CyclotomicPolynomial( Rationals, r ) ^ a[ pos ];
          od;

          # Reduce the numerators if possible.
          num:= numer * p;
          if Degree( num ) > pos * a[ pos ] then
            qr:= QuotientRemainder( num, (x^pos - 1)^a[pos] );
            pol:= pol + qr[1];
            num:= qr[2];
          fi;
          
          # Store the summand.
          denpos:= Position( denoms, [ pos, a[ pos ] ] );
          if denpos = false then
            Add( denoms, [ pos, a[ pos ] ] );
            Add( numers, tbl.classes[i] * num );
          else
            numers[ denpos ]:= numers[ denpos ] + tbl.classes[i] * num;
          fi;

        fi;

        pos:= pos + 1;

      od;

    od;
  
    # Now compute the Taylor series for each summand.
    series:= List( [ 1 .. Length( numers ) ],
                   i -> rec( numer :=
          ShiftedCoeffs( numers[i].coefficients, numers[i].valuation ),
                             r     := denoms[i][1],
                             k     := denoms[i][2] ) );
    for i in [ 1 .. Length( series ) ] do

      if   Length( series[i].numer ) = 0 then

        # Remove summands with zero numerator.
        Unbind( series[i] );
      elif series[i].k mod 2 = 1 then

        # Replace denominators $(z^r - 1)^k$ by $(1 - z^r)^k$.
        series[i].numer:= - series[i].numer;
      fi;
    od;

    numers:= [];
    for i in series do
      Add( numers, i );
    od;

    pol:= ShiftedCoeffs( pol.coefficients, pol.valuation );

    return rec( summands := numers,
                size     := tbl.size,
                degree   := psi[1],
                pol      := pol        );

    end;

############################################################################
##
#F  ValueMolienSeries( series, i )
##
##  returns the <i>-th coefficient of Molien series <series>.
##
ValueMolienSeries := function( series, i )

    local value,
          summand;
    
    value:= 0;
    for summand in series.summands do
      value:= value
         + CoefficientTaylorSeries( summand.numer, summand.r, summand.k, i );
    od;

    # There is a factor $\frac{(-1)^{\psi(1)}}{\|G\|}$.
    if series.degree mod 2 = 1 then
      value:= -value;
    fi;
    value:= value / series.size;

    # There may be an influence of the polynomial summand.
    if i < Length( series.pol ) then
      value:= value + series.pol[ i+1 ];
    fi;

    return value;
    end;

