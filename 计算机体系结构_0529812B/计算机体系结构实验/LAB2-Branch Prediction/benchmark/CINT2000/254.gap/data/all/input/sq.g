#############################################################################
##
#A  sq.g                        GAP library                      Frank Celler
#A                                                           Alexander Wegner
##
#A  @(#)$Id: sq.g,v 3.1.1.3 1996/06/11 14:50:08 mschoene Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the solvable quotient algorithm for finitely presented
##  groups.
##
#H  $Log: sq.g,v $
#H  Revision 3.1.1.3  1996/06/11  14:50:08  mschoene
#H  fixed '.preimage' to '.preImage'
#H
#H  Revision 3.1.1.2  1994/10/07  13:10:39  fceller
#H  added 'SQOps.AgGroup'
#H
#H  Revision 3.1.1.1  1994/09/21  11:03:48  fceller
#H  fixed 'NextPrimesSQ',  the wrong dimension was checked which
#H  caused 'SolvableQuotient' to compute a large than required
#H  quotient
#H
#H  Revision 3.1  1994/06/20  11:52:06  fceller
#H  'SolvableQuotient' returns a fp group even if the quotient is trivial
#H
#H  Revision 3.0  1994/05/19  13:40:41  sam
#H  Initial Revision under RCS
#H
##

#############################################################################
##
#F  InfoSQ? . . . . . . . . . . . . . . . . . . . . . . . .  show information
##
if not IsBound(InfoSQ1)  then InfoSQ1 := Print;  fi;	# progress info
if not IsBound(InfoSQ2)  then InfoSQ2 := Ignore;  fi; 	# debug for SQ
if not IsBound(InfoSQ3)  then InfoSQ3 := Ignore;  fi; 	# consistency rels
if not IsBound(InfoSQ4)  then InfoSQ4 := Ignore;  fi; 	# debug in collector
if not IsBound(InfoSQ5)  then InfoSQ5 := Ignore;  fi; 	# print sanity checks


#############################################################################
##
#F  SQ_USE_SPLIT  . . . . . . . . . . . . . .  compute public sylow subgroups
##
if not IsBound(SQ_USE_SPLIT)  then SQ_USE_SPLIT := true;  fi;


#############################################################################
##
#F  SQOps . . . . . . . . . . . . . . . . . . . . . . . solvable quotient ops
##
SQOps := rec( name := "SQOps" );
ReadLib("sqstuff");


#############################################################################
##
#F  SQOps.Print( <Q> )  . . . . . . . . . . print quotient in a readable form
##
SQOps.Print := function(Q)
    if IsBound(Q.source.name)  then
        Print( "<< solvable quotient of ", Q.source.name, " of size ",
               StringPP(Q.image.size), " >>" );
    else
        Print( "<< solvable quotient of size ", StringPP(Q.image.size),
               " >>" );
    fi;
end;


#############################################################################
##
#F  SQOps.Modules( <Q>,  <F>, <d> ) . .  construct irr. modules of dim <= <d>
##
SQOps.Modules := function( Q, F, d )
    return ModulesAgGroup( AgGroupFpGroup(Q.image), F, d );
end;


#############################################################################
##

#F  IntersectionMat( <A>, <B> ) . .  base for the intersection of <A> and <B>
##
IntersectionMat := function( A, B )
    local   f;

    # catch trivial cases
    if 0 = Length(A) or 0 = Length(B)  then
        return [];
    fi;
    
    # compute the field
    f := Field( List( Concatenation(A,B), x -> Field(x).root ) );

    # use 'RowSpace'
    return Base( Intersection( RowSpace(A,f), RowSpace(B,f) ) );

end;


#############################################################################
##
#F  SQOps.AgGroup( <Q> )  . . . . . . . . . . . solvable quotient as ag group
##
SQOps.AgGroup := function(Q)
    local   a,  gens,  imgs;

    # get solvable quotient
    a := AgGroupFpGroup(Q.image);

    # return solvable quotient
    if IsBound(Q.images)  then
        a.factorNum := Q.source;
        a.sqImages := List( Q.images, x -> MappedWord( x, Q.image.generators,
                      a.generators ) );
        gens := Q.source.generators;
        imgs := List( Q.images, x -> MappedWord( x, Q.image.generators,
                      a.generators ) );
        a.naturalHomomorphism := GroupHomomorphismByImages( Q.source, a,
                                                            gens, imgs );
        a.naturalHomomorphism.isAutomorphism := false;
        a.naturalHomomorphism.isEndomorphism := false;
        a.naturalHomomorphism.isEpimorphism := true;
        a.naturalHomomorphism.isHomomorphism := true;
        a.naturalHomomorphism.isMapping := true;
        a.naturalHomomorphism.isSurjective := true;
        a.naturalHomomorphism.image := a;
        a.naturalHomomorphism.preImage := Q.source;
    fi;
    a.sqSource := Q.source;
    return a;

end;


#############################################################################
##

#F  CollectedWordSQ( <C>, <u>, <v> )  . . . . . . . . . . . collect <u> * <v>
##
##  The tail of  a conjugate  i^j  (i>j) or a   power i^p (i=j) is  stored at
##  posiition (i^2-i)/2+j
##
CollectedWordSQ := function( C, u, v )

    local   w,	    # word stack
            p,      # position in word stack
            c,      # current exponent in word stack
            m,      # tail stack
            g,      # next generator number
            n,      # composition length
            i,  j,  # loop
            x,      # unpacked <u>,  used for collection
            mx,     # module tail
            l1, l2, # temps
            l;      # stack counter

    # convert lists in to word/module pair
    if IsList(v)  then
        v := rec( word := v,  tail := [] );
    fi;
    if IsList(u)  then
        u := rec( word := u,  tail := [] );
    fi;

    # if <v> is trivial  return <u>
    if 0 = Length(v.word) and 0 = Length(v.tail)  then
        return u;
    fi;

    # if <u> is trivial  return <v>
    if 0 = Length(u.word) and 0 = Length(u.tail)  then
        return v;
    fi;

    # if <v> has trivial word but a nontrivial tail add tails
    if 0 = Length(v.word)  then
        u := Copy(u);
        for i  in [ 1 .. Length(v.tail) ]  do
            if IsBound(v.tail[i])  then
                if IsBound(u.tail[i])  then
                    u.tail[i] := u.tail[i] + v.tail[i];
                else
                    u.tail[i] := v.tail[i];
                fi;
            fi;
        od;
        return u;
    fi;

    # unpack <u> into <x>
    x := C.list;
    n := Length(x);
    for i  in [ 1 .. n ]  do
        x[i] := 0;
    od;
    for i  in [ 1, 3 .. Length(u.word)-1 ]  do
        x[u.word[i]] := u.word[i+1];
    od;

    # <mx> contains the tail of <x>
    mx := Copy(u.tail);

    # get stacks
    w := C.wstack;
    p := C.pstack;
    c := C.cstack;
    m := C.mstack;

    # put <v> onto the stack
    w[1] := v.word;
    p[1] := 1;
    c[1] := 1;
    m[1] := Copy(v.tail);

    # give some information
    InfoSQ4( "#I  collect:   ", x, " * ", v, "\n" );

    # run until the stack is empty
    l := 1;
    while 0 < l  do

        # remove next generator from stack
        g := w[l][p[l]];
        InfoSQ4( "#I  word:      ", x, " . ", mx, "\n",
                 "#I  next gen:  ", g, "\n",
                 "#I  stack:     w=", w[l], ", p=", p[l], 
                 ", c=", c[l], ", m=", m[l], "\n" );

        # apply generator to <mx>
        for i  in [ 1 .. Length(mx) ]  do
            if IsBound(mx[i])  then

                # we use the transposed for technical reasons
                mx[i] := C.module[g] * mx[i];
            fi;
        od;

        # raise current exponent
        c[l] := c[l]+1;

        # if exponent is too big
        if w[l][p[l]+1] < c[l]  then

            # reset exponent
            c[l] := 1;

            # move position
            p[l] := p[l] + 2;

            # if position is too big
            if Length(w[l]) < p[l]  then

                # modify tail (add both tails)
                l1 := Length(mx);
                l2 := Length(m[l]);
                for i  in [ 1 .. Minimum(l1,l2) ]  do
                    if IsBound(mx[i])  then
                        if IsBound(m[l][i])  then
                            mx[i] := mx[i]+m[l][i];
                        fi;
                    elif IsBound(m[l][i])  then
                        mx[i] := m[l][i];
                    fi;
                od;
                if l1 < l2  then
                    for i  in [ l1+1 .. l2 ]  do
                        if IsBound(m[l][i])  then
                            mx[i] := m[l][i];
                        fi;
                    od;
                fi;

                # and unbind word
                InfoSQ4( "#I  poping:    ", w[l], "\n",
                         "#I  new tail:  ", mx, "\n" );
                m[l] := 0;
                l := l - 1;
            fi;
        fi;

        # now move generator to correct position
        for i  in [ n, n-1 .. g+1 ]  do
            if x[i] <> 0  then
                l := l+1;
                w[l] := C.relators[i][g];
                c[l] := 1;
                p[l] := 1;
                l1   := (i^2-i)/2+g;
                if not l1 in C.avoid  then
                    if IsBound(mx[l1])  then
                        mx[l1] := C.mone + mx[l1];
                    else
                        mx[l1] := C.mone;
                    fi;
                fi;
                m[l] := mx;
                InfoSQ4( "#I  conjugate: (", i, "^", g, ") ^ ", x[i],
                         "\n#I  pushing:   ", w[l], " . ", mx, "\n" );
                mx := [];
                l2 := [];
                if not l1 in C.avoid  then
                    l2[l1] := C.mone;
                fi;
                for j  in [ 2 .. x[i] ]  do
                    l := l+1;
                    w[l] := C.relators[i][g];
                    c[l] := 1;
                    p[l] := 1;
                    m[l] := l2;
                    InfoSQ4( "#I  pushing:   ", w[l], " . ", l2, "\n" );
                od;
                x[i] := 0;
            fi;
        od;

        # raise exponent
        x[g] := x[g] + 1;

        # and check for overflow
        if x[g] = C.orders[g]  then
            x[g] := 0;
            if C.relators[g][g] <> 0  then
                l1 := C.relators[g][g];
                for i  in [ 1, 3 .. Length(l1)-1 ]  do
                    x[l1[i]] := l1[i+1];
                od;
            fi;
            l1 := (g^2+g)/2;
            if not l1 in C.avoid  then
                if IsBound(mx[l1])  then
                    mx[l1] := C.mone + mx[l1];
                else
                    mx[l1] := C.mone;
                fi;
            fi;
            InfoSQ4( "#I  power:     ", l, "^", C.orders[g], "\n" );
        fi;
    od;
    InfoSQ4( "#I  result:    ", x, "\n" );

    # and return result
    w := [];
    for i  in [ 1 .. Length(x) ]  do
        if x[i] <> 0  then
            Add( w, i );
            Add( w, x[i] );
        fi;
    od;
    return rec( word := w,  tail := mx );

end;



#############################################################################
##
#F  CollectorSQ( <G>, <M> ) . . . . . . . . . . .  create a collector for <G>
##
CollectorSQ := function( G, M )
    local   A,  r,  g,  o,  i,  j,  word;

    # convert word into gen/exp form
    word := function( id, w )
        local   r,  l,  k;
        if id = w  then
            r := 0;
        else
            l := ExponentsAgWord(w);
            r := [];
            for k  in [ 1 .. Length(l) ]  do
                if l[k] <> 0  then
                    Add( r, k );
                    Add( r, l[k] );
                fi;
            od;
        fi;
        return r;
    end;

    # check if we know a collector
    if not IsBound(G.collector)  then

        # convert <G> into an ag group
        A := AgGroupFpGroup(G);

        # and now convert relators into list of lists
        r := [];
        g := A.generators;
        o := List( g, x -> RelativeOrder(x) );
        for i  in [ 1 .. Length(g) ]  do
            r[i] := [];
            for j  in [ 1 .. i-1 ]  do
                r[i][j] := word( A.identity, g[i]^g[j]);
            od;
            r[i][i] := word( A.identity, g[i]^o[i] );
        od;

        # and store it
        G.collector := rec( relators := r,  orders := o );

        # create stacks stacks
        G.collector.wstack := [];
        G.collector.estack := [];
        G.collector.pstack := [];
        G.collector.cstack := [];
        G.collector.mstack := [];

        # create collector list
        G.collector.list := List( g, x -> 0 );

    fi;

    # copy collector and add module generators
    r := ShallowCopy(G.collector);

    # create module gens (the transposed is a technical detail)
    r.module := List( M.generators, x -> TransposedMat(x) );
    r.mone   := M.generators[1]^0;  IsMat(r.mone);
    r.mzero  := 0*M.generators[1];  IsMat(r.mzero);

    # and return collector
    return r;

end;


#############################################################################
##
#F  AddEquationsSQ( <eq>, <t1>, <t2> )  . . . .  add new equation <t1> = <t2>
##
AddEquationsSQ := function( eq, t1, t2 )
    local   i,  j,  l,  v,  w,  x,  n,  c;

    # if <t1> = <t2>  return
    if t1 = t2  then
        InfoSQ3( "#I  skipping trivial relation\n" );
        return;
    fi;

    # compute <t1> - <t2>
    t1 := Copy(t1);
    for i  in [ 1 .. Length(t2) ]  do
        if IsBound(t2[i])  then
            if IsBound(t1[i])  then
                t1[i] := t1[i] - t2[i];
            else
                t1[i] := -t2[i];
            fi;
        fi;
    od;

    # make lines
    l := List( eq.vzero,  x -> [] );
    v := [];
    for i  in [ 1 .. Length(t1) ]  do
        if IsBound(t1[i])  then
            for j  in [ 1 .. eq.dimension ]  do
                if DepthVector(t1[i][j]) <= Length(t1[i][j])  then
                    l[j][i] := Copy(t1[i][j]);
                    AddCoeffs( l[j][i], v );
                    ShrinkCoeffs(l[j][i]);
                fi;
            od;
        fi;
    od;

    # and reduce lines
    n := eq.dimension;
    for j  in [ 1 .. n ]  do
        x := l[j];
        v := Length(x);
        if 0 < v  then w := (v-1)*n + Length(x[v]);  fi;
        while 0 < v and IsBound(eq.system[w])  do
            c := -x[v][Length(x[v])];
            for i  in eq.spos[w]  do
                if IsBound(x[i])  then
                    AddCoeffs( x[i], eq.system[w][i], c );
                    ShrinkCoeffs(x[i]);
                    if 0 = Length(x[i])  then
                        Unbind(x[i]);
                    fi;
                else
                    x[i] := c * eq.system[w][i];
                fi;
            od;
            v := Length(x);
            if 0 < v  then w := (v-1)*n + Length(x[v]);  fi;
        od;
        if 0 < v  then
            eq.system[w] := x * (1/x[v][Length(x[v])]);
            eq.spos[w]   := Filtered( [1..eq.nrels], t -> IsBound(x[t]) );
            InfoSQ3( "#I  adding: ", eq.system[w], "\n" );
        fi;
    od;

end;


#############################################################################
##
#F  SolutionSQ( <C>, <eq> ) . . . . . . . . . .  homogeneous solution of <eq>
##
SolutionSQ := function( C, eq )
    local   x,  e,  d,  t,  j,  v,  i,  n,  p,  w;

    # construct null vector
    n := [];
    for i  in [ 1 .. eq.nrels-Length(C.avoid) ]  do
        Append( n, eq.vzero );
    od;

    # generated position 
    C.unavoidable := [];
    j := 1;
    for i  in [ 1 .. eq.nrels ]  do
        if not i in C.avoid  then
            C.unavoidable[i] := j;
            j := j+1;
        fi;
    od;

    # blow up vectors
    t := [];
    w := [];
    for j  in [ 1 .. Length(eq.system) ]  do
        if IsBound(eq.system[j])  then
            v := Copy(n);
            for i  in eq.spos[j]  do
                if not i in C.avoid  then
                    p := eq.dimension*(C.unavoidable[i]-1);
                    v{[p+1..p+Length(eq.system[j][i])]} := eq.system[j][i];
                fi;
            od;
            ShrinkCoeffs(v);
            t[Length(v)] := v;
            AddSet( w, Length(v) );
        fi;
    od;

    # normalize system
    v := 0*eq.vzero[1];
    for i  in w  do
        for j  in w  do
            if j > i  then
                p := t[j][i];
                if p <> v  then
                    AddCoeffs( t[j], t[i], -p );
                    ShrinkCoeffs(t[j]);
                fi;
            fi;
        od;
    od;

    # compute homogeneous solution
    d := Difference( [ 1 .. (eq.nrels-Length(C.avoid))*eq.dimension ],  w );
    v := [];
    e := eq.vzero[1]^0;
    for i  in d  do
        x := Copy(n);
        x[i] := e;
        for j  in w  do
            if j >= i  then
                x[j] := -t[j][i];
            fi;
        od;
        Add( v, x );
    od;
    if 0 = Length(C.avoid)  then
        return v;
    fi;

    # construct null vector
    n := [];
    for i  in [ 1 .. eq.nrels ]  do
        Append( n, eq.vzero );
    od;

    # construct a blow up matrix
    i := [];
    for j  in [ 1 .. eq.nrels ]  do
        if not j in C.avoid  then
            Append( i, (j-1)*eq.dimension + [ 1 .. eq.dimension ] );
        fi;
    od;

    # blowup the vectors
    e := [];
    for x  in v  do
        d := Copy(n);
        d{i} := x;
        Add( e, d );
    od;

    # and return
    return e;

end;


#############################################################################
##
#F  TwoCocyclesSQ( <C>, <G>, <M> )  . . .  compute two cocycles of <G> in <M>
##
TwoCocyclesSQ := function( C, G, M )

    local   pairs,
            gi, gj, gk,
            i,  j,  k,
            w1, w2,
            eq,
            p,
            n;
            
    InfoSQ2( "#I  computing two cocycles\n" );

    # get number of generators
    n := Length(G.generators);

    # collect equations in <eq>
    eq := rec( vzero     := C.mzero[1],
               mzero     := C.mzero,
               dimension := Length(C.mzero),
               nrels     := (n^2+n)/2,
               spos      := [],
               system    := [] );

    # precalculate (ij) for i > j
    pairs := List( [1..n], x -> [] );
    for i  in [ 2 .. n ]  do
        for j  in [ 1 .. i-1 ]  do
            pairs[i][j] := CollectedWordSQ( C, [i,1], [j,1] );
        od;
    od;

    # consistency 1:  k(ji) = (kj)i
    for i  in [ n, n-1 .. 1 ]  do
        for j  in [ n, n-1 .. i+1 ]  do
            for k  in [ n, n-1 .. j+1 ]  do
                w1 := CollectedWordSQ( C, [k,1], pairs[j][i] );
                w2 := CollectedWordSQ( C, pairs[k][j], [i,1] );
                InfoSQ3( "#I  consistency 1: ", k, " (", j, " ", i,
                         ") = (", k, " ", j, ") ", i, "\n" );
                if w1.word <> w2.word  then
                    Error( "k(ji) <> (kj)i" );
                else
                    AddEquationsSQ( eq, w1.tail, w2.tail );
                fi;
            od;
        od;
    od;

    # consistency 2: j^(p-1) (ji) = j^p i
    for i  in [ n, n-1 .. 1 ]  do
        for j  in [ n, n-1 .. i+1 ]  do
            p  := C.orders[j];
            w1 := CollectedWordSQ( C, [j,p-1],
                    CollectedWordSQ( C, [j,1], [i,1] ) );
            w2 := CollectedWordSQ( C, CollectedWordSQ( C, [j,p-1], [j,1] ),
                    [i,1] );
            InfoSQ3( "#I  consistency 2: ", j, "^", p-1, " (", j, " ", 
                     i, ") = ", j, "^", p, " ", i, "\n" );
            if w1.word <> w2.word  then
                Error( "j^(p-1) (ji) <> j^p i" );
            else
                AddEquationsSQ( eq, w1.tail, w2.tail );
            fi;
        od;
    od;

    # consistency 3: k (i i^(p-1)) = (ki) i^p-1
    for i  in [ n, n-1 .. 1 ]  do
        p := C.orders[i];
        for k  in [ n, n-1 .. i+1 ]  do
            w1 := CollectedWordSQ( C, [k,1],
                    CollectedWordSQ( C, [i,1], [i,p-1] ) );
            w2 := CollectedWordSQ( C, CollectedWordSQ( C, [k,1], [i,1] ),
                    [i,p-1] );
            InfoSQ3( "#I  consistency 3: ", k, " ", i, "^", p, " = (", k,
                     " ", i, ") ", i, "^", p-1, "\n" );
            if w1.word <> w2.word  then
                Error( "k i^p <> (ki) i^(p-1)" );
            else
                AddEquationsSQ( eq, w1.tail, w2.tail );
            fi;
        od;
    od;

    # consistency 4: (i i^(p-1)) i = i (i^(p-1) i)
    for i  in [ n, n-1 .. 1 ]  do
        p  := C.orders[i];
        w1 := CollectedWordSQ( C, CollectedWordSQ( C, [i,1], [i,p-1] ),
                [i,1] );
        w2 := CollectedWordSQ( C, [i,1],
                CollectedWordSQ( C, [i,p-1], [i,1] ) );
        InfoSQ3( "#I  consistency 4: (", i, " ", i, "^", p-1, ") ", i,
                 " = ", i, " (", i, "^", p-1, " ", i, ")\n" );
        if w1.word <> w2.word  then
            Error( "i i^p-1 <> i^p" );
        else
            AddEquationsSQ( eq, w1.tail, w2.tail );
        fi;
    od;

    # and return solution
    return SolutionSQ( C, eq );

end;


#############################################################################
##
#F  TwoCoboundariesSQ( <C>, <G>, <M> )  . . . .  compute the two coboundaries
##
TwoCoboundariesSQ := function( C, G, M )
    local   C,  n,  R,  MI,  j,  i,  x,  m,  e,  k,  r,  d;

    InfoSQ2( "#I  computing two coboundaries\n" );

    # start with zero matrix
    n := Length(G.generators);
    R := [];
    r := n*(n+1)/2;
    for i  in [ 1 .. n ]  do
        R[i] := [];
        for j in [ 1 .. r ] do
            R[i][j] := C.mzero;
        od;
    od;

    # compute inverse generators
    M  := M.generators;
    MI := List( M, x -> x^-1 );
    d  := Length(M[1]);

    # loop over all relators
    for j  in [ 1 .. n ]  do
        for i in  [ j .. n ]  do
            x := (i^2-i)/2 + j;

            # power relator
            if i = j  then
                m := C.mone;
                for e  in [ 1 .. C.orders[i] ]  do
                    R[i][x] := R[i][x] - m;  m := M[i] * m;
                od;

            # conjugate
            else
                R[i][x] := R[i][x] - M[j];
                R[j][x] := R[j][x] + MI[j]*M[i]*M[j] - C.mone;
            fi;

            # compute fox derivatives
            m := C.mone;
            r := C.relators[i][j];
            if r <> 0  then
                for k  in [ Length(r)-1, Length(r)-3 .. 1 ]  do
                    for e  in [ 1 .. r[k+1] ]  do
                        R[r[k]][x] := R[r[k]][x] + m;
                        m := M[r[k]] * m;
                    od;
                od;
            fi;
        od;
    od;

    # make one list
    m := [];
    r := n*(n+1)/2;
    for i  in [ 1 .. n ]  do
        for k  in [ 1 .. d ]  do
            e := [];
            for j  in [ 1 .. r ]  do
                Append( e, R[i][j][k] );
            od;
            Add( m, e );
        od;
    od;

    # compute a base for <m>
    return BaseMat(m);

end;


#############################################################################
##
#F  ExtensionSQ( <G>, <M>, <c> )  . . . . . . . . . . .  extension by cocycle
##
##  If <c> is zero,  construct the split extension of <G> and <M>
ExtensionSQ := function( G, M, c )
    local   d,  m,  n,  F,  tab,  i,  j,  k,  l,  w,  rels,  p,  v,  C;

    # get collector of <G>
    if not IsBound(G.collector)  then
        CollectorSQ( G, M );
    fi;
    C := G.collector;

    # construct module generators
    M := M.generators;
    d := Length(M[1]);
    n := Length(G.generators);

    # construct integer table
    F   := Field(M[1][1]);
    tab := IntegerTable(F);

    # add tails to presentation
    if c = 0  then
        rels := Copy( C.relators );
    else
        rels := [];
        for i  in [ 1 .. n ]  do
            rels[i] := [];
            for j  in [ 1 .. i ]  do
                if C.relators[i][j] = 0  then
                    w := [];
                else
                    w := Copy(C.relators[i][j]);
                fi;
                p := (i^2-i)/2 + j - 1;
                for k  in [ 1 .. d ]  do
                    l := c[p*d+k];
                    if l <> F.zero  then
                        Add( w, n+k );
                        Add( w, tab[LogFFE(l,F.root)+1] );
                    fi;
                od;
                if 0 = Length(w)  then
                    w := 0;
                fi;
                rels[i][j] := w;
            od;
        od;
    fi;

    # add module
    for j  in [ 1 .. d ]  do
        rels[n+j] := [];
        for i  in [ 1 .. j-1 ]  do
            rels[n+j][n+i] := [ n+j, 1 ];
        od;
        rels[n+j][n+j] := 0;
    od;

    # add operation of <G> on module
    for i  in [ 1 .. n ]  do
        for j  in [ 1 .. d ]  do
            v := M[i][j];
            w := [];
            for k  in [ 1 .. d ]  do
                l := v[k];
                if l <> F.zero  then
                    Add( w, n+k );
                    Add( w, tab[LogFFE(l,F.root)+1] );
                fi;
            od;
            rels[n+j][i] := w;
        od;
    od;

    # create new collector
    C := rec( relators := rels,
              orders   := Copy(C.orders),
              wstack   := [],
              estack   := [],
              pstack   := [],
              cstack   := [],
              mstack   := [],
              list     := List( [1..n+d], x -> 0 ) );
    Append( C.orders, List( [ 1 .. d ], x -> F.char ) );

    #N fceller: this should be replaced by 'FreeGroup(n+d)'
    m := Copy(G.generators);
    for i  in [ 1 .. d ]  do
        Add( m, AbstractGenerator( ConcatenationString("m",String(n+i)) ) );
    od;

    # and construct new presentation from collector
    G := Group( m, IdWord );
    rels := [];
    for i  in [ 1 .. d+n ]  do
        for j  in [ i .. d+n ]  do
            if i = j  then
                w := m[i]^C.orders[i];
            else
                w := m[j]^m[i];
            fi;
            v := C.relators[j][i];
            if 0 <> v  then
                for k  in [ Length(v)-1, Length(v)-3 .. 1 ]  do
                    w := w * m[v[k]]^(-v[k+1]);
                od;
            fi;
            Add( rels, w );
        od;
    od;
    G.relators  := rels;
    G.collector := C;

    # if <InfoSQ5> is set,  do a check
    InfoSQ5( "#I  extension is consistent: ", IsConsistent(
             AgGroupFpGroup(G)), "\n" );

    # and return
    return G;

end;


#############################################################################
##

#F  InitSQ( <F> ) . . . . . . . . . . . . . . . . . . . .  start SQ structure
##
InitSQ := function(F)
    local   epi;

    # avoid free groups
    if not IsBound(F.relators) or 0 = Length(F.relators)  then
        Error( "group is a free group" );
    fi;

    # initialise epimorphism
    epi := InitEpimorphismSQ(F);

    if Length(epi.free.image.generators) <> 0 then
        Error( "non-trivial free abelian invariant" );
    fi;
    return epi.tor;
end;
    

#############################################################################
##
#F  NextModuleSQ( <epi>, <M> )	. . . . . . . . . . .  extend with module <M>
##
NextModuleSQ := function( epi, M )
    local   C,  lift,  co,  cb,  cc,  tmp,  ff,  q,  i,  j,  k,  l,  v,  qi;

    # first try a split extension
    InfoSQ2( "#I  checking split extension\n" );
    lift := LiftEpimorphismSQ( epi, M, 0 );
    if lift.image.size <> epi.image.size then
        InfoSQ2("#I  quotient (split) = ", StringPP(lift.image.size), "\n");
        return lift;

    # other we have to loop over all extension
    else

        # get collector
        C := CollectorSQ( epi.image, M.absolutelyIrreducible );

        # if <split> is set,  avoid $p$ parts
        C.avoid := [];
        if SQ_USE_SPLIT  then
            k := CharFFE(C.mzero[1][1]);
            for i  in [ 1 .. Length(epi.image.generators) ]  do
                for j  in [ 1 .. i ]  do
                    if C.orders[i] <> k and C.orders[j] <> k  then
                        AddSet( C.avoid, (i^2-i)/2 + j );
                    fi;
                od;
            od;
        fi;

        # compute the two cocycles
        InfoSQ2( "#I  checking non-split extensions\n" );
        co := TwoCocyclesSQ( C, epi.image, M.absolutelyIrreducible );

        # if there is one non split extension,  try all mod coboundaries
        if 0 < Length(co)  then
            cb := TwoCoboundariesSQ( C, epi.image, M.absolutelyIrreducible );

            # use only those coboundaries which lie in <co>
            if 0 < Length(C.avoid)  then
                cb := IntersectionMat( co, cb );
            fi;

            # convert them into row spaces
            if 0 < Length(cb)  then
                tmp := RowSpace( co, M.field );  tmp.base := co;  co := tmp;
                tmp := RowSpace( cb, M.field );  tmp.base := cb;  cb := tmp;

                # compute base for quotient space
                #T Better use function that computes a base for a complement
                #T without constructing the spaces!
                cc  := BaseSteinitz( co, cb ).factorspace;
            else
                cc := co;
            fi;

            # try all non split extensions
            if 0 < Length(cc)  then
                ff := M.absolutelyIrreducible.field;
                q  := Size(ff);
                InfoSQ2("#I  classes of extensions = ", q^Length(cc), "\n");

                # loop over all vectors of <cc>
                for j in [ 1 .. Length(cc) ]  do
                    for k in [ 0 .. q^(Length(cc)-j)-1 ]  do
                        v := cc[Length(cc)-j+1];
                        for l in [ 1 .. Length(cc)-j ]  do
                            qi := QuoInt( k, q^(l-1) );
                            if qi mod q <> q-1  then
                                v := v + ff.root^(qi mod q) * cc[l];
                            fi;
                        od;

                        # try to lift epimorphism
                        lift := LiftEpimorphismSQ( epi, M, v );

                        # return if we have found a lift
                        if lift.image.size <> epi.image.size then
                            return lift;
                        fi;
                    od;
                od;
            fi;
        fi;

        # return old epimorphism
        return epi;
    fi;

end;


#############################################################################
##
#F  NextPrimesSQ( <epi>, <primes> ) . . . . . . extend with a <primes> module
##
NextPrimesSQ := function( epi, primes )
    local   rep,  reps,  i,  d,  lift,  co,  cc,  cb,  ff,  q,  j,  k,  l,
            v,  qi;

    for i  in  [ 1, 3 .. Length(primes)-1 ]  do
        InfoSQ2( "#I  testing: ", primes[i], "^", primes[i+1], "\n" );
        
        # compute modules for prime
        reps := ModulesSQ( epi, GF(primes[i]), primes[i+1] );
        
        # loop over the representations
        for rep  in reps  do
            d := rep.absolutelyIrreducible.dimension;
            InfoSQ2( "#I  testing ", d, " dimensional representation\n" );

            # first try a split extension
            lift := NextModuleSQ( epi, rep );
            if lift.image.size <> epi.image.size then
               InfoSQ2("#I  new quotient = ",StringPP(lift.image.size),"\n");
               d := rep.dimension;
               if primes[i+1] = 0  then
                   return NextPrimesSQ( lift, [ primes[i], 0 ] );
               elif primes[i+1] = d  then
                   return lift;
               else
                   return NextPrimesSQ( lift, [primes[i],primes[i+1]-d] );
               fi;
            fi;
        od;
    od;
    
    # give up
    return epi;

end;


#############################################################################
##
#F  SolvableQuotient( <F>, <primes> ) . .  compute a solvable quotient of <F>
##
##  'SolvableQuotient' implements  a rudimentary version   of an algorithm to
##  compute an  finite polycyclic presentation   for a finite  soluble  group
##  which is defined as a quotient of  finitely presented group <F>. The main
##  idea is to  compute factor groups of  <F> by lifting  an epimorphism F->H
##  onto downward extensions of H by finite irreducible H-modules, where H is
##  given by a polycyclic presentation.
##
##  Computing  the   commutator  factor  group   <F>/<F>'   is   a  matter of
##  diagonalising the integer matrix resulting from the abelianised relations
##  of the presentation for <F>. After this  initialising step we assume that
##  an epimorphism epi:F->H has been constructed and  we repeat the following
##  steps. At  step i  for  each prime  p in   <primes>[i] we  calculate  the
##  irreducible representations of H over the field with p elements. For each
##  irreducible   representation we determine   the  extensions of  H  by the
##  corresponding module. Finally, for each  extension K we check whether the
##  epimorphism
##
##			epi : F -> H
##
##  lifts to an epimorphism lift:F->K, i.e.,
##
##			epi = eta lift
##
##  where  eta:K->H  is the  natural  projection. If   a lifting is  found we
##  replace  epi by lift  and repeat the steps just  described. If no lifting
##  exists epi is   an epimorphism of  <F> onto  its largest finite  solvable
##  quotient.
##
##  'SolvableQuotient' takes as arguments a  finitely presented group <F> and
##  a list  of lists <primes> describing the  primes to be considered at each
##  step.
##
##  REFERENCE
##	W.Plesken
##	Towards a Soluble Quotient Algorithm
##	J. Symbolic Computation (1987)4,111-122
##
SolvableQuotient := function ( F, primes )
    local    epi,  lift,  old,  i,  done,  avoid;

    # initialise epimorphism
    epi := InitSQ(F);

    # if the commutator factor group is trivial return
    if Length(epi.image.generators) = 0  then
        InfoSQ1( "#I  trivial commutator factor group\n" );
        lift := epi;

    # if <primes> is an integer it is size we want
    elif IsInt(primes)  then
        InfoSQ1("#I  commutator group = ",StringPP(epi.image.size),"\n");

        # check the size of the commutator factor group
        if primes mod epi.image.size <> 0  then
            Error( "commutator factor group is of size ",
                   StringPP(epi.image.size) );
        fi;

        # construct possible composition series
        repeat
            i := primes / epi.image.size;
            lift := epi;
            if 1 < i  then
                InfoSQ1( "#I  trying   = ", StringPP(i), "\n" );
                lift := NextPrimesSQ( lift, Flat(Collected(Factors(i))) );
            else
                lift := epi;
            fi;
            InfoSQ1( "#I  quotient = ", StringPP(lift.image.size), "\n" );
            old := epi;
            epi := lift;
        until lift.image.size=old.image.size or primes=lift.image.size;

        # give a warning if quotient is smaller
        if epi.image.size < primes  then
            Print( "#W  largest quotient has order ",
                   StringPP(epi.image.size), "\n" );
        fi;

    # if <primes> is list of primes find maximal quotient with these primes
    elif 0 < Length(primes) and IsInt(primes[1])  then
        InfoSQ1("#I  commutator group = ",StringPP(epi.image.size),"\n");

        # construct possible composition series
        avoid := 0;
        repeat
            i    := 1;
            done := false;
            while not done and i <= Length(primes)  do
                if primes[i] <> avoid  then
                    InfoSQ1( "#I  trying   = [ ", primes[i], ", 0 ]\n" );
                    lift := NextPrimesSQ( epi, [primes[i],0] );
                    InfoSQ1( "#I  quotient = ",
                             StringPP(lift.image.size), "\n" );
                    if lift.image.size <> epi.image.size  then
                        done  := true;
                        avoid := primes[i];
                    else
                        i := i + 1;
                    fi;
                else
                    i := i + 1;
                fi;
            od;
            epi := lift;
        until not done;

    # otherwise <primes> describes a possible composition series
    elif 0 < Length(primes)  then
        InfoSQ1("#I  commutator group = ",StringPP(epi.image.size),"\n");

        # init step counter
        i := 1;

        # construct possible composition series
	lift := NextPrimesSQ( epi, primes[i] );
        InfoSQ1( "#I  quotient = ", StringPP(lift.image.size), "\n" );
	while lift.image.size <> epi.image.size do
	    epi := lift;
            i   := i+1;
            if Length(primes) < i  then
                epi := lift;
            else
                InfoSQ1( "#I  trying   = ", primes[i], "\n" );
                lift := NextPrimesSQ( epi, primes[i] );
                InfoSQ1("#I  quotient = ", StringPP(lift.image.size), "\n");
            fi;
	od;
    else
        Error( "<primes> must be a size, a list of primes, or a list of",
               " factors" );
    fi;

    # return solvable quotient
    if IsBound(lift.preimages)  then
        lift.image.sqPreimages := lift.preimages;
    fi;
    if IsBound(lift.images)  then
        lift.image.sqImages := lift.images;
    fi;
    lift.image.sqSource := lift.source;
    return lift.image;

end;

