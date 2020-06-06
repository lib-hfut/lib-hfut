#############################################################################
##
#A  rowspace.g                  GAP library                    J\"urgen Mnich
##
#A  @(#)$Id: rowspace.g,v 3.15.1.1 1995/08/31 11:27:58 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions for row spaces.
##
##  $Log: rowspace.g,v $
#H  Revision 3.15.1.1  1995/08/31  11:27:58  sam
#H  fixed basis component 'ishead' for trivial spaces
#H  (needed when forming factor spaces)
#H
#H  Revision 3.15  1994/07/04  07:49:33  sam
#H  fixed 'RowSpaceOps.SemiEchelonBasis'
#H
#H  Revision 3.14  1994/06/10  02:44:40  sam
#H  improved F^n
#H
#H  Revision 3.13  1994/05/19  13:14:55  sam
#H  added some functions, fixed some bugs
#H
#H  Revision 3.12  1994/04/29  18:49:43  sam
#H  total revision of the file,
#H  added a lot of bugs
#H
#H  Revision 3.11  1994/02/16  14:41:23  fceller
#H  added 'DualSpace' and 'NormedVectors'
#H  replaced 'LogVecFFE' by 'IntVecFFE'
#H
#H  Revision 3.10  1994/02/02  10:11:21  fceller
#H  fixed 'MakeVecFFE'
#H
#H  Revision 3.9  1993/02/09  14:25:55  martin
#H  made undefined globals local
#H
#H  Revision 3.8  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.7  1992/04/07  16:15:32  jmnich
#H  adapted to changes in the finite field module
#H
#H  Revision 3.6  1992/04/03  13:10:09  fceller
#H  changed 'Shifted...' into 'Sifted...'
#H
#H  Revision 3.5  1992/03/17  12:31:20  jmnich
#H  minor style changes, more bug fixes
#H
#H  Revision 3.4  1992/02/29  13:25:11  jmnich
#H  general library review, some bug fixes
#H
#H  Revision 3.3  1992/01/09  13:37:06  jmnich
#H  fixed a minor bug in 'BaseTypeRowSpace'
#H
#H  Revision 3.2  1992/01/07  12:21:07  jmnich
#H  changed a lot
#H
#H  Revision 3.1  1991/09/24  14:24:59  fceller
#H  Initial Release under RCS
##

#############################################################################
#T
#T  TODO
#T
#T  really avoid .zero (when library is safe...)
#T  forbid Coefficients( V, v )
#T  remove IntegerTable, BaseType, Information, Enumeration
#T  remove modspaces
#T  provide general vector space cosets, move functions there if possible
#T  forbid old call of RowSpace
#T  generalize 'IsCoset' to accept space cosets also
#T

#############################################################################
##
#F  IntegerTable( <field> ) . . . . . . . . . . . . . calculate integer table
##
IntegerTable := function( field )
    local   pow, int, i;

    if IsBound( field.integers ) then  return field.integers;  fi;
    if not IsFinite( field ) then
        Error( "sorry, field has to be finite\n" );
    fi;
    if field.degree <> 1 then
        Error( "sorry, field has to be a prime field\n" );
    fi;

    pow := 1;
    int := Int( field.root );
    field.integers := [1..field.char-1];
    field.integers[1] := pow;
    for i in [2..field.char-1] do
        pow := (pow * int) mod field.char;
        field.integers[i] := pow;
    od;
    return field.integers;
end;


#############################################################################
##
#F  RowSpace( <field>, <gens>[, <zero>] ) . . . . . . . .  create a row space
#F  RowSpace( <field>, <gens>, \"basis\" )  . . . . . . .  create a row space
#F  RowSpace( <field>, <dim> )  . . . . . . . . . . . . .  create a row space
##
#T  still valid:
#F  RowSpace( <gens>, <field>[, <zero>] ) . . . . . . . .  create a row space
##
RowSpace := function( arg )

    local field,   # field over that the space is defined
          gens,    # generators list
          gen,     # one generator
          i,       # loop over 'gens'
          zero,    # zero element (if known)
          basis,   # list of basis vectors
          V;       # row space, result
 
#T Remove this when the time of changes has arrived!
    if Length( arg ) = 2 and IsField( arg[2] ) then
      return RowSpace( arg[2], arg[1] );
    elif Length( arg ) = 3 and IsField( arg[2] ) then
      return RowSpace( arg[2], arg[1], arg[3] );
    fi;
  

    if   Length( arg ) = 2 and IsField( arg[1] ) then

      field:= arg[1];

      if   IsList( arg[2] ) then

        # An explicit list of generators (necessarily nonempty) is given.
        # (We do not remove the zero element here.)
        gens:= arg[2];
        if Dimensions( gens )[1] = 0 then
          Error( "need at least one element" );
        fi;

      elif IsInt( arg[2] ) and arg[2] > 0 then

        # Setup the generators.
        gen:= [];
        for i in [ 1 .. arg[2] ] do
          gen[i]:= field.zero;
        od;
        gens:= [ gen ];
        for i in [ 2 .. arg[2] ] do
          gens[i]:= Copy( gen );
        od;
        for i in [ 1 .. arg[2] ] do
          gens[i][i]:= field.one;
        od;
        basis:= gens;

      else
        Error(  "usage: RowSpace( <field>, <generators>[, <zero>] )\n",
                "   or: RowSpace( <field>, <dimension> )" );
      fi;

    elif     Length( arg ) = 3
         and IsField( arg[1] )
         and IsVector( arg[3] )
         and IsList( arg[2] )
         and ( Length( arg[2] ) = 0 or IsMat( arg[2] ) ) then

      # The zero element is given, we can remove zeroes from the generators.
      field := arg[1];
      zero  := arg[3];
      gens  := Filtered( arg[2], x -> x <> zero );

    elif Length( arg ) = 3 and IsField( arg[1] ) and IsList( arg[2] )
                           and arg[3] = "basis" then

      # The generators are known to form a basis of the space.
      # Use this knowledge later.
      field := arg[1];
      gens  := arg[2];
      basis := gens;

    else
      Error(  "usage: RowSpace( <field>, <generators>[, <zero>] )\n",
              "   or: RowSpace( <field>, <generators>, \"basis\" )\n",
              "   or: RowSpace( <field>, <dimension> [, <zero>] )" );
    fi;

    # Create the row space record.
    V:= rec( isDomain      := true,
             isVectorSpace := true,
             isRowSpace    := true,
      
             field         := field,
             generators    := gens,
     
             operations    := RowSpaceOps );

    if IsBound( zero ) then
      V.zero:= zero;
#T remove this as soon as the library is safe!
    else
      V.zero:= 0 * V.generators[1];
#T
    fi;
    if IsBound( basis ) then
      V.basis:= Basis( V, V.generators );
    fi;

    # Return the row space.
    return V;
    end;

#############################################################################
##
#F  IsRowSpace( <obj> ) . . . . . . . . . .  test if an object is a row space
##
IsRowSpace := function( obj )
    return IsRec( obj ) and IsBound( obj.isRowSpace ) and obj.isRowSpace;
    end;

#############################################################################
##
#F  Subspace( <V>, <gens> )
##
Subspace := function( V, gens )
    if    not IsRec( V )
       or not IsBound( V.operations )
       or not IsBound( V.operations.Subspace ) then
      Error( "<V> must be a record with 'Subspace'",
             " in 'operations' component" );
    fi;
    return V.operations.Subspace( V, gens );
    end;

#############################################################################
##
#F  AsSubspace( <V>, <U> )
##
AsSubspace := function( V, U )
    if    not IsRec( V )
       or not IsBound( V.operations )
       or not IsBound( V.operations.AsSubspace ) then
      Error( "<V> must be a record with 'AsSubspace'",
             " in 'operations' component" );
    fi;
    return V.operations.AsSubspace( V, U );
    end;

#############################################################################
##
#F  AsSpace( <U> )
##
AsSpace := function( U )
    if    not IsRec( U )
       or not IsBound( U.operations )
       or not IsBound( U.operations.AsSpace ) then
      Error( "<U> must be a record with 'AsSpace'",
             " in 'operations' component" );
    fi;
    return U.operations.AsSpace( U );
    end;

#############################################################################
##
#V  RowSpaceOps . . . . . . . . . . . . . .  operations record for row spaces
##
RowSpaceOps := OperationsRecord( "RowSpaceOps", VectorSpaceOps );

#############################################################################
##
#F  RowSpaceOps.Subspace( <V>, <gens> )
##
RowSpaceOps.Subspace := function( V, gens )

    if not ForAll( gens, x -> Length( x ) = Length( V.zero ) ) then
      Error( "generators must have compatible lengths" );
    fi;

    # Create the subspace record.
    return rec( isDomain      := true,
                isVectorSpace := true,
                isRowSpace    := true,

                parent        := V,
      
                field         := V.field,
                generators    := gens,

                zero          := V.zero,
     
                operations    := RowSpaceOps );
    end;

#############################################################################
##
#F  RowSpaceOps.AsSubspace( <V>, <U> )
##
RowSpaceOps.AsSubspace := function( V, U )

    if   not IsParent( V ) then
      Error( "<V> must be a parent space" );
    elif not IsSubset( V, U ) then
      Error( "<U> must be a subset of <V>" );
    fi;

    # Create the subspace record.
    return Subspace( V, Generators( U ) );
    end;

#############################################################################
##
#F  RowSpaceOps.AsSpace( <U> )
##
RowSpaceOps.AsSpace := function( U )
    if   not IsBound( U.parent ) then
      return U;
    elif Length( Generators( U ) ) > 0 then
      return RowSpace( U.parent.field, U.generators );
    else
      return RowSpace( U.parent.field, Zero( U ) );
    fi;
    end;

#############################################################################
##
#F  RowSpaceOps.Zero( <V> ) . . . . . . . . . . . zero element of a row space
##
RowSpaceOps.Zero := function( V )
    if Length( Generators( V ) ) = 0 then
      Error( "need at least one generator" );
    else
      return V.field.zero * V.generators[1];
    fi;
    end;

#############################################################################
##
#F  RowSpaceOps.\=( <V>, <W> ) . . . . . .  test if two row spaces are equal
##
##  Two  row spaces <V>, <W> are  considered  equal if they have same
##  dimension, and the generators of <V> are contained in <W>.
##
##  *Note* that we cannot assume that the bases of equal spaces are equal.
##
RowSpaceOps.\= := function( V, W )
    if IsRowSpace( V ) then

      if IsRowSpace( W ) then
        if V.field = W.field then
          return     Dimension( V ) = Dimension( W )
                 and ForAll( Generators( V ), x -> x in W );
        else
          return     Dimension( V ) * Dimension( V.field )
                   = Dimension( W ) * Dimension( W.field )
                 and ForAll( Generators( V ), x -> x in W );
        fi;

      elif IsSpaceCoset( W )  then
        return W.operations.\=( V, W );
      else
        return DomainOps.\=( V, W );
      fi;

    elif IsSpaceCoset( V )  then
      return V.operations.\=( V, W );
    else
      return DomainOps.\=( V, W );
    fi;
    end;

#############################################################################
##
#F  RowSpaceOps.\<( <V>, <W> ) . . . . test if row space <V> is less than <W>
##
##  Ordering of row spaces is defined as ordering of the fields, dimension of
##  the spaces, and ordering of canonical bases.
##
RowSpaceOps.\< := function( V, W )
    if IsRowSpace( V ) and IsRowSpace( W ) then
      if V.field = W.field then
        if Dimension( V ) = Dimension( W ) then
          return   Reversed( CanonicalBasis( V ).vectors )
                 < Reversed( CanonicalBasis( W ).vectors );
        else
          return V.dimension < W.dimension;
        fi;
      else
        return V.field < W.field;
      fi;
    else
      return DomainOps.\<( V, W );
    fi;
    end;

#############################################################################
##
#F  RowSpaceOps.\in( <v>, <V> )  . . . . . . . . . . . test if <v> is in <V>
##
RowSpaceOps.\in := function( v, V )
  return SiftedVector( Basis( V ), v ) = Zero( Parent( V ) );
  end;

#############################################################################
##
#F  RowSpaceOps.Print( <obj> )  . . . . . . . . . . . . . . print a row space
##
RowSpaceOps.Print := function( V )
    if IsBound( V.name ) then
      Print( V.name );
    elif IsBound( V.parent ) then
      Print( "Subspace( ", V.parent, ", ", V.generators, " )" );
    elif Length( V.generators ) = 0 then
      Print( "RowSpace( ", V.field, ", [ ", V.zero, " ] )" );
    else
      Print( "RowSpace( ", V.field, ", ", V.generators, " )" );
    fi;
    end;

##############################################################################
##
#F  RowSpaceOps.IsSubset( <V>, <U> )
##
RowSpaceOps.IsSubset := function( V, U )
    if   IsIdentical( V, U ) then
      return true;
    elif IsRowSpace( U ) then

      if IsParent( V ) and Parent( U ) = V then
        return true;
      else
        return ForAll( U.generators, x -> x in V );
      fi;

    else
      return ForAll( Elements( U ), x -> x in V );
    fi;
    end;

#############################################################################
##
#F  RowSpaceOps.Closure( <V>, <c> )
##
RowSpaceOps.Closure := function( V, w )

    local C,    # intermediate closure
          g,    # one generator of row space 'w'
          v,    # sifted vector of 'w'
          B;    # basis of 'V'

    if   IsParent( V ) then
      return V;

    elif IsRowSpace( w ) then

      for g in w.generators do
        V:= Closure( V, g );
      od;

    elif w in Parent( V ) then

      B:= SemiEchelonBasis( V );
      v:= SiftedVector( B, w );
      w:= DepthVector( v );
      if w <= Length( v ) then

        # Construct the closure.
        C:= Subspace( Parent( V ), Concatenation( V.generators, [ w ] ) );

        # Update the basis.
        C.basis:=
           rec( isBasis            := true,
                isSemiEchelonBasis := true,
                structure          := C,
                vectors            := Concatenation( V.basis.vectors,
                                                     [ v / v[w] ] ),
                heads              := Copy( V.basis.heads ),
                ishead             := Copy( V.basis.ishead ),
                operations         := SemiEchelonBasisRowSpaceOps );

        C.basis.heads[w]  := Length( C.basis.vectors );
        C.basis.ishead[w] := true;

        V:= C;

      fi;

    fi;
    return V;
    end;

#############################################################################
##
#F  RowSpaceOps.Intersection( <V>, <W> )  . .  intersection of two row spaces
##
RowSpaceOps.Intersection := function( V, W )

    local inters;

    inters:= SumIntersectionMat( V.generators, W.generators )[2];
    if Parent( V ) = Parent( W ) then
      inters:= Subspace( Parent( V ), inters );
      inters.basis:= Basis( inters, inters.generators );
    elif Length( inters ) > 0 then
      inters:= RowSpace( V.field, inters, "basis" );
    else
      inters:= RowSpace( V.field, inters, Zero( V ) );
    fi;
    return inters;
    end;

############################################################################
##
#F  RowSpaceOps.Elements( V )
##
RowSpaceOps.Elements := function ( V )

    local zero, # zero element of 'V'
          elms, # element list, result
          gen,  # one basis vector
          new,  # intermediate element list
          i;    # loop over field elements

    zero:= Zero( V );
    if ForAll( V.generators, x -> x = zero ) then
      return [ zero ];
    fi;
    if not IsFinite( V.field ) then
      Error( "sorry, cannot compute elements of infinite domain <V>" );
    fi;
    elms:= [ zero ];
    for gen in Base( V ) do
      new:= [];
      for i in Elements( V.field ) do
        Append( new, List( elms, x -> x + i * gen ) );
      od;
      elms:= new;
    od;
    Sort( elms );
    return elms;
    end;
 
#############################################################################
##
#F  RowSpaceOps.Base( <V> ) . . . . . . . . . . . . . . . base of a row space
##
RowSpaceOps.Base := function( V )
    return CanonicalBasis( V ).vectors;
    end;

#############################################################################
##
#F  RowSpaceOps.Dimension( <V> ) . . . . . . . . . . dimension of a row space
##
RowSpaceOps.Dimension := function( V )
    return Dimensions( Basis( V ).vectors )[1];
    end;

#############################################################################
##
#F  RowSpaceOps.Random( <V> ) . . . . . . . . . random element of a row space
##
RowSpaceOps.Random := function( V )

    local base,  # basis vectors
          v,     # the random vector, result
          i;     # loop over 'base'

    base:= Basis( V ).vectors;
    if Length( base ) = 0 then
      v:= Zero( V );
    else
      v:= Random( V.field ) * base[1];
      for i in [ 2 .. Length( base ) ] do
        v:= v + Random( V.field ) * base[i];
      od;
    fi;
    return v;
    end;

#############################################################################
##
#F  BaseTypeRowSpace( <V> ) . . . . . . . . . determine type of attached base
##
##  the following basetypes (where one type includes all previous types)
##  are currently supported:
##
##  TriangulizedBase    the matrix of the base is in upper triangular form
##  NormedBase          each vector of the basis is (additionally) normed
##  NormalizedBase      all base vectors have 0 at another vectors weight
##  StandardBaseSubset  the matrix of the base just has identity matrix rows
##  StandardBase        the matrix of the base is the identity matrix
##
BaseTypeRowSpace := function( V )
    local   base, dim, vdim, normed, isnormalized, ismonomial, i, j;

    isnormalized := function ()
        local   i, j;
        for i in [2..dim] do
            for j in [1..i-1] do
                if base[j][V.weights[i]] <> V.field.zero then
                    return false;
                fi;
            od;
        od;
        return true;
    end;

    ismonomial := function ()
        local   i, j;
        for i in [1..dim] do
            for j in [V.weights[i]+1..vdim] do
                if base[i][j] <> V.field.zero then  return false;  fi;
            od;
        od;
        return true;
    end;

    if not IsBound( V.base ) then  Base( V );  fi;

    base   := V.base;
    dim    := Length( base );
    vdim   := Length( Zero( V ) );
    normed := true;

    V.weights              := [];
    V.isStandardBase       := false;
    V.isStandardBaseSubset := false;
    V.isNormalizedBase     := false;
    V.isNormedBase         := false;
    V.isTriangulizedBase   := false;

    for i in [1..dim] do
        j := 1;
        while base[i][j] = V.field.zero do  j := j + 1;  od;
        V.weights[i] := j;
        if base[i][j] <> V.field.one then  normed := false;  fi;
    od;


    # finally determine the exact state of the base, that is, set all
    # the flags to their correct value.

    if IsSet( V.weights ) then
        V.isTriangulizedBase := true;
        if normed then
            V.isNormedBase := true;
            if isnormalized() then
                V.isNormalizedBase := true;
                if V.weights = [1..vdim] then
                    V.isStandardBase       := true;
                    V.isStandardBaseSubset := true;
                elif ismonomial() then
                    V.isStandardBaseSubset := true;
                fi;
            fi;
        fi;
    fi;
end;


#############################################################################
##
#F  RowSpaceOps.Information( <V> )  . . . . . information about the row space
##
RowSpaceOps.Information := function( V )
    local   base, dim, size, info, pows, pow, i;


    # first step: general information about the row space

    info := rec(
        field    := V.field,
        zero     := Zero( V ),
        isFinite := IsFinite( V )
    );


    # second step: details about the field

    info.isFiniteField := IsFinite( V.field );
    if info.isFiniteField then
        info.isFinitePrimeField := V.field.degree = 1;
        if info.isFinitePrimeField then
            info.integers := IntegerTable( V.field );
        fi;
    else
        info.isFinitePrimeField := false;
    fi;


    # third step: base and dimension

    base := Base( V );
    dim  := Length( base );

    info.base      := base;
    info.dimension := dim;


    # fourth step: enumeration information
    #              only applicable if the field is finite

    if info.isFiniteField then
        size := Size( V.field );
        pows := [];
        pow  := 1;

        for i in [1..dim] do
            pows[i] := pow;
            pow := pow * size;
        od;

        info.powers    := Reversed( pows );
        info.exponents := List( base, x -> size );
    fi;


    # fifth step: coefficients information

    info.zeroCoefficients := List( base, x -> V.field.zero );
    IsVector( info.zeroCoefficients );


    # sixth step: general base information

    BaseTypeRowSpace( info );

    return info;
end;


#############################################################################
##
#F  RowSpaceOps.Coefficients( <V>, <v> )  . . . .  coefficients of <v> in <V>
#T Remove this when then time of changes has arrived!
##
RowSpaceOps.Coefficients := function( V, v )
    local   cf, info, z, i;

    if not IsBound( V.information ) then
        Information( V );
    fi;
    info := V.information;
    if info.isStandardBase then
        cf := ShallowCopy( v );
    elif info.isNormalizedBase then
        cf := ShallowCopy( info.zeroCoefficients );
        for i in [1..info.dimension] do  cf[i] := v[info.weights[i]];  od;
    elif info.isNormedBase then
        cf := ShallowCopy( info.zeroCoefficients );
        for i in [1..info.dimension] do
            z := v[info.weights[i]];
            if z <> V.field.zero then
                v := v - z * info.base[i];
                cf[i] := z;
            fi;
        od;
    elif info.isTriangulizedBase then
        cf := ShallowCopy( info.zeroCoefficients );
        for i in [1..info.dimension] do
            z := v[info.weights[i]];
            if z <> V.field.zero then
                z := z / info.base[i][info.weights[i]];
                v := v - z * info.base[i];
                cf[i] := z;
            fi;
        od;
    else
        Error( "sorry, can't compute coefficients for base" );
    fi;
    return cf;
end;


#############################################################################
##
#F  SiftedVector( <V>, <v> )  . . . . . . . . . . .  residuum of <v> over <V>
##
SiftedVector := function( V, v )
    return V.operations.SiftedVector( V, v );
end;


#############################################################################
##
#F  RowSpaceOps.SiftedVector( <V>, <v> )  . . . . .  residuum of <v> over <V>
##
RowSpaceOps.SiftedVector := function( V, v )
    local   info, z, i;

#T Change this!! should call the function of a basis!!!

    if not IsBound( V.information ) then
        Information( V );
    fi;
    info := V.information;
    if info.isStandardBase then
        v := 0 * v;
    elif info.isStandardBaseSubset then
        v := ShallowCopy( v );
        for i in [1..info.dimension] do
            v[info.weights[i]] := V.field.zero;
        od;
    elif info.isNormedBase then
        for i in [1..info.dimension] do
            z := v[info.weights[i]];
            if z <> V.field.zero then
                v := v - z * info.base[i];
            fi;
        od;
    elif info.isTriangulizedBase then
        for i in [1..info.dimension] do
            z := v[info.weights[i]];
            if z <> V.field.zero then
                v := v - z / info.base[i][info.weights[i]] * info.base[i];
            fi;
        od;
    else
        Error( "sorry, can't compute residuum for base" );
    fi;
    return v;
end;


#############################################################################
##
#F  RowSpaceOps.Enumeration( <V> )  . . . enumeration for the elements of <V>
##
RowSpaceOps.Enumeration := function( V )
    local   enum, e;

    if not IsFinite( V ) then
        Error( "sorry, row space is infinite" );
    fi;

#T weg damit!
    e := ShallowCopy( Information( V ) );

    e.number := function ( enum, v )
        local   num, z, i;

        if enum.base = [] then
            return 1;
        fi;

        if enum.isFinitePrimeField then
            if enum.isStandardBase then
                num := NumberVecFFE( v, enum.powers, enum.integers );
            elif enum.isNormalizedBase then
                num := 1;
                for i in [1..enum.dimension] do
                    z := IntVecFFE( v, enum.weights[i] );
                    if z <> 0 then
                        num := num + enum.powers[i] * z;
                    fi;
                od;
            elif enum.isNormedBase then
                num := 1;
                for i in [1..enum.dimension] do
                    z := IntVecFFE( v, enum.weights[i] );
                    if z <> 0 then
                        num := num + enum.powers[i] * z;
                        v := v - z * enum.base[i];
                    fi;
                od;
            elif enum.isTriangulizedBase then
                num := 1;
                for i in [1..enum.dimension] do
                    z := v[enum.weights[i]];
                    if z <> V.field.zero then
                        z := z / enum.base[i][enum.weights[i]];
                        num := num + enum.powers[i] * IntFFE(z);
                        v := v - z * enum.base[i];
                    fi;
                od;
            else
                Error( "sorry, can't compute number of element for base" );
            fi;
        else
            if enum.isStandardBase then
                num := 1;
                for i in [1..enum.dimension] do
                    z := v[i];
                    if z <> V.field.zero then
                        num := num+enum.powers[i]*(LogFFE(z,V.field.root)+1);
                    fi;
                od;
            elif enum.isNormalizedBase then
                num := 1;
                for i in [1..enum.dimension] do
                    z := v[enum.weights[i]];
                    if z <> V.field.zero then
                        num := num+enum.powers[i]*(LogFFE(z,V.field.root)+1);
                    fi;
                od;
            elif enum.isNormedBase then
                num := 1;
                for i in [1..enum.dimension] do
                    z := v[enum.weights[i]];
                    if z <> V.field.zero then
                        num := num+enum.powers[i]*(LogFFE(z,V.field.root)+1);
                        v := v - z * enum.base[i];
                    fi;
                od;
            elif enum.isTriangulizedBase then
                num := 1;
                for i in [1..enum.dimension] do
                    z := v[enum.weights[i]];
                    if z <> V.field.zero then
                        z := z / enum.base[i][enum.weights[i]];
                        num := num+enum.powers[i]*(LogFFE(z,V.field.root)+1);
                        v := v - z * enum.base[i];
                    fi;
                od;
            else
                Error( "sorry, can't compute number of element for base" );
            fi;
        fi;
        return num;
    end;

    e.element := function( enum, num )
        local   cf, v, i;

        if enum.base = [] then
            return enum.zero;
        fi;

        if enum.isFinitePrimeField then
            if enum.isStandardBase then
                v := CoefficientsInt( enum.exponents, num-1 );
                MakeVecFFE( v, enum.field.one );
            elif enum.isStandardBaseSubset then
                cf := CoefficientsInt( enum.exponents, num-1 );
                MakeVecFFE( cf, enum.field.one );
                v  := ShallowCopy( enum.zero );
                for i in [1..enum.dimension] do
                    v[enum.weights[i]] := cf[i];
                od;
            else
                v := CoefficientsInt( enum.exponents, num-1 ) * enum.base;
            fi;
        else
            if enum.isStandardBase then
                cf := CoefficientsInt( enum.exponents, num-1 );
                v  := ShallowCopy( enum.zero );
                for i in [1..enum.dimension] do
                    if cf[i] <> V.field.zero then
                        v[i] := enum.field.root ^ cf[i];
                    fi;
                od;
            elif enum.isStandardBaseSubset then
                cf := CoefficientsInt( enum.exponents, num-1 );
                v  := ShallowCopy( enum.zero );
                for i in [1..enum.dimension] do
                    if cf[i] <> V.field.zero then
                        v[enum.weights[i]] := enum.field.root ^ cf[i];
                    fi;
                od;
            else
                cf := CoefficientsInt( enum.exponents, num-1 );
                v  := enum.zero;
                for i in [1..enum.dimension] do
                    if cf[i] <> V.field.zero then
                        v := v + enum.field.root ^ cf[i] * enum.base[i];
                    fi;
                od;
            fi;
        fi;
        return v;
    end;

    return e;
end;

#############################################################################
##
#F  NormedVectors( <space> )  . . . . . . . . . . . .  list of normed vectors
##
NormedVectors := function( space )
    if not IsBound(space.normedVectors)  then
        space.normedVectors := space.operations.NormedVectors(space);
    fi;
    return space.normedVectors;
    end;

#############################################################################
##
#F  RowSpaceOps.NormedVectors( <V> )
##
RowSpaceOps.NormedVectors := function ( V )

    local base,       # basis vectors
          elms,       # element list, result
          j,          # loop over 'base'
          elms2,      # intermediate element list
          fieldelms,  # elements of 'V.field' (in other succession)
          new,        # intermediate element list
          pos,        # position in 'new' to store the next element
          len,        # actual length of 'elms2'
          range,      # range to loop over
          i,          # loop over field elements
          k,          # loop over 'elms2'
          toadd;      # vector to add to known vectors

    if not IsFinite( V.field ) then
      Error( "sorry, cannot compute normed vectors of infinite domain <V>" );
    fi;

    base:= Reversed( CanonicalBasis( V ).vectors );
    if Length( base ) = 0 then
      return [];
    fi;

    elms      := [ base[1] ];
    elms2     := [ base[1] ];
    fieldelms := Elements( V.field ) - 1;

    for j in [ 1 .. Length( base ) - 1 ] do

      # Here 'elms2' has the form
      # $b_i + M = b_i + \langle b_{i+1}, \ldots, b_n \rangle$.
      # Compute $b_{i-1} + \bigcup_{\lambda\in F} \lambda b_i + ( b_i + M )$.
      new:= [];
      pos:= 0;
      len:= Length( elms2 );
      range:= [ 1 .. len ];
      for i in fieldelms do
        toadd:= base[j+1] + i * base[j];
        for k in range do
          new[ pos + k ]:= elms2[k] + toadd;
        od;
        pos:= pos + len;
      od;
      elms2:= new;

      # 'elms2' is a set here.
      Append( elms, elms2 );

    od;
    return elms;
    end;
 
############################################################################
##
#F  DualRowSpace( <rs>, <field> ) . . . . . . . . . . . . . . dual submodule
##
##  Dual takes (a base of)  a module and calculates  a base of the orthogonal
##  vectorspace.
##
DualRowSpace := function( space, field )

    local   base, l, n, r, zero;

    if IsRowSpace(space)  then
        base := Base(space);
    else
        base := Copy(space);
    fi;

    if 0 = Length(base) and IsRowSpace(space)   then 
        return IdentityMat( space.dimension, field );
    elif 0 = Length(base)  then
        Error( "<base> is trivial, the whole vectorspace is needed\n" );
    else
        l := Length( base );
        n := Length( base[ 1 ] );
        if l < n  then
            zero := field.zero * base[ 1 ];
            for r  in [ l+1..n ]  do
                Add( base, zero );
            od;
        fi;
        return NullspaceMat( TransposedMat( base ) ); 
    fi;
end;    

##############################################################################
##
#F  IsSemiEchelonBasis( <struct> )
##
IsSemiEchelonBasis := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isSemiEchelonBasis ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isSemiEchelonBasis:=
          struct.operations.IsSemiEchelonBasis( struct );
    fi;
    return struct.isSemiEchelonBasis;
    end;

#############################################################################
##
#V  BasisRowSpaceOps
##
##  This is the operations record for an arbitrary basis of a row space.
##  It mainly delegates the work to a basis with nicer properties.
##
BasisRowSpaceOps := OperationsRecord( "BasisRowSpaceOps" );

#############################################################################
##
#F  BasisRowSpaceOps.IsSemiEchelonBasis( <B> )
##
##  Check whether the first nonzero entry in every row is equal to one,
##  and that all entries below the pivots are zero.
##
BasisRowSpaceOps.IsSemiEchelonBasis := function( B )

    local mat,      # vectors of 'B'
          zero,     # zero of the field
          one,      # one of the field
          nrows,    # number of rows
          ncols,    # number of columns
          heads,    # list of pivot rows
          ishead,   # boolean list of pivot columns
          i,        # loop over rows
          j,        # pivot column
          k;        # loop over lower rows

    mat   := B.vectors;
    nrows := Length( mat );
    heads := [];

    if nrows > 0 then

      zero   := 0 * mat[1][1];
      one    := zero ^ 0;
      ncols  := Length( mat[1] );
      ishead := BlistList( [ 1 .. ncols ], [] );

      # Loop over the columns.
      for i in [ 1 .. nrows ] do
  
        j:= DepthVector( mat[i] );
        if j > ncols or mat[i][j] <> one then
          return false;
        fi;
        for k in [ i+1 .. nrows ] do
          if mat[k][j] <> zero then
            return false;
          fi;
        od;
        ishead[j]:= true;
        heads[j]:= i;
  
      od;

    else

      ncols  := Length( Zero( B.structure ) );
      ishead := BlistList( [ 1 .. ncols ], [] );

    fi;
        
    # Now we know that the basis is semi-echelonized.
    # Change the basis record appropriately.
    B.heads      := heads;
    B.ishead     := ishead;
    B.operations := SemiEchelonBasisRowSpaceOps;

    return true;
    end;

#############################################################################
##
#F  BasisRowSpaceOps.Print( <obj> )
##
BasisRowSpaceOps.Print := function( obj )
    if   IsBound( obj.name ) then
      Print( obj.name );
    else
      Print( "Basis( ", obj.structure, ", ", obj.vectors, " )" );
    fi;
    end;

#############################################################################
##
#F  BasisRowSpaceOps.Coefficients( <B>, <v> )
##
BasisRowSpaceOps.Coefficients := function( B, v )

    if not IsBound( B.semiEchelonBasis ) then

      # This is the first call to 'Coefficients' for the basis 'B'.
      # Check whether 'B' is in fact semi-echelonized.
      if IsSemiEchelonBasis( B ) then

        # The operations record is already changed.
        return Coefficients( B, v );

      else

        # Compute a semi-echelonized basis and the base change.
        B.semiEchelonBasis:= SemiEchelonBasis( B.structure );
        if Length( B.vectors ) > 0 then
          B.basechange:= List( B.vectors,
                             x -> Coefficients( B.semiEchelonBasis, x ) )^-1;
        fi;

      fi;

    fi;

    # Now the basis knows a semi-echelonized basis.
    # Compute the coefficients with respect to this basis,
    # and apply the base change.
    if IsBound( B.basechange ) then
      return Coefficients( B.semiEchelonBasis, v ) * B.basechange;
    else
      return Coefficients( B.semiEchelonBasis, v );
    fi;
    end;

#############################################################################
##
#F  BasisRowSpaceOps.SiftedVector( <B>, <v> )
##
BasisRowSpaceOps.SiftedVector := function( B, v )

    if not IsBound( B.semiEchelonBasis ) then

      # This is the first call to 'SiftedVector' for the basis 'B'.
      # Check whether 'B' is in fact semi-echelonized.
      if IsSemiEchelonBasis( B ) then

        # The operations record is already changed.
        return SiftedVector( B, v );

      else

        # Compute a semi-echelonized basis and the base change.
        B.semiEchelonBasis:= SemiEchelonBasis( B.structure );
        if Length( B.vectors ) > 0 then
          B.basechange:= List( B.vectors,
                             x -> Coefficients( B.semiEchelonBasis, x ) )^-1;
        fi;
        
      fi;

    fi;

    # Now the basis knows a semi-echelonized basis.
    # Compute the sifted vector with respect to this basis.
    return SiftedVector( B.semiEchelonBasis, v );
    end;

##############################################################################
##
#F  RowSpaceOps.Basis( <V> )
#F  RowSpaceOps.Basis( <V>, <vectors> )
##
RowSpaceOps.Basis := function( arg )

    if   Length( arg ) = 1 then
      return SemiEchelonBasis( arg[1] );
    elif    not IsList( arg[2] ) 
         or ( Length( arg[2] ) > 0 and not IsMat( arg[2] ) ) then
      Error( "second argument must be a list of basis vectors" );
    else
      return rec( isBasis   := true,
                  vectors   := arg[2],
                  structure := arg[1],
                  operations := BasisRowSpaceOps );
    fi;
    end;

##############################################################################
##
#F  SemiEchelonBasis( <struct> )
#F  SemiEchelonBasis( <struct>, <vectors> )
##
SemiEchelonBasis := function( arg )
    local struct;

    if Length( arg ) < 1 or Length( arg ) > 2 or not IsRec( arg[1] ) then
      Error( "usage: SemiEchelonBasis( <struct> [, <vectors>] )" );
    fi;

    struct:= arg[1];
    if   Length( arg ) = 1 then
      if not IsBound( struct.semiEchelonBasis ) then
        if not IsBound( struct.operations ) then
          Error( "first argument must have 'operations' entry" );
        fi;
        struct.semiEchelonBasis:=
            struct.operations.SemiEchelonBasis( struct );
      fi;
      return struct.semiEchelonBasis;
    elif Length( arg ) = 2 then
      if not IsBound( struct.operations ) then
        Error( "first argument must have 'operations' entry" );
      fi;
      return struct.operations.SemiEchelonBasis( struct, arg[2] );
    fi;
    end;

#############################################################################
##
#V  SemiEchelonBasisRowSpaceOps
##
##  A basis is in semi-echelon form if the leading entry of every row is 1,
##  and all entries exactly below that 1 are zero.
##
##  (This form is obtained on application of 'SemiEchelonMat' to a matrix.)
##  
SemiEchelonBasisRowSpaceOps :=
         OperationsRecord( "SemiEchelonBasisRowSpaceOps", BasisRowSpaceOps );

#############################################################################
##
#F  SemiEchelonBasisRowSpaceOps.Print( <obj> )
##
SemiEchelonBasisRowSpaceOps.Print := function( obj )
    if   IsBound( obj.name ) then
      Print( obj.name );
    else
      Print( "SemiEchelonBasis( ", obj.structure, ", ", obj.vectors, " )" );
    fi;
    end;

#############################################################################
##
#F  SemiEchelonBasisRowSpaceOps.SiftedVector( <B>, <v> )
##
##  If '<B>.heads[<i>]' is bound this means that the <i>-th column is
##  leading column of the row '<B>.heads[<i>]'.
##
SemiEchelonBasisRowSpaceOps.SiftedVector := function( B, v )

    local zero,   # zero of the field
          i;      # loop over basis vectors

    zero:= 0 * v[1];

    # Compute the coefficients of the B vectors.
    for i in [ 1 .. Length( B.heads ) ] do
      if B.ishead[i] and v[i] <> zero then
        v:= v - v[i] * B.vectors[ B.heads[i] ];
      fi;
    od;

    # Return the remainder.
    return v;
    end;

#############################################################################
##
#F  SemiEchelonBasisRowSpaceOps.Coefficients( <B>, <v> )
##
SemiEchelonBasisRowSpaceOps.Coefficients := function( B, v )

    local coeff,  # coefficients list, result
          zero,   # zero of the field
          len,    # length of 'v'
          i;      # loop over 'v'

    # Preset the coefficients list with zeroes.
    zero:= 0 * v[1];
    coeff:= [];
    for i in [ 1 .. Length( B.vectors ) ] do
      coeff[i]:= zero;
    od;

    # Compute the coefficients of the base vectors.
    len:= Length( v );
    i:= DepthVector( v );
    while i <= len do
      if B.ishead[i] then
        coeff[ B.heads[i] ]:= v[i];
        v:= v - v[i] * B.vectors[ B.heads[i] ];
      else
        return false;
      fi;
      i:= DepthVector( v );
    od;

    # Return the coefficients.
    return coeff;
    end;

#############################################################################
##
#V  CanonicalBasisRowSpaceOps
##
##  The canonical basis is just a special case of a semi-echelon basis.
##
CanonicalBasisRowSpaceOps := OperationsRecord( "CanonicalBasisRowSpaceOps",
                                               SemiEchelonBasisRowSpaceOps );

#############################################################################
##
#F  CanonicalBasisRowSpaceOps.Print( <B> )
##
CanonicalBasisRowSpaceOps.Print := function( obj )
    if   IsBound( obj.name ) then
      Print( obj.name );
    else
      Print( "CanonicalBasis( ", obj.structure, " )" );
    fi;
    end;

#############################################################################
##
#F  RowSpaceOps.CanonicalBasis( <V> ) . . . .  canonical basis of a row space
##
##  The canonical basis of a row space is defined by applying a full Gauss
##  algorithm to the generators of the space.
##
RowSpaceOps.CanonicalBasis := function( V )

    local base,    # list of base vectors
          heads,   # list of numbers of leading columns
          ishead,  # boolean list corresp. to 'heads'
          ech,     # echelonized basis, if known
          row,     # one vector in 'ech'
          B,       # basis record, result
          m,       # number of rows in generators
          n,       # number of columns in generators
          zero,    # zero of the field
          i,       # loop over rows
          k;       # loop over columns

    base  := [];
    heads := [];
    zero:= V.field.zero;

    if IsBound( V.semiEchelonBasis ) then

      # We use the semi-echelonized basis.
      # All we have to do is to sort the basis vectors such that the
      # pivot elements are in increasing order, and to zeroize all
      # elements in the pivot columns except the pivot itself.

      ech:= V.semiEchelonBasis;
      ishead := ech.ishead;
      n:= Length( ech.heads );

      for i in [ 1 .. n ] do
        if ishead[i] then

          # Eliminate the 'ech.heads[i]'-th row with all those rows
          # that are below this row and have a bigger pivot element.
          row:= ech.vectors[ ech.heads[i] ];
          for k in [ i+1 .. n ] do
            if     ishead[k]
               and ech.heads[k] > ech.heads[i]
               and row[k] <> zero then
              row:= row - row[k] * ech.vectors[ ech.heads[k] ];
            fi;
          od;
          Add( base, row );
          heads[i]:= Length( base );

        fi;
      od;


    else

      if Length( V.generators ) > 0 then
  
        ishead:= BlistList( [ 1 .. Length( V.generators[1] ) ], [] );
  
        # Make a copy to avoid changing the original argument.
        B:= ShallowCopy( V.generators );
        m:= Length( B );
        n:= Length( B[1] );
    
        # Triangulize the matrix
        TriangulizeMat( B );
    
        # and keep only the nonzero rows of the triangular matrix.
        i:= 1;
        base := [];
        for k in [ 1 .. n ] do
          if i <= m and B[i][k] <> zero then
            base[i]:= B[i];
            heads[k]:= i;
            ishead[k]:= true;
            i:= i + 1;
          fi;
        od;
  
      else

        ishead:= BlistList( [ 1 .. Length( Zero( V ) ) ], [] );

      fi;

    fi;

    B:= rec( vectors            := base,
             heads              := heads,
             ishead             := ishead,
             isBasis            := true,
             isCanonicalBasis   := true,
             isSemiEchelonBasis := true,
             structure          := V,
             operations         := CanonicalBasisRowSpaceOps );

    # Several programs access the component 'semiEchelonBasis',
    # so store 'B' if necessary.
    if not IsBound( V.semiEchelonBasis ) then
      V.semiEchelonBasis:= B;
    fi;

    # Return the basis.
    return B;
    end;

##############################################################################
##
#F  RowSpaceOps.SemiEchelonBasis( <V> )
#F  RowSpaceOps.SemiEchelonBasis( <V>, <vectors> )
##
RowSpaceOps.SemiEchelonBasis := function( arg )

    local V,  # vector space
          B;  # the basis, result

    if Length( arg ) = 1 then

      V:= arg[1];

      # The canonical basis is just a special type of a semi-echelon basis.
      if IsBound( V.canonicalBasis ) then
        return V.canonicalBasis;
      fi;

      if Length( V.generators ) = 0 then

        B:= rec( vectors := V.generators,
                 heads   := [],
                 ishead  := BlistList( [ 1 .. Length( Zero( V ) ) ], [] ) );

      else

        B:= SemiEchelonMat( V.generators );

      fi;

      B.isBasis            := true;
      B.isSemiEchelonBasis := true;
      B.structure          := V;
      B.operations         := SemiEchelonBasisRowSpaceOps;

    else

      V:= arg[1];

      # Initialize the basis record.
      B:= rec( isBasis    := true,
               vectors    := arg[2],
               structure  := V,
               operations := BasisRowSpaceOps );
         
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
#F  RowSpaceOps.Parent( [ <V1>, <V2>, ... ] )
##
RowSpaceOps.Parent := function ( L )
    local  V, H;
    if IsBound( L[1].parent )  then
      V:= L[1].parent;
    else
      V:= L[1];
    fi;
    for H in L do
      if IsBound( H.parent ) and H.parent <> V  then
        Error( "<V> and <H> must have the same parent" );
      elif not IsBound( H.parent ) and H <> V  then
        Error( "<V> and <H> must have the same parent" );
      fi;
    od;
    return V;
    end;

#############################################################################
##
#F  RowSpaceOps.IsParent( <V> )
##
RowSpaceOps.IsParent := GroupOps.IsParent;

#############################################################################
##
#F  NumberVector( <B>, <v> )
##
##  Let $<v> = \sum_{i=1}^n \lambda_i b_i$ where
##  $<B> = (b_1, b_2, \ldots, b_n)$ is a basis of the vector space <V> over
##  the finite field $F$ with $\|F\| = q$, and the $\lambda_i$ are elements
##  of $F$.
##  Let $\overline{\lambda}$ be the integer corresponding to $\lambda$ as
##  defined by "FFList" 'FFList'.
##
##  Then 'NumberVector( <B>, <v> )' returns
##  $\sum_{i=1}^n \overline{\lambda_i} q^{i-1}$.
##
NumberVector := function( B, v )

    local fflist,  # field elements in canonical ordering
          q,       # size of the field
          coeff,   # coefficients of 'v' with respect to 'B'
          number,  # number of 'a', result
          i;       # loop over 'coeff'

    fflist:= FFList( B.structure.field );
    q:= Length( fflist );
    coeff:= Reversed( List( Coefficients( B, v ),
                            x -> Position( fflist, x ) - 1 ) );

    number:= coeff[1];
    for i in [ 2 .. Length( coeff ) ] do
      number:= q * number + coeff[i];
    od;

    # Return the number.
    return number;
    end;

#############################################################################
##
#F  ElementRowSpace( <B>, <n> )
##
##  returns the <n>-th element of the row space with basis <B>, with respect
##  to the ordering defined in "NumberVector" 'NumberVector'.
##
ElementRowSpace := function( B, n )

    local fflist,  # field elements in canonical ordering
          q,       # size of the field
          coeff,   # coefficients of the vector with respect to 'B'
          r,       # one remainder modulo 'q'
          v,       # the vector, result
          i;       # loop over the coefficients list

    if not IsInt( n ) or n < 0 then
      Error( "<n> must be a nonnegative integer" );
    fi;

    fflist:= FFList( B.structure.field );
    q:= Length( fflist );

    # Compute the 'q'-adic expression for 'n'.
    coeff:= [];
    while n <> 0 do
      r:= n mod q;
      Add( coeff, fflist[ r+1 ] );
      n:= ( n - r ) / q;
    od;

    # Form the linear combination.
    v:= Zero( B.structure );
    for i in [ 1 .. Length( coeff ) ] do
      v:= v + coeff[i] * B.vectors[i];
    od;

    # Return the vector.
    return v;
    end;

#############################################################################
##
#V  QuotientRowSpaceOps . . . .  operations record for quotiens of row spaces
##
QuotientRowSpaceOps := OperationsRecord( "QuotientRowSpaceOps",
                                         QuotientSpaceOps );

#############################################################################
##
#F  QuotientRowSpaceOps.Parent( [ <V1>, <V2>, ... ] )
##
QuotientRowSpaceOps.Parent := RowSpaceOps.Parent;

#############################################################################
##
#F  QuotientRowSpaceOps.IsParent( <V> )
##
QuotientRowSpaceOps.IsParent := RowSpaceOps.IsParent;

#############################################################################
##
#F  QuotientRowSpaceOps.Subspace( <V>, <gens> )
##
QuotientRowSpaceOps.Subspace := function( V, gens )

    local generators,    # list of generating cosets, if known
          S;             # the subspace record, result

    if not IsList( gens ) then
      Error( "<gens> must be a list" );
    fi;
    if Length( gens ) > 0 then
      if IsSpaceCoset( gens[1] ) then
        generators:= gens;
        gens:= List( gens, x -> x.representative );
      fi;
    fi;

    if not ForAll( gens, x -> Length( x ) = Length( V.factorNum.zero ) ) then
      Error( "generators must have compatible lengths" );
    fi;

    # Create the subspace record.
    S:= rec( isDomain      := true,
             isVectorSpace := true,

             parent        := V,
     
             factorNum     := Subspace( V.factorNum, gens ),
             factorDen     := V.factorDen,

             field         := V.field,

             operations    := QuotientRowSpaceOps );

    if IsBound( generators ) then
      S.generators:= generators;
    fi;

    return S;
    end;

#############################################################################
##
#V  BasisQuotientRowSpaceOps
##
##  This is the operations record for an arbitrary basis of a quotient of a
##  row space.
##  It mainly delegates the work to a basis with nicer properties.
##
BasisQuotientRowSpaceOps := OperationsRecord( "BasisQuotientRowSpaceOps" );

#############################################################################
##
#F  BasisQuotientRowSpaceOps.IsSemiEchelonBasis( <B> )
##
##  Check whether the representatives (stored in '<B>.vectors') form a
##  semi-echelonized matrix, and that the pivots are not pivots in the
##  semi-echelonized basis of the denominator space.
##
BasisQuotientRowSpaceOps.IsSemiEchelonBasis := function( B )

    local mat,      # vectors of 'B'
          zero,     # zero of the field
          one,      # one of the field
          nrows,    # number of rows
          ncols,    # number of columns
          heads,    # list of pivot rows
          ishead,   # boolean list of pivot columns
          basisDen, # basis of the denominator
          i,        # loop over rows
          j,        # pivot column
          k;        # loop over lower rows

    mat   := B.vectors;
    nrows := Length( mat );
    heads := [];

    if nrows > 0 then

      zero   := 0 * mat[1][1];
      one    := zero ^ 0;
      ncols  := Length( mat[1] );
      ishead := BlistList( [ 1 .. ncols ], [] );

      # Loop over the columns.
      for i in [ 1 .. nrows ] do
  
        j:= DepthVector( mat[i] );
        if j > ncols or mat[i][j] <> one then
          return false;
        fi;
        for k in [ i+1 .. nrows ] do
          if mat[k][j] <> zero then
            return false;
          fi;
        od;
        ishead[j]:= true;
        heads[j]:= i;
  
      od;

    else

      ishead := BlistList( [ 1 .. Length( Zero( B.structure ) ) ], [] );

    fi;
        
    # Now we know that the matrix is semi-echelonized.
    # Check that the pivots do not meet the pivots of the denominator.
    basisDen:= SemiEchelonBasis( B.structure.factorDen );
    if ForAny( IntersectionBlist( ishead, basisDen.ishead ),
               x -> x = true ) then
      return false;
    fi;

    # Change the basis record appropriately.
    B.heads      := heads;
    B.ishead     := ishead;
    B.basisNum   := SemiEchelonBasis( B.structure.factorNum );
    B.basisDen   := basisDen;
    B.operations := SemiEchelonBasisQuotientRowSpaceOps;

    return true;
    end;

#############################################################################
##
#F  BasisQuotientRowSpaceOps.Print( <obj> )
##
BasisQuotientRowSpaceOps.Print := BasisRowSpaceOps.Print;

#############################################################################
##
#F  BasisQuotientRowSpaceOps.Coefficients( <B>, <v> )
##
BasisQuotientRowSpaceOps.Coefficients := function( B, v )

    if not IsBound( B.semiEchelonBasis ) then

      # This is the first call to 'Coefficients' for the basis 'B'.
      # Check whether 'B' is in fact semi-echelonized.
      if IsSemiEchelonBasis( B ) then

        # The operations record is already changed.
        return Coefficients( B, v );

      else

        # Compute a semi-echelonized basis and the base change.
        B.semiEchelonBasis:= SemiEchelonBasis( B.structure );
        if Length( B.vectors ) > 0 then
          B.basechange:= List( B.vectors,
                             x -> Coefficients( B.semiEchelonBasis, x ) )^-1;
        fi;
        
      fi;

    fi;

    # Now the basis knows a semi-echelonized basis.
    # Compute the coefficients with respect to this basis,
    # and apply the base change.
    if IsBound( B.basechange ) then
      return Coefficients( B.semiEchelonBasis, v ) * B.basechange;
    else
      return Coefficients( B.semiEchelonBasis, v );
    fi;
    end;

#############################################################################
##
#F  BasisQuotientRowSpaceOps.SiftedVector( <B>, <v> )
##
BasisQuotientRowSpaceOps.SiftedVector := function( B, v )

    if not IsBound( B.semiEchelonBasis ) then

      # This is the first call to 'SiftedVector' for the basis 'B'.
      # Check whether 'B' is in fact semi-echelonized.
      if IsSemiEchelonBasis( B ) then

        # The operations record is already changed.
        return SiftedVector( B, v );

      else

        # Compute a semi-echelonized basis and the base change.
        B.semiEchelonBasis:= SemiEchelonBasis( B.structure );
        if Length( B.vectors ) > 0 then
          B.basechange:= List( B.vectors,
                             x -> Coefficients( B.semiEchelonBasis, x ) )^-1;
        fi;
        
      fi;

    fi;

    # Now the basis knows a semi-echelonized basis.
    # Compute the sifted vector with respect to this basis.
    return SiftedVector( B.semiEchelonBasis, v );
    end;

#############################################################################
##
#F  QuotientRowSpaceOps.Print( <obj> )  . . . . . . .  print a quotient space
##
QuotientRowSpaceOps.Print := function( V )
    if IsBound( V.name ) then
      Print( V.name );
    elif IsBound( V.parent ) then
      Print( "Subspace( ", V.parent, ", ", V.factorNum.generators, " )" );
    elif IsBound( V.factorDen.factorNum ) then
      Print( V.factorNum, " / ( ", V.factorDen, " )" );
    else
      Print( V.factorNum, " / ", V.factorDen.generators );
    fi;
    end;

#############################################################################
##
#F  QuotientRowSpaceOps.Generators( <V> )
##
QuotientRowSpaceOps.Generators := function( V )
    return List( Generators( V.factorNum ), x -> x + V.factorDen );
    end;

#############################################################################
##
#F  QuotientRowSpaceOps.Closure( <V>, <w> )
##
QuotientRowSpaceOps.Closure := function( V, w )

#T Problem!
    if   IsParent( V ) then
      return V;
    elif not IsBound( V.factorNum ) or not IsBound( w.factorden ) or
         w.factorDen <> V.factorDen then
      Error( "incompatible factor structures" );
    fi;
    return Closure( V.factorNum, w.factorNum ) / V.factorDen;
    end;

#############################################################################
##
#F  QuotientRowSpaceOps.Base( <V> )
##
QuotientRowSpaceOps.Base := function( V )
    return List( CanonicalBasis( V ).vectors, x -> x + V.factorDen );
    end;

#############################################################################
##
#V  SemiEchelonBasisQuotientRowSpaceOps
##
SemiEchelonBasisQuotientRowSpaceOps :=
     OperationsRecord( "SemiEchelonBasisQuotientRowSpaceOps",
                       BasisQuotientRowSpaceOps );

#############################################################################
##
#F  SemiEchelonBasisQuotientRowSpaceOps.Print( <obj> )
##
SemiEchelonBasisQuotientRowSpaceOps.Print := function( obj )
    if IsBound( obj.name ) then
      Print( obj.name );
    else
      Print( "SemiEchelonBasis( ", obj.structure, ", ", obj.vectors, " )" );
    fi;
    end;

#############################################################################
##
#F  SemiEchelonBasisQuotientRowSpaceOps.Coefficients( <B>, <v> )
##
SemiEchelonBasisQuotientRowSpaceOps.Coefficients := function( B, v )

    local coeff,    # coefficients vector, result
          j;        # loop over 'v'

    if IsRec( v ) then
      v:= v.representative;
    fi;
    coeff:= List( [ 1 .. Length( B.vectors ) ],
                  x -> B.structure.field.zero );
    j:= DepthVector( v );
    while j <= Length( v ) do
      if B.basisDen.ishead[j] then
        v:= v - v[j] * B.basisDen.vectors[ B.basisDen.heads[j] ];
      elif B.ishead[j] then
        coeff[ B.heads[j] ]:= v[j];
        v:= v - v[j] * B.vectors[ B.heads[j] ];
      else
        return false;
      fi;
      j:= DepthVector( v );
    od;

    return coeff;
    end;

#############################################################################
##
#F  SemiEchelonBasisQuotientRowSpaceOps.SiftedVector( <B>, <v> )
##
##  sifts any representative w.r. to the underlying semi-echelonized basis
##  of the numerator of the quotient space, and returns the coset of the
##  remainder.
##
SemiEchelonBasisQuotientRowSpaceOps.SiftedVector := function( B, v )
    if IsRec( v ) then
      v:= v.representative;
    fi;
    return SiftedVector( B.basisNum, v )
           + B.structure.factorDen;
    end;

#############################################################################
##
#V  CanonicalBasisQuotientRowSpaceOps
##
CanonicalBasisQuotientRowSpaceOps :=
      OperationsRecord( "CanonicalBasisQuotientRowSpaceOps",
                        SemiEchelonBasisQuotientRowSpaceOps );

#############################################################################
##
#F  CanonicalBasisQuotientRowSpaceOps.Print( <obj> )
##
CanonicalBasisQuotientRowSpaceOps.Print := CanonicalBasisRowSpaceOps.Print;

#############################################################################
##
#F  QuotientRowSpaceOps.SemiEchelonBasis( <V> )
#F  QuotientRowSpaceOps.SemiEchelonBasis( <V>, <vectors> )
##
QuotientRowSpaceOps.SemiEchelonBasis := function( arg )

    local V,        # the quotient space
          Bnum,     # semi-echelon basis of the numerator
          Bden,     # semi-echelon basis of the denominator
          B,        # semi-echelon basis of the quotient space, result
          vectors,  # basis vectors
          i;        # loop over basis vectors

    if Length( arg ) = 1 and IsQuotientSpace( arg[1] ) then

      V:= arg[1];

      # The canonical basis is just a special type of a semi-echelon basis.
      if IsBound( V.canonicalBasis ) then
        return V.canonicalBasis;
      fi;

      Bnum := SemiEchelonBasis( V.factorNum );
      Bden := SemiEchelonBasis( V.factorDen );
  
      B:= rec( isBasis            := true,
               isSemiEchelonBasis := true,
               structure          := V,
               basisNum           := Bnum,
               basisDen           := Bden,
               vectors            := [],
               heads              := [],
               ishead             := DifferenceBlist( Bnum.ishead,
                                                      Bden.ishead ),
               operations         := SemiEchelonBasisQuotientRowSpaceOps );
  
      for i in [ 1 .. Length( Bnum.heads ) ] do
        if B.ishead[i] then
          Add( B.vectors, Bnum.vectors[ Bnum.heads[i] ] );
          B.heads[i]:= Length( B.vectors );
        fi;
      od;

    elif Length( arg ) = 2 and IsQuotientSpace( arg[1] )
         and IsList( arg[2] ) then

      # Replace cosets by representatives if necessary.
      if Length( arg[2] ) > 0 and IsSpaceCoset( arg[2][1] ) then
        vectors:= List( arg[2], x -> x.representative );
      else
        vectors:= arg[2];
      fi;

      # Construct the basis record.
      B:= rec( isBasis    := true,
               vectors    := vectors,
               structure  := arg[1],
               operations := BasisQuotientRowSpaceOps );

      # Check whether the basis is semi-echelonized,
      # and compute the 'heads' information.
      if not IsSemiEchelonBasis( B ) then
        Error( "sorry, basis is not semi-echelonized" );
      fi;

    else
      Error( "usage: SemiEchelonBasis( <V> [, <vectors>] )" );
    fi;
  
    # Return the basis.
    return B;
    end;

#############################################################################
##
#F  QuotientRowSpaceOps.CanonicalBasis( <V> )
##
##  is the semi-echelonized basis whose vectors are those of the canonical
##  basis vectors of the numerator of <V> that are not contained in the
##  denominator of <V>.
##
QuotientRowSpaceOps.CanonicalBasis := function( V )

    local baseNum,  # canonical basis of the numerator
          baseDen,  # semi-echelonized basis of the denominator
          heads,    # list of heads for the factor
          vectors,  # list of basis vectors
          B;        # the basis record, result

    baseNum:= CanonicalBasis( V.factorNum );
    baseDen:= SemiEchelonBasis( V.factorDen );
    heads:= DifferenceBlist( baseNum.ishead, baseDen.ishead );
    heads:= Filtered( [ 1 .. Length( baseNum.heads ) ],
                      x -> heads[x] );
    vectors:= baseNum.vectors{ heads };
    B:= SemiEchelonBasis( V, vectors );
    B.operations:= CanonicalBasisQuotientRowSpaceOps;
    return B;
    end;

#############################################################################
##
#F  QuotientRowSpaceOps.Basis( <V> )
#F  QuotientRowSpaceOps.Basis( <V>, <vectors> )
##
##  <vectors> may be a list of cosets, or of representatives.
##
QuotientRowSpaceOps.Basis := function( arg )

    local vectors;

    if   Length( arg ) = 1 then
      return SemiEchelonBasis( arg[1] );
    elif not IsMat( arg[2] ) then
      Error( "second argument must be a list of basis vectors ",
             "or representatives" );
    else

      if Length( arg[2] ) > 0 and IsSpaceCoset( arg[2][1] ) then
        vectors:= List( vectors, x -> x.representative );
      else
        vectors:= arg[2];
      fi;

      return rec( isBasis   := true,
                  vectors   := vectors,
                  structure := arg[1],
                  operations := BasisQuotientRowSpaceOps );
    fi;
    end;

#############################################################################
##
#F  QuotientRowSpaceOps.Elements( <V> )
##
QuotientRowSpaceOps.Elements := function( V )
    
    local elms, # element list, result
          gen,  # one basis vector
          new,  # intermediate element list
          i;    # loop over field elements

    if Dimension( V.factorNum ) = Dimension( V.factorDen ) then
      return [ Zero( V ) ];
    fi;
    if not IsFinite( V.field ) then
      Error( "sorry, cannot compute elements of infinite domain <V>" );
    fi;
    elms:= [ Zero( V ) ];
    for gen in Base( V ) do
      new:= [];
      for i in Elements( V.field ) do
        Append( new, List( elms, x -> x + i * gen ) );
      od;
      elms:= new;
    od;
    Sort( elms );
    return elms;
    end;
 
#############################################################################
##
#F  RowSpaceOps.\/( <V>, <U> )  . . . . . . . . .  construct a quotient space
##
RowSpaceOps.\/ := function( V, U )
    
    local F;

    if not IsRowSpace( U ) and not IsList ( U ) then
      Error( "<U> must be a space or a list of space generators" );
    fi;

    if IsList( U ) then
      U:= RowSpace( V.field, U );
    fi;

    if ForAny( U.generators, x -> not x in V ) then
      Error( "<U> must be contained in <V>" );
    fi;

    # Construct the quotient space record.
    F:= rec( isDomain       := true,
             isVectorSpace  := true,
             isQuotientSpace  := true,
 
             field          := V.field,

             factorNum      := V,
             factorDen      := U,

             operations     := QuotientRowSpaceOps );

    # Return the result.
    return F;
    end;

#############################################################################
##
#F  SpaceCoset( <U>, <v> ) . . . . . . . . . . . . . . . create a space coset
##
SpaceCoset := function( U, v )
    if IsRowSpace( U ) then
      if not v in Parent( U )  then
        Error( "<v> must be in the parent space of <U>" );
      fi;
      return U.operations.SpaceCoset( U, v );
    else
      Error( "usage: SpaceCoset( <U>, <v> )" );
    fi;
    end;

#############################################################################
##
#F  RowSpaceOps.\+( <M1>, <M2> )  . . . . . . . . . . . . . . . sum of spaces
##
RowSpaceOps.\+ := function ( M1, M2 )

    local S;          # sum of <M1> and <M2>, result

    if   IsRowSpace( M1 ) and IsRowSpace( M2 ) then

      # Compute the sum of two spaces.
      Parent( M1, M2 );

      if M1.field <> M2.field then
        Error( "fields are not compatible" );
      elif Dimension( M1 ) = 0 then
        S:= M2;
      elif Dimension( M2 ) = 0 then
        S:= M2;
      else
        S:= Subspace( Parent( M1 ),
                      SumIntersectionMat( M1.generators, M2.generators )[1] );
                      
      fi;

    elif IsRowSpace( M1 ) and M2 in Parent( M1 )  then
      S:= SpaceCoset( M1, M2 );
    elif IsRowSpace( M2 ) and M1 in Parent( M2 )  then
      S:= SpaceCoset( M2, M1 );
    elif IsRowSpace( M1 ) then
      S:= List( Elements( M1 ), x -> x + M2 );
    elif IsRowSpace( M2 ) then
      S:= List( Elements( M2 ), x -> M1 + x );
    else
      Error( "panic, neither <M1> nor <M2> is a space" );
    fi;
    return S;
    end;

#############################################################################
##
#F  QuotientRowSpaceOps.\+( <M1>, <M2> )  . . . . . . . . . . . . sum of spaces
##
QuotientRowSpaceOps.\+ := function ( M1, M2 )
    if M1.factorDen <> M2.factorDen then
      Error( "incompatible subspaces" );
    fi;
    return ( M1.factorNum + M2.factorNum ) / M1.factorDen;
    end;

#############################################################################
##
#V  SpaceCosetRowSpaceOps . . . . . . . . . operations record of space cosets
##
##  is the operations record  of space cosets in a row space.
##
SpaceCosetRowSpaceOps := OperationsRecord( "SpaceCosetRowSpaceOps",
                                           DomainOps );

#############################################################################
##
#F  RowSpaceOps.SpaceCoset( <U>, <v> )  . . . . . . . .  create a space coset
##
##  'RowSpaceOps.SpaceCoset' is the default function to create a space
##  coset.   It only  stuffs <U>   and  <v>  in  a  record  and  enters   the
##  operations record 'SpaceCosetRowSpaceOps'.
##
##  The representative is *not* normalized.
##
RowSpaceOps.SpaceCoset := function ( U, g )

    local   C;          # coset '<U> + <g>', result

    # make the domain
    C := rec( isDomain        := true,
              isSpaceCoset    := true,
              isRowSpaceCoset := true,

              # identifying information
              factorDen       := U,
              representative  := g,
          
              # operations record
              operations      := SpaceCosetRowSpaceOps );
          
    # knowledge
    if IsBound( U.isFinite )  then
      C.isFinite:= U.isFinite;
    fi;
    if IsBound( U.size )  then
      C.size:= U.size;
    fi;
          
    # return the coset
    return C;
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.Elements( <C> )
##
SpaceCosetRowSpaceOps.Elements := function ( C )
    local elms;

    elms:= List( Elements( C.factorDen ), x -> x + C.representative );
    Sort( elms );
    return elms;
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.IsFinite( <C> )
##
SpaceCosetRowSpaceOps.IsFinite := function ( C )
    return IsFinite( C.factorDen );
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.Random( <C> )
##
SpaceCosetRowSpaceOps.Random := function ( C )
    return C.representative + Random( C.factorDen );
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.Size( <C> )
##
SpaceCosetRowSpaceOps.Size := function ( C )
    return Size( C.factorDen );
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.\=( <C>, <D> )
##
SpaceCosetRowSpaceOps.\= := function( C, D )

    # compare a space coset
    if IsSpaceCoset( C )  then

      # with another right coset
      if IsSpaceCoset( D )  then
        if      IsBound( C.canonicalRepresentative )
            and IsBound( D.canonicalRepresentative ) then
          return     C.factorDen = D.factorDen
                 and C.canonicalRepresentative = D.canonicalRepresentative;
        else
          return     C.factorDen = D.factorDen
                 and C.representative - D.representative in C.factorDen;
        fi;

      # with a space, which is a special coset
      elif IsVectorSpace( D )  then
        return C.factorDen = D  and C.representative in C.factorDen;

      # with something else
      else
        return DomainOps.\=( C, D );
      fi;

    # compare a subspace, which is a special coset
    elif IsVectorSpace( C )  then

      # with a coset
      if IsSpaceCoset( D )  then
        return C = D.factorDen  and D.representative in C;

      # with something else
      else
        Error("panic, neither <C> nor <D> is a space coset");
      fi;

    # compare something else
    else

      # with a coset
      if IsSpaceCoset( D )  then
        return DomainOps.\=( C, D );

      # with another something else
      else
        Error("panic, neither <C> nor <D> is a space coset");
      fi;

    fi;
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.\in( <v>, <C> )
##
SpaceCosetRowSpaceOps.\in := function( v, C )

    # use the list of elements of the subspace if they are known
    if IsBound( C.factorDen.elements )  then
      return v - C.representative in C.factorDen.elements;

    # otherwise leave it to the subspace to sort things out
    else
      return v - C.representative in C.factorDen;
    fi;
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.CanonicalRepresentative( <C> )
##
SpaceCosetRowSpaceOps.CanonicalRepresentative := function( C )
    return SiftedVector( CanonicalBasis( C.factorDen ), C.representative );
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.Difference( <C>, <D> )
## 
SpaceCosetRowSpaceOps.Intersection := function ( C, D )

    # special case of intersection of two space cosets
    if IsSpaceCoset( C )  and IsSpaceCoset( D )
       and C.factorDen = D.factorDen  then

        # its either the whole coset
        if C.representative - D.representative in C.factorDen  then
            return C;

        # or it is empty
        else
            return [];
        fi;

    # intersection of a right coset with something else
    else
        return DomainOps.Intersection( C, D );
    fi;
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.Union( <C>, <D> )
## 
SpaceCosetRowSpaceOps.Union := function ( C, D )

    # special case of union of two right cosets
    if IsSpaceCoset( C )  and IsSpaceCoset( D )
       and C.factorDen = D.factorDen  then

        # its either the whole coset
        if C.representative - D.representative in C.factorDen  then
          return C;

        # or the union
        else
            return DomainOps.Union( C, D );
        fi;

    # union of  a right coset and something else
    else
        return DomainOps.Union( C, D );
    fi;
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.Print( <C> )
## 
SpaceCosetRowSpaceOps.Print := function( C )
    if IsBound( C.name )  then
        Print( C.name );
    else
        Print( "(", C.representative, "+", C.factorDen, ")" );
    fi;
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.\+( <C>, <D> )
## 
SpaceCosetRowSpaceOps.\+ := function ( C, D )
    if   IsSpaceCoset( C )  and IsSpaceCoset( D ) then
      if C.factorDen <> D.factorDen then
        Error( "incompatible factor structures" );
      fi;
      return SpaceCoset( C.factorDen,   C.representative
                                         + D.representative );
    elif IsSpaceCoset( C )  and D in Parent( C.factorDen )  then
      return SpaceCoset( C.factorDen, C.representative + D );
    elif IsSpaceCoset( D )  and C in Parent( D.factorDen )  then
      return SpaceCoset( D.factorDen, D.representative + C );
    elif IsSpaceCoset( C )  then
      return List( Elements( C ), x -> x + D );
    elif IsSpaceCoset( D )  then
      return List( Elements( D ), x -> x + C );
    else
      Error( "sum of <C> and <D> is not defined" );
    fi;
    end;

#############################################################################
##
#F  SpaceCosetRowSpaceOps.\*( <s>, <C> )
## 
SpaceCosetRowSpaceOps.\* := function( scalar, C )
    if     not IsInt( scalar )
       and not scalar in C.factorDen.field then
      Error( "only scalar multiplication" );
    fi;
    return SpaceCoset( C.factorDen, scalar * C.representative );
    end;

#############################################################################
##
#F  RowSpaceOps.Cosets( <V>, <U> ) . . . . .  cosets of a subspace in a space
## 
RowSpaceOps.Cosets := function( V, U )
    return Elements( V / U );
    end;

#T Remove this as soon as possible!!
#############################################################################
##
#F  RowSpaceOps.\mod( <V>, <W> ) . . . . . . . . . . .  construct a modspace
##
##  The infix operator 'mod' for row spaces will create a faked factorspace of
##  the  given row spaces. This new structure is basically there to calculate
##  coefficients of vectors in the corresponding factorspace.
##
RowSpaceOps.\mod := function( V, W )
    local vbase, wbase, base, fac, i;

    # a base for the Modspace is the canonical one

    vbase := Base( V );
    wbase := Base( W );

    if vbase = [] or wbase = [] then  return ShallowCopy( V );  fi;

    base  := BaseMat( List( vbase, x -> SiftedVector( W, x ) ) );

    fac := rec(

        # fields that are the same with row spaces

        generators     := base,
        base           := base,
        field          := V.field,
        zero           := Zero( V ),

        # special Modspace fields

        parentspace    := V,
        subspace       := W,
        parentInfo     := Information( V ),
        subInfo        := Information( W ),
        mergedSpace    := rec(),

        # flags and operations

        isDomain       := true,
        isModspace     := true,
        isFinite       := IsFinite( V.field ) or base = [],
        isComputedBase := V.isComputedBase,
        operations     := ModspaceOps
    );

    if    fac.parentInfo.isTriangulizedBase
      and fac.subInfo.isTriangulizedBase then
        base := ShallowCopy( vbase );
        for i in [1..fac.subInfo.dimension] do
            base[Position(
                fac.parentInfo.weights,
                fac.subInfo.weights[i] )] := wbase[i];
        od;
        fac.mergedSpace := RowSpace( V.field, base, Zero( V ) );
        AddBase( fac.mergedSpace, base );
    else
        Error( "sorry, bases have to be triangulized" );
    fi;

    return fac;
end;


#############################################################################
##
#V  ModspaceOps . . . . . . . . . . . . . . . operations record for modspaces
##
ModspaceOps := ShallowCopy( RowSpaceOps );


#############################################################################
##
#F  ModspaceOps.Base( <V> ) . . . . . . . . . . . . . . .  base of a modspace
##
ModspaceOps.Base := function( V )
    return V.generators;
end;


#############################################################################
##
#F  ModspaceOps.Coefficients( <V>, <v> )  . . . .  coefficients of <v> in <V>
##
ModspaceOps.Coefficients := function( V, v )
    local   info, minfo, cf, z, i, j;

    if V.subInfo.isStandardBase then
        return [];
    else
        if not IsBound( V.information ) then
            Information( V );
        fi;
        if not IsBound( V.mergedSpace.information ) then
            Information( V.mergedSpace );
        fi;
        info  := V.information;
        minfo := V.mergedSpace.information;

        if minfo.isNormalizedBase then
            cf := ShallowCopy( info.zeroCoefficients );
            for i in [1..info.dimension] do
                cf[i] := v[info.weights[i]];
            od;
        elif minfo.isNormedBase then
            cf := ShallowCopy( info.zeroCoefficients );
            j  := 1;
            for i in [1..minfo.dimension] do
                z := v[minfo.weights[i]];
                if z <> V.field.zero then
                    v := v - z * minfo.base[i];
                    if minfo.weights[i] in info.weights then
                        cf[j] := z;
                        j := j + 1;
                    fi;
                elif minfo.weights[i] in info.weights then
                    j := j + 1;
                fi;
            od;
        elif minfo.isTriangulizedBase then
            cf := ShallowCopy( info.zeroCoefficients );
            j  := 1;
            for i in [1..minfo.dimension] do
                z := v[minfo.weights[i]];
                if z <> V.field.zero then
                    z := z / minfo.base[i][minfo.weights[i]];
                    v := v - z * minfo.base[i];
                    if minfo.weights[i] in info.weights then
                        cf[j] := z;
                        j := j + 1;
                    fi;
                elif minfo.weights[i] in info.weights then
                    j := j + 1;
                fi;
            od;
        fi;
    fi;
    return cf;
end;


#############################################################################
##
#F  ModspaceOps.Print( <V> )  . . . . . . . . . . . . . . print of a modspace
##
ModspaceOps.Print := function( V )
    Print( V.parentspace, " mod ", V.subspace );
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

