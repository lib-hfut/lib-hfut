#############################################################################
##
#A  ctpgrp.g                    GAP library                Hans-Ulrich Besche
##
#A  @(#)$Id: ctpgrp.g,v 3.23 1994/06/18 12:02:17 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains those functions which calculate the irreducible
##  representaions and characters of supersolvable ag-groups with the 
##  algorithm published by Ulrich Baum, University of Bonn, Germany, 1991
##
#H  $Log: ctpgrp.g,v $
#H  Revision 3.23  1994/06/18  12:02:17  sam
#H  fixed 'order' component
#H
#H  Revision 3.22  1994/04/21  12:09:22  sam
#H  introduced 'identifier' component
#H
#H  Revision 3.21  1994/02/15  17:13:31  sam
#H  moved 'FusionConjugacyClasses' to 'group.g'
#H
#H  Revision 3.20  1994/02/02  09:15:06  sam
#H  moved dispatcher 'SupersolvableResiduum' to 'dispatch.g',
#H  'AgGroupOps.SupersolvableResiduum' to 'aggroup.g'
#H
#H  Revision 3.19  1993/07/16  07:09:02  sam
#H  improved 'FusionConjugacyClasses'
#H
#H  Revision 3.18  1993/03/25  16:15:55  sam
#H  fixed bad bug in 'RepresentationsPGroup'
#H
#H  Revision 3.17  1992/09/28  11:18:24  hbesche
#H  fixed a bug.
#H
#H  Revision 3.16  1992/09/14  11:56:56  hbesche
#H  Added some more comments
#H
#H  Revision 3.15  1992/09/09  15:25:32  hbesche
#H  added some comments
#H
#H  Revision 3.14  1992/08/06  13:21:21  hbesche
#H  minor changes
#H
#H  Revision 3.13  1992/07/15  09:53:16  hbesche
#H  minor changes
#H
#H  Revision 3.12  1992/05/27  13:49:46  hbesche
#H  Added posibility to surpress warnings in 'CharTablePGroup'
#H
#H  Revision 3.11  1992/05/25  14:28:01  hbesche
#H  fixed a bug in 'SupersolvableResiduumAgGroup'
#H
#H  Revision 3.10  1992/04/07  16:15:32  jmnich
#H  adapted to changes in the finite field module
#H
#H  Revision 3.9  1992/03/11  00:25:27  hbesche
#H  Added dispatcher 'SupersolvableResiduum'
#H
#H  Revision 3.8  1992/03/08  14:46:35  hbesche
#H  find the maximal factorgroup useable with the algorithm automaticaly
#H
#H  Revision 3.7  1992/03/04  18:43:53  hbesche
#H  some problems with finding the correct normal subgroup
#H
#H  Revision 3.6  1992/03/03  20:46:19  hbesche
#H  'FusionConjugacyClasses' should work even if there are no '.charTable'
#H
#H  Revision 3.5  1992/03/02  13:50:27  hbesche
#H  fixed some bugs
#H
#H  Revision 3.4  1992/02/17  12:53:40  hbesche
#H  the first parameter of subgroup should be a parent group
#H
#H  Revision 3.3  1992/02/13  15:09:23  hbesche
#H  Use Size and ConjugacyClasses instead of AgGroupOps. ...
#H
#H  Revision 3.2  1992/02/13  14:04:14  hbesche
#H  Hack in powermap to avoid an error in AreConjugated.
#H
#H  Revision 3.1  1992/02/10  10:25:39  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  RepresenatationsPGroup(G) . irr. representations of a supersolvable group
##
##  The matrices for the monomial representations are discribed as a record 
##  with entries perm and diag. E.g. the matrix (perm:=[3,1,2],diag:=[1,2,3])
##  is the product of 
##  [ . , . , 1 ]     [  Ee^1 ,   .   ,   .   ]   [   .   ,   .   ,  Ee^3 ]
##  [ 1 , . , . ]  *  [   .   ,  Ee^2 ,   .   ] = [  Ee^1 ,   .   ,   .   ]
##  [ . , 1 , . ]     [   .   ,   .   ,  Ee^3 ]   [   .   ,  Ee^2 ,   .   ]
##  where Ee:=E(g.exponent). If g.exponent is unknown then
##  Ee is E(Size(g)). The Representations are returned in a record with the
##  components exponent, lin for the list of linear representations and 
##  nonlin for the nonlinear representations. The linear representations are
##  given as the list of exponents of E(exponent) on the igs, the nonlinear
##  as matrices on the igs as discribed above.
##
##  This function is able to compute the representations of a solvable group
##  if it has an abelian normal subgroup with supersolvable factorgroup.
##  If the supersolvable residuum of the group is not abelian, the 
##  algorithm is applied to the factorgroup of g to the commutator subgroup
##  of the supersolvable residuum of g.
##
##  For this purpose a composition series of g is used, such that the 
##  maximal abelian and all nonabelian composition subgroups are normal.
##  Along this series increasing the representations of the composition
##  subgroups are calculated knowing the representations of the subgroup
##  below.
##
##  These representations have the property, that on every subgroup below
##  they restrict to a direct sum of irreducible representations, and
##  if two irreducible components are similar, they are allready equal.
##
##  For the computation of the representation of the subgroup G using
##  those of the subgroup N below the theorem of clifford is used. The
##  index [G:N] is prime, so for every representation F of N the induced
##  representation is irreducible or N could be extended to G in p
##  different ways.
##
##  In the first case the representation will be induced in the usall way.
##  If the induced representation is restricted to N again, it is the sum
##  of all the conjugates of R under the operation of G. For every conjugate
##  the equivalent representative from the list of representations of N
##  is found, and the induced of R is modified such that it restricts to
##  the direct sum of the representatives.
##
##  In the other case some matrix must be found which operates on R like
##  an element g form G\N. Modified by scalar matrices this matrix can
##  be used to construct the p different extensions.
##
##  For both purposes an algorithm is needed which tests (recursive)
##  wheather two representations F and D of the subgroups are equivalent,
##  and, if they are, returns a conjugating matrix. Therefore F and D should
##  be a representation of G. N should be the smaller composition subgroup
##  of primindex p. 
##  
##  If F and D are linear representation the recursion stops and the
##  representations are equivalent if they are equal.
##
##  If they are not linear, it is tested by locking at their permutation
##  structure if their restrictions to N are irreducible or not.
##
##  If both restrictions are irreducible, this test is recursive applied
##  to the restrictions. If they are irreducible, a conjugating matrix is
##  returned and it has just to be tested, if this matrix conjugates F
##  and D.
##
##  If both restrictions are reducible, pairs of equivalent irreducible
##  components of the restrictions are searched recursiv. The conjugation
##  matrix will be combinated from the permutation matrix of the conponents
##  and those conjugating matrices which transform the single components.
##
RepresentationsPGroup := function(arg)

    local   mulmoma, opmoma, poweval, conrep, conlinrep, contest, isredrep,
        liftreps, liftlinreps, liftrepsab, liftlinrepsab,
        i, j, exp, replist, linreplist, coli, poli, lg, gexps, expl, igs,
        flag, s, cs, ssr, hom, iso, t, k, g, rep,
        i1, i2, i3, r, rr, rrr, aip, aid, bap, bad;

    # mulmoma returns the product of 2 monomial matrices
    mulmoma:=function(a,b)
    r:=rec(perm:=[],diag:=[]);
    for i1 in [1..Length(a.perm)] do
        r.perm[i1]:=b.perm[a.perm[i1]];
        r.diag[b.perm[i1]]:=(b.diag[b.perm[i1]]+a.diag[i1]) mod exp;
        od;
    return r;
    end;

    # opmoma returns a^-1*b*a for monomial matrices
    opmoma:=function(b,a)
    aip:=[]; aid:=[]; bap:=[]; bad:=[];
    for i1 in [1..Length(a.perm)] do
        aip[a.perm[i1]]:=i1; aid[i1]:=exp-a.diag[a.perm[i1]];
        bad[a.perm[i1]]:=a.diag[a.perm[i1]]+b.diag[i1];
        bap[i1]:=a.perm[b.perm[i1]];
    od;
    r:=rec(perm:=[],diag:=[]);
    for i1 in [1..Length(a.perm)] do
        r.perm[i1]:=bap[aip[i1]];
        r.diag[bap[i1]]:=(bad[bap[i1]]+aid[i1]) mod exp;
    od;
    return r;
    end;

    # poweval evalutes the representation rep on the p-th power of
    # the conjugating element. The p-th power of this element is discribed
    # by poli
    poweval:=function(rep)
    if poli=[] then
        return rec( perm:=[1..Length(rep[1].perm)],
                    diag:=[1..Length(rep[1].perm)]*0);
    fi;
    if Length(poli)=1 then return Copy(rep[poli[1]]); fi;
    rr:=mulmoma(rep[poli[1]],rep[poli[2]]);
    for i2 in [3..Length(poli)] do rr:=mulmoma(rr,rep[poli[i2]]); od;
    return rr;
    end;

    # conrep returns the conjugate representation of rep.
    # The operation on rep is discribed by coli
    conrep:=function(rep)
    rr:=[];
    for i2 in coli do
        rrr:=rep[i2[1]];
        for i3 in [2..Length(i2)] do rrr:=mulmoma(rrr,rep[i2[i3]]); od;
        Add(rr,rrr);
        od;
    return rr;
    end;

    # conlinrep does the same like conrep for a linear representation
    conlinrep:=function(rep)
    r:=[];
    for i1 in coli do
        rr:=rep[i1[1]];
        for i2 in [2..Length(i1)] do
            rr:=rr+rep[i1[i2]];
            od;
            Add(r,rr mod exp);
        od;
    return r;
    end;

    # test if the restriction of the representation rep is reducible
    isredrep:=function(rep,rp,b,p)
    for i1 in [rp..Length(rep)] do
        for i2 in [1..p]*b do
            for i3 in [i2-b+1..i2] do
                if rep[i1].perm[i3]>i2 then return false; fi;
                od;
            od;
        od;
    return true;
    end;

    # contest tests whether r1 and r2 are conjugate representations.
    # If it is so, the function returns a conjugating matrix.
    # r1 and r2 must have the same degree and be nonlinear
    contest:=function(r1,r2)
    local   i, j, d, b, p, rp, Ap, flag, rr, rrr,
        c, B, P, PP, X, XX, zr1, zr2, rr2, rrr2;
    # d is the degree of the representations
    d:=Length(r1[1].perm);
    # check if r1=r2 for time improvement
    if r1=r2 then return rec(perm:=[1..d],diag:=[1..d]*0); fi;
    # search for maximal composition subgroup so that r1 and r2 are
    # reducible
    rp:=1; flag:=false;
    repeat
        rp:=rp+1; p:=gexps[lg-Length(r1)+rp-1]; b:=d/p;
        if IsInt(b) then
            if not isredrep(r1,rp,b,p) then
                if isredrep(r2,rp,b,p) then return false; fi;
                # if one of representations is reducible and the other
                # is not, they aren't equivalent
            else
                if not isredrep(r2,rp,b,p) then
                    return false;
                else flag:=true;
                    fi;
                fi;
            fi;
    until flag;
    # zr1 and zr2 will be lists of the irreducible components of r1 and r2
    zr1:=[]; zr2:=[];
    for i1 in [0..p-1]*b do
        rr:=[]; rr2:=[];
        for i2 in [rp..Length(r1)] do
            rrr:=rec(perm:=[],diag:=[]); rrr2:=rec(perm:=[],diag:=[]);
            for i3 in [i1+1..i1+b] do
                Add(rrr.perm,r1[i2].perm[i3]-i1);
                Add(rrr.diag,r1[i2].diag[i3]);
                Add(rrr2.perm,r2[i2].perm[i3]-i1);
                Add(rrr2.diag,r2[i2].diag[i3]);
            od;
            Add(rr,rrr); Add(rr2,rrr2);
        od;
        Add(zr1,rr); Add(zr2,rr2);
    od;
    # X is a list of those matrices conjugating the pairs of
    # irreducible components, PP discribes the permutation on the set
    # of components
    X:=[]; PP:=rec(perm:=[],diag:=[1..d]*0);
    if b=1 then
        # the irreducible components are linear
        for i in [1..p] do
            j:=Position(zr2,zr1[i]);
            # linear representations are equivalient if they are equal
            if j=false then return false; fi;
            # if their is a component which has no equivalent partner,
            # then r1 and r2 aren't equivalent
            Add(X,rec(perm:=[1],diag:=[0])); Add(PP.perm,j);
        od;
    else
        # the irreducible components aren't linear
        # searching for pairs of equivalent components
        P:=[1..p];
        for i in [1..p] do
            flag:=true;
            for j in P do
                if flag then 
                    c:=contest(zr1[i],zr2[j]);
                    if c<>false then
                        RemoveSet(P,j); Add(X,c); flag:=false;
                        Append(PP.perm,[(j-1)*b+1..j*b]);
                    fi;
                fi;
            od;
            # zr1[i] is not equivalent to any zr2[j]
            if flag then return false; fi;
        od;
    fi;
    # find coefficients for the X[i] and construct conjugating matrix
    j:=Copy(PP.perm); for i in [1..d] do PP.perm[j[i]]:=i; od;
    P:=opmoma(r2[rp-1],PP); XX:=Copy(X[1]); c:=0;
    for i in [1..p-1] do
        Ap:=r1[rp-1].perm[i*b+1]-(i-1)*b; B:=rec(perm:=[],diag:=[]);
        for j in [(i-1)*b+1..i*b] do
            Add(B.perm,P.perm[j+b]-(i-1)*b); Add(B.diag,P.diag[j]);
        od;
        c:=c+mulmoma(B,X[i]).diag[Ap]-r1[rp-1].diag[Ap+(i-1)*b]
            -X[i+1].diag[1];
        Append(XX.perm,X[i+1].perm+b*i); Append(XX.diag,X[i+1].diag+c);
    od;
    XX:=mulmoma(PP,XX);
    for i in [1..rp-2] do if opmoma(r2[i],XX)<>r1[i] then return false; fi; od;
    return XX;
    end;

    # liftreps does one iterativ step by constructing all representations
    # of the next composition subgroup which arise from nonlinear
    # representations
    liftreps:=function(replist)
    local   i, j, k, p, dim, d, used, flag, rep, con, result, D, g, c, X, r;
    p:=gexps[lg-Length(replist[1])];
    # used is a list mentioning all those representations which have be 
    # used for the construction
    used:=BlistList([1..Length(replist)],[]); result:=[]; d:=1;
    while d<>false do
        used[d]:=true; rep:=replist[d]; con:=conrep(rep); g:=poweval(rep);
        c:=contest(rep,con);
        if c<>false then
            # rep can be extended in p different ways, c is a operating
            # matrix
            j:=mulmoma(c,c); for k in [3..p] do j:=mulmoma(c,j); od;
            j:=j.diag[1]+g.diag[g.perm[1]]; r:=rec(perm:=[],diag:=[]);
            # r:=c^-1
            for k in [1..Length(c.perm)] do
                r.perm[c.perm[k]]:=k; r.diag[k]:=exp-c.diag[c.perm[k]];
            od;
            # adjust r by a scalar and contruct the p extensions
            for k in (j/p)+[0..p-1]*(exp/p) do
                X:=[]; for i in r.diag do Add(X,(i+k) mod exp); od;
                Add(result,Concatenation([rec(perm:=r.perm,diag:=X)],rep));
            od;
        else
            # rep could not be extended
            dim:=Length(rep[1].diag); D:=Copy(rep); r:=(p-1)*dim;
            X:=rec(perm:=[1..dim],diag:=[1..dim]*0);
            # search for the representatives of the G-conjugates of rep
            for j in [1..p-1]*dim do
                flag:=false; i:=1;
                repeat
                    if (not used[i]) and
                        (Length(con[1].perm)=Length(replist[i][1].perm)) then
                        c:=contest(replist[i],con);
                        if c<>false then
                            Append(X.diag,c.diag); Append(X.perm,c.perm+j);
                            for k in [1..Length(rep)] do
                                Append(D[k].diag,replist[i][k].diag);
                                Append(D[k].perm,replist[i][k].perm+j);
                            od;
                            # theese representatives are used
                            used[i]:=true; flag:=true;
                        fi;
                    fi;
                    i:=i+1;
                until flag;
                if j<>r then con:=conrep(con); fi;
            od;
            Add(result,Concatenation([opmoma(rec(perm:=Concatenation(g.perm+r,
                [1..r]),diag:=Concatenation([1..r]*0,g.diag)),X)],D));
        fi;
        d:=Position(used,false,d);
    od;
    return result;
    end;

    # liftrepsab does the same like liftreps if the operation is trivial
    liftrepsab:=function(replist)
    local   result, rep, p, k, o;
    p:=gexps[lg-Length(replist[1])]; result:=[];
    for rep in replist do
        o:=[1..Length(rep[1].perm)]*0;
        for k in (poweval(rep).diag[1]/p)+[0..p-1]*(exp/p) do
            Add(result,Concatenation([rec(perm:=
                [1..Length(rep[1].perm)],diag:=o+k)],rep));
        od;
    od;
    return result;
    end;

    # liftlinreps does the same like liftreps for linear represenations
    liftlinreps:=function(replist)
    local   i, j, k, d, p, pot, rep, con, used, lin, nonlin, D; 
    used:=BlistList([1..Length(replist)],[]); lin:=[]; nonlin:=[]; d:=1;
    p:=gexps[lg-Length(replist[1])];
    while d<>false do
        rep:=replist[d]; used[d]:=true; con:=conlinrep(rep);
        if poli=[] then
            pot:=0;
        else
            pot:=rep[poli[1]];
            for i in [2..Length(poli)] do pot:=pot+rep[poli[i]]; od;
            pot:=pot mod exp;
        fi;
        if con=rep then 
            for i in (pot/p)+[0..p-1]*(exp/p) do
                Add(lin,Concatenation([i],rep));
            od;
        else
            D:=[];
            for i in rep do Add(D,rec(perm:=[1..p],diag:=[i])); od;
            for j in [2..p] do
                i:=Position(replist,con);
                for k in [1..Length(rep)] do Add(D[k].diag,replist[i][k]); od;
                used[i]:=true;
                if j<>p then con:=conlinrep(con); fi;
            od;
            Add(nonlin,Concatenation([rec(perm:=Concatenation([p],
                [1..p-1]),diag:=Concatenation([1..p-1]*0,[pot]))],D));
        fi;
        d:=Position(used,false,d);
    od;
    return rec(lin:=Set(lin),nonlin:=nonlin);
    end;

    # liftlinrepsab ...
    liftlinrepsab:=function(replist)
    local   i, p, pot, rep, result;
    result:=[]; p:=gexps[lg-Length(replist[1])];
    if poli=[] then
        pot:=[0..p-1]*(exp/p);
        for rep in replist do
            for i in pot do Add(result,Concatenation([i],rep)); od;
        od;
    else
        for rep in replist do
            pot:=rep[poli[1]];
            for i in [2..Length(poli)] do pot:=pot+rep[poli[i]]; od;
            pot:=pot mod exp;
            for i in (pot/p)+[0..p-1]*(exp/p) do
                Add(result,Concatenation([i],rep));
            od;
        od;
    fi;
    return result;
    end;


    # main procedure
    g:=arg[1];
    lg:=Length(Igs(g)); i:=1; igs:=Igs(g); cs:=CompositionSeries(g);
    if IsBound(g.exponent) then exp:=g.exponent; else exp:=Size(g); fi;
    # test and adjust the composition series
    for i in [2..Length(cs)-1] do
        if not (IsNormal(g,cs[i]) or IsAbelian(cs[i-1])) then
            # the composition series of g is not suitable for the algorithm
            replist:=[]; linreplist:=[]; expl:=[];
            ssr:=SupersolvableResiduum(g);
            hom:=NaturalHomomorphism(g,g/DerivedSubgroup(ssr));
            if ( Size(hom.kernel)>1 and Length(arg)=1 ) then
    Print("#W  RepresentationsPGroup:not all representations known\n");
                fi;
            iso:=IsomorphismAgGroup(ElementaryAbelianSeriesThrough(
                List(g.ds,x->Image(hom,x))));
            iso.range.exponent:=exp;
            # Apply function recursiv to the new group or factorgroup
            rep:=RepresentationsPGroup(iso.range);
            lg:=Length(iso.range.generators);
            # look how the images of the original igs is written in the
            # new group
            for i in igs do
                k:=Exponents(iso.range,Image(iso,Image(hom,i)));
                t:=[];
                for j in [1..lg] do for i1 in [1..k[j]] do Add(t,j); od; od;
                Add(expl,t);
                od;
            # find linear representations of original group
            for i in rep.lin do
                s:=[];
                for j in expl do
                    t:=0; for k in j do t:=t+i[k]; od; Add(s,t mod exp);
                    od;
                Add(linreplist,s);
                od;
            # find nonlinear representations of original group
            for i in rep.nonlin do
                s:=[]; rr:=Length(i[1].perm);
                for j in expl do
                    t:=rec(perm:=[1..rr],diag:=[1..rr]*0);
                    for k in j do t:=mulmoma(t,i[k]); od; Add(s,t);
                    od;
                Add(replist,s);
                od;
            return rec(exponent:=exp,nonlin:=replist,lin:=linreplist);
            fi;
        od;
    gexps:=[]; for i in igs do Add(gexps,RelativeOrderAgWord(i)); od;
    # the representations of the smallest nontrivial compositionsubgroup
    # are initialissed
    linreplist:=List([0..gexps[lg]-1]*(exp/gexps[lg]),x->[x]); replist:=[];
    # this loop runs along the composition series constructing the
    # representations
    for i in Reversed([1..lg-1]) do
        # coli discribes the operation on the character of the normal subgroup
        coli:=[]; flag:=true;
        for j in [i+1..lg] do
            expl:=igs[j]^igs[i]; if expl <> igs[j] then flag:=false; fi;
            expl:=Exponents(g,expl);
            Add(coli,Concatenation(List([i+1..lg],x->
                List([1..expl[x]],y->x-i))));
        od;
        expl:=Exponents(g,igs[i]^gexps[i]);
        # poli discribes the p-th power of the conjugating element
        poli:=Concatenation(List([i+1..lg],x->List([1..expl[x]],y->x-i)));
        if flag then
            # the operation is trivial
            linreplist:=liftlinrepsab(linreplist);
            if replist<>[] then replist:=liftrepsab(replist); fi;
        else
            # the operation is not trivial
            if replist<>[] then replist:=liftreps(replist); fi;
            j:=liftlinreps(linreplist); Append(replist,j.nonlin);
            linreplist:=j.lin;
        fi;
    od;
    return rec(exponent:=exp,nonlin:=replist,lin:=linreplist);
end;



#############################################################################
##
#F  MatRepresentationsPGroup( G [, int ] ). .  irr. matrix representations of
#F  . . . . . . . . . . . . . . . . . . . . . . . . . . a supersolvable group
##
##  This function returns a list of homomorphism from the ag-group G 
##  to complex matrix groups realising the represenatations belonging
##  to the characters which can be computed by CharTablePGroup. If the
##  second argument is given, only the int-th representation is retuned.
##
MatRepresentationsPGroup := function(arg)
 
    local   rep, mrep, i, j, k, t, r, e, mulmoma, m, al, Ee, lg, ew, evl,
        ni, tt, g;

    mulmoma:=function(a,b)
    r:=rec(perm:=[],diag:=[]);
    for m in [1..al] do
        r.perm[m]:=b.perm[a.perm[m]];
        r.diag[b.perm[m]]:=(b.diag[b.perm[m]]+a.diag[m]);
    od;
    return r;
    end;

    # check the arguments
    if    Length( arg ) > 2
       or not IsAgGroup( arg[1] )
       or ( Length( arg ) = 2 and not IsInt( arg[2] ) ) then
        Error("MatRepresentationsPGroup:usage( <ag-group> )\n",
              "                                     ( <ag-group> , <int> )\n");
    fi;

    g:= arg[1];
    rep:= RepresentationsPGroup( g );
    mrep:= [];
    e:= E( rep.exponent );
    Ee:= E( rep.exponent );
    lg:= Length( Igs(g) );
    evl:= [];

    # look how the generators are expressed in terms of the igs
    for i in g.generators do
      ew:= Exponents( g, i );
      t:= [];
      for j in [ 1 .. lg ] do
        for k in [ 1 .. ew[j] ] do Add( t, j ); od;
      od;
      Add(evl,t);
    od;

    if Length(arg)=2 then
        if Length(rep.lin)<arg[2] then 
            rep.nonlin:=[rep.nonlin[arg[2]-Length(rep.lin)]]; rep.lin:=[];
        else
            rep.nonlin:=[]; rep.lin:=[rep.lin[arg[2]]];
        fi;
    fi;

    # get linear representations
    for i in rep.lin do
        ni:=[];
        for j in evl do
            t:=0; for k in j do t:=t+i[k]; od; Add(ni,[[Ee^t]]);
#T for not too big exponent store the powers Ee^t (compute only once)!
            od;
        Add(mrep,ni);
    od;

    # get nonlinear representations
    for i in rep.nonlin do
        ni:=[]; al:=Length(i[1].perm);
        for j in evl do 
            t:=rec(perm:=[1..Length(i[1].perm)]);
            t.diag:=t.perm*0;
            for k in j do t:= mulmoma(t,i[k]); od;
            tt:=List(t.perm,x->0*t.perm);

            # transform into a cyclotomic matrix
            for k in [1..Length(t.perm)] do
                tt[k][t.perm[k]]:=Ee^t.diag[t.perm[k]];
            od;
            Add(ni,tt);
        od;
        Add(mrep,ni);
    od;
    if Length(arg)=2 then
        return GroupHomomorphismByImages(g,MatGroup(mrep[1],CF(rep.exponent)),
            g.generators,mrep[1]);
    fi;

    return List(mrep,x->GroupHomomorphismByImages(g,MatGroup(x,
        CF(rep.exponent)),g.generators,x));
    end;



#############################################################################
##
#F  CharTablePGroup(G)  . . . . . .  character table of a supersolvable group
##
##  This function calculates the character table of an ag-represented group
##  G, if there is an abelian normal subgroup N such that G/N is
##  supersolvable. If this is not, the characters of the largest factorgroup
##  with this property are computed and inflated to G. In this case a 
##  warning is printed out. The character table is returned and fixed in
##  G.charTable. If there are more then one arguments, they are ignored
##  but no warnings are printed.
##
CharTablePGroup := function(arg)

    local   ecs, evl, lg, Ee, rep, t, tt, i, j, k, mulmoma, ew, ni, r, m,
        al, p, pl, powermap, tbl, g;

    mulmoma:=function(a,b)
    r:=rec(perm:=[],diag:=[]);
    for m in [1..al] do
        r.perm[m]:=b.perm[a.perm[m]];
        r.diag[b.perm[m]]:=(b.diag[b.perm[m]]+a.diag[m]);
    od;
    return r;
    end;

    g:=arg[1];
    lg:=Length(Igs(g)); evl:=[]; ecs:=ConjugacyClasses(g);
    if IsBound(g.charTable) then
        tbl:=g.charTable;
#T should be left to dispatchers only ?
    else
      tbl:=rec( size         := Size(g),
                centralizers := [],
                classes      := [],
                orders       := [],
                irreducibles := [],
                operations   := CharTableOps );
      tbl.order:= tbl.size;
      for i in ecs do
        j:=Size(i);
        Add(tbl.orders,Order(g,i.representative));
        Add(tbl.centralizers,tbl.size/j);
        Add(tbl.classes,j);
      od;
    fi;

    for i in ecs do
        Elements(i); ew:=Exponents(g,i.representative); t:=[];
        for j in [1..lg] do for k in [1..ew[j]] do Add(t,j); od; od;
        Add(evl,t);
        od;
    if not IsBound(g.exponent) then g.exponent:=Lcm(Set(tbl.orders)); fi;
    if Length(arg)=1 then 
        rep:=RepresentationsPGroup(g);
    else
        rep:=RepresentationsPGroup(g,1);
        fi;
    Ee:=E(rep.exponent);
    for i in rep.lin do
        ni:=[];
        for j in evl do t:=0; for k in j do t:=t+i[k]; od; Add(ni,Ee^t); od;
        if not ni in tbl.irreducibles then Add(tbl.irreducibles,ni); fi;
    od;
    for i in rep.nonlin do
        ni:=[]; al:=Length(i[1].perm);
        for j in evl do 
            t:=rec(perm:=[1..Length(i[1].perm)]); tt:=0; t.diag:=t.perm*0;
            for k in j do t:=mulmoma(t,i[k]); od;
            for k in [1..Length(i[1].perm)] do
                if t.perm[k]=k then tt:=tt+Ee^t.diag[k]; fi;
            od;
            Add(ni,tt);
        od;
        if not ni in tbl.irreducibles then Add(tbl.irreducibles,ni); fi;
    od;
    if not IsBound(tbl.powermap) then
        tbl.powermap:=[];
       pl:=Set(Factors(tbl.size));
        for i in pl do
            tbl.powermap[i]:=[];
            for j in ecs do
                k:=j.representative^i; p:=0; t:=Order(g,k);
                repeat p:=p+1; until t=tbl.orders[p] and k in ecs[p];
                Add(tbl.powermap[i],p);
                od;
            od;
        fi;
    if not IsBound(tbl.identifier) then 
        if IsBound(g.name) then
            tbl.identifier:=g.name;
        elif IsBound(Parent(g).name) then
            tbl.identifier:=Parent(g).name;
            for k in g.generators do
                tbl.identifier:=ConcatenationString(tbl.identifier,"_",String(k));
                od;
        else 
            tbl.identifier:="";
            fi;
        fi;
#T Remove this when the time of changes has arrived!
        tbl.name:= tbl.identifier;

    if ( Sum(List(tbl.irreducibles,x->x[1]*x[1])) <> tbl.size
            and Length(arg)=1) then
        Print("#W  CharTablePGroup:incomplete CharTable\n");
        fi;
    g.charTable:=tbl; g.charTable.group:=g;
    return g.charTable;
end;

