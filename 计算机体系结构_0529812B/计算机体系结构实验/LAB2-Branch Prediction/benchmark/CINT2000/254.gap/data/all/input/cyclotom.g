#############################################################################
##
#A  cyclotom.g                  GAP library                     Thomas Breuer
##
#A  @(#)$Id: cyclotom.g,v 3.12.1.1 1994/09/10 10:28:30 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains  those  functions  that  mainly  deal  with cyclotomics,
##  that is sums of rational multiples of roots of unity.
##
#H  $Log: cyclotom.g,v $
#H  Revision 3.12.1.1  1994/09/10  10:28:30  sam
#H  fixed 'ER' for negative arguments (suggested by J. Hirbawi)
#H
#H  Revision 3.12  1992/02/24  18:00:26  sam
#H  fixed bug in 'NK'
#H
#H  Revision 3.11  1992/02/13  09:41:38  sam
#H  fixed bug in 'NK'
#H
#H  Revision 3.10  1992/01/03  10:53:48  sam
#H  improved 'Quadratic'
#H
#H  Revision 3.9  1991/12/12  11:36:56  sam
#H  fixed bug in 'Quadratic'
#H
#H  Revision 3.8  1991/12/04  09:29:30  sam
#H  inserted a <space> after each function name
#H
#H  Revision 3.7  1991/12/03  17:09:15  sam
#H  added some functions for rings, corrected some bugs
#H
#H  Revision 3.6  1991/11/29  14:48:23  sam
#H  completely revised, domain dependent functions added
#H
#H  Revision 3.5  1991/10/15  07:43:27  sam
#H  little changes in 'Quadratic'
#H
#H  Revision 3.4  1991/10/01  14:29:00  casper
#H  changed 'Gcd' to 'GcdInt'
#H
#H  Revision 3.3  1991/09/05  15:54:23  sam
#H  changed 'LcmList' to 'Lcm'
#H
#H  Revision 3.2  1991/09/05  15:36:45  sam
#H  changed 'PrimitiveRoot' to 'PrimitiveRootMod'
#H
#H  Revision 3.1  1991/09/05  14:53:21  sam
#H  changed 'Quo' to 'QuoInt'
#H
#H  Revision 3.0  1991/09/03  13:58:53  goetz
#H  Initial Revision.
#H
##


#############################################################################
##
#F  IntCyc( <cyc> ) . . . . . . . . . . . .  cyclotomic integer near to <cyc>
##
IntCyc := function ( x )
    local i, int, n, cfs;
    n:= NofCyc( x );
    cfs:= COEFFSCYC( x );
    int:= 0;
    for i in [ 1 .. n ] do int:= int + Int( cfs[i] ) * E(n)^(i-1); od;
    return int;
    end;


#############################################################################
##
#F  RoundCyc( <cyc> ) . . . . . . . . . . .  cyclotomic integer near to <cyc>
##
RoundCyc := function ( x )
    local i, int, n, cfs;
    n:= NofCyc( x );
    cfs:= COEFFSCYC( x );
    int:= 0;
    for i in [ 1 .. n ]  do
      if cfs[i] < 0 then
        int:= int + Int( cfs[i]-1/2 ) * E(n)^(i-1);
      else
        int:= int + Int( cfs[i]+1/2 ) * E(n)^(i-1);
      fi;
    od;
    return int;
    end;


#############################################################################
##
#F  'CoeffsCyc( <z>, <N> )'
##
##  If <z> is a cyclotomic that lies in the field of <N>-th roots of unity,
##  'CoeffsCyc' returns a list of length <N> which is the Zumbroich base 
##  representation of <z> in that field, i.e. at position 'i' the
##  coefficient of 'E(N)^(i-1)' is stored.
##
CoeffsCyc := function( z, N )
    local j, k, p, n, quo, coeffs, newcoeffs;
    coeffs:= COEFFSCYC( z );     # the internal function:
                                 # returns 'CoeffsCyc( z, NofCyc( z ) )'
    quo:= N / NofCyc( z );
    if not IsInt( quo ) then
      Error( "no representation of <z> in ",Ordinal(N)," roots of unity" );
    fi;
    
    # blow up step by step
    
    for p in FactorsInt( quo ) do
      n:= Length( coeffs );
      newcoeffs:= List( [ 1 .. p*n ], x -> 0 );
      if p = 2 or n mod p = 0 then
    
        # simply blow up the base elements:
        # for a base element 'E(n)^k' we have 'E(n*p)^(k*p)' in the base, too
    
        for k in [ 1 .. Length( coeffs ) ] do
          if coeffs[k] <> 0 then newcoeffs[ (k-1)*p + 1 ]:= coeffs[k]; fi;
        od;
      else
    
        # replace 'E(n)^k' by $ - \sum_{j=1}^p 'E(n*p)^(p*k+j*n)'$
    
        for k in [ 1 .. Length( coeffs ) ] do
          if coeffs[k] <> 0 then
            for j in [ 1 .. p-1 ] do
              newcoeffs[ ( ( (k-1)*p + j*n  ) mod (n*p) ) + 1 ]:= -coeffs[k];
            od;
          fi;
        od;
      fi;
      coeffs:= newcoeffs;
    od;
    return coeffs;
    end;


#############################################################################
##
#F  CycList( <coeffs> ) . . . . .  cyclotomic of Zumbroich base coeff. vector
##
##  (mainly used to read tables produced by 'ctoc')
##
##  *Note*\: 'CycList( COEFFSCYC( <cyc> ) )' = <cyc>, but
##           'COEFFSCYC( CycList( <coeffs> ))' need not be equal to <coeffs>.
##
CycList := function( coeffs )
    local i, n;
    n:= Length( coeffs );
    return Sum( [ 1 .. n ], i -> coeffs[i] * E(n)^(i-1) );
    end;


#############################################################################
##
#F  Atlas1( <n>, <i> )  . . . . . . . . . . . . . . . utility for EB, ..., EH
##
##  calculates the value $\frac{1}{i}\sum{j=1}^{n-1}z_n^{j^i}$ for
##  $2 \leq i \leq 8$ and $<n> \equiv 1 \pmod{i}$; if $i > 2$, <n> should
##  be a prime to get sure that the result is well defined; 'ATLAS' returns
##  the value given above if it is a cyclotomic integer.
##  (see: Conway et al, ATLAS of finite groups, Oxford University Press 1985;
##  here: chapter 7, section 10)
##
Atlas1 := function( n, i )
    local k, kpow, resultlist, atlas;
    if not IsInt( n ) or n < 1 then
      Error("usage: EB(<n>),EC(<n>),..,EH(<n>) with appropriate integer <n>");
    elif n mod i <> 1 then
      Error("<n> not congruent 1 mod ", i );
    fi;
    if n = 1 then return 0; fi;
    atlas:= 0;
    if i mod 2 = 0 then
      for k in [ 1 .. QuoInt( n-1, 2 ) ] do
        atlas:= atlas + 2 * E( n ) ^ ( (k^i) mod n );
      od;
    else
      for k in [ 1 .. QuoInt( n-1, 2 ) ] do
        atlas:= atlas + E(n)^( ( k^i ) mod n ) + E(n)^( n - ( k^i ) mod n );
      od;
      if n mod 2 = 0 then
        atlas:= atlas + E( n ) ^ ( ( ( n / 2 ) ^ i )  mod  n );
      fi;
    fi;
    atlas:= atlas / i;
    if not IsCycInt( atlas ) then
      Error( "result divided by ", i, " is not a cyclotomic integer" );
    fi;
    return atlas;
    end;


#############################################################################
##
#F  EB( <n> ), EC( <n> ), \ldots, EH( <n> ) . . .  some ATLAS irrationalities
##
EB := n -> Atlas1( n, 2 );
EC := n -> Atlas1( n, 3 );
ED := n -> Atlas1( n, 4 );
EE := n -> Atlas1( n, 5 );
EF := n -> Atlas1( n, 6 );
EG := n -> Atlas1( n, 7 );
EH := n -> Atlas1( n, 8 );


#############################################################################
##
#F  NK( <n>, <k>, <deriv> ) . . . . . . . . utility for ATLAS irrationalities
##
##  'NK( <n>, <k>, <deriv> )' is the $(<deriv>+1)$-th number of multiplicative
##  order exactly <k> modulo <N>, chosen in the order of preference
##  \[ 1, -1, 2, -2, 3, -3, 4, -4, \ldots .\]
##  (see: Conway et al, ATLAS of finite groups, Oxford University Press 1985;
##  here: chapter 7, section 10)
##
NK := function( n, k, deriv )
    local i, nk;
    if n <= 2 or ( k in [ 2, 3, 5, 6, 7 ] and Phi( n ) mod k <> 0 )
              or k < 2 or k > 8 then
      Error( "value does not exist" );
    fi;
    if k mod 4 = 0 then

      # an automorphism of order 4 exists if 4 divides $p-1$ for an odd
      # prime divisor $p$ of 'n', or if 16 divides 'n';
      # an automorphism of order 8 exists if 8 divides $p-1$ for an odd
      # prime divisor $p$ of 'n', or if 32 divides 'n';
      if ForAll(Set(FactorsInt(n)),x->(x-1) mod k<>0) and n mod (4*k)<>0 then
        Error( "value does not exist" );
      fi;
    fi;
    nk:= 1;
    if k in [ 2, 3, 5, 7 ] then		# for primes
      while true do
        if ( nk ^ k ) mod n = 1 and nk mod n <> 1 then
          if deriv = 0 then return nk; fi;
          deriv:= deriv - 1;
        fi;
        if ( ( (-nk) ^ k ) - 1 ) mod n = 0 and ( -nk -1 ) mod n <> 0 then
          if deriv = 0 then return -nk; fi;
          deriv:= deriv - 1;
        fi;
        nk:= nk + 1;
      od;
    elif k = 4 then
      while true do
        if ( nk ^ 4 ) mod n = 1 and ( nk ^ 2 ) mod n <> 1 then
          if deriv = 0 then return nk; fi;
          deriv:= deriv - 1;
          if deriv = 0 then return -nk; fi;
          deriv:= deriv - 1;
        fi;
        nk:= nk + 1;
      od;
    elif k = 6 then
      while true do
        if (nk^6) mod n = 1 and (nk^2) mod n <> 1 and (nk^3) mod n <> 1 then
          if deriv = 0 then return nk; fi;
          deriv:= deriv - 1;
        fi;
        if (nk^6) mod n=1 and (nk^2) mod n<>1 and (-(nk^3) mod n)+n<>1 then
          if deriv = 0 then return -nk; fi;
          deriv:= deriv - 1;
        fi;
        nk:= nk + 1;
      od;
    elif k = 8 then
      while true do
        if ( nk ^ 8 ) mod n = 1 and ( nk ^ 4 ) mod n <> 1 then
          if deriv = 0 then return nk; fi;
          deriv:= deriv - 1;
          if deriv = 0 then return -nk; fi;
          deriv:= deriv - 1;
        fi;
        nk:= nk + 1;
      od;
    fi; 
    end;


#############################################################################
##
#F  Atlas2( <n>, <k>, <deriv> ) . . . . . . utility for ATLAS irrationalities
##
Atlas2 := function( n, k, deriv )
    local i, e, nk, result;
    
    if not ( IsInt( n ) and IsInt( k ) and IsInt( deriv ) ) then
      Error( "usage: ATLAS irrationalities require integral arguments" );
    fi;
    
    nk:= NK( n, k, deriv );
    e:= E(n);
    result:= 0;
    for i in [ 0 .. k-1 ] do
      result:= result + e^( (nk^i) mod n );
    od;
    return result;
    end;


#############################################################################
##
#F  EY(<n>), EY(<n>,<deriv>) . . . . . . .  ATLAS irrationalities $y_n$ resp.
#F                                          $y_n^{<deriv>}$
#F  ... ES(<n>), ES(<n>,<deriv>)              ... $s_n$ resp. $s_n^{<deriv>}$
##
EY :=function(arg) if   Length(arg)=1 then return Atlas2(arg[1],2,0);
                  elif Length(arg)=2 then return Atlas2(arg[1],2,arg[2]);
                  else Error( "usage: EY(n) resp. EY(n,deriv)" ); fi; end;

EX :=function(arg) if   Length(arg)=1 then return Atlas2(arg[1],3,0);
                  elif Length(arg)=2 then return Atlas2(arg[1],3,arg[2]);
                  else Error( "usage: EX(n) resp. EX(n,deriv)" ); fi; end;

EW :=function(arg) if   Length(arg)=1 then return Atlas2(arg[1],4,0);
                  elif Length(arg)=2 then return Atlas2(arg[1],4,arg[2]);
                  else Error( "usage: EW(n) resp. EW(n,deriv)" ); fi; end;

EV :=function(arg) if   Length(arg)=1 then return Atlas2(arg[1],5,0);
                  elif Length(arg)=2 then return Atlas2(arg[1],5,arg[2]);
                  else Error( "usage: EV(n) resp. EV(n,deriv)" ); fi; end;

EU :=function(arg) if   Length(arg)=1 then return Atlas2(arg[1],6,0);
                  elif Length(arg)=2 then return Atlas2(arg[1],6,arg[2]);
                  else Error( "usage: EU(n) resp. EU(n,deriv)" ); fi; end;

ET :=function(arg) if   Length(arg)=1 then return Atlas2(arg[1],7,0);
                  elif Length(arg)=2 then return Atlas2(arg[1],7,arg[2]);
                  else Error( "usage: ET(n) resp. ET(n,deriv)" ); fi; end;

ES :=function(arg) if   Length(arg)=1 then return Atlas2(arg[1],8,0);
                  elif Length(arg)=2 then return Atlas2(arg[1],8,arg[2]);
                  else Error( "usage: ES(n) resp. ES(n,deriv)" ); fi; end;


#############################################################################
##
#F  EM( <n> ), EM( <n>, <deriv> ) . . . . ATLAS irrationality $m_{<n>}$ resp.
##                                                        $m_{<n>}^{<deriv>}$
EM := function( arg )
    local n;
    n:= arg[1];
    if Length( arg ) = 1 then
      return E(n) - E(n)^(-1);
    elif Length( arg ) = 2 and IsInt( n ) then
      return E(n) - E(n)^( NK( n, 2, arg[2] ) mod n );
    else
      Error( "usage: EM(<n>) resp. EM(<n>,<deriv>)" );
    fi;
    end;


#############################################################################
##
#F  EL( <n> ), EL( <n>, <deriv> ) . . . . ATLAS irrationality $l_{<n>}$ resp.
##                                                        $l_{<n>}^{<deriv>}$
EL := function( arg )
    local n, nk;
    n:= arg[1];
    if Length( arg ) > 2 or not IsInt( n ) then
      Error( "usage: EL( <n> ) resp. EL( <n>, <deriv> )" );
    fi;
    if Length(arg)=1 then
      nk:= NK(n,4,0) mod n;
    else
      nk:= NK(n,4,arg[2]) mod n;
    fi;
    return E(n)-E(n)^nk+E(n)^((nk^2) mod n)-E(n)^((nk^3) mod n);
    end;


#############################################################################
##
#F  EK( <n> ), EK( <n>, <deriv> ) . . . . ATLAS irrationality $k_{<n>}$ resp.
##                                                        $k_{<n>}^{<deriv>}$
EK := function( arg )
    local n, nk;
    n:= arg[1];
    if Length( arg ) > 2 or not IsInt( n ) then
      Error( "usage: EK( <n> ) resp. EK( <n>, <deriv> )" );
    fi;
    if Length(arg)=1 then
      nk:= NK(n,6,0) mod n;
    else
      nk:= NK(n,6,arg[2]) mod n;
    fi;
    return E(n)-E(n)^nk+E(n)^((nk^2) mod n)-E(n)^((nk^3) mod n)+
           E(n)^((nk^4) mod n)-E(n)^((nk^5) mod n);
    end;


#############################################################################
##
#F  EJ( <n> ), EJ( <n>, <deriv> ) . . . . ATLAS irrationality $j_{<n>}$ resp.
##                                                        $j_{<n>}^{<deriv>}$
EJ := function( arg )
    local n, nk;
    n:= arg[1];
    if Length( arg ) > 2 or not IsInt( n ) then
      Error( "usage: EJ( <n> ) resp. EJ( <n>, <deriv> )" );
    fi;
    if Length(arg)=1 then
      nk:= NK(n,8,0) mod n;
    else
      nk:= NK(n,8,arg[2]) mod n;
    fi;
    return E(n)-E(n)^nk+E(n)^((nk^2) mod n)-E(n)^((nk^3) mod n)+
           E(n)^((nk^4) mod n)-E(n)^((nk^5) mod n)+E(n)^((nk^6) mod n)-
           E(n)^((nk^7) mod n);
    end;


#############################################################################
##
#F  ER( <n> ) . . . . ATLAS irrationality $r_{<n>}$ (pos. square root of <n>)
##
ER := function( n )
    local factor;
    if not IsInt( n ) then Error( "argument must be integer valued" ); fi;
    if n = 0 then
      return 0;
    elif n < 0 then
      factor:= E(4);
      n:= -n;
    else
      factor:= 1;
    fi;
    if   n mod 4 = 1 then return factor * ( 2 * EB(n) + 1 );
    elif n mod 4 = 2 then return factor * ( E(8) - E(8)^3 ) * ER( n / 2 );
    elif n mod 4 = 3 then return factor * (-E(4)) * ( 2 * EB(n) + 1 );
    else                  return factor * 2 * ER( n / 4 );
    fi;
    end;

#############################################################################
##
#F  EI( <n> ) . . . . ATLAS irrationality $i_{<n>}$ (the square root of -<n>)
##
EI := function( n )
    return E(4) * ER(n);
    end;

#############################################################################
##
#F  StarCyc( <cyc> )  . . . . the unique nontrivial galois conjugate of <cyc>
##
StarCyc := function( cyc )
    local i, conj;
    conj:= [];
    for i in PrimeResidues( NofCyc( cyc ) ) do
      AddSet( conj, GaloisCyc( cyc, i ) );
    od;
    if Length( conj ) = 2 then
      return Difference( conj, [ cyc ] )[1];
    else
      return false;
    fi;
    end;


#############################################################################
##
#F  Quadratic( <cyc> ) . . . . . informations about quadratic irrationalities
##
##  If <cyc> is a quadratic irrationality, Quadratic( <cyc> ) calculates the
##  representation $<cyc> = \frac{ a + b \sqrt{ 'root' } }{'d'}$ and a
##  (not necessarily shortest) representation by a combination of the \ATLAS\
##  irrationalities $b_{'root'}, i_{'root'}$ and $r_{'root'}$.
##  Otherwise 'false' is returned.
##
##  1. If the denominator 'd' is 2, necessarily 'root' is congruent 1 mod 4,
##     and $r_n$, $i_n$ are not possible;
##     '<cyc> = x + y * EB( root )' with y = b, x = ( a + b ) / 2.
##  2. If the denominator 'd' is 1, we have the possibilities
##     $i_n$ for $'root' \< -1$, 'a + b * i' for 'root' = -1, $a + b * r_n$
##     for $'root' > 0$. Furthermore if 'root' is congruent 1 modulo 4, also
##     '<cyc> = (a+b) + 2 * b * EB( root )' is possible; the shortest string
##     of these is taken as value for the field ATLAS.
##
Quadratic := function( cyc )
    local i, root, a, b, d, list, facts, two_part, ATLAS, ATLAS2;

    if not IsCycInt( cyc ) then
      return false;
    elif IsInt( cyc ) then
      return rec( a:= cyc, b:= 0, root:= 1, d:= 1, ATLAS:= String( cyc ) );
    fi;

    list:= COEFFSCYC( cyc );
    facts:= FactorsInt( Length( list ) );
    two_part:= 0;
    for i in facts do if i = 2 then two_part:= two_part + 1; fi; od;

    if two_part > 3 or
       ( two_part = 2 and Length( facts ) <> Length( Set( facts ) ) + 1 ) or
       ( two_part < 2 and Length( facts ) <> Length( Set( facts ) ) ) then
      return false;
    fi;

    facts:= Set( facts );
    if two_part = 0 then
      root:= Length( list );
      if root mod 4 = 3 then root:= -root; fi;
      a:= StarCyc( cyc );
      if a = false then return false; fi;
      a:= cyc + a;                       # trace of 'cyc' over the rationals
      if Length( facts ) mod 2 = 0 then
        b:= 2 * list[2] - a;
      else
        b:= 2 * list[2] + a;
      fi;
      if a mod 2 = 0 and b mod 2 = 0 then
        a:= a / 2;
        b:= b / 2;
        d:= 1;
      else
        d:= 2;
      fi;
    elif two_part = 2 then
      root:= Length( list ) / 4;
      if root = 1 then
        a:= list[1];
        b:= - list[2];
      else
        a:= list[5];
        if Length( facts ) mod 2 = 0 then a:= -a; fi;
        b:= - list[ root + 5 ];
      fi;
      if root mod 4 = 1 then
        root:= -root;
        b:= -b;
      fi;
      d:= 1;
    else		# two_part = 3
      root:= Length( list ) / 4;
      if root = 2 then
        a:= list[1];
        b:= list[2];
        if b = list[4] then
          root:= -2;
        fi;
      else
        a:= list[9];
        if Length( facts ) mod 2 = 0 then a:= -a; fi;
        b:= list[ root / 2 + 9 ];
        if b <> - list[ 3 * root / 2 - 7 ] then
          root:= -root;
        elif ( root / 2 ) mod 4 = 3 then
          b:= -b;
        fi;
      fi;
      d:= 1;
    fi;
    
    if d * cyc <> a + b * ER( root ) then return false; fi;
    if d = 2 then		# necessarily 'root' congruent 1 mod 4,
    			# only $b_{'root'}$ possible
      if a = -b then
        ATLAS:= "";
      else
        ATLAS:= String( ( a + b ) / 2 );
      fi;
      if b = -1 then
        ATLAS:= ConcatenationString( ATLAS, "-" );
      elif b < 0 then
        ATLAS:= ConcatenationString( ATLAS, String( b ) );
      else
        if ATLAS <> "" then
          ATLAS:= ConcatenationString( ATLAS, "+" );
        fi;
        if b <> 1 then
          ATLAS:= ConcatenationString( ATLAS, String( b ) );
        fi;
      fi;
      if root > 0 then
        ATLAS:= ConcatenationString( ATLAS, "b", String( root ) );
      else
        ATLAS:= ConcatenationString( ATLAS, "b", String( -root ) );
      fi;
    else
      if a = 0 then
        ATLAS:= "";
      else
        ATLAS:= String( a );
      fi;
      if a <> 0 and b > 0 then ATLAS:= ConcatenationString( ATLAS, "+" ); fi;
      if b = -1 then
        ATLAS:= ConcatenationString( ATLAS, "-" );
      elif b <> 1 then
        ATLAS:= ConcatenationString( ATLAS, String( b ) );
      fi;
      if root > 0 then
        ATLAS:= ConcatenationString( ATLAS, "r", String( root ) );
      elif root = -1 then
        ATLAS:= ConcatenationString( ATLAS, "i" );
      else
        ATLAS:= ConcatenationString( ATLAS, "i", String( -root ) );
      fi;
      if ( root -1 ) mod 4 = 0 then
        if a = -b then
          ATLAS2:= String( 2 * b );
        else
          ATLAS2:= ConcatenationString( String( a+b ), "+", String( 2*b ) );
        fi;
        if root > 0 then
          ATLAS2:= ConcatenationString( ATLAS2, "b", String( root ) );
        else
          ATLAS2:= ConcatenationString( ATLAS2, "b", String( -root ) );
        fi;
        if LengthString(ATLAS2) < LengthString(ATLAS) then ATLAS:= ATLAS2; fi;
      fi;
    fi;
    return rec( a:= a, b:= b, root:= root, d:= d, ATLAS:= ATLAS );
    end;


#############################################################################
##
#F  GeneratorsPrimeResidues( <N> ) . . . . . . generators of the Galois group
##
##  returns a record with fields 'primes' (the list of prime divisors of
##  'N'), 'exponents' (the list of exponents of these primes) and
##  'generators' (the list of generators of the prime--parts of the
##  group of prime residues; for p = 2 a list of two generators, otherwise
##  a primitive root).
##
GeneratorsPrimeResidues := function( n )
    local factors, exponents, primes, generators, ppart, rest, gcd, pos,
          root, i;
    
    if n = 1 then return rec( primes:=[], exponent:=[], generators:=[] ); fi;
    
    factors:= Collected( FactorsInt( n ) );
    
    exponents := [];
    primes    := [];
    generators:= [];   # For each prime part 'ppart', the generator must be
                       # congruent to a primitive root modulo 'ppart' and
                       # congruent 1 modulo the rest 'N/ppart'.
    
    if factors[1][1] = 2 then
      primes[1]   := 2;
      exponents[1]:= factors[1][2];
      ppart:= 2 ^ factors[1][2];
      rest:= n / ppart;
      gcd:= Gcdex( ppart, rest );
      generators[1]:=   ( -2 * gcd.coeff2 * rest + 1 ) mod n; # generator '**'
      if ppart mod 8 = 0 then 
        generators[2]:= (  4 * gcd.coeff2 * rest + 1 ) mod n; # generator '*5'
        generators:= [ generators ];
      fi;
      pos:= 2;
    else
      pos:= 1;
    fi;
    
    for i in [ pos .. Length( factors ) ] do
      ppart:= factors[i][1] ^ factors[i][2];
      rest:= n / ppart;
      gcd:= Gcdex( ppart, rest );
      root:= PrimitiveRootMod( ppart );
      primes[i]    := factors[i][1];
      exponents[i] := factors[i][2];
      generators[i]:= ( ( root - 1 ) * gcd.coeff2 * rest + 1 ) mod n;
    od;
    
    return rec( primes    := primes,
                exponents := exponents,
                generators:= generators );
    end;


#############################################################################
##
#F  GaloisMat( <mat> )
##
##  calculates the completions of orbits under the operation of the galois
##  group of the irrationalities of <mat>, and the permutations of rows
##  corresponding to the generators of the galois group.
##
##  If some rows of <mat> are identical, only the first one is considered
##  for the permutations, and a warning will be printed.
##
GaloisMat := function( mat )
    local i, j, k, l, m, generator, ncha, nccl, n, galoisfams, warned,
    	genexp, x, y, generators, X,
    	irrats, fusion, value, irratsimages, automs, family, orders, exp,
    	image, oldorder, cosets, auto, conj, blocklength, innerlength;
    #
    warned:= false;     # at most one warning will be printed if 'mat' grows
    ncha:= Length( mat );
    nccl:= Length( mat[1] );
    mat:= ShallowCopy( mat );
    
    # step 1: find minimal cyclotomic field $Q_n$ containing all irrational
    #         entries of <mat>:
    
    galoisfams:= []; 	# will contain information about conjugate characters:
    			# 1 means rational character,
    			# -1 means character with undefs
    			# 0 means dependent irrational character
    			# [ .. ] means leading irrational character
    n:= 1;
    for i in [ 1 .. ncha ] do
      if ForAny( mat[i], IsUnknown ) then
        galoisfams[i]:= -1;
      elif ForAll( mat[i], IsRat ) then
        galoisfams[i]:= 1;
      else
        n:= LcmInt( n, NofCyc( mat[i] ) );
      fi;
    od;
    
    # step 2: compute generators for Aut( Q(n):Q )
    # 	  ( compute generators for (Z/nZ)* and convert them to exponents )
    
    if n > 1 then
    
      genexp:= GeneratorsPrimeResidues( n ).generators;
      if IsList( genexp[1] ) then
        genexp:= Concatenation( genexp[1],
                                Sublist( genexp, [ 2..Length( genexp ) ] ) );
      fi;
    
      generators:= []; # every galois automorphism induces a permutation of
                       # rows, compute the permutations for each generating
                       # automorphism
      for i in [ 1 .. ncha ] do generators[i]:= i; od;
      generators:= List( genexp, x -> Copy( generators ) );   # idperm
    
    else
      generators:= [];	# rational matrix
    fi;
    
    # step 3: for each character X find and complete the family of conjugates
    
    for i in [ 1 .. ncha ] do
      if not IsBound( galoisfams[i] ) then      # independent character,
                                                # not integral, no undefs
        X:= mat[i];
        for j in [ i+1 .. ncha ] do
          if mat[j] = X then
            galoisfams[j]:= Unknown();
    
            Print( "#E GaloisMat: row ", i, " is equal to row ", j, "\n" );
    
          fi;
        od;
        irrats:= []; # list of distinct irrationalities of X (not ordered);
    		 # every galois automorphism induces a permutation of that
    		 # list rather than of X's entries themselves.
        fusion:= []; # how to distribute the entries of irrats to X
        for j in [ 1 .. nccl ] do
          if IsCyc( X[j] ) and not IsRat( X[j] ) then
            k:= 1;
            while k <= Length( irrats ) and X[j] <> irrats[k] do k:= k+1; od;
            if k > Length( irrats ) then      # first appearance of X[j] in X
              irrats[k]:= X[j];
            fi;
            fusion[j]:= k;	# position in irrats
          else
            fusion[j]:= 0;
          fi;
        od;
        irratsimages:= [ irrats ];
        automs:= [ 1 ];
        family:= [ i ];	# indices of family members (same ordering as automs)
        orders:= [];	# orders[k] will be the order of the k-th generator
        for j in [ 1 .. Length( genexp ) ] do
          exp:= genexp[j];
          image:= List( irrats, x -> GaloisCyc( x, exp mod NofCyc( x ) ) );
          oldorder:= Length( automs );	# group order up to now
          cosets:= [];
          orders[j]:= 1;
          while not image in irratsimages do
            orders[j]:= orders[j] + 1;
            for k in [ 1 .. oldorder ] do
              auto:= ( automs[k] * exp ) mod n;
              image:= List( irrats, x -> GaloisCyc( x, auto mod NofCyc(x) ) );
              conj:= [];			# the conjugate character
              for l in [ 1 .. nccl ] do
    	    if fusion[l] = 0 then
                  conj[l]:= X[l];
    	    else
                  conj[l]:= image[ fusion[l] ];
    	    fi;
              od;
              l:= i+1;
              while l <= ncha and mat[l] <> conj do l:= l+1; od;
              if l <= ncha then
      	    galoisfams[l]:= 0;
                Add( family, l );
    	    for m in [ l+1 .. ncha ] do
    	      if mat[m] = conj then galoisfams[m]:= 0; fi;
    	    od;
              else
    
                if not warned and Length( mat ) > 500 then
                  Print( "#I GaloisMat: completion of <mat> will have",
                         " more than 500 rows\n" );
                  warned:= true;
                fi;
    
     	    Add( mat, conj );
    	    galoisfams[ Length( mat ) ]:= 0;
                Add( family, Length( mat ) );
              fi;	
              Add( automs, auto );
              Add( cosets, image );
            od;
            exp:= exp * genexp[j];
            image:= List( irrats, x -> GaloisCyc( x, exp mod NofCyc( x ) ) );
          od;
          irratsimages:= Concatenation( irratsimages, cosets );
        od;
        galoisfams[i]:= [ family, automs ];    # conjugates and automorphisms
    
        # Now the length of 'family' is the order of the Galois family of the
        # row 'X'.
    
        # compute the permutation operation of the generators on the set of
        # rows in 'family'\:
    
        blocklength:= 1;
        for j in [ 1 .. Length( genexp ) ] do
          innerlength:= blocklength;
          blocklength:= blocklength * orders[j];
          generator:= [ 1 .. blocklength ];
    
          # 'genexp[j]' maps the conjugates under the action of
          # $\langle 'genexp[1]',\ldots,'genexp[j-1]' \rangle$
          # (a set of length 'innerlength') as
          # one block to their images and preserves the order of
          # succession.
    
          for l in [ 1 .. blocklength - innerlength ] do
            generator[l]:= l + innerlength;
          od;
    
          # How does a power of 'genexp[j]' map back to the block:
    
          exp:= ( genexp[j] ^ orders[j] ) mod n;  # operates on the block
          for l in [ 1 .. innerlength ] do
            generator[ l + blocklength - innerlength ]:=
                 Position( irratsimages, List( irrats,
                           x->GaloisCyc( x, exp*automs[l] mod NofCyc(x) ) ) );
          od;
    
          # Transfer this operation to the cosets under the operation of
          # $\langle 'genexp[j+1],\ldots,'genexp[ Length( genexp ) ]' \rangle$
          # and transfer this to <mat> via 'family'\:
    
          for k in [ 0 .. Length( family ) / blocklength - 1 ] do
            for l in [ 1 .. blocklength ] do
              generators[j][ family[ l + k*blocklength ] ]:=
                           family[ generator[ l ] + k*blocklength ];
            od;
          od;
        od;
    
      fi;
    od;
    generators:= Set( List( generators, x-> PermList(x) ) );
    RemoveSet( generators, () );
    if generators = [] then generators:= [ () ]; fi;
    return rec( mat:= mat,
    	    galoisfams:= galoisfams,
    	    generators:= generators );
    end;
	  

#############################################################################
##
#F  RationalizedMat( <mat> ) . .  list of rationalized rows of <mat>
##
RationalizedMat := function( mat )
    local i, x, rationalizedmat, rationalfams, mat;
    rationalizedmat:= [];
    rationalfams:= GaloisMat( mat );
    mat:= rationalfams.mat;
    rationalfams:= rationalfams.galoisfams;
    for i in [ 1 .. Length( mat ) ] do
      if rationalfams[i] in [ 1, -1 ] then 	# rational or with undefs
        Add( rationalizedmat, Copy( mat[i] ) );
      elif IsList( rationalfams[i] ) then  	# leading character
        Add( rationalizedmat, Sum( Sublist( mat, rationalfams[i][1] ) ) );
      fi;
    od;
    return rationalizedmat;
    end;


