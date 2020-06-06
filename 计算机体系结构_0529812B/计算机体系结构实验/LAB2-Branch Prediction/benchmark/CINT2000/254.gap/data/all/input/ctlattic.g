#############################################################################
##
#A  ctlattic.g                  GAP library                       Ansgar Kaup
##
#A  @(#)$Id: ctlattic.g,v 3.20.1.1 1996/06/21 11:59:11 sam Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains those functions which mainly deal with lattices (more
##  or less in the context of character tables).
##
#H  $Log: ctlattic.g,v $
#H  Revision 3.20.1.1  1996/06/21  11:59:11  sam
#H  fixed that 'norms' is also sorted when '"sort"' is specified
#H
#H  Revision 3.20  1994/06/22  16:47:20  sam
#H  fixed call of 'LLL' with "sort" option
#H
#H  Revision 3.19  1994/05/30  15:53:38  sam
#H  replaced 'LLLReducedBasis' by improved version
#H
#H  Revision 3.17  1994/02/17  09:12:49  sam
#H  added info message in 'LLL'
#H
#H  Revision 3.16  1994/01/12  09:03:57  sam
#H  improved 'LLLReducedBasis'
#H
#H  Revision 3.15  1993/12/11  16:52:41  sam
#H  fixed 'LLLReducedBasis' once more
#H
#H  Revision 3.14  1993/12/08  18:28:44  sam
#H  *** empty log message ***
#H
#H  Revision 3.13  1993/11/02  10:11:33  sam
#H  replaced 'LLLReducedGramMat' by version that accepts singular and lower
#H  triangular matrices,
#H  added function 'LLLReducedBasis',
#H  replaced 'LLL' by call of 'LLLReducedBasis'
#H
#H  Revision 3.12  1993/04/20  14:07:03  sam
#H  replaced 'LLLReducedGramMat' by improved version
#H  (at least one bug less)
#H
#H  Revision 3.11  1993/03/01  15:41:11  sam
#H  fixed little bug in parameter check of 'LLL'
#H
#H  Revision 3.10  1993/02/09  14:25:55  martin
#H  made undefined globals local
#H
#H  Revision 3.9  1992/12/08  09:08:38  sam
#H  fixed bug in 'OrthogonalEmbeddings'
#H
#H  Revision 3.8  1992/10/20  15:24:46  sam
#H  fixed little bug in 'LLL'
#H
#H  Revision 3.7  1992/09/23  08:40:08  sam
#H  added some comments
#H
#H  Revision 3.6  1992/09/14  13:24:04  sam
#H  fixed bug in 'Decreased'
#H
#H  Revision 3.5  1992/08/07  12:04:51  sam
#H  bug in 'DnLattice' fixed
#H
#H  Revision 3.4  1992/07/10  10:09:36  sam
#H  corrected calls of 'Reduced' in 'DnLattice'
#H
#H  Revision 3.3  1992/07/02  13:01:12  sam
#H  changed test for solution of D4 lattice in 'DnLattice'
#H
#H  Revision 3.2  1992/06/25  10:51:45  sam
#H  fixed bug in 'Decreased':  No return of 'false' if the indicators
#H  cannot be computed, just warning
#H
#H  Revision 3.1  1992/06/12  15:24:56  sam
#H  bug in OESD fixed
#H
#H  Revision 3.0  1992/06/04  07:57:05  sam
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  InfoCharTable1
#F  InfoCharTable2
##
    if not IsBound( InfoCharTable1 ) then InfoCharTable1:= Ignore; fi;
    if not IsBound( InfoCharTable2 ) then InfoCharTable2:= Ignore; fi;


#############################################################################
##
#F  InfoLattice1( ... ) . . . . . . . . . . information function for lattices
#F  InfoLattice2( ... ) . . . . . . . . . . information function for lattices
##
    if not IsBound( InfoLattice1 ) then InfoLattice1:= Ignore; fi;
    if not IsBound( InfoLattice2 ) then InfoLattice2:= Ignore; fi;


#############################################################################
##  \Section{LLLReducedBasis}%
##  \index{LLL algorithm!for vectors}%
##  \index{short vectors spanning a lattice}%
##  \index{lattice base reduction}
##
#F  LLLReducedBasis([<L>],<vectors>[,<y>][,\"linearcomb\"]) . LLL for vectors
##
##  'LLLReducedBasis' provides an implementation of the LLL algorithm by
##  Lenstra, Lenstra and Lov{\accent19 a}sz (see~\cite{LLL82}, \cite{Poh87}).
##  The implementation follows the description on pages 94f. in~\cite{Coh93}.
##
##  'LLLReducedBasis' returns a record whose component 'basis' is a list of
##  LLL reduced linearly independent vectors spanning the same lattice as
##  the list <vectors>.
##  <L> must be a lattice record whose scalar product is stored in the
##  component 'operations.NoMessageScalarProduct' or
##  'operations.ScalarProduct',
##  a function of three arguments, namely the lattice and the two vectors.
##
##  In the case of option '\"linearcomb\"', the record contains also the
##  components 'relations' and 'transformation', which have the following
##  meaning.
##  'relations' is a basis of the relation space of <vectors>, i.e., of
##  vectors <x> such that '<x> \* <vectors>' is zero.
##  'transformation' gives the expression of the new lattice basis in
##  terms of the old, i.e.,
##  'transformation \* <vectors>' equals the 'basis' component of the result.
##
##  Another optional argument is <y>, the ``sensitivity\'\' of the algorithm,
##  a rational number between $\frac{1}{4}$ and 1 (the default value is
##  $\frac{3}{4}$).
##
##  (The function "LLLReducedGramMat" computes an LLL reduced Gram matrix.)
##
LLLReducedBasis := function( arg )

      local mmue,      # buffer $\mue$
            L,         # the lattice
            y,         # sensitivity $y$ (default $y = \frac{3}{4}$)
            kmax,      # $k_{max}$
            b,         # list $b$ of vectors
            H,         # basechange matrix $H$
            mue,       # matrix $\mue$ of scalar products
            B,         # list $B$ of norms of $b^{\ast}$
            BB,        # buffer $B$
            q,         # buffer $q$ for function 'RED'
            i,         # loop variable $i$
            j,         # loop variable $j$
            k,         # loop variable $k$
            l,         # loop variable $l$
            n,         # number of vectors in $b$
            lc,        # boolean: option 'linearcomb'?
            scpr,      # scalar product of lattice 'L'
            RED,       # reduction subprocedure; 'RED( l )'
                       # means 'RED( k, l )' in Cohen's book
            r;         # number of zero vectors found up to now

    RED := function( l )

    # Terminate for $\|\mue_{k,l}\| \leq \frac{1}{2}$.
    if mue[k][l] * 2 > 1 or mue[k][l] * 2 < -1 then

      # Let $q = 'Round( mue[k][l] )'$ (is never zero), \ldots
      q:= Int( mue[k][l] );
      if AbsInt( mue[k][l] - q ) * 2 > 1 then
        q:= q + SignInt( mue[k][l] );
      fi;

      # \ldots and subtract $q b_l$ from $b_k$;
      b[k]:= b[k] - q * b[l];

      # adjust 'mue', \ldots
      mue[k][l]:= mue[k][l] - q;
      for i in [ r+1 .. l-1 ] do  
        if mue[l][i] <> 0 then
          mue[k][i]:= mue[k][i] - q * mue[l][i];
        fi;
      od;

      # \ldots and the basechange.
      if lc then
        H[k]:= H[k] - q * H[l];
      fi;

    fi;
    end;
    

    # Check the input parameters.
    if   IsRec( arg[1] ) and IsBound( arg[1].operations ) then

      L:= arg[1];

      # Fetch the appropriate scalar product.
      if IsBound( L.operations.NoMessageScalarProduct ) then
        scpr:= L.operations.NoMessageScalarProduct;
      else
        scpr:= L.operations.ScalarProduct;
      fi;

      arg:= arg{ [ 2 .. Length( arg ) ] };

    elif IsList( arg[1] ) then

      # There is no lattice record, take standard scalar product.
      L:= "L";
      scpr:= function( L, x, y ) return x * y; end;

    else

      Error( "usage: LLLReducedBasis( [<L>], <vectors> [,<y>]",
             "[,\"linearcomb\"] )" );

    fi;

    b:= arg[1];

    # Preset the ``sensitivity'' (value between $\frac{1}{4}$ and 1).
    if IsBound( arg[2] ) and IsRat( arg[2] ) then
      y:= arg[2];
      if y <= 1/4 or y >= 1 then
        Error( "sensitivity 'y' must satisfy 1/4 < y < 1" );
      fi;
    else
      y:= 3/4;
    fi;

    # Get the other optional paramater. 
    lc:= false;
    for i in [ 2 .. Length( arg ) ] do  
      if arg[i] = "linearcomb" then lc:= true; fi;
    od;


    # step 1 (Initialize \ldots
    n    := Length( b );
    k    := 2;
    kmax := 1;
    b    := ShallowCopy( b );
    mue  := [];
    r    := 0;
    if lc then
      H:= IdentityMat( n );
    fi;

    InfoLattice1( "#I LLLReducedBasis called with ", n, " vectors,",
                  " y = ", y, "\n" );

    # \ldots and handle the case of leading zero vectors in the input.)
    i:= 1;
    while i <= n and ForAll( b[i], x -> x = 0 ) do
      i:= i+1;
    od;
    if i > n then

      r:= n;
      k:= n+1;

    elif i > 1 then

      q    := b[i];
      b[i] := b[1];
      b[1] := q;
      if lc then
        q    := H[i];
        H[i] := H[1];
        H[1] := q;
      fi;

    fi;

    B  := [ scpr( L, b[1], b[1] ) ];

    while k <= n do

      # step 2 (Incremental Gram-Schmidt)

      # If $k \leq k_{max}$ go to step 3.
      # Otherwise \ldots
      if k > kmax then

        InfoLattice2( "#I LLLReducedBasis: Take ", Ordinal( k ),
                      " vector\n" );

        # \ldots set $k_{max} \leftarrow k$
        # and for $j = 1, \ldots, k-1$ set
        # $\mue_{k,j} \leftarrow b_k \cdot b_j^{\ast} / B_j$ if
        # $B_j \not= 0$ and $\mue_{k,j} \leftarrow 0$ if $B_j = 0$, \ldots
        kmax:= k;
        mue[k]:= [];
        for j in [ r+1 .. k-1 ] do
          mmue:= scpr( L, b[k], b[j] );
          for i in [ r+1 .. j-1 ] do
            mmue:= mmue - mue[j][i] * mue[k][i];
          od;
          mue[k][j]:= mmue;
        od;

        # (Now 'mue[k][j]' contains $\mue_{k,j} B_j$ for all $j$.)
        for j in [ r+1 .. k-1 ] do
          mue[k][j]:= mue[k][j] / B[j];
        od;

        # \ldots then set $b_k^{\ast} \leftarrow
        # b_k - \sum_{j=1}^{k-1} \mue_{k,j} b_j^{\ast}$ and
        # $B_k \leftarrow b_k^{\ast} \cdot b_k^{\ast}$.
        B[k]:= scpr( L, b[k], b[k] );
        for j in [ r+1 .. k-1 ] do
          B[k]:= B[k] - mue[k][j]^2 * B[j];
        od;

      fi;

      # step 3 (Test LLL condition)
      RED( k-1 );
      while B[k] < ( y - mue[k][k-1] * mue[k][k-1] ) * B[k-1] do

        # Execute Sub-algorithm SWAPG$( k )$\:
        # Exchange the vectors $b_k$ and $b_{k-1}$,
        q      := b[k];
        b[k]   := b[k-1];
        b[k-1] := q;

        # $H_k$ and $H_{k-1}$,
        if lc then
          q      := H[k];
          H[k]   := H[k-1];
          H[k-1] := q;
        fi;

        # and if $k > 2$, for all $j$ such that $1 \leq j \leq k-2$
        # exchange $\mue_{k,j}$ with $\mue_{k-1,j}$.
        for j in [ r+1 .. k-2 ] do
          q           := mue[k][j];
          mue[k][j]   := mue[k-1][j];
          mue[k-1][j] := q;
        od;

        # Then set $\mue \leftarrow \mue_{k,k-1}$
        mmue:= mue[k][k-1];

        # and $B \leftarrow B_k + \mue^2 B_{k-1}$.
        BB:= B[k] + mmue^2 * B[k-1];

        # Now, in the case $B = 0$ (i.e. $B_k = \mue = 0$),
        if BB = 0 then

          # exchange $B_k$ and $B_{k-1}$
          B[k]   := B[k-1];
          B[k-1] := 0;

          # and for $i = k+1, k+2, \ldots, k_{max}$
          # exchange $\mue_{i,k}$ and $\mue_{i,k-1}$.
          for i in [ k+1 .. kmax ] do
            q           := mue[i][k];
            mue[i][k]   := mue[i][k-1];
            mue[i][k-1] := q;
          od;

        # In the case $B_k = 0$ and $\mue \not= 0$,
        elif B[k] = 0 and mmue <> 0 then

          # set $B_{k-1} \leftarrow B$,
          B[k-1]:= BB;

          # $\mue_{k,k-1} \leftarrow \frac{1}{\mue}
          mue[k][k-1]:= 1 / mmue;

          # and for $i = k+1, k+2, \ldots, k_{max}$
          # set $\mue_{i,k-1} \leftarrow \mue_{i,k-1} / \mue$.
          for i in [ k+1 .. kmax ] do
            mue[i][k-1]:= mue[i][k-1] / mmue; 
          od;

        else

          # Finally, in the case $B_k \not= 0$,
          # set (in this order) $t \leftarrow B_{k-1} / B$,
          q:= B[k-1] / BB;

          # $\mue_{k,k-1} \leftarrow \mue t$,
          mue[k][k-1]:= mmue * q;

          # $B_k \leftarrow B_k t$,
          B[k]:= B[k] * q;

          # $B_{k-1} \leftarrow B$,
          B[k-1]:= BB;

          # then for $i = k+1, k+2, \ldots, k_{max}$ set
          # (in this order) $t \leftarrow \mue_{i,k}$,
          # $\mue_{i,k} \leftarrow \mue_{i,k-1} - \mue t$,
          # $\mue_{i,k-1} \leftarrow t + \mue_{k,k-1} \mue_{i,k}$.
          for i in [ k+1 .. kmax ] do
            q           := mue[i][k];
            mue[i][k]   := mue[i][k-1] - mmue * q;
            mue[i][k-1] := q + mue[k][k-1] * mue[i][k];
          od;

        fi;

        # Terminate the subalgorithm.

        if k > 2 then k:= k-1; fi;

        # Here we have always 'k > r' since the loop is entered
        # for 'k > r+1' only (because of 'B[k-1] \<> 0'),
        # so the only problem might be the case 'k = r+1',
        # namely 'mue[ r+1 ][r]' is used then; but this is bound
        # provided that the initial list of vectors did not start
        # with zero vectors, and its (perhaps not updated) value 
        # does not matter because this would mean just to subtract
        # a multiple of a zero vector.

        RED( k-1 );

      od;

      if B[ r+1 ] = 0 then
        r:= r+1;
        Unbind( b[r] );
      fi;

      for l in [ k-2, k-3 .. r+1 ] do
        RED( l );
      od;
      k:= k+1;

    # step 4 (Finished?)
    # If $k \leq n$ go to step 2.

    od;

    # Otherwise, let $r$ be the number of initial vectors $b_i$
    # which are equal to zero, output $p \leftarrow n - r$,
    # the vectors $b_i$ for $r+1 \leq i \leq n$ (which form an LLL-reduced
    # basis of $L$), the transformation matrix $H \in GL_n(\Z)$
    # and terminate the algorithm.

    # Check whether the last calls of 'RED' have produced new zero vectors
    # in 'b'; unfortunately this cannot be read off from 'B'.
    while r < n and ForAll( b[ r+1 ], x -> x = 0 ) do
      r:= r+1;
    od;

    InfoLattice1( "#I LLLReducedBasis returns basis of length ", n-r, "\n" );

    if lc then
      return rec( basis          := b{ [ r+1 .. n ] },
                  relations      := H{ [  1  .. r ] },
                  transformation := H{ [ r+1 .. n ] } );
    else
      return rec( basis          := b{ [ r+1 .. n ] } );
    fi;

    end;


#############################################################################
##  \Section{LLLReducedGramMat}%
##  \index{LLL algorithm!for Gram matrices}%
##  \index{lattice base reduction}
##
#F  LLLReducedGramMat( <G> [, <y>] ) . . . . . . . .  LLL reduced Gram matrix
##
##  'LLLReducedGramMat' provides an implementation of the LLL algorithm by
##  Lenstra, Lenstra and Lov{\accent19 a}sz (see~\cite{LLL82}, \cite{Poh87}).
##  The implementation follows the description on pages 94f. in~\cite{Coh93}.
##
##  Let <G> the Gram matrix of the vectors $(b_1, b_2, \ldots, b_n)$;
##  this means <G> is either a square symmetric matrix or lower triangular
##  matrix (only the entries in the lower triangular half are used by the
##  program).
##
##  'LLLReducedGramMat' returns a record whose component 'remainder' is the
##  Gram matrix of the LLL reduced basis corresponding to $(b_1, b_2, \ldots,
##  b_n)$.
##  If <G> was a lower triangular matrix then also the 'remainder' component
##  is a lower triangular matrix.
##
##  The result record contains also the components 'relations' and
##  'transformation', which have the following meaning.
##
##  'relations' is a basis of the space of vectors $(x_1,x_2,\ldots,x_n)$
##  such that $\sum_{i=1}^n x_i b_i$ is zero,
##  and 'transformation' gives the expression of the new lattice basis in
##  terms of the old, i.e., 'transformation' is the matrix $T$ such that
##  $T \cdot <G> \cdot T^{tr}$ is the 'remainder' component of the result.
##
##  The optional argument <y> denotes the ``sensitivity'' of the algorithm,
##  it must be a rational number between $\frac{1}{4}$ and 1; the default
##  value is $<y> = \frac{3}{4}$.
##
##  (The function "LLLReducedBasis" computes an LLL reduced basis.)
##
##  |    gap> g:= [ [ 4, 6, 5, 2, 2 ], [ 6, 13, 7, 4, 4 ],
##      >    [ 5, 7, 11, 2, 0 ], [ 2, 4, 2, 8, 4 ], [ 2, 4, 0, 4, 8 ] ];;
##      gap> LLLReducedGramMat( g );
##      rec(
##        remainder :=
##         [ [ 4, 2, 1, 2, 2 ], [ 2, 5, 0, 2, 2 ], [ 1, 0, 5, 0, -2 ], 
##            [ 2, 2, 0, 8, 4 ], [ 2, 2, -2, 4, 8 ] ],
##        transformation := 
##         [ [ 1, 0, 0, 0, 0 ], [ -1, 1, 0, 0, 0 ], [ -1, 0, 1, 0, 0 ], 
##            [ 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 1 ] ],
##        scalarproducts := 
##         [ [ 1, 0, 0, 0, 0 ], [ 1/2, 1, 0, 0, 0 ], [ 1/4, -1/8, 1, 0, 0 ],
##            [ 1/2, 1/4, -2/25, 1, 0 ], [ 1/2, 1/4, -38/75, 8/21, 1 ] ],
##        bsnorms := [ 4, 4, 75/16, 168/25, 32/7 ] )|
##  
LLLReducedGramMat := function( arg )

      local gram,      # the Gram matrix
            mmue,      # buffer $\mue$
            y,         # sensitivity $y$ (default $y = \frac{3}{4}$)
            kmax,      # $k_{max}$
            H,         # basechange matrix $H$
            mue,       # matrix $\mue$ of scalar products
            B,         # list $B$ of norms of $b^{\ast}$
            BB,        # buffer $B$
            q,         # buffer $q$ for function 'RED'
            i,         # loop variable $i$
            j,         # loop variable $j$
            k,         # loop variable $k$
            l,         # loop variable $l$
            n,         # length of 'gram'
            RED,       # reduction subprocedure; 'RED( l )'
                       # means 'RED( k, l )' in Cohen's book
            ak,        # buffer vector in Gram-Schmidt procedure
            r;         # number of zero vectors found up to now

    RED := function( l )

    # Terminate for $\|\mue_{k,l}\| \leq \frac{1}{2}$.
    if mue[k][l] * 2 > 1 or mue[k][l] * 2 < -1 then

      # Let $q = 'Round( mue[k][l] )'$ (is never zero), \ldots
      q:= Int( mue[k][l] );
      if AbsInt( mue[k][l] - q ) * 2 > 1 then
        q:= q + SignInt( mue[k][l] );
      fi;

      # \ldots adjust the Gram matrix (rows and columns, but only
      # in the lower triangular half), \ldots
      gram[k][k]:= gram[k][k] - q * gram[k][l];
      for i in [ r+1 .. l ] do
        gram[k][i]:= gram[k][i] - q * gram[l][i];
      od;
      for i in [ l+1 .. k ] do
        gram[k][i]:= gram[k][i] - q * gram[i][l];
      od;
      for i in [ k+1 .. n ] do
        gram[i][k]:= gram[i][k] - q * gram[i][l];
      od;

      # \ldots adjust 'mue', \ldots
      mue[k][l]:= mue[k][l] - q;
      for i in [ r+1 .. l-1 ] do  
        if mue[l][i] <> 0 then
          mue[k][i]:= mue[k][i] - q * mue[l][i];
        fi;
      od;

      # \ldots and the basechange.
      H[k]:= H[k] - q * H[l];

    fi;
    end;
    

    # Check the input parameters.
    if arg[1] = [] or ( IsList( arg[1] ) and IsList( arg[1][1] ) ) then

      gram:= Copy( arg[1] );

      # Preset the ``sensitivity'' (value between $\frac{1}{4}$ and 1).
      if IsBound( arg[2] ) and IsRat( arg[2] ) then
        y:= arg[2];
        if y <= 1/4 or y >= 1 then
          Error( "sensitivity 'y' must satisfy 1/4 < y < 1" );
        fi;
      else
        y:= 3/4;
      fi;

    else
      Error( "usage: LLLReducedGramMat( <gram> [,<y>] )" );
    fi;

    # step 1 (Initialize \ldots
    n    := Length( gram );
    k    := 2;
    kmax := 1;
    mue  := [];
    r    := 0;
    ak   := [];
    H    := IdentityMat( n );

    InfoLattice1( "#I LLLReducedGramMat called with matrix of length ", n,
                  ", y = ", y, "\n" );

    # \ldots and handle the case of leading zero vectors in the input.)
    i:= 1;
    while i <= n and gram[i][i] = 0 do
      i:= i+1;
    od;
    if i > n then

      r:= n;
      k:= n+1;

    elif i > 1 then

      for j in [ i+1 .. n ] do
        gram[j][1]:= gram[j][i];
        gram[j][i]:= 0;
      od;
      gram[1][1]:= gram[i][i];
      gram[i][i]:= 0;

      q    := H[i];
      H[i] := H[1];
      H[1] := q;

    fi;

    B:= [ gram[1][1] ];

    while k <= n do

      # step 2 (Incremental Gram-Schmidt)

      # If $k \leq k_{max}$ go to step 3.
      if k > kmax then

        InfoLattice2( "#I LLLReducedGramMat: Take ", Ordinal( k ),
                      " vector\n" );

        # Otherwise \ldots
        kmax:= k;
        B[k]:= gram[k][k];
        mue[k]:= [];
        for j in [ r+1 .. k-1 ] do
          ak[j]:= gram[k][j];
          for i in [ r+1 .. j-1 ] do
            ak[j]:= ak[j] - mue[j][i] * ak[i];
          od;
          mue[k][j]:= ak[j] / B[j];
          B[k]:= B[k] - mue[k][j] * ak[j];
        od;

      fi;

      # step 3 (Test LLL condition)
      RED( k-1 );
      while B[k] < ( y - mue[k][k-1] * mue[k][k-1] ) * B[k-1] do

        # Execute Sub-algorithm SWAPG$( k )$\:
        # Exchange $H_k$ and $H_{k-1}$,
        q      := H[k];
        H[k]   := H[k-1];
        H[k-1] := q;

        # adjust the Gram matrix (rows and columns,
        # but only in the lower triangular half),
        for j in [ r+1 .. k-2 ] do
          q            := gram[k][j];
          gram[k][j]   := gram[k-1][j];
          gram[k-1][j] := q;
        od;
        for j in [ k+1 .. n ] do
          q            := gram[j][k];
          gram[j][k]   := gram[j][k-1];
          gram[j][k-1] := q;
        od;
        q              := gram[k-1][k-1];
        gram[k-1][k-1] := gram[k][k];
        gram[k][k]     := q;

        # and if $k > 2$, for all $j$ such that $1 \leq j \leq k-2$
        # exchange $\mue_{k,j}$ with $\mue_{k-1,j}$.
        for j in [ r+1 .. k-2 ] do
          q           := mue[k][j];
          mue[k][j]   := mue[k-1][j];
          mue[k-1][j] := q;
        od;

        # Then set $\mue \leftarrow \mue_{k,k-1}$
        mmue:= mue[k][k-1];

        # and $B \leftarrow B_k + \mue^2 B_{k-1}$.
        BB:= B[k] + mmue^2 * B[k-1];

        # Now, in the case $B = 0$ (i.e. $B_k = \mue = 0$),
        if BB = 0 then

          # exchange $B_k$ and $B_{k-1}$
          B[k]   := B[k-1];
          B[k-1] := 0;

          # and for $i = k+1, k+2, \ldots, k_{max}$
          # exchange $\mue_{i,k}$ and $\mue_{i,k-1}$.
          for i in [ k+1 .. kmax ] do
            q           := mue[i][k];
            mue[i][k]   := mue[i][k-1];
            mue[i][k-1] := q;
          od;

        # In the case $B_k = 0$ and $\mue \not= 0$,
        elif B[k] = 0 and mmue <> 0 then

          # set $B_{k-1} \leftarrow B$,
          B[k-1]:= BB;

          # $\mue_{k,k-1} \leftarrow \frac{1}{\mue}
          mue[k][k-1]:= 1 / mmue;

          # and for $i = k+1, k+2, \ldots, k_{max}$
          # set $\mue_{i,k-1} \leftarrow \mue_{i,k-1} / \mue$.
          for i in [ k+1 .. kmax ] do
            mue[i][k-1]:= mue[i][k-1] / mmue; 
          od;

        else

          # Finally, in the case $B_k \not= 0$,
          # set (in this order) $t \leftarrow B_{k-1} / B$,
          q:= B[k-1] / BB;

          # $\mue_{k,k-1} \leftarrow \mue t$,
          mue[k][k-1]:= mmue * q;

          # $B_k \leftarrow B_k t$,
          B[k]:= B[k] * q;

          # $B_{k-1} \leftarrow B$,
          B[k-1]:= BB;

          # then for $i = k+1, k+2, \ldots, k_{max}$ set
          # (in this order) $t \leftarrow \mue_{i,k}$,
          # $\mue_{i,k} \leftarrow \mue_{i,k-1} - \mue t$,
          # $\mue_{i,k-1} \leftarrow t + \mue_{k,k-1} \mue_{i,k}$.
          for i in [ k+1 .. kmax ] do
            q:= mue[i][k];
            mue[i][k]:= mue[i][k-1] - mmue * q;
            mue[i][k-1]:= q + mue[k][k-1] * mue[i][k];
          od;

        fi;

        # Terminate the subalgorithm.

        if k > 2 then k:= k-1; fi;

        # Here we have always 'k > r' since the loop is entered
        # for 'k > r+1' only (because of 'B[k-1] \<> 0'),
        # so the only problem might be the case 'k = r+1',
        # namely 'mue[ r+1 ][r]' is used then; but this is bound
        # provided that the initial Gram matrix did not start
        # with zero columns, and its (perhaps not updated) value 
        # does not matter because this would mean just to subtract
        # a multiple of a zero vector.

        RED( k-1 );

      od;

      if B[ r+1 ] = 0 then
        r:= r+1;
      fi;

      for l in [ k-2, k-3 .. r+1 ] do
        RED( l );
      od;
      k:= k+1;

    # step 4 (Finished?)
    # If $k \leq n$ go to step 2.

    od;

    # Otherwise, let $r$ be the number of initial vectors $b_i$
    # which are equal to zero,
    # take the nonzero rows and columns of the Gram matrix
    # the transformation matrix $H \in GL_n(\Z)$
    # and terminate the algorithm.

    if IsBound( arg[1][1][n] ) then

      # adjust also upper half of the Gram matrix
      gram:= gram{ [ r+1 .. n ] }{ [ r+1 .. n ] };
      for i in [ 2 .. n-r ] do
        for j in [ 1 .. i-1 ] do
          gram[j][i]:= gram[i][j];
        od;
      od;

    else

      # get the triangular matrix
      gram:= gram{ [ r+1 .. n ] };
      for i in [ 1 .. n-r ] do
        gram[i]:= gram[i]{ [ r+1 .. r+i ] };
      od;

    fi;

    InfoLattice1( "#I LLLReducedGramMat returns matrix of length ", n-r,
                  "\n" );

    return rec( remainder      := gram,
                relation       := H{ [  1  .. r ] },
                transformation := H{ [ r+1 .. n ] },
                scalarproducts := mue,
                bsnorms        := B{ [ r+1 .. n ] }    );

    # The components 'scalarproducts' and 'bsnorms' are used by
    # 'ShortestVectors'.

    end;


#############################################################################
##  \Section{LLL}%
##  \index{LLL algorithm!for characters}%
##  \index{short vectors spanning a lattice}%
##  \index{lattice base reduction}
##  
#F  'LLL( <tbl>, <characters> [, <y>] [, \"sort\"] [, \"linearcomb\"] )'
##
##  calls the LLL algorithm (see "LLLReducedBasis") in the case of lattices
##  spanned by (virtual) characters <characters> of the character table <tbl>
##  (see "ScalarProduct").  By finding shorter vectors in the lattice spanned
##  by <characters>, i.e.  virtual characters of smaller norm, in some cases
##  'LLL' is able to find irreducible characters.
##  
##  'LLL' returns a record with at least components 'irreducibles' (the list
##  of found irreducible characters), 'remainders' (a list of reducible
##  virtual characters), and 'norms' (the list of norms of 'remainders').
##  'irreducibles' together with 'remainders' span the same lattice as
##  <characters>.
##  
##  There are some optional parameters\:
##  
##  <y>:\\ controls the sensitivity of the algorithm; the value of <y> must
##         be between $1/4$ and 1, the default value is $3/4$.
##  
##  '\"sort\"':\\
##         'LLL' sorts <characters> and the 'remainders' component of the
##         result according to the degrees.
##  
##  '\"linearcomb\"':\\ The returned record contains components 'irreddecomp'
##         and 'reddecomp' which are decomposition matrices of 'irreducibles'
##         and 'remainders', with respect to <characters>.
##  
##  |    gap> s4:= CharTable( "Symmetric", 4 );;
##      gap> chars:= [ [ 8, 0, 0, -1, 0 ], [ 6, 0, 2, 0, 2 ],
##      >     [ 12, 0, -4, 0, 0 ], [ 6, 0, -2, 0, 0 ], [ 24, 0, 0, 0, 0 ],
##      >     [ 12, 0, 4, 0, 0 ], [ 6, 0, 2, 0, -2 ], [ 12, -2, 0, 0, 0 ],
##      >     [ 8, 0, 0, 2, 0 ], [ 12, 2, 0, 0, 0 ], [ 1, 1, 1, 1, 1 ] ];;
##      gap> LLL( s4, chars );
##      rec(
##        irreducibles :=
##         [ [ 2, 0, 2, -1, 0 ], [ 1, 1, 1, 1, 1 ], [ 3, 1, -1, 0, -1 ], 
##            [ 3, -1, -1, 0, 1 ], [ 1, -1, 1, 1, -1 ] ],
##        remainders := [  ],
##        norms := [  ] )|
##  
LLL := function( arg )

    local i,      # loop variable
          lll,    # result
          perm,   # permutation arising from sorting characters
          y,      # optional argument <y>
          scpr;   # scalar product

    # 1. Check the arguments.
    if   Length( arg ) < 2 or Length( arg ) > 5
       or not ( IsRec( arg[1] ) and IsBound( arg[1].operations ) 
                and ( IsBound( arg[1].operations.ScalarProduct ) or
                      IsBound( arg[1].operations.NoMessageScalarProduct ) ) )
      then
    
      Error( "usage: ",
             "LLL( <tbl>, <chars> [,<y>][,\"sort\"][,\"linearcomb\"] )" );
    fi;

    # 2. Get the arguments.
    if "sort" in arg then
      arg[2]:= ShallowCopy( arg[2] );
      perm:= SortCharactersCharTable( arg[1], arg[2], "degree" ) ^ -1;
    fi;
    if IsBound( arg[3] ) and IsRat( arg[3] ) then
      y:= arg[3];
    else
      y:= 3/4;
    fi;

    # 3. Call the LLL algorithm.
    if "linearcomb" in arg then
      lll:= LLLReducedBasis( arg[1], arg[2], y, "linearcomb" );
    else
      lll:= LLLReducedBasis( arg[1], arg[2], y );
    fi;

    # 4. Sort the relations and transformation if necessary.
    if "sort" in arg and "linearcomb" in arg then
      lll.relations:= List( lll.relations, x -> Permuted( x, perm ) );
      lll.transformation:= List( lll.transformation,
                                 x -> Permuted( x, perm ) );
    fi;

    # 5. Add the components used by the character table functions.
    lll.irreducibles  := [];
    lll.remainders    := [];
    lll.norms         := [];
    if IsBound( lll.transformation ) then
      lll.irreddecomp := [];
      lll.reddecomp   := [];
    fi;

    for i in [ 1 .. Length( lll.basis ) ] do

      if lll.basis[i][1] < 0 then 
        lll.basis[i]:= - lll.basis[i];
        if IsBound( lll.transformation ) then
          lll.transformation[i]:= - lll.transformation[i];
        fi;
      fi;
      scpr:= ScalarProduct( arg[1], lll.basis[i], lll.basis[i] );
      if scpr = 1 then
        Add( lll.irreducibles, lll.basis[i] );
        if IsBound( lll.transformation ) then
          Add( lll.irreddecomp, lll.transformation[i] );
        fi;
      else
        Add( lll.remainders, lll.basis[i] );
        Add( lll.norms, scpr );
        if IsBound( lll.transformation ) then
          Add( lll.reddecomp,   lll.transformation[i] );
        fi;
      fi;

    od;

    if Length( lll.irreducibles ) > 0 then
      InfoCharTable2( "#I  LLL: ", Length( lll.irreducibles ),
                      " irreducibles found\n" );
    fi;

    # 6. Sort 'remainders' component if necessary.
    if "sort" in arg then
      perm:= SortCharactersCharTable( arg[1], lll.remainders, "degree" );
      lll.norms:= Permuted( lll.norms, perm );
      if "linearcomb" in arg then
        lll.reddecomp:= Permuted( lll.reddecomp, perm );
      fi;
    fi;

    # 7. Unbind components not used for characters.
    Unbind( lll.basis );
    Unbind( lll.transformation );

    # 8. Return the result.
    return lll;
    end;

#############################################################################
##
#F  ShortestVectors( <mat>, <bound> [, \"positive\" ] )
##
##  kurvec
##
ShortestVectors := function( arg ) 
    local
    # variables
          n, i, checkpositiv, a, llg, nullv, m, c, q, anz, con, b, v, 
    # procedures
          kur, srt, vschr;
    
    # sub-procedures
    kur := function(  )
    local l;
    for l in [1..n] do  
       v[l] := 0;
    od;
    anz := 0;
    con := true;
    srt( n, 0 );
    end;
    
    # search for shortest vectors
    srt := function( d, dam )
    local i, j, x, k, k1, q;
    if d = 0 then
       if v = nullv then
          con := false;
       else
          anz := anz + 1;
          vschr( dam );
       fi;
    else
       x := 0;
       for j in [d+1..n] do  
          x := x + v[j] * llg.scalarproducts[j][d];
       od;
       i := - Int( x );
       if AbsInt( -x-i ) * 2 - 1 > 0 then             
          i := i - SignInt( x );
       fi;
       k := i + x;
       q := ( m + 1/1000 - dam ) / llg.bsnorms[d];
       if k * k - q < 0 then
          repeat
             i := i + 1;
             k := k + 1;
          until k * k - q > 0 and k > 0;
          i := i - 1;
          k := k - 1;
          while k * k - q  < 0 and con do
             v[d] := i;
             k1 := llg.bsnorms[d] * k * k + dam;
             srt( d-1, k1 );
             i := i - 1;
             k := k - 1;
          od;
       fi;
    fi;
    end;
    
    # output of vector
    vschr := function( dam )
    local i, j, w, neg;
    c.vectors[anz] := [];
    neg := false;
    for i in [1..n] do  
       w := 0;
       for j in [1..n] do   
          w := w + v[j] * llg.transformation[j][i];
       od;
       if w < 0 then 
          neg := true;
       fi;
       c.vectors[anz][i] := w;
    od;
    if checkpositiv and neg then
       c.vectors[anz] := [];
       anz := anz - 1;
    else
       c.norms[anz] := dam;
    fi;
    end;
    
    # main program
    # check input
    if not IsBound( arg[1] ) 
    or not IsList( arg[1] ) or not IsList( arg[1][1] ) then
       Error ( "first argument must be Gram matrix\n",
          "usage: ShortestVectors( <mat>, <integer> [,<\"positive\">] )" );
    fi;
    if not IsBound( arg[2] ) or not IsInt( arg[2] ) then
       Error ( "second argument must be integer\n",
          "usage: ShortestVectors( <mat>, <integer> [,<\"positive\">] )");
    fi;
    if IsBound( arg[3] ) then
       if IsString( arg[3] ) then
          if arg[3] = "positive" then
             checkpositiv := true;
          else
             checkpositiv := false;
          fi;
       else
          Error ( "third argument must be string\n",
          "usage: ShortestVectors( <mat>, <integer> [,<\"positive\">] )");
       fi;
    else
       checkpositiv := false;
    fi;
    a := arg[1];
    m := arg[2];
    n := Length( a );
    b := [];
    for i in [1..n] do  
       b[i] := Copy( a[i] );
    od;
    c    := rec( vectors:=[],norms:=[]);
    v    := [];
    nullv := [];
    for i in [1..n] do  
       nullv[i] := 0;
    od;
    llg:=LLLReducedGramMat(b);
    kur();
    InfoCharTable2( "#I ShortestVectors: ",
                    Length( c.vectors ), " vectors found\n" );
    return( c );
    end;


#############################################################################
##
#F  Extract( <tbl>, <reducibles>, <gram-matrix> [, <missing> ] )
##
Extract := function( arg )
    local  
    
    # indices
          i, j, k, l, n,
    # input arrays
          tbl, y, gram, missing,
    # booleans
          deeper, iszero, used, nullbegin, nonmissing,
          maxnorm, minnorm, normbound, maxsum, solmat, 
          f, squares, sfind, choicecollect, sequence,
          dependies, solcollect, sum, solcount, max, sumac, kmax, 
          solution, 
    # functions
          next, zeroset, possiblies, update, correctnorm,  
          maxsquare, square, ident, begin;
    
    # choosing next vector for combination
    next := function( lines, solumat, acidx )
    local i, j, solmat, testvec, idxback;
    
    while acidx <= n and k + n - acidx >= kmax do
       solmat := Copy( solumat );
       if k = 0 then
          i := acidx;
          while i <= n and not begin( sequence[i] ) do
             i := i + 1;
          od;
          if i > n then
             nullbegin := true;
          else
             nullbegin := false;
             if i > acidx then
                idxback := sequence[i];
                for j in [acidx + 1..1] do
                   sequence[j] := sequence[j -1];
                od;
                sequence[acidx] := idxback;
             fi;
          fi;
       fi;
       k := k + 1;
       f[k] := sequence[acidx];
       testvec := [];
       for i in [1..k] do 
          testvec[i] := gram[f[k]][f[i]];
       od;
       zeroset( solmat, testvec, lines );
       acidx := acidx + 1; 
       possiblies( 1, solmat, testvec, acidx, lines );
       k := k - 1;
    od;
    end;
    
    # filling zero in places that fill already the conditions
    zeroset := function( solmat, testvec, lines )
    local i, j;
    
    for i in [1..k-1] do  
       if testvec[i] = 0 then
          for j in [1..lines] do  
             if solmat[j][i] <> 0 and not IsBound( solmat[j][k] ) then 
                solmat[j][k] := 0;
             fi;
          od;
       fi;
    od;
    end;
    
    # try and error for the chosen vector
    possiblies := function( start, solmat, testvect, acidx, lines )
    local i, j, remainder, toogreat, equal, solmatback, testvec;
    
    testvec := Copy( testvect );
    toogreat := false;
    equal := true; 
    if k > 1 then
       for i in [1..k-1] do    
          if testvec[i] < 0 then
             toogreat := true;
          fi;
          if testvec[i] <> 0 then
             equal := false;
          fi;
       od;
       if testvec[k] < 0 then
          toogreat := true;
       fi;
    else
       if not nullbegin then
          while start <= gram[f[k]][f[k]] and start < missing do
             solmat[start][k] := 1;
             start := start + 1;
          od;
          testvec[k] := 0;
          if gram[f[k]][f[k]] > lines then
             lines := gram[f[k]][f[k]];
          fi;
       else
          lines := 0;
       fi;
    fi;
    if not equal and not toogreat then
       while start < lines and IsBound( solmat[start][k] ) do
          start := start + 1;
       od;
       if start <= lines and not IsBound( solmat[start][k] ) then
          solmat[start][k] := 0;
          while not toogreat and not equal do
             solmat[start][k] := solmat[start][k] + 1;
             testvec := update( -1, testvec, start, solmat );
             equal := true;
             for i in [1..k-1] do    
                if testvec[i] < 0 then
                   toogreat := true;
                fi;
                if testvec[i] <> 0 then
                   equal := false;
                fi;
             od;
             if testvec[k] < 0 then
                toogreat := true;
             fi;
          od;
       fi;
    fi;
    if equal and not toogreat then 
       solmatback := Copy( solmat );
       for i in [1..missing] do          
          if not IsBound( solmat[i][k] ) then        
             solmat[i][k] := 0;
          fi;
       od;
       correctnorm( testvec[k], solmat, lines + 1, testvec[k], acidx, lines );
       solmat := Copy( solmatback );
    fi;
    if k > 1 then
       while start <= lines and solmat[start][k] > 0 do
          solmat[start][k] := solmat[start][k] - 1;
          testvec := update( 1, testvec, start, solmat );
          solmatback := Copy( solmat );
          zeroset( solmat, testvec, lines );
          deeper := false;
          for i in [1..k-1] do
             if solmat[start][i] <> 0 then
                deeper := false;
                if testvec[i] = 0 then
                   deeper := true;
                else 
                   for j in [1..missing] do
                      if solmat[j][i] <> 0 and not IsBound(solmat[j][k]) then 
                        deeper := true;
                      fi;
                   od;
                fi;
             fi;
          od;
          if deeper then
             possiblies( start + 1, solmat, testvec, acidx, lines );
          fi;
          solmat := Copy( solmatback );
       od;
    fi;
    end;
    
    # update the remaining conditions to fill
    update := function( x, testvec, start, solmat )
    local i;
    for i in [1..k-1] do    
       if solmat[start][i] <> 0 then
          testvec[i] := testvec[i] + solmat[start][i] * x;
       fi;
    od;
    testvec[k] := testvec[k] - square( solmat[start][k] ) 
                             + square( solmat[start][k] + x );
    return( testvec );
    end;
    
    # correct the norm if all other conditions are filled
    correctnorm := function( remainder, solmat, pos, max, acidx, lines )           
    local i, r, newsol, ret;
    if remainder = 0 and pos <= missing + 1 then
       newsol := true;
       for i in [1..solcount[k]] do
          if ident( solcollect[k][i], solmat ) = missing then
             newsol := false;
          fi;
       od;
       if newsol then
          if k > kmax then
             kmax := k;
          fi;
          solcount[k] := solcount[k] + 1;
          solcollect[k][solcount[k]] := [];
          choicecollect[k][solcount[k]] := Copy( f );
          for i in [1..Length( solmat )] do
             solcollect[k][solcount[k]][i] := Copy( solmat[i] );
          od;
          if k = n and pos = missing + 1 then
             ret := 0;
          else
             ret := max;
             if k <> n then
                next( lines, solmat, acidx );
             fi;
          fi;
       else 
          ret := max;
       fi;
    else
       if pos <= missing then
          i := maxsquare( remainder, max );
          while i > 0 do
             solmat[pos][k] := i;
             i := correctnorm( remainder-square( i ), 
                               solmat, pos+1, i, acidx, lines + 1);
             i := i - 1;
          od;
          if i < 0 then
             ret := 0;
          else
             ret := max;
          fi;
       else
          ret := 0;
       fi;
    fi;
    return( ret );
    end;
    
    # compute the maximum squarenumber lower then given integer
    maxsquare := function( value, max ) 
    local i;
    
    i := 1;
    while square( i ) <= value and i <= max do
          i := i + 1;
    od;
    return( i-1 );
    end;
    
    square := function( i ) 
    if i = 0 then
       return( 0 );
    else
       if not IsBound( squares[i] ) then
          squares[i] := i * i;
       fi;
       return( squares[i] );
    fi;
    end;
    
    ident := function( a, b ) 
    # lists the identities of the two given sequences and counts them
    local i, j, k, zi, zz, la, lb;
    la := Length( a );
    lb := Length( b );
    zi := [];
    zz := 0;
    for i in [1..la] do  
       j := 1;
       repeat 
          if a[i] = b[j] then
             k :=1;
             while k <= zz and j <> zi[k] do
                k := k + 1;
             od;
             if k > zz then
                zz := k;
                zi[zz] := j;
                j := lb;
             fi;
          fi;
          j := j + 1;
       until j > lb;
    od;
    return( zz );
    end;
    
    # looking for character that can stand at the beginning
    begin := function( i )
    local ind;
    if y = [] or gram[i][i] < 4 then
       return true;
    else
       if IsBound( tbl.powermap ) and IsBound( tbl.powermap[2] ) then
          if IsList( tbl.powermap[2] ) and ForAll( tbl.powermap[2], IsInt ) then
             ind := AbsInt( Indicator( tbl, [y[i]], 2 )[1]);
             if gram[i][i] - 1 <= ind 
             or ( gram[i][i] = 4 and ind = 1 ) then
                return true;
             fi;
          fi;
       fi;
    fi;
    return false;
    end;
    
    # check input parameters
    if IsCharTable( arg[1] ) then
       tbl := arg[1];
    else
       Error( "first argument must be character-table\n \
    usage: Extract( <tbl>, <reducibles>, <gram-matrix> [, <missing>] )" );
    fi;
    if IsBound( arg[2] ) and IsList( arg[2] ) and IsList( arg[2][1] ) then
       y := Copy( arg[2] );
    else
       Error( "second argument must be list of reducible characters\n \
    usage: Extract( <tbl>, <reducibles>, <gram-matrix> [, <missing>] )" );
    fi;
    if IsBound( arg[2] ) and IsList( arg[3] ) and IsList( arg[3][1] ) then
       gram := Copy( arg[3] );
    else
       Error( "third argument must be gram-matrix of reducible characters\n \
    usage: Extract( <tbl>, <reducibles>, <gram-matrix> [, <missing>] )" );
    fi;
    n := Length( gram );
    if IsBound( arg[4] ) and IsInt( arg[4] ) then
       missing := arg[4];
    else
       missing := n;
       nonmissing := true;
    fi;
    
    # main program
    maxnorm := 0;
    minnorm := gram[1][1];
    normbound := [];
    maxsum := [];
    solcollect := [];
    choicecollect := [];
    sum := [];
    solmat := [];
    used := [];
    solcount := [];
    sfind := [];
    f := [];
    squares := [];
    kmax := 0;
    for i in [1..missing] do
       solmat[i] := [];
    od;
    for i in [1..n] do  
       solcount[i] := 0;
       used[i] := false;
       solcollect[i] := [];
       choicecollect[i] := [];
    od;
    for i in [1..n] do  
       if gram[i][i] > maxnorm then
          maxnorm := gram[i][i];
       else
          if gram[i][i] < minnorm then
             minnorm := gram[i][i];
          fi;
       fi; 
    od;
    j := 0;
    for i in [minnorm..maxnorm] do
       k := 1;
       while k <= n and gram[k][k] <> i do
          k := k + 1;
       od;
       if k <= n then
           j := j + 1;
           normbound[j] := rec( norm:=i, first:=k, last:=0 );
           if k = n then
              normbound[j].last := k;
           else
              k := n;
              while gram[k][k] <> i and k > 0 do
                 k := k - 1;
              od;
              if k > 0 then
                 normbound[j].last := k;
              fi;
           fi;
       fi;
    od;
    for j in [1..Length( normbound )] do
       maxsum[j] := 0;
       for i in [normbound[j].first..normbound[j].last] do
          if gram[i][i] = normbound[j].norm then
             sum[i] := 0;
             for k in [1..n] do  
                sum[i] := sum[i] + gram[i][k];
             od;
             if sum[i] > maxsum[j] then
                maxsum[j] := sum[i];
             fi;
          fi;
       od;
    od; 
    k := 1;
    sequence := [];
    i:= 1;
    while i <= Length( normbound ) do
       max := maxsum[i];
       sumac := 0;
       for j in [normbound[i].first..normbound[i].last] do
          if gram[j][j] = normbound[i].norm and sum[j] > sumac 
          and sum[j] <= max and not used[j] then
             sequence[k] := j;
             sumac := sum[j];
          fi;
       od;
       if IsBound( sequence[k] ) then
          max := sumac;
          used[sequence[k]] := true;
          k := k + 1;
       else
          i := i + 1;
       fi;
    od;
    k := 0;
    next( 1, solmat, 1 );
    solution := rec( solution := [], choice := choicecollect[kmax] );
    for i in [1..solcount[kmax]] do
       solution.solution[i] := [];
       l := 0;
       for j in [1..missing] do
          iszero := true;
          for k in [1..kmax] do
             if solcollect[kmax][i][j][k] <> 0 then
                iszero := false;
             fi;
          od;
          if not iszero then
             l := l + 1;
             solution.solution[i][l] := solcollect[kmax][i][j];  
          fi;
       od;
    od;
    return( solution );
    end;


#############################################################################
##
#F  Decreased( <tbl>, <chars>, <decompmat>, [ <choice> ] )
##
Decreased := function( arg ) 
    local 
        # indices
          m, n, m1, n1, i, i1, i2, i3, i4, j, jj, j1, j2, j3, 
        # booleans
          ende1, ende2, ok, change, delline, delcolumn,
        # help fields
          deleted, kgv, l1, l2, l3, dim, ident, 
        # matrices
          invmat, remmat, remmat2, solmat, nonzero, 
        # double-indices
          columnidx, lineidx, system, components, compo2, 
        # output-fields
          sol, red, redcount, irred,
        # help fields
          IRS, SFI, lc, nc, char, char1, entries, 
        # input fields
          tbl, y, solmat, choice, 
        # functions
          Idxset, Identset, Invadd, Invmult, Nonzeroset;
    
    Idxset := function()
    # update indices
    local i1, j1;
    i1 := 0;
    for i in [1..m] do
       if not delline[i] then
          i1 := i1 + 1;
          lineidx[i1] := i;
       fi;
    od;
    m1 := i1;
    j1 := 0;
    for j in [1..n] do
       if not delcolumn[j] then
          j1 := j1 + 1;
          columnidx[j1] := j;
       fi;
    od;
    n1 := j1;
    end;
    
    Identset := function( veca, vecb )
    # count identities of veca and vecb and store "non-identities"
    local la, lb, i, j, n, nonid, nic, r;
    n := 0;
    la := Length( veca );
    lb := Length( vecb );
    j := 1;
    nonid := [];
    nic := 0;
    for i in [1..la] do  
       while j <= lb and veca[i] > vecb[j] do
          nic := nic + 1;
          nonid[nic] := vecb[j];
          j := j + 1;
       od;
       if j <= lb and veca[i] = vecb[j] then
          n := n + 1;
          j := j + 1;
       fi;
    od;
    while j <= lb do
       nic := nic + 1;
       nonid[nic] := vecb[j];
       j := j + 1;
    od;
    r := rec( nonid := nonid, id := n  );
    return( r );
    end;
    
    Invadd := function( j1, j2, l )
    # addition of two lines of invmat
    local i;
    for i in [1..n] do  
       if invmat[i][j2] <> 0 then
          invmat[i][j1] := invmat[i][j1] - l * invmat[i][j2];
       fi;
    od;
    end;
    
    Invmult := function( j1, l )
    # multiply line of invmat
    local i;
    if l <> 1 then
       for i in [1..n] do  
          if invmat[i][j1] <> 0 then
             invmat[i][j1] := invmat[i][j1] * l;
          fi;
       od;
    fi;
    end;
    
    Nonzeroset := function( j ) 
    # entries <> 0 in j-th column
    
    local i, j1;
    nonzero[j] := [];
    j1 := 0;
    for i in [1..m] do  
       if solmat[i][j] <> 0 then
          j1 := j1 + 1;
          nonzero[j][j1] := i;
       fi;
    od;
    entries[j] := j1;
    end;
    
    # check input parameters
    if IsCharTable( arg[1] ) then
       tbl := arg[1];
    else
       Error( "first argument must be character-table\n",
              "usage: Decreased( <tbl>, <list of char>,\n", 
              "<decomposition-matrix>, [<choice>] )" );
    fi;
    if IsList( arg[2] ) and IsList( arg[2][1] ) then
       y := arg[2];
    else
       Error( "second argument must be list of characters\n",
              "usage: Decreased( <tbl>, <list of char>,\n", 
              "<decomposition-matrix>, [<choice>] )" );
    fi;
    if IsList( arg[3] ) and IsList( arg[3][1] ) then
       solmat := Copy( arg[3] );
    else
       Error( "third argument must be decomposition matrix\n",
              "usage: Decreased( <tbl>, <list of char>,\n", 
              "<decomposition-matrix>, [<choice>] )" );
    fi;
    if not IsBound( arg[4] ) then
       choice := [];
       for i in [1..Length( y )] do
          choice[i] := i;
       od;
    else
       if IsList( arg[4] ) then
          choice := arg[4];
       else
          Error( "forth argument contains choice of characters\n",
              "usage: Decreased( <tbl>, <list of char>,\n", 
              "<decomposition-matrix>, [<choice>] )" );
       fi;
    fi;
     
    # initialisations
    lc := Length( y[1] );
    nc := [];
    for i in [1..lc] do  
       nc[i] := 0;
    od;
    columnidx := [];
    lineidx   := [];
    nonzero   := [];
    entries   := [];
    delline   := [];
    delcolumn := [];

    # number of lines
    m := Length( solmat );

    # number of columns
    n := Length( solmat[1] );
    invmat := [];
    for i in [1..n] do
       invmat[i] := [];
       for j in [1..n] do
          invmat[i][j] := 0;
       od;
    od;
    invmat := invmat^0;
    for i in [1..m] do  
       delline[i] := false;
    od;
    for j in [1..n] do   
       delcolumn[j] := false;
    od;
    i := 1;

    # check lines for information
    while i <= m do
       if not delline[i] then
          entries[i] := 0;
          for j in [1..n] do  
             if solmat[i][j] <> 0 and not delcolumn[j] then
                entries[i] := entries[i] + 1;
                if entries[i] = 1 then
                   nonzero[i] := j;
                fi;
             fi;
          od;
          if entries[i] = 1 then
             delcolumn[nonzero[i]] := true;
             delline[i] := true;
             j := 1; 
             while j < i and solmat[j][nonzero[i]] = 0 do
                j := j + 1;
             od;
             if j < i then
                i := j;
             else
                i := i + 1;
             fi;
          else
             if entries[i] = 0 then
                delline[i] := true;
             fi;
             i := i + 1;
          fi;
       else
          i := i + 1;
       fi;
    od;
    Idxset();
    
    deleted := m - Length(lineidx);
    for j in [1..n] do  
       Nonzeroset( j );
    od;
    ende1 := false;
    while not ende1 and deleted < m do
       j := 1;

    # check solo-entry-columns
       while j <= n do
          if entries[j] = 1 then
             change := false;
             for jj in [1..n] do  
                if (delcolumn[j] and delcolumn[jj])
                or not delcolumn[j] then
                   if solmat[nonzero[j][1]][jj] <> 0 and jj <> j then 
                      change := true;
                      kgv := Lcm( solmat[nonzero[j][1]][j], 
                              solmat[nonzero[j][1]][jj] );
                      l1 := kgv / solmat[nonzero[j][1]][jj];
                      Invmult( jj, l1 );
                      for i1 in [1..Length( nonzero[jj] )] do
                         solmat[nonzero[jj][i1]][jj] 
                               := solmat[nonzero[jj][i1]][jj] * l1;
                      od;
                      Invadd( jj, j, kgv/solmat[nonzero[j][1]][j] );
                      solmat[nonzero[j][1]][jj] := 0;
                      Nonzeroset( jj );
                   fi;
                fi;
             od;
             if not delline[nonzero[j][1]] then
                delline[nonzero[j][1]] := true;
                delcolumn[j] := true;
                deleted := deleted + 1;
                Idxset();
             fi;
             if change then
                j := 1;
             else
                j := j + 1;
             fi;
          else
             j := j + 1;
          fi;
       od;

    # search for Equality-System
    # system :     chosen columns
    # components : entries <> 0 in the chosen columns
       dim := 2;
       change := false;
       ende2 := false;
       while dim <= n1 and not ende2 do
          j3 := 1;
          while j3 <= n1 and not ende2 do
             j2 := j3;
             j1 := 0;
             system := [];
             components := [];
             while j2 <= n1 do
                while j2 <= n1 and entries[columnidx[j2]] > dim do
                   j2 := j2 + 1;
                od;
                if j2 <= n1 then
                   if j1 = 0 then
                      j1 := 1;
                      system[j1] := columnidx[j2];
                      components := Copy( nonzero[columnidx[j2]] );
                   else
                      ident := Identset( components, nonzero[columnidx[j2]] );
                      if dim - Length( components ) >= entries[columnidx[j2]]
                             - ident.id then
                         j1 := j1 + 1;
                         system[j1] := columnidx[j2];
                         if ident.id < entries[columnidx[j2]] then
                            compo2 := Copy( components );
                            components := [];
                            i1 := 1;
                            i2 := 1;
                            i3 := 1;

    # append new entries to "components"
                            while i1 <= Length( ident.nonid )
                               or i2 <= Length( compo2 ) do
                               if i1 <= Length( ident.nonid ) then
                                  if i2 <= Length( compo2 ) then
                                     if ident.nonid[i1] < compo2[i2] then
                                        components[i3] := ident.nonid[i1];
                                        i1 := i1 + 1;
                                     else
                                        components[i3] := compo2[i2];
                                        i2 := i2 + 1;
                                     fi;
                                  else
                                     components[i3] := ident.nonid[i1];
                                     i1 := i1 + 1;
                                  fi;
                               else
                                  if i2 <= Length( compo2 ) then
                                     components[i3] := compo2[i2];
                                     i2 := i2 + 1;
                                  fi;
                               fi;
                               i3 := i3 + 1;
                            od;
                         fi;
                      fi;
                   fi;
                   j2 := j2 + 1;
                fi;
             od;

    # try to solve system with Gauss
             if  Length( system ) > 1 then
                for i1 in [1..Length( components )] do
                   i2 := 1;
                   repeat
                      ok := true;
                      if solmat[components[i1]][system[i2]] = 0 then
                         ok := false;
                      else
                         for i3 in [1..i1-1] do    
                            if solmat[components[i3]][system[i2]] <> 0 then
                               ok := false;
                            fi;
                         od;
                      fi;
                      if not ok then
                         i2 := i2 + 1;
                      fi;
                   until ok or i2 > Length( system );
                   if ok then
                      for i3 in [1..Length( system )] do
                         if i3 <> i2 
                            and solmat[components[i1]][system[i3]] <> 0 then
                            change := true;
                            kgv := Lcm( solmat[components[i1]][system[i3]], 
                                       solmat[components[i1]][system[i2]] );
                            l2 := kgv / solmat[components[i1]][system[i2]];
                            l3 := kgv / solmat[components[i1]][system[i3]];
                            for i4 in [1..Length( nonzero[system[i3]] )] do
                               solmat[nonzero[system[i3]][i4]][system[i3]]
                            := solmat[nonzero[system[i3]][i4]][system[i3]]*l3;
                            od;
                            Invmult( system[i3], l3 );
                            for i4 in [1..Length( nonzero[system[i2]] )] do
                               solmat[nonzero[system[i2]][i4]][system[i3]]
                               := solmat[nonzero[system[i2]][i4]][system[i3]]
                            -  solmat[nonzero[system[i2]][i4]][system[i2]]*l2;
                            od;
                            Invadd( system[i3], system[i2], l2 );
                            Nonzeroset( system[i3] );
                            if entries[system[i3]] = 0 then
                               delcolumn[system[i3]] := true;
                               Idxset();
                            fi;
                         fi;
                      od;
                   fi;
                od;

   # check for columns with only one entry <> 0
                for i1 in [1..Length( system )] do
                   if entries[system[i1]] = 1 then
                      ende2 := true;
                   fi;
                od;
                if not ende2 then
                   j3 := j3 + 1;
                fi;
             else
                j3 := j3 + 1;
             fi;
          od;
          dim := dim + 1;
       od;
       if dim > n1 and not change and j3 > n1 then
          ende1 := true;
       fi;
    od;
    
    # check, if
    #    the transformation of solmat allows computation of new irreducibles
    remmat := [];
    for i in [1..m] do  
       remmat[i] := [];
       delline[i] := true;
    od;
    redcount := 0;
    red := [];
    irred := [];
    j := 1;
    sol := true;
    while j <= n and sol do

    # computation of character
       char := Copy( nc );
       for i in [1..n] do  
          if invmat[i][j] <> 0 then
             char := char + invmat[i][j] * y[choice[i]];
          fi;
       od;

    # probably irreducible ==> has to pass tests
       if entries[j] = 1 then
          if solmat[nonzero[j][1]][j] <> 1 then
             char1 := char/solmat[nonzero[j][1]][j];
          else
             char1 := char;
          fi;
          if char1[1] < 0 then
             char1 := - char1;
          fi;

    # is 'char1' real?
          IRS := ForAll( char1, x -> GaloisCyc(x,-1) = x );

   # Frobenius Schur indicator
          if IsBound( tbl.powermap ) and IsBound( tbl.powermap[2] ) then
             SFI:= Indicator( tbl, [ char1 ], 2 )[1];
          else
             SFI:= Unknown();
          fi;
          if IsUnknown( SFI ) then
             InfoCharTable2( "#I Decreased: 2nd power map not available ",
                             "or not unique,\n",
                             "#I  no test with 'Indicator'\n" );
          fi;

   # test if 'char1' can be an irreducible character
          if ForAny( char1, x -> IsRat(x) and not IsInt(x) ) 
             or ScalarProduct( tbl, char1, char1 ) <> 1 
             or char1[1] = 0
             or ( IsInt( SFI ) and ( ( IRS and AbsInt( SFI ) <> 1 ) or
                                     ( not IRS and SFI <> 0 ) ) )   then
            InfoCharTable2( "#E Decreased : computation of ",
                  Ordinal( Length( irred ) ), " character failed\n" );
            return false;   
          else

    # irreducible character found
            Add( irred, Copy( char1 ) );
          fi;
       else

    # what a pity (!), some reducible character remaining
          if char[1] < 0 then
             char := - char;
          fi;
          if char <> nc then
             redcount := redcount + 1;
             red[redcount] := Copy( char );
             for i in [1..m] do  
                remmat[i][redcount] := solmat[i][j];
                if solmat[i][j] <> 0 then
                   delline[i] := false;
                fi;
             od;
          fi;
       fi;
       j := j+1;
    od;
    i1 := 0;
    remmat2 := [];
    for i in [1..m] do  
       if not delline[i] then
          i1 := i1 + 1;
          remmat2[i1] := remmat[i];
       fi;
    od;
    return rec( irreducibles := irred,
                remainders := red, matrix := remmat2 );
    end;


#############################################################################
##
#F  OrthogonalEmbeddings( <grammat> [, \"positive\" ] [, <integer> ] )
##
OrthogonalEmbeddings := function( arg )
    local 
    # sonstige prozeduren
          Symmatinv,
    # variablen fuer Embed
          maxdim, M, D, s, phi, mult, m, x, t, x2, sumg, sumh, 
          f, invg, sol, solcount, out, 
          l, g, nullv, i, j, k, n, kgv, a, IdMat, chpo,
    # booleans
          positiv, checkpositiv, checkdim,
    # prozeduren fuer Embed
          comp1, comp2, scp2, multiples, solvevDMtr, 
          Dextend, Mextend, inca, rnew,
          deca, algorithm;
    
    Symmatinv := function( b )
    # inverts symmetric matrices
    
    local n, i, j, l, k, c, d, ba, B, kgv, kgv1;
    n := Length( b );
    c := Copy( IdMat );
    d := [];
    B := [];
    kgv1 := 1;
    ba := Copy( IdMat );
    for i in [1..n] do  
       k := b[i][i];
       for j in [1..i-1] do  
          k := k - c[i][j] * c[i][j] * B[j];
       od;
       B[i] := k;
       for j in [i+1..n] do  
          k := b[j][i];
          for l in [1..i-1] do  
             k := k - c[i][l] * c[j][l] * B[l];
          od;
          if B[i] <> 0 then
             c[j][i] := k / B[i];
          else
             Error ( "matrix not invertable, ", Ordinal( i ), 
                     " column is linearly dependent" );
          fi;
       od;
    od;
    if B[n] = 0 then
       Error ( "matrix not invertable, ", Ordinal( i ), 
               " column is linearly dependent" );
    fi;
    for i in [1..n-1] do
       for j in [i+1..n] do  
          if c[j][i] <> 0 then
             for l in [1..i] do  
                ba[j][l] := ba[j][l] - c[j][i] * ba[i][l];
             od;
          fi;
       od;
    od;
    for i in [1..n] do  
       for j in [1..i-1] do  
          ba[j][i] := ba[i][j];
          ba[i][j] := ba[i][j] / B[i];
       od;
       ba[i][i] := 1/B[i];
    od;
    for i in [1..n] do  
       d[i] := [];
       for j in [1..n] do  
          if i >= j then
             k := ba[i][j];
             l := i + 1;
          else
             l := j;
             k := 0;
          fi;
          while l <= n do
             k := k + ba[i][l] * ba[l][j];
             l := l + 1;
          od;
          d[i][j] := k;
          kgv1 := Lcm( kgv1, Denominator( k ) );
       od;
    od;
    for i in [1..n] do  
       for j in [1..n] do  
          d[i][j] := kgv1 * d[i][j];
       od;
    od;
    return rec( inverse := d, enuminator := kgv1 );
    end;
    
    # program embed
     
    comp1 := function( a, b ) 
    local i;
    if ( a[n+1] < b[n+1] ) then
      return false;
    elif ( a[n+1] > b[n+1] ) then
      return true;
    else
      for i in [ 1 .. n ] do
        if AbsInt( a[i] ) > AbsInt( b[i] ) then  
          return true;
        elif AbsInt( a[i] ) < AbsInt( b[i] ) then
          return false;
        fi;
      od;
    fi;
    return false;
    end;
    
    comp2 := function( a, b )
    local i, t;
    t := Length(a)-1;
    if a[t+1] < b[t+1] then
      return true;
    elif a[t+1] > b[t+1] then
      return false;
    else
      for i in [ 1 .. t ] do
        if a[i] < b[i] then
          return false;
        elif a[i] > b[i] then
          return true;
        fi;
      od;
    fi;
    return false;
    end;
    
    scp2 := function( k, l )
    # uses    x, invg, 
    # changes 
    local   i, j, sum, sum1;
    
    sum := 0;
    for i in [1..n] do
       sum1 := 0;
       for j in [1..n] do  
          sum1 := sum1 + x[k][j] * invg[j][i];
       od;
       sum := sum + sum1 * x[l][i];
    od;
    return sum;
    end;
    
    multiples := function( l )
    # uses    m, phi, 
    # changes mult, s, k, a, sumh, sumg, 
    local   v, r, i, j, break;
    
    for j in [1..n] do  
       sumh[j] := 0;
    od;
    i := l;
    while i <= t and ( not checkdim or s <= maxdim ) do
       if mult[i] * phi[i][i] < m then
          break := false;
          repeat
             v := solvevDMtr( i );
             if not IsBound( v[1] ) or not IsList( v[1] ) then
                r := rnew( v, i );
                if r >= 0 then
                   if r > 0 then
                      Dextend( r );
                   fi;
                   Mextend( v, i );
                   a[i] := a[i] + 1;
                else
                   break := true;
                fi;
             else
                break := true;
             fi;
          until a[i] * phi[i][i] >= m or ( checkdim and s > maxdim )
                or break;
          mult[i] := a[i];
          while a[i] > 0 do
             s := s - 1;
             if M[s][Length( M[s] )] = 1 then
                k := k -1;
             fi;
             a[i] := a[i] - 1;
          od;
       fi;  
       if mult[i] <> 0 then
          for j in [1..n] do  
             sumh[j] := sumh[j] + mult[i] * x2[i][j];
          od;
       fi;
       i := i + 1;
    od;
    end;
    
    solvevDMtr := function( l )
    #  uses    M, D, phi, f, 
    #  changes 
    local   M1, M2, i, j, k1, v, sum;
    
    k1 := 1;
    v := [];
    i := 1;
    while i < s do
       sum := 0;
       M1 := Length( M[i] );
       M2 := M[i][M1];
       for j in [1..M1-1] do  
          sum := sum + v[j] * M[i][j];
       od;
       if M2 = 1 then
          v[k1] := -( phi[l][f[i]] + sum ) / D[k1];
          k1 := k1 + 1;
       else
          if Denominator( sum ) <> 1
          or Numerator( sum ) <> -phi[l][f[i]] then
             v[1] := [];
             i := s;
          fi;
       fi;
       i := i + 1;
    od;
    return( v );
    end;
    
    inca := function( l )
    #  uses    x2, 
    #  changes l, a, sumg, sumh, 
    local   v, r, break, i;
    
    while l <= t and ( not checkdim or s <= maxdim ) do
       break := false;
       repeat
          v := solvevDMtr( l );
          if not IsBound( v[1] ) or not IsList( v[1] ) then
             r := rnew( v, l );
             if r >= 0 then
                if r > 0 then
                   Dextend( r );
                fi;
                Mextend( v, l );
                a[l] := a[l] + 1;
                for i in [1..n] do  
                   sumg[i] := sumg[i] + x2[l][i];
                od;
             else
                break := true;
             fi;
          else
             break := true;
          fi;
       until a[l] >= mult[l] or ( checkdim and s > maxdim ) or break;
       mult[l] := 0;
       l := l + 1;
    od;
    return l; 
    end; 
    
    rnew := function( v, l )
    #  uses    phi, m, k, D, 
    #  changes v, 
    local   sum, i;
    sum := m - phi[l][l];
    for i in [1..k-1] do  
       sum := sum - v[i] * D[i] * v[i];
    od;
    if sum >= 0 then
     if sum > 0 then
       v[k] := 1;
     else
       v[k] := 0;
     fi;
    fi;
    return sum;
    end;
    
    Mextend := function( line, l ) 
    #  uses    D,  
    #  changes M, s, f, 
    local   i;
    for i in [1..Length( line )-1] do
       line[i] := line[i] * D[i];
    od;
    M[s] := line;
    f[s] := l;
    s := s + 1;
    end;
    
    Dextend := function( r )
    #  uses    a, 
    #  changes k, D, 
    D[k] := r;
    k := k + 1;
    end;
    
    deca := function( l )
    #  uses    x2, t, M, 
    #  changes l, k, s, a, sumg, 
    local   i;
    if l <> 1 then
       l := l - 1;
       if l = t - 1 then
          while a[l] > 0 do
             s := s -1;
             if M[s][Length( M[s] )] = 1 then
                k := k - 1;
             fi;
             a[l] := a[l] - 1;
             for i in [1..n] do  
                sumg[i] := sumg[i] - x2[l][i];
             od;
          od;
          l := deca( l );
       else
          if a[l] <> 0 then
             s := s - 1;
             if M[s][Length( M[s] )] = 1 then
                k := k - 1;
             fi;
             a[l] := a[l] - 1;
             for i in [1..n] do  
                sumg[i] := sumg[i] - x2[l][i];
             od;
             l := l + 1;
          else
             l := deca( l );
          fi;
       fi;
    fi;
    return l;
    end;
    
    # check input
    if not IsList( arg[1] ) or not IsList( arg[1][1] ) then 
       Error( "first argument must be symmetric Gram matrix\n",
              "usage : Orthog... ( < gram-matrix > \n",
              " [, <\"positive\"> ] [, < integer > ] )" );
    fi;
    if Length( arg[1] ) <> Length( arg[1][1] ) then
       Error( "number of lines and columns not identic\n",
              "usage : Orthog... ( < gram-matrix >\n",
              " [, <\"positive\"> ] [, < integer > ] )" );
    fi;
    g := Copy ( arg[1] );
    checkpositiv := false;
    checkdim := false;
    chpo := "xxx";
    if IsBound( arg[2] ) then
       if IsString( arg[2] ) then
          chpo := arg[2];
          if arg[2] = "positive" then
             checkpositiv := true;
          fi;
       else
          if IsInt( arg[2] ) then
             maxdim := arg[2];
             checkdim := true;
          else
             Error( "second argument must be string or integer\n",
                    "usage : Orthog... ( < gram-matrix >\n",
                    " [, <\"positive\"> ] [, < integer > ] )" );
          fi;
       fi;
    fi;
    if IsBound( arg[3] ) then
       if IsString( arg[3] ) then
          chpo := arg[3];
          if arg[3] = "positive" then
             checkpositiv := true;
          fi;
       else
          if IsInt( arg[3] ) then
             maxdim := arg[3];
             checkdim := true;
          else
             Error( "third argument must be string or integer\n",
                    "usage : Orthog... ( < gram-matrix >\n",
                    " [, <\"positive\"> ] [, < integer > ] )" );
          fi;
       fi;
    fi;
    n := Length( g );
    for i in [1..n] do  
       for j in [1..i-1] do  
          if g[i][j] <> g[j][i] then
             Error( "matrix not symmetric \n",
                    "usage : Orthog... ( < gram-matrix >\n",
                    " [, <\"positive\"> ] [, < integer > ] )" );
          fi;
       od;
    od;
    
    # main program
    IdMat := IdentityMat( n );
    invg  := Symmatinv( g );
    m     := invg.enuminator;
    invg  := invg.inverse;
    x     := ShortestVectors( invg, m, chpo );
    t     := Length(x.vectors); 
    for i in [1..t] do
       x.vectors[i][n+1] := x.norms[i];
    od;
    x    := x.vectors;
    M    := [];
    M[1] := [];
    D    := [];
    mult := [];
    sol  := [];
    f    := [];
    solcount := 0;
    s        := 1;
    k        := 1;
    l        := 1; 
    a        := [];
    for i in [1..t] do  
       a[i]      := 0;
       x[i][n+2] := 0;
       mult[i]   := 0;
    od;
    sumg := [];
    sumh := [];
    for i in [1..n] do  
       sumg[i] := 0;
       sumh[i] := 0;
    od;
    Sort(x,comp1);
    x2 := [];
    for i in [1..t] do  
       x2[i] := [];
       for j in [1..n] do  
          x2[i][j]  := x[i][j] * x[i][j];
          x[i][n+2] := x[i][n+2] + x2[i][j];
       od;
    od;
    phi := [];
    for i in [1..t] do  
       phi[i] := [];
       for j in [1..i-1] do  
          phi[i][j] := scp2( i, j );
       od;
       phi[i][i] := x[i][n+1];
    od;
    repeat
       multiples( l );

       # (former call of 'tracecond')    
       if ForAll( [ 1 .. n ], i -> g[i][i] - sumg[i] <= sumh[i] ) then
          l := inca( l );
          if s-k = n then
             solcount := solcount + 1;
             InfoCharTable2("#I OrthogonalEmbeddings: ",
                                solcount," solutions found\n");
             sol[solcount] := [];
             for i in [1..t] do  
                sol[solcount][i] := a[i];
             od;
             sol[solcount][t+1]  := s - 1;
          fi;
       fi;
       l := deca( l );
    until l <= 1; 
    out := rec( vectors := [], norms := [], solutions := [] );
    for i in [1..t] do  
       out.vectors[i] := [];
       out.norms[i]   := x[i][n+1]/m;
       for j in [1..n] do  
          out.vectors[i][j] := x[i][j];
       od;
    od;
    Sort( sol, comp2 );
    for i in [1..solcount] do
       out.solutions[i]  := [];
       for j in [1..t] do  
          for k in [1..sol[i][j]] do
            Add( out.solutions[i], j );
          od;
       od;
    od;
    return out;
    end;


#############################################################################
##
#F  OrthogonalEmbeddingsSpecialDimension( <tbl>, <reducibles>, <grammat>,
#F                                        [, \"positive\" ], <integer> )
##
OrthogonalEmbeddingsSpecialDimension := function ( arg )  
    local  red, dim, reducibles, matrix, tbl, emb, dec, i, s, irred;
    # check input
    if Length( arg ) < 4 then
       Error( "please specify desired dimension\n",
              "usage : Orthog...( <tbl>, <reducibles>,\n",
              "<gram-matrix>, [, \"positive\" ], <integer> )" );
    fi;
    if IsInt( arg[4] ) then
       dim := arg[4];
    else
       if IsBound( arg[5] ) then
          if IsInt( arg[5] ) then
             dim := arg[5];
          else
       Error( "please specify desired dimension\n",
              "usage : Orthog...( <tbl>, < reducibles >,\n",
              "< gram-matrix >, [, <\"positive\"> ], < integer > )" );
          fi;
       fi;
    fi;
    tbl := arg[1];
    reducibles := arg[2];
    if Length( arg ) = 4 then
       emb := OrthogonalEmbeddings( arg[3], arg[4] );
    else
       emb := OrthogonalEmbeddings( arg[3], arg[4], arg[5] );
    fi;
    s := [];
    for i in [1..Length(emb.solutions)] do
       if Length( emb.solutions[i] ) = dim then
          Add( s, Sublist( emb.vectors, emb.solutions[i] ) );
       fi;
    od;
    dec:= List( s, x -> Decreased( tbl, reducibles, x ) );
    dec:= Filtered( dec, x -> x <> false );
    if dec = [] then
      InfoCharTable2( "#I OrthogonalE...: no embedding",
                      " corresp. to characters\n" );
      return rec( irreducibles:= [], remainders:= reducibles );
    fi;
    irred:= Set( dec[1].irreducibles );
    for i in [2..Length(dec)] do
       IntersectSet( irred, dec[i].irreducibles );
    od;
    red:= Reduced( tbl, irred, reducibles );
    Append( irred, red.irreducibles );
    return rec( irreducibles:= irred, remainders:= red.remainders );
    end;


#############################################################################
##
#F  DnLattice( <tbl>, <g1>, <y1> )
##
DnLattice := function( tbl, g1, y1 )
    local
    # indices
      i, i1, j, j1, k, k1, l, next,
    # booleans
      empty, change, used, addable, SFIbool,
    # dimensions
      m, n,
    # help fields
      found, foundpos,
      z, zw, nullcount, nullgenerate, 
      maxentry, max, ind, irred, irredcount, red,
      blockcount, blocks, perm, addtest, preirred,
    # Gram matrix
      g, gblock,
    # characters
      y, y2,
    # variables for recursion
      root, rootcount, solution, ligants, ligantscount, glblock, begin,
      depth, choice, ende, sol,
    # functions	
      callreduced, nullset, maxset, Search, Add, DnSearch, test;
    
    # counts zeroes in given line
    nullset := function( g, i )
    local j;
    
    nullcount[ i ] := 0;
    for j in [ 1..n ] do
       if g[ j ] = 0 then
          nullcount[ i ] := nullcount[ i ] + 1;
       fi;
    od;
    end;
    
    # searches line with most non-zero-entries
    maxset := function( )
    local i;
    
    maxentry := 1;
    max := n;
    for i in [ 1..n ] do
       if nullcount[ i ] < max then
          max := nullcount[ i ];
          maxentry := i;
       fi;
    od;
    end;
    
    # searches lines to add in order to produce zeroes
    Search := function( j )
    local signum;
    
    nullgenerate := 0;
    if g[ j ][ maxentry ] > 0 then
       signum := -1;
       for k in [ 1..n ] do
          if k <> maxentry and k <> j then
             if g[ maxentry ][ k ] <> 0 then
                if g[ j ][ k ] = g[ maxentry ][ k ] then
                   nullgenerate := nullgenerate + 1;
                else
                   nullgenerate := nullgenerate - 1;
                fi;
             fi;
          fi;
       od;
    else
       if g[ j ][ maxentry ] < 0 then
          signum := 1;
          for k in [ 1..n ] do
             if k <> maxentry and k <> j then 
                if g[ maxentry ][ k ] <> 0 then
                   if g[ j ][ k ] = -g[ maxentry ][ k ] then
                      nullgenerate := nullgenerate + 1;
                   else
                      nullgenerate := nullgenerate - 1;
                   fi;
                fi;
             fi;
          od;
       fi;
    fi;
    if nullgenerate > 0 then
       change := true;
       Add( j, maxentry );
       j := j + 1;
    fi;
    end;
    
    # adds two lines/columns
    Add := function( i, j )
    local k;
    
       y[ i ] := y[ i ] - g[ i ][ j ] * y[ j ];  
       g[ i ] := g[ i ] - g[ i ][ j ] * g[ j ];
       for k in [ 1..i-1 ] do
          g[ k ][ i ] := g[ i ][ k ];
       od;
       g[ i ][ i ] := 2;
       for k in [ i+1..n ] do
          g[ k ][ i ] := g[ i ][ k ];
       od;
    end;
    
    # backtrack-search for dn-lattice
    DnSearch := function( begin, depth, oldchoice )
    local connections, connect, i1, j1, choice, found;
    
    choice := Copy( oldchoice );
    if depth = 3 then
       # d4-lattice found !!!
       solution := 1;
       ende := true;
       if n > 4 then
          i1 := 0;
          found := false;
          while not found and i1 < n do
             i1 := i1 + 1;
             if i1 <> root[ j ] and i1 <> choice[ 1 ] 
             and i1 <> choice[ 2 ] and i1 <> choice[ 3 ] then
                connections := 0;
                for j1 in [1..3] do
                   if gblock[ i1 ][ choice[ j1 ] ] <> 0 then
                      connections := connections + 1;
                      connect := choice[ j1 ];
                   fi;
                od;
                if connections = 1 then
                   found := true;
                   choice[ 4 ] := connect;
                   solution := solution + 1;
                fi;
             fi;
             i1 := i1 + 1;
          od;
       fi;
       sol := choice;
    else
       i1 := begin;
       while not ende and i1 <= ligantscount do
          found := true;
          for j1 in [1..depth] do
             if gblock[ ligants[ i1 ] ][ choice[ j1 ] ] <> 0 then
                found := false;
             fi;
          od;
          if found then
             depth := depth + 1;
             choice[ depth ] := ligants[ i1 ];
             DnSearch( i1 + 1, depth, choice );
             depth := depth - 1;
          else
             i1 := i1 + 1;
          fi;
          if ligantscount - i1 + 1 + depth < 3 then
             ende := true;
          fi;
       od;
    fi;
    end;
    
    test := function(z)
    # some tests for the found characters
    local result, IRS, SFI, i1, y1, ind, testchar;
    testchar := Copy( z )/2;
    result := true;
    IRS := ForAll( testchar, x -> GaloisCyc(x,-1) = x );
    if IsBound( tbl.powermap ) and IsBound( tbl.powermap[2] ) then
       if IsList( tbl.powermap[2] ) and
          ForAll( tbl.powermap[2], IsInt ) then
          SFI := Indicator( tbl, [testchar], 2 )[1];
          SFIbool := true;
       else
          InfoCharTable2
             ("#I DnLattice: 2nd power map not available or not unique,\n",
              "#I            cannot test with Indicator\n");
          SFIbool := false;
       fi;
    else
      InfoCharTable2
         ("#I DnLattice: 2nd power map not availabe\n",
          "#I            cannot test with Indicator\n");
      SFIbool := false;
    fi;
    if SFIbool then
       if ForAny( testchar, x -> IsRat(x) and not IsInt(x) ) 
          or ScalarProduct( tbl, testchar, testchar ) <> 1 
          or testchar[1] = 0  
          or ( IRS and AbsInt( SFI ) <> 1 ) 
          or ( not IRS and SFI <> 0 ) then
         result := false;
       fi;
    else
       if ForAny( testchar, x -> IsRat(x) and not IsInt(x) ) 
          or ScalarProduct( tbl, testchar, testchar ) <> 1
          or testchar[1] = 0 then
         result := false;
       fi;
    fi;
    return result;
    end;
    
    # reduce whole lattice with the found irreducible
    callreduced := function() 
    z[ 1 ] := z[ 1 ]/ 2 ;
    if ScalarProduct( tbl, z[ 1 ], z[ 1 ] ) = 1 then
       irredcount := irredcount + 1;
       if z[ 1 ][ 1 ] > 0 then
          irred[ irredcount ] := z[ 1 ];
       else
          irred[ irredcount ] := -z[ 1 ];
       fi;
       y1 := Sublist( y, [ blocks.begin[i] .. blocks.ende[i] ] );
       red := Reduced( tbl, z, y1 );
       irred := Concatenation( irred, red.irreducibles );
       irredcount := Length( irred );
       y2 := Concatenation( y2, red.remainders );
    fi;
    end;
    
    # check input parameters
    if not IsCharTable( tbl ) then
       Error( "first argument must be character-table\n",
              "usage: DnLattice( <tbl>, <gram-matrix>, <reducibles> )" );
    fi;
    empty := false;
    if g1 <> [] then
    if IsList( g1 ) and IsBound( g1[1] ) and IsList( g1[1] ) then
       g := Copy( g1 );
    else
       Error( "second argument must be Gram matrix of reducible characters\n",
              "usage: DnLattice( <tbl>, <grammat>, <reducibles> )" );
    fi;
    else
    empty := true;
    fi;
    if y1 <> [] then
    if IsList( y1 ) and IsBound( y1[1] ) and IsList( y1[1] ) then
       y := Copy( y1 );
    else
       Error( "third argument must be list of reducible characters\n",
              "usage: DnLattice( <tbl>, <gram-matrix>, <reducibles> )" );
    fi;
    else
    empty := true;
    fi;
    y2        := [  ];
    irred     := [  ];
    
    if not empty then
    
    n := Length( y );
    for i in [1..n] do
       if g[i][i] <> 2 then
          Error( "reducible characters don't have norm 2\n",
                "usage: DnLattice( <tbl>, <gram-matrix>, <reducibles> )" );
       fi;
    od;
    # initialisations
    z         := [  ];
    used      := [  ];
    next      := [  ];
    nullcount := [  ];
    m := Length( y[ 1 ] );
    for i in [1..n] do
       used[i] := false;
    od;
    blocks := rec( begin := [ ], ende := [ ] );
    blockcount   := 0;
    irredcount   := 0;
    change       := true;
    while change do
       change := false;
       for i in [ 1..n ] do
          nullset( g[ i ], i );
       od;
       maxset( );
       while max < n-2 and not change do
          while maxentry <= n and not change do
             if nullcount[ maxentry ] <> max then
                maxentry := maxentry + 1;
             else
                j := 1;
                while j < maxentry and not change do
                   Search( j );
                   j := j + 1;
                od;
                j := maxentry + 1;
                while j <= n and not change do
                   Search( j );
                   j := j + 1;
                od;
                if not change then
                   maxentry := maxentry + 1;
                fi;
             fi;
          od;
          if not change then
             max := max + 1;
             maxentry := 1;
          fi;
       od;
    
    # 2 step-search in order to produce zeroes
    # 2_0_Box-Method
       change := false;
       i := 1;
       while i <= n and not change do
          while i <= n and nullcount[ i ] > n-3 do
             i := i + 1;
          od;
          if i <= n then
             j := 1;
             while j <= n and not change do
                while j <= n and g[ i ][ j ] <> 0 do
                   j := j + 1;
                od;
                if j <= n then
                   i1 := 1;
                   while i1 <= n and not change do
                      while i1 <= n
                      and ( i1 = i or i1 = j or g[ i1 ][ j ] = 0 ) do
                         i1 := i1 + 1;
                      od;
                      if i1 <= n then
                         addtest := g[ i ] - g[ i ][ i1 ] * g[ i1 ];
                         nullgenerate := 0;
                         addable := true;
                         for k in [ 1..n ] do
                            if addtest[ k ] = 0 then
                               nullgenerate := nullgenerate + 1;
                            else 
                               if AbsInt( addtest[ k ] ) > 1 then
                                  addable := false;
                               fi;
                            fi;
                         od;
                         if addable then
                            nullgenerate := nullgenerate - nullcount[ i ];
                            for k in [ 1..n ] do
                               if k <> i and k <> j then
                                  if addtest[ k ] 
                                     = addtest[ j ] * g[ j ][ k ] then
                                     if g[ j ][ k ] <> 0 then
                                        nullgenerate := nullgenerate + 1;
                                     fi;
                                  else
                                     if addtest[ k ] <> 0 then
                                        if g[ j ][ k ] = 0 then
                                           nullgenerate := nullgenerate - 1;
                                        else
                                           addable := false;
                                        fi;
                                     fi;
                                  fi;
                               fi;
                            od;
                            if nullgenerate > 0 and addable then
                               Add( i, i1 );
                               Add( j, i );
                               change := true;
                            fi;
                         fi;
                         i1 := i1 + 1;
                      fi;
                   od;
                   j := j + 1;
                fi;
             od;
             i := i + 1;
          fi;
       od;
    od;
    i := 1;
    j := 0;
    next[ 1	] := 1;
    while j < n do
       blockcount := blockcount + 1;
       blocks.begin[ blockcount ] := i;
       l := 0;
       used[ next [ i ] ] := true;
       j := j + 1;
       y2[ j ] := y[ next [ i ] ];
       while l >= 0 do
          for k in [ 1..n ] do
             if g[ next[ i ] ][ k ] <> 0 and not used[ k ] then
                l := l + 1;
                next[ i + l ] := k;
                j := j + 1;
                y2[ j ] := y[ k ];
                used[ k ] := true;
             fi;
          od;
          i := i + 1;
          l := l - 1;
       od;
       blocks.ende[ blockcount ] := i - 1;
       k := 1;
       while k <= n and used[ k ] do
          k := k + 1;
       od;
       if k <= n then
          next[i] := k;
       fi;
    od;
    perm := PermList( next )^-1;
    for i in [1..n] do
       g[i] := Permuted( g[i], perm );
    od;
    g := Permuted( g, perm );
    y := y2;
    y2 := [  ];
    
    # search for d4/d5 - lattice
    for i in [1..blockcount] do
       n := blocks.ende[ i ] - blocks.begin[ i ] + 1;
       solution := 0;
       if n >= 4 then
          gblock := [  ];
          j1 := 0;
          for j in [ blocks.begin[ i ]..blocks.ende[ i ] ] do
             j1 := j1 + 1;
             gblock[ j1 ] := [  ];
             k1 := 0;
             for k in [ blocks.begin[ i ]..blocks.ende[ i ] ] do
                k1 := k1 + 1;
                gblock[ j1 ][ k1 ] := g[ j ][ k ];
             od;
          od;
          root      := [  ];
          rootcount := 0;
          for j in [1..n] do
             nullset( gblock[ j ], j );
             if nullcount[ j ] < n - 3 then
                rootcount := rootcount + 1;
                root[ rootcount ] := j;
             fi;
          od;
          j := 1;
          while solution = 0 and j <= rootcount do
             ligants := [  ];
             ligantscount := 0;
             for k in [1..n] do
                if k <> root[ j ] and gblock[ root[ j ] ][ k ] <> 0 then
                   ligantscount := ligantscount + 1;
                   ligants[ ligantscount ] := k;
                fi;
             od;
             begin := 1;
             depth := 0;
             choice := [  ];
             ende := false;
             DnSearch( begin, depth, choice );
             if solution > 0 then
                choice := sol;
             fi;
             j := j + 1;
          od;
       fi;

    # test of the found irreducibles  
       if solution = 1 then
          # treatment of D4-lattice
          found := 0;
          preirred := Sublist( y, [ blocks.begin[i] .. blocks.ende[i] ] );
          z[1] := preirred[choice[1]] + preirred[choice[2]];
          if test(z[1]) then
             red := Reduced( tbl, preirred, [ z[1] ] );
             if ForAll( red.irreducibles, test ) then
                found := found + 1;
                foundpos := 1;
             fi;
          fi;
          z[2] := preirred[choice[1]] + preirred[choice[3]];
          if test(z[2]) then
             red := Reduced( tbl, preirred, [ z[2] ] );
             if ForAll( red.irreducibles, test ) then
                found := found + 1;
                foundpos := 2;
             fi;
          fi;
          z[3] := preirred[choice[2]] + preirred[choice[3]];
          if test(z[3]) then
             red := Reduced( tbl, preirred, [ z[3] ] );
             if ForAll( red.irreducibles, test ) then
                found := found + 1;
                foundpos := 3;
             fi;
          fi;
          if found = 1 then
             z := [z[foundpos]];
             callreduced();
          fi;  
        
       else
          # treatment of D5-lattice
          if solution = 2 then
             if choice [ 1 ] <> choice [ 4 ] then
                z[ 1 ] := y[ blocks.begin[ i ] + choice[ 1 ] - 1 ];
                if choice [ 2 ] <> choice [ 4 ] then
                   z[ 1 ] 
                        := z[ 1 ] + y[ blocks.begin[ i ] + choice[ 2 ] - 1 ];
                else
                   z[ 1 ] 
                        := z[ 1 ] + y[ blocks.begin[ i ] + choice[ 3 ] - 1 ];
                fi;
             else
                z[ 1 ] := y[ blocks.begin[ i ] + choice[ 2 ] - 1 ]
                        + y[ blocks.begin[ i ] + choice[ 3 ] - 1 ];
             fi;
             found := 0;
             if test(z[1]) then
                callreduced();
             fi;
          else
            Append( y2, Sublist( y, [ blocks.begin[i] .. blocks.ende[i] ] ) );
          fi;
       fi;
    od;            
    
    if irredcount > 0 then
       g := MatScalarProducts( tbl, y2, y2 );
    fi;
    else
       # input was empty i.e. empty=true
       g := [];
    fi;
    return rec( gram:=g, remainders:=y2, irreducibles:=irred );
    end;


#############################################################################
##
#F  DnLatticeIterative( <tbl>, <red> )
##
DnLatticeIterative := function( tbl, red )
    local dnlat, red1, norms, i, reduc, irred, norm2, g;
    
    # check input parameters
    if not IsCharTable( tbl ) then
       Error( "first argument must be character-table\n",
              "usage: DnLatticeIterative( <tbl>, <record or list> )" );
    fi;
    if not IsRec( red ) and not IsList( red ) then
       Error( "second argument must be record or list\n",
              "usage: DnLatticeIterative( <tbl>, <record or list> )" );
    fi;
    if IsRec( red ) and not IsBound( red.remainders ) then
       Error( "second record must contain a field 'remainders'\n",
              "usage: DnLatticeIterative( <tbl>, <record or list> )" );
    fi;
    if not IsRec( red ) then
       red := rec( remainders:=red );
    fi;
    if not IsBound( red.norms ) then
       norms := List( red.remainders, x -> ScalarProduct( tbl, x, x ) );
    else
       norms := Copy( red.norms );
    fi;
    reduc := Copy( red.remainders );
    irred := [];
    repeat
       norm2 := [];
       for i in [1..Length( reduc )] do
          if norms[i] = 2 then
             Add( norm2, reduc[i] );
          fi;
       od;
       g := MatScalarProducts( tbl, norm2, norm2 ); 
       dnlat := DnLattice( tbl, g, norm2 );
       Append( irred, dnlat.irreducibles );
       red1:= Reduced( tbl, dnlat.irreducibles, reduc );
       reduc := red1.remainders;
       Append( irred, red1.irreducibles );
       norms:= List( reduc, x -> ScalarProduct( tbl, x, x ) );
    until dnlat.irreducibles=[] and red1.irreducibles=[];
    return rec( irreducibles:=irred, remainders:=reduc , norms := norms );
    end;


#############################################################################
##
#F  LLLint(<lat>) . . . . . . . . . . . . . . . . . . . .. . integer only LLL
##
if not IsBound(InfoLattice1)  then InfoLattice1:=Ignore;  fi;
if not IsBound(InfoLattice2)  then InfoLattice2:=Ignore;  fi;

LLLint := function( lat )
local b,mu,i,j,k,ka,dim,l,d,dkp,n,r,za,ne,nne,dkm,dkma,mue,muea,muk,mum,
      ca1,ca2,cb1,cb2,tw,sel,s,dkpv;

  b:=Copy(lat);
  mu:=[];
  d:=[1,b[1]*b[1]];
  n:=Length(lat);
  InfoLattice1("#I integer LLL in dimension ",n,"\n");
  dim:=1;
  k:=2;

  while dim<n do
    
    # mu[k][j] berechnen (Gram-Schmidt ohne Berechnung der Vektoren selbst)
    mu[k]:=[];
    for j in [1..k-1] do
      za:=d[j]*(b[k]*b[j]);
      ne:=1;
      for i in [1..j-1] do
	nne:=d[i]*d[i+1];
	za:=za*nne-d[j]*mu[k][i]*mu[j][i]*ne;
	ne:=ne*nne;
      od;
      mu[k][j]:=za/ne;
    od;

    # berechne d[k]=\prod B_j

    za:=d[k]*(b[k]*b[k]);
    ne:=1;
    for i in [1..k-1] do
      nne:=d[i]*d[i+1];
      za:=za*nne-d[k]*mu[k][i]*mu[k][i]*ne;
      ne:=ne*nne;
    od;
    d[k+1]:=za/ne;

    dim:=dim+1;

    InfoLattice1("#I computing vector ",dim,"\n");

    while k<=dim do

      #reduce(k-1);

      ne:=d[k];
      za:=mu[k][k-1];
      if za<0 then
	za:=-za;
	s:=-1;
      else
	s:=1;
      fi;
      nne:=ne/2;
      if IsInt(nne) then
	za:=za+nne;
      else
	za:=2*za+ne;
	ne:=ne*2;
      fi;
      r:=s*QuoInt(za,ne);
      if r<>0 then
	b[k]:=b[k]-r*b[k-1];
	for j in [1..k-2] do
	  mu[k][j]:=mu[k][j]-r*mu[k-1][j];
	od;
	mu[k][k-1]:=mu[k][k-1]-r*d[k];
      fi;

      mue:=mu[k][k-1];
      dkp:=d[k+1]*d[k-1];
      dkpv:=dkp*4;

      if d[k]*d[k]*3-mue*mue*4>dkpv then

	#(2)
	InfoLattice2("#I swap ",k-1," <-> ",k,"\n");

	muea:=mue;
	dkm:=d[k];
	dkma:=dkm;

        ca1:=1;
	ca2:=0;
	cb1:=0;
	cb2:=1;

	# iterierter vektor-ggT
	repeat
	  dkm:=(dkp+mue*mue)/dkm;
	  tw:=ca1;
	  ca1:=cb1;
	  cb1:=tw;
	  tw:=ca2;
	  ca2:=cb2;
	  cb2:=tw;

	  ne:=dkm;
	  za:=mue;
	  if za<0 then
	    za:=-za;
	    s:=-1;
	  else
	    s:=1;
	  fi;
	  nne:=ne/2;
	  if IsInt(nne) then
	    za:=za+nne;
	  else
	    za:=2*za+ne;
	    ne:=ne*2;
	  fi;
	  r:=s*QuoInt(za,ne);

	  if r<>0 then
	    cb1:=cb1-r*ca1;
	    cb2:=cb2-r*ca2;
	    mue:=mue-r*dkm;
          fi;
	until dkm*dkm*3-mue*mue*4<=dkpv;

	d[k]:=dkm;
        mu[k][k-1]:=mue;

	tw:=ca1*b[k-1]+ca2*b[k];
	b[k]:=cb1*b[k-1]+cb2*b[k];
	b[k-1]:=tw;

	if k>2 then
	  sel:=[1..k-2];
	  muk:=mu[k]{sel};
	  mum:=mu[k-1]{sel};
	  tw:=ca1*mum+ca2*muk;
	  mu[k]{sel}:=cb1*mum+cb2*muk;
	  mu[k-1]{sel}:=tw;
        fi;

	for j in [k+1..dim] do
	  za:=ca1*dkma+ca2*muea;
	  tw:=(za*mu[j][k-1]+ca2*mu[j][k]*d[k-1])/dkma;
	  mu[j][k]:=(((cb1*dkma+cb2*muea)*dkm-mue*za)*mu[j][k-1]+
		     (cb2*dkm-ca2*mue)*d[k-1]*mu[j][k])/dkma/d[k-1];
	  mu[j][k-1]:=tw;
	od;

	if k>2 then
	  k:=k-1;
	fi;
      else
	for l in [2..k-1] do
	  #reduce(k-l);

	  ne:=d[k-l+1];
	  za:=mu[k][k-l];
	  if za<0 then
	    za:=-za;
	    s:=-1;
	  else
	    s:=1;
	  fi;
	  nne:=ne/2;
	  if IsInt(nne) then
	    za:=za+nne;
	  else
	    za:=2*za+ne;
	    ne:=ne*2;
	  fi;
	  r:=s*QuoInt(za,ne);
	  if r<>0 then
	    b[k]:=b[k]-r*b[k-l];
	    for j in [1..k-l-1] do
	      mu[k][j]:=mu[k][j]-r*mu[k-l][j];
	    od;
	    mu[k][k-l]:=mu[k][k-l]-r*d[k-l+1];
	  fi;
	od;
	k:=k+1; 
      fi;
    od;

  od;
  return b;
end;



