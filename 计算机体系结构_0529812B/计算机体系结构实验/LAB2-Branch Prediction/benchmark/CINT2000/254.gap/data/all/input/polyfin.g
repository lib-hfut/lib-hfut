#############################################################################
##
#A  polyfin.g                   GAP library                      Frank Celler
##
#A  @(#)$Id: polyfin.g,v 3.26 1994/05/04 07:54:38 fceller Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions for polynomials over finite fields.
##
#H  $Log: polyfin.g,v $
#H  Revision 3.26  1994/05/04  07:54:38  fceller
#H  fixed 'PrimePowersInt' for negative values
#H
#H  Revision 3.25  1994/03/28  09:46:14  fceller
#H  fixed a bug in 'PowerMod'
#H
#H  Revision 3.24  1994/02/18  12:15:11  fceller
#H  changed internal functions slightly to allow mixed "vectors"
#H
#H  Revision 3.23  1993/03/10  19:15:53  fceller
#H  added 'EuclideanQuotient', 'EuclideanRemainder' and 'QuotientRemainder'
#H
#H  Revision 3.22  1993/03/02  08:56:40  fceller
#H  added 'FastPolynomial'
#H
#H  Revision 3.21  1993/03/01  10:10:07  fceller
#H  fixed a bug in 'OrderKnownDividend'
#H
#H  Revision 3.20  1993/02/11  17:08:11  fceller
#H  added <list> + <polynomial>
#H
#H  Revision 3.19  1993/01/08  09:13:08  fceller
#H  'Factors' now stores its result
#H
#H  Revision 3.18  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.17  1992/11/25  12:35:26  fceller
#H  added 'Degree'
#H
#H  Revision 3.16  1992/11/19  14:10:23  fceller
#H  fixed a minor bug
#H
#H  Revision 3.15  92/11/16  12:23:10  fceller
#H  added Laurent polynomials
#H  
#H  Revision 3.14  92/10/28  09:15:08  fceller
#H  fixed 'mod' for zero polynomial
#H  
#H  Revision 3.13  1992/07/24  07:08:07  fceller
#H  improved '*' to allow <nullpoly> * <int>
#H
#H  Revision 3.12  1992/07/23  09:20:48  fceller
#H  improved '*' to allow <list> * <polynomial>
#H
#H  Revision 3.11  1992/07/02  11:51:31  fceller
#H  add 'FiniteFieldPolynomialOps.+'
#H
#H  Revision 3.10  1992/06/17  07:06:04  fceller
#H  moved '<somedomain>.operations.Polynomial' function to "<somedomain>.g"
#H
#H  Revision 3.9  1992/06/04  09:17:14  fceller
#H  fixed a missing set command
#H
#H  Revision 3.8  1992/06/03  10:43:51  fceller
#H  fixed some minor bugs
#H
#H  Revision 3.7  1992/06/01  07:33:22  fceller
#H  moved a few functions to "fldpoly.g"
#H
#H  Revision 3.6  1992/05/25  09:23:47  fceller
#H  added 'RootsRepresentative', added an adapted version of
#H  Martin's implementation of Cantor/Zassenhaus factorisation
#H
#H  Revision 3.5  1992/05/25  09:12:54  fceller
#H  added 'PowerMod', fixed a bug
#H
#H  Revision 3.4  1992/05/07  10:30:56  fceller
#H  changed order algorithm into order mod scalar
#H
#H  Revision 3.3  1992/04/23  10:33:13  fceller
#H  changed 'PrimePowers' into 'PrimePowersInt'
#H
#H  Revision 3.2  1992/04/23  07:23:11  fceller
#H  Initial GAP 3.2 release
##


#############################################################################
##
#F  InfoPoly1(...)  . . . . . . . . . . . infomation function for polynomials
#F  InfoPoly2(...)  . . . . . . . . . . . . .  debug function for polynomials
##
if not IsBound(InfoPoly1)    then InfoPoly1   := Ignore;  fi;
if not IsBound(InfoPoly2)    then InfoPoly2   := Ignore;  fi;


#############################################################################
##

#V  FiniteFieldPolynomialRingOps  . . . . . . . . .  full polynomial ring ops
##
FiniteFieldPolynomialRingOps := Copy( FieldPolynomialRingOps );
FiniteFieldPolynomialRingOps.name := "FiniteFieldPolynomialRingOps";


#############################################################################
##
#F  FiniteFieldPolynomialRingOps.Gcd( <R>, <r>, <s> ) . . . . . . . . . . gcd
##
FiniteFieldPolynomialRingOps.Gcd := function ( R, r, s )
    local   gcd,  u,  v,  w,  val;

    # remove common x^i term
    val := Minimum( r.valuation, s.valuation );
    s   := ShiftedCoeffs( s.coefficients, s.valuation-val );
    r   := ShiftedCoeffs( r.coefficients, r.valuation-val );

    # perform a Euclidean algorithm
    u := r;
    v := s;
    while 0 < Length(v)  do
        w := v;
	ReduceCoeffs( u, v );
        ShrinkCoeffs(u);
	v := u;
        u := w;
    od;
    gcd := u * u[Length(u)]^-1;

    # return the gcd
    return R.baseRing.operations.FastPolynomial( R.baseRing, gcd, val );
end;


#############################################################################
##
#F  FiniteFieldPolynomialRingOps.PowerMod( <R>, <g>, <e>, <m> )	. . . . power
##
FiniteFieldPolynomialRingOps.PowerMod := function( R, g, e, m )
    local   val;

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

    # use 'PowerModCoeffs' to power polynomial
    if g.valuation = m.valuation  then
	val := g.valuation;
	g   := g.coefficients;
	m   := m.coefficients;
    else
	val := 0;
        g   := ShiftedCoeffs( g.coefficients, g.valuation );
        m   := ShiftedCoeffs( m.coefficients, m.valuation );
    fi;
    return R.baseRing.operations.FastPolynomial(
                   R.baseRing, PowerModCoeffs( g, e, m ), val );

end;


#############################################################################
##
#F  FiniteFieldPolynomialRingOps.RootsRepresentative( <R>, <f>, <n> )  a root
##
FiniteFieldPolynomialRingOps.RootsRepresentative := function( R, f, n )
    local   r,  d,  p,  e,  z,  i,  o,  v;

    r := [];
    p := R.baseRing.char;
    d := R.baseRing.degree;
    z := R.baseRing.root;
    v := f.valuation;
    o := p^d-1;
    for i  in [ 0 .. (Length(f.coefficients)-1)/n ]  do
    	e := f.coefficients[i*n+1];
    	if e = R.baseRing.zero  then
    	    r[i+1] := R.baseRing.zero;
    	else
            r[i+1] := z ^ ( (LogFFE(e,z) / n) mod o );
    	fi;
    od;
    return R.baseRing.operations.FastPolynomial( R.baseRing, r, v/n );

end;


#############################################################################
##
#F  FiniteFieldPolynomialRingOps.FactorsCommonDegree( <R>, <f>, <d> ) factors
##
##  <f> must be a  square free product of irreducible factors of  degree  <d>
##  and leading coefficient 1.  <R> must be  a polynomial ring over  a finite
##  field of size p^k.
##
FiniteFieldPolynomialRingOps.FactorsCommonDegree := function ( R, f, d )
    local  g,  h,  i,  k;

    # if <f> has a trivial constant term signal an error
    if f.valuation <> 0  then
	Error( "<f> must have a non-trivial constant term" );

    # if <f> has degree 0, return f
    elif Degree(f) = 0  then
    	return [];

    # if <f> has degree <d>, return irreducible <f>
    elif Degree(f) = d  then
    	return [ f ];
    fi;

    # choose a random polynomial <g> of degree less than 2*<d>
    g := RandomPol( R.baseRing, 2*d-1 );

    # if p = 2 take <g> + <g>^2 + <g>^(2^2) + ... + <g>^(2^(k*<d>-1))
    if R.baseRing.char = 2  then
        h := ShiftedCoeffs( g.coefficients, g.valuation );
	k := ShiftedCoeffs( f.coefficients, f.valuation );
	g := g.coefficients;
        for i  in [ 1 .. R.baseRing.degree*d-1 ]  do
            g := ProductCoeffs( g, g );
	    ReduceCoeffs( g, k );
            ShrinkCoeffs(g);
	    AddCoeffs( h, g );
        od;
	h := R.baseRing.operations.FastPolynomial( R.baseRing, h, 0 );

    # if p > 2 take <g> ^ ( ( p ^ (k * <d>) - 1 ) / 2 ) - 1
    else
        h := PowerMod(R,g,(R.baseRing.char^(R.baseRing.degree*d)-1)/2,f);
        h := h - 1;
    fi;

    # gcd of <f> and <h> is with probability > 1/2 a proper factor
    g := Gcd( R, f, h );
    return Concatenation( 
    	R.operations.FactorsCommonDegree( R, Quotient( R, f, g ), d ),
    	R.operations.FactorsCommonDegree( R, g, d ) );
end;


#############################################################################
##
#F  FiniteFieldPolynomialRingOps.FactorsSquarefree( <R>, <f> )  . . . factors
##
##  <f> must be square free and must have leading coefficient 1. <R> must  be
##  a polynomial ring over a finite field of size q.
##
FiniteFieldPolynomialRingOps.FactorsSquarefree := function( R,  f )
    local   facs,  lcf,  deg,  pow,  px,  cyc,  gcd;

    # if <f> has a trivial constant term signal an error
    if f.valuation <> 0  then
	Error( "<f> must have a non-trivial constant term" );
    fi;

    # <facs> will contain factorisation
    facs := [];

    # in the following <pow> = x ^ ( q ^ (<deg>+1) )
    deg := 0;
    px  := Polynomial( R.baseRing, [ R.baseRing.zero, R.baseRing.one ] );
    pow := PowerMod( R, px, R.baseRing.size, f );

    # while <f> could still have two irreducible factors
    while 2*(deg+1) <= Degree(f) do

        # next degree and next cyclotomic polynomial x^(q^(<deg>+1))-x
        deg := deg + 1;
    	cyc := pow - px;
        pow := PowerMod( R, pow, Size( R.baseRing ), f );

        # compute the gcd of <f> and <cyc>
        gcd := Gcd( R, f, cyc );

        # split the gcd with 'R.operations.FactorsCommonDegree'
        if 0 < Degree(gcd)  then
            Append( facs, R.operations.FactorsCommonDegree( R, gcd, deg ) );
	    f := Quotient( R, f, gcd );
        fi;

    od;

    # if neccessary add irreducible <f> to the list of factors
    if 0 < Degree(f)  then
        Add( facs, f );
    fi;

    # return the factorisation
    return facs;

end;


#############################################################################
##
#F  FiniteFieldPolynomialRingOps.Factors( <R>, <f> )  . . . .  factors of <f>
##
FiniteFieldPolynomialRingOps.Factors := function ( R, f )
    local  facs,  l,  d,  g,  h,  r,  i,  v,  k;

    # handle trivial case
    if Degree(f) < 2  then
	f.factors := [ f ];
    elif Length(f.coefficients) = 1  then
	l := List( [ 1 .. f.valuation ], x -> Indeterminate(f.baseRing) );
	l[1] := l[1] * f.coefficients[1];
	f.factors := l;
    fi;

    # if we know the factors, return
    if IsBound(f.factors) and f.baseRing = R.baseRing  then
        return f.factors;
    fi;

    # make the polynomial normed, remember the leading coefficient for later
    g := R.operations.StandardAssociate( R, f );
    l := R.operations.Quotient( R, f, g );
    v := g.valuation;
    k := Polynomial( R.baseRing, g.coefficients );

    # compute the deriviative
    d := R.operations.Derivative( R, k );

    # if the derivative is nonzero then $k / Gcd(k,d)$ is squarefree
    if d <> R.zero  then

        # compute the gcd of <k> and the derivative <d>
        g := Gcd( R, k, d );

        # factor the squarefree quotient and the remainder
        facs := R.operations.FactorsSquarefree( R, Quotient( R, k, g ) );
        for h  in ShallowCopy(facs)  do
            while 0 = Length( R.operations.EuclideanRemainder(
	              R, g, h ).coefficients )
	    do
                Add( facs, h );
		g := Quotient( R, g, h );
            od;
        od;
        if 1 < Length( g.coefficients )  then
            Append( facs, R.operations.Factors( R, g ) );
        fi;

    # otherwise <k> is the <p>-th power of another polynomial <r>
    else

        # compute the <p>-th root of <f>
    	r := R.operations.RootsRepresentative( R, k, R.baseRing.char );

        # factor this polynomial
        h := R.operations.Factors( R, r );

        # each factor appears <p> times in <k>
        facs := [];
        for i  in [ 1 .. R.baseRing.char ]  do
            Append( facs, h );
        od;

    fi;

    # Sort the factorization
    Append( facs, List( [1..v], x -> Indeterminate(R.baseRing) ) );
    Sort( facs );

    # return the factorization
    facs[1] := facs[1] * l;
    if f.baseRing = R.baseRing  then
	f.factors := facs;
    fi;
    return facs;

end;


#############################################################################
##
#F  FiniteFieldPolynomialRingOps.EuclideanRemainder( <R>, <f>, <g> )  . . rem
##
FiniteFieldPolynomialRingOps.EuclideanRemainder := function( R, f, g )
    return f mod g;
end;

    
#############################################################################
##

#V  FiniteFieldLaurentPolynomials . . . . . . . domain of Laurent polynomials
##
FiniteFieldLaurentPolynomials      := Copy( LaurentPolynomials );
FiniteFieldLaurentPolynomials.name := "FiniteFieldLaurentPolynomials";
FiniteFieldLaurentPolynomialsOps := FiniteFieldLaurentPolynomials.operations;

FiniteFieldLaurentPolynomialsOps.\in := function( p, FinFieldLaurentPolys )
    return     IsRec( p )
    	   and IsBound( p.isPolynomial )
    	   and p.isPolynomial
    	   and IsFiniteField( p.baseRing );
end;


#############################################################################
##
#V  FiniteFieldPolynomials  . . . . domain of polynomials over a finite field
##
FiniteFieldPolynomials            := Copy( Polynomials );
FiniteFieldPolynomials.name       := "FiniteFieldPolynomials";
FiniteFieldPolynomialsOps         := FiniteFieldPolynomials.operations;

FiniteFieldPolynomialsOps.\in := function( p, FiniteFieldPolynomials )
    return     IsRec( p )
    	   and IsBound( p.isPolynomial )
    	   and p.isPolynomial
           and 0 <= p.valuation
    	   and IsFiniteField( p.baseRing );
end;


#############################################################################
##

#V  FiniteFieldPolynomialOps  . . . . . . . . . polynomial over finite fields
##
FiniteFieldPolynomialOps := Copy( PolynomialOps );
FiniteFieldPolynomialOps.name := "FiniteFieldPolynomialOps";


#############################################################################
##
#F  FiniteFieldPolynomialOps.\+   . . . . . . . . . .  sum of two polynomials
##
FiniteFieldPolynomialOps.\+ := function( l, r )
    local   sum,  val,  vdf,  i;

    # handle the case that one argument is a list
    if IsList(l)  then
    	return List( l, x -> x+r );
    elif IsList(r)  then
    	return List( r, x -> l+x );
    fi;

    # handle the case <scalar> + <polynomial>
    if not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then

	# if <l> is an integer convert it to a finite field element
        if IsInt(l)  then
            l := l * r.baseRing.one;

	# otherwise <l> must lie in the base ring of <r>
        elif not l in r.baseRing  then
            Error( "<l> must lie in the base ring of <r>" );
        fi;

	# if <l> is trivial return <r>
	if l = r.baseRing.zero  then
	    return r;
	fi;

    	# otherwise convert <l> into a polynomial
        l := r.baseRing.operations.FastPolynomial( r.baseRing, [l], 0 );
    fi;

    # handle the case <polynomial> + <scalar>
    if not (IsRec(r) and IsBound(r.isPolynomial) and r.isPolynomial)  then

	# if <r> is an integer convert it to a finite field element
        if IsInt(r)  then
            r := r * l.baseRing.one;

	# otherwise <l> must lie in the base ring of <r>
        elif not r in l.baseRing  then
            Error( "<r> must lie in the base ring of <l>" );
        fi;

	# if <r> is trivial return <l>
	if r = l.baseRing.zero  then
	    return l;
	fi;

    	# otherwise convert <l> into a polynomial
	r := l.baseRing.operations.FastPolynomial( l.baseRing, [r], 0 );
    fi;

    # our superclass will handle different depth
    if not IsBound(l.depth)  then  l.operations.Depth(l);  fi;
    if not IsBound(r.depth)  then  r.operations.Depth(r);  fi;
    if 1 <> l.depth or 1 <> r.depth  then
        return PolynomialOps.\+( l, r );

    # give up if we have different rings
    elif l.baseRing <> r.baseRing  then
        Error("polynomials must have the same ring");	

    # if <l> is the null polynomial return <r>
    elif Length(l.coefficients) = 0  then
	return r;

    # if <r> is the null polynomial return <l>
    elif Length(r.coefficients) = 0  then
        return l;

    # add two polynomials
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

    	    # a field is commutative
    	    AddCoeffs( sum, l.coefficients );

    	# otherwise they are equal
    	else
    	    sum := SumCoeffs( l.coefficients, r.coefficients );
    	    val := l.valuation;
    	fi;

        # return the sum
        sum := l.baseRing.operations.FastPolynomial( l.baseRing, sum, val );
    	sum.depth := 1;
    	return sum;
    fi;

end;


#############################################################################
##
#F  FiniteFieldPolynomialOps.\-   . . . . . . . difference of two polynomials
##
FiniteFieldPolynomialOps.\- := function( l, r )
    local   dif,  val,  vdf,  i;

    # handle the case that one argument is a list
    if IsList(l)  then
    	return List( l, x -> x-r );
    elif IsList(r)  then
    	return List( r, x -> l-x );
    fi;

    # handle the case <scalar> - <polynomial>
    if not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then

	# if <l> is an integer convert it to a finite field element
        if IsInt(l)  then
            l := l * r.baseRing.one;

	# otherwise <l> must lie in the base ring of <r>
        elif not l in r.baseRing  then
            Error( "<l> must lie in the base ring of <r>" );
        fi;

	# if <l> is trivial return -<r>
    	if l = r.baseRing.zero  then
    	    return r.baseRing.operations.FastPolynomial(
    	    	       r.baseRing,
    	    	       (-r.baseRing.one) * r.coefficients,
    	    	       r.valuation );
    	fi;

	# otherwise convert <l> into a polynomial
        l := r.baseRing.operations.Polynomial( r.baseRing, [l], 0 );
    fi;

    # handle the case <polynomial> - <scalar>
    if not (IsRec(r) and IsBound(r.isPolynomial) and r.isPolynomial)  then

	# if <r> is an integer convert it to a finite field element
        if IsInt(r)  then
            r := r * l.baseRing.one;

	# otherwise <r> must lie in the base ring of <l>
        elif not r in l.baseRing  then
            Error( "<r> must lie in the base ring of <l>" );
        fi;

	# if <r> is trivial return <l>
    	if r = l.baseRing.zero  then
    	    return l;
    	fi;

	# otherwise convert <l> into a polynomial
	r := l.baseRing.operations.Polynomial( l.baseRing, [r], 0 );
    fi;

    # our superclass will handle different depth
    if not IsBound(l.depth)  then  l.operations.Depth(l);  fi;
    if not IsBound(r.depth)  then  r.operations.Depth(r);  fi;
    if 1 <> l.depth or 1 <> r.depth  then
        return PolynomialOps.\-( l, r );

    # give up if we have different rings
    elif l.baseRing <> r.baseRing  then
        Error("polynomials must have the same ring");	

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
    	    AddCoeffs( dif, r.coefficients, -l.baseRing.one );

    	# if <l>.valuation is the minimum shift <r>
    	elif l.valuation < r.valuation  then
    	    val := l.valuation;
    	    dif := (-r.baseRing.one)*ShiftedCoeffs( r.coefficients, vdf );

            # a field is commutative
            AddCoeffs( dif, l.coefficients );

    	# otherwise they are equal
    	else
    	    val := l.valuation;
	    dif := Copy(l.coefficients);
            AddCoeffs( dif, r.coefficients, -r.baseRing.one );
    	fi;

        # return the product
        dif := l.baseRing.operations.FastPolynomial( l.baseRing, dif, val );
    	dif.depth := 1;
    	return dif;
    fi;


end;


#############################################################################
##
#F  FiniteFieldPolynomialOps.\*   . . . . . . . .  product of two polynomials
##
FiniteFieldPolynomialOps.\* := function( l, r )
    local   R,  prd,  val;

    # handle the case that one argument is a list
    if IsList(l)  then
    	return List(l, x -> x*r);
    elif IsList(r)  then
    	return List(r, x -> l*x);

    # handle the case <scalar> * <polynomial>
    elif not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then

	# if <l> is an integer convert it to a finite field element
        if IsInt( l )  then
	    l := l * r.baseRing.one;

	# otherwise <l> must lie in the base ring of <r>
	elif not l in r.baseRing  then
	    Error( "<l> must lie in the base ring of <r>" );
	fi;

    	# check the depth
        if not IsBound(r.depth)  then  r.operations.Depth(r);  fi;
    	if 1 < r.depth  then
    	    Error( "<r> must be polynomial over a finite field" );
    	fi;
	R := r.baseRing;

    	# compute the product
	if l = R.zero or r.coefficients = []  then
	    prd := [];
    	    val := 0;
        else
	    prd := l * r.coefficients;
    	    val := r.valuation;
	fi;
        prd            := R.operations.FastPolynomial( R, prd, val );
    	prd.depth      := 1;
    	prd.groundRing := R;

    	# and return
    	return prd;

    # handle the case <polynomial> * <scalar>
    elif not (IsRec(r) and IsBound(r.isPolynomial) and r.isPolynomial)  then

	# if <r> is an integer convert it to a finite field element
        if IsInt(r)  then
	    r := r * l.baseRing.one;

	# otherwise <r> must lie in the base ring of <l>
	elif not r in l.baseRing  then
	    Error( "<r> must lie in the base ring of <l>" );
	fi;

    	# check the depth
        if not IsBound(l.depth)  then  l.operations.Depth(l);  fi;
    	if 1 < l.depth  then
    	    Error( "<l> must be polynomial over a finite field" );
    	fi;
	R := l.baseRing;

    	# compute the product
	if r = R.zero or l.coefficients = []  then
	    prd := [];
    	    val := 0;
        else
	    prd := l.coefficients * r;
    	    val := l.valuation;
	fi;
        prd            := R.operations.FastPolynomial( R, prd, val );
    	prd.depth      := 1;
    	prd.groundRing := R;

    	# and return
    	return prd;
    fi;

    # our superclass will handle different depth
    if not IsBound(l.depth)  then  l.operations.Depth(l);  fi;
    if not IsBound(r.depth)  then  r.operations.Depth(r);  fi;
    if 1 <> l.depth or 1 <> r.depth  then
        return PolynomialOps.\*( l, r );

    # give up if we have different rings
    elif l.baseRing <> r.baseRing  then
        Error( "polynomials must have the same ring" );	

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
    	prd.groundRing := R;

        # return the product
        return prd;
    fi;

end;


#############################################################################
##
#F  FiniteFieldPolynomialOps.\mod . . . . . . .  remainder of two polynomials
##
FiniteFieldPolynomialOps.\mod := function( l, r )
    local   R,  rem,  val,  vdf;

    # both <l> and <r> must be polynomials and <r> must be non zero
    if not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then
    	Error( "<l> must be a polynomial" );
    fi;
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

    # reduce <l> by <r>
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
#F  FiniteFieldPolynomialOps.\^ . . . . . . . . . . .  power of a polynomials
##
FiniteFieldPolynomialOps.\^ := function( l, r )
    local   R,  pow,  val,  d;

    # <l> must be a polynomial and <r> a non-negative integer
    if not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then
    	Error( "<l> must be a polynomial" );
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
    R := l.baseRing;
    if not IsBound(l.depth)  then l.operations.Depth(l);  fi;
    d := l.depth;

    # if <r> is zero, return x^0
    if r = 0  then
    	return R.operations.FastPolynomial( R, [R.one], 0 );

    # if <r> is one return <l>
    elif r = 1  then
    	return l;

    # if <l> is trivial return
    elif Length(l.coefficients) = 0  then
    	return l;

    # if <l> is of degree less than 2, return
    elif Length(l.coefficients) = 1  then
    	pow := R.operations.FastPolynomial(
    	           R,
    	    	   [ l.coefficients[1]^r ],
    	    	   l.valuation*r );
    	pow.depth := d;
    	return pow;
    fi;

    # use repeated squaring
    val := l.valuation * r;
    l   := l.coefficients;
    pow := [ R.one ];
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
    pow := R.operations.FastPolynomial( R, pow, val );
    pow.depth := d;
    return pow;

end;


#############################################################################
##

#F  PrimePowersInt( <n> ) . . . . . . . . . .  return the prime powers of <n>
##
PrimePowersInt := function( n )
    local   p,  pows,  lst;

    if n = 1  then
	return [];
    elif n = 0  then
    	Error( "<n> must be non zero" );
    elif n < 0  then
    	n := -1 * n;
    fi;
    lst  := Factors( n );
    pows := [];
    for p  in Set( lst )  do
	Add( pows, p );
        Add( pows, Number( lst, x -> x = p ) );
    od;
    return pows;

end;


#############################################################################
##
#F  ProductPP( <l>, <r> ) . . . . . . . . . . . . product of two prime powers
##
ProductPP := function( l, r )
    local   res, p1, p2, ps, p, i, n;

    if l = []  then
	return r;
    elif r = []  then
	return l;
    fi;
    res := [];
    p1  := Sublist( l, 2 * [ 1 .. Length( l ) / 2 ] - 1 );
    p2  := Sublist( r, 2 * [ 1 .. Length( r ) / 2 ] - 1 );
    ps  := Set( Union( p1, p2 ) );
    for p  in ps  do
    	n := 0;
	Add( res, p );
        i := Position( p1, p );
        if i <> false   then
	    n := l[ 2*i ];
        fi;
        i := Position( p2, p );
        if i <> false  then
	    n := n + r[ 2*i ];
        fi;
        Add( res, n );
    od;
    return res;

end;


#############################################################################
##
#F  LcmPP( <l>, <r> ) . . . . . . . . . . . . lcm of prime powers <l> and <r>
##
LcmPP := function( l, r )
    local   res, p1, p2, ps, p, i, n;

    if l = []  then
	return r;
    elif r = []  then
	return l;
    fi;
    res := [];
    p1  := Sublist( l, 2 * [ 1 .. Length( l ) / 2 ] - 1 );
    p2  := Sublist( r, 2 * [ 1 .. Length( r ) / 2 ] - 1 );
    ps  := Set( Union( p1, p2 ) );
    for p  in ps  do
    	n := 0;
	Add( res, p );
        i := Position( p1, p );
        if i <> false   then
	    n := l[ 2*i ];
        fi;
        i := Position( p2, p );
        if i <> false and n < r[ 2*i ]  then
	    n := r[ 2*i ];
        fi;
        Add( res, n );
    od;
    return res;

end;


#############################################################################
##

#F  OrderKnownDividendList( <l>, <pp> )	. . . . . . . . . . . . . . . . local
##
##  Computes  an  integer  n  such  that  OnSets( <l>, n ) contains  only one
##  element e.  <pp> must be a list of prime powers of an integer d such that
##  n divides d. The functions returns the integer n and the element e.
##
OrderKnownDividendList := function( l, pp )

    local   pp1,	# first half of <pp>
    	    pp2,        # second half of <pp>
    	    a,          # half exponent of first prime power
    	    k,          # power of <l>
    	    o,  o1,     # computed order of <k>
    	    i;          # loop

    # if <pp> contains no element return order 1
    if Length(pp) = 0  then
    	return [ 1, l[1] ];

    # if <l> contains only one element return order 1
    elif Length(l) = 1  then
    	return [ 1, l[1] ];

    # if the dividend is a prime return
    elif Length(pp) = 2 and pp[2] = 1  then
    	return [ pp[1], l[1]^pp[1] ];

    # if the dividend is a prime power divide and conquer
    elif Length(pp) = 2  then
    	pp := Copy(pp);
    	a  := QuoInt( pp[2], 2 );
    	k  := OnSets( l, pp[1]^a );

    	# if <k> is trivial try smaller dividend
    	if Length(k) = 1  then
    	    pp[2] := a;
    	    return OrderKnownDividendList( l, pp );

    	# otherwise try to find order of <h>
    	else
    	    pp[2] := pp[2] - a;
    	    o := OrderKnownDividendList( k, pp );
    	    return [ pp[1]^a*o[1], o[2] ];
    	fi;

    # split different primes into two parts
    else
    	a   := 2 * QuoInt( Length(pp), 4 );
    	pp1 := Sublist( pp, [ 1 .. a ] );
    	pp2 := Sublist( pp, [ a+1 .. Length(pp) ] );

    	# compute the order of <l>^<pp1>
    	k := l;
    	for i  in [ 1 .. Length(pp2)/2 ]  do
    	    k := OnSets( k, pp2[2*i-1]^pp2[2*i] );
    	od;
    	o1 := OrderKnownDividendList( k, pp1 );

    	# compute the order of <l>^<o1> and return
    	o := OrderKnownDividendList( OnSets( l, o1[1] ), pp2 );
    	return [ o1[1]*o[1], o[2] ];
    fi;

end;


#############################################################################
##
#F  FiniteFieldPolynomialRingOps.OrderKnownDividend( <R>, <g>, <f>, <pp> )
##
##  Computes an integer n such that <g>^n = const  mod <f> where <g>  and <f>
##  are polynomials in <R> and <pp> is list  of prime powers of  an integer d
##  such that n divides  d.   The  functions  returns  the integer n  and the
##  element const.
##
OKDInd := "#I";

FiniteFieldPolynomialRingOps.OrderKnownDividend := function ( R, g, f, pp )
    local   a,  q,  h,  o,  l,  k,  i,  j,  r,  pp1,  pp2,  n1,  n2,  old;

    # adjust indent
    old    := OKDInd;
    OKDInd := ConcatenationString( OKDInd, "  " );

    # if <g> is constant return order 1
    InfoPoly2( OKDInd, "OrderKnownDividend:\n" );
    InfoPoly2( OKDInd, "  <g>  = ", g, "\n" );
    InfoPoly2( OKDInd, "  <f>  = ", f, "\n" );
    InfoPoly2( OKDInd, "  <pp> = ", pp, "\n" );
    if 0 = Degree(g)  then
	InfoPoly2( OKDInd, "  <g> is constant\n" );
        l := [ 1, g.coefficients[1] ];
        InfoPoly2( OKDInd, "OrderKnownDividend returns ", l, "\n" );
	OKDInd := old;
    	return l;

    # if the dividend is a prime, we must compute g^pp[1] to get the constant
    elif Length(pp) = 2 and pp[2] = 1  then
    	k := PowerMod( g, pp[1], f );
    	l := [ pp[1], k.coefficients[1] ];
        InfoPoly2( OKDInd, "OrderKnownDividend returns ", l, "\n" );
	OKDInd := old;
        return l;

    # if the dividend is a prime power find the necessary power
    elif Length(pp) = 2  then
	InfoPoly2( "#I    prime power, divide and conquer\n" );
        pp := Copy( pp );
        a  := QuoInt( pp[2], 2 );
	q  := pp[1] ^ a;
        h  := PowerMod( R, g, q, f );

	# if <h> is constant try again with smaller dividend
        if 0 = Degree(h)  then
	    pp[2] := a;
	    o := R.operations.OrderKnownDividend( R, g, f, pp );
        else
	    pp[2] := pp[2] - a;
	    l := R.operations.OrderKnownDividend( R, h, f, pp );
	    o := [ q*l[1], l[2] ];
        fi;
        InfoPoly2( "#I  OrderKnownDividend returns ", o, "\n" );
	OKDInd := old;
	return o;

    # split different primes.
    else

    	# divide primes
	InfoPoly2( OKDInd, "  ", Length(pp)/2, " different primes\n" );
	n1  := 1;  pp1 := [];
        n2  := 1;  pp2 := [];  q := 1;
        for i  in Reversed( [ 1 .. Length(pp)/2 ] )  do
	    if n1 < n2  then
	        Add( pp1, pp[2*i-1] );
                Add( pp1, pp[2*i] );
                n1 := n1 * pp[2*i-1];
            else
	        Add( pp2, pp[2*i-1] );
                Add( pp2, pp[2*i] );
                n2 := n2 * pp[2*i-1];
		q  := q * pp[2*i-1] ^ pp[2*i];
	    fi;
        od;
	InfoPoly2( OKDInd, "    <pp1> = ", pp1, "\n" );
	InfoPoly2( OKDInd, "    <pp2> = ", pp2, "\n" );

        # compute order for <pp1>
        k := PowerMod( R, g, q, f );
	o := R.operations.OrderKnownDividend( R, k, f, pp1 );

        # compute order for <pp2>
    	k := PowerMod( R, g, o[1], f );
	l := R.operations.OrderKnownDividend( R, k, f, pp2 );
    	o := [ o[1]*l[1], l[2] ];
        InfoPoly2( OKDInd, "OrderKnownDividend returns ", o, "\n" );
	OKDInd := old;
        return o;
    fi;

end;


#############################################################################
##
#F  FiniteFieldPolynomialRingOps.UpperBoundOrder( <R>, <f> )  . . .upper bound
##
##  Computes the  irreducible factors f_i  of a polynomial  <f>  over a field
##  with  p^n  elements.  It returns a list  l of triples (f_i,a_i,pp_i) such
##  that the p-part  of x  mod  f_i is p^a_i and  the p'-part divides d_i for
##  which the prime powers pp_i are given.
##
FiniteFieldPolynomialRingOps.UpperBoundOrder := function( R, f )
    local   F,  fs,  a,  pp,  f,  d,  L,  phi,  B,  i;

    # factorize <f> into irreducible factors
    InfoPoly2( "#I  UpperBoundOrder:\n" );
    fs := Collected( Factors( R, f ) );

    # get the field over which the polynomials are written
    F  := R.baseRing;

    # <phi>(m) gives ( minpol of 1^(1/m) )( F.char )
    L := [ PrimePowersInt( F.char-1 ) ];
    phi := function( m )
        local	x, d, pp, i;
        if not IsBound( L[m] )  then
	    x := F.char^m-1;
            for d  in Difference( DivisorsInt( m ), [m] )  do
	        pp := phi( d );
                for i  in [ 1 .. Length(pp)/2 ]  do
	            x := x / pp[2*i-1]^pp[2*i];
                od;
            od;
            L[m] := PrimePowersInt( x );
        fi;
        return L[m];
    end;

    # compute a_i and pp_i
    B := [];
    for i  in [ 1 .. Length(fs) ]  do

    	# p-part is p^Roof(Log_p(e_i)) where e_i is the multiplicity of f_i
    	a := 0;
    	if fs[i][2] > 1  then
    	    a := 1+LogInt(fs[i][2]-1,F.char);
    	fi;

    	# p'-part: (p^n)^d_i-1/(p^n-1) where d_i is the degree of f_i
    	d := Degree(fs[i][1]);
        InfoPoly2( "#I    irreducible factor of degree ", d, "\n" );
	pp := [];
        for f  in DivisorsInt( d*F.degree )  do
    	    if F.degree mod f <> 0  then
	    	pp := ProductPP( phi(f), pp );
    	    fi;
        od;

	# add <a> and <pp> to <B>
    	Add( B, [fs[i][1],a,pp] );
    od;

    # OK, that's it
    InfoPoly2( "#I  UpperBoundOrder returns ", B, "\n" );
    return B;

end;


#############################################################################
##
#F  FiniteFieldPolynomialRingOps.OrderScalar( <R>, <f> )  . . . . order of <f>
##
##  Return an  integer n  and a finite field element  const  such that x^n  =
##  const mod <f>.
##
FiniteFieldPolynomialRingOps.OrderScalar := function( R, f )
    local   U,  O,  x,  n,  g,  o,  q;

    # <f> must not be divisible by x.
    if 0 < f.valuation  then
    	Error( "<f> must have a non zero constant term" );
    fi;

    # if degree is zero, return
    if 0 = Degree(f)  then
    	return [ 1, f.coefficients[1] ];
    fi;

    # use 'UpperBoundOrder' to split <f> into irreducibles
    U := R.operations.UpperBoundOrder( R, f );

    # run through the irrducibles and compute their order
    x := Polynomial( R.baseRing, [ R.baseRing.zero, R.baseRing.one ] );
    O := [];
    n := 1;
    for g  in U  do
    	o := R.operations.OrderKnownDividend( R, x mod g[1], g[1], g[3] );
    	q := R.baseRing.char^g[2];
    	n := Lcm( n, o[1]*q );
	Add( O, [ o[1]*q, o[2]^q ] );
    od;

    # try to get the same constant in each block
    U := [];
    q := Size( R.baseRing ) - 1;
    for g  in O  do
    	AddSet( U, g[2]^((n/g[1]) mod q) );
    od;

    # return the order <n> times the order of <U>
    o := OrderKnownDividendList( U, PrimePowersInt(q) );
    return [ n*o[1], o[2] ];

end;
