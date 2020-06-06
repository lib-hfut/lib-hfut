#############################################################################
##
#A  finfield.g                  GAP library                     Werner Nickel
#A                                                         & Martin Schoenert
##
#A  @(#)$Id: finfield.g,v 3.17.1.2 1995/08/03 09:35:07 ahulpke Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains those functions that deal with finite field  elements.
##
#H  $Log: finfield.g,v $
#H  Revision 3.17.1.2  1995/08/03  09:35:07  ahulpke
#H  changed 'Copy(coeffs)' to 'ShallowCopy(coeffs)'
#H
#H  Revision 3.17.1.1  1995/09/27  11:48:15  sam
#H  fixed 'FrobeniusAutomorphismI for a bad case
#H
#H  Revision 3.17  1994/04/13  08:31:53  sam
#H  introduced 'OperationsRecord'
#H
#H  Revision 3.16  1994/02/16  14:40:41  fceller
#H  changed 'FastPolynomial' slightly
#H
#H  Revision 3.15  1994/01/25  15:02:09  fceller
#H  removed 'IntFFE'
#H
#H  Revision 3.14  1993/07/05  10:40:17  fceller
#H  fixed 'PolynomialRing' for finite fields without '.root'
#H
#H  Revision 3.13  1993/03/02  08:51:19  fceller
#H  added 'FastPolynomial'
#H
#H  Revision 3.12  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.11  1992/11/16  12:22:59  fceller
#H  added Laurent polynomials
#H
#H  Revision 3.10  1992/07/30  15:22:56  fceller
#H  fixed some minor bugs in 'GaloisField'
#H
#H  Revision 3.9  1992/06/17  07:06:04  fceller
#H  moved '<somedomain>.operations.Polynomial' function to "<somedomain>.g"
#H
#H  Revision 3.8  1992/04/29  14:10:17  martin
#H  added 'FinFieldOps.Coefficients'
#H
#H  Revision 3.7  1992/04/23  07:25:37  fceller
#H  read in "polyfin.g" which contains functions for polynomials
#H  over finite fields.
#H
#H  Revision 3.6  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.5  1992/02/11  14:16:36  martin
#H  added 'GaloisGroup'
#H
#H  Revision 3.4  1992/01/29  11:07:59  martin
#H  improved 'IntFFE'
#H
#H  Revision 3.3  1992/01/02  16:29:27  martin
#H  made a temporary fix to 'GF'
#H
#H  Revision 3.2  1991/10/10  12:40:31  martin
#H  changed everything for new domain concept
#H
#H  Revision 3.1  1991/08/04  12:00:00  martin
#H  changed the finite field package for domains
#H
#H  Revision 3.0  1991/01/06  12:00:00  martin
#H  initial revision under RCS
##


#############################################################################
##
#F  IsFiniteField( <obj> )  . . .  test if an object is a finite field record
##
IsFiniteField := function ( obj )
    return IsRec( obj )
       and IsBound( obj.isField  )  and obj.isField
       and IsBound( obj.isFinite )  and obj.isFinite;
end;


#############################################################################
##
#V  FiniteFieldOps  . . . . . . . . . . . operations record for finite fields
##
FiniteFieldOps := OperationsRecord( "FiniteFieldOps", FieldOps );


#############################################################################
##
#F  FiniteFieldOps.Elements(<F>)  . . . . . . . .  elements of a finite field
##
FiniteFieldOps.Elements := function ( F )
    local   elms, elms2, i, k;

    # contruct the elements of the field
    elms := [ F.zero ];
    for i  in [1..Length(F.generators)]  do
        elms2 := [];
        for k  in [0..F.char-1]  do
            Append( elms2, elms + k * F.generators[i] );
        od;
        elms := elms2;
    od;

    # return the set of elements
    elms := Set( elms );
    return elms;
end;


#############################################################################
##
#F  FiniteFieldOps.\in( z, F ) . .  test if an object lies in a finite field
##
FiniteFieldOps.\in := function ( z, F )
    return IsFFE( z )
       and CharFFE( z ) = F.char
       and F.degree mod DegreeFFE( z ) = 0;
end;


#############################################################################
##
#F  FiniteFieldOps.Intersection(<F>,<G>)  . intersection of two finite fields
##
FiniteFieldOps.Intersection := function ( F, G )
    local   I;
    if     IsField( F )  and IsFinite( F )
       and IsField( G )  and IsFinite( G )  then
        if F.char = G.char  then
            I := GF( F.char ^ GcdInt( F.degree, G.degree ) );
        else
            I := [];
        fi;
    else
        I := FieldOps.Intersection( F, G );
    fi;
    return I;
end;


#############################################################################
##
#F  FiniteFieldOps.Random(<F>)  . . . . .  random element from a finite field
##
FiniteFieldOps.Random := function ( F )
    local   rnd;
    if IsBound(F.elements)  then
        rnd := RandomList( F.elements );
    elif IsBound(F.root)  then
        rnd := RandomList( [0..F.size-1] );
        if rnd = 0  then
            rnd := F.zero;
        else
            rnd := F.root^rnd;
        fi;
    else
        rnd := FieldOps.Random( F );
    fi;
    return rnd;
end;


#############################################################################
##
#F  FiniteFieldOps.Print(<F>) . . . . . . . . . . . . .  print a finite field
##
FiniteFieldOps.Print := function ( F )
    if IsBound( F.name )  then
        Print( F.name );
    else
        if F.degree = 1  then
            Print( "GF(",F.char,")" );
        else
            Print( "GF(",F.char,"^",F.degree,")" );
        fi;
        if not IsInt( F.field )  then
            Print( "/",F.field );
        fi;
    fi;
end;


#############################################################################
##
#F  FiniteFieldOps.\/(<F>,<G>) . .. . . . . .  quotient of two finite fields
##
FiniteFieldOps.\/ := function ( F, G )
    local   Q;

    # let others do the main work
    Q := FieldOps.\/( F, G );

    # enter further knowledge
    if IsBound(F.root)  then Q.root := F.root;  fi;
    Q.base := List( [0..F.degree/G.degree-1], i->Z(F.size)^i );

    # return the quotient
    return Q;
end;


#############################################################################
##
#F  FiniteFieldOps.GaloisGroup(<F>) . . . . .  Galois group of a finite field
##
FiniteFieldOps.GaloisGroup := function ( F )
    if IsInt( F.field )  then
        return Group( FrobeniusAutomorphismI( F, F.field ) );
    else
        return Group( FrobeniusAutomorphismI( F, Size( F.field ) ) );
    fi;
end;


#############################################################################
##
#F  FiniteFieldOps.Conjugates(<F>,<z>) . conjugates of a finite field element
##
FiniteFieldOps.Conjugates := function ( F, z )
    local   cnjs,       # conjugates of <z> in <F>, result
            ord,        # order of the subfield of <F>
            deg,        # degree of <F> over its subfield
            i;          # loop variable

    # get the order of the subfield and the degree
    if IsInt(F.field)  then
        ord := F.char;
        deg := F.degree;
    else
        ord := F.field.char ^ F.field.degree;
        deg := F.degree / F.field.degree;
    fi;
    if F.char <> CharFFE(z)  or F.degree mod DegreeFFE(z) <> 0  then
        Error("<z> must lie in <F>");
    fi;

    # compute the conjugates $\set_{i=0}^{d-1}{z^(q^i)}$
    cnjs := [];
    for i  in [0..deg-1]  do
        Add( cnjs, z );
        z := z^ord;
    od;

    # return the conjugates
    return cnjs;
end;


#############################################################################
##
#F  FiniteFieldOps.Norm(<F>,<z>)  . . . . . .. norm of a finite field element
##
FiniteFieldOps.Norm := function ( F, z )
    local   nrm,        # norm of <z> in <F>, result
            ord,        # order of the subfield of <F>
            deg;        # degree of <F> over its subfield

    # get the order of the subfield and the degree
    if IsInt(F.field)  then
        ord := F.char;
        deg := F.degree;
    else
        ord := F.field.char ^ F.field.degree;
        deg := F.degree / F.field.degree;
    fi;
    if F.char <> CharFFE(z)  or F.degree mod DegreeFFE(z) <> 0  then
        Error("<z> must lie in <F>");
    fi;

    # $nrm = \prod_{i=0}^{deg-1}{ z^(ord^i) }
    #      = z ^ {1 + ord + ord^2 + .. + ord^{deg-1}}
    #      = z ^ {(ord^deg-1)/(ord-1)} $
    nrm := z ^ ((ord^deg-1)/(ord-1));

    # return the norm
    return nrm;
end;


#############################################################################
##
#F  FiniteFieldOps.Trace(<F>,<z>) . . . . . . trace of a finite field element
##
FiniteFieldOps.Trace := function ( F, z )
    local   trc,        # trace of <z> in <F>, result
            ord,        # order of the subfield of <F>
            deg,        # degree of <F> over its subfield
            i;          # loop variable

    # get the order of the subfield and the degree
    if IsInt(F.field)  then
        ord := F.char;
        deg := F.degree;
    else
        ord := F.field.char ^ F.field.degree;
        deg := F.degree / F.field.degree;
    fi;
    if F.char <> CharFFE(z)  or F.degree mod DegreeFFE(z) <> 0  then
        Error("<z> must lie in <F>");
    fi;

    # $trc = \sum_{i=0}^{deg-1}{ z^(ord^i) }$
    trc := 0;
    for i  in [0..deg-1]  do
        trc := trc + z;
        z := z^ord;
    od;

    # return the trace
    return trc;
end;


#############################################################################
##
#F  FiniteFieldOps.Order(<F>,<z>) . . . . . . order of a finite field element
##
OrderFFE := function ( z )
    local   ord,        # order of <z>, result
            chr,        # characteristic of <F> (and <z>)
            deg;        # degree of <z> over the primefield

    # compute the order
    if z = 0 * z   then
        ord := 0;
    else
        chr := CharFFE( z );
        deg := DegreeFFE( z );
        ord := (chr^deg-1) / GcdInt( chr^deg-1, LogFFE( z, Z(chr^deg) ) );
    fi;

    # return the order
    return ord;
end;

FiniteFieldOps.Order := function ( F, z )
    return OrderFFE( z );
end;


#############################################################################
##
#F  FiniteFieldOps.Coefficents(<F>,<z>)  coefficients of finite field element
##
FiniteFieldOps.Coefficients := function ( F, z )
    local   q, d, mat, b, cnjs, k, zz;

    # get the size of the subfield and the degree of the extension
    if IsInt( F.field )  then
        q := F.field;
    else
        q := Size( F.field );
    fi;
    d := Length( F.base );

    # if the inverse matrix of the base is not already known compute it
    if not IsBound( F.inverseBase )  then

        # build the matrix M[i,k] = base[i]^(q^k)
        mat := [];
        for b  in F.base  do
            cnjs := [];
            for k  in [0..d-1]  do
                Add( cnjs, b^(q^k) );
            od;
            Add( mat, cnjs );
        od;

        # add the inverse matrix to the field record
        F.inverseBase := mat ^ -1;

    fi;

    # compute the vector of conjugates of z
    zz := [];
    for k  in [0..d-1]  do
        Add( zz, z^(q^k) );
    od;
    return zz * F.inverseBase;
end;


#############################################################################
##
#F  FiniteFieldOps.Polynomial( <R>, <coeffs>, <val> ) . . polynomial over <R>
##
FiniteFieldOps.Polynomial := function( R, coeffs, val )

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
    	    	    domain       := FiniteFieldLaurentPolynomials,
    	    	    operations   := FiniteFieldPolynomialOps );
    else
        return rec( coefficients := coeffs,
    	    	    baseRing     := R,
    	    	    isPolynomial := true,
		    valuation    := val,
    	    	    domain       := FiniteFieldPolynomials,
    	    	    operations   := FiniteFieldPolynomialOps );
    fi;

end;


#############################################################################
##
#F  FiniteFieldOps.FastPolynomial( <R>, <coeffs>, <val> ) polynomial over <R>
##
##  This function will *not* copy <coeffs> and thus destroy <coeffs>.
##
FiniteFieldOps.FastPolynomial := function( R, coeffs, val )

    # normalize <coeffs>
    val := val + NormalizeCoeffs(coeffs);
    if 0 = Length(coeffs)  then val := 0;  fi;

    # return polynomial
    if val < 0  then
        return rec( coefficients := coeffs,
    	    	    baseRing     := R,
    	    	    isPolynomial := true,
		    valuation    := val,
    	    	    domain       := FiniteFieldLaurentPolynomials,
    	    	    operations   := FiniteFieldPolynomialOps );
    else
        return rec( coefficients := coeffs,
    	    	    baseRing     := R,
    	    	    isPolynomial := true,
		    valuation    := val,
    	    	    domain       := FiniteFieldPolynomials,
    	    	    operations   := FiniteFieldPolynomialOps );
    fi;

end;


#############################################################################
##
#F  FiniteFieldOps.PolynomialRing( <R> )  . . . . . . .  full polynomial ring
##
FiniteFieldOps.PolynomialRing := function( R )
    local   P;

    # construct a new ring domain
    P := rec();
    P.isDomain := true;
    P.isRing   := true;

    # set known properties
    P.isFinite := false;
    P.size     := "infinity";

    # add properties of polynom ring over finite field
    P.isCommutativeRing         := true;
    P.isIntegralRing            := true;
    P.isUniqueFactorizationRing := true;
    P.isEuclideanRing           := true;
    P.isPolynomialRing          := true;

    # set one and zero
    P.one  := Polynomial( R, [ R.one ] );
    P.zero := Polynomial( R, [] );

    # generate the field and a poly of degree 1
    if 1 < R.degree and IsBound(R.root)  then
        P.generators := [ Polynomial( R, [ R.zero, R.one ] ),
                          Polynomial( R, [ R.root ] ) ];
    elif 1 < R.degree  then
    	P.generators := [ Polynomial( R, [ R.zero, R.one ] ) ];
    	Append(P.generators,List(R.generators, x -> Polynomial(R,[x])));
    else
    	P.generators := [ Polynomial( R, [ R.zero, R.one ] ) ];
    fi;
    	    	    	  

    # 'P.baseRing' contains <R>
    P.baseRing := R;

    # set operations record and return
    P.operations := FiniteFieldPolynomialRingOps;
    return P;

end;


#############################################################################
##
#F  FiniteFieldOps.LaurentPolynomialRing( <F> )  full Laurent polynomial ring
##
FiniteFieldOps.LaurentPolynomialRing := function( F )
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

    # add properties of laurent polynom ring over field
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
#F  FiniteFieldOps.Int(<F>,<z>)  convert a finite field element to an integer
##
FiniteFieldOps.Int := function ( F, z )
    return IntFFE( z );
end;


#############################################################################
##
#F  GaloisField( <p>^<n> )  . . . . . . . . . .  create a finite field record
##
GF := function ( arg )
    local   F,  p, d,  i, r;

    # if necessary split the arguments
    if Length(arg) = 1  then
        p := SmallestRootInt( arg[1] );
        d := LogInt( arg[1], p );
    elif Length(arg) = 2  then
        p := arg[1];
        d := arg[2];
    else
        Error("usage: GF( <subfield>, <extension> )");
    fi;

    # if the subfield is given by a prime denoting the prime field
    if IsInt( p )  and IsPrime( p )  then

        # if the degree of the extension is given
        if   IsInt( d )  then

            F := rec(
                isDomain                := true,
                isField                 := true,

                char                    := p,
                degree                  := d,
                generators              := List( [0..d-1], i->Z(p^d)^i ),
                zero                    := 0 * Z(p^d),
                one                     := Z(p^d) ^ 0,

                size                    := p^d,
                isFinite                := true,
                root                    := Z(p^d),

                field                   := p,
                dimension               := d,
                base                    := List( [0..d-1], i->Z(p^d)^i ),

                operations              := FiniteFieldOps );

        # if a base for the extension is given
        elif IsVector( d )  and IsBaseFF( p, d )  then

            F := rec(
                isDomain                := true,
                isField                 := true,

                char                    := p,
                degree                  := Length( d ),
                generators              := Copy( d ),
                zero                    := 0 * Z(p),
                one                     := Z(p) ^ 0,

                size                    := p^Length(d),
                isFinite                := true,

                field                   := p,
                dimension               := Length( d ),
                base                    := Copy( d ),

                operations              := FiniteFieldOps );

        # if the extension is given by an irreducible polynomial
        elif IsVector( d )  and DegreeFFE( d ) = 1  then

            r := Z(p^(Length(d)-1));
            while r <> r^0 and ValuePol( d, r ) <> 0 * r  do
                r := r * Z(p^(Length(d)-1));
            od;
            if DegreeFFE( r ) < Length( d ) - 1  then
                Error("<polynomial> must be irreducible");
            fi;

            F := rec(
                isDomain                := true,
                isField                 := true,

                char                    := p,
                degree                  := Length( d ) - 1,
                generators              := List( [0..Length(d)-2], i->r^i ),
                zero                    := 0 * Z(p),
                one                     := Z(p) ^ 0,

                size                    := p^(Length(d)-1),
                isFinite                := true,
                polynomial              := Copy( d ),

                field                   := p,
                dimension               := Length( d ),
                base                    := List( [0..Length(d)-2], i->r^i ),

                operations              := FiniteFieldOps );

            if FiniteFieldOps.Order(F,r) = F.char^F.degree - 1  then
                F.root := r;
            fi;

        fi;

    # if the subfield is given by a finite field record
    elif IsRec( p )  then

        # if the degree of the extension is given
        if   IsInt( d )  then

            F := rec(
                isDomain                := true,
                isField                 := true,

                char                    := p.char,
                degree                  := p.degree * d,
                generators              := List( [0..p.degree*d-1],
                                             i->Z(p.char^(p.degree*d))^i
                                           ),
                zero                    := 0 * Z(p.char^(p.degree*d)),
                one                     := Z(p.char^(p.degree*d)) ^ 0,

                size                    := p.char ^ (p.degree * d),
                isFinite                := true,
                root                    := Z(p.char^(p.degree*d)),

                field                   := p,
                dimension               := d,
                base                    := List( [0..d-1],
                                             i->Z(p.char^(p.degree*d))^i
                                           ),

                operations              := FiniteFieldOps );

        # if a base for the extension is given
        elif IsVector( d )  and IsBaseFF( p, d )  then

            F := rec(
                isDomain                := true,
                isField                 := true,

                char                    := p.char,
                degree                  := p.degree * Length(d),
                generators              := List( [0..p.degree*Length(d)-1],
                                          i->Z(p.char^(p.degree*Length(d)))^i
                                           ),
                zero                    := 0 * Z(p.char),
                one                     := Z(p.char) ^ 0,

                size                    := p.char^(p.degree*Length(d)),
                isFinite                := true,

                field                   := p,
                dimension               := Length( d ),
                base                    := Copy( d ),

                operations              := FiniteFieldOps );

        # if the extension is given by an irreducible polynomial
        elif IsVector( d )  and p.degree mod DegreeFFE( d ) = 0  then

            r := Z(p.char^(Length(d)-1));
            while r <> r^0 and ValuePol( d, r ) <> 0 * r  do
                r := r * Z(p.char^(Length(d)-1));
            od;
            if DegreeFFE( r ) < Length( d ) - 1  then
                Error("<pol> must be irreducible");
            fi;

            F := rec(
                isDomain   := true,
                isField    := true,

                char       := p.char,
                degree     := p.degree * (Length(d)-1),
                generators := List( [0..p.degree*(Length(d)-1)-1],
                                i->Z(p.char^(p.degree*(Length(d)-1)))^i
                                           ),
                zero       := 0 * Z(p.char),
                one        := Z(p.char) ^ 0,

                size       := p.char^(p.degree*(Length(d)-1)),
                isFinite   := true,

                field      := p,
                dimension  := Length( d ) - 1,
                base       := List( [0..Length(d)-2], i->r^i ),
                polynomial := Copy( d ),

                operations := FiniteFieldOps );

            if FiniteFieldOps.Order(F,r) = F.char^F.degree - 1  then
                F.root := r;
            fi;

        # otherwise we dont know how to handle the extension
        else
            Error("<extension> must be a <deg>, <bas>, or <pol>");
        fi;

    # otherwise we dont know how to handle the subfield
    else
        Error("<subfield> must be a prime or a finite field");
    fi;

    # return the finite field record
    return F;
end;

FiniteField := GF;
GaloisField := GF;


#############################################################################
##
#V  FiniteFieldElements . . . . . . . . . domain of all finite field elements
#V  FiniteFieldElementsOps  . .  operations record for the domain of all ffes
##
FiniteFieldElementsOps := OperationsRecord( "FiniteFieldElementsOps",
                                            FieldElementsOps );

FiniteFieldElementsOps.\in     := function ( z, F )
    return IsFFE( z );
end;

FiniteFieldElementsOps.Order    := FiniteFieldOps.Order;

FiniteFieldElementsOps.Int      := FiniteFieldOps.Int;


FiniteFieldElements             := rec();
FiniteFieldElements.isDomain    := true;

FiniteFieldElements.name        := "FiniteFieldElements";

FiniteFieldElements.isFinite    := false;
FiniteFieldElements.size        := "infinity";

FiniteFieldElements.operations  := FiniteFieldElementsOps;


#############################################################################
##
#F  FiniteFieldElementsOps.Field(<v>) . . . . field of a finite field element
##
FiniteFieldElementsOps.Field := function ( z )
    local   F,          # field containing <z>, result
            chr,        # characteristic of <z>
            deg;        # degree of <z> over the primefield

    # get characteristic and degree
    chr := CharFFE( z );
    deg := DegreeFFE( z );

    # make the finite field record
    F := rec(

        isDomain                := true,                # type of domain
        isField                 := true,

        char                    := chr,                 # identity
        degree                  := deg,
        generators              := List( [0..deg-1], i->Z(chr^deg)^i ),
        zero                    := 0 * Z(chr),
        one                     := Z(chr) ^ 0,

        size                    := chr^deg,             # properties
        isFinite                := true,
        root                    := Z(chr^deg),

        field                   := chr,                 # subfield
        dimension               := deg,
        base                    := List( [0..deg-1], i->Z(chr^deg)^i ),

        operations              := FiniteFieldOps

    );

    # return the finite field
    return F;
end;


#############################################################################
##
#F  FiniteFieldElementsOps.DefaultField(<z>)  . default field containing ffes
##
FiniteFieldElementsOps.DefaultField := FiniteFieldElementsOps.Field;


#############################################################################
##
#F  IsBaseFF( <F>, <base> ) . . . . . . . . . . test for linear indenpendence
##
IsBaseFF := function ( F, base )
    local   q, d, mat, b, cnjs, k;

    # get the order of the subfield and the degree of the extension
    if IsInt(F)  then
        q := F;
        d := DegreeFFE( base );
    else
        q := F.char ^ F.degree;
        d := DegreeFFE( base ) / F.degree;
    fi;

    # test that the elements of base lie in the finite field of degree d
    if d <> Length(base)  then
        return false;
    fi;

    # build the matrix M[i,k] = base[i]^(q^k)
    mat := [];
    for b  in base  do
        cnjs := [];
        for k  in [0..d-1]  do
            Add( cnjs, b^(q^k) );
        od;
        Add( mat, cnjs );
    od;

    # it is a base if and only if mat is invertable
    return DeterminantMat( mat ) <> 0;
end;


#############################################################################
##
#F  IsFrobeniusAutomorphism(<obj>)  . . test if an object is a Frobenius aut.
##
IsFrobeniusAutomorphism := function ( obj )
    return IsRec( obj )
       and IsBound( obj.isFrobeniusAutomorphism )
       and obj.isFrobeniusAutomorphism;
end;


#############################################################################
##
#F  FrobeniusAutomorphism(<F>)  . .  Frobenius automorphism of a finite field
#V  FrobeniusAutomorphismOps  . . . . . operations record for Frobenius auts.
##
FrobeniusAutomorphism := function ( F )

    # check the arguments
    if not IsField( F )  or not IsPrime( F.char )  then
        Error("<F> must be a finite field");
    fi;

    # return the automorphism
    return FrobeniusAutomorphismI( F, F.char );
end;

FrobeniusAutomorphismI := function ( F, i )

    # Catch the bad case.
    if Size( F ) <> 2 then
      i:= i mod ( Size( F ) - 1 );
    fi;

    # make the mapping record
    return rec(
        isGeneralMapping        := true,
        domain                  := Mappings,

        isFrobeniusAutomorphism := true,
        power                   := i,
        source                  := F,
        range                   := F,

        isMapping               := true,
        isHomomorphism          := true,
        isSurjective            := true,
        isInjective             := true,

        operations              := FrobeniusAutomorphismOps );

end;

FrobeniusAutomorphismOps := OperationsRecord( "FrobeniusAutomorphismOps",
                                              FieldHomomorphismOps );

FrobeniusAutomorphismOps.\= := function ( aut1, aut2 )
    if IsFrobeniusAutomorphism( aut1 )  then
        if IsFrobeniusAutomorphism( aut2 )  then
            return aut1.source = aut2.source
               and aut1.power  = aut2.power;
        else
            return false;
        fi;
    else
        if IsFrobeniusAutomorphism( aut2 )  then
            return false;
        else
            Error("panic: neither <aut1> nor <aut2> is a Frobenius aut.");
        fi;
    fi;
end;

FrobeniusAutomorphismOps.ImageElm := function ( aut, elm )
    return elm ^ aut.power;
end;

FrobeniusAutomorphismOps.ImagesElm := function ( aut, elm )
    return [ elm ^ aut.power ];
end;

FrobeniusAutomorphismOps.ImagesSet := function ( aut, elms )
    if IsField( elms )  and  IsSubset( aut.source, elms )  then
        return elms;
    else
        return FieldHomomorphismOps.ImagesSet( aut, elms );
    fi;
end;

FrobeniusAutomorphismOps.ImagesRepresentative := function ( aut, elm )
    return elm ^ aut.power;
end;

FrobeniusAutomorphismOps.CompositionMapping := function ( aut1, aut2 )
    if IsFrobeniusAutomorphism( aut1 )  then
        if IsFrobeniusAutomorphism( aut2 )  then
            return FrobeniusAutomorphismI( aut1.source,
                                           aut1.power * aut2.power );
        else
            return FieldHomomorphismOps.CompositionMapping( aut1, aut2 );
        fi;
    else
        return FieldHomomorphismOps.CompositionMapping( aut1, aut2 );
    fi;
end;

FrobeniusAutomorphismOps.InverseMapping := function ( aut )
    return FrobeniusAutomorphismI( aut.source,
                                   Size(aut.source)/aut.power );
end;

FrobeniusAutomorphismOps.PowerMapping := function ( aut, i )
    return FrobeniusAutomorphismI( aut.source,
                                   PowerMod(aut.power,i,Size(aut.source)-1));
end;

FrobeniusAutomorphismOps.\< := function ( aut1, aut2 )
    local   p, d;       # characteristic and degree
    if IsFrobeniusAutomorphism( aut1 )  then
        if IsFrobeniusAutomorphism( aut2 )  then
            if aut1.source <> aut2.source  then
                return aut1.source < aut2.source;
            else
                p := aut1.source.char;
                for d  in DivisorsInt( LogInt( Size(aut1.source), p ) )  do
                    if Z(p^d) ^ aut1.power <> Z(p^d) ^ aut2.power  then
                        return Z(p^d) ^ aut1.power < Z(p^d) ^ aut2.power;
                    fi;
                od;
                return false;
            fi;
        else
            return FieldHomomorphismOps.\<( aut1, aut2 );
        fi;
    else
        return FieldHomomorphismOps.\<( aut1, aut2 );
    fi;
end;

FrobeniusAutomorphismOps.Print := function ( aut )
    if aut.power = aut.source.char  then
        Print( "FrobeniusAutomorphism( ", aut.source, " )" );
    elif aut.power = 1  then
        Print( "IdentityMapping( ", aut.source, " )" );
    else
        Print( "FrobeniusAutomorphism( ", aut.source, " )^",
               LogInt( aut.power, aut.source.char ) );
    fi;
end;

FiniteFieldOps.IdentityMapping := function ( F )
    return FrobeniusAutomorphismI( F, 1 );
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



