#############################################################################
##
#A  polyrat.g                   GAP library                      Frank Celler
#A                                                         & Alexander Hulpke
##
#A  @(#)$Id: polyrat.g,v 3.31.1.3 1996/09/23 10:28:01 ahulpke Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions for polynomials over the Rationals.
##
#H  $Log: polyrat.g,v $
#H  Revision 3.31.1.3  1996/09/23 10:28:01  ahulpke
#H  Fixed factoring polynomials with linear factors
#H
#H  Revision 3.31.1.2  1994/09/19 08:28:11  ahulpke
#H  fixed factorization of square part
#H
#H  Revision 3.31.1.1  1994/08/02  10:11:48  ahulpke
#H  fixed cofactor bounds for trial factorization
#H
#H  Revision 3.31  1994/03/28  09:46:14  fceller
#H  fixed a bug in 'PowerMod'
#H
#H  Revision 3.30  1994/02/18  12:49:47  ahulpke
#H  added IsIrreducible
#H
#H  Revision 3.29  1994/02/18  12:15:11  fceller
#H  changed internal functions slightly to allow mixed "vectors"
#H
#H  Revision 3.28  1993/06/16  14:10:15  fceller
#H  renamed 'ReduceModCoeffs' to 'ReduceCoeffsMod'
#H
#H  Revision 3.27  93/04/30  10:16:20  fceller
#H  fixed a typo in "GcdModPrime"
#H
#H  Revision 3.26  1993/04/27  13:22:19  fceller
#H  the derivative of a primitive polynomial is not always primitive
#H
#H  Revision 3.25  1993/04/17  09:22:55  fceller
#H  'GcdCRT' must use the -<m>/2 to +<m>/2 range for the coefficients
#H
#H  Revision 3.24  1993/03/30  10:46:40  fceller
#H  added 'RationalsPolynomialsOps.\='
#H
#H  Revision 3.23  1993/03/25  09:17:28  martin
#H  fixed a typo in 'RationalsPolynomialOps.\^'
#H
#H  Revision 3.22  1993/03/10  19:23:42  fceller
#H  added 'EuclideanQuotient', 'EuclideanRemainder' and 'QuotientRemainder'
#H
#H  Revision 3.21  1993/03/02  17:36:57  fceller
#H  changed 'SquareHensel'
#H
#H  Revision 3.20  1993/03/02  08:57:53  fceller
#H  a few speedups
#H
#H  Revision 3.19  1993/02/19  15:50:51  fceller
#H  fixed a bug in '-'
#H
#H  Revision 3.18  1993/02/12  12:00:08  martin
#H  multiplication must check for zero before using 'FastPolynomial'
#H
#H  Revision 3.17  1993/02/11  16:47:56  fceller
#H  added <list> + <polynomial>
#H
#H  Revision 3.16  1993/02/09  14:25:55  martin
#H  made undefined globals local
#H
#H  Revision 3.15  1993/02/08  11:57:07  fceller
#H  some speed ups in polynomial arithmetic
#H
#H  Revision 3.14  1993/01/22  12:03:48  fceller
#H  added missing 'isPolynomialRing' in 'RationalsPolynomials'
#H
#H  Revision 3.13  1993/01/08  09:13:08  fceller
#H  added Hensel 'Factors' for polynomials over the rationals
#H
#H  Revision 3.12  1993/01/04  11:19:14  fceller
#H  added 'Gcd'
#H
#H  Revision 3.11  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.10  1992/12/07  07:40:04  fceller
#H  added <f> mod <n>
#H
#H  Revision 3.9  1992/11/25  12:34:54  fceller
#H  added 'Degree'
#H
#H  Revision 3.8  1992/11/16  17:48:31  fceller
#H  added 'String' support
#H
#H  Revision 3.7  92/11/16  12:23:40  fceller
#H  added Laurent polynomials
#H  
#H  Revision 3.6  92/10/28  09:15:08  fceller
#H  fixed 'mod' for zero polynomial
#H  
#H  Revision 3.5  1992/07/24  07:08:07  fceller
#H  improved '*' to allow <nullpoly> * <int>
#H
#H  Revision 3.4  1992/07/23  09:20:48  fceller
#H  improved '*' to allow <list> * <polynomial>
#H
#H  Revision 3.3  1992/06/17  07:06:04  fceller
#H  moved '<somedomain>.operations.Polynomial' function to "<somedomain>.g"
#H
#H  Revision 3.2  1992/06/01  07:32:24  fceller
#H  Initial GAP 3.2 release
##


#############################################################################
##
#F  InfoPoly1(...)  . . . . . . . . . . . infomation function for polynomials
#F  InfoPoly2(...)  . . . . . . . . . . . . .  debug function for polynomials
##
if not IsBound(InfoPoly1)    then InfoPoly1   := Ignore;  fi;
if not IsBound(InfoPoly2)    then InfoPoly2   := Ignore;  fi;
if not IsBound(InfoPoly3)    then InfoPoly3   := Ignore;  fi;


#############################################################################
##

#V  RationalsPolynomialOps  . . . . . . . . . . polynomial over the rationals
##
RationalsPolynomialOps := Copy( PolynomialOps );
RationalsPolynomialOps.name := "RationalsPolynomialOps";


#############################################################################
##
#F  RationalsPolynomialOps.\+ . . . . . . . . . . . .  sum of two polynomials
##
RationalsPolynomialOps.\+ := function( l, r )
    local   sum,  val,  vdf;

    # handle the case that one argument is a list
    if IsList(l)  then
        return List( l, x -> x+r );
    elif IsList(r)  then
        return List( r, x -> l+x );
    fi;

    # handle the case <scalar> + <polynomial>
    if not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then

        # <r> must have the rationals as base ring
        if Rationals <> r.baseRing  then
            Error( "<r> must have the rationals as base ring" );
        fi;

        # <l> must lie in the base ring of <r>
        if not IsRat(l)  then
            Error( "<l> must lie in the base ring of <r>" );
        fi;

        # if <l> is trivial return <r>
        if l = 0  then
            return r;
        fi;
 
        # otherwise convert <l> into a polynomial
        l := RationalsOps.FastPolynomial( Rationals, [l], 0 );
    fi;

    # handle the case <polynomial> + <scalar>
    if not (IsRec(r) and IsBound(r.isPolynomial) and r.isPolynomial)  then

        # <l> must have the rationals as base ring
        if Rationals <> l.baseRing  then
            Error( "<l> must have the rationals as base ring" );
        fi;

        # <r> must lie in the base ring of <l>
        if not IsRat(r)  then
            Error( "<r> must lie in the base ring of <l>" );
        fi;

        # if <r> is trivial return <l>
        if r = 0  then
            return l;
        fi;
 
        # otherwise convert <r> into a polynomial
        r := RationalsOps.FastPolynomial( Rationals, [r], 0 );
    fi;

    # depth greater than one are handle by our superclass
    if not IsBound(l.depth)  then  l.operations.Depth(l);  fi;
    if not IsBound(r.depth)  then  r.operations.Depth(r);  fi;
    if 1 <> l.depth or 1 <> r.depth  then
        return PolynomialOps.\+( l, r );

    # give up if we have rings other then the rationals
    elif Rationals <> l.baseRing  then
        Error( "<l> must have the rationals as base ring" );
    elif Rationals <> r.baseRing  then
        Error( "<r> must have the rationals as base ring" );

    # if <l> is the null polynomial return <r>
    elif Length(l.coefficients) = 0  then
        return r;

    # if <r> is the null polynomial return <l>
    elif Length(r.coefficients) = 0  then
        return l;

    # sum of two polynomials
    else

        # get the valuation minimum;
        vdf := r.valuation - l.valuation;

        # if <r>.valuation is the minimum shift <l>
        if r.valuation < l.valuation  then
            val := r.valuation;
            sum := ShiftedCoeffs( l.coefficients, -vdf );
            AddCoeffs( sum, r.coefficients );

        # if <l>.valuation is the minimum shift <r>
        elif l.valuation < r.valuation  then
            val := l.valuation;
            sum := ShiftedCoeffs( r.coefficients, vdf );

            # the rationals are commutative
            AddCoeffs( sum, l.coefficients );

        # otherwise they are equal
        else
            sum := SumCoeffs( l.coefficients, r.coefficients );
            val := l.valuation;
        fi;

        # return the sum
        sum := RationalsOps.FastPolynomial( Rationals, sum, val );
        sum.depth := 1;
        return sum;
    fi;

end;


#############################################################################
##
#F  RationalsPolynomialOps.\- . . . . . . . . . . . . diff of two polynomials
##
RationalsPolynomialOps.\- := function( l, r )
    local   dif,  val,  vdf;

    # handle the case that one argument is a list
    if IsList(l)  then
        return List( l, x -> x-r );
    elif IsList(r)  then
        return List( r, x -> l-x );
    fi;

    # handle the case <scalar> - <polynomial>
    if not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then

        # <r> must have the rationals as base ring
        if Rationals <> r.baseRing  then
            Error( "<r> must have the rationals as base ring" );
        fi;

        # <l> must lie in the base ring of <r>
        if not IsRat(l)  then
            Error( "<l> must lie in the base ring of <r>" );
        fi;

        # if <l> is trivial return -<r>
        if l = 0  then
            return RationalsOps.FastPolynomial(
                       Rationals, (-1) * r.coefficients, r.valuation );
        fi;
 
        # otherwise convert <l> into a polynomial
        l := RationalsOps.FastPolynomial( Rationals, [l], 0 );
    fi;

    # handle the case <polynomial> - <scalar>
    if not (IsRec(r) and IsBound(r.isPolynomial) and r.isPolynomial)  then

        # <l> must have the rationals as base ring
        if Rationals <> l.baseRing  then
            Error( "<l> must have the rationals as base ring" );
        fi;

        # <r> must lie in the base ring of <l>
        if not IsRat(r)  then
            Error( "<r> must lie in the base ring of <l>" );
        fi;

        # if <r> is trivial return <l>
        if r = 0  then
            return l;
        fi;
 
        # otherwise convert <r> into a polynomial
        r := RationalsOps.FastPolynomial( Rationals, [r], 0 );
    fi;

    # depth greater than one are handle by our superclass
    if not IsBound(l.depth)  then  l.operations.Depth(l);  fi;
    if not IsBound(r.depth)  then  r.operations.Depth(r);  fi;
    if 1 <> l.depth or 1 <> r.depth  then
        return PolynomialOps.\-( l, r );

    # give up if we have rings other then the rationals
    elif Rationals <> l.baseRing  then
        Error( "<l> must have the rationals as base ring" );
    elif Rationals <> r.baseRing  then
        Error( "<r> must have the rationals as base ring" );

    # if <l> is the null polynomial return -<r>
    elif Length(l.coefficients) = 0  then
        return -r;

    # if <r> is the null polynomial return <l>
    elif Length(r.coefficients) = 0  then
        return l;

    # difference of two polynomials
    else

        # get the valuation minimum;
        vdf := r.valuation - l.valuation;

        # if <r>.valuation is the minimum shift <l>
        if r.valuation < l.valuation  then
            val := r.valuation;
            dif := ShiftedCoeffs( l.coefficients, -vdf );
            AddCoeffs( dif, r.coefficients, -1 );

        # if <l>.valuation is the minimum shift <r>
        elif l.valuation < r.valuation  then
            val := l.valuation;
            dif := (-1)*ShiftedCoeffs( r.coefficients, vdf );

            # the rationals are commutative
            AddCoeffs( dif, l.coefficients );

        # otherwise they are equal
        else
            val := l.valuation;
            dif := Copy(l.coefficients);
            AddCoeffs( dif, r.coefficients, -1 );
        fi;

        # return the difference
        dif := RationalsOps.FastPolynomial( Rationals, dif, val );
        dif.depth := 1;
        return dif;
    fi;

end;


#############################################################################
##
#F  RationalsPolynomialOps.\*  . . . . . . . . .  product of two polynomials
##
RationalsPolynomialOps.\* := function( l, r )
    local   R,  prd,  val;

    # handle the case that one argument is a list
    if IsList(l)  then
        return List( l, x -> x*r );
    elif IsList(r)  then
        return List( r, x -> l*x );

    # handle the case <scalar> * <polynomial>
    elif not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then

        # <r> must have the rationals as base ring
        if Rationals <> r.baseRing  then
            Error( "<r> must have the rationals as base ring" );
        fi;

        # <l> must lie in the base ring of <r>
        if not IsRat(l)  then
            Error( "<l> must lie in the base ring of <r>" );
        fi;

        # compute the product
        if l = 0 or r.coefficients = []  then
            prd := [];
            val := 0;
        else
            prd := l * r.coefficients;
            val := r.valuation;
        fi;
        prd            := RationalsOps.FastPolynomial( Rationals, prd, val );
        prd.depth      := 1;
        prd.groundRing := Rationals;

        # and return
        return prd;

    # handle the case <polynomial> * <scalar>
    elif not (IsRec(r) and IsBound(r.isPolynomial) and r.isPolynomial)  then

        # <l> must have the rationals as base ring
        if Rationals <> l.baseRing  then
            Error( "<l> must have the rationals as base ring" );
        fi;

        # <r> must lie in the base ring of <r>
        if not IsRat(r)  then
            Error( "<r> must lie in the base ring of <l>" );
        fi;

        # compute the product
        if r = l.baseRing.zero or l.coefficients = []  then
            prd := [];
            val := 0;
        else
            prd := l.coefficients * r;
            val := l.valuation;
        fi;
        prd            := RationalsOps.FastPolynomial( Rationals, prd, val );
        prd.depth      := 1;
        prd.groundRing := Rationals;

        # and return
        return prd;
    fi;

    # our superclass will handle different depth
    if not IsBound(l.depth)  then  l.operations.Depth(l);  fi;
    if not IsBound(r.depth)  then  r.operations.Depth(r);  fi;
    if 1 <> l.depth or 1 <> r.depth  then
        return PolynomialOps.\*( l, r );

    # give up if we have rings other then the rationals
    elif Rationals <> l.baseRing  then
        Error( "<l> must have the rationals as base ring" );
    elif Rationals <> r.baseRing  then
        Error( "<r> must have the rationals as base ring" );

    # if <l> is the null polynomial return <l>
    elif Length(l.coefficients) = 0  then
        return l;

    # if <r> is the null polynomial return <r>
    elif Length(r.coefficients) = 0  then
        return r;

    # multiply two polynomials
    else

        # get a common ring
        R := l.baseRing;

        # use 'ProductCoeffs' in order to fold product
        prd := ProductCoeffs( l.coefficients, r.coefficients );
        val := l.valuation + r.valuation;

        # compute the product
        prd            := R.operations.FastPolynomial( R, prd, val );
        prd.depth      := 1;
        prd.groundRing := Rationals;

        # and return
        return prd;
    fi;

end;


#############################################################################
##
#F  RationalsPolynomialOps.\mod  . . . . . . .  remainder of two polynomials
##
RationalsPolynomialOps.\mod := function( l, r )
    local   R,  rem,  val,  vdf;

    # <l> must be a polynomial
    if not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then
        Error( "<l> must be a polynomial" );
    fi;

    # if <r> is a integer reduce the coefficients of <l>
    if IsInt(r)  then
        rem := Copy(l.coefficients);
        ReduceCoeffsMod( rem, r );
        return RationalsOps.FastPolynomial( l.baseRing, rem, l.valuation );
    fi;


    # otherwise <r> must be a non-zero polynomial
    if not (IsRec(r) and IsBound(r.isPolynomial) and r.isPolynomial)  then
        Error( "<r> must be a polynomial" );
    fi;
    if Length(r.coefficients) = 0  then
        Error( "<r> must be non zero" );
    fi;

    # our superclass will handle different depth
    if not IsBound(l.depth)  then  l.operations.Depth(l);  fi;
    if not IsBound(r.depth)  then  r.operations.Depth(r);  fi;
    if 1 <> l.depth or 1 <> r.depth  then
        return PolynomialOps.\mod( l, r );

    # give up if we have different rings
    elif l.baseRing <> r.baseRing  then
        Error( "polynomials must have the same ring" ); 

    # reduce the polynomial <l> by <r>
    else

        # if one is a Laurent polynomial use 'EuclideanRemainder'
        if l.valuation < 0 or r.valuation < 0  then
            return EuclideanRemainder( DefaultRing(l,r), l, r );
        fi;

        # get a common ring and the value difference
        R   := l.baseRing;
        vdf := r.valuation - l.valuation;

        # if <r>.valuation is the minimum shift <l>
        if r.valuation < l.valuation  then
            val := r.valuation;
            rem := ShiftedCoeffs( l.coefficients, -vdf );
            ReduceCoeffs( rem, r.coefficients );

        # if <l>.valuation is the minimum shift <r>
        elif l.valuation < r.valuation  then
            r   := ShiftedCoeffs( r.coefficients, vdf );
            rem := RemainderCoeffs( l.coefficients, r );
            val := l.valuation;

        # otherwise they are equal
        else
            rem := RemainderCoeffs( l.coefficients, r.coefficients );
            val := l.valuation;
        fi;

        # return the remainder
        rem := R.operations.FastPolynomial( R, rem, val );
        rem.depth := 1;
        return rem;
    fi;
end;


#############################################################################
##
#F  RationalsPolynomialOps.\^  . . . . . . . . . . .  power of a polynomials
##
RationalsPolynomialOps.\^ := function( l, r )
    local   R,  pow, val;

    # <l> must be a polynomial over the rationals and <r> an integer
    if not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then
        Error( "<l> must be a polynomial" );
    elif l.baseRing <> Rationals  then
        Error( "<l> must be a polynomial over the rationals" );
    fi;
    if not IsInt(r)  then
        Error( "<r> must be an integer" );
    fi;

    # invert <l> if necessary
    if r < 0  then
        R := LaurentPolynomialRing( l.baseRing );
        l := R.operations.Quotient( R, R.one, l );
        r := -r;
    fi;

    # if <r> is zero, return x^0
    if r = 0  then
        return RationalsOps.FastPolynomial( Rationals, [Rationals.one], 0 );

    # if <r> is one return <l>
    elif r = 1  then
        return l;

    # if <l> is trivial return
    elif Length(l.coefficients) = 0  then
        return l;

    # if <l> is of degree less than 2, return
    elif Length(l.coefficients) = 1  then
        return RationalsOps.FastPolynomial(
                   Rationals,
                   [l.coefficients[1]^r],
                   l.valuation*r );
    fi;

    # use repeated squaring
    val := l.valuation * r;
    pow := [ l.baseRing.one ];
    l   := l.coefficients;
    while 0 < r  do
        if r mod 2 = 1  then
            pow := ProductCoeffs( pow, l );
            r   := r - 1;
        fi; 
        if 1 < r  then
            l := ProductCoeffs( l, l );
            r := r / 2;
        fi;
    od;

    # return the power
    return RationalsOps.FastPolynomial( Rationals, pow, val );

end;


#############################################################################
##
#F  RationalsPolynomialOps.String( <f> )  . . . . . construct a pretty string
##
RationalsPolynomialOps.String := function( f )
    local   x,  i,  d,  v,  s,  l;

    # find a name for the indeterminate
    x := Indeterminate(f.baseRing);
    if IsBound(x.name)  then x := x.name;  else x := "x";  fi;

    # run through the coefficients of <f>
    v := f.valuation-1;
    l := Length(f.coefficients);
    for i  in Reversed([ 1 .. l ])  do
        d := f.coefficients[i];
        if 0 <> d  then
            if i = l and d = 1 and i+v <> 0  then
                s := "";
            elif i = l and d = 1  then
                s := "1";
            elif i = l and d = -1 and i+v <> 0  then
                s := "-";
            elif i = l and d = -1  then
                s := "-1";
            elif i = l  then
                s := String(d);
            elif d = 1 and i+v <> 0  then
                s := ConcatenationString( s, "+" );
            elif d = 1  then
                s := ConcatenationString( s, "+1" );
            elif d = -1 and i+v <> 0  then
                s := ConcatenationString( s, "-" );
            elif d = -1  then
                s := ConcatenationString( s, "-1" );
            elif d < 0  then
                s := ConcatenationString( s, String(d) );
            elif 0 < d  then
                s := ConcatenationString( s, "+", String(d) );
            else
                Error( "internal error in 'RationalsPolynomialOps.String'" );
            fi;
            if i+v < 0 or 1 < i+v then
                s := ConcatenationString( s, x, "^", String(i+v) );
            elif i+v = 1  then
                s := ConcatenationString( s, x );
            fi;
        fi;
    od;

    # catch a special case
    if l = 0  then s := "0";  fi;
    return s;

end;



#############################################################################
##

#V  RationalsPolynomials  . . . . .  domain of polynomials over the rationals
##
RationalsPolynomials             := Copy( Polynomials );
RationalsPolynomials.name        := "RationalsPolynomials";
RationalsPolynomials.operations  := Copy( FieldPolynomialRingOps );
RationalsPolynomialsOps          := RationalsPolynomials.operations;

# show that this a polynomial ring
RationalsPolynomials.isPolynomialRing := true;

# rationals polynomials form a ring
RationalsPolynomials.isDomain := true;
RationalsPolynomials.isRing   := true;

# set known properties
RationalsPolynomials.isFinite := false;
RationalsPolynomials.size     := "infinity";

# add properties of polynom ring over a field
RationalsPolynomials.isCommutativeRing         := true;
RationalsPolynomials.isIntegralRing            := true;
RationalsPolynomials.isUniqueFactorizationRing := true;
RationalsPolynomials.isEuclideanRing           := true;

# set one, zero and base ring
RationalsPolynomials.one  := Polynomial( Rationals, [1] );
RationalsPolynomials.zero := Polynomial( Rationals, [] );
RationalsPolynomials.baseRing := Rationals;


#############################################################################
##
#F  RationalsPolynomialsOps.\= . . . . . . . . . . . . . . . . equaltity test
##
RationalsPolynomialsOps.\= := function( R, S )
    
    # both rings must be full polynomial rings
    if not IsPolynomialRing(R) or not IsPolynomialRing(S)  then
        return RingOps.\=( S, R );
        
    # compare the base rings in this case
    else
        return R.baseRing = S.baseRing;
    fi;
    
end;


#############################################################################
##
#F  RationalsPolynomialsOps.\in  . . . . . . . . . . . . . .  membership test
##
RationalsPolynomialsOps.\in := function( p, RationalsPolynomials )
    return     IsRec( p )
           and IsBound( p.isPolynomial )
           and p.isPolynomial
           and IsField( p.baseRing )
           and 0 <= p.valuation
           and p.baseRing = Rationals;
end;


#############################################################################
##
#F  RationalsPolynomialsOps.DefaultRing( <L> )  . . . . . . . .  default ring
##
RationalsPolynomialsOps.DefaultRing := PolynomialsOps.DefaultRing;


#############################################################################
##
#F  RationalsPolynomialsOps.PowerMod( <R>, <g>, <e>, <m> )  . . . . . . power
##
RationalsPolynomialsOps.PowerMod := function( R, g, e, m )
    local   pow;

    # if <m> is of degree zero return the zero polynomial
    if Degree(m) = 0  then
        return R.zero;

    # if <e> is zero return one
    elif e = 0  then
        return R.one;
    fi;

    # reduce polynomial
    g := R.operations.EuclideanRemainder( R, g, m );

    # and invert if necessary
    if e < 0  then
        g := R.operations.QuotientMod( R, R.one, g, m );
        if g = false  then
            Error( "<g> must be invertable module <m>" );
        fi;
        e := -e;
    fi;

    # remove valuation
    g := ShiftedCoeffs( g.coefficients, g.valuation );
    m := ShiftedCoeffs( m.coefficients, m.valuation );

    # use 'PowerModCoeffs' to power polynomial
    pow := PowerModCoeffs( g, e, m );
    pow := R.baseRing.operations.FastPolynomial( R.baseRing, pow, 0 );
    return pow;

end;


#############################################################################
##
#F  RationalsPolynomialsOps.IntegerPolynomial( <R>, <f> ) . . . . convert <f>
##
RationalsPolynomialsOps.IntegerPolynomial := function( R, f )
    local   lcm,  c;

    # compute lcm of denominator
    lcm := 1;
    for c  in f.coefficients  do
        lcm := LcmInt( lcm, Denominator(c) );
    od;

    # remove all denominators
    f := f * lcm;

    # remove gcd of coefficients
    return f * (1/Gcd(f.coefficients));

end;


#############################################################################
##
#F  RationalsPolynomialsOps.EuclideanRemainder( <R>, <f>, <g> ) . . . . . rem
##
RationalsPolynomialsOps.EuclideanRemainder := function( R, f, g )
    return f mod g;
end;


#############################################################################
##
#F  BeauzamyBoundGcd(<f>,<g>) . . . . . Beauzamy's Bound for Gcd Coefficients
##
##  cf. JSC 13 (1992), 463-472
##
BeauzamyBoundGcd := function( f, g )
    local   n,  A,  B;

    n := Degree(f);
    # the   strange   number  in   the   next line  is   an  (upper) rational
    # approximation for 3^{3/4}/2/\sqrt(\pi)
    A := Int( 643038/1000000
              * ApproximateRoot(3^n,2)/ApproximateRoot(n,2)
              * BombieriNorm(f/LeadingCoefficient(f)) )+1;

    # the   strange  number   in  the   next   line is  an   (upper) rational
    # approximation for 3^{3/4}/2/\sqrt(\pi)
    n := Degree(g);
    B := Int( 643038/1000000
              * ApproximateRoot(3^n,2)/ApproximateRoot(n,2)
              * BombieriNorm(f/LeadingCoefficient(g)) )+1;
    return GcdInt( LeadingCoefficient(f), LeadingCoefficient(g) )
           * Minimum( A, B );

end;


#############################################################################
##
#F  RationalsPolynomialsOps.GcdModPrime(<R>,<f>,<g>,<p>,<a>)  . . gcd mod <p>
##
RationalsPolynomialsOps.GcdModPrime := function( R, f, g, p, a )
    local   gcd,  u,  v,  w,  val,  r,  s,  e;
    
    # compute in the finite field F_<p>
    val := Minimum( f.valuation,  g.valuation );
    s   := ShiftedCoeffs( f.coefficients, f.valuation-val );
    r   := ShiftedCoeffs( g.coefficients, g.valuation-val );
    ReduceCoeffsMod( s, p );  ShrinkCoeffs(s);
    ReduceCoeffsMod( r, p );  ShrinkCoeffs(r);
    
    # compute the gcd
    u := r;
    v := s;
    while 0 < Length(v)  do
        w := v;
        ReduceCoeffsMod( u, v, p );
        ShrinkCoeffs(u);
        v := u;
        u := w;
    od;
    gcd := u * (a/u[Length(u)]);
    ReduceCoeffsMod( gcd, p );

    # and return the polynomial
    return RationalsOps.FastPolynomial( R.baseRing, gcd, val );

end;


#############################################################################
##
#F  RationalsPolynomialsOps.Gcd( <R>, <f>, <g> )  . . . . gcd of <f> and <g>
##
RationalsPolynomialsOps.Gcd := function( R, f, g )

    # check trivial cases
    if -1 = Degree(f)  then
        return g;
    elif -1 = Degree(g)  then
        return f;
    elif 0 = Degree(f) or 0 = Degree(g)  then
        return R.one;
    fi;

    # convert polynomials into integer polynomials
    f := R.operations.IntegerPolynomial( R, f );
    g := R.operations.IntegerPolynomial( R, g );
    InfoPoly2( "#I  <f> = ", f, "\n" );
    InfoPoly2( "#I  <g> = ", g, "\n" );

    # return the standard associate
    return StandardAssociate( R, R.operations.IGcd( R, f, g ) );

end;

RationalsPolynomialsOps.IGcd := function( R, f, g )
    local   a,  t;

    # compute the Beauzamy bound for the gcd
    t := rec( prime := 1000 );
    t.bound := 2 * Int(BeauzamyBoundGcd(f,g)+1);
    InfoPoly2( "#I  Beauzamy bound = ", t.bound/2, "\n" );

    # avoid gcd of leading coefficients
    a := GcdInt( LeadingCoefficient(f), LeadingCoefficient(g) );
    repeat

        # start with first prime avoiding gcd of leading coefficients
        repeat t.prime := NextPrimeInt(t.prime);  until a mod t.prime <> 0;

        # compute modular gcd with leading coefficient <a>
        t.gcd := RationalsPolynomialsOps.GcdModPrime( R, f, g, t.prime, a );
        InfoPoly2( "#I  gcd mod ", t.prime, " = ", t.gcd, "\n" );

        # loop until we have success
        repeat
            if 0 = Degree(t.gcd)  then
                InfoPoly2( "#I  <f> and <g> are relative prime\n" );
                return R.one;
            fi;
        until RationalsPolynomialsOps.Gcd1( R, t, a, f, g );
    until t.correct;

    # return the gcd
    return t.gcd;

end;

RationalsPolynomialsOps.Gcd1 := function( R, t, a, f, g )
    local   G,  P,  l,  m,  i;

    # <P> will hold the product of primes use so far
    t.modulo := t.prime;

    # <G> will hold the approximation of the gcd
    G := t.gcd;

    # use next prime until we reach the Beauzamy bound
    while t.modulo < t.bound  do
        repeat t.prime := NextPrimeInt(t.prime);  until a mod t.prime <> 0;

        # compute modular gcd
        t.gcd := RationalsPolynomialsOps.GcdModPrime( R, f, g, t.prime, a );
        InfoPoly2( "#I  gcd mod ", t.prime, " = ", t.gcd, "\n" );

        # if the degree of <C> is smaller we started with wrong <p>
        if Degree(t.gcd) < Degree(G)  then
            InfoPoly2( "#I  found lower degree, restarting\n" );
            return false;
        fi;

        # if the degrees of <C> and <G> are equal use chinese remainder
        if Degree(t.gcd) = Degree(G)  then
            P := G;
            G := RationalsPolynomialsOps.GcdCRT(G,t.modulo,t.gcd,t.prime);
            t.modulo := t.modulo * t.prime;
            InfoPoly2( "#I  gcd mod ", t.modulo, " = ", G, "\n" );
            if G = P  then
                t.correct :=     Quotient(R,f,G)<>false
                             and Quotient(R,g,G)<>false;
                if t.correct  then
                    InfoPoly2( "#I  found correct gcd\n" );
                    t.gcd := G;
                    return true;
                fi;
            fi;
        fi;
    od;

    # get <G> into the -<t.modulo>/2 to +<t.modulo> range
    l := [];
    m := t.modulo/2;
    for i  in [ 1 .. Length(G.coefficients) ]  do
        if m < G.coefficients[i]  then
            l[i] := G.coefficients[i] - t.modulo;
        else
            l[i] := G.coefficients[i];
        fi;
    od;
    G := RationalsOps.FastPolynomial( G.baseRing, l, G.valuation );
    InfoPoly2( "#I  gcd mod ", t.modulo, " = ", G, "\n" );

    # check if <G> is correct but return 'true' in any case
    t.correct := Quotient(R,f,G) <> false and Quotient(R,g,G) <> false;
    t.gcd := G;
    return true;

end;

RationalsPolynomialsOps.GcdCRT := function( f, p, g, q )
    local   min,  cf,  lf,  cg,  lg,  i,  P,  m,  r;

    # remove valuation
    min := Minimum( f.valuation, g.valuation );
    if f.valuation <> min  then 
        cf := ShiftedCoeffs( f.coefficients, f.valuation - min );
    else
        cf := ShallowCopy(f.coefficients);
    fi;
    lf := Length(cf);
    if g.valuation <> min  then 
        cg := ShiftedCoeffs( g.coefficients, g.valuation - min );
    else
        cg := ShallowCopy(g.coefficients);
    fi;
    lg := Length(cg);

    # use chinese remainder
    r := [ p, q ];
    P := p * q;
    m := P/2;
    for i  in [ 1 .. Minimum(lf,lg) ]  do
        cf[i] := ChineseRem( r, [ cf[i], cg[i] ] );
        if m < cf[i]  then cf[i] := cf[i] - P;  fi;
    od;
    if lf < lg  then
        for i  in [ lf+1 .. lg ]  do
            cf[i] := ChineseRem( r, [ 0, cg[i] ] );
            if m < cf[i]  then cf[i] := cf[i] - P;  fi;
        od;
    elif lg < lf  then
        for i  in [ lg+1 .. lf ]  do
            cf[i] := ChineseRem( r, [ cf[i], 0 ] );
            if m < cf[i]  then cf[i] := cf[i] - P;  fi;
        od;
    fi;

    # return the polynomial
    return RationalsOps.FastPolynomial( f.baseRing, cf, min );

end;


#############################################################################
##

#F  RationalsPolynomialsOps.QuotientModPrime(<R>,<f>,<g>,<p>) . . .  quotient
##
RationalsPolynomialsOps.QuotientModPrime := function( R, f, g, p )
    local   m,  n,  i,  k,  c,  q,  R,  val;

    # get base ring
    R := R.baseRing;

    # reduce <f> and <g> mod <p>
    f := f mod p;
    g := g mod p;

    # if <f> is zero return it
    if 0 = Length(f.coefficients)  then
        return f;
    fi;

    # check the value of the valuation of <f> and <g>
    if f.valuation < g.valuation  then
        return false;
    fi;
    val := f.valuation - g.valuation;

    # Try to divide <f> by <g>, compute mod <p>
    q := [];
    n := Length( g.coefficients );
    m := Length( f.coefficients ) - n;
    f := ShallowCopy( f.coefficients );
    for i  in [ 0 .. m ]  do
        c := f[m-i+n] / g.coefficients[n] mod p;
        for k  in [ 1 .. n ]  do
            f[m-i+k] := ( f[m-i+k] - c * g.coefficients[k] ) mod p;
        od;
        q[m-i+1] := c;
    od;

    # Did the division work?
    for i  in [ 1 .. m+n ]  do
        if f[i] <> R.zero  then
            return false;
        fi;
    od;
    return RationalsOps.FastPolynomial( R, q, val );

end;


#############################################################################
##
#F  RationalsPolynomialsOps.GcdRepresentationModPrime(<R>,<f>,<g>,<p>)  . gcd
##
RationalsPolynomialsOps.GcdRepresentationModPrime := function( R, f, g, p )

    local   val,            # the minimal valuation of <f> and <g>
            s,  sx,         # first line of gcd algorithm
            t,  tx,         # second line of gcd alogrithm
            h,  hx,         # temp for swapping lines
            q,              # quotient
            n, m, r, c,     # used in quotient
            i, k;           # loops

    # remove common x^i term
    val := Minimum( f.valuation, g.valuation );
    f   := ShiftedCoeffs( f.coefficients, f.valuation-val );
    g   := ShiftedCoeffs( g.coefficients, g.valuation-val );
    ReduceCoeffsMod( f, p );  ShrinkCoeffs(f);
    ReduceCoeffsMod( g, p );  ShrinkCoeffs(g);
    
    # compute the gcd and representation mod <p>
    s := ShallowCopy(f);  sx := [ R.baseRing.one ];
    t := ShallowCopy(g);  tx := [];
    while 0 < Length(t)  do
        InfoPoly3( "#I  <s> = ", s, ",  <sx> = ", sx, "\n",
                   "#I  <t> = ", t, ",  <tx> = ", tx, "\n" );

        # compute the euclidean quotient of <s> by <t>
        q := [];
        n := Length(t);
        m := Length(s) - n;
        r := ShallowCopy(s);
        for i  in [ 0 .. m ]  do
            c := r[m-i+n] / t[n] mod p;
            for k  in [ 1 .. n ]  do
                r[m-i+k] := ( r[m-i+k] - c * t[k] ) mod p;
            od;
            q[m-i+1] := c;
        od;
        InfoPoly3( "#I  <q> = ", q, "\n" );
        
        # update representation
        h  := t;
        hx := tx;
        t  := s;
        AddCoeffs( t, ProductCoeffs(q,h), -1 );
        ReduceCoeffsMod( t, p );
        ShrinkCoeffs(t);
        tx := sx;
        AddCoeffs( tx, ProductCoeffs(q,hx), -1 );
        ReduceCoeffsMod( tx, p );
        ShrinkCoeffs(tx);
        s  := h;         
        sx := hx;
    od;
    InfoPoly3( "#I  <s> = ", s, ",  <sx> = ", sx, "\n" );

    # compute conversion for standard associate
    q := (1/s[Length(s)]) mod p;
    
    # convert <s> and <x> back into polynomials
    if 0 = Length(g)  then
        sx := q * sx;
        ReduceCoeffsMod( sx, p );
        return [ R.baseRing.operations.FastPolynomial( R.baseRing, sx, 0 ),
                 R.zero ];
    else
        hx := q * sx;
        ReduceCoeffsMod( hx, p );
        hx := R.baseRing.operations.FastPolynomial( R.baseRing, hx, 0 );
        AddCoeffs( s, ProductCoeffs(sx,f), -1 );
        s := q * s;
        ReduceCoeffsMod( s, p );
        s := R.baseRing.operations.FastPolynomial( R.baseRing, s, 0 );
        g := R.baseRing.operations.FastPolynomial( R.baseRing, g, 0 );
        q := R.operations.QuotientModPrime( R, s, g, p );
        return [ hx, q ];
    fi;

end;


#############################################################################
##
#F  TryCombinations( <f>, ... )  . . . . . . . . . . . . . . . .  try factors
##
TryCombinations := function( f, lc, l, p, alldegs, bounds, split )

    local    p2,  res,  j,  i, comb, degs,  step,  c,  cnew,  sel,  deli,
             degf,  good,  act,  da,  prd,  cof,  q,  combi;

    # <res> contains the irr/reducible factors and the remaining ones
    res := rec( irreducibles := [],
                irrFactors   := [],
                reducibles   := [],
                redFactors   := [],
                remaining    := [ 1 .. Length(l) ] );

    # coefficients should be in -<p>/2 and <p>/2
    p2   := p/2;
    deli := List( l, Degree );

    # sel are the still selected indices
    sel := [ 1 .. Length(l) ];

    step := 0;
    act  := 1;
    repeat

        # factors of larger than half remaining degree we will find as
        # final cofactor
        degf := Degree(f);
        degs := Filtered( alldegs, i -> 2*i<=degf );

        if act in sel  then

            # search all combinations of Length step+1 containing the act-th
            # factor, that are allowed
            good := true;
            InfoPoly2("#I  trying length ",step+1," containing ",act,"\n");
            da := List( degs, i -> i-deli[act] );

            # as we have all combinations including < <act>, we can skip them
            cnew := Combinations( Filtered( sel, i -> i > act ), step );
            comb := Filtered( cnew, i -> Sum(deli{i}) in da );
            if 0 < Length(comb)  then
                comb := List( comb, i -> Union([act],i) );
                InfoPoly2( "#I  ", Length(comb), " combinations\n" );
                i := 1;
                while good and i<=Length(comb)  do

                    # try the combinations in <comb>[<i>]
                    combi := comb[i];

                    # make sure that the quotient has a chance, compute the
                    # extremal coefficient of the product:
                    q := ( ProductMod( List( l{combi},
                                             i -> i.coefficients[1] ),
                           p ) * lc ) mod p;
                    if p2 < q  then
                        q := q - p;
                    fi;

                    # As  we  don't  know  yet  the gcd  of  all the products
                    # coefficients (to make it  primitive), we do  a slightly
                    # weaker test:  (test of  leadinc   coeffs is  first   in
                    # 'TrialQuotient') this just should  reduce the number of
                    # 'ProductMod' neccessary.   the  absolute  part  of  the
                    # product must  divide  the absolute  part of  f  up to a
                    # divisor of <lc>
                    q := f.coefficients[1] / q * lc;
                    if not IsInt(q)  then
                        InfoPoly3( "#I  ignoring combination ", combi, "\n" );
                        q := false;
                    else
                        InfoPoly2( "#I  testing combination ", combi, "\n" );

                        # compute the product and reduce
                        prd := ProductMod( l{combi}, p );
                        cof := [];
                        for j  in [ 1 .. Length(prd.coefficients) ]  do
                            cof[j] := (lc*prd.coefficients[j]) mod p;
                            if p2 < cof[j]  then
                                cof[j] := cof[j] - p;
                            fi;
                        od;

                        # make the product primitive
                        cof := cof * (1/Gcd(cof));
                        prd := Polynomial( Rationals, cof, prd.valuation );
                        q := TrialQuotient( f, prd, bounds );
                    fi;

                    if q <> false  then
                        f := q;
                        InfoPoly2( "#I  found true factor of degree ",
                                   Degree(prd), "\n" );
                        if Length(combi)=1 or split  then
                            q := 0;
                        else
                            q := 2*lc*OneFactorBound(prd);
                            if q <= p  then
                                InfoPoly2( "#I  proven irreducible by ",
                                           "'OneFactorBound'\n" );
                            fi;
                        fi;

                        # for some reason, we know, the factor is irred.
                        if q <= p  then
                            Append( res.irreducibles, combi );
                            Add( res.irrFactors, prd );
                        else
                            Add( res.reducibles, combi );
                            Add( res.redFactors, prd );
                        fi;
                        SubtractSet( res.remaining, combi );
                        good := false;
                        SubtractSet( sel, combi );
                    fi;
                    i := i+1;
                od;
            fi;
            if 0 = Length(cnew)  then
                i := 0;
            else
                i := Minimum( List( cnew, i -> Sum(deli{i}) ) );
            fi;

            # we     can forget  about the  actual     factor, as any  longer
            # combination is too big
            if deli[act]+i >= Maximum(degs)  then
                InfoPoly2( "#I  factor ",act," can be further neglected\n" );
                sel := Difference( sel, [act] );
            fi;
        fi;

        # consider next factor
        act := act + 1;
        if 0 < Length(sel) and act>Maximum(sel)  then
            step := step+1;
            act  := sel[1];
        fi;

    # until nothing is left
    until 0 = Length(sel) or Length(sel)<step;

    # if <split> is true we *must* find a complete factorization. 
    if split and 0 < Length(res.remaining) and f<>f^0  then

        # the remaining f must be an irreducible factor, larger than deg/2
        Append( res.irreducibles, res.remaining );
        res.remaining := [];
        Add( res.irrFactors, f );
    fi;
  
    # return the result
    return res;

end;


#############################################################################
##
#F  RationalsPolynomialsOps.SquareHensel( <R>, <f>, <t> )
##
RationalsPolynomialsOps.SquareHensel := function( R, f, t )

    local   p,              # prime
            q,              # current modulus
            q1,             # last modulus
            l,              # factorization mod <q>
            lc,             # leading coefficient of <f>
            bounds,         # Bounds for Factor Coefficients
            ofb,            # OneFactorBound
            k,              # Lift boundary
            prd,            # product of <l>
            rep,            # lifted representation of gcd(<lp>)
            fcn,            # index of true factor in <l>
            dis,            # distance of <f> and <l>
            cor,            # correction
            rcr,            # inverse corrections
            quo,            # quotient
            sum,            # temp
            aa,  bb,        # left and right subproducts
            lq1,            # factors mod <q1>
            max,            # maximum absolute coefficient of <f>
            res,            # result
            gcd,            # used in gcd representation
            i,  j,  x;      # loop

    # get <l> and <p>
    l := t.factors;
    p := t.prime;

    # get the leading coefficient of <f>
    lc := LeadingCoefficient(f);
    
    # and maximal coefficient
    max := Maximum( List( f.coefficients, AbsInt ) );

    # compute the factor coefficient bounds
    ofb := 2*AbsInt(lc)*OneFactorBound(f);
    InfoPoly2( "#I  One factor bound = ", ofb, "\n" );
    bounds := 2*AbsInt(lc)*HenselBound(f);
    k := bounds[Maximum(Filtered(t.degrees, i-> 2*i<=Degree(f)))];
    InfoPoly2( "#I  Hensel bound = ", k, "\n" );

    # compute a representation of the 1 mod <p>
    InfoPoly2( "#I  computing gcd representation: ", Runtime(), "\n" );
    prd := ( 1/lc * f ) mod p;
    gcd := R.operations.QuotientModPrime( R, prd, l[1], p );
    rep := [ R.one ];
    for i  in [ 2 .. Length(l) ]  do
        dis := R.operations.QuotientModPrime( R, prd, l[i], p );
        cor := R.operations.GcdRepresentationModPrime( R, gcd, dis, p );
        gcd := ( cor[1] * gcd + cor[2] * dis ) mod p;
        rep := List( rep, z -> z * cor[1] mod p );
        Add( rep, cor[2] );
    od;
    InfoPoly2( "#I  representation computed:      ", Runtime(), "\n" );

    # <res> will hold our result
    res := rec( irrFactors := [],  redFactors := [],  remaining := [],
                bounds := bounds );
    
    # start Hensel until <q> is greater than k
    q   := p^2;
    q1  := p;
    while q1 < k  do
        InfoPoly2( "#I  computing mod ", q, "\n" );

        for i in [ 1 .. Length(l) ]  do
            dis := Polynomial( f.baseRing,
                       APolyMod( List( f.coefficients, i->i/lc mod q ),
                                 l[i].coefficients, q ) );
            l[i] := l[i] + BPolyProd( rep[i], dis, l[i], q );
        od;

        # if this is not the last step update <rep> and check for factors
        if q < k  then

            # correct the inverses
            for i  in [ 1 .. Length(l) ]  do
                if Length(l)=1 then
                    dis := l[1]^0;
                else
                    dis := X(l[1].baseRing)^0;
                    for j in  Difference( [1..Length(l)], [i] )  do
                        dis := BPolyProd( dis, l[j], l[i], q );
                    od;
                fi;
                rep[i] := BPolyProd( rep[i],
                                     ( 2-APolyProd( rep[i], dis, q ) ),
                                     l[i],
                                     q );
            od;

            # try to find true factors
            if max <= q or ofb < q  then 
                InfoPoly2( "#I  searching for factors: ", Runtime(), "\n" );
                fcn := TryCombinations( f, lc, l, q, t.degrees, bounds,
                                        false );
                InfoPoly2( "#I  finishing search:      ", Runtime(), "\n" );
            else
                fcn := rec( irreducibles := [],  reducibles := [] );
            fi;

            # if we have found a true factor update everything
            if 0 < Length(fcn.irreducibles)+Length(fcn.reducibles)  then
                # append irreducible factors to <res>.irrFactors
                Append( res.irrFactors, fcn.irrFactors );
                
                # append reducible factors to <res>.redFactors
                Append( res.redFactors, fcn.redFactors );

                # compute new <f>
                prd := Product(fcn.redFactors) * Product(fcn.irrFactors);
                f   := Quotient( R, f, prd );
                lc  := LeadingCoefficient(f);
                ofb := 2*AbsInt(lc)*OneFactorBound(f);
                InfoPoly2( "#I  new one factor bound = ", ofb, "\n" );

                # degree arguments or OFB arguments prove f irreducible
                if ForAll(t.degrees,i->i=0 or 2*i>=Degree(f)) or ofb<q  then
                    Add( fcn.irrFactors, f );
                    Add( res.irrFactors, f );
                    f := f^0;
                fi;
                
                # if <f> is trivial return
                if Degree(f) < 1  then
                    InfoPoly2( "#I  found non-trivial factorization\n" );
                    return res;
                fi;

                # compute the factor coefficient bounds
                k := HenselBound(f);
                bounds := List( [ 1 .. Length(k) ],
                                i -> Minimum(bounds[i],k[i]) );
                 k := 2 * AbsInt(lc) 
                       * bounds[Maximum(Filtered(t.degrees,
                                                 i-> 2*i<=Degree(f)))];
                InfoPoly2( "#I  new Hensel bound = ", k, "\n" );

                # remove true factors from <l> and corresponding <rep>
                prd := (1/LeadingCoefficient(prd)) * prd mod q;
                l   := l{fcn.remaining};
                rep := List( rep{fcn.remaining}, x -> prd * x );

                # reduce <rep>[i] mod <l>[i]
                for i  in [ 1 .. Length(l) ]  do
                    rep[i] := rep[i] mod l[i] mod q;
                od;

            # if there was a factor, we ought to have found it
            elif ofb < q  then 
                Add(res.irrFactors,f);
                InfoPoly2( "#I  f irreducible, since one factor would ",
                           "have been found now\n" );
                return res; 
            fi;
        fi;

        # square modulus
        q1 := q;
        q  := q^2;

        # avoid a modulus too big
        if q > k  then
            q := p^(LogInt(k,p)+1);
        fi;
    od;
    
    # return the remaining polynomials
    res.remPolynomial := f;
    res.remaining     := l;
    res.primePower    := q1;
    res.lc            := lc;
    return res;

end;


#############################################################################
##
#F  RationalsPolynomialsOps.FactorsSquarefree( <R>, <f> ) . .  factors of <f>
##
##  <f> must be square free and must have a constant term.
##
RationalsPolynomialsOps.FactorsSquarefree := function( R, f )
    local   t,  h,  fac,  g,  tmp;

    # find a suitable prime, if <f> is irreducible return
    t := R.operations.FactorsModPrime( R, f );
    if t.isIrreducible  then return [f];  fi;
    InfoPoly2( "#I  using prime ", t.prime, " for factorization\n" );

    # for easy combining, we want large degree factors first
    Sort( t.factors, function(a,b) return Degree(a) > Degree(b); end );

    # start Hensel
    h := R.operations.SquareHensel( R, f, t );
    
    # combine remaining factors
    fac := [];
    
    # first the factors found by hensel
    if 0 < Length(h.remaining)  then
        InfoPoly2("#I  found ", Length(h.remaining), " remaining terms\n");
        tmp := TryCombinations(
                       h.remPolynomial,
                       h.lc,
                       h.remaining,
                       h.primePower,
                       t.degrees,
                       h.bounds,
                       true );
        Append( fac, tmp.irrFactors );
        Append( fac, tmp.redFactors );
    fi;
    
    # append the irreducible ones
    if 0 < Length(h.irrFactors)  then
        InfoPoly2("#I  found ", Length(h.irrFactors), " irreducibles\n");
        Append( fac, h.irrFactors );
    fi;
    
    # and try to factorize the (possible) reducible ones
    if 0 < Length(h.redFactors)  then
        InfoPoly2("#I  found ", Length(h.redFactors), " reducibles\n");
        for g  in h.redFactors  do
            Append( fac, R.operations.FactorsSquarefree(R,g) );
        od;
    fi;
    
    # and return
    return fac;
    
end;


#############################################################################
##
#F  RationalsPolynomialsOps.IFactors( <R>, <f> )  . . . . . .  factors of <f>
##
RationalsPolynomialsOps.IFactors := function( R, f )
    local   l,  v,  g,  q,  s,  r,  x,shift;

    # if <f> is trivial return
    InfoPoly2( "#I  starting integer factorization: ", Runtime(), "\n" );
    if 0 = Length( f.coefficients )  then
        InfoPoly2( "#I  <f> is trivial\n" );
        return [ f ];
    fi;

    # remove a valuation
    v := f.valuation;
    f := Polynomial( R.baseRing, f.coefficients );
    x := Indeterminate(R.baseRing);

    # if <f> is constant return
    if 0 = Degree(f)  then
        InfoPoly2( "#I  <f> is a power of x\n" );
        s    := List( [ 1 .. v ], f -> x );
        s[1] := s[1] * f.coefficients[1];
        return s;
    fi;

    # if <f> linear return
    if 1 = Degree(f)  then
        InfoPoly2( "#I  <f> is a linear\n" );
        s := List( [ 1 .. v ], f -> x );
        Add( s, f );
        return s;
    fi;

    # shift the zeros of f if appropriate
    if Degree(f) > 20  then
        g := MinimizeBombieriNorm(f);
        f := g[1];
        shift := -g[2];
    else
        shift := 0;
    fi;

    # make <f> integral, primitive and square free
    g := Gcd( R, f, Derivative(f) );
    q := R.operations.IntegerPolynomial( R, Quotient( R, f, g ) );
    q := q * SignInt(LeadingCoefficient(q));
    InfoPoly3( "#I  factorizing polynomial of degree ", Degree(q), "\n" );

    # and factorize <q>
    if Degree(q) < 2  then
        InfoPoly2( "#I  <f> is a linear power\n" );
        s := [ q ];
    else

	# treat zeroes
	if q.valuation>0 then 
	  s:=[X(q.baseRing)];
	  q:=q/(X(q.baseRing));
        else
	  s:=[];
        fi;
        s:=Concatenation(s,R.operations.FactorsSquarefree( R, q ));

    fi;

    # find factors of <g>
    for r  in s  do
        if 0 < Degree(g) and Degree(g) >= Degree(r)  then
            q := Quotient( R, g, r );
            while 0 < Degree(g) and q <> false  do
                Add( s, r );
                g := q;
                if Degree(g) >= Degree(r)   then
                    q := Quotient( R, g, r );
                else
                   q := false;
                fi;
            od;
        fi;
    od;

    # reshift
    if shift<>0 then
      InfoPoly2("#I shifting zeros back\n");
      Apply(s,i->Value(i,x+shift));
    fi;

    # sort the factors
    Append( s, List( [ 1 .. v ],  f -> x ) );
    Sort(s);

    # return the (primitive) factors
    return s;

end;


#############################################################################
##
#F  RationalsPolynomialsOps.FactorsModPrime( <R>, <f> )   find suitable prime
##
##  <f> must be squarefree.  We test 3 "small" and 2 "big" primes.
##
RationalsPolynomialsOps.FactorsModPrime := function( R, f )

    local   i, j,       # loops
            lc,         # leading coefficient of <f>
            p,          # current prime
            PR,         # polynomial ring over F_<p>
            fp,         # <f> in <R>
            lp,         # factors of <fp>
            min,        # minimal number of factors so far
            P,          # best prime so far
            LP,         # factorization of <f> mod <P>
            deg,        # possible degrees of factors
            t,          # return record
            tab,        # integer table of GF(<P>)
            log,        # zech log of finite field element
            cof,        # new coefficients
            tmp;

    # set minimal number of factors to the degree of <f>
    min := Degree(f)+1;
    lc  := LeadingCoefficient(f);

    # find a suitable prime
    t := rec();
    p := 1;
    for i  in [ 1 .. 5 ]  do

        # reset <p> to big prime after first 3 test
        if i = 4  then p := Maximum( p, 1000 );  fi;

        # find a prime not dividing <lc> and <f>_<p> squarefree
        repeat
            repeat
                p  := NextPrimeInt(p);
            until lc mod p <> 0 and f.coefficients[1] mod p <> 0;
            PR  := PolynomialRing(GF(p));
            tmp := 1/lc mod p;
            fp  := PR.baseRing.operations.FastPolynomial(
                     PR.baseRing,
                     List(f.coefficients,x->(tmp*x mod p)*PR.baseRing.one),
                     f.valuation );
        until 0 = Degree(Gcd(fp,Derivative(fp)));

        # factorise <f> modulo <p>
        InfoPoly2( "#I  starting factorization mod p:  ", Runtime(), "\n" );
        lp := PR.operations.Factors( PR, fp );
        InfoPoly2( "#I  finishing factorization mod p: ", Runtime(), "\n" );

        # if <fp> is irreducible so is <f>
        if 1 = Length(lp)  then
            InfoPoly2( "#I  <f> mod ", p, " is irreducible\n" );
            t.isIrreducible := true;
            return t;
        else
            InfoPoly2( "#I  found ", Length(lp), " factors mod ", p,
                       " of degree ", List(lp,Degree), "\n" );
        fi;

        # choose a maximal prime with minimal number of factors
        if Length(lp) <= min  then
            min := Length(lp);
            P   := p;
            LP  := lp;
        fi;

        # compute the possible degrees
        tmp := Set( List( Combinations( List(lp,Degree) ), g -> Sum(g) ) );
        if 1 = i  then
            deg := tmp;
        else
            deg := Intersection( deg, tmp );
        fi;

        # if there is only one possible degree != 0 then <f> is irreducible
        if 2 = Length(deg)  then
            InfoPoly2("#I  <f> must be irreducible, only one degree left\n");
            t.isIrreducible := true;
            return t;
        fi;
        
    od;

    # convert factors <LP> back to the integers
    for i  in [ 1 .. Length(LP) ]  do
        cof := IntVecFFE(LP[i].coefficients);
        LP[i] := RationalsOps.FastPolynomial(
                         Rationals, cof, LP[i].valuation );
    od;
    
    # return the chosen prime
    InfoPoly2("#I  choosing prime ", P, " with ", Length(LP), " factors\n");
    InfoPoly2("#I  possible degrees: ", deg, "\n" );
    t.isIrreducible := false;
    t.prime         := P;
    t.factors       := LP;
    t.degrees       := deg;
    return t;

end;


#############################################################################
##
#F  RationalsPolynomialsOps.Factors( <R>, <f> ) . . . . . . .  factors of <f>
##
RationalsPolynomialsOps.Factors := function ( R, f )
    local   r;

    # handle trivial case
    if Degree(f) < 2  then
        f.factors := [ f ];
    elif Length(f.coefficients) = 1  then
        r := List( [ 1 .. f.valuation ], x -> Indeterminate(f.baseRing) );
        r[1] := r[1] * f.coefficients[1];
        f.factors := r;
    fi;

    # do we know the factors
    if IsBound(f.factors) and R.baseRing = f.baseRing  then
        return f.factors;
    fi;

    # compute the integer factors
    r := R.operations.IFactors( R, R.operations.IntegerPolynomial(R,f) );

    # convert into standard associates and sort
    r := List( r, x -> StandardAssociate(R,x) );
    Sort(r);

    # correct leading term
    r[1] := LeadingCoefficient(f) * r[1];

    # and return
    if f.baseRing = R.baseRing  then
        f.factors := r;
    fi;
    return r;

end;

#############################################################################
##
#F  RationalsPolynomialOps.IsIrreducible( <pol> ) . . . . Irreducibility test
##
RationalsPolynomialOps.IsIrreducible:=function(f)
  return Length(Factors(f))=1;
end;

#############################################################################
##
#F  RationalsPolynomialsOps.IsIrreducible( <dom>, <pol> ) Irreducibility test
##
RationalsPolynomialsOps.IsIrreducible:=function(R,f)
  return f.operations.IsIrreducible(f);
end;
