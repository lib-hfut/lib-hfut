#############################################################################
##
#A  algfld.g                    GAP library                  Alexander Hulpke
##
#A  @(#)$Id: algfld.g,v 3.1.1.3 1995/08/03 09:35:07 ahulpke Rel $
##
#Y  Copyright (C)  1994,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the functions for algebraic extensions of fields.
##
#H  $Log: algfld.g,v $
#H  Revision 3.1.1.3  1995/08/03  09:35:07  ahulpke
#H  changed 'Copy(coeffs)' to 'ShallowCopy(coeffs)'
#H
#H  Revision 3.1.1.2  1995/06/16  15:34:43  ahulpke
#H  fix for multiplication with polynomials (This won't be needed with the new operations concept)
#H
#H  Revision 3.1.1.1  1995/03/29  08:29:54  sam
#H  fix of \* (Error called in case of different domains), due to Alexander
#H  ,
#H
#H  Revision 3.1  1994/06/03  10:49:44  ahulpke
#H  initial revision under RCS
#H
##


#############################################################################
##
##  Some general remarks:
##
##  As AlgebraicExtension should work for any field, one has to be
##  careful with the inheritation of properties. An arrow denotes
##  inheritation in the following diagrams
##
##
##  FieldPolynomialRingOps.AlgebraicExtension
##     = RationalsPolynomialsOps.AlgebraicExtension
##     = FiniteFieldPolynomialRingOps.AlgebraicExtension
##
##
##   FieldOps
##   |
##   \-> AlgebraicExtensionsOps
##       |  = AlgebraicExtensionsOps.AlgebraicExtensionsOps
##       |  = FieldOps.AlgebraicExtensionsOps
##       |
##       +-> RationalsAlgebraicExtensionsOps
##       |      = RationalsOps.AlgebraicExtensionsOps
##       |
##       \-> FiniteFieldAlgebraicExtensionsOps
##              = FiniteFieldOps.AlgebraicExtensionsOps
## 
## 
##   AlgebraicExtensionElmOps
##   |  = FieldOps.AlgebraicExtensionElmOps
##   |
##   +-> RationalsAlgebraicExtensionElmOps
##   |     = RationalsOps.AlgebraicExtensionElmOps
##   |
##   \-> FiniteFieldAlgebraicExtensionElmOps
##         = FiniteFieldOps.AlgebraicExtensionElmOps
## 
## 
##   PolynomialOps
##   |
##   +-> RationalsAlgebraicExtensionsPolynomialOps
##   |
##   \-> FiniteFieldAlgebraicExtensionsPolynomialOps
## 
## 
##   FieldPolynomialRingOps
##   |
##   \-> AlgebraicExtensionsPolynomialRingOps
##       |
##       +-> RationalsAlgebraicExtensionsPolynomialRingOps
##       |
##       \-> FiniteFieldAlgebraicExtensionsPolynomialRingOps
## 


#############################################################################
##
#F  InfoAlg?( ... ) . . . . . . information function for algebraic extensions
##
if not IsBound( InfoAlg1 )  then InfoAlg1 := Ignore;  fi;
if not IsBound( InfoAlg2 )  then InfoAlg2 := Ignore;  fi;
if not IsBound( InfoAlg3 )  then InfoAlg3 := Ignore;  fi;


#############################################################################
##
#F  AlgebraicExtension( <polynomial> ) .  extension to irreducible Polynomial
##
AlgebraicExtension := function(pp)
local R;
  if pp.valuation <>0 or Length(Factors(pp))>1 then
    Error(" minpol must be nontrivial irreducible polynomial");
  fi;
  if  IsBound(pp.algebraicExtension) then
    return pp.algebraicExtension;
  else
    R:=DefaultRing(pp);
    if IsBound(R.operations.AlgebraicExtension) then
      pp.algebraicExtension:=R.operations.AlgebraicExtension(R,pp);
      return pp.algebraicExtension;
    else
      Error("can't compute algebraic Extension");
    fi;
  fi;
end;

FieldPolynomialRingOps.AlgebraicExtension := function( R, pp )
local f,d,e,s,alpha,p;
  f:=pp.baseRing;
  if EuclideanDegree(pp)<2 then 
    return f;
  fi;
  d:=EuclideanDegree(pp);
  # Noch abfangen: f Kreisteilungspolynom; dann eingebaute CF's
  p:=pp/LeadingCoefficient(pp);
  if f.size<"infinity" then
    s:=f.size^d;
  else
    s:=f.size;
  fi;
  e:=rec(
       isDomain:=true,
       isField:=true,
       isAlgebraicExtension:=true,
       isCyclotomicField:=false,
       char:=f.char,
       zero:=f.zero,
       one:=f.one,
       size:=s,
       isFinite:=s<"infinity",
       degree:=d,
       dimension:=d,
       field:=f,
       minpol:=p,
       operations:=f.operations.AlgebraicExtensionsOps
       );
  alpha:=List([1..d],i->f.zero);
  alpha[2]:=f.one;
  alpha:=rec(
           isAlgebraicElement:=true,
           domain:=e,
           coefficients:=alpha,
           operations:=f.operations.AlgebraicExtensionElmOps
           );
  # the field 'root' has already been used for a *primitive* root in the
  # case of finite fields. To avoid confusion, we call our root thus
  # primitiveElm.
  e.primitiveElm:=alpha;
  e.generators:=[alpha];
  e.base:=Concatenation([f.one],List([1..d-1],i->alpha^i));
  pp.algebraicExtension:=e;
  return e;
end;

RationalsPolynomialsOps.AlgebraicExtension:=
   FieldPolynomialRingOps.AlgebraicExtension;
#
FiniteFieldPolynomialRingOps.AlgebraicExtension:=
   FieldPolynomialRingOps.AlgebraicExtension;

#############################################################################
##
#F  QuotRemPolList(f,g) . Quotient and Remainder of polynomials given as list
##
QuotRemPolList := function(f,g)
local q,m,n,i,c,k,z;
  q:=[];
  f:=ShallowCopy(f);
  g:=ShallowCopy(g);
  z:=0*g[1];
  n:=Length(g);
  while n>0 and g[n]=z do
    Unbind(g[n]);
    n:=n-1;
  od;
  n:=Length(g);
  m:=Length(f);
  for i  in [0..(m-n)]  do
    c:=f[m-i]/g[n];
    q[m-n-i+1]:=c;
    for k in [1..n] do
      f[m-i-n+k]:=f[m-i-n+k]-c*g[k];
    od;
  od;
  return [q,f];
end;


#############################################################################
##
#F  NewDenominator( <e> ) Dispatcher f"ur Denominator
##
NewDenominator := function(e)
  if IsRat(e) then
    return Denominator(e);
  else
    return e.operations.Denominator(e);
  fi;
end;


#############################################################################
##
#V  RationalsAlgebraicExtensionsPolynomialOps      polynomials over Q(\alpha)
##
RationalsAlgebraicExtensionsPolynomialOps := ShallowCopy( PolynomialOps );
RationalsAlgebraicExtensionsPolynomialOps.name :=
  "RationalsAlgebraicExtensionsPolynomialOps";


#############################################################################
##
#F  RationalsAlgebraicExtensionsPolynomialOps.\mod   remainder of polynomials
##
RationalsAlgebraicExtensionsPolynomialOps.\mod := function( l, r )
    local   R,  rem,  val,  vdf;

    # <l> is no polynomial: Embed base Ring
    if not (IsRec(l) and IsBound(l.isPolynomial) and l.isPolynomial)  then
        if l in r.baseRing then
          # baseRing element modulo polynomial
          return l;
        else
          Error( "<l> must be a polynomial" );
        fi;
    fi;

    # if <r> is a integer reduce the coefficients of <l>
    if IsInt(r)  then
        rem:=List( l.coefficients, x -> x mod r );
        return Polynomial( l.baseRing, rem, l.valuation );
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

    # multiply two polynomials
    else

        # if one is a Laurent polynomial use 'EuclideanRemainder'
        if l.valuation < 0 or r.valuation < 0  then
            return EuclideanRemainder( DefaultRing(l,r), l, r );
        fi;

        # get a common ring and the value difference
        R  :=l.baseRing;
        vdf:=r.valuation - l.valuation;

        # if <r>.valuation is the minimum shift <l>
        if r.valuation < l.valuation  then
            val:=r.valuation;
            rem:=ShiftedCoeffs( l.coefficients, -vdf );
            #ReduceCoeffs( rem, r.coefficients );
            rem:=RemainderCoeffs( rem, r.coefficients );

        # if <l>.valuation is the minimum shift <r>
        elif l.valuation < r.valuation  then
            r  :=ShiftedCoeffs( r.coefficients, vdf );
            rem:=RemainderCoeffs( l.coefficients, r );
            val:=l.valuation;

        # otherwise they are equal
        else
            rem:=RemainderCoeffs( l.coefficients, r.coefficients );
            val:=l.valuation;
        fi;

        ShrinkCoeffs(rem);

        # return the remainder
        if 0 < Length(rem) and rem[1] <> R.zero  then
            rem:=R.operations.FastPolynomial( R, rem, val );
        else
            rem:=R.operations.Polynomial( R, rem, val );
        fi;
        rem.depth:=1;
        return rem;
    fi;
end;


#############################################################################
##
#F  RationalsAlgebraicExtensionsPolynomialOps.String( <f> )  . pretty string
##
RationalsAlgebraicExtensionsPolynomialOps.String := function( f )
    local   x,  i,  d,  v,  s,  l;

    # find a name for the indeterminate
    x:=Indeterminate(f.baseRing);
    if IsBound(x.name)  then x:=x.name;  else x:="x";  fi;

    # run through the coefficients of <f>
    v:=f.valuation-1;
    l:=Length(f.coefficients);
    for i  in Reversed([ 1 .. l ])  do
        d:=f.coefficients[i];
        if 0 <> d  then
            if i = l and d = 1 and i+v <> 0  then
                s:="";
            elif i = l and d = 1  then
                s:="1";
            elif i = l and d = -1 and i+v <> 0  then
                s:="-";
            elif i = l and d = -1  then
                s:="-1";
            elif i = l  then
                s:=String(d);
            elif d = 1 and i+v <> 0  then
                s:=ConcatenationString( s, "+" );
            elif d = 1  then
                s:=ConcatenationString( s, "+1" );
            elif d = -1 and i+v <> 0  then
                s:=ConcatenationString( s, "-" );
            elif d = -1  then
                s:=ConcatenationString( s, "-1" );
            elif d < 0  then
                s:=ConcatenationString( s, String(d) );
            elif 0 < d  then
                s:=ConcatenationString( s, "+", String(d) );
            else
                Error( "internal error in 'Rat.Alg.Ext.Pol.Ops.String'" );
            fi;
            if i+v < 0 or 1 < i+v then
                s:=ConcatenationString( s, x, "^", String(i+v) );
            elif i+v = 1  then
                s:=ConcatenationString( s, x );
            fi;
        fi;
    od;

    # catch a special case
    if l = 0  then s:="0";  fi;
    return s;

end;

#############################################################################
##
#V  AlgebraicExtensionsPolynomialRingOps . . . . . . . . .  Operations record 
##
AlgebraicExtensionsPolynomialRingOps := ShallowCopy( FieldPolynomialRingOps );
AlgebraicExtensionsPolynomialRingOps.name:=
  "AlgebraicExtensionsPolynomialRingOps";


#############################################################################
##
#F  AlgebraicExtensionsPolynomialRingOps.\= . . . . . . equaltity test
##
AlgebraicExtensionsPolynomialRingOps.\= := function( R, S )
    
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
#F  AlgebraicExtensionsPolynomialRingOps.DefaultRing( <L> ) default ring
##
AlgebraicExtensionsPolynomialRingOps.DefaultRing :=
        PolynomialsOps.DefaultRing;


#############################################################################
##
#F  AlgebraicExtensionsPolynomialRingOps.EuclideanRemainder(<R>,<f>,<g>)
##
AlgebraicExtensionsPolynomialRingOps.EuclideanRemainder :=
  function( R, f, g )
    return f mod g;
end;


#############################################################################
##
#F  AlgebraicExtensionsPolynomialRingOps.QuotientRemainder( <R>, <f>, <g> )
#F      rem and quo
##
AlgebraicExtensionsPolynomialRingOps.QuotientRemainder :=
FieldPolynomialRingOps.QuotientRemainder;

#############################################################################
##
#F  AlgebraicExtensionsPolynomialRingOps.PowerMod( <R>, <g>, <e>, <m> )
#F                                                      power modulo
##
AlgebraicExtensionsPolynomialRingOps.PowerMod :=
FieldPolynomialRingOps.PowerMod;


#############################################################################
##
#V  RationalsAlgebraicExtensionsPolynomialRingOps . . . . . Operations record
##
RationalsAlgebraicExtensionsPolynomialRingOps :=
  ShallowCopy( AlgebraicExtensionsPolynomialRingOps );
RationalsAlgebraicExtensionsPolynomialRingOps.name:=
  "RationalsAlgebraicExtensionsPolynomialRingOps";


#############################################################################
##
#F  RationalsAlgebraicExtensionsPolynomialRingOps.IntegerPolynomial( <R>, <f> )
#F                                              convert <f>
##
RationalsAlgebraicExtensionsPolynomialRingOps.IntegerPolynomial := 
  function( R, f )
    local   lcm,  c;

    # compute lcm of denominator
    lcm:=1;
    for c  in f.coefficients  do
        lcm:=Lcm( lcm, NewDenominator(c) );
    od;

    # remove all denominators
    f:=f * lcm;

    # remove gcd of coefficients
    return f * (1/Gcd(f.coefficients));

end;

#############################################################################
##
#F  RationalsAlgebraicExtensionsPolynomialRingOps.Gcd  . . Gcd of polynomials
##     using the fast Rational methods if possible
##
RationalsAlgebraicExtensionsPolynomialRingOps.Gcd := function(R,a,b)
  if ForAll(a.coefficients,IsRat) and ForAll(b.coefficients,IsRat) then
    # everything is in fact rational
    return EmbeddedPolynomial(a.domain,Gcd(
                  Polynomial(Rationals,a.coefficients,a.valuation),
                  Polynomial(Rationals,b.coefficients,b.valuation)));
  else
    return FieldPolynomialRingOps.Gcd(R,a,b);
  fi;
end;


#############################################################################
##
#V  FiniteFieldAlgebraicExtensionsPolynomialOps      polynomials over F(\alpha)
##
FiniteFieldAlgebraicExtensionsPolynomialOps := ShallowCopy(PolynomialOps);
FiniteFieldAlgebraicExtensionsPolynomialOps.name:=
  "FiniteFieldAlgebraicExtensionsPolynomialOps";


#############################################################################
##
#F  FiniteFieldAlgebraicExtensionsPolynomialOps.\mod remainder of polynomials
##
FiniteFieldAlgebraicExtensionsPolynomialOps.\mod := 
FiniteFieldPolynomialOps.\mod;


#############################################################################
##
#V  FiniteFieldAlgebraicExtensionsPolynomialRingOps . . . . Operations record
##
FiniteFieldAlgebraicExtensionsPolynomialRingOps :=
      ShallowCopy( AlgebraicExtensionsPolynomialRingOps );

## steal the factoring routines from the FF package

FiniteFieldAlgebraicExtensionsPolynomialRingOps.Factors :=
FiniteFieldPolynomialRingOps.Factors;

FiniteFieldAlgebraicExtensionsPolynomialRingOps.FactorsSquarefree :=
FiniteFieldPolynomialRingOps.FactorsSquarefree;

#############################################################################
##
#F  FiniteFieldAlg.Ext.Pol.RingOps.FactorsCommonDegree( <R>, <f>, <d> ) 
##
FiniteFieldAlgebraicExtensionsPolynomialRingOps.FactorsCommonDegree :=
FiniteFieldPolynomialRingOps.FactorsCommonDegree;


#############################################################################
##
#F  IsAlgebraicElement( <e> ) . . .  check, whether e is an algebraic element
##
IsAlgebraicElement := function(e)
  return IsRec(e) and IsBound(e.isAlgebraicElement) and e.isAlgebraicElement;
end;


#############################################################################
##
#V  AlgebraicExtensionElmOps . . . . . . . . . . . . . .  Elements operations
##
## to get correct hereditary order, this record has to be defined here.

AlgebraicExtensionElmOps := rec();
FieldOps.AlgebraicExtensionElmOps := AlgebraicExtensionElmOps;

#############################################################################
##
#V  AlgebraicExtensionsOps . . . . . . . . . . . . . . . .  Operations record
##
AlgebraicExtensionsOps := ShallowCopy(FieldOps);
AlgebraicExtensionsOps.AlgebraicExtensionsOps := AlgebraicExtensionsOps;
FieldOps.AlgebraicExtensionsOps := AlgebraicExtensionsOps;


#############################################################################
##
#F  AlgebraicExtensionsOps.Parent(ext) . . . . . .  hook for future subfields
##
AlgebraicExtensionsOps.Parent := function(ext)
  return ext[1];
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.\in(<ext>,<elm>) . . .  test whether elm is in ext
##
AlgebraicExtensionsOps.\in := function(a,f)
  return a in f.field or (IsAlgebraicElement(a) and a.domain = f);
end;


#############################################################################
##
#F  IsAlgebraicExtension(<obj>)  test whether <obj> is an algebraic extension
##  
IsAlgebraicExtension := function(a)
  return IsRec(a) and IsBound(a.isAlgebraicExtension) and
         a.isAlgebraicExtension;
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.\=(<ext>,<ext>) . . . . . . . . . . equality test
##
AlgebraicExtensionsOps.\= := function(a,b)
  return IsAlgebraicExtension(a) and IsAlgebraicExtension(b) and
         a.field=b.field and a.minpol=b.minpol;
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.Random(<ext>) . . . . . . . . . . Random element
##
AlgebraicExtensionsOps.Random := function(e)
local i;
  return Sum([0..e.degree-1],i->Random(e.field)*e.generators[1]^i);
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.Print(<ext>) . . . . . . . . . . . . Print routine
##
AlgebraicExtensionsOps.Print := function(e)
  if IsBound(e.name) then
    Print(e.name);
  else
    Print("AlgebraicExtension(",e.field,",",e.minpol,")");
  fi;
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.Coefficients(<ext>,<elm>) . coefficients of <elm>
##
## WARNING: Since I'm lazy, this routine will *ONLY* work for the
## provided standard base!
##
AlgebraicExtensionsOps.Coefficients := function(r,e)
  if e in r.field then
    return Concatenation([e],r.zero*[1..r.dimension-1]);
  else
    return e.coefficients;
  fi;
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.Quotient(<ext>,<a>,<b>) . . . . .  a/b if possible
##
AlgebraicExtensionsOps.Quotient := function(r,a,b)
  if b<>r.zero then
    return a/b;
  else
    return false;
  fi;
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.QuotientRemainder(<ext>,<a>,<b>) [a/b,0] if possible
##
AlgebraicExtensionsOps.QuotientRemainder := function(r,a,b)
  if b<>r.zero then
    return [a/b,0];
  else
    return false;
  fi;
end;

#############################################################################
##
#F  MinpolFactors(<F>) . . . . . . . . . . . . . . factors of F.minpol over F
##
MinpolFactors := function(ext)
  return ext.operations.MinpolFactors(ext);
end;


AlgebraicExtensionsOps.MinpolFactors := function(ext)
  if not IsBound(ext.minpolFactors) then
    ext.minpolFactors:=Factors(EmbeddedPolynomial(PolynomialRing(ext),
                               ext.minpol));
  fi;
  return ext.minpolFactors;
end;


#############################################################################
##
#F  IsNormalExtension(<F>,[<G>]) . . . . test, whether <F> over <G> is normal
##
IsNormalExtension := function(arg)
local grf;
  if not IsAlgebraicExtension(arg[1]) then
    return false;
  fi;
  if Length(arg)=1 then
    grf:=arg[1].field;
  else
    grf:=arg[2];
  fi;
  return arg[1].operations.IsNormalExtension(arg[1],grf);
end;


AlgebraicExtensionsOps.IsNormalExtension := function(ext,grf)
local nr;
  if not grf=ext.field then
    Error("multiple algebraic extensions not allowed");
  fi;
  return ForAll(ext.operations.MinpolFactors(ext),i->Degree(i)<=1);
end;


#############################################################################
##
#V  GaloisMappingOps . . . . . . . . . operations record for Galois morphisms
##
GaloisMappingOps := ShallowCopy(FieldHomomorphismOps);


#############################################################################
##
#F  ExtensionAutomorphism(<F>,<img>) automorph. mapping F.primitiveElm to img
##
ExtensionAutomorphism := function(f,rim)
  return rec(
      isGeneralMapping:=true,
      domain:=Mappings,
      isAlgebraicExtensionAutomorphism:=true,
      source:=f,
      range:=f,
      isMapping:=true,
      isHomomorphism:=true,
      isSurjective:=true,
      isInjective:=true,
      isBijection:=true,
      rootImage:=rim,
      operations:=GaloisMappingOps);
end;


#############################################################################
##
#F  GaloisMappingOps.ImagesElm(<hom>,<elm>) . . . . . . .  apply automorphism
##
GaloisMappingOps.ImagesElm := function(hom,elm)
local e,ext;
  ext:=hom.range;
  if elm in ext.field then 
    e:=elm;
  else
    e:=ValuePol(elm.coefficients,hom.rootImage);
  fi;
  return [e];
end;


#############################################################################
##
#F  GaloisMappingOps.\* . . . . . . . . . . . . . . . . . . .  multiplication
##
GaloisMappingOps.\* := function(hom1,hom2)
 if IsList(hom1) then
   return List(hom1,i->i*hom2);
 fi;
 if IsBound(hom1.isAlgebraicExtensionAutomorphism) and
    IsBound(hom2.isAlgebraicExtensionAutomorphism) and
    hom1.range=hom2.source then
      return ExtensionAutomorphism(hom1.source,Image(hom2,hom1.rootImage));
 else
   Error("cannot multiply");
 fi;
end;


#############################################################################
##
#F  GaloisMappingOps.InverseMapping(<hom>) . . . . . . . . . . . . . hom^(-1)
##
GaloisMappingOps.InverseMapping := function(hom)
local ext,r,im,inv;
  ext:=hom.source;
  r:=ext.primitiveElm;
  # since orders are supposedly small, it's faster to compute the
  # inverse directly, instead of inverting a matrix.
  im:=hom.rootImage;
  inv:=r;
  while im<>r do
    inv:=im;
    im:=Image(hom,im);
  od;
  return ExtensionAutomorphism(ext,inv);
end;


#############################################################################
##
#F  GaloisMappingOps.\^ . . . . . . . . . . . . . . . . . . . . . . . . power
##
GaloisMappingOps.\^ := function(hom,exp)
local p;
  if IsInt(exp) then
    if exp<0 then
      hom:=hom.operations.InverseMapping(hom);
    fi;
    if exp=0 then
      p:=ExtensionAutomorphism(hom.source,hom.source.primitiveElm);
    else
      p:=hom;
    fi;
    while exp>1 do
      p:=p*hom;
      exp:=exp-1;
    od;
    return p;
  elif IsAlgebraicElement(hom) then
    return Image(exp,hom);
  else
    return InverseMapping(exp)*hom*exp;
  fi;
end;


#############################################################################
##
#F  GaloisMappingOps.\= . . . . . . . . . . . . . . . . . . . . .  comparison
##
GaloisMappingOps.\= := function(hom1,hom2)
  return IsBound(hom1.isAlgebraicExtensionAutomorphism) and
         IsBound(hom2.isAlgebraicExtensionAutomorphism) and
         hom1.source=hom2.source and
         hom1.rootImage=hom2.rootImage;
end;


#############################################################################
##
#F  GaloisMappingOps.\< . . . . . . . . . . . . . . . . . . . . .  comparison
##
GaloisMappingOps.\< := function(hom1,hom2)
 if IsBound(hom1.isAlgebraicExtensionAutomorphism) and
    IsBound(hom2.isAlgebraicExtensionAutomorphism) then
    return hom1.rootImage<hom2.rootImage;
 else
   Error("cannot compare");
 fi;
end;


#############################################################################
##
#F  GaloisMappingOps.Print . . . . . . . . . . . . . . . . . . . . . .  Print
##
GaloisMappingOps.Print := function(hom)
  Print("ExtensionAutomorphism(",hom.source,",",hom.rootImage,")");
end;


#############################################################################
##
#F  GaloisMappingOps.GaloisGroup . . . . . . . . . . . . . . . . Galois group
##
AlgebraicExtensionsOps.GaloisGroup := function(ext)
local g,id,hom,i,z;
  if not IsBound(ext.galoisGroup) then
    if not IsNormalExtension(ext) then
      Error("not a normal extension");
    fi;
    # all zeroes in extension
    z:=List(ext.operations.MinpolFactors(ext),
            i->-i.coefficients[1]/i.coefficients[2]);
    g:=[];
    for i in z do
      hom:=ExtensionAutomorphism(ext,i);

      if i<>ext.primitiveElm then
        Add(g,hom);
      else
        id:=hom;
      fi;
    od;

    ext.galoisGroup:=Group(g,id);
  fi;
  return ext.galoisGroup;
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.MinPol(<ext>,<elm>) . Minimal Polynomial of <elm>
##
AlgebraicExtensionsOps.MinPol := function(f,e)
local m,pot,r;
  if e in f.field then
    m:=[-e,1];
  elif f<>e.domain then
    Error("<f> must be the default field of <e>");
  else
    m:=[];
    pot:=1;
    repeat
      if Length(m)>0 then
        r:=RankMat(m);
      else
        r:=0;
      fi;
      pot:=pot*e;
      Add(m,f.operations.Coefficients(f,pot));
    until RankMat(m)=r;
    m:=NullspaceMat(m)[1];
  fi;
  m:=m/m[Length(m)];
  return m;
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.CharPol(<ext>,<elm>) . . char. Polynomial of <elm>
##
AlgebraicExtensionsOps.CharPol := function(f,e)
local m;
  m:=Polynomial(f.field,f.operations.MinPol(f,e));
  m:=m^(Degree(f)/Degree(m));
  return ShiftedCoeffs(m.coefficients,m.valuation);
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.Conjugates(<F>,<x>) . . . . . . . . . . conjugates
##
AlgebraicExtensionsOps.Conjugates := function ( F, x )
local l,m,n,i;
  if F<>x.domain then
    Error("<F> must be the default field for <x>");
  else
    m:=Polynomial(F,F.operations.MinPol(F,x));
    n:= List(Filtered(Factors(m),i->Degree(i)=1),
            i->-i.coefficients[1]/i.coefficients[2]); 
    l:=[];
    for i in [1..Degree(F)/(Length(m)-1)] do
      Append(l,n);
    od;
    return l;
  fi;
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.Norm(<F>,<x>) . . . . . . . . . . . . .  norm_f(x)
##
AlgebraicExtensionsOps.Norm := function( F, x )
local m;
  m:=F.operations.CharPol(F,x);
  return m[1]*(-1)^(Length(m)-1); 
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.Trace(<F>,<x>) . . . . . . . . . . . .  trace_f(x)
##
AlgebraicExtensionsOps.Trace := function( F, x )
local m;
  m:=F.operations.CharPol(F,x);
  return -m[Length(m)-1]; 
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.DefaultField(<elms>) . . . . . . . . default field
##
AlgebraicExtensionsOps.DefaultField := function ( elms )
local e;
  e:=List(Filtered(elms,IsAlgebraicElement),i->i.domain);
  if ForAll(e,i->i=e[1]) then
    return e[1];
  else
    # later may add multiple extension
    Error("multiple algebraic extensions not yet allowed");
  fi;
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.Field(<elms>)  . . . . . . field generated by elms
##
AlgebraicExtensionsOps.Field := function(elms)
local d,m;
  if Length(elms)=1 then
    m:=MinPol(elms[1]);
    d:=DefaultField(elms[1]);
    if Degree(d)=Length(m)-1 then
      return d;
    fi;
  fi;
  Error("subfields not yet supported");
end;


#############################################################################
##
#F  AlgebraicExtensionsOps.DefaultRing(<elms>) . . . . . . . . . default ring
##
AlgebraicExtensionsOps.DefaultRing := AlgebraicExtensionsOps.DefaultField;


#############################################################################
##
#V  RationalsAlgebraicExtensionsOps . . . . . . . . . . . . Operations record
##
RationalsAlgebraicExtensionsOps := ShallowCopy(AlgebraicExtensionsOps);
RationalsOps.AlgebraicExtensionsOps := RationalsAlgebraicExtensionsOps;


#############################################################################
##
#F  RationalsAlgebraicExtensionsOps.AsGroup(<F>) view F as multiplicative grp
##
RationalsAlgebraicExtensionsOps.AsGroup := function ( F )
    Error("the multiplicative group of Q(\\alpha) is not finitely generated");
end;


#############################################################################
##
#F  RationalsAlgebraicExtensionsOps.AsAdditiveGroup(<F>) view F as add. group
##
RationalsAlgebraicExtensionsOps.AsAdditiveGroup := function ( F )
    Error("the additive group of Q(\\alpha) is not finitely generated");
end;


#############################################################################
##
#F  RationalsAlgebraicExtensionsOps.PolynomialRing(<R>) full polynomial ring
##
RationalsAlgebraicExtensionsOps.PolynomialRing := function( F )
local P;
  P:=rec(
    isDomain:=true,
    isRing:=true,
    isPolynomialRing:=true,
    isFinite:=false,
    size:="infinity",
    isCommutativeRing:=true,
    isIntegralRing:=true,
    isUniqueFactorizationRing:=true,
    isEuclideanRing:=true,
    baseRing:=F,
    operations:=RationalsAlgebraicExtensionsPolynomialRingOps);
  F.polynomialRing:=P;
  P.one:=Polynomial( F, [ F.one ] );
  P.zero:=Polynomial( F, [  ] );
  return P;
end;


#############################################################################
##
#F  RationalsAlgebraicExtensionsOps.Polynomial( <R>, <coeffs>, <val> )
#F                             polynomial over <R>
##
RationalsAlgebraicExtensionsOps.Polynomial := function( R, coeffs, val )
    local  i,  k,  l,  c;

    coeffs := ShallowCopy(coeffs);
    val := val + NormalizeCoeffs( coeffs );
    if 0 = Length( coeffs )  then
        val := 0;
    fi;

    # return polynomial
    if val < 0  then
        return rec( coefficients:=coeffs,
                    baseRing    :=R,
                    isPolynomial:=true,
                    valuation   :=val,

#N we probably will need special Laurant pols, but I don't care about
#N them now , ahulpke 4-May-93
                    domain      :=LaurentPolynomials,
                    operations  :=RationalsAlgebraicExtensionsPolynomialOps );
    else
        return rec( coefficients:=coeffs,
                    baseRing    :=R,
                    isPolynomial:=true,
                    valuation   :=val,
                    domain      :=PolynomialRing(R),
                    operations  :=RationalsAlgebraicExtensionsPolynomialOps );
    fi;

end;


#############################################################################
##
#F  RationalsAlgebraicExtensionsOps.FastPolynomial( <R>, <coeffs>, <val> )
##
##  This function will *not* copy or check <coeffs>.
##
RationalsAlgebraicExtensionsOps.FastPolynomial := function( R, coeffs, val )

    val := val + NormalizeCoeffs( coeffs );
    if 0 = Length( coeffs )  then
        val := 0;
    fi;

    # return polynomial
    if val < 0  then
        return rec( coefficients:=coeffs,
                    baseRing    :=R,
                    isPolynomial:=true,
                    valuation   :=val,
                    domain      :=LaurentPolynomials,
                    operations  :=RationalsAlgebraicExtensionsPolynomialOps );
    else
        return rec( coefficients:=coeffs,
                    baseRing    :=R,
                    isPolynomial:=true,
                    valuation   :=val,
                    domain      :=R.polynomialRing,
                    operations  :=RationalsAlgebraicExtensionsPolynomialOps );
    fi;

end;


#############################################################################
##
#V  FiniteFieldAlgebraicExtensionsOps . . . . . . . . . . . Operations record
##
FiniteFieldAlgebraicExtensionsOps := ShallowCopy(AlgebraicExtensionsOps);
FiniteFieldOps.AlgebraicExtensionsOps := FiniteFieldAlgebraicExtensionsOps;


#############################################################################
##
#F  FiniteFieldAlgebraicExtensionsOps.PolynomialRing(<R>) full polynomial ring
##
FiniteFieldAlgebraicExtensionsOps.PolynomialRing := function( F )
local P;
  P:=rec(
    isDomain:=true,
    isRing:=true,
    isPolynomialRing:=true,
    isFinite:=false,
    size:="infinity",
    isCommutativeRing:=true,
    isIntegralRing:=true,
    isUniqueFactorizationRing:=true,
    isEuclideanRing:=true,
    baseRing:=F,
    operations:=FiniteFieldAlgebraicExtensionsPolynomialRingOps);
  F.polynomialRing:=P;
  P.one:=Polynomial( F, [ F.one ] );
  P.zero:=Polynomial( F, [  ] );
  return P;
end;


#############################################################################
##
#F FiniteFieldAlgebraicExtensionsOps.Polynomial( <R>, <coeffs>, <val> )
#F                             polynomial over <R>
##
FiniteFieldAlgebraicExtensionsOps.Polynomial := function( R, coeffs, val )
    local  i,  k,  l; 

    coeffs := ShallowCopy(coeffs);
    val := val + NormalizeCoeffs( coeffs );
    if 0 = Length( coeffs )  then
        val := 0;
    fi;

    # return polynomial
    if val < 0  then
        return rec( coefficients:=coeffs,
                    baseRing    :=R,
                    isPolynomial:=true,
                    valuation   :=val,

#N we probably will need special Laurant pols, but I don't care about
#N them now , ahulpke 4-May-93
                    domain      :=LaurentPolynomials,
                    operations  :=FiniteFieldAlgebraicExtensionsPolynomialOps );
    else
        return rec( coefficients:=coeffs,
                    baseRing    :=R,
                    isPolynomial:=true,
                    valuation   :=val,
                    domain      :=PolynomialRing(R),
                    operations  :=FiniteFieldAlgebraicExtensionsPolynomialOps );
    fi;

end;


#############################################################################
##
#F  FiniteFieldAlgebraicExtensionsOps.FastPolynomial( <R>, <coeffs>, <val> )
##
##  This function will *not* copy or check <coeffs>.
##
FiniteFieldAlgebraicExtensionsOps.FastPolynomial := function( R, coeffs, val )

    val := val + NormalizeCoeffs( coeffs );
    if 0 = Length( coeffs )  then
        val := 0;
    fi;

    # return polynomial
    if val < 0  then
        return rec( coefficients:=coeffs,
                    baseRing    :=R,
                    isPolynomial:=true,
                    valuation   :=val,
                    domain      :=LaurentPolynomials,
                    operations  :=FiniteFieldAlgebraicExtensionsPolynomialOps );
    else
        return rec( coefficients:=coeffs,
                    baseRing    :=R,
                    isPolynomial:=true,
                    valuation   :=val,
                    domain      :=R.polynomialRing,
                    operations  :=FiniteFieldAlgebraicExtensionsPolynomialOps );
    fi;

end;

#############################################################################
##
#F  AlgExtElm(<old>,<coeffs>) . . . . . Element in Domain(<oe>) with <coeffs>
##
AlgExtElm := function(oe,c)
  if ForAll(c{[2..Length(c)]},i->i=oe.domain.zero) then
    # in fact in field
    return c[1];
  else 
    #if Length(c)<>oe.domain.dimension then
      #Error("");
    #fi;
    return rec(
        isAlgebraicElement:=true,
        domain:=oe.domain,
        coefficients:=c,
        operations:=oe.operations
      );
  fi;
end;


#############################################################################
##
#F  AlgExtInvElm(<elm>) . . . . . . . . . . . . . . . . . . . . . . . 1/<elm>
##
AlgExtInvElm := function(a)
local i,bf,f,g,t,h,rf,rg,rh;
  bf:=a.domain.field;
  f:=a.coefficients;
  g:=ShallowCopy(a.domain.minpol.coefficients); # valuation (minpol)=0 !!!
  rf:=[bf.one];
  rg:=[];
  while g<>[] do
    t:=QuotRemPolList(f,g);
    h:=g;
    rh:=rg;
    g:=t[2];
    rg:=-ProductCoeffs(t[1],rg);
    for i in [1..Length(rf)] do
      if IsBound(rg[i]) then
        rg[i]:=rg[i]+rf[i];
      else
        rg[i]:=rf[i];
      fi;
    od;
    f:=h;
    rf:=rh;
    t:=Length(g);
    while t>0 and g[t]=bf.zero do
      Unbind(g[t]);
      t:=t-1;
    od;
  od;
  while Length(rf)<a.domain.degree do
    Add(rf,bf.zero);
  od;
  rf:=1/f[Length(f)]*rf;
  return rec(
           isAlgebraicElement:=true,
           coefficients:=rf{[1..Length(a.coefficients)]},
           domain:=a.domain,
           operations:=a.operations
            );  
end;


#############################################################################
##
#F  AlgebraicExtensionElmOps.\<
##
AlgebraicExtensionElmOps.\< := function(a,b)
  # we make algebraic Elements bigger than every field element
  if IsRec(b) and IsBound(b.domain) and IsBound(b.domain.field)
   and (a in b.domain.field) then
    return true;
  # now a must be at least of same level as b, so we can avoid IsBound
  elif b in a.domain.field then
    return false;
  else
    return a.coefficients<b.coefficients;
  fi;
end;


#############################################################################
##
#F  AlgebraicExtensionElmOps.\=
##
AlgebraicExtensionElmOps.\= := function(a,b)
  # base field elements will be represented as such. So we won't
  # need any special check
  return IsAlgebraicElement(a) and IsAlgebraicElement(b)
         and a.coefficients=b.coefficients;
end;


#############################################################################
##
#F  AlgebraicExtensionElmOps.\+
##
AlgebraicExtensionElmOps.\+ := function(a,b)
local c;
  # force b to be the 'higher' alg elm
  if not IsRec(b) or
     (IsRec(a) and IsBound(a.domain) and IsBound(a.domain.field) 
           and b in a.domain.field) then 
    c:=b;
    b:=a;
    a:=c;
  fi;
  if IsBound(b.domain) and IsBound(b.domain.field) and a in b.domain.field 
     or IsInt(a) then
    c:=ShallowCopy(b.coefficients);
    c[1]:=c[1]+a; 
    return rec(
        isAlgebraicElement:=true,
        domain:=b.domain,
        coefficients:=c,
        operations:=b.operations
     );
  elif a.domain<>b.domain then
    return a.operations.\+(a,b);
  else
    return AlgExtElm(b,a.coefficients+b.coefficients);
  fi;
end;


#############################################################################
##
#F  AlgebraicExtensionElmOps.\-
##
AlgebraicExtensionElmOps.\- := function(a,b)
local c;
  # handle if a is 'higher' alg. elm.
  if not IsRec(b) or
     (IsRec(a) and IsBound(a.domain) and IsBound(a.domain.field) 
           and b in a.domain.field) then 
    c:=ShallowCopy(a.coefficients);
    c[1]:=c[1]-b;
    return rec(
        isAlgebraicElement:=true,
        domain:=a.domain,
        coefficients:=c,
        operations:=a.operations
     );
  elif IsBound(b.domain) and IsBound(b.domain.field) and a in b.domain.field 
       or IsInt(a) then
    c:=-b.coefficients;
    c[1]:=c[1]+a; 
    return rec(
        isAlgebraicElement:=true,
        domain:=b.domain,
        coefficients:=c,
        operations:=b.operations
     );
  elif a.domain<>b.domain then
    return a.operations.\-(a,b);
  else
    return AlgExtElm(b,a.coefficients-b.coefficients);
  fi;
end;


#############################################################################
##
#F  AlgebraicExtensionElmOps.\*
##
AlgebraicExtensionElmOps.\* := function(a,b)
local c;
  if IsList(a) then
    return List(a,i->i*b);
  elif IsList(b) then
    return List(b,i->a*i);
  fi;
  # fix for polynomials
  if (IsRec(a) and IsBound(a.domain) and IsBound(a.domain.baseRing) 
           and b in a.domain.baseRing) then
    return a.operations.\*(b,a);
  fi;

  # force b to be the 'higher' alg elm
  if not IsRec(b) or
     (IsRec(a) and IsBound(a.domain) and IsBound(a.domain.field) 
           and b in a.domain.field) then 
    c:=b;
    b:=a;
    a:=c;
  fi;

  if IsBound(b.domain) and IsBound(b.domain.field) and a in b.domain.field 
     or IsInt(a) # to allow basic Integer products with 0 etc.
     then
    return AlgExtElm(b,List(b.coefficients,i->a*i));
  elif a.domain<>b.domain  then
    Error("<a> and <b> lie in no common domain");
    # return a.operations.\*(a,b);
  else
    c:=ProductCoeffs(a.coefficients,b.coefficients);
    if Length(c)>a.domain.degree then
      # reduce mod minpol, note: valuation(minpol)=0
      c:=RemainderCoeffs(c,a.domain.minpol.coefficients);
    fi;
    while Length(c)<a.domain.degree do
      Add(c,a.domain.zero);
    od;
    c:=c{[1..Length(a.coefficients)]};
    return AlgExtElm(b,c);
  fi;
end;


#############################################################################
##
#F  AlgebraicExtensionElmOps.\/
##
AlgebraicExtensionElmOps.\/ := function(a,b)
local c;
  # handle if a is 'higher' alg. elm.
  if not IsRec(b) or
     (IsRec(a) and IsBound(a.domain) and IsBound(a.domain.field) 
           and b in a.domain.field) then 
    c:=List(a.coefficients,i->i/b);
    return rec(
        isAlgebraicElement:=true,
        domain:=a.domain,
        coefficients:=c,
        operations:=a.operations
     );
  fi;
  return a*AlgExtInvElm(b);
end;


#############################################################################
##
#F  AlgebraicExtensionElmOps.\^
##
AlgebraicExtensionElmOps.\^ := function(a,b)
local p;
  if not IsInt(b) then
    Error("cannot compute non integer powers");
  fi;
  p:=a.domain.field.one;
  if b<0 then 
    a:=AlgExtInvElm(a);
    b:=-b;
  fi;
  while b>0 do
    p:=p*a;
    b:=b-1;
  od;
  return p;
end;


#############################################################################
##
#F  AlgebraicExtensionElmOps.Print( <a> )
##
AlgebraicExtensionElmOps.Print := function(a)
local f,i,c;
  f:=false;
  for i in Reversed([1..a.domain.degree]) do
    c:=a.coefficients[i];
    if c<>a.domain.zero then
      if f and not (IsRat(c) and c<0) then
        Print("+");
      fi;
      f:=true;
      if i=1 then
        Print(c);
      else
        if c<>a.domain.one then
          if IsRec(c) then
            Print("(",c,")*");
          else
            Print(c,"*");
          fi;
        fi;

        if IsBound(a.domain.primitiveElm.name) then
          Print(a.domain.primitiveElm.name);
        else
          Print("RootOf(",a.domain.minpol,")");
        fi;

        if i>2 then
          Print("^",i-1);
        fi;
      fi;
    fi;
  od;
end;

#############################################################################
##
#V  RationalsAlgebraicExtensionElmOps . . . . . . . . . . Elements operations
##
RationalsAlgebraicExtensionElmOps := ShallowCopy(AlgebraicExtensionElmOps);
RationalsOps.AlgebraicExtensionElmOps := RationalsAlgebraicExtensionElmOps;

#############################################################################
##
#V  FiniteFieldAlgebraicExtensionElmOps . . . . . . . . . Elements operations
##
FiniteFieldAlgebraicExtensionElmOps := ShallowCopy(AlgebraicExtensionElmOps);
FiniteFieldOps.AlgebraicExtensionElmOps := FiniteFieldAlgebraicExtensionElmOps;


#############################################################################
##
#F  RationalsAlgebraicExtensionElmOps.\mod
##
RationalsAlgebraicExtensionElmOps.\mod := function(a,b)
  if not IsInt(b) then
    Error("algebraic number modulo non-integer is not defined");
  fi;
  return AlgExtElm(a,List(a.coefficients,i->i mod b));
end;


#############################################################################
##
#F  RationalsAlgebraicExtensionElmOps.Denominator
##
RationalsAlgebraicExtensionElmOps.Denominator := function(a)
  return Lcm(List(a.coefficients,NewDenominator));
end;


#############################################################################
##
#F  RootOf(<pol>) . . . . . . . . . . . . . . . . . Root of irreducible <pol>
##
RootOf := function(p)
  if not IsBound(p.algebraicExtension) then
    p.algebraicExtension:=AlgebraicExtension(p);
  fi;
  return p.algebraicExtension.primitiveElm;
end;


#############################################################################
##
#F  DefectApproximation( <K> ) . . . . . . . approximation for defect K, i.e.
##                                      denominators of integer elements in K
##
DefectApproximation := function( ext )
  if not IsBound(ext.defectApproximation) then
    ext.defectApproximation:=ext.operations.DefectApproximation(ext);
  fi;
  InfoAlg1("Defect Approximation: ",ext.defectApproximation,"\n");
  return ext.defectApproximation;
end;

RationalsAlgebraicExtensionsOps.DefectApproximation := function(ext)
local f,d,def,w,i,dr;
  f:=ext.minpol*Lcm(List(ext.minpol.coefficients,Denominator));
  d:=Discriminant(f);
  # largest square, that divides discriminant
  if d>=0 and RootInt(d)^2=d then
    def:=RootInt(d);
  else
    def:=CheapFactorsInt(AbsInt(d));
    w:=[];
    for i in def do
      if not IsPrimeInt(i) then
        i:=RootInt(i);
        Add(w,i);
      fi;
      Add(w,i);
    od;
    def:=Product(Collected(w),i->i[1]^QuoInt(i[2],2));
  fi; 
  # reduced discriminant (c.f. Bradford's thesis)
  dr:=Lcm(Union(List(GcdRepresentation(f,Derivative(f)),
          i->List(i.coefficients,Denominator))));
  def:=Gcd(def,dr);
  for i in Filtered(CheapFactorsInt(def),i->i<65536 and IsPrime(i)) do
    # test, wheteher we can drop i
    if Berwick(f,i)=0 then
      while IsInt(def/i) do
        def:=def/i;
      od;
    fi;
  od;
  return def;
end;


#############################################################################
##
#F  RationalsAlgebraicExtensionsPolynomialRingOps.Factors
##
RationalsAlgebraicExtensionsPolynomialRingOps.Factors := function(K,pol)
local f,q,x,lc,fact,fac2,a,i;

  if IsBound(pol.factors) then
    return pol.factors;
  fi;
  f:=pol;
  fact:=[];

  lc:=LeadingCoefficient(f);
  if lc<>1 then 
    # normieren
    f:=f/lc;
    fact:=[lc];
  else
    fact:=[];
  fi;

  q:=Gcd(f,Derivative(f));

  if q<>q^0 then
    fac2:=Factors(q);
    for i in fac2 do
      a:=Quotient(f,i);
      while a<>false do
        f:=a;
        Add(fact,i);
        a:=Quotient(f,i);
      od;
    od;
  fi;

  # get rid of this #@$%&*! .valuation entry (which forces us to use
  # ShiftedKoeffs otherwise) : split the factor (x). then
  # every factor has trivial valuation

  if EuclideanDegree(f)>1 and Value(f,0)=0 then
    x:=X(K);
    Add(fact,x);
    f:=f/x;
  fi;

  if EuclideanDegree(f)<2 then
    Add(fact,f);
  elif Dimension(K.baseRing)<=4 and Degree(f)*Dimension(K.baseRing)<20 then
    fact:=Concatenation(fact,TragerFact(f));
  else
    fact:=Concatenation(fact,AlgExtSquareHensel(K,f));
  fi;

  pol.factors:=fact;
  return fact;
end;


#############################################################################
##
#F  RationalAlgebraicExtensionsPolynomialRingOps.IsIrreducible
##
RationalsAlgebraicExtensionsPolynomialRingOps.IsIrreducible := function(r,f)
  return Length(r.operations.Factors(r,f))=1;
end;


#############################################################################
##
#F  GaloisType(<F>) . . . . . . . . . . . .  isomorphism type of Galois group
##
GaloisType := function(ext)
  return ext.operations.GaloisType(ext);
end;


RationalsAlgebraicExtensionsOps.GaloisType := function(ext)
local gal;
  if not IsBound(ext.galoisType) then
    gal:=Galois(ext.minpol);
    if IsList(gal) then 
      Error("cannot distinguish ",gal);
    fi;
    ext.galoisType:=gal;  
  fi;
  return ext.galoisType;
end;


#############################################################################
##
#F  RationalsAlgebraicExtensionsOps.IsNormalExtension(<ext>,<grf>)
##
RationalsAlgebraicExtensionsOps.IsNormalExtension := function(ext,grf)
local nr;
  if not grf=ext.field then
    Error("multiple algebraic extensions not allowed");
  fi;
  if Degree(ext)<=15 then
    TransGrpLoad(Degree(ext.minpol));
    return TRANSPROPERTIES[Degree(ext.minpol)]
                          [ext.operations.GaloisType(ext)]
                          [1] = Degree(ext.minpol);
  else
    return AlgebraicExtensionsOps.IsNormalExtension(ext,grf);
  fi;
end;

# yet to do: SplittingField
