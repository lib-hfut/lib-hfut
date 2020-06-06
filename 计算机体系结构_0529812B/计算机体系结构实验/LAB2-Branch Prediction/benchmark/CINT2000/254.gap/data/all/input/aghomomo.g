#############################################################################
##
#A  aghomomo.g                  GAP library                      Frank Celler
##
#A  @(#)$Id: aghomomo.g,v 3.31.1.5 1996/06/11 14:47:26 mschoene Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions for homomorphisms of aggroups.
##
#H  $Log: aghomomo.g,v $
#H  Revision 3.31.1.5  1996/06/11  14:47:26  mschoene
#H  fixed '.preimage' to '.preImage'
#H
#H  Revision 3.31.1.4  1995/12/05  15:01:25  mschoene
#H  replaced 'Filtered( <list>, IsBound )' by 'Compacted( <list> )'
#H
#H  Revision 3.31.1.3  1995/09/28  09:30:26  fceller
#H  fixed cokernel bug
#H
#H  Revision 3.31.1.2  1994/10/25  08:58:05  htheisse
#H  introduced the use of 'OperationsRecord'
#H
#H  Revision 3.31.1.1  1994/10/04  11:45:07  ahulpke
#H  IsomorphismAgSeries should remember former computations
#H
#H  Revision 3.31  1993/09/23  10:47:10  sam
#H  fixed little bug
#H
#H  Revision 3.30  1992/08/11  14:25:51  fceller
#H  'Subgroup' is broken for mat groups, so do not use it
#H  in 'GroupHomomorphismByImages'
#H
#H  Revision 3.29  1992/06/02  12:08:26  beick
#H  added a missing argument in 'AGHBIO.ImagesSet'
#H
#H  Revision 3.28  1992/05/27  10:15:24  fceller
#H  added missing 'Reversed' in 'HomomorphicIgs'
#H
#H  Revision 3.27  1992/04/07  12:53:37  fceller
#H  changed comparison with '0'
#H
#H  Revision 3.26  1992/03/30  07:47:09  fceller
#H  changed 'Exponents' slightly.
#H
#H  Revision 3.25  1992/03/27  15:19:38  fceller
#H  fixed a bug in 'CompositionFactorGroup'
#H
#H  Revision 3.24  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.23  1992/03/17  12:31:20  jmnich
#H  fixed bug in CompositionMapping
#H
#H  Revision 3.22  1992/03/01  10:56:21  fceller
#H  Fixed a bug in 'AbstractIgs'.
#H
#H  Revision 3.21  1992/02/21  16:50:57  hbesche
#H  renamed 'Word' to 'AbstractGenerator'
#H
#H  Revision 3.20  1992/02/21  14:02:02  fceller
#H  'Subgroup' must be called with a parent group.
#H
#H  Revision 3.19  1992/02/07  18:11:40  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/06/16  12:29:36  fceller
#H  Initial revision under RCS.
##


#############################################################################
##
#F  InfoAgGroup1( <arg> ) . . . . . . . . . . . . . . . . package information
#F  InfoAgGroup2( <arg> ) . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoAgGroup1 )  then InfoAgGroup1 := Ignore;  fi;
if not IsBound( InfoAgGroup2 )  then InfoAgGroup2 := Ignore;  fi;


#############################################################################
##

#F  AbstractIgs( <U>, <gens>, <words> ) . . . . . . . . . . .  igs with words
##
##  Generate the generators of <U> with <gens> takeing <words> along the way.
##
AbstractIgs := function( U, gens, words )

    local   G, len, p,              # Supergroup, composotion length, primes
            igs, new,
            pag,
            needed, found,          # generators needed / found
            idWord, id,             # identities of <U> and <words>
            isLess,
            dmap, chain,            # subgroup depth map, depth chain
            k, i, j,
            u, uw, ua,
            n,
            e1, e2, e3,
            x, z;

    # Typecheck arguments.
    if Length( gens ) <> Length( words )  then
    	Error(Length(words), "<words> given, ", Length(gens), " needed\n");
    fi;

    igs := Igs( U );
    if 0 = Length(igs)  then
        return rec( igs := [], abstractIgs := [] );
    fi;

    G   := Parent( U );
    len := Length( G.cgs );
    p   := List( G.cgs, RelativeOrderAgWord );
    id  := G.identity;

    # Make  a  list  which will hold the induced generating system. Enter the
    # generators  of <igs> in a list <new> such that the are sorted according
    # to their depths with the highest depth first.
    needed := Length( igs );
    new    := List( [ 1 .. Length( gens ) ], x -> [ gens[x], words[x] ] );
    idWord := words[1] ^ 0;
    isLess := function( x, y )
        return DepthAgWord( x[ 1 ] ) > DepthAgWord( y[ 1 ] );
    end;
    Sort( new, isLess );

    # Make a list of subgroup depths in order to detect a chain.
    dmap := [];
    for i  in [ 1 .. needed ]  do
        dmap[ DepthAgWord( igs[ i ] ) ] := i;
    od;
    chain := needed + 1;

    # Add  new  generators  until  we  reach the needed number of generators.
    # They  new  generators  are obtained by powers and conjugated of the old
    # ones.
    pag   := List( [ 1 .. len ], x -> [ id, idWord ] );
    k     := 1;
    found := 0;
    while k <= Length( new ) and needed <> found  do
        u  := new[ k ][ 1 ];
        uw := DepthAgWord( u );
        ua := new[ k ][ 2 ];

        # Shift  the  elements  through the <pag> until we reach the identity
        # or cannot shift anymore.
        while u <> id and dmap[ uw ] < chain and pag[ uw ][ 1 ] <> id  do
            x  := LeadingExponentAgWord( u )
                   /  LeadingExponentAgWord( pag[ uw ][ 1 ] )
                  mod p[ uw ];
            u  := LeftQuotient( pag[ uw ][ 1 ] ^ x, u );
            ua := LeftQuotient( pag[ uw ][ 2 ] ^ x, ua );
            uw := DepthAgWord( u );
        od;

        # Remove this element as we want to sort <new> at the end.
        new[ k ] := [ id, idWord ];
        if u <> id and dmap[ uw ] < chain  then

            # Can we update <chain> ?
            if dmap[ uw ] = chain - 1  then
                chain := chain - 1;
                while chain > 1 and pag[DepthAgWord(igs[chain-1])][1]<>id  do
                    chain := chain - 1;
                od;
            fi;

            # The  element  is  not  in  the  <pag>.  Add  the  power and all
            # conjugated to the new generators.
            if dmap[ uw ] + 1 < chain  then
                z := u ^ RelativeOrderAgWord( u );
                if z <> id  then
                    Add( new, [ z, ua ^ RelativeOrderAgWord( u ) ] );
                fi;
            fi;
            for x  in pag  do
                if x[ 1 ] <> id  then
                   if dmap[Minimum(uw,DepthAgWord(x[1]))] + 1 < chain  then
                       z := u ^ x[ 1 ];
                       if z <> u  then
                           Add( new, [ z, ua ^ x[ 2 ] ] );
                       fi;
                   fi;
                fi;
            od;
            pag[ uw ] := [ u, ua ];
            found := found + 1;
	    InfoAgGroup2( "#I  AbstractIgs:", found," found, ",
			  needed, " needed\n" );
        fi;
        k := k + 1;
    od;

    # We must now adjust the generators ( if we found enough ).
    if needed <> found  then
        Error( "elements <gens> do not generate group <U>" );
    fi;
    for i  in [ 1 .. Length( igs ) ]  do
        u  := igs[ i ];
        uw := DepthAgWord( u );
        e1 := LeadingExponentAgWord( u );
        e2 := LeadingExponentAgWord( pag[ uw ][ 1 ] );
        if e1 <> e2  then
            x := e1 / e2 mod p[ uw ];
            pag[ uw ][ 1 ] := pag[ uw ][ 1 ] ^ x;
            pag[ uw ][ 2 ] := pag[ uw ][ 2 ] ^ x;
        fi;
        if u <> pag[ uw ]  then
            for j  in [ uw + 1 .. len ]  do
                e1 := ExponentAgWord( u, j );
                e2 := ExponentAgWord( pag[ uw ][ 1 ], j );
                if e1 <> e2  then
                    e3 := LeadingExponentAgWord( pag[ j ][ 1 ] );
                    x  := ( e1-e2 ) / e3 mod p[ j ];
                    pag[ uw ][ 1 ] := pag[ uw ][ 1 ] * pag[ j ][ 1 ] ^ x;
                    pag[ uw ][ 2 ] := pag[ uw ][ 2 ] * pag[ j ][ 2 ] ^ x;
                fi;
            od;
        fi;
    od;

    # Now we can return.
    pag := Filtered( pag, x -> x[ 1 ] <> id );
    return rec( igs := List( pag, x -> x[ 1 ] ),
                abstractIgs := List( pag, x -> x[ 2 ] ) );

end;


#############################################################################
##
#F  HomomorphicIgs( <imgs> )  . . . . . . . . . .  Igs of a homomorphic image
##
##  It  is important that  <imgs>  are the images of  in  induced  generating
##  system  in their natural order, ie.  they must not be sorted according to
##  their  depths in the new group,  they must be  sorted according to  their
##  depths in the old group.
##
HomomorphicIgs := function( arg )
  
    local   imgs,   # images
     	    h,	    # conjugating element / homomorphism
     	    pag,    # induced generating system
            g,      # one element of <imgs>
      	    dg,     # depth of <g>
            id;     # identity
  
    imgs := arg[1];
    if imgs = []  then
	return imgs;
    fi;
    id := imgs[1] ^ 0;
  
    if Length( arg ) = 1  then
        pag := [];
     	for g  in Reversed( imgs )  do
      	    dg := DepthAgWord( g );
            while g <> id and IsBound( pag[ dg ] )  do
          	g := ReducedAgWord( g, pag[ dg ] );
     	    	dg := DepthAgWord( g );
            od;
            if g <> id  then
           	pag[ dg ] := g;
            fi;
     	od;
    else
     	h := arg[2];
        pag := [];
     	for g  in Reversed( imgs )  do
     	    g  := g ^ h;
     	    dg := DepthAgWord( g );
             while g <> id and IsBound( pag[ dg ] )  do
             	g := ReducedAgWord( g, pag[ dg ] );
     	    	dg := DepthAgWord( g );
             od;
             if g <> id  then
             	pag[ dg ] := g;
             fi;
    	od;
    fi;

    # Filter unbound entries from <pag>.
    imgs :=[];
    for g  in pag  do
        Add( imgs, g );
    od;
    return imgs;
  
end;

#############################################################################
##
#F  AgGroupOps.Factorization( <G>, <g> )  . . . . factorization of <g> in <G>
##
AgGroupOps.Factorization := function( G, g )
    local   v, w, i;

    if not IsBound( G.factorInfo )  then
        G.factorInfo := Normalized( G );
        if not IsBound( G.abstractGenerators )  then
            G.abstractGenerators := List( [ 1 .. Length( G.generators ) ],
                                    x -> AbstractGenerator( String( x ) ) );
        fi;
        G.factorInfo.abstractCgs := AbstractIgs( G.factorInfo, G.generators,
                                      G.abstractGenerators ).abstractIgs;
    fi;

    v := G.operations.Exponents( G.factorInfo, g, Integers );
    w := IdWord;
    for i  in [ 1 .. Length(v) ]  do
        if v[i] <> 0  then
            w := w * G.factorInfo.abstractCgs[i] ^ v[i];
        fi;
    od;

    return w;

end;


#############################################################################
##

#F  KernelHomomorphismAgGroupPermGroup( <a> ) . . . .  kernel of homomorphism
##
##
##  'KernelHomomorphismAgGroupPermGroup'   determines   the   kernel   of   a
##  homomorphism mapping a   soluble  Group given   by  pc-presentation to  a
##  permutation   group. The  homomorphism  must    be   given by  a   normal
##  homomorphism record to which the entries 'image' and 'kernel' are added.
##
KernelHomomorphismAgGroupPermGroup := function( hom )
    local ggens, m, sk, im, gexps, x, y, i, j, k, l;

    ggens   := Cgs( hom.source );
    gexps   := List( ggens, RelativeOrderAgWord );
    m       := Length( ggens );
    sk      := List( [1..m], x -> hom.source.identity );
    im      := [];
    im[m+1] := TrivialSubgroup( hom.range );

    for j in Reversed( [1..m] ) do
        if Image( hom, ggens[j] ) in im[j+1]  then
            y := ggens[j];
            for k in [j+1..m] do
                if sk[k] = hom.source.identity then
                    if gexps[k] <> gexps[j] then
                        y := y ^ gexps[k];
                    else
                        l := 0;
                        while l < gexps[k] do
                            x := y * (ggens[k] ^ l);
                            if Image( hom, x ) in im[k+1]  then
                                y := x;
                                l := gexps[k];
                            else
                                l := l + 1;
                            fi;
                        od;
                    fi;
                fi;
            od;
            sk[j] := y;
            im[j] := im[j+1];
        else
    	    im[j] := Closure( im[j+1], Image( hom, ggens[j] ) );
        fi;
    od;
    hom.kernel := Subgroup( Parent( hom.source ), sk );
    hom.image  := im[1];
    return hom.kernel;

end;


#############################################################################
##
#F  KernelHomomorphismAgGroupAgGroup( <a> ) . . . .  kernel of a homomorphism
##
KernelHomomorphismAgGroupAgGroup := function( a )

    local   gensInv,
            imgsInv,
            gensKer,
            u, v,
            uw, vw,
            gens, imgs,
            idR, idD,
            tmp,
            i, j;

    idR := a.range.identity;
    idD := a.source.identity;

    # Compute kernel and image, this is a Zassenhaus-algorithm.
    gensInv := [];
    imgsInv := [];
    gensKer := [];
    gens := a.generators;
    imgs := a.genimages;
    for i  in Reversed( [ 1 .. Length( imgs ) ] )  do
        u  := imgs[ i ];
        v  := gens[ i ];
        uw := DepthAgWord( u );
        while u <> idR and IsBound( gensInv[ uw ] )  do
            tmp := LeadingExponentAgWord( u )
                    /  LeadingExponentAgWord( gensInv[ uw ] )
                   mod RelativeOrderAgWord( u );
            u := gensInv[ uw ] ^ -tmp * u;
            v := imgsInv[ uw ] ^ -tmp * v;
            uw := DepthAgWord( u );
        od;
        if u = idR  then
            vw := DepthAgWord( v );
            while v <> idD and IsBound( gensKer[ vw ] )  do
                v  := ReducedAgWord( v, gensKer[ vw ] );
                vw := DepthAgWord( v );
            od;
            if v <> idD  then
                gensKer[ vw ] := v;
            fi;
        else
            gensInv[ uw ] := u;
            imgsInv[ uw ] := v;
        fi;
    od;

    # Now  we  have  image  and  kernel.  Add them to the <a>.
    gensInv := Compacted( gensInv );
    gensKer := Compacted( gensKer );
    imgsInv := Compacted( imgsInv );
    for i  in [ 1 .. Length( gensInv ) ]  do
        tmp :=  1 / LeadingExponentAgWord( gensInv[ i ] )
                mod RelativeOrderAgWord( gensInv[ i ] );
        gensInv[ i ] := gensInv[ i ] ^ tmp;
        imgsInv[ i ] := imgsInv[ i ] ^ tmp;
    od;
    for i  in [ 1 .. Length( gensInv ) - 1 ]  do
        for j  in [ i + 1 .. Length( gensInv ) ]  do
            uw := DepthAgWord( gensInv[ j ] );
            tmp := ExponentAgWord( gensInv[ i ], uw );
            if tmp <> 0  then
                gensInv[i] := gensInv[i] / gensInv[j] ^ tmp;
                imgsInv[i] := imgsInv[i] / imgsInv[j] ^ tmp;
            fi;
        od;
    od;
    a.image   := AgSubgroup( a.range, gensInv, false );
    a.kernel  := AgSubgroup( a.source, gensKer, false );
    a.gensInv := gensInv;
    a.imgsInv := imgsInv;

    # is <a>.range = <a>.image
    if a.range = a.image  then
    	a.image := a.range;
    fi;

    # Return.
    return a.kernel;

end;


#############################################################################
##

#V  AgGroupHomomorphismOps  . . . . . . . . . . . . . . ag group homomorphism
##
AgGroupHomomorphismOps := OperationsRecord( "AgGroupHomomorphismOps",
                                            GroupHomomorphismOps );


#############################################################################
##

#V  AgGroupHomomorphismByImagesOps  . . . . . . . . .  ag group hom by images
##
AgGroupHomomorphismByImagesOps := OperationsRecord
    ( "AgGroupHomomorphismByImagesOps", GroupHomomorphismByImagesOps );


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.CoKernel( <fun> )  . . . . . . . co-kernel
##
AgGroupHomomorphismByImagesOps.CoKernel := function ( hom )
    local   C,          # co kernel of <hom>, result
            gen,        # one generator of <C>
    	    e,          # element of <hom>.source
            k;          # loop variable

    # start with the trivial co kernel
    C := TrivialSubgroup( Parent( hom.range ) );

    # check if <fun> is a function
    if not IsMapping( hom )  then

        # for each element of the source and each generator of the source
        for e  in Elements( hom.source )  do
            for k  in [ 1 .. Length( hom.generators ) ]  do

                # the co kernel must contain the corresponding Schreier gen
                gen := Image( hom, e ) * hom.genimages[k]
                       / Image( hom, e * hom.generators[k] );
                C := Closure( C, gen );

            od;
        od;
    fi;

    # return the co kernel
    return C;
end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.IsMapping( <a> ) . . . .  is it a function
##
AgGroupHomomorphismByImagesOps.IsMapping := function( a )

    local   gens,   # generators
            imgs,   # images of generators
    	    map,    # mapping
            i, j;   # loops

    # We must check if the <imgs> fulfill the presenation of the domain.
    gens := a.generators;
    imgs := a.genimages;
    map  := a.operations.ImageElm;

    # The power-part of the presenation.
    for i  in [ 1 .. Length( gens ) ]  do
        if imgs[ i ] ^ RelativeOrderAgWord( gens[ i ] )
	   <>
	   map( a, gens[ i ] ^ RelativeOrderAgWord( gens[ i ] ) )
        then
            return false;
        fi;
    od;

    # The commutator-part of the presenation.
    for i  in [ 1 .. Length( gens ) ]  do
        for j  in [ i + 1 .. Length( gens ) ]  do
            if Comm( imgs[ j ], imgs[ i ] )
	       <>
               map( a, Comm( gens[ j ], gens[ i ] ) )
            then
                return false;
            fi;
        od;
    od;

    # So the funtion <img> fulfill the relations, it a homomorphism.
    return true;

end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.IsGroupHomomorphism( <map> ) . is function
##
AgGroupHomomorphismByImagesOps.IsGroupHomomorphism := function ( hom )
    return IsMapping( hom );
end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.ImageElm( <h>, <u> ) . . .  image of <elm>
##
AgGroupHomomorphismByImagesOps.ImageElm := function ( h, u )
    local exv, img, j;

    img := h.range.identity;
    exv := h.source.operations.Exponents( h.source, u, Integers );
    for j  in [ 1 .. Length(exv) ]  do
        if exv[j] <> 0  then
            img := img * h.genimages[j] ^ exv[j];
        fi;
    od;
    return img;
end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.ImagesElm( <a>, <e> )  . . . . . .  images
##
AgGroupHomomorphismByImagesOps.ImagesElm := function ( a, e )
    if not IsBound( a.coKernel )  then
        a.coKernel := a.operations.CoKernel( a );
    fi;
    return a.coKernel * Image( a, e );
end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.ImagesRepresentative( <a>, <e> ) . . . rep
##
AgGroupHomomorphismByImagesOps.ImagesRepresentative := function ( a, e )
    return a.operations.ImageElm( a, e );
end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.ImagesSet( <a>, <D> )  . . .  image of <D>
##
AgGroupHomomorphismByImagesOps.ImagesSet := function( a, D )
    local   imgs;

    if not IsHomomorphism( a ) or not IsGroup( D )  then
    	imgs := MappingOps.ImagesSet( a, D );
    elif IsAgGroup( a.range )  then
        imgs := AgSubgroup( a.range, HomomorphicIgs( List( Igs( D ), x ->
    	    	    	    a.operations.ImageElm( a, x ) ) ), false );
    else
    	imgs := List( D.generators, x -> a.operations.ImageElm( a, x ) );
    	if Set( imgs ) = Set( a.range.generators )  then
    	    imgs := a.range;
    	else
    	    imgs := Subgroup( Parent( a.range ), imgs );
    	fi;
    fi;
    return imgs;

end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.KernelGroupHomomorphism( <a> ) . .  kernel
##
AgGroupHomomorphismByImagesOps.KernelGroupHomomorphism := function ( a )
    local   krn;        # kernel of <a>, result

    if not IsMapping( a )  then
        krn := GroupHomomorphismByImagesOps.KernelGroupHomomorphism( a );
    elif IsAgGroup( a.range )  then
    	krn := KernelHomomorphismAgGroupAgGroup( a );
    elif IsPermGroup( a.range )  then
    	krn := KernelHomomorphismAgGroupPermGroup( a );
    else
    	krn := GroupHomomorphismOps.KernelGroupHomomorphism( a );
    fi;
    return krn;
end;
AgGroupHomomorphismByImagesOps.Kernel :=
  AgGroupHomomorphismByImagesOps.KernelGroupHomomorphism;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.CompositionMapping( <a>, <b> ) . . .  comp
##
AgGroupHomomorphismByImagesOps.CompositionMapping := function ( a, b )
    local   prd,  gens,  imgs;

    if IsHomomorphism( a ) and IsHomomorphism( b )  then
        gens := b.source.generators;
    	imgs := List( gens, x -> Image( a, Image( b, x ) ) );
    	prd  := GroupHomomorphismByImages( b.source, a.range, gens, imgs );
 	prd.isMapping      := true;
    	prd.isHomomorphism := true;
        prd.preImage       := b.source;
    else
    	prd := MappingOps.CompositionMapping( a, b );
    fi;
    return prd;
end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.PowerMapping( <map>, <n> ) . . . . . power
##
AgGroupHomomorphismByImagesOps.PowerMapping := function ( map, n )
    local   pow,  id,  i;

    # catch trivial case
    if n = 0  then
        pow := GroupHomomorphismByImages( map.source, map.range,
					  map.source.generators,
					  map.source.generators );

    # compute the power using repeated squaring
    else
        pow := IdentityMapping( map.source );
        id  := pow;
        i := 2 ^ (LogInt( n, 2 ) + 1);
        while 1 < i  do
    	    if pow <> id  then
                pow := pow.operations.CompositionMapping( pow, pow );
	    fi;
            i := QuoInt( i, 2 );
            if i <= n  then
                if pow <> id  then
                    pow := map.operations.CompositionMapping( pow, map );
                else
                    pow := map;
                fi;
                n := n - i;
            fi;
        od;
    fi;

    # return the power
    return pow;
end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.InverseMapping( <a> )  . . . . . . inverse
##
AgGroupHomomorphismByImagesOps.InverseMapping := function( a )
    local   inv;

    if    not IsMapping( a )
       or not IsBijection( a ) 
       or not IsAgGroup( a.range )  
    then
        return GroupHomomorphismByImagesOps.InverseMapping( a );
    else
        if not IsBound( a.gensInv )  then
	    AgGroupHomomorphismByImagesOps.KernelGroupHomomorphism( a );
        fi;
	inv := GroupHomomorphismByImages( a.range,   a.source,
					  a.gensInv, a.imgsInv );
	inv.kernelGroupHomomorphism := TrivialSubgroup( a.range );
	inv.inverseMapping          := a;
        inv.image                   := a.source;
	inv.isMapping               := true;
	inv.isBijection             := true;
	return inv;
    fi;

end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.PreImagesSet( <a>, <D> ) . . . .  preimage
##
AgGroupHomomorphismByImagesOps.PreImagesSet := function( a, D )

    if IsAgGroup( D ) and IsSubset( a.range, D )  then
	return MergedIgs( a.source, Kernel( a ), List( Igs( D ), 
            x -> a.operations.PreImagesRepresentative( a,x ) ), false );
    else
        return GroupHomomorphismByImagesOps.PreImagesSet( a, D );
    fi;
end;


#############################################################################
##
#F  AgGroupHomomorphismByImagesOps.PreImagesRepresentative( <a>, <e> ) 	.  pi
##
AgGroupHomomorphismByImagesOps.PreImagesRepresentative := function( a, e )
    local   pre,  exv,  i;

    if not IsAgGroup( a.range )  then
	pre := GroupHomomorphismByImagesOps.PreImagesRepresentative( a, e );

    else

        # Use 'Kernel' in order to bind 'imgsInv'
	if not IsBound( a.gensInv )  then
	    AgGroupHomomorphismByImagesOps.KernelGroupHomomorphism( a );
	fi;

	# Check that <e> lies in the image of <a>
	if not e in a.image  then
	    Error( "<e> must have at least one preimage" );
	fi;

	# Construct a preimage.
        pre := a.source.identity;
        exv := a.image.operations.Exponents( a.image, e, Integers );
        for i  in [ 1 .. Length(exv) ]  do
            if exv[i] <> 0  then
                pre := pre * a.imgsInv[i] ^ exv[i];
            fi;
        od;
    fi;
    return pre;

end;


#############################################################################
##
#F  AgGroupOps.GroupHomomorphismByImages( <U>, <R>, <g>, <i> ) . . create hom
##
AgGroupOps.GroupHomomorphismByImages := function( D, R, gens, imgs )

    local   h,      # homomorphism
            i,
            ogens,
            oimgs,
            tmp;    # temporary

    # Normalize <gens> and unbind possible '<D>.field'.
    ogens := gens;
    oimgs := imgs;
    D := Normalized( D );
    Unbind( D.field );
    if Cgs(D) <> gens  then
        tmp  := AbstractIgs( D, gens, imgs );
        gens := tmp.igs;
        imgs := tmp.abstractIgs;
    fi;

    # If range <R> is just 'rec()', try to construct the image.
    if not IsBound( R.generators )  then
        if 0 = Length(imgs)  then
            Error( "needs either range or at least one image" );
        fi;
        R := Group( imgs, imgs[1]^0 );
    fi;

    # Construct the homorphism record.
    h := rec( source           := D,
              range            := R,
    	      domain           := Mappings,
              generators       := gens,
              genimages        := imgs,
    	      preImage         := D,
    	      image            := R.operations.Subgroup( Parent(R), imgs ),
              isGeneralMapping := true,
              operations       := AgGroupHomomorphismByImagesOps );

    # check at least the given generator images <oimgs>
    if not IsFpGroup(R)  then
        for i  in [ 1 .. Length(ogens) ]  do
            if Image( h, ogens[i] ) <> oimgs[i]  then
                return GroupOps.GroupHomomorphismByImages(D,R,ogens,oimgs);
            fi;
        od;
    fi;
    return h;

end;


#############################################################################
##

#F  CompositionHomomorphismOps	. . . . . . . . . .  natural homomorphism ops
##
CompositionHomomorphismOps := OperationsRecord( "CompositionHomomorphismOps",
                                  AgGroupHomomorphismByImagesOps );


#############################################################################
##
#F  CompositionHomomorphismOps.ImageElm( <a>, <e> ) . . . . . .  image of <e>
##
CompositionHomomorphismOps.ImageElm := function( a, e )
    return FactorAgWord( e, a.range.identity );
end;


#############################################################################
##
#F  CompositionHomomorphismOps.PreImagesRepresentative( <a>, <e> )  . . . rep
##
CompositionHomomorphismOps.PreImagesRepresentative := function( a, e )
    return FactorAgWord( e, a.source.identity );
end;


#############################################################################
##
#F  CompositionHomomorphismOps.Print( <a> ) . . . . . . . . . . . . . . print
##
CompositionHomomorphismOps.Print := function( a )
    Print( "NaturalHomomorphism( ", a.source, ", ", a.image, " )" );
end;


#############################################################################
##
#F  CompositionFactorGroup( <G>, <N> )	. . . . . . . . . . . . . . . . local
##
CompositionFactorGroup := function( G, N )
    local   a,  l,  H;

    # Check arguments.
    if not Index( Parent(G), G ) = 1 or not IsElementAgSeries( N )  then
        Error( "<G> must be a parent group and <N> a compositionsubgroup" );
    fi;
    InfoAgGroup2( "#I  FactorGroup: uses composition factor group\n" );

    # Get the depths where the words must be cut of.
    l := DepthAgWord( Igs( N )[ 1 ] );

    # Construct factorgroup, this must be done by hand as in 'AgGroupFpGroup'
    H := FactorAgGroup( G.generators[ 1 ], l - 1 );
    H.isDomain   := true;
    H.isGroup    := true;
    H.isAgGroup  := true;
    H.cgs        := H.generators;
    H.operations := AgGroupOps;

    # Now construct the mapping. This is a homomorphism with kernel <N>.
    a := GroupHomomorphismByImages( G, H, Cgs( G ), List( Cgs( G ),
				    x -> FactorAgWord( x, H.identity ) ) );
    a.isMapping  := true;
    a.kernel     := N;
    a.image      := H;
    a.imgsInv    := FactorArg( Normalized( G ), N ).generators;
    a.gensInv    := H.cgs;
    a.operations := CompositionHomomorphismOps;

    # Bind result to <H>.naturalHomomorphism
    H.naturalHomomorphism := a;

    # Return the factor group.
    return H;

end;


#############################################################################
##
#F  AgGroupOps.FactorGroup( <G>, <N> )	. . . . . . . . . . .  <G> -> <G>/<N>
##
AgGroupOps.FactorGroup := function( U, N )
    local   F,  a;

    # Catch two trivial cases.
    if U = N  then
        InfoAgGroup2( "#I  FactorGroup: <U>/<N> is trivial\n" );
        F := AgGroupFpGroup( rec( generators := [], relators := [] ) );
        a := GroupHomomorphismByImages( U, F, Cgs(U),
					List( Cgs(U), x -> F.identity ) );
	a.isMapping := true;
        Kernel( a );
	F.naturalHomomorphism := a;
	return F;
    fi;

    # Dispatch if possible.
    if     Index( Parent( U ), U ) = 1
       and IsNormalized( U )
       and N.generators <> []
       and IsElementAgSeries( N )
    then
        return CompositionFactorGroup( U, N );
    else
        F := AgGroupFpGroup( U.operations.FpGroup( 
                 CollectorlessFactorGroup( U, N ), "g" ) );
	a := GroupHomomorphismByImages(
	        U,
	        F,
		Concatenation( FactorArg(U,N).generators, Igs(N) ),
		Concatenation( F.cgs, List(Igs(N),x->F.identity) ) );
        a.isMapping := true;
        Kernel( a );
        F.naturalHomomorphism := a;
	return F;
    fi;

end;


#############################################################################
##
#F  AgGroupOps.NaturalHomomorphism( <G>, <F> )	. . . . . .  nat homomorphism
##
AgGroupOps.NaturalHomomorphism :=  function( G, F )
    local   f;

    if G = F.factorNum  then
        f := F.naturalHomomorphism;
    else
        f := GroupHomomorphismByImages( G, F, Cgs( G ),
                 Concatenation( Cgs( F ),
    	             List( [ Length( F.cgs ) .. Length( G.cgs ) - 1 ],
                           x -> F.identity ) ) );
    	f.isMapping := true;
    fi;
    return f;

end;


#############################################################################
##

#F  HomomorphismsSeries( <G>, <list> )	. . . . . . . . .  factor homs of <G>
##
HomomorphismsSeries := function( G, list )
    local   homs,  H,  N,  fac,  f,  fast,  i,  j;

    # Check the arguments.
    if    not IsAgGroup( G )
       or not IsList( list )
       or Length( list ) < 2
       or not IsAgGroup( list[ 1 ] )
       or list[ Length( list ) ].generators <> []
    then
        Error( "usage: HomomorphismsSeries( <G>, <list> )" );
    fi;

    # Dirty hack.
    fast := IsParent( G ) and ForAll( list, IsElementAgSeries );

    # Construct the homs using 'NaturalHomomorphism'.
    fac  := G / list[ 1 ];
    homs := [ NaturalHomomorphism( G, fac ) ];
    fac  := G / list[ Length( list ) - 1 ];
    homs[ Length( list ) ] := NaturalHomomorphism( G, fac );
    for i  in Reversed( [ 2 .. Length( list ) - 1 ] )  do
        H := homs[ i + 1 ].range;
        N := list[ i - 1 ];

	# Dirty hack!
        if fast  then
            N := homs[i+1].operations.ImagesSet( homs[ i + 1 ], N );
        else
            for j  in Reversed( [ i + 1 .. Length( list ) ] )  do
                N := homs[j].operations.ImagesSet( homs[ j ], N );
            od;
        fi;
	fac := H / N;
	homs[ i ] := NaturalHomomorphism( H, fac );
    od;
    if Length( homs ) > 1  then
	f := GroupHomomorphismByImages(
	                   homs[2].range, homs[1].range,
 			   homs[2].range.generators,
			   homs[1].range.generators );
    	homs[2] := GroupHomomorphismByImages(
    	    	       homs[2].source, homs[1].range,
    	    	       homs[2].source.generators,
    	    	       List( homs[2].source.generators, x ->
    	    	    	     Image( f, Image( homs[2], x ) ) ) );
    fi;
    return homs;

end;


#############################################################################
##
#F  IsomorphismAgGroup( <list> )  . . . . . . . . . . . .  isomorphic AgGroup
##
##  'IsomorphismAgGroup' constructs  an   ag-group H from   a   given list of
##  subgroups which  has  to be a  series  of some other ag-group   G, i.e. a
##  series for the first group in  this list.  The constructed ag-group G has
##  the property, that it is isomorphic to G and that under the corresponding
##  isomorphism the given  list of ag-groups  will map onto a sublist  of the
##  composition series of H.  This function may be used  to  redefine a known
##  group  so that there   exists an  elementary  abelian  series through the
##  group's composition  series. This is required  for  some algorithms.  The
##  isomorphism G <-> H is returned by 'IsomorphismAgGroup'.
##
##  returns:    <aghom>
##
IsomorphismAgGroup := function( series )
    local   fpword, gens, rels, aggens, group, comm, facs, facgens, faclen,
            len, steps, p, i, j, isoms;

    fpword := function ( elem )
        local list, word, i, j, k;

        k    := 1;
        word := IdWord;
        for i in [1..steps] do
            list := facs[i].operations.Exponents( facs[i], elem, Integers );
            for j in [ 1 .. faclen[i] ] do
                if list[j] <> 0 then
                    elem := facgens[i][j] ^ list[j] * elem;
                    word := word * gens[k] ^ list[j];
                fi;
                k := k + 1;
            od;
        od;
        return word;
    end;

    # first see, if we have stored this isomorphism already
    if not IsBound(series[1].isomorphismsAgGroup) then
      series[1].isomorphismsAgGroup:=[];
    fi;
    isoms:=series[1].isomorphismsAgGroup;
    
    for i in isoms do
      if i[1]=series then
	# we have already computed this isomorphism
        return i[2];
      fi;
    od;

    facs    := [];
    facgens := [];
    faclen  := [];
    aggens  := [];
    steps   := Length( series ) - 1;
    for i in [1..steps] do
        Add( facs, series[i] mod series[i+1] );
        Add( facgens, ShallowCopy( facs[i].generators ) );
        Add( faclen, Length( facgens[i] ) );
        Append( aggens, facgens[i] );
        Apply( facgens[i], x -> x ^ -1 );
    od;
    len  := Length( aggens );
    gens := List( Sublist( InformationAgWord( series[1].identity ).names,
                           List( aggens, DepthAgWord ) ), AbstractGenerator );
    rels := [];
    for i in [1..len] do
        p := RelativeOrderAgWord( aggens[i] );
        Add( rels, gens[i] ^ p / fpword( aggens[i] ^ p ) );
    od;
    for i in [1..len-1] do
        for j in [i+1..len] do
            comm := fpword( Comm( aggens[j], aggens[i] ) );
            if comm <> IdWord then
                Add( rels, Comm( gens[j], gens[i] ) / comm );
            fi;
        od;
    od;
    group := AgGroupFpGroup( rec( generators := gens, relators := rels ) );
    j:=GroupHomomorphismByImages( series[1], group, 
				      aggens, group.generators );
    # remember the series
    Add(isoms,[series,j]);
    return j;
end;
