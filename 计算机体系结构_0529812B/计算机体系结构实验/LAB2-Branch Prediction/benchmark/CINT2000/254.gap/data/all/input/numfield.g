#############################################################################
##
#A  numfield.g                  GAP library                     Thomas Breuer
##
#A  @(#)$Id: numfield.g,v 3.17.1.1 1995/06/28 07:07:40 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains those functions   that deal with  number fields,  that
##  is   subfields  of cyclotomic  fields,   and  their  elements  (which are
##  cyclotomics, see 'cyclotom.g')
##
#H  $Log: numfield.g,v $
#H  Revision 3.17.1.1  1995/06/28  07:07:40  sam
#H  fixed 'Coefficients' for the case that 'z' is not in 'F'
#H
#H  Revision 3.17  1994/06/28  10:01:20  sam
#H  fixed 'Coefficients' for number fields
#H
#H  Revision 3.16  1994/05/26  11:40:14  sam
#H  improved 'NF'
#H
#H  Revision 3.15  1994/05/19  12:03:26  sam
#H  fixed minor bug in 'NF' (further changes will be necessary ...)
#H
#H  Revision 3.14  1994/05/06  12:42:29  sam
#H  added MinimalPolynomial
#H
#H  Revision 3.13  1994/04/13  08:22:57  sam
#H  introduced 'OperationsRecord'
#H
#H  Revision 3.12  1994/02/09  17:48:30  sam
#H  added '.char' component of 'Cyclotomics'
#H
#H  Revision 3.11  1993/11/08  15:11:08  sam
#H  changed 'Cyclotomics' to behave like a field
#H  for allowing 'X(Cyclotomics)'
#H
#H  Revision 3.10  1993/03/11  14:02:47  sam
#H  added '<' for number fields
#H
#H  Revision 3.9  1993/02/09  14:25:55  martin
#H  made undefined globals local
#H
#H  Revision 3.8  1993/02/04  11:10:55  sam
#H  corrections mainly concerning CF(4) and GaussianRationals
#H
#H  Revision 3.7  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.6  1992/11/02  12:58:14  sam
#H  fixed bug in 'OrderCyc'
#H
#H  Revision 3.5  1992/08/11  17:21:45  sam
#H  changed 'Print' functions of number fields, fixed minor bug
#H
#H  Revision 3.4  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.3  1992/02/13  14:22:16  sam
#H  added 'GaloisGroup'
#H
#H  Revision 3.2  1991/12/04  11:14:09  sam
#H  corrected errors in 'NumberRingOps'
#H
#H  Revision 3.1  1991/12/04  10:22:20  sam
#H  changed succession of functions (necess. to overlay correctly)
#H
#H  Revision 3.0  1991/12/04  09:14:35  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  IsNumberField( <obj> )  . . .  test if <obj> is a cyclotomic field record
##
IsNumberField := function ( obj )
    return IsRec( obj )
           and IsBound( obj.isField ) and obj.isField
           and obj.char = 0
           and ForAll( obj.generators, IsCyc );
    end;


#############################################################################
##
#F  IsCyclotomicField( <obj> )  .  test if <obj> is a cyclotomic field record
##
IsCyclotomicField := function ( obj )
    return IsNumberField( obj )
           and IsBound( obj.isCyclotomicField ) and obj.isCyclotomicField;
    end;


#############################################################################
##
#V  NumberFieldOps  . . . . . . . . . . . operations record for number fields
##
NumberFieldOps := OperationsRecord( "NumberFieldOps", FieldOps );


#############################################################################
##
#F  NumberFieldOps.\<( <F1>, <F2> ) . . . . . . . comparison of number fields
##
NumberFieldOps.\< := function ( F1, F2 )
    if IsField( F1 ) and IsField( F2 ) and
       F1.char = 0 and F2.char = 0 then
      return NofCyc( F1.generators ) < NofCyc( F2.generators )
             or ( NofCyc( F1.generators ) = NofCyc( F2.generators )
                  and F1.stabilizer < F2.stabilizer );
    else
      Error( "no comparison of number field and other object implemented" );
    fi;
    end;


#############################################################################
##
#F  NumberFieldOps.\in( <z>, <F> ) . . . . . . . .   test if <z> lies in <F>
##
NumberFieldOps.\in := function ( z, F )
    return IsCyc( z )
           and NofCyc( F.generators ) mod NofCyc( z ) = 0  # same envelopping
                                                           # cyclotomic field
           and ForAll( F.stabilizer, x -> GaloisCyc( z, x ) = z );
    end;


#############################################################################
##
#F  NumberFieldOps.Intersection( <F>, <G> ) . . intersection of number fields
##
NumberFieldOps.Intersection := function ( F, G )
    local i, j, N, stab, stabF, stabG;
    
    if IsNumberField( F ) and IsNumberField( G ) then
    
      if IsCyclotomicField( F ) then
    
        if IsCyclotomicField( G ) then
    
          return CF( GcdInt( NofCyc(F.generators), NofCyc(G.generators) ) );
    
        else
    
          # intersection of cyclotomic field 'F = FC(N)' with number field
          # 'G'; simply take the elements of 'G.stabilizer' modulo 'N'.
          # (If a reduction is necessary, 'NF' will do.)
    
          N:= NofCyc( F.generators );
          return NF( N, Set( List( G.stabilizer, x -> x mod N ) ) );
    
        fi;
    
      elif IsCyclotomicField( G ) then
    
        # intersection of cyclotomic field 'G = FC(N)' with number field 'F';
        # simply take the elements of 'F.stabilizer' modulo 'N'.
        # (If a reduction is necessary, 'NF' will do.)
    
        N:= NofCyc( G.generators );
        return NF( N, Set( List( F.stabilizer, x -> x mod N ) ) );
    
      else
    
        # first compute 'N' where 'CF(N)' contains the intersection;
        # reduce the elements of the stabilizers modulo 'N', i.e. intersect
        # 'F' and 'G' with 'CF(N)';
        # then compute the corresponding stabilizer, i.e. the product of
        # stabilizers.
        N:= GcdInt( NofCyc( F.generators), NofCyc( G.generators ) );
        stabF:= Set( List( F.stabilizer, x -> x mod N ) );
        stabG:= Set( List( G.stabilizer, x -> x mod N ) );
        stab:= [];
        for i in stabF do
          for j in stabG do
            AddSet( stab, ( i * j ) mod N );
          od;
        od;
    
        # (If a reduction is necessary, 'NF' will do.)
    
        return NF( N, stab );
    
      fi;
    else
      return FieldOps.Intersection( F, G );
    fi;
    end;


#############################################################################
##
#F  NumberFieldOps.Random( <F> )  . . . . .  random element of a number field
##
NumberFieldOps.Random := function ( F )

    # get random elements of the subfield and multiply with the base
    if IsBound( F.base ) then
      if F.field = 0 then
        return List( F.base, x->Random(Rationals) ) * F.base;
      else
        return List( F.base, x->Random( F.field ) ) * F.base;
      fi;
    else
      return FieldOps.Random( F );
    fi;
    end;


#############################################################################
##
#F  NumberFieldOps.Print( <F> ) . . . . . . . . . . . .  print a number field
##
NumberFieldOps.Print := function ( F )
    if IsBound( F.name ) then
      Print( F.name );
    elif F.field = 0 then
      if IsBound( F.basechangemat ) then
        Print( "NF( 0,", F.base, ")" );
      else
        Print( "NF(", NofCyc( F.generators ), ",", F.stabilizer, ")" );
      fi;
    else
      if IsBound( F.basechangemat ) then
        Print( "NF(", F.field, ",", F.base, ")" );
      else
        Print( "NF(", NofCyc( F.generators ), ",", F.stabilizer, ")/",
               F.field );
      fi;
    fi;
    end;


#############################################################################
##
#F  NumberFieldOps.\/( <F>, <G> )  . . . . . . . . quotient of number fields
##
NumberFieldOps.\/ := function( F, G )

    if not ForAll( G.generators, x -> x in F ) then
      Error( "<G> is not a subfield of <F>" );
    fi;

    if IsCyclotomicField( F ) then
      return CF( G, NofCyc( F.generators ) );
    else
      if F.field = 0 or F.field = Rationals then
        return NF( G, F.base );
      else
        return NF( G, Concatenation( List( F.base, x -> x*F.field.base ) ) );
      fi;
    fi;
    end;


#############################################################################
##
#F  NumberFieldOps.GaloisGroup(<F>) . . . . .  Galois group of a number field
##
NumberFieldOps.GaloisGroup := function ( F )
    local group;
    group:= Group( List( Flat(
                GeneratorsPrimeResidues( NofCyc(F.generators) ).generators ),
                         x -> NFAutomorphism( F, x ) ),
                   IdentityMapping( F ) );

    if IsInt( F.field )  then

        # Galois group of a number field over the rationals,
        # simply a factor group of the Galois group of the conductor
        return group;
    else

        # take the subgroup of the prime residue group that fixes 'F.field'
        # pointwise; the required group is a factor group of this group

        return Group( Stabilizer( group, F.field.generators, OnTuples ) );
    fi;
end;


#############################################################################
##
#F  IsNFAutomorphism(<obj>)  . . . . test if an object is a number field aut.
##
IsNFAutomorphism := function ( obj )
    return IsRec( obj )
       and IsBound( obj.isNFAutomorphism )
       and obj.isNFAutomorphism;
end;


#############################################################################
##
#F  NFAutomorphism( <F>, <k> ) . . . . . . . . automorphism of a number field
#V  NFAutomorphismOps  . . . . . . . operations record for number field auts.
##
NFAutomorphism := function ( F, k )

    # check the arguments
    if not IsNumberField( F ) then Error("<F> must be a number field"); fi;

    # Let $F / K$ be a field extension where $Q_n$ is the conductor of $F$;
    # let $S(F)$ be the group of those prime residues mod $n$ that fix $F$
    # pointwise.  The Galois group of $F / K$ is in natural correspondence
    # to $S(K) / S(F)$.  Thus each automorphism of $F / K$ corresponds to
    # a coset $c$ of $S(K)$, and it acts on $F$ like each element of $c$.
    # The automorphism 'NFAutomorphism( F/K, k )' maps $x\in F / K$ to
    # 'GaloisCyc( <x>, k )'.


    # make the mapping record
    return rec(
        isGeneralMapping        := true,
        domain                  := Mappings,

        isNFAutomorphism        := true,
        galois                  := Set(List(F.stabilizer,
                                       x->x*k mod NofCyc(F.generators)))[1],
        source                  := F,
        range                   := F,

        isMapping               := true,
        isHomomorphism          := true,
        isSurjective            := true,
        isInjective             := true,
        isBijection             := true,

        operations              := NFAutomorphismOps );

end;

NFAutomorphismOps := OperationsRecord( "NFAutomorphismOps",
                                       FieldHomomorphismOps );

NFAutomorphismOps.\= := function ( aut1, aut2 )
    if IsNFAutomorphism( aut1 )  then
        if IsNFAutomorphism( aut2 )  then
            return aut1.source  = aut2.source
               and aut1.galois  = aut2.galois;
        else
            return false;
        fi;
    else
        if IsNFAutomorphism( aut2 )  then
            return false;
        else
            Error("panic: neither <aut1> nor <aut2> is a NF aut.");
        fi;
    fi;
end;

NFAutomorphismOps.ImageElm := function ( aut, elm )
    return GaloisCyc( elm, aut.galois );
end;

NFAutomorphismOps.ImagesElm := function ( aut, elm )
    return [ GaloisCyc( elm, aut.galois ) ];
end;

NFAutomorphismOps.ImagesSet := function ( aut, elms )
    if IsField( elms )  and  IsSubset( aut.source, elms )  then
      if IsInt( elms.field ) then
        return NF( List( elms.generators,
                         x->GaloisCyc(x,aut.galois) ) );
      else
        return NF( List( elms.generators,
                         x->GaloisCyc(x,aut.galois) ) ) / 
               NF( List( elms.field.generators,
                         x->GaloisCyc(x,aut.galois) ) );
      fi;
    else
        return FieldHomomorphismOps.ImagesSet( aut, elms );
    fi;
end;

NFAutomorphismOps.ImagesRepresentative := function ( aut, elm )
    return GaloisCyc( elm, aut.galois );
end;

NFAutomorphismOps.CompositionMapping := function ( aut1, aut2 )
    if IsNFAutomorphism( aut1 )  then
        if IsNFAutomorphism( aut2 ) and aut1.source = aut2.source then
            return NFAutomorphism( aut1.source,
                                           aut1.galois * aut2.galois );
        else
            return FieldHomomorphismOps.CompositionMapping( aut1, aut2 );
        fi;
    else
        return FieldHomomorphismOps.CompositionMapping( aut1, aut2 );
    fi;
end;

NFAutomorphismOps.InverseMapping := function ( aut )
    return NFAutomorphism( aut.source, 1 / aut.galois );
end;

NFAutomorphismOps.PowerMapping := function ( aut, i )
    return NFAutomorphism( aut.source, aut.galois^i );
end;

NFAutomorphismOps.\< := function ( aut1, aut2 )
    if IsNFAutomorphism( aut1 )  then
        if IsNFAutomorphism( aut2 )  then
            if aut1.source <> aut2.source  then
                return aut1.source < aut2.source;
            else
                return aut1.galois < aut2.galois;
            fi;
        else
            return FieldHomomorphismOps.\<( aut1, aut2 );
        fi;
    else
        return FieldHomomorphismOps.\<( aut1, aut2 );
    fi;
end;

NFAutomorphismOps.Print := function ( aut )
    if aut.galois = 1  then
        Print( "IdentityMapping( ", aut.source, " )" );
    else
        Print( "NFAutomorphism( ", aut.source, " , ", aut.galois, " )" );
    fi;
end;

NumberFieldOps.IdentityMapping := F -> NFAutomorphism( F, 1 );


#############################################################################
##
#F  NumberFieldOps.Conjugates( <F>, <z> ) .  all conjugates of an alg. number
##
NumberFieldOps.Conjugates := function ( F, z )
    local N, gal, result, pnt;
    
    N:= NofCyc( F.generators );
    
    # automorphisms of the envelopping cyclotomic field
    gal:= PrimeResidues( N );
    
    if IsNumberField( F.field ) and F.field <> Rationals then
    
      # take only the subgroup of 'gal' that fixes 'F.field'
      gal:= Filtered( gal,
                      x -> ForAll(F.field.generators,y->GaloisCyc(y,x)=y) );
    fi;
    
    # get representatives of cosets of 'F.stabilizer'
    result:= [];
    while gal <> [] do
      pnt:= gal[1];
      Add( result, GaloisCyc( z, pnt ) );
      SubtractSet( gal, List( F.stabilizer, x -> ( x * pnt ) mod N ) );
    od;
    
    return result;
    end;


#############################################################################
##
#F  NumberFieldOps.Norm( <F>, <z> ) . . . . . . . . .  norm of an alg. number
##
NumberFieldOps.Norm := function ( F, z )
    local N, gal, result, pnt;
    
    N:= NofCyc( F.generators );
    
    # automorphisms of the envelopping cyclotomic field
    gal:= PrimeResidues( N );
    
    if IsNumberField( F.field ) and F.field <> Rationals then
    
      # take only the subgroup of 'gal' that fixes 'F.field'
      gal:= Filtered( gal,
                      x -> ForAll(F.field.generators,y->GaloisCyc(y,x)=y) );
    fi;
    
    # get representatives of cosets of 'F.stabilizer'
    result:= 1;
    while gal <> [] do
      pnt:= gal[1];
      result:= result * GaloisCyc( z, pnt );
      SubtractSet( gal, List( F.stabilizer, x -> ( x * pnt ) mod N ) );
    od;
    
    return result;
    end;


#############################################################################
##
#F  NumberFieldOps.Trace( <F>, <z> )  . . . . . . . . trace of an alg. number
##
NumberFieldOps.Trace := function ( F, z )
    local N, gal, result, pnt;
    
    N:= NofCyc( F.generators );
    
    # automorphisms of the envelopping cyclotomic field
    gal:= PrimeResidues( N );
    
    if IsNumberField( F.field ) and F.field <> Rationals then
    
      # take only the subgroup of 'gal' that fixes 'F.field'
      gal:= Filtered( gal,
                      x -> ForAll(F.field.generators,y->GaloisCyc(y,x)=y) );
    fi;
    
    # get representatives of cosets of 'F.stabilizer'
    result:= 0;
    while gal <> [] do
      pnt:= gal[1];
      result:= result + GaloisCyc( z, pnt );
      SubtractSet( gal, List( F.stabilizer, x -> ( x * pnt ) mod N ) );
    od;
    
    return result;
    end;


#############################################################################
##
#F  NumberFieldOps.Order( <F>, <z> )  . . . . . . . . order of an alg. number
##
OrderCyc := function ( cyc )
    local ord, val;
    if not IsCyc( cyc ) or cyc = 0 then
      Error( "argument must be a nonzero cyclotomic" );
    elif cyc ^ ( 2 * NofCyc( cyc ) ) <> 1 then   # not a root of unity
      return "infinity";
    else
      ord:= 1;
      val:= cyc;
      while val <> 1 do
        val:= val * cyc;
        ord:= ord + 1;
      od;
      return ord;
    fi;
    end;

NumberFieldOps.Order := function ( F, z ) return OrderCyc( z ); end;


#############################################################################
##
#F  NormalBaseNumberField(<F>[,<x>])  . . . . . normal base of a number field
##
##  returns a normal base of the number field 'F' with respect to 'F.subfield'
##  (using the algorithm given in E. Artin, Galoissche Theorie, p. 65 f.).
##
##  The second form tries to evaluate the polynomial at <x>.
##
NormalBaseNumberField := function( arg )
    local F, alpha, poly, En, normal, i, val, stabilizer;
    
    if Length(arg) < 1 or Length(arg) > 2 or not IsNumberField(arg[1]) then
      Error( "usage: NormalBaseNumberField(<F>,[<x>]) for number field <F>" );
    fi;
    F:= arg[1];
    
    if IsBound( F.stabilizer ) then
      stabilizer:= F.stabilizer;
    else
      stabilizer:= Filtered( PrimeResidues( NofCyc( F.generators ) ),
                             x -> ForAll(F.generators,y->GaloisCyc(y,x)=y) );
    fi;
    
    # get a primitive element 'alpha'
    if Length( F.generators ) = 1 then
      alpha:= F.generators[1];
    else
      En:= E( NofCyc( F.generators ) );
      alpha:= Sum( stabilizer, x -> GaloisCyc( En, x ) );
    fi;
    
    # the polynomial
    # $\prod_{\sigma\in 'Gal( alpha )'\setminus \{1\} } (x-\sigma('alpha') )
    # for the primitive element 'alpha'
    poly:= [ 1 ];
    for i in Difference( F.operations.Conjugates( F, alpha ), [ alpha ] ) do
      poly:= ProductPol( poly, [ -i, 1 ] );
    od;
    
    # the denominator\: eval 'poly' at 'a'
    val:= 1 / ValuePol( poly, alpha );
    
    # there are only finitely many values 'x' in 'F.field' for which
    # 'poly(x) \* val' is not an element of a normal base.
    if Length( arg ) = 2 then
      i:= arg[2];
      if not i in F.field then
        Error( "<x> must be an element of <F>.field" );
      fi;
    else
      i:= 1;
    fi;
 
    repeat
      normal:= F.operations.Conjugates( F, ValuePol( poly, i ) * val );
      i:= i + 1;
    until RankMat( List( normal, COEFFSCYC ) ) = F.dimension;
    
    return normal;
    end;


#############################################################################
##
#F  ZumbroichBase( <n>, <m> )
##
##  returns the set of exponents 'e' for which 'E(n)^e' belongs to the
##  (generalized) Zumbroich base of the cyclotomic field $Q_n$,
##  viewed as vector space over $Q_m$.
##
##  *Note* that for $n \equiv 2 \bmod 4$ we have
##  'ZumbroichBase( <n>, 1 ) = 2 * ZumbroichBase( <n>/2, 1 )' but
##  'List( ZumbroichBase(  <n>, 1  ), x -> E(  <n>  )^x ) =
##   List( ZumbroichBase( <n>/2, 1 ), x -> E( <n>/2 )^x )'.
##
ZumbroichBase := function( n, m )
    local nn, base, basefactor, factsn, exponsn, factsm, exponsm, primes,
          p, pos, i, k;
    
    if not n mod m = 0 then
      Error( "<m> must be a divisor of <n>" );
    fi;
    
    factsn:= FactorsInt( n );
    primes:= Set( factsn );
    exponsn:= List( primes, x -> 0 );   # Product(List( [1..Length(primes)],
                                        #         x->primes[i]^exponsn[i]))=n
    p:= factsn[1];
    pos:= 1;
    for i in factsn do
      if i > p then
        p:= i;
        pos:= pos + 1;
      fi;
      exponsn[ pos ]:= exponsn[ pos ] + 1;
    od;
    
    factsm:= FactorsInt( m );
    exponsm:= List( primes, x -> 0 );    # Product(List( [1..Length(primes)],
                                         #         x->primes[i]^exponsm[i]))=m
    if m <> 1 then
      p:= factsm[1];
      pos:= Position( primes, p );
      for i in factsm do
        if i > p then
          p:= i;
          pos:= Position( primes, p );
        fi;
        exponsm[ pos ]:= exponsm[ pos ] + 1;
      od; 
    fi;
    
    base:= [ 0 ];
    if n = 1 then return base; fi;
      
    if primes[1] = 2 then             # special case: $J_{k,2} = \{ 0, 1 \}$
    
      if exponsm[1] = 0 then exponsm[1]:= 1; fi;    # $J_{0,2} = \{ 0 \}$
    
      nn:= n / 2^( exponsm[1] + 1 );
    
      for k in [ exponsm[1] .. exponsn[1] - 1 ] do
        Append( base, base + nn );
        nn:= nn / 2;
      od;
      pos:= 2;
    else
      pos:= 1;
    fi;
    
    for i in [ pos .. Length( primes ) ] do
    
      if m mod primes[i] <> 0 then
        basefactor:= [ 1 .. primes[i] - 1 ] * ( n / primes[i] );
        base:= Concatenation( List( base, x -> x + basefactor ) );
        exponsm[i]:= 1;
      fi;
    
      basefactor:= [ - ( primes[i] - 1 ) / 2 .. ( primes[i] - 1 ) / 2 ]
                     * n / primes[i]^exponsm[i];
    
      for k in [ exponsm[i] .. exponsn[i] - 1 ] do
        basefactor:= basefactor / primes[i];
        base:= Concatenation( List( base, x -> x + basefactor ) );
      od;
    od;
    return Set( List( base, x -> x mod n ) );
    end;


#############################################################################
##
#F  LenstraBase(<N>,<stabilizer>,<super>) .   integral base of a number field
##
##  returns a list of lists of integers; each list indexing the exponents of
##  an orbit of a subgroup of <stabilizer> on <N>-th roots of unity.
##
##  *Note* that the elements are in general not sets, since the first element
##  is always an element of 'ZumbroichBase(<N>,1)'; this is used by 'NF' and
##  'Coefficients'.
##
##  <super> is a list representing a supergroup of <stabilizer> which
##  shall act consistently with the action of <stabilizer>, i.e. each orbit
##  of <supergroup> is a union of orbits of <stabilizer>.
##
##  ( Shall there be a test if this is possible ? )
##
##  *Note* that <stabilizer> must not contain the stabilizer of a proper
##  cyclotomic subfield of the <N>-th cyclotomic field.
##
LenstraBase := function( N, stabilizer, supergroup )
    local i, k, primes, NN, zumb, orbits, pnt, orb, d, N2, No, ppnt, ord, a,
          neworbits, rep, super, H1;
    
    primes:= Set( FactorsInt( N ) );
    NN:= Product( primes );                # squarefree part of 'N'
    zumb:= ZumbroichBase( N, 1 );          # exps of roots in base of 'CF(N)'
    stabilizer:= Set( stabilizer );
    
    if N = NN then
    
      # 'N' is squarefree, we have the normal base, 'stabilizer' acts on
      # 'zumb'; do not consider equivalence classes since they are all
      # trivial.  'supergroup' is obsolete since 'zumb' is a normal base.
    
      # *Note* that for even 'N' 'zumb' does not consist of at least 'NN'-th
      # roots!
    
      orbits:= [];
      while zumb <> [] do
        pnt:= zumb[1];
        orb:= List( stabilizer, x -> pnt * x mod N );
        Add( orbits, orb );
        SubtractSet( zumb, orb );
      od;
    
    else
    
      # Let $d(i)$ be the largest squarefree number whose square divides the
      # order of $e_N^i$, that is 'N / gcd(N,i)'.
      # Define an equivalence relation on the set $S$ of at least 'NN'-th
      # roots of unity\:
      # $i$ and $j$ are equivalent iff 'N' divides $( i - j ) d(i)$.  The
      # equivalence class $(i)$ of $i$ is $\{ i+kN/d(i) ; 0\leq k\< d(i)\}$.
    
      # For the case that 'NN' is even, replace those roots in $S$ with order
      # not divisible by 4 by their negatives. (Equivalently\: Replace *all*
      # elements in $S$ by their negatives.)
    
      # If 8 does not divide 'N' and $'N' \not= 4$, 'zumb' is a subset of $S$,
      # the intersection of $(i)$ with 'zumb' is of order $\varphi( d(i) )$,
      # it is a basis for the $Z$--submodule spanned by $(i)$.
      # Furthermore, the minimality of 'N' yields that 'stabilizer' acts fixed
      # point freely on the set of equivalence classes.
    
      # More exactly, fixed points occur exactly if there is an element 's' in
      # 'stabilizer' which is congruent $-1$ modulo 'N2' and congruent $+1$
      # modulo 'No'.
    
      # The base is constructed as follows\:
      #
      # Until all classes are touched:
      # 1. Take a point 'pnt' (in 'zumb').
      # 2. Choose a maximal linear independent set 'pnts' in the equivalence
      #    class of 'pnt' (the intersection of the class with 'zumb').
      # 3. Take the 'stabilizer'--orbits of 'pnts' as base elements;
      #    remove the touched equivalence classes.
      # 4. For the representatives 'rep' in 'supergroup'\:
      #    If 'rep' maps 'pnt' to an equivalence class that was not yet
      #    touched, take the 'stabilizer'--orbits of the images of 'pnts'
      #    under 'rep' as base elements;
      #    remove the touched equivalence classes.
    
      # Compute nontriv. representatives of 'supergroup' over 'stabilizer'
      super:= Difference( supergroup, stabilizer );
      supergroup:= [];
      while super <> [] do
        pnt:= super[1];
        Add( supergroup, pnt );
        SubtractSet( super, List( stabilizer, x -> ( x * pnt ) mod N ) );
      od;
    
      N2:= 1; No:= N;
      while No mod 2 = 0 do
        N2:= 2 * N2; No:= No / 2;
      od;
    
      H1:= [];    # will be the subgroup of 'stabilizer' that acts fixed point
                  # freely on the set of equivalence classes
    
      a:= 0;
      for k in stabilizer do
        if k mod 4 = 1 then
          Add( H1, k );
        elif ( k -1 ) mod No = 0
             and ( ( k + 1 ) mod N2 = 0 or ( k + 1 - N2/2 ) mod N2 = 0 ) then
          a:= k;
        fi;
      od;
      if a = 0 then H1:= stabilizer; fi;
    
      orbits:= [];
    
      while zumb <> [] do
        neworbits:= [];
        pnt:= zumb[1];
        d:= 1;
        ord:= N / GcdInt( N, pnt );
        for i in primes do
          if ord mod i^2 = 0 then d:= d * i; fi;
        od;
    
        if ( a = 0 ) or ( ord mod 8 = 0 ) then
    
          # the orbit of 'H1' cannot be a fixed point of 'a'
          for k in [ 0 .. d-1 ] do
            ppnt:= pnt + k * N/d;
            if ppnt in zumb then
              orb:= List( stabilizer, x -> ( ppnt * x ) mod N );
              Add( neworbits, orb );
            fi;
          od;
    
        elif ord mod 4 = 0 then
    
          # 'a' maps each point in the orbit of 'H1' to its inverse
          # (ignore all points)
          orb:= List( stabilizer, x -> ( pnt * x ) mod N );
    
        else
    
          # the orbit of 'H1' is pointwise fixed by 'a'
          for k in [ 0 .. d-1 ] do
            ppnt:= pnt + k * N/d;
            if ppnt in zumb then
              orb:= List( H1, x -> ( ppnt * x ) mod N );
              Add( neworbits, orb );
            fi;
          od;
    
        fi;
    
        for pnt in orb do        # take any of the latest orbits
    
          # remove the equivalence class of 'pnt'
          SubtractSet( zumb, List( [ 0 .. d-1 ], k -> ( pnt+k*N/d ) mod N ) );
        od;
    
        Append( orbits, neworbits );
    
        # use 'supergroup'\:
        # Is there a point in 'zumb' that is not equivalent to
        # '( pnt * rep ) mod N' ?
        # (Note that the factor group 'supergroup / stabilizer' acts on the
        # set of unions of orbits with equivalent elements.)
    
        for rep in supergroup do
    
          # is there an 'x' in 'zumb' that is equivalent to 'pnt * rep' ?
          if ForAny( zumb, x -> ( ( x - pnt * rep ) * d ) mod N = 0 ) then
            Append( orbits, List( neworbits, x->List(x,y->(y*rep) mod N) ) );
            for ppnt in orbits[ Length( orbits ) ] do
              SubtractSet( zumb, List( [ 0..d-1 ], k->(ppnt+k*N/d) mod N ) );
            od;
          fi;
        od;
    
      od;
    fi;
    
    return orbits;
    end;


#############################################################################
##
#F  NumberFieldOps.Coefficents( <F>, <z> ) . . coefficients of an alg. number
##
##  returns the coefficient vector of the cyclotomic <cyc> relative to
##  '<F>.base' for a number field <F>.
##
##  We have 'Coefficients( <F>, <z> ) * <F>.base = <z>'.
##
NumberFieldOps.Coefficients := function ( F, z )
    local coeffs;
    
    if not z in F then
      return false;
    fi;

    if IsBound( F.base ) then
   
      if IsBound( F.coeffslist ) then 

        # The information about the Lenstra base coefficients is stored
        # in 'F.coeffslist'.
        coeffs:= Sublist( CoeffsCyc( z, NofCyc( F.generators ) ),
                          F.coeffslist );

        if IsBound( F.coeffsmat ) then

          # basechange from Lenstra base to another one
          coeffs:= coeffs * F.coeffsmat;
        fi;

      else

        Error( "no <F>.coeffslist" );

      fi;
    
      # change to the base given by 'F.base', if necessary\:
      if IsBound( F.basechangemat ) then
        coeffs:= coeffs * F.basechangemat;
      fi;
    
    else
    
      Error( "no base stored, no 'Coefficients' function for that field" );
    
    fi;
    
    return coeffs;
    end;


#############################################################################
##
#F  NumberField( <gens> ) . . . . . . . . . . .  create a number field record
#F  NumberField( <n>, <stab> )
#F  NumberField( <subfield>, <poly> )
#F  NumberField( <subfield>, <base> )
##
##  number field generated by the elements of the list <gens>,
##
##  fixed field of the group generated by <stab> (prime residues modulo <n>)
##  in the cyclotomic field 'CF( <n> )',
##
NF := function ( arg )
    local i, j, k, F, subfield, xtension, d, gens, N, stabilizer, gen, base,
          lenst, lenstset, zumb, newlenst, image, a, H1, No, N2, NN, aut,
          pos, p, coeffslist, root, m, C, val, F_base, l;
    
    if Length( arg ) = 1 then                  # NumberField( gens )
      gens:= arg[1];
      N:= NofCyc( gens );                      # envelopping cyclotomic field
      if N = 1 then
        return Rationals;
      elif N = 4 then
#T why 'ShallowCopy'?
        return ShallowCopy( GaussianRationals );
      fi;
    
      stabilizer:= PrimeResidues( N );
      for gen in gens do
        stabilizer:= Filtered( stabilizer, x -> GaloisCyc( gen, x ) = gen );
      od;
    
      F:= NF( N, stabilizer );
      F.generators:= gens;
    
      return F;
    
    elif Length( arg ) = 2 then
    
      # NF( N, stabilizer )   or
      # NF( subfield, base )  or
      # NF( subfield, poly )
    
      if IsInt( arg[1] ) and arg[1] <> 0 and IsList( arg[2] ) then
    
        # NF( N, stabilizer )
    
        N:= arg[1];
        if N mod 2 = 0 and ( N / 2 ) mod 2 <> 0 then
          N:= N / 2;
        fi;
        stabilizer:= ShallowCopy( arg[2] );
    
        # Compute the elements of the group generated by 'stabilizer'.
        for d in stabilizer do
          image:= List( stabilizer, x -> ( x * d ) mod N );
          image:= Filtered( image, x -> not x in stabilizer );
          Append( stabilizer, image );
        od;

        if N <= 2 then return Rationals; fi;
    
        d:= Phi(N) / Length( stabilizer );
    
        # reduce the pair '( N, stabilizer )' such that afterwards 'N'
        # describes the envelopping cyclotomic field of the required field;
    
        gens:= GeneratorsPrimeResidues( N );
        NN:= 1;
        if gens.primes[1] = 2 then
    
          if gens.exponents[1] < 3 then
            if not gens.generators[1] in stabilizer then
              NN:= NN * 4;
            fi;
    
          else
    
            # the only case where 'gens.generators[i]' is a list;
            # it contains the generators corresponding to '**' and '*5';
            # the first one is irrelevant for the envelopping cyclotomic
            # field, except if also the other generator is contained.
            if gens.generators[1][2] in stabilizer then
              if not gens.generators[1][1] in stabilizer then
                NN:= NN * 4;
              fi;
            else
              NN:= NN * 4;
              aut:= gens.generators[1][2];
              while not aut in stabilizer do
                aut:= ( aut ^ 2 ) mod N;
                NN:= NN * 2;
              od;
    
            fi;
          fi;
          pos:= 2;
        else
          pos:= 1;
        fi;
    
        for i in [ pos .. Length( gens.primes ) ] do
          p:= gens.primes[i];
          if not gens.generators[i] in stabilizer then
            NN:= NN * p;
            aut:= ( gens.generators[i] ^ ( p - 1 ) ) mod N;
            while not aut in stabilizer do
              aut:= ( aut ^ p ) mod N;
              NN:= NN * p;
            od;
          fi;
        od;
    
        N:= NN;
    
        if N <= 2 then return Rationals; fi;
    
        stabilizer:= Set( List( stabilizer, x -> x mod N ) );
    
        if stabilizer = [ 1 ] then return CF( N ); fi;
    
        # compute the standard Lenstra base and 'F.coeffslist'\:
        # If 'stabilizer' acts fixed point freely on the equivalence classes
        # we must change from the Zumbroich base to a 'stabilizer'--normal
        # base and afterwards choose coefficients with respect to that base.
        # In the case of fixed points, only the subgroup 'H1' of index 2 in
        # stabilizer acts fixed point freely; we change to a 'H1'--normal
        # base and afterwards choose coefficients.
    
        N2:= 1; No:= N;
        while No mod 2 = 0 do
          N2:= 2 * N2; No:= No / 2;
        od;
    
        H1:= [];    # will be the subgroup of 'stabilizer' that acts fixed
                    # point freely on the set of equivalence classes
    
        a:= 0;
        for k in stabilizer do
          if k mod 4 = 1 then
            Add( H1, k );
          elif ( k -1 ) mod No = 0
               and ( ( k+1 ) mod N2 = 0 or ( k+1-N2/2 ) mod N2 = 0 ) then
            a:= k;
          fi;
        od;
        if a = 0 then H1:= stabilizer; fi;
    
        zumb := ZumbroichBase( N, 1 );
        lenst:= LenstraBase( N, H1, stabilizer );
        
        # We want 'Sublist(CoeffsCyc(z,N),F.coeffslist) = Coefficients(F,z)'
        # ( and   'Coefficients( F, z ) * F.base = z' )
        # with respect to the standard Lenstra base.
    
        if H1 <> stabilizer then
    
          # let 'a' act on 'lenst' to get the right base
          newlenst:= [];
          lenstset:= List( lenst, Set );
          for i in [ 1 .. Length( lenst ) ] do
            if ( lenst[i][1] * ( a - 1 ) ) mod N = 0 then
    
              # pointwise fixed
              Add( newlenst, lenst[i] );
    
            elif ( lenst[i][1] * ( a - 1 ) - N/2 ) mod N <> 0 then
    
              # 'a' joins two 'H1'--orbits
              image:= Set( List( lenst[i], x -> ( x * a ) mod N ) );
    
              # *Note* that the elements of 'image' need not be in an element
              # of 'lenst', only a member of the equivalence class must be
              # contained;
              if Position( lenstset, image ) >= i then
                Add( newlenst, Concatenation( lenst[i], image ) );
              fi;
            fi;
          od;
    
          lenst:= newlenst;
    
        fi;
    
        coeffslist:= List( lenst, x -> x[1] + 1 );
        base:=       List( lenst, x -> Sum( List( x, y -> E(N)^y ) ) );
    
        return rec( isDomain                := true,
                    isField                 := true,
    
                    char                    := 0,
                    degree                  := d,
                    generators              := base,
    
                    zero                    := 0,
                    one                     := 1,
    
                    size                    := "infinity",
                    isFinite                := false,
    
                    stabilizer              := stabilizer,
                    field                   := 0,
                    dimension               := d,
                    base                    := base,
                    isIntegralBase          := true,
                    coeffslist              := coeffslist,
    
                    operations              := NumberFieldOps );
    
      elif IsVector( arg[2] ) then
    
        subfield:= arg[1];
        xtension:= arg[2];
    
        if ( subfield = 0 and ForAll( xtension, IsRat ) ) or
           ( IsNumberField( subfield ) and ForAll( xtension,
                                                   x -> x in subfield ) ) then
    
          # NF( subfield, poly )
    
          if Length( xtension ) > 3 then
            Error("NF(<subfield>,<poly>) for polynomial of degree at most 2");
          fi;
          if Length( xtension ) = 2 then   # linear polynomial

            if subfield = 0 then
              return Rationals;
            else
              return NF( subfield.generators );
            fi;

          else
            
            # The roots of 'a*x^2 + b*x + c' are
            # $\frac{ -b \pm \sqrt{ b^2 - 4ac } }{2a}$.
    
            root:= ( ER( xtension[2]^2 - 4*xtension[1]*xtension[3] )
                           -xtension[2] ) / 2*xtension[3];
    
            if subfield = 0 then
              return NF( [ root ] );
            elif root in subfield then
              return NF( subfield, subfield.base );
            else
              return NF( subfield, [ 1, root ] );
            fi;

          fi;

        else
    
          # 'NF( 0, base )' or 'NF( subfield, base )'
          # where 'base' at least contains a vector space base
          if subfield = 0 or subfield = Rationals then
            F:= NF( xtension );
          else
            F:= NF( Union( subfield.generators, xtension ) );
            if IsCyclotomicField( F ) then
              return CF( subfield, xtension );
            fi;
   
            # general case\:\ extension of number field; do not
            #                 ask if <subfield> is a cyclotomic field 

            # Let $(v_1, \ldots, v_m)$ denote 'subfield.base' and
            #     $(w_1, \ldots, w_k)$ denote 'F.base';
            # Define $u_{i+m(j-1)} = v_i w_j$.  Then $(u_l; 1\leq l\leq mk)$
            # is a $Q$--base of 'F'.  First change from the Lenstra base to
            # this base; the matrix is 'C'\:

            F.dimension    := F.degree / subfield.degree;
            F.field        := subfield;
            F_base         := NormalBaseNumberField( F );

            m:= Length( subfield.base );
            k:= Length( F_base );
            N:= NofCyc( F_base );
            C:= [];
            for j in F_base do
              for i in subfield.base do
                Add( C, F.operations.Coefficients( F, i*j ) );
                # (These are the Lenstra base coefficients!)
              od;
            od;
            C:= C^(-1);

            # Let $(c_1, \ldots, c_{mk})$ denote the coefficients with respect
            # to the new base.  To achieve '<coeffs> \* F_base = <z>' we have
            # to take $\sum_{i=1}^m c_{i+m(j-1)} v_i$ as $j$--th coefficient\:

            F.coeffsmat:= [];
            for i in [ 1 .. Length( C ) ] do     # for all rows
              F.coeffsmat[i]:= [];
              for j in [ 1 .. k ] do
                val:= 0;
                for l in [ 1 .. m ] do
                  val:= val + C[i][ m*(j-1)+l ] * subfield.base[l];
                od;
                F.coeffsmat[i][j]:= val;
              od;
            od;

            # Multiplication of a Lenstra base coefficient vector with
            # 'F.coeffsmat' means first changing to the base of products
            # $v_i w_j$ and then summation over the parts of the $v_i$.

            F.base         := F_base;
            F.isNormalBase := true;
            Unbind( F.isIntegralBase );
            Unbind( F.name );

          fi;
    
          # If 'xtension' just contains a base but is no base, do nothing;
          # 'xtension' is a base if and only if the basechange is regular:
          if Length( xtension ) = Length( F.base ) and xtension <> F.base then

            F.basechangemat:= List( xtension,
                                  x -> F.operations.Coefficients(F,x) )^(-1);
            F.base         := Copy( xtension );
            Unbind( F.isNormalBase );
            Unbind( F.name );

          fi;
    
        fi;
    
      else
        Error("usage: NF(<gens>),NF(<N>,<stab>),NF(<S>,<base>),NF(<S>,<poly>)");
      fi;
    
    else
      Error("<subfield> must be zero or a number field");
    fi;
    
    # return the number field record
    return F;
    end;

NumberField := NF;


#############################################################################
##
#V  CyclotomicFieldOps  . . . . . . . operations record for cyclotomic fields
##
CyclotomicFieldOps := OperationsRecord( "CyclotomicFieldOps",
                                        NumberFieldOps );


#############################################################################
##
#F  CyclotomicFieldOps.\in( <z>, <F> ) . . . . . .   test if <z> lies in <F>
##
CyclotomicFieldOps.\in := function ( z, F )
    return IsCyc( z ) and NofCyc( F.generators ) mod NofCyc( z ) = 0; end;


#############################################################################
##
#F  CyclotomicFieldOps.Print( <F> ) . . . . . . . .  print a cyclotomic field
##
CyclotomicFieldOps.Print := function( F )
    if IsBound( F.name ) then
      Print( F.name );
    elif IsBound( F.basechangemat ) then
      Print( "CF( ", F.field, ",", F.base, ")" );
    else
      Print( "CF(", NofCyc( F.generators ), ")" );
      if F.field <> 0 and F.field <> Rationals then
        Print( "/", F.field );
      fi;
    fi;
    end;


#############################################################################
##
#F  CyclotomicFieldOps.Conjugates( <F>, <z> ) . . .  conjugates of <z> in <F>
##
CyclotomicFieldOps.Conjugates := function ( F, z )
    local i, conj;
    if not z in F then Error( "<z> must lie in <F>" ); fi;
    if F.field = 0 or F.field = Rationals then
      conj:= List( PrimeResidues( NofCyc( F.generators ) ),
                   i -> GaloisCyc( z, i ) );
    else
      conj:= [];
      for i in PrimeResidues( NofCyc( F.generators ) ) do
        if ForAll( F.field.generators, x -> GaloisCyc( x, i ) = x ) then
          Add( conj, GaloisCyc( z, i ) );
        fi;
      od;
    fi;
    return conj;
    end;


#############################################################################
##
#F  CyclotomicFieldOps.Norm( <F>, <z> ) . . . . . . . .  norm of a cyclotomic
##
CyclotomicFieldOps.Norm := function ( F, z )
    local i, result;
    result:= 1;
    if F.field = 0 or F.field = Rationals then
      for i in PrimeResidues( NofCyc( F.generators ) ) do
        result:= result * GaloisCyc( z, i );
      od;
    else
      for i in PrimeResidues( NofCyc( F.generators ) ) do
        if ForAll( F.field.generators, x -> GaloisCyc( x, i ) = x ) then
          result:= result * GaloisCyc( z, i );
        fi;
      od;
    fi;
    return result;
    end;


#############################################################################
##
#F  CyclotomicFieldOps.Trace( <F>, <z> )  . . . . . . . trace of a cyclotomic
##
CyclotomicFieldOps.Trace := function ( F, z )
    local i, result;
    result:= 0;
    if F.field = 0 or F.field = Rationals then
      for i in PrimeResidues( NofCyc( F.generators ) ) do
        result:= result + GaloisCyc( z, i );
      od;
    else
      for i in PrimeResidues( NofCyc( F.generators ) ) do
        if ForAll( F.field.generators, x -> GaloisCyc( x, i ) = x ) then
          result:= result + GaloisCyc( z, i );
        fi;
      od;
    fi;
    return result;
    end;


#############################################################################
##
#F  CyclotomicFieldOps.Coefficents( <F>, <z> ) . coefficients of a cyclotomic
##
##  returns the coefficient vector of the cyclotomic <z> relative to
##  '<F>.base' for a proper cyclotomic field <F>.
##
##  We have 'Coefficients( <F>, <z> ) * <F>.base = <z>'.
##
CyclotomicFieldOps.Coefficients := function ( F, z )

    local N, m, j, k, p, NN, coeffs, value, zumb, Em;

    if not z in F then
      return false;
    fi;

    N:= NofCyc( F.generators );

    # get the Zumbroich base representation of <z> in 'N'-th roots
    coeffs:= CoeffsCyc( z, N );

    if F.field = 0 or F.field = Rationals then

      # the Zumbroich base coefficients
      coeffs:= Sublist( coeffs, F.zumbroichbase + 1 );

    elif IsCyclotomicField( F.field ) then

      # direct computation of Zumbroich base coefficients
      # (without usage of 'F.coeffslist' or 'F.basechangemat')
      m:= NofCyc( F.field.generators );
      zumb:= F.field.zumbroichbase;
      NN:= N/m;
      Em:= E(m);
      coeffs:= List( F.zumbroichbase,
                     j->Sum( zumb, k->coeffs[ ((k*NN+j) mod N )+1 ]*Em^k ) );
    else

      # 'F.field' is only a number field.
      # The necessary information is stored in 'F.coeffsmat'.
      coeffs:= Sublist( coeffs, F.zumbroichbase + 1 );

    fi;

    # basechange from Lenstra base to another one
    if IsBound( F.coeffsmat ) then
      coeffs:= coeffs * F.coeffsmat;
    fi;

    # change the base according to the value of <F>.base
    if IsBound( F.basechangemat ) then
      coeffs:= coeffs * F.basechangemat;
    fi;

    return coeffs;
    end;

#############################################################################
##
#F  CyclotomicField( <n> )  . . . . . . . .  create a cyclotomic field record
#F  CyclotomicField( <gens> )
#F  CyclotomicField( <subfield>, <n> )
#F  CyclotomicField( <subfield>, <base> )
##
##  Note: unorthodox generators and base if n is even and n/2 odd
##
CF := function ( arg )
    local i, j, k, l, m, C, F, subfield, xtension, d, zumb, N, val;
    
    # if necessary split the arguments
    if Length( arg ) = 1  then
    
      # CF( N ) or CF( <gens> )
      subfield:= 0;
      xtension:= arg[1];
      if IsVector( xtension ) then xtension:= NofCyc( xtension ); fi;

      if xtension = 1 then
        return Rationals;
      elif xtension = 4 then
        return ShallowCopy( GaussianRationals );
      fi;
    
    elif Length( arg ) = 2  then
      subfield:= arg[1];
      xtension:= arg[2];
    else
      Error("usage: CF( <n> ) or CF( <subfield>, <extension> )");
    fi;
    
    # the 'NofCyc' of the extension is given
    if IsInt( xtension )  then
    
      # the subfield is given by '0' or 'Rationals' denoting the prime field
      if subfield = Rationals or subfield = 0 then
    
        # CF( N ) or CF( 0, N ) or CF( Rationals, N )
        if xtension > 1 then
          d:= Phi( xtension );
        else
          d:= 1;
        fi;

        zumb:= ZumbroichBase( xtension, 1 );
    
        return rec( isDomain                := true,
                    isField                 := true,
                    isCyclotomicField       := true,
    
                    char                    := 0,
                    degree                  := d,
                    generators              := [ E( xtension ) ],
    
                    zero                    := 0,
                    one                     := 1,
    
                    size                    := "infinity",
                    isFinite                := false,
    
                    field                   := 0,
                    dimension               := d,
                    base                    := List( zumb,
                                                     x -> E( xtension )^x ),
                    isIntegralBase          := true,
                    zumbroichbase           := zumb,
                    stabilizer              := [ 1 ],
    
                    operations              := CyclotomicFieldOps );
    
      elif IsNumberField( subfield ) then
    
        # CF( subfield, N )
        if not xtension mod NofCyc( subfield.generators ) = 0 then
          Error( "<subfield> is not contained in CF( <xtension> )" );
        fi;
    
        F:= CF( xtension );
        F.field:= subfield;
        F.dimension:= F.dimension / subfield.dimension;
    
        if IsCyclotomicField( subfield ) then
          zumb:= ZumbroichBase( xtension, NofCyc( subfield.generators ) );
          F.base:= List( zumb, x -> E( xtension )^x );
          F.zumbroichbase:= zumb;
        else
          F.base:= NormalBaseNumberField( F );
          Unbind( F.isIntegralBase );
          F.isNormalBase:= true;
          F.zumbroichbase:= ZumbroichBase( xtension, 1 );
          zumb:= F.zumbroichbase + 1;

          # Let $(v_1, \ldots, v_m)$ denote 'subfield.base' and
          #     $(w_1, \ldots, w_k)$ denote 'F.base';
          # Define $u_{i+m(j-1)} = v_i w_j$.  Then $(u_l; 1\leq l\leq mk)$ is
          # a $Q$--base of 'F'.  First change from the Zumbroich base to
          # this base; the matrix is 'C'\:

          m:= Length( subfield.base );
          k:= Length( F.base );
          C:= [];
          for j in F.base do
            for i in subfield.base do
              Add( C, Sublist( CoeffsCyc( i*j, xtension ), zumb ) );
            od;
          od;
          C:= C^(-1);

          # Let $(c_1, \ldots, c_{mk})$ denote the coefficients with respect
          # to the new base.  To achieve '<coeffs> \* F.base = <z>' we have
          # to take $\sum_{i=1}^m c_{i+m(j-1)} v_i$ as $j$--th coefficient\:

          F.coeffsmat:= [];
          for i in [ 1 .. Length( C ) ] do     # for all rows
            F.coeffsmat[i]:= [];
            for j in [ 1 .. k ] do
              val:= 0;
              for l in [ 1 .. m ] do
                val:= val + C[i][ m*(j-1)+l ] * subfield.base[l];
              od;
              F.coeffsmat[i][j]:= val;
            od;
          od;

        fi;
        return F;
    
      else
        Error("<subfield> must be zero, Rationals or a number field");
      fi;
    
    elif IsVector( xtension ) then
    
      # first create the right field extension, afterwards change the base
    
      if subfield = 0 or subfield = Rationals then
    
        # CF( 0, base )
        F:= CF( NofCyc( xtension ) );
    
      elif IsNumberField( subfield ) then
    
        # CF( F, base )
        F:= CF( subfield, NofCyc( Union( subfield.generators, xtension ) ) );
    
      else
        Error("<subfield> must be zero, Rationals or a number field");
      fi;
    
      # If 'xtension' just contains a base but is no base, do nothing;
      # 'xtension' is a base if and only if the basechange is regular:
      if Length( xtension ) = Length( F.base ) and xtension <> F.base then
        F.basechangemat:= List( xtension,
                              x -> F.operations.Coefficients( F, x ) )^(-1);
        F.base         := Copy( xtension );
        Unbind( F.isNormalBase );
        Unbind( F.name );
      fi;
      if subfield = 0 or subfield = Rationals then
        F.generators   := Copy( xtension );
      else
        F.generators   := Union( subfield.generators, xtension );
      fi;
      return F;
    
    # otherwise we don't know how to handle the parameters
    else
      Error("usage: CF(<n>) or CF(<subfield>,<n>) or CF(<subfield>,<base>)");
    fi;
    end;

CyclotomicField := CF;


#############################################################################
##
#F  NumberRing( gens )  . . . . . . . . . . . integral ring in a number field
#F  CyclotomicRing( gens )  . . . . . . . integral ring in a cyclotomic field
#V  NumberRingOps . . . . . . . . . . . . operations records for number rings
##
NumberRingOps := OperationsRecord( "NumberRingOps", RingOps );

NumberRingOps.\in := function( z, R )
    return IsCycInt( z )
           and NofCyc( R.generators ) mod NofCyc( z ) = 0
           and ForAll( R.stabilizer, x -> GaloisCyc( z, x ) = z );
    end;

NumberRingOps.Quotient := function( R, x, y )
    local q;
    q:= x/y;
    if q in R then return x / y; else return false; fi;
    end;

NumberRingOps.IsUnit := function( R, z ) return 1 / z in R; end;
NumberRingOps.Random := R -> List( R.base, x -> Random(Integers) ) * R.base;

NumberRing := function( gens )
    local F;
    if ForAll( gens, IsCycInt ) then

      if NofCyc( gens ) = 4 then
        return ShallowCopy( GaussianIntegers );
      fi;

      F:= NF( gens );
      return rec( isDomain       := true,
                  isRing         := true,

                  generators     := gens,
                  zero           := 0,
                  one            := 1,

                  size           := "infinity",
                  isFinite       := false,
                  isCommutative  := true,
                  isIntegralRing := true,

                  base           := F.base,
                  stabilizer     := F.stabilizer,
                  rank           := F.dimension,

                  operations     := NumberRingOps  );
    else
      Error( "<gens> must be cyclotomic integers" );
    fi;
    end;

CyclotomicRing := function( gens )
    local F;
    if ForAll( gens, IsCycInt ) then

      if NofCyc( gens ) = 4 then
        return ShallowCopy( GaussianIntegers );
      fi;

      F:= CF( gens );
      return rec( isDomain       := true,
                  isRing         := true,

                  generators     := F.generators,
                  zero           := 0,
                  one            := 1,

                  size           := "infinity",
                  isFinite       := false,
                  isCommutative  := true,
                  isIntegralRing := true,

                  base           := F.base,
                  stabilizer     := F.stabilizer,
                  rank           := F.dimension,

                  operations     := NumberRingOps  );
      else
        Error( "<gens> must be cyclotomic integers" );
      fi;
    end;


#############################################################################
##
#V  Cyclotomics . . . . . . . . . . . . . . . . . . domain of all cyclotomics
#V  CyclotomicsOps  . . . . . . . . . . . . operations record for this domain
##
CyclotomicsOps := OperationsRecord( "CyclotomicsOps", FieldOps );
    CyclotomicsOps.\in          := function( z, F ) return IsCyc( z ); end;
    CyclotomicsOps.Order        := NumberFieldOps.Order;
    CyclotomicsOps.Field        := ( gens -> NumberField( gens ) );
    CyclotomicsOps.DefaultField := ( gens -> CF( NofCyc( gens ) ) );
    CyclotomicsOps.Ring         := ( gens -> NumberRing( gens ) );
    CyclotomicsOps.DefaultRing  := ( gens -> CyclotomicRing( gens ) );

Cyclotomics :=           rec( isDomain  := true,
                              name      := "Cyclotomics",
                              char      := 0,
                              isField   := true,
                              isFinite  := false,
                              size      := "infinity",
                              one       := 1,
                              zero      := 0,
                              field     := Rationals,
                              operations:= CyclotomicsOps );

#############################################################################
##
#F  CyclotomicsOps.MinimalPolynomial( Cyclotomics, <z> )
##
CyclotomicsOps.MinimalPolynomial := function( Cyclotomics, z )
    return Polynomial( Rationals, MinPol( Field( z ), z ) );
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



