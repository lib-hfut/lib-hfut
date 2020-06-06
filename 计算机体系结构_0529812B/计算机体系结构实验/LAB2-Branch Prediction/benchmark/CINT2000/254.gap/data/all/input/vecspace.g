#############################################################################
##
#A  vecspace.g                  GAP library                    J\"urgen Mnich
##
#A  @(#)$Id: vecspace.g,v 3.16 1994/05/18 11:48:34 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains all polymorph functions for vector spaces.
##
##  $Log: vecspace.g,v $
#H  Revision 3.16  1994/05/18  11:48:34  sam
#H  fixed '\=' for quotient spaces
#H
#H  Revision 3.15  1994/04/29  18:49:20  sam
#H  added some functions for general quotient spaces
#H
#H  Revision 3.14  1994/03/16  11:27:59  sam
#H  fixed 'Coefficients'
#H
#H  Revision 3.13  1994/02/02  17:00:49  sam
#H  moved 'Dimension' to 'dispatch.g'
#H
#H  Revision 3.12  1993/08/24  06:17:29  martin
#H  fixed a minor typo, thanks to Philip Osterlund
#H
#H  Revision 3.11  1993/07/23  09:19:56  fceller
#H  added 'IsSubset'
#H  added mapping hack for 'RationalClasses',  this will go away
#H  as soon as the general mapping concept is implemented
#H
#H  Revision 3.10  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.9  1992/12/02  08:16:20  fceller
#H  added 'VectorSpaceOps.Random'
#H
#H  Revision 3.8  1992/05/21  15:33:15  martin
#H  added 'NormedVector'
#H
#H  Revision 3.7  1992/04/07  16:15:32  jmnich
#H  adapted to changes in the finite field module
#H
#H  Revision 3.6  1992/03/17  12:31:20  jmnich
#H  minor style changes, more bug fixes
#H
#H  Revision 3.5  1992/02/29  13:25:11  jmnich
#H  general library review, some bug fixes
#H
#H  Revision 3.4  1992/01/30  12:30:46  martin
#H  changed 'Order' to take two arguments, group and element
#H
#H  Revision 3.3  1992/01/07  12:22:55  jmnich
#H  changed a lot
#H
#H  Revision 3.2  1991/09/24  14:41:43  fceller
#H  'Coefficients' (internal) is now 'CoefficientsInt'.
#H
#H  Revision 3.1  1991/09/24  14:24:59  fceller
#H  Initial Release under RCS
#H
##


#############################################################################
##
#F  InfoVectorSpace1(...) . . . . . . . . . . . . . . . . package information
#F  InfoVectorSpace2(...) . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoVectorSpace1 )  then  InfoVectorSpace1 := Ignore;  fi;
if not IsBound( InfoVectorSpace2 )  then  InfoVectorSpace2 := Ignore;  fi;


#############################################################################
##
#F  VectorSpace( <generators>, <field>[, <zero>] )  . . create a vector space
##
##  This  is the basic function to create a vector space as a \GAP object. If
##  the  given  generators  are  in fact \GAP vectors the job will be left to
##  'RowSpace'.
##
VectorSpace := function( arg )
    local   gens, v, zero;

    # perform typecheck on the arguments

    if Length( arg ) < 2 or Length( arg ) > 3
      or not IsList( arg[1] ) or not IsField( arg[2] ) then
        Error( "usage: VectorSpace( <generators>, <field>[, <zero>] )" );
    fi;

    # extract zero element from arguments

    if Length( arg ) = 3 then   zero := arg[3];
    elif arg[1] <> [] then      zero := 0 * arg[1][1];
    else
        Error( "sorry, need at least one element" );
    fi;

    # Check if the given arguments describe a row space.
    # A row space, by definition, is a vector space whose generators are
    # \GAP vectors which all have entries lying in the field of the
    # vector space.

    if IsVector( zero )
      and ForAll( arg[1], IsVector )
      and ForAll( arg[1], x -> ForAll( x, y -> y in arg[2] ) ) then
        return RowSpace( arg[1], arg[2], zero );
    fi;

    # this will be a general vector space, so set up its generators

    gens := [];
    for v in arg[1] do
        if v <> zero then  Add( gens, v );  fi;
    od;

    # create the vector space record

    return rec(
        generators    := gens,
        field         := arg[2],
        zero          := zero,
        isDomain      := true,
        isVectorSpace := true,
        isFinite      := IsFinite( arg[2] ) or gens = [],
        operations    := VectorSpaceOps
    );
end;


#############################################################################
##
#F  IsVectorSpace( <obj> )  . . . . . . . test if an object is a vector space
##
IsVectorSpace := function( obj )
    return  IsRec( obj )
        and IsBound( obj.isVectorSpace ) and obj.isVectorSpace;
end;


#############################################################################
##
#V  VectorSpaceOps  . . . . . . . . . . . operations record for vector spaces
##
VectorSpaceOps := OperationsRecord( "VectorSpaceOps", DomainOps );


#############################################################################
##
#F  VectorSpaceOps.\=( <V>, <W> )  . . . test if two vector spaces are equal
##
##  Two vector spaces are considered to be equal if they are written over the
##  same field and if each of them contains the generators of the other.
##
VectorSpaceOps.\= := function( V, W )
    local   iseq;

    if IsVectorSpace( V )  and IsVectorSpace( W )  then
        iseq := V.field = W.field
                and ForAll( V.generators, x -> x in W )
                and ForAll( W.generators, x -> x in V );
    else
        iseq := DomainOps.\=( V, W );
    fi;
    return iseq;
end;


#############################################################################
##
#F  VectorSpaceOps.\<( <V>, <W> )  . . . . . .  test if <V> is less than <W>
##
##  As for vector spaces in general  there  is (so far) no way to determine a
##  canonical  Base  (in  this  module)  the decision is made as proposed for
##  domains in general if the vector spaces have the same field.
##
VectorSpaceOps.\< := function( V, W )
    local   isless;

    if IsVectorSpace( V )  and IsVectorSpace( W )  then
        if V.field = W.field then
            isless := DomainOps.\<( V, W );
        else
            isless := V.field < W.field;
        fi;
    else
        isless := DomainOps.\<( V, W );
    fi;
    return isless;
end;


#############################################################################
##
#F  VectorSpaceOps.Print( <V> ) . . . . . . . . . . . .  print a vector space
##
VectorSpaceOps.Print := function( V )
    if IsBound( V.name ) then
        Print( V.name );
    elif V.generators = [] then
        Print( "VectorSpace( [  ], ", V.field, ", ", V.zero, " )" );
    else
        Print( "VectorSpace( ", V.generators, ", ", V.field, " )" );
    fi;
    end;

#############################################################################
##
#F  VectorSpaceOps.IsParent( <V> )
##
#T  doesn't look nice!
##
VectorSpaceOps.IsParent := GroupOps.IsParent;

#############################################################################
##
#F  VectorSpaceOps.IsFinite( <V> )  . . . .  test if a vector space is finite
##
VectorSpaceOps.IsFinite := function( V )
    if   IsBound( V.generators ) then
      return IsFinite( V.field ) or V.generators = [];
    elif IsBound( V.factorNum ) then
      return IsFinite( V.field ) or
             Dimension( V.factorNum ) = Dimension( V.factorDen );
    else
      Error( "generators must be present for non-factor structure" );
#T generalize?
    fi;
    end;

#############################################################################
##
#F  VectorSpaceOps.Size( <V> )  . . . . . . . . . . .  size of a vector space
##
VectorSpaceOps.Size := function( V )
    if   Length( V.generators ) = 0 then
      return 1;
    elif not IsFinite( V.field ) then
      return "infinity";
    else
      return Size( V.field ) ^ Dimension( V );
    fi;
    end;

#############################################################################
##
#F  VectorSpaceOps.Elements( <V> )  . . . . . . .  elements of a vector space
##
VectorSpaceOps.Elements := function( V )
    local list, new, len, gen, ord, pow, tmp, i;

    if V.generators = [] then  return [ V.zero ];  fi;

    if not IsFinite( V.field ) then
        Error( "sorry, vector space is infinite" );
    fi;

    # <V> is written over a finite field,
    # so build all linear combinations of its generators.

    list := [ V.zero ];
    ord  := Order( V.field, V.field.root );
    for gen in V.generators do
        if not gen in list then
            new := [];
            len := Length( list );
            for pow in [1..ord] do
                tmp := ShallowCopy( list );
                for i in [1..len] do  tmp[i] := tmp[i] + gen;  od;
                UniteSet( new, tmp );
                gen := V.field.root * gen;
            od;
            UniteSet( list, new );
        fi;
    od;
    return list;
    end;

#############################################################################
##
#F  VectorSpaceOps.Random( <V> )  . . . . . . . . . . . . . . . random vector
##
VectorSpaceOps.Random:=function(V)
    local   f,  i,  r,  v;

    f := V.field;
    r := V.zero;
    for v  in Base(V)  do
        r := r + v * Random(f);
    od;
    return r;
    end;

#############################################################################
##
#F  VectorSpaceOps.Intersection( <V>, <W> ) . . intersection of vector spaces
##
VectorSpaceOps.Intersection := function( V, W )
    local base, olist, list, new, len, gen, ord, pow, tmp, i;

    if V.zero <> W.zero or V.field <> W.field then
        Error( "sorry, vector spaces are incompatible" );
    fi;

    if V.generators = [] or W.generators = [] then
        return VectorSpace( [], V.field, V.zero );
    fi;

    if not IsFinite( V ) and not IsFinite( W ) then
        Error( "sorry, vector spaces are infinite" );
    fi;

    olist := Intersection( Elements( V ), Elements( W ) );
    base  := [];
    list  := [ V.zero ];
    olist := Difference( olist, list );
    ord   := Order( V.field, V.field.root );
    while olist <> [] do
        gen := olist[1];
        Add( base, gen );
        new := [];
        len := Length( list );
        if Length( olist ) > ord * len then
            for pow in [1..ord] do
                tmp := ShallowCopy( list );
                for i in [1..len] do  tmp[i] := tmp[i] + gen;  od;
                UniteSet( new, tmp );
                gen := V.field.root * gen;
            od;
            SubtractSet( olist, new );
            UniteSet( list, new );
        else
            olist := [];
        fi;
    od;
    return VectorSpace( base, V.field, V.zero );
end;


#############################################################################
##
#F  VectorSpaceOps.IsSubspace( <V>, <W> ) .  test if <W> is a subspace of <V>
#T weg?
##
VectorSpaceOps.IsSubspace := function( V, W )
    if IsBound( W.base )  then
        return ForAll( W.base, x -> x in V );
    else
        return ForAll( W.generators, x -> x in V );
    fi;
end;


#############################################################################
##
#F  IsSubspace( <V>, <W> )  . . . . . . . .  test if <W> is a subspace of <V>
#T weg?
##
IsSubspace := function( V, W )
    local   issub;

    if not IsVectorSpace( V )  then
        Error( "usage: IsSubspace( <V>, <W> )" );
    else
        issub := V.operations.IsSubspace( V, W );
    fi;
    return issub;
end;


#############################################################################
##
#F  VectorSpaceOps.IsSubset( <V>, <U> ) . . . . . . . improved inclusion test
##
VectorSpaceOps.IsSubset := function( V, U )
    if IsVectorSpace( V ) and IsVectorSpace( U ) then
      return ForAll( U.generators, x -> x in V.generators or x in V );
    else
      return ForAll( Elements( U ), u -> u in V );
    fi;
    end;

#############################################################################
##
#F  VectorSpaceOps.Base( <V> )  . . . . . . . . . . .  base of a vector space
##
##  This function computes a base for a given vector space. However, although
##  it is computed, it is no canonical base, for it depends on the generating
##  vectors.
##
VectorSpaceOps.Base := function( V )
    local base, list, new, len, gen, ord, pow, tmp, i, j;

    if V.generators = [] then  return [];  fi;

    if not IsFinite( V ) then
        Error( "sorry, vector space is infinite" );
    fi;

    base := [];
    list := [ V.zero ];
    ord  := Order( V.field, V.field.root );
    for j in [1..Length( V.generators )-1] do
        gen := V.generators[j];
        if not gen in list then
            Add( base, gen );
            new := [];
            len := Length( list );
            for pow in [1..ord] do
                tmp := ShallowCopy( list );
                for i in [1..len] do  tmp[i] := tmp[i] + gen;  od;
                UniteSet( new, tmp );
                gen := V.field.root * gen;
            od;
            UniteSet( list, new );
        fi;
    od;

    gen := V.generators[Length( V.generators )];
    if not gen in list then
        Add( base, gen );
    fi;

    return base;
end;


#############################################################################
##
#F  VectorSpaceOps.AddBase( <V>, <base> ) . . add base to vector space record
##
##  Adds a user calculated base to a vector space record. This will reset the
##  flag   'isComputedBase'  and  discard  the  information  record  for  the
##  vector space.
##
VectorSpaceOps.AddBase := function( V, base )
    V.base := base;
    V.isComputedBase := false;
    Unbind( V.information );
end;


#############################################################################
##
#F  AddBase( <object>, <base> ) . . . . . . . . . . . add a base to an object
##
AddBase := function( obj, base )
    if IsDomain( obj ) and IsBound( obj.operations.AddBase ) then
        obj.operations.AddBase( obj, base );
    else
        Error( "sorry, can't add <base> to <object>" );
    fi;
end;


#############################################################################
##
#F  VectorSpaceOps.Dimension( <V> ) . . . . . . . dimension of a vector space
##
VectorSpaceOps.Dimension := function( V )
    return Length( Base( V ) );
    end;

#############################################################################
##
#F  VectorSpaceOps.Information( <V> ) . .  information about the vector space
##
VectorSpaceOps.Information := function( V )
    local   base, dim, size, ord, gen, list, new, len, num, comp, pow, tmp,
            info, oldbase, i;


    # first step: general information about the vector space

    info := rec(
        field    := V.field,
        zero     := V.zero,
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

    if V.generators = [] then

        info.base      := [];
        info.dimension := 0;

    elif info.isFiniteField then

        # find a generating set. if a base is there use this one.
        # we need the base to generate all elements. to ensure a lexicographic
        # order on the elements relative to a _base_ we have to reverse it.

        if IsBound( V.base ) then  oldbase := Reversed( V.base );
        else                       oldbase := V.generators;
        fi;

        # generate all elements and collect a base for the vector space

        base := [];
        list := [ V.zero ];
        ord  := Order( V.field, V.field.root );
        for gen in oldbase do
            if not gen in list then
                Add( base, gen );
                new := [];
                len := Length( list );
                for pow in [1..ord] do
                    tmp := ShallowCopy( list );
                    for i in [1..len] do  tmp[i] := tmp[i] + gen;  od;
                    Append( new, tmp );
                    gen := V.field.root * gen;
                od;
                Append( list, new );
            fi;
        od;

        base := Reversed( base );
        dim  := Length( base );

        if IsBound( V.base ) then
            if base <> V.base then
                V.base      := base;
                V.dimension := dim;
                Print( "#I  Information: warning, replacing bad base." );
            fi;
        else
            V.base      := base;
            V.dimension := dim;
        fi;

        info.base      := base;
        info.dimension := dim;

    elif IsBound( V.base ) then

        info.base      := V.base;
        info.dimension := Length( info.base );

    else
        Error( "sorry, no base available" );
    fi;

    # fourth step: enumeration and coefficients information
    #              only applicable if the field is finite

    if info.isFiniteField then

        # recall the data of the last step

        comp := function( a, b )  return list[a] < list[b];  end;
        num  := [1..Length( list )];
        Sort( num, comp );

        size := Size( V.field );

        info.elements  := Set( list );
        info.numbers   := num;
        info.exponents := List( base, x -> size );
    fi;

    return info;
end;


#############################################################################
##
#F  Information( <object> ) . . . . . . . . . . . information about an object
##
Information := function( obj )
    local   info;

    if IsRec( obj ) and IsBound( obj.information ) then
        info := obj.information;
    elif IsRec( obj ) and IsBound( obj.operations )
      and IsBound( obj.operations.Information ) then
        obj.information := obj.operations.Information( obj );
        info := obj.information;
    else
        Error( "sorry, can't set up information for <object>" );
    fi;
    return info;
end;


#############################################################################
##
#F  VectorSpaceOps.Coefficients( <V>, <v> ) . . .  coefficients of <v> in <V>
##
VectorSpaceOps.Coefficients := function( V, v )
    local   info, cf, i;

    if not IsBound( V.information ) then
        Information( V );
    fi;
    info := V.information;

    if info.dimension = 0 then  return [];  fi;

    cf := CoefficientsInt( info.exponents,
                info.numbers[Position( info.elements, v )]-1 );
    for i in [ 1 .. Length( cf ) ] do
      if cf[i] = 0 then
        cf[i]:= info.zero;
      else
        cf[i]:= info.field.root^(cf[i]-1);
      fi;
    od;

    return cf;
    end;

#############################################################################
##
#F  Coefficients( <V>, <v> )  . . . . . . . . . .  coefficients of <v> in <V>
##
Coefficients := function( V, v )
    local   cf;

    if IsList( V ) then
        cf := CoefficientsInt( V, v );
    elif IsRec( V ) and IsBound( V.operations.Coefficients ) then
        cf := V.operations.Coefficients( V, v );
    else
        Error( "sorry, can't compute coefficients of <v> in <V>" );
    fi;
    return cf;
end;


#############################################################################
##
#F  VectorSpaceOps.LinearCombination( <V>, <cf> ) . linear combination in <V>
##
VectorSpaceOps.LinearCombination := function( V, cf )
    local   base, dim, v, i;

    if not IsBound( V.base )      then  Base( V );       fi;
    if not IsBound( V.dimension ) then  Dimension( V );  fi;

    base := V.base;
    dim  := V.dimension;
    v    := V.zero;

    for i in [1..dim] do
        if cf[i] <> V.field.zero then
            v := v + cf[i] * base[i];
        fi;
    od;
    return v;
end;


#############################################################################
##
#F  LinearCombination( <V>, <cf> )  . . . . . . . . linear combination in <V>
##
LinearCombination := function( V, cf )
    local   lc;

    if IsDomain( V ) and IsBound( V.operations.LinearCombination ) then
        lc := V.operations.LinearCombination( V, cf );
    else
        Error( "sorry, can't compute linear combination in <V>" );
    fi;
    return lc;
end;


#############################################################################
##
#F  Enumeration( <object> ) . . . .  enumeration for the elements of <object>
##
Enumeration := function( obj )
    local   enum;

    if IsList( obj )  then
        enum := rec(
            elements := Set( obj ),
            number   := function ( e, x ) return Position( e.elements, x ); end,
            element  := function ( e, y ) return e.elements[y]; end
        );
    elif IsDomain( obj ) and IsBound( obj.enumeration ) then
        enum := obj.enumeration;
    elif IsDomain( obj ) and IsBound( obj.operations.Enumeration )  then
        obj.enumeration := obj.operations.Enumeration( obj );
        enum := obj.enumeration;
    elif IsDomain( obj ) then
        obj.enumeration := rec(
            elements := Elements( obj ),
            number   := function ( e, x ) return Position( e.elements, x ); end,
            element  := function ( e, y ) return e.elements[y]; end
        );
        enum := obj.enumeration;
    else
        Error( "sorry, can't set up an enumeration for <object>" );
    fi;
    return enum;
end;


#############################################################################
##
#F  LineEnumeration( <V> )  . . . . . . . enumerate one-dimensional subspaces
##
LineEnumeration := function( V )
    local enum, size, base, dim, range, off, ranges, offset, i;

    if not IsVectorSpace( V ) then
        Error( "usage: LineEnumeration( <V> )" );
    fi;

    base := Base( V );
    dim  := Length( base );
    enum := rec();
    if dim = 0 then
        enum.numberLines := 0;
        enum.line := function ( num )
            Error( "sorry, vector space has no lines" );
        end;
    elif dim = 1 then
        enum.numberLines := 1;
        enum.line := x -> base[1];
    elif IsFinite( V ) then
        enum   := Enumeration( V );
        size   := Size( V.field );
        range  := [1,1];
        ranges := [ range ];
        off    := 1;
        offset := [ off + 1 ];
        for i in [1..dim-1] do
            range := [ range[2] + 1, range[2] * size + 1 ];
            off   := off * size;
            Add( ranges, range );
            Add( offset, off + 1 );
        od;
        enum.numberLines := ((size ^ dim) - 1) / (size - 1);
        enum.line := function ( num )
            local i;
            for i in [1..dim] do
                if ranges[i][1] <= num and num <= ranges[i][2] then
                    return enum.element(  enum,
                                          num - ranges[i][1] + offset[i] );
                fi;
            od;
            Error( "sorry, number too big" );
        end;
    else
        Error( "sorry, vector space has an infinte number of lines" );
    fi;
    return enum;
end;


#############################################################################
##
#F  NormedVector(<vec>) . . . . . . . . . . . . . . . . . . . . normed vector
##
NormedVector := function ( vec )
    local   zero, elm;
    zero := vec[1] - vec[1];
    for elm  in vec  do
        if elm <> zero  then
            return (1/elm) * vec;
        fi;
    od;
    return vec;
end;

#############################################################################
##
#F  IsSpaceCoset( <C> )  . . . . . . . . . test if an object is a space coset
##
IsSpaceCoset := function ( C )
    return     IsRec( C )
           and IsBound( C.isSpaceCoset )
           and C.isSpaceCoset;
    end;

#############################################################################
##
#F  IsQuotientSpace( <obj> )
##
IsQuotientSpace := function( obj )
    return     IsRec( obj )
           and IsBound( obj.isQuotientSpace )
           and obj.isQuotientSpace;
    end;

#############################################################################
##
#V  QuotientSpaceOps
##
QuotientSpaceOps := OperationsRecord( "QuotientSpaceOps", VectorSpaceOps );

#############################################################################
##
#F  QuotientSpaceOps.Print( <V> )  . . . . . . . . . . print a quotient space
##
QuotientSpaceOps.Print := function( V )
    if IsBound( V.name ) then
      Print( V.name );
    else
      Print( "(", V.factorNum, ") / (", V.factorDen, ")" );
    fi;
    end;

#############################################################################
##
#F  QuotientSpaceOps.Zero( <V> ) . . . . . . . . . . zero of a quotient space
##
QuotientSpaceOps.Zero := function( V )
    return Zero( V.factorNum ) + V.factorDen;
    end;

#############################################################################
##
#F  QuotientSpaceOps.Dimension( <V> )  . . . .  dimension of a quotient space
##
QuotientSpaceOps.Dimension := function( V )
    return Dimension( V.factorNum ) - Dimension( V.factorDen );
    end;

#############################################################################
##
#F  QuotientSpaceOps.Intersection(<V>,<W>)  . intersection of quotient spaces
##
QuotientSpaceOps.Intersection := function( V, W )
    if not IsBound( V.factorDen ) or not IsBound( W.factorDen ) or
       V.factorDen <> W.factorDen then
      Error( "incompatible subspaces" );
    fi;
    return Intersection( V.factorNum, W.factorNum ) / V.factorDen;
    end;

#############################################################################
##
#F  QuotientSpaceOps.IsSubset( <V>, <W> )
##
QuotientSpaceOps.IsSubset := function( V, W )
    if   IsIdentical( V, W ) then
      return true;
    elif IsVectorSpace( V ) and IsVectorSpace( W ) then
      if not IsBound( V.factorDen ) or not IsBound( W.factorDen ) or
         V.factorDen <> W.factorDen then
        return false;
      fi;
      return IsSubset( V.factorNum, W.factorNum );
    else
      return ForAll( Elements( W ), x -> x in V );
    fi;
    end;

#############################################################################
##
#F  QuotientSpaceOps.Random( <V> )  . . .  random element of a quotient space
##
QuotientSpaceOps.Random := function( V )
    return Random( V.factorNum ) + V.factorDen;
    end;

#############################################################################
##
#F  QuotientSpaceOps.Size( <V> )  . . . . . . . . .  size of a quotient space
##
QuotientSpaceOps.Size := function( V )
    if Dimension( V.factorNum ) = Dimension( V.factorDen ) then
      return 1;
    elif not IsFinite( V.factorNum.field ) then
      return "infinity";
    else
      return Size( V.factorNum ) / Size( V.factorDen );
    fi;
    end;

#############################################################################
##
#F  QuotientSpaceOps.\=( <V1>, <V2> )  . . . . .  equality of quotient spaces
##
QuotientSpaceOps.\= := function ( V1, V2 )

    if IsQuotientSpace( V1 ) then

      if not IsRec( V2 ) and not IsList( V2 ) then
        return false;
      elif IsQuotientSpace( V2 )  then
        return V1.factorDen = V2.factorDen and
               V1.factorNum = V2.factorNum;
      elif IsSpaceCoset( V2 ) then
        return V1 = V2.factorDen and
               V2.representative in V2.factorDen;
      else
        return DomainOps.\=( V1, V2 );
      fi ;

    elif IsSpaceCoset( V1 ) then

      if not IsRec( V2 ) and not IsList( V2 ) then
        return false;
      elif IsQuotientSpace( V2 )  then
        return V1.factorDen = V2 and
               V1.representative in V1.factorDen;
      else
        Error( "panic, neither argument is a quotient space" );
      fi;
    else
      Error( "panic, neither argument is a quotient space" );
    fi;
    end;

#############################################################################
##
#F  QuotientSpaceOps.\<( <V>, <W> )
##
##  Ordering of quotient spaces is defined as ordering of the denominators,
##  and for equal denominators the ordering of numerators.
##
QuotientSpaceOps.\< := function( V, W )
    if IsQuotientSpace( V ) and IsQuotientSpace( W ) then
      if V.factorDen = W.factorDen then
        return V.factorNum < W.factorNum;
      else
        return V.factorDen < W.factorDen;
      fi;
    else
      return DomainOps.\<( V, W );
    fi;
    end;

#############################################################################
##
#F  QuotientSpaceOps.\in( <v>, <V> )  . . membership test in a quotient space
##
QuotientSpaceOps.\in := function( v, V )
    if not IsBound( v.factorDen ) or not IsBound( V.factorDen )
       or v.factorDen <> V.factorDen then
      Error( "incompatible factor structures" );
    fi;
    return v.representative in V.factorNum;
    end;

#############################################################################
##
#V  STMappingOps  . . . . . . . operations record for special affine mappings
##
STMappingOps := OperationsRecord( "STMappingOps", MappingOps );


#############################################################################
##
#F  STMapping( <V>, <s>, <t> )  . . . . . generate the affine mapping v->sv+t
##
STMapping := function( V, scalar, translation )
    local  map;
    map := rec( isGeneralMapping := true,
                isMapping        := true,
                isInjective      := true,
                isSurjective     := true,
                isBijection      := true,
                domain		 := Mappings,
                source		 := V,    
                range            := V,
                image            := V,     
                preImage         := V,
                scalar           := scalar,
                translation      := translation,
                operations       := STMappingOps );
    return map;
end;

STMappingOps.CompositionMapping := function( map1, map2 )
    return STMapping( map1.source,
	map1.scalar * map2.scalar,
	map2.scaler * map1.translation + map2.translation );
end;

STMappingOps.PowerMapping := function( map, n )
    local  pow;
    if map.scalar = map.scalar ^ 0  then
	return STMapping( map.source, map.scalar, n * map.translation );
    else
        pow := map.scalar ^ n;
	return STMapping( map.source, pow,
	    ( 1 - pow ) / ( 1 - map.scalar ) * map.translation );
    fi;
end;

STMappingOps.ImageElm := function( map, elm )
    return map.scalar * elm + map.translation;
end;

STMappingOps.ImagesElm := function( map, elm )
    return [ elm ^ map ];
end;

STMappingOps.PreImageElm := function( map, elm )
    return map.scalar ^ -1 * ( elm - map.translation );
end;

STMappingOps.PreImagesRepresentative := STMappingOps.PreImageElm;

STMappingOps.InverseMapping := function( map )
    local inv;
    inv := map.scalar ^ -1;
    return STMapping( map.source, inv, -inv * map.translation );
end;

STMappingOps.( "=" ) := function( map1, map2 )
  return     map1.source      = map2.source
         and map1.translation = map2.translation
         and map1.scalar      = map2.scalar;
end;

STMappingOps.Print := function( map )
    Print( "STMapping( ", map.source, ", ", map.scalar, ", ",
        map.translation, " )" );
end;


#############################################################################
##
#F  VectorSpaceOps.IdentityMapping( <V> ) . . . . . . identity mapping of <V>
##
VectorSpaceOps.IdentityMapping := function( V )
    return STMapping( V, V.field.one, V.zero );
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
