#############################################################################
##
#A  polystff.g                  GAP library                  Alexander Hulpke
##
#A  @(#)$Id: polystff.g,v 3.1.1.1 1996/09/23 10:28:35 ahulpke Exp $
##
#Y  Copyright (C)  1994,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains various functions for polynomials and their roots.  It
##  contains  also some functions  used by polynomial  functions, which would
##  fit better, however, in other files.
##
#H  $Log: polystff.g,v $
#H  Revision 3.1.1.1  1996/09/23 10:28:35  ahulpke
#H  Fixed factoring polynomials with linear factors
#H
#H  Revision 3.1  1994/06/03 10:49:44  ahulpke
#H  initial revision under RCS
#H
##


if not IsBound(InfoPoly2)  then InfoPoly2:=Ignore;  fi;
if not IsBound(InfoPoly3)  then InfoPoly3:=Ignore;  fi;

#############################################################################
##
#F  APolyProd(<a>,<b>,<p>)   . . . . . . . . . . polynomial product a*b mod p
##
APolyProd := function(a,b,p)
local ac,bc,i,j,pc,pv;
  pv:=a.valuation+b.valuation;
  #pc:=ProductCoeffs(a.coefficients,b.coefficients);
  ac:=List(a.coefficients,i->i mod p);
  bc:=List(b.coefficients,i->i mod p);
  if Length(ac)>Length(bc) then
    pc:=ac;
    ac:=bc;
    bc:=pc;
  fi; 
  pc:=[];
  for i in ac do
    #pc:=SumCoeffs(pc,i*bc) mod p; 
    for j in [Length(pc)+1..Length(bc)] do
      pc[j]:=0;
    od;
    for j in [1..Length(bc)] do
      pc[j]:=(pc[j]+i*bc[j]) mod p;
    od;
    bc:=ShiftedCoeffs(bc,1); 
  od;
  return Polynomial(a.baseRing,pc,pv);
end;

#############################################################################
##
#F  APolyMod(<a.coefficients>,<b.coefficients>,<p>) . . . . . . a mod b mod p
##
APolyMod := function(z,nc,p)
local zc,k,l,ll,i,d,q,s;
  zc:=Copy(z);
  k:=Length(nc);
  l:=Length(zc);
  while Length(zc)>=Length(nc) do
    #d:=l-Length(nc);
    q:=-zc[l]/nc[k] mod p;
    ll:=l-k;
    for i in [l-k+1..l] do 
      zc[i]:=(zc[i]+q*nc[i-l+k] mod p) mod p;
      if zc[i]<>0 then
        # actual length
        ll:=i;
      fi;
    od;
    zc:=zc{[1..ll]};
    l:=ll;
  od;
  return zc;
end;

#############################################################################
##
#F  BPolyProd(<a>,<b>,<m>,<p>) . . . . . . polynomial product a*b mod m mod p
##
BPolyProd := function(a,b,m,p)
local r,ac,bc,bp,mc,i,j,pc;
  r:=a.baseRing;
  ac:=List(a.coefficients,i->i mod p);
  ac:=ShiftedCoeffs(ac,a.valuation);
  bc:=List(b.coefficients,i->i mod p);
  bc:=ShiftedCoeffs(bc,b.valuation);
  mc:=List(m.coefficients,i->i mod p);
  mc:=ShiftedCoeffs(mc,m.valuation);
  ac:=APolyMod(ac,mc,p);
  bc:=APolyMod(bc,mc,p);
  if Length(ac)>Length(bc) then
    pc:=ac;
    ac:=bc;
    bc:=pc;
  fi; 
  pc:=[];
  for i in ac do
    #pc:=SumCoeffs(pc,i*bc) mod p; 
    for j in [Length(pc)+1..Length(bc)] do
      pc[j]:=0;
    od;
    for j in [1..Length(bc)] do
      pc[j]:=(pc[j]+i*bc[j] mod p) mod p;
    od;
    bc:=APolyMod(ShiftedCoeffs(bc,1),mc,p);
  od;
  return Polynomial(r,pc);
end;

#############################################################################
##
#F  ProductMod(<l>,<m>) . . . . . . . . . . . . . . . . . .  Product(l) mod m
##
ProductMod := function(l,m)
local i,p;
  if l=[] then
    p:=1; 
  else
    p:=l[1]^0;
  fi;
  for i in l do
    p:=p*i mod m;
  od;
  return p;
end;

#############################################################################
##
#F  RootRat: . . . . . . . . . . . . . . like RootInt, but also for rationals
##
RootRat := function(z)
  return RootInt(Numerator(z))/(1+RootInt(Denominator(z)-1));
end;

#############################################################################
##
#F  PseudoRemainder( <f>, <g> ) . . . . . . . lc(g)^(deg(f)-deg(g)+1)*f mod g 
##
PseudoRemainder := function(f,g)
local e,rem,x,z,dr,dg,l,d,n,t;
  rem:=f;
  e:=f.baseRing.one;
  x:=X(f.baseRing);
  z:=0*x^0;
  dr:=Degree(rem);
  dg:=Degree(g);
  if dg>dr then 
    return rem;
  else
    l:=LeadingCoefficient(g)*e;
    g:=g-l*x^dg;
    d:=dr-dg+1;
    n:=0;
    while dg<=dr and rem<>z do
      n:=n+1;
      t:=x^(dr-dg)*g*(LeadingCoefficient(rem)*e);
      if dr=0 then
        rem:=-t;
      else
        rem:=l*(rem-(e*LeadingCoefficient(rem))*x^dr)-t; 
      fi; 
      dr:=Degree(rem);
    od;
  fi;
  return l^(d-n)*rem;
end;

#############################################################################
##
#F  RingElDegZeroPol( <f> ) . . .  return f as baseRing element if applicable
##
RingElDegZeroPol := function(f)
  if IsPolynomial(f) and Degree(f)<1 and f.valuation=0 then
    if f.coefficients=[] then
      f:=f.baseRing.zero;
    else
      f:=f.coefficients[1];
    fi;
  fi;
  return f;
end;

#############################################################################
##
#F  Resultant( <f>, <g> ) . . . . . . . . . . . . . . . resultant of f and g
##
Resultant := function(f,g)
local tw,res,m,n,valf,valg,con,mn,r,j,R,pr,e;

  if (IsPolynomial(f) and f.valuation<0) or
     (IsPolynomial(g) and g.valuation<0) or
     (IsPolynomial(f) and IsPolynomial(g) and
      not (f in g.baseRing.polynomialRing)) then
    Error("usage: Resultant(f,g)");
  fi;

  e:=f.baseRing.one;

  # dont mess with the original polynomials
  f:=Copy(f);
  g:=Copy(g);

  res:=1;

  # fix some special cases: for baseRing elements,  Degree
  #  may not work
  if IsPolynomial(f) then
    m:=Degree(f);
  else
    m:=0;
  fi;
  if IsPolynomial(g) then
    n:=Degree(g);
  else
    n:=0;
  fi;
  
  if n>m then 
    # force f to be of larger degee
    res:=(-1)^(n*m);
    tw:=f; f:=g; g:=tw;
    tw:=m; m:=n; n:=tw;
  fi;
  # trivial cases
  if m=0 then
    return res*1;
  elif n=0 then
    return res*RingElDegZeroPol(g^m);
  fi;

  # handle positive valuations
  valf:=f.valuation;
  valg:=g.valuation;
  if valf>0 then 
    if valg>0 then
      return 0;
    fi;
    Unbind(f.degree);
    f.valuation:=0;
    return res*g.operations.Value(g,g.baseRing.zero)^valf*Resultant(f,g);
  elif valg>0 then
    Unbind(g.degree);
    g.valuation:=0;
    return res*(-1)^(valg*m)*f.operations.Value(f,f.baseRing.zero)^valg*
             Resultant(f,g);
  fi;

  # make everything integer (if possible)
  # this should be improved also for other quotient fields
  #if ForAll(f.coefficients,IsRat) then 
    #con:=ContentPol(f);
    #f:=f/con;
    #res:=res*con^n;
    #con:=ContentPol(g);
    #g:=g/con; 
    #res:=res*con^m;
  #fi; 

  # and now we may start really, subresultant algorithm: S_j+1=g, S_j+2=f

  if m>n then
    j:=m-1;
  else
    res:=-res;
    j:=n;
  fi;
  R:=e;

  repeat
    mn:=j-n;
    pr:=PseudoRemainder(f,g);

    if n>=0 and mn>0 then
      f:=(LeadingCoefficient(g)^(mn)*e*g)/R^(mn);
    else
      f:=g;
    fi;
    
    if n<=0 then
      return res*RingElDegZeroPol(f);
    fi;

    g:=pr/(-R)^(mn+2);
    j:=n-1;
    n:=Degree(g);
    R:=LeadingCoefficient(f)*e;

  until false;
end;

#############################################################################
##
#F  Discriminant( <f> ) . . . . . . . . . . . . discriminant of polynomial f
##
Discriminant := function(f)
local d;
  if not IsBound(f.discriminant) then
    # the discriminant is \prod_i\prod_{j\not= i}(\alpha_i-\alpha_j), but
    # to avoid chaos with symmetric polynomials, we better compute it as
    # the resultant of f and f' 
    d:=Degree(f);
    f.discriminant:=(-1)^(d*(d-1)/2)
                    *Resultant(f,Derivative(f))/LeadingCoefficient(f);
  fi;
  return f.discriminant;
end;

#############################################################################
##
#F  MonicIntegerPolynomial( <f> ) Tschirnhaus-trafo to obtain monic integer f
##
MonicIntegerPolynomial := function(f)
local den,i,g;
  den:=Lcm(List(f.coefficients,Denominator));
  for i in DivisorsInt(den) do
    g:=i^Degree(f)*Value(f,X(f.baseRing)/i);
    if ForAll(g.coefficients,IsInt) then
      g.integerTransformation:=i;
      return g;
    fi;
  od;
end;

#############################################################################
##
#F  ApproxRational:  approximativ k"urzen
##
ApproxRational := function(r,s)
local n,d,u;
  n:=Numerator(r);
  d:=Denominator(r);
  u:=LogInt(d,10)-s+1;
  if u>0 then
    u:=10^u;
    return QuoInt(n,u)/QuoInt(d,u);
  else 
    return r;
  fi;
end;

#############################################################################
##
#F  ApproximateRoot(<num>,<n>[,<digits>]) . . approximate th n-th root of num
##   numerically with a denominator of 'digits' digits.
##
ApproximateRoot := function(arg)
local r,e,f,x,nf,lf,c;
  r:=arg[1];
  e:=arg[2];
  if Length(arg)>2 then
    f:=arg[3];
  else
    f:=10;
  fi; 
  x:=RootInt(Numerator(r),e)/RootInt(Denominator(r),e);
  nf:=r;
  c:=0;
  repeat
    lf:=nf;
    x:=ApproxRational(1/e*((e-1)*x+r/(x^(e-1))),f+6);
    nf:=AbsInt(x^e-r);
    if nf=0 then
      c:=6;
    else
      if nf>lf then
        lf:=nf/lf;
      else
        lf:=lf/nf;
      fi;
      if lf<2 then
        c:=c+1;
      else
        c:=0;
      fi;
    fi;
  # until 3 times no improvement
  until c>2;
  return x;
end;

#############################################################################
##
#F  ApproxRootBound(f) Numerical approximation of RootBound (better, but
##  may fail)
##
ApproxRootBound := function(f)
local pl,x,p,pc,tp,diff,app,d,fail,loop,v,nkon;
  if f.baseRing<>Rationals then
    # avoid complex conjugation etc.
    Error("only yet implemented for rationals");
  fi;
  x:=X(f.baseRing);
  # eliminate valuation
  f:=Polynomial(f.baseRing,f.coefficients);
  # probably first test, whether polynomial should be inverted. However,
  # we expect roots larger than one.
  d:=Degree(f);
  f:=Value(f,1/x)*x^d;
  app:=1/2;
  diff:=1/4;
  nkon:=true;
  repeat
    # pol, whose roots are the 1/app of the roots of f
    tp:=Value(f,x*app);
    tp:=tp.coefficients;
    tp:=tp/tp[1];
    tp:=List(tp,i->ApproxRational(i,10));
    # now check, by using the Lehmer/Schur method, whether tp has a root
    # in the unit circle, i.e. f has a root in the app-circle
    repeat
      fail:=false;
      p:=tp;
      repeat
        d:=Length(p);
        # compute T[p]=\bar a_n p-a_0 p*, everything rational.
        pl:=p;
        p:=p[1]*p-p[d]*Reversed(p);
        p:=List(p,i->ApproxRational(i,10));
        d:=Length(p);
        while d>1 and p[d]=0 do
          Unbind(p[d]);
          d:=d-1;
        od;
        v:=p[1];
        if v=0 then
          fail:=nkon;
        fi;
        nkon:=ForAny(p{[2..Length(p)]},i->i<>0);
      until v<=0;
      if fail then
        # we fail due to rounding errors
        return "fail";
      else
        if v<0 then
          # zero in the unit circle, app smaller
          app:=app-diff;
        else
          # no zero in the unit circle, app larger
          app:=app+diff;
        fi;
      fi;
    until not fail;
    diff:=diff/2;
  # until good circle found, which does not contain roots.
  until v=0 and (1-app/(app+diff))<1/40;

  # revert last enlargement
  app:=app-2*diff;
  return 1/app+1/20;
end;

#############################################################################
##
#F  RootBound( <f> ) . . . . bound for absolute value of (complex) roots of f
##
RootBound := function(f)
local a,b,c,d;
  # valuation gives only 0 as zero, this can be neglected
  if f.valuation>0 then
    f:=Polynomial(f.baseRing,f.coefficients);
  fi;
  # normieren
  f:=f/LeadingCoefficient(f);
  a:=ApproxRootBound(f);
  # did the numerical part fail?
  if IsString(a) then
    b:=f.baseRing;
    # we use, that AbsInt works for also for rationals!
    b:=2*X(b)^Degree(f)-Polynomial(b,List(f.coefficients,AbsInt));
    a:=ApproxRootBound(b);
    if IsString(a) then
      c:=List(f.coefficients,AbsInt);
      d:=Length(c);
      a:=Maximum(1,Sum(c{[1..d-1]}));
      b:=1+Maximum(c);
      if b<a then
        a:=b;
      fi;
      b:=Maximum(List([1..d-1],i->RootInt(d*Int(AbsInt(c[d-i])+1/2),i)+1)); 
      if b<a then
        a:=b;
      fi;
      if ForAll(c,i->i<>0) then
        b:=List([3..d],i->2*AbsInt(c[i-1]/c[i]));
        Add(b,AbsInt(c[1]/c[2]));
        b:=Maximum(b);
        if b<a then
          a:=b;
        fi;
      fi;
      b:=Sum([1..d-1],i->AbsInt(c[i]-c[i+1]))+AbsInt(c[1]);
      if b<a then
        a:=b;
      fi;
      b:=Maximum(List([1..d-1],
                  i->RootInt(Int(AbsInt(c[d-i]/Binomial(d-1,i))+1/2),i)+1))
                     /(ApproximateRoot(2,d-1)-1)+10^(-10);
      if b<a then
        a:=b;
      fi;
    fi;
  fi;
  return a;
end;

#############################################################################
##
#F  BombieriNorm(<pol>) . . . . . . . . . . . . compute weighted Norm [pol]_2
##
BombieriNorm := function(f)
local c,i,n,s;
  c:=ShiftedCoeffs(f.coefficients,f.valuation);
  n:=Degree(f);
  s:=0;
  for i in [0..n] do
    s:=s+AbsInt(c[i+1])^2/Binomial(n,i); 
  od;
  return ApproximateRoot(s,2);
end;

#############################################################################
##
#F  MinimizeBombieriNorm(<pol>) . . . . . . . minimize weighted Norm [pol]_2
##                                            by shifting roots
##
MinimizeBombieriNorm := function(f)
local bn,bnf,a,b,c,d,bb,bf,bd,step,x;
  if not IsBound(f.minimization) then
    # this stepwidth should be corrected
    step:=1/Lcm(List(f.coefficients,Denominator));
    step:=1;
    bb:="infinity";
    bf:=f;
    bd:=0;
    bn:=[];
    # evaluation of norm, including storing it (avoids expensive double evals)
    bnf := function(dis)
    local p,g;
      p:=Filtered(bn,i->i[1]=dis);
      if p=[] then
        g:=Value(f,x+dis);
        p:=[dis,BombieriNorm(g)];
        Add(bn,p);
        if bb>p[2] then
          # note record
          bf:=g;
          bb:=p[2];
          bd:=dis;
        fi;
        return p[2];
      else
        return p[1][2];
      fi;
    end;

    x := X(f.baseRing);
    d:=0;
    repeat
      InfoPoly2("#I Minimizing BombieriNorm, x->x+(",d,")\n");
      # lokale Parabelann"aherung
      a:=bnf(d-step);
      b:=bnf(d);
      c:=bnf(d+step);
      if a<b and c<b then
        if a<c then d:=d-step;
        else d:=d+step;
        fi;
      elif not(a>b and c>b) then
        a:=-(c-a)/2/(a+c-2*b)*step;
        # stets aufrunden (wir wollen weg)
        a:=step*Int(AbsInt(a)/step+1)*SignInt(a);
        if a=0 then
          Error("sollte nicht");
        else
          d:=d+a;
        fi;
      fi;
    until (a>b and c>b) # no better can be reached
          or ForAll([d-1,d,d+1],i->Filtered(bn,j->j[1]=i)<>[]); #or loop
    # best value
    f.minimization:=[bf,bd];
  fi;
  return f.minimization;
end;

#############################################################################
##
#F  BeauzamyBound(<pol>) . . . . . Beauzamy's Bound for Factors Coefficients
##                                 cf. JSC 13 (1992), 463-472
##
BeauzamyBound := function(f)
local n;
  n:=Degree(f);
  return Int(
  # the strange number in the next line is an (upper) rational approximation
  # for 3^{3/4}/2/\sqrt(\pi)
  643038/1000000*ApproximateRoot(3^n,2)/ApproximateRoot(n,2)*BombieriNorm(f))+1;
end;

#############################################################################
##
#F  OneFactorBound(<pol>) . . . . . . . . . . . . Bound for one factor of pol
##
OneFactorBound := function(f)
local d,n;
  n:=Degree(f);
  if n>=3 then
    # Single factor bound of Beauzamy, Trevisan and Wang (1993)
    return Int(10912/10000*(ApproximateRoot(2^n,2)/ApproximateRoot(n^3,8)
           *(ApproximateRoot(BombieriNorm(f),2))))+1;
  else
    # Mignotte's single factor bound
    d:=QuoInt(n,2);
    return Binomial(d,QuoInt(d,2))*(1+RootInt(Sum(f.coefficients,i->i^2),2));
  fi;
end;

#############################################################################
##
#F  HenselBound(<pol>,[<minpol>,<den>]) . . . Bounds for Factor coefficients
##    if the computation takes place over an algebraic extension, then
##    minpol and denominator must be given
##
HenselBound := function(arg)
local pol,n,nalpha,d,dis,rb,bound,a,i,j,k,l,w,bin,lm,lb,bea;

  pol:=arg[1];
  if Length(arg)>1 then
    n:=arg[2];
    d:=arg[3];

    dis:=Discriminant(n);
    nalpha:=RootBound(n); # bound for norm of \alpha.

    if not ForAll(pol.coefficients,IsRat) then
      # now try to bound the roots of f accordingly. As in all estimates by
      # RootBound only the absolute value of the coefficients is used, we will
      # estimate these first, and replace f by the polynomial
      # x^n-b_{n-1}x^(n-1)-...-b_0 whose roots are certainly larger
      a:=[];
      for i in pol.coefficients do
        # bound for coefficients of pol
        if IsRat(i) then
          Add(a,AbsInt(i));
        else
          Add(a,Sum(i.coefficients,AbsInt)*nalpha);
        fi;
      od;
      a:=-a;
      a[Length(a)]:=-a[Length(a)];
      pol:=Polynomial(Rationals,a);
    else
      pol:=Polynomial(Rationals,pol.coefficients);
    fi;
    n:=Degree(n);
  else 
    n:=1;
  fi;

  bound:=[];
  rb:=0;
  #BeauzamyBound
  bea:=BeauzamyBound(pol);
  # compute Landau-Mignotte bound for absolute values of
  # coefficients of any factor
  w:=Sum(pol.coefficients,i->i^2);
  # we want an upper bound of the root, RootInt will give a lower
  # bound. So we compute the root of w-1 (in case w is a perfect square)
  # and add 1. As we nowhere selected a specific galois representative,
  # this bound (which is rational!) will bound all conjugactes as well.
  lm:=(RootInt(Int(w)-1,2)+1);
  lb:=2^QuoInt(Degree(pol),2)*lm;
  for k in [1..Degree(pol)] do

    l:=2^k*lm;
    if l<bea then 
      w:=l;
    else
      w:=bea;
    fi;

    #if lb>10^30 or n>1 then
    if bea>10^200 or n>1 then
      if rb=0 then
        rb:=RootBound(pol);
        a:=rb;
      fi;
      # now try factor deg k
      bin:=1;
      for j in [1..k] do
        bin:=bin*(k-j+1)/j;
        w:=bin*rb^j;
        if w>a then 
          a:=w;
        fi;
      od;

      # select the better bound
      if a<l then
        w:=a;
      else
        w:=l;
      fi;
    fi;

    if n>1 then 
      # algebraic Extension case
      # finally we have to bound (again) the coefficients of \alpha when
      # writing the coefficients of the factor as \sum c_i/d\alpha^i.
      w:=Int(d*w*Factorial(n)/RootRat(AbsInt(dis))*nalpha^(n*(n-1)/2))+1;
    fi;

    bound[k]:=Int(w)+1;
  od;
  return bound;
end;

#############################################################################
##
#F  CoeffAbs(<a>) . maximal coefficient in representation of algebraic elm. a
##
CoeffAbs := function(e)
  if IsRec(e) then
    return Maximum(List(e.coefficients,i->AbsInt(Numerator(i))));
  else
    return AbsInt(Numerator(e));
  fi;
end;

#############################################################################
##
#F  TrialQuotient(<f>,<g>,<b>)  . . . . . . f/g if coeffbounds are given by b
##
TrialQuotient := function(f,g,b)
local  a,m, n, i, k, c, q, R, val;
  if f.baseRing <> g.baseRing  then
      Error( "<f> and <g> must have the same base ring" );
  fi;
  a:=Degree(f)-Degree(g);
  if a=0 then
    # Sonderfall abfangen (es mu"s dann eh 0 rauskommen
    a:=b[1];
  else
    a:=b[a]; 
  fi;
  R:=f.baseRing;
  if 0=Length(f.coefficients) then
    return f;
  fi;
  if f.valuation<g.valuation then
    return false;
  fi;
  val:=f.valuation-g.valuation;
  q:=[];
  n:=Length(g.coefficients);
  m:=Length(f.coefficients)-n;
  f:=ShallowCopy(ShiftedCoeffs(f.coefficients,f.valuation));
  if IsField(R) then
    for i in [0..m] do
      c:=f[(m-i+n)]/g.coefficients[n];
      if CoeffAbs(c)>a then 
        InfoPoly3("#I early break\n");
        return false;
      fi;
      for k in [1..n] do
        f[m-i+k]:=f[m-i+k]-c*g.coefficients[k];
      od;
      q[m-i+1]:=c;
    od;
  else
    for i in [0..m] do
      c:=Quotient(R,f[m-i+n],g.coefficients[n]);
      if c=false then
        return false;
      fi;
      if CoeffAbs(c)>a then 
        InfoPoly3("#I early break\n");
        return false;
      fi;
      for k in [1..n] do
        f[m-i+k]:=f[m-i+k]-c*g.coefficients[k];
        if CoeffAbs(f[m-i+k])>b then
          InfoPoly3("#I early break\n");
          return false;
        fi;
      od;
      q[m-i+1]:=c;
    od;
  fi;
  for i in [1..m+n] do
    if f[i]<>R.zero then
      return false;
    fi;
  od;
  return Polynomial(R,q,val);
end;

#############################################################################
##
#F  Characteristic( <R> ) . . . . . . . . . . . . .  Characteristic of a ring
##
Characteristic := function(r)
  if IsBound(r.char) then
    return r.char;
  elif IsBound(r.operations.Field) then
    return Characteristic(Field(r));
  elif IsBound(r.baseRing) then
    return Characteristic(r.baseRing);
  else
    Error("Don't know, how to compute characteristic");
  fi;
end;

#############################################################################
##
#F  RandomNormedPol( <R>, <ran> ) . random polynomial of degree\in ran over R
##
RandomNormedPol := function(r,deg)
local f;
  f:=r.operations.Random;
  if HANDLE(r)=HANDLE(Integers) then
    f := function(a)
      return RandomList([-2^27..2^27-1]);
      #return RandomList([-100..100]); # was: [-2^27..2^27-1]);
    end;
  fi;
  if not IsField(r) then
    r:=Field(r);
  fi;
  return Polynomial(r,Concatenation(List([1..RandomList(deg)],
                   i->f(r)),[r.one]));
end; 

#############################################################################
##
#F  PolynomialModP( <f>, <prime> ) . . . reduction of rational polynom mod p
##
PolynomialModP := function(f,p)
local k;
  k:=GF(p);
  return k.operations.Polynomial(k,List(f.coefficients,i->(i mod p)*k.one),
                                     f.valuation);
end;

#############################################################################
##
#F  ContentPol( <f> ) . . . . . . . . . . . . . . . . . content of polynomial
##
ContentPol := function(f)
  if f=0*f then 
    return 1;
  else
    return Gcd(List(f.coefficients,Numerator))/
           Lcm(List(f.coefficients,Denominator));
  fi;
end;

#############################################################################
##
#F  ParityPol(<f>) . . . . . . . . . . . . . . . . . . parity of a polynomial
##
ParityPol := function(f)
local d;
  d:=Discriminant(f);
  if f.baseRing=Rationals then
    if d>0 and d=(RootRat(d))^2 then
      return 1;
    else
      return -1;
    fi;

  else
    f:=X(f.baseRing)^2-Discriminant(f);
    d:=2*Length(Factors(f))-3;
  fi;
  return d;
end;


#############################################################################
##
#F  EvalF(<number>) . . . . . .  floating point evaluation of rational number
##
EvalF := function(arg)
local r,f,i,s;
  r:=arg[1];
  if r<0 then
    r:=-r;
    s:=['-'];
  else
    s:=[];
  fi;
  if Length(arg)>1 then 
    f:=arg[2];
  else
    f:=10;
  fi;
  i:=Int(r);
  s:=Concatenation(s,String(i));
  if r<>i then
    Add(s,'.');
    r:=String(Int((r-i)*10^f));
    while Length(r)<f do
      Add(s,'0');
      f:=f-1;
    od;
    s:=ConcatenationString(s,String(r));
  fi;
  return s;
end; 

#############################################################################
##
#F  CheapFactorsInt( <n> ) . . . approximate prime factors of an integer,
##
CheapFactorsInt := function ( n )
    local  sign, factors, p;

    # make $n$ positive and handle trivial cases
    sign := 1;
    if n < 0  then sign := -sign;  n := -n;  fi;
    if n < 4  then return [ sign * n ];  fi;
    factors := [];

    # do trial divisions by the primes less than 1000
    # faster than anything fancier because $n$ mod <small int> is very fast
    for p  in Primes  do
        while n mod p = 0  do Add( factors, p );  n := n / p;  od;
        if n < (p+1)^2 and 1 < n  then Add(factors,n);  n := 1;  fi;
        if n = 1  then factors[1] := sign*factors[1];  return factors;  fi;
    od;

    # do trial divisions by known factors
    for p  in Primes2  do
        while n mod p = 0  do Add( factors, p );  n := n / p;  od;
        if n = 1  then factors[1] := sign*factors[1];  return factors;  fi;
    od;

    # handle perfect powers
    p := SmallestRootInt( n );
    if p < n  then
        while 1 < n  do
            Append( factors, FactorsInt(p) );
            n := n / p;
        od;
        Sort( factors );
        factors[1] := sign * factors[1];
        return factors;
    fi;

    if n<10^9 then
      # let 'FactorsRho' do the work
      factors := Concatenation( factors, FactorsRho( n, 1, 16, 16384 ) );
    else
      Add(factors,n);
    fi;
    Sort( factors );
    factors[1] := sign * factors[1];
    return factors;
end;

#############################################################################
##
#F  Berwick(pol,p) . . . . . . . . . . . . test, whether p|Defect(Q[x]/(pol))
##  Appies the Dedekind-Kriterion by Zassenhaus(1975), cf. Bradford's thesis.
##  Since Berwick's criterion is equivalent and since Dedekind may be
##  reserved for better means, this routine is called 'Berwick'.
##
Berwick := function(f,p)
local g,g1,f0,f1,h;
  g:=Collected(Factors(PolynomialModP(f,p)));
  g1:=List(g,i->Polynomial(Rationals,List(i[1].coefficients,IntFFE),i[1].valuation));
  f0:=Product(g1);
  f1:=Product(List([1..Length(g)],i->g1[i]^(g[i][2]-1)));
  h:=(f-f0*f1)/p;
  g:=Gcd(PolynomialModP(f1,p),PolynomialModP(h,p));
  return Degree(g);
end;
