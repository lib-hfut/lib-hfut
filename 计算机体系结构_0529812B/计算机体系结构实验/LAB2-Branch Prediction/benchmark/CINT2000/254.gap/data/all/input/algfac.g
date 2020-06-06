#############################################################################
##
#A  algfac.g                    GAP library                  Alexander Hulpke
##
#A  @(#)$Id: algfac.g,v 3.1 1994/06/03 10:49:44 ahulpke Rel $
##
#Y  Copyright (C)  1994,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This  file contains the functions  for  the factorization of  polynomials
##  over algebraic extensions.
##
#H  $Log: algfac.g,v $
#H  Revision 3.1  1994/06/03  10:49:44  ahulpke
#H  initial revision under RCS
#H
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
##  TragerNorm(<pol>[,<ind>]) . . . . squarefree number theoretic Norm of pol
##  computes N_[K(\alpha):K](pol) via Resultant, translates pol by \alpha
##  until result is squarefree. If a second argument is given, this
##  translation is also returned.
##
TragerNorm := function(arg)
local p,a,K,b,r,x,y,m,c,d,i,t,pot,s,v,pp,g;
  p:=arg[1];
  K:=p.domain.baseRing;
  b:=K.field;
  a:=K.primitiveElm;
  x:=X(b);
  r:=PolynomialRing(b);
  y:=X(r);
  InfoAlg1("#I computing Norm(f)\n");
  m:=Polynomial(r,K.minpol.coefficients,K.minpol.valuation);
  c:=ShiftedCoeffs(p.coefficients,p.valuation);
  d:=[];
  s:=b.zero;
  v:=x;
  for i in c do
    if i in b then
      Add(d,i*x^0);
    else
      Add(d,ValuePol(List(i.coefficients,i->i*x^0),y));
      s:=-b.one;
      v:=x-y;
    fi;
  od;
  repeat
    v:=v+y;
    s:=s+b.one;
    InfoAlg2("#I s=",s,"\n");
    t:=b.zero*x^0*y;
    pot:=b.one*x^0;
    for i in d do
      t:=t+pot*i;
      pot:=pot*v;
    od;
    t:=Resultant(m,t);
    g:=Gcd(t,Derivative(t));
  until g=g^0;
  if Length(arg)=1 then
    return t;
  else
    return [t,s];
  fi;
end;

#############################################################################
##
##  TragerFact(<pol>) . .  factorization of pol\in K(a)[x] by Trager's method
##
TragerFact := function(p)
local a,K,x,y,pp,s,t,i;
  InfoAlg1("factoring using Trager's method\n");
  K:=p.domain.baseRing;
  a:=K.primitiveElm;
  y:=TragerNorm(p,2);
  t:=y[1];
  s:=y[2];
  x:=X(K);
  pp:=Value(p,x+s*a);
  InfoAlg1("factoring over K\n");
  t:=List(Factors(t),i->EmbeddedPolynomial(PolynomialRing(K),i));
  InfoAlg1("computing GCDs\n");
  t:=List(t,i->Gcd(i,pp));
  y:=x-s*a;
  return List(t,i->Value(i,y));
end;


#############################################################################
##
#F  ChaNuPol(<pol>,<alphamod>,<alpha>,<modfield>,<field> . . . reverse modulo
##  transfer pol from modfield with alg. root alphamod to field with
##  alg. root alpha by taking the standard preimages of the coefficients
##  mod p
##
ChaNuPol := function(f,alm,alz,K,xr)
local b,p,r,nu,w,i,z;
  if IsFFE(alm) then
    p:=CharFFE(alm);
  else
    p:=Size(alm.domain.field); 
  fi;
  z:=Z(p);
  r:=PrimitiveRootMod(p);
  nu:=0*alm;
  b:=IsPolynomial(f);
  if b then
    f:=ShiftedCoeffs(f.coefficients,f.valuation);
  else
    f:=[f];
  fi;
  for i in [1..Length(f)] do
    w:=f[i];
    if w=nu then
      w:=0;
    else
      if IsFFE(w) and DegreeFFE(w)=1 then
        w:=PowerModInt(r,LogFFE(w,z),p);
      else
        w:=ValuePol(List(K.operations.Coefficients(K,w),IntFFE),alz);
      fi;
    fi;
    f[i]:=w;
  od;
  return Polynomial(xr,f);
end;


#############################################################################
##
#F  AlgebraicPolynomialModP(<field>,<pol>,<indetimage>,<prime>) . .  internal
##      reduces <pol> mod <prime> to a polynomial over <field>, mapping 
##      'alpha' of f to <indetimage>
##
AlgebraicPolynomialModP := function(k,f,a,p)
local i,j,fk,w;
  fk:=[];
  for i in f.coefficients do
    if IsRat(i) then
      Add(fk,k.one*(i mod p));
    else
      w:=k.zero;
      for j in [1..f.baseRing.degree] do
        w:=w+(i.coefficients[j] mod p)*a^(j-1);
      od;
      Add(fk,w);
    fi;
  od;
  return Polynomial(k,fk);
end;

#############################################################################
##
#F  UPrep( <f> ) . . . . . . . Hensel preparation: f=\prod ff, \sum h_i u_i=1
##
UPrep := function(f)
local ff,h,u,i,j,ggt,ggr;
  h:=[];
  ff:=Factors(f);
  for i in [1..Length(ff)] do
    h[i]:=f/ff[i];
  od;
  u:=[f.baseRing.one]; 
  ggt:=h[1];
  for i in [2..Length(ff)] do
    ggr:=GcdRepresentation(ggt,h[i]);
    ggt:=Gcd(ggt,h[i]);
    for j in [1..i-1] do
      u[j]:=u[j]*ggr[1];
    od;
    u[i]:=ggr[2];
  od;
  return u;
end;

#############################################################################
##
#F  TransferedExtensionPol(<ext>,<polynomial>[,<minpol>]) 
##  interpret polynomial over different algebraic extension. If minpol
##  is given, the algebraic elements are reduced according to minpol.
##
TransferedExtensionPol := function(arg)
local kl,i,c,red;
  kl:=ShallowCopy(arg[2].coefficients);
  if Length(arg)>2 then
    red:=ShiftedCoeffs(arg[3].coefficients,arg[3].valuation);
    # Rational case, reduce according to Minpol
    for i in [1..Length(kl)] do
      if IsAlgebraicElement(kl[i]) then
        c:=RemainderCoeffs(kl[i].coefficients,red);
        if Length(red)=2 then
          kl[i]:=c[1];
        else
          while Length(c)<Length(red)-1 do
            Add(c,0*red[1]);
          od;
          kl[i]:=AlgExtElm(arg[1].primitiveElm,c);
        fi;
      fi;
    od;
  else
    for i in [1..Length(kl)] do
      if IsAlgebraicElement(kl[i]) then
        kl[i]:=rec(
                isAlgebraicElement:=true,
                domain:=arg[1],
                coefficients:=ShallowCopy(kl[i].coefficients),
                operations:=kl[i].operations
              );
      fi;
    od;
  fi;
  return arg[1].operations.FastPolynomial(arg[1],kl,arg[2].valuation);
end;

#############################################################################
##
#V  EuclideanLattice . . . . . . . . . . . . . . . standard Euclidean Lattice
##
EuclideanLattice := rec(
  operations:=rec(
    ScalarProduct:=function(lat,a,b)
                     return a*b;
                   end
  ));

#############################################################################
##
#F  OrthogonalityDefect(<lattice>,<latticebase>) . Orth. defect of a lattice
##
OrthogonalityDefect := function(lat,bas)
  return AbsInt(Product(List(bas,i->RootInt(ScalarProduct(lat,i,i),2)+1))
                /DeterminantMat(bas));
end;

#############################################################################
##
##  AlgExtSquareHensel( <ring>, <pol> )   hensel factorization over alg.
##                    extension. Suppose f is squarefree, has valuation 0
##                  Lenstra's or Weinberger's method
##
AlgExtSquareHensel := function(R,f)
local K,a,i,j,k,m,p,d,mm,mmf,nm,dm,kp,w,al,gut,u,M,
    ff,ffa,fff,U,mh,ext,ef,z,dis,avoid,n,degs,
    ps,l,dd,dl,q,mo,ind,perm,fact,def,bound,bounds,pex,
    numbound,max,newq,actli,method,sel,act,len,degsm,cbn,
    M,Mi,comb,degf,degm,ordef,v,bw,bp,bff,bkp,bal,zaehl,bmm;

  K:=f.baseRing;

  fact:=[];

  degf:=Degree(f);

  m:=K.minpol;
  degm:=Degree(m);

  dis:=Discriminant(m);

  def:=DefectApproximation(K);

  # find lcm of Denominators
  d:=Lcm(Concatenation(List(f.coefficients,NewDenominator),
                       List(K.minpol.coefficients,Denominator)));

  # find prime which does not divide the denominator and minpol is sqarefree
  # mod p. This is obviously satisfied, if we take d to be the Lcm of
  # the denominators and the discriminant
 
  avoid:=Lcm(d,dis*Denominator(dis)^2,def);

  bw:="infinity";
  zaehl:=1;
  p:=1;

  repeat
    p:=NextPrimeInt(p);
    while Denominator(avoid/p)=1 do
      p:=NextPrimeInt(p);
    od;
    mm:=PolynomialModP(m,p);
    mmf:=Factors(mm);
    nm:=Length(mmf);
    Sort(mmf,function(a,b)
               return Degree(a)>Degree(b);
             end);

    dm:=List(mmf,Degree);

    if dm[1]>1 
       # don't even risk problems with the @#$%&! valuation!
       and ForAll(mmf,i->i.valuation=0) then
      al:=[];
      kp:=[];
      ff:=[];
      i:=1;
      gut:=true;
      while gut and i<=nm do

        # cope with the too small range of finite fields in GAP
        if p^Degree(mmf[i])<=65536 then
          kp[i]:=GF(GF(p),ShiftedCoeffs(mmf[i].coefficients,mmf[i].valuation));
          if not(IsBound(kp[i].root)) then
            kp[i].root:=Z(p^dm[i]);
          fi;
        else
          kp[i]:=AlgebraicExtension(mmf[i]);
        fi;
        if Length(kp[i].base)>1 then
          al[i]:=kp[i].base[2];
        else
          al[i]:=-mmf[i].coefficients[1];
        fi;

        ff[i]:=AlgebraicPolynomialModP(kp[i],f,al[i],p);

        gut:=Degree(Gcd(ff[i],Derivative(ff[i])))<1;
        i:=i+1;
      od;
      if gut then
        if InfoAlg2<>Ignore then
          InfoAlg2("#I trying prime ",p,": ",nm," factors of minpol, ",
                   Length(Factors(ff[1]))," factors and\n");
        fi;
        # Wert ist Produkt der Cofaktorgrade des Polynoms (wir wollen
        # m"oglichst wenig gro"se Faktoren haben) sowie des
        # Kofaktorgrades des Minimalpolynoms (wir wollen bereits
        # akzeptabel approximieren) im Kubik (da es dominieren soll).
        w:=(degm/dm[1])^3*
            Product(List(Factors(ff[1]),i->Degree(f)-Degree(i)));
        if w<bw then
          bw:=w;
          bp:=p;
          bff:=ff;
          bkp:=kp;
          bal:=al;
          bmm:=mm;
        fi;
        zaehl:=zaehl+1;
      fi;
    fi;

  # teste 5 Primzahlen zu Anfang
  until zaehl=6;

  # beste Werte holen
  p:=bp;
  ff:=bff;
  kp:=bkp;
  al:=bal;
  mm:=bmm;
  mmf:=Factors(mm); #is stored in pol
  nm:=Length(mmf);
  dm:=List(mmf,Degree);

  # multiply denominator by defect to be sure, that \Z[\alpha] includes the
  # algebraic integers to obtain 'result' denominator

  d:=d*def;

  fff:=List(ff,Factors);
  InfoAlg1("#I using prime ",p,": ",nm," factors of minpol, ",
           List(fff,Length)," factors and\n");

  # check possible Degrees

  degs:=Intersection(List(fff,i->List(Combinations(List(i,Degree)),Sum)));

  degs:=Difference(degs,[0]);
  degs:=Filtered(degs,i->2*i<=degf);
  IsRange(degs);
  InfoAlg1("#I possible degrees: ",degs,"\n");

  # are we lucky? 
  if Length(degs)>0 then

    bounds:=HenselBound(f,m,d);
    numbound:=bounds[Maximum(degs)];

    InfoAlg1("#I Bound for factor coefficients coefficients is:",
                     numbound,"\n");

    # first suppose we get the lattice reduced to orthogonality defect 3.5 

    ordef:=4;

    repeat
      #NOCH: verwende bessere beim zweiten mal bereits bekanntes
      # geliftes

      # compute bounds and select method

      method:="weinberger";
      pex:=LogInt(2*numbound-1,p)+1;
      actli:=[1..nm];

      if nm>1 then
        w:=ShiftedCoeffs(m.coefficients,m.valuation);
        w:=
          # obere Absch"atzung f"ur ||F||^(m-1)
          EuclideanLattice.operations.ScalarProduct(w,w,w)^(Maximum(degs)-1)

          *(2*ordef*numbound)^degf;
        w:=Int(w)+1;
        if LogInt(w,10)<400 then
          method:="lenstra";
          pex:=LogInt(w-1,p)+1-dm[1];
          actli:=[1];
        fi;
      fi;

      bound:=pex;

      InfoAlg1("#I using ",method," method\n");

      # prep U for mm Hensel

      U:=UPrep(mm);

      # prepare u for ff Hensel
      u:=List(ff,UPrep);

      # alles in Charakteristik 0 transportieren

      InfoAlg1("#I transporting in characteristic zero\n");

      for i in [1..nm] do
        if IsPolynomial(mmf[i]) then
          mmf[i]:=Polynomial(Rationals,List(mmf[i].coefficients,IntFFE),
                             mmf[i].valuation);
        else
          mmf[i]:=IntFFE(mmf[i]);
        fi;
        if IsPolynomial(U[i]) then
          U[i]:=Polynomial(Rationals,List(U[i].coefficients,IntFFE),
                           U[i].valuation);
        else
          U[i]:=IntFFE(U[i]);
        fi;
      od;

      # dabei repr"asentieren wir die Wurzel \alpha als alg. Erweiterung mit
      # dem entsprechenden Polynom als Minpol.

      ext:=[];
      for i in actli do
        if EuclideanDegree(mmf[i])>1 then
          ext[i]:=AlgebraicExtension(mmf[i]);
        else
          ext[i]:=Rationals;
        fi;
        if ext[i].degree>1 then
          w:=ext[i].primitiveElm;
        else
          w:=ext[i].one;
        fi;
        fff[i]:=List(fff[i],j->ChaNuPol(j,al[i],w,kp[i],ext[i]));
        u[i]:=List(u[i],j->ChaNuPol(j,al[i],w,kp[i],ext[i]));
      od;

      # jetzt hochHenseln
      q:=p;
      mh:=ShallowCopy(mmf);

      # how many square iterations needed for bound (the p-exponent)?

      max:=p^bound;

      M:=LogInt(bound-1,2)+1;

      InfoAlg1("#I ",M," quadratic steps necessary\n");
      for i in [1..M] do
        # now lift q->q^2 (or appropriate smaller number)
        # avoid modulus too large, since the computation afterwards becomes
        # harder
        newq:=Minimum(q^2,max);

        InfoAlg1("#I quadratic Hensel Lifting, step ",i,", ",q,"->",newq,"\n");

        if Length(mh)>1 then
          # more than 1 factor: actual lift necessary

          if i>1 then
            # now lift the U's

            InfoAlg2("#I correcting U-inverses\n");
            for j in [1..nm] do
              a:=ProductMod(mh{Difference([1..nm],[j])},q) mod mh[j] mod q;
              U[j]:=BPolyProd(U[j], (2-APolyProd(U[j],a,q)), mh[j], q);
              #a:=a*U[j] mod mh[j] mod q;
              #if a<>a^0 then
                #Error("U-rez");
              #fi;
            od;

          fi;

          for j in [1..nm] do
            a:=(m mod mh[j] mod newq);
            if IsPolynomial(a) and IsPolynomial(U[j]) then
              mh[j]:=mh[j]+BPolyProd(U[j],a,mh[j],newq);
            else
              mh[j]:=mh[j]+(U[j]*a mod mh[j] mod newq);
            fi;
          od;

          #a:=(m-ProductMod(mh,newq)) mod newq;
          #InfoAlg2("#I new F-discrepancy mod ",p,"^",2^i," is ",a,
                   #"(should be 0)\n");
          #if a<>0*a then
            #Error("uh-oh");
          #fi;

        else
          mh:=[m mod newq];
        fi;

        # transport fff etc. into the new (lifted) extension fields

        ef:=[];
        for k in actli do
          ext[k]:=AlgebraicExtension(mh[k]);
          # also to provoke the binding of the Ring
          w:=X(ext[k]);
          w.name:="X"; 

          for j in [1..Length(fff[k])] do
            fff[k][j]:=TransferedExtensionPol(ext[k],fff[k][j]);
            u[k][j]:=TransferedExtensionPol(ext[k],u[k][j]);
          od;

          ef[k]:=TransferedExtensionPol(ext[k],f,mh[k]);
        od;
        
        # lift u's
        if i>1 then

          InfoAlg2("#I correcting u-inverses\n");
          for k in actli do
            for j in [1..Length(u[k])] do
              a:=ProductMod(fff[k]{Difference([1..Length(u[k])],[j])},q)
                         mod fff[k][j] mod q;
              u[k][j]:=BPolyProd(u[k][j],(2-APolyProd(a,u[k][j],q)),
                                 fff[k][j],q);
              #a:=a*u[k][j] mod fff[k][j] mod q;
              #if a<>a^0 then
              #  Error("u-rez");
              #fi;
            od;
          od;

        fi;

        for k in actli do
          for j in [1..Length(fff[k])] do
            a:=(ef[k] mod fff[k][j] mod newq);
            fff[k][j]:=fff[k][j]+BPolyProd(u[k][j],a,fff[k][j],newq) mod newq;
          od;

          #a:=(ef[k]-ProductMod(fff[k],newq)) mod newq;
          #InfoAlg2("#I new discrepancy mod ",p,"^",2^i," is ",a,
                   #"(should be 0)\n");
          #if a<>0*a then
            #Error("uh-oh");
          #fi;
        od;

        # now all is fine mod newq;
        q:=newq;
      od;
 
      bound:=q/2;

      if method="lenstra" then
        # prepare Lattice for mh[1]
        
        M:=[];
        for i in [0..Degree(mmf[1])-1] do
          M[i+1]:=0*[1..degm];
          M[i+1][i+1]:=p^pex;
        od;
        for i in [Degree(mmf[1])..degm-1] do
          M[i+1]:=ShiftedCoeffs(mh[1].coefficients,
                                mh[1].valuation+i-Degree(mmf[1]));
          while Length(M[i+1])<degm do
            Add(M[i+1],0);
          od;
        od;

        M:=LLLint(M);
        #M:=Concatenation(M.irreducibles,M.remainders);

        w:=OrthogonalityDefect(EuclideanLattice,M);
        InfoAlg1("#I Orthogonality defect: ",EvalF(w),"\n");
        if w>ordef then
          Error("OD war zu klein angesetzt!");
          ordef:=Maximum(w,ordef+1);
          w:=2*ordef; #just for the until
        else
          ordef:=Int(w)+1;
        fi;
      elif method="weinberger" then
        w:=ordef-1; # to skip the loop
      fi;

    until w<=ordef;

    if method="lenstra" then
      M:=TransposedMat(M);
      Mi:=M^(-1);

    elif method="weinberger" then
      # Prepare for Chinese remainder
      if Length(mh)>1 then
        U:=[];
        for i in [1..nm] do
          a:=ProductMod(mh{Difference([1..nm],[i])},q);
          U[i]:=a*(GcdRepresentation(mh[i],a)[2] mod q) mod q;
        od;
      else
        U:=[X(Rationals)^0];
      fi;
      # sort according to the number of factors:
      # Our 'starting' factorisation is the one with the fewest factors,
      # because this one allows the fewest number of combinations.

      ind:=[1..nm];
      Sort(ind,function(a,b)
                 return Length(fff[a])<Length(fff[b]);
               end);
      perm:=PermList(ind);
      Permuted(mh,perm);
      Permuted(fff,perm);

      # We will start with small degrees, in a hope that there are some
      # factors of small degrees. These small degree factors are better suited
      # for trying, because we will have fewer combinations of the other
      # factorisations to try, to obtain the according one.
      # Thus sort first factorisation according to degree

      Sort(fff[1],function(a,b)
                    return Degree(a)<Degree(b);
                  end);

      # For the corresponding factors, we take on the other hand large
      # degree factors first. The hard case is the one with relative large
      # factors. If in one component, the relative large factor remains
      # irreducible, we will be thus ready a bit sooner (hopefully).

      for i in [2..nm] do
        Sort(fff[i],function(a,b)
                      return Degree(a)>Degree(b);
                    end);
      od;

    fi;

    al:=K.primitiveElm;

    # now the hard part starts: We try all possible combinations, whether
    # they factor.

    dl:=[];
    sel:=[];
    for k in actli do
      # 'available' factors (not yet used up)
      sel[k]:=[1..Length(fff[k])];
      dl[k]:=List(fff[k],Degree);
      InfoAlg1("#I Degrees[",k,"] :",dl[k],"\n");
    od;

    act:=1;
    len:=0;

    dm:=[];
    for i in actli do
      dm[i]:=List(fff[i],Degree);
    od;

    repeat
      # factors of larger than half remaining degree we will find as
      # final cofactor
      degf:=Degree(f);
      degs:=Filtered(degs,i->2*i<=degf);

      if act in sel[1] then
        # all combinations of sel[1] of length len+1, that contain act:

        degsm:=degs-dm[1][act];
        comb:=Filtered(Combinations(Filtered(sel[1],i->i>act),len),
              i->Sum(dm[1]{i}) in degsm);

        # sort according to degree
        Sort(comb,function(a,b) return Sum(dm[1]{a})<Sum(dm[1]{b});end);

        comb:=List(comb,i->Union([act],i));

        gut:=true;

        i:=1;
        while gut and i<=Length(comb) do
          InfoAlg2("#I trying ",comb[i],"\n");

          if method="lenstra" then
            a:=d*ProductMod(fff[1]{comb[i]},q) mod q;
            a:=ShiftedCoeffs(a.coefficients,a.valuation);
            v:=[];
            for j in a do
              if IsAlgebraicElement(j) then
                w:=j.coefficients;
              else
                w:=[j];
              fi;
              while Length(w)<degm do
                Add(w,0);
              od;
              Add(v,w); 
            od;
            w:=List(v,i->Mi*i);
            w:=List(w,i->List(i,j->SignInt(j)*Int(AbsInt(j)+1/2)));
            w:=List(w,i->M*i);
            v:=(v-w)/d;
            a:=Polynomial(K,List(v,i->AlgExtElm(al,i)));

            #Print(a,"\n");
            w:=TrialQuotient(f,a,bounds);
            if w<>false then
              InfoAlg1("#I factor found\n");
              f:=w;
              Add(fact,a);
              sel[1]:=Difference(sel[1],comb[i]);
              #fff[1]:=fff[1]{Difference([1..Length(fff[1])],comb[i])};
              gut:=false;
            fi;

          elif method="weinberger" then
            # now select all other combinations of same degree
            dd:=Sum(dl[1]{comb[i]});
            #NOCH: Combinations nach Grad ordnen. Nur neue listen
            #bestimmen, wenn der Grad sich ge"andert hat.
            cbn:=[comb{[i]}];
            for j in [2..nm] do
              # all combs in component nm of desired degree
              cbn[j]:=Concatenation(List([1..QuoInt(dd,Minimum(dl[j]))],
                      i->Filtered(Combinations(sel[j],i),
                                  i->Sum(dl[j]{i})=dd)));
            od;
            if ForAny(cbn,i->Length(i)=0) then
              gut:=false;
            else
              l:=List([1..nm],i->1); # the great variable for-Loop 
              ff:=List([1..nm],i->ProductMod(fff[i]{cbn[i][1]},q).coefficients);
            fi;

            ps:=nm;
            while gut and ps>=1 do
              a:=[];
              for j in [1..dd+1] do
                w:=0;
                for k in [1..nm] do
                  z:=ff[k][j];
                  if IsAlgebraicElement(z) then
                    z:=Polynomial(Rationals,z.coefficients);
                  fi;
                  w:=w+U[k]*z mod m mod q;
                od;
                w:=d*w mod m mod q;
                for k in [1..Length(w.coefficients)] do
                  if w.coefficients[k]>q/2 then
                    w.coefficients[k]:=w.coefficients[k]-q;
                  fi;
                od;
                a[j]:=1/d*Value(w,al);
              od;

              # now try the Factor
              a:=Polynomial(K,a);

              InfoAlg3("#I  trying subcombination ",List([2..nm],
                        i->cbn[i][l[i]]),"\n");
              w:=TrialQuotient(f,a,bounds);
              if w<>false then
                InfoAlg1("#I factor found\n");
                Add(fact,a);
                for j in [1..nm] do
                  sel[j]:=Difference(sel[j],cbn[j][l[j]]);
                od;
                f:=w;
                gut:=false;
              fi;

              # increase and update factors
              while ps>1 and l[ps]=Length(cbn[ps]) do
                l[ps]:=1;
                a:=ProductMod(fff[ps]{cbn[ps][1]},q);
                ff[ps]:=a.coefficients;
                ps:=ps-1;
              od;
              if ps>1 then
                l[ps]:=l[ps]+1;
                a:=ProductMod(fff[ps]{cbn[ps][l[ps]]},q);
                ff[ps]:=a.coefficients;
              fi;

              if ps>1 then
                ps:=nm;
              else
                ps:=0;
              fi;

            od;
          fi;

          i:=i+1;
        od;

        if comb=[] then
          i:=0;
        else
          # the len minimal lengths
          i:=Copy(dm[1]);
          Sort(i);
          i:=Sum(i{[1..Minimum(Length(i),len)]});
        fi;

        if gut and dm[1][act]+i>=Maximum(degs) then
          # the actual factor will always yield factors too large, thus we
          # can avoid it furthermore
          InfoAlg2("#I factor ",act," can be further neglected\n");
          sel[1]:=Difference(sel[1],[act]);
          gut:=false;
        fi;

      fi;

      act:=act+1;
      if sel[1]<>[] and act>Maximum(sel[1]) then
       len:=len+1;
       act:=sel[1][1];
      fi;
      
    until ForAny(sel,i->i=[] or Length(i)=1)
          or Length(sel[1])<len; #nothing left to check

  fi;

  # aufr"aumen

  if f<>f^0 then
    Add(fact,f);
  fi;

  return fact;
end;

#############################################################################
##
#F  DecomPoly( <f> [,"all"] )  finds (all) ideal decompositions of rational f
##                       This is equivalent to finding subfields of K(alpha).
##
DecomPoly := function(arg)
local f,n,e,ff,p,ffp,ffd,roots,allroots,nowroots,fm,fft,comb,combi,k,h,i,j,
      gut,avoid,blocks,g,m,decom,z,R,scale,allowed,hp,hpc;
  f:=MonicIntegerPolynomial(arg[1]);
  n:=Degree(f);
  if IsPrime(n) then
    return [];
  fi;
  R:=f.baseRing;
  if not IsIrreducible(Domain([f]),f) then
    Error("<f> must be irreducible");
  fi;
  allowed:=Difference(DivisorsInt(n),[1,n]);
  avoid:=Discriminant(f);
  p:=1;
  fm:=[];
  repeat
    p:=NextPrimeInt(p);
    if avoid mod p<>0 then
      fm:=Factors(PolynomialModP(f,p));
      ffd:=List(fm,Degree);
      Sort(ffd);
      if ffd[1]=1 then
        allowed:=Intersection(allowed,List(Combinations(ffd{[2..Length(ffd)]}),
                                           i->Sum(i)+1));
      fi;
    fi;
  until Length(fm)=n or Length(allowed)=0;
  if Length(allowed)=0 then
    return [];
  fi;
  InfoPoly2("#I  Possible sizes: ",allowed,"\n");
  e:=AlgebraicExtension(f);
  ff:=MinpolFactors(e);
  # lin. faktor weg
  ff:=ff{Difference([1..Length(ff)],[Position(ff,X(e)-e.primitiveElm)])};
  ffd:=List(ff,Degree);
  InfoPoly2("#I  ",Length(ff)," factors, degrees: ",ffd,"\n");
  #avoid:=Lcm(Union([avoid],
#            List(ff,i->Lcm(List(i.coefficients,NewDenominator)))));
  h:=f;
  allowed:=allowed-1;
  comb:=Filtered(Combinations([1..Length(ff)]),i->Sum(ffd{i}) in allowed);
  InfoPoly2("#I  ",Length(comb)," combinations\n");
  k:=GF(p);
  InfoPoly2("#I  selecting prime ",p,"\n");
  #zeros;
  fm:=List(fm,i->-i.coefficients[1]/i.coefficients[2]);
  # now search for block:
  blocks:=[];
  gut:=false;
  h:=1;
  while h<=Length(comb) and gut=false do
    combi:=comb[h];
    InfoPoly2("#I  testing combination ",combi,": ");
    fft:=ff{combi};
    ffp:=List(fft,i->AlgebraicPolynomialModP(k,i,fm[1],p));
    roots:=Filtered(fm,i->ForAny(ffp,j->Value(j,i)=k.zero));
  if Length(roots)<>Sum(ffd{combi}) then
    Error("serious error");
  fi;
    allroots:=Union(roots,[fm[1]]);
    gut:=true;
    j:=1;
    while j<=Length(roots) and gut do
      ffp:=List(fft,i->AlgebraicPolynomialModP(k,i,roots[j],p));
      nowroots:=Filtered(allroots,i->ForAny(ffp,j->Value(j,i)=k.zero));
      gut := Length(nowroots)=Sum(ffd{combi});
      j:=j+1; 
    od;
    if gut then
      InfoPoly2("block found\n");
      Add(blocks,combi);
      if Length(arg)>1 then
        gut:=false;
      fi;
    else
      InfoPoly2("\n");
    fi;
    h:=h+1;
  od;

  if Length(blocks)>0  then
    if Length(blocks)=1 then
      InfoPoly2("#I  Block of Length ",Sum(ffd{blocks[1]})+1," found\n");
    else
      InfoPoly2("#I  Blocks of Lengths ",List(blocks,i->Sum(ffd{i})+1),
                " found\n");
    fi;
    decom:=[];
    # compute decompositions
    for i in blocks do
      # compute h 
      hp:=(X(e)-e.primitiveElm)*Product(ff{i});
      hpc:=Filtered(hp.coefficients,i->not i in R);
      gut:=0;
      repeat
        if gut=0 then
          h:=hpc[1];
        else
          h:=List(hpc,i->RandomList([-2^20..2^20]));
          InfoPoly2("#I  combining ",h,"\n");
          h:=h*hpc;
        fi;
        h:=Polynomial(R,h.coefficients);
        h:=h*Lcm(List(h.coefficients,Denominator));
        if LeadingCoefficient(h)<0 then
          h:=-h;
        fi;
        # compute g
        j:=0;
        m:=[];
        repeat
          z:=PowerMod(h,j,f);
          z:=ShiftedCoeffs(z.coefficients,z.valuation);
          while Length(z)<Length(f.coefficients)-1 do
            Add(z,0);
          od;
          Add(m,z);
          j:=j+1;
        until RankMat(m)<Length(m);
        g:=Polynomial(R,NullspaceMat(m)[1]);
        g:=g*Lcm(List(g.coefficients,Denominator));
        if LeadingCoefficient(g)<0 then
          g:=-g;
        fi;
        gut:=gut+1;
      until Degree(g)*Degree(hp)=n;
      z:=f.integerTransformation;
      h:=Value(h,X(h.baseRing)*z);
      Add(decom,[g,h]);
    od;
    if Length(arg)=1 then
      decom:=decom[1];
    fi;
    return decom;
  else
    InfoPoly2("#I  primitive\n");
    return [];
  fi;
end;
