#############################################################################
##
#A  cdaggrp.g                   GAP library                Hans Ulrich Besche
##
#A  @(#)$Id: cdaggrp.g,v 3.5 1994/06/18 11:52:02 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
#H  $Log: cdaggrp.g,v $
#H  Revision 3.5  1994/06/18  11:52:02  sam
#H  added 'identifier' component
#H
#H  Revision 3.4  1994/03/21  08:09:43  sam
#H  replaced 'Coefficients' by 'CoefficientsInt'
#H
#H  Revision 3.3  1994/01/25  13:45:03  sam
#H  moved 'CharacterDegrees' to 'dispatch.g',
#H  changed one call of 'IntFFE'
#H
#H  Revision 3.2  1993/07/16  07:11:15  sam
#H  added function 'CharacterDegrees' (preliminary version)
#H
#H  Revision 3.1  1992/10/29  15:33:52  sam
#H  changed local function 'number'
#H
#H  Revision 3.0  1992/10/28  13:58:22  goetz
#H  initial revision under RCS
#H
##
##  This file contains the functions for calculating the degrees of the
##  irreducible characters above an algebraic closed filed of
##  characteristic zero or p of an arbitrary solvable group. The used
##  algorithm is from S. B. Conlon, published in the J. Symbolic
##  Computation (1990) 9, 551-570. This algorithm is generalized to
##  calculate the irreducible characters of a supersolvable group, using
##  an ideas like in the article from S.B. Conlon in the same journal
##  on the pages 535-550.
##

##  
##  The main theoretic tool for the algorithm is Clifford theory. One
##  recursive step of the algorithm will be discribed. Given are a solvable
##  group G, a central element z and the characteristic q of the used
##  algebraic closed filed F.  An hypothetical faithfull linear charakter
##  lambda of <z> is concerned. The character degrees (G,z,q) of those
##  irreducibles of G will be calculated, which restirict on <z> to a
##  multiple of lambda.
##  If G is abelian, the degrees could be computed imeaditly.
##  If G is not abelian, a normal subgroup N with the property that N/<z>
##    is a chief factor of G is choosen.
##    If N is not abelian, a subgroup L is calculated such that the
##      intersection of N and L is <z>, L centralizes N and NL=G. The order
##      of the chief factor N/<z> is a square r^2. The character degrees of
##      the (G,z,q) are the degrees of the (L,z,q), each multiplied with r.
##    If N is abelian, the size of N/<z> is a primepower p^i. P will be the
##      p-Sylowsubgroup of N. According to Clifford's theorem stabilizers S
##      and representatives for the orbits of G on those characters of P
##      which restirct to lambda|_P are calculated. For this purpose 3
##      cases for the structure of P must be differenciated.
##      If z is a p'-element the 1-character of P builds up one orbit.
##        The character degress of (G/P,zP,q) must be found.
##        The operation on the nontrivial characters of P is the dual
##        operation too the operation on the elementary abelian subgroup
##        (or vectorspace) P. For every representative the
##        kernel K must be found, and the degrees (S/K,zK,q) must
##        be calculated recursive. All those degrees will be returned.
##      In the next case P is cyclic and not of primeorder. Let y be a
##        generator of P. If y is central in G, p copies of the character
##        degrees of (G,zy,q) will be returned. Else the degrees of 
##        (C_G(y),zy,q) should be found, each multiplied by p and
##        returned.
##      Now P is not cyclic and z is no p'-element, the omega_1 O of P must
##        be found. As in the last case the dual operation too the
##        operation on O is needed. For every representative it must be
##        checked if it restricts to O as lambda|_O. For those which
##        restirct so the degrees (S/K,zK,q) are calculated and returned.
##


###########################################################################  
##
#F  con_col_list. . . . . . . . . . . . . . . . . . . . . . . . . . . local
##
##  returns the concatenation of two collected lists.
##
con_col_list := function(a,b)

    local d, p, i, j;

    d:=Union(List(a,x->[x[1],0]),List(b,x->[x[1],0]));
    for j in [a,b] do 
        p:=0;
        for i in j do
            repeat p:=p+1; until d[p][1]=i[1];
            d[p][2]:=d[p][2]+i[2];
            od;
        od;
    return d;
    end;



###########################################################################
##
#F  f2_orbit_priv . . . . . . . . . . . . . . . . . . . . . . . . . . local
##
##  returns the orbit and the stabilizer of an element under the linear
##  operation of the ag-generators gens on an F2-space.
##
f2_orbit_priv := function( gens, linear, elem )
    local orbit, torbit, stab, gen, orbpos, actor, pv, gn, p, i, j, k;


    orbit := [ elem ]; stab := []; pv := [ 1 ]; gn := [];
    for i in Reversed( [1..Length( gens )] ) do
        gen    := gens[i];
        orbpos := Position( orbit, elem * linear[i] );
        if orbpos = false then
            p := RelativeOrderAgWord( gen );
            Add( pv, pv[Length( pv )] * p );
            Add( gn, i );
            torbit := ShallowCopy( orbit );
            for j in [1..p-1] do
                for k in [1..Length( torbit )] do
                    torbit[k] := torbit[k] * linear[i];
                od;
                Append( orbit, torbit );
            od;
        elif orbpos = 1 then   Add( stab, gen );
        else
            actor  := gen^0;
            orbpos := orbpos - 1;
            j      := Length( pv ) - 1;
            while orbpos <> false and j > 0 do
                actor  := gens[gn[j]] ^ QuoInt( orbpos, pv[j] ) * actor;
                orbpos := orbpos mod pv[j];
                j      := j - 1;
            od;
            Add( stab, gen / actor );
        fi;
    od;
    return rec(
        orbit       := orbit,
        stabilizer  := Reversed( stab ));
    end;


###########################################################################
##
#F  f2_orbits_priv. . . . . . . . . . . . . . . . . . . . . . . . . . local
##
##  returns representatives and stabilizers of the linear operation of
##  the ag-generators on the f2-space.
##
f2_orbits_priv := function( gens, linear )
local space, reps, stabs, orb, v, w, next, number, element, plist, dim, fr;

    number := function( v )
    local i, r;
        r:=0;
        for i in [ 1 .. dim ] do 
          r := 2 * r + IntFFE( v[i] );
        od;
        return r;
        end;

    element := function( n )
    local i, c;
        return fr * CoefficientsInt( plist, n );
        end;

    fr := Z(2); dim := Length( linear[ 1 ]);
    plist := List( [1..dim], x -> 2 ); reps := []; stabs := [];
    space := BlistList( [1..2^dim-1], [] ); next := 1;
    while next <> false do
        v     := element( next );
        orb   := f2_orbit_priv( gens, linear, v );
        for w in orb.orbit do
            space[number( w )] := true;
        od;
        Add( reps, v );
        Add( stabs, orb.stabilizer );
        next := Position( space, false, next );
    od;
    return rec(
        representatives := reps,
        stabilizers     := stabs);
    end;


###########################################################################
##
#F  ls_orbit_priv . . . . . . . . . . . . . . . . . . . . . . . . . . local
##
##  returns the orbit and the stabilizer of an 1-dimensional subspace under
##  the linear operation of the ag-generators gens.
##
ls_orbit_priv := function( gens, linear, elem )
    local orbit, torbit, stab, gen, orbpos, actor, pv, gn, p, i, j, k,
        dim, normvector;

    normvector := function ( v )
    local i;

        for i in [1..dim] do
            if v[ i ] <> 0 * v[i] then
                return ( 1 / v[ i ]) * v;
                fi;
            od;
        end;
    
    dim := Length( elem ); elem := normvector( elem ); orbit := [ elem ];
    stab := []; pv := [ 1 ]; gn := [];
    for i in Reversed( [1..Length( gens )] ) do
        gen    := gens[i];
        orbpos := Position( orbit, normvector ( elem * linear[i] ));
        if orbpos = false then
            p := RelativeOrderAgWord( gen );
            Add( pv, pv[Length( pv )] * p );
            Add( gn, i );
            torbit := ShallowCopy( orbit );
            for j in [1..p-1] do
                for k in [1..Length( torbit )] do
                     torbit[k] := normvector ( torbit[k] * linear[i] );
                od;
                Append( orbit, torbit );
            od;
        elif orbpos = 1 then   Add( stab, gen );
        else
            actor  := gen^0;
            orbpos := orbpos - 1;
            j      := Length( pv ) - 1;
            while orbpos <> false and j > 0 do
                actor  := gens[gn[j]] ^ QuoInt( orbpos, pv[j] ) * actor;
                orbpos := orbpos mod pv[j];
                j      := j - 1;
            od;
            Add( stab, gen / actor );
        fi;
    od;
    return rec(
        orbit       := orbit,
        stabilizer  := Reversed( stab ));
    end;
    
    
###########################################################################
##
#F  ls_orbits_priv. . . . . . . . . . . . . . . . . . . . . . . . . . local
##
##  returns representatives and stabilizers of the linear operation of
##  the ag-generators on the the 1-dimensional subspaces.
##
ls_orbits_priv := function( gens, linear )
    local space, reps, stabs, orb, v, w, next, p, fr, 
        weightseq, number, element, plist, dim;
    number := function( v )
    local i, r, j;
    
        for i in [1..dim] do 
            if v[ i ] <> 0 * v[i] then
                r := 0;
                for j in [i+1..dim] do
                    r := p * r + IntFFE( v[ j ]);
                    od;
                return weightseq[ i ] + r;
                fi;
            od;
        end;

    element := function( n )
    local i, c;

        for i in [1..dim] do
            if n < weightseq [ i+1 ] then 
                c := CoefficientsInt( plist, n - weightseq[ i ]);
                c[ i ] := 1;
                return fr * c;
                fi;
            od;
        end;

    p      := CharFFE( linear[ 1 ][ 1 ][ 1 ]);
    fr     := linear[ 1 ][ 1 ][ 1 ]^0;
    dim    := Length( linear[ 1 ]);
    plist  := List( [1..dim], x -> p );
    weightseq := List([0..dim], x -> ( p^dim - p^( dim-x)) / ( p-1 ) + 1 );
    reps   := [];
    stabs  := [];
    space := BlistList( [1..weightseq[ dim ]], [] );
    next  := 1;
    while next <> false do
        v     := element( next );
        orb   := ls_orbit_priv( gens, linear, v );
        for w in orb.orbit do
            space[number( w )] := true;
        od;
        Add( reps, v );
        Add( stabs, orb.stabilizer );
        next := Position( space, false, next );
    od;
    return rec(
        representatives := reps,
        stabilizers     := stabs);
    end;



###########################################################################
##
#F  omega_1_priv( G ) . . . . . . . . . . . . . . . . . . . . . . . . local
##
##  G should be an abelian ag-representated p-group.
##
omega_1_priv := function(g)

    local    i, j, rel, rl, rc, ng, ml, mc, m, k, q, p;

    p:=RelativeOrder(g.generators[1]); ng:=Copy(Igs(g));
    # rel is the relation matrix of g
    rel:=List(ng,x->List(ng,function(y) if x=y then return p;
        else return 0; fi; end)-Exponents(g,x^p));
    # rl, rc are the remainding lines and columns of rel to be used
    rl:=[1..Length(ng)]; rc:=[1..Length(ng)];
    while Length(rl)>1 do
        # find empty column, find min entry
        m:=AbsInt(Maximum(rel[rl[1]]))+1;
        for i in rl do
            for j in rc do
                if rel[i][j] <> 0 and AbsInt(rel[i][j]) < m then
                    # rel[ml][mc] is minimal entry of rel
                    ml:=i; mc:=j; m:=AbsInt(rel[i][j]);
                    fi;
                od;
            od;
        while Maximum(List(Difference(rl,[ml]),x->AbsInt(rel[x][mc])))>0 do
            for i in Difference(rl,[ml]) do
                rel[i]:=rel[i]-QuoInt(rel[i][mc],rel[ml][mc])*rel[ml];
                od;    
            # find min entry
            m:=AbsInt(Maximum(rel[rl[1]]))+1;
            for i in rl do
                for j in rc do
                    if rel[i][j] <> 0 and AbsInt(rel[i][j]) < m then
                        # rel[ml][mc] is minimal entry of rel
                        ml:=i; mc:=j; m:=AbsInt(rel[i][j]);
                        fi;
                    od;
                od;
            od;
        for i in Difference(rc,[mc]) do
            q:=QuoInt(rel[ml][i],rel[ml][mc]);
            rel[ml][i]:=rel[ml][i]-q*rel[ml][mc]; ng[mc]:=ng[mc]*ng[i]^q;
            od;
        if Maximum(List(Difference(rc,[mc]),x->AbsInt(rel[ml][x])))=0 then
            SubtractSet(rl,[ml]); SubtractSet(rc,[mc]);
            fi;
        od;
    m:=[]; for i in ng do if i<>i^0 then Add(m,i^(Order(g,i)/p)); fi; od;
    return Subgroup(Parent(g),m);
    end;



###########################################################################
##
#F  kernel_priv_ag_char( U , v ). . . . . . . . . . . . . . . . . . . local
##
##  U is an elementary abelian aggroup. v is a vector in the dual space
##  of U. The kernel of v is returned.
##
kernel_priv_ag_char := function(n,v)

    local    gens, i, j, ig;

    # gens are the generators of the result
    gens:=[]; ig:=Igs(n);
    for i in Reversed([1..Length(v)]) do
        if v[i]=0*v[i] then
            Add(gens,ig[i]);
        else
            # i is the position of the last non zero entry of v
            for j in Reversed([1..i-1]) do
                Add(gens,ig[j]*ig[i]^(IntFFE(-v[j]/v[i])));
                od;
            return Subgroup(Parent(n),Reversed(gens));
            fi;
        od;
    end;



###########################################################################
##
#F  ProjectiveCharDegAgGroup( G , z , q ) . . . . . . . . . . . . . . . . .
#F  . . . . . . . . . . . . . . . . . . . degrees of irreducible characters
#F  .of G which restirct to a multiple of a faithfull irreducibles of < z >
##
##  rec(
##       degrees         := [ < integer > ],
##       multiplicity    := [ < integer > ] )
##
##  G must be an ag-group and z must be element of Z(G). There are no tests
##  after the call because of the recursive use of the function.
##  The function returns the character degress of those characters X of G,
##  so that X(z) = n * E(|z|), n an interger. q is the characteristic
##  of the algebraic closed field used.
##
ProjectiveCharDegAgGroup := function(G,z,q)

    local    oz, N, t, r, h, a, o, ti, k, c, ci, zn, i, p, P, O, L;

    oz:=Order(G,z);
    if IsAbelian(G) then
        i:=1;
        for k in Igs(G) do
            r:=RelativeOrderAgWord(k); if r<>q then i:=i*r; fi;
            od;
        return [[1,i/oz]];
        fi;
    # G is not abelian
    h:=NaturalHomomorphism(G,G/Subgroup(Parent(G),[z]));
    N:=ElementaryAbelianSeries(h.range); N:=N[Length(N)-1];
    if Length(N.cgs)>1 then
        N:=AgGroupOps.ChiefSeries(h.range,N); N:=N[Length(N)-1];
        fi;
    # N is normal subgroup such that N/<z> is a chieffactor of G
    N:=PreImage(h,N);
    # i=p^? is the order of this chieffactor
    i:=Size(N)/oz; p:=Factors(i)[1];
    if not IsAbelian(N) then
        h:=NaturalHomomorphism(G,G/Subgroup(Parent(G),[z]));
        # c is a list of complementclasses of N modulo z
        c:=List(Complementclasses(h.range,Image(h,N)),x->PreImage(h,x));
        r:=Centralizer(G,N);
        for L in c do
            if IsSubgroup(L,r) then
               # L is a complement to N in G modulo <z> which centralizes N
               r:=RootInt(Size(N)/oz);
               return
                   List(ProjectiveCharDegAgGroup(L,z,q),x->[x[1]*r,x[2]]);
               fi;
            od;
        Error("ProjectiveCharDegAgGroup: this should never appear");
        fi;
    # N is not ablelian, P is the sylow-p-subgroup of N
    if Set(FactorsInt(oz))=[p] then
        P:=N;
    else
        r:=Product(Filtered(FactorsInt(Size(N)),x->x<>p));
        P:=Subgroup(Parent(G),List(N.generators,x->x^r));
        fi;
    if p=q then
        # p is the characteristik of the used field, P is factored out.
        h:=NaturalHomomorphism(G,G/P);
        return ProjectiveCharDegAgGroup(h.range,Image(h,z),q);
        fi;
    if i=Size(P) then 
        # z is a p'-element, P is elementary abelian
        # first find the characters of the factorgroup needed
        h:=NaturalHomomorphism(G,G/P);
        r:=ProjectiveCharDegAgGroup(h.range,Image(h,z),q);
        if p=i then
            # P has order p
            zn:=P.generators[1]; t:=Stabilizer(G,zn);
            if t=G then i:=1; else i:=Size(G)/Size(t); fi;
            return con_col_list(r,List(ProjectiveCharDegAgGroup(t,zn*z,q),
                x->[x[1]*i,x[2]*(p-1)/i]));
            fi;
        # P has order p^i > p
        # a discribes the contragardient operation of G on P
        a:=List(Igs(G),x->TransposedMat(List(Igs(P),
            y->Exponents(P,y^(x^-1)))*Z(p)^0));
        if p=2 then
            o:=f2_orbits_priv(Igs(G),a);
        else
            o:=ls_orbits_priv(Igs(G),a);
            fi;
        o.stabilizers:=List(o.stabilizers,x->Subgroup(Parent(G),x));
        for i in [1..Length(o.representatives)] do
            # k is the kernel of the character
            k:=kernel_priv_ag_char(P,o.representatives[i]);
            h:=NaturalHomomorphism(o.stabilizers[i],o.stabilizers[i]/k);
            # zn is an element of h.range, |Image(h,P)|=p
            zn:=Image(h,P).generators[1]*Image(h,z);
            # c is stabilizer of the character, ci is the number of
            # orbits of characters with equal kernels
            if p=2 then
                c:=h.range; ci:=1;
            else
                c:=Stabilizer(h.range,zn); ci:=Size(h.range)/Size(c);
                fi;
            k:=Size(G)/Size(o.stabilizers[i])*ci;
            r:=con_col_list(r,List(ProjectiveCharDegAgGroup(c,zn,q),
                x->[x[1]*k,x[2]*(p-1)/ci]));
            od;
        return r;
        fi;
    if IsCyclic(P) then
        # |P| > p, zn is a generator of P
        zn:=Igs(P)[1]; t:=Stabilizer(G,zn);
        if G=t then
            # P is a central subgroup of G
            return
                List(ProjectiveCharDegAgGroup(G,zn*z,q),x->[x[1],x[2]*p]);
            fi;
        # P is not central in G
        return List(ProjectiveCharDegAgGroup(t,zn*z,q),x->[x[1]*p,x[2]]);
        fi;
    # P is the direct product of the sylow-p-subgroup of z and a elementary
    # abelian subgroup
    O:=omega_1_priv(P); Cgs(O);
    # zn is a generator of the intersection of <z> and O
    zn:=z^(oz/p); r:=[];
    a:=List(Igs(G),
            x->TransposedMat(List(O.cgs,y->Exponents(O,y^(x^-1)))*Z(p)^0));
    if p=2 then
        o:=f2_orbits_priv(Igs(G),a);
    else
        o:=ls_orbits_priv(Igs(G),a);
        fi;
    # in this case the stabilzers of the kernels are allready the
    # stabilizers of the characters
    for i in [1..Length(o.representatives)] do
        k:=kernel_priv_ag_char(O,o.representatives[i]);
        if not zn in k then
            # the kernel avoids zn
            t:=Subgroup(Parent(G),o.stabilizers[i]);
            h:=NaturalHomomorphism(t,t/k);
            t:=Size(G)/Size(t);
            r:=con_col_list(r,List(ProjectiveCharDegAgGroup(h.range,
                Image(h,z),q),x->[x[1]*t,x[2]]));
            fi;
        od;
    return r;
    end;



###########################################################################
##
#F  CharDegAgGroup( G {, q }) . . . . . . . .character degress of aggroup G
##
##  rec(
##       degrees         := [ < integer > ],
##       multiplicity    := [ < integer > ] )
##
##  The G must be an ag-group. The character degress of G are returned.
##  The used field has characteristic q.
##
##  Just those cases of the algorithm of ProjektiveCharDeg are
##  needed, which can apear if z is trivial. Especialy N is elementary
##  abelian.
##
CharDegAgGroup := function(arg)

    local    r, p, a, o, i, k, c, ci, z, t, h, N, G, q;

    if not IsAgGroup(arg[1]) or Length(arg)>2 or 
        (Length(arg)=2 and not (IsInt(arg[2]) and
        (IsPrime(arg[2]) or arg[2]=0))) then
        Error("usage: CharDegAgGroup( ag-group )\n",
              "       CharDegAgGroup( ag-group, prime )\n");
        fi;
    G:=arg[1]; if Length(arg)=2 then q:=arg[2]; else q:=0; fi;
    if IsAbelian(G) then
        i:=1;
        for k in Igs(G) do
            r:=RelativeOrderAgWord(k); if r<>q then i:=i*r; fi;
            od;
        return [[1,i]];
        fi;
    # N is just a normal elementary abelian subgroup, may be not 
    # minimal. N is a p-group.
    N:=ElementaryAbelianSeries(G); N:=N[Length(N)-1];
    p:=RelativeOrderAgWord(N.cgs[1]); r:=CharDegAgGroup(G/N,q);
    # N may be a q-group
    if p=q then return r; fi;
    if Size(N)=p then
        z:=N.cgs[1]; t:=Stabilizer(G,z); i:=Size(G)/Size(t);
        r:=con_col_list(r,List(ProjectiveCharDegAgGroup(t,z,q),x->[x[1]*i,
            x[2]*(p-1)/i]));
        if q=0 then G.characterDegrees:=r; fi; return r;
        fi;
    # N is elementary abelian of order p^? > p
    a:=List(Igs(G),
        x->TransposedMat((List(N.cgs,y->Exponents(N,y^x))*Z(p)^0)^-1));
    if p=2 then
        o:=f2_orbits_priv(Igs(G),a);
    else
        o:=ls_orbits_priv(Igs(G),a);
        fi;
    o.stabilizers:=List(o.stabilizers,x->Subgroup(Parent(G),x));
    for i in [1..Length(o.representatives)] do
        k:=kernel_priv_ag_char(N,o.representatives[i]);
        h:=NaturalHomomorphism(o.stabilizers[i],o.stabilizers[i]/k);
        # |stabilizers[i]/k| = p
        z:=Image(h,N).generators[1];
        if p=2 then
            c:=h.range; ci:=1;
        else
            c:=Stabilizer(h.range,z); ci:=Size(h.range)/Size(c);
            fi;
        k:=Size(G)/Size(o.stabilizers[i])*ci;
        r:=con_col_list(r,List(ProjectiveCharDegAgGroup(c,z,q),x->
            [x[1]*k,x[2]*(p-1)/ci]));
    od;
    if q=0 then G.characterDegrees:=r; fi; return r;
    end;


###########################################################################
##
#F  char_sec_prev( hom , l ). . . . . . . . . . . . . . . . . . . . . local
##
char_sec_prev := function(hom,l)

    local r, x;

    r:=[];
    for x in l do
            Add(r,[PreImage(hom,x[1]),PreImage(hom,x[2]),
            PreImagesRepresentative(hom,x[3])]);
        od;
    return r;
    end;



###########################################################################
##
#F  char_sec( G , z ) . . . . . . . . . . . . . . . . . . . . . . . . local
##
##  G must be an supersolvable ag-group and z must be element of Z(G).
##  The function returns a list of tripels [T, K, e], so that every
##  irreducible character X of G with the property  that X(z) = n * E(|z|)
##  for an arbitrary interger n is the induced of a linear character of
##  some T with kernel K. The element e is choosen so that <eK> is
##  generating T/K.
##
##  The algorithm used is the same as in ProjektiveCharDeg, but the 
##  recursion stops just if G=<z>. The structure and the names of the
##  variables are the same.
char_sec := function(G,z)

    local    oz, N, t, r, h, a, o, ti, k, c, ci, zn, i, p, P, O;

    # the 1-character will be found more easy
    if Size(G)=1 then return []; fi;
    oz:=Order(G,z);
    if Size(G)=oz then return [[G,Subgroup(Parent(G),[]),z]]; fi;
    h:=NaturalHomomorphism(G,G/Subgroup(Parent(G),[z]));
    N:=ElementaryAbelianSeries(h.range); N:=N[Length(N)-1];
    if Length(N.cgs)>1 then
        N:=AgGroupOps.ChiefSeries(h.range,N); N:=N[Length(N)-1];
        fi;
    N:=PreImage(h,N);
    if not IsAbelian(N) then
        Print("#W: CharTableSSGroup, not all characters found\n");
        return [];
        fi;
    i:=Size(N)/oz; p:=Factors(i)[1];
    if Set(FactorsInt(oz))=[p] then
        P:=N;
    else
        r:=Product(Filtered(FactorsInt(Size(N)),x->x<>p));
        P:=Subgroup(Parent(G),List(N.generators,x->x^r));
        fi;
    if i=Size(P) then 
        h:=NaturalHomomorphism(G,G/P);
        r:=char_sec_prev(h,char_sec(h.range,Image(h,z)));
        if p=i then
            zn:=P.generators[1];
            return Concatenation(r,char_sec(Stabilizer(G,zn),zn*z));
            fi;
        a:=List(Igs(G),
            x->TransposedMat((List(Igs(P),y->Exponents(P,y^x))*Z(p)^0)^-1));
        if p=2 then o:=f2_orbits_priv(Igs(G),a);
        else o:=ls_orbits_priv(Igs(G),a);
            fi;
        o.stabilizers:=List(o.stabilizers,x->Subgroup(Parent(G),x));
        for i in [1..Length(o.representatives)] do
            k:=kernel_priv_ag_char(P,o.representatives[i]);
            h:=NaturalHomomorphism(o.stabilizers[i],o.stabilizers[i]/k);
            zn:=Image(h,P).generators[1]*Image(h,z);
            if p=2 then c:=h.range;
            else c:=Stabilizer(h.range,zn);
                fi;
            r:=Concatenation(r,char_sec_prev(h,char_sec(c,zn)));
            od;
        return r;
        fi;
    if IsCyclic(P) then
        zn:=Igs(P)[1]; return char_sec(Stabilizer(G,zn),zn*z);
        fi;
    O:=omega_1_priv(P); Cgs(O); zn:=z^(oz/p); r:=[];
    a:=List(Igs(G),
            x->TransposedMat((List(O.cgs,y->Exponents(O,y^x))*Z(p)^0)^-1));
    if p=2 then
        o:=f2_orbits_priv(Igs(G),a);
    else
        o:=ls_orbits_priv(Igs(G),a);
        fi;
    for i in [1..Length(o.representatives)] do
        k:=kernel_priv_ag_char(O,o.representatives[i]);
        if not zn in k then
            t:=Subgroup(Parent(G),o.stabilizers[i]);
            h:=NaturalHomomorphism(t,t/k);
            r:=Concatenation(r,char_sec_prev(h,char_sec(
                h.range,Image(h,z))));
            fi;
        od;
    return r;
    end;



###########################################################################
##
#F  CharTableSSGroup( G ) . . . .character table of supersolvable aggroup G
##
##  This function calculates the character table of a supersolvable 
##  ag-represented group. It is not used as default algorithm. For every 
##  character in the table the information from which linear character of
##  which subgroup this monomial character is induced is written to the
##  '<t>.irredinfo[i].inducedFrom'. The linear charakter is discribed by
##  the subgroup its induced from and the kernel it has.
##
##  For this purpose first the head of the character table is calculated.
##  Then the function char_sec gives a list of triples discribing linear
##  representations of subgroups of G. These linear representations will
##  be induced to G, and evaluated on representatives of the conjugacy
##  classes. 
##
CharTableSSGroup := function( g )

    local ecs, evl, ct, i, t, ni, j, mat, k, cgs, sec, hom, zi, oz,
        ee, zp, co, dim, rep, bco, p, r, pecs, pl, mulmoma, i1, re;

    # function returns the product of 2 monomial matrices
    mulmoma:=function(a,b)
    re:=rec(perm:=[],diag:=[]);
    for i1 in [1..Length(a.perm)] do
        re.perm[i1]:=b.perm[a.perm[i1]];
        re.diag[b.perm[i1]]:=(b.diag[b.perm[i1]]+a.diag[i1]) mod oz;
        od;
    return re;
    end;


    ecs:=ConjugacyClasses(g); evl:=[];
    cgs:=Cgs(g); dim:=Length(ecs); pecs:=[];

    ct:= rec( size:= Size(g),
              classes:= List(ecs,Size),
              powermap:=[],
              operations:=CharTableOps,
              group:=g,
              irreducibles:=[[1..Length(ecs)]*0+1],
              orders:=List(ecs,x->Order(g,x.representative)),
              irredinfo:=[rec(inducedFrom:=rec(subgroup:=g,kernel:=g))]);

    ct.order:= ct.size;

    # evl will be list discribing the representatives of the conjugacy
    # classes. If e=g.1^2*g.2^0*g.3^1, then eval will be
    # [ ... , [ 1, 1, 3 ], ... ]
    for i in [2..dim] do
        k:=Exponents(g,ecs[i].representative); t:=[];
        for j in [1..Length(k)] do
            if k[j]>0 then Append(t,[1..k[j]]*0+j); fi;
            od;
        Add(evl,t);
        od;
    ct.centralizers:=List(ct.classes,x->ct.size/x);

    if   IsBound(g.name) then
      ct.identifier:= g.name;
    elif IsBound(Parent(g).name) then
      ct.identifier:=Parent(g).name;
      for k in g.generators do
        ct.identifier:= ConcatenationString(ct.identifier,"_",String(k));
      od;
    else
      ct.name:="";
    fi;
    ct.name:= ct.identifier;

    pl:= Set( FactorsInt( ct.size ) );
    for i in pl do
        ct.powermap[i]:=[];
        for j in ecs do
            Add(pecs,j.representative^i);
            od;
        od;
    pecs:=AgGroupOps.ConjugacyClasses(g,pecs);
    for i in [1..Length(pl)] do
        for j in [1..dim] do
            r:=pecs[(i-1)*dim+j].representative;
            k:=0; repeat k:=k+1; until r=ecs[k].representative;
            Add(ct.powermap[pl[i]],k);
            od;
        od;
    for sec in char_sec(g,g.identity) do
        hom:=NaturalHomomorphism(sec[1],sec[1]/sec[2]);
        zi:=Image(hom,sec[3]); oz:=Order(hom.range,zi); ee:=E(oz);
        zp:=List([1..oz],x->zi^x);
        co:=Cosets(g,sec[1]);
        dim:=Length(co);
        # rep is a representation from the right on a module with a base
        # being a transversal of the stabilizer in g. The monomial matrices
        # used are the same as in the function RepresentationsPGroup
        rep:=[];
        for i in cgs do
            mat:=rec(perm:=[],diag:=[]);
            for j in [1..dim] do
                bco:=co[j]*i;
                p:=Position(co,bco);
                Add(mat.perm,p);
                mat.diag[p]:=Position(zp,Image(hom,co[j].representative*i*
                    co[p].representative^-1));
                od;
            Add(rep,mat);
            od;
        # ni get the irreducible
        ni:=[dim];
        for j in evl do
            mat:=Iterated(List(j,x->rep[x]),mulmoma); t:=0;
            for k in [1..Length(mat.diag)] do
                if mat.perm[k]=k then 
                   t:=t+ee^mat.diag[k];
                   fi;
                od;
                Add(ni,t);
            od;
        # test if ni is known and and ni and its galios-conjugates to the
        # table
        if not ni in ct.irreducibles then
            i:=GaloisMat([ni]).mat;
            Append(ct.irreducibles,i);
            # write information in .irredinfo
            for j in i do
                if sec[1]=g then
                    Add(ct.irredinfo,rec(inducedFrom:=rec(subgroup:=g,
                        kernel:=Subgroup(Parent(g),sec[2].generators))));
                else
                    Add(ct.irredinfo,rec(inducedFrom:=
                    rec(subgroup:=Subgroup(Parent(g),sec[1].generators),
                        kernel:=Subgroup(Parent(g),sec[2].generators))));
                    fi;
                od;
            fi;
        od;
    return ct;
    end;

