#############################################################################
##
#A  polynom.g                   GAP library                      Frank Celler
##
#A  @(#)$Id: polynom.g,v 3.32 1994/06/15 13:56:06 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file  contains those functions that  are  dispatchers for polynomial
##  functions  and  the  polynomial   arithmetic.    The  idea  to  represent
##  polynomials as records containing '.baseRing'  and '.coefficients' is due
##  to S.Linton.
##
#H  $Log: polynom.g,v $
#H  Revision 3.32  1994/06/15  13:56:06  sam
#H  fixed definition of Conway polynomials
#H
#H  Revision 3.31  1994/04/26  10:23:50  sam
#H  added 'ConwayPolynomial' and some auxiliary stuff
#H
#H  Revision 3.30  1994/02/18  12:15:11  fceller
#H  changed internal functions slightly to allow mixed "vectors"
#H
#H  Revision 3.29  1994/01/27  11:38:56  sam
#H  added 'CyclotomicPolynomial'
#H
#H  Revision 3.28  1993/11/05  14:56:34  fceller
#H  added '.String'
#H
#H  Revision 3.27  1993/09/01  15:23:48  fceller
#H  fixed '/'
#H
#H  Revision 3.26  1993/07/23  05:15:34  martin
#H  changed 'PO./' to check that <r> (not <l>) is nonzero
#H
#H  Revision 3.25  1993/07/05  10:40:50  fceller
#H  add 'InterpolatedPolynomial'
#H
#H  Revision 3.24  1993/05/06  07:49:27  fceller
#H  <f> / <g> now computes the quotient in the Laurent ring
#H
#H  Revision 3.23  1993/02/11  16:47:56  fceller
#H  added <list> + <polynomial>
#H
#H  Revision 3.22  1993/02/08  11:56:05  fceller
#H  ground ring is now stored in polynomial record
#H
#H  Revision 3.21  1993/02/04  13:47:12  fceller
#H  added '/' and 'EuclideanQuotient'
#H
#H  Revision 3.20  1993/02/03  12:36:06  fceller
#H  fixed undeclared local variables
#H
#H  Revision 3.19  1993/01/25  13:18:26  fceller
#H  fixed '=' and '<' to handle iterated polynomials
#H
#H  Revision 3.18  1993/01/20  11:09:02  fceller
#H  changed 'DisplayPolynomial' again (in order to display
#H  polynomials over the cyclotmics)
#H
#H  Revision 3.17  1993/01/06  15:44:35  fceller
#H  changed 'LeadingCoefficient' to handle the trivial polynomial
#H
#H  Revision 3.16  1993/01/04  11:18:50  fceller
#H  added 'LeadingCoefficient'
#H
#H  Revision 3.15  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.14  1992/12/07  07:41:08  fceller
#H  fixed 'Quotient( 0, f )'
#H
#H  Revision 3.13  92/11/25  12:34:28  fceller
#H  added 'Degree'
#H  
#H  Revision 3.12  1992/11/19  14:12:23  fceller
#H  changed 'DisplayPolynomial'
#H
#H  Revision 3.11  92/11/16  12:23:24  fceller
#H  added Laurent polynomials
#H  
#H  Revision 3.10  1992/08/13  13:11:09  fceller
#H  added 'Indeterminate'
#H
#H  Revision 3.9  1992/07/24  07:08:07  fceller
#H  improved '*' to allow <nullpoly> * <int>
#H
#H  Revision 3.8  1992/07/23  09:04:18  fceller
#H  improved '*' to allow <int> * <polynomial>
#H
#H  Revision 3.7  1992/06/17  07:06:04  fceller
#H  moved '<somedomain>.operations.Polynomial' function to "<somedomain>.g"
#H
#H  Revision 3.6  1992/06/05  09:58:04  fceller
#H  improved 'Derivative'
#H
#H  Revision 3.5  1992/06/01  07:33:55  fceller
#H  added 'Value'
#H
#H  Revision 3.4  1992/05/25  09:10:05  fceller
#H  added 'EmbeddedPolynomial', fixed a bug
#H
#H  Revision 3.3  1992/05/07  10:29:16  fceller
#H  added 'CompanionMatrix', better pretty printing in 'DisplayPolynomial'
#H
#H  Revision 3.2  1992/04/21  10:37:47  fceller
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

#F  Polynomial( <R>, <coeffs>, <val> )  . . . . . . . . . polynomial over <R>
##
Polynomial := function( arg )
    local   R,  coeffs,  val;

    # check the argument list
    if 2 = Length(arg)  then
    	R := arg[1];
    	coeffs := arg[2];
    	val := 0;
    elif 3 = Length(arg)  then
    	R := arg[1];
    	coeffs := arg[2];
    	val := arg[3];
    else
    	Error( "usage: Polynomial( <R>, <coeffs>, <val> )",
    	       "or Polynomial( <R>, <coeffs> )" );
    fi;

    # <R> must be a ring with one or a field
    if not IsField(R) and not IsRing(R)  then
    	Error("<R> must be a field or ring");
    elif IsRing(R) and not IsBound(R.one)  then
    	Error("<R> must be a ring with one");
    fi;

    # construct the polynomial
    return R.operations.Polynomial( R, coeffs, val );

end;


#############################################################################
##
#F  IsPolynomial( <obj> ) . . . . . . . . . . . . . . . is <obj> a polynomial
##
IsPolynomial := function( obj )
    return IsRec(obj) and IsBound(obj.isPolynomial) and obj.isPolynomial;
end;


#############################################################################
##
#F  CompanionMatrix( <R>, <f> ) . . . . . . . . . . . . . .  companion matrix
##
CompanionMatrix := function( R, f )

    # check <R> and <f>
    if not IsPolynomial( f )  then
    	Error( "<f> must be a polynomial" );
    elif f.valuation < 0  then
    	Error( "<f> must not be a Laurent polynomial" );
    fi;

    # check that the coefficients of <f> are in the base ring of <R>
    if not ForAll( f.coefficients, x -> x in R.baseRing )  then
    	Error( "cannot write <f> over <R>.baseRing" );
    fi;

    # return the companion matrix of <f>
    return R.operations.CompanionMatrix( R, f );

end;

#############################################################################
##
#F  IsPrimitivePolynomial( [<F>,] <pol> )
##
##  A polynomial $f$ of degree $n$ is called primitive
##  (over the field $GF(q)$) if $f$ is irreducible, monic, and is the minimal
##  polynomial of a primitive root of $GF(q^n)$.
##
##  $f$ is primitive if and only if
##  1. $f$ divides $X^{q^n-1} -1$, and
##  2. $f$ does not divide $X^{(q^n-1)/p} - 1$ for every prime divisor $p$
##     of $q^n - 1$.
##
IsPrimitivePolynomial := function( arg )

    local pol,         # input polynomial
          F,           # field over that primitivity is tested
          coeffs,      # coefficients of 'pol'
          pmc,         # result of 'PowerModCoeffs'
          size,        # size of mult. group of 'F'
          x,           # polynomial 'x'
          primes,      # prime factors of 'size'
          p;           # loop over 'primes'

    # Get and check the arguments.
    if Length( arg ) = 1 and IsPolynomial( arg[1] ) then
      pol := arg[1];
      F   := pol.baseRing;
    elif Length( arg ) = 2 and IsField( arg[1] )
                           and IsPolynomial( arg[2] ) then
      pol := arg[2];
      F   := arg[1];
    else
      Error( "usage: IsPrimitivePolynomial([<F>,] <pol> )" );
    fi;

    if not IsFinite( F ) then
      Error( "for polynomials over finite fields only" );
    fi;

    coeffs:= ShiftedCoeffs( pol.coefficients, pol.valuation );
    size:= Size( F ) ^ ( Length( coeffs ) - 1 ) - 1;
    x:= [ F.zero, F.one ];

    # Primitive polynomials divide the polynomial 'x^(p^n-1) - 1' \ldots
    pmc:= PowerModCoeffs( x, size, coeffs );
    ShrinkCoeffs( pmc );
    if pmc <> [ F.one ] then
      return false;
    fi;

    # \ldots and are not divisible by 'x^m - 1' for proper divisors 'm'
    # of 'p^n-1'.
    primes:= Set( Factors( size ) );
    for p in primes do
      pmc:= PowerModCoeffs( x, size / p, coeffs );
      ShrinkCoeffs( pmc );
      if pmc = [ F.one ] then
        return false;
      fi;
    od;
    return true;
    end;

###############################################################################
##
##  PowerModEvalPol( <f>, <g>, <xpownmodf> )
##
##  computes the coefficients list of the polynomial $g( x^n ) \bmod f$, for
##  the given coefficients lists of the two polynomials $f$ and $g$, and the
##  coefficients list of $x^n \bmod f$.
##
##  We evaluate $g$ at $x^n \bmod f$, and use Horner\'s method and reduction
##  modulo $f$ for computing the result.
##  If $g = \sum_{i=0}^k g_i x^i$ then we compute
##  $( \cdots (((c_k x^n + c_{k-1}) x^n + c_{k-2}) + c_{k-3}) x^n + \cdots c_0$.
##
##  (used in 'ConwayPol')
##
PowerModEvalPol := function( f, g, xpownmodf )

    local l,    # length of coefficients of 'g'
          res,  # result
          i;    # loop over coefficients of 'g'

    l:= Length( g );
    res:= [ g[l] ];
    for i in [ 1 .. l-1 ] do
      res:= ProductCoeffs( res, xpownmodf );   # 'res:= res \*\ x\^\ n;'
      ReduceCoeffs( res, f );                  # 'res:= res mod f;'
      res:= SumCoeffs( res, [ g[l-i] ] );      # 'res:= res + g_{l-i+1};'
      ShrinkCoeffs( res );
    od;
    return res;
    end;

############################################################################
##
#V  CONWAYPOLYNOMIALS
##
CONWAYPOLYNOMIALS := [];
    CONWAYPOLYNOMIALS[2] := [
    [1],
    [1,1],
    [1,1],
    [1,1],
    [1,0,1],
    [1,1,0,1,1],
    [1,1],
    [1,0,1,1,1],
    [1,0,0,0,1],
    [1,1,1,1,0,1,1],
    [1,0,1],
    [1,1,0,1,0,1,1,1],
    [1,1,0,1,1],
    [1,0,0,1,0,1,0,1],
    [1,0,1,0,1,1],
    [1,0,1,1,0,1],
    [1,0,0,1],
    [1,1,0,0,0,0,0,0,0,0,1,0,1],
    [1,1,1,0,0,1],
    [1,1,0,0,1,1,1,1,0,1,1],
    [1,0,1,0,0,1,1],
    [1,0,0,0,0,1,1,0,1,1,1,1,1],
    [1,0,0,0,0,1],
    [1,0,0,1,0,1,0,1,0,1,1,0,0,1,1,1,1],
    [1,0,1,0,0,0,1,0,1],
    [1,1,0,0,1,0,1,1,1,0,1,0,0,0,1],
    [1,0,1,1,0,1,0,1,0,1,1,0,1],
    [1,0,1,0,0,1,1,1,0,0,0,0,0,1],
    [1,0,1],
    [1,1,1,1,0,1,0,1,0,0,0,1,0,1,0,0,1,1],
    [1,0,0,1],
    [1,0,0,1,1,0,0,1,0,1,0,0,0,0,0,1],
    [1,0,0,1,0,0,1,0,1,0,1,1,1,1],
    [1,1,1,0,1,1,1,1,1,0,0,1,1,0,0,1,1],
    [1,0,1,0,0,1,0,1,0,0,1,1],
    [1,1,0,0,0,1,1,0,1,0,0,0,0,1,1,0,0,1,0,1,1,0,1,1],
    [1,1,1,1,1,1],
    [1,1,1,0,0,1,0,0,1,1,1,0,0,0,1],
    [1,0,1,0,0,1,1,1,0,1,1,1,1,0,0,1],
    ,
    [1,0,0,1],
    ,
    [1,0,0,1,1,0,1],
    ,
    ,
    ,
    [1,0,0,0,0,1],
    ,
    [1,1,1,1,1,0,1,0,1,0,1],
    ];
    CONWAYPOLYNOMIALS[3] := [
    [1],
    [2,2],
    [1,2],
    [2,0,0,2],
    [1,2],
    [2,2,1,0,2],
    [1,0,2],
    [2,2,2,0,1,2],
    [1,1,2,2],
    [2,1,0,0,2,2,2],
    [1,0,2],
    [2,0,1,0,1,1,1],
    [1,2],
    [2,0,1,2,0,1,2,1,1,2],
    [1,1,2,0,0,1,0,0,2],
    [2,1,2,2,2,0,2,2],
    [1,2],
    [2,0,2,0,2,1,2,0,2,0,1],
    [1,0,2],
    ,
    [1,2,0,2,0,1,2,0,2,0,2],
    [2,2,0,1,0,1,1,1,2,2,1,2],
    [1,1,0,1],
    ,
    [1,2,1,1,0,2,2],
    ,
    [1,0,0,0,0,0,0,2],
    ,
    [1,0,0,0,2],
    ,
    [1,1,0,1],
    ,
    ,
    ,
    ,
    ,
    [1,2,2,1],
    ,
    ,
    ,
    [1,2],
    ,
    [1,1,0,1],
    ,
    ,
    ,
    [1,2,2,0,2],
    ,
    [1,1,0,0,1,1,0,1,1],
    ];
    CONWAYPOLYNOMIALS[5] := [
    [3],
    [2,4],
    [3,3],
    [2,4,4],
    [3,4],
    [2,0,1,4,1],
    [3,3],
    [2,4,3,0,1],
    [3,1,0,2],
    [2,1,4,2,3,3],
    [3,3],
    [2,2,3,4,4,0,1,1],
    [3,3,4],
    [2,1,0,3,2,4,4,0,1],
    [3,4,3,3,0,2],
    [2,1,4,4,2,4,4,4,1],
    [3,2,3],
    ,
    [3,2,0,1],
    ,
    ,
    ,
    [3,0,2],
    ,
    [3,4,2,4,0,1,3],
    ,
    ,
    ,
    [3,1,3,1],
    ,
    [3,3],
    ,
    ,
    ,
    ,
    ,
    [3,3,4],
    ,
    ,
    ,
    [3,0,0,4],
    ,
    [3,3],
    ,
    ,
    ,
    [3,0,4,1,4],
    ];
    CONWAYPOLYNOMIALS[7] := [
    [4],
    [3,6],
    [4,0,6],
    [3,4,5],
    [4,1],
    [3,6,4,5,1],
    [4,6],
    [3,2,6,4],
    [4,6,0,1,6],
    [3,3,2,1,4,1,1],
    [4,1],
    [3,0,5,0,4,2,3,5,2],
    [4,0,6],
    [3,6,3,0,2,6,0,5],
    [4,2,1,4,6,6,5],
    [3,4,2,6,1,4,3,5,4],
    [4,1],
    ,
    [4,0,5],
    ,
    ,
    ,
    [4,4,4],
    ,
    ,
    ,
    ,
    ,
    [4,6],
    ,
    [4,0,5],
    ,
    ,
    ,
    ,
    ,
    [4,6],
    ,
    ,
    ,
    [4,1,4,1],
    ,
    [4,2,5],
    ,
    ,
    ,
    [4,3,4],
    ];
    CONWAYPOLYNOMIALS[11] := [
    [9],
    [2,7],
    [9,2],
    [2,10,8],
    [9,0,10],
    [2,7,6,4,3],
    [9,4],
    [2,7,1,7,7],
    [9,8,9],
    [2,6,6,10,8,7],
    [9,10],
    ,
    [9,7],
    ,
    ,
    ,
    [9,4],
    ,
    [9,2,8],
    ,
    ,
    ,
    [9,1,8],
    ,
    ,
    ,
    ,
    ,
    [9,2],
    ,
    [9,6,7],
    ,
    ,
    ,
    ,
    ,
    [9,4,10],
    ,
    ,
    ,
    [9,6,0,1],
    ,
    [9,9],
    ,
    ,
    ,
    [9,7,8],
    ];
    CONWAYPOLYNOMIALS[13] := [
    [11],
    [2,12],
    [11,2],
    [2,12,3],
    [11,4],
    [2,11,11,10],
    [11,3],
    [2,3,2,12,8],
    [11,12,12,8,12],
    [2,1,1,8,5,7],
    [11,3],
    ,
    [11,12],
    ];
    CONWAYPOLYNOMIALS[17] := [
    [14],
    [3,16],
    [14,1],
    [3,10,7],
    [14,1],
    [3,3,10,0,2],
    [14,12],
    [3,6,0,12,11],
    [14,8,7],
    [3,12,9,5,6,13],
    [14,5],
    ];
    CONWAYPOLYNOMIALS[19] := [
    [17],
    [2,18],
    [17,4],
    [2,11,2],
    [17,5],
    [2,6,17,17],
    [17,6],
    [2,3,10,12,1],
    [17,16,14,11],
    [2,4,3,17,13,18],
    [17,8],
    ];
    CONWAYPOLYNOMIALS[23] := [
    [18],
    [5,21],
    [18,2],
    [5,19,3],
    [18,3],
    [5,1,9,9,1],
    [18,21],
    [5,3,5,20,3],
    [18,9,8,3],
    [5,1,6,15,5,17],
    ];
    CONWAYPOLYNOMIALS[29] := [
    [27],
    [2,24],
    [27,2],
    [2,15,2],
    [27,3],
    [2,13,17,25,1],
    [27,2],
    [2,23,26,24,3],
    [27,22,22,4],
    ];
    CONWAYPOLYNOMIALS[31] := [
    [28],
    [3,29],
    [28,1],
    [3,16,3],
    [28,7],
    [3,8,16,19],
    [28,1],
    [3,24,12,25],
    [28,29,20,4],
    ,
    [28,20],
    ];
    CONWAYPOLYNOMIALS[37] := [
    [35],
    [2,33],
    [35,6],
    [2,24,6],
    [35,10],
    [2,30,4,35],
    [35,7],
    [2,1,27,20,7],
    [35,32,20,6],
    ];

############################################################################
##
#F  ConwayPol( <p>, <n> ) . . . . . <n>-th Conway polynomial in charact. <p>
##
ConwayPol := function( p, n )

    local F,           # 'GF(p)'
          eps,         # $(-1)^n$ in 'F'
          x,           # indeterminate over 'F', as coefficients list
          cpol,        # actual candidate for the Conway polynomial
          nfacs,       # all 'n/d' for prime divisors 'd' of 'n'
          cpols,       # Conway polynomials for 'd' in 'nfacs'
          pp,          # $p^n-1$
          quots,       # list of $(p^n-1)/(p^d-1)$, for $d$ in 'nfacs'
          ppmin,       # list of $(p^n-1)/d$, for prime factors $d$ of $p^n-1$
          found,       # is the actual candidate compatible?
          pow,         # powers of several polynomials
          i,           # loop over 'ppmin'
          xpownmodf,   # power of 'x', modulo 'cpol'
          c,           # loop over 'cpol'
          e;           # 1 or -1, used to compute the next candidate

    # Check the arguments.
    if not ( IsPrimeInt( p ) and IsInt( n ) and n > 0 ) then
      Error( "<p> must be a prime, <n> a positive integer" );
    fi;

    if not IsBound( CONWAYPOLYNOMIALS[p] ) then
      CONWAYPOLYNOMIALS[p]:= [];
    fi;
    if not IsBound( CONWAYPOLYNOMIALS[p][n] ) then

      F:= GF(p);

      if n mod 2 = 1 then
        eps:= - F.one;
      else
        eps:=   F.one;
      fi;

      # polynomial 'x' (as coefficients list)
      x:=[ F.zero, F.one ];

      # Initialize the smallest polynomial of degree 'n' that is a candidate
      # for being the Conway polynomial.
      # This is 'x^n + (-1)^n \*\ z' for the smallest primitive root 'z'.
      # If the field can be realized in {\GAP} the constant 'z' is just 'Z(p)'.

      # Note that we enumerate monic polynomials with constant term
      # $(-1)^n \alpha$ where $\alpha$ is the smallest primitive element in
      # $GF(p)$ by the compatibility condition (and by existence of such a
      # polynomial).

      cpol:= List( [ 1 .. n ], y -> F.zero );
      cpol[ n+1 ]:= F.one;
      cpol[1]:= eps * PrimitiveRootMod(p);

      if n > 1 then

        # Compute the list of all 'n / p' for 'p' a prime divisor of 'n'
        nfacs:= List( Set( FactorsInt( n ) ), d -> n / d );

        if nfacs = [ 1 ] then

          # 'n' is a prime, we have to check compatibility only with
          # the degree 1 Conway polynomial.
          # But this condition is satisfied by choice of the constant term
          # of the candidates.
          cpols:= [];

        else

          # Compute the Conway polynomials for all values $<n> / d$
          # where $d$ is a prime divisor of <n>.
          # They are used for checking compatibility.
          cpols:= List( nfacs, d -> ConwayPol( p, d ) * F.one );

        fi;

        pp:= p^n-1;

        quots:= List( nfacs, x -> pp / ( p^x -1 ) );
        ppmin:= List( Set( FactorsInt( pp ) ), d -> pp/d );

        found:= false;

        while not found do

          # Test whether 'cpol' is primitive.
          #  $f$ is primitive if and only if
          #  1. $f$ divides $X^{q^n-1} -1$, and
          #  2. $f$ does not divide $X^{(q^n-1)/p} - 1$ for every
          #     prime divisor $p$ of $q^n - 1$.

          pow:= PowerModCoeffs( x, pp, cpol );
          ShrinkCoeffs( pow );
          found:= pow = [ F.one ];

          i:= 1;
          while found and ( i <= Length( ppmin ) ) do
            pow:= PowerModCoeffs( x, ppmin[i], cpol );
            ShrinkCoeffs( pow );
            found:= pow <> [ F.one ];
            i:= i+1;
          od;

          # Test compatibility with polynomials in 'cpols'.
          i:= 1;
          while found and i <= Length( cpols ) do

            # Compute $'cpols[i]'( x^{\frac{p^n-1}{p^m-1}} ) mod 'cpol'$.
            xpownmodf:= PowerModCoeffs( x, quots[i], cpol );
            pow:= PowerModEvalPol( cpol, cpols[i], xpownmodf );
            ShrinkCoeffs( pow );
            found:= Length( pow ) = 0;
            i:= i+1;

          od;

          if not found then

            # Compute the next candidate according to the chosen ordering.

            # We have $f$ smaller than $g$ for two polynomials $f$, $g$ of
            # degree $n$ with
            # $f = \sum_{i=0}^n (-1)^{n-i} f_i x^i$ and
            # $g = \sum_{i=0}^n (-1)^{n-i} g_i x^i$ if and only if exists
            # $m\leq n$ such that $f_m \< g_m$,
            # and $f_i = g_i$ for all $i > m$.
            # (Note that the thesis of W. Nickel gives a wrong definition.)

            c:= 0;
            e:= eps;
            repeat
              c:= c+1;
              e:= -1*e;
              cpol[c+1]:= cpol[c+1] + e;
            until cpol[c+1] <> F.zero;

          fi;

        od;

      fi;

      cpol:= List( cpol, IntFFE );
      found:= Copy( cpol );

      # Subtract 'x^n', strip leading zeroes,
      # and store this polynomial in the global list.
      Unbind( found[ n+1 ] );
      ShrinkCoeffs( found );
      CONWAYPOLYNOMIALS[p][n]:= found;

    else

      # Decode the polynomial stored in the list.
      # (Append necessary zeroes.)
      cpol:= Copy( CONWAYPOLYNOMIALS[p][n] );
      while Length( cpol ) < n do
        Add( cpol, 0 );
      od;
      Add( cpol, 1 );

    fi;

    # Return the coefficients list.
    return cpol;
    end;

############################################################################
##
#F  ConwayPolynomial( <p>, <n> ) .  <n>-th Conway polynomial in charact. <p>
##
##  returns the Conway polynomial of the finite field $GF(p^n)$ as
##  polynomial over the Rationals.
##
##  The *Conway polynomial* $\Phi_{n,p}$ of $GF(p^n)$ is defined by the
##  following properties.
##
##  First define an ordering of polynomials of degree $n$ over $GF(p)$ as
##  follows.  $f = \sum_{i=0}^n (-1)^i f_i x^i$ is smaller than
##  $g = \sum_{i=0}^n (-1)^i g_i x^i$ if and only if there is an index
##  $m \leq n$ such that $f_i = g_i$ for all $i > m$, and
##  $\tilde{f_m} \< \tilde{g_m}$, where $\tilde{c}$ denotes the integer
##  value in $\{ 0, 1, \ldots, p-1 \}$ that is mapped to $c\in GF(p)$ under
##  the canonical epimorphism that maps the integers onto $GF(p)$.
##
##  $\Phi_{n,p}$ is primitive over $GF(p)$, that is, it is irreducible,
##  monic, and is the minimal polynomial of a primitive element of
##  $GF(p^n)$.
##
##  For all divisors $d$ of $n$ the compatibility condition
##  $\Phi_{d,p}( x^{\frac{p^n-1}{p^m-1}} ) \equiv 0 \pmod{\Phi_{n,p}(x)}$
##  holds.
##
##  With respect to the ordering defined above, $\Phi_{n,p}$ shall be
##  minimal.
##
ConwayPolynomial := function( p, n )
    if not IsPrimeInt( p ) or not IsInt( n ) or not n > 0 then
      Error( "<p> must be a prime, <n> a positive integer" );
    fi;
    return Polynomial( Rationals, ConwayPol( p, n ) );
    end;

############################################################################
##
#V  CYCLOTOMICPOLYNOMIALS  . . . . . . . . .  list of cyclotomic polynomials
##
##  global list encoding cyclotomic polynomials by their coefficients lists
##  over the integers
##
CYCLOTOMICPOLYNOMIALS := [];

############################################################################
##
#F  CyclotomicPol( <n> ) . . .  coefficients of <n>-th cyclotomic polynomial
##
##  returns the coefficients list of the <n>-th cyclotomic polynomial over
##  the integers.
##
CyclotomicPol := function( n )

    local    f,   # result (after stripping off other cyclotomic polynomials)
             div, # divisors of 'n'
             d,   # one divisor of 'n'
             q,   # coefficiens of a quotient that arises in division
             g,   # coefficients of 'd'-th cyclotomic polynomial
             l,   # degree of 'd'-th cycl. pol.
             m,
             i,
             c,
             k;

    if not IsBound( CYCLOTOMICPOLYNOMIALS[ n ] ) then

        # We have to compute the polynomial. Start with 'X^n - 1' ...
        f := List( [ 1 .. n ], x -> 0 );
        f[1]     := -1;
        f[ n+1 ] :=  1;

        div:= DivisorsInt( n );
        RemoveSet( div, n );

        # ... and divide by all 'd'-th cyclotomic polynomials
        # for proper divisors 'd' of 'n'.
        for d in div do
            q := [];
            g := CyclotomicPol( d );
            l := Length( g );
            m := Length( f ) - l;
            for i  in [ 0 .. m ]  do
                c := f[ m - i + l ] / g[ l ];
                for k  in [ 1 .. l ]  do
                    f[ m - i + k ] := f[ m - i + k ] - c * g[k];
                od;
                q[ m - i + 1 ] := c;
            od;
            f:= q;
        od;

        # store the coefficients list
        CYCLOTOMICPOLYNOMIALS[n]:= f;
    else

        # just fetch the coefficients list
        f := CYCLOTOMICPOLYNOMIALS[n];
    fi;

    # return the coefficients list
    return f;
    end;

############################################################################
##
#F  CyclotomicPolynomial( <F>, <n> ) . . . . . .  <n>-th cycl. pol. over <F>
##
##  returns the <n>-th cyclotomic polynomial over the ring <F>.
##
CyclotomicPolynomial := function( F, n )

    if not IsInt( n ) or n <= 0 or not IsField( F ) then
        Error( "<n> must be a positive integer, <F> a field" );
    fi;

    if F.char <> 0 then

        # replace 'n' by its $p^{\prime}$ part
        while n mod F.char = 0  do
            n := n / F.char;
        od;
    fi;
    return Polynomial( F, F.one * CyclotomicPol(n), 0 );
    end;

#############################################################################
##
#F  EmbeddedPolynomial( <R>, <f> )  . . . . . . . embed polynomial <f> in <R>
##
EmbeddedPolynomial := function( R, f )

    # check <R> and <f>
    if not IsPolynomial(f)  then
    	Error( "<f> must be a polynomial" );
    fi;

    # check that the coefficients of <f> are in the base ring of <R>
    if not ForAll( f.coefficients, x -> x in R.baseRing )  then
    	Error( "cannot write <f> over <R>.baseRing" );
    fi;

    # convert
    return R.operations.EmbeddedPolynomial( R, f );

end;


#############################################################################
##
#F  RandomPol( <R>, <deg> ) . . . . . . . . . . . . . . . . random polynomial
##
##  'RandomPol' returns a  random polynomial of  degree less than or equal to
##  <deg>,  which must be a nonnegativ integer,  whose coefficients come from
##  a ring <R>.
##
RandomPol := function ( R, deg )
    local  rand,  i;

    rand := [];
    for i  in [ 1 .. deg+1 ]  do
        rand[i] := Random( R );
    od;
    return Polynomial( R, rand );

end;


#############################################################################
##
#F  Value( <f>, <x> ) . . . . . . . . . . . . . . . . . . . . return <f>(<x>)
##
Value := function( f, x )
    return f.operations.Value( f, x );
end;


#############################################################################
##
#F  Indeterminate( <R> )  . . . . . . . . . . . . . . indeterminate of a ring
##
Indeterminate := function( R )
    if not IsBound( R.indeterminate )  then
    	R.indeterminate := R.operations.Indeterminate( R );
    fi;
    return R.indeterminate;
end;

X := Indeterminate;


#############################################################################
##
#F  InterpolatedPolynomial( <R>, <x>, <y> ) . . . . . . . . . . interpolation
##
##  'InterpolatedPolynomial' returns, for given lists <x>, <y> of elements in
##  a ring  <R> of  the  same lenth $n$ say, the  unique polynomial of degree
##  less than $n$ which has value <y>[i] at <x>[i], for all $i=1,...,n$. Note
##  that the elements in <x> must be distinct.
##
InterpolatedPolynomial := function ( R, x, y )
    return R.operations.InterpolatedPolynomial( R, x, y );
end;


#############################################################################
##

#F  LaurentPolynomialRing( <R> )  . . . .  full Laurent polynom ring over <R>
##
LaurentPolynomialRing := function( R )
    local   i,  B;

    # <R> must be a ring with one
    if not IsRing(R) and not IsField(R)  then
        Error( "<R> must be a ring or field" );
    elif IsRing(R) and not IsBound(R.one)  then
        Error( "<R> must be a ring with one" );
    fi;

    # check if the polynom ring is already known
    if not IsBound(R.laurentPolynomialRing)  then
        R.laurentPolynomialRing := R.operations.LaurentPolynomialRing(R);
        if IsBound(R.laurentPolynomialRing.generators)  then
    	    B := R.laurentPolynomialRing.generators;
            for i  in [ 1 .. Length(B) ]  do
                R.laurentPolynomialRing.(i) := B[i];
            od;
        fi;
    fi;
    return R.laurentPolynomialRing;

end;


#############################################################################
##
#F  IsLaurentPolynomialRing( <obj> )  . . . . . is <R> a Laurent polynom ring
##
IsLaurentPolynomialRing := function( obj )
    return     IsRec(obj)
    	   and IsBound(obj.isLaurentPolynomialRing)
    	   and obj.isLaurentPolynomialRing;
end;


#############################################################################
##
#V  LaurentPolynomialRingOps  . . . . . . . . . full Laurent polynom ring ops
##
LaurentPolynomialRingOps := Copy( RingOps );
LaurentPolynomialRingOps.name := "LaurentPolynomialRingOps";


#############################################################################
##
#F  LaurentPolynomialRingOps.\in . . . . . . . . . . . . . . membership test
##
LaurentPolynomialRingOps.\in := function( p, P )
    return     IsRec( p )
           and IsBound( p.isPolynomial )
           and p.isPolynomial
           and p.baseRing = P.baseRing;
end;


#############################################################################
##
#F  LaurentPolynomialRingOps.Factors( <R>, <f> )  . . . . . .  factors of <f>
##
LaurentPolynomialRingOps.Factors := function( R, f )
    local   g,  r;

    # factorize the standard associate of <f>
    g := StandardAssociate( R, f );
    r := Factors( PolynomialRing(R.baseRing), g );
    if 0 < Length(r)  then
	r[1] := Quotient(R,f,g) * r[1];
    fi;
    return r;

end;


#############################################################################
##
#F  LaurentPolynomialRingOps.Quotient( <R>, <l>, <r> )  . . . . . . <l> / <r>
##
LaurentPolynomialRingOps.Quotient := function ( R, f, g )
    local   m,  n,  i,  k,  c,  q,  R,  val;

    # get the base ring
    R := R.baseRing;

    # if <f> is zero return it
    if 0 = Length(f.coefficients)  then
	return f;
    fi;

    # get the value of the valuation of <f> / <g>
    val := f.valuation - g.valuation;

    # Try to divide <f> by <g>
    q := [];
    n := Length( g.coefficients );
    m := Length( f.coefficients ) - n;
    f := ShallowCopy( f.coefficients );
    if IsField(R)  then
        for i  in [0 .. m ]  do
            c := f[m-i+n] / g.coefficients[n];
            for k  in [ 1 .. n ]  do
                f[m-i+k] := f[m-i+k] - c * g.coefficients[k];
            od;
            q[m-i+1] := c;
        od;
    else
        for i  in [0 .. m ]  do
            c := Quotient( R, f[m-i+n], g.coefficients[n] );
    	    if c = false  then return false;  fi;
            for k  in [ 1 .. n ]  do
                f[m-i+k] := f[m-i+k] - c * g.coefficients[k];
            od;
            q[m-i+1] := c;
        od;
    fi;

    # Did the division work?
    for i  in [ 1 .. m+n ]  do
    	if f[i] <> R.zero  then
    	    return false;
    	fi;
    od;
    return Polynomial( R, q, val );

end;


#############################################################################
##
#F  LaurentPolynomialRingOps.Derivative( <R>, <f> ) . . . . . . .  derivative
##
Derivative := function( arg )
    local   R,  f;

    if Length(arg) = 2  then
    	R := arg[1];
    	f := arg[2];
    else
    	f := arg[1];
    	R := DefaultRing(f);
    fi;
    return R.operations.Derivative( R, f );

end;

LaurentPolynomialRingOps.Derivative := function( R, f )
    local  d,  i;

    d := [];
    for i  in [ 1 .. Length(f.coefficients) ]  do
        d[i] := (i+f.valuation-1) * f.coefficients[i];
    od;
    return Polynomial( R.baseRing, d, f.valuation-1 );

end;


#############################################################################
##
#F  LaurentPolynomialRingOps.EuclideanDegree( <R>, <f> )  . . . degree of <f>
##
LaurentPolynomialRingOps.EuclideanDegree := function( R, f )
    return Length(f.coefficients)-1;
end;


#############################################################################
##
#F  LaurentPolynomialRingOps.StandardAssociate( <R>, <f> ) standard associate
##
LaurentPolynomialRingOps.StandardAssociate := function( R, f )
    local   l,  a;

    # <f> should be nontrivial
    if 0 < Length(f.coefficients)  then

        # get standard associate of leading term
        l := f.coefficients[Length(f.coefficients)];
        a := Quotient( R.baseRing, StandardAssociate( R.baseRing, l ), l );
    	f := Polynomial(R.baseRing,List(f.coefficients,x->a*x),0);
    	f.valuation := 0;
    fi;
    return f;

end;


#############################################################################
##
#F  LaurentPolynomialRingOps.EmbeddedPolynomial( <R>, <f> )  embed polynomial
##
LaurentPolynomialRingOps.EmbeddedPolynomial := function( R, f )
    return Polynomial( R.baseRing, f.coefficients, f.valuation );
end;


#############################################################################
##
#F  LaurentPolynomialRingOps.Print( <P> ) . . . . . . . . . . pretty printing
##
LaurentPolynomialRingOps.Print := function( P )
    if IsBound( P.name )  then
        Print( P.name );
    else
        Print( "LaurentPolynomialRing( ", P.baseRing, " )" );
    fi;
end;


#############################################################################
##

#F  PolynomialRing( <R> ) . . . . . . . . . . . .  full polynom ring over <R>
##
PolynomialRing := function( R )
    local   i;

    # <R> must be a ring with one
    if not IsRing(R) and not IsField(R)  then
        Error( "<R> must be a ring or field" );
    elif IsRing(R) and not IsBound(R.one)  then
        Error( "<R> must be a ring with one" );
    fi;

    # check if the polynom ring is already known
    if not IsBound(R.polynomialRing)  then
        R.polynomialRing := R.operations.PolynomialRing(R);
        if IsBound(R.polynomialRing.generators)  then
            for i  in [ 1 .. Length(R.polynomialRing.generators) ]  do
                R.polynomialRing.(i) := R.polynomialRing.generators[i];
            od;
        fi;
    fi;
    return R.polynomialRing;

end;


#############################################################################
##
#F  IsPolynomialRing( <obj> ) . . . . . . . . . . . . . is <R> a polynom ring
##
IsPolynomialRing := function( obj )
    return     IsRec(obj)
    	   and IsBound(obj.isPolynomialRing)
    	   and obj.isPolynomialRing;
end;


#############################################################################
##
#V  PolynomialRingOps . . . . . . . . . . . . . . . . . full polynom ring ops
##
PolynomialRingOps := Copy( RingOps );
PolynomialRingOps.name := "PolynomialRingOps";


#############################################################################
##
#F  PolynomialRingOps.\in  . . . . . . membership test for full polynom ring
##
PolynomialRingOps.\in := function( p, P )
    return     IsRec( p )
           and IsBound( p.isPolynomial )
           and p.isPolynomial
    	   and 0 <= p.valuation
           and p.baseRing = P.baseRing;
end;


#############################################################################
##
#F  PolynomialRingOps.Quotient( <R>, <f>, <g> ) . . . . . . . . . . <l> / <r>
##
PolynomialRingOps.Quotient := function ( R, f, g )
    local   m,  n,  i,  k,  c,  q,  R,  val;

    # <f> and <g> must have the same field
    if f.baseRing <> g.baseRing  then
    	Error( "<f> and <g> must have the same base ring" );
    fi;
    R := f.baseRing;

    # if <f> is zero return it
    if 0 = Length(f.coefficients)  then
	return f;
    fi;

    # check the value of the valuation of <f> and <g>
    if f.valuation < g.valuation  then
        return false;
    fi;
    val := f.valuation - g.valuation;

    # Try to divide <f> by <g>
    q := [];
    n := Length( g.coefficients );
    m := Length( f.coefficients ) - n;
    f := ShallowCopy( f.coefficients );
    if IsField(R)  then
        for i  in [0 .. m ]  do
            c := f[m-i+n] / g.coefficients[n];
            for k  in [ 1 .. n ]  do
                f[m-i+k] := f[m-i+k] - c * g.coefficients[k];
            od;
            q[m-i+1] := c;
        od;
    else
        for i  in [0 .. m ]  do
            c := Quotient( R, f[m-i+n], g.coefficients[n] );
    	    if c = false  then return false;  fi;
            for k  in [ 1 .. n ]  do
                f[m-i+k] := f[m-i+k] - c * g.coefficients[k];
            od;
            q[m-i+1] := c;
        od;
    fi;

    # Did the division work?
    for i  in [ 1 .. m+n ]  do
    	if f[i] <> R.zero  then
    	    return false;
    	fi;
    od;
    return Polynomial( R, q, val );

end;


#############################################################################
##
#F  PolynomialRingOps.Derivative( <R>, <f> )  . .  derivative of a polynomial
##
PolynomialRingOps.Derivative := function( R, f )
    local  d,  i;

    if f.valuation+Length(f.coefficients) < 2  then
        return R.zero;
    else
        d := [];
        for i  in [ 1 .. Length(f.coefficients) ]  do
            d[i] := (i+f.valuation-1) * f.coefficients[i];
        od;
        return Polynomial( R.baseRing, d, f.valuation-1 );
    fi;

end;


#############################################################################
##
#F  PolynomialRingOps.EuclideanDegree( <R>, <f> ) . . . . . . . degree of <f>
##
PolynomialRingOps.EuclideanDegree := function( R, f )
    return ( Length(f.coefficients)-1 ) + f.valuation;
end;


#############################################################################
##
#F  PolynomialRingOps.CompanionMatrix( <R>, <f> ) . . companion matrix of <f>
##
##  Returns the companion matrix A of <f>.  If <f> has leading coefficient 1
##  the companion matrix has characteristic polynomial <f>.
##
PolynomialRingOps.CompanionMatrix := function( R, f )
    local   d,  C,  i;

    d := (Length(f.coefficients)-1) + f.valuation;
    C := NullMat( d, d, R.baseRing.zero );
    for i  in [ 1 .. d-1 ]  do
    	C[i][i+1] := R.baseRing.one;
    od;
    for i  in [ f.valuation+1 .. d ]  do
    	C[d][i] := -f.coefficients[i];
    od;
    return C;

end;


#############################################################################
##
#F  PolynomialRingOps.StandardAssociate( <R>, <f> ) standard associate of <f>
##
PolynomialRingOps.StandardAssociate := function( R, f )
    local   l,  a;

    # <f> should be nontrivial
    if 0 < Length(f.coefficients)  then

        # get standard associate of leading term
        l := f.coefficients[Length(f.coefficients)];
        a := Quotient( R.baseRing, StandardAssociate( R.baseRing, l ), l );
    	f := Polynomial(R.baseRing,List(f.coefficients,x->a*x),f.valuation);
    fi;
    return f;

end;


#############################################################################
##
#F  PolynomialRingOps.EmbeddedPolynomial( <R>, <f> )  . . .  embed polynomial
##
PolynomialRingOps.EmbeddedPolynomial := function( R, f )
    return Polynomial( R.baseRing, f.coefficients, f.valuation );
end;


#############################################################################
##
#F  PolynomialRingOps.Print( <P> )  . . . . . . . . . . . . . pretty printing
##
PolynomialRingOps.Print := function( P )
    if IsBound( P.name )  then
        Print( P.name );
    else
        Print( "PolynomialRing( ", P.baseRing, " )" );
    fi;
end;


#############################################################################
##

#V  LaurentPolynomials  . . . . . . . . . . domain of all Laurent polynomials
##
LaurentPolynomials            := rec();

LaurentPolynomials.isDomain   := "true";

LaurentPolynomials.name       := "LaurentPolynomials";

LaurentPolynomials.isFinite   := false;
LaurentPolynomials.size       := "infinity";

LaurentPolynomials.operations := Copy( DomainOps );
LaurentPolynomialsOps         := LaurentPolynomials.operations;

LaurentPolynomialsOps.\in := function( p, Polynomials )
    return     IsRec( p )
           and IsBound( p.isPolynomial )
           and p.isPolynomial;
end;


#############################################################################
##
#F  LaurentPolynomialsOps.DefaultRing( <L> )  . . . . . . default ring of <L>
##
LaurentPolynomialsOps.DefaultRing := function( L )
    local   R,  l,  v;

    # get the ring
    R := L[1].baseRing;
    v := L[1].valuation;
    for l  in L  do
        if R <> l.baseRing  then
            Error( "sorry, all elements must have the same base ring" );
        fi;
    	if l.valuation < v  then
    	    v := l.valuation;
    	fi;
    od;

    # return the full (Laurent) polynom ring over <R>
    if v < 0  then
    	return LaurentPolynomialRing(R);
    else
        return PolynomialRing(R);
    fi;

end;


#############################################################################
##

#V  Polynomials . . . . . . . . . . . . . . . . . . domain of all polynomials
##
Polynomials            := rec();

Polynomials.isDomain   := "true";

Polynomials.name       := "Polynomials";

Polynomials.isFinite   := false;
Polynomials.size       := "infinity";

Polynomials.operations := Copy( DomainOps );
PolynomialsOps         := Polynomials.operations;

PolynomialsOps.\in := function( p, Polynomials )
    return     IsRec( p )
           and IsBound( p.isPolynomial )
           and p.isPolynomial
    	   and 0 <= p.valuation;
end;


#############################################################################
##
#F  PolynomialsOps.DefaultRing( <L> ) . . . . . . . . . . default ring of <L>
##
PolynomialsOps.DefaultRing := LaurentPolynomialsOps.DefaultRing;


#############################################################################
##

#V  PolynomialOps   . . . . . . . . . . . . . . . operations for a polynomial
##
PolynomialOps := rec();
PolynomialOps.name := "PolynomialOps";


#############################################################################
##
#F  PolynomialOps.Print( <f> )  . . . . . .  print a polynomial in a nice way
##
PolynomialOps.Print := function( pol )
    local   R;

    R := pol.baseRing;
    if IsBound(R.indeterminate) and IsBound(R.indeterminate.name)  then
    	DisplayPolynomial( pol, [R.indeterminate.name], false );
    else
	DisplayPolynomial( pol, ["X(",R,")"], false );
    fi;
end;


#############################################################################
##
#F  PolynomialOps.Value( <f>, <x> ) . . . . . . . . . . evaluate a polynomial
##
PolynomialOps.Value := function( f, x )
    local  val, i, id;

    id  := x ^ 0;
    val := 0 * id;
    i := Length(f.coefficients);
    while 0 < i  do
        val := val*x + id*f.coefficients[i];
        i := i-1;
    od;
    if 0 <> f.valuation  then
    	val := val * x^f.valuation;
    fi;
    return val;

end;


#############################################################################
##
#F  PolynomialOps.Depth( <f> )  . . . . . . . . . ((R[x_1])[x_2])..)[x_depth]
##
PolynomialOps.Depth := function( f )
    local    R,  d;

    if not IsBound(f.depth)  then
        R := f.baseRing;
        d := 1;
        while IsPolynomialRing(R) or IsLaurentPolynomialRing(R)  do
            R := R.baseRing;
            d := d + 1;
        od;
        f.depth := d;
    fi;
    return f.depth;

end;


#############################################################################
##
#F  PolynomialOps.GroundRing( <f> ) . . . . . . . . . . .  ground ring of <f>
##
PolynomialOps.GroundRing := function( f )
    local    R;

    if not IsBound(f.groundRing)  then
        R := f.baseRing;
        while IsPolynomialRing(R) or IsLaurentPolynomialRing(R)  do
    	    R := R.baseRing;
        od;
    	f.groundRing := R;
    fi;
    return f.groundRing;
end;


#############################################################################
##
#F  PolynomialOps.Degree( <f> ) . . . . . . . . . . .  degree of a polynomial
##
Degree := function( obj )
    if not IsBound(obj.degree)  then
	obj.degree := obj.operations.Degree(obj);
    fi;
    return obj.degree;
end;

PolynomialOps.Degree := function( f )
    return ( Length(f.coefficients)-1 ) + f.valuation;
end;


#############################################################################
##
#F  PolynomialOps.LeadingCoefficient( <f> ) . . .  leading coefficient of <f>
##
LeadingCoefficient := function( f )
    if not IsBound(f.leadingCoefficient)  then
	f.leadingCoefficient := f.operations.LeadingCoefficient(f);
    fi;
    return f.leadingCoefficient;
end;

PolynomialOps.LeadingCoefficient := function( f )
    if 0 < Length(f.coefficients)  then
        return f.coefficients[Length(f.coefficients)];
    else
        return f.baseRing.zero;
    fi;
end;


#############################################################################
##
#F  PolynomialOps.String( <f> ) . . . . . . . . . . construct a pretty string
##
PolynomialOps.String := function( f )
    local   x,  i,  d,  v,  s,  l,  one,  sone;

    # find a name for the indeterminate
    x := Indeterminate(f.baseRing);
    if IsBound(x.name)  then x := x.name;  else x := "x";  fi;
    one  := f.baseRing.one;
    sone := String(one);

    # run through the coefficients of <f>
    v := f.valuation-1;
    l := Length(f.coefficients);
    for i  in [ l, l-1 .. 1 ]  do
        d := f.coefficients[i];
        if 0 <> d  then
            if i = l and d = one and i+v <> 0  then
                s := "";
            elif i = l and d = one  then
                s := String(one);
            elif i = l and d = -one and i+v <> 0  then
                s := "-";
            elif i = l and d = -one  then
                s := ConcatenationString( "-", sone );
            elif i = l  then
                s := ConcatenationString( "(", String(d), ")" );
            elif d = 1 and i+v <> 0  then
                s := ConcatenationString( s, "+" );
            elif d = 1  then
                s := ConcatenationString( s, "+", sone );
            elif d = -1 and i+v <> 0  then
                s := ConcatenationString( s, "-" );
            elif d = -1  then
                s := ConcatenationString( s, "-", sone );
            elif 0 <> d  then
                s := ConcatenationString( s, "+(", String(d), ")" );
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
#F  PolynomialOps.\= . . . . . . . . . . . .  equaltity test for polynomials
##
PolynomialOps.\= := function( l, r )
    local   R,  sum,  i;

    # handle the case <something> = <polynomial>
    if not IsPolynomial( l )  then
        return false;

    # handle the case <polynomial> = <something>
    elif not IsPolynomial( r )  then
        return false;

    # handle special case of iterated polynomials
    elif l.operations.Depth(l) <> r.operations.Depth(r)  then
    	return false;

    # return 'false' if <l> and <r> have different rings
    elif l.operations.GroundRing(l) <> r.operations.GroundRing(r)  then
        return false;

    # compare valuation
    elif l.valuation <> r.valuation  then
    	return false;

    # compare coefficients
    else
        return l.coefficients = r.coefficients;
    fi;

end;


#############################################################################
##
#F  PolynomialOps.\< . . . . . . . . . . . . . . . comparison of polynomials
##
PolynomialOps.\< := function( l, r )

    if not IsPolynomial( l )  then
        return l < r.coefficients;
    elif not IsPolynomial( r )  then
        return l.coefficients < r;
    elif l.operations.Depth(l) <> r.operations.Depth(r)  then
    	return l.operations.Depth(l) < r.operations.Depth(r);
    elif l.valuation <> r.valuation  then
    	return l.valuation < r.valuation;
    elif Length( l.coefficients ) = Length( r.coefficients )  then
        return l.coefficients < r.coefficients;
    else
        return Length( l.coefficients ) < Length( r.coefficients );
    fi;

end;


#############################################################################
##
#F  PolynomialOps.\+ . . . . . . . . . . . . . . . .  sum of two polynomials
##
PolynomialOps.\+ := function( l, r )
    local   R,  sum,  val,  vdf,  i;

    # handle the case that one argument is a list
    if IsList(l)  then
    	return List( l, x -> x+r );
    elif IsList(r)  then
    	return List( r, x -> l+x );
    fi;

    # handle the case <scalar> + <polynomial>
    if not IsPolynomial(l)  then
        if IsInt(l)  then
            l := l * r.baseRing.one;
        elif not l in r.baseRing  then
            Error( "<l> must lie in the base ring of <r>" );
        fi;
        R := r.baseRing;
        l := R.operations.Polynomial( R, [l], 0 );
    fi;

    # handle the case <polynomial> + <scalar>
    if not IsPolynomial(r)  then
        if IsInt(r)  then
            r := r * l.baseRing.one;
        elif not r in l.baseRing  then
            Error( "<r> must lie in the base ring of <l>" );
        fi;
        R := l.baseRing;
	r := R.operations.Polynomial( R, [r], 0 );
    fi;

    # handle special case of iterated polynomials
    if l.operations.Depth(l) < r.operations.Depth(r)  then
    	R := DefaultRing(r);
        l := l * R.one;
    elif r.operations.Depth(r) < l.operations.Depth(l)  then
    	R := DefaultRing(l);
        r := R.one * r;
    fi;

    # give up if we have different rings
    if l.operations.GroundRing(l) <> r.operations.GroundRing(r)  then
        Error( "polynomials must have the same ring" ); 

    # if <l> is the null polynomial return <r>
    elif Length(l.coefficients) = 0  then
	return r;

    # if <r> is the null polynomial return <l>
    elif Length(r.coefficients) = 0  then
        return l;

    # sum of two polynomials
    else

        # get a common ring
        R := l.baseRing;

        # add both coefficients lists
        if l.valuation < r.valuation  then
	    val := l.valuation;
            sum := Copy( l.coefficients );
            vdf := r.valuation - l.valuation;
            for i  in [ Length(sum)+1 .. Length(r.coefficients)+vdf ] do
	        sum[i] := R.zero;
            od;
            for i  in [ 1 .. Length(r.coefficients) ]  do
	        sum[i+vdf] := sum[i+vdf] + r.coefficients[i];
            od;
        else
	    val := r.valuation;
            sum := Copy( r.coefficients );
            vdf := l.valuation - r.valuation;
            for i  in [ Length(sum)+1 .. Length(l.coefficients)+vdf ] do
	        sum[i] := R.zero;
            od;
            for i  in [ 1 .. Length(l.coefficients) ]  do
	        sum[i+vdf] := l.coefficients[i] + sum[i+vdf];
            od;
        fi;
    fi;

    # return the sum
    return R.operations.Polynomial( R, sum, val );

end;


#############################################################################
##
#F  PolynomialOps.\- . . . . . . . . . . . . . difference of two polynomials
##
PolynomialOps.\- := function( l, r )
    local   R,  dif,  val,  vdf,  i;

    # handle the case that one argument is a list
    if IsList(l)  then
    	return List( l, x -> x-r );
    elif IsList(r)  then
    	return List( r, x -> l-x );
    fi;

    # handle the case <scalar> - <polynomial>
    if not IsPolynomial(l)  then
        if IsInt(l)  then
            l := l * r.baseRing.one;
        elif not l in r.baseRing  then
            Error( "<l> must lie in the base ring of <r>" );
        fi;
        R := r.baseRing;
        l := R.operations.Polynomial( R, [l], 0 );
    fi;

    # handle the case <polynomial> - <scalar>
    if not IsPolynomial(r)  then
        if IsInt(r)  then
            r := r * l.baseRing.one;
        elif not r in l.baseRing  then
            Error( "<r> must lie in the base ring of <l>" );
        fi;
        R := l.baseRing;
	r := R.operations.Polynomial( R, [r], 0 );
    fi;

    # handle special case of iterated polynomials
    if l.operations.Depth(l) < r.operations.Depth(r)  then
    	R := DefaultRing(r);
        l := l * R.one;
    elif r.operations.Depth(r) < l.operations.Depth(l)  then
    	R := DefaultRing(l);
        r := R.one * r;
    fi;

    # give up if we have different rings
    if l.operations.GroundRing(l) <> r.operations.GroundRing(r)  then
        Error( "polynomials must have the same ring" ); 

    # if <l> is the null polynomial return -<r>
    elif Length(l.coefficients) = 0  then
	return -r;

    # if <r> is the null polynomial return <l>
    elif Length(r.coefficients) = 0  then
        return l;

    # difference of two polynomials
    else

        # get a common ring
        R := l.baseRing;

        # add both coefficients lists
        if l.valuation < r.valuation  then
	    val := l.valuation;
            dif := Copy( l.coefficients );
            vdf := r.valuation - l.valuation;
            for i  in [ Length(dif)+1 .. Length(r.coefficients)+vdf ] do
	        dif[i] := R.zero;
            od;
            for i  in [ 1 .. Length(r.coefficients) ]  do
	        dif[i+vdf] := dif[i+vdf] - r.coefficients[i];
            od;
        else
	    val := r.valuation;
            dif := Copy( r.coefficients ) * (R.zero-R.one);
            vdf := l.valuation - r.valuation;
            for i  in [ Length(dif)+1 .. Length(l.coefficients)+vdf ] do
	        dif[i] := R.zero;
            od;
            for i  in [ 1 .. Length(l.coefficients) ]  do
	        dif[i+vdf] := l.coefficients[i] + dif[i+vdf];
            od;
        fi;
    fi;

    # return the dif
    return R.operations.Polynomial( R, dif, val );

end;


#############################################################################
##
#F  PolynomialOps.\* . . . . . . . . . . . . . .  product of two polynomials
##
PolynomialOps.\* := function( l, r )
    local   R,  prd,  z,  m,  n,  i,  j,  val;

    # handle the case that one argument is a list
    if IsList(l)  then
    	return List(l, x -> x*r);
    elif IsList(r)  then
    	return List(r, x -> l*x);

    # handle the case <scalar> * <polynomial>
    elif not IsPolynomial(l)  then
    	if IsInt(l) and IsBound(r.baseRing.one)  then
    	    l := l * r.baseRing.one;
        elif not l in r.baseRing  then
	    Error("<l> must lie in the base ring of <r>");
	fi;
	R := r.baseRing;
	if l = r.baseRing.zero or 0 = Length(r.coefficients)  then
	    prd := [];
    	    val := 0;
        else
	    prd := l * r.coefficients;
    	    val := r.valuation;
	fi;

    # handle the case <polynomial> * <scalar>
    elif not IsPolynomial(r)  then
    	if IsInt(r) and IsBound(l.baseRing.one)  then
    	    r := l.baseRing.one * r;
	elif not r in l.baseRing  then
	    Error("<r> must lie in the base ring of <l>");
	fi;
	R := l.baseRing;
	if r = l.baseRing.zero or 0 = Length(l.coefficients)  then
	    prd := [];
    	    val := 0;
        else
	    prd := l.coefficients * r;
    	    val := l.valuation;
	fi;

    # the ground fields must be equal
    elif l.operations.GroundRing(l) <> r.operations.GroundRing(r)  then
        Error( "polynomials must have the same ring" );

    # handle special case of iterated polynomials
    elif l.operations.Depth(l) <> r.operations.Depth(r)  then
    	if l.operations.Depth(l) < r.operations.Depth(r)  then
    	    prd := List( r.coefficients, x -> l*x );
    	    val := r.valuation;
    	    R   := r.baseRing;
    	else
    	    prd := List( l.coefficients, x -> x*r );
    	    val := l.valuation;
    	    R   := l.baseRing;
    	fi;

    # multiply two polynomials
    else

        # get a common ring
        R := l.baseRing;

    	# fold the product
    	m := Length(l.coefficients);
    	n := Length(r.coefficients);
    	prd := [];
    	for i  in [ 1 .. m+n-1 ]  do
    	    z := R.zero;
    	    for j  in [ Maximum(i+1-n,1) .. Minimum(m,i) ]  do
    	    	z := z + l.coefficients[j]*r.coefficients[i+1-j];
    	    od;
    	    prd[i] := z;
    	od;
    	val := l.valuation + r.valuation;
    fi;

    # return the product
    return R.operations.Polynomial( R, prd, val );

end;


#############################################################################
##
#F  PolynomialOps.\/ . . . . . . . . . . . . . . quotient of two polynomials
##
PolynomialOps.\/ := function( l, r )
    local   R,  quo,  z,  m,  n,  i,  j,  val;

    # handle the case that <l> argument is a list
    if IsList(l)  then
    	return List(l, x -> x/r);

    # handle the case <scalar> / <polynomial>
    elif not IsPolynomial(l)  then
    	if IsInt(l) and IsBound(r.baseRing.one)  then
    	    l := l * r.baseRing.one;
        elif not l in r.baseRing  then
	    Error("<l> must lie in the base ring of <r>");
	fi;
        r := r^-1;
	R := r.baseRing;
	if l = r.baseRing.zero or 0 = Length(r.coefficients)  then
	    quo := [];
    	    val := 0;
        else
	    quo := l * r.coefficients;
    	    val := r.valuation;
	fi;

    # handle the case <polynomial> / <scalar>
    elif not IsPolynomial(r)  then
    	if IsInt(r) and IsBound(l.baseRing.one)  then
    	    r := l.baseRing.one * r;
	elif not r in l.baseRing  then
	    Error("<r> must lie in the base ring of <l>");
	fi;
	R := l.baseRing;
	if r = l.baseRing.zero  then
            Error( "<r> must be non-zero" );
        else
	    quo := l.coefficients * (1/r);
    	    val := l.valuation;
	fi;

    # the ground fields must be equal
    elif l.operations.GroundRing(l) <> r.operations.GroundRing(r)  then
        Error( "polynomials must have the same ring" );

    # handle special case of iterated polynomials
    elif l.operations.Depth(l) <> r.operations.Depth(r)  then
    	if l.operations.Depth(l) < r.operations.Depth(r)  then
    	    quo := List( r.coefficients, x -> l/x );
    	    val := r.valuation;
    	    R   := r.baseRing;
    	else
    	    quo := List( l.coefficients, x -> x/r );
    	    val := l.valuation;
    	    R   := l.baseRing;
    	fi;

    # compute the quotient and return in this case
    else
        quo := Quotient( LaurentPolynomialRing(l.baseRing), l, r );
    	if quo = false  then
    	    Error( "cannot divide <l> by <r>" );
    	fi;
    	return quo;
    fi;

    # return the product
    return R.operations.Polynomial( R, quo, val );

end;


#############################################################################
##
#F  PolynomialOps.\^ . . . . . . . . . . . . . . . . . power of a polynomial
##
PolynomialOps.\^ := function( l, r )
    local   R,  pow;

    # <l> must be a polynomial and <r> a non-negative integer
    if not IsPolynomial(l)  then
    	Error("<l> must be a polynomial");
    fi;
    if not IsInt(r)  then
    	Error("<r> must be an integer");
    fi;

    # invert <l> if necessary and possible
    if r < 0  then
    	R := LaurentPolynomialRing( l.baseRing );
    	l := R.operations.Quotient( R, R.one, l );
    	if l = false  then
    	    Error( "cannot invert <l> in the laurent polynomial ring" );
    	fi;
    	r := -r;
    fi;

    # if <r> is zero, return x^0, if <r> is one return <l>
    R := l.baseRing;
    if r = 0  then
    	return Polynomial( R, [ R.one ] );
    elif r = 1  then
    	return l;
    fi;

    # if <l> is of degree less than 2, return
    if Length(l.coefficients) = 0  then
    	return l;
    elif Length(l.coefficients) = 1  then
    	return Polynomial( R, [ l.coefficients[1]^r ], l.valuation*r );
    fi;

    # use repeated squaring
    pow := Polynomial( R, [ R.one ] );
    while 0 < r  do
        if r mod 2 = 1  then
	    pow := pow * l;
            r   := r - 1;
        fi; 
        if 1 < r  then
	    l := l * l;
            r := r / 2;
        fi;
    od;

    # return the power
    return pow;

end;


#############################################################################
##

#F  DisplayPolynomial( <p>, <str> ) . . . . . . . . . .  display a polynomial
##
DisplayPolynomial := function( arg )

    local   i,		    # loop variable
	    p,              # the polynomial
            wantNl,         # try if we want a newline at the end
	    str,            # string list for indeterminate
	    nam,            # loop variable for <str>
    	    cof,            # coefficients of <p>
    	    len,            # length of coefficients of <p>
    	    isMinus,        # if 'true' print "x^2 - x"
    	    isPrimeField;   # if 'true' print "Z(3)*(2*x^2+1)"

    # get arguments, <wantNl> is 'false' by default
    p := arg[1];
    str := arg[2];
    if IsString(str)  then str := [ str ];  fi;
    wantNl := 3 = Length(arg) and arg[3];

    # check if the base ring of <p> is a finite prime field
    isPrimeField := IsFiniteField(p.baseRing) and (p.baseRing.degree = 1);

    # if the polynomial is of length one, ignore <isPrimeField>
    if  Length(p.coefficients) < 2  then isPrimeField := false;  fi;

    # check if can print a minus sign
    isMinus := IsInt(p.baseRing.zero);

    # catch some trivial cases
    if p.valuation = 0 and Length(p.coefficients) < 2  then
	if Length(p.coefficients) = 0  then
	    Print("0*");
	    for nam  in str  do
		Print( nam );
	    od;
	    Print("^0");
	elif p.coefficients[1] = p.baseRing.one  then
	    for nam  in str  do
		Print( nam );
	    od;
	    Print("^0");
	elif isMinus and p.coefficients[1] = -p.baseRing.one  then
	    Print("-");
	    for nam  in str  do
		Print( nam );
	    od;
	    Print("^0");
	else
	    Print( p.coefficients[1], "*" );
	    for  nam  in str  do
		Print( nam );
	    od;
	    Print("^0");
	fi;
	return;
    fi;

    # if <isPrimeField> is 'true' print the one in Zp
    if isPrimeField  then  Print( p.baseRing.one, "*(" );  fi;

    # print the polynomial
    len := Length(p.coefficients);
    for i  in Reversed([ 1 .. len ])  do
    	cof := p.coefficients[i];
        if cof <> p.baseRing.zero  then
    	    if i < len and isMinus and IsInt(cof) and cof < 0  then
    	    	Print(" - ");
    	    	cof := -cof;
    	    elif i = len and isMinus and cof = -p.baseRing.one  then
    	    	Print("-");
    	    	cof := -cof;
    	    elif i < len  then
                Print(" + ");
            fi;
    	    if 1 = i + p.valuation  then
    	    	if isPrimeField  then
    	    	    Print(Int(cof));
    	    	elif IsFFE(cof) or IsInt(cof) then
                    Print(cof);
		else
		    Print( "(", cof, ")" );
    	    	fi;
            elif 2 = i + p.valuation  then
    	    	if cof <> p.baseRing.one  then
       	    	    if isPrimeField  then
                    	Print( Int(cof), "*" );
			for nam in str  do
			    Print( nam );
			od;
		    elif IsFFE(cof) or IsInt(cof)  then
                    	Print( cof, "*" );
			for nam in str  do
			    Print( nam );
			od;
    	    	    else
                    	Print( "(", cof, ")*" );
			for nam in str  do
			    Print( nam );
			od;
    	    	    fi;
    	    	else
		    for nam in str  do
			Print( nam );
		    od;
    	    	fi;
    	    else
    	    	if cof <> p.baseRing.one  then
    	    	    if isPrimeField  then
                    	Print( Int(cof), "*" );
			for nam in str  do
			    Print( nam );
			od;
		    elif IsFFE(cof) or IsInt(cof)  then
                    	Print( cof, "*" );
			for nam in str  do
			    Print( nam );
			od;
    	    	    else
                    	Print( "(", cof, ")*" );
			for nam in str  do
			    Print( nam );
			od;
    	    	    fi;
    	    	else
		    for nam in str  do
			Print( nam );
		    od;
    	    	fi;
	        if i+p.valuation-1 < 0  then
		    Print( "^(", i+p.valuation-1, ")" );
		else
                    Print( "^", i+p.valuation-1 );
		fi;
            fi;
        fi;
    od;
    if isPrimeField  then Print(")");  fi;
    if wantNl  then Print("\n");  fi;

end;
