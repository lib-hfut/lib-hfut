#############################################################################
##
#A  galois.g                    GAP library                  Alexander Hulpke
##
#A  @(#)$Id: galois.g,v 3.1.1.2 1995/01/28 15:01:41 ahulpke Rel $
##
#Y  Copyright (C)  1994,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the functions for the computation of Galois Groups.
##
#H  $Log: galois.g,v $
#H  Revision 3.1.1.2  1995/01/28  15:01:41  ahulpke
#H  treat nonmonic polynomials properly
#H
#H  Revision 3.1.1.1  1994/08/03  16:50:57  ahulpke
#H  fixed error with noninteger discriminant factorization
#H
#H  Revision 3.1  1994/06/03  10:49:44  ahulpke
#H  initial revision under RCS
#H
##


#############################################################################
##
#V  InfoGalois?(...) . . . . . . . .  information function for Galois package
##
if not IsBound(InfoGalois1) then InfoGalois1:=Ignore; fi;
if not IsBound(InfoGalois2) then InfoGalois2:=Ignore; fi;
if not IsBound(InfoGalois3) then InfoGalois3:=Ignore; fi;

#############################################################################
##
#F  RevSortFun . . . . . . . . . . . . . function to sort in descending order
##
RevSortFun := function(a,b)
  return a>b;
end;

#############################################################################
##
#F  PowersumsElsyms( <pols> ) . elementary symmetric polynomials to powersums
##
PowersumsElsyms := function(e,n)
local n,p,i,s,j;
  e:=Concatenation(e,[1..n-Length(e)]*0);
  p:=[];
  for i in [1..n] do  
    s:=0;
    for j in [1..i-1] do
      s:=s-(-1)^j*e[j]*p[i-j];
    od;
    p[i]:=s-i*(-1)^i*e[i];
  od;
  return p;
end;

#############################################################################
##
#F  ElsymmsPowersums( <powers> ) . powersums to elementary symmetric polynoms
##
ElsymsPowersums := function(p,n)
local e,i,j,s;
  e:=[1]; 
  for i in [1..n] do
    s:=0;
    for j in [1..i] do
      s:=s-(-1)^j*p[j]*e[i-j+1];
    od;
    e[i+1]:=s*1/i;
  od;
  return e{[2..Length(e)]};
end;

#############################################################################
##
#F  SumRootsPol( <f>, <m> ) . . . . . . . . . . . . . . . . .  compute f^{+m}
##
SumRootsPolComp := function(r,p,m,n,nn)
local ch,c,z,i,j,k,h,hi,his,zv,f;
  ch:=Characteristic(r);

  p:=Concatenation([n*r.one],p);
  f:=1;
  for i in [1..nn+1] do
    p[i]:=p[i]/f;
    f:=f*i;
    if ch>0 then
      f:=f mod ch;
    fi;
  od;
  z:=r.zero;
  zv:=p*z;
  h:=[p*z,p];
  h[1][1]:=r.one;
  for i in [2..m] do
    hi:=p*z;
    for j in [1..i] do
      his:=[];
      for k in [1..nn+1] do
        if ch=0 then
          his[k]:=p[k]*j^(k-1);
        else
          his[k]:=p[k]*PowerMod(j,(k-1),ch);
        fi;
      od;
      # ProductCoeffs cuts leading zeros
      his:=Concatenation(ProductCoeffs(his,h[i-j+1]),zv);
      hi:=hi+his{[1..nn+1]}*(-1)^(j+1); 
    od;
    if ch=0 then
      h[i+1]:=hi/i;
    else
      h[i+1]:=hi*(1/i mod ch);
    fi;
  od;
  p:=h[m+1];
  f:=1;
  for i in [1..nn+1] do
    p[i]:=p[i]*f;
    f:=f*i;
    if ch>0 then
      f:=f mod ch;
    fi;
  od; 
  p:=p{[2..nn+1]};
  c:=ElsymsPowersums(p,nn); 
  for i in [1..nn] do
    c[i]:=c[i]*(-1)^i;
  od;
  c:=Reversed(c);
  return c;
end;

SumRootsPol := function(f,m)
local cc,den,ch,n,nn,p,r,i,j,w,pl,b,c,k,mp,degs,newdeg,ndeg,mc,rest;
  if LeadingCoefficient(f)<>1 then
    Error("f must be monic");
  fi;
  InfoGalois3("#I SumRootsPol ",m);
  r:=f.baseRing;
  ch:=Characteristic(r);
  n:=Degree(f);
  nn:=Binomial(n,m);
  c:=ShallowCopy(f.coefficients);
  if ForAll(f.coefficients,IsInt) then
    den:=1;
  else
    # We have nontrivial denominators. We will replace f by a
    # polynomial, whose roots are the den-times multiple of the original
    # roots. Thus coefficients of this new f become integers. This
    # implies, that the sums of the new roots are stretched about the
    # same factor. At the end, we will thus simply revert this
    # procedure.
    den:=Lcm(List(c,Denominator));
    p:=1;
    for i in [1..Length(c)-1] do
      p:=p*den;
      c[Length(c)-i]:=c[Length(c)-i]*p;
    od;
  fi;
  cc:=c;

  c:=Reversed(ShiftedCoeffs(c,f.valuation){[1..n]});
  for i in [1..n] do
    c[i]:=c[i]*(-1)^i;
  od;
  c:=PowersumsElsyms(c,nn);
  if ch=0 and nn>10 then
    # intermediate values might become too big; modular computation
    pl:=[];
    # bound for coefficients:
    # bound for m-Sum of Roots
    w:=Minimum([Maximum(m*den*RootBound(f),1)
                ]);
    # bound for elementary symmetric functions in numbers of absolute
    # value <=w
    b:=0;
    for i in [1..nn] do
      b:=Maximum(w^i*Binomial(nn,i),b);
    od; 

    p:=nn+1;
    mp:=1;
    while mp<2*b do
      p:=NextPrimeInt(p);
      mp:=mp*p;
      Add(pl,p);
    od;
    InfoGalois3(", using modular method with ",Length(pl)," primes");
    b:=mp;

    degs:=[]; #partitions info
    mp:=[];
    for i in pl do
      InfoGalois3("\n#I modulo ",i);
      k:=GF(i);
      mc:=SumRootsPolComp(k,List(c,j->(j mod i)*k.one),m,n,nn);
      Add(mp,List(mc,IntFFE));
      if false and Length(mc)<100 then
        mc:=List(Factors(Polynomial(k,Concatenation(mc,[k.one]))),
                              Degree);
        w:=Combinations(mc);
        newdeg:=List(Set(List(w{[2..Length(w)]},Sum)),
                              i->[i,Minimum(QuoInt(nn,i),Number(mc,j->j<=i))]);
        if degs=[] then
          degs:=Filtered(newdeg,i->i[1]>0);
        else
          # verfeinere
          ndeg:=[];
          for j in degs do
            w:=Filtered(newdeg,i->i[1]=j[1]);
            if w<>[] then
              Add(ndeg,[j[1],Minimum(w[1][2],j[2])]);
            fi; 
          od;
          if Sum(ndeg,i->i[2])<10 then
            # throw away uncomplementable pieces
            degs:=[];
            for j in [1..Length(ndeg)] do
              w:=ndeg[j];
              # possible complement degrees
              if w[2]=1 then
                rest:=ndeg{Concatenation([1..j-1],[j+1..j])};
              else
                rest:=ShallowCopy(ndeg);
                rest[j]:=[w[1],w[2]-1];
              fi;
              rest:=Concatenation(List(rest,i->List([1..i[2]],j->i[1])));
              if (nn=w[1]) or (nn-w[1] in List(Combinations(rest),Sum)) then
                Add(degs,w); 
              fi; 
            od; 
          else
            degs:=ndeg;
          fi;
        fi;
      fi;
      InfoGalois3(" yields degrees ",degs);
    od;

    c:=[];
    for i in [1..nn] do
      w:=ChineseRem(pl,List(mp,j->j[i])) mod b;
      if 2*w>b then
        w:=w-b;
      fi;
      Add(c,w);
    od;  
  else
    c:=SumRootsPolComp(r,c,m,n,nn);
  fi;
  InfoGalois3("\n");
  Add(c,r.one);
  if den<>1 then
    # revert ``integerization'' if necessary
    p:=1;
    for i in [1..Length(c)-1] do
      p:=p*den;
      c[Length(c)-i]:=c[Length(c)-i]/p;
    od;
  fi;
  return Polynomial(r,c);
end;  

#############################################################################
##
#F  ProductRootsPol( <f>, <m> ) . . . . . . . . . . . . . . .  compute f^{xm}
##
ProductRootsPol := function(f,m)
local c,ch,n,nn,p,r,i,j,h,w,q;
  InfoGalois3("#I ProductRootsPol ",m);
  r:=f.baseRing;
  ch:=Characteristic(r);
  n:=Degree(f);
  nn:=Binomial(n,m);
  c:=Reversed(ShiftedCoeffs(f.coefficients,f.valuation){[1..n]});
  for i in [1..n] do
    c[i]:=c[i]*(-1)^i;
  od;

  p:=PowersumsElsyms(c,m*nn);
  q:=[List(p{[1..nn]},i->i^0),p{[1..nn]}];
  q[1][1]:=r.one;
  for i in [2..m] do
    q[i+1]:=[];
    for j in [1..nn] do
      w:=r.zero;
      for h in [1..i] do
        w:=w-(-1)^h*p[j*h]*q[i-h+1][j];
      od;
      q[i+1][j]:=w/i;
    od;
  od;
  p:=q[m+1];
  c:=ElsymsPowersums(p,nn); 
  for i in [1..nn] do
    c[i]:=c[i]*(-1)^i;
  od;
  c:=Reversed(c);
  InfoGalois3("\n");
  Add(c,r.one);
  return Polynomial(r,c);
end; 

#############################################################################
##
##  Tschirnhausen(<pol>[,<trans>][,2]) . . . . . Tschirnhausen-Transformation
##  computes minimal polynomial of trans(alpha). If no <trans> is given, it
##  is taken by random. An added 2 will also return the <trans> polynomial.
##
Tschirnhausen := function(arg)
local k,x,y,r,pol;
  pol:=arg[1];
  k:=pol.baseRing;
  x:=X(k);
  y:=X(x.domain);
  if IsIdentical(k,Rationals) then
    k:=Integers;
  fi;
  if Length(arg)>1 and IsPolynomial(arg[2]) then
    r:=arg[2].coefficients;
  else
    r:=List([1..RandomList([2..Degree(pol)])],i->Random(k));
  fi;
  r:=Polynomial(x.domain,r);
  pol:=Polynomial(x.domain,pol.coefficients);
  InfoPoly2("#I Tschirnhausen transformation with ",r,"\n");
  pol:=Resultant(pol,x-r);
  if not IsPolynomial(arg[Length(arg)]) then 
    return [pol,r];
  else
    return pol;
  fi;
end;

#############################################################################
##
#F  TwoSeqPol( <f>, <m> ) . . . . . . . . . . . . . . . . . . compute f^{1+m}
##
TwoSeqPol := function(pol,m)
local f,c,ch,n,nn,p,r,i,j,h,w,q;
  InfoGalois3("#I TwoSeqPol ",m);
  f:=pol;
  r:=f.baseRing;
  ch:=Characteristic(r);
  n:=Degree(f);
  nn:=n*(n-1);
  p:=0;
  repeat
    if p=1 then
      repeat
        f:=Tschirnhausen(pol);
      until Degree(Gcd(f,Derivative(f)))=0;
    else
      f:=pol;
    fi;
    c:=Reversed(ShiftedCoeffs(f.coefficients,f.valuation){[1..n]});
    for i in [1..n] do
      c[i]:=c[i]*(-1)^i;
    od;

    p:=PowersumsElsyms(c,nn);
    p:=Concatenation([n*r.one],p);
    q:=[];
    for i in [1..nn] do
      w:=0;
      for j in [0..i] do
        w:=w+m^j*Binomial(i,j)*(p[j+1]*p[i-j+1]-p[i+1]);
      od;
      q[i]:=w;
    od;
    c:=ElsymsPowersums(q,nn); 
    for i in [1..nn] do
      c[i]:=c[i]*(-1)^i;
    od;
    c:=Reversed(c);
    InfoGalois3("\n");
    Add(c,r.one);
    c:=Polynomial(r,c);
    p:=1;
  until Degree(Gcd(c,Derivative(c)))=0;
  return c;
end; 


#############################################################################
##
#F  SetResolvent(<pol>,<n>) . . . . . . . . . . .  <n>-set resolvent of <pol>
##
SetResolvent := function(f,m)
local i,p,r,x,d;
  x:=X(f.baseRing);
  # remember, which resolvent types already failed (most likely for
  # smaller sums), so we won't have to use them twice! 
  # e.g.: if 2-Sum is double, then 3-Sum will vbe double most likely!
  if not IsBound(f.failedResolvents) then
    f.failedResolvents:=[];
  fi;
  if Value(f,-x)=f then
    # then for every root there is a negative one, causing trobles with sums
    f.failedResolvents:=Union(f.failedResolvents,[0,1,2]);
  fi;
  i:=0;
  d:=true;
  while d do
    if not i in f.failedResolvents then
      InfoGalois2("#I trying res nr. ",i,"\n");
      if i in [0,2,3] or i>5 then
        if i=0 then
          p:=f;
        elif i=2 then
          p:=Value(f,1/x)*f.baseRing.indeterminate^Degree(f);
          p:=p/LeadingCoefficient(p);
        elif i=3 then
          p:=Value(f,1/x+1)*f.baseRing.indeterminate^Degree(f);
          p:=p/LeadingCoefficient(p);
        else
          repeat
            p:=Tschirnhausen(f);
          until Degree(Gcd(f,Derivative(f)))=0;
        fi;
        r:=SumRootsPol(p,m);
      else
        if i=1 then
          p:=f;
        elif i=4 then
          p:=Value(f,x+1);
        else
          p:=Value(f,x-2);
        fi;
        r:=ProductRootsPol(p,m);
      fi;
      d:=Degree(Gcd(r,Derivative(r)))>0;
      if d and i<6 then
        # note failure
        AddSet(f.failedResolvents,i);
      fi;
    fi;
    i:=i+1;
  od;
  return r; 
end;


#############################################################################
##
#F  DiffResolvent(<pol>)  . . . . . . . . . . . . . . diff-resolvent of <pol>
##
DiffResolvent := function(f)
local s,i,p,r,x,m;
  m:=Degree(f);
  x:=X(f.baseRing);
  r:=x^2; # just to set initail value to non-squarefree pol
  i:=0;
  while Degree(Gcd(r,Derivative(r)))>0 do
    if i=0 then
      p:=f;
    elif i=1 then
      p:=Value(f,1/x)*f.baseRing.indeterminate^Degree(f);
    elif i=2 then
      p:=Value(f,1/x+1)*f.baseRing.indeterminate^Degree(f);
    elif i=3 then
      # 1/(x-3)
      p:=Value(f,x-3);
      p:=Value(p,1/x)*f.baseRing.indeterminate^Degree(f);
    else
      repeat
        p:=Tschirnhausen(f);
      until Degree(Gcd(f,Derivative(f)))=0;
    fi;
    p:=p/LeadingCoefficient(p);
    # The sum of the roots of p should be 0
    s:=p.coefficients[Length(p.coefficients)-1];
  #Print(p," ",s,"\n");
    p:=Value(p,x-s/m);
    InfoGalois3("#I p=",p,"\n");
    r:=SumRootsPol(p,m/2);
    if Degree(Gcd(r,Derivative(r)))=0 then
      # x^2->x; the condition implies, that the @#%&*! valuation is zero

      r:=r.coefficients{[1,3..(Degree(r)+1)]};
      #p:=2*[1..Degree(r)/2+1]-1;
      #r:=r.coefficients{p};
      r:=Polynomial(f.baseRing,r);
    fi;
    i:=i+1;
  od;
  return r; 
end;

#############################################################################
##
#F  PartitionsTest(<pol>,<prime>,<cand>,<discr>)  internal Tschebotareff test
##
PartitionsTest := function(f,p,cand,d)
local n,i,sh,fu,prop,ps,pps,ind,keineu,avoid;
  # Nenner mit in den Z"ahler bringen
  avoid:=Lcm(Concatenation([Numerator(d),Denominator(d)],
                          List(f.coefficients,Denominator)));
  InfoGalois1("#I Partitions Test");
  n:=Degree(f);
  TransGrpLoad(n);
  prop:=TRANSPROPERTIES[n];
  sh:=Partitions(n);
  fu:=List([1..Length(sh)-1],i->false);
  keineu:=0;
  repeat
    repeat
      p:=NextPrimeInt(p);
    until not IsInt(avoid/p);
    ps:=List(Factors(PolynomialModP(f,p)),Degree);
    Sort(ps,RevSortFun);
    ind:=Position(sh,ps)-1;
    if ind>0 then
      if fu[ind]=false then
        keineu:=0;
        fu[ind]:=true;
        cand:=Filtered(cand,i->prop[i][5][ind]);
        # add power cycleshapes, we just need the powers to |g|/2
        for i in [2..QuoInt(Lcm(ps),2)] do
          pps:=PowerPartition(ps,i);
          Sort(pps,RevSortFun);
          fu[Position(sh,pps)-1]:=true;
        od;
      elif ForAny(prop,i->i[5]=fu) then
        keineu:=keineu+1;
      fi;
    fi;
  until Length(cand)=1 or keineu>n;
  InfoGalois2(", cands:",cand);
  InfoGalois1("\n");
  return [p,cand];
end;

#############################################################################
##
#F  UnParOrbits(<list>) . . . . . . . . . . . . . . . . . . . . . .  internal
##
UnParOrbits := function(l)
local i,m;
  m:=[];
  for i in l do
    i:=AbsInt(i);
    while i>1000 do
      Add(m,i mod 1000);
      i:=i-1000;
    od;
    Add(m,i);
  od;
  return Collected(m);
end;


#############################################################################
##
#F  GetProperty(<list>,<propnr>) . . . . . . . . . . . . . . . . . . internal
##
GetProperty := function(l,prop)
local i;
  for i in l{[9..Length(l)]} do
    if i[1]=prop then
      return i;
    fi;
  od;
  return false;
end;


#############################################################################
##
#V  TRANSHAPEFREQS . . . . . . . . . . shape frequencies in transitive groups
##
if not IsBound(TRANSHAPEFREQS) then
  TRANSHAPEFREQS:=List([1..TRANSDEGREES],i->[]);
fi;


#############################################################################
##
#F  ShapeFrequencies . . . . . . . . . shape frequencies in transitive groups
##
ShapeFrequencies := function(n,i)
local g,fu,j,k,ps,pps,sh;
  if not IsBound(TRANSHAPEFREQS[n][i]) then
    sh:=Partitions(n);
    g:=TransitiveGroup(n,i);
    fu:=List([1..Length(sh)-1],i->0); 
    for j in ConjugacyClasses(g) do
      ps:=CycleStructurePerm(j.representative);
      pps:=[];
      for k in [1..Length(ps)] do
        if IsBound(ps[k]) then
          while ps[k]>0 do
            Add(pps,k+1);
            ps[k]:=ps[k]-1;
          od;
        fi;
      od;
      while Sum(pps)<n do
        Add(pps,1);
      od;
      Sort(pps,RevSortFun);
      ps:=Position(sh,pps)-1;
      if ps>0 then
        fu[ps]:=fu[ps]+Size(j);
      fi;
    od;
    fu:=fu/Size(g);
    TRANSHAPEFREQS[n][i]:=fu;
  fi;
  return TRANSHAPEFREQS[n][i];
end;


#############################################################################
##
#F  ProbabilityShapes(<pol>,[<discard>]) . . . . . . . . . Tschebotareff test
##
ProbabilityShapes := function(arg)
local f,n,i,sh,fu,prop,ps,pps,ind,keineu,ba,bk,j,k,a,anz,
      cnt,cand,d,alt,p,g,weg,fac;
  f:=arg[1];
  f:=f/LeadingCoefficient(f);
  if not(IsIrreducible(Domain([f]),f)) then
    Error("f must be irreducible");
  fi;
  n:=Degree(f);
  fac:=3;
  if n>11 then
    fac:=7;
  elif n>7 then
    fac:=5;
  fi;
  TransGrpLoad(n);
  prop:=TRANSPROPERTIES[n];
  cand:=[1..Length(prop)];
  if Length(arg)=2 then
    weg:=arg[2];
  else
    weg:=[];
  fi;
  d:=Discriminant(f); 
  alt:= d>0 and ParityPol(f)=1;
  if alt then
    cand:=Filtered(cand,i->prop[i][4]=1);
  fi;
  p:=1;
  # Nenner mit in den Z"ahler bringen
  d:=d*Denominator(d)^2*Lcm(List(f.coefficients,Denominator));
  InfoGalois1("#I Partitions Test");
  n:=Degree(f);
  TransGrpLoad(n);
  prop:=TRANSPROPERTIES[n];
  sh:=Partitions(n);
  fu:=List([1..Length(sh)-1],i->false);
  anz:=List(fu,i->0);
  cnt:=0;
  keineu:=0;
  repeat
    repeat
      p:=NextPrimeInt(p);
    until not IsInt(d/p);
    ps:=List(Factors(PolynomialModP(f,p)),Degree);
    Sort(ps,RevSortFun);
    ind:=Position(sh,ps)-1;
    cnt:=cnt+1;
    if ind>0 then
      anz[ind]:=anz[ind]+1;
      if fu[ind]=false then
        keineu:=0;
        fu[ind]:=true;
        cand:=Filtered(cand,i->prop[i][5][ind]);
        if IsSubset(weg,cand) then
          return [];
        fi;
        # add power cycleshapes, we just need the powers to |g|/2
        for i in [2..QuoInt(Lcm(ps),2)] do
          pps:=PowerPartition(ps,i);
          Sort(pps,RevSortFun);
          fu[Position(sh,pps)-1]:=true;
        od;
      elif ForAny(prop,i->i[5]=fu) then
        keineu:=keineu+1;
      fi;
    fi;
  until Length(cand)<2 or keineu>fac*n;
  cand:=Difference(cand,weg);
  InfoGalois2(", cands:",cand);
  InfoGalois1("\n");
  if Length(cand)=0 then
    return [];
  fi;
  anz:=anz/cnt;
  ba:="infinity";
  bk:=[];
  for i in cand do
    fu:=ShapeFrequencies(n,i);
    a:=0;
    for j in [1..Length(fu)] do
      a:=a+(fu[j]-anz[j])^2;
    od;
    if a<ba then
      ba:=a;
      bk:=[i];
    elif a=ba then
      Add(bk,i);
    fi;  
  od;
  bk:=Difference(bk,weg);
  return bk;
end;

#############################################################################
##
#F  Galois(<pol>,[<cands>]) . . . . . . . . . . . . . . . compute Galois type
##
Galois := function(arg)
local f,n,p,sh,p,ind,cand,noca,alt,prop,d,df,co,dco,res,pat,pps,i,j,k,orbs,
      GetResolvent,norb,act,repro,minpol,ext,ncand,pos,step,lens,gudeg,
      typ,pkt,fun,factors,stabs,stanr,nostanr;

  GetResolvent:=function(pol,nr)
  local p,pf;
    # normieren
    if LeadingCoefficient(pol)<>1 then
      pol:=pol/LeadingCoefficient(pol);
    fi;
    if not IsBound(orbs[nr]) then
      if nr=1 then
        orbs[nr]:=pol;
      elif nr=2 or nr=3 or nr=5 then
        orbs[nr]:=SetResolvent(pol,nr);
      elif nr=4 then
        if Degree(pol)=8 then
          # special case deg8, easy pre-factorization
          p:=DiffResolvent(pol);
          # store Diff-Resolvent for future use
          orbs[6]:=p;
          pf:=Concatenation(List(Factors(p),
                              i->Factors(Value(i,X(p.baseRing)^2))));
          # replace X^2
          p:=Value(p,X(p.baseRing)^2);
          p.factors:=pf;
          orbs[nr]:=p;
        else
          orbs[nr]:=SetResolvent(pol,4);
        fi;
      elif nr=6 then
        orbs[nr]:=DiffResolvent(pol);
      elif nr=9 then
        orbs[nr]:=TwoSeqPol(pol,2);
      else
        Error("Operation ",nr," not defined");
      fi;
      if nr<>4 or Degree(pol)<>8 then
        #we minimize, unless we have already computed a factorization
        orbs[nr]:=MinimizeBombieriNorm(orbs[nr])[1];
      fi;
    fi;
    return orbs[nr];
  end;

  norb:=["Roots","2-Sets","3-Sets","4-Sets","5-Sets","Diff",
         7,"Blocks","2-Sequences"];

  f:=arg[1];
  if LeadingCoefficient(f)<>1 then
    f:=f/LeadingCoefficient(f);
  fi;
  f:=MonicIntegerPolynomial(f);

  # minimize f
  f:=MinimizeBombieriNorm(f)[1];

  if not(IsIrreducible(Domain([f]),f)) then
    Error("f must be irreducible");
  fi;
  n:=Degree(f);
  TransGrpLoad(n);
  prop:=TRANSPROPERTIES[n];
  if Length(arg)=1 then
    cand:=[1..Length(prop)];
  else
    cand:=arg[2];
  fi;
  d:=Discriminant(f); 
  alt:= d>0 and ParityPol(f)=1;
  if alt then
    cand:=Filtered(cand,i->prop[i][4]=1);
  fi;
  p:=PartitionsTest(f,1,cand,d);
  cand:=p[2];
  p:=p[1];

  orbs:=[];

  # 2Set-Orbit Lengths
  co:=List(prop,i->i[6]);
  if Length(Set(co{cand}))>1 then
    InfoGalois1("#I 2-Set Resolvent\n");
    dco:=[];
    for i in cand do
      dco[i]:=UnParOrbits(co[i]);
    od;
    res:=GetResolvent(f,2);
    pat:=Collected(List(Factors(res),Degree));
    cand:=Filtered(cand,i->dco[i]=pat);
    if Length(Set(co{cand}))>1 then 
      pat:=List(Collected(List(Factors(res),
                               i->ParityPol(i)*Degree(i))),
                i->SignInt(i[1])*(1000*(i[2]-1)+AbsInt(i[1])));
      Sort(pat);
      cand:=Filtered(cand,i->co[i]=pat);
    fi;
    InfoGalois1("#I Candidates :",cand,"\n");
  fi;

  # 2Seq-Orbit Lengths
  co:=List(prop,i->i[7]);
  if Length(Set(co{cand}))>1 then
    InfoGalois1("#I 2-Seq Resolvent\n");
    dco:=[];
    for i in cand do
      dco[i]:=UnParOrbits(co[i]);
    od;
    res:=GetResolvent(f,9);
    pat:=Collected(List(Factors(res),Degree));
    cand:=Filtered(cand,i->dco[i]=pat);
    if Length(Set(co{cand}))>1 then 
      pat:=List(Collected(List(Factors(res),
                               i->ParityPol(i)*Degree(i))),
                i->SignInt(i[1])*(1000*(i[2]-1)+AbsInt(i[1])));
      Sort(pat);
      cand:=Filtered(cand,i->co[i]=pat);
    fi;
    InfoGalois1("#I Candidates :",cand,"\n");
  fi;

  # 3Set-Orbit Lengths
  co:=List(prop,i->i[8]);
  if n>=5 and Length(Set(co{cand}))>1 then
    InfoGalois1("#I 3-Set Resolvent\n");
    dco:=[];
    for i in cand do
      dco[i]:=UnParOrbits(co[i]);
    od;
    res:=GetResolvent(f,3);
    pat:=Collected(List(Factors(res),Degree));
    cand:=Filtered(cand,i->dco[i]=pat);
    if Length(Set(co{cand}))>1 then 
      pat:=List(Collected(List(Factors(res),
                               i->ParityPol(i)*Degree(i))),
                i->SignInt(i[1])*(1000*(i[2]-1)+AbsInt(i[1])));
      Sort(pat);
      cand:=Filtered(cand,i->co[i]=pat);
    fi;
    InfoGalois1("#I Candidates :",cand,"\n");
  fi;

  # now search among the remaining candidates for a better
  # discriminating property

  repro:=Union(List(prop{cand},i->List(i{[9..Length(i)]},j->j[1])));

  # filter out the properties we cannot use
  repro:=Filtered(repro,i->i>0);

  while Length(cand)>1 and Length(repro)>0 do 
    act:=repro[1];
    repro:=Difference(repro,[act]);
    noca:=Filtered(cand,i->Length(prop[i])<=8 or
                           GetProperty(prop[i],act)=false);
    cand:=Difference(cand,noca);
    co:=[];
    for i in cand do
      co[i]:=GetProperty(prop[i],act);
      co[i]:=co[i]{[2..Length(co[i])]};
    od;
    if Length(Set(co{cand}))>1 then
      if act>=4 and act<=6 then
        InfoGalois1("#I ",norb[act]," Resolvent\n");
        dco:=[];
        for i in cand do
          co[i]:=co[i][1]; # throw away unneeded list
          dco[i]:=UnParOrbits(co[i]);
        od;
        res:=GetResolvent(f,act);
        pat:=Collected(List(Factors(res),Degree));
        cand:=Filtered(cand,i->dco[i]=pat);
        if Length(Set(co{cand}))>1 then 
          pat:=List(Collected(List(Factors(res),
                                   i->ParityPol(i)*Degree(i))),
                    i->SignInt(i[1])*(1000*(i[2]-1)+AbsInt(i[1])));
          Sort(pat);
          cand:=Filtered(cand,i->co[i]=pat);
        fi;
      elif act>20 and act<50 then

        # alternating subgroup (and point stabilizer)
        if QuoInt(act,10)=2 then
          # avoid using the discriminant (which can be too big), but use
          # the non-square part instead:
          InfoGalois1("#I Alternating subgroup orbits on ",
                          norb[act mod 10],"\n");
          minpol:=X(f.baseRing)^2-
	    Product(List(Filtered(Collected(CheapFactorsInt(Numerator(d))),
                               i->not IsInt(i[2]/2)),i->i[1]))/
	    Product(List(Filtered(Collected(CheapFactorsInt(Denominator(d))),
                               i->not IsInt(i[2]/2)),i->i[1]));
        else
          InfoGalois1("#I point stabilizer orbits on ",norb[act mod 10],"\n");
          minpol:=f;
        fi;
        act:=act mod 10;

        ext:=AlgebraicExtension(minpol);
        res:=List(Factors(GetResolvent(f,act)),
                 i->EmbeddedPolynomial(PolynomialRing(ext),i));
        lens:=[];
        for step in [1,2] do
          dco:=[];
          for i in cand do
            if step=1 then
              dco[i]:=List(co[i],UnParOrbits);
              lens[i]:=List(dco[i],i->Sum(List(i,j->j[1]*j[2])));
            else
              dco[i]:=Copy(co[i]);
            fi;
          od;

          # compute, which factor we will not have to factor at all
          # since they split always the same
          gudeg:=[];
          for j in Set(Flat(lens)) do
            pat:=[];
            for i in cand do
              Add(pat,Collected(dco[i]{Filtered([1..Length(dco[i])],
                      k->lens[i][k]=j)}));
            od;
            if Length(Set(pat))=1 then
              InfoGalois2("#I ignoring length ",j,"\n");
            else
              Add(gudeg,j);
            fi;
          od;

          for i in res do
            if (Degree(i) in gudeg) 
               and (Length(Set(dco{cand}))>1) then 
              if step=1 then
                pat:=Collected(List(Factors(i),Degree));
              else
                pat:=List(Collected(List(Factors(i),
                                       i->ParityPol(i)*Degree(i))),
                        i->SignInt(i[1])*(1000*(i[2]-1)+AbsInt(i[1])));
                Sort(pat);
              fi;
              ncand:=[];
              for j in cand do
                pos:=Position(dco[j],pat);
                if pos<>false then
                  Add(ncand,j);
                  Unbind(dco[j][pos]);
                fi;
              od;
              cand:=ncand;
            fi;
          od;
        od;

      elif act>100 and act<1000 then
        # factor groups Galois
        typ:=QuoInt(act,100);
        pkt:=act mod 100;
        InfoGalois1("#I Galois group of ",norb[typ],
                    " factor on ",pkt," points\n");
        dco:=[];
        for i in cand do
          dco[i]:=ShallowCopy(co[i][1]);
        od;
        res:=Filtered(Factors(GetResolvent(f,typ)),i->Degree(i)=pkt);
        i:=1;
        while i<=Length(res) and Length(dco{cand})>1 do
          pat:=Galois(res[i]);
          if IsList(pat) then
            Error("Sub-Galois call not unique!");
          fi;
          ncand:=[];
          for j in cand do
            if pat in dco[j] then
              Add(ncand,j);
              Unbind(dco[j][Position(dco[j],pat)]); 
            fi;
          od;
          cand:=ncand;
          i:=i+1;
        od;

      elif act>1000 and act<10000 then

        # factor groups
        typ:=QuoInt(act,1000);
        act:=act mod 1000;
        pkt:=QuoInt(act,10);
        act:=act mod 10;
        InfoGalois1("#I ",norb[typ]," factor on ",pkt," points, on ",
                          norb[act],"\n");
        factors:=Filtered(Factors(GetResolvent(f,typ)),
                                      i->Degree(i)=pkt);

        if act=2 or act=3 then
          fun:=function(pol)
                 return SetResolvent(pol,act);
               end;
        elif act=9 then
          fun:=function(pol)
                 return TwoSeqPol(pol,2);
               end;
        else
          Error("This operation is not supported for factor groups!");
        fi;
        res:=List(factors,fun);

        for step in [1,2] do

          dco:=[];
          for i in cand do
            if step=1 then
              dco[i]:=List(co[i],UnParOrbits);
            else
              dco[i]:=Copy(co[i]);
            fi;
          od;

          for i in res do

            if (Length(Set(co{cand}))>1) then 
              if step=1 then
                pat:=Collected(List(Factors(i),Degree));
              else
                pat:=List(Collected(List(Factors(i),
                                       i->ParityPol(i)*Degree(i))),
                        i->SignInt(i[1])*(1000*(i[2]-1)+AbsInt(i[1])));
                Sort(pat);
              fi;
              ncand:=[];
              for j in cand do
                pos:=Position(dco[j],pat);
                if pos<>false then
                  Add(ncand,j);
                  Unbind(dco[j][pos]);
                fi;
              od;
              cand:=ncand;
            fi;

          od;
        od;

      elif act>10000 and act<100000 then
        # stabilisator orbits
        typ:=QuoInt(act,10000);
        act:=act mod 10000;
        pkt:=QuoInt(act,10);
        act:=act mod 10;
        InfoGalois1("#I ",norb[typ]," stabilizer of index ",pkt," on ",
                          norb[act],"\n");
        stabs:=Filtered(Factors(GetResolvent(f,typ)),
                                      i->Degree(i)=pkt);

        # stabilizers, which have already been identified completely
        nostanr:=[];

        for minpol in stabs do
          stanr:=Difference([1..Length(stabs)],nostanr);
          ext:=AlgebraicExtension(minpol);
          res:=List(Factors(GetResolvent(f,act)),
                   i->EmbeddedPolynomial(PolynomialRing(ext),i));
          lens:=[];
          for step in [1,2] do
            dco:=[];
            for i in cand do
              if step=1 then
                dco[i]:=List(co[i],i->List(i{stanr},UnParOrbits));
                lens[i]:=List(dco[i],i->Sum(List(i[1],j->j[1]*j[2])));
              else
                dco[i]:=List(Copy(co[i]),i->i{stanr});
              fi;
            od;

            # compute, which factor we will not have to factor at all
            # since they split always the same
            gudeg:=[];
            for j in Set(Flat(lens)) do
              pat:=[];
              for i in cand do
                Add(pat,Collected(dco[i]{Filtered([1..Length(dco[i])],
                        k->lens[i][k]=j)}));
              od;
              if Length(Set(pat))=1 then
                InfoGalois2("#I ignoring length ",j,"\n");
              else
                Add(gudeg,j);
              fi;
            od;
   
            for i in res do
              if (Degree(i) in gudeg) 
                 and (Length(Set(dco{cand}))>1) then 
                if step=1 then
                  pat:=Collected(List(Factors(i),Degree));
                else
                  pat:=List(Collected(List(Factors(i),
                                         i->ParityPol(i)*Degree(i))),
                          i->SignInt(i[1])*(1000*(i[2]-1)+AbsInt(i[1])));
                  Sort(pat);
                fi;
                ncand:=[];
                for j in cand do
                  pos:=Filtered([1..Length(dco[j])],i->pat in dco[j][i]);
                  if pos<>[] then
                    # we found an occurence: Note the possible stabilizers
                    stanr:=stanr{pos};
                    # and update the patterns accordingly.
                    dco:=List(dco,i->i{pos});
                    Add(ncand,j);
                    # mark occurence as found
                    for k in dco[j] do
                      # we may not unbind, since sublist will fail otherwise
                      k[Position(dco[j],pat)]:="weg";
                    od;
                  fi;
                od;
                cand:=ncand;
              fi;
            od;
          od;
          if Length(stanr)=1 then
            #the stabilizer has been identified completely, we will not
            # have to deal with this stab anymore
            nostanr:=Union(nostanr,stanr);
          fi;
        od;

      else
        Error("property ",act," not yet implemented");
      fi;
    fi;
    cand:=Union(cand,noca);
    if Length(cand)>1 then
      InfoGalois1("#I Candidates :",cand,"\n");
    fi;
  od;

  # Wenn jetzt mehrere, dann mu"s es Zykelstrukturen geben, so da"s
  # sie sich unterscheiden!(Ausnahmef"alle au"senvorgelassen)
  while not(cand in TRANSNONDISCRIM[n]) and Length(cand)>1 do
    p:=PartitionsTest(f,p,cand,d);
    p:=p[1];
  od;

  # still no discrimination ?
  if Length(cand)>1 then
    # special cases
    if n=12 and
      IsSubset(cand,[273,292]) then
      #2SetStab 18 factor
      res:=First(Factors(GetResolvent(f,2)),i->Degree(i)=18);
      #2SetStab 9 factor
      res:=First(Factors(SetResolvent(res,2)),i->Degree(i)=9);
      res:=Galois(res);
      if res=22 then
        return 273;
      else
        return 292;
      fi;
    fi;

    Error(cand," feasible discrimination not known");
  fi;

  return cand[1];
end; 
