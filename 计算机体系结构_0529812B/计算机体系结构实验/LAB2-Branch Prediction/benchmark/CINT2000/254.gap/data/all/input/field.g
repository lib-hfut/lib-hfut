#############################################################################
##
#A  field.g                     GAP library                  Martin Schoenert
##
#A  @(#)$Id: field.g,v 3.16.1.2 1996/09/16 09:33:35 sam Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains  those  functions  that  are  dispatcher  for  fields.
##
#H  $Log: field.g,v $
#H  Revision 3.16.1.2  1996/09/16 09:33:35  sam
#H  fixed bug in 'FieldOps.IsSubset' (delegated to 'DomainOps.\=')
#H
#H  Revision 3.16.1.1  1995/08/03 09:37:06  ahulpke
#H  changed 'Copy(coeffs)' to 'ShallowCopy(coeffs)'
#H
#H  Revision 3.16  1994/05/06  12:42:09  sam
#H  added 'MinimalPolynomial'
#H
#H  Revision 3.15  1994/04/13  08:30:06  sam
#H  introduced 'OperationsRecord'
#H
#H  Revision 3.14  1994/02/16  14:40:12  fceller
#H  changed 'FastPolynomial' slightly
#H
#H  Revision 3.13  1994/01/20  11:58:19  sam
#H  moved 'GaloisGroup' to 'dispatch.g',
#H  fixed 'FieldOps.PolynomialRing'
#H
#H  Revision 3.12  1993/07/30  09:51:03  sam
#H  fixed 'Trace' (I should not try bad hacks!)
#H
#H  Revision 3.11  1993/07/16  07:06:04  sam
#H  bad hack in 'Trace' to allow the trace of a matrix
#H
#H  Revision 3.10  1993/07/05  10:26:07  fceller
#H  added 'InterpolatedPolynomial'
#H
#H  Revision 3.9  1993/01/20  11:14:52  fceller
#H  added generic 'Polynomial' and 'PolynomialRing'
#H
#H  Revision 3.8  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.7  1992/11/16  12:22:40  fceller
#H  added Laurent polynomials
#H
#H  Revision 3.6  1992/08/13  13:11:09  fceller
#H  add 'Indeterminate'
#H
#H  Revision 3.5  1992/04/05  14:50:49  martin
#H  changed 'Field' slightly
#H
#H  Revision 3.4  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.3  1992/02/11  14:16:36  martin
#H  added 'GaloisGroup'
#H
#H  Revision 3.2  1991/12/04  09:07:01  martin
#H  changed 'Field' and 'DefaultField' to use 'Domain', removed 'FieldDomain'
#H
#H  Revision 3.1  1991/10/10  12:38:50  martin
#H  changed everything for new domain concept
#H
#H  Revision 3.0  1991/08/08  15:30:29  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  IsField(<D>)  . . . . . . . . . . . . . . . . test if a domain is a field
##
IsField := function ( D )
    return IsRec( D )  and IsBound( D.isField )  and D.isField;
end;


#############################################################################
##
#V  FieldOps  . . . . . . . . . . . . . . . . . . operations record for field
##
##  'FieldOps' is the operations record for fields.
##
##  The operations records for special fields are created by making a copy of
##  this record and overlaying some functions.  This way those fields inherit
##  the default methods.
##
FieldOps := OperationsRecord( "FieldOps", DomainOps );


#############################################################################
##
#F  FieldOps.\=( <F>, <G> )  . . . . . . . . . . . . .  comparisons of fields
##
FieldOps.\= := function ( F, G )
    local   isEql;
    if IsField( F ) and IsFinite( F )  then
        if IsField( G ) and IsFinite( G )  then
            isEql :=     ( Size( F ) = Size( G ) )
                     and ForAll( F.generators, g -> g in G )
                     and ForAll( G.generators, g -> g in F );
        elif IsField( G )  then
            isEql := false;
	else
            isEql := DomainOps.\=( F, G );
        fi;
    elif IsField( F )  then
        if IsField( G )  and IsFinite( G )  then
            isEql := false;
        elif IsField( G )  then
            isEql :=     ForAll( F.generators, g -> g in G )
                     and ForAll( G.generators, g -> g in F );
	else
            isEql := DomainOps.\=( F, G );
        fi;
    else
        isEql := DomainOps.\=( F, G );
    fi;
    return isEql;
end;


#############################################################################
##
#F  FieldOps.IsSubset(<F>,<G>)  . .  test if something is a subset of a field
##
FieldOps.IsSubset := function ( F, G )
    local   isSub;
    if IsField( F ) and IsFinite( F )  then
        if IsField( G ) and IsFinite( G )  then
            isSub :=     Size( F ) mod Size( G ) = 0
                     and (Size( F ) - 1) mod (Size( G ) - 1) = 0
                     and ForAll( G.generators, g -> g in F );
        elif IsField( G )  then
            isSub := false;
	else
            isSub := DomainOps.IsSubset( F, G );
        fi;
    elif IsField( F )  then
        if IsField( G )  then
            isSub := ForAll( G.generators, g -> g in F );
	else
            isSub := DomainOps.IsSubset( F, G );
        fi;
    else
        isSub := DomainOps.IsSubset( F, G );
    fi;
    return isSub;
end;


#############################################################################
##
#F  FieldOps.Print( <F> ) . . . . . . . . . . . . . . . . . . . print a field
##
FieldOps.Print := function ( F )
    local   i;
    if IsBound( F.name )  then
        Print( F.name );
    else
        Print( "Field( ");
        for i  in [1..Length(F.generators)-1]  do
            Print( F.generators[i], ", " );
        od;
        Print( F.generators[Length(F.generators)], " )" );
        if IsBound( F.field )  then
            Print( "/", F.field );
        fi;
    fi;
end;


#############################################################################
##
#F  FieldOps.\/( <F>, <G> ) . . . . . . . . . . . . .  quotient of two fields
##
FieldOps.\/ := function ( F, G )
    local   Q;

    # check the arguments
    if IsField(F)  and IsField(G)  and IsSubset(F,G)  then

        # make the domain
        Q := rec();
        Q.isDomain      := true;
        Q.isField       := true;

        # enter the identification
        Q.char          := F.char;
        Q.degree        := F.degree;
        Q.generators    := F.generators;
        Q.zero          := F.zero;
        Q.one           := F.one;

        # enter the knowledge
        Q.size          := F.size;
        Q.isFinite      := F.isFinite;

        # enter the subfield
        Q.field         := G;
        Q.dimension     := F.degree / G.degree;

        # and finally the operations record
        Q.operations    := F.operations;

    else
        Error("<G> must be a subfield of <F>");
    fi;

    # return the quotient
    return Q;
end;


#############################################################################
##
#F  FieldOps.\^( <F>, <n> ) . . . . . . . . . . . . .  row space over a field
##
FieldOps.\^ := function ( F, n )
    local   V;
    if IsField(F)  and IsInt(n)  and 0 <= n  then
        V := RowSpace( n, F );
    else
        Error("power of <F> and <n> is not defined");
    fi;
    return V;
end;


#############################################################################
##
#F  FieldOps.GaloisGroup( <F> ) . . . . . . . . . . . Galois group of a field
##
FieldOps.GaloisGroup := function ( F )
    Error("sorry, no generic method to compute the Galois group");
end;

FieldOps.AutomorphismGroup := function ( F )
    return GaloisGroup( F );
end;


#############################################################################
##
#F  Conjugates([<F>,]<z>) . . . . . . . . . . . conjugates of a field element
##
Conjugates := function ( arg )
    local   F,          # field <F>, optional first argument
            z;          # element <z>, second argument

    # get and check the arguments
    if Length(arg) = 1  then
        F := DefaultField( arg[1] );
        z := arg[1];
    elif Length(arg) = 2  then
        F := arg[1];
        if not IsField(F)  then Error("<F> must be a field");  fi;
        z := arg[2];
        if not z in F      then Error("<z> must lie in <F>");  fi;
    else
        Error("usage: Conjugates( [<F>,] <z> )");
    fi;

    # return the conjugates
    return F.operations.Conjugates( F, z );
end;

FieldOps.Conjugates := function ( F, z )
    local   cnjs,       # conjugates of <z> in <F>, result
            aut;        # automorphism of <F>

    # compute the conjugates simply by applying all the automorphisms
    cnjs := [];
    for aut  in Elements( GaloisGroup( F ) )  do
        Add( cnjs, z ^ aut );
    od;

    # return the conjugates
    return cnjs;
end;


#############################################################################
##
#F  Norm([<F>,]<z>) . . . . . . . . . . . . . . . . . norm of a field element
##
Norm := function ( arg )
    local   F,          # field <F>, optional first argument
            z;          # element <z>, second argument

    # get and check the arguments
    if Length(arg) = 1  then
        F := DefaultField( arg[1] );
        z := arg[1];
    elif Length(arg) = 2  then
        F := arg[1];
        if not IsField(F)  then Error("<F> must be a field");  fi;
        z := arg[2];
        if not z in F      then Error("<z> must lie in <F>");  fi;
    else
        Error("usage: Norm( [<F>,] <z> )");
    fi;

    # return the norm
    return F.operations.Norm( F, z );
end;

FieldOps.Norm := function ( F, z )
    return Product( Conjugates( F, z ) );
end;


#############################################################################
##
#F  Trace([<F>,]<z>)  . . . . . . . . . . . . . . .  trace of a field element
#F  Trace( <m> )  . . . . . . . . . . . . . . . . . . . . . trace of a matrix
##
Trace := function ( arg )
    local   F,          # domain <F>, optional first argument
            z;          # element <z>, second argument

    # get and check the arguments
    if   Length( arg ) = 1 then

      z:= arg[1];

      F:= Domain( arg );

# should suffice, but ...
      if IsMat( z ) then
        return TraceMat( z );
      elif IsRec( z ) and IsBound( F.operations.Trace ) then
        return F.operations.Trace( F, z );
      else
        F:= DefaultField( [ z ] );
      fi;

    elif Length( arg ) = 2 then
      F:= arg[1];
      z:= arg[2];
    else
      Error("usage: Trace( [<F>,] <z> )");
    fi;

    # return the trace
    return F.operations.Trace( F, z );
    end;

FieldOps.Trace := function ( F, z )
    return Sum( Conjugates( F, z ) );
end;


#############################################################################
##
#F  CharPol([<F>,]<z>)  . . . . . . characteristic polynom of a field element
##
CharPol := function ( arg )
    local   F,          # field <F>, optional first argument
            z;          # element <z>, second argument

    # get and check the arguments
    if Length(arg) = 1  then
        F := DefaultField( arg[1] );
        z := arg[1];
    elif Length(arg) = 2  then
        F := arg[1];
        if not IsField(F)  then Error("<F> must be a field");  fi;
        z := arg[2];
        if not z in F      then Error("<z> must lie in <F>");  fi;
    else
        Error("usage: CharPol( [<F>,] <z> )");
    fi;

    # return the characteristic polynom
    return F.operations.CharPol( F, z );
end;

FieldOps.CharPol := function ( F, z )
    local   pol,        # characteristic polynom of <z> in <F>, result
            deg,        # degree of <pol>
            con,        # conjugate of <z> in <F>
            i;          # loop variable

    # compute the trace simply by multiplying $x-cnj$
    pol := [ F.one ];
    deg := 0;
    for con  in Conjugates( F, z )  do
        pol[deg+2] := pol[deg+1];
        for i  in Reversed([2..deg+1])  do
            pol[i] := pol[i-1] -  con * pol[i];
        od;
        pol[1] := F.zero - con * pol[1];
        deg := deg + 1;
    od;

    # return the characteristic polynom
    return pol;
end;


#############################################################################
##
#F  MinPol([<F>,]<z>) . . . . . . . . . .  minimal polynom of a field element
##
MinPol := function ( arg )
    local   F,          # field <F>, optional first argument
            z;          # element <z>, second argument

    # get and check the arguments
    if Length(arg) = 1  then
        F := DefaultField( arg[1] );
        z := arg[1];
    elif Length(arg) = 2  then
        F := arg[1];
        if not IsField(F)  then Error("<F> must be a field");  fi;
        z := arg[2];
        if not z in F      then Error("<z> must lie in <F>");  fi;
    else
        Error("usage: MinPol( [<F>,] <z> )");
    fi;

    # return the minimal polynom
    return F.operations.MinPol( F, z );
end;

FieldOps.MinPol := function ( F, z )
    local   pol,        # minimal polynom of <z> in <F>, result
            deg,        # degree of <pol>
            con,        # conjugate of <z> in <F>
            i;          # loop variable

    # compute the trace simply by multiplying $x-cnj$
    pol := [ F.one ];
    deg := 0;
    for con  in Set( Conjugates( F, z ) )  do
        pol[deg+2] := pol[deg+1];
        for i  in Reversed([2..deg+1])  do
            pol[i] := pol[i-1] -  con * pol[i];
        od;
        pol[1] := F.zero - con * pol[1];
        deg := deg + 1;
    od;

    # return the minimal polynom
    return pol;
end;

#############################################################################
##
#F  FieldOps.MinimalPolynomial( <F>, <z> )
##
FieldOps.MinimalPolynomial := function( F, z )
    if IsField( F.field ) then
      return Polynomial( F.field, MinPol( F, z ) );
    elif F.field = 0 then
      return Polynomial( Rationals, MinPol( F, z ) );
    else
      return Polynomial( GF( CharFFE( z ) ), MinPol( F, z ) );
    fi;
    end;

#############################################################################
##
#V  FieldElements . . . . . . . . . . . . . . .  domain of all field elements
#V  FieldElementsOps  . operations record of the domain of all field elements
##
##  'FieldElements' is   the domain of all  field  elements, i.e., rationals,
##  cyclotomics, finite  field  elements,  and  record that  implement  field
##  elements.  Note that 'FieldElements' is not a field.
##
##  'FieldElementsOps'  is  the operations  record   for  the 'FieldElements'
##  domain.  The  operations       record  of other  field    domains    like
##  'FiniteFieldElements' inherit default methods from this record.
##
##  Those domains are known  to 'FieldDomain', and they  know how to create a
##  field that contains a given list of elements.
##
##  If you think this domain is superfluous I shall have to agree.  It exists
##  mainly to check the feasibility of this concept, which is convenient with
##  groups, for categories besides groups.
##
FieldElementsOps := OperationsRecord( "FieldElementsOps", DomainOps );

FieldElementsOps.\in    := function ( z, FieldElements )
    return IsRat( z )
        or IsCyc( z )
        or IsFFE( z )
        or IsRec( z )  and IsBound(z.isFieldElement)  and z.isFieldElement;
end;

FieldElementsOps.Order   := function ( F, z )
    local   ord, elm;
    if z = F.zero  then
        ord := 0;
    else
        elm := z;
        ord := 1;
        while elm <> F.one  do
            elm := elm * z;
            ord := ord + 1;
        od;
    fi;
    return ord;
end;

#############################################################################
##
#F  FieldElementsOps.MinimalPolynomial( FieldElements, <z> )
##
FieldElementsOps.MinimalPolynomial := function( FieldElements, z )
    return Polynomial( GF( CharFFE( z ) ), MinPol( Field(z), z ) );
    end;


FieldElements            := rec();
FieldElements.isDomain   := true;

FieldElements.name       := "FieldElements";

FieldElements.isFinite   := false;
FieldElements.size       := "infinity";

FieldElements.operations := FieldElementsOps;


#############################################################################
##
#F  Field(<z>,...)  . . . . . . . . . . . field containing a list of elements
##
Field := function ( arg )
    local   F,          # field containing the elements of <arg>, result
            D;          # domain containing the elements of <arg>

    # if called with one domain argument look in the operations record
    if Length(arg) = 1  and IsDomain(arg[1])  then
        F := arg[1].operations.Field( arg[1] );

    # special case for one square matrix
    elif    Length(arg) = 1
        and IsMat(arg[1])  and Length(arg[1]) = Length(arg[1][1])
    then
        D := Domain( arg );
        F := D.operations.Field( arg );

    # special case for list of elements
    elif Length(arg) = 1  and IsList(arg[1])  then
        D := Domain( arg[1] );
        F := D.operations.Field( arg[1] );

    # other cases
    else
        D := Domain( arg );
        F := D.operations.Field( arg );
    fi;

    # return the field
    return F;
end;

FieldElementsOps.Field := function ( arg )
    Error("sorry, there is no default way to construct a field");
end;


#############################################################################
##
#F  DefaultField(<z>,...) . . . . default field containing a list of elements
##
DefaultField := function ( arg )
    local   F,          # field containing the elements of <arg>, result
            D;          # domain containing the elements of <arg>

    # special case for one square matrix
    if    Length(arg) = 1
        and IsMat(arg[1])  and Length(arg[1]) = Length(arg[1][1])
    then
        D := Domain( arg );
        F := D.operations.DefaultField( arg );

    # special case for list of elements
    elif Length(arg) = 1  and IsList(arg[1])  then
        D := Domain( arg[1] );
        F := D.operations.DefaultField( arg[1] );

    # other cases
    else
        D := Domain( arg );
        F := D.operations.DefaultField( arg );
    fi;

    # return the default field
    return F;
end;

FieldElementsOps.DefaultField := function ( arg )
    Error("sorry, there is no default way to construct a default field");
end;


#############################################################################
##
#F  FieldOps.Polynomial( <R>, <coeffs>, <val> )	. . .  polynomial over a ring
##
FieldOps.Polynomial := function( R, coeffs, val )

    # normalize <coeffs>
    coeffs := ShallowCopy(coeffs);
    val    := val + NormalizeCoeffs(coeffs);
    if 0 = Length(coeffs)  then val := 0;  fi;

    # return polynomial
    if val < 0  then
        return rec( coefficients := coeffs,
    	    	    baseRing     := R,
    	    	    isPolynomial := true,
		    valuation    := val,
    	    	    domain       := LaurentPolynomials,
    	    	    operations   := PolynomialOps );
    else
        return rec( coefficients := coeffs,
    	    	    baseRing     := R,
    	    	    isPolynomial := true,
		    valuation    := val,
    	    	    domain       := Polynomials,
    	    	    operations   := PolynomialOps );
    fi;

end;


#############################################################################
##
#F  FieldOps.FastPolynomial( <R>, <coeffs>, <val> ) .  polynomial over a ring
##
##  This function will *not* copy <coeffs> and thus destroy <coeffs>.
##
FieldOps.FastPolynomial := function( R, coeffs, val )
    local  i,  k,  l,  c;

    # normalize <coeffs>
    val := val + NormalizeCoeffs(coeffs);
    if 0 = Length(coeffs)  then val := 0;  fi;

    # return polynomial
    if val < 0  then
        return rec( coefficients := coeffs,
    	    	    baseRing     := R,
    	    	    isPolynomial := true,
		    valuation    := val,
    	    	    domain       := LaurentPolynomials,
    	    	    operations   := PolynomialOps );
    else
        return rec( coefficients := coeffs,
    	    	    baseRing     := R,
    	    	    isPolynomial := true,
		    valuation    := val,
    	    	    domain       := Polynomials,
    	    	    operations   := PolynomialOps );
    fi;

end;


#############################################################################
##
#F  FieldOps.PolynomialRing( <R> )  . . . . . . . . . .  full polynomial ring
##
FieldOps.PolynomialRing := function( F )
    local   P;

    # construct a new ring domain
    P := rec();
    P.isDomain := true;
    P.isRing   := true;

    # show that this a polynomial ring
    P.isPolynomialRing := true;

    # set known properties
    P.isFinite := false;
    P.size     := "infinity";

    # add known properties of polynom ring over a field
    P.isCommutativeRing         := true;
    P.isIntegralRing            := true;
    P.isUniqueFactorizationRing := true;
    P.isEuclideanRing           := true;

    # set one and zero
    P.one  := Polynomial( F, [ F.one ] );
    P.zero := Polynomial( F, [] );

    # 'P.baseRing' contains <R>
    P.baseRing := F;

    # set operations record and return
    P.operations := FieldPolynomialRingOps;
    return P;

end;


#############################################################################
##
#F  FieldOps.LaurentPolynomialRing( <F> ) . . .  full Laurent polynomial ring
##
FieldOps.LaurentPolynomialRing := function( F )
    local   P;

    # construct a new ring domain
    P := rec();
    P.isDomain := true;
    P.isRing   := true;

    # show that this a Laurent polynomial ring
    P.isLaurentPolynomialRing := true;

    # set known properties
    P.isFinite := false;
    P.size     := "infinity";

    # add properties of laurent polynom ring over a field
    P.isCommutativeRing         := true;
    P.isIntegralRing            := true;
    P.isUniqueFactorizationRing := true;
    P.isEuclideanRing           := true;

    # set one and zero
    P.one  := Polynomial( F, [ F.one ] );
    P.zero := Polynomial( F, [] );

    # 'P.baseRing' contains <F>
    P.baseRing := F;

    # set operations record and return
    P.operations := FieldLaurentPolynomialRingOps;
    return P;

end;


#############################################################################
##
#F  FieldOps.Indeterminate( <F> ) . . . . . . . .  indeterminate over a field
##
FieldOps.Indeterminate := function( F )
    return Polynomial( F, [ F.zero, F.one ] );
end;


#############################################################################
##
#F  FieldOps.InterpolatedPolynomial( <R>, <x>, <y> )  . . . . . interpolation
##
##  'InterpolatedPolynomial' returns, for given lists <x>, <y> of elements in
##  a ring <R> of the  same  lenth $n$ say, the unique  polynomial of  degree
##  less than $n$ which has value <y>[i] at <x>[i], for all $i=1,...,n$. Note
##  that the elements in <x> must be distinct.
##
FieldOps.InterpolatedPolynomial := function( R, x, y )
    local   a,  t,  k,  i,  p;

    a := [];
    t := ShallowCopy(y);
    for i  in [ 1 .. Length(x) ]  do
        for k  in [ i-1, i-2 .. 1 ]  do
            t[k] := ( t[k+1] - t[k] ) / ( x[i] - x[k] );
        od;
        a[i] := t[1];
    od;
    p := a[Length(x)];
    for i  in [ Length(x)-1, Length(x)-2 .. 1 ]  do
        p := p * (Indeterminate(R)-x[i]) + a[i];
    od;
    return p;

end;


#############################################################################
##
#F  IsFieldHomomorphism(<fun>)  .  test if a function is a field homomorphism
##
IsFieldHomomorphism := function ( fun )
    if not IsBound( fun.isFieldHomomorphism )  then
        fun.isFieldHomomorphism := fun.operations.IsFieldHomomorphism( fun );
    fi;
    return fun.isFieldHomomorphism;
end;


#############################################################################
##
#F  FieldOps.IsHomomorphism(<fun>) test if a function is a field homomorphism
##
##  kann weg!
##
FieldOps.IsHomomorphism := IsFieldHomomorphism;


#############################################################################
##
#F  MappingOps.IsFieldHomomorphism(<fun>) . .  is <func> a field homomorphism
##
MappingOps.IsFieldHomomorphism := function ( fun )
    local   isHom;      # 'true' if <fun> is a homomorphism, result

    # check that <fun> is a function
    if not IsMapping( fun )  then
        Error("<fun> must be a single valued mapping");
    fi;

    # test that source and range are fields
    if not IsField( fun.source )  then
        Error("'<fun>.source' must be a field");
    fi;
    if not IsField( fun.range )  then
        Error("'<fun>.range' must be a field");
    fi;

    # test the linearity explicitely if the source is finite
    if IsFinite( fun.source )  then
        isHom := ForAll( Elements(fun.source),
                        x -> ForAll( Elements(fun.source),
                                  y -> Image( fun, x * y )
                                     = Image( fun, x ) * Image( fun, y )
                                   and Image( fun, x + y )
                                     = Image( fun, x ) + Image( fun, y ) ) );

    # otherwise give up
    else
        Error("sorry, can not test if <fun> is a hom., infinite source");
    fi;

    # return the result
    return isHom;
end;


#############################################################################
##
#F  KernelFieldHomomorphism(<fun>)  . . . . .  kernel of a field homomorphism
##
KernelFieldHomomorphism := function ( fun )
    if not IsBound( fun.kernelFieldHomomorphism )  then
        fun.kernelFieldHomomorphism
            := fun.operations.KernelFieldHomomorphism(fun);
    fi;
    return fun.kernelFieldHomomorphism;
end;


#############################################################################
##
#F  FieldOps.Kernel(<fun>)  . . . . . . . . .  kernel of a field homomorphism
##
FieldOps.Kernel := KernelFieldHomomorphism;


#############################################################################
##
#F  MappingOps.KernelFieldHomomorphism(<hom>)  kernel of a field homomorphism
##
MappingOps.KernelFieldHomomorphism := function ( hom )

    # check that <hom> is a homomorphism
    if not IsHomomorphism(hom)  then
        Error("<hom> must be a homomorphism");
    fi;

    # return the kernel
    return [ hom.source.zero ];
end;


#############################################################################
##
#F  FieldHomomorphismOps  . . . . . operations record for field homomorphisms
##
FieldHomomorphismOps := OperationsRecord( "FieldHomomorphismOps",
                                          MappingOps );


#############################################################################
##
#F  FieldHomomorphismOps.IsInjective(<hom>) . . . is a homomorphism injective
##
FieldHomomorphismOps.IsInjective := function ( hom )
    return true;
end;


#############################################################################
##
#F  FieldHomomorphismOps.IsSurjective(<hom>)  .  is a homomorphism surjective
##
FieldHomomorphismOps.IsSurjective := function ( hom )
    return Size( hom.range ) = Size( Image( hom ) );
end;


#############################################################################
##
#F  FieldHomomorphismOps.IsHomomorphism(<hom>)  is <hom> a field homomorphism
##
FieldHomomorphismOps.IsHomomorphism := function ( hom )
    return IsFieldHomomorphism( hom );
end;


#############################################################################
##
#F  FieldHomomorphismOps.IsFieldHomomorphism(<hom>) . . . . . . . always true
##
FieldHomomorphismOps.IsFieldHomomorphism := function ( hom )
    return true;
end;


#############################################################################
##
#F  FieldHomomorphismOps.\=(<hom1>,<hom2>)  . . . comparison of homomorphisms
##
FieldHomomorphismOps.\= := function ( hom1, hom2 )
    local   isEql;

    # if <hom1> is a homomorphisms
    if IsHomomorphism( hom1 )  then

        # and if <hom2> is a homomorphisms
        if IsHomomorphism( hom2 )  then

            # maybe the properties we already know determine the result
            if (IsBound(hom1.isInjective) and IsBound(hom2.isInjective)
                and hom1.isInjective <> hom2.isInjective)
            or (IsBound(hom1.isSurjective) and IsBound(hom2.isSurjective)
                and hom1.isSurjective <> hom2.isSurjective)
            then
                isEql := false;

            # otherwise we must really test the equality
            else
                isEql := hom1.source = hom2.source
                    and hom1.range  = hom2.range
                    and ForAll( hom1.source.generators,
                           elm -> Image(hom1,elm) = Image(hom2,elm) );
            fi;

        # a homomorphism and an object of another type are never equal
        else
            isEql := false;
        fi;

    # if <hom1> is not a homomorphism
    else

        # a homomorphism and an object of another type are never equal
        if IsHomomorphism( hom2 )  then
            isEql := false;

        # at least one argument must be a mapping
        else
            Error("panic, either <hom1> or <hom2> must be a mapping");
        fi;

    fi;

    # return the result
    return isEql;
end;


#############################################################################
##
#F  FieldHomomorphismOps.ImagesSet(<hom>,<elms>)  images of a set under a hom
##
FieldHomomorphismOps.ImagesSet := function ( hom, elms )
    if IsField( elms )  and IsSubset( hom.source, elms )  then
        return Field( List( elms.generators, gen -> Image( hom, gen ) ) );
    else
        return MappingOps.ImagesSet( hom, elms );
    fi;
end;


#############################################################################
##
#F  FieldHomomorphismOps.PreImagesElm(<hom>,<elm>)  . . .  preimage of an elm
##
FieldHomomorphismOps.PreImagesElm := function ( hom, elm )
    return [ PreImagesRepresentative( hom, elm ) ];
end;


#############################################################################
##
#F  FieldHomomorphismOps.PreImagesSet(<hom>,<elm>)  . . . . preimage of a set
##
FieldHomomorphismOps.PreImagesSet := function ( hom, elms )
    if IsField( elms )  and IsSubset( hom.range, elms )  then
        return Field( List( elms.generators,
                            gen -> PreImagesRepresentative( hom, gen ) ) );
    else
        return MappingOps.PreImagesSet( hom, elms );
    fi;
end;


#############################################################################
##
#F  FieldHomomorphismOps.CompositionMapping(<map1>,<map2>)composition of homs
##
FieldHomomorphismOps.CompositionMapping := function ( map1, map2 )
    local   com;        # composition of <map1> and <map2>, result

    # handle the composition of two homomorphisms
    if IsFieldHomomorphism( map1 )  and IsFieldHomomorphism( map2 )  then

        # make the mapping record
        com := rec();
        com.isGeneralMapping := true;

        # enter the source and the range
        com.source          := map2.source;
        com.range           := map1.range;

        # maybe we know that the mapping is a function
        com.isMapping       := true;
        com.isHomomorphism  := true;

        # enter the identifying information
        com.map1            := map1;
        com.map2            := map2;

        # enter the operations record
        com.operations      := CompositionFieldHomomorphismOps;

    # handle other mappings
    else

        com := MappingOps.CompositionMapping( map1, map2 );

    fi;

    # return the composition
    return com;
end;

CompositionFieldHomomorphismOps := OperationsRecord(
             "CompositionFieldHomomorphismOps", CompositionMappingOps );

CompositionFieldHomomorphismOps.IsInjective :=
           FieldHomomorphismOps.IsInjective;

CompositionFieldHomomorphismOps.IsSurjective :=
           FieldHomomorphismOps.IsSurjective;

CompositionFieldHomomorphismOps.IsFieldHomomorphism :=
           FieldHomomorphismOps.IsFieldHomomorphism;

CompositionFieldHomomorphismOps.\= :=
           FieldHomomorphismOps.\=;

CompositionFieldHomomorphismOps.ImageElm := function ( com, elm )
    return com.map1.operations.ImageElm( com.map1,
               com.map2.operations.ImageElm( com.map2,
                   elm ) );
end;

CompositionFieldHomomorphismOps.PreImagesElm :=
           FieldHomomorphismOps.PreImagesElm;

CompositionFieldHomomorphismOps.KernelFieldHomomorphism := function ( com )
    return [ com.map2.source.zero ];
end;

CompositionFieldHomomorphismOps.Print := function ( com )
    Print( "(", com.map2, " * ", com.map1, ")" );
end;


#############################################################################
##
#F  FieldOps.IdentityMapping(<G>) . . . . . . . . identity mapping on a field
##
FieldOps.IdentityMapping := function ( G )
    local   id;         # identity mapping on <G>, result

    # make the mapping
    id := rec();
    id.isGeneralMapping         := true;

    # enter the identification
    id.isIdentity               := true;
    id.source                   := G;
    id.range                    := G;

    # enter usefull information
    id.isMapping                := true;
    id.isInjective              := true;
    id.isSurjective             := true;
    id.isFieldHomomorphism      := true;
    id.image                    := G;
    id.preImage                 := G;

    # enter the operations record
    id.operations               := IdentityFieldHomomorphismOps;

    # return the mapping
    return id;
end;

IdentityFieldHomomorphismOps := OperationsRecord(
        "IdentityFieldHomomorphismOps", MappingOps );

IdentityFieldHomomorphismOps.ImageElm := function ( id, elm )
    return elm;
end;

IdentityFieldHomomorphismOps.ImagesElm := function ( id, elm )
    return [ elm ];
end;

IdentityFieldHomomorphismOps.ImagesSet := function ( id, elms )
    return elms;
end;

IdentityFieldHomomorphismOps.PreImageElm := function ( id, elm )
    return elm;
end;

IdentityFieldHomomorphismOps.PreImagesElm := function ( id, elm )
    return [ elm ];
end;

IdentityFieldHomomorphismOps.PreImagesSet := function ( id, elms )
    return elms;
end;

IdentityFieldHomomorphismOps.\= := FieldHomomorphismOps.\=;

IdentityFieldHomomorphismOps.\< := FieldHomomorphismOps.\<;

IdentityFieldHomomorphismOps.CompositionMapping := function ( map1, map2 )
    if IsBound( map1.isIdentity )  then
        return map2;
    elif IsBound( map2.isIdentity )  then
        return map1;
    else
        Error("panic, neither <map1> nor <map2> is the identity");
    fi;
end;

IdentityFieldHomomorphismOps.InverseMapping := function ( id )
    return id;
end;

IdentityFieldHomomorphismOps.Print := function ( id )
    Print("IdentityMapping( ",id.source," )");
end;
