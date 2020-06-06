#############################################################################
##
#A  ring.g                      GAP library                  Martin Schoenert
##
#A  @(#)$Id: ring.g,v 3.19.1.2 1995/08/03 09:35:07 ahulpke Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file  contains  those  functions  that  are  dispatcher  for  rings.
##
#H  $Log: ring.g,v $
#H  Revision 3.19.1.2  1995/08/03  09:35:07  ahulpke
#H  changed 'Copy(coeffs)' to 'ShallowCopy(coeffs)'
#H
#H  Revision 3.19.1.1  1994/08/22  06:57:28  fceller
#H  fixed 'units' in 'PolynomialRing'
#H
#H  Revision 3.19  1994/05/19  13:06:40  sam
#H  added 'RingOps.Module'
#H
#H  Revision 3.18  1994/02/16  14:42:09  fceller
#H  changed 'FastPolynomial' slightly
#H
#H  Revision 3.17  1994/02/02  10:13:33  sam
#H  moved 'AsRing' to 'dispatch.g'
#H
#H  Revision 3.16  1993/07/05  10:26:07  fceller
#H  added 'InterpolatedPolynomial'
#H
#H  Revision 3.15  1993/03/10  19:15:53  fceller
#H  added 'EuclideanQuotient', 'EuclideanRemainder' and 'QuotientRemainder'
#H
#H  Revision 3.14  1993/03/03  08:51:27  martin
#H  changed a '0' to 'R.zero' in 'GcdRepresentation'
#H
#H  Revision 3.13  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.12  1992/12/07  07:38:55  fceller
#H  replaced another 1,0 with R.one,R.zero
#H
#H  Revision 3.11  1992/11/16  12:23:47  fceller
#H  added Laurent polynomials
#H
#H  Revision 3.10  1992/08/13  13:11:09  fceller
#H  add 'Indeterminate'
#H
#H  Revision 3.9  1992/06/17  07:06:04  fceller
#H  moved '<somedomain>.operations.Polynomial' function to "<somedomain>.g"
#H
#H  Revision 3.8  1992/04/21  10:28:53  fceller
#H  changed '0' and '1' into 'R.zero' and 'R.one' in 'Gcd'
#H
#H  Revision 3.7  1992/04/05  15:04:04  martin
#H  improved 'RingOps.Units' to return a group, not a set
#H
#H  Revision 3.6  1992/04/05  14:57:27  martin
#H  added 'RingOps.Print'
#H
#H  Revision 3.5  1992/04/05  14:50:49  martin
#H  changed 'Ring' slightly
#H
#H  Revision 3.4  1992/04/05  14:16:44  martin
#H  added 'RingOps.Elements'
#H
#H  Revision 3.3  1992/02/06  11:47:31  martin
#H  removed 'InverseMod' and added 'QuotientMod'
#H
#H  Revision 3.2  1991/12/04  09:01:29  martin
#H  changed 'Ring' and 'DefaultRing' to use 'Domain', removed 'RingDomain'
#H
#H  Revision 3.1  1991/10/24  11:33:29  martin
#H  changed package for new domain concept with inheritance
#H
#H  Revision 3.0  1991/08/08  15:34:42  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  IsRing( <domain> )  . . . . . . . . . . . . .  test if a domain is a ring
##
IsRing := function ( D )
    return IsRec( D )
       and IsBound( D.isRing )
       and D.isRing;
end;


############################################################################
##
#V  RingOps . . . . . . . . . . . . . . .  operation record for ring category
##
RingOps := OperationsRecord( "RingOps", DomainOps );


#############################################################################
##
#F  RingOps.Elements( <R> ) . . . . . . . . . . . . . . .  elements of a ring
##
RingOps.Elements := function ( R )
    local   elms,       # elements of <R>, result
            set,        # set corresponding to <elms>
            elm,        # one element of <elms>
            gen,        # one generator of <R>
            new;        # product or sum of <elm> and <gen>

    # check that we can handle this ring
    if IsBound( R.isFinite ) and not R.isFinite  then
        Error("the ring <R> must be finite to compute its elements");
    elif not IsBound( R.generators )  then
        Error("sorry, do not know how to compute the elements of <R>");

    # otherwise use an orbit like algorithm
    else
        elms := [ R.zero ];
        set  := Set( elms );
        for elm  in elms  do
            for gen  in R.generators  do
                new := elm + gen;
                if not new in set  then
                    Add( elms, new );
                    AddSet( set, new );
                fi;
                new := elm * gen;
                if not new in set  then
                    Add( elms, new );
                    AddSet( set, new );
                fi;
            od;
        od;
    fi;
    return set;
end;


#############################################################################
##
#F  RingOps.\=( <R>, <S> ) . . . . . . . . . . . test if two rings are equal
##
RingOps.\= := function ( R, S )
    local   isEql;
    if IsRing( R ) and IsFinite( R )  then
        if IsRing( S ) and IsFinite( S )  then
            if IsBound( R.generators )  and IsBound( S.generators )  then
                isEql :=     (Size( R ) = Size( S ))
                         and ForAll( R.generators, r -> r in S )
                         and ForAll( S.generators, s -> s in R );
            else
                isEql := DomainOps.\=( R, S );
            fi;
        elif IsRing( S )  then
            isEql := false;
	else
            isEql := DomainOps.\=( R, S );
        fi;
    elif IsRing( R )  then
        if IsRing( S )  and IsFinite( S )  then
            isEql := false;
        elif IsRing( S )  then
            if IsBound( R.generators )  and IsBound( S.generators )  then
                isEql :=     ForAll( R.generators, g -> g in S )
                         and ForAll( S.generators, g -> g in R );
            else
                isEql := DomainOps.\=( R, S );
            fi;
	else
            isEql := DomainOps.\=( R, S );
        fi;
    else
        isEql := DomainOps.\=( R, S );
    fi;
    return isEql;

end;


#############################################################################
##
#F  RingOps.Print(<R>)  . . . . . . . . . . . . . . . . . . . .  print a ring
##
RingOps.Print := function ( R )
    local   i;

    # if the ring has a name we use this
    if IsBound( R.name )  then
        Print( R.name );

    # otherwise we print the generators
    elif IsBound( R.generators )  then

        # if the ring is not trivial the identity need not be printed
        if R.generators <> []  then
            Print( "Ring( ");
            for i  in [ 1 .. Length(R.generators)-1 ]  do
                Print( R.generators[i], ", " );
            od;
            Print( R.generators[Length(R.generators)], " )" );

        # if the group is trivial print it as 'Ring( <id> )'
        else
            Print( "Ring( ", R.identity, " )" );
        fi;

    # else print the record
    else
        PrintRec( R );
    fi;
end;


#############################################################################
##
#F  RingOps.Polynomial( <R>, <coeffs>, <val> )	.  polynomial over a ring <R>
##
RingOps.Polynomial := function( R, coeffs, val )

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
#F  RingOps.FastPolynomial( <R>, <coeffs>, <val> ) polynomial over a ring <R>
##
##  This function will *not* copy <coeffs> and thus destroy <coeffs>.
##
RingOps.FastPolynomial := function( R, coeffs, val )

    # normalize <coeffs>
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
#F  RingOps.PolynomialRing( <R> ) . . . . . . . . . . .  full polynomial ring
##
RingOps.PolynomialRing := function( R )
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

    # add known properties of polynom ring
    if IsBound(R.isCommutativeRing)  then
        P.isCommutativeRing := R.isCommutativeRing;
    fi;

    # add known units
    if IsBound(R.units)  then
    	P.units := List( R.units, u -> Polynomial( R, [u] ) );
    fi;

    # set one and zero
    P.one  := Polynomial( R, [ R.one ] );
    P.zero := Polynomial( R, [] );

    # 'P.baseRing' contains <R>
    P.baseRing := R;

    # set operations record and return
    P.operations := PolynomialRingOps;
    return P;

end;


#############################################################################
##
#F  RingOps.LaurentPolynomialRing( <R> )  . . .  full Laurent polynomial ring
##
RingOps.LaurentPolynomialRing := function( R )
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

    # add known properties of polynom ring
    if IsBound(R.isCommutativeRing)  then
        P.isCommutativeRing := R.isCommutativeRing;
    fi;

    # set one and zero
    P.one  := Polynomial( R, [ R.one ] );
    P.zero := Polynomial( R, [] );

    # 'P.baseRing' contains <R>
    P.baseRing := R;

    # set operations record and return
    P.operations := LaurentPolynomialRingOps;
    return P;

end;


#############################################################################
##
#F  RingOps.Indeterminate( <R> )  . . . . . . . . . indeterminate over a ring
##
RingOps.Indeterminate := function( R )
    return Polynomial( R, [ R.zero, R.one ] );
end;


#############################################################################
##
#F  RingOps.InterpolatedPolynomial( <R>, <x>, <y> ) . . . . . . interpolation
##
##  'InterpolatedPolynomial' returns, for given lists <x>, <y> of elements in
##  a ring <R> of the  same  lenth $n$ say, the unique  polynomial of  degree
##  less than $n$ which has value <y>[i] at <x>[i], for all $i=1,...,n$. Note
##  that the elements in <x> must be distinct.
##
RingOps.InterpolatedPolynomial := function( R, x, y )
    local   a,  t,  k,  i,  p;

    a := [];
    t := ShallowCopy(y);
    for i  in [ 1 .. Length(x) ]  do
        for k  in [ i-1, i-2 .. 1 ]  do
            t[k] := Quotient( R, t[k+1] - t[k], x[i] - x[k] );
            if t[k] = false  then
    	        Error( "cannot interpolate polynomial in <R>" );
    	    fi;
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
#F  IsCommutativeRing( <D> )  . . . . .  test if a domain is commutative ring
##
IsCommutativeRing := function ( R )

    if not IsRing( R )  then
        Error("<R> must be a ring");
    fi;

    if not IsBound( R.isCommutativeRing )  then
        R.isCommutativeRing := R.operations.IsCommutativeRing( R );
    fi;

    return R.isCommutativeRing;
end;

RingOps.IsCommutativeRing := function ( R )
    local    elms, i, k;

    if IsBound( R.generators )  then
        for i  in [1..Length(R.generators)]  do
            for k  in [i+1..Length(R.generators)]  do
                if   R.generators[i] * R.generators[k]
                  <> R.generators[k] * R.generators[i]
                then
                    return false;
                fi;
            od;
        od;
        return true;

    elif IsFinite( R )  then
        elms := Elements( R );
        for i  in [1..Length(elms)]  do
            for k  in [i+1..Length(elms)]  do
                if elms[i] * elms[k] <> elms[k] * elms[i]  then
                    return false;
                fi;
            od;
        od;
        return true;

    else
        Error("sorry, can not test if the infinite ring <R> is commutative");
    fi;
end;


#############################################################################
##
#F  IsIntegralRing( <D> ) . . . . . . . test if a domain is a integral domain
##
IsIntegralRing := function ( R )

    if not IsRing( R )  then
        Error("<R> must be a ring");
    fi;

    if not IsBound( R.isIntegralRing )  then
        R.isIntegralRing := R.operations.IsIntegralRing( R );
    fi;

    return R.isIntegralRing;
end;

RingOps.IsIntegralRing := function ( R )
    local   elms, i, k;

    if IsFinite( R )  then
        if not IsCommutativeRing( R )  then
            return false;
        fi;
        elms := Elements( R );
        for i  in [1..Length(elms)]  do
            for k  in [i+1..Length(elms)]  do
                if elms[i] * elms[k] = R.zero  then
                    return false;
                fi;
            od;
        od;
        return true;

    else
        Error("sorry, can not test if the infinte ring <R> is integral");
    fi;
end;


#############################################################################
##
#F  IsUniqueFactorizationRing( <D> )  . . . . . . . test if a domain is a UFD
##
IsUniqueFactorizationRing := function ( R )

    if not IsRing( R )  then
        Error("<R> must be a ring");
    fi;

    if not IsBound( R.isUniqueFactorizationRing )  then
        R.isUniqueFactorizationRing :=
            R.operations.IsUniqueFactorizationRing( R );
    fi;

    return R.isUniqueFactorizationRing;
end;

RingOps.IsUniqueFactorizationRing := function ( R )
    Error("sorry, can not test if the ring <R> has unique factorization");
end;


#############################################################################
##
#F  IsEuclideanRing( <D> )  . . . . . .  test if a domain is a Euclidean ring
##
IsEuclideanRing := function ( R )

    if not IsRing( R )  then
        Error("<R> must be a ring");
    fi;

    if not IsBound( R.isEuclideanRing )  then
        R.isEuclideanRing := R.operations.IsEuclideanRing( R );
    fi;

    return R.isEuclideanRing;
end;

RingOps.IsEuclideanRing := function ( R )
    Error("sorry, can not test if the ring <R> is an Euclidean ring");
end;


#############################################################################
##
#F  Quotient( [<R>,] <r>, <s> ) . . . . . . . . quotient of two ring elements
##
Quotient := function ( arg )
    local   R, r, s;

    # get and check the arguments
    if   Length(arg) = 2  then
        R := DefaultRing( arg[1], arg[2] );
        r := arg[1];
        s := arg[2];
    elif Length(arg) = 3  then
        R := arg[1];
        if not IsRing( R )  then
            Error("<R> must be a ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
        s := arg[3];
        if not s in R  then
            Error("<s> must be an element of <R>");
        fi;
    else
        Error("usage: Quotient( [<R>,] <r>, <s> )");
    fi;

    # there must be an operation to compute the quotient
    return R.operations.Quotient( R, r, s );
end;

RingOps.Quotient := function ( R, r, s )
    Error("sorry, can not divide in the ring <R>");
end;


#############################################################################
##
#F  IsUnit( [<R>,] <r> )  . . . . . . . . . . .  test if an element is a unit
##
IsUnit := function ( arg )
    local   R, r;

    # get and check the arguments
    if    Length(arg) = 1  then
        R := DefaultRing( arg[1] );
        r := arg[1];
    elif  Length(arg) = 2  then
        R := arg[1];
        if not IsRing( R )  then
            Error("<R> must be a ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
    else
        Error("usage: IsUnit( [<R>,] <r> )");
    fi;

    # perform the test
    return R.operations.IsUnit( R, r );
end;

RingOps.IsUnit := function ( R, r )
    local   isUnit;

    # if a list of units is already known, use it
    if IsBound( R.units )  then
        isUnit := r in R.units;

    # otherwise simply try to compute the inverse
    else
        isUnit := r <> R.zero
                  and R.operations.Quotient( R, R.one, r ) <> false;
    fi;

    # return the result
    return isUnit;
end;


#############################################################################
##
#F  Units( <R> )  . . . . . . . . . . . . . . . . . . . . . . units of a ring
##
Units := function ( R )

    # check the argument
    if not IsRing( R )  then
        Error("<R> must be a ring");
    fi;

    # compute the units if necessary
    if not IsBound( R.units )  then
        R.units := R.operations.Units( R );
    fi;

    # return the units
    return ShallowCopy( R.units );
end;

RingOps.Units := function ( R )
    local   units,
            elm;

    if IsFinite( R )  then
        units := Group( R.one );
        for elm  in Elements( R )  do
            if IsUnit( R, elm )  and not elm in units  then
                units := Group( Concatenation( units.generators, [ elm ] ),
                                units.identity );
            fi;
        od;
    else
        Error("sorry, can not compute the units of the infinite ring <R>");
    fi;

    return units;
end;


#############################################################################
##
#F  IsAssociated( [<R>,] <r>, <s> )  test if two ring elements are associated
##
IsAssociated := function ( arg )
    local   R, r, s;

    # get and check the arguments
    if    Length(arg) = 2  then
        R := DefaultRing( arg[1], arg[2] );
        r := arg[1];
        s := arg[2];
    elif  Length(arg) = 3  then
        R := arg[1];
        if not IsRing( R )  then
            Error("<R> must be a ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
        s := arg[3];
        if not s in R  then
            Error("<s> must be an element of <R>");
        fi;
    else
        Error("usage: IsAssociated( [<R>,] <r>, <s> )");
    fi;

    # return the result of the test
    return R.operations.IsAssociated( R, r, s );
end;

RingOps.IsAssociated := function ( R, r, s )
    local   isAss, q;

    # if a list of the units is already known, use it
    if IsBound( R.units )  then
        isAss := r in R.units * s;

    # or check if the quotient is a unit
    else
        if s = R.zero  then
            isAss := r = R.zero;
        else
            q := R.operations.Quotient( R, r, s );
            isAss := q <> false  and R.operations.IsUnit( R, q );
        fi;
    fi;

    # return the result
    return isAss;
end;


#############################################################################
##
#F  StandardAssociate( [<R>,] <r> ) . .  standard associate of a ring element
##
StandardAssociate := function ( arg )
    local   R, r;

    # get and check the arguments
    if   Length(arg) = 1  then
        R := DefaultRing( arg[1] );
        r := arg[1];
    elif Length(arg) = 2  then
        R := arg[1];
        if not IsRing( R )  then
            Error("<R> must be a ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
    else
        Error("usage: StandardAssociate( [<R>,] <r> )");
    fi;

    # return the standard associate
    return R.operations.StandardAssociate( R, r );
end;

RingOps.StandardAssociate := function ( R, r )
    Error("sorry, can not compute the standard associate of <r> in <R>");
end;


#############################################################################
##
#F  Associates( [<R>,] <r> )  . . . . . . . . .  associates of a ring element
##
Associates := function ( arg )
    local   R, r;

    # get and check the arguments
    if   Length(arg) = 1  then
        R := DefaultRing( arg[1] );
        r := arg[1];
    elif Length(arg) = 2  then
        R := arg[1];
        if not IsRing( R )  then
            Error("<R> must be a ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
    else
        Error("usage: Associates( [<R>,] <r> )");
    fi;

    # compute the associates of <r>
    return R.operations.Associates( R, r );
end;

RingOps.Associates := function ( R, r )
    return Set( Elements( Units( R ) ) * r );
end;


#############################################################################
##
#F  RingOps.IsIrreducible( [<R>,] <r> )   . . . .  test if <r> is irreducible
##
RingOps.IsIrreducible := function ( R, r )
    Error("sorry, can not test if <r> is irreducible in the ring <R>");
end;


#############################################################################
##
#F  IsPrime( [<R>,] <r> ) . . . . . . . . . test if a ring element is a prime
##
##  every prime is irreducible
##
IsPrime := function ( arg )
    local   R, r;

    # get and check the arguments
    if    Length(arg) = 1  then
        R := DefaultRing( arg[1] );
        r := arg[1];
    elif  Length(arg) = 2  then
        R := arg[1];
        if not IsRing( R )  then
            Error("<R> must be a ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
    else
        Error("usage: IsPrime( [<R>,] <r> )");
    fi;

    # perform the test
    return R.operations.IsPrime( R, r );
end;

RingOps.IsPrime := function ( R, r )
    Error("sorry, can not test if <r> is prime in the ring <R>");
end;


#############################################################################
##
#F  Factors( [<R>,] <r> ) . . . . . . . . . . factorization of a ring element
##
Factors := function ( arg )
    local   R, r;

    # get and check the arguments
    if   Length(arg) = 1  then
        r := arg[1];
        R := DefaultRing( r );
        if not IsRing( R )  then
            Error("<R> must be a ring");
        fi;
    elif Length(arg) = 2  then
        R := arg[1];
        if not IsRing( R )  then
            Error("<R> must be a ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
    else
        Error("usage: Factors( [<R>,] <r> )");
    fi;

    # factor the number
    return R.operations.Factors( R, r );
end;

RingOps.Factors := function ( R, r )
    Error("sorry, can not factor <r> in the ring <R>");
end;


#############################################################################
##
#F  EuclideanDegree( [<R>,] <r> )  . . . . euclidean degree of a ring element
##
EuclideanDegree := function ( arg )
    local   R, r;

    # get and check the arguments
    if   Length(arg) = 1  then
        r := arg[1];
        R := DefaultRing( r );
        if IsEuclideanRing( R ) <> true  then
            Error("<R> must be a Euclidean ring");
        fi;
    elif Length(arg) = 2  then
        R := arg[1];
        if IsEuclideanRing( R ) <> true  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
    else
        Error("usage: EuclideanDegree( [<R>,] <r> )");
    fi;

    # compute the Euclidean degree
    return R.operations.EuclideanDegree( R, r );
end;

RingOps.EuclideanDegree := function ( R, r )
    Error("sorry, can not compute the Euclidean degree of <r> in <R>");
end;


#############################################################################
##
#F  EuclideanRemainder( [<R>], <r>, <m> ) . . . . . . . . euclidean remainder
##
EuclideanRemainder := function ( arg )
    local   R, r, m;

    # get and check the arguments
    if   Length(arg) = 2  then
        R := DefaultRing( arg[1], arg[2] );
        if not IsEuclideanRing( R )  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[1];
        m := arg[2];
    elif Length(arg) = 3  then
        R := arg[1];
        if not IsEuclideanRing( R )  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
        m := arg[3];
        if not m in R  then
            Error("<m> must be an element of <R>");
        fi;
    else
        Error("usage: EuclideanRemainder( [<R>,] <r>, <m> )");
    fi;

    #N check 'Mod' for the moment ('Mod' is obsolete)
    if not IsBound(R.operations.EuclideanRemainder)  then
    	return R.operations.Mod( R, r, m );
    else
    	return R.operations.EuclideanRemainder( R, r, m );
    fi;
end;

RingOps.EuclideanRemainder := function ( R, r, m )
    return R.operations.QuotientRemainder( R, r, m )[2];
end;


#############################################################################
##
#F  EuclideanQuotient( [<R>], <r>, <m> )  . . . . . . . .  euclidean quotient
##
EuclideanQuotient := function ( arg )
    local   R, r, m;

    # get and check the arguments
    if   Length(arg) = 2  then
        R := DefaultRing( arg[1], arg[2] );
        if not IsEuclideanRing( R )  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[1];
        m := arg[2];
    elif Length(arg) = 3  then
        R := arg[1];
        if not IsEuclideanRing( R )  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
        m := arg[3];
        if not m in R  then
            Error("<m> must be an element of <R>");
        fi;
    else
        Error("usage: EuclideanQuotient( [<R>,] <r>, <m> )");
    fi;

    # call the ring function
    return R.operations.EuclideanQuotient( R, r, m );

end;

RingOps.EuclideanQuotient := function ( R, r, m )
    return R.operations.QuotientRemainder( R, r, m )[1];
end;


#############################################################################
##
#F  QuotientRemainder( [<R>], <r>, <m> )  .  euclidean quotient and remainder
##
QuotientRemainder := function( arg )
    local   R, r, m;

    # get and check the arguments
    if   Length(arg) = 2  then
        R := DefaultRing( arg[1], arg[2] );
        if not IsEuclideanRing( R )  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[1];
        m := arg[2];
    elif Length(arg) = 3  then
        R := arg[1];
        if not IsEuclideanRing( R )  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
        m := arg[3];
        if not m in R  then
            Error("<m> must be an element of <R>");
        fi;
    else
        Error("usage: EuclideanQuotient( [<R>,] <r>, <m> )");
    fi;

    # call the ring function
    return R.operations.QuotientRemainder( R, r, m );

end;

RingOps.QuotientRemainder := function ( R, r, m )
    Error("sorry, cannot compute the remainder of <r> by <m> in <R>");
end;


#############################################################################
##
#F  Mod( [<R>,], <r>, <m> ) . . . . . . . . . . euclidean remainder, obsolete
##
Mod := EuclideanRemainder;


#############################################################################
##
#F  QuotientMod( [<R>,] <r>, <s>, <m> ) . . . . quotient of two ring elements
#F                                                             modulo another
##
QuotientMod := function ( arg )
    local   R, r, s, m;

    # get and check the arguments
    if   Length(arg) = 3  then
        R := DefaultRing( arg[1], arg[2], arg[3] );
        if not IsEuclideanRing( R )  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[1];
        s := arg[2];
        m := arg[3];
    elif Length(arg) = 4  then
        R := arg[1];
        if not IsEuclideanRing( R )  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
        s := arg[3];
        if not s in R  then
            Error("<s> must be an element of <R>");
        fi;
        m := arg[4];
        if not m in R  then
            Error("<m> must be an element of <R>");
        fi;
    else
        Error("usage: QuotientMod( [<R>,] <r>, <s>, <m> )");
    fi;

    # compute the quotient
    return R.operations.QuotientMod( R, r, s, m );
end;

RingOps.QuotientMod := function ( R, r, s, m )
    local  f, g, h, fs, gs, hs, q, t;
    f := s;  fs := 1;
    g := m;  gs := 0;
    while g <> R.zero  do
    	t := R.operations.QuotientRemainder( R, f, g );
        h := g;          hs := gs;
        g := t[2];       gs := fs - t[1] * gs;
        f := h;          fs := hs;
    od;
    q := R.operations.Quotient( R, r, f );
    if q = false  then
        return false;
    else
        return R.operations.EuclideanRemainder( R, fs * q, m );
    fi;
end;


#############################################################################
##
#F  PowerMod( [<R>,] <r>, <e>, <m> )  . . power of a ring element mod another
##
PowerMod := function ( arg )
    local   R, r, e, m;

    # get and check the arguments
    if   Length(arg) = 3  then
        R := DefaultRing( arg[1], arg[3] );
        if not IsEuclideanRing( R )  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[1];
        e := arg[2];
        if not IsInt( e )  then
            Error("<e> must be an integer");
        fi;
        m := arg[3];
    elif Length(arg) = 4  then
        R := arg[1];
        if not IsEuclideanRing( R )  then
            Error("<R> must be a Euclidean ring");
        fi;
        r := arg[2];
        if not r in R  then
            Error("<r> must be an element of <R>");
        fi;
        e := arg[3];
        if not IsInt( e )  then
            Error("<e> must be an integer");
        fi;
        m := arg[4];
        if not m in R  then
            Error("<m> must be an element of <R>");
        fi;
    else
        Error("usage: PowerMod( [<R>,] <r>, <e>, <m> )");
    fi;

    # compute the power
    return R.operations.PowerMod( R, r, e, m );
end;

RingOps.PowerMod := function ( R, r, e, m )
    local   pow, f;

    # reduce r initially
    r := R.operations.EuclideanRemainder( R, r, m );

    # handle special case
    if e = 0  then
        return R.one;
    fi;

    # if e is negative then invert n modulo m with Euclids algorithm
    if e < 0  then
        r := R.operations.QuotientMod( R, R.one, r, m );
        if r = false  then
            Error("<r> must be invertable modulo <m>");
        fi;
        e := -e;
    fi;

    # now use the repeated squaring method (right-to-left)
    pow := R.one;
    f := 2 ^ (LogInt( e, 2 ) + 1);
    while 1 < f  do
        pow := R.operations.EuclideanRemainder( R, pow * pow, m );
        f := QuoInt( f, 2 );
        if f <= e  then
            pow := R.operations.EuclideanRemainder( R, pow * r, m );
            e := e - f;
        fi;
    od;

    # return the power
    return pow;
end;


#############################################################################
##
#F  Gcd( [<R>,] <r1>, <r2>... ) . .  greatest common divisor of ring elements
##
Gcd := function ( arg )
    local   R, ns, i, gcd;

    # get and check the arguments (what a pain)
    if   Length(arg) = 0  then
        Error("usage: Gcd( [<R>,] <r1>, <r2>... )");
    elif Length(arg) = 1  then
        ns := arg[1];
    elif Length(arg) = 2 and IsRing(arg[1])  then
        R := arg[1];
        ns := arg[2];
    elif  IsRing(arg[1])  then
        R := arg[1];
        ns := Sublist( arg, [2..Length(arg)] );        
    else
        R := DefaultRing( arg );
        ns := arg;
    fi;
    if not IsList( ns )  or Length(ns) = 0  then
        Error("usage: Gcd( [<R>,] <r1>, <r2>... )");
    fi;
    if not IsBound( R )  then
        R := DefaultRing( ns );
    else
        if not ForAll( ns, n -> n in R )  then
            Error("<r> must be an element of <R>");
        fi;
    fi;
    if not IsEuclideanRing( R )  then
        Error("<R> must be a Euclidean ring");
    fi;

    # compute the gcd by iterating
    gcd := ns[1];
    for i  in [2..Length(ns)]  do
        gcd := R.operations.Gcd( R, gcd, ns[i] );
    od;

    # return the gcd
    return gcd;
end;

RingOps.Gcd := function ( R, r, s )
    local   gcd, u, v, w;

    # perform a Euclidean algorithm
    u := r;
    v := s;
    while v <> R.zero  do
        w := v;
        v := R.operations.EuclideanRemainder( R, u, v );
        u := w;
    od;
    gcd := u;

    # norm the element
    gcd := R.operations.StandardAssociate( R, gcd );

    # return the gcd
    return gcd;
end;


#############################################################################
##
#F  GcdRepresentation( [<R>,] <r>, <s> )  . . . . . representation of the gcd
##
GcdRepresentation := function ( arg )
    local   R, ns, i, gcd, rep, tmp;

    # get and check the arguments (what a pain)
    if   Length(arg) = 0  then
        Error("usage: Gcd( [<R>,] <r1>, <r2>... )");
    elif Length(arg) = 1  then
        ns := arg[1];
    elif Length(arg) = 2 and IsRing(arg[1])  then
        R := arg[1];
        ns := arg[2];
    elif  IsRing(arg[1])  then
        R := arg[1];
        ns := Sublist( arg, [2..Length(arg)] );        
    else
        R := DefaultRing( arg );
        ns := arg;
    fi;
    if not IsList( ns )  or Length(ns) = 0  then
        Error("usage: GcdRepresentation( [<R>,] <r1>, <r2>... )");
    fi;
    if not IsBound( R )  then
        R := DefaultRing( ns );
    else
        if not ForAll( ns, n -> n in R )  then
            Error("<r> must be an element of <R>");
        fi;
    fi;
    if not IsEuclideanRing( R )  then
        Error("<R> must be a Euclidean ring");
    fi;

    # compute the gcd by iterating
    gcd := ns[1];
    rep := [ R.one ];
    for i  in [2..Length(ns)]  do
        tmp := R.operations.GcdRepresentation( R, gcd, ns[i] );
        gcd := tmp[1] * gcd + tmp[2] * ns[i];
        rep := List( rep, x -> x * tmp[1] );
        Add( rep, tmp[2] );
    od;

    # return the gcd representation
    return rep;
end;

RingOps.GcdRepresentation := function ( R, x, y )
    local   f, g, h, fx, gx, hx, q, t;
    f := x;  fx := R.one;
    g := y;  gx := R.zero;
    while g <> R.zero  do
    	t := R.operations.QuotientRemainder( R, f, g );
        h := g;          hx := gx;
        g := t[2];       gx := fx - t[1] * gx;
        f := h;          fx := hx;
    od;
    q := R.operations.Quotient(R, R.operations.StandardAssociate(R, f), f);
    if y = R.zero  then
        return [ q * fx, R.zero ];
    else
        return [ q * fx, R.operations.Quotient( R, q * (f - fx * x), y ) ];
    fi;
end;


#############################################################################
##
#F  Lcm( [<R>,] <r1>, <r2>,.. ) .  least common multiple of two ring elements
##
Lcm := function ( arg )
    local   R, ns, n, gcd, lcm, i, h;

    # get and check the arguments (what a pain)
    if   Length(arg) = 0  then
        Error("usage: Lcm( [<R>,] <r1>, <r2>... )");
    elif Length(arg) = 1  then
        ns := arg[1];
    elif Length(arg) = 2 and IsRing(arg[1])  then
        R := arg[1];
        ns := arg[2];
    elif  IsRing(arg[1])  then
        R := arg[1];
        ns := Sublist( arg, [2..Length(arg)] );        
    else
        R := DefaultRing( arg );
        ns := arg;
    fi;
    if not IsList( ns )  or Length(ns) = 0  then
        Error("usage: Lcm( [<R>,] <r1>, <r2>... )");
    fi;
    if not IsBound( R )  then
        R := DefaultRing( ns );
    else
        if not ForAll( ns, n -> n in R )  then
            Error("<r> must be an element of <R>");
        fi;
    fi;
    if not IsEuclideanRing( R )  then
        Error("<R> must be a Euclidean ring");
    fi;

    # compute the least common multiple
    lcm := ns[1];
    for i  in [2..Length(ns)]  do
        lcm := R.operations.Lcm( R, lcm, ns[i] );
    od;

    # return the lcm
    return lcm;
end;

RingOps.Lcm := function ( R, r, s )
    local   lcm;

    # compute the least common multiple
    if r = R.zero  and s = R.zero  then
        lcm := R.zero;
    else
        lcm := R.operations.StandardAssociate( R,
                    R.operations.Quotient( R, r, R.operations.Gcd( R, r, s ) )
                    * s );
    fi;

    # return the lcm
    return lcm;
end;


#############################################################################
##
#F  RingOps.AsGroup(<R>)  . . . . . . . view a ring as a multiplicative group
##
RingOps.AsGroup := function ( R )
    Error("sorry, can not view the ring <R> as a group");
end;


#############################################################################
##
#F  RingOps.AsAdditiveGroup(<R>)  . . . . .  view a ring as an additive group
##
RingOps.AsAdditiveGroup := function ( R )
    Error("sorry, can not view the ring <R> as an additive group");
end;


#############################################################################
##
#F  RingOps.Module( <R>, <gens>, <zero> )
##
##  This is the default function to construct modules.
##
##  *Note* that <zero> may be a dummy (equal to <R>) if <gens> is nonempty.
##  This is used to avoid the construction of unnecessary zeroes.
##  (Think of {\MeatAxe} modules!)
##
RingOps.Module := function( R, gens, zero )

    local M;    # the module, result

    # Check that the zero can be constructed.
    if Dimensions( gens )[1] = 0 and zero = R then
      Error( "need at least one element" );
    fi;
    
    # Setup the module record
    M:= rec( isDomain      := true,
             isModule      := true,
             isVectorSpace := true,

             generators    := gens,
             field         := R.field,
             ring          := R,

             operations    := ModuleOps );

    if zero = "basis" then

      # We may assume that the generators form a vector space basis.
      M.basis:= Basis( M, gens );

    elif zero <> R then

      # Add the zero element if it was entered.
      M.zero:= zero;
    fi;

    # Return the module.
    return M;
    end;

#############################################################################
##
#V  RingElements  . . . . . . . . . . . . . . . . domain of all Ring elements
#V  RingElementsOps . .  operations record of the domain of all ring elements
##
##  'RingElements' is  the domain of    all  ring elements,  i.e.,  integers,
##  cyclotomic  integers, field  elements,  and records  that  implement ring
##  elements.  Note that 'RingElements' is not a ring.
##
##  'RingElementsOps'  is   the  operations record   for  the  'RingElements'
##  domain.  The  operations  record  of other ring  domains like  'Integers'
##  inherit default methods from this record.
##
##  Those domains are  known  to 'Domain',   and they know  how to  create  a
##  ring that contains a given list of elements.
##
RingElementsOps         := OperationsRecord( "RingElementsOps", DomainOps );

RingElementsOps.\in    := function ( z, RingElements )
    return IsInt( z )
        or IsCycInt( z )
        or IsRec( z )  and IsBound(z.isRingElement)  and z.isRingElement;
end;

RingElementsOps.Order   := function ( F, z )
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


RingElements            := rec();
RingElements.isDomain   := true;

RingElements.name       := "RingElements";

RingElements.isFinite   := false;
RingElements.size       := "infinity";

RingElements.operations := RingElementsOps;


#############################################################################
##
#F  Ring(<z>,...) . . . . . . . . . . . .  ring containing a list of elements
##
Ring := function ( arg )
    local   R,          # ring containing the elements of <arg>, result
            D;          # domain containing the elements of <arg>

    # if called with one domain argument look in the operations record
    if Length(arg) = 1  and IsDomain(arg[1])  then
        R := arg[1].operations.Ring( arg[1] );

    # special case for one square matrix
    elif    Length(arg) = 1
        and IsMat(arg[1])  and Length(arg[1]) = Length(arg[1][1])
    then
        D := Domain( arg );
        R := D.operations.Ring( arg );

    # special case for list of elements
    elif Length(arg) = 1  and IsList(arg[1])  then
        D := Domain( arg[1] );
        R := D.operations.Ring( arg[1] );

    # other cases
    else
        D := Domain( arg );
        R := D.operations.Ring( arg );
    fi;

    # return the ring
    return R;
end;

RingElementsOps.Ring := function ( arg )
    Error("sorry, there is no default way to construct a ring");
end;


#############################################################################
##
#F  DefaultRing(<z>,...)  . . . .  default ring containing a list of elements
##
DefaultRing := function ( arg )
    local   R,          # ring containing the elements of <arg>, result
            D;          # domain containing the elements of <arg>

    # special case for one square matrix
    if    Length(arg) = 1
        and IsMat(arg[1])  and Length(arg[1]) = Length(arg[1][1])
    then
        D := Domain( arg );
        R := D.operations.DefaultRing( arg );

    # special case for list of elements
    elif Length(arg) = 1  and IsList(arg[1])  then
        D := Domain( arg[1] );
        R := D.operations.DefaultRing( arg[1] );

    # other cases
    else
        D := Domain( arg );
        R := D.operations.DefaultRing( arg );
    fi;

    # return the default ring
    return R;
end;

RingElementsOps.DefaultRing := function ( arg )
    Error("sorry, there is no default way to construct a default ring");
end;


#############################################################################
##
#F  RingOps.AsRing(<D>) . . . . . . . . . . . . . . . view a domain as a ring
##
RingOps.AsRing := function ( R )
    return R;
end;
