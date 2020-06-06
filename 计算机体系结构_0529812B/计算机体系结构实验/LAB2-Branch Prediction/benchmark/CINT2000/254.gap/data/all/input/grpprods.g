#############################################################################
##
#A  grpprods.g                  GAP library                      Frank Celler
#A                                                         & Martin Schoenert
##
#A  @(#)$Id: grpprods.g,v 3.14.1.2 1995/11/25 15:48:51 mschoene Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions for group products and group constructions.
##
#H  $Log: grpprods.g,v $
#H  Revision 3.14.1.2  1995/11/25  15:48:51  mschoene
#H  fixed 'SubdirectProductOps' to have its own 'Projection' method
#H  (which needs a different 'PreImagesRepresentative')
#H
#H  Revision 3.14.1.1  1994/10/25  08:58:05  htheisse
#H  introduced the use of 'OperationsRecord'
#H
#H  Revision 3.14  1994/01/24  12:30:14  sam
#H  fixed 'SemidirectProductElementOps.\^'
#H
#H  Revision 3.13  1993/03/11  13:08:53  ahulpke
#H  apply homomorphism for Semidirect Product by 'Image' instead of '^'
#H
#H  Revision 3.12  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.11  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.10  1992/03/26  15:14:33  martin
#H  changed 'SemiDirectProduct' to 'SemidirectProduct'
#H
#H  Revision 3.9  1992/03/19  15:42:13  martin
#H  added basic groups
#H
#H  Revision 3.8  1992/02/10  15:14:35  martin
#H  added the domain 'Mappings'
#H
#H  Revision 3.7  1992/01/29  09:09:38  martin
#H  changed 'Order' to take two arguments, group and element
#H
#H  Revision 3.6  1992/01/07  12:39:57  martin
#H  changed everything
#H
#H  Revision 3.5  1991/12/12  12:46:10  fceller
#H  changed to use 'DirectProductElementOps', etc.
#H
#H  Revision 3.4  1991/11/07  09:36:15  fceller
#H  More new names because of new domain concept.
#H
#H  Revision 3.3  1991/09/24  13:16:21  fceller
#H  Minor improvment in 'SemiDirectProduct'.
#H
#H  Revision 3.2  1991/09/09  07:51:36  fceller
#H  'SomethingAgGroup' is now 'AgGroupOps.Something'
#H
#H  Revision 3.1  1991/09/04  10:06:13  fceller
#H  Initial release under RCS
#H
##


#############################################################################
##
#F  InfoGroup1( <arg> ) . . . . . . . . . . . . . . . . . package information
#F  InfoGroup2( <arg> ) . . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoGroup1 )  then InfoGroup1 := Ignore;  fi;
if not IsBound( InfoGroup2 )  then InfoGroup2 := Ignore;  fi;


#############################################################################
##
#F  IsDirectProductElement(<obj>) . . . . . . . . . .  test if an object is a
#F                                                     direct product element
##
IsDirectProductElement := function ( obj )
    return     IsRec( obj )
           and IsBound( obj.isDirectProductElement )
           and obj.isDirectProductElement;
end;


#############################################################################
##
#F  DirectProductElement(<g>,..)  . . . . . . . . element of a direct product
##
DirectProductElement := function ( arg )
    local   D;
    if Length( arg ) = 1  and IsList( arg[1] )  then
        arg := arg[1];
    fi;
    D := Domain( arg );
    return D.operations.DirectProductElement( D, arg );
end;

GroupElementsOps.DirectProductElement := function ( D, elms )
    local   elm;

    # make the direct product element
    elm := rec( );
    elm.isGroupElement          := true;
    elm.isDirectProductElement  := true;
    elm.domain                  := GroupElements;

    # enter the identifying information
    elm.element                := ShallowCopy( elms );

    # enter the operations record
    elm.operations              := DirectProductElementOps;

    # return the direct product element
    return elm;
end;

DirectProductElementOps := OperationsRecord(
    "DirectProductElementOps",
    GroupElementOps );

DirectProductElementOps.\*     := function ( a, b )
    local   prd,        # product of <a> and <b>, result
            i;          # loop variable

    # product of a direct product element
    if IsDirectProductElement( a )  then

        # with another direct product element
        if IsDirectProductElement( b )  then

            # check that they are compatible
            if   a.domain <> b.domain  then
                Error("<a> and <b> must lie in the same domain");
            elif Length(a.element) <> Length(b.element)  then
                Error("<a> and <b> must have the same number of elements");
            fi;

            # compute the product
            prd := rec();
            prd.isGroupElement          := true;
            prd.isDirectProductElement  := true;
            prd.domain                  := a.domain;
            prd.element                 := [];
            for i  in [ 1 .. Length( a.element ) ]  do
                Add( prd.element, a.element[i] * b.element[i] );
            od;
            prd.operations              := a.operations;

        # with a list, distribute
        elif IsList( b )  then
            prd := [];
            for i  in [ 1 .. Length( b ) ]  do
                prd[i] := a * b[i];
            od;

        # with something else, undefined
        else
            Error("product of <a> and <b> must be defined");
        fi;

    # of a list
    elif IsList( a )  then

        # with a direct product element, distribute
        if IsDirectProductElement( b )  then
            prd := [];
            for i  in [ 1 .. Length( a ) ]  do
                prd[i] := a[i] * b;
            od;

        # with something else, undefined
        else
            Error("product of <a> and <b> must be defined");
        fi;

    # maybe <a> knows how to handle this
    elif    IsRec( a )
        and IsBound( a.operations )
        and IsBound( a.operations.\* )
        and a.operations.\* <> DirectProductElementOps.\*
    then
        prd := a.operations.\*( a, b );

    # of something else is undefined
    else
        if IsDirectProductElement( b )  then
            Error("product of <a> and <b> must be defined");
        else
            Error("panic: neither <a> nor <b> is a direct product element");
        fi;
    fi;

    # return the product
    return prd;
end;

DirectProductElementOps.\/     := function ( a, b )
    local   quo,        # quotient of <a> and <b>, result
            i;          # loop variable

    # quotient of a direct product element
    if IsDirectProductElement( a )  then

        # with another direct product element
        if IsDirectProductElement( b )  then

            # check that they are compatible
            if   a.domain <> b.domain  then
                Error("<a> and <b> must lie in the same domain");
            elif Length(a.element) <> Length(b.element)  then
                Error("<a> and <b> must have the same number of elements");
            fi;

            # compute the quotient
            quo := rec();
            quo.isGroupElement          := true;
            quo.isDirectProductElement  := true;
            quo.domain                  := a.domain;
            quo.element                 := [];
            for i  in [ 1 .. Length( a.element ) ]  do
                Add( quo.element, a.element[i] / b.element[i] );
            od;
            quo.operations              := a.operations;

        # with a list, distribute
        elif IsList( b )  then
            quo := [];
            for i  in [ 1 .. Length( b ) ]  do
                quo[i] := a / b[i];
            od;

        # with something else, undefined
        else
            Error("quotient of <a> and <b> must be defined");
        fi;

    # of a list
    elif IsList( a )  then

        # with a direct product element, distribute
        if IsDirectProductElement( b )  then
            quo := [];
            for i  in [ 1 .. Length( a ) ]  do
                quo[i] := a[i] / b;
            od;

        # with something else, undefined
        else
            Error("quotient of <a> and <b> must be defined");
        fi;

    # maybe <a> knows how to handle this
    elif    IsRec( a )
        and IsBound( a.operations )
        and IsBound( a.operations.\/ )
        and a.operations.\/ <> DirectProductElementOps.\/
    then
        quo := a.operations.\/( a, b );

    # of something else is undefined
    else
        if IsDirectProductElement( b )  then
            Error("quotient of <a> and <b> must be defined");
        else
            Error("panic: neither <a> nor <b> is a direct product element");
        fi;
    fi;

    # return the quotient
    return quo;
end;

DirectProductElementOps.\^ := function ( a, b )
    local   pow,        # power of <a> with <b>, result
            i;          # loop variable

    # product of a direct product element
    if IsDirectProductElement( a )  then

        # with another direct product element
        if IsDirectProductElement( b )  then

            # check that they are compatible
            if   a.domain <> b.domain  then
                Error("<a> and <b> must lie in the same domain");
            elif Length(a.element) <> Length(b.element)  then
                Error("<a> and <b> must have the same number of elements");
            fi;

            # compute the power
            pow := rec();
            pow.isGroupElement          := true;
            pow.isDirectProductElement  := true;
            pow.domain                  := a.domain;
            pow.element                 := [];
            for i  in [ 1 .. Length( a.element ) ]  do
                Add( pow.element, a.element[i] ^ b.element[i] );
            od;
            pow.operations              := a.operations;

        # with an integer
        elif IsInt( b )  then

            # compute the product
            pow := rec();
            pow.isGroupElement          := true;
            pow.isDirectProductElement  := true;
            pow.domain                  := a.domain;
            pow.element                 := [];
            for i  in [ 1 .. Length( a.element ) ]  do
                Add( pow.element, a.element[i] ^ b );
            od;
            pow.operations              := a.operations;

        # with something else
        else
            Error("power of <a> and <b> must be defined");
        fi;

    # maybe <a> knows how to handle this
    elif    IsRec( a )
        and IsBound( a.operations )
        and IsBound( a.operations.\^ )
        and a.operations.\^ <> DirectProductElementOps.\^
    then
        pow := a.operations.\^( a, b );

    # of something else is undefined
    else
        if IsDirectProductElement( b )  then
            Error("power of <a> and <b> must be defined");
        else
            Error("panic: neither <a> nor <b> is a direct product element");
        fi;
    fi;

    # return the power
    return pow;
end;

DirectProductElementOps.Print := function ( a )
    local   i;
    Print( "DirectProductElement( " );
    for i  in [ 1 .. Length( a.element )-1 ]  do
        Print( a.element[i], ", " );
    od;
    Print( a.element[ Length(a.element) ], " )" );
end;


#############################################################################
##
#F  IsDirectProduct(<D>)  . . . . . . . . test if a group is a direct product
##
IsDirectProduct := function ( D )
    return     IsRec( D )
           and IsBound( D.isDirectProduct )
           and D.isDirectProduct;
end;


#############################################################################
##
#F  DirectProduct(<G>,..) . . . . . . . . . . . . .  direct product of groups
##
DirectProduct := function ( arg )
    local   D;          # direct product of the arguments, result

    # unravel the arguments
    if Length( arg ) = 1  and IsList( arg[1] )  then
        arg := arg[1];
    fi;

    # check that the arguments are all groups
    if Length( arg ) = 0  then
        Error("usage: DirectProduct( <G>,.. )");
    elif not ForAll( arg, IsGroup )  then
        Error("<G1>, <G2>,.. must be groups");
    fi;

    # make the direct product
    D := arg[1].operations.DirectProduct( arg );

    # enter the relevant information
    D.groups := ShallowCopy( arg );

    # return the direct product
    return D;
end;

GroupOps.DirectProduct := function ( grps )
    local   D,          # direct product of <grps>, result
            id,         # identity of <D>
            gens,       # generators of <D>
            gen,        # one generator of <D>
            grp,        # one group in <grps>
            i, j;       # loop variables

    # make the identity
    id := rec( );
    id.isGroupElement           := true;
    id.isDirectProductElement   := true;
    id.domain                   := GroupElements;
    id.element                  := [];
    for grp  in grps  do
        Add( id.element, grp.identity );
    od;
    id.operations               := DirectProductElementOps;

    # make the set of generators
    gens := [];
    for i  in [ 1 .. Length( grps ) ]  do
        for j  in [ 1 .. Length( grps[i].generators ) ]  do
            gen := ShallowCopy( id );
            gen.element := ShallowCopy( gen.element );
            gen.element[i] := grps[i].generators[j];
            Add( gens, gen );
        od;
    od;

    # make the direct product
    D := Group( gens, id );

    # tag it as direct product
    D.isDirectProduct   := true;

    # enter the information that relates to the construction
    D.groups            := grps;

    # enter the operations record
    D.operations        := DirectProductOps;

    # return the direct product
    return D;
end;


#############################################################################
##
#V  DirectProductOps  . . . . . . operations record for direct product groups
##
DirectProductOps := OperationsRecord(
    "DirectProductOps",
    GroupOps );

DirectProductOps.Size := function ( D )
    return Product( List( D.groups, Size ) );
end;

DirectProductOps.\in := function ( g, D )
    return     IsDirectProductElement( g )
           and IsDirectProduct( D )
           and Length( g.element ) = Length( D.groups )
           and ForAll( [ 1 .. Length( D.groups ) ],
                       i -> g.element[i] in D.groups[i] );
end;

DirectProductOps.Random := function ( D )
    return DirectProductElement( List( D.groups, Random ) );
end;

DirectProductOps.Centre := function ( D )
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

DirectProductOps.SylowSubgroup := function ( D, p )
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

DirectProductOps.Centralizer := function ( D, g )
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

DirectProductOps.Order := function ( G, a )
    local   ord,        # order of <a> in <G>, result
            i;          # loop variable
    ord := 1;
    for i  in [ 1 .. Length( G.groups ) ]  do
        ord := LcmInt( ord, Order( G.groups[i], a.element[i] ) );
    od;
    return ord;
end;


#############################################################################
##
#F  DirectProductOps.Embedding(<G>,<D>,<i>) .  embedding of a component group
#F                                                      into a direct product
##
DirectProductOps.Embedding := function ( arg )
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
        emb.operations          := EmbeddingDirectProductOps;
        D.embeddings[i]         := emb;
    fi;

    # return the embedding
    return D.embeddings[i];
end;

EmbeddingDirectProductOps := OperationsRecord(
    "EmbeddingDirectProductOps",
    GroupHomomorphismOps );

EmbeddingDirectProductOps.ImageElm := function ( emb, elm )
    local   img;        # image of <elm> under <emb>, result

    # make the image
    img := ShallowCopy( emb.range.identity );
    img.element := ShallowCopy( img.element );
    img.element[emb.component]  := elm;

    # return the image
    return img;
end;

EmbeddingDirectProductOps.ImagesElm := function ( emb, elm )
    local   img;        # image of <elm> under <emb>, result

    # make the image
    img := ShallowCopy( emb.range.identity );
    img.element := ShallowCopy( img.element );
    img.element[emb.component]  := elm;

    # return the image
    return [ img ];
end;

EmbeddingDirectProductOps.ImagesRepresentative
  := function ( emb, elm )
    local   img;        # image of <elm> under <emb>, result

    # make the image
    img := ShallowCopy( emb.range.identity );
    img.element := ShallowCopy( img.element );
    img.element[emb.component]  := elm;

    # return the image
    return img;
end;

EmbeddingDirectProductOps.PreImagesRepresentative
  := function ( emb, img )
    local   elm;        # preimage of <elm> under <emb>, result

    # compute the preimage
    elm := img.element[ emb.component ];

    # return the preimage
    return elm;
end;

EmbeddingDirectProductOps.Print := function ( emb )
    Print("Embedding( ",emb.source,", ",emb.range,", ",emb.component," )");
end;


#############################################################################
##
#F  DirectProductOps.Projection(<D>,<G>,<i>) . projection of a direct product
#F                                                     onto a component group
##
DirectProductOps.Projection := function ( arg )
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
            if D.groups[i] = G  then
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
        prj.operations          := ProjectionDirectProductOps;
        D.projections[i]        := prj;
    fi;

    # return the projection
    return D.projections[i];
end;

ProjectionDirectProductOps := OperationsRecord(
    "ProjectionDirectProductOps",
    GroupHomomorphismOps );

ProjectionDirectProductOps.ImageElm := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := elm.element[prj.component];

    # return the image
    return img;
end;

ProjectionDirectProductOps.ImagesElm := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := elm.element[prj.component];

    # return the image
    return [ img ];
end;

ProjectionDirectProductOps.ImageRepresentative
  := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := elm.element[prj.component];

    # return the image
    return img;
end;

ProjectionDirectProductOps.PreImagesRepresentative
  := function ( prj, img )
    local   elm;        # preimage of <img> under <prj>, result

    # compute the preimage
    elm := ShallowCopy( prj.source.identity );
    elm.element := ShallowCopy( elm.element );
    elm.element[prj.component]  := img;

    # return the preimage
    return elm;
end;

ProjectionDirectProductOps.Print := function ( prj )
    Print("Projection( ",prj.source,", ",prj.range,", ",prj.component," )");
end;


#############################################################################
##
#F  SubdirectProduct(<G1>,<G2>,<phi1>,<phi2>) . . subdirect product of groups
##
SubdirectProduct := function ( G1, G2, phi1, phi2 )

    # check the arguments
    if not IsGroup( G1 )  then
        Error("<G1> must be a group");
    elif not IsGroup( G2 )  then
        Error("<G2> must be a group");
    elif not IsGeneralMapping(phi1)  or not IsHomomorphism(phi1)  then
        Error("<phi1> must be a homomorphism");
    elif not IsGeneralMapping(phi2)  or not IsHomomorphism(phi2)  then
        Error("<phi2> must be a homomorphism");
    elif Image(phi1,G1) <> Image(phi2,G2)  then
        Error("<G1> under <phi1> must be equal to <G2> under <phi2>");
    fi;

    # dispatch depending on the first group
    return G1.operations.SubdirectProduct( G1, G2, phi1, phi2 );
end;

GroupOps.SubdirectProduct := function ( G1, G2, phi1, phi2 )
    local   S,          # subdirect product of <G1> and <G2>, result
            gens,       # generators of <S>
            D,          # direct product of <G1> and <G2>
            emb1, emb2, # embeddings of <G1> and <G2> into <D>
            gen;        # one generator of <G1> or Kernel( <phi2> )

    # make the direct product and the embeddings
    D := DirectProduct( G1, G2 );
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
    S.operations                := SubdirectProductOps;

    # return the subdirect product
    return S;
end;


#############################################################################
##
#V  SubdirectProductOps . . . . . .  operations record for subdirect products
##
SubdirectProductOps := OperationsRecord(
    "SubdirectProductOps",
    GroupOps );

SubdirectProductOps.Size := function ( S )
    return Size( S.groups[1] ) * Size( S.groups[2] )
         / Size( Image( S.homomorphisms[1] ) );
end;


#############################################################################
##
#F  SubdirectProductOps.Projection(<S>,<G>,<i>) . projection onto a component
##
SubdirectProductOps.Projection := function ( arg )
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
        prj.operations          := ProjectionSubdirectProductOps;
        S.projections[i]        := prj;
    fi;

    # return the projection
    return S.projections[i];
end;

ProjectionSubdirectProductOps := OperationsRecord(
    "ProjectionSubdirectProductOps",
    GroupHomomorphismOps );

ProjectionSubdirectProductOps.ImageElm := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := elm.element[prj.component];

    # return the image
    return img;
end;

ProjectionSubdirectProductOps.ImagesElm := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := elm.element[prj.component];

    # return the image
    return [ img ];
end;

ProjectionSubdirectProductOps.ImageRepresentative
  := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := elm.element[prj.component];

    # return the image
    return img;
end;

ProjectionSubdirectProductOps.PreImagesRepresentative
  := function( prj, img )
    local   elm,        # preimage of <img> under <prj>, result
            phi1, phi2; # homomorphisms of components

    # get the homomorphism
    phi1 := prj.source.homomorphisms[1];
    phi2 := prj.source.homomorphisms[2];

    # compute the preimage
    elm         := ShallowCopy( prj.source.identity );
    elm.element := ShallowCopy( elm.element );
    if 1 = prj.component  then
        elm.element[1] := img;
        elm.element[2] := PreImagesRepresentative(phi2,img^phi1);
    else
        elm.element[2] := img;
        elm.element[1] := PreImagesRepresentative(phi1,img^phi2);
    fi;

    # return the preimage
    return elm;
end;

ProjectionSubdirectProductOps.Print := function ( prj )
    Print("Projection( ",prj.source,", ",prj.range,", ",prj.component," )");
end;


#############################################################################
##
#F  IsSemidirectProductElement(<obj>) . . . . . . . .  test if an object is a
#F                                                 semidirect product element
##
IsSemidirectProductElement := function ( obj )
    return     IsRec( obj )
           and IsBound( obj.isSemidirectProductElement )
           and obj.isSemidirectProductElement;
end;


#############################################################################
##
#F  SemidirectProductElement(<g>,..)  . . . . element of a semidirect product
##
SemidirectProductElement := function ( g, a, h )
    local   D;
    D := Domain( [ g, h ] );
    return D.operations.SemidirectProductElement( D, g, a, h );
end;

GroupElementsOps.SemidirectProductElement := function ( D, g, a, h )
    local   elm;

    # make the semidirect product element
    elm := rec( );
    elm.isGroupElement              := true;
    elm.isSemidirectProductElement  := true;
    elm.domain                      := GroupElements;

    # enter the identifying information
    elm.element                     := [ g, h ];
    elm.automorphism                := a;

    # enter the operations record
    elm.operations                  := SemidirectProductElementOps;

    # return the semidirect product element
    return elm;
end;

SemidirectProductElementOps := OperationsRecord(
    "SemidirectProductElementOps",
    GroupElementOps );

SemidirectProductElementOps.\*     := function ( a, b )
    local   prd,        # product of <a> and <b>, result
            i;          # loop variable

    # product of a semidirect product element
    if IsSemidirectProductElement( a )  then

        # with another semidirect product element
        if IsSemidirectProductElement( b )  then

            # check that they are compatible
            if   a.domain <> b.domain  then
                Error("<a> and <b> must lie in the same domain");
            fi;

            # compute the product
            prd := rec();
            prd.isGroupElement  := true;
            prd.isSemidirectProductElement := true;
            prd.domain          := a.domain;
            prd.automorphism    := a.automorphism * b.automorphism;
            prd.element         := [ a.element[1]
                                    *b.element[1],
                                     a.element[2]^b.automorphism
                                    *b.element[2] ];
            prd.operations      := a.operations;

        # with a list, distribute
        elif IsList( b )  then
            prd := [];
            for i  in [ 1 .. Length( b ) ]  do
                prd[i] := a * b[i];
            od;

        # with something else, undefined
        else
            Error("product of <a> and <b> must be defined");
        fi;

    # of a list
    elif IsList( a )  then

        # with a semidirect product element, distribute
        if IsSemidirectProductElement( b )  then
            prd := [];
            for i  in [ 1 .. Length( a ) ]  do
                prd[i] := a[i] * b;
            od;

        # with something else, undefined
        else
            Error("product of <a> and <b> must be defined");
        fi;

    # maybe <a> knows how to handle this
    elif    IsRec( a )
        and IsBound( a.operations )
        and IsBound( a.operations.\* )
        and a.operations.\* <> SemidirectProductElementOps.\*
    then
        prd := a.operations.\*( a, b );

    # of something else is undefined
    else
        if IsSemidirectProductElement( b )  then
         Error("product of <a> and <b> must be defined");
        else
         Error("panic: neither <a> nor <b> is a semidirect product element");
        fi;
    fi;

    # return the product
    return prd;
end;

SemidirectProductElementOps.\^ := function ( a, b )
    local   pow,        # power of <a> with <b>, result
            i;          # loop variable

    # power of a semidirect product element
    if IsSemidirectProductElement( a )  then

        # with another semidirect product element
        if IsSemidirectProductElement( b )  then

            # check that they are compatible
            if   a.domain <> b.domain  then
                Error("<a> and <b> must lie in the same domain");
            fi;

            # compute the power
            pow := rec();
            pow.isGroupElement  := true;
            pow.isSemidirectProductElement := true;
            pow.domain          := a.domain;
            pow.automorphism    := a.automorphism ^ b.automorphism;
            pow.element         := [ a.element[1]
                                    ^b.element[1],
                                    (b.element[2]^-1)^pow.automorphism
                                    *a.element[2]^b.automorphism
                                    *b.element[2] ];
            pow.operations      := a.operations;

        # with an integer
        elif IsInt( b )  then

            # if necessary invert the element
            if b < 0  then
                pow := ShallowCopy( a );
                pow.automorphism := a.automorphism^-1;
                pow.element      := [ a.element[1]^-1,
                                     (a.element[2]^-1)^(a.automorphism^-1) ];
                a := pow;
                b := -b;
            fi;

            # make the identity element
            pow := rec();
            pow.isGroupElement  := true;
            pow.isSemidirectProductElement := true;
            pow.domain          := a.domain;
            pow.automorphism    := a.automorphism^0;
            pow.element         := [ a.element[1]^0,
                                     a.element[2]^0 ];
            pow.operations      := a.operations;
                
            # use repreated squaring method
            if b <> 0  then
                i := 2 ^ ( LogInt( b, 2 ) + 1 );
                while 1 < i  do
                    pow := pow * pow;
                    i := QuoInt( i, 2 );
                    if i <= b  then
                        pow := pow * a;
                        b := b - i;
                    fi;
                od;
            fi;

        # with something else
        else
            Error("power of <a> and <b> must be defined");
        fi;

    # maybe <a> knows how to handle this
    elif    IsRec( a )
        and IsBound( a.operations )
        and IsBound( a.operations.\^ )
        and a.operations.\^ <> SemidirectProductElementOps.\^
    then
        pow := a.operations.\^( a, b );

    # of something else is undefined
    else
        if IsSemidirectProductElement( b )  then
         Error("power of <a> and <b> must be defined");
        else
         Error("panic: neither <a> nor <b> is a semidirect product element");
        fi;
    fi;

    # return the power
    return pow;
end;

SemidirectProductElementOps.Print := function ( a )
    Print( "SemidirectProductElement( ", a.element[1], ", ",
           a.automorphism, ", ", a.element[2], " )" );
end;


#############################################################################
##
#F  IsSemidirectProduct(<D>)  . . . . test if a group is a semidirect product
##
IsSemidirectProduct := function ( D )
    return     IsRec( D )
           and IsBound( D.isSemidirectProduct )
           and D.isSemidirectProduct;
end;


#############################################################################
##
#F  SemidirectProduct(<G>,<a>,<H>)  . . . . . .  semidirect product of groups
##
SemidirectProduct := function ( G, a, H )
    local   D;          # semidirect product of the arguments, result

    # check that the arguments are all groups
    if not IsGroup( G )  or not IsGroup( H )  then
        Error("<G> and <H> must be groups");
    fi;

    # make the semidirect product
    D := G.operations.SemidirectProduct( G, a, H );

    # enter the relevant information
    D.groups := [ G, H ];
    D.mapping := a;

    # return the semidirect product
    return D;
end;

GroupOps.SemidirectProduct := function ( G, a, H )
    local   D,          # semidirect product of <grps>, result
            id,         # identity of <D>
            gens,       # generators of <D>
            gen,        # one generator of <D>
            grp,        # one group in <grps>
            i, j;       # loop variables

    # make the identity
    id := rec( );
    id.isGroupElement   := true;
    id.isSemidirectProductElement := true;
    id.domain           := GroupElements;
    id.element          := [ G.identity, H.identity ];
    id.automorphism     := Image( a, G.identity );
    id.operations       := SemidirectProductElementOps;

    # make the set of generators
    gens := [];
    for j  in [ 1 .. Length( G.generators ) ]  do
        gen := ShallowCopy( id );
        gen.element      := [ G.generators[j], H.identity ];
        gen.automorphism := Image( a, G.generators[j] );
        Add( gens, gen );
    od;
    for j  in [ 1 .. Length( H.generators ) ]  do
        gen := ShallowCopy( id );
        gen.element      := [ G.identity, H.generators[j] ];
        Add( gens, gen );
    od;

    # make the semidirect product
    D := Group( gens, id );

    # tag it as semidirect product
    D.isSemidirectProduct       := true;

    # enter the information that relates to the construction
    D.groups                    := [ G, H ];
    D.mapping                   := a;

    # enter the operations record
    D.operations                := SemidirectProductOps;

    # return the semidirect product
    return D;
end;


#############################################################################
##
#V  SemidirectProductOps  . . operations record for semidirect product groups
##
SemidirectProductOps := OperationsRecord(
    "SemidirectProductOps",
    GroupOps );

SemidirectProductOps.Size := function ( D )
    return Product( List( D.groups, Size ) );
end;

SemidirectProductOps.\in := function ( g, D )
    return     IsSemidirectProductElement( g )
           and IsSemidirectProduct( D )
           and g.element[1] in D.groups[1]
           and g.element[2] in D.groups[2];
end;

SemidirectProductOps.Random := function ( D )
    local   g, h;
    g := Random( D.groups[1] );
    h := Random( D.groups[2] );
    return SemidirectProductElement( g, g ^ D.mapping, h );
end;


#############################################################################
##
#F  SemidirectProductOps.Embedding(<G>,<D>,<i>) . .  embedding of a component
#F                                            group into a semidirect product
##
SemidirectProductOps.Embedding := function ( arg )
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
        emb.operations          := EmbeddingSemidirectProductOps;
        D.embeddings[i]         := emb;
    fi;

    # return the embedding
    return D.embeddings[i];
end;

EmbeddingSemidirectProductOps := OperationsRecord(
    "EmbeddingSemidirectProductOps",
    GroupHomomorphismOps );

EmbeddingSemidirectProductOps.ImageElm := function ( emb, elm )
    local   img;        # image of <elm> under <emb>, result

    # make the image
    img := ShallowCopy( emb.range.identity );
    img.element := ShallowCopy( img.element );
    img.element[emb.component]  := elm;
    if emb.component = 1  then
        img.automorphism := elm ^ emb.range.mapping;
    fi;

    # return the image
    return img;
end;

EmbeddingSemidirectProductOps.ImagesElm := function ( emb, elm )
    local   img;        # image of <elm> under <emb>, result

    # make the image
    img := ShallowCopy( emb.range.identity );
    img.element := ShallowCopy( img.element );
    img.element[emb.component]  := elm;
    if emb.component = 1  then
        img.automorphism := elm ^ emb.range.mapping;
    fi;

    # return the image
    return [ img ];
end;

EmbeddingSemidirectProductOps.ImagesRepresentative
  := function ( emb, elm )
    local   img;        # image of <elm> under <emb>, result

    # make the image
    img := ShallowCopy( emb.range.identity );
    img.element := ShallowCopy( img.element );
    img.element[emb.component]  := elm;
    if emb.component = 1  then
        img.automorphism := elm ^ emb.range.mapping;
    fi;

    # return the image
    return img;
end;

EmbeddingSemidirectProductOps.PreImagesRepresentative
  := function ( emb, img )
    local   elm;        # preimage of <elm> under <emb>, result

    # compute the preimage
    elm := img.element[ emb.component ];

    # return the preimage
    return elm;
end;

EmbeddingSemidirectProductOps.Print := function ( emb )
    Print("Embedding( ",emb.source,", ",emb.range,", ",emb.component," )");
end;


#############################################################################
##
#F  SemidirectProductOps.Projection(<D>,<G>,<i>) . projection of a semidirect
#F                                             product onto a component group
##
SemidirectProductOps.Projection := function ( arg )
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
            if D.groups[i] = G  then
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
        prj.operations          := ProjectionSemidirectProductOps;
        D.projections[i]        := prj;
    fi;

    # return the projection
    return D.projections[i];
end;

ProjectionSemidirectProductOps := OperationsRecord(
    "ProjectionSemidirectProductOps",
    GroupHomomorphismOps );

ProjectionSemidirectProductOps.ImageElm := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := elm.element[prj.component];

    # return the image
    return img;
end;

ProjectionSemidirectProductOps.ImagesElm := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := elm.element[prj.component];

    # return the image
    return [ img ];
end;

ProjectionSemidirectProductOps.ImageRepresentative
  := function ( prj, elm )
    local   img;        # image of <elm> under <prj>, result

    # compute the image
    img := elm.element[prj.component];

    # return the image
    return img;
end;

ProjectionSemidirectProductOps.PreImagesRepresentative
  := function ( prj, img )
    local   elm;        # preimage of <img> under <prj>, result

    # compute the preimage
    elm := ShallowCopy( prj.source.identity );
    elm.element := ShallowCopy( elm.element );
    elm.element[prj.component]  := img;

    # return the preimage
    return elm;
end;

ProjectionSemidirectProductOps.Print := function ( prj )
    Print("Projection( ",prj.source,", ",prj.range,", ",prj.component," )");
end;


#############################################################################
##
#F  IsWreathProductElement(<obj>) . . . . . . . . . .  test if an object is a
#F                                                     wreath product element
##
IsWreathProductElement := function ( obj )
    return     IsRec( obj )
           and IsBound( obj.isWreathProductElement )
           and obj.isWreathProductElement;
end;


#############################################################################
##
#F  WreathProductElement(<n1>,<n2>...,<g>,<p>)  . element of a wreath product
##
WreathProductElement := function ( arg )
    local   D;
    D := Domain( [ arg[1] ] );
    return D.operations.WreathProductElement( D,
                                Sublist( arg, [1..Length(arg)-2] ),
                                arg[Length(arg)-1], arg[Length(arg)] );
end;

GroupElementsOps.WreathProductElement := function ( D, elms, g, p )
    local   elm;

    # make the wreath product element
    elm := rec( );
    elm.isGroupElement              := true;
    elm.isWreathProductElement      := true;
    elm.domain                      := GroupElements;

    # enter the identifying information
    elm.element                     := Concatenation( elms, [g] );
    elm.permutation                 := p;

    # enter the operations record
    elm.operations                  := WreathProductElementOps;

    # return the wreath product element
    return elm;
end;

WreathProductElementOps := OperationsRecord(
    "WreathProductElementOps",
    GroupElementOps );

WreathProductElementOps.\*     := function ( a, b )
    local   prd,        # product of <a> and <b>, result
            i;          # loop variable

    # product of a wreath product element
    if IsWreathProductElement( a )  then

        # with another wreath product element
        if IsWreathProductElement( b )  then

            # check that they are compatible
            if   a.domain <> b.domain  then
                Error("<a> and <b> must lie in the same domain");
            elif Length(a.element) <> Length(b.element)  then
                Error("<a> and <b> must have the same number of element");
            fi;

            # compute the product
            prd := rec();
            prd.isGroupElement  := true;
            prd.isWreathProductElement := true;
            prd.domain          := a.domain;
            prd.element         := [];
            for i  in [1..Length(a.element)-1]  do
                prd.element[i]  := a.element[i] * b.element[i^a.permutation];
            od;
            i := Length(a.element);
            prd.element[i]      := a.element[i]  * b.element[i];
            prd.permutation     := a.permutation * b.permutation;
            prd.operations      := a.operations;

        # with a list, distribute
        elif IsList( b )  then
            prd := [];
            for i  in [ 1 .. Length( b ) ]  do
                prd[i] := a * b[i];
            od;

        # with something else, undefined
        else
            Error("product of <a> and <b> must be defined");
        fi;

    # of a list
    elif IsList( a )  then

        # with a wreath product element, distribute
        if IsWreathProductElement( b )  then
            prd := [];
            for i  in [ 1 .. Length( a ) ]  do
                prd[i] := a[i] * b;
            od;

        # with something else, undefined
        else
            Error("product of <a> and <b> must be defined");
        fi;

    # maybe <a> knows how to handle this
    elif    IsRec( a )
        and IsBound( a.operations )
        and IsBound( a.operations.\* )
        and a.operations.\* <> WreathProductElementOps.\*
    then
        prd := a.operations.\*( a, b );

    # of something else is undefined
    else
        if IsWreathProductElement( b )  then
         Error("product of <a> and <b> must be defined");
        else
         Error("panic: neither <a> nor <b> is a wreath product element");
        fi;
    fi;

    # return the product
    return prd;
end;

WreathProductElementOps.\^ := function ( a, b )
    local   pow,        # power of <a> with <b>, result
            i;          # loop variable

    # product of a wreath product element
    if IsWreathProductElement( a )  then

        # with another wreath product element
        if IsWreathProductElement( b )  then

            # check that they are compatible
            if   a.domain <> b.domain  then
                Error("<a> and <b> must lie in the same domain");
            fi;

            # compute the power
            pow := b^-1 * a * b;

        # with an integer
        elif IsInt( b )  then

            # if necessary invert the element
            if b < 0  then
                pow := ShallowCopy( a );
                pow.element     := [];
                for i  in [1..Length(a.element)-1]  do
                    pow.element[i^a.permutation] := a.element[i]^-1;
                od;
                i := Length(a.element);
                pow.element[i]  := a.element[i]^-1;
                pow.permutation := a.permutation^-1;
                a := pow;
                b := -b;
            fi;

            # make the identity element
            pow := rec();
            pow.isGroupElement  := true;
            pow.isWreathProductElement := true;
            pow.domain          := a.domain;
            pow.element         := [];
            for i  in [1..Length(a.element)-1]  do
                pow.element[i]  := a.element[i]^0;
            od;
            i := Length(a.element);
            pow.element[i]      := a.element[i]^0;
            pow.permutation     := ();
            pow.operations      := a.operations;
                
            # use repreated squaring method
            if b <> 0  then
                i := 2 ^ ( LogInt( b, 2 ) + 1 );
                while 1 < i  do
                    pow := pow * pow;
                    i := QuoInt( i, 2 );
                    if i <= b  then
                        pow := pow * a;
                        b := b - i;
                    fi;
                od;
            fi;

        # with something else
        else
            Error("power of <a> and <b> must be defined");
        fi;

    # maybe <a> knows how to handle this
    elif    IsRec( a )
        and IsBound( a.operations )
        and IsBound( a.operations.\^ )
        and a.operations.\^ <> WreathProductElementOps.\^
    then
        pow := a.operations.\^( a, b );

    # of something else is undefined
    else
        if IsWreathProductElement( b )  then
         Error("power of <a> and <b> must be defined");
        else
         Error("panic: neither <a> nor <b> is a wreath product element");
        fi;
    fi;

    # return the power
    return pow;
end;

WreathProductElementOps.Print := function ( a )
    local   i;
    Print( "WreathProductElement( " );
    for i  in [1..Length(a.element)-1]  do
        Print( a.element[i], ", " );
    od;
    i := Length(a.element);
    Print( a.element[i], ", ", a.permutation, " )" );
end;


#############################################################################
##
#F  IsWreathProduct(<D>)  . . . . . . . . test if a group is a wreath product
##
IsWreathProduct := function ( D )
    return     IsRec( D )
           and IsBound( D.isWreathProduct )
           and D.isWreathProduct;
end;


#############################################################################
##
#F  WreathProduct(<N>,<G>,<a>) .  . . . . . . . . .  wreath product of groups
##
WreathProduct := function ( arg )
    local   W,          # wreath product of the arguments, result
            N,          # factor of the normal subgroup, first argument
            G,          # factor group, second argument
            a;          # homomorphisms of <G> into <P>, third argument

    # get and check the arguments
    N := arg[1];
    if not IsGroup( N )  then
        Error("<N> must be a group");
    fi;
    G := arg[2];
    if not IsGroup( G )  then
        Error("<G> must be a group");
    fi;
    if Length(arg) = 2  then
        a := OperationHomomorphism( G, Operation(G,Elements(G),OnRight) );
    else
        a := arg[3];
        if     not IsHomomorphism( a )
            or not IsSubgroup( a.source, G )
            or not IsPermGroup( a.range )
        then
            Error("<a> must be a homomorphisms of <G> into a permgroup");
        fi;
    fi;

    # make the wreath product
    W := G.operations.WreathProduct( N, G, a );

    # return the wreath product
    return W;
end;

GroupOps.WreathProduct := function ( N, G, a )
    local   W,          # wreath product of <grps>, result
            deg,        # degree of the permutation group
            id,         # identity of <W>
            gens,       # generators of <W>
            gen,        # one generator of <W>
            grp,        # one group in <grps>
            i, j;       # loop variables

    # get the degree
    deg := PermGroupOps.LargestMovedPoint( Image( a, G ) );

    # make the identity
    id := rec( );
    id.isGroupElement   := true;
    id.isWreathProductElement := true;
    id.domain           := GroupElements;
    id.element          := [];
    for i  in [ 1 .. deg ]  do
        id.element[i]   := N.identity;
    od;
    id.element[deg+1]   := G.identity;
    id.permutation      := ();
    id.operations       := WreathProductElementOps;

    # make the set of generators
    gens := [];
    for i  in [ 1 .. deg ]  do
        for j  in [ 1 .. Length( N.generators ) ]  do
            gen := ShallowCopy( id );
            gen.element := ShallowCopy( id.element );
            gen.element[i] := N.generators[j];
            Add( gens, gen );
        od;
    od;
    for j  in [ 1 .. Length( G.generators ) ]  do
        gen := ShallowCopy( id );
        gen.element := ShallowCopy( id.element );
        gen.element[deg+1] := G.generators[j];
        gen.permutation := G.generators[j] ^ a;
        Add( gens, gen );
    od;

    # make the wreath product
    W := Group( gens, id );

    # tag it as wreath product
    W.isWreathProduct   := true;

    # enter the information that relates to the construction
    W.groups            := [ N, G ];
    W.degree            := deg;
    W.mapping           := a;

    # enter the operations record
    W.operations        := WreathProductOps;

    # return the wreath product
    return W;
end;


#############################################################################
##
#V  WreathProductOps  . . . . . . operations record for wreath product groups
##
WreathProductOps := OperationsRecord(
    "WreathProductOps",
    GroupOps );

WreathProductOps.Size := function ( D )
    return Size( D.groups[1] ) ^ D.degree * Size( D.groups[2] );
end;

WreathProductOps.\in := function ( g, D )
    return     IsWreathProductElement( g )
           and IsWreathProduct( D )
           and Length( g.element ) = Length( D.identity.element )
           and ForAll( [1..Length(g.element)-1],
                       i -> g.element[i] in D.groups[1] )
           and g.element[Length(g.element)] in D.groups[2];
end;



