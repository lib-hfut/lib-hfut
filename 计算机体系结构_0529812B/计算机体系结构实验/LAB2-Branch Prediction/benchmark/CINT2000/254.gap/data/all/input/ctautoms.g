#############################################################################
##
#A  ctautoms.g                  GAP library                     Thomas Breuer
##
#A  @(#)$Id: ctautoms.g,v 3.15 1993/03/17 16:57:04 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions to calculate automorphisms of matrices, e.g.
##  the character matrices of character tables, and functions to calculate
##  permutations transforming the rows of a matrix to the rows of another
##  matrix.
##
#H  $Log: ctautoms.g,v $
#H  Revision 3.15  1993/03/17  16:57:04  sam
#H  just some improvements
#H
#H  Revision 3.14  1993/03/16  09:04:31  sam
#H  fixed bug in 'TransformingPermutations'
#H
#H  Revision 3.13  1993/02/09  14:22:15  sam
#H  fixed VERY BAD BUG in 'TransformingPermutationsCharTables'
#H
#H  Revision 3.12  1992/08/07  10:00:26  sam
#H  'TableAutomorphisms' returns now a proper group (not a subgroup)
#H
##

#############################################################################
##
#F  InfoCharTable1( ... ) . . . info function for the character table package
#F  InfoCharTable2( ... ) . . . info function for the character table package
##
    if not IsBound( InfoCharTable1 )  then InfoCharTable1 := Ignore;  fi;
    if not IsBound( InfoCharTable2 )  then InfoCharTable2 := Ignore;  fi;


#############################################################################
##
#F  InfoPermGroup1( ... ) . .  information function for the permgroup package
#F  InfoPermGroup2( ... ) . .  information function for the permgroup package
##
    if not IsBound( InfoPermGroup1 )  then InfoPermGroup1 := Ignore;  fi;
    if not IsBound( InfoPermGroup2 )  then InfoPermGroup2 := Ignore;  fi;


#############################################################################
##
#F  FamiliesOfRows( <mat>, <maps> )
##
##  distributes the rows of <mat> to families:
##  Two rows of <mat> belong to the same family if there is a permutation
##  of columns that maps one row to the other row;
##  all elements of <maps> are regarded as family of length 1.
##
##  'FamiliesOfRows( <mat>, <maps> )' returns a record with fields
##  'famreps':      list of representatives for each family,
##  'permutations': list that contains at position 'i' a list of permutations
##                  which map the members of the family with representative
##                  'famreps[i]' to that representative,
##  'families':     list that contains at position <i> the list of positions
##                  of members of the family of representative 'famreps[<i>]';
##                  (for the element '<maps>[i]' the only member of the family
##                  will get the number 'Length( <mat> ) + i'.
##
FamiliesOfRows := function ( mat, maps )
    local i, j, k, famreps, permutations, copyrow, permrow, pos, famlengths,
          actperm, families, row;

    famreps:= [ Copy( mat[1] ) ];    # (sorted) representatives for families
    permutations:= [ [ Sortex( famreps[1] ) ] ];
                                     # list of perms for each family
    families:= [ [ 1 ] ];            # list of members of each family

    for j in [ 2 .. Length( mat ) ] do
      copyrow:= Copy( mat[j] );
      permrow:= Sortex( copyrow ); # copyrow is sorted (not stable)
      pos:= PositionSorted( famreps, copyrow );
      if IsBound( famreps[ pos ] ) and famreps[ pos ] = copyrow then
        Add( permutations[ pos ], permrow );
        Add( families[ pos ], j );
      else                        # new family
        for k in Reversed( [ pos .. Length( famreps ) ] ) do
          famreps[ k+1 ]:= famreps[k];
          permutations[ k+1 ]:= permutations[k];
          families[ k+1 ]:= families[k];
        od;
        famreps[ pos ]:= copyrow;
        permutations[ pos ]:= [ permrow ];
        families[ pos ]:= [ j ];
       fi;
    od;
    j:= Length( mat );
    for row in maps do
      j:= j+1;
      Add( famreps, Copy( row ) );
      Add( permutations, [ Sortex( famreps[ Length( famreps ) ] ) ] );
      Add( families, [ j ] );
    od;
    famlengths:= [];               # sort families according to length
    for i in [ 1 .. Length( famreps ) ] do
      famlengths[i]:= Length( permutations[i] );
    od;
    actperm:= Sortex( famlengths );
    return rec( famreps:= Permuted( famreps, actperm ),
                permutations:= Permuted( permutations, actperm ),
                families:= Permuted( families, actperm ) );
    end;


#############################################################################
##
#F  MatAutomorphismsFamily( <G>, <K>, <family>, <permutations> )
##
##  for a family <rows> of rows with representative (i.e. sorted vector)
##  <famrep> and corresponding permutations
##  'Sortex(<rows>[j])=<permutations>[j]',
##  the group of column permutations in <G> is computed that acts on
##  the set <rows>.
##
##  <family> is a list that distributes the columns into families:
##  Stabilizing <family> is equivalent to stabilizing <famrep>; so the
##  elements of <permutations> must be computed with respect to <family>, too.
##  Two columns <i>, <j> lie in the same family iff
##  '<family>[<i>] = <family>[<j>'.
##  (More precisely, <family>[i] is the list of all positions lying in the
##  same family as i.)
##
##  <K> is a list of permutation generators for a known subgroup of the
##  required group.
##
##  Note: The returned group has a base compatible with the base of <G>,
##        i.e. not a reduced base (used for "TransformingPermutationFamily")
##
MatAutomorphismsFamily := function( G, K, family, permutations )
    local j, k, stabilizes, famlength, nonbase, ElementPropertyCoset,
          FindSubgroupProperty, allowed, gen;

    famlength:= Length( permutations );
        
    # compute a stabilizer chain for $G$.
    # select an optimal base that allows us to prune  the  tree  efficiently!
    
    MakeStabChain( G );
    nonbase:= Difference( [ 1 .. Length( family) ], G.operations.Base( G ) );
    
    # call a modified version of 'SubgroupProperty'\:
    #   The subgroup <K> is a parameter.
    #   new parameter <allowed>\: a list with same length as <permutations>;
    #   '<allowed>[<i>]' is the list of all <x> in <permutations> where the
    #   constructed permutation can lie in
    #   '<permutations>[<i>] * Stab( <family> ) / <x>'.
    #   (at the beginning this is <permutations>)
    #   Note that <allowed> will be adjusted when an image
    #   of a basepoint is chosen.
    
    # find a subgroup  $K$  of  $G$  which  preserves  the  property  <prop>,
    # i.e., $prop( x )$ implies $prop( x * k )$  for all  $x \in G, k \in K$.
    # since this subgroup is changed in the algorithm use 'Copy' or  'Group'.
    # make this  subgroup  as  large  as  possible  with  reasonable  effort!
    
    # here: parameter subgrp; add these generators of <G> which stabilize the
    #       whole row family, i.e. for which holds
    #       '<family>[i] = <family>[ i^ ( x^-1 * gen * x ) ]'.
    
    stabilizes:= function( family, gen, x )
    local i;
    for i in [ 1 .. Length( family ) ] do
      if family[ i^x ] <> family[ ( i^gen )^x ] then return false; fi;
    od;
    return true;
    end;

    K:= Set( K );
    for gen in G.generators do
      if ForAll( permutations, x -> stabilizes( family, gen, x ) ) then
        AddSet( K, gen );
      fi;
    od;
    K:= Group( K, () );

    # make the bases compatible
    MakeStabChain(   K, G.operations.Base( G ) );
    ExtendStabChain( K, G.operations.Base( G ) );

    # initialize allowed
    allowed:= List( [ 1 .. famlength ], x -> permutations );
    
    # and now: the functions!
    
    # search through the whole group $G = G * Id$ for an element with <prop>.

    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    # $L$ fixes $S*s$, i.e., $S*s*L = S*s$ and is a subgroup  of  the  wanted
    # subgroup $K$, thus $prop( x )$ implies $prop( x*l )$ for all $l \in L$.

    ElementPropertyCoset := function ( S, s, L, allowed )
        local  i, j, x, points, p, ss, LL, elm, l, newallowed, union;

        # if $S$ is the trivial group check whether  $s$  has  the  property,
        # i.e. also the non-basepoints map correctly\:

        if S.generators = [] then
          for i in [ 1 .. famlength ] do
            for p in nonbase do
              allowed[i]:= Filtered( allowed[i],
              x -> ( p^s )^x in family[ p^permutations[i] ] );
            od;
            if allowed[i] = [] then return false; fi;
          od;
          return s;
        fi;

        # make 'points' a subset  of  $S.orbit ^ s$  of  those  points  which
        # correspond to cosets that might contain elements satisfying <prop>.
        # make  this  set  as  small  as  possible  with  reasonable  effort!
        points := Set( OnTuples( S.orbit, s ) );

    # better: for the basepoint '$b$ = S.orbit[1]' we have
    #         $b \pi \in orbit \cap \bigcap_{i}
    #         \bigcup_{\pi_j \in 'allowed[i]'} [ family( b \pi_i ) ] \pi_j^{-1}$

        for i in [ 1 .. famlength ] do
          union:= [];
          for j in allowed[i] do
            UniteSet( union, List( family[ S.orbit[1] ^ permutations[i] ],
                                   x -> x / j ) );
          od;
          IntersectSet( points, union );
        od;

        # run through the points, i.e., through the cosets of the stabilizer.
        while points <> []  do

            # take a point $p$.
            p  := points[1];

            # find coset representant, i.e., $ss  \in  S, S.orbit[1]^ss = p$.
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;

            # find a subgroup $LL$  of  $L$  which fixes $S.stabilizer * ss$,
            # i.e., an approximation (subgroup) $LL$ of $Stabilizer( L, p )$.
            # note that $LL$ preserves <prop> since it is a subgroup  of $L$.
            # compute a better aproximation, for example using  'ChangeBase'!
            LL:= Subgroup( Parent(G), Filtered( L.generators, l->p^l=p ) );

            # search the coset $S.stabilizer * ss$ and  return if successful.

    # now adjust allowed: 

            newallowed:= [];
            for i in [ 1 .. famlength ] do
              newallowed[i]:= Filtered( allowed[i], x -> p^x in
                                       family[ S.orbit[1]^permutations[i] ] );
            od;

            elm := ElementPropertyCoset( S.stabilizer, ss, LL, newallowed );
            if elm <> false  then return elm;  fi;

            # if there was no element in $S.stab * Rep(p)$ satisfying  <prop>
            # there can be none in  $S.stab * Rep(p^l) = S.stab * Rep(p) * l$
            # for any $l \in L$ because $L$ preserves  the  property  <prop>.
            # thus we can remove the entire $L$ orbit of $p$ from the points.
            SubtractSet( points, G.operations.Orbit(L,p,OnPoints) );
        od;

        # there is no element with the property <prop> in the coset  $S * s$.
        return false;
    end;

    # make $L$ the subgroup with the property of some stabilizer $S$ of  $G$.
    # upon  entry  $L$  is  already  a  subgroup  of  this  wanted  subgroup.
    FindSubgroupProperty := function ( S, L, allowed )
        local  points, p, ss, LL, elm, l, newallowed, union, orb, len, k, i,
               gens;

        # if $S$ is the trivial group, then so  is  $L$  and  we  are  ready.
        if S.generators = [] then return;  fi;

        # make $L.stab$ the full  subgroup  of  $S.stab$  satisfying  <prop>.

    # now adjust allowed: (we search in the stabilizer of S.orbit[1])

        newallowed:= [];
        for i in [ 1 .. famlength ] do
          newallowed[i]:= Filtered( allowed[i],
                                    x -> S.orbit[1]^x in
                                   family[ S.orbit[1]^permutations[i] ] );
        od;

        FindSubgroupProperty( S.stabilizer, L.stabilizer, newallowed );

        # add the generators of L.stabilizer to L.generators,
        # update orbit and transversal:

        for elm in L.stabilizer.generators do
          if not elm in L.generators then
            G.operations.AddGensExtOrb( L, [ elm ] );
          fi;
        od;

        # make  'points'  a  subset  of  $S.orbit$  of  those  points   which
        # correspond to cosets that might contain elements satisfying <prop>.
        # make  this  set  as  small  as  possible  with  reasonable  effort!
        points := Set( S.orbit );

    # better: for the basepoint '$b$ = S.orbit[1]' we have
    #         $b \pi \in orbit \cap \bigcap_{i}
    #         \bigcup_{j \in 'allowed[i]'} [ family[ b \pi_i ] ] \pi_j^{-1}$

        for i in [ 1 .. famlength ] do
          union:= [];
          for j in allowed[i] do
            UniteSet( union, List( family[ S.orbit[1] ^ permutations[i] ],
                                   x -> x / j ) );
          od;
          IntersectSet( points, union );
        od;

        # suppose that $x \in S.stab * Rep(S.orbit[1]^l)$  satisfies  <prop>,
        # since $S.stab*Rep(S.orbit[1]^l)=S.stab*l$ we have $x/l \in S.stab$.
        # because $l \in L$ it follows that $x/l$ satisfies <prop> also,  and
        # since $L.stab$ is the full subgroup of $S.stab$  satisfying  <prop>
        # it follows that $x/l \in L.stab$  and so  $x \in L.stab * l \<= L$.
        # thus we can remove the entire $L$ orbit of  $p$  from  the  points.
        SubtractSet(points,G.operations.Orbit(L,S.orbit[1],OnPoints));

        # run through the points, i.e., through the cosets of the stabilizer.
        while points <> []  do

            # take a point $p$.
            p := points[1];

            # find coset representant, i.e., $ss  \in  S, S.orbit[1]^ss = p$.
            ss := S.identity;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;

            # find a subgroup $LL$  of  $L$  which fixes $S.stabilizer * ss$,
            # i.e., an approximation (subgroup) $LL$ of $Stabilizer( L, p )$.
            # note that $LL$ preserves <prop> since it is a subgroup  of $L$.
            # compute a better aproximation, for example using  'ChangeBase'!
            LL:= Subgroup( Parent(G), Filtered( L.generators, l->p^l=p ) );

            # search the coset $S.stabilizer * ss$  and  add  if  successful.

    # now adjust allowed: 

            newallowed:= [];
            for i in [ 1 .. famlength ] do
              newallowed[i]:= Filtered( allowed[i], x -> p^x in
                                       family[ S.orbit[1]^permutations[i] ] );
            od;

            elm := ElementPropertyCoset( S.stabilizer, ss, LL, newallowed );
            if elm <> false then
                G.operations.AddGensExtOrb( L, [ elm ] );
            fi;

            # if there was no element in $S.stab * Rep(p)$ satisfying  <prop>
            # there can be none in  $S.stab * Rep(p^l) = S.stab * Rep(p) * l$
            # for any $l \in L$ because $L$ preserves  the  property  <prop>.
            # thus we can remove the entire $L$ orbit of $p$ from the points.
            # <<this must be reformulated>>
            SubtractSet(points,G.operations.Orbit(L,p,OnPoints) );
        od;

        # there is no element with the property <prop> in the coset  $S * s$.
        return;
    end;
    FindSubgroupProperty( G, K, allowed );
    return K;
    end;


#############################################################################
##
#F  MatAutomorphisms( <mat>, <maps>, <subgroup> )
##
##  returns the permutation group record representing the matrix
##  automorphisms of the matrix <mat> that respect all lists in the list
##  <maps>.
##
##  <subgroup> is a permutation group record representing a subgroup of
##  this group.
##
MatAutomorphisms := function ( mat, maps, subgroup )
    local i, j, k, fam, colfam, values, famreps, permutations, pos,
          famlengths, actperm, nonfixedpoints, blocks, actval, newblocks,
          newnonfixedpoints, generators, permg, omega, block, sblock,
          support, family, famrep, G, row;

    if IsPermGroup( subgroup ) then
      subgroup:= Set( subgroup.generators );
    else
      Error( "<subgroup> must be a permutation group record" );
    fi;

    # step 1: Distribute the rows into row families

    fam:= FamiliesOfRows( mat, maps );
    mat:= Concatenation( mat, maps );
    
    # step 2: Distribute the columns into families using that row families of
    #         length 1 must be fixed by every table automorphism.
    
    nonfixedpoints:= [ [ 1 .. Length( mat[1] ) ] ];
    i:= 1;
    while i <= Length( fam.famreps ) and Length( fam.families[i] ) = 1 do
      row:= mat[ fam.families[i][1] ];
      for j in [ 1 .. Length( nonfixedpoints ) ] do
        colfam:= nonfixedpoints[j];
        values:= Set( Sublist( row, colfam ) );
        nonfixedpoints[j]:= Filtered( colfam, x-> row[x] = values[1] );
        for k in [ 2 .. Length( values ) ] do
          Add( nonfixedpoints, Filtered( colfam, x-> row[x] = values[k] ) );
        od;
      od;
      nonfixedpoints:= Filtered( nonfixedpoints, x -> Length(x) > 1 );
      i:= i+1;
    od;
    
    # step 3: Refine the column families using that members of a family must
    #         have the same sorted column in the restriction to every row
    #         family.
    #         Since trivial row families are already examined, only use
    #         nontrivial ones.
    
    while i <= Length( fam.famreps ) do
      row:= TransposedMat( Sublist( mat, fam.families[i] ) );
      for j in row do Sort( j ); od;
      for j in [ 1 .. Length( nonfixedpoints ) ] do
        colfam:= nonfixedpoints[j];
        values:= Set( Sublist( row, colfam ) );
        nonfixedpoints[j]:= Filtered( colfam, x-> row[x] = values[1] );
        for k in [ 2 .. Length( values ) ] do
          Add( nonfixedpoints, Filtered( colfam, x-> row[x] = values[k] ) );
        od;
      od;
      nonfixedpoints:= Filtered( nonfixedpoints, x -> Length(x) > 1 );
      i:= i+1;
    od;
    
    if nonfixedpoints = [] then return Group( () ); fi;
    
    # step 4: Compute a direct product of symmetric groups that covers the
    #         group of table automorphisms.
    
    generators:= [];
    for omega in nonfixedpoints do
      Add( generators, ( omega[1], omega[2] ) );        # transposition
      if Length( omega ) > 2 then
        permg:= ( omega[1], omega[2] );
        for k in [ 3 .. Length( omega ) ] do
          permg:= ( omega[k-1], omega[k] ) * permg;
        od;
        Add( generators, permg );                       # transitive cycle
      fi;
    od;
    
    # step 5: ... and now: the backtrack search for permutation groups!
    
    permutations:= fam.permutations;
    famreps:= fam.famreps;
    G:= Group( generators, () );
    
    InfoPermGroup2( "#I MatAutomorphisms: There are ",
                    Length( permutations ), " families (",
                    Length( Filtered( permutations, x-> Length(x) =1 ) ),
                    " trivial)\n" );
    
    for i in [ 1 .. Length( famreps ) ] do
      if Length( permutations[i] ) > 1 then
    
        InfoPermGroup2( "#I MatAutomorphismsFamily called for family no. ",
                        i, "\n" );
    
        # First convert <famreps>[i] to 'family': 'family[<k>]' is the list
        # of all positions <j> in <famreps>[i] with
        # '<famreps>[i][<k>] = <famreps>[i][<j>]'.
        # So each permutation stabilizing <famreps>[i] will have to map <k>
        # to a point in '<family>[<k>]'.
        # (Note that <famreps>[i] is sorted.)
    
        famrep:= famreps[i];
        support:= Length( famrep );
        family:= [ ];
        j:= 1;
        while j <= support do
          family[j]:= [ j ];
          k:= j+1;
          while k <= support and famrep[k] = famrep[j] do
            Add( family[j], k );
            family[k]:= family[j];
            k:= k+1;
          od;
          j:= k;
        od;
        G:= MatAutomorphismsFamily( G, Copy(subgroup), family,
                                       permutations[i] );
        ReduceStabChain( G );
      fi;
    od;
    return G;
    end;


#############################################################################
##
#F  TableAutomorphisms( <tbl>, <characters> )
#F  TableAutomorphisms( <tbl>, <characters>, \"closed\" )
##
##  returns a permutation group record for the group of those matrix
##  automorphisms of <characters> (see "MatAutomorphisms") which are
##  compatible with (i.e. which fix) the fields 'orders' and all uniquely
##  determined (i.e.\ not parametrized) maps in 'powermap' of
##  the character table <tbl>.
##
##  If <characters> is closed under galois conjugacy --this is always
##  fulfilled for ordinary character tables-- the parameter \"closed\"
##  may be entered.
##
TableAutomorphisms := function( arg )
    local i, x, tbl, characters, subgroup, maut, map, admissible, gens, nccl;

    if not Length( arg ) in [ 2, 3 ] or not IsCharTable( arg[1] )
       or not IsList( arg[2] )
       or ( Length( arg ) = 3 and arg[3] <> "closed" ) then
      Error( "usage: TableAutomorphisms( <tbl>, <characters> ) resp.\n",
      "              TableAutomorphisms( <tbl>, <characters>, \"closed\" )" );
    fi;

    tbl:= arg[1];
    characters:= arg[2];
    if Length( arg ) = 3 then
      subgroup:= Group( GaloisMat( TransposedMat( characters ) ).generators,
                        () );
    else
      subgroup:= Group( () );
    fi;
    #
    if IsBound( tbl.orders ) then
      maut:= MatAutomorphisms( characters, [tbl.orders,tbl.centralizers],
                                  subgroup );
    else
      maut:= MatAutomorphisms( characters,
                                  [ tbl.centralizers ], subgroup );
    fi;
    gens:= List( maut.generators, x-> List( x ) );
    for x in gens do
      for i in [ Length(x)+1 .. Length( tbl.centralizers ) ] do x[i]:= i; od;
    od;
    admissible:= gens;
    if IsBound( tbl.powermap ) then
      for map in tbl.powermap do
        if ForAll( map, IsInt ) then
          admissible:= Filtered( admissible, x-> CompositionMaps(map,x)
                                                 = CompositionMaps(x,map) );
        fi;
      od;
    fi;
    admissible:= List( admissible, PermList );
    if Length( admissible ) <> Length( gens ) then
      InfoPermGroup2( "#I TableAutomorphisms:",
                      " not all matrix automorphisms admissible\n" );
      nccl:= Length( tbl.powermap[ Length( tbl.powermap ) ] );
      admissible:= Group( maut.operations.SubgroupProperty( maut,
                                 perm -> ForAll( tbl.powermap, 
                                            x -> ForAll( [ 1 .. nccl ],
                                         y -> x[ y^perm ] = x[y]^perm ) ),
                                     Group( admissible, maut.identity ) ) );
    else
      admissible:= Group( admissible, maut.identity );
    fi;
    return admissible;
    end;


##############################################################################
##
#F  TransformingPermutationFamily( <G>,<K>,<fam1>,<fam2>,<bij_col>,<family> )
##
##  computes a transforming permutation of columns for equivalent families
##  of rows of two matrices.
##  (The parameters can be computed from the matrices <mat1>, <mat2> using
##  "FamiliesOfRows").
##
##  'TransformingPermutationFamily' returns either 'false' or a record
##  with fields 'permutation' and 'group'.
##
##  <G>: group with the property that the transforming permutation lies in
##       the coset '<bij_col> * <G>'
##  <K>: a subgroup of the group of matrix automorphisms of <fam2> which is
##       contained in <G>, e.g. Aut( <mat2> )
##
##       Note: The bases of <G> and <K> must be compatible!!
##
##  <fam1>: the permutations mapping the rows of the family in <mat1> to the
##          representative (the so-called famrep)
##  <fam2>: the permutations mapping the rows of the family in mat2 to the
##          famrep
##  <bij_col>: permutation corresponding to the bijection of columns in mat1
##             and mat2
##  <family>: map that distributes the columns into families; two columns
##            <i>, <j> are in the same family iff
##            '<family>[<i>] = <family>[<j>]'.
##            <G> must stabilize <family>.
##            Note: Stabilizing the famrep is
##            equivalent to respecting <family>, so the calculation of
##            <fam1> and <fam2> must respect <family>, too!
##
TransformingPermutationFamily := function( G, K, fam1, fam2, bij_col, family )
    local x, allowed, ElementPropertyCoset, nonbase, permutations, result;
    
    # step a: replace permutations 'p' in <fam1> by '<bij_col>^(-1) * p',
    #         initialize allowed
    
    permutations:= List( fam1, x -> bij_col^(-1) * x );
    allowed:= List( [ 1 .. Length( fam1 ) ], x -> fam2 );
    
    # step b: 'ElementProperty'

    # search for an element in a coset $S * s$ of some stabilizer $S$ of $G$.
    # $L$ is a subgroup of $G$ that fixes $S * s$, i.e., $S * s * L = S * s$,
    # preserving <prop>, $prop( x )$ implies $prop( x*l )$ for all $l \in L$.
    ElementPropertyCoset := function ( S, s, L, allowed )
        local  i, j, points, p, ss, LL, elm, l, newallowed, union;

        # if $S$ is the trivial group check whether  $s$  has  the  property.
        if S.generators = [] then

    # property: does s map the nonbasepoints in the right way?

          for i in [ 1 .. Length( permutations ) ] do
            for p in nonbase do
              allowed[i]:= Filtered( allowed[i],
                           x -> ( p^s )^x in family[ p^permutations[i] ] );
            od;
            if allowed[i] = [] then return false; fi;
          od;
          return s;
        fi;

        # make 'points' a subset  of  $S.orbit ^ s$  of  those  points  which
        # correspond to cosets that might contain elements satisfying <prop>.
        # make  this  set  as  small  as  possible  with  reasonable  effort!
        points := Set( OnTuples( S.orbit, s ) );

        for i in [ 1 .. Length( permutations ) ] do
          union:= [];
          for j in allowed[i] do
            UniteSet( union, List( family[ S.orbit[1]^permutations[i] ],
                                   x -> x/j ) );
          od;
          IntersectSet( points, union );
        od;

        # run through the points, i.e., through the cosets of the stabilizer.
        while points <> []  do

            # take a point $p$.
            p := points[1];

            # find coset representant, i.e., $ss \in S*s, S.orbit[1]^ss = p$.
            ss := s;
            while S.orbit[1]^ss <> p do ss := S.transversal[p/ss] mod ss; od;

            # find a subgroup $LL$  of  $L$  which fixes $S.stabilizer * ss$,
            # i.e., an approximation (subgroup) $LL$ of $Stabilizer( L, p )$.
            # note that $LL$ preserves <prop> since it is a subgroup  of $L$.
            # compute a better aproximation, for example using  'ChangeBase'!
            LL:= Subgroup( Parent(G), Filtered( L.generators, l->p^l=p ) );

            # search the coset $S.stabilizer * ss$ and  return if successful.

         # first adjust allowed:

            newallowed:= [];
            for i in [ 1 .. Length( allowed ) ] do
              newallowed[i]:= Filtered( allowed[i], x -> p^x in
                                       family[ S.orbit[1]^permutations[i] ] );
            od;
            elm := ElementPropertyCoset( S.stabilizer, ss, LL, newallowed );
            if elm <> false  then return elm;  fi;

            # if there was no element in $S.stab * Rep(p)$ satisfying  <prop>
            # there can be none in  $S.stab * Rep(p^l) = S.stab * Rep(p) * l$
            # for any $l \in L$ because $L$ preserves  the  property  <prop>.
            # thus we can remove the entire $L$ orbit of $p$ from the points.
            SubtractSet( points, G.operations.Orbit(L,p,OnPoints) );

        od;

        # there is no element with the property <prop> in the coset  $S * s$.
        return false;

    end;

    # compute a stabilizer chain for $G$.
    # select an optimal base that allows us to prune  the  tree  efficiently!
    nonbase:= Difference( [ 1 .. Length( family ) ], G.operations.Base( G ) );

    # find a subgroup  $K$  of  $G$  which  preserves  the  property  <prop>,
    # i.e., $prop( x )$ implies $prop( x * k )$  for all  $x \in G, k \in K$.
    # make this  subgroup  as  large  as  possible  with  reasonable  effort!
    K := Copy( K );

    # search through the whole group $G = G * Id$ for an element with <prop>.
    return ElementPropertyCoset( G, G.identity, K, allowed );
    end;


##############################################################################
##
#F  TransformingPermutations( <mat1>, <mat2> )
##
##  constructs a permutation $\pi$ that transforms the set of rows of the
##  matrix <mat1> to the set of rows of the matrix <mat2> by permutation
##  of columns.
##  If such a permutation exists, a record with fields 'columns', 'rows'
##  and 'group' is returned, otherwise 'false'\:
##  If $'TransformingPermutations( <mat1>, <mat2> ) = <r>' \not= 'false'$
##  then we have '<mat2> =
##   Permuted( List( <mat1>, x->Permuted( x, <r>.columns ) ),<r>.rows )',
##  and '<r>.group' is the group of matrix automorphisms of <mat2>;
##  this group stabilizes the transformation.
##
TransformingPermutations := function( mat1, mat2 )

    local i, j, k, fam1, fam2, bijection, bij_col, pos, group,
          family, subgrp, fam, nonfixedpoints, famrep, support,
          actperm, actval, blocks, newnonfixedpoints, generators,
          omega, permg, newblocks, trans, image, preimage, row1, row2,
          values;
    
    if Length( mat1 ) <> Length( mat2 ) then return false; fi;
    if mat1 = [] then
      return rec( columns:= (), rows:= (), group:= Group( () ) );
    fi;
    
    # step 1: Check the bijection of row families
    #         (only of families, i.e. famreps; we do not need a physical
    #         bijection of the rows themselves)
    #         using that the sorted rows must be equal.
    #         Note that 'FamiliesOfRows' first sorts families according to
    #         the famrep, and then sorts this list *stable* (using 'Sortex')
    #         according to the length of the family, so the bijection must
    #         be the identity.
    
    fam1:= FamiliesOfRows( mat1, [] );
    fam2:= FamiliesOfRows( mat2, [] );
    if fam1.famreps <> fam2.famreps then
      InfoCharTable2( "#I TransformingPermutations: ",
                      "no bijection of row families\n" );
      return false;
    fi;
    
    # step 2: Initialize a bijection of column families using that row
    #         families of length 1 must be in bijection, i.e. the column
    #         families are constant on these rows.
    #         We will have bij_col[1][i] in bijection with bij_col[2][i].
    
    bij_col:= [];
    bij_col[1]:= [ [ 1 .. Length( mat1[1] ) ] ]; # trivial column families
    bij_col[2]:= [ [ 1 .. Length( mat1[1] ) ] ];
    
    for i in [ 1 .. Length( fam1.famreps ) ] do
      if Length( fam1.families[i] ) = 1 then
        row1:= mat1[ fam1.families[i][1] ];
        row2:= mat2[ fam2.families[i][1] ];
        for j in [ 1 .. Length( bij_col[1] ) ] do
          preimage:= bij_col[1][j];
          image:=    bij_col[2][j];
          values:= Set( Sublist( row1, preimage ) );
          if values <> Set( Sublist( row2, image ) ) then
            Print( "#I TransformingPermutations:",
                   " no bijection of column families\n" );
            return false;
          fi;
          bij_col[1][j]:= Filtered( preimage, x -> row1[x] = values[1] );
          bij_col[2][j]:= Filtered( image, x -> row2[x] = values[1] );
          if Length( bij_col[1][j] ) <> Length( bij_col[2][j] ) then
            Print( "#I TransformingPermutations:",
                   " no bijection of column families\n" );
            return false;
          fi;
          for k in [ 2 .. Length( values ) ] do
            Add( bij_col[1], Filtered( preimage, x-> row1[x] = values[k] ) );
            Add( bij_col[2], Filtered( image, x-> row2[x] = values[k] ) );
            if Length( bij_col[1][ Length( bij_col[1] ) ] )
               <> Length( bij_col[2][ Length( bij_col[2] ) ] ) then
              Print( "#I TransformingPermutations:",
                     " no bijection of column families\n" );
              return false;
            fi;
          od;
        od;
      fi;
    od;
    
    # step 3: Refine the column families and the bijection using that members
    #         of a column family must have the same sorted column in the
    #         restriction to every row family. Since the trivial row families
    #         are already examined, now only use the nontrivial row families.
    #         Except that now the values are sorted lists, the algorithm is
    #         the same as in step 2.
    
    for i in [ 1 .. Length( fam1.famreps ) ] do
      if Length( fam1.families[i] ) > 1 then
        row1:= TransposedMat( Sublist( mat1, fam1.families[i] ) );
        row2:= TransposedMat( Sublist( mat2, fam2.families[i] ) );
        for j in row1 do Sort( j ); od;
        for j in row2 do Sort( j ); od;
        for j in [ 1 .. Length( bij_col[1] ) ] do
          preimage:= bij_col[1][j];
          image:=    bij_col[2][j];
          values:= Set( Sublist( row1, preimage ) );
          if values <> Set( Sublist( row2, image ) ) then
            Print( "#I TransformingPermutations:",
                   " no bijection of column families\n" );
            return false;
          fi;
          bij_col[1][j]:= Filtered( preimage, x -> row1[x] = values[1] );
          bij_col[2][j]:= Filtered( image, x -> row2[x] = values[1] );
          if Length( bij_col[1][j] ) <> Length( bij_col[2][j] ) then
            Print( "#I TransformingPermutations:",
                   " no bijection of column families\n" );
            return false;
          fi;
          for k in [ 2 .. Length( values ) ] do
            Add( bij_col[1], Filtered( preimage, x-> row1[x] = values[k] ) );
            Add( bij_col[2], Filtered( image, x-> row2[x] = values[k] ) );
            if Length( bij_col[1][ Length( bij_col[1] ) ] )
               <> Length( bij_col[2][ Length( bij_col[2] ) ] ) then
              Print( "#I TransformingPermutations:",
                     " no bijection of column families\n" );
              return false;
            fi;
          od;
        od;
      fi;
    od;
    
    # Choose an arbitrary bijection of columns that respects the bijection of
    # column families.
    
    bijection:= [];
    for i in [ 1 .. Length( bij_col[1] ) ] do
      for j in [ 1 .. Length( bij_col[1][i] ) ] do
        bijection[ bij_col[1][i][j] ]:= bij_col[2][i][j];
      od;
    od;
    nonfixedpoints:= Filtered( bij_col[2], x -> Length(x) > 1 );
    
    # step 4: Compute a direct prouct of symmetric groups that covers the
    #         group of table automorphisms of mat2, using column families
    #         given by 'bij_col[2]'.
    
    generators:= [];
    for omega in nonfixedpoints do
      Add( generators, ( omega[1], omega[2] ) );        # transposition
      if Length( omega ) > 2 then
        permg:= ( omega[1], omega[2] );
        for k in [ 3 .. Length( omega ) ] do
          permg:= ( omega[k-1], omega[k] ) * permg;
        od;
        Add( generators, permg );                       # transitive cycle
      fi;
    od;
    group:= Group( generators, () );
    
    # step 5: backtrack search for a transforming permutation of columns;
    #         for the families of length > 1 recursively call
    #         TransformingPermutationFamily
    
    InfoPermGroup2("#I TransformingPermutations: start of backtrack search\n");
    
    bij_col:= PermList( bijection );
    
    # and now: loop over row families;
    # first convert <famreps>[i] to 'family': 'family[<k>]' is the list of all
    # positions <j> in <famreps>[i] with
    # '<famreps>[i][<k>] = <famreps>[i][<j>]'.
    # So each permutation stabilizing <famreps>[i] will have to map <k> to
    # a point in '<family>[<k>]'.
    # (Note that <famreps>[i] is sorted.)
    
    for i in [ 1 .. Length( fam1.famreps ) ] do
      if Length( fam1.permutations[i] ) > 1 then
        famrep:= fam1.famreps[i];
        support:= Length( famrep );
        family:= [ ];
        j:= 1;
        while j <= support do
          family[j]:= [ j ];
          k:= j+1;
          while k <= support and famrep[k] = famrep[j] do
            Add( family[j], k );
            family[k]:= family[j];
            k:= k+1;
          od;
          j:= k;
        od;
        subgrp:= MatAutomorphismsFamily( group, [], family,
                                          fam2.permutations[i] );
        trans:= TransformingPermutationFamily( group, subgrp,
                               fam1.permutations[i],
                               fam2.permutations[i], bij_col,
                               family );
        group:= subgrp;
        ReduceStabChain( group );
        if trans = false then return false; fi;
        bij_col:= bij_col * trans;
      fi;
    od;
    return rec( columns:= bij_col,
                rows:= Sortex( List( mat1, x -> Permuted( x, bij_col ) ) )
                       / Sortex( ShallowCopy( mat2 ) ),
                group:= group                                        ); 
    end;


##############################################################################
##
#F  TransformingPermutationsCharTables( <tbl1>, <tbl2> )
##
##  constructs a permutation $\pi$ that transforms the set of rows of the
##  matrix '<tbl1>.irreducibles' to the set of rows of the matrix
##  '<tbl2>.irreducibles' by permutation of columns.
##
TransformingPermutationsCharTables := function( tbl1, tbl2 )
    local i, map, trans, maut, admissible, both, prop, pi, pi2, nccl;

    if not IsBound( tbl1.irreducibles ) or
       not IsBound( tbl2.irreducibles ) then
      Error( "no irreducibles bound" );
    fi;
    trans:= TransformingPermutations( tbl1.irreducibles, tbl2.irreducibles );
    if trans = false then return false; fi;
    
    # first compute the subgroup of table automorphisms of tbl2
    
    nccl:= Length( tbl1.centralizers );
    maut:= trans.group;
    admissible:= maut.generators;
    if not IsBound( tbl1.powermap ) then tbl1.powermap:= []; fi;
    if not IsBound( tbl2.powermap ) then tbl2.powermap:= []; fi;
    for map in tbl2.powermap do
      if ForAll( map, IsInt ) then
        admissible:= Filtered( admissible, x -> ForAll( [ 1 .. nccl ],
                                             y -> map[y^x] = map[y]^x ) );
      fi;
    od;
    if Length( admissible ) <> Length( maut.generators ) then
      Print( "#I TransformingPermutationsCharTables:",
             " not all matrix automorphisms admissible\n" );
      admissible:= Group( maut.operations.SubgroupProperty( maut,
                                     perm -> ForAll( tbl2.powermap, 
                                                x -> ForAll( [ 1 .. nccl ],
                                             y -> x[y^perm] = x[y]^perm ) ),
                                     Group( admissible, () ) ) );
    else
      admissible:= trans.group;
    fi;
    
    both:= Intersection( Filtered( [ 1 .. Length( tbl1.powermap ) ],
                                    x -> IsBound( tbl1.powermap[x] ) ),
                         Filtered( [ 1 .. Length( tbl2.powermap ) ],
                                    x -> IsBound( tbl2.powermap[x] ) ) );
    pi:= trans.columns;
    if ForAll( both,
               x -> ForAll( [ 1 .. nccl ],
                    y -> tbl2.powermap[x][ y^pi ] = tbl1.powermap[x][y]^pi ) )
       and ( not ( IsBound( tbl1.orders ) and IsBound( tbl2.orders ) ) or
             Permuted( tbl1.orders, pi ) = tbl2.orders ) then
      trans.group:= admissible;
      return trans;
    else
    
      # Look if there is a coset of 'trans.group' over 'admissible' that
      # consists of transforming permutations\:
    
      MakeStabChain( trans.group, admissible.operations.Base( admissible ) );

      prop:= s -> ForAll( both, x -> ForAll( [ 1 .. nccl ], y ->
                tbl2.powermap[x][ (y^pi)^s ] = (tbl1.powermap[x][y]^pi)^s ) )
             and ( not ( IsBound( tbl1.orders ) and IsBound(tbl2.orders) ) or
                   Permuted( tbl1.orders, pi*s ) = tbl2.orders );

      pi2:= PermGroupOps.ElementProperty( trans.group, prop, admissible );
      if pi2 = false then
        return false;
      else
        return rec( columns:= pi * pi2,
                    rows:= Sortex( List( tbl1.irreducibles,
                                         x -> Permuted( x, pi * pi2 ) ) )
                           / Sortex( ShallowCopy( tbl2.irreducibles ) ),
                    group:= admissible  );
      fi;
    fi;
    end;

