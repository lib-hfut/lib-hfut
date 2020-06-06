#############################################################################
##
#A  algmat.g                    GAP library                     Thomas Breuer
##
#A  @(#)$Id: algmat.g,v 3.0.1.1 1994/09/02 12:52:09 sam Rel $
##
#Y  Copyright 1990-1993,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains those functions that mainly deal with matrix algebras.
##
#H  $Log: algmat.g,v $
#H  Revision 3.0.1.1  1994/09/02  12:52:09  sam
#H  changed 'DeterminantMat' to 'Determinant'
#H
#H  Revision 3.0  1994/05/19  13:16:11  sam
#H  Initial Revision under RCS
#H
##

#T Was aus 'MatrixRingOps' geh"ort hier rein?

#############################################################################
##
#F  IsMatAlgebra( <obj> ) . . . . . . . test if an object is a matrix algebra
##
IsMatAlgebra := function( obj )
    return IsRec( obj )
           and IsBound( obj.isMatAlgebra )
           and obj.isMatAlgebra;
    end;

#############################################################################
##
#V  MatAlgebraOps . . . . .  operations record for matrix algebra subcategory
##
##  'MatAlgebraOps' is the operations record for matrix algebras. It contains
##  the domain functions,  e.g., 'Size'  and  'Intersection', and the algebra
##  functions.
##
##  'MatAlgebraOps' is  initially a copy of  'AlgebraOps', and thus  inherits
##  the default algebra functions.
##
MatAlgebraOps := OperationsRecord( "MatAlgebraOps", AlgebraOps );

#############################################################################
##
#F  MatAlgebraOps.IsFinite( <A> ) . . . .  test if a matrix algebra is finite
##
##  <A> is finite if and only if it is trivial or if the coefficient field is
##  finite, since a finite coefficient field implies nonzero characteristic
##  for the generating matrices.
##
MatAlgebraOps.IsFinite := function( A )
    return    Length( A.generators ) = 0
           or IsFinite( A.field )
           or ForAll( A.generators, x -> IsZero( A, x ) );
    end;

#############################################################################
##
#F  MatAlgebraOps.IsUnit( <A>, <m> ) . . .  test if a matrix is a unit in <A>
##
MatAlgebraOps.IsUnit := function ( A, m )
    return     Determinant( m ) <> 0
           and m^-1 in A;
    end;

#############################################################################
##
#F  MatAlgebraOps.Quotient := function ( A, m, n )
##
MatAlgebraOps.Quotient := function ( A, m, n )
    if RankMat( n ) = Length( n )  then
      return m / n;
    else
      Error( "<n> must be invertible" );
    fi;
    end;

#############################################################################
##
#F  MatAlgebraOps.IsZero( <A>, <obj> )
##
##  For a test we must construct a zero vector.
##  Since we can construct a zero matrix that needs roughly the same space
##  as this vector we can store this zero matrix.
##
MatAlgebraOps.IsZero := function( A, obj )

    local zerovec;

    zerovec:= obj[1] - obj[1];
    A.zero:= List( zerovec, x -> zerovec );
    return obj = A.zero;
    end;

#############################################################################
##
#F  MatAlgebraOps.One( <A> )
##
##  returns the multiplicative identity of <A> if this exists, otherwise
##  'false'.
##
##  Let $(b_1, b_2, \ldots, b_n)$ be a basis of $A$, and $e$ the result of
##  'One( <A> )'.
##  Then $e = \sum_{i=1}^n a_i b_i$, and for $1 \leq k \leq n$ we have
##  $b_k \cdot e = b_k$, or equivalently
##  $\sum_{i=1}^n a_i b_i \cdot b_k = b_k$.
##  Define the structure constants by
##  $b_k \cdot b_i = \sum_{m=1}^n c_{mki} b_m$.
##
##  Then $\sum_{m=1}^n \left( \sum_{i=1}^n a_i c_{mki} \right) b_m = b_k$
##  for $1 \leq k \leq n$, that is,
##  $\sum_{i=1}^n a_i c_{mki} = \delta_{mk}$.
##
##  This yields $n^2$ linear equations for the $n$ indeterminates $a_i$,
##  and a solution is the (unique) right identity.
##  The same process for the conditions $e \cdot b_k = b_k$ for all $k$
##  yields equations whose solution is the (unique) left identity.
#T Is this necessary?
##
MatAlgebraOps.One := function( A )

    local b,       # base of 'A'
          equ,     # equation system to solve
          zerovec, # zero vector
          vec,     # right hand side of the equation system
          k,       # loop over 'b'
          i,       # loop over rows of 'equ'
          sol,     # solution vector
          one;     # result

    b:= Basis( A ).vectors;

    # Set up the equation system.
    equ:= List( b, x -> Coefficients( A.basis, b[1] * x ) );
    zerovec:= 0 * equ[1];
    vec:= ShallowCopy( zerovec );
    vec[1]:= A.field.one;
    for k in [ 2 .. Length( b ) ] do
      for i in [ 1 .. Length( equ ) ] do
        Append( equ[i], Coefficients( A.basis, b[k] * b[i] ) );
      od;
      Append( vec, ShallowCopy( zerovec ) );
      vec[ (k-1)*Length(b) + k ]:= A.field.one;
    od;

    sol:= SolutionMat( equ, vec );
    if sol = false then
      one:= sol;
    else

      one:= Zero( A );
      for i in [ 1 .. Length( sol ) ] do
        if sol[i] <> A.field.zero then
          one:= one + sol[i] * b[i];
        fi;
      od;

      if ForAny( A.generators, x -> one * x <> x ) then
        one:= false;
      fi;

    fi;

    return one;
    end;

#############################################################################
##
#F  Fingerprint( <A> ) . . . . . . . . . . . . . . fingerprint of algebra <A>
#F  Fingerprint( <A>, <list> ) . . . . . . . . . . fingerprint of algebra <A>
##
##  If there is only one argument then the standard fingerprint is computed.
##  This works for two-generator algebras acting only.
##
Fingerprint := function( arg )

    # Check the arguments.
    if Length( arg ) = 0 or Length( arg ) > 2
                         or not IsMatAlgebra( arg[1] ) then
      Error( "usage: Fingerprint( <matalg> [, <list> ] )" );
    fi;

    if   Length( arg ) = 2 then

      return arg[1].operations.Fingerprint( arg[1], arg[2] );

    elif Length( arg ) = 1 and Length( arg[1].generators ) = 2 then

      if not IsBound( arg[1].fingerprint ) then
        arg[1].fingerprint:=
                        arg[1].operations.Fingerprint( arg[1], "standard" ); 
      fi;
      return arg[1].fingerprint;

    else
      Error( "number of generating matrices must be 2" );
    fi;
    end;

#############################################################################
##
#F  Nullity( <mat> )
##
Nullity := function( mat )
    return Dimensions( BaseNullspace( mat ) )[1];
    end;

#############################################################################
##
#F  MatAlgebraOps.Fingerprint( <A>, <list> )  . . fingerprint of algebra <A>
##
MatAlgebraOps.Fingerprint := function( A, list )

    local fp,     # fingerprint, result
          a,      # first generator
          b,      # second generator
          ab,     # product of 'a' and 'b'
          word;   # actual word

    if list = "standard" then

      # Compute the nullities of the 6 standard elements.
      fp:= [];
      a:= A.generators[1];
      b:= A.generators[2];
      ab:= a * b;
      word:= ab + a + b;    fp[1]:= Nullity( word );
      word:= word + ab * b; fp[2]:= Nullity( word );
      word:= a + b * word;  fp[3]:= Nullity( word );
      word:= b + word;      fp[4]:= Nullity( word );
      word:= ab + word;     fp[5]:= Nullity( word );
      word:= a + word;      fp[6]:= Nullity( word );
      
    else

      # Compute the nullities of the words with numbers in the list.
      fp:= List( list, x -> Nullity( ElementAlgebra( A, x ) ) );

    fi;
    return fp;
    end;

#############################################################################
##
#F  MatAlgebraOps.Operation( <A>, <M>, <opr> )
#F  MatAlgebraOps.Operation( <A>, <B>, <opr> )
##
##  returns the matrix algebra representation of the action of <A>
##  on the module <M> resp. with respect to the basis <B> of an <A>-module.
##
##  Let <M> be a quotient $U / V$ where $U$ and $V$ are submodules of the
##  natural module for <A>.
##
MatAlgebraOps.Operation := function( A, M, opr )

    local opr,       # the unital algebra
          nooneopr;  # the operation of 'A', result

    # This seems to be the more usual case.
    opr:= UnitalMatAlgebraOps.Operation( A, M, opr );

    # Remove the knowledge of the identity matrix.
    if not IsNullAlgebra( opr ) then
      nooneopr:= Algebra( opr.field, opr.generators );
      nooneopr.operation:= opr.operation;
    fi;

    # Return the algebra.
    return opr;
    end;

#############################################################################
##
#F  MatAlgebraOps.RepresentativeOperation( <A>, <v>, <w>, <opr> )
##
##  Let $A$ be a matrix algebra over the field $F$, $v$ and $w$ vectors in
##  the natural module.  Compute an element of $A$ that maps $v$ to $w$.
##
##  We compute the coefficients $a_i$ in the equation system
##  $\sum_{i=1}^n a_i ( v \cdot b_i ) = w$ where $b_i$ runs over a vector
##  space base of $A$.
##
##  For a tuple $(v_1, \ldots, v_k)$ of vectors we simply replace $v b_i$ by
##  the concatenation of the $v_j b_i$ for all $j$, and replace $w$ by the
##  concatenation $(w_1, \ldots, w_k)$, and solve this system.
##
MatAlgebraOps.RepresentativeOperation := function( A, v, w, opr )

    local B,      # basis of 'A'
          mat,    # matrix of the equation system
          a,      # coefficients of solution w.r. to 'B'
          i,      # loop over 'a'
          j,      # loop over vectors in 'v'
          repr;   # representative, result

    B:= Basis( A );
    if Length( B.vectors ) = 0 then
      if w = 0 * w then
        return Zero( A );
      else
        return false;
      fi;
    fi;

    if   opr = OnPoints or opr = OnRight then

      # Compute the matrix of the equation system, \ldots
      mat:= List( B.vectors, x -> v * x );

      # \ldots the coefficient vector $a$, \ldots
      a:= SolutionMat( mat, w );

    elif opr = OnTuples or opr = OnPairs then

      # Compute the matrix of the equation system, \ldots
      mat:= [];
      for i in B.vectors do
        mat[i]:= [];
        for j in [ 1 .. Length( v ) ] do
          Append( mat[i], v[j] * i );
        od;
      od;

      # \ldots the coefficient vector $a$, \ldots
      a:= SolutionMat( mat, Concatenation( w ) );

    else
#T !!!
      Error( "sorry, this operation is not yet supported" );
    fi;

    # \ldots and the representative.
    i:= 1;
    while i <= Length( a ) and a[i] = A.field.zero do i:= i+1; od;
    if i > Length( a ) then
      repr:= Zero( A );
    else
      repr:= a[i] * B.vectors[i];
    fi;
    for j in [ i+1 .. Length( a ) ] do
      if a[j] <> A.field.zero then
        repr:= repr + a[j] * B.vectors[j];
      fi;
    od;

    # Return the result.
    return repr;
    end;

#############################################################################
##
#V  BasisMatAlgebraOps
##
##  This is the operations record for an arbitrary basis of a matrix algebra.
##  It mainly delegates the work to a basis with nicer properties.
##
##  The functions 'Print', 'Coefficients', 'SiftedVector' are the same as
##  those for row spaces.
##
BasisMatAlgebraOps := OperationsRecord( "BasisMatAlgebraOps",
                                        BasisRowSpaceOps );

#############################################################################
##
#F  BasisMatAlgebraOps.IsSemiEchelonBasis( <B> )
##
##  Check whether the first nonzero entry in every row is equal to one,
##  and that all entries below the pivots are zero.
##
BasisMatAlgebraOps.IsSemiEchelonBasis := function( B )

    local mats,     # vectors of 'B'
          zero,     # zero of the field
          one,      # one of the field
          nmats,    # number of basis vectors
          dim,      # dimension of matrices
          heads,    # list of pivot rows
          ishead,   # boolean list of pivot columns
          i,        # loop over rows
          j,        # pivot column
          k,        # loop over lower rows
          row;      #

    mats  := B.vectors;
    nmats := Length( mats );
    heads := [ [] ];
    ishead:= [ [] ];

    if nmats > 0 then

      zero   := 0 * mats[1][1][1];
      one    := zero ^ 0;
      dim    := Length( mats[1] );
      ishead := List( [ 1 .. dim ], x -> BlistList( [ 1 .. dim ], [] ) );
      heads  := List( [ 1 .. dim ], x -> [] );

      # Loop over the columns.
      for i in [ 1 .. nmats ] do
  
        # Get the pivot.
        row:= 1;
        j:= DepthVector( mats[i][row] );
        while j > dim and row < dim do
          row:= row + 1;
          j:= DepthVector( mats[i][row] );
        od;

        if row > dim or mats[i][ row ][j] <> one then

          # No nonzero entry, or pivot is not 'one'.
          return false;
        fi;

        for k in [ i+1 .. nmats ] do
          if mats[k][ row ][j] <> zero then
            return false;
          fi;
        od;
        ishead[ row ][j] := true;
        heads[ row ][j]  := i;
  
      od;

    fi;
        
    # Now we know that the basis is semi-echelonized.
    # Change the basis record appropriately.
    B.heads      := heads;
    B.ishead     := ishead;
    B.operations := SemiEchelonBasisMatAlgebraOps;

    return true;
    end;

##############################################################################
##
#F  MatAlgebraOps.Basis( <V> )
#F  MatAlgebraOps.Basis( <V>, <vectors> )
##
MatAlgebraOps.Basis := function( arg )

    if   Length( arg ) = 1 then
      return SemiEchelonBasis( arg[1] );
    elif not IsList( arg[2] ) then
      Error( "second argument must be a list of basis vectors" );
    else
      return rec( isBasis   := true,
                  vectors   := arg[2],
                  structure := arg[1],
                  operations := BasisMatAlgebraOps );
    fi;
    end;

#############################################################################
##
#V  SemiEchelonBasisMatAlgebraOps
##
##  A basis is in semi-echelon form if the leading entry of every row is 1,
##  and all entries exactly below that 1 are zero.
##
SemiEchelonBasisMatAlgebraOps :=
          OperationsRecord( "SemiEchelonBasisMatAlgebraOps",
                            BasisMatAlgebraOps );

#############################################################################
##
#F  SemiEchelonBasisMatAlgebraOps.Print( <obj> )
##
SemiEchelonBasisMatAlgebraOps.Print := SemiEchelonBasisRowSpaceOps.Print;

#############################################################################
##
#F  SemiEchelonBasisMatAlgebraOps.SiftedVector( <B>, <v> )
##
##  If '<B>.ishead[<i>][<j>]' is true this means that the entry in the <i>-th
##  row and <j>-th column is leading entry of the '<B>.heads[<i>][<j>]'-th
##  vector in the basis.
##
SemiEchelonBasisMatAlgebraOps.SiftedVector := function( B, v )

    local zero,   # zero of the field
          i, j;   # loop over rows and columns

    zero:= 0 * v[1][1];

    # Compute the coefficients of the B vectors.
    for i in [ 1 .. Length( B.heads ) ] do
      for j in [ 1 .. Length( B.heads[i] ) ] do
        if B.ishead[i][j] and v[i][j] <> zero then
          v:= v - v[i][j] * B.vectors[ B.heads[i][j] ];
        fi;
      od;
    od;

    # Return the remainder.
    return v;
    end;

#############################################################################
##
#F  SemiEchelonBasisMatAlgebraOps.Coefficients( <B>, <v> )
##
SemiEchelonBasisMatAlgebraOps.Coefficients := function( B, v )

    local coeff,  # coefficients list, result
          zero,   # zero of the field
          len,    # length of 'v'
          i, j;   # loop over rows and columns

    # Preset the coefficients list with zeroes.
    zero:= 0 * v[1][1];
    coeff:= [];
    for i in [ 1 .. Length( B.vectors ) ] do
      coeff[i]:= zero;
    od;

    # Compute the coefficients of the base vectors.
    len:= Length( v );
    for i in [ 1 .. Length( B.heads ) ] do
      j:= DepthVector( v[i] );
      while j <= len do
        if B.ishead[i][j] and v[i][j] <> zero then
          coeff[ B.heads[i][j] ]:= v[i][j];
          v:= v - v[i][j] * B.vectors[ B.heads[i][j] ];
        else
          return false;
        fi;
        j:= DepthVector( v[i] );
      od;
    od;

    # Return the coefficients.
    return coeff;
    end;

#############################################################################
##
#V  StandardBasisMatAlgebraOps
##
##  We need the functions 'Print', 'SiftedVector', 'Coefficients',
##  and the right functions are already in 'StandardBasisModuleOps'.
##
StandardBasisMatAlgebraOps :=
          OperationsRecord( "StandardBasisMatAlgebraOps", 
                            StandardBasisModuleOps );

#############################################################################
##
#F  MatAlgebraOps.StandardBasis( <A> )
##
##  Let $A$ be a matrix algebra over the field $F$.
##
##  Define $A_i$ to be the linear space generated by all words of length at
##  most $i$, in terms of the generators of $A$.
##  (The identity matrix is not a word of length zero, it need not be
##  contained in the algebra at all.)
##
##  Then $\{ 0 \} = A_0 <leq A_1 \leq \ldots \ldots A_k = A$ for $k$
##  sufficiently large.
##
##  We are interested in computing a vector space base.  For $i > 0$,
##  every element of $A_{i+1}$ is a sum of products of elements in $A_i$ with
##  generators, so if we have a base $B_i$ of $A_i$, and compute a base of
##  the space generated by the products $b g$ where $b$ ranges over $B_i$,
##  and $g$ ranges over the generators of $A$, we get a base of $A_{i+1}$.
##
##  The base will be in semi-echelon form.
##
##  Additionally this function stores components 'freeAlgebra' and
##  'basewords'.
##  This can be used to express every algebra element in terms of the
##  generators, and compute preimages under homomorphisms.
##
MatAlgebraOps.StandardBasis := function( A )

    local zero,      # zero of the field
          n,         # dimension of matrices
          base,      # list of matrices in the standard base
          ech,       # list of matrices in the echelonized base
          heads,     # list with info about leading entries
          ishead,    # boolean list with info about leading entries
          found,     # flag: Has a new base vector been found?
          g,         # loop over generators of 'A'
          b,         # loop over base vectors
          new,       # one product
          expr,      # actual expression for 'new'
          orig,      # candidate for base vector
          origword,  # corresponding expression
          row,       # loop over rows of the matrix
          col,       # loop over columns of the matrix
          F,         # free algebra
          basewords, # list of expressions for 'base' vectors in terms of 'F'
          echwords,  # list of expressions for 'ech'  vectors in terms of 'F'
          i, k,      # loop over generators and base
          zeromat,   # zero matrix
          B;         # the basis record, result

    zero:= A.field.zero;

    if Length( Parent( A ).generators ) = 0 then
      n:= Length( Zero( Parent( A ) ) );
    else
      n:= Length( Parent( A ).generators[1] );
    fi;

    base := [];
    ech  := [];
    heads:= List( [ 1 .. n ], x -> [] );
    ishead:= List( [ 1 .. n ], x -> BlistList( [ 1 .. n ], [] ) );

    # The generators of the free algebra correspond to the generators of 'A'.
    F:= FreeAlgebra( A.field, Length( A.generators ) );
    basewords:= [];
    echwords:=  [];

    # Compute a basis for $A_1$.
    for i in [ 1 .. Length( A.generators ) ] do

      new:= A.generators[i];
      orig:= new;
      expr:= F.generators[i];
      origword:= expr;

      # Reduce the matrix modulo 'ech'.
      row:= 1;
      col:= 1;
      while row <= n and col <= n do
      
        # Get the first nonzero column.
#T use DepthVector ( see UMAOps )
        while row <= n and col <= n and new[row][col] = zero do
          if col = n then
            row:= row+1;
            col:= 1;
          else
            col:= col+1;
          fi;
        od;
  
        if row <= n and col <= n then
  
          # The matrix is nonzero.
          if ishead[row][col] then
  
            # Reduce 'new' with the base vector.
            expr:= expr - new[row][col] * echwords[ heads[row][col] ];
            new:=  new  - new[row][col] * ech[      heads[row][col] ];
  
          else
  
            # We found a new base vector.
            Add( base,      orig     );
            Add( basewords, origword );
  
            Add( ech     , new  / new[row][col] );
            Add( echwords, expr / new[row][col] );
            heads [row][col]:= Length( base );
            ishead[row][col]:= true;
  
            row:= n + 1;
  
          fi;

        else

          # We have a zero matrix.
          zeromat:= new;
  
        fi;
  
      od;

    od;

    # Form the closure until 'base' becomes stable.
    found:= true;

    while found do

      found:= false;

      for i in [ 1 .. Length( A.generators ) ] do

        g:= A.generators[i];

        for k in [ 1 .. Length( base ) ] do

          b:= base[k];
          new:= b * g;
          orig:= new;

          expr:= basewords[k] * F.generators[i];
          origword:= expr;

          # Reduce the matrix modulo 'ech'.
          row:= 1;
          col:= 1;
          while row <= n and col <= n do
    
            # Get the first nonzero column.
            while row <= n and col <= n and new[row][col] = zero do
#T use DepthVector!
              if col = n then
                row:= row+1;
                col:= 1;
              else
                col:= col+1;
              fi;
            od;

            if row <= n and col <= n then

              # The matrix is nonzero.
              if ishead[row][col] then

                # Reduce 'new' with the base vector.
                expr:= expr - new[row][col] * echwords[ heads[row][col] ];
                new:=  new  - new[row][col] * ech[      heads[row][col] ];

              else

                # We found a new base vector.
                Add( base,      orig     );
                Add( basewords, origword );

                Add( ech     , new  / new[row][col] );
                Add( echwords, expr / new[row][col] );
                heads [row][col]:= Length( base );
                ishead[row][col]:= true;

                row:= n + 1;
                found:= true;

              fi;

            else

              # We have a zero matrix.
              zeromat:= new;
  
            fi;

          od;
        od;
      od;
    od;

    # Store the zero matrix.
    if IsBound( zeromat ) and not IsBound( A.zero ) then
      A.zero:= zeromat;
    fi;

    # Make the standard basis record.
    B:= rec( vectors          := base,
             isBasis          := true,
             isStandardBasis  := true,
             structure        := A,
             freeAlgebra      := F,
             basewords        := basewords,
             semiEchelonBasis := rec(
                    vectors            := ech,
                    heads              := heads,
                    ishead             := ishead,
                    freeAlgebra        := F,
                    basewords          := echwords,
                    isBasis            := true,
                    isSemiEchelonBasis := true,
                    structure          := A,
                    operations         := SemiEchelonBasisMatAlgebraOps ),
             operations       := StandardBasisMatAlgebraOps );

    # Compute the base change matrix.
    if Length( B.vectors ) > 0 then
      B.basechange:= List( B.vectors,
                         x -> Coefficients( B.semiEchelonBasis, x ) ) ^ -1;
    fi;

    # Return the standard basis record.
    return B;
    end;

#############################################################################
##
#F  MatAlgebraOps.SemiEchelonBasis( <A> )
#F  MatAlgebraOps.SemiEchelonBasis( <A>, <matrices> )
##
MatAlgebraOps.SemiEchelonBasis := function( arg )

    local V,  # matrix algebra
          B;  # the basis, result

    V:= arg[1];

    if Length( arg ) = 1 then

      # The canonical basis is just a special type of a semi-echelon basis.
      if IsBound( V.canonicalBasis ) then
        return V.canonicalBasis;
      fi;

      return StandardBasis( V ).semiEchelonBasis;

    else

      # Initialize the basis record.
      B:= rec( isBasis   := true,
               vectors   := arg[2],
               structure := V );
         
      # Compute the 'heads' information, and check that we have in fact
      # a semi-echelonized basis.
      if not IsSemiEchelonBasis( B ) then
        Error( "sorry, <vectors> is not a semi-echelonized basis" );
      fi;

    fi;

    # Return the basis.
    return B;
    end;

#############################################################################
##
#F  MatAlgebraOps.Base( <A> )
##
MatAlgebraOps.Base := function( A )
    return Basis( A ).vectors;
    end;

#############################################################################
##
#F  MatAlgebraOps.Elements := function( <A> )
##
MatAlgebraOps.Elements := function( A )

    local elms,      # elements list, result
          base,      # $F$-base of $A$
          new,       # intermediate elements list
          gen,       # one generator
          i;         # loop variable

    if not IsFinite( A ) then
      Error( "cannot compute elements list of infinite domain <A>" );
    fi;

    base:= Base( A );
    elms:= [ Zero( A ) ];
    for gen in base do
      new:= [];
      for i in Elements( A.field ) do
        Append( new, List( elms, x -> x + i*gen ) );
      od;
      elms:= new;
    od;
    
    Sort( elms );
    return elms;

    end;
    
#############################################################################
##
#F  MatAlgebraOps.Centralizer(<A>,<a>)  . . centralizer of element/subalgebra
##
##  View the centralizer condition as an equation system
##  \[ \sum_{b\in Base(A)} c_b ( b a - a b ) = 0 \ , \]
##  with $c_b$ in the base field.  Then the centralizer is spanned by the
##  matrices $\sum_{b\in Base(A)} c_b b$ where the vector $c$ is a basis
##  vector of the solution space.
##
MatAlgebraOps.Centralizer := function( A, a )

    local C,
          nooneC;

    # This seems to be the more usual case.
    # Note that this function uses a vector space basis, so we only
    # need to replace the operations record afterwards.
    C:= UnitalMatAlgebraOps.Centralizer( A, a );

    # Remove the knowledge of the 'one'.
    nooneC:= Subalgebra( Parent( A ), C.generators );
    nooneC.basis:= C.basis;

    return nooneC;
    end;

#############################################################################
##
#F  MatAlgebraOps.Centre( <A> )  . . . . . . . . . . . . centre of an algebra
##
#T this is not only a subalgebra but an ideal ...
##
MatAlgebraOps.Centre := GroupOps.Centre;

#############################################################################
##
#F  MatAlgebraOps.Closure(<A>,<a>)  . closure of a subalgebra in a matalgebra
##
MatAlgebraOps.Closure := function( A, w )
    local   C,          # closure of <A> and <w>, result
            g;          # one generator

    # closure with the parent
    if IsParent( A )  then
      return A;
    fi;

    # handle the closure of a subalgebra with another subalgebra
    if IsAlgebra( w )  then
      C := A;
      for g  in w.generators  do
        C := Closure( C, g );
      od;
      return C;
    fi;

    # if possible test if the element lies in the algebra already
    if w in A.generators or
       ( IsBound( A.elements ) and w in A.elements ) or
       ( IsBound( A.basis ) and Coefficients( A.basis, w ) <> false ) then
      return A;
    fi;

    # otherwise make a new algebra
    C := Subalgebra( Parent( A ), Concatenation( A.generators, [ w ] ) );

    # return the closure
    return C;
    end;

#############################################################################
##
#F  MatAlgebraOps.Dimension( <A> )
##
MatAlgebraOps.Dimension := function( A )
    return Length( Basis( A ).vectors );
    end;

#############################################################################
##
#F  MatAlgebraOps.\in( <m>, <A> )
##
MatAlgebraOps.\in := function( m, A )
    if Length( A.generators ) = 0 then
      return     IsMatrix( m )
             and Dimensions( m ) = Dimensions( Zero( A ) )
             and Coefficients( Basis( A ), m ) <> false;
    else
      return     IsMatrix( m )
             and Dimensions( m ) = Dimensions( A.generators[1] )
             and Coefficients( Basis( A ), m ) <> false;
    fi;
    end;

#############################################################################
##
#F  MatAlgebraOps.AbstractExpression( <A>, <elm> )
##
##  returns a record with components 'generators' and 'expression',
##  giving an arithmetic expression of <elm> in terms of the generators
##  of <A>.
##
MatAlgebraOps.AbstractExpression := function( A, elm )

    local B,       # basis of 'A'
          coeff,   # coefficients list
          expr,    # the expression, result
          i;       # loop over 'coeff'

    B:= Basis( A );
    coeff:= Coefficients( B, elm );
    expr:= B.freeAlgebra.zero;
    for i in [ 1 .. Length( coeff ) ] do
      if coeff[i] <> A.field.zero then
        expr:= expr + coeff[i] * B.basewords[i];
      fi;
    od;
    return rec( generators := A.basis.freeAlgebra.generators,
                expression := expr );
    end;

#############################################################################
##
#F  MatAlgebraOps.FieldMultiplicity( <A>, <elm> )
##
MatAlgebraOps.FieldMultiplicity := function( A, elm )
    return elm[1][1];
    end;

#############################################################################
##
#F  MatAlgebraOps.NaturalModule( <A> )
##
MatAlgebraOps.NaturalModule := function( A )

    local gens,   # generators
          N;      # natural module, result

    if Length( Parent( A ).generators ) = 0 then
      gens:= IdentityMat( A.field, Length( Zero( Parent( A ) ) ) );
    else
      gens:= Parent( A ).generators[1]^0;
    fi;
#T wirklich Erzeuger angeben ?
    N:= Module( A, gens );
    N.isNaturalModule:= true;
    return N;
    end;

#############################################################################
##
#F  MatAlgebraOps.Size( <A> )
##
MatAlgebraOps.Size := function( A )
    if   ForAll( Generators( A ), x -> IsZero( A, x ) ) then
      return 1;
    elif not IsFinite( A.field ) then
      return "infinity";
    else
      return Size( A.field ) ^ Dimension( A );
    fi;
    end;

#############################################################################
##
#F  MatAlgebraOps.Subalgebra( <A>, <gens> ) . . . . . . . create a subalgebra
##
MatAlgebraOps.Subalgebra := function( A, gens )
    local   U;          # subalgebra of <A> generated by <gens>, result

    U:= AlgebraOps.Subalgebra( A, gens );

    # Improve where possible.
    U.isMatAlgebra := true;
    U.operations   := MatAlgebraOps;

    # return the subalgebra
    return U;
    end;

#############################################################################
##
#F  MatAlgebraOps.UnitalSubalgebra( <A>, <gens> )
##
MatAlgebraOps.UnitalSubalgebra := function( A, gens )
    local   U;          # subalgebra of <A> generated by <gens>, result

    # Check whether this will really be a subalgebra.
    if not IsUnitalAlgebra( A ) then
      if Length( A.generators ) = 0 and not A.generators[1]^0 in A then
        Error( "<A> is not unital" );
      elif not Zero( A )^0 in A then
        Error( "<A> is not unital" );
      fi;
    fi;
      
    U:= UnitalAlgebraOps.UnitalSubalgebra( A, gens );

    # Improve where possible.
    U.isMatAlgebra       := true;
    U.operations         := UnitalMatAlgebraOps;

    # return the subalgebra
    return U;
    end;

#############################################################################
##
#F  MatAlgebraOps.FpAlgebra( <F>, <A> ) . . . . . . . presentation of algebra
##
MatAlgebraOps.FpAlgebra := function( F, A )

    if One( A ) <> false then
      return UnitalMatAlgebraOps.FpAlgebra( F, A );
    else
      Error( "presentation exists only if a mult. neutral element exists" );
    fi;
    end;

#############################################################################
##
#F  MatAlgebra(<F>,<n>) . . full matrix algebra of <n>-dim. matrices over <F>
##
##  Let $E_{i,j}$ be the matrix with value 1 in row $i$ and $column $j$, and
##  zero otherwise.
##  Clearly the full matrix algebra is generated by all $E_{i,j}$, $i$ and
##  $j$ ranging from 1 to <n>.
##  Define the matrix $F$ as permutation matrix for the permutation
##  $(1, 2, \ldots, n)$.  Then $E_{i,j} = F^{i-1} E_{1,1} F^{1-j}$.
##  Thus $F$ and $E_{1,1}$ are sufficient to generate the algebra.
##
MatAlgebra := function( F, n )

    local i,      # loop over the rows
          gens,   # list of generators
          A;      # algebra, result

    gens:= NullMat( n, n, F );
    gens:= [ gens, Copy( gens ) ];

    # construct the generators
    gens[1][1][1]:= F.one;
    gens[2][1][n]:= F.one;
    for i in [ 2 .. n ] do
      gens[2][i][i-1]:= F.one;
    od;

    # construct the algebra
    A:= UnitalAlgebra( F, gens );
    A.isFullMatAlgebra:= true;

#T    # overlay the operations
#T    A.operations:= FullMatAlgebraOps;

    # return the algebra
    return A;
    end;

#############################################################################
##
#V  EmptyMat
##
##  returns an empty matrix that acts on empty lists
##  and can be added to or multiplied with empty lists.
#T  Used for VE in case of a faithful representation of the zero module ...
##
EmptyMat := rec( dimensions := [ 0, 0 ],
                 domain := ~,
                 operations :=
    rec( Print := function( obj ) Print( "EmptyMat" ); end,
         \+ := function( x, y ) return EmptyMat; end,
         \* := function( x, y )
                  if x = [] then return x;
                  else return EmptyMat; fi; end,
         \^ := function( x, y )
                  if IsInt( y ) then return EmptyMat;
                  elif x = [] then return x; fi; end,
         \in := function( x, y )
                  return true; end,
         UnitalAlgebra := function( F, EmptyMat, gens, zero )
                      return NullAlgebra( F ); end,
         Algebra := function( F, EmptyMat, gens, zero )
                      return NullAlgebra( F ); end ) );

#############################################################################
##
#V  NullAlgebraOps
##
NullAlgebraOps := OperationsRecord( "NullAlgebraOps", MatAlgebraOps );

NullAlgebraOps.Print := function( obj )
    Print( "NullAlgebra( ", obj.field, " )" );
    end;

#############################################################################
##
#F  NullAlgebra( <F> )  . . . . . . . . . . . . . null algebra over field <F>
##
NullAlgebra := function( F )
    return rec( isDomain      := true,
                isAlgebra     := true,
                isMatAlgebra  := true,
                isNullAlgebra := true,
                field         := F,
                generators    := [],
                zero          := EmptyMat,
                one           := EmptyMat,
                size          := 1,
                elements      := [ EmptyMat ],
                operations    := NullAlgebraOps );
    end;

#############################################################################
##
#F  IsNullAlgebra( <F> )
##
IsNullAlgebra := function( F )
    return IsRec( F ) and IsBound( F.isNullAlgebra ) and F.isNullAlgebra;
    end;

#############################################################################
##
#V  UnitalMatAlgebraOps . . . .  operations record for unital matrix algebras
##
UnitalMatAlgebraOps := OperationsRecord( "UnitalMatAlgebraOps",
                                         UnitalAlgebraOps );

#############################################################################
##
#F  UnitalMatAlgebraOps.IsUnit( <A>, <m> )
##
UnitalMatAlgebraOps.IsUnit := MatAlgebraOps.IsUnit;

#############################################################################
##
#F  UnitalMatAlgebraOps.Quotient := function ( A, m, n )
##
UnitalMatAlgebraOps.Quotient := MatAlgebraOps.Quotient;

#############################################################################
##
#F  UnitalMatAlgebraOps.IsZero( <A>, <obj> )
##
UnitalMatAlgebraOps.IsZero := MatAlgebraOps.IsZero;

#############################################################################
##
#F  UnitalMatAlgebraOps.IsFinite( <A> )
##
##  <A> is finite if and only if the coefficient field is finite, since a
##  finite coefficient field implies nonzero characteristic for the
##  generating matrices.
##
UnitalMatAlgebraOps.IsFinite := function( A )
    return IsFinite( A.field );
    end;

#############################################################################
##
#F  UnitalMatAlgebraOps.One( <A> )
##
UnitalMatAlgebraOps.One := function( A )
    if Length( A.generators ) > 0 then
      return A.generators[1] ^ 0;
    else
      return Zero( A )^0;
    fi;
    end;

#############################################################################
##
#F  UnitalMatAlgebraOps.Fingerprint( <A>, <list> )
##
UnitalMatAlgebraOps.Fingerprint := MatAlgebraOps.Fingerprint;

#############################################################################
##
#F  UnitalMatAlgebraOps.Operation( <A>, <M>, <opr> )
##
##  returns the matrix algebra representation of the action of <A>
##  on the module <M> resp. with respect to the basis <B> of an <A>-module,
##  where <M> must be a (factor of a) row module.
##
UnitalMatAlgebraOps.Operation := function( A, M, opr )

    local B,       # semi-echelonized basis for 'M'
          opr,     # actions of the matrices
          result;  # matrix algebra, result

    if   IsRec( M ) and IsBound( M.isBasis ) then
      B:= M;
    elif IsModule( M ) then
      B:= SemiEchelonBasis( M );
    else
      Error( "<M> must be a basis or a (factor of a) row module" );
    fi;

    opr    := InducedActionSpaceMats( B, A.generators );
    result := UnitalAlgebra( A.field, opr );

    # Add the operation information.
    result.operation:=
       rec( genimages    := opr,
            genpreimages := A.generators{ List( result.generators,
                                          x -> Position( opr, x ) ) },
            moduleinfo   := rec( basisSource    := B,
                                 preimagesBasis := B.vectors ) );

    return result;
    end;

#############################################################################
##
#F  UnitalMatAlgebraOps.RepresentativeOperation( <A>, <v>, <w>, <opr> )
##
UnitalMatAlgebraOps.RepresentativeOperation := 
                                       MatAlgebraOps.RepresentativeOperation;

#############################################################################
##
#F  UnitalMatAlgebraOps.StandardBasis( <A> )
##
##  Let $A$ be a unital matrix algebra over the field $F$.
##
##  Define $A_i$ to be the linear space generated by all words of length at
##  most $i$, in terms of the generators of $A$.
##  (The identity matrix is a word of length zero.)
##
##  Then $F I = A_0 <leq A_1 \leq \ldots \ldots A_k = A$ for $k$
##  sufficiently large.
##
##  We are interested in computing a vector space basis.  For $i > 0$,
##  every element of $A_{i+1}$ is a sum of products of elements in $A_i$ with
##  generators, so if we have a base $B_i$ of $A_i$, and compute a base of
##  the space generated by the products $b g$ where $b$ ranges over $B_i$,
##  and $g$ ranges over the generators of $A$, we get a base of $A_{i+1}$.
##
##  The base will be in semi-echelon form.
##
##  Additionally this function stores components 'freeAlgebra' and
##  'basewords'.
##  They can be used to express every algebra element in terms of the
##  generators, and compute preimages under homomorphisms.
##
UnitalMatAlgebraOps.StandardBasis := function( A )

    local zero,      # zero of the field
          n,         # dimension of matrices
          base,      # list of matrices in the standard base
          ech,       # list of matrices in the echelonized base
          heads,     # list with info about leading entries
          ishead,    # boolean list with info about leading entries
          found,     # flag: Has a new base vector been found?
          g,         # loop over generators of 'A'
          b,         # loop over base vectors
          new,       # one product
          expr,      # actual expression for 'new'
          orig,      # candidate for base vector
          origword,  # corresponding expression
          row,       # loop over rows of the matrix
          col,       # loop over columns of the matrix
          F,         # free algebra
          basewords, # list of expressions for 'base' vectors in terms of 'F'
          echwords,  # list of expressions for 'ech'  vectors in terms of 'F'
          i, k,      # loop over generators and base
          zeromat,   # zero matrix
          row,       #
          j, l,      #
          B;         # basis record, result

    zero:= A.field.zero;

    if Length( Parent( A ).generators ) = 0 then
      n:= Length( Zero( Parent( A ) ) );
    else
      n:= Length( Parent( A ).generators[1] );
    fi;

    base := [];
    ech  := [];
    heads:= List( [ 1 .. n ], x -> [] );
    ishead:= List( [ 1 .. n ], x -> BlistList( [ 1 .. n ], [] ) );

    # The generators of the free algebra correspond to the generators of 'A'.
    F:= FreeAlgebra( A.field, Length( A.generators ) );
    basewords:= [];
    echwords:=  [];

    # Compute a basis for $A_0$.
    base[1]      := One( A );
    ech[1]       := base[1];
    heads[1][1]  := 1;
    ishead[1][1] := true;
    basewords[1] := One( F );
    echwords[1]  := basewords[1];

    # Form the closure until 'base' becomes stable.
    found:= true;

    while found do

      found:= false;

      for i in [ 1 .. Length( A.generators ) ] do

        g:= A.generators[i];

        for k in [ 1 .. Length( base ) ] do

          b:= base[k];
          new:= b * g;
          orig:= new;

          expr:= basewords[k] * F.generators[i];
          origword:= expr;

          # Reduce the matrix modulo 'ech'.
          row:= 1;
          col:= DepthVector( new[row] );
          while col > n and row < n do
            row:= row + 1;
            col:= DepthVector( new[row] );
          od;
          
          for j in [ row .. n ] do
            for l in [ 1 .. n ] do
              if ishead[j][l] and new[j][l] <> zero then

                expr := expr - new[j][l] * echwords[ heads[j][l] ];
                new  := new  - new[j][l] * ech[      heads[j][l] ];

              fi;
            od;
          od;

          # Check whether 'new' is the zero marix.
          col:= DepthVector( new[row] );
          while col > n and row < n do
            row:= row + 1;
            col:= DepthVector( new[row] );
          od;

          if col > n then

            # We have a zero matrix.
            zeromat:= new;

          else

            # We found a new base vector.
            Add( base,      orig     );
            Add( basewords, origword );

            Add( ech     , new  / new[row][col] );
            Add( echwords, expr / new[row][col] );
            heads [row][col]:= Length( base );
            ishead[row][col]:= true;

            row:= n + 1;
            found:= true;

          fi;

        od;
      od;
    od;

    # Store the zero matrix.
    if IsBound( zeromat ) and not IsBound( A.zero ) then
      A.zero:= zeromat;
    fi;

    # Make the standard basis record.
    B:= rec( vectors          := base,
             isBasis          := true,
             isStandardBasis  := true,
             structure        := A,
             freeAlgebra      := F,
             basewords        := basewords,
             semiEchelonBasis := rec(
                    vectors            := ech,
                    heads              := heads,
                    ishead             := ishead,
                    freeAlgebra        := F,
                    basewords          := echwords,
                    isBasis            := true,
                    isSemiEchelonBasis := true,
                    structure          := A,
                    operations         := SemiEchelonBasisMatAlgebraOps ),
             operations       := StandardBasisMatAlgebraOps );

    # Compute the base change matrix.
    if Length( B.vectors ) > 0 then
      B.basechange:= List( B.vectors,
                         x -> Coefficients( B.semiEchelonBasis, x ) ) ^ -1;
    fi;

    # Return the standard basis record.
    return B;
    end;

#############################################################################
##
#F  UnitalMatAlgebraOps.SemiEchelonBasis( <A> )
#F  UnitalMatAlgebraOps.SemiEchelonBasis( <A>, <matrices> )
##
UnitalMatAlgebraOps.SemiEchelonBasis := MatAlgebraOps.SemiEchelonBasis;

#############################################################################
##
#F  UnitalMatAlgebraOps.Basis( <A> )
#F  UnitalMatAlgebraOps.Basis( <A>, <matrices> )
##
UnitalMatAlgebraOps.Basis := MatAlgebraOps.Basis;

#############################################################################
##
#F  UnitalMatAlgebraOps.Base( <A> )
##
UnitalMatAlgebraOps.Base := MatAlgebraOps.Base;

#############################################################################
##
#F  UnitalMatAlgebraOps.Elements( <A> )
##
UnitalMatAlgebraOps.Elements := MatAlgebraOps.Elements;

#############################################################################
##
#F  UnitalMatAlgebraOps.Centralizer( <A>, <a> )
##
##  View the centralizer condition as an equation system
##  \[ \sum_{b\in Base(A)} c_b ( b a - a b ) = 0 \ , \]
##  with $c_b$ in the base field.  Then the centralizer is spanned by the
##  matrices $\sum_{b\in Base(A)} c_b b$ where the vector $c$ is a basis
##  vector of the solution space.
##
UnitalMatAlgebraOps.Centralizer := function( A, a )

    local gens,   # generators of the algebra that shall be centralized
          base,   # actual base of the centralizer
          gen,    # loop over 'gens'
          mat,    # matrix of actual equation system
          b,      # loop over 'base'
          sol,    # bas eof the nullspace of the actual equation system
          C;      # centralizer, result

    if   IsAlgebra( a ) and IsSubset( Parent( A ), a ) then
      gens:= a.generators;
    elif IsMatrix( a ) then
      gens:= [ a ];
    else
      Error( "<a> must be element or subalgebra of the parent of <A>" );
    fi;

    base:= Base( A );

    for gen in gens do

      mat:= [];
      for b in base do
        Add( mat, Concatenation( b * gen - gen * b ) );
      od;
      sol:= NullspaceMat( mat );

      # Replace 'base' by a vector space base of the centralizer.
      base:= List( sol, x -> x * base );
      
    od;
      
    C:= UnitalSubalgebra( Parent( A ), base );
    C.basis:= Basis( C, base );

    # Return the centralizer.
    return C;
    end;

#############################################################################
##
#F  UnitalMatAlgebraOps.Centre( <A> )
##
UnitalMatAlgebraOps.Centre := GroupOps.Centre;

#############################################################################
##
#F  UnitalMatAlgebraOps.Closure(<A>,<a>)
##
UnitalMatAlgebraOps.Closure := function( A, w )
    local   C,          # closure of <A> and <w>, result
            g;          # one generator

    # closure with the parent
    if IsParent( A )  then
      return A;
    fi;

    # handle the closure of a subalgebra with another subalgebra
    if IsAlgebra( w )  then
      C := A;
      for g  in w.generators  do
        C := Closure( C, g );
      od;
      return C;
    fi;

    # if possible test if the element lies in the algebra already
    if w in A.generators or
       ( IsBound( A.elements ) and w in A.elements ) or
       ( IsBound( A.basis ) and Coefficients( A.basis, w ) <> false ) then
      return A;
    fi;

    # otherwise make a new algebra
    C := UnitalSubalgebra( Parent( A ),
                           Concatenation( A.generators, [ w ] ) );

    # return the closure
    return C;
    end;

#############################################################################
##
#F  UnitalMatAlgebraOps.Dimension( <A> )
##
UnitalMatAlgebraOps.Dimension := MatAlgebraOps.Dimension;

#############################################################################
##
#F  UnitalMatAlgebraOps.\in( <m>, <A> )
##
UnitalMatAlgebraOps.\in := MatAlgebraOps.\in;

#############################################################################
##
#F  UnitalMatAlgebraOps.AbstractExpression( <A>, <elm> )
##
UnitalMatAlgebraOps.AbstractExpression := MatAlgebraOps.AbstractExpression;

#############################################################################
##
#F  UnitalMatAlgebraOps.FieldMultiplicity( <A>, <elm> )
##
UnitalMatAlgebraOps.FieldMultiplicity := MatAlgebraOps.FieldMultiplicity;

#############################################################################
##
#F  UnitalMatAlgebraOps.NaturalModule( <A> )
##
UnitalMatAlgebraOps.NaturalModule := MatAlgebraOps.NaturalModule;

#############################################################################
##
#F  UnitalMatAlgebraOps.Size( <A> )
##
UnitalMatAlgebraOps.Size := function( A )
    if not IsFinite( A.field ) then
      return "infinity";
    else
      return Size( A.field ) ^ Dimension( A );
    fi;
    end;

#############################################################################
##
#F  UnitalMatAlgebraOps.Subalgebra( <A>, <gens> )
##
UnitalMatAlgebraOps.Subalgebra := MatAlgebraOps.Subalgebra;

#############################################################################
##
#F  UnitalMatAlgebraOps.UnitalSubalgebra( <A>, <gens> )
##
UnitalMatAlgebraOps.UnitalSubalgebra := function( A, gens )
    local   U;          # subalgebra of <A> generated by <gens>, result

    U:= UnitalAlgebraOps.UnitalSubalgebra( A, gens );

    # Improve where possible.
    U.isMatAlgebra := true;
    U.operations   := UnitalMatAlgebraOps;

    # return the subalgebra
    return U;
    end;

#############################################################################
##
#F  UnitalMatAlgebraOps.FpAlgebra( <F>, <A> )
##
UnitalMatAlgebraOps.FpAlgebra := function( F, A )

    local base,         # base of 'A'
          baselen,      # length of 'base'
          len,          # no. of generators
          free,         # free algebra
          basewords,    # expressions of base vectors in terms of generators
          rels,         # relators list
          i,            # loop over 'base'
          j,            # loop over 'base'
          rel,          # one relator
          coeff,        # coefficients of product of basis vectors
          k;            # loop over 'coeff'

    if F <> A.field then
      Error( "fields do not coincide" );
    fi;

    base:= StandardBasis( A ).vectors;
    baselen:= Length( base );
    len:= Length( A.generators );
    free:= FreeAlgebra( F, len );

    basewords:= List( A.standardBasis.basewords,
             x -> MappedExpression( x, A.standardBasis.freeAlgebra.generators,
                                       free.generators ) );
    rels:= [];
    for i in [ 1 .. baselen ] do
      for j in [ 1 .. baselen ] do
        coeff:= Coefficients( A.standardBasis, base[i] * base[j] );
        rel:= basewords[i] * basewords[j];
        for k in [ 1 .. baselen ] do
          rel:= rel - coeff[k] * basewords[k];
        od;
        if rel <> free.zero then
          Add( rels, rel );
        fi;
      od;
    od;
    return free / Set( rels );
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
