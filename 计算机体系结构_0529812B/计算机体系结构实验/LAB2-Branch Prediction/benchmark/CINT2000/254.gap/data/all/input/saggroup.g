#############################################################################
##
#A  saggroup.g                  GAP library                      Bettina Eick
##
#A  @(#)$Id: saggroup.g,v 3.11.1.2 1995/11/22 08:57:47 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains all functions for creating special ag groups.
##
#H  $Log: saggroup.g,v $
#H  Revision 3.11.1.2  1995/11/22  08:57:47  sam
#H  changed from MatGroup & CompositionFactors to MTXOps.CompositionFactors
#H
#H  Revision 3.11.1.1  1994/10/25  13:52:39  beick
#H  fixed a bug in SagWeights
#H
#H  Revision 3.11  1994/06/30  09:37:29  beick
#H  fixed a bug in 'ChangeBase'
#H
#H  Revision 3.10  1994/05/18  07:50:48  beick
#H  fixed some more bugs
#H
#H  Revision 3.9  1994/03/22  14:43:32  beick
#H  Changed 'AgSubgroup' to 'G.operations.AgSubgroup'
#H
#H  Revision 3.8  1994/03/22  13:08:36  beick
#H  Fixed a bug in 'SpecialAgGroup'
#H
#H  Revision 3.7  1994/02/23  13:59:17  beick
#H  changed 'SpecialAgGroup'
#H
#H  Revision 3.6  1994/02/21  14:29:09  beick
#H  improved the comments
#H
#H  Revision 3.5  1994/02/16  15:20:42  beick
#H  changed the record entry system.work
#H  improved SpecialAgGroup slightly
#H
#H  Revision 3.4  1994/02/16  14:32:32  fceller
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  InfoSagGroup? . . . . . . . . . . . . . . . . . . . . . print information
##
if not IsBound(InfoSagGroup1)  then InfoSagGroup1 := Ignore;  fi;
if not IsBound(InfoSagGroup2)  then InfoSagGroup2 := Ignore;  fi;
if not IsBound(InfoSagGroup3)  then InfoSagGroup3 := Ignore;  fi;


#############################################################################
##
#V  SagWeights  . . . . . . . . .  weight functions for the special ag series
##
##  The weight  of  a group  element g  is  a threetuple  w  = [w1,   w2, w3]
##  indicating the  subgroup of the  Leedham-Green series corresponding to g,
##  such that w1 corresponds to the factor  of the lower nilpotent series, w3
##  is the prime  of the Sylowsubgroup  of the factor  in the lower nilpotent
##  series, w2 corresponds to the factor of the lower-w3-central series of the
##  Sylow-w3-subgroup of the w1's factor of the lower nilpotent series.
##
##  weight functions are records of functions  constructing the new weight of
##  the generators of a group such that they refer to the leedhamgreen series
##  of the group.
##
##  'adj( <g>, <weight> )'
##
##  'adj' is called in 'Modify', it calculates the  weight of a component
##  gg of the generator <g> and returns the weight.
##
##  'one( <g> )'
##
##  'one' is called in 'Initialize' and  returns the initialization of the
##  weight of the group element.
##
##  'relevant( <weights>, <i>, <j> )'
##
##  'relevant' is called in 'Echelonise' and  returns true if it is necessary 
##  to modify the base with the power/commutator.
## 
##  'weight( <weights>, <i>, <j>, <power/commutator> )'
##
##  'weight' is called  in 'Echelonise', calculates the weight  of a power or
##  commutator  and  returns  a  weight.  'relevant' is true  if  'weight' is
##  called.
##
SagWeights := rec(

    adj := function( g, wt )
        wt := Copy( wt );
        wt[ 3 ] := RelativeOrderAgWord( g );
        return wt;
    end,

    one := function( g )
        return [ 1, 1, RelativeOrderAgWord( g ) ];
    end,

    relevant := function( w, i, j )
        if w[ i ][ 2 ] > Length( w )  then
            w[ i ][ 2 ] := 1;
            return false;
        elif w[ j ][ 2 ] > Length( w )  then
            w[ j ][ 2 ] := 1;
            return false;
        elif i = j  then
            return true;
        else
            if w[ i ][ 1 ] = w[ j ][ 1 ]   then
                if w[i][3] <> w[j][3] and w[i][2]=1 and w[j][2] = 1  then
                    return true;
                elif w[i][3] = w[j][3] and (w[i][2] = 1 or w[j][2] = 1)  then
                    return true;
                else
                    return false;
                fi;
            else 
                 return true;
            fi;
        fi;
    end,

    weight := function( w, i, j, g )
        local p;

        p := RelativeOrderAgWord(g);
        if i = j  then
            return [ w[ i ][ 1 ], w[ i ][ 2 ]+1, w[ i ][ 3 ] ];
        else
            if w[ i ][ 1 ] = w[ j ][ 1 ]  then
                if w[ i ][ 3 ] <> w[ j ][ 3 ] or w[ i ][ 3 ] <> p  then
                    return [ w[ i ][ 1 ]+1, 1, p ];
                else
                    return [ w[ i ][ 1 ], w[ i ][ 2 ]+w[ j ][ 2 ], w[i][3] ];
                fi;
            else
                return [ Maximum( w[ i ][ 1 ],w[ j ][ 1 ] ), 1, p ];
            fi;
        fi;
    end
);


#############################################################################
##
#F  AgGroupOps.ModifyBase( <system>, <g>, <weight> )   modify 'base' with <g>
##
##  'ModifyBase' modifies  the record entry 'base'  of <system>  with <g> and
##  returns the place in which <g> is inserted.  <g> is either a base element
##  or a power/commutator of a base element with another.
##
AgGroupOps.ModifyBase := function ( system, g, wt )

    local d,         #  depth of g
          gg,        #  g*B[d]^n
          S,         #  list of components of gg
          s,         #  component of gg
          min,       #  minimal position 
          tmp, i, j;       

    # the trivial case
    if g = system.G.identity  then
        return Length( system.base ) + 1;
    fi;
    d := DepthAgWord( g );

    # an easy case occuring in the 'Initialize' function
    if system.base[ d ] = system.G.identity then
        system.base[ d ] := g;
        system.weights[ d ] := wt;
        return d;

    # the other cases
    else
        gg := ReducedAgWord( system.base[ d ], g );
        S := Components( system.G, gg );

        # insert g in base 
        if system.weights[ d ] < wt  then
            tmp := system.weights[ d ];
            system.weights[ d ] := wt;
            system.base[ d ] := g;
            InfoSagGroup3( "#I  insert: ",g, "\n#I  at position: ", d,
                           " with weight: ", wt, "\n" );

            # correct work-flag
            system.work[ d ] := List( system.work[ d ], x -> true );
            for i in [d..Length( system.base )]  do
                system.work[ i ][ d ] := true;
            od;

            # ModifyBase with components of gg
            for s  in S  do 
                system.G.operations.ModifyBase( system, s, 
                        system.wf.adj( s,tmp ));
            od;
            return d;

        # base is not changed 
        else
         
            # modify with components of gg
            min := Length( system.base ) + 1;
            for s  in S  do
                tmp := system.wf.adj( s, wt );
                min := Minimum( 
                           min,
                           system.G.operations.ModifyBase(system,s,tmp) );
            od;
            return min;
        fi;
    fi;
end;


#############################################################################
##
#F  AgGroupOps.InitializeSystem ( <G>, <gens>, <wf> ) . .   initialize 'base'
##
##  'InitializeSystem'  computes a PAG-system  of <G>, such that each element
##  of the  PAG-system has a  prime power order.  Furthermore  it induces the
##  weight of each element  in the PAG-system.  The function returns a record
##  consisting of the entries
##
##  'G',        the group <G>
##  'base',     the calculated PAG-system
##  'weights',  the induced weights
##  'wf',       the weightfunction
##  'work',     the list that gives the elements which have to be considered.
##
AgGroupOps.InitializeSystem := function( G, gens, wf )

    local maxDepth,     # Length of composition series
          system,       # record with all information
          g,            # one element of gens 
          s,            # one component of g
          S;            # list of components of g

    InfoSagGroup2("#I  initializing base\n" );
    maxDepth := CompositionLength( gens[ 1 ] ) - 1;

    # set up record system
    system  := rec(
    G       := G,
    base    := List( [1..maxDepth], x -> G.identity ),
    weights := List( [1..maxDepth], x -> false ),
    work    := List( [1..maxDepth], x -> List( [1..x], y -> true ) ),
    wf      := wf   );

    # run through gens
    for g  in gens  do
        S := Components( G, g );
        for s  in S  do
            G.operations.ModifyBase( system, s, wf.one( s ) );
        od;
    od;

    # return the information
    return system;

end;


#############################################################################
##
#F  AgGroupOps.EcheloniseBase( <system> ) . . . . . . . . . echelonise 'base'
##
##  'EcheloniseBase' modifies the initialized base  with all necessary powers
##  and commutators. In the record  <system> the entries 'base' and 'weights'
##  are changed.
##
AgGroupOps.EcheloniseBase := function ( system )

    local depth,        # actual depth of an element
          maxDepth,     # length of composition series
          g,            # power/commutator of old generator
          s,            # component of g
          S,            # list of components of g
          wt,           # new weight of s 
          pos,          # position of s  in new basis 
          i, j, k;

    # set up variables
    InfoSagGroup2( "#I  echelonising base\n" );
    maxDepth := Length( system.base );

    # run through powers and commutators
    i := 1;
    while i <= maxDepth  do
        j := 1;
        while j <= i  do
            if not (IsBool(system.weights[i]) or IsBool(system.weights[j]))
               and system.wf.relevant( system.weights, i, j ) 
               and system.work[ i ][ j ]  then
                system.work[ i ][ j ] := false;
                if i = j  then
                    g := system.base[ i ]^system.weights[ i ][ 3 ];
                else
                    g := Comm( system.base[ i ], system.base[ j ] );
                fi;
                InfoSagGroup3( "#I  ", i, " ", system.weights[i], "  = i ",
                               j, " ", system.weights[j], " = j\n" );
                S := Components( system.G, g );
                pos := maxDepth + 1;
                for s  in S  do
                    wt := system.wf.weight( system.weights, i, j, s );
                    pos := Minimum( pos, 
                           system.G.operations.ModifyBase( system, s, wt ) ); 
                od;

                # if necessary, set indices new
                if pos <= i  then
                    i := pos;
                    j := 0;
                fi;
            fi;
            j := j+1;
        od;
        i := i+1;
    od;
    system.base := Filtered( system.base, x -> x <> system.G.identity );
    system.weights :=  Filtered( system.weights, x -> not IsBool( x ) );

    Unbind( system.work );
    Unbind( system.wf );

end;

#############################################################################
##
#F  AgGroupOps.GetLgLayer( <system> ) . . . . . . . . get layers of LG-series
##
##  'GetLgLayer' sorts the 'weights' lexicographically and it sorts the 'base'
##  in the corresponding order. Furthermore it calculates the lists 'layers',
##  'first', 'head' and 'tail' as decribed in  'SpecialAgGroup' and appends
##  them to the record <system>.
##
AgGroupOps.GetLgLayer := function( system )

    local perm,             # permutation
          weight,           # actual weight
          layer,            # actual layer
          layers,           # list of all layers
          nilpotlayer,      # layer of lower nilpotent series
          dealayer,         # layer of dea-series
          first,            # list that  indicates first base element of each
                            # layer
          head,             # list that  indicates first base element of each
                            # nilpotent layer
          tail,             # list that  indicates first base element of each 
                            # tail
          i;

    InfoSagGroup2( "#I  getting layers of LG-series\n" );

    # Sort weights and base
    perm        := Sortex( system.weights );
    system.base := Permuted( system.base, perm );

    # set up first and layers
    first  := [ ];
    layers := [ ];
    i := 1;
    layer := 0;
    while i <= Length( system.weights )  do
        weight := system.weights[ i ];
        layer := layer + 1;
        first[ layer ] := i;
        while i <= Length(system.weights) and weight = system.weights[i]  do
            layers[ i ] := layer;
            i := i + 1;
        od;
    od;
    Add( first, i );

    # set up head and tail
    head := [ ];
    tail := [ ];
    nilpotlayer := 0;
    dealayer := 0;
    for i  in [ 1..Length( first )-1 ]  do
        if system.weights[ first[i] ][ 1 ] <> nilpotlayer  then
            if dealayer = 1  then
                tail[ nilpotlayer ] := first[ i ];
            fi;
            nilpotlayer := nilpotlayer + 1;
            dealayer := 1;
            head[ nilpotlayer ] := first[ i ];
        elif system.weights[ first[i] ][2] <> dealayer  then
            dealayer := dealayer + 1;
            if dealayer = 2  then
                tail[ nilpotlayer ] := first[ i ];
            fi;
        fi;
    od;
    Add( head, first[ Length( first ) ] );
    if dealayer = 1  then
        Add( tail, first[ Length( first ) ] );
    fi;

    # update system
    system.layers  := layers;
    system.first   := first;
    system.head    := head;
    system.tail    := tail;

end;


#############################################################################
##
#F  AgGroupOps.RefineToChiefSeries( <system> )  . . . . . .  refine LG-series
##
##  This function refines the LG-series by a chief series and changes 'base' 
##  such that it refines the calculated chief series. It adds the following 
##  record entries.
##  'chieffirst'    works like 'first' for the chief series.
##  'chieflayers'   works like 'layers' for the chief series.
##
AgGroupOps.RefineToChiefSeries := function( system )

    local maxDepth,          ## length of base 
          newbase,           ## the new sorted base
          chieflayers,       ## layer of each generator in newbase 
          chieffirst,        ## first element of each layer
          first,             ## first of actual LG-layer 
          next,              ## first of next LG-layer
          N, M, NM, NMgens,  ## factor group of layer
          field,             ## field of layer
          mat,               ## representation of a group element on layer
          matgens,           ## generators of representation of layer
          compfacs,          ## module-composition series of layer 
          onebase,           ## base of a submodule in the composition series
          intbase,           ## onebase as integers
          layer,             ## actual layer of chief series
          cfirst,            ## first element of actual layer of chief series
          element,           ## a group element 
          i, j, h, k, pos;
      
    InfoSagGroup2( "#I  refining LG-series to chief series\n" );
    maxDepth := Length( system.base );
    newbase := Copy( system.base );

    # setup chieffirst and change base
    chieffirst := [ ];
    chieflayers := [ ];
  
    # the first layer of the lower nilpotent series is easy
    for i  in [ 1..system.head[ 2 ]-1 ]  do
        Add( chieffirst, i );
        Add( chieflayers, i );
    od;

    # the rest
    layer := system.head[ 2 ];
    pos := Position( system.first, layer );
    for i  in [ pos..Length( system.first )-1 ]  do
        first := system.first[ i ];
        next := system.first[ i + 1 ];
        
        # calculate factor group of layer
        N := Subgroup(system.G, Sublist( system.base, [ first..maxDepth ]));
        M := Subgroup(system.G, Sublist( system.base, [ next..maxDepth ] ));
        NM := N mod M;
        NMgens := Sublist ( system.base, [ first..next-1 ] );
        field := GF ( system.weights[ first ][ 3 ] );

        # take all necessary generators and calculate representation
        matgens := [ ];
        for k  in [ 1..first-1 ]  do
            if system.weights[ k ][ 2 ] = 1 and 
               system.weights[ k ][ 1 ] <> system.weights[ first ][ 1 ]  then
                mat := List( NMgens, 
                           x -> Exponents(NM,x^system.base[k],field) );
                Add ( matgens, mat );
            fi;
        od;

        # use the meat-axe
        compfacs := MTXOps.CompositionFactors(
                         [ matgens, field, Length( matgens[1] ) ] );

        # calculates new base elements and update layers and first
        cfirst := first;
        for onebase  in compfacs.bases  do
            intbase := List( onebase, x -> IntVecFFE(x) );
            for j  in [ 1..Length( intbase ) ]  do
                element := system.G.identity;
                for h  in [ 1..Length( intbase[ j ] ) ]  do
                    element := element*system.base[first+h-1]^intbase[j][h];
                od;
                newbase[ cfirst + j - 1 ] := element;
                Add( chieflayers, layer );
            od;
            Add( chieffirst, cfirst );
            cfirst := cfirst + Length( onebase );
            layer := layer + 1;
        od; 
    od;        
    Add( chieffirst, maxDepth+1 );

    # include the new information in the record system
    system.base          := newbase;
    system.chieflayers   := chieflayers;
    system.chieffirst    := chieffirst;

end;


#############################################################################
##
#F  GetCentralLgLayers( <system> )  . . .  get central layers of chief series
##
##  This function changes the entry 'weights',  such that the new fourth entry
##  is true, if the corresponding base element lies in a central factor of the
##  chief series, and false otherwise.
##
AgGroupOps.GetCentralLgLayers := function( system )

    local central,      ## is true unless the actual factor is not central
          maxDepth,     ## length of the ag system
          M,            ## a subgroup of the chief series
          NMgens,       ## generators of a layer of the chief series
          size,         ## number of generators
          i, j, k, pos;

    maxDepth := Length( system.base );

    # the first factor of the lower nilpotent series is easy
    for i  in [ 1..system.head[ 2 ]-1 ]  do
        system.weights[ i ][ 4 ] := true;
    od;

    # the rest
    pos := Position( system.chieffirst, system.head[ 2 ] );
    for i  in [ pos..Length( system.chieffirst )-1 ]  do
        M := Subgroup( system.G, Sublist( system.base, 
                       [ system.chieffirst[ i+1 ]..maxDepth ] ) );
        NMgens := Sublist( system.base, 
                       [ system.chieffirst[i]..system.chieffirst[i+1]-1 ] );
        size := Length( NMgens );
        central := true;
        j := 1;
        while j <= system.chieffirst[ i ] and central  do
            if system.weights[ j ][ 2 ] = 1  then
                k := 1;
                while k <= size and central  do
                    central := Comm(NMgens[k],system.base[j]) in M;
                    k := k + 1;
                od;
            fi;
            j := j + 1;
        od;
        for j  in [ system.chieffirst[ i ]..system.chieffirst[ i+1 ]-1 ]  do
            system.weights[ j ][ 4 ] := central;
        od;
    od;
end;


#############################################################################
##
#F  AgGroupOps.CompositionBase ( <system> ) . . .  construct isomorphic group 
##
##  'CompositionBase' constructs the isomorphism to a group 'H' that has an ag
##  system in 'base' which refines the LG-series or even the chief series, if
##  one is given. It adds to the record the 'bijection' between the old group
##  'G' and the new group 'H'.
##
AgGroupOps.CompositionBase := function( system )

    local first,           # list containing the first element of each layer
          maxDepth,        # length of system.base
          series,          # list of groups
          N,               # group of series
          generators,      # generators of N
          alpha,           # isomorphism
          i;

    InfoSagGroup2("#I  constructing semispecial ag group and isomorphism\n");
    maxDepth := Length( system.base );

    # if a chief series is given, then use it; otherwise take the LG-series
    if IsBound( system.chieffirst )  then
        first := system.chieffirst;
    else
        first := system.first;
    fi;

    # construct series
    series := [];
    for i  in [ 1..Length( first )-1 ]  do
        generators := Sublist( system.base, [ first[i]..maxDepth ] );
        Sort( generators, 
              function(a, b) return DepthAgWord(a) < DepthAgWord(b);
              end );
        N := system.G.operations.AgSubgroup(system.G, generators, false);
        Normalize ( N );
        Add ( series, N );
    od;
    Add ( series, system.G.operations.AgSubgroup(system.G, [], true));
    alpha := IsomorphismAgGroup ( series ) ;
    Unbind( system.G );

    # include information in system 
    system.H           := alpha.range;
    system.base        := Copy( Cgs ( alpha.range ) );
    system.bijection   := alpha;

end; 

 
#############################################################################
##
#F  AgGroupOps.LeastBadHallIndex( <system>, <index> ) . . . . least bad index
##
##  'LeastBadHallIndex' is called  in  'ChangeBase'  and  it  searches  the 
##  smallest base element of the group below the ith base element which has
##  power/commutator that involves different primes.
##
AgGroupOps.LeastBadHallIndex := function ( system, i )

    local U,               # group below the ith base element
          pj, pi, pU,      # primes of j, i, U
          bad,             # index
          w,               # power/commutator
          exponents,       # list of exponents
          maxDepth,        # 
          j, k;

    maxDepth := Length( system.base );
    U := system.H.operations.AgSubgroup( system.H, 
                  Sublist( system.base, [ i+1..maxDepth ] ), false );
 
    # get primes
    pi := system.weights[ i ][ 3 ];
    pU := Sublist ( system.weights, [ i+1..maxDepth ] );

    # run through powers/commutators and search for bad one
    bad := maxDepth + 1;
    for j  in [ i .. maxDepth ]  do
        if j = i  then
            w := system.base[ i ] ^ pi;
            pj := pi;
        else
            w := Comm( system.base[ j ], system.base[ i ] );
            pj := system.weights[ j ][ 3 ];
        fi;
        if w <> system.H.identity  then
            exponents := Exponents( U, w );
            k := 1;

            # run through exponent list until bad entry is found
            while k <= Length( exponents )  do

                # test primes
                if exponents[k]<>0 and pi<>pU[k][3] and pj<>pU[k][3]  then
                    bad := Minimum( bad, k+i );
                    k := Length( exponents ) + 1;  
                else
                    k := k + 1;
                fi;
            od;
        fi;

        # if bad is minimal return; otherwise go on 
        if i = bad -1  then
            return bad;
        fi;
    od;
    return bad;
end;


#############################################################################
##
#F  AgGroupOps.LeastBadComplementIndex( <system>, <index> ) . least bad index
##
##  'LeastBadComplementIndex' searches for the  smallest base   element which
##  contradicts the splitting condition.
##
AgGroupOps.LeastBadComplementIndex := function( system, i )

    local U,         # composition subgroup below i
          bad,       # least bad  index
          w,         # power/commutator
          exponents, # exponent vector of w  in layer
          maxDepth,  # composition length
          j, k;

    maxDepth := Length( system.base );
    U := system.H.operations.AgSubgroup(system.H, 
                  Sublist( system.base, [i+1..maxDepth] ), false );

    # run through powers/commutators
    bad := maxDepth + 1;
    for j  in [ i..maxDepth ]  do
        if j = i  then
            w := system.base[ i ] ^ system.weights[ i ][ 3 ];
        else
            w := Comm( system.base[ j ], system.base[ i ] );
        fi;
        if w <> system.H.identity   then
            exponents := Exponents( U, w );
            k := 1;

            # run through exponent list until bad entry is found
            while k <= Length( exponents )  do

                # test if a bad one is found
                if exponents[k] <> 0
                   and system.weights[k+i][2] = 1
                   and system.weights[i][1] < system.weights[k+i][1]
                   and system.weights[j][1] < system.weights[k+i][1]
                then
                    bad := Minimum( bad, i+k );
                    k := Length( exponents ) + 1;
                else
                    k := k + 1;
                fi;
            od;
        fi;

        # if bad is minimal return; otherwise go on
        if i = bad - 1  then
            return bad;
        fi;
    od;
    return bad;
end;


#############################################################################
##
#F  AgGroupOps.LeastBadNormalizerIndex( <system>, <index> ) . least bad index
##
##  'LeastBadNormalizerIndex'  returns the least   index that contradicts the
##  conditions for the system normalizer.
##
AgGroupOps.LeastBadNormalizerIndex := function ( system, i )

    local U,         # composition subgroup below i
          bad,       # least bad  index
          w,         # commutator
          exponents, # exponent vector of w  in layer
          maxDepth,  # composition length
          pi, pU, pj,
          j, k;

    maxDepth := Length( system.base );

    # if it cannot be a bad index, return
    if not system.weights[ i ][ 4 ]  then
        return maxDepth + 1;
    fi;

    U := system.H.operations.AgSubgroup(system.H, 
                  Sublist( system.base, [i+1..maxDepth] ), false );

    bad := maxDepth + 1;
    for j  in [ 1..maxDepth ]  do
        w := Comm( system.base[ j ], system.base[ i ] );

        # get prime
        pj := system.weights[ j ][ 3 ];
        if w <> system.H.identity   then
            exponents := Exponents( U, w );
            k := 1;

            # run through exponent list until bad entry is found
            while k <= Length( exponents )  do

                ## test if it's a bad normalizer index 
                if exponents[k] <> 0 and pj <> system.weights[i+k][3]  then
                    if i + k < bad  then
                        bad := i + k;
                    fi;
                    k := Length( exponents ) + 1;
                else
                    k := k + 1;
                fi;
            od;
        fi;

        ## if bad is minimal return; otherwise go on
        if i = bad - 1  then
            return bad;
        fi;
    od;
    return bad;

end;


#############################################################################
##
#F  AgGroupOps.LocalInvariantSubspace( <K>, <N>, <M>, <p> ) . . inv. subspace
##
##  <K>, <N> and <M> should be ag groups with <K> > <N>  > <M> and <N>/<M> is
##  a Z_<p>-vectorspace.
##
##  'LocalInvariantSubspace' returns a record with entries 'Q', 'P', 'where',
##  'B'.   <Q> <  <K>,  <Q> is the ag   group generated by  all generators in
##  <K>/<N> with prime <> <p>.  <P>  < <K>, <P>  is the ag group generated by
##  all generators in <K>/<N> with prime = <p>.  <where> is a list containing
##  the places of gens of <K>/<N> which have prime <p> (positive) or prime <>
##  <p>  (negative).   <B> <  <K>, <B>   is  the ag  group   generated by all
##  generators y in <N>/<M> such that y^x = y for all x in <Q>.
##
AgGroupOps.LocalInvariantSubspace := function( K, N, M, p )

    local Q,         # p - prime generators of K/N
          QM,        # operation of Q on gensNM
          P,         # p - subgroup of K/N
          gensNM,    # generators of NM
          NM,        # N/M
          B,         # fixed points
          v,         # element of gensNM 
          b,         # corresponding element of NM
          where,     # where the p and p-prime elements are
          gensKN,    # generators of K/N
          length,
          j, k, l;

    gensKN := FactorArg( K, N ).generators;
    Q := Filtered( gensKN, x -> RelativeOrderAgWord( x ) <> p );
    P := Filtered( gensKN, x -> RelativeOrderAgWord( x ) = p );
    P := K.operations.AgSubgroup( K, P, false );

    where := [];
    l := 1;
    k := 1;
    for j  in [ 1..Length( gensKN ) ]  do
        if RelativeOrderAgWord( gensKN[ j ] ) = p  then
            where[ j ] := l;
            l := l + 1;
        else
            where[ j ] := -k;
            k := k + 1;
        fi;
    od;

    gensNM := FactorArg( N, M ).generators;
    NM := N mod M;
    if Q = []  then
        B := gensNM;
    else
        QM := List(Q, x -> List(gensNM, y -> Exponents(NM, y^x, GF(p))));
        B := BaseFixedSpace( QM );
        for j  in [ 1..Length( B ) ]  do
            v := B[ j ];
            b := K.identity;
            for k  in [ 1..Length( v ) ]  do
                b := b * gensNM[ k ] ^  Int( v[ k ] );
            od;
            B[ j ] := b;
        od;
    fi;

    Q := K.operations.AgSubgroup ( K, Q, false );
    B := K.operations.AgSubgroup ( K, B, false );

    return rec( B     := B,
                P     := P,
                Q     := Q,
                where := where );
end;


#############################################################################
##
#F  AgGroupOps.ChangeBase( <system>, <i>, <flag> ) change <i>.th base element
##
##  'ChangeBase'   runs through the  base elements  below  the <i>-th one and
##  corrects the <i>-th element of 'base' for  all base elements which have a
##  bad index. A bad index can be a bad complement index, a bad Hall index or
##  a bad system normalizer index as <flag> indicates.
##
AgGroupOps.ChangeBase := function ( system, i, flag )

    local bad1, bad2, bad3,  # bad indices of different kinds
          k,                 # first bad  index
          layer,             # layer with bad  index
          first,             # first element of this layer
          next,              # first element of next layer
          size,              # size of layer
          maxDepth,          # composition length
          N, M,              # subgroups of system.H such that N/M is layer
          gensNM, NM,        # N/M and generators
          U,                 # composition subgroup below system.base[ i ]
          gensUN,            # generators of U/N
          A,                 # operation on layer
          ai, aij,           # operating elements
          B, v,              # one equation system
          E, V,              # simultaneuos linear equation system
          F,                 # enlarged simultaneuos linear system
          pi, pj, pk,        # involved primes
          g,                 # power/commutator
          solution,          # one solution of simultaneuos system or false
          Subs,              # record contaning invariant subspaces
          P,                 # p-Sylow subgroup of U/N
          Inv,               # invariant subspace of NM under operation of UN
          alpha,             # natural homomorphism on H / M
          oc,                # one-cocycles as vectorspace
          cocycles,          # cocycles as group elements
          bigcocycles,       # cocycles blown up
          co,                # bigcocyles transposed
          I,                 # identity matrix
          Z,                 # zero matrix
          H, HM,             # subgroup below system.base[i-1]
          com,               # igs of a complement
          K,                 # new presentation
          j, l, h; 

    maxDepth := Length( system.base );

    # get in the case that flag indicates
    if flag = "noHall"  then
        bad1 := false;
        bad2 := false;
        bad3 := system.H.operations.LeastBadComplementIndex( system, i );
        k := bad3;
    elif flag = "noHead"  then
        bad1 := false;
        bad2 := system.H.operations.LeastBadHallIndex( system, i );
        bad3 := false;
        k := bad2;
    elif flag = "public"  then
        bad1 := false;
        bad2 := system.H.operations.LeastBadHallIndex( system, i );
        bad3 := system.H.operations.LeastBadComplementIndex( system, i );
        k := Minimum( bad2, bad3 );
    elif flag = "normalizer"  then
        bad1 := system.H.operations.LeastBadNormalizerIndex( system, i );
        bad2 := system.H.operations.LeastBadHallIndex( system, i );
        bad3 := system.H.operations.LeastBadComplementIndex( system, i );
        k := Minimum( bad1, bad2, bad3 );
    fi;

    # trivial case
    if k > Length( system.base )  then
        InfoSagGroup2( "#I  change base: ", i, " has no bad index\n" );
        return i;
    fi;
    InfoSagGroup2( "#I  change base: ", i, " has bad index = ", k );

    U := system.H.operations.AgSubgroup(system.H, 
                             system.base{[i+1..maxDepth]}, false );

    # get the layer
    layer := system.layers[ k ];
    first := system.first[ layer ];
    next := system.first[ layer + 1 ];

    # if it's a bad normalizer index and first is too small take chief series
    if first <= i then
        layer := system.chieflayers[ k ];
        first := system.chieffirst[ layer ];
        next := system.chieffirst[ layer + 1 ];
    fi;

    size := next - first;

    # get factor group of this layer
    N := system.H.operations.AgSubgroup(system.H, 
                  Sublist( system.base, [first..maxDepth] ), false );
    M := system.H.operations.AgSubgroup(system.H, 
                  Sublist( system.base, [next ..maxDepth] ), false );
    NM := N mod M;
    gensNM := NM.generators;

    # InitializeSystem inhomogenous system  
    V := [];
    E := List([1..size], x -> []);

    # get primes
    pi := system.weights[ i ][ 3 ];
    pk := system.weights[ k ][ 3 ];

    # if bad is a bad complement index
    if k = bad3  then
        InfoSagGroup2(" HeadComplements\n"); 

        # run through powers and commutators 
        for j  in [ i..first-1 ]  do
            if i = j  then
                g := system.base[ i ] ^ pi;
            else
                g := Comm( system.base[ j ], system.base[ i ] );
            fi;

            # exponent vector of g  in NM
            v := Sublist( Exponents(U, g, GF(pk)), [first-i..next-i-1] );
        
            # corresponding matrix
            if j > i  then
                aij := system.base[ j ] ^ system.base[ i ];
                A := List( gensNM, x -> Exponents( NM, x^aij, GF(pk) ) );
                B := A - A ^ 0;
            else
                ai := system.base[ i ];
                A := List(gensNM, x-> Exponents(NM, x^ai, GF(pk)));
                I := A ^ 0;
                B := I;
                for l  in [ 1..pi-1 ]  do
                    B := B * A + I;
                od;
                B := - B;
            fi;

            # append to system
            for l  in [ 1..size ]  do
                Append( E[ l ], B[ l ] );
            od;
            Append( V, v );
        od;

    # if it's a bad Hall index
    elif k = bad2  then
        InfoSagGroup2(" Hall subgroups\n"); 

        # run through powers and commutators
        for j  in [ i..first-1 ]  do
   
            # get prime
            pj := system.weights[ j ][ 3 ];

            if i = j  then
                g := system.base[ i ] ^ pi;
            elif pj <> pk  then
                g := Comm( system.base[ j ], system.base[ i ] );
            fi;
            if pj <> pk  then

                # exponentvector of g  in NM
                v := Sublist( Exponents(U, g, GF(pk)), [first-i..next-i-1] );

                # corresponding matrix
                if j > i  then
                    aij := system.base[ j ] ^ system.base[ i ];
                    A := List(gensNM, x -> Exponents(NM, x^aij, GF(pk)));
                    B := A - A ^ 0;
                else
                    ai := system.base[ i ];
                    A := List(gensNM, x-> Exponents(NM, x^ai, GF(pk)));
                    I := A ^ 0;
                    B := I;
                    for l  in [ 1..pi-1 ]  do
                        B := B * A + I;
                    od;
                    B := - B;
                fi;

                # append to system 
                for l  in [ 1..size ]  do
                    Append( E[ l ], B[ l ] );
                od;
                Append( V, v );
            fi;
        od;

    # if bad is a bad normalizer index
    elif k = bad1  then
        InfoSagGroup2(" system normalizer\n"); 

        # run through commutators
        for j  in [ 1..first-1 ]  do
            pj := system.weights[ j ][ 3 ];
            if i <> j and pj <> pk  then
                g := Comm( system.base[ j ], system.base[ i ] );

                # exponentvector of g  in NM
                v := Sublist( Exponents(U, g, GF(pk)), [first-i..next-i-1] );

                # corresponding matrix
                aij := system.base[ j ] ^ system.base[ i ];
                A := List( gensNM, x -> Exponents( NM, x^aij, GF(pk) ) );
                B := A - A ^ 0;

                # append to system 
                for l  in [ 1..size ]  do
                    Append( E[ l ], B[ l ] );
                od;
                Append( V, v );
            fi;
        od;
    fi;

    # try to solve inhomogenous systems simultaneously
    solution := SolutionMat( E, V );

    if not IsBool( solution )  then

        # calculate new i-th base element
        ai := system.base[ i ];
        for j  in [ 1..Length( gensNM ) ]  do
            ai := ai * gensNM[ j ] ^ Int( solution[ j ] );
        od;
        system.base[ i ] := ai;

        # and return
        return system.H.operations.ChangeBase( system, i, flag );

    # if it is not solvable cohomology must be used
    else
        if k <> bad3  then
            Error("ChangeBase : Hall or normalizer base is wrong");
        elif system.weights[ i ][ 1 ] <> system.weights[ first ][ 1 ] - 1  then
            Error("ChangeBase : complement base is wrong");
        fi;

        InfoSagGroup2("#I  change base: ", i, ": use cohomology\n" );

        # calculate Z^1(U / N, N / M)
        # first calculate Z^1(P, Inv) where P is the p-Sylow subgroup of
        # the nilpotent group U / N and Inv is the subgroup of N/M which
        # is invariant under operation of U/N
        Subs:= system.H.operations.LocalInvariantSubspace( U, N, M, pk );

        # go over to factor group
        alpha := NaturalHomomorphism( system.H, system.H / M );
        P     := Image( alpha, Subs.P );
        Inv   := Image( alpha, Subs.B );
        oc    := rec( group := P, module := Inv );
        OneCocyclesOC( oc, true );
        cocycles := List( oc.oneCocycles.generators, oc.cocycleToList );

        # then blow up cocycles
        bigcocycles := List( [ 1..Length( cocycles ) ], x -> [ ] );
        for j  in [ 1..Length( cocycles ) ]  do
            for l  in Subs.where  do
                if l < 0  then
                    Add( bigcocycles[ j ], system.H.identity );
                else
                    Add( bigcocycles[ j ], 
                         PreImagesRepresentative( alpha, cocycles[j][l] ));
                fi;
            od;
        od;
        co := TransposedMat( bigcocycles );

        # calculate corresponding matrices and append system
        F := List( [ 1..Length( co[ 1 ] ) ], x -> [ ] );
        for j  in [ 1..Length( co ) ]  do
            aij := Comm( system.base[ i+j ], system.base[ i ] );
            ai := system.base[ i ];
            A := List( co[j], x -> Exponents(NM, x^aij, GF(pk) ) );
            B := List( co[j], x -> Exponents(NM,(x^-1)^ai, GF(pk) ) );
            B := A + B;
            Z := A - A;
            if j = 1  then
                for l  in [ 1..Length( co[j] ) ]  do
                    Append( F[l], Z[l] );
                od;
            fi;
            for l  in [ 1..Length( co[ j ] ) ]  do
                Append( F[l], B[l] );
            od;
        od;
        Append( E, F );

        # try to solve enlarged inhomogenous system  
        solution := SolutionMat( E, V );

        if not IsBool( solution ) then
            # calculate new i-th base element
            ai := system.base[ i ];
            for j  in [ 1..Length( gensNM ) ]  do
                ai := ai * gensNM[ j ] ^ Int( solution[ j ] );
            od;
            system.base[ i ] := ai;

            # calculate elements corresponding to cocycles
            gensUN := system.base{[ i+1..first-1 ]};
            for j  in [ 1..Length( gensUN ) ]  do
                ai := system.base[ i+j ];
                for l  in [ 1..Length( co[ j ] ) ]  do
                    ai := ai * co[j][l]^Int(solution[Length(gensNM) + l]);
                od;
                system.base[ i + j ] := ai;
            od;

        # if not solution is found we need to use a stronger method
        else
            InfoSagGroup2("#I  change base: ", i, ": use strong cohomology\n");

            # prepare information
            H := system.H.operations.AgSubgroup(system.H, 
                                           system.base{[i..maxDepth]}, false);

            # go over to factor group
            HM := Image( alpha, H );
            NM := Image( alpha, N );

            # take complement and change system.base
            com := Igs( Complement(HM, NM) );
            com := List( com, x -> PreImagesRepresentative(alpha,x));
            for j in [1..Length(com)] do
                system.base[j+i-1] := com[j];
            od;
 
            # now we have to change the presentation
            K        := Subgroup(system.H, system.base);
            K.igs    := system.base;
            K.operations.AddShiftInfo(K);
            system.H := AgGroupFpGroup( FpGroup(K) ); 

            # compute isomorphism
            system.bijection := system.bijection*GroupHomomorphismByImages( 
                                K, system.H, Igs(K), system.H.generators );

            # update information
            system.base := system.H.generators;
        fi;

        # return 
        return first;
    fi;
end;

#############################################################################
##
#V  SagGroupOps . . . . . . . . . . . operations record for special ag groups
##
SagGroupOps := Copy(AgGroupOps);


#############################################################################
##
#F  SpecialAgGroup( <G>, <flag> ) . . . . . . . . compute a special ag system
##
##  'SpecialAgGroup' returns   an isomorphic ag  group to  <G>   which has a
##  Leedham-Green series  refined by the  ag system,  public Hall subgroups
##  and public head-complements. The group record  has additionally the 
##  following entries.
##
##  'weights'	    a list of LG-weights of the gens of the output group
##  'layers'	    a list,  giving the number of the layer in the  LG-series
##                  of the corresponding generator
##  'first'	    a list,  giving the number of the first gen in a layer
##  'head'          a list,  giving the number of the first gen in a head
##  'tail'          a list,  giving the number of the first gen in a tail
##  'bijection'     the isomorphism from the output group to <G>
##
##  if <flag> = "noPublic", then only a semispecial ag system is calculated.
##  if <flag> = "noHall", then no public Hall groups are calculated.
##  if <flag> = "noHead", then no public head-complements are calculated.
##  if <flag> = "normalizer", then the system normalizer is included.
##               Additionally the record entries 'chieflayers' and 'chieffirst'
##               are included, which do the same as the entries 'layers' and
##               'first' for the chief series. This chief series is only  
##               calculated in this case and is refined by the ag system.
##
SpecialAgGroup := function( arg )
    local  G,  H,  K,  system,  wf,  i,  alpha;
            
    # check if a special ag group is already known
    G := arg[1];
    if IsBound(G.sagGroup)
       and ( Length(arg) = 1 or arg[2] <> "normalizer" )
    then
        return G.sagGroup;
    fi;

    # get trivial case 
    if 0 = Length(Cgs(G))  then
      H                    := Copy(G);
      H.weights            := [];
      H.layers             := [];
      H.first              := [];
      H.head               := [];
      H.tail               := [];
      H.isHallSystem       := true;
      H.isHeadSystem       := true;
      H.isNormalizerSystem := true;
      H.bijection          := GroupHomomorphismByImages( G, H, [], [] );
      H.operations         := SagGroupOps;
      G.sagGroup           := H;
      return H;
    fi;

    # use Leedham-Green weights
    wf := SagWeights;

    # construct LG-series
    InfoSagGroup2("#I  constructing LG-series and semispecial ag system\n");

    system := G.operations.InitializeSystem( G, G.cgs, wf );
    G.operations.EcheloniseBase( system );
    G.operations.GetLgLayer( system );

    # if <flag> = "normalizer", then calculate a chief series.
    if Length( arg ) = 2 and arg[ 2 ] = "normalizer" then
        G.operations.RefineToChiefSeries( system );
        G.operations.GetCentralLgLayers( system );
    fi;

    # compute the isomorphic semispecial ag group
    G.operations.CompositionBase( system );

    # construct public subgroups
    if Length(arg) = 1 or (Length(arg) = 2 and not arg[2] = "noPublic")  then
        InfoSagGroup2("#I  constructing public subgroups\n");
    fi;

    # compute all if only an ag group is given
    if Length( arg ) = 1  then
        i := system.first[ Length( system.first ) -1 ]-1;
        while i >= 1  do
            i := G.operations.ChangeBase( system, i, "public" );
            i := i - 1;
        od;
        system.isHallSystem       := true;
        system.isHeadSystem       := true;
        system.isNormalizerSystem := false;

    # if the second arg is "noHall" do not compute Hall groups
    elif arg[ 2 ] = "noHall"  then
        i := system.head[ Length( system.head ) -1 ] - 1;
        while i >= 1  do
            i := G.operations.ChangeBase( system, i, "noHall" );
            i := i - 1;
        od;
        system.isHallSystem       := false;
        system.isHeadSystem       := true;
        system.isNormalizerSystem := false;

    # if the second arg is "noHead" do not compute head-complements
    elif arg[ 2 ] = "noHead"  then 
        i := system.first[ Length( system.first ) -1 ] - 1;
        while i >= 1  do
            G.operations.ChangeBase( system, i, "noHead" );
            i := i - 1;
        od;
        system.isHallSystem       := true;
        system.isHeadSystem       := false;
        system.isNormalizerSystem := false;

    # if the second arg is "noPublic" compute a semispecial system
    elif arg[ 2 ] = "noPublic"  then
        system.base               := system.H.generators;
        system.isHallSystem       := false;
        system.isHeadSystem       := false;
        system.isNormalizerSystem := false;

    # if the second arg is "normalizer" compute systemnormalizer additionally
    elif arg[ 2 ] = "normalizer"  then

        InfoSagGroup2("#I  calculating a public Hall system\n");
        i := system.first[ Length( system.first ) -1 ] - 1;
        while i >= 1  do
            G.operations.ChangeBase( system, i, "noHead" );
            i := i - 1;
        od;

        InfoSagGroup2("#I calculating the other public subgroups\n");
        i := Length( system.base );
        while i >= 1  do
            i := G.operations.ChangeBase( system, i, "normalizer" );
            i := i - 1;
        od;
        system.isHallSystem       := true;
        system.isHeadSystem       := true;
        system.isNormalizerSystem := true;
    fi;

    if system.H.generators <> system.base  then
        InfoSagGroup2("#I  computing the new group and isomorphism\n");

        # compute a new group <K>
        H     := Subgroup( system.H, system.base );
        H.igs := system.base;
        H.operations.AddShiftInfo(H);
        K := AgGroupFpGroup( FpGroup ( H ) );

        # compute isomorphism
        alpha := GroupHomomorphismByImages( H, K, Igs(H), K.generators );
        K.bijection := InverseMapping( system.bijection * alpha );
    else
        K := system.H;
        K.bijection := InverseMapping( system.bijection );
        Unbind( K.normalized );
    fi;

    # change ops entry
    K.operations         := AgGroupOps;
    K.isHallSystem       := system.isHallSystem;
    K.isHeadSystem       := system.isHeadSystem;
    K.isNormalizerSystem := system.isNormalizerSystem;
    K.cgs                := K.generators;

    # and update information
    K.weights := system.weights;
    K.layers  := system.layers;
    K.first   := system.first;
    K.head    := system.head;
    K.tail    := system.tail;
    
    # include information about chief series if possible
    if Length( arg ) = 2 and arg[ 2 ] = "normalizer"  then
        K.chieffirst  := system.chieffirst;
        K.chieflayers := system.chieflayers;
    fi;

    # store information
    if K.isHallSystem and K.isHeadSystem  then
        G.sagGroup   := K;
        K.isSagGroup := true;
        K.operations := SagGroupOps;
    fi;

    # and return <K>
    return K;

end;


#############################################################################
##
#V  Read  . . . . . . . . . . . . . . . . . read other special ag group stuff
##
ReadLib("sagsbgrp");
