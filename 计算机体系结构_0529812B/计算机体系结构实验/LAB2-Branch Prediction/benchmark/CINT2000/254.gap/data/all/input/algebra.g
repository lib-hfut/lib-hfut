#############################################################################
##
#A  algebra.g                   GAP library                     Thomas Breuer
##
#A  @(#)$Id: algebra.g,v 3.2 1994/06/17 09:36:01 sam Rel $
##
#Y  Copyright 1994-1995,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains all  functions  and  operations for  algebra elements.
##  This file contains dispatcher &  default functions for algebra functions.
##
#H  $Log: algebra.g,v $
#H  Revision 3.2  1994/06/17  09:36:01  sam
#H  fixed assignment of 'Closure'
#H
#H  Revision 3.1  1994/06/10  02:42:04  sam
#H  *** empty log message ***
#H
#H  Revision 3.0  1994/05/19  13:19:17  sam
#H  Initial Revision under RCS
#H
##

#############################################################################
##
#F  InfoAlgebra?( ... ) . . . .  information function for the algebra package
##
    if not IsBound( InfoAlgebra1 )  then InfoAlgebra1 := Ignore;  fi;
    if not IsBound( InfoAlgebra2 )  then InfoAlgebra2 := Ignore;  fi;

#############################################################################
##
#F  IsAlgebraElement( <obj> ) . . . . test if an object is an algebra element
##
IsAlgebraElement := function( obj )
    return IsMatrix( obj )
           or ( IsRec( obj )
                and IsBound( obj.isAlgebraElement )
                and obj.isAlgebraElement );
    end;

#############################################################################
##
#V  AlgebraElements . . . . . . . . . . . . .  domain of all algebra elements
#V  AlgebraElementsOps  . . . . . . .  operations record of 'AlgebraElements'
##
##  'AlgebraElements' is the domain of all algebra  elements, i.e., records
##  that implement algebra elements.  Note that 'AlgebraElements' is not an
##  algebra.
##
##  'AlgebraElementsOps' is the operations record for the 'AlgebraElements'
##  domain.  Other domains that consist of algebra elements, for example
##  'FreeAlgebraElements', inherit from this operations record.
##
##  The most important function defined for 'AlgebraElements' is 'Algebra',
##  i.e., 'AlgebraElements' knowns how to make an algebra from a list of
##  elements.
##
AlgebraElementsOps := OperationsRecord( "AlgebraElementsOps",
                                        RingOps );

AlgebraElements := rec( isDomain   := true,
                        name       := "AlgebraElements",
                        isFinite   := false,
                        size       := "infinity",
                        operations := AlgebraElementsOps );

AlgebraElementsOps.\in := function( a, AlgebraElements )
    return IsAlgebraElement( a );
    end;

#############################################################################
##
#F  AlgebraElementOps . . . .  operations record for generic algebra elements
##
AlgebraElementOps         := rec( );

AlgebraElementOps.\= := function( a, b )
    if    IsRec( a ) and IsBound( a.isAlgebraElement ) and a.isAlgebraElement
      and IsRec( b ) and IsBound( b.isAlgebraElement ) and b.isAlgebraElement
      and a.domain = b.domain
    then
      return a.element = b.element;
    else
      return false;
    fi;
    end;

AlgebraElementOps.\< := function( a, b )
    if    IsRec( a ) and IsBound( a.isAlgebraElement ) and a.isAlgebraElement
      and IsRec( b ) and IsBound( b.isAlgebraElement ) and b.isAlgebraElement
    then
      if a.domain = b.domain  then
        return a.element < b.element;
      else
        return a.domain < b.domain;
      fi;
    elif  IsRec( a ) and IsBound( a.isAlgebraElement ) and a.isAlgebraElement
    then
      return not IsAlgebraElement( b );
    elif  IsRec( b ) and IsBound( b.isAlgebraElement ) and b.isAlgebraElement
    then
      return IsAlgebraElement( a );
    else
      Error("panic, either <a> or <b> must be an algebra element");
    fi;
    end;

AlgebraElementOps.\+ := function( a, b )
    Error( "no default method to add generic algebra elements" );
    end;

AlgebraElementOps.\- := function( a, b )
    Error( "no default method to subtract generic algebra elements" );
    end;

AlgebraElementOps.\* := function( a, b )
    Error( "no default method to multiply generic algebra elements" );
    end;

AlgebraElementOps.\^ := function( a, b )
    Error( "no default method to multiply generic algebra elements" );
    end;

AlgebraElementOps.Print := function( a )
    if IsBound( a.name ) then
      Print( a.name );
    else
      Print( "AlgebraElement( ", a.element, " )" );
    fi;
    end;

#############################################################################
##
#F  AlgebraString(<A>,<name>) . . . . . . . . . .  algebra information string
##
AlgebraString := function( A, name )
    if IsBound( A.name )  then
      if IsBound( A.size )  then
        return Concatenation( A.name, " (size ", StringInt( A.size ), ")" );
      else
        return A.name;
      fi;
    else
      if IsBound( A.size )  then
        return Concatenation( "<", name, "> (",
                               StringInt(Length(A.generators)),
                               " gens, size ", StringInt(A.size), ")" );
      else
        return Concatenation( "<", name, "> (",
                              StringInt(Length(A.generators)), " gens)" );
      fi;
    fi;
    end;

#############################################################################
##
#F  IsAlgebra( <obj> )  . . . . . . . . . . . test if an object is an algebra
##
IsAlgebra := function( obj )
    return IsRec( obj )
           and IsBound( obj.isAlgebra )
           and obj.isAlgebra;
    end;

#############################################################################
##
#F  IsUnitalAlgebra( <obj> )  . . . .  test if an object is an algebra with 1
##
IsUnitalAlgebra := function( obj )
    return IsRec( obj )
           and IsBound( obj.isUnitalAlgebra )
           and obj.isUnitalAlgebra;
    end;

#############################################################################
##
#V  AlgebraOps  . . . . . . . . . . . . . . .  operations record for algebras
##
##  'AlgebraOps' is the operations record for algebras.  This is initially a
##  copy of 'RingOps'.  This way all the default methods for rings are
##  inherited.
##
##  The operations records for special algebras are created by making a copy
##  of this record and overlaying some functions.  This way those algebras
##  inherit the default methods.
##
AlgebraOps := OperationsRecord( "AlgebraOps", RingOps );

#############################################################################
##
#F  AlgebraOps.Zero( <A> ) . . . . . . . . . . . . zero element of an algebra
##
AlgebraOps.Zero := function( A )
    if Length( Generators( Parent( A ) ) ) > 0 then
      return 0 * Parent( A ).generators[1];
    else
      Error( "cannot compute zero element without generators" );
    fi;
    end;

#############################################################################
##
#F  AlgebraOps.\^( <A>, <n> ) . . . . . . . . . . free module over an algebra
##
AlgebraOps.\^ := FreeModule;

#############################################################################
##
#F  Algebra( <F>, <gens> )  . . . . . . . . . . . . . . . . create an algebra
#F  Algebra( <F>, <gens>, <zero> )
#F  Algebra( <F>, <D> )
#F  Algebra( <D> )
##
##  *Note* that the fourth argument in the 'Algebra' function of an
##  'operations' record is the algebra zero only if it was explicitly
##  entered *and* if the generators list (the second argument) is empty.
##  Otherwise the fourth argument is set equal to the first.
##  This allows to avoid unnecessary zero constructions
##  (Think of huge matrices!).
##  One may enter a dummy if one is sure that the generators list is
##  nonempty.
##
Algebra := function( arg )

    local F,          # coefficients field
          A,          # algebra containing the elements of <arg>, result
          D,          # domain containing the elements of <arg>
          gens,       # elements of <arg> as a flat list
          zero,       # zero element (or dummy)
          i;          # loop variable

    # if called with a domain argument, look in the operations record
    if   Length( arg ) = 1 and IsDomain( arg[1] ) then
      A:= arg[1].operations.Algebra( arg[1].field, arg[1] );

    elif Length( arg ) = 2 and IsField( arg[1] ) and IsDomain( arg[2] ) then
      A:= arg[2].operations.Algebra( arg[1], arg[2] );

    # list of generators without zero
    elif Length( arg ) = 2 and IsField( arg[1] ) and IsList( arg[2] )
                           and Length( arg[2] ) > 0 then
      F    := arg[1];
      gens := arg[2];
      D    := Domain( gens );
      A    := D.operations.Algebra( F, D, gens, F );

    # list of generators plus zero
    elif Length( arg ) = 3 and IsField( arg[1] ) and IsList( arg[2] ) then
      F    := arg[1];
      gens := arg[2];
      zero := arg[3];
      D    := Domain( Concatenation( gens, [ zero ] ) );
      A    := D.operations.Algebra( F, D, gens, zero );

    # no argument given, error
    else
      Error( "usage: Algebra( <F>, <gens> [,<zero>] )",
             " or Algebra( <F>, <D> )");
    fi;

    # return the algebra
    for i  in [ 1 .. Length( A.generators ) ]  do
      A.(i) := A.generators[i];
    od;
    return A;

    end;

#############################################################################
##
#F  UnitalAlgebra( <F>, <gens> )  . . . . . . . . .  create an algebra with 1
#F  UnitalAlgebra( <F>, <gens>, <zero> )
#F  UnitalAlgebra( <F>, <D> )
#F  UnitalAlgebra( <D> )
##
##  *Note* that the fourth argument in the 'UnitalAlgebra' function of an
##  'operations' record is the algebra zero only if it was explicitly
##  entered *and* if the generators list (the second argument) is empty.
##  Otherwise the fourth argument is set equal to the first.
##  This allows to avoid unnecessary zero constructions
##  (Think of huge matrices!).
##  One may enter a dummy if one is sure that the generators list is
##  nonempty.
##
UnitalAlgebra := function( arg )

    local F,          # coefficients field
          A,          # algebra containing the elements of <arg>, result
          D,          # domain containing the elements of <arg>
          gens,       # elements of <arg> as a flat list
          zero,       # zero element (or dummy)
          i;          # loop variable

    # if called with a domain argument, look in the operations record
    if   Length( arg ) = 1 and IsDomain( arg[1] ) then
      A:= arg[1].operations.UnitalAlgebra( arg[1].field, arg[1] );

    elif Length( arg ) = 2 and IsField( arg[1] ) and IsDomain( arg[2] ) then
      A:= arg[2].operations.UnitalAlgebra( arg[1], arg[2] );

    # list of generators without zero
    elif Length( arg ) = 2 and IsField( arg[1] ) and IsList( arg[2] )
                           and Length( arg[2] ) > 0 then
      F    := arg[1];
      gens := arg[2];
      D    := Domain( gens );
      A    := D.operations.UnitalAlgebra( F, D, gens, F );

    # list of generators plus zero
    elif Length( arg ) = 3 and IsField( arg[1] ) and IsList( arg[2] ) then
      F    := arg[1];
      gens := arg[2];
      zero := arg[3];
      D    := Domain( Concatenation( gens, [ zero ] ) );
      A    := D.operations.UnitalAlgebra( F, D, gens, zero );

    # no argument given, error
    else
      Error( "usage: UnitalAlgebra( <F>, <gens> [, <zero>] ),\n",
             " or UnitalAlgebra( <F>, <D> )");
    fi;

    # Return the algebra.
    for i  in [ 1 .. Length( A.generators ) ]  do
      A.(i) := A.generators[i];
    od;
    return A;
    end;

#############################################################################
##
#F  AlgebraElementsOps.Algebra( <F>, AlgebraElements, <gens>, <zero> )
##
AlgebraElementsOps.Algebra := function( F, AlgebraElements, gens, zero )

    local   A,          # algebra containing <gens>, result
            i;          # loop variable

    # make the domain
    A:= rec( isDomain      := true,
             isAlgebra     := true,
             isVectorSpace := true,

    # identification
             field         := F,
             generators    := ShallowCopy( gens ),

    # operations record
             operations    := AlgebraOps );

    # If the generators list is empty we need a zero element.
    if Length( gens ) = 0 then
      A.zero:= zero;
    fi;

    # Return the algebra.
    return A;
    end;

#############################################################################
##
#F  Subalgebra( <A>, <gens> ) . . . . . . . . . . . . . . create a subalgebra
##
Subalgebra := function( A, gens )
    local   U,          # subalgebra of <A> with generators <gens>, result
            i;          # loop variable

    # check the arguments
    if not IsAlgebra( A ) then
      Error( "<A> must be an algebra" );
    fi;
    if not ForAll( gens, gen -> gen in A )  then
      Error( "the generators <gens> must lie in <A>" );
    fi;

    # make the subalgebra
    U := A.operations.Subalgebra( Parent( A ), gens );
    for i in [ 1 .. Length( U.generators ) ] do
      U.(i):= U.generators[i];
    od;

    # return the subalgebra
    return U;
    end;

#############################################################################
##
#F  UnitalSubalgebra( <A>, <gens> ) . . . . . . . . . . . create a subalgebra
##
UnitalSubalgebra := function( A, gens )
    local   U,          # subalgebra of <A> with generators <gens>, result
            i;          # loop variable

    # check the arguments
    if not IsAlgebra( A ) then
      Error( "<A> must be an algebra" );
    fi;
    if not ForAll( gens, gen -> gen in A )  then
      Error( "the generators <gens> must lie in <A>" );
    fi;
    if Length( A.generators ) = 0 or not A.generators[1]^0 in A then
      Error( "<A> must be unital" );
    fi;

    # make the subalgebra
    U := A.operations.UnitalSubalgebra( Parent( A ), gens );
    for i in [ 1 .. Length( U.generators ) ] do
      U.(i):= U.generators[i];
    od;

    # return the subalgebra
    return U;
    end;

#############################################################################
##
#F  AlgebraOps.Subalgebra( <A>, <gens> )  . . . . . . . . create a subalgebra
##
AlgebraOps.Subalgebra := function( A, gens )
    local   U;          # subalgebra of <A> generated by <gens>, result

    gens := ShallowCopy( gens );

    # handle special case
    if A.generators = gens then
      U := A;

    # otherwise
    else

      # make the subalgebra
      U            := rec();
      U.isDomain   := true;
      U.isAlgebra  := true;
      U.parent     := Parent( A );

      # enter the identification
      U.generators := gens;
      U.field      := A.field;

      # enter the operations record
      U.operations := AlgebraOps;

    fi;

    # return the subalgebra
    return U;
    end;

#############################################################################
##
#F  AlgebraOps.UnitalSubalgebra( <A>, <gens> )  . . . . . create a subalgebra
##
AlgebraOps.UnitalSubalgebra := function( A, gens )
    local   U;          # subalgebra of <A> generated by <gens>, result

    gens := ShallowCopy( gens );

    # handle special case
    if A.generators = gens then
      U := A;

    # otherwise
    else

      # make the subalgebra
      U                  := rec();
      U.isDomain         := true;
      U.isAlgebra        := true;
      U.isUnitalAlgebra  := true;
      U.parent           := Parent( A );

      # enter the identification
      U.generators       := gens;
      U.field            := A.field;

      # enter the operations record
      U.operations       := UnitalAlgebraOps;

    fi;

    # return the subalgebra
    return U;
    end;

#############################################################################
##
#F  AlgebraOps.IsFinite( <A> )
##
AlgebraOps.IsFinite := function( A )
    if   Length( A.generators ) = 0 then
      return true;
    elif not IsFinite( A.field ) then
      return false;
    else
      Error( "cannot decide whether algebra <A> is finite" );
    fi;
    end;

#############################################################################
##
#F  AlgebraOps.Size( <A> )
##
AlgebraOps.Size := function( A )
    if   Length( A.generators ) = 0 then
      return 1;
    elif not IsFinite( A.field ) then
      return "infinity";
    else
      return Length( Elements( A ) );
    fi;
    end;

#############################################################################
##
#F  TrivialSubalgebra( <A> )  . . . . . . .  trivial subalgebra of an algebra
##
TrivialSubalgebra := function( A )

    # Check that the argument is an algebra.
    if not IsAlgebra( A ) then
      Error( "<A> must be an algebra" );
    fi;

    # return the trivial subalgebra
    if not IsBound( A.trivialSubalgebra ) then
        A.trivialSubalgebra:= A.operations.TrivialSubalgebra( A );
    fi;
    return A.trivialSubalgebra;

    end;

#############################################################################
##
#F  AlgebraOps.TrivialSubalgebra( <A> )  . . trivial subalgebra of an algebra
##
AlgebraOps.TrivialSubalgebra := function( A )
    local   T;

    T:= Subalgebra( Parent( A ), [] );

    # add the set of elements
    T.elements := [ Zero( Parent( A ) ) ];
    return T;
    end;

#############################################################################
##
#F  AsAlgebra( <F>, <D> )  . . view a domain as an algebra over the field <F>
#F  AsAlgebra( <D> )
##
AsAlgebra := function( arg )
    local   A;

    if     Length( arg ) = 1
       and IsDomain( arg[1] )
       and IsBound( arg[1].field ) then

      # Convert a domain into an algebra.
      A:= arg[1].operations.AsAlgebra( arg[1].field, arg[1] );

    elif   Length( arg ) = 2
       and IsField( arg[1] )
       and IsDomain( arg[2] ) then

      # Convert a domain into an algebra.
      A:= arg[2].operations.AsAlgebra( arg[1], arg[2] );

    elif   Length( arg ) = 2
       and IsField( arg[1] )
       and IsList( arg[2] ) then

      # Convert a list into an algebra.
      A:= Domain( arg[2] ).operations.AsAlgebra( arg[1], arg[2] );

    else
      Error( "usage: AsAlgebra([<F>,] <D>) for domain or list <D>" );
    fi;

    # Return the algebra.
    return A;
    end;

#############################################################################
##
#F  AsUnitalAlgebra( <D>, <F> )  . . . . .  view a domain as a unital algebra
##
AsUnitalAlgebra := function( arg )
    local   A,
            gens;

    if     Length( arg ) = 1
       and IsDomain( arg[1] )
       and IsBound( arg[1].field ) then

      # Check that the zero-th power really is in the algebra.
      gens:= Generators( arg[1] );
      if Length( gens ) = 0 or not gens[1]^0 = One( arg[1] ) then
        Error( "<D> is not unital" );
      fi;

      # Convert a domain into a unital algebra.
      A:= arg[1].operations.AsUnitalAlgebra( arg[1].field, arg[1] );

    elif   Length( arg ) = 2
       and IsField( arg[1] )
       and IsDomain( arg[2] ) then

      # Check that the zero-th power really is in the algebra.
      gens:= Generators( arg[2] );
      if Length( gens ) = 0 or not gens[1]^0 = One( arg[2] ) then
        Error( "<D> is not unital" );
      fi;

      # Convert a domain into a unital algebra.
      A:= arg[2].operations.AsUnitalAlgebra( arg[1], arg[2] );

    elif   Length( arg ) = 2
       and IsField( arg[1] )
       and IsList( arg[2] ) then

      # Check that the zero-th power really is in the algebra.
      if Length( arg[2] ) = 0 or not arg[2][1]^0 in arg[2] then
        Error( "<D> is not unital" );
      fi;

      # Convert a list into a unital algebra.
      A:= Domain( arg[2] ).operations.AsUnitalAlgebra( arg[1], arg[2] );

    else
      Error( "usage: AsUnitalAlgebra([<F>,] <D>) for domain or list <D>" );
    fi;

    # Return the unital algebra.
    return A;
    end;

#############################################################################
##
#F  AlgebraElementsOps.AsAlgebra( <F>, <D> )
##
AlgebraElementsOps.AsAlgebra := function( F, D )

    local A, L;

    # 'D' is not an algebra, so take elements from the domain.
    D:= Set( D );
    L:= ShallowCopy( D );
    A:= TrivialSubalgebra( Algebra( F, D, D[1]^0 ) );
    SubtractSet( L, Elements( A ) );
    while 0 < Length(L)  do
      A:= Closure( A, L[1] );
      SubtractSet( L, Elements( A ) );
    od;
    if Length( Elements( A ) ) <> Length( D )  then
      Error( "the elements of <D> must form an algebra" );
    fi;
    A:= Algebra( F, A.generators, 0 * D[1] );
    A.elements := D;
    A.isFinite := true;
    A.size     := Length( D );

    # Return the algebra.
    return A;
    end;

#############################################################################
##
#F  AlgebraElementsOps.AsUnitalAlgebra( <F>, <D> )
##
AlgebraElementsOps.AsUnitalAlgebra := function( F, D )
    return AsUnitalAlgebra( AsAlgebra( F, D ) );
    end;

#############################################################################
##
#F  AlgebraOps.AsAlgebra( <F>, <D> )
##
AlgebraOps.AsAlgebra := function( F, D )

    local L, A;

    if   D.field = F then

      # Note that 'D' is not unital.
      D:= ShallowCopy( D );

    elif   Length( D.generators ) = 0 then

      # We need the zero.
      D:= Algebra( F, D.generators, Zero( D ) );

    elif IsSubset( D.field, F ) then

      # Make sure that the field change does not change the elements.
      L:= Base( D.field / F );
      L:= Concatenation( List( L, x -> List( D.generators,
                                             y -> x * y ) ) );
      D:= Algebra( F, L );

    elif IsSubset( F, D.field ) then

      # Make sure that the field change does not change the elements.
      L:= Base( F / D.field );
      if ForAny( L, x -> ForAny( D.generators,
                                 y -> not x * y in D ) ) then
        Error( "field change leads out of the algebra" );
      fi;
      D:= Algebra( F, D.generators );

    else
      Error( "fields are incompatible" );
    fi;

    # Return the algebra.
    return D;
    end;

#############################################################################
##
#F  AlgebraOps.AsUnitalAlgebra( <F>, <D> )
##
AlgebraOps.AsUnitalAlgebra := function( F, D )

    local L, A;

    # Here we know already that 'D' contains zero-th powers,
    # especially the generators list cannot be empty.
    if   D.field = F then

      # Note that 'D' is not unital.
      D:= UnitalAlgebra( F, D.generators );

    elif IsSubset( D.field, F ) then

      # Make sure that the field change does not change the elements.
      L:= Base( D.field / F );
      L:= Concatenation( List( L, x -> List( D.generators,
                                             y -> x * y ) ) );
      D:= UnitalAlgebra( F, L );

    elif IsSubset( F, D.field ) then

      # Make sure that the field change does not change the elements.
      L:= Base( F / D.field );
      if ForAny( L, x -> ForAny( D.generators,
                                 y -> not x * y in D ) ) then
        Error( "field change leads out of the algebra" );
      fi;
      D:= UnitalAlgebra( F, D.generators );

    else
      Error( "fields are incompatible" );
    fi;

    # Return the unital algebra.
    return D;
    end;

#############################################################################
##
#F  AlgebraOps.IsParent( <A> )
##
AlgebraOps.IsParent := function( A )
    return not IsBound( A.parent );
    end;

#############################################################################
#T should be one function for all structures!
##
#F  AlgebraOps.Parent( <A>, ... )  . . . . . . . . . .  common parent algebra
##
AlgebraOps.Parent := function( L )
    local   A,          # parent of first algebra, result
            H;          # loop variable

    # get the parent of the first algebra
    if IsBound( L[1].parent )  then
        A := L[1].parent;
    else
        A := L[1];
    fi;

    # check that all other algebras have the same parent
    for H  in L  do
        if IsBound( H.parent )  and H.parent <> A  then
            Error( "<A> and <H> must have the same parent algebra" );
        elif not IsBound( H.parent ) and H <> A  then
            Error( "<A> and <H> must have the same parent algebra" );
        fi;
    od;

    # return the parent
    return A;
    end;

#############################################################################
##
#F  AlgebraOps.Closure(<A>,<a>) . . . . closure of a subalgebra in an algebra
##
AlgebraOps.Closure := function( A, w )
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
    if w in A.generators then
      return A;
    fi;

    # otherwise make a new algebra
    C := Subalgebra( Parent( A ), Concatenation( A.generators, [ w ] ) );

    # return the closure
    return C;
    end;

#############################################################################
##
#F  AlgebraOps.OperationHomomorphism( <A>, <M> )
##
AlgebraOps.OperationHomomorphism := function ( A, M )
    local   hom;        # operation homomorphism of <A> into <M>, result

    # make the homomorphism
    hom := rec( isGeneralMapping := true,
                domain           := Mappings,

                # identifying stuff
                source           := A,
                range            := M,

                # information
                isMapping        := true,
                isHomomorphism   := true,
                preImage         := A,
                genimages        := M.operation.genimages,
                genpreimages     := M.operation.genpreimages );

    if A = M.operation.structure then
      hom.image:= M;
    fi;

    # enter the operations record
    hom.operations:= OperationHomomorphismAlgebraOps;

    # return the homomorphism
    return hom;
    end;

#############################################################################
##
#V  MaintainedAlgebraInfo . . . . . . . . . . . . . .  maintained info fields
##
MaintainedAlgebraInfo := [
    "isAbelian", "isFinite", "size"
];


#############################################################################
##
#F  AlgebraOps.Algebra( <F>, <D> ) . . . convert a subalgebra into an algebra
##
AlgebraOps.Algebra := function( F, D )
    local   A,          # algebra for the domain <D>, result
            name;       # component name in the algebra record

    # make the algebra
    if Length( D.generators ) = 0 then
      A:= Algebra( F, D.generators, Zero( D ) );
    else
      A:= Algebra( F, D.generators );
    fi;

    # copy information
    for name in Intersection( RecFields( D ), MaintainedAlgebraInfo ) do
      A.(name):= D.(name);
    od;

    # return the algebra
    return A;
    end;

#############################################################################
##
#F  AlgebraOps.Elements := function( <A> )
##
##  Let $A$ be a finite dimensional algebra over the finite field $F$,
##  with $S$ the set of generators of $A$ (If $A$ contains a multiplicative
##  identity this is counted as a generator, that is, this identity is not
##  regarded as word of length zero in terms of the generators.).
##
##  Define $A_i = \{ a\in A; l(a) \leq i \}$ where $l(a)$ denotes the minimum
##  (taken over all representations of $a$ as sum of words in terms of $S$)
##  of the length of the longest involved word in terms of $S$.
##
##  Then $A_i$ is an $F$-space, and
##  $\{ A.zero \} = A_0 \< A_1 \< A_2 \< \cdots A_k \< A_{k+1} \< \ldots$
##  is an ascending chain that eventually reaches $A$.
##  For $i > 0$ we have
##  $A_{i+1} = \langle A_i \cup \bigcup_{g\in S} A_i g \rangle$
##  the closure as an $F$-space.
##
##  *Note* that the computation of the $A_i$ gives us the list of elements,
##  and the smallest value $k$ such that every element is a linear
##  combination of words in terms of the generators, of maximal length $k$,
##  and with the same method we can compute a vector space basis.
##
AlgebraOps.Elements := function( A )

    local elms,      # elements list, result
          base,      # $F$-base of $A$
          found,     # boolean: new element found by multiplying?
          new,       # intermediate elements list
          gen,       # one generator
          i;         # loop variable

    if not IsFinite( A.field ) then
      Error( "cannot compute elements list of infinite domain <A>" );
    fi;

    # $A_0$
    elms:= [ Zero( A ) ];
    base:= [];

    # $A_1$
    for gen in A.generators do
      if not gen in elms then

        # closure with 'gen'
        Add( base, gen );
        for i in Elements( A.field ) do
          UniteSet( elms, List( elms, x -> x + i * gen ) );
        od;

      fi;
    od;

    found:= true;

    while found do

      # 'elms' contains the elements of $A_i$.
      # Compute $\bigcup_{g \in S} A_i g$.
      new:= [];
      for gen in A.generators do
        UniteSet( new, List( elms, x -> x * gen ) );
      od;
      SubtractSet( new, elms );

      if Length( new ) = 0 then

        found:= false;

      else

        # compute the ($F$-space) closure of the elements list up to now,
        # i.e., all elements involving words in terms of the generators,
        # of length at most 'i+1'.
        for gen in new do
          if not gen in elms then

            # closure with 'gen'
            Add( base, gen );
            for i in Elements( A.field ) do
              UniteSet( elms, List( elms, x -> x + i * gen ) );
            od;

          fi;
        od;

      fi;
    
    od;

    A.base:= base;
    return elms;
    end;

#############################################################################
##
#F  AlgebraOps.Base( <A> ) . . . . . . . . . . . . . . . . base of an algebra
##
##  For an $F$-free $F$-algebra <A>, 'Base( <A> )' returns a maximal set of 
##  over $F$ linear independent elements.
##
AlgebraOps.Base := function( A )

    # The computation of the elements list will also store a base.
    Elements( A );
    return A.base;
    end;

#############################################################################
##
#F  AlgebraOps.Dimension( <A> )  . . . . . . . . . . . . . base of an algebra
##
AlgebraOps.Dimension := function( A )
    return Length( Base( A ) );
    end;

#############################################################################
##
#F  AlgebraOps.Random( <A> )
##
AlgebraOps.Random := function( A )

    local rand,  # random element, result
          b;     # loop over a base of 'A'

    rand:= Zero( A );
    for b in Base(A) do
      rand:= rand + Random( A.field ) * b;
    od;
    return rand;
    end;

#############################################################################
##
#F  AlgebraOps.Rank( <A> ) . . . . . . . . . . . . . . . . rank of an algebra
##
##  returns the rank of the $F$-free $F$-algebra <A> over $F$.
##
AlgebraOps.Rank := function( A )
    return Length( Base( A ) );
    end;

#############################################################################
##
#F  AlgebraOps.\=( <A1>, <A2> )  . . . . . . . test if two algebras are equal
##
AlgebraOps.\= := function( A1, A2 )

    local iseq;

    if   IsUnitalAlgebra( A1 ) then

      if   IsUnitalAlgebra( A2 ) then

        iseq:= A1.field = A2.field;
        iseq:= iseq and
               (   A1.generators = A2.generators
                or ( ForAll( A1.generators, gen -> gen in A2 )
                     and Dimension( A1 ) = Dimension( A2 ) ) );

      elif IsAlgebra( A2 ) then

        iseq:= A1.field = A2.field and One( A1 ) in A2;
        iseq:= iseq and
               (   A1.generators = A2.generators
                or ( ForAll( A1.generators, gen -> gen in A2 )
                     and Dimension( A1 ) = Dimension( A2 ) ) );

      elif IsDomain( A2 ) or ( IsList( A2 ) and not IsString( A2 ) ) then
        iseq:= DomainOps.\=( A1, A2 );
      else
        return false;
      fi;

    elif IsAlgebra( A1 ) then

      if   IsUnitalAlgebra( A2 ) then

        iseq:= A1.field = A2.field and One( A2 ) in A1;
        iseq:= iseq and
               (   A1.generators = A2.generators
                or ( ForAll( A1.generators, gen -> gen in A2 )
                     and Dimension( A1 ) = Dimension( A2 ) ) );

      elif IsAlgebra( A2 ) then

        iseq:= A1.field = A2.field;
        iseq:= iseq and
               (   A1.generators = A2.generators
                or ( ForAll( A1.generators, gen -> gen in A2 )
                     and Dimension( A1 ) = Dimension( A2 ) ) );

      elif IsDomain( A2 ) or IsList( A2 ) then
        iseq:= DomainOps.\=( A1, A2 );
      else
        return false;
      fi;

    else
      iseq:= DomainOps.\=( A1, A2 );
    fi;
    return iseq;
    end;

#############################################################################
##
#F  AlgebraOps.IsSubset( <G>, <H> ) . . . . . . . test for subset of algebras
##
AlgebraOps.IsSubset := function( G, H )
    local   isSub;

    if   IsUnitalAlgebra( G ) then

      if   IsAlgebra( H ) then
        isSub :=    G.generators = H.generators
                 or (IsBound( H.parent ) and G = H.parent)
                 or (    Dimension( G ) >= Dimension( H )
                     and ForAll( H.generators, gen -> gen in G ));
      else
        isSub := DomainOps.IsSubset( G, H );
      fi;

    elif IsAlgebra( G ) then

      if   IsUnitalAlgebra( H ) then
        isSub:= One( H ) in G;
        isSub := isSub and
                     (   G.generators = H.generators
                      or (IsBound( H.parent ) and G = H.parent)
                      or (    Dimension( G ) >= Dimension( H )
                          and ForAll( H.generators, gen -> gen in G )) );
      elif IsAlgebra( H ) then
        isSub :=    G.generators = H.generators
                 or (IsBound( H.parent ) and G = H.parent)
                 or (    Dimension( G ) >= Dimension( H )
                     and ForAll( H.generators, gen -> gen in G ));
      else
        isSub := DomainOps.IsSubset( G, H );
      fi;

    else
      isSub := DomainOps.IsSubset( G, H );
    fi;
    return isSub;
    end;

#############################################################################
##
#F  AlgebraOps.Print( <A> ) . . . . . . . . . . . . . pretty print an algebra
##
AlgebraOps.Print := function( A )
    local i;

    # If the algebra has a name we use this.
    if IsBound( A.name )  then
      Print( A.name );

    # If the algebra is a parent print it as 'Algebra(...)'
    elif not IsBound( A.parent )  then

      # If the algebra is not trivial the zero need not be printed.
      if 0 < Length( A.generators )  then
        Print( "Algebra( ", A.field, ", ", A.generators, " )" );

      # If the algebra is trivial print it as 'Algebra( <F>, [ <zero> ] )'.
      else
        Print( "Algebra( ", A.field, ", [ ", Zero( A ), " ] )" );
      fi;

    # If the algebra is a subalgebra print it as 'Subalgebra(...)'.
    else
      Print( "Subalgebra( ", A.parent, ", ", A.generators, " )" );
    fi;

    end;

#############################################################################
##
#F  AsSubalgebra(<A>, <U>) . view an algebra as subalgebra of another algebra
##
AsSubalgebra := function( A, U )

    # check the arguments
    if not IsAlgebra( A ) or not IsParent( A ) then
      Error( "<A> must be a parent algebra" );
    fi;
    if not IsAlgebra( U ) then
      Error( "<U> must be an algebra" );
    fi;
    if not ForAll( U.generators, gen -> gen in A )  then
      Error( "the generators of <U> must lie in <A>" );
    fi;

    # dispatch
    return A.operations.AsSubalgebra( A, U );

    end;

#############################################################################
##
#F  AsUnitalSubalgebra(<A>, <U>) . . .  view algebra as subalgebra of another
##
AsUnitalSubalgebra := function( A, U )

    # check the arguments
    if not IsAlgebra( A ) or not IsParent( A ) then
      Error( "<A> must be a parent algebra" );
    fi;
    if not IsAlgebra( U ) then
      Error( "<U> must be an algebra" );
    fi;
    if not ForAll( U.generators, gen -> gen in A )  then
      Error( "the generators of <U> must lie in <A>" );
    fi;
    if     not IsUnitalAlgebra( U )
       and ( Length( U.generators ) = 0 or not U.generators[1]^0 in U ) then
      Error( "U is not unital" );
    fi;

    # dispatch
    return A.operations.AsUnitalSubalgebra( A, U );

    end;

#############################################################################
##
#F  AlgebraOps.AsSubalgebra( <A>, <U> )
##
AlgebraOps.AsSubalgebra := function( A, U )
    if IsUnitalAlgebra( U ) then
      return A.operations.Subalgebra( A,
                            Concatenation( U.generators, [ One( U ) ] ) );
    else
      return A.operations.Subalgebra( A, U.generators );
    fi;
    end;

#############################################################################
##
#F  AlgebraOps.AsUnitalSubalgebra( <A>, <U> )
##
AlgebraOps.AsUnitalSubalgebra := function( A, U )
    return A.operations.UnitalSubalgebra( A, U.generators );
    end;

#############################################################################
##
#F  AlgebraOps.Centre( <A> )  . . . . . . . . . . . . .  centre of an algebra
##
AlgebraOps.Centre := function( A )
    local   C;          # centre of <A>, result

    # if <A> is abelian it is its own centre
    if IsBound( A.isAbelian )  and A.isAbelian  then
      C:= A;

    else

      C:= Filtered( Elements( A ),
                    x -> ForAll( A.generators, y -> y * x = x * y ) );
      C:= AsAlgebra( A.field, C );

    fi;

    # return the centre
    return C;
    end;

#############################################################################
##
#F  AlgebraOps.Radical( <A> )  . . . . . . . . . . . .  radical of an algebra
##
##  'Radical' returns the radical of <A>, i.e., the intersection of maximal
##  ideals of <A>.
##
AlgebraOps.Radical := function( A )

    Error( "ideals are not yet implemented" );
    end;

#############################################################################
##
#F  AlgebraOps.IsAbelian( <A> )  . . . . . . .  test if an algebra is abelian
##
AlgebraOps.IsAbelian := function( A )
    local i, j;       # loop variables

    # test if every generator commutes with all the others
    for i in [ 2 .. Length(A.generators) ] do
      for j in [ 1 .. i-1 ] do
        if A.generators[i] * A.generators[j] <>
           A.generators[j] * A.generators[i] then
          return false;
        fi;
      od;
    od;

    # all generators commute, return 'true'
    return true;
    end;

#############################################################################
##
#F  AlgebraOps.IsCommutativeRing( <A> )
##
AlgebraOps.IsCommutativeRing := AlgebraOps.IsAbelian;

#############################################################################
##
#F  AlgebraOps.IsCentral( <A>, <U> ) . . .  test if <U> is centralized by <A>
##
AlgebraOps.IsCentral := function( A, U )
    local g,          # one generator of <A>
          u;          # one generator of <U>

    # test if all generators of <U> commute with the generators of <A>
    for u in U.generators do
      for g in A.generators do
        if u * g <> g * u then
          return false;
        fi;
      od;
    od;

    # all generators of <U> commute, return 'true'
    return true;
    end;

#############################################################################
##
#F  IsSubalgebra( <A>, <U> )  . . . . . .  test if <U> is a subalgebra of <A>
##
IsSubalgebra := function( A, U )
    local   isSub;

    # check that the arguments are algebras with a common parent
    if not IsAlgebra( A ) then
      Error( "<A> must be an algebra" );
    elif not IsAlgebra( U ) then
      Error( "<U> must be an algebra" );
    fi;

    # Raise an error in case of incompatible parents.
    Parent( A, U );
    InfoAlgebra1( "#I  IsSubalgebra: is ", AlgebraString(U,"U"),
                " a subalgebra of ", AlgebraString(A,"A"), "\n");

    # test if <U> is a subalgebra of <A>
    if IsParent( A )  then
      isSub := true;
    else
      isSub := A.operations.IsSubalgebra( A, U );
    fi;

    # return the result
    InfoAlgebra1( "#I  IsSubalgebra: returns ", isSub, "\n" );
    return isSub;

    end;

#############################################################################
##
#F  AlgebraOps.IsSubalgebra( <A>, <U> )
##
AlgebraOps.IsSubalgebra := function( A, U )
    local isSub;      # 'true' if <U> is a subalgebra of <A>, result

    # If the elements of <A> are known use them \ldots
    if IsBound( A.elements ) then
      isSub:= ForAll( U.generators, x -> x in A.elements );

    # \ldots otherwise test if the generators lie in <A>.
    else
      isSub:= ForAll( U.generators, gen -> gen in A );
      if IsUnitalAlgebra( U ) and not IsUnitalAlgebra( A ) then
        isSub:= isSub and One( U ) in A;
      fi;
    fi;

    # return the result
    return isSub;

    end;

#############################################################################
##
#F  AlgebraOps.IsTrivial( <A> )
##
AlgebraOps.IsTrivial := function( A )
    return 0 = Length( A.generators );
    end;

#############################################################################
##
#V  UnitalAlgebraOps
##
UnitalAlgebraOps := OperationsRecord( "UnitalAlgebraOps", AlgebraOps );

#############################################################################
##
#F  UnitalAlgebraOps.IsFinite( <A> )
##
UnitalAlgebraOps.IsFinite := function( A )
    if   not IsFinite( A.field ) then
      return false;
    elif Length( A.generators ) = 0 then
      return true;
    else
      Error( "cannot decide whether algebra <A> is finite" );
    fi;
    end;

#############################################################################
##
#F  UnitalAlgebraOps.Size( <A> )
##
UnitalAlgebraOps.Size := function( A )
    if   not IsFinite( A.field ) then
      return "infinity";
    elif Length( A.generators ) = 0 then
      return Size( A.field );
    else
      return Length( Elements( A ) );
    fi;
    end;

#############################################################################
##
#F  UnitalAlgebraOps.AsAlgebra( <F>, <D> )
##
UnitalAlgebraOps.AsAlgebra := function( F, D )

    local L, A;

    if   D.field = F then

      # Note that 'D' is unital.
      D:= Algebra( F, Concatenation( D.generators, [ One( D ) ] ) );

    elif   Length( D.generators ) = 0 then

      Error( "field change would change the set of elements" );

    elif IsSubset( D.field, F ) then

      # Make sure that the field change does not change the elements.
      L:= Base( D.field / F );
      A:= Concatenation( D.generators, One( D ) );
      L:= Concatenation( List( L, x -> List( A, y -> x * y ) ) );
      D:= Algebra( F, L );

    elif IsSubset( F, D.field ) then

      # Make sure that the field change does not change the elements.
      L:= Base( F / D.field );
      A:= Concatenation( D.generators, One( D ) );
      if ForAny( L, x -> ForAny( A, y -> not x * y in D ) ) then
        Error( "field change leads out of the algebra" );
      fi;
      D:= Algebra( F, A );

    else
      Error( "fields are incompatible" );
    fi;

    # Return the unital algebra.
    return D;
    end;

#############################################################################
##
#F  UnitalAlgebraOps.AsUnitalAlgebra( <F>, <D> )
##
UnitalAlgebraOps.AsUnitalAlgebra := function( F, D )

    local L, A;

    if   D.field = F then

      D:= ShallowCopy( D );

    elif Length( D.generators ) = 0 then

      Error( "field change would change the set of elements" );

    elif IsSubset( D.field, F ) then

      # Make sure that the field change does not change the elements.
      L:= Base( D.field / F );
      L:= Concatenation( List( L, x -> List( D.generators,
                                             y -> x * y ) ) );
      D:= UnitalAlgebra( F, L );

    elif IsSubset( F, D.field ) then

      # Make sure that the field change does not change the elements.
      L:= Base( F / D.field );
      if ForAny( L, x -> ForAny( D.generators,
                                 y -> not x * y in D ) ) then
        Error( "field change leads out of the algebra" );
      fi;
      D:= UnitalAlgebra( F, D.generators );

    else
      Error( "fields are incompatible" );
    fi;

    # Return the unital algebra.
    return D;
    end;

#############################################################################
##
#F  UnitalAlgebraOps.Closure( <A>, <w> )
##
UnitalAlgebraOps.Closure := function( A, w )
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
    if w in A.generators then
      return A;
    fi;

    # Otherwise make a new unital algebra.
    C := UnitalSubalgebra( Parent( A ),
                           Concatenation( A.generators, [ w ] ) );

    # Return the closure.
    return C;
    end;

#############################################################################
##
#F  UnitalAlgebraOps.OperationHomomorphism( <A>, <M> )
##
UnitalAlgebraOps.OperationHomomorphism := function ( A, M )
    local hom;
    hom:= AlgebraOps.OperationHomomorphism( A, M );
    hom.operations:= OperationHomomorphismUnitalAlgebraOps;
    return hom;
    end;

#############################################################################
##
#F  UnitalAlgebraOps.Algebra( <F>, <D> ) . .  convert subalgebra into algebra
##
UnitalAlgebraOps.Algebra := function( F, D )
    local   A,          # algebra for the domain <D>, result
            name;       # component name in the algebra record

    # make the algebra
    A := Algebra( F, Concatenation( D.generators, [ One( D ) ] ) );

    # copy information
    for name  in Intersection( RecFields( D ), MaintainedAlgebraInfo ) do
        A.(name) := D.(name);
    od;

    # Return the algebra.
    return A;
    end;

#############################################################################
##
#F  UnitalAlgebraOps.UnitalAlgebra( <F>, <D> )
#F                                       . .  convert subalgebra into algebra
##
UnitalAlgebraOps.UnitalAlgebra := function( F, D )
    local   A,          # algebra for the domain <D>, result
            name;       # component name in the algebra record

    # make the algebra
    A := D.operations.UnitalAlgebra( F, D.generators, Zero( D ) );

    # copy information
    for name  in Intersection( RecFields( D ), MaintainedAlgebraInfo ) do
        A.(name) := D.(name);
    od;

    # Return the algebra.
    return A;
    end;

#############################################################################
##
#F  UnitalAlgebraOps.Elements := function( <A> )
##
##  Let $A$ be a finite dimensional unital algebra over the finite field $F$,
##  with $S$ the set of generators of $A$.
##
##  Define $A_i = \{ a\in A; l(a) \leq i \}$ where $l(a)$ denotes the minimum
##  (taken over all representations of $a$ as sum of words in terms of $S$)
##  of the length of the longest involved word in terms of $S$.
##
##  Then $A_i$ is an $F$-space, and
##  $\{ F \*\ A.one \} = A_0 \< A_1 \< A_2 \< \cdots A_k \< A_{k+1} \<\ldots$
##  is an ascending chain that eventually reaches $A$.
##  We have
##  $A_{i+1} = \langle A_i \cup \bigcup_{g\in S} A_i g \rangle$
##  the closure as an $F$-space.
##
##  *Note* that the computation of the $A_i$ gives us the list of elements,
##  and the smallest value $k$ such that every element is a linear
##  combination of words in terms of the generators, of maximal length $k$,
##  and with the same method we can compute a vector space basis.
##
UnitalAlgebraOps.Elements := function( A )

    local elms,      # elements list, result
          base,      # $F$-base of $A$
          found,     # boolean: new element found by multiplying?
          new,       # intermediate elements list
          gen,       # one generator
          i;         # loop variable

    if not IsFinite( A.field ) then
      Error( "cannot compute elements list of infinite domain <A>" );
    fi;

    # $A_0$
    elms:= List( Elements( A.field ), x -> x * One( A ) );
    base:= [ A.one ];

    found:= true;

    while found do

      # 'elms' contains the elements of $A_i$.
      # Compute $\bigcup_{g \in S} A_i g$.
      new:= [];
      for gen in A.generators do
        UniteSet( new, List( elms, x -> x * gen ) );
      od;
      SubtractSet( new, elms );

      if Length( new ) = 0 then

        found:= false;

      else

        # compute the ($F$-space) closure of the elements list up to now,
        # i.e., all elements involving words in terms of the generators,
        # of length at most 'i+1'.
        for gen in new do
          if not gen in elms then

            # closure with 'gen'
            Add( base, gen );
            for i in Elements( A.field ) do
              UniteSet( elms, List( elms, x -> x + i * gen ) );
            od;

          fi;
        od;

      fi;
    
    od;

    A.base:= base;
    return elms;
    end;

#############################################################################
##
#F  UnitalAlgebraOps.Print( <A> ) . . . . . . . . . . pretty print an algebra
##
UnitalAlgebraOps.Print := function( A )
    local i;

    # If the algebra has a name we use this.
    if IsBound( A.name )  then
      Print( A.name );

    # If the algebra is a parent print it as 'Algebra(...)'
    elif not IsBound( A.parent )  then

      # If the algebra is not trivial the zero need not be printed.
      if 0 < Length( A.generators )  then
        Print( "UnitalAlgebra( ", A.field, ", ", A.generators, " )" );

      # If the generators are trivial print 'UnitalAlgebra(<F>,[<zero>])'.
      else
        Print( "UnitalAlgebra( ", A.field, ", [ ", Zero( A ), " ] )" );
      fi;

    # If the algebra is a subalgebra print it as 'Subalgebra(...)'.
    else
      Print( "UnitalSubalgebra( ", A.parent, ", ", A.generators, " )" );
    fi;

    end;

#############################################################################
##
#F  UnitalAlgebraOps.IsTrivial( <A> )
##
UnitalAlgebraOps.IsTrivial := function( A )
    return false;
    end;

#############################################################################
##
#F  AlgebraElementsOps.UnitalAlgebra( <F>, AlgebraElements, <gens>, <zero> )
##
AlgebraElementsOps.UnitalAlgebra := function( F, AlgebraElements, gens, zero )

    local   A,          # algebra containing <gens>, result
            i;          # loop variable

    # make the domain
    A:= rec( isDomain        := true,
             isAlgebra       := true,
             isUnitalAlgebra := true,
             isVectorSpace   := true,

    # identification
             field           := F,
             generators      := ShallowCopy( gens ),

    # operations record
             operations      := UnitalAlgebraOps );

    # If the generators list is empty we need a zero element.
    if Length( gens ) = 0 then
      A.zero:= zero;
    fi;

    # Return the algebra.
    return A;
    end;

#############################################################################
##
#E  Emacs . . . . . . . . . . . . . . . . . . . . . . . local emacs variables
##
##  Local Variables:
##  mode:               outline
##  outline-regexp:     "#F\\|#V\\|#E\\|#R"
##  fill-column:        73
##  fill-prefix:        "##  "
##  eval:               (hide-body)
##  End:
##
