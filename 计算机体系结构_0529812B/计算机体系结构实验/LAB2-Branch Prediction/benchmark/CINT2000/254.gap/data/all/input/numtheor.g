#############################################################################
##
#A  numtheor.g                  GAP library                  Martin Schoenert
##
#H  @(#)$Id: numtheor.g,v 3.34 1994/06/12 14:04:25 mschoene Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains those functions that mainly deal with  integer primes.
##
#H  $Log: numtheor.g,v $
#H  Revision 3.34  1994/06/12  14:04:25  mschoene
#H  changed 'RootsUnity1Mod' to 'RootsUnityMod', probably only a typo
#H
#H  Revision 3.33  1993/05/21  14:47:41  martin
#H  added 'RootsMod', speeded up 'RootsUnityMod'
#H
#H  Revision 3.32  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.31  1992/11/30  18:03:38  fceller
#H  changed 'LogMod' to return 'false' instead of signalling an error
#H
#H  Revision 3.30  1992/11/16  15:58:28  martin
#H  fixed a minor problem in 'ResidueClassGroupOps.in'
#H
#H  Revision 3.29  1992/05/14  10:12:46  martin
#H  fixed 'PrimeResidues' to return a copy of the lists
#H
#H  Revision 3.28  1992/03/12  11:00:04  martin
#H  extended 'ResidueClassOps' to allow cyclic group definitions
#H
#H  Revision 3.27  1992/01/31  15:56:33  martin
#H  fixed 'ResidueClassesOps', it must be a copy of 'GroupElementsOps'
#H
#H  Revision 3.26  1992/01/24  08:42:11  martin
#H  added 'ResidueClass' et.al.
#H
#H  Revision 3.25  1992/01/24  08:25:15  martin
#H  fixed the description of 'Phi' and 'IsPrimitiveRootMod'
#H
#H  Revision 3.24  1992/01/23  10:44:51  martin
#H  added a quick and dirty 'LogMod'
#H
#H  Revision 3.23  1991/12/27  15:08:38  martin
#H  added a few 'InfoNumtheor' messages
#H
#H  Revision 3.22  1991/12/27  15:06:20  martin
#H  moved 'IsPrimeInt', 'FactorsInt', etc. to 'integer.g'
#H
#H  Revision 3.21  1991/09/05  08:28:01  martin
#H  fixed 'MoebiusMu' from the idea that 1 has an odd number of prime factors
#H
#H  Revision 3.20  1991/08/09  11:13:25  martin
#H  changed 'IsPrimitiveRoot' to 'IsPrimitiveRootMod'
#H
#H  Revision 3.19  1991/06/01  17:00:00  martin
#H  changed 'IsPrime' to 'IsPrimeInt', 'Factors' to 'FactorsInt', ...
#H
#H  Revision 3.18  1991/06/01  16:00:00  martin
#H  changed 'Gcd' to 'GcdInt', 'Lcm' to 'LcmInt', ...
#H
#H  Revision 3.17  1991/06/01  15:00:00  martin
#H  fixed 'MoebiusMu' from a minor bug
#H
#H  Revision 3.16  1991/06/01  14:00:00  martin
#H  improved 'PrimeResidues' a little bit
#H
#H  Revision 3.15  1991/06/01  13:00:00  martin
#H  removed usage of 'Sign'
#H
#H  Revision 3.14  1991/06/01  12:00:00  martin
#H  moved 'TwoSquares' to 'gaussian.g'
#H
#H  Revision 3.13  1991/04/29  12:00:00  martin
#H  improved 'Jacobi' to handle negative numerators
#H
#H  Revision 3.12  1991/04/23  15:00:00  martin
#H  improved 'IsPrimitiveRoot' a lot
#H
#H  Revision 3.11  1991/04/23  14:00:00  martin
#H  improved 'Factors' to check for perfect powers
#H
#H  Revision 3.10  1991/04/23  13:00:00  martin
#H  changed 'PowerModQF' to 'TraceModQF'
#H
#H  Revision 3.9  1991/04/23  12:00:00  martin
#H  removed 'IsPrime2'
#H
#H  Revision 3.8  1991/01/11  12:00:00  martin
#H  fixed 'PrimitiveRoot' from wrong 'Phi' call
#H
#H  Revision 3.7  1990/12/07  12:00:00  martin
#H  added hint that 'Primes' is a set
#H
#H  Revision 3.6  1990/11/16  12:00:00  martin
#H  added 'DivisorsSmall' and 'PrimeResiduesSmall'
#H
#H  Revision 3.5  1990/09/24  12:00:00  martin
#H  added 'PrimeResidues'
#H
#H  Revision 3.4  1990/09/19  12:00:00  martin
#H  added 'RootsUnityMod'
#H
#H  Revision 3.3  1990/09/12  12:00:00  martin
#H  added 'TwoSquares'
#H
#H  Revision 3.2  1990/09/02  12:00:00  martin
#H  changed 'IsPrime' to use the quadratic field test
#H
#H  Revision 3.1  1990/09/01  13:00:00  martin
#H  added 'Primes2'
#H
#H  Revision 3.0  1990/09/01  12:00:00  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  InfoNumtheor?(...)  . . . . information function for the numtheor package
##
if not IsBound(InfoNumtheor1)  then InfoNumtheor1 := Ignore;  fi;
if not IsBound(InfoNumtheor2)  then InfoNumtheor2 := Ignore;  fi;


#############################################################################
##
#F  PrimeResidues( <m> )  . . . . . . . integers relative prime to an integer
##
##  'PrimeResidues' returns the set of integers from the range  $0..Abs(m)-1$
##  that are relative prime to the integer <m>.
##
##  $Abs(m)$ must be less than $2^{28}$, otherwise the set would probably  be
##  too large anyhow.
##
PrimeResiduesSmall := [[],[0],[1],[1,2],[1,3],[1,2,3,4],[1,5],[1,2,3,4,5,6]];
PrimeResidues := function ( m )
    local  residues, p, i;

    # make <m> it nonnegative, handle trivial cases
    if m < 0  then m := -m;  fi;
    if m < 8  then return ShallowCopy(PrimeResiduesSmall[m+1]);  fi;

    # remove the multiples of all prime divisors
    residues := [1..m-1];
    for p  in Set(FactorsInt(m))  do
        for i  in [1..m/p-1]  do
            residues[p*i] := 1;
        od;
    od;

    # return the set of residues
    return Set( residues );
end;


#############################################################################
##
#F  Phi( <m> )  . . . . . . . . . . . . . . . . . . . Eulers totient function
##
##  'Phi' returns  the number of positive integers  less  than  the  positive
##  integer <m> that are relativ prime to <m>.
##
##  Suppose that $m = p_1^{e_1} p_2^{e_2} .. p_k^{e_k}$.  Then  $\phi(m)$  is
##  $p_1^{e_1-1} (p_1-1) p_2^{e_2-1} (p_2-1) ..  p_k^{e_k-1} (p_k-1)$.
##
Phi := function ( m )
    local  phi, p;

    # make <m> it nonnegative, handle trivial cases
    if m < 0  then m := -m;  fi;
    if m < 8  then return Length(PrimeResiduesSmall[m+1]);  fi;

    # compute $phi$
    phi := m;
    for p  in Set(FactorsInt(m))  do
        phi := phi / p * (p-1);
    od;

    # return the result
    return phi;
end;


#############################################################################
##
#F  Lambda( <m> ) . . . . . . . . . . . . . . . . . . .  Carmichaels function
##
##  'Lambda' returns the exponent of the group  of  relative  prime  residues
##  modulo the integer <m>.
##
##  Carmichaels theorem states that 'Lambda'  can  be  computed  as  follows:
##  $Lambda(2) = 1$, $Lambda(4) = 2$ and $Lambda(2^e) = 2^{e-2}$ if $3 <= e$,
##  $Lambda(p^e) = (p-1) p^{e-1}$ (i.e. $Phi(m)$) if $p$ is an odd prime  and
##  $Lambda(n*m) = Lcm( Lambda(n), Lambda(m) )$ if $n, m$ are relative prime.
##
Lambda := function ( m )
    local  lambda, p, q, k;

    # make <m> it nonnegative, handle trivial cases
    if m < 0  then m := -m;  fi;
    if m < 8  then return Length(PrimeResiduesSmall[m+1]);  fi;

    # loop over all prime factors $p$ of $m$
    lambda := 1;
    for p  in Set(FactorsInt(m))  do

        # compute $p^e$ and $k = (p-1) p^(e-1)$
        q := p;  k := p-1;
        while m mod (q * p) = 0  do q := q * p;  k := k * p;  od;

        # multiples of 8 are special
        if q mod 8 = 0  then k := k / 2;  fi;

        # combine with the value known so far
        lambda := LcmInt( lambda, k );
    od;

    return lambda;
end;


#############################################################################
##
#F  OrderMod( <n>, <m> )  . . . . . . . .  multiplicative order of an integer
##
##  'OrderMod' returns the multiplicative order of the integer <n> modulo the
##  positive integer <m>.  If <n> and <m> are not relativ prime the order  if
##  <n> is not defined and 'OrderInt' will return 0.
##
#N  23-Apr-91 martin improve 'OrderMod' similar to 'IsPrimitiveRootMod'
##
OrderMod := function ( n, m )
    local  x, o, d;

    # check the arguments and reduce $n$ into the range $0..m-1$
    if m <= 0  then Error("<m> must be positive");  fi;
    if n < 0   then n := n mod m + m;  fi;
    if m <= n  then n := n mod m;      fi;

    # return 0 if the $n$ is not relativ prime to $n$
    if GcdInt(m,n) <> 1  then
        o := 0;

    # compute the order simply by iterated multiplying, $x= n^o$ mod $m$
    elif m < 100  then
        x := n;  o := 1;
        while x > 1  do
            x := x * n mod m;  o := o + 1;
        od;

    # otherwise try the divisors of $\lambda(m)$ and their divisors, etc.
    else
        o := Lambda( m );
        for d in Set( FactorsInt( o ) )  do
            while o mod d = 0  and PowerModInt(n,o/d,m) = 1  do
                o := o / d;
            od;
        od;

    fi;

    return o;
end;


#############################################################################
##
#F  IsPrimitiveRootMod( <r>, <m> )  . . . . . . . . test for a primitive root
##
##  'IsPrimitiveRootMod' returns  'true' if the  integer <r>  is a  primitive
##  root modulo the positive integer <m> and 'false' otherwise.
##
IsPrimitiveRootMod := function ( r, m )
    local   p,  d, facs, pows, pow, i;

    # check the arguments and reduce $r$ into the range $0..m-1$
    if m <= 0  then Error("<m> must be positive");  fi;
    if r < 0   then r := r mod m + m;  fi;
    if m <= r  then r := r mod m;      fi;

    # handle trivial cases
    if m = 2        then return r = 1;  fi;
    if m = 4        then return r = 3;  fi;
    if m mod 4 = 0  then return false;  fi;

    # handle even numbers by testing modulo the odd part
    if m mod 2 = 0  then
        if r mod 2 = 0  then return false;  fi;
        m := m / 2;
    fi;

    # check that $m$ is a prime power, otherwise no primitive root exists
    p := SmallestRootInt( m );
    if not IsPrimeInt( p )  then
        return false;
    fi;

    # check that $r^((p-1)/2) \<> 1$ mod $p$ using the Jacobi symbol
    if Jacobi( r, p ) <> -1  then
        return false;
    fi;

    # compute $pows_i := r^{{p-1}/\prod_{k=2}^{i}{facs_k}}$ ($facs_1 = 2$)
    facs := Set( FactorsInt( p-1 ) );
    pows := [];
    pows[Length(facs)] := PowerModInt( r, 2*(p-1)/Product(facs), p );
    for i  in Reversed( [2..Length(facs)-1] )  do
        pows[i] := PowerModInt( pows[i+1], facs[i+1], p );
    od;

    # check $1 \<> r^{{p-1}/{facs_i}} = pows_i^{\prod_{k=2}^{i-1}{facs_k}}$
    pow := 1;
    for i  in [2..Length(facs)]  do
        if PowerModInt( pows[i], pow, p ) = 1  then
            return false;
        fi;
        pow := pow * facs[i];
    od;

    # if $m$ is a prime we are done
    if p = m  then
        return true;
    fi;

    # for prime powers $n$ we have to test that $r$ is not a $p$-th root
    return PowerModInt( r, p-1, p^2 ) <> 1;
end;


#############################################################################
##
#F  PrimitiveRootMod( <m> ) . . . . . . . .  primitive root modulo an integer
##
##  'PrimitiveRootMod' returns the smallest primitive root modulo the integer
##  <m> and 'false' if no such primitive root exists.  If the optional second
##  integer argument <start> is given 'PrimitiveRootMod' returns the smallest
##  primitive root that is strictly larger than <start>.
##
PrimitiveRootMod := function ( arg )
    local   root, m, p, start, mm;

    # get and check the arguments
    if   Length(arg) = 1  then
        m := arg[1];  start := 1;
        if m <= 0  then Error("<m> must be positive");  fi;
    elif Length(arg) = 2  then
        m := arg[1];  start := arg[2];
        if m <= 0  then Error("<m> must be positive");  fi;
    else
        Error("usage: PrimitiveRootMod( <m> [, <start>] )");
    fi;

    # handle the trivial cases
    if m = 2 and start = 1   then return 1;      fi;
    if m = 2                 then return false;  fi;
    if m = 4 and start <= 3  then return 3;      fi;
    if m mod 4 = 0           then return false;  fi;

    # handle even numbers
    if m mod 2 = 0  then
        mm := 2;
        m := m / 2;
    else
        mm := 1;
    fi;

    # check that $m$ is a prime power otherwise no primitive root exists
    p := SmallestRootInt( m );
    if not IsPrimeInt( p )  then
        return false;
    fi;

    # run through all candidates for a primitive root
    root := start+1;
    while root <= mm*m-1  do
        if      (mm = 1  or root mod 2 = 1)
            and IsPrimitiveRootMod( root, p )
            and (p = m  or PowerModInt( root, p-1, p^2 ) <> 1)
        then
            return root;
        fi;
        root := root + 1;
    od;

    # no primitive root found
    return false;
end;


#############################################################################
##
#F  Jacobi( <n>, <m> ) . . . . . . . . . . . . . . . . . . . .  Jacobi symbol
##
##  'Jacobi'  returns  the  value of the  Jacobian symbol of the  integer <n>
##  modulo the nonnegative integer <m>.
##
##  A description of the Jacobi symbol and related topics can  be  found  in:
##  A. Baker, The theory of numbers, Cambridge University Press, 1984,  27-33
##
#N  29-Apr-91 martin remember to change the description of 'Jacobi'
##
Jacobi := function ( n, m )
    local  jac, t;

    # check the argument
    if m <= 0  then Error("<m> must be positive");  fi;

    # compute the jacobi symbol similar to euclids algorithm
    jac := 1;
    while m <> 1  do

        # if the gcd of $n$ and $m$ is $>1$ Jacobi returns $0$
        if n = 0 or (n mod 2 = 0 and m mod 2 = 0)  then
            jac := 0;  m := 1;

        # $J(n,2*m) = J(n,m) * J(n,2) = J(n,m) * (-1)^{(n^2-1)/8}$
        elif m mod 2 = 0  then
            if n mod 8 = 3  or  n mod 8 = 5  then jac := -jac;  fi;
            m := m / 2;

        # $J(2*n,m) = J(n,m) * J(2,m) = J(n,m) * (-1)^{(m^2-1)/8}$
        elif n mod 2 = 0  then
            if m mod 8 = 3  or  m mod 8 = 5  then jac := -jac;  fi;
            n := n / 2;

        # $J(-n,m) = J(n,m) * J(-1,m) = J(n,m) * (-1)^{(m-1)/2}$
        elif n < 0  then
            if m mod 4 = 3  then jac := -jac;  fi;
            n := -n;

        # $J(n,m) = J(m,n) * (-1)^{(n-1)*(m-1)/4}$ (quadratic reciprocity)
        else
            if n mod 4 = 3  and m mod 4 = 3  then jac := -jac;  fi;
            t := n;  n := m mod n;  m := t;

        fi;
    od;

    return jac;
end;


#############################################################################
##
#F  Legendre( <n>, <m> )  . . . . . . . . . . . . . . . . . . Legendre symbol
##
##  'Legendre' returns  the value of the Legendre  symbol of the  integer <n>
##  modulo the positive integer <m>.
##
##  A description of the Legendre symbol and related topics can be found  in:
##  A. Baker, The theory of numbers, Cambridge University Press, 1984,  27-33
##
Legendre := function ( n, m )
    local  p, q, o;

    # check the arguments and reduce $n$ into the range $0..m-1$
    if m <= 0  then Error("<m> must be positive");  fi;
    if n <  0  then n := n mod m + m;  fi;
    if m <= n  then n := n mod m;      fi;

    # handle small values
    if n in [0,1,4,9,16]  then return  1;  fi;
    if m < 6              then return -1;  fi;

    # check that $n$ is a quadratic residue modulo every prime power $q$
    for p  in Set( FactorsInt( m ) )  do

        # find prime power $q$ and reduce $n$
        q := p;  while m mod (q * p) = 0  do q := q * p;  od;
        o := n mod q;

        # the largest power of $p$ that divides $o$ must be even
        while o > 0  and o mod p = 0  do
            if o mod p^2 <> 0  then return -1;  fi;
            o := o / p^2;
        od;

        # check that $m$ is a quadratic residue modulo $p$ with Jacobi
        if p = 2  then
            if o > 0  and o mod Minimum(8,q) <> 1  then return -1;  fi;
        else
            if Jacobi( o, p ) = -1                 then return -1;  fi;
        fi;

    od;

    # else $n$ is a quadratic residue modulo $m$
    return 1;
end;


#############################################################################
##
#F  RootMod( <n>, <k>, <m> )  . . . . . . . . . . . .  root modulo an integer
##
##  In the  second form  'RootMod' computes a  <k>th root  of the integer <n>
##  modulo the positive integer <m>, i.e., a <r> such that $r^k = n$ mod <m>.
##  If no such root exists 'RootMod' returns 'false'.
##
##  In the current implementation <k> must be a prime.
##
RootModPrime := function ( n, k, p )
    local   r,                  # <k>th root of <n> mod <p>, result
            kk,                 # largest power of <k> dividing <p>-1
            s,                  # cofactor for <r>
            ss,                 # power of <s>
            t,                  # <kk>th root of unity mod <p>
            tt,                 # power of <t>
            i;                  # loop variable

    # reduce $n$ into the range $0..p-1$
    InfoNumtheor1("#I  RootModPrime(",n,",",k,",",p,")\n");
    n := n mod p;

    # handle $p = 2$
    if p = 2  then
        r := n;

    # handle $n = 0$ (only possibility that <n> and <p> are not rel. prime)
    elif n = 0  then
        r := 0;

    # its easy if $k$ is invertable mod $p-1 = \phi(p)$
    elif GcdInt( p-1, k ) = 1  then
        InfoNumtheor2("#I   <r> = <n>^",1/k mod (p-1)," mod <p>\n");
        r := PowerModInt( n, 1/k mod (p-1), p );

    # check that $n$ has a $k$th root (Eulers criterium)
    elif PowerModInt( n, (p-1)/k, p ) = 1  then

        # $p-1 = x kk$, $x$ mod $k <> 0$
        kk := 1;  while (p-1)/kk mod k = 0  do kk := kk*k;  od;
        InfoNumtheor2("#I   ",p,"-1 = <x> * ",kk,", <x> mod ",k," <> 1\n");

        # find $r$ up to a $kk$-th root of 1, i.e., $n s = r^k, s^{kk/k} = 1$
        r := PowerModInt( n, 1/k mod ((p-1)/kk), p );
        s := PowerModInt( r, k, p ) / n mod p;
        InfoNumtheor2("#I   <n>*",s,"=",r,"^",k,", ",s,"^",kk/k,"=1\n");

        # find a generator $t$ of the subgroup of $kk$-th roots of 1,
        # i.e., $t^{kk/k} <> 1,  t^{kk} = 1$, therefor $s = (t^l)^k$
        i:=2; t:=PowerModInt(i,(p-1)/kk,p); tt:=PowerModInt(t,kk/k,p);
        while tt=1  do
            i:=i+1; t:=PowerModInt(i,(p-1)/kk,p); tt:=PowerModInt(t,kk/k,p);
        od;
        InfoNumtheor2("#I   ",t,"^",kk/k," <> 1, ",t,"^",kk," = 1\n");

        # $n s = r^k,  s^{kk/k} = 1,  t^{kk/k} <> 1,  t^{kk} = 1$
        while kk <> k  do
            InfoNumtheor2("#I   <n>*",s,"=",r,"^",k,", ",s,"^",kk/k,"=1\n");
            kk := kk/k;
            i  := t;
            t  := PowerModInt( t, k, p );
            ss := PowerModInt( s, kk/k, p );
            while ss <> 1  do
                r  := r  * i  mod p;
                s  := s  * t  mod p;
                ss := ss * tt mod p;
            od;
        od;
        InfoNumtheor2("#I   <n>*1=",r,"^",k,", 1^1=1\n");

    # otherwise $n$ has no root
    else
        r := false;

    fi;

    # return the root $r$
    InfoNumtheor1("#I  RootModPrime returns ",r,"\n");
    return r;
end;

RootModPrimePower := function ( n, k, p, l )
    local   r,                  # <k>th root of <n> mod <p>^<l>, result
            s,                  # <k>th root of <n> mod smaller power
            t;                  # temporary variable

    # delegate prime case
    InfoNumtheor1("#I  RootModPrimePower(",n,",",k,",",p,"^",l,")\n");
    if l = 1  then
        r := RootModPrime( n, k, p );

    # special case
    elif n mod p^l = 0  then
        r := 0;

    # if $n$ is a multiple of $p^k$ return $p (\sqrt[k]{n/p^k} mod p^l/p^k)$
    elif n mod p^k = 0  then
        s := RootModPrimePower( n/p^k, k, p, l-k );
        if s <> false  then
            r := s * p;
        else
            r := false;
        fi;

    # if $n$ is a multiple of $p$ but not of $p^k$ then no root exists
    elif n mod p = 0  then
        r := false;

    # handle the case that the root may not lift
    elif k = p  then

        # compute the root mod $p^{l/2}$, or $p^{l/2+1}$ if 32 divides $p^l$
        if 2 < p  or l < 5  then
            s := RootModPrimePower( n, k, p, QuoInt(l+1,2) );
        else
            s := RootModPrimePower( n, k, p, QuoInt(l+3,2) );
        fi;

        # lift the root to $p^l$, use higher precision
        InfoNumtheor2("#I   lift root with Newton / Hensel\n");
        t := PowerModInt( s, k-1, p^(l+1) );
        r := (s + (n - t * s) / (k * t)) mod p^l;
        if PowerModInt(r,k,p^l) <> n mod p^l  then
            r := false;
        fi;

    # otherwise lift the root with Newton / Hensel
    else

        # compute the root mod $p^{l/2}$, or $p^{l/2+1}$ if 32 divides $p^l$
        if 2 < p  or l < 5  then
            s := RootModPrimePower( n, k, p, QuoInt(l+1,2) );
        else
            s := RootModPrimePower( n, k, p, QuoInt(l+3,2) );
        fi;

        # lift the root to $p^l$
        InfoNumtheor2("#I   lift root with Newton / Hensel\n");
        t := PowerModInt( s, k-1, p^l );
        r := (s + (n - t * s) / (k * t)) mod p^l;

    fi;

    # return the root $r$
    InfoNumtheor1("#I  RootModPrimePower returns ",r,"\n");
    return r;
end;

RootMod := function ( arg )
    local   n,                  # <n>, first argument
            k,                  # <k>, optional second argument
            m,                  # <m>, third argument
            p,                  # prime divisor of <m>
            q,                  # power of <p>
            l,                  # <q> = <p>^<l>
            qq,                 # product of prime powers dividing <m>
            ii,                 # inverse of <qq> mod <q>
            r,                  # <k>th root of <n> mod <qq>
            s,                  # <k>th root of <n> mod <q>
            t;                  # temporary variable

    # get the arguments
    if   Length(arg) = 2  then n := arg[1];  k := 2;       m := arg[2];
    elif Length(arg) = 3  then n := arg[1];  k := arg[2];  m := arg[3];
    else Error("usage: RootMod( <n>, <m> ) or RootMod( <n>, <k>, <m> )");
    fi;
    InfoNumtheor1("#I  RootMod(",n,",",k,",",m,")\n");

    # check the arguments and reduce $n$ into the range $0..m-1$
    if m <= 0  then Error("<m> must be positive");  fi;
    n := n mod m;

    # combine the root modulo every prime power $p^l$
    r := 0;  qq := 1;
    for p  in Set( FactorsInt( m ) )  do

        # find prime power $q = p^l$
        q := p;  l := 1;
        while m mod (q * p) = 0  do q := q * p;  l := l + 1;  od;

        # compute the root mod $p^l$
        s := RootModPrimePower( n, k, p, l );
        if s = false  then
            InfoNumtheor1("#I  RootMod returns 'false'\n");
            return false;
        fi;

        # combine $r$ (the root mod $qq$) with $s$ (the root mod $p^l$)
        ii := 1/qq mod q;
        t := r + qq * ((s - r)*ii mod q);
        r := t;
        qq := qq * q;

    od;

    # return the root $rr$
    InfoNumtheor1("#I  RootMod returns ",r,"\n");
    return r;
end;


#############################################################################
##
#F  RootsMod( <n>, <k>, <m> ) . . . . . . . . . . . . roots modulo an integer
##
##  In the second form 'RootsMod' computes the <k>th roots of the integer <n>
##  modulo the positive integer <m>, ie. the <r> such that $r^k = n$ mod <m>.
##  If no such roots exist 'RootsMod' returns '[]'.
##
##  In the current implementation <k> must be a prime.
##
RootsModPrime := function ( n, k, p )
    local   rr,                 # <k>th roots of <n> mod <p>, result
            r,                  # one particular <k>th root of <n> mod <p>
            kk,                 # largest power of <k> dividing <p>-1
            s,                  # cofactor for <r>
            ss,                 # power of <s>
            t,                  # <kk>th root of unity mod <p>
            tt,                 # power of <t>
            i;                  # loop variable

    # reduce $n$ into the range $0..p-1$
    InfoNumtheor1("#I  RootsModPrime(",n,",",k,",",p,")\n");
    n := n mod p;

    # handle $p = 2$
    if p = 2  then
        rr := [ n ];

    # handle $n = 0$ (only possibility that <n> and <p> are not rel. prime)
    elif n = 0  then
        rr := [ 0 ];

    # its easy if $k$ is invertable mod $p-1 = \phi(p)$
    elif GcdInt( p-1, k ) = 1  then
        InfoNumtheor2("#I   <r> = <n>^",1/k mod (p-1)," mod <p>\n");
        rr := [ PowerModInt( n, 1/k mod (p-1), p ) ];

    # check that $n$ has a $k$th root (Eulers criterium)
    elif PowerModInt( n, (p-1)/k, p ) = 1  then

        # $p-1 = x kk$, $x$ mod $k <> 0$
        kk := 1;  while (p-1)/kk mod k = 0  do kk := kk*k;  od;
        InfoNumtheor2("#I   ",p,"-1 = <x> * ",kk,", <x> mod ",k," <> 1\n");

        # find $r$ up to a $kk$-th root of 1, i.e., $n s = r^k, s^{kk/k} = 1$
        r := PowerModInt( n, 1/k mod ((p-1)/kk), p );
        s := PowerModInt( r, k, p ) / n mod p;
        InfoNumtheor2("#I   <n>*",s,"=",r,"^",k,", ",s,"^",kk/k,"=1\n");

        # find a generator $t$ of the subgroup of $kk$-th roots of 1,
        # i.e., $t^{kk/k} <> 1,  t^{kk} = 1$, therefor $s = (t^l)^k$
        i:=2; t:=PowerModInt(i,(p-1)/kk,p); tt:=PowerModInt(t,kk/k,p);
        while tt=1  do
            i:=i+1; t:=PowerModInt(i,(p-1)/kk,p); tt:=PowerModInt(t,kk/k,p);
        od;
        InfoNumtheor2("#I   ",t,"^",kk/k," <> 1, ",t,"^",kk," = 1\n");

        # $n s = r^k,  s^{kk/k} = 1,  t^{kk/k} <> 1,  t^{kk} = 1$
        while kk <> k  do
            InfoNumtheor2("#I   <n>*",s,"=",r,"^",k,", ",s,"^",kk/k,"=1\n");
            kk := kk/k;
            i  := t;
            t  := PowerModInt( t, k, p );
            ss := PowerModInt( s, kk/k, p );
            while ss <> 1  do
                r  := r  * i  mod p;
                s  := s  * t  mod p;
                ss := ss * tt mod p;
            od;
        od;
        InfoNumtheor2("#I   <n>*1=",r,"^",k,", 1^1=1\n");

        # combine $r$ (a particular root) with the powers of $t$
        rr := [ r ];
        for i  in [2..k]  do
            r := r * t mod p;
            AddSet( rr, r );
        od;

    # otherwise $n$ has no root
    else
        rr := [];

    fi;

    # return the roots $rr$
    InfoNumtheor1("#I  RootsModPrime returns ",rr,"\n");
    return rr;
end;

RootsModPrimePower := function ( n, k, p, l )
    local   rr,                 # <k>th roots of <n> mod <p>^<l>, result
            r,                  # one element of <rr>
            ss,                 # <k>th roots of <n> mod smaller power
            s,                  # one element of <ss>
            t;                  # temporary variable

    # delegate prime case
    InfoNumtheor1("#I  RootsModPrimePower(",n,",",k,",",p,"^",l,")\n");
    if l = 1  then
        rr := RootsModPrime( n, k, p );

    # special case
    elif n mod p^l = 0  then
        t := QuoInt( l-1, k ) + 1;
        rr := [ 0 .. p^(l-t)-1 ] * p^t;

    # if $n$ is a multiple of $p^k$ return $p (\sqrt[k]{n/p^k} mod p^l/p^k)$
    elif n mod p^k = 0  then
        ss := RootsModPrimePower( n/p^k, k, p, l-k );
        rr := [];
        for s  in ss  do
            for t  in [ 0 .. p^(k-1)-1 ]   do
                AddSet( rr, s * p + t * p^(l-k+1) );
            od;
        od;

    # if $n$ is a multiple of $p$ but not of $p^k$ then no root exists
    elif n mod p = 0  then
        rr := [];

    # handle the case that the roots split
    elif k = p  then

        # compute the root mod $p^{l/2}$, or $p^{l/2+1}$ if 32 divides $p^l$
        if 2 < p  or l < 5  then
            ss := RootsModPrimePower( n, k, p, QuoInt(l+1,2) );
        else
            ss := RootsModPrimePower( n, k, p, QuoInt(l+3,2) );
        fi;

        # lift the roots to $p^l$, use higher precision
        rr := [];
        for s  in ss  do
            InfoNumtheor2("#I   lift root with Newton / Hensel\n");
            t := PowerModInt( s, k-1, p^(l+1) );
            r := (s + (n - t * s) / (k * t)) mod p^l;
            if PowerModInt(r,k,p^l) = n mod p^l  then
                for t  in [0..k-1]*p^(l-1)+1  do
                    AddSet( rr, r * t mod p^l );
                od;
            fi;
        od;

    # otherwise lift the roots with Newton / Hensel
    else

        # compute the root mod $p^{l/2}$, or $p^{l/2+1}$ if 32 divides $p^l$
        if 2 < p  or l < 5  then
            ss := RootsModPrimePower( n, k, p, QuoInt(l+1,2) );
        else
            ss := RootsModPrimePower( n, k, p, QuoInt(l+3,2) );
        fi;

        # lift the roots to $p^l$
        rr := [];
        for s  in ss  do
            InfoNumtheor2("#I   lift root with Newton / Hensel\n");
            t := PowerModInt( s, k-1, p^l );
            r := (s + (n - t * s) / (k * t)) mod p^l;
            AddSet( rr, r );
        od;

    fi;

    # return the roots $rr$
    InfoNumtheor1("#I  RootsModPrimePower returns ",r,"\n");
    return rr;
end;

RootsMod := function ( arg )
    local   n,                  # <n>, first argument
            k,                  # <k>, optional second argument
            m,                  # <m>, third argument
            p,                  # prime divisor of <m>
            q,                  # power of <p>
            l,                  # <q> = <p>^<l>
            qq,                 # product of prime powers dividing <m>
            ii,                 # inverse of <qq> mod <q>
            rr,                 # <k>th roots of <n> mod <qq>
            r,                  # one element of <rr>
            ss,                 # <k>th roots of <n> mod <q>
            s,                  # one element of <ss>
            tt;                 # temporary variable

    # get the arguments
    if   Length(arg) = 2  then n := arg[1];  k := 2;       m := arg[2];
    elif Length(arg) = 3  then n := arg[1];  k := arg[2];  m := arg[3];
    else Error("usage: RootsMod( <n>, <m> ) or RootsMod( <n>, <k>, <m> )");
    fi;
    InfoNumtheor1("#I  RootsMod(",n,",",k,",",m,")\n");

    # check the arguments and reduce $n$ into the range $0..m-1$
    if m <= 0  then Error("<m> must be positive");  fi;
    n := n mod m;

    # combine the roots modulo every prime power $p^l$
    rr := [0];  qq := 1;
    for p  in Set( FactorsInt( m ) )  do

        # find prime power $q = p^l$
        q := p;  l := 1;
        while m mod (q * p) = 0  do q := q * p;  l := l + 1;  od;

        # compute the roots mod $p^l$
        ss := RootsModPrimePower( n, k, p, l );

        # combine $rr$ (the roots mod $qq$) with $ss$ (the roots mod $p^l$)
        tt := [];
        ii := 1/qq mod q;
        for r  in rr  do
            for s  in ss  do
                Add( tt, r + qq * ((s-r)*ii mod q) );
            od;
        od;
        rr := tt;
        qq := qq * q;

    od;

    # return the roots $rr$
    InfoNumtheor1("#I  RootsMod returns ",rr,"\n");
    return Set( rr );
end;


#############################################################################
##
#F  RootsUnityMod(<k>,<m>)  . . . . . . . .  roots of unity modulo an integer
##
##  'RootsUnityMod' returns a list of <k>-th roots of unity modulo a positive
##  integer <m>, i.e., the list of all solutions <r> of <r>^<k> = 1 mod <m>.
##
##  In the current implementation <k> must be a prime.
##
RootsUnityModPrime := function ( k, p )
    local   rr,                 # <k>th roots of 1 mod <p>, result
            r,                  # <k>th root of unity mod <p>
            t,                  # <k>th root of unity mod <p>
            i;                  # loop variable

    # reduce $n$ into the range $0..p-1$
    InfoNumtheor1("#I  RootsUnityModPrime(",k,",",p,")\n");

    # handle $p = 2$
    if p = 2  then
        rr := [ 1 ];

    # its easy if $k$ is invertable mod $p-1 = \phi(p)$
    elif GcdInt( p-1, k ) = 1  then
        rr := [ 1 ];

    # check that $n$ has a $k$th root (Eulers criterium)
    else

        # find a generator $t$ of the subgroup of $k$-th roots of 1.
        i:=2; t:=PowerModInt(i,(p-1)/k,p);
        while t=1  do
            i:=i+1; t:=PowerModInt(i,(p-1)/k,p);
        od;

        # combine $r$ (a particular root) with the powers of $t$
        r := 1;
        rr := [ 1 ];
        for i  in [2..k]  do
            r := r * t mod p;
            AddSet( rr, r );
        od;

    fi;

    # return the roots $rr$
    InfoNumtheor1("#I  RootsUnityModPrime returns ",rr,"\n");
    return rr;
end;

RootsUnityModPrimePower := function ( k, p, l )
    local   rr,                 # <k>th roots of <n> mod <p>^<l>, result
            r,                  # one element of <rr>
            ss,                 # <k>th roots of <n> mod smaller power
            s,                  # one element of <ss>
            t;                  # temporary variable

    # delegate prime case
    InfoNumtheor1("#I  RootsUnityModPrimePower(",k,",",p,"^",l,")\n");
    if l = 1  then
        rr := RootsUnityModPrime( k, p );

    # if $k$ is invertable mod $\phi(p^l)$ then there is only one root
    elif GcdInt(k,(p-1)*p) = 1  then
        rr := [ 1 ];

    # if $p = k = 2$
    elif p = 2  and k = 2  then
        rr := Set( [ 1, p^(l-1)-1, p^(l-1)+1, p^l-1 ] );

    # if $p = k$
    elif p = k  then
        rr := [0..k-1]*p^(l-1)+1;

    # special case to speed up things a little bit
    elif k = 2  then
        rr := [ 1, p^l-1 ];
      
    # otherwise lift the roots with Newton / Hensel
    else

        # compute the root mod $p^{l/2}$
        ss := RootsUnityModPrimePower( k, p, QuoInt(l+1,2) );

        # lift the roots to $p^l$
        rr := [];
        for s  in ss  do
            InfoNumtheor2("#I   lift root with Newton / Hensel\n");
            t := PowerModInt( s, k-1, p^l );
            r := (s + (1 - t * s) / (k * t)) mod p^l;
            AddSet( rr, r );
        od;

    fi;

    # return the roots $rr$
    InfoNumtheor1("#I  RootsUnityModPrimePower returns ",r,"\n");
    return rr;
end;

RootsUnityMod := function ( arg )
    local   k,                  # <k>, optional first argument
            m,                  # <m>, second argument
            p,                  # prime divisor of <m>
            q,                  # power of <p>
            l,                  # <q> = <p>^<l>
            qq,                 # product of prime powers dividing <m>
            ii,                 # inverse of <qq> mod <q>
            rr,                 # <k>th roots of <n> mod <qq>
            r,                  # one element of <rr>
            ss,                 # <k>th roots of <n> mod <q>
            s,                  # one element of <ss>
            tt;                 # temporary variable

    # get the arguments
    if   Length(arg) = 1  then k := 2;       m := arg[1];
    elif Length(arg) = 2  then k := arg[1];  m := arg[2];
    else Error("usage: RootsUnityMod( <m> ) or RootsUnityMod( <k>, <m> )");
    fi;
    InfoNumtheor1("#I  RootsUnityMod(",k,",",m,")\n");

    # combine the roots modulo every prime power $p^l$
    rr := [0];  qq := 1;
    for p  in Set( FactorsInt( m ) )  do

        # find prime power $q = p^l$
        q := p;  l := 1;
        while m mod (q * p) = 0  do q := q * p;  l := l + 1;  od;

        # compute the roots mod $p^l$
        ss := RootsUnityModPrimePower( k, p, l );

        # combine $rr$ (the roots mod $qq$) with $ss$ (the roots mod $p^l$)
        tt := [];
        ii := 1/qq mod q;
        for r  in rr  do
            for s  in ss  do
                Add( tt, r + qq * ((s-r)*ii mod q) );
            od;
        od;
        rr := tt;
        qq := qq * q;

    od;

    # return the roots $rr$
    InfoNumtheor1("#I  RootsUnityMod returns ",rr,"\n");
    return Set( rr );
end;


#############################################################################
##
#F  LogMod( <n>, <r>, <m> ) . . . . . .  discrete logarithm modulo an integer
##
LogMod := function ( n, r, m )
    local   x, l;
    n := n mod m;
    x := 1;
    l := 0;
    while x <> n  do
        x := (x * r) mod m;
        l := l + 1;
        if l = m  then
    	    return false;
        fi;
    od;
    return l;
end;


#############################################################################
##
#F  IsResidueClass(<obj>) . . . . . . .  test if an object is a residue class
##
IsResidueClass := function ( obj )
    return IsRec( obj )
           and IsBound( obj.isResidueClass )
           and obj.isResidueClass;
end;


#############################################################################
##
#F  ResidueClass(<representative>,<modulus>)  . . . .  create a residue class
##
ResidueClass := function ( representative, modulus )
    local res;
    res := rec();
    res.isGroupElement  := true;
    res.isDomain        := true;
    res.isResidueClass  := true;
    res.representative  := representative mod modulus;
    res.modulus         := modulus;
    res.isFinite        := false;
    res.size            := "infinity";
    res.domain          := ResidueClasses;
    res.operations      := ResidueClassOps;
    return res;
end;

ResidueClassOps := MergedRecord( GroupElementOps, DomainOps );

ResidueClassOps.\= := function ( l, r )
    local   isEql;
    if IsResidueClass( l )  then
        if IsResidueClass( r )  then
            isEql :=    l.representative = r.representative
                    and l.modulus        = r.modulus;
        else
            isEql := false;
        fi;
    else
        if IsResidueClass( r )  then
            isEql := false;
        else
            Error("panic, neither <l> nor <r> is a residue class");
        fi;
    fi;
    return isEql;
end;

ResidueClassOps.\< := function ( l, r )
    local   isLess;
    if IsResidueClass( l )  then
        if IsResidueClass( r )  then
            isLess :=   l.representative < r.representative
                    or (l.representative = r.representative
                        and l.modulus    < r.modulus);
        else
            isLess := not IsInt( r ) and not IsRat( r )
                  and not IsCyc( r ) and not IsPerm( r )
                  and not IsWord( r ) and not IsAgWord( r );
        fi;
    else
        if IsResidueClass( r )  then
            isLess :=  IsInt( l ) or IsRat( l )
                    or IsCyc( l ) or IsPerm( l )
                    or IsWord( l ) or IsAgWord( l );
        else
            Error("panic, neither <l> nor <r> is a residue class");
        fi;
    fi;
    return isLess;
end;

ResidueClassOps.\* := function ( l, r )
    local   prd;        # product of <l> and <r>, result
    if IsResidueClass( l )  then
        if IsResidueClass( r )  then
            if l.modulus <> r.modulus  then
                Error( "<l> and <r> must have the same modulus" );
            fi;
            prd := ResidueClass(
                        l.representative * r.representative,
                        l.modulus );
        elif IsList( r )  then
            prd := List( r, x -> l * x );
        else
            Error("product of <l> and <r> must be defined");
        fi;
    elif IsList( l )  then
        if IsResidueClass( r )  then
            prd := List( l, x -> x * r );
        else
            Error("panic: neither <l> nor <r> is a residue class");
        fi;
    else
        if IsResidueClass( r )  then
            if IsRec( l )  and IsBound( l.operations )
                and IsBound( l.operations.\* )
                and l.operations.\* <> ResidueClassOps.\*
            then
                prd := l.operations.\*( l, r );
            else
                Error("product of <l> and <r> must be defined");
            fi;
        else
            Error("panic, neither <l> nor <r> is a residue class");
        fi;
    fi;
    return prd;
end;

ResidueClassOps.\^ := function ( l, r )
    local    pow;
    if IsResidueClass( l )  then
        if IsResidueClass( r )  then
            if l.modulus <> r.modulus  then
                Error("<l> and <r> must have the same modulus");
            fi;
            if GcdInt( r.representative, r.modulus ) <> 1  then
                Error("<r> must be invertable");
            fi;
            pow := l;
        elif IsInt( r )  then
            pow := ResidueClass(
                        PowerMod( l.representative, r, l.modulus ),
                        l.modulus );
        else
            Error("power of <l> and <r> must be defined");
        fi;
    else
        if IsResidueClass( r )  then
            Error("power of <l> and <r> must be defined");
        else
            Error("panic, neither <l> nor <r> is a residue class");
        fi;
    fi;
    return pow;
end;

ResidueClassOps.\in := function ( element, class )
    if IsInt( element )  then
        return (element mod class.modulus = class.representative);
    else
        return false;
    fi;
end;

ResidueClassOps.Intersection := function ( R, S )
    local   I,          # intersection of <R> and <S>, result
            gcd;        # gcd of the moduli
    if IsResidueClass( R )  then
        if IsResidueClass( S )  then
            gcd := GcdInt( R.modulus, S.modulus );
            if     R.representative mod gcd
                <> S.representative mod gcd
            then
                I := [];
            else
                I := ResidueClass(
                        ChineseRem(
                               [ R.representative, S.representative ],
                               [ R.modulus,        S.modulus ] ),
                        LcmInt(  R.modulus,        S.modulus ) );
            fi;
        else
            I := DomainOps.Intersection( R, S );
        fi;
    else
        I := DomainOps.Intersection( R, S );
    fi;
    return I;
end;

ResidueClassOps.Print := function ( r )
    Print("ResidueClass( ",r.representative,", ",r.modulus," )");
end;

ResidueClassOps.Group := function ( R )
    return ResidueClassesOps.Group( ResidueClasses, [R], R^0 );
end;


#############################################################################
##
#V  ResidueClasses  . . . . . . . . . . . . . . domain of all residue classes
##
ResidueClasses          := Copy( GroupElements );
ResidueClasses.name     := "ResidueClasses";
ResidueClassesOps       := Copy( GroupElementsOps );
ResidueClasses.operations := ResidueClassesOps;

ResidueClassesOps.Group := function ( ResidueClasses, gens, id )
    local   G,          # group <G>, result
            gen;        # one generator from <gens>
    for gen  in gens  do
        if gen.modulus <> id.modulus  then
            Error("the generators must all have the same modulus");
        fi;
        if GcdInt( gen.representative, gen.modulus ) <> 1  then
          Error("the generators must all be prime residue classes");
        fi;
    od;
    G := GroupElementsOps.Group( ResidueClasses, gens, id );
    G.modulus    := id.modulus;
    G.operations := ResidueClassGroupOps;
    return G;
end;


#############################################################################
##
#V  ResidueClassGroupOps  . . . . operations record of residue classes groups
##
ResidueClassGroupOps    := Copy( GroupOps );

ResidueClassGroupOps.Subgroup := function ( G, gens )
    local   S,          # subgroup of <G>, result
            gen;        # one generator from <gens>
    for gen  in gens  do
        if gen.modulus <> G.modulus  then
            Error("the generators must all have the same modulus");
        fi;
        if GcdInt( gen.representative, gen.modulus ) <> 1  then
          Error("the generators must all be prime residue classes");
        fi;
    od;
    S := GroupOps.Subgroup( G, gens );
    S.modulus    := G.modulus;
    S.operations := ResidueClassGroupOps;
    return S;
end;

ResidueClassGroupOps.TrivialSubgroup := function ( G )
    local   T;
    T := GroupOps.TrivialSubgroup( G );
    Unbind( T.elements );
    return T;
end;

ResidueClassGroupOps.SylowSubgroup := function ( G, p )
    local   S,          # Sylow subgroup of <G>, result
            gen,        # one generator of <G>
            ord,        # order of <gen>
            gens;       # generators of <S>
    gens := [];
    for gen  in G.generators  do
        ord := OrderMod( gen.representative, G.modulus );
        while ord mod p = 0  do ord := ord / p;  od;
        Add( gens, gen ^ ord );
    od;
    S := Subgroup( Parent( G ), gens );
    return S;
end;

ResidueClassGroupOps.MakeFactors := function ( G )
    local   p, q,       # prime factor of modulus and largest power
            r, s,       # two rows of the standard generating system
            g,          # extended gcd of leading entries in <r>, <s>
            x, y,       # two entries in <r> and <s>
            i, k, l;    # loop variables

    # find the factors of the direct product
    G.facts := [];
    G.roots := [];
    G.sizes := [];
    for p  in Set( Factors( G.modulus ) )  do
        q := p;
        while G.modulus mod (p*q) = 0  do q := p*q;  od;
        if q mod 4 = 0  then
            Add( G.facts, 4 );
            Add( G.roots, 3 );
            Add( G.sizes, 2 );
        fi;
        if q mod 8 = 0  then
            Add( G.facts, q );
            Add( G.roots, 5 );
            Add( G.sizes, q/4 );
        fi;
        if p <> 2  then
            Add( G.facts, q );
            Add( G.roots, PrimitiveRootMod( q ) );
            Add( G.sizes, (p-1)*q/p );
        fi;
    od;

    # represent each generator in this factorization
    G.sgs := [];
    for k  in [ 1 .. Length( G.generators ) ]  do
        G.sgs[k] := [];
        for i  in [ 1 .. Length( G.facts ) ]  do
            if G.facts[i] mod 8 = 0  then
                if G.generators[k].representative mod 4 = 1  then
                    G.sgs[k][i] := LogMod(
                        G.generators[k].representative,
                        G.roots[i], G.facts[i] );
                else
                    G.sgs[k][i] := LogMod(
                        -G.generators[k].representative,
                        G.roots[i], G.facts[i] );
                fi;
            else
                G.sgs[k][i] := LogMod(
                        G.generators[k].representative,
                        G.roots[i], G.facts[i] );
            fi;
        od;
    od;
    for i  in [ Length( G.sgs ) + 1 .. Length( G.facts ) ]  do
        G.sgs[i] := 0 * G.facts;
    od;

    # bring this matrix to diagonal form
    for i  in [ 1 .. Length( G.facts ) ]  do
        r := G.sgs[i];
        for k  in [ i+1 .. Length( G.sgs ) ]  do
            s := G.sgs[k];
            g := Gcdex( r[i], s[i] );
            for l  in [ i .. Length( r ) ]  do
                x := r[l];  y := s[l];
                r[l] := (g.coeff1 * x + g.coeff2 * y) mod G.sizes[l];
                s[l] := (g.coeff3 * x + g.coeff4 * y) mod G.sizes[l];
            od;
        od;
        s := [];
        x := G.sizes[i] / GcdInt( G.sizes[i], r[i] );
        for l  in [ 1 .. Length( r ) ]  do
            s[l] := (x * r[l]) mod G.sizes[l];
        od;
        Add( G.sgs, s );
    od;

end;

ResidueClassGroupOps.Size := function ( G )
    local   s,          # size of <G>, result
            i;          # loop variable
    if not IsBound( G.facts )  then
        G.operations.MakeFactors( G );
    fi;
    s := 1;
    for i  in [ 1 .. Length( G.facts ) ]  do
        s := s * G.sizes[i] / GcdInt( G.sizes[i], G.sgs[i][i] );
    od;
    return s;
end;

ResidueClassGroupOps.\in := function ( res, G )
    local   s,          # exponent vector of <res>
            g,          # extended gcd
            x, y,       # two entries in <s> and '<G>.sgs[i]'
            i, l;       # loop variables
    if not IsResidueClass( res )
        or res.modulus <> G.modulus
        or GcdInt( res.representative, res.modulus ) <> 1
    then
        return false;
    fi;
    if not IsBound( G.facts )  then
        G.operations.MakeFactors( G );
    fi;
    s := [];
    for i  in [ 1 .. Length( G.facts ) ]  do
        if G.facts[i] mod 8 = 0  then
            if res.representative mod 4 = 1  then
                s[i] := LogMod( res.representative,
                                G.roots[i], G.facts[i] );
            else
                s[i] := LogMod( -res.representative,
                                G.roots[i], G.facts[i] );
            fi;
        else
            s[i] := LogMod( res.representative,
                            G.roots[i], G.facts[i] );
        fi;
    od;
    for i  in [ 1 .. Length( G.facts ) ]  do
        if s[i] mod GcdInt( G.sizes[i], G.sgs[i][i] ) <> 0  then
            return false;
        fi;
        g := Gcdex( G.sgs[i][i], s[i] );
        for l  in [ i .. Length( G.facts ) ]  do
            x := G.sgs[i][l];  y := s[l];
            s[l] := (g.coeff3 * x + g.coeff4 * y) mod G.sizes[l];
        od;
    od;
    return true;
end;

ResidueClassGroupOps.Random := function ( G )
    local   s,          # exponent vector of random element
            r,          # vector of remainders in each factor
            i, k, l;    # loop variables
    if not IsBound( G.facts )  then
        G.operations.MakeFactors( G );
    fi;
    s := 0 * G.facts;
    for i  in [ 1 .. Length( G.facts ) ]  do
        l := G.sizes[i] / GcdInt( G.sizes[i], G.sgs[i][i] );
        k := Random( [ 0 .. l-1 ] );
        for l  in [ i .. Length( s ) ]  do
            s[l] := (s[l] + k * G.sgs[i][l]) mod G.sizes[l];
        od;
    od;
    r := [];
    for l  in [ 1 .. Length( s ) ]  do
        r[l] := PowerModInt( G.roots[l], s[l], G.facts[l] );
        if G.facts[l] mod 8 = 0  and r[1] = 3  then
            r[l] := G.facts[l] - r[l];
        fi;
    od;
    return ResidueClass( ChineseRem( G.facts, r ), G.modulus );
end;


#############################################################################
##
#F  PrimeResidueClassGroup(<m>) . . . . . . .  full prime residue class group
##
PrimeResidueClassGroup := function ( m )
    local   G,          # group $Z/mZ$, result
            gens,       # generators of <G>
            p, q,       # prime and prime power dividing <m>
            r,          # primitive root modulo <q>
            g;          # is = <r> mod <q> and = 1 mod <m> / <q>

    # add generators for each prime power factor <q> of <m>
    gens := [];
    for p  in Set( Factors( m ) )  do
        q := p;
        while m mod (q * p) = 0  do q := q * p;  od;

        # $ Z / 4Z = < 3 > $
        if   q = 4  then
            r := 3;
            g := r + q * (((1/q mod (m/q)) * (1 - r)) mod (m/q));
            Add( gens, ResidueClass( g, m ) );

        # $ Z / 8nZ = < 5, -1 > $ is *not* cyclic
        elif q mod 8 = 0  then
            r := q-1;
            g := r + q * (((1/q mod (m/q)) * (1 - r)) mod (m/q));
            Add( gens, ResidueClass( g, m ) );
            r := 5;
            g := r + q * (((1/q mod (m/q)) * (1 - r)) mod (m/q));
            Add( gens, ResidueClass( g, m ) );

        # for odd <q> $ Z / qZ $ is cyclic
        elif q <> 2  then
            r :=  PrimitiveRootMod( q );
            g := r + q * (((1/q mod (m/q)) * (1 - r)) mod (m/q));
            Add( gens, ResidueClass( g, m ) );
        fi;

    od;

    # return the group generated by <gens>
    G := Group( gens, ResidueClass( 1, m ) );
    G.size := Phi( m );
    return G;
end;


#############################################################################
##
#E  Emacs . . . . . . . . . . . . . . . . . . . . . . . local emacs variables
##
##  Local Variables:
##  outline-regexp:     "#[AFVET]"
##  fill-column:        77
##  fill-prefix:        "##  "
##  paragraph-start:    "^##$"
##  paragraph-separate: "^##$"
##  eval:               (outline-minor-mode)
##  eval:               (hide-body)
##  End:
##



