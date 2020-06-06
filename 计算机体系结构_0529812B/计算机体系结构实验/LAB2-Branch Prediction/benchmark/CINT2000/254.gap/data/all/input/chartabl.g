#############################################################################
##
#A  chartabl.g                  GAP library                     Thomas Breuer
#A                                                           & Goetz Pfeiffer
##
#A  @(#)$Id: chartabl.g,v 3.4.1.1 1996/09/12 13:52:04 mschoene Exp $
##
#Y  Copyright 1993-1995,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions and operations for character tables in GAP.
##
#H  $Log: chartabl.g,v $
#H  Revision 3.4.1.1  1996/09/12 13:52:04  mschoene
#H  fixed handling of abelian invariants
#H
#H  Revision 3.4  1994/06/10 04:45:27  sam
#H  improved 'PrintCharTable'
#H
#H  Revision 3.3  1994/05/25  10:38:43  sam
#H  replaced 'order' by 'size'
#H
#H  Revision 3.2  1994/05/19  13:10:36  sam
#H  moved 'Eigenvalues' here, introduced 'identifier' component
#H
#H  Revision 3.1  1994/02/25  09:12:37  sam
#H  initial revision under RCS
#H
##

#############################################################################
##
#F  InfoCharTable1( ... ) . . . info function for the character table package
#F  InfoCharTable2( ... ) . . . info function for the character table package
##
    if not IsBound( InfoCharTable1 )  then InfoCharTable1 := Ignore;  fi;
    if not IsBound( InfoCharTable2 )  then InfoCharTable2 := Ignore;  fi;

#############################################################################
##
#V  CharTableOps   . . . . . . . . . . . . .  operations for character tables
##
CharTableOps := OperationsRecord( "CharTableOps" );

#############################################################################
##
#F  CharTableOps.ScalarProduct( <tbl>, <chi1>, <chi2> ) . . .  scalar product
##
CharTableOps.ScalarProduct := function( D, x1, x2 )

     local i,       # loop variable
           scpr,    # scalar product, result
           weight;  # lengths of conjugacy classes

     weight:= D.classes;
     scpr:= 0;
     for i in [ 1 .. Length( x1 ) ] do
       if IsInt( x2[i] ) then
         scpr:= scpr + x1[i] * x2[i] * weight[i];
       else    # then proper cyclotomic or unknown
         scpr:= scpr + x1[i] * GaloisCyc( x2[i], -1 ) * weight[i];
       fi;
     od;
     scpr:= scpr / D.size;
     if IsInt( scpr ) then return scpr; fi;
     if IsRat( scpr ) then
       InfoCharTable2("#E ScalarProduct: sum not divisible by group order\n");
     elif IsCyc( scpr ) then
       InfoCharTable2("#E ScalarProduct: summation not integer valued\n");  
     fi;
     return scpr;
     end;

#############################################################################
##
#F  CharTableOps.NoMessageScalarProduct
##
CharTableOps.NoMessageScalarProduct := function( D, x1, x2 )

     local i,       # loop variable
           scpr,    # scalar product, result
           weight;  # lengths of conjugacy classes

     weight:= D.classes;
     scpr:= 0;
     for i in [ 1 .. Length( x1 ) ] do
       if IsInt( x2[i] ) then
         scpr:= scpr + x1[i] * x2[i] * weight[i];
       else    # then proper cyclotomic or unknown
         scpr:= scpr + x1[i] * GaloisCyc( x2[i], -1 ) * weight[i];
       fi;
     od;
     return scpr / D.size;
     end;

#############################################################################
##
#F  CharTableOps.Print( <tbl> ) . . . . . . . . . . . print a character table
##
CharTableOps.Print:= function( tbl )

#T Change this when the time of changes has arrived!
    if   IsBound( tbl.name ) and tbl.name <> tbl.identifier then
      Print( tbl.name );
    elif IsBound( tbl.group ) then
      Print( "CharTable( ", tbl.group, " )" );
    else
      Print( "CharTable( \"", tbl.identifier, "\" )" );
    fi;
    end;

#############################################################################
##
#F  PrintCharTable( <tbl> )
##
PrintCharTable := function( tbl )

    local i, flds, val;

    Print( "rec( " );
    flds:= RecFields( tbl );
    for i in [ 1 .. Length( flds ) - 1 ] do
      val:= tbl.( flds[i] );
      if   flds[i] = "ordinary" then
        Print( "ordinary := CharTable( \"",
               tbl.ordinary.identifier, "\" ), " );
      elif IsString( val ) and TYPE( val ) = "string" then
        Print( flds[i], " := \"", val, "\", " );
      else
        Print( flds[i], " := ", val, ", " );
      fi;
    od;
    if flds <> [] then
      i:= Length( flds );
      val:= tbl.( flds[i] );
      if IsString( val ) and TYPE( val ) = "string" then
        Print( flds[i], " := \"", val, "\"" );
      else
        Print( flds[i], " := ", val );
      fi;
    fi;
    Print( " )\n" );
    end;

##############################################################################
##
#F  CharTableOps.Eigenvalues( <tbl>, <char>, <class> )
##
##  Let $M$ be a matrix of a representation with character <char>, for a
##  group element in the conjugacy class <class>.
##  Eigenvalues( <tbl>, <char>, <class> ) returns the list of length
##  '$n$ = <tbl>.orders[ <class> ]' where at position 'i' the multiplicity
##  of 'E(n)^i = $e^{\frac{2\pi i}{n}$' as eigenvalue of $M$ is stored.
##
##  We have '<char>[ <class> ] = List( [ 1 .. <n> ], i -> E(n)^i )
##                               * Eigenvalues( <tbl>, <char>, <class> ).
##
CharTableOps.Eigenvalues := function( tbl, char, class )

     local i, j, n, powers, eigen, e, val;

     if not ( IsRec( tbl ) and IsBound( tbl.orders )
                           and IsInt(   tbl.orders[ class ] ) ) then
       Error( "<tbl> must be a record with component 'orders'" );
     fi;

     n:= tbl.orders[ class ];
     if n = 1 then return [ char[ class ] ]; fi;

     # compute necessary powermaps and the restricted character
     powers:= [];
     powers[n]:= char[1];
     for i in [ 1 .. n-1 ] do
       if not IsBound( powers[i] ) then

         # necessarily 'i' divides 'n', since 'i/Gcd(n,i)' is invertible
         # mod 'n', and thus powering with 'i' is Galois conjugate to
         # powering with 'Gcd(n,i)'
         powers[i]:= char[ Powmap( tbl, i, class ) ];
         for j in PrimeResidues( n/i ) do

           # Note: The position cannot be 0.
           powers[ ( i*j ) mod n ]:= GaloisCyc( powers[i], j );
         od;
       fi;
     od;

     # compute the scalar products of the characters given by 'E(n)->E(n)^i'
     # with the restriction of <char> to the cyclic group generated by
     # <class>
     eigen:= [];
     for i in [ 1 .. n ] do
       e:= E(n)^(-i);
       val:= 0;
       for j in [ 1 .. n ] do val:= val + e^j * powers[j]; od;
       eigen[i]:= val / n;
     od;

     return eigen;
     end;

##############################################################################
##
#F  CharTableOps.IsAbelian( <tbl> )
##
CharTableOps.IsAbelian := function( tbl )
    return Length( tbl.centralizers ) = tbl.centralizers[1];
    end;

##############################################################################
##
#F  CharTableOps.IsCyclic( <tbl> )
##
CharTableOps.IsCyclic := function( tbl )

    local elorders;

    if IsBound( tbl.orders ) then
      if tbl.centralizers[1] in tbl.orders then
        return true;
      elif ForAll( tbl.orders, IsInt ) then
        return false;
      fi;
    fi;
    if IsBound( tbl.powermap ) then
      elorders:= ElementOrdersPowermap( tbl.powermap );
      if tbl.centralizers[1] in elorders then
        return true;
      elif ForAll( elorders, IsInt ) then
        return false;
      fi;
    fi;
    Error( "sorry, cannot determine whether <tbl> is cyclic" );
    end; 

##############################################################################
##
#F  CharTableOps.IsSimple( <tbl> )
##
CharTableOps.IsSimple := function( tbl )
    return Length( tbl.operations.NormalSubgroups( tbl ) ) = 2;
    end;

##############################################################################
##
#F  CharTableOps.IsSolvable( <tbl> )
##
CharTableOps.IsSolvable := function( tbl )

    local nsg,       # list of all normal subgroups
          i,         # loop variable, position in 'nsg'
          n,         # one normal subgroup
          posn,      # position of 'n' in 'nsg'
          size,      # size of 'n'
          nextsize;  # size of smallest normal subgroup containing 'n'

    nsg:= tbl.operations.NormalSubgroups( tbl );
    Sort( nsg, function( x, y ) return Length(x) < Length(y); end );

    # Go up a chief series, starting with the trivial subgroup
    i:= 1;
    nextsize:= 1;

    while i < Length( nsg ) do

      posn:= i;
      n:= nsg[ posn ];
      size:= nextsize;

      # Get the smallest normal subgroup containing 'n' \ldots
      i:= posn + 1;
      while not IsSubsetSet( nsg[ i ], n ) do i:= i+1; od;

      # \ldots and its size.
      nextsize:= Sum( tbl.classes{ nsg[i] } );

      if Length( Set( FactorsInt( nextsize / size ) ) ) > 1 then

        # The chief factor 'nsg[i] / n' is not a prime power.
        return false;

      fi;

    od;
    return true;
    end;

##############################################################################
##
#F  CharTableOps.SupersolvableResiduum( <tbl> )
##
CharTableOps.SupersolvableResiduum := function( tbl )

    local nsg,       # list of all normal subgroups
          i,         # loop variable, position in 'nsg'
          N,         # one normal subgroup
          posN,      # position of 'N' in 'nsg'
          size,      # size of 'N'
          nextsize;  # size of largest normal subgroup contained in 'N'

    nsg:= tbl.operations.NormalSubgroups( tbl );
    Sort( nsg, function( x, y ) return Length(x) < Length(y); end );

    # Go down a chief series, starting with the whole group,
    # until there is no step of prime order.
    i:= Length( nsg );
    nextsize:= tbl.size;

    while i > 1 do

      posN:= i;
      N:= nsg[ posN ];
      size:= nextsize;

      # Get the largest normal subgroup contained in 'N' \ldots
      i:= posN - 1;
      while not IsSubsetSet( N, nsg[ i ] ) do i:= i-1; od;

      # \ldots and its size.
      nextsize:= Sum( tbl.classes{ nsg[i] } );

      if not IsPrimeInt( size / nextsize ) then

        # The chief factor 'N / nsg[i]' is not of prime order,
        # i.e., 'N' is the supersolvable residuum.
        return N;

      fi;

    od;
    return [ 1 ];
    end;

##############################################################################
##
#F  CharTableOps.IsSupersolvable( <tbl> )
##
CharTableOps.IsSupersolvable := function( tbl )
    return Length( SupersolvableResiduum( tbl ) ) = 1;
    end;

##############################################################################
##
#F  CharTableOps.UpperCentralSeriesFactor( <tbl>, <N> )
##
##  Let <tbl> the character table of the group $G$, and <N> the list of
##  classes contained in the normal subgroup $N$ of $G$.
##  The upper central series $[ Z_1, Z_2, \ldots, Z_n ]$ of $G/N$ is defined
##  by $Z_1 = Z(G/N)$, and $Z_{i+1} / Z_i = Z( G / Z_i )$. 
##  'CharTableOps.UpperCentralSeriesFactor( <tbl>, <N> )' returns a list
##  $[ C_1, C_2, \ldots, C_n ]$ where $C_i$ is the set of positions of
##  $G$-conjugacy classes contained in $Z_i$.
##
##  A simpleminded version of the algorithm can be stated as follows.
##
##  $M_0:= Irr(G);$|
##  |$Z_1:= Z(G);$|
##  |$i:= 0;$|
##  repeat
##    |$i:= i+1;$|
##    |$M_i:= \{ \chi\in M_{i-1} ; Z_i \leq \ker(\chi) \};$|
##    |$Z_{i+1}:= \bigcap_{\chi\in M_i}} Z(\chi);$|
##  until |$Z_i = Z_{i+1};$
##
CharTableOps.UpperCentralSeriesFactor := function( tbl, N )

    local Z,      # result list
          n,      # number of conjugacy classes
          M,      # actual list of pairs kernel/centre of characters
          nextM,  # list of pairs in next iteration
          kernel, # kernel of a character
          centre, # centre of a character
          i,      # loop variable
          chi;    # loop variable

    n:= Length( tbl.centralizers );
    N:= Set( N );

    # instead of the irreducibles store pairs $[ \ker(\chi), Z(\chi) ]$.
    # 'Z' will be the list of classes forming $Z_1 = Z(G/N)$.
    M:= [];
    Z:= [ 1 .. Length( tbl.irreducibles[1] ) ];
    for chi in tbl.irreducibles do
      kernel:= KernelChar( chi );
      if IsSubsetSet( kernel, N ) then
        centre:= CentreChar( chi );
        AddSet( M, [ kernel, centre ] );
        IntersectSet( Z, centre );
      fi;
    od;
      
    Z:= [ Z ];
    i:= 0;

    repeat
      i:= i+1;
      nextM:= [];
      Z[i+1]:= [ 1 .. n ];
      for chi in M do
        if IsSubsetSet( chi[1], Z[i] ) then
          Add( nextM, chi );
          IntersectSet( Z[i+1], chi[2] );
        fi;
      od;
      M:= nextM;
    until Z[i+1] = Z[i];
    Unbind( Z[i+1] );

    return Z;

    end;

##############################################################################
##
#F  CharTableOps.UpperCentralSeries( <tbl> )
##
CharTableOps.UpperCentralSeries := function( tbl )
    return CharTableOps.UpperCentralSeriesFactor(tbl,[1]);
    end;

##############################################################################
##
#F  CharTableOps.LowerCentralSeries( <tbl> )
##
##  Let <tbl> the character table of the group $G$.
##  The lower central series $[ K_1, K_2, \ldots, K_n ]$ of $G$ is defined
##  by $K_1 = G$, and $K_{i+1} = [ K_i, G ]$. 
##  'CharTableOps.LowerCentralSeries( <tbl> )' returns a list
##  $[ C_1, C_2, \ldots, C_n ]$ where $C_i$ is the set of positions of
##  $G$-conjugacy classes contained in $K_i$.
##
##  Given an element $x$ of $G$, then $g\in G$ is conjugate to $[x,y]$ for
##  an element $y\in G$ if and only if
##  $\sum_{\chi\in Irr(G)} \frac{|\chi(x)|^2 \overline{\chi(g)}}{\chi(1)}
##  \not= 0$, or equivalently, if the structure constant
##  $a_{x,\overline{x},g}$ is nonzero..
##
##  Thus $K_{i+1}$ consists of all classes $Cl(g)$ in $K_i$ for that there
##  is an $x\in K_i$ such that $a_{x,\overline{x},g}$ is nonzero.
##
CharTableOps.LowerCentralSeries := function( tbl )

    local series,     # list of normal subgroups, result
          K,          # actual last element of 'series'
          inv,        # list of inverses of classes of 'tbl'
          mat,        # matrix of structure constants
          i, j,       # loop over 'mat'
          running,    # loop not yet terminated
          new;        # next element in 'series'

    series:= [];
    series[1]:= [ 1 .. Length( tbl.classes ) ];
    K:= DerivedSubgroup( tbl );
    if K = series[1] then
      return series;
    fi;
    series[2]:= K;

    # Compute the structure constants $a_{x,\overline{x},g}$ with $g$ and $x$
    # in $K_2$.
    # Put them into a matrix, the rows indexed by $g$, the columns by $x$.
    inv:= InverseClassesCharTable( tbl );
    mat:= List( K, x -> [] );
    for i in [ 2 .. Length( K ) ] do
      for j in K do
        mat[i][j]:= ClassMultCoeffCharTable( tbl, K[i], j, inv[j] );
      od;
    od;

    running:= true;

    while running do
      
      new:= [ 1 ];
      for i in [ 2 .. Length( mat ) ] do
        if ForAny( K, x -> mat[i][x] <> 0 ) then
          Add( new, i );
        fi;
      od;

      if Length( new ) = Length( K ) then
        running:= false;
      else
        mat:= mat{ new };
        K:= K{ new };
        Add( series, new );
      fi;

    od;

    return series;
    end;

##############################################################################
##
#F  CharTableOps.IsNilpotentFactor( <tbl>, <N> )
##
CharTableOps.IsNilpotentFactor := function( tbl, N )

    local series;
    series:= CharTableOps.UpperCentralSeriesFactor( tbl, N );
    return Length( series[ Length( series ) ] ) = Length( tbl.centralizers );
    end;

##############################################################################
##
#F  CharTableOps.IsNilpotent( <tbl> )
##
CharTableOps.IsNilpotent := function( tbl )

    local series;

    series:= UpperCentralSeries( tbl );
    return Length( series[ Length( series ) ] ) = Length( tbl.centralizers );
    end;

##############################################################################
##
#F  CharTableOps.IsNilpotentNormalSubgroup( <tbl>, <N> )
##
##  returns whether the normal subgroup described by the classes in <N> is
##  nilpotent.
##
CharTableOps.IsNilpotentNormalSubgroup := function( tbl, N )

    local ppow,    # list of classes of prime power order
          part,    # one pair '[ prime, exponent ]'
          classes; # classes of p power order for a prime p

    # Take the classes of prime power order.
    ppow:= Filtered( N, i -> IsPrimePowerInt( tbl.orders[i] ) );

    for part in Collected( FactorsInt( Sum( tbl.classes{ N } ) ) ) do

      # Check whether the Sylow p subgroup of 'N' is normal in 'N',
      # i.e., whether the number of elements of p-power is equal to
      # the size of a Sylow p subgroup.
      classes:= Filtered( ppow, i -> tbl.orders[i] mod part[1] = 0 );
      if part[1] ^ part[2] <> Sum( tbl.classes{ classes } ) + 1 then
        return false;
      fi;

    od;
    return true;

    end;

##############################################################################
##
#F  CharTableOps.AbelianInvariants( <tbl> )
##
##  For all Sylow p subgroups of '<tbl> / DerivedSubgroup( <tbl> )' compute
##  the abelian invariants by repeated factoring by a cyclic group of maximal
##  order.
##
CharTableOps.AbelianInvariants := function( tbl )

    local kernel,  # cyclic group to be factored out
          inv,     # list of invariants, result
          primes,  # list of prime divisors of actual size
          max,     # list of actual maximal orders, for 'primes'
          pos,     # list of positions of maximal orders
          i,       # loop over classes
          j;       # loop over primes

    # Do all computations modulo the derived subgroup.
    kernel:= tbl.operations.DerivedSubgroup( tbl );
    if Length( kernel ) > 1 then
      tbl:= tbl / kernel;
    fi;

    inv:= [];

    while tbl.size > 1 do

      # For all prime divisors $p$ of the size,
      # compute the element of maximal $p$ power order.
      primes:= Set( FactorsInt( tbl.size ) );
      max:= List( primes, x -> 1 );
      pos:= [];
      for i in [ 2 .. Length( tbl.classes ) ] do
        if IsPrimePowerInt( tbl.orders[i] ) then
          j:= 1;
          while tbl.orders[i] mod primes[j] <> 0 do
            j:= j+1;
          od;
          if tbl.orders[i] > max[j] then
            max[j]:= tbl.orders[i];
            pos[j]:= i;
          fi;
        fi;
      od;
        
      # Update the list of invariants.
      Append( inv, max );

      # Factor out the cyclic subgroup.
      kernel:= tbl.operations.NormalClosure( tbl, pos );
      tbl:= tbl / kernel;

    od;

    return AbelianInvariantsOfList( inv );

    end;

##############################################################################
##
#F  CharTableOps.Agemo( <tbl>, <p> )
##
CharTableOps.Agemo := function( tbl, p )

    if not IsBound( tbl.powermap[p] ) then
      tbl.powermap[p]:=
             Parametrized( Powermap( tbl, p, rec( quick:= true ) ) );
    fi;
    return tbl.operations.NormalClosure( tbl, Set( tbl.powermap[p] ) );
    end;

##############################################################################
##
#F  CharTableOps.Automorphisms( <tbl> )
##
CharTableOps.Automorphisms := function( tbl )

    return TableAutomorphisms( tbl, tbl.irreducibles );
    end;

##############################################################################
##
#F  CharTableOps.Centre( <tbl> )
##
CharTableOps.Centre := function( tbl )
    return Filtered( [ 1 .. Length( tbl.centralizers ) ],
                     x -> tbl.centralizers[x] = tbl.centralizers[1] );
    end;

###########################################################################
##
#F  CharTableOps.CharacterDegrees( <tbl> )
##
CharTableOps.CharacterDegrees := function( tbl )
    return List( tbl.irreducibles, x -> x[1] );
    end;

##############################################################################
##
#F  CharTableOps.DerivedSubgroup( <tbl> )
##
CharTableOps.DerivedSubgroup := function( tbl )

    local der,   # derived subgroup, result
          chi;   # one irreducible character

    der:= [ 1 .. Length( tbl.classes ) ];
    for chi in tbl.irreducibles do
      if chi[1] = 1 then
        IntersectSet( der, KernelChar( chi ) );
      fi;
    od;
    return der;
    end;

##############################################################################
##
#F  CharTableOps.ElementaryAbelianSeries( <tbl> )
##
CharTableOps.ElementaryAbelianSeries := function( tbl )

    local elab,         # el. ab. series, result
          nsg,          # list of normal subgroups of 'tbl'
          actsize,      # size of actual normal subgroup
          next,         # next smaller normal subgroup
          nextsize;     # size of next smaller normal subgroup

    # Sort normal subgroups according to decreasing number of classes.
    nsg:= ShallowCopy( NormalSubgroups( tbl ) );
    Sort( nsg, function( x, y ) return Length( x ) < Length( y ); end );

    elab:= [ [ 1 .. Length( tbl.classes ) ] ];
    Unbind( nsg[ Length( nsg ) ] );

    actsize:= tbl.size;

    repeat

      next:= nsg[ Length( nsg ) ];
      nextsize:= Sum( tbl.classes{ next } );
      Add( elab, next );
      Unbind( nsg[ Length( nsg ) ] );
      nsg:= Filtered( nsg, x -> IsSubset( next, x ) );

      if not IsPrimePowerInt( actsize / nextsize ) then
        Error( "<tbl> must be table of a solvable group" );
      fi;

      actsize:= nextsize;

    until Length( nsg ) = 0;

    return elab;
    end;
    
##############################################################################
##
#F  CharTableOps.Exponent( <tbl> )
##
CharTableOps.Exponent := function( tbl )
    return Lcm( tbl.orders );
    end;

##############################################################################
##
#F  CharTableOps.FittingSubgroup( <tbl> )
##
##  The Fitting subgroup is the maximal nilpotent normal subgroup, that is,
##  the product of all normal subgroups of prime power order.
##
CharTableOps.FittingSubgroup := function( tbl )
    
    local nsg,    # all normal subgroups of 'tbl'
          ppord,  # classes in normal subgroups of prime power order
          n;      # one normal subgroup of 'tbl'

    # Compute all normal subgroups.
    nsg:= NormalSubgroups( tbl );

    # Take the union of classes in all normal subgroups of prime power order.
    ppord:= [];
    for n in nsg do
      if IsPrimePowerInt( Sum( tbl.classes{n} ) ) then
        UniteSet( ppord, n );
      fi;
    od;

    # Return the normal closure.
    return tbl.operations.NormalClosure( tbl, ppord );
    end;

##############################################################################
##
#F  CharTableOps.InertiaSubgroup( <tbl>, <chi> )
##
CharTableOps.InertiaSubgroup := function( tbl, chi )
    Error( "sorry, cannot compute inertia subgroup from the table" );
    end;

# ##############################################################################
# ##
# #F  CharTableOps.FrattiniSubgroup( <tbl> )
# ##
# CharTableOps.FrattiniSubgroup := function( tbl )
#     return Intersection( tbl.operations.MaximalNormalSubgroups( tbl ) );
#     end;

##############################################################################
##
#F  CharTableOps.MaximalNormalSubgroups( <tbl> )
##
##  *Note* that the maximal normal subgroups of a group <G> can be computed
##  easily if the character table of <G> is known.  So if you need the table
##  anyhow, you should compute it before computing the maximal normal
##  subgroups of the group.
##
CharTableOps.MaximalNormalSubgroups := function( tbl )

    local normal,    # list of all kernels
          maximal,   # list of maximal kernels
          k;         # one kernel

    # Every normal subgroup is an intersection of kernels of characters,
    # so maximal normal subgroups are kernels of irreducible characters.
    normal:= Set( List( tbl.irreducibles, KernelChar ) );

    # Remove non-maximal kernels
    RemoveSet( normal, [ 1 .. Length( tbl.centralizers ) ] );
    Sort( normal, function(x,y) return Length(x) > Length(y); end );
    maximal:= [];
    for k in normal do
      if ForAll( maximal, x -> not IsSubsetSet( x, k ) ) then

        # new maximal element found
        Add( maximal, k );

      fi;
    od;

    return maximal;

    end;

#############################################################################
##
#F  CharTableOps.NormalClosure
##
CharTableOps.NormalClosure := function( tbl, classes )

    local closure,   # classes forming the normal closure, result
          chi,       # one irreducible character of 'tbl'
          ker;       # classes forming the kernel of 'chi'
    
    closure:= [ 1 .. Length( tbl.classes ) ];
    for chi in tbl.irreducibles do
      ker:= KernelChar( chi );
      if IsSubset( ker, classes ) then
        IntersectSet( closure, ker );
      fi;
    od;

    return closure;
    end;

#############################################################################
##
#F  CharTableOps.NormalSubgroups
##
CharTableOps.NormalSubgroups := function( tbl )

    local kernels,  # list of kernels of irreducible characters
          chi,      # loop variable
          ker1,     # loop variable
          ker2,     # loop variable
          normal,   # list of normal subgroups, result
          inter;    # intersection of two kernels

    # get the kernels of irreducible characters
    kernels:= [];
    for chi in tbl.irreducibles do
      AddSet( kernels, KernelChar( chi ) );
    od;

    # form all possible intersections of the kernels
    normal:= ShallowCopy( kernels );
    for ker1 in normal do
      for ker2 in kernels do
        inter:= Intersection( ker1, ker2 );
        if not inter in normal then Add( normal, inter ); fi;
      od;
    od;

    # return the list of normal subgroups
    return Set( normal );

    end;

#############################################################################
##
#F  CharTableOps.Size( tbl )
##
CharTableOps.Size := function( tbl )

    return Sum( tbl.classes );
    end;

#############################################################################
##
#F  CharTableOps.FusionConjugacyClasses( tbl1, tbl2 )
##
CharTableOps.FusionConjugacyClasses := function( tbl1, tbl2 )

    local fusion;

    fusion:= GetFusionMap( tbl1, tbl2 );

    if fusion = false then

      if   tbl1.size > tbl2.size then

        Error( "cannot compute factor fusion from tables" );

      elif tbl1.size = tbl2.size then

        # find a transforming permutation
        fusion:= TransformingPermutationsCharTables( tbl1, tbl2 );
        if   fusion = false then
          Error( "no such fusion exists" );
        elif Size( fusion.group ) > 1 then
          Print( "#I  FusionConjugacyClasses: fusion is not unique\n" );
        fi;
        fusion:= ListPerm( fusion.columns );
        Append( fusion, [ Length( fusion ) + 1 .. Length( tbl1.classes ) ] );
 
      else

        # find a subgroup fusion
        fusion:= SubgroupFusions( tbl1, tbl2 );
        if   fusion = false then
          Error( "no such fusion exists" );
        elif Length( fusion ) > 1 then
          Error( "fusion is not unique" );
        fi;
        fusion:= fusion[1];

      fi;

    fi;

    StoreFusion( tbl1, tbl2, fusion );
    return fusion;
    end;

#############################################################################
##
#F  CharTableOps.SizesConjugacyClasses( tbl )
##
CharTableOps.SizesConjugacyClasses := function( tbl )

    return tbl.classes;
    end;

##############################################################################
##
#F  CharTableOps.\*( <tbl1>, <tbl2> ) . . . . . . . . direct product of tables
##
CharTableOps.\* := function( tbl1, tbl2 )
    if IsCharTable( tbl1 ) and IsCharTable( tbl2 ) then
      return CharTableDirectProduct( tbl1, tbl2 );
    else
      Error( "both <tbl1> and <tbl2> must be character tables" );
    fi;
    end;

#############################################################################
##
#F  CharTableOps.\/  . . . . . . . . . . .  character table of a factor group
##
CharTableOps.\/ := function( num, den )
    return CharTableFactorGroup( num, den );
    end;

#############################################################################
##
#F  CharTableOps.\mod( <tbl>, <p> ) . . . . . . . . . . . . <p>-modular table
##
CharTableOps.\mod := function( tbl, p )

    local i,       # loop variable
          result,  # restriction of 'ord' to 'p'-regular classes
          rest,    # restriction of characters to 'p'-regular classes
          irr,     # list of Brauer characters
          cd,      # list of ordinary character degrees
          degree,  # one character degree
          chars,   # characters of a given degree
          dec;     # decomposition of ordinary characters
                   # into known Brauer characters

    if   not IsCharTable( tbl ) then
      Error( "<tbl> must be a character table" );
    elif not IsPrimeInt( p ) then
      Error( "<p> must be a prime number" );
    elif IsBound( tbl.prime ) then
      Error( "<tbl> is already a Brauer table" );
    fi;

    if not IsBound( tbl.modtables ) then
      tbl.modtables:= [];
    fi;

    if not IsBound( tbl.modtables[p] ) then

      if IsSolvable( tbl ) then
  
        # For solvable groups compute the modular table using the
        # Fong-Swan theorem.
  
        result:= CharTableRegular( tbl, p );
        rest:= Restricted( tbl, result, tbl.irreducibles );
        irr:= Set( Filtered( rest, x -> x[1] = 1 ) );
        cd:= Set( List( tbl.irreducibles, x -> x[1] ) );
        RemoveSet( cd, 1 );
      
        for degree in cd do
          chars:= Set( Filtered( rest, x -> x[1] = degree ) );
  # besser!!!
          dec:= Decomposition( irr, chars, "nonnegative" );
          for i in [ 1 .. Length( dec ) ] do
            if dec[i] = false then
              Add( irr, chars[i] );
            fi;
          od;
        od;
      
        result.irreducibles:= irr;
        SortCharactersCharTable( result, "degree" );
  
      elif not IsBound( tbl.group ) then
  
        # If <tbl> is an {\ATLAS} library table then
        # take the Brauer table from the library.
        result:= BrauerTable( Concatenation( tbl.identifier, "mod", String( p ) ),
                              tbl );
  
      else
        Error( "sorry, can't get or compute <p>-modular table" );
      fi;

      tbl.modtables[p]:= result;

    fi;

    return tbl.modtables[p];
    end;

#############################################################################
##
#F  CharTableOps.Restricted
##
CharTableOps.Restricted := function( arglist )

    local x, fusion, chars;

    if Length( arglist ) = 2 and IsList( arglist[1] )
                             and IsList( arglist[2] ) then
      chars:= arglist[1];
      fusion:= arglist[2];

    elif IsCharTable( arglist[1] ) and IsCharTable( arglist[2] ) and
         Length( arglist ) in [ 3, 4 ] and IsList( arglist[3] ) then

      chars:= arglist[3];

      if Length( arglist ) = 3 then  
        fusion:= GetFusionMap( arglist[2], arglist[1] );
      else
        fusion:= GetFusionMap( arglist[2], arglist[1], arglist[4] );
      fi;
      if fusion = false then return false; fi;

    else

      Error( "usage: Restricted( <tbl>, <subtbl>, <chars> )\n",
          "resp. Restricted( <tbl>, <subtbl>, <chars>, <specification> )\n",
          "resp. Restricted( <chars>, <fusionmap> )" );
    fi;

    return List( chars, x -> Indirected( x, fusion ) );
    end;


#############################################################################
##
#F  CharTableOps.Induced
##
CharTableOps.Induced := function( arglist )

    local j, im,          # loop variables
          fusion,         # subgroup fusion map
          centralizers,   # centralizer orders in hte supergroup
          nccl,           # number of conjugacy classes of the group
          subnccl,        # number of conjugacy classes of the subgroup
          suborder,       # order of the subgroup
          subclasses,     # class lengths in the subgroup
          chars,          # list of characters to be induced
          induced,        # list of induced characters, result
          singleinduced,  # one induced character
          char;           # one character to be induced

    # get the subgroup fusion map
    if Length( arglist ) = 3 then
      fusion:= GetFusionMap( arglist[1], arglist[2] );
    elif IsList( arglist[4] ) then
      fusion:= arglist[4];
    else
      fusion:= GetFusionMap( arglist[1], arglist[2], arglist[4] );
    fi;
    if fusion = false then return false; fi;

    centralizers:= arglist[2].centralizers;
    nccl:= Length( centralizers );
    suborder:= arglist[1].size;
    subclasses:= arglist[1].classes;
    subnccl:= Length( subclasses );
    chars:= arglist[3];

    induced:= [];

    for char in chars do

      # preset the character with zeros
      singleinduced:= [];
      for j in [ 1 .. nccl ] do singleinduced[j]:= 0; od;

      # add the contribution of each class of the subgroup
      for j in [ 1 .. subnccl ] do
        if char[j] <> 0 then
          if IsInt( fusion[j] ) then
            singleinduced[ fusion[j] ]:= singleinduced[ fusion[j] ]
                                     + char[j] * subclasses[j];
          else
            for im in fusion[j] do singleinduced[ im ]:= Unknown(); od;
          fi;
        fi;
      od;

      # adjust the values by multiplication
      for j in [ 1 .. nccl ] do
        singleinduced[j]:= singleinduced[j] * centralizers[j] / suborder;
        if not IsCycInt( singleinduced[j] ) then
          singleinduced[j]:= Unknown();
          Print("#I Induced: subgroup order not dividing sum in character ");
          Print( Length( induced ) + 1, " at class ", j, "\n" );
        fi;
      od;

      Add( induced, singleinduced );

    od;

    # Return the list of induced characters.
    return induced;
    end;

############################################################################
##
#V  PreliminaryLatticeOps . . operations record for normal subgroup lattices
##
PreliminaryLatticeOps := OperationsRecord( "PreliminaryLatticeOps" );

PreliminaryLatticeOps.Print := function( obj )
    Print( "Lattice( ", obj.domain, " )" );
    end;

PreliminaryLatticeOps.Display := function( arglist )
    Error( arglist[1].XGAP );
    end;

############################################################################
##
#F  CharTableOps.Lattice( <tbl> ) . .  lattice of normal subgroups of a c.t.
##
CharTableOps.Lattice := function( tbl )

    local i, j,       # loop variables
          nsg,        # list of normal subgroups
          len,        # length of 'nsg'
          sizes,      # sizes of normal subgroups
          max,        # one maximal subgroup
          maxes,      # list of maximal contained normal subgroups
          actsize,    # actuel size of normal subgroups
          actmaxes,
          latt;       # the lattice record

    # Compute normal subgroups and their sizes
    if not IsBound( tbl.normalSubgroups ) then
      tbl.normalSubgroups:= CharTableOps.NormalSubgroups( tbl );
    fi;
    nsg:= tbl.normalSubgroups;
    len:= Length( nsg );
    sizes:= List( nsg, x -> Sum( tbl.classes{ x } ) );
    SortParallel( sizes, nsg );

    # For each normal subgroup, compute the maximal contained ones.
    maxes:= [];
    i:= 1;
    while i <= len do
      actsize:= sizes[i];
      actmaxes:= Filtered( [ 1 .. i-1 ], x -> actsize mod sizes[x] = 0 );
      while i <= len and sizes[i] = actsize do
        max:= Filtered( actmaxes, x -> IsSubset( nsg[i], nsg[x] ) );
        for j in Reversed( max ) do
          SubtractSet( max, maxes[j] );
        od;
        Add( maxes, max );
        i:= i+1;
      od;
    od;

    # construct the lattice record
    latt:= rec( domain          := tbl,
                normalSubgroups := nsg,
                sizes           := sizes,
                maxes           := maxes,
                XGAP            := List( [ 1 .. len ],
                                      x -> [ x, sizes[x], maxes[x] ] ),
                operations      := PreliminaryLatticeOps );

    # return the lattice record
    return latt;
    end;

#############################################################################
##
#F  CharTableOps.Display
##
CharTableOps.Display := DisplayCharTable;

#############################################################################
##
#V  BrauerTableOps   . . . . . . . . . . . . . . operations for Brauer tables
##
BrauerTableOps := OperationsRecord( "BrauerTableOps", CharTableOps );

