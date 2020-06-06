#############################################################################
##
#A  sagsbgrp.g                  GAP library                      Bettina Eick
##
#A  @(#)$Id: sagsbgrp.g,v 3.17.1.4 1995/12/04 15:54:12 beick Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions computing subgroups of special ag groups.
##
#H  $Log: sagsbgrp.g,v $
#H  Revision 3.17.1.4  1995/12/04  15:54:12  beick
#H  changed SagGroupOps.SylowSystem and SagGroupOps.SystemNormalizer
#H  added SagGroupOps.SylowComplements
#H
#H  Revision 3.17.1.3  1995/11/27  15:05:10  sam
#H  renamed 'MatGroupSagGroup', 'DualMatGroupSagGroup' to
#H  'ModuleDescrSagGroup', DualModuleDescrSagGroup';
#H  re-introduced 'MatGroupSagGroup', 'DualMatGroupSagGroup'
#H
#H  Revision 3.17.1.2  1995/11/22  09:00:05  sam
#H  changed from MatGroup & CompositionFactors to MTXOps.CompositionFactors
#H
#H  Revision 3.17.1.1  1994/08/02  09:29:52  beick
#H  changed 'MaximalSubmodules' slighly
#H
#H  Revision 3.17  1994/06/17  12:27:39  beick
#H  added trivial cases to some functions
#H
#H  Revision 3.16  1994/04/06  10:36:59  beick
#H  changed 'MaximalSubgroupsRepresentatives' to 'ConjugacyClassesMaximalS..'
#H  changed 'PraefrattiniSubgroup' to 'PrefrattiniSubgroup'
#H
#H  Revision 3.15  1994/03/22  14:37:08  beick
#H  changed 'AgSubgroup' to 'G.operations.AgSubgroup'
#H  changed 'Centre' slightly
#H  added 'Subgroup' and 'AgSubgroup'
#H
#H  Revision 3.14  1994/03/10  14:55:16  beick
#H  Changed 'Centre' slightly
#H
#H  Revision 3.13  1994/03/09  14:19:41  beick
#H  Added 'Centre'
#H
#H  Revision 3.12  1994/02/23  14:45:57  beick
#H  added 'SystemNormalizer'
#H
#H  Revision 3.11  1994/02/21  14:36:45  beick
#H  fixed some minor bugs
#H
#H  Revision 3.10  1994/02/21  14:30:05  beick
#H  improved the comments
#H
#H  Revision 3.9  1994/02/21  12:06:15  beick
#H  fixed a bug in 'ElementaryAbelianSeries'
#H
#H  Revision 3.8  1994/02/19  12:20:24  beick
#H  fixed a bug in MaximalSubgroupsRepresentatives
#H
#H  Revision 3.7  1994/02/18  16:17:58  beick
#H  added some more functions
#H
#H  Revision 3.6  1994/02/17  10:06:06  beick
#H  fixed a bug in MaximalSubgroups
#H
#H  Revision 3.5  1994/02/16  15:58:21  beick
#H  fixed some minor bugs
#H
#H  Revision 3.4  1994/02/16  14:32:32  fceller
#H  initial revision under RCS
#H
##

#############################################################################
##
#F  InfoSagGroup? . . . . . . . . . . . . . . . . . . . . . print information
##
if not IsBound(InfoSagGroup1)      then InfoSagGroup1 := Ignore;      fi;
if not IsBound(InfoSagGroup2)      then InfoSagGroup2 := Ignore;      fi;
if not IsBound(InfoSagGroup3)      then InfoSagGroup3 := Ignore;      fi;
if not IsBound(InfoMaxSubgp2)      then InfoMaxSubgp2 := Ignore;      fi;
if not IsBound(InfoEulerFct2)      then InfoEulerFct2 := Ignore;      fi;
if not IsBound(InfoSagCent2)       then InfoSagCent2  := Ignore;      fi;

#############################################################################
##
#F  MatGroupSagGroup( <G>, <l> ) . . . . . . . . .representation on layer <l>
##
##  'MatGroupSagGroup' returns a  matrix group that gives the  representation
##  of the group <G> on the given layer <l> of the Leedham-Green series.
##
ModuleDescrSagGroup := function( G, l )
    local   M;

    # check that <G> is a parent
    if not IsParent(G)  then
        Error( "<G> must be a parent group" );
    fi;
    if Length(G.first) <= l  then
        Error( "<l> must be less than ", Length(G.first) );
    fi;

    # check if already know the result
    if not IsBound(G.moduleDescrSagGroup)  then
        G.moduleDescrSagGroup := [];
    fi;
    if not IsBound(G.moduleDescrSagGroup[l])  then
        M := G.operations.ModuleDescrSagGroup( G, l );
        G.moduleDescrSagGroup[l] := M;
    fi;

    # and return
    return G.moduleDescrSagGroup[l];

end;

MatGroupSagGroup := function( G, l )
    local   M;

    # check that <G> is a parent
    if not IsParent(G)  then
        Error( "<G> must be a parent group" );
    fi;
    if Length(G.first) <= l  then
        Error( "<l> must be less than ", Length(G.first) );
    fi;

    # check if already know the result
    if not IsBound(G.matGroupSagGroup)  then
        G.matGroupSagGroup := [];
    fi;
    if not IsBound(G.matGroupSagGroup[l])  then
        M := G.operations.MatGroupSagGroup( G, l );
        G.matGroupSagGroup[l] := M;
    fi;

    # and return
    return G.matGroupSagGroup[l];

end;

SagGroupOps.ModuleDescrSagGroup := function( G, l )

    local first, next,     # of layer
          gens,            # generators of G
          N, M,            # normal subgroups in LG series
          NM, NMgens,      # factor group and corresponding gens
          field,           # field corresponding to layer
          matgens,         # generators of the matrixgroup 
          mat,             # a matrix
          I,               # identity matrix
          i; 

    first := G.first[l];
    next := G.first[l+1];
    gens := G.generators;
    N := G.operations.AgSubgroup( G, gens{[first .. Length(gens)]}, true );
    M := G.operations.AgSubgroup( G, gens{[next  .. Length(gens)]}, true );
    NM := N mod M;
    field := GF ( G.weights[ first ][ 3 ] );
    matgens := [ ];

    # take all necessary generators of G and calculate matrix representation
    for i  in [ 1 .. first-1 ]  do
        if     G.weights[i][2] = 1
           and G.weights[i][1] <> G.weights[first][1]
        then	
            NMgens := gens{[ first .. next-1 ]};
            mat := List ( NMgens , x -> Exponents ( NM, x^gens[i], field ) );
            Add ( matgens, mat );
        fi;
    od;
 #  if 0 = Length(matgens)  then
 #      I := IdentityMat( next-first, field );
 #      return MatGroup( [I], field );
 #  else
 #      return MatGroup ( matgens, field );
 #  fi;
    return [ matgens, field, next-first ];
end;

SagGroupOps.MatGroupSagGroup := function( G, l )
    local descr;
    descr:= SagGroupOps.ModuleDescrSagGroup( G, l );
    if 0 = Length( descr[1] ) then
      return MatGroup( [ IdentityMat( descr[3], descr[2] ) ], descr[2] );
    else
      return MatGroup( descr[1], descr[2] );
    fi;
    end;

#############################################################################
##
#F  DualModuleDescrSagGroup( <G>, <l> )  . . . . . . . . . . dual representation
##
##  'ModuleDescrSagGroup' returns   a    matrix  group  that  gives    the  dual
##  representation  of the  group   <G>  on the    given layer   <l>  of  the
##  Leedham-Green series.
##
DualModuleDescrSagGroup := function( G, l )
    local   M;

    # check that <G> is a parent
    if not IsParent(G)  then
        Error( "<G> must be a parent group" );
    fi;
    if Length(G.first) <= l  then
        Error( "<l> must be less than ", Length(G.first) );
    fi;

    # check if already know the result
    if not IsBound(G.dualModuleDescrSagGroup)  then
        G.dualModuleDescrSagGroup := [];
    fi;
    if not IsBound(G.dualModuleDescrSagGroup[l])  then
        M := G.operations.DualModuleDescrSagGroup( G, l );
        G.dualModuleDescrSagGroup[l] := M;
    fi;

    # and return
    return G.dualModuleDescrSagGroup[l];

end;

DualMatGroupSagGroup := function( G, l )
    local   M;

    # check that <G> is a parent
    if not IsParent(G)  then
        Error( "<G> must be a parent group" );
    fi;
    if Length(G.first) <= l  then
        Error( "<l> must be less than ", Length(G.first) );
    fi;

    # check if already know the result
    if not IsBound(G.dualMatGroupSagGroup)  then
        G.dualMatGroupSagGroup := [];
    fi;
    if not IsBound(G.dualMatGroupSagGroup[l])  then
        M := G.operations.DualMatGroupSagGroup( G, l );
        G.dualMatGroupSagGroup[l] := M;
    fi;

    # and return
    return G.dualMatGroupSagGroup[l];

end;

SagGroupOps.DualModuleDescrSagGroup := function( G, l )

    local first, next,     # of layer
          gens,            # generators of G
          N, M,            # normal subgroups in LG series
          NM, NMgens,      # factor group and corresponding gens
          field,           # field corresponding to layer
          matgens,         # generators of the matrixgroup 
          mat,             # a matrix
          I,               # identity matrix
          i; 

    first := G.first[l];
    next := G.first[l+1];
    gens := G.generators;
    N := G.operations.AgSubgroup(G, gens{[first.. Length(gens)]}, true );
    M := G.operations.AgSubgroup(G, gens{[next .. Length(gens)]}, true );
    NM := N mod M;
    field := GF ( G.weights[ first ][ 3 ] );
    matgens := [ ];

    # take all necessary generators of G and calculate matrix representation
    for i  in [ 1 .. first-1 ]  do
        if     G.weights[i][2] = 1
           and G.weights[i][1] <> G.weights[first][1]
        then	
            NMgens := gens{[ first .. next-1 ]};
            mat := List ( NMgens , x -> Exponents ( NM, x^gens[i], field ) );
            Add ( matgens, TransposedMat(mat) );
        fi;
    od;
 #  if 0 = Length(matgens)  then
 #      I := IdentityMat( next-first, field );
 #      return MatGroup( [I], field );
 #  else
 #      return MatGroup ( matgens, field );
 #  fi;
    return [ matgens, field, next-first ];
end;

SagGroupOps.DualMatGroupSagGroup := function( G, l )
    local descr;
    descr:= SagGroupOps.DualModuleDescrSagGroup( G, l );
    if 0 = Length( descr[1] ) then
      return MatGroup( [ IdentityMat( descr[3], descr[2] ) ], descr[2] );
    else
      return MatGroup( descr[1], descr[2] );
    fi;
    end;

#############################################################################
##
#F  MaximalSubmodules( <S>, <layer> ) . . . . . maximal submodules in <layer>
##
SagGroupOps.MaximalSubmodules := function( S, layer )

    local first, next,
          maxsubmods,            # list of all maximal submodules
          max,                   # one maximal submodule
          irreducibles,          # list of all irreducible submodules
          field,                 # GF(p)
          rep,                   # contragredient group representation
          comp,                  # composition factors of the representation
          a,                     # peakword 
          kern,                  # kernel of peakwords
          dim,                   # dim of kernel
          spin,                  # spinning of a vector
          j;

    first := S.first[layer];
    next  := S.first[layer+1];
    maxsubmods := [];

    # if layer has only one generator, it's trivial
    if next - first = 1  then
        Add( maxsubmods, [] );
    else
        field := GF( S.weights[first][3] );
        rep   := DualModuleDescrSagGroup( S, layer );
        comp  := MTXOps.CompositionFactors(rep);

        # if the rep is irreducible
        if Length( comp.factors ) = 1  then
            Add( maxsubmods, [] );

        # otherwise calculate all minimal submodules
        else
            irreducibles := [];
            a := MTXOps.Peakwords( rep, comp );
            for j  in [ 1 .. Length(a.peaks) ]  do
                if not IsBool( a.peaks[j] )  then
                    kern := NullspaceMat( a.peaks[j] );
                    dim  := a.dims[j];
                    spin := MTXOps.SpinedBase( rep, kern, dim );
                    Append( irreducibles, spin );
                else
                    Print("#W  could not find all maximal submodules \n");
                fi;
            od;
            irreducibles := Set(irreducibles);

            # convert them to maximal ones 
            for j  in [ 1..Length(irreducibles) ]  do
                max := DualRowSpace( irreducibles[j], field );
                Add( maxsubmods, max );
            od;
        fi;
    fi;
    return maxsubmods;

end;

#############################################################################
##
#F  SubgroupsModules( <S>, <layer>, <modules> ) .  convert modules into sgrps
##
SagGroupOps.SubgroupsModules := function( S, layer, mods )

    local   first, next, length,
            maximals, modul,      # (list of all) maximal submodules
            gens1, gens2, gens,   # some generators of S
            max,                  # integer matrix corresponding to module
            elements, element,    # (list of) elements
            h, k;

    first    := S.first[ layer ];
    next     := S.first[ layer + 1 ];
    length   := Length(S.generators);
    maximals := [];
    
    for modul  in mods  do
        gens1 := S.generators{[ 1 .. first-1 ]};
        gens2 := S.generators{[ next .. length ]};
        if 0 = Length(modul)  then
            gens := Concatenation( gens1, gens2 );
            Add( maximals, Subgroup( S, gens ) );
        else
            max := List( modul, x -> IntVecFFE(x) );
            elements := [ ];
            for h  in [ 1 .. Length(max) ]  do
                element := S.identity;
                for k  in [ first .. next-1 ]  do
                    element := element * S.generators[k] ^ max[h][k+1-first];
                od;
                Add( elements, element );
            od;
            gens := Concatenation( gens1, elements, gens2 );
            Add( maximals, Subgroup( S, gens ) );
        fi;
    od;
    return maximals;
end;

#############################################################################
##
#F  ConjugacyClassesMaximalSubgroups( <G> )  . . . . maximal subgroups of <G>
##
ConjugacyClassesMaximalSubgroups := function( G )
    local   tmp;
    if not IsBound( G.conjugacyClassesMaximalSubgroups )  then
        tmp := G.operations.ConjugacyClassesMaximalSubgroups( G );
        G.conjugacyClassesMaximalSubgroups := tmp;
    fi;
    return G.conjugacyClassesMaximalSubgroups;
end;

SagGroupOps.ConjugacyClassesMaximalSubgroups := function( G )
    local tmp;
    tmp := Concatenation( G.operations.RepsMaximalSubgroups( G ) );
    return List( tmp, x -> ConjugacyClassSubgroups( G, x ) );
end;

#############################################################################
##
#F  SagGroupOps.RepsMaximalSubgroups( <G> ) . . . maximal subgroups layerwise
##
SagGroupOps.RepsMaximalSubgroups := function( G )

    local I,            # identity matrix
          maximals,     # maximals[i] contains maximal subgroups to layer i
          maxmods,      # maximal submodules
          groupgens,    # generators of the G 
          length,       # the number of generators of the G
          first, next,  # of layer 
          field,        # field of representation 
          irreducibles, # irreducible submodules
          head,         # number of head in the G
          i; 

    # catch trivial case
    if Length( G.generators ) = 0  then
        return [];
    fi;

    maximals := List( [ 1..Length( G.first )-1 ], x -> [ ] );
    groupgens := G.generators;
    length := Length( groupgens );

    # the first head
    i := 1;
    while G.first[ i ] < G.tail[ 1 ]  do
        first := G.first[ i ];
        next := G.first[ i+1 ];
        field := GF( G.weights[ first ][ 3 ] );
        I := IdentityMat( next - first, field );

        # get all one-dimensional subspaces of vectorspace( I )
        irreducibles := NormedVectors( VectorSpace( I, field ) );
        maxmods := List( irreducibles, x -> DualRowSpace([x], field) );
        maximals[i] := G.operations.SubgroupsModules( G, i, maxmods );
        InfoMaxSubgp2("#I ",i,"th layer done\n");
        i := i + 1;
    od;

    # the other heads
    for head  in [ 2..Length( G.head )-1 ]  do
        i := Position( G.first, G.head[ head ] );
        while G.first[ i ] < G.tail[ head ]  do
            maxmods := G.operations.MaximalSubmodules( G, i );
            maximals[i] := G.operations.SubgroupsModules( G, i, maxmods );
            InfoMaxSubgp2("#I ",i,"th layer done\n");
            i := i + 1;
        od;
    od;
    return maximals;
end; 

#############################################################################
##
#F  PrefrattiniSubgroup( <G> ) . . . . . . . . . . . . a prefrattini subgroup
##
PrefrattiniSubgroup := function( G )
    local   tmp;
    if not IsBound( G.prefrattiniSubgroup )  then
        tmp :=  G.operations.PrefrattiniSubgroup( G );
        G.prefrattiniSubgroup := tmp;
    fi;
    return G.prefrattiniSubgroup;
end;

SagGroupOps.PrefrattiniSubgroup := function( G )

    local I,             # identity matrix 
          groupgens,     # generators of the G 
          primes,        # primes dividing group order
          length,        # the number of generators
          prefratt,      # generators of the prefrattini group
          first, next,   # of layer 
          field,         # field of representation 
          maxmods,       # maximal submodules
          max,           # maximal module
          elem,          # element of the prefrattini group
          head,          # counts heads
          i, j, k, h; 

    # catch trivial case
    if Length( G.generators ) = 0  then
        return G;
    fi;

    groupgens :=  G.generators;
    length := Length( groupgens );
    primes := List( G.first{[1..Length(G.first)-1]}, x ->  G.weights[x][3] );

    # the first head
    prefratt := groupgens{[ G.tail[1]..G.head[2]-1 ]};
    InfoMaxSubgp2("#I ","1th head done\n");

    # the other heads
    for head  in [ 2..Length( G.head )-1 ]  do
        i := Position( G.first, G.head[ head ] );
        while G.first[ i ] < G.tail[ head ]  do
            first := G.first[ i ];
            next  := G.first[ i+1 ];
            field := GF( G.weights[first][3] );

            # if the layer has only one generator, there is nothing to do
            # analog if the layer is a completely reducible one
            if G.weights[first][3] in primes{[1..i-1]}
               and next - first <> 1
            then
                maxmods := G.operations.MaximalSubmodules( G, i );
                if maxmods <> [[]] then
                    maxmods := List( maxmods, x -> VectorSpace( x, field ) );
                
                    # intersect all modules
                    max := maxmods[1];
                    for j in [2..Length(maxmods)] do
                        max := Intersection( max, maxmods[j] );
                    od;
                    max := Base( max );

                    # calculate the group elements corresponding to max
                    if 0 < Length(max)  then
                        max := List( max, x -> IntVecFFE(x) );
                        for h  in [ 1..Length( max ) ]  do
                            elem := G.identity;
                            for k  in [ first..next-1 ]  do
                                elem := elem*groupgens[k]^max[h][k-first+1];
                            od;
                            Add( prefratt, elem );
                        od;
                    fi;
                fi;
            fi;
            i := i + 1;
        od;

        # add the gens of the next tail
        Append( prefratt, 
                groupgens{[ G.tail[head].. G.head[head+1]-1]} );

        InfoMaxSubgp2("#I ",head,"th head done \n");
    od;

    return Subgroup( G, prefratt );
end;

#############################################################################
##
#F  SagGroupOps.FrattiniSubgroup( <G> ) . . . . . . . . . a Frattini subgroup
##
SagGroupOps.FrattiniSubgroup := function( G )
    local prefratt;
    prefratt := PrefrattiniSubgroup( G );
    return Core( G, prefratt );
end;


#############################################################################
##
#F  MaximalSubgroups( <G> ) . . . . . . . . . . . . . . all maximal subgroups
##
MaximalSubgroups := function( G )
    if not IsBound( G.maximalSubgroups )  then
        G.maximalSubgroups := G.operations.MaximalSubgroups( G );
    fi;
    return G.maximalSubgroups;
end;

SagGroupOps.MaximalSubgroups := function( G )

    local maximalreps,    # representatives of maximal subgroups
          groupgens,      # generators of the G
          maximals,       # list of maximal subgroups
          U,              # G generated by all gens in one head
          head, i, j;

    # catch trivial case
    if Length( G.generators ) = 0  then
        return [ ];
    fi;

    maximalreps := G.operations.RepsMaximalSubgroups( G );
    groupgens   := G.generators;

    # the first head
    maximals := maximalreps[ 1 ];
    i := 2;
    while G.first[ i ] < G.tail[ 1 ]  do
        Append( maximals, maximalreps[ i ] );
        i := i + 1;
    od;

    # the other heads
    for head  in [ 2..Length( G.head )-1 ]  do
        i := Position( G.first, G.head[ head ] );
        U := Subgroup( G, groupgens{[ G.head[head]..G.tail[head]-1]} );
        while G.first[ i ] < G.tail[ head ]  do
            if 0 < Length(maximalreps[ i ])  then
                for j  in [ 1..Length( maximalreps[ i ] ) ]  do
                    Append( maximals, 
                            ConjugateSubgroups( U, maximalreps[i][j] ) );
                od;
            fi;
            i := i + 1;
        od;
    od;
    return maximals;
end;

#############################################################################
##
#F  SagGroupOps.AvoidedLayers( <G>, <H>, <K>) . . . layers avoided by H and K
##
SagGroupOps.AvoidedLayers := function( G, H, K )

    local h, k,        ## Cgs
          occur,       ## avoided generators
          elem,        ## group element of Cgs
          first, next, ## of layers
          avoided,     ## avoided layers
          primes,      ## list of primes
          p,           ## prime
          sylow,       ## Sylow layers
          res,         ## the result
          i; 

    h := Cgs( H );
    k := Cgs( K );

    # get the gens, which do not occur in the Cgs of H and K
    occur := List( [ 1..Length( G.generators ) ], x -> 0 );
    for elem  in h  do
        occur := occur + Exponents( G, elem );
    od;
    for elem  in k  do
        occur := occur + Exponents( G, elem );
    od;

    # make a list of the avoided layers
    avoided := [ ];
    for i  in [ 1..Length( G.first )-1 ]  do
        first := G.first[i];
        next := G.first[i+1];
        if Maximum( Sublist( occur, [first..next-1] ) ) = 0  then
            Add( avoided, first );
        fi;
    od;

    res := [ ];

    # get the avoided heads
    for i  in avoided  do
        if G.weights[ i ][ 2 ] = 1  then
            Add( res, i );
        fi;
    od;

    # get the avoided Sylow subgroups
    primes := Set( List( avoided, x -> G.weights[x][3] ) );
    for p  in primes  do
        sylow := Filtered( Sublist( G.first, [1..Length(G.first)-1] ), 
                           x -> G.weights[x][3] = p );
        if IsSubset( avoided, sylow )  then
            Append( res, sylow );
        fi;
    od;

    return Set(res);
end;

#############################################################################
##
#F  SagGroupOps.GlasbyIntersection( <H>, <K> )  . . . . Glasby's intersection
##
SagGroupOps.GlasbyIntersection := function( H, K )
    local maxDepth, G, U, A, B, C, D, HmN, KmN, N, R, E, sum, i, s, e, avoid;

    # compute a cgs for <H> and <K>
    G := Parent( H, K );
    Cgs( H );
    Cgs( K );
    maxDepth := Length( G.generators );

    # build up the LG - Series
    E := [ ];
    for i  in [ 1..Length( G.first ) ]  do
        U := G.operations.AgSubgroup( G, 
                          G.generators{[G.first[i]..maxDepth]}, true );
        Add( E, U );
    od;
    avoid := SagGroupOps.AvoidedLayers( G, H, K );

    # go down the elementary abelian series. <A> < <H>, <B> < <K>.
    A := [ ];
    B := [ ];
    for i   in [ 1 .. Length( E ) - 1 ]  do

        if not G.first[ i ]  in avoid  then

            Cgs( E[ i + 1 ] );
            N := FactorArg( E[ i ], E[ i + 1 ] ).generators;

            ##  if CHECK  then
            ##      Print( "#I  GlasbyIntersection: step number ", i, "\n" );
            ##      Print( "#I  GlasbyIntersection: A = <", A, ">\n" );
            ##      Print( "#I  GlasbyIntersection: B = <", B, ">\n" );
            ##      Print( "#I  GlasbyIntersection: N = <", N, ">\n" );
            ##  fi;

            s := DepthAgWord( N[ 1 ] );
            e := DepthAgWord( N[ Length( N ) ] );
            HmN := Filtered( H.cgs, x -> s <= DepthAgWord( x )
                           and DepthAgWord( x ) <= e );
            KmN := Filtered( K.cgs, x -> s <= DepthAgWord( x )
                           and DepthAgWord( x ) <= e );
            HmN := FactorArg( G.operations.AgSubgroup(G,HmN,false), E[i+1] );
            KmN := FactorArg( G.operations.AgSubgroup(G,KmN,false), E[i+1] );

            sum := SumFactorizationFunctionAgGroup( HmN, KmN );

            ##  if CHECK  then
            ##     Print( "#I  GlasbyIntersection: R = <", sum.sum, ">\n" );
            ##  fi;

            # Maybe there is nothing left to stabilize.
            if Length( sum.sum ) = Length( N )  then
                C := A;
                D := B;
            else
                R := G.operations.AgSubgroup(G, 
                                  Concatenation(sum.sum,E[i+1].cgs), false);
                C := GlasbyStabilizer( G, A, B, N, R );
                D := GlasbyShift( G, C, B );

                ##  if CHECK  then
                ##      Print( "#I  GlasbyIntersection: C = <", C, ">\n" );
                ##      Print( "#I  GlasbyIntersection: D = <", D, ">\n" );
                ##  fi;

            fi;

            # Now we can cover <C> and <D>.
            GlasbyCover( sum, C, D, H, K );
            A := C;
            B := D;
        fi;
    od;

    # <A> is the unnormalized intersection.
    A := G.operations.AgSubgroup( G, A, false );
    Normalize( A );
    return A;

end;

#############################################################################
##
#F  SagGroupOps.MinimalGeneratingSet( <G> ) . . minimal generating set of <G>
##
SagGroupOps.MinimalGeneratingSet := function( G )

    local   maxDepth, mingens, i, j, first, next, M, N, head;

    # catch trivial case
    if Length( G.generators ) = 0  then
        return [];
    fi;

    # the first head
    InfoSagGroup2( "#I  the 1th head\n" );
    maxDepth := Length(G.generators);
    mingens  := Sublist( G.generators, [ 1..G.first[ 2 ]-1 ] );
    i := 2;
    while G.first[ i ] < G.tail[ 1 ]  do
        first := G.first[ i ];
        next := G.first[ i+1 ];
        for j  in [ 1..next-first ]  do
            if j <= Length( mingens )  then
                mingens[ j ] := mingens[ j ] * G.generators[ first+j-1 ];
            else
                Add( mingens, G.generators[ first+j-1 ] );
            fi;
        od;
        InfoSagGroup2( "#I  minset = ", mingens, "\n" );
        i := i + 1;
    od;
             
    # the other heads
    for head  in [ 2..Length( G.head )-1 ]  do
    InfoSagGroup2( "#I  the ", head, "th head\n" );
        first := G.head[ head ];
        next  := G.tail[ head ];
        N := G.operations.AgSubgroup(G,G.generators{[next..maxDepth]}, true);
        M := G.operations.AgSubgroup(G,G.generators{[first..maxDepth]},true);
        mingens := G.operations.MinimalGens( G, M, N, mingens );
    od;
    return Set(mingens);

end;

#############################################################################
##
#F  EulerianFunction( <G>, <n> ) . . . . . . . . nth Eulerian function of <G>
##
EulerianFunction := function( G, n )
    if not IsInt(n) then
        Error("usage : EulerianFunction( <G>, <n> )");
    elif n <= 0 then
        Error("usage : EulerianFunction( <G>, <n> )");
    fi;
    return G.operations.EulerianFunction( G, n);
end;

SagGroupOps.EulerianFunction := function( G, n )

    local phi,                     # eulerian function
          head, tail, next, first, # indicating layer of LG-series
          p,                       # prime of the layer 
          d, r,                    # exponents 
          i, j, k,                 # indices 
          size,                    # dimension of layer
          order,                   # order of layer
          maxmods,                 # all maximal submodules of a layer
          kom,                     # number of complements
          cand,                    # list of candidates
          oldspace, oldbase,       # old intersection and its base
          newspace, newbase;       # new intersection and its base 

    # catch trivial case
    if Length( G.generators ) = 0  then
        return 1;
    fi;

    # the first layer of the lower nilpotent series
    InfoEulerFct2("#I the first step \n");
    tail := G.tail[1];
    phi := 1;
    i := 1;
    while G.first[i] < tail do
        first := G.first[i];
        next  := G.first[i+1];
        p     := G.weights[first][3];
        d     := next - first;
        r     := Length(Filtered( G.weights{[1..G.head[2]-1]}, x -> x[3]=p));
        phi   := phi * p^( n * ( r - d ) ); 
        InfoEulerFct2("#I     factor: ",p,"^(n*",r-d,")");
        for j in [0..d-1] do
            phi := phi * (p^n - p^j);
            InfoEulerFct2("*(",p,"^n - ",p,"^",j,")");
        od;
        InfoEulerFct2("\n");
        if phi = 0 then
            return 0;
        fi;
        i := i + 1;
    od;

    # the other layers of the lower nilpotent series
    for head in [2..Length(G.head)-1] do
        InfoEulerFct2("#I the ",head,"th step \n");

        # homomorphism principle for the head
        i    := Position( G.first, G.head[head] );
        tail := G.tail[head];
        while G.first[i] < tail do
            first   := G.first[ i ];
            next    := G.first[ i+1 ];
            size    := next-first;
            p       := G.weights[first][3];
            maxmods := G.operations.MaximalSubmodules( G, i );

            # if the layer is an irreducible G-module
            if maxmods = [ [] ] then
                order := p^size;
                phi   := phi * (order^n - order );
                InfoEulerFct2("#I     factor: ",order,"^n - ",order);
                InfoEulerFct2(" (irreducible head) \n");
                if phi = 0 then
                    return 0;
                fi;
 
            # if the layer is not irreducible
            else

                # the first step
                order := p^(size-Length(maxmods[1]));
                phi   := phi * ( order^n - order );
                InfoEulerFct2("#I     factor: ",order,"^n - ",order);
                InfoEulerFct2(" (reducible head) \n");
                if phi = 0 then
                    return phi;
                fi;

                # the other steps
                newbase  := maxmods[1];
                oldbase  := newbase;
                cand     := List( maxmods, x -> VectorSpace( x, GF(p) ) );
                newspace := Copy( cand[1] );
                oldspace := newspace;
                for j in [2..Length(cand)] do
                    if not IsBool(cand[j])  then
                        newspace := Intersection( oldspace, cand[j] ); 
                        newbase  := Base( newspace );
                        if Length(newbase) < Length(oldbase) then
                            order := p^(Length(oldbase) - Length(newbase));
                            
                            # maxmods[j] is complement
                            kom     := p^(size-Length(maxmods[j]));
                            cand[j] := false;
                            # test if another candidate is a complement
                            for k in [2..Length(cand)] do
                                if not IsBool(cand[k])  then
                                    if IsSubspace( cand[k], newspace ) 
                                       and not IsSubspace(cand[k], oldspace ) 
                                    then
                                        kom    := p^(size-Length(maxmods[k])) 
                                                  + kom;
                                        cand[k]:= false;
                                    fi;
                                fi;
                            od; 
                            phi := phi * ( order^n - kom );
                            InfoEulerFct2("#I     factor: ",order,"^n - ");
                            InfoEulerFct2(kom," (reducible head) \n");
                            if phi = 0 then
                                return 0;
                            fi;
                            oldspace := newspace;
                            oldbase := newbase;
                        fi;
                    fi;
                od;

                # only the radical is missing now
                order := p^Length(newbase);
                phi := phi * (order^n);
                InfoEulerFct2("#I     factor: ",order,"^n");
                InfoEulerFct2(" (radical) \n");
                if phi = 0 then
                    return 0;
                fi;
            fi;
            i := i + 1;
        od;

        # homomorphism principle for the tail
        next := G.head[head+1];
        order := Product( List( G.weights{[tail..next-1]}, x -> x[3] ) );
        phi := phi * ( order^n );
        InfoEulerFct2("#I     factor: ",order,"^n");
        InfoEulerFct2(" (tail) \n");
        if phi = 0 then
            return 0;
        fi;
    od;
    return phi;
end;

#############################################################################
##
#F  SagGroupOps.Subgroup( <G>, <gens> )  . . . . . . . . . ag subgroup record
##
SagGroupOps.Subgroup := function( G, gens )
    
    return rec( generators := Filtered( gens, x -> x<>G.identity ),
                identity   := G.identity,
     	        isDomain   := true,
                isGroup    := true,
                isAgGroup  := true,
                parent     := G,
                operations := AgGroupOps );
end;


#############################################################################
##
#F  SagGroupOps.AgSubgroup( <G>, <gens>, <flag> ) . . . . .ag subgroup record
##
SagGroupOps.AgSubgroup := function( G, gens, flag )

    # if <gens> generate <G>
    if Length( gens ) = Length( G.cgs )  then
        if   flag and G.cgs = gens and not IsBound( G.igs )  then
            return G;
        elif flag  then
            return rec( generators := gens,
                        identity   := G.identity,
                        cgs        := gens,
     	    	        isDomain   := true,
                        isGroup    := true,
                        isAgGroup  := true,
                        operations := AgGroupOps );
        elif not flag and IsBound( G.igs ) and G.igs = gens  then
            return G;
        else
            return rec( generators := gens,
                        identity   := G.identity,
                        cgs        := G.cgs,
                        igs        := gens,
	    	    	isDomain   := true,
                        isGroup    := true,
                        isAgGroup  := true,
                        operations := AgGroupOps );
        fi;

    # otherwise
    else
        if flag  then
            return rec( generators := gens,
                        identity   := G.identity,
                        cgs        := gens,
	    	    	isDomain   := true,
                        isGroup    := true,
                        isAgGroup  := true,
                        parent     := G,
                        operations := AgGroupOps );
        else
            return rec( generators := gens,
                        identity   := G.identity,
                        igs        := gens,
     	    	        isDomain   := true,
                        isGroup    := true,
                        isAgGroup  := true,
                        parent     := G,
                        operations := AgGroupOps );
        fi;
    fi;
end;


#############################################################################
##
#F  SagGroupOps.IsNilpotent( <G> ) . . . . . . . . . test if <G> is nilpotent
##
SagGroupOps.IsNilpotent := function( G )
    # catch trivial case
    if Length( G.generators ) = 0  then
        return true;
    fi;
    return G.weights[ Length(G.weights) ][ 1 ] = 1;
end; 
    
#############################################################################
##
#F  SagGroupOps.Hallsubgroup( <G>, <primes> ). . . . . . Hall subgroup of <G>
##
SagGroupOps.HallSubgroup := function( G ,primes )

    local   f, gens, i, first;

    f := Set( List( G.weights, x -> x[3] ) );
    
    # check trivial cases
    if 0 = Length( Intersection( f, primes ) )  then
        return G.operations.AgSubgroup( G, [], true );
    elif IsSubset( primes, f )  then
        return G;
    fi;

    # calculate public Hall subgroup
    gens := [];
    for i  in [1..Length( G.first )-1]  do
        first := G.first[i];
        if G.weights[ first ][3] in primes  then
            Append( gens, G.generators{[first..G.first[i+1]-1]} );
        fi;
    od;
    return G.operations.AgSubgroup( G, gens, true );
end;

#############################################################################
##
#F  SagGroupOps.SylowSubgroup( <G>, <p> ) . . . . . <p>-Sylow subgroup of <G>
##
SagGroupOps.SylowSubgroup := function( G, p )
    return G.operations.HallSubgroup( G, [p] );
end;

#############################################################################
##
#F  SagGroupOps.SylowSystem( <G> ) . . . . . . . . . . .a Sylow system of <G>
##
SagGroupOps.SylowSystem := function( G )

    local  sylowgrps, sylowcomp, i, j, pos, first, primes;

    primes    := Set( List( G.weights, x -> x[3] ) );
    sylowgrps := List( primes, x -> [] );
    sylowcomp := List( primes, x -> [] );
    for i  in [1..Length( G.first )-1]  do
        first := G.first[i];
        pos   := Position( primes, G.weights[first][3] );
        Append( sylowgrps[pos], G.generators{[first..G.first[i+1]-1]} );
        for j in [1..Length(primes)] do
            if j <> pos then
                Append( sylowcomp[j], G.generators{[first..G.first[i+1]-1]} );
            fi;
        od; 
    od;
    sylowgrps := List( sylowgrps, x -> G.operations.AgSubgroup(G, x, true));
    sylowcomp := List( sylowcomp, x -> G.operations.AgSubgroup(G, x, true));
    return rec( primes           := primes, 
                sylowSubgroups   := sylowgrps,
                sylowComplements := sylowcomp);
end;

#############################################################################
##
#F  SagGroupOps.SylowComplements( <G> )  . . . . . a complement system of <G>
##
SagGroupOps.SylowComplements := function( G )
    return G.operations.SylowSystem( G );
end;

#############################################################################
##
#F  SagGroupOps.ElementaryAbelianSeries( <G> ). . Leedham-Green series of <G>
##
SagGroupOps.ElementaryAbelianSeries := function( G )

    local   series, first, maxDepth;

    if IsList( G )  then
        return AgGroupOps.ElementaryAbelianSeries( G );
    fi;

    if IsBound( G.elementaryAbelianSeries )  then
        return G.elementaryAbelianSeries;
    fi;
    series := [ ];
    maxDepth := Length( G. generators );
    for first  in G.first  do
        Add(series, G.operations.AgSubgroup( G, 
                                 G.generators{[ first..maxDepth]}, true));
    od;
    G.elementaryAbelianSeries := series;
    return series;
end;

#############################################################################
##
#F  SagGroupOps.IsElementaryAbelianAgSeries( <G> ). . . . . . . . . . . .true
##
SagGroupOps.IsElementaryAbelianAgSeries := function( G )

    if not IsBound( G.elementaryAbelianSeries ) then
        G.elementaryAbelianSeries := ElementaryAbelianSeries( G );
    fi;
    return true;
end;

#############################################################################
##
#F  SystemNormalizer( <G> ) . . . . . . . . normalizer of public sylow system
##
SystemNormalizer := function( G )

    # if the system normalizer is not known, calculate it
    if not IsBound( G.systemNormalizer )  then
        G.systemNormalizer := G.operations.SystemNormalizer( G );
    fi;
    
    return G.systemNormalizer;
end;

SagGroupOps.SystemNormalizer := function( G )
    local i, gens, sylow, norm;

    # if the system normalizer is public, it is easy
    if G.isNormalizerSystem  then
        gens := [];
        for i  in [ 1..Length(G.generators) ]  do
            if G.weights[i][4]  then
                Add( gens, G.generators[i] );
            fi;
        od;
        return G.operations.AgSubgroup( G, gens, true );
    fi;
 
    # otherwise calculate the system normalizer
    sylow := SylowSystem( G ).sylowSubgroups;
    if Length( sylow ) = 1  then
        return G;
    fi;
    norm := Normalizer( G, sylow[1] );
    for i  in [ 2..Length(sylow) ]  do
        norm := Intersection( norm, Normalizer( G, sylow[i] ) );
    od;
    return norm;
end;

#############################################################################
##
#F  SagGroupOps.Centre( <S> ) . . . . . . . . . . . . . . . . . centre of <S> 
##
SagGroupOps.Centre := function( S )

    local primes,     # list of primes dividing the order of <S>
          p,          # actual prime of primes
          maxDepth,   # number of ag generators of <S>
          cent,       # p-parts of centre mod layer as generators in <S>
          centF,      # p-part of centre as generators in F

          head,       # first of second head
          pos,        # position of head in first
          P,          # p-group of first nilpotent factor
          gensP,      # generators of P
          weightsP,   # of P as special ag group
          firstP,     # of P as special ag group

          layer,      # counts layers
          first,      # of layer
          next,       # of layer
          q,          # prime of layer
          field,      # GF(q)
          N,          # subgroup of Leedham-Green series underneath layer
          F,          # <S> / N
          gensF,      # small generating set of F
          M,          # layer as subgroup of F
          gensM,      # generators of M

          U,          # subgroup generated by centF
          null,       # basis of nullspace 
          newgens,    # new generators of p-part of centre in F
          elm,        # element of newgens
          g,          # generator of gensF
          index,      # to filter comm and conj
          matlist,    # operation on layer

          comm,       # commutator with g as list of exponents

          conj,       # conjugate with g as list of exponents
          expo,       # exponent of U
          eigen,      # simultaneous eigenvalues of matlist

          i, j, k, h;

    # catch trivial case
    if IsAbelian(S)  then
        return S;
    fi;

    # get primes and set up cent and maxDepth
    primes   := Set( List( S.weights, x -> x[3] ) );
    maxDepth := Length( S.generators );
    cent     := List( primes, x -> []);

    # the first nilpotent factor
    head  := S.head[2];
    pos   := Position( S.first, head );
    if pos < Length( S.first )  then
        N := S.operations.AgSubgroup(S, S.generators{[head..maxDepth]},true);
        F := CompositionFactorGroup( S, N );
    else 
        F := S;
    fi;

    # run through primes - list
    for i  in [1..Length(primes)]  do
        p := primes[i];

        # get the p-generators of the first head (form a special ag group)
        gensP    := [];
        weightsP := [];
        firstP   := [];
        k        := 0;
        for j  in [ 1..head-1 ]  do
            if S.weights[j][3] = p  then
                Add( gensP, F.generators[j] );
                Add( weightsP, S.weights[j] );
                if S.weights[j][2] > k  then
                    Add(firstP, Length(gensP));
                    k := k + 1;
                fi;
            fi;
        od;
        Add( firstP, Length(gensP)+1 );

        # get generators of p-part of centre
        if Length( gensP ) > 0  then
            P            := F.operations.AgSubgroup( F, gensP, true );
            P.weights    := weightsP;
            P.first      := firstP;
            P.isSagGroup := true;
            P.operations := SagGroupOps;
            centF        := P.operations.GeneratorsCentrePGroup( P, p );
        else
            centF        := [];
        fi;
    
        # go back to S
        cent[i] := List( centF, x -> FactorAgWord( x, S.identity ) );
    od;
    InfoSagCent2("#I  1-st factor: ",cent,"\n");

    # step down Leedham-Green series
    for layer  in [ pos..Length(S.first)-1 ]  do

        first := S.first[layer];
        next  := S.first[layer+1];
        q     := S.weights[first][3];
        field := GF(q);
        N     := S.operations.AgSubgroup(S,S.generators{[next..maxDepth]},
                                                                     true);
        if next <= maxDepth  then
            F     := CompositionFactorGroup( S, N );
            gensM := F.generators{[first..next-1]};
            M     := F.operations.AgSubgroup( F, gensM, true );
        else
            F     := S;
            gensM := S.generators{[first..next-1]};
            M     := S.operations.AgSubgroup( S, gensM, true );
        fi;

        # calculate generators of p-part of centre
        for i in [1..Length(primes)] do
            p     := primes[i];
        
            # get p-part of centre in F
            centF := List( cent[i], x -> FactorAgWord( x, F.identity ) );

            # case p = q 
            if (S.weights[first][2] <> 1 or 0 < Length( centF ))  
               and p = q 
            then

                # put in elements of factorgroup
                Append( centF, gensM );
               
                # calculate centre of centF 
                U     := Subgroup( F, centF );
                centF := U.operations.GeneratorsCentrePGroup( U, p );

                # get centralizer
                gensF := F.generators{
                         Filtered( [1..first-1], x -> S.weights[x][2] = 1) };
                k := 1;
                while 0 < Length( centF ) and k <= Length( gensF )  do

                    # get operation of centF on M
                    g       := gensF[k];
                    newgens := [];
                    matlist := [];
                    index   := [];
                    for j  in [1..Length( centF )]  do
                        comm := Exponents( M, Comm( centF[j], g ), field );
                        if comm = field.zero * comm  then
                            Add( newgens, centF[j] );
                        else
                            Add( matlist, comm );
                            Add( index, j );
                        fi;
                    od;
                 
                    if 0 < Length( matlist )  then
                        null := List( NullspaceMat( matlist ), IntVecFFE );

                        # calculate elements corresponding to null
                        for j  in [1..Length(null)]  do
                            elm := F.identity;
                            for h  in [1..Length(null[j])]  do
                                elm := elm * centF[index[h]] ^ null[j][h];
                            od;
                            Add( newgens, elm );
                        od;
                        centF := Copy( newgens );
                    fi;
                    k := k + 1;
                od;

            # case p <> q
            elif Length( centF ) > 0 then

                # get operation of centF on M
                index   := [];
                newgens := [];
                matlist := [];
                for j  in [1..Length(centF)]  do
                    g    := centF[j];
                    conj := List( gensM, x -> Exponents( M, x^g , field ) );
                    if conj = conj^0  then
                        Add( newgens, g );
                    else
                        Add( matlist, conj );  
                        Add( index, j );
                    fi;
                od;       

                if Length( matlist ) > 0  then

                    # get exponent of U, which is an abelian p-group
                    expo := Maximum( List( centF, x -> Order( F, x ) ) );
            
                    # calculate simultaneous eigenvalues
                    eigen := SimultaneousEigenvalues( matlist, expo );
    
                    # solve system
                    null := NullspaceModQ( eigen, expo );

                    # calculate elements corresponding to null
                    for j  in [1..Length(null)]  do
                        elm := F.identity;
                        for h  in [1..Length(null[j])]  do
                            elm := elm * centF[index[h]] ^ null[j][h];
                        od;
                        if elm <> F.identity  then
                            Add( newgens, elm );
                        fi;
                    od;
                    centF := Igs( Subgroup( F, newgens ) );
                fi;
            fi;

            # go back to S
            cent[i] := List( centF, x -> FactorAgWord( x, S.identity ) );
        od;
        InfoSagCent2("#I  ",layer,"-th layer: ",cent,"\n");
    od;

    # return centre as direct product of p-parts
    return Subgroup( S, Concatenation( cent ) );
end;

