#############################################################################
##
#A  permprod.g                  GAP library                  Martin Schoenert
##
#A  @(#)$Id: permprod.g,v 3.5.1.3 1995/11/25 15:50:15 mschoene Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions for group products and group  constructions.
##
#H  $Log: permprod.g,v $
#H  Revision 3.5.1.3  1995/11/25  15:50:15  mschoene
#H  fixed 'SubdirectProductPermGroupOps' to have its own 'Projection' method
#H  (which needs a different 'PreImagesRepresentative')
#H
#H  Revision 3.5.1.2  1995/09/21  09:31:15  sam
#H  fixed 'WreathProduct' for the case of trivial base group
#H
#H  Revision 3.5.1.1  1994/10/25  08:58:05  htheisse
#H  introduced the use of 'OperationsRecord'
#H
#H  Revision 3.5  1994/07/04  15:01:03  ahulpke
#H  fixed several errors concerning subdirect products
#H
#H  Revision 3.4  1994/06/28  11:05:26  ahulpke
#H  added PermGroupOps.SubdirectProduct (needed for special handling of projections)
#H
#H  Revision 3.3  1994/06/20  15:28:29  ahulpke
#H  Transfer of .stabChainOptions.random
#H
#H  Revision 3.2  1993/01/27  11:45:14  martin
#H  changed 'PGO.WreathProduct' to delegate if <G> is not a permgroup too
#H
#H  Revision 3.1  1992/07/14  13:10:38  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  PermGroupOps.DirectProduct(<grps>)   direct product of permutation groups
##
PermGroupOps.DirectProduct := function ( grps )
    local   D,          # direct product of <grps>, result
            deg,        # degree of <D>
            grp,        # one group in <grps>
            olds,       # old domains of the <grps>
            old,        # old domain of <grp>
            news,       # new domains of the <grps>
            new,        # new domain of <grp>
            perms,      # conjugating permutations
            perm,       # permutatutation conjugating <old> to <new>
            gens,       # generators of <D>
            gen,        # one generator of <grp>
            rans;       # list of groups that have '.sCO.random'

    # check that we can handle this case
    if not ForAll( grps, IsPermGroup )  then
        return GroupOps.DirectProduct( grps );
    fi;

    # loop over the groups
    deg   := 0;
    olds  := [];
    news  := [];
    perms := [];
    gens  := [];
    for grp  in grps  do

        # find old domain, new domain, and conjugating permutation
        old  := PermGroupOps.MovedPoints( grp );
        new  := [deg+1..deg+Length(old)];
        perm := MappingPermListList( old, new );
        deg  := deg + Length(old);
        Add( olds, old );
        Add( news, new );
        Add( perms, perm );

        # map all the generators of <grp>
        for gen  in grp.generators  do
            Add( gens, gen ^ perm );
        od;

    od;

    # make the direct product
    D := Group( gens, () );

    # tag it as direct product
    D.isDirectProduct   := true;

    # enter the information that relates to the construction
    D.groups            := grps;
    D.olds              := olds;
    D.news              := news;
    D.perms             := perms;

    # enter the operations record
    D.operations        := DirectProductPermGroupOps;

    # note random method
    rans := Filtered( grps, i -> IsBound(i.stabChainOptions)
                             and IsBound(i.stabChainOptions.random) );
    if Length( rans ) > 0  then
        D.stabChainOptions := rec(
            random := Minimum( List( rans, i -> i.stabChainOptions.random ) )
			        );
    fi;

    # return the direct product
    return D;
end;


#############################################################################
##
#V  DirectProductPermGroupOps . . . . . operations record for direct products
#V                                                      of permutation groups
##
DirectProductPermGroupOps := OperationsRecord(
    "DirectProductPermGroupOps",
    PermGroupOps );

DirectProductPermGroupOps.Size := function ( D )
    return Product( List( D.groups, Size ) );
end;

DirectProductPermGroupOps.Centre := function ( D )
    local   C,          # centre of <D>, result
            i;          # loop variable

    # compute the centre as closure of the centres in the components
    C := TrivialSubgroup( D );
    for i  in [ 1 .. Length( D.groups ) ]  do
        C := Closure( C,
                      Image( Embedding( D.groups[i], D, i ),
                             Centre( D.groups[i] ) ) );
    od;

    # return the centre
    return C;
end;

DirectProductPermGroupOps.SylowSubgroup := function ( D, p )
    local   S,          # Sylow subgroup of <D>, result
            i;          # loop variable

    # compute the Sylow as closure of the Sylows in the components
    S := TrivialSubgroup( D );
    for i  in [ 1 .. Length( D.groups ) ]  do
        S := Closure( S,
                      Image( Embedding( D.groups[i], D, i ),
                             SylowSubgroup( D.groups[i], p ) ) );
    od;

    # return the Sylow subgroup
    return S;
end;

DirectProductPermGroupOps.Centralizer := function ( D, g )
    local   C,          # centralizer of <g> in <D>, result
            i;          # loop variable

    # compute the centralizer as closure of the centralizer in the components
    C := TrivialSubgroup( D );
    for i  in [ 1 .. Length( D.groups ) ]  do
        C := Closure( C,
                      Image( Embedding( D.groups[i], D, i ),
                             Centralizer( D.groups[i],
                                          Image( Projection(D,D.groups[i],i),
                                                 g ) ) ) );
    od;

    # return the centralizer
    return C;
end;


#############################################################################
##
#F  DirectProductPermGroupOps.Embedding(<G>,<D>,<i>)  . . . .  embedding of a
#F                                      component group into a direct product
##
DirectProductPermGroupOps.Embedding := function ( arg )
    local   G,          # group <G>, first argument
            D,          # direct product <D>, second argument
            i,          # component, optional third argument
            emb,        # embedding, result
            k;          # loop variable

    # get the arguments
    G := arg[1];
    D := arg[2];
    if Length( arg ) = 2  then
        i := 0;
        for k  in [ 1 .. Length( D.groups ) ]  do
            if IsSubgroup( D.groups[k], G )  then
                if i <> 0  then
                    Error("<G> appears in several components of <D>");
                fi;
                i := k;
            fi;
        od;
    else
        i := arg[3];
    fi;

    # maybe we already know the embedding
    if not IsBound( D.embeddings )  then
        D.embeddings := [];
    fi;
    if not IsBound( D.embeddings[i] )  then
        emb := rec();
        emb.isGeneralMapping    := true;
        emb.domain              := Mappings;
        emb.source              := G;
        emb.range               := D;
        emb.isEmbedding         := true;
        emb.component           := i;
        emb.isMapping           := true;
        emb.isInjective         := true;
        emb.isHomomorphism      := true;
        emb.kernel              := TrivialSubgroup( G );
        emb.operations          := EmbeddingDirectProductPermGroupOps;
        D.embeddings[i]         := emb;
    fi;

    # return the embedding
    return D.embeddings[i];
end;

EmbeddingDirectProductPermGroupOps := OperationsRecord(
    "EmbeddingDirectProductPermGroupOps",
    GroupHomomorphismOps );

EmbeddingDirectProductPermGroupOps.ImageElm := function ( emb, elm )
    local   img;        # image of <elm> under <emb>, result

    # make the image
    img := elm ^ emb.range.perms[emb.component];

    # return the image
    return img;
end;

EmbeddingDirectProductPermGroupOps.ImagesElm := function ( emb, elm )
    local   img;        # image of <elm> under <emb>, result

    # make the image
    img := elm ^ emb.range.perms[emb.component];

    # return the image
    return [ img ];
end;

EmbeddingDirectProductPermGroupOps.ImagesRepresentative
  := function ( emb, elm )
    local   img;        # image of <elm> under <emb>, result

    # make the image
    img := elm ^ emb.range.perms[emb.component];

    # return the image
    return img;
end;

EmbeddingDirectProductPermGroupOps.PreImagesRepresentative
  := function ( emb, img )
    local   elm;        # preimage of <elm> under <emb>, result

    # compute the preimage
    elm := RestrictedPerm( img, emb.range.news[emb.component] )
           ^ (emb.range.perms[emb.component]^-1);

    # return the preimage
    return elm;
end;

EmbeddingDirectProductPermGroupOps.Print := function ( emb )
    Print("Embedding( ",emb.source,", ",emb.range,", ",emb.component," )");
end;


#############################################################################
##
#F  DirectProductOps.Projection(<D>,<G>,<i>) . projection of a direct product
#F                              or a subdirect product onto a component group
##
DirectProductPermGroupOps.Projection := function ( arg )
    local   D,          # direct product <D>, first argument
            G,          # group <G>, second argument
            i,          # component, optional third argument
            prj,        # projection, result
            k;          # loop variable

    # get the arguments
    D := arg[1];
    G := arg[2];
    if Length( arg ) = 2  then
        i := 0;
        for k  in [ 1 .. Length( D.groups ) ]  do
            if D.groups[k] = G  then
                if i <> 0  then
                    Error("<G> is equal to several components of <D>");
                fi;
                i := k;
            fi;
        od;
    else
        i := arg[3];
    fi;

    # maybe we already know the projection
    if not IsBound( D.projections )  then
        D.projections := [];
    fi;
    if not IsBound( D.projections[i] )  then
        prj := rec();
        prj.isGeneralMapping    := true;
        prj.domain              := Mappings;
        prj.source              := D;
        prj.range               := G;
        prj.isProjection        := true;
        prj.component           := i;
        prj.isMapping           := true;
        prj.isSurjective        := true;
        prj.isHomomorphism      := true;
        prj.operations          := ProjectionDirectProductPermGroupOps;
        D.projections[i]        := prj;
    fi;

    # return the projection
    return D.projections[i];
end;

ProjectionDirectProductPermGroupOps := OperationsRecord(
    "ProjectionDirectProductPermGroupOps",
    GroupHomomorphismOps );

ProjectionDirectProductPermGroupOps.ImageElm := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := RestrictedPerm( elm, prj.source.news[prj.component] )
           ^ (prj.source.perms[prj.component]^-1);

    # return the image
    return img;
end;

ProjectionDirectProductPermGroupOps.ImagesElm := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := RestrictedPerm( elm, prj.source.news[prj.component] )
           ^ (prj.source.perms[prj.component]^-1);

    # return the image
    return [ img ];
end;

ProjectionDirectProductPermGroupOps.ImagesRepresentative
  := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := RestrictedPerm( elm, prj.source.news[prj.component] )
           ^ (prj.source.perms[prj.component]^-1);

    # return the image
    return img;
end;

ProjectionDirectProductPermGroupOps.PreImagesRepresentative
  := function ( prj, img )
    local   elm;        # preimage of <img> under <prj>, result

    if not img in prj.range then 
      Error("image not in range");
    fi;

    # make the preimage
    elm := img ^ prj.source.perms[prj.component];

    # return the preimage
    return elm;
end;

ProjectionDirectProductPermGroupOps.Print := function ( prj )
    Print("Projection( ",prj.source,", ",prj.range,", ",prj.component," )");
end;


#############################################################################
##
#F  PermGroupOps.SubdirectProduct(<G1>,<G2>,<phi1>,<phi2>)  subdirect product
##
PermGroupOps.SubdirectProduct := function ( G1, G2, phi1, phi2 )
    local   S,          # subdirect product of <G1> and <G2>, result
            gens,       # generators of <S>
            D,          # direct product of <G1> and <G2>
            emb1, emb2, # embeddings of <G1> and <G2> into <D>
            gen;        # one generator of <G1> or Kernel( <phi2> )

    # if we cannot use the special permutation stuff.
    if not IsPermGroup(G2) then
        return GroupOps.SubdirectProduct( G1, G2, phi1, phi2 );
    fi;

    # make the direct product and the embeddings
    D := PermGroupOps.DirectProduct([G1,G2]);
    emb1 := Embedding( G1, D, 1 );
    emb2 := Embedding( G2, D, 2 );

    # the subdirect product is generated by $(g_1,x_{g_1})$ where $g_1$ loops
    # over the  generators of $G_1$  and $x_{g_1} \in   G_2$ is abitrary such
    # that $g_1^{phi_1} = x_{g_1}^{phi_2}$ and by $(1,k_2)$ where $k_2$ loops
    # over the generators of the kernel of $phi_2$.
    gens := [];
    for gen  in G1.generators  do
        Add( gens, gen^emb1 * PreImagesRepresentative(phi2,gen^phi1)^emb2 );
    od;
    for gen in Kernel( phi2 ).generators  do
        Add( gens, gen ^ emb2 );
    od;

    # and make the subdirect product
    S := Group( D.operations.Subgroup( D, gens ) );
    S.isSubdirectProduct        := true;

    # enter the information that relates to the construction
    S.groups                    := [ G1, G2 ];
    S.homomorphisms             := [ phi1, phi2 ];

    # enter the operations record
    S.operations                := SubdirectProductPermGroupOps;

    # transfer info from D needed for Projection
    S.olds  := D.olds;
    S.news  := D.news;
    S.perms := D.perms;

    # return the subdirect product
    return S;
end;


#############################################################################
##
#V  SubdirectProductPermGroupOps  .  operations record for subdirect products
#V                                                      of permutation groups
##
SubdirectProductPermGroupOps := OperationsRecord(
    "SubdirectProductPermGroupOps",
    PermGroupOps );

SubdirectProductPermGroupOps.Size := function ( S )
    return Size( S.groups[1] ) * Size( S.groups[2] )
         / Size( Image( S.homomorphisms[1] ) );
end;


#############################################################################
##
#F  SubdirectProductPermGroupOps.Projection(<S>,<G>,<i>)  . projection onto a
#F                                                                  component
##
SubdirectProductPermGroupOps.Projection := function ( arg )
    local   S,          # subdirect product <S>, first argument
            G,          # group <G>, second argument
            i,          # component, optional third argument
            prj,        # projection, result
            k;          # loop variable

    # get the arguments
    S := arg[1];
    G := arg[2];
    if Length( arg ) = 2  then
        i := 0;
        for k  in [ 1 .. Length( S.groups ) ]  do
            if S.groups[k] = G  then
                if i <> 0  then
                    Error("<G> is equal to several components of <S>");
                fi;
                i := k;
            fi;
        od;
    else
        i := arg[3];
    fi;

    # maybe we already know the projection
    if not IsBound( S.projections )  then
        S.projections := [];
    fi;
    if not IsBound( S.projections[i] )  then
        prj := rec();
        prj.isGeneralMapping    := true;
        prj.domain              := Mappings;
        prj.source              := S;
        prj.range               := G;
        prj.isProjection        := true;
        prj.component           := i;
        prj.isMapping           := true;
        prj.isSurjective        := true;
        prj.isHomomorphism      := true;
        prj.operations          := ProjectionSubdirectProductPermGroupOps;
        S.projections[i]        := prj;
    fi;

    # return the projection
    return S.projections[i];
end;

ProjectionSubdirectProductPermGroupOps := OperationsRecord(
    "ProjectionSubdirectProductPermGroupOps",
    GroupHomomorphismOps );

ProjectionSubdirectProductPermGroupOps.ImageElm := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := RestrictedPerm( elm, prj.source.news[prj.component] )
           ^ (prj.source.perms[prj.component]^-1);

    # return the image
    return img;
end;

ProjectionSubdirectProductPermGroupOps.ImagesElm := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := RestrictedPerm( elm, prj.source.news[prj.component] )
           ^ (prj.source.perms[prj.component]^-1);

    # return the image
    return [ img ];
end;

ProjectionSubdirectProductPermGroupOps.ImagesRepresentative
  := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := RestrictedPerm( elm, prj.source.news[prj.component] )
           ^ (prj.source.perms[prj.component]^-1);

    # return the image
    return img;
end;

ProjectionSubdirectProductPermGroupOps.PreImagesRepresentative
  := function ( prj, img )
    local   elm,        # preimage of <img> under <prj>, result
            phi1, phi2; # homomorphisms of components

    # check that the image is in the range (should happen in the dispatcher)
    if not img in prj.range then 
        Error("image not in range");
    fi;

    # get the homomorphism
    phi1 := prj.source.homomorphisms[1];
    phi2 := prj.source.homomorphisms[2];

    # compute the preimage
    if 1 = prj.component  then
        elm := img                                    ^ prj.source.perms[1]
             * PreImagesRepresentative(phi2,img^phi1) ^ prj.source.perms[2];
    else
        elm := img                                    ^ prj.source.perms[2]
             * PreImagesRepresentative(phi1,img^phi2) ^ prj.source.perms[1];
    fi;

    # return the preimage
    return elm;
end;

ProjectionSubdirectProductPermGroupOps.Print := function ( prj )
    Print("Projection( ",prj.source,", ",prj.range,", ",prj.component," )");
end;


#############################################################################
##
#F  PermGroupOps.WreathProduct(<G>,<H>,<alpha>) . . . . . . wreath product of
#F                                                         permutation groups
##
PermGroupOps.WreathProduct := function ( G, H, alpha )
    local   grp,        # wreath product of <G> and <H>, result
            gens,       # generators of the wreath product
            gen,        # one generator
            domG,       # domain of operation of <G>
            degG,       # degree of <G>
            I,          # image of <H> under <alpha>
            domI,       # domain of operation of <I>
            degI,       # degree of <I>
            shift,      # permutation permuting the blocks
            rans,       # list of arguments that have '.sCO.random'
            i, k, l;    # loop variables

    # delegate the work if <G> is not a permutation group too
    if not IsPermGroup( G )  then
        return GroupOps.WreathProduct( G, H, alpha );
    fi;

    # get the domain of operation of <G>
    domG := PermGroupOps.MovedPoints( G );
    degG := Length( domG );

    # get the degree of the image of <H>
    I := Image( alpha, H );
    domI := PermGroupOps.MovedPoints( I );
    degI := Length( domI );

    # make the generators of the direct product of <deg> copies of <G>
    gens := [];
    for i  in [1..degI]  do
        shift := MappingPermListList( domG, [(i-1)*degG+1..i*degG] );
        for gen  in G.generators  do
            Add( gens, gen ^ shift );
        od;
    od;

    # add the generators of <I>
    if degG = 0 then degG := 1; fi;
    for gen  in I.generators  do
        shift := [];
        for i  in [1..degI]  do
            k := Position( domI, domI[i]^gen );
            for l  in [1..degG]  do
                shift[(i-1)*degG+l] := (k-1)*degG+l;
            od;
        od;
        Add( gens, PermList( shift ) );
    od;

    # make the group generated by those generators
    grp := Group( gens, () );

    # enter the size
    grp.size := Size( G ) ^ degI * Size( I );

    # note random method
    rans := Filtered( [ G, H ], i -> IsBound(i.stabChainOptions)
                                 and IsBound(i.stabChainOptions.random) );
    if Length( rans ) > 0 then
        grp.stabChainOptions := rec(
            random := Minimum( List( rans, i -> i.stabChainOptions.random ) )
			           );
    fi;

    # return the group
    return grp;
end;



