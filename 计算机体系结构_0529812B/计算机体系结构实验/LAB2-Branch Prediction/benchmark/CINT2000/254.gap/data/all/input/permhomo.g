#############################################################################
##
#A  permhomo.g                  GAP library                  Martin Schoenert
#A                                                                & Udo Polis
##
#A  @(#)$Id: permhomo.g,v 3.22.1.9 1996/06/11 14:49:34 mschoene Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions that implement homomorphisms for permgroups.
##
#H  $Log: permhomo.g,v $
#H  Revision 3.22.1.9  1996/06/11  14:49:34  mschoene
#H  fixed '.preimage' to '.preImage'
#H
#H  Revision 3.22.1.8  1996/06/10  13:06:45  mschoene
#H  fixed 'PGHBIO.CoKernel', it is a normal subgroup of the image
#H
#H  Revision 3.22.1.7  1996/06/10  12:39:16  mschoene
#H  fixed 'MakeMapping' to add Schreier generators on all levels
#H
#H  Revision 3.22.1.6  1995/12/19  09:27:13  mschoene
#H  fixed 'GHBI' to avoid identities in stabilizer chains
#H
#H  Revision 3.22.1.5  1995/04/01  11:12:24  aseress
#H  added a flag to operation descriptor for blocks homomorphisms
#H
#H  Revision 3.22.1.4  1995/03/31  12:41:19  mschoene
#H  removed 'Copy' from 'BHO.PreImagesSetStab', which copies the parent too
#H
#H  Revision 3.22.1.3  1995/02/15  11:09:31  sam
#H  fixed bug in 'MakeMappingPermImage' (Akos found this)
#H
#H  Revision 3.22.1.2  1995/01/03  12:21:41  ahulpke
#H  disabled StabChain copy from homomorphism to group
#H
#H  Revision 3.22.1.1  1994/10/11  15:00:09  ahulpke
#H  Added presentation computation
#H
#H  Revision 3.22  1994/07/07  18:41:03  mschoene
#H  reindented Akos' functions to please 'makeinit'
#H
#H  Revision 3.21  1994/06/30  17:43:29  sam
#H  fixed two 'in' calls for homomorphisms ...
#H
#H  Revision 3.20  1994/06/28  11:39:05  aseress
#H  avoided RestrictedPerm in TransConstHomomorphismOps.ImageElm
#H
#H  Revision 3.19  1994/06/27  17:21:27  aseress
#H  the trivial group struck .MakeMappingPermImage
#H
#H  Revision 3.18  1994/06/27  10:59:08  aseress
#H  bug fixes in .MakeMappingPermImage; added .image to .CompositionMapping
#H
#H  Revision 3.17  1994/06/24  15:38:56  aseress
#H  Operation with 'OnSets' checks whether given lists are sets
#H
#H  Revision 3.16  1994/06/23  12:22:53  aseress
#H  added special handling of perm grp image in GroupHomomorphismByImages
#H  added '.stabChain' record construction to TransConstHom, BlocksHom
#H
#H  Revision 3.14  1994/06/17  18:30:12  aseress
#H  fixed bug in BlocksHomomorphismOps.PreImagesSetStab (noticed by Heiko)
#H
#H  Revision 3.13  1994/02/02  10:22:25  sam
#H  'operationDomain' replaced by 'operation.domain'
#H
#H  Revision 3.12  1993/08/21  21:30:10  martin
#H  fixed 'PGHBIO.CoKernel' to use all Schreier generators
#H
#H  Revision 3.11  1993/07/30  16:42:50  sam
#H  fixed 'CoKernel'
#H
#H  Revision 3.10  1992/06/23  12:08:47  martin
#H  fixed 'PGHBIO.CoKernel' to take the normal closure
#H
#H  Revision 3.9  1992/06/04  12:50:57  martin
#H  changed 'GroupHomomorphismsByImages' to accept empty lists
#H
#H  Revision 3.8  1992/06/03  17:26:20  martin
#H  improved 'GroupHomomorphismByImages'
#H
#H  Revision 3.7  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.6  1992/02/20  19:31:34  martin
#H  fixed a bug in 'BlocksHomOps.PreImagesSetStab', kernel may be trivial
#H
#H  Revision 3.5  1992/02/20  15:58:50  martin
#H  added Udo to the list of authors
#H
#H  Revision 3.4  1992/02/19  19:39:21  martin
#H  fixed 'TransConstHomOps.PreImagesSet', the generators of the preimage
#H  must contain the generators of the kernel
#H
#H  Revision 3.3  1992/02/19  13:02:30  martin
#H  added 'TransConstHomomorphism' and 'BlocksHomomorphism'
#H
#H  Revision 3.2  1992/02/10  15:14:35  martin
#H  added the domain 'Mappings'
#H
#H  Revision 3.1  1992/01/20  15:54:47  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  PermGroupOps.GroupHomomormphismByImages(<G>,<H>,<gens>,<imgs>)  .  create
#F      a permutation group homomorphism by the images of a generating system
##
PermGroupOps.GroupHomomorphismByImages := function ( G, H, gens, imgs )
    local   hom,        # homomorphism from <G> to <H>, result
            i;          # loop variable

    # make the homomorphism
    hom := rec( );
    hom.isGeneralMapping := true;
    hom.domain          := Mappings;

    # enter the identifying information
    hom.source          := G;
    hom.range           := H;
    hom.generators      := [];
    hom.genimages       := [];
    hom.trivimages      := [];
    for i  in [1..Length(gens)]  do
        if gens[i] <> gens[i]^0  then
            Add( hom.generators, gens[i] );
            Add( hom.genimages,  imgs[i] );
        elif imgs[i] <> imgs[i]^0  then
            Add( hom.trivimages, imgs[i] );
        fi;
    od;

    # enter useful information (precious little)
    if IsEqualSet( Difference(gens,[G.identity]), G.generators )  then
        hom.preImage    := G;
    else
        hom.preImage    := Parent(G).operations.Subgroup( Parent(G), gens );
    fi;
    if IsEqualSet( Difference(imgs,[H.identity]), H.generators )  then
        hom.image       := H;
    else
        hom.image       := Parent(H).operations.Subgroup( Parent(H), imgs );
    fi;

    # enter the operations record
    if not IsPermGroup( H )  then
        hom.operations  := PermGroupHomomorphismByImagesOps;
    else
        hom.operations  := PermGroupHomomorphismByImagesPermGroupOps;
    fi;

    # return the homomorphism
    return hom;
end;

PermGroupHomomorphismByImagesOps := OperationsRecord(
    "PermGroupHomomorphismByImagesOps",
    GroupHomomorphismByImagesOps );

PermGroupHomomorphismByImagesOps.MakeMapping := function ( hom )
    local   rnd,        # list of random elements of '<hom>.source'
            rne,        # list of the images of the elements in <rnd>
            rni,        # index of the next random element to consider
            elm,        # one element in '<hom>.source'
            img,        # its image
            size,       # size of the stabilizer chain constructed so far
            stb,        # stabilizer in '<hom>.source'
            orb,        # orbit
            len,        # length of the orbit before extension
            bpt,        # base point
            i,  j,  S;  # loop variables

    # handle trivial case
    if hom.generators = []  then
        return;
    fi;

    # start with the generators as random elements
    rnd := ShallowCopy( hom.generators );
    for i  in [Length(rnd)..16]  do
        Add( rnd, hom.source.identity );
    od;
    rne := ShallowCopy( hom.genimages );
    for i  in [Length(rne)..16]  do
        Add( rne, hom.range.identity );
    od;
    rni := 1;

    # initialize the top level
    bpt := 0;
    for elm  in hom.generators  do
        if elm <> elm^0
          and (bpt = 0  or SmallestMovedPointPerm( elm ) < bpt)
        then
            bpt := SmallestMovedPointPerm( elm );
        fi;
    od;
    if bpt = 0  then bpt := 1;  fi;
    hom.orbit                   := [ bpt ];
    hom.transversal             := [];
    hom.transversal[ bpt ]      := hom.source.identity;
    hom.transimages             := [];
    hom.transimages[ bpt ]      := hom.range.identity;
    hom.stabilizer              := rec();
    hom.stabilizer.identity     := hom.source.identity;
    hom.stabilizer.generators   := [];
    hom.stabilizer.genimages    := [];

    # extend orbit and transversal
    orb := hom.orbit;
    i := 1;
    while i <= Length(orb)  do
        for j  in [1..Length(hom.generators)]  do
            elm := hom.generators[j];
            img := hom.genimages[j];
            if not IsBound(hom.transversal[orb[i]/elm])  then
                hom.transversal[orb[i]/elm] := elm;
                hom.transimages[orb[i]/elm] := img;
                Add( orb, orb[i]/elm );
            fi;
        od;
        i := i + 1;
    od;

    # get the size of the stabilizer chain
    size := Length( hom.orbit );

    # create new elements until we have reached the size
    while size <> Size( hom.preImage )  do

        # make a new element from the generators
        elm := rnd[rni];
        img := rne[rni];
        i := RandomList( [ 1 .. Length( hom.generators ) ] );
        rnd[rni] := rnd[rni] * hom.generators[i];
        rne[rni] := rne[rni] * hom.genimages[i];
        rni := rni mod 16 + 1;

        # divide the element through the stabilizer chain
        stb := hom;
        while stb.generators <> []
          and IsBound(stb.transversal[stb.orbit[1]^elm])  do
            bpt := stb.orbit[1];
            while bpt ^ elm <> bpt  do
                img := img * stb.transimages[bpt^elm];
                elm := elm * stb.transversal[bpt^elm];
            od;
            stb := stb.stabilizer;
        od;

        # if the element was not in the stabilizer chain
        if elm <> hom.source.identity  then

            # if this stabilizer is trivial add an initial orbit
            if stb.generators = []  then
                bpt := SmallestMovedPointPerm( elm );
                stb.orbit                   := [ bpt ];
                stb.transversal             := [];
                stb.transversal[ bpt ]      := hom.source.identity;
                stb.transimages             := [];
                stb.transimages[ bpt ]      := hom.range.identity;
                stb.stabilizer              := rec();
                stb.stabilizer.identity     := hom.source.identity;
                stb.stabilizer.generators   := [];
                stb.stabilizer.genimages    := [];
            fi;

            # divide the size of stabilizer chain by the old orbit length
            S := hom;
            repeat
                S := S.stabilizer;
                
                # add the element to the generators
                Add( S.generators, elm );
                Add( S.genimages,  img );
    
                # extend orbit and transversal
                orb := S.orbit;
                len := Length(orb);
                size := size / len;
                i := 1;
                while i <= len  do
                    if not IsBound(S.transversal[orb[i]/elm])  then
                        S.transversal[orb[i]/elm] := elm;
                        S.transimages[orb[i]/elm] := img;
                        Add( orb, orb[i]/elm );
                    fi;
                    i := i + 1;
                od;
                while i <= Length(orb)  do
                    for j  in [1..Length(S.generators)]  do
                        elm := S.generators[j];
                        img := S.genimages[j];
                        if not IsBound(S.transversal[orb[i]/elm])  then
                            S.transversal[orb[i]/elm] := elm;
                            S.transimages[orb[i]/elm] := img;
                            Add( orb, orb[i]/elm );
                        fi;
                    od;
                    i := i + 1;
                od;
                size := size * Length( orb );
                
            until S.orbit[ 1 ] = stb.orbit[ 1 ];

        fi;

    od;

end;

PermGroupHomomorphismByImagesOps.CoKernel := function ( hom )
    local   C,          # cokernel of <hom>, result
            stb,        # stabilizer in the chain of <hom>
            stb2,       # another stabilizer further down
            bpt,        # basepoint of stabilizer
            elm,        # one schreier generator
            img,        # image of <elm> under <hom>
            i, k;       # loop variables

    # handle special case
    if IsBound( hom.coKernel )  then
        return hom.coKernel;
    fi;
    if IsBound( hom.isMapping )  and hom.isMapping  then
        return TrivialSubgroup( hom.range );
    fi;

    # make sure we have a stabilizer chain for <hom>
    # (for perm->perm homs. this automatically computes the coKernel)
    if not IsBound( hom.stabilizer )  then
        hom.operations.MakeMapping( hom );
        if IsBound( hom.coKernel )  then
	    return hom.coKernel;
        fi;
    fi;

    # loop over the stabilizer chain
    if hom.trivimages = []  then
        C := TrivialSubgroup( hom.range );
    else
        C := Subgroup( hom.range, hom.trivimages );
    fi;
    stb := hom;
    while stb.generators <> []  do

        # for all orbit points
        for i  in stb.orbit  do

            # and all generators
            for k  in [ 1 .. Length(stb.generators) ]  do

                # make the schreier generator and its image
                img := stb.transimages[i];
                elm := stb.transversal[i];
                while i^elm <> stb.orbit[1]  do
                    img := img * stb.transimages[i^elm];
                    elm := elm * stb.transversal[i^elm];
                od;
                img := img^-1 * stb.genimages[k];
                elm := elm^-1 * stb.generators[k];

                # divide the schreier generator through the stabilizer chain
                stb2 := stb;
                while stb2.generators <> []
                  and IsBound(stb2.transversal[stb2.orbit[1]^elm])  do
                    bpt := stb2.orbit[1];
                    while bpt ^ elm <> bpt  do
                        img := img * stb2.transimages[bpt^elm];
                        elm := elm * stb2.transversal[bpt^elm];
                    od;
                    stb2 := stb2.stabilizer;
                od;

                # if the image is not trivial add it to the cokernel
                if not img in C  then
                    C := Closure( C, img );
                fi;

            od;

        od;

        # go down to the next stabilizer
        stb := stb.stabilizer;

    od;

    # return the cokernel
    return AsSubgroup( Parent( C ), NormalClosure( hom.image, C ) );
end;

CoKernelGensPermHom := function ( hom )
    local   C,          # cokernel of <hom>, result
            stb,        # stabilizer in the chain of <hom>
            stb2,       # another stabilizer further down
            bpt,        # basepoint of stabilizer
            elm,        # one schreier generator
            img,        # image of <elm> under <hom>
            i, k;       # loop variables

  # make sure we have a stabilizer chain for <hom>
  if not IsBound( hom.stabilizer )  then
      hom.operations.MakeMapping( hom );
  fi;

  # loop over the stabilizer chain
  if hom.trivimages = []  then
      C := [];
  else
      C := ShallowCopy( hom.trivimages );
  fi;
  stb := hom;
  while stb.generators <> []  do

      # for all orbit points
      for i  in stb.orbit  do

	  # and all generators
	  for k  in [ 1 .. Length(stb.generators) ]  do

	      # make the schreier generator and its image
	      img := stb.transimages[i];
	      elm := stb.transversal[i];
	      while i^elm <> stb.orbit[1]  do
		  img := img * stb.transimages[i^elm];
		  elm := elm * stb.transversal[i^elm];
	      od;
	      img := img^-1 * stb.genimages[k];
	      elm := elm^-1 * stb.generators[k];

	      # divide the schreier generator through the stabilizer chain
	      stb2 := stb;
	      while stb2.generators <> []
		and IsBound(stb2.transversal[stb2.orbit[1]^elm])  do
		  bpt := stb2.orbit[1];
		  while bpt ^ elm <> bpt  do
		      img := img * stb2.transimages[bpt^elm];
		      elm := elm * stb2.transversal[bpt^elm];
		  od;
		  stb2 := stb2.stabilizer;
	      od;

	      # if the image is not trivial add it to the cokernel
	      if not img in C  then
		  Add( C, img );
	      fi;

	  od;

      od;

      # go down to the next stabilizer
      stb := stb.stabilizer;

  od;

  # return the cokernel
  return Difference( C, [hom.range.identity] );
end;

PermGroupHomomorphismByImagesOps.ImageElm := function ( hom, elm )
    if not IsMapping( hom )  then
        Error("<hom> must be a single valued mapping");
    fi;
    return hom.operations.ImagesRepresentative( hom, elm );
end;

PermGroupHomomorphismByImagesOps.ImagesElm := function ( hom, elm )
    local   img,        # image of <elm>, result
            stb,        # stabilizer of <G>
            bpt;        # basepoint of <stb>

    # make sure we have a stabilizer chain and the co kernel
    if not IsBound( hom.stabilizer )  then
        hom.operations.MakeMapping( hom );
    fi;
    if not IsBound( hom.coKernel )  then
        hom.coKernel := hom.operations.CoKernel( hom );
    fi;

    # go down the stabchain and reduce the permutation
    stb := hom;
    img := hom.range.identity;
    while stb.generators <> []  do
        bpt := stb.orbit[1];

        # if '<bpt>^<elm>' is not in the orbit then <elm> is not in <source>
        if not IsBound(stb.transversal[bpt^elm])  then
            return [];
        fi;

        # reduce <elm> into the stabilizer
        while bpt ^ elm <> bpt  do
            img := img * stb.transimages[bpt^elm];
            elm := elm * stb.transversal[bpt^elm];
        od;

        # and test if the reduced <g> lies in the stabilizer
        stb := stb.stabilizer;
    od;

    # if <elm> is not the identity it did not lie in <source>
    if elm <> hom.source.identity  then
        return [];
    fi;

    # return the image
    return hom.coKernel * img^-1;
end;

PermGroupHomomorphismByImagesOps.ImagesSet := function ( hom, elms )
    if IsGroup( elms )  and IsSubset( hom.source, elms )  then
        if hom.preImage <> hom.source  then
            elms := Intersection( hom.preImage, elms );
        fi;
        if not IsBound( hom.coKernel )  then
            hom.coKernel := hom.operations.CoKernel( hom );
        fi;
        return Closure( hom.coKernel,
                        Parent( hom.range ).operations.Subgroup(
                                Parent( hom.range ),
                                List( elms.generators,
                                      gen -> ImagesRepresentative( hom,
                                                                   gen ) )));
    else
        return GroupHomomorphismOps.ImagesSet( hom, elms );
    fi;
end;

PermGroupHomomorphismByImagesOps.ImagesRepresentative := function (hom,elm)
    local   img,        # image of <elm>, result
            stb,        # stabilizer of <G>
            bpt;        # basepoint of <stb>

    # make sure we have a stabilizer chain
    if not IsBound( hom.stabilizer )  then
        hom.operations.MakeMapping( hom );
    fi;

    # go down the stabchain and reduce the permutation
    stb := hom;
    img := hom.range.identity;
    while stb.generators <> []  do
        bpt := stb.orbit[1];

        # if '<bpt>^<elm>' is not in the orbit then <elm> is not in <source>
        if not IsBound(stb.transversal[bpt^elm])  then
            Error("<elm> must lie in the preimage of <hom>");
        fi;

        # reduce <elm> into the stabilizer
        while bpt ^ elm <> bpt  do
            img := img * stb.transimages[bpt^elm];
            elm := elm * stb.transversal[bpt^elm];
        od;

        # and test if the reduced <g> lies in the stabilizer
        stb := stb.stabilizer;
    od;

    # if <elm> is not the identity it did not lie in <source>
    if elm <> hom.source.identity  then
        Error("<elm> must lie in the preimage of <hom>");
    fi;

    # return the image
    return img^-1;
end;

PermGroupHomomorphismByImagesOps.CompositionMapping := function (hom1,hom2)
    local   prd,        # product of <hom1> and <hom2>, result
            stb,        # stabilizer in the chain of <prd>
            gens,       # strong generators of '<hom1>.source'
            imgs,       # their images under <prd>
            i, k;       # loop variables

    # product of a homomorphism by generator images
    if IsHomomorphism( hom2 )  and IsBound( hom2.genimages )  then

        # with another homomorphism
        if IsHomomorphism( hom1 )  then

            # make sure we have a stabilizer chain for the left homomorphism
            if not IsBound( hom2.stabilizer )  then
                hom2.operations.MakeMapping( hom2 );
            fi;

            # make the homomorphism
            prd := rec( );
            prd.isGeneralMapping := true;
            prd.domain          := Mappings;

            # enter the identifying information
            prd.source          := hom2.source;
            prd.range           := hom1.range;

            # enter useful information
            prd.isMapping       := true;
            prd.isHomomorphism  := true;
            prd.preImage        := hom2.source;

            # copy the stabilizer chain and update the images of the sgs
            gens := [ prd.source.identity ];
            imgs := [ prd.range.identity ];
            stb := prd;
            stb.identity        := hom2.source.identity;
            stb.generators      := [];
            stb.genimages       := [];
            while hom2.generators <> []  do

                # copy the generators and their images
                for i  in [ 1 .. Length( hom2.generators ) ]  do
                    if not hom2.generators[i]  in gens  then
                        Add( gens, hom2.generators[i] );
                        Add( imgs, ImagesRepresentative( hom1,
                                                      hom2.genimages[i] ) );
                    fi;
                    stb.generators[i] := hom2.generators[i];
                    stb.genimages[i] := imgs[ Position( gens,
                                                      hom2.generators[i] ) ];
                od;

                # copy the orbit and transversal
                stb.orbit := [];
                stb.transversal := [];
                stb.transimages := [];
                for i  in [ 1 .. Length( hom2.orbit ) ]  do
                    k := hom2.orbit[i];
                    stb.orbit[i] := k;
                    stb.transversal[k] := hom2.transversal[k];
                    stb.transimages[k] := imgs[ Position( gens,
                                                     hom2.transversal[k] ) ];
                od;

                # on to the next stabilizer
                stb.stabilizer := rec();
                stb.stabilizer.identity   := stb.identity;
                stb.stabilizer.generators := [];
                stb.stabilizer.genimages  := [];
                stb := stb.stabilizer;
                hom2 := hom2.stabilizer;

            od;

            # enter the operations record
            prd.operations      := PermGroupHomomorphismByImagesOps;
            if IsGroup( hom1.range ) then
               prd.image := Subgroup (Parent(hom1.range), imgs);
            fi;

        # with another mapping
        else

            prd := MappingOps.CompositionMapping( hom1, hom2 );

        fi;

    # of something else
    else
        prd := MappingOps.CompositionMapping( hom1, hom2 );
    fi;

    # return the product
    return prd;
end;


PermGroupHomomorphismByImagesPermGroupOps := OperationsRecord(
    "PermGroupHomomorphismByImagesPermGroupOps",
    PermGroupHomomorphismByImagesOps );

PermGroupHomomorphismByImagesPermGroupOps.MakeMapping :=
    function ( hom )
    local   inv,                        # inverse mapping of hom
            sourcedeg,                  # degree of source group
            rangedeg,                   # degree of range group
            conperm,                    # conjugates range permutations
            conperminv,                 # inverse of above
            subdirgens,                 # generators for subdirect product
            subdirgroup,                # subdirect product
            options,                    # options record for StabChain
            chain,                      # stabilizer chain
            subdirstronggens,           # strong generators for subdirect
            sourcestronggens,           # their projection into the source
            rangestronggens,            # their projection into the range
            T,                          # stabilizer of homomorphism
            top,                        # T is hom itself
            S,                          # stabilizer of chain
            pos,                        # position of generator
            cokerchain,                 # chain for co-kernel
            i;                          # loop variables

    # never make the same computation twice
    if IsBound( hom.makeMappingDone ) and hom.makeMappingDone then
        return;
    fi;

    # get the degree of the preimage and image
    if   hom.preImage.generators = []  then
        sourcedeg := 0;
    else
        sourcedeg := PermGroupOps.LargestMovedPoint( hom.preImage );
    fi;
    if   hom.image.generators = []  then
        rangedeg := 0;
    else
        rangedeg := PermGroupOps.LargestMovedPoint( hom.image );
    fi;

    # create concatenation of the generators and their images
    conperm := MappingPermListList( [ 1 .. rangedeg ],
                                    [ 1 .. rangedeg ] + sourcedeg );
    conperminv := conperm^(-1);
    subdirgens := [];
    for i in [1..Length(hom.generators)] do
        Add( subdirgens, hom.generators[i] * (hom.genimages[i] ^ conperm) );
    od;
    for i  in [1..Length(hom.trivimages)] do
        Add( subdirgens, ()                * (hom.trivimages[i] ^ conperm) );
    od;
    subdirgroup := Group( subdirgens, () );

    # collect info for options
    options := rec( );

    # random or deterministic
    if IsBound( Parent(hom.source).stabChainOptions )
       and IsBound( Parent(hom.source).stabChainOptions.random )
    then
        options.randomsource := Parent(hom.source).stabChainOptions.random;
    elif  IsBound( hom.source.stabChainOptions )
      and IsBound( hom.source.stabChainOptions.random )
    then
        options.randomsource := hom.source.stabChainOptions.random;
    elif  IsBound( hom.preImage.stabChainOptions )
      and IsBound( hom.preImage.stabChainOptions.random )
    then
        options.randomsource := hom.preImage.stabChainOptions.random;
    elif IsBound( StabChainOptions.random ) then
        options.randomsource := StabChainOptions.random;
    else
        options.randomsource := 1000;
    fi;
    if options.randomsource = true then
        options.randomsource := 900;
    elif options.randomsource = false then
        options.randomsource := 1000;
    fi;

    if IsBound( Parent(hom.range).stabChainOptions )
      and IsBound( Parent(hom.range).stabChainOptions.random )
    then
        options.randomrange := Parent(hom.range).stabChainOptions.random;
    elif  IsBound( hom.range.stabChainOptions )
      and IsBound( hom.range.stabChainOptions.random )
    then
        options.randomrange := hom.range.stabChainOptions.random;
    elif  IsBound( hom.image.stabChainOptions )
      and IsBound( hom.image.stabChainOptions.random )
    then
        options.randomrange := hom.image.stabChainOptions.random;
    elif IsBound( StabChainOptions.random ) then
        options.randomrange := StabChainOptions.random;
    else
        options.randomrange := 1000;
    fi;
    if options.randomrange = true then
        options.randomrange := 900;
    elif options.randomrange = false then
        options.randomrange := 1000;
    fi;

    options.random := Minimum( options.randomsource, options.randomrange );

    # if IsMapping, try to extract info from source
    if IsBound( hom.isMapping ) and hom.isMapping then

        if IsBound( hom.source.size ) then
            options.size := hom.source.size;
        elif IsBound( hom.preImage.size ) then
            options.size := hom.preImage.size;
        elif IsBound( hom.source.stabChain ) then
            options.size := Size( hom.source );
        elif IsBound( hom.preImage.stabChain ) then
            options.size := Size( hom.preImage );
        fi;
        if not IsBound( options.size ) then
            if IsBound( Parent(hom.source).size ) then
                options.limit :=  Parent(hom.source).size;
            elif IsBound( Parent(hom.source).stabChain ) then
                options.limit := Size( Parent(hom.source) );
            fi;
        fi;
        if    IsBound( hom.source.stabChainOptions )
          and IsBound( hom.source.stabChainOptions.knownBase )
        then
            options.knownBase := hom.source.stabChainOptions.knownBase;
        elif  IsBound( hom.preImage.stabChainOptions )
          and IsBound( hom.preImage.stabChainOptions.knownBase )
        then
            options.knownBase := hom.preImage.stabChainOptions.knownBase;
        elif IsBound( hom.source.stabChain ) then
            options.knownBase := Base( hom.source );
        elif IsBound( hom.preImage.stabChain ) then
            options.knownBase := Base( hom.preImage );
        elif IsBound( Parent(hom.source).stabChainOptions )
          and IsBound( Parent(hom.source).stabChainOptions.knownBase )
        then
            options.knownBase := Parent(hom.source).stabChainOptions.knownBase;
        elif IsBound( Parent(hom.source).stabChain ) then
            options.knownBase := Base( Parent(hom.source) );
        fi;

    # if not IsMapping, settle for less
    else

        if IsBound( hom.source.size ) then
            options.limitsource := hom.source.size;
        elif IsBound( hom.preImage.size ) then
            options.limitsource := hom.preImage.size;
        elif IsBound( Parent(hom.source).size ) then
            options.limitsource := Parent(hom.source).size;
        elif IsBound( hom.source.stabChain ) then
            options.limitsource := Size( hom.source );
        elif IsBound( hom.preImage.stabChain ) then
            options.limitsource := Size( hom.preImage );
        elif IsBound( Parent(hom.source).stabChain ) then
            options.limitsource := Size( Parent(hom.source) );
        fi;

        if IsBound( hom.source.stabChainOptions )
          and IsBound( hom.source.stabChainOptions.knownBase )
        then
            options.knownBasesource := hom.source.stabChainOptions.knownBase;
        elif  IsBound( hom.preImage.stabChainOptions )
          and IsBound( hom.preImage.stabChainOptions.knownBase )
        then
            options.knownBasesource := hom.preImage.stabChainOptions.knownBase;
        elif IsBound( Parent(hom.source).stabChainOptions )
          and IsBound( Parent(hom.source).stabChainOptions.knownBase )
        then
            options.knownBasesource
                := Parent(hom.source).stabChainOptions.knownBase;
        elif IsBound( hom.source.stabChain ) then
            options.knownBasesource := Base( hom.source );
        elif IsBound( hom.preImage.stabChain ) then
            options.knownBasesource := Base( hom.preImage );
        elif IsBound( Parent(hom.source).stabChain ) then
            options.knownBasesource := Base( Parent(hom.source) );
        fi;

        # if we have info about source, try to collect info about range
        if IsBound( options.limitsource ) then
            if IsBound( hom.image.size ) then
                options.limitrange := hom.image.size;
            elif IsBound( hom.range.size ) then
                options.limitrange := hom.range.size;
            elif IsBound( Parent(hom.range).size ) then
                options.limitrange := Parent(hom.range).size;
            elif IsBound( hom.image.stabChain ) then
                options.limitrange := Size( hom.image );
            elif IsBound( hom.range.stabChain ) then
                options.limitrange := Size( hom.range );
            elif IsBound( Parent(hom.range).stabChain ) then
                options.limitrange := Size( Parent(hom.range) );
            fi;
            if IsBound( options.limitrange ) then
                options.limit := options.limitsource * options.limitrange;
            fi;
        fi;

        if IsBound( options.knownBasesource ) then
            if    IsBound( hom.image.stabChainOptions )
              and IsBound( hom.image.stabChainOptions.knownBase )
            then
                options.knownBaserange
                    := hom.image.stabChainOptions.knownBase;
            elif  IsBound( hom.range.stabChainOptions )
              and IsBound( hom.range.stabChainOptions.knownBase )
            then
                options.knownBaserange
                    := hom.range.stabChainOptions.knownBase;
            elif IsBound( Parent(hom.range).stabChainOptions )
              and IsBound( Parent(hom.range).stabChainOptions.knownBase )
            then
                options.knownBaserange
                    := Parent(hom.range).stabChainOptions.knownBase;
            elif IsBound( hom.range.stabChain ) then
                options.knownBaserange := Base( hom.range );
            elif IsBound( hom.image.stabChain ) then
                options.knownBaserange := Base( hom.image );
            elif IsBound( Parent(hom.range).stabChain ) then
                options.knownBaserange := Base( Parent(hom.range) );
            fi;
            if IsBound( options.knownBaserange ) then
                options.knownBase :=
                  Union( options.knownBasesource,
                         options.knownBaserange + sourcedeg );
            fi;
        fi;

    fi;

    # we need this base, so we know the co-kernel
    options.base := [ 1 .. sourcedeg ];

    # compute the stabilizer chain
    chain := StabChain( subdirgroup, options );

    # get the strong generators and their action on the original domains
    subdirstronggens := PermGroupOps.StrongGenerators( chain );
    sourcestronggens := [];
    rangestronggens  := [];
    for i in [1..Length(subdirstronggens)]  do
        sourcestronggens[i]
          := PermList( OnTuples( [1..sourcedeg], subdirstronggens[i] ) );
        rangestronggens[i]
          := (subdirstronggens[i]/sourcestronggens[i]) ^ conperminv;
    od;

    # make the stabilizer chain for the homomorphism
    T := hom;
    top := true;
    S := chain;
    while IsBound(S.orbit) and S.orbit[1] <= sourcedeg  do
        if not top  then
            T.generators := [];
            T.genimages  := [];
            T.trivimages := [];
            for i in [1..Length(S.generators)]  do
                pos := Position(subdirstronggens,S.generators[i]);
                if   sourcestronggens[pos] <> ()  then
                    Add( T.generators, sourcestronggens[pos] );
                    Add( T.genimages, rangestronggens[pos] );
                elif rangestronggens[pos] <> () then
                    Add( T.trivimages, rangestronggens[pos] );
                fi;
            od;
        fi;
        T.orbit := ShallowCopy( S.orbit );
        T.transversal := [];
        T.transimages := [];
        for i in S.orbit  do
            if i <> S.orbit[1]  then
                pos := Position(subdirstronggens,S.transversal[i]);
                if sourcestronggens[pos] = ()  then
                    Error("transversal elm should not be trivial");
                fi;
                T.transversal[i] := sourcestronggens[pos];
                T.transimages[i] := rangestronggens[pos];
            else
                T.transversal[i] := ();
                T.transimages[i] := ();
            fi;
        od;
        T.stabilizer := rec( generators := [], identity := () );
        T := T.stabilizer;
        top := false;
        S := S.stabilizer;
    od;

    # if not already known copy the stabilizer chain to the source group
    if     not IsBound( hom.source.stabChain )
           and Length( hom.source.generators ) > 0
           and ForAll( hom.source.generators, x -> SCRSift(hom,x) = () )
    then
        hom.source.stabilizer := Copy( hom.stabilizer );
        if IsEqualSet( hom.source.generators, hom.generators )  then
            hom.source.orbit       := ShallowCopy( hom.orbit );
            hom.source.transversal := ShallowCopy( hom.transversal );
        else
            #N akos 6/22/94 this should disappear when
            #N stabChain.generators may differ from group.generators
            hom.source.orbit       := [ hom.orbit[1] ];
            hom.source.transversal := [];
            hom.source.transversal[ hom.source.orbit[1] ] := ();
            PermGroupOps.AddGensExtOrb(hom.source,hom.source.generators);
        fi;
        hom.source.stabChain := rec(
            generators  := ShallowCopy(hom.source.generators),
            identity    := (),
            orbit       := hom.source.orbit,
            transversal := hom.source.transversal,
            stabilizer  := hom.source.stabilizer );
        if IsBound( hom.source.stabChainOptions )  then
            hom.source.stabChainOptions.random := options.random;
        else
            hom.source.stabChainOptions := rec( random := options.random );
        fi;
    fi;

    # make the stabilizer chain for the co-kernel
    if IsBound(S.orbit)  then
        hom.isMapping := false;
        cokerchain := rec( identity := (), generators := [] );
        T := cokerchain;
        while IsBound(S.orbit)  do
            T.generators := [];
            for i  in [1..Length(S.generators)]  do
                pos := Position(subdirstronggens,S.generators[i]);
                if rangestronggens[pos] = ()  then
                    Error("generator should not be trivial");
                fi;
                Add( T.generators, rangestronggens[pos] );
            od;
            T.orbit := OnTuples( S.orbit, conperminv );
            T.transversal := [];
            for i in S.orbit  do
                if i <> S.orbit[1]  then
                    pos := Position(subdirstronggens,S.transversal[i]);
                    if rangestronggens[pos] = ()  then
                        Error("transversal elm should not be trivial");
                    fi;
                    T.transversal[i^conperminv] := rangestronggens[pos];
                else
                    T.transversal[i^conperminv] := ();
                fi;
            od;
            T.stabilizer := rec( generators := [], identity := () );
            T := T.stabilizer;
            S := S.stabilizer;
        od;
        hom.coKernel := Subgroup( Parent(hom.range),
                                  cokerchain.generators );
        hom.coKernel.stabChain   := cokerchain;
        # for compatibility
        hom.coKernel.orbit       := hom.coKernel.stabChain.orbit;
        hom.coKernel.transversal := hom.coKernel.stabChain.transversal;
        hom.coKernel.stabilizer  := hom.coKernel.stabChain.stabilizer;
    else
        hom.coKernel := TrivialSubgroup( Parent(hom.range) );
    fi;

    # while we are at it, lets deal with the inverse mapping too
    inv := InverseMapping( hom );
    if not IsBound( inv.orbit )  then

        # make a basechange so that we know Stabilizer( subdir, [1..n] )
        chain := StabChain( subdirgroup,
                            rec( base := [ 1 .. rangedeg ] + sourcedeg ) );

        # get the strong generators and their action on the original domains
        subdirstronggens := PermGroupOps.StrongGenerators( chain );
        sourcestronggens := [];
        rangestronggens  := [];
        for i in [1..Length(subdirstronggens)]  do
            sourcestronggens[i]
              := PermList( OnTuples( [1..sourcedeg], subdirstronggens[i] ) );
            rangestronggens[i]
              := (subdirstronggens[i]/sourcestronggens[i]) ^ conperminv;
        od;

        # make the stabilizer chain for the inverse
        T := inv;
        top := true;
        S := chain;
        while IsBound(S.orbit) and S.orbit[1] > sourcedeg  do
            if not top  then
                T.generators := [];
                T.genimages  := [];
                T.trivimages := [];
                for i in [1..Length(S.generators)]  do
                    pos := Position(subdirstronggens,S.generators[i]);
                    if   rangestronggens[pos] <> ()  then
                        Add( T.generators, rangestronggens[pos] );
                        Add( T.genimages, sourcestronggens[pos] );
                    elif sourcestronggens[pos] <> ()  then
                        Add( T.trivimages, sourcestronggens[pos] );
                    fi;
                od;
            fi;
            T.orbit       := OnTuples( S.orbit, conperminv );
            T.transversal := [];
            T.transimages := [];
            for i in S.orbit  do
                if i <> S.orbit[1]  then
                    pos := Position(subdirstronggens,S.transversal[i]);
                    if rangestronggens[pos] = ()  then
                        Error("transversal elm should not be trivial");
                    fi;
                    T.transversal[i^conperminv] := rangestronggens[pos];
                    T.transimages[i^conperminv] := sourcestronggens[pos];
                else
                    T.transversal[i^conperminv] := ();
                    T.transimages[i^conperminv] := ();
                fi;
            od;
            T.stabilizer := rec( generators := [], identity := () );
            T := T.stabilizer;
            top := false;
            S := S.stabilizer;
        od;

        # if not already known copy the stabilizer chain to the source group
        if     not IsBound( inv.source.stabChain )
               and Length( inv.source.generators ) > 0
               and ForAll( inv.source.generators, x -> SCRSift(inv,x) = () )
        then
            inv.source.stabilizer := Copy( inv.stabilizer );
            if IsEqualSet( inv.source.generators, inv.generators )  then
                inv.source.orbit       := ShallowCopy( inv.orbit );
                inv.source.transversal := ShallowCopy( inv.transversal );
            else
                #N akos 6/22/94 this should disappear when
                #N stabChain.generators may differ from group.generators
                inv.source.orbit       := [ inv.orbit[1] ];
                inv.source.transversal := [];
                inv.source.transversal[ inv.source.orbit[1] ] := ();
                PermGroupOps.AddGensExtOrb(inv.source,inv.source.generators);
            fi;
            inv.source.stabChain := rec(
                generators  := ShallowCopy(inv.source.generators),
                identity    := (),
                orbit       := inv.source.orbit,
                transversal := inv.source.transversal,
                stabilizer  := inv.source.stabilizer );
            if IsBound( inv.source.stabChainOptions )  then
                inv.source.stabChainOptions.random := options.random;
            else
                inv.source.stabChainOptions := rec( random := options.random );
            fi;
        fi;

        # make the stabilizer chain for the co-kernel
        if IsBound(S.orbit)  then
            inv.isMapping := false;
            cokerchain := rec( identity := (), generators := [] );
            T := cokerchain;
            while IsBound(S.orbit)  do
                T.generators := [];
                for i  in [1..Length(S.generators)]  do
                    pos := Position(subdirstronggens,S.generators[i]);
                    if sourcestronggens[pos] = ()  then
                        Error("generator should not be trivial");
                    fi;
                    Add( T.generators, sourcestronggens[pos] );
                od;
                T.orbit       := ShallowCopy( S.orbit );
                T.transversal := [];
                for i in S.orbit  do
                    if i <> S.orbit[1]  then
                        pos := Position(subdirstronggens,S.transversal[i]);
                        if sourcestronggens[pos] = ()  then
                            Error("transversal elm should not be trivial");
                        fi;
                        T.transversal[i] := sourcestronggens[pos];
                    else
                        T.transversal[i] := ();
                    fi;
                od;
                T.stabilizer := rec( generators := [], identity := () );
                T := T.stabilizer;
                S := S.stabilizer;
            od;
            inv.coKernel := Subgroup( Parent(inv.range),
                                      cokerchain.generators );
            inv.coKernel.stabChain   := cokerchain;
            # for compatibility
            inv.coKernel.orbit       := inv.coKernel.stabChain.orbit;
            inv.coKernel.transversal := inv.coKernel.stabChain.transversal;
            inv.coKernel.stabilizer  := inv.coKernel.stabChain.stabilizer;
        else
            inv.coKernel := TrivialSubgroup( Parent(inv.range) );
        fi;

        # and we know more
        hom.kernel := inv.coKernel;
        inv.kernel := hom.coKernel;

    fi;

    # finally we are done
    hom.makeMappingDone := true;
end;


#############################################################################
##
#F  PermGroupOps.OperationHomomorphism(<G>,<P>) . . .  operation homomorphism
#F                                                           for a perm group
##
PermGroupOps.OperationHomomorphism := function ( G, P )
    local   hom;        # operation homomorphism from <G> into <P>, result

    # special case for transitive constituent homomorphism
    if      P.operation.operation = OnPoints
        and ForAll( P.operation.domain, IsInt )
    then
        hom := PermGroupOps.TransConstHomomorphism( G, P );

    # special case for blocks homomorphism
    elif    P.operation.operation = OnSets
        and (  (IsBound(P.operation.isBlocksOperation)
                and P.operation.isBlocksOperation)
            or (ForAll( P.operation.domain, IsSet )
                and Size( Union(P.operation.domain) )
                  = Sum( P.operation.domain, Size )))
    then
        hom := PermGroupOps.BlocksHomomorphism( G, P );

    # delegate other cases
    else
        hom := GroupOps.OperationHomomorphism( G, P );

    fi;

    # return the homomorphism
    return hom;
end;


#############################################################################
##
#F  PermGroupOps.TransConstHomomorphism(<G>,<P>) . . . transitive constituent
#F                                               homomorphism of <G> into <P>
##
##  The  reason  that we  specialize 'OperationHomomorphism'  for   this case
##  is that we can map  stabilizer chains when  we take  images of  preimages
##  of subgroups.   Also taking images of  elements  can be  made a litte bit
##  faster.
##
PermGroupOps.TransConstHomomorphism := function ( G, P )
    local   hom;        # homomorphism, result

    # make the homomorphism
    hom := rec(

        # tags
        isGeneralMapping    := true,
        domain              := Mappings,

        # source and range
        source              := G,
        range               := P,

        # permutation mapping <D> to the moved points of <P>
        conperm             := MappingPermListList( P.operation.domain,
                                     [ 1 .. Length( P.operation.domain ) ] ),

        # usefull information
        isMapping           := true,
        isHomomorphism      := true,
        isGroupHomomorphism := true,
        isTransConstHom     := true,

        # operations record
        operations          := TransConstHomomorphismOps );

    # return the homomorphism
    return hom;
end;

TransConstHomomorphismOps := OperationsRecord(
    "TransConstHomomorphismOps",
    OperationHomomorphismOps );

TransConstHomomorphismOps.ImageElm := function ( hom, elm )
    if hom.range.operation.domain = [] then
       return ();
    else
#       return RestrictedPerm(elm,hom.range.operation.domain) ^ hom.conperm;
       return PermList( OnTuples( [1..Length(hom.range.operation.domain)],
                        elm^hom.conperm ) );
    fi;
end;

TransConstHomomorphismOps.ImagesElm := function ( hom, elm )
    return [ hom.operations.ImageElm( hom, elm ) ];
end;

TransConstHomomorphismOps.ImagesRepresentative
        := TransConstHomomorphismOps.ImageElm;

TransConstHomomorphismOps.KernelGroupHomomorphism := function ( hom )

    #  kernel = pointwise stabilizer of permutation domain of range
    MakeStabChain(hom.source,hom.range.operation.domain);
    hom.kernel := Stabilizer(hom.source,hom.range.operation.domain,OnTuples);

    return hom.kernel;
end;

TransConstHomomorphismOps.ImagesSet := function ( hom, H )
    local   I,          # image of <H>, result
            S,          # stabilizer in <H>
            T,          # corresponding stabilizer in <I>
            chain,      # stabchain in I
            gens,       # strong generators of <H>
            imgs,       # their images in <I>
            top,        # is 'true' if <T> is <I>
            gen,        # one generator from <gens>
            pnt,        # one point in the orbit <S>
            img;        # the image of <pnt> in the orbit of <T>

    # handle special case that <H> is a subgroup of '<hom>.source'
    if IsDomain( H )  then

        # adapt the base of <H> to the subset of <D> that is in the base
        MakeStabChain( H, hom.range.operation.domain );
        Size( H );
        InfoPermGroup1("#I  TransConstHomOps.ImagesSet called for ",
                        GroupString(H,"H"),"\n");

        # initialize a list of strong gens of <H> and their images in <I>
        gens := [];
        imgs := [];
        for gen  in H.generators  do
            Add( gens, gen );
            Add( imgs, Image( hom, gen ) );
        od;

        # create the image group
        I := Subgroup( Parent( hom.range ), imgs );
        if IsBound( I.orbit )  then return I;  fi;

        # loop over the points in the subset of <G> that are in the base
        S := H;
        T := rec( generators := ShallowCopy(I.generators), identity := () );
        chain := T;
        top := true;
        while   IsBound( S.orbit )
            and S.orbit[1] in hom.range.operation.domain
        do

            # make the generators for <T>
            if not top  then
                T.generators := [];
                for gen  in S.generators  do
                    if not gen in gens  then
                        Add( gens, gen );
                        Add( imgs, Image( hom, gen ) );
                    fi;
                    if imgs[ Position( gens, gen ) ] <> T.identity  then
                       Add( T.generators, imgs[ Position( gens, gen ) ] );
                   fi;
                od;
            fi;

            # make the orbit and the transversal for <T>
            T.orbit := [];
            T.transversal := [];
            for pnt  in S.orbit  do
                img := pnt ^ hom.conperm;
                Add( T.orbit, img );
                if pnt <> S.orbit[1]  then
                    gen := S.transversal[ pnt ];
                    T.transversal[ img ] := imgs[ Position( gens, gen ) ];
                else
                    T.transversal[ img ] := T.identity;
                fi;
            od;

            # add a trivial stabilizer
            T.stabilizer := rec(
                generators := [],
                identity   := T.identity );

            # go down to the next step
            S := S.stabilizer;
            T := T.stabilizer;
            top := false;

        od;

        # create record of I
        I.stabChain := chain;
        if IsBound(chain.stabilizer) then
            I.orbit := chain.orbit;
            I.stabilizer := chain.stabilizer;
            I.transversal := chain.transversal;
        fi;

        # give some information
        Size( I );
        InfoPermGroup1("#I  TransConstHomOps.ImagesSet returns ",
                        GroupString(I,"I"),"\n");

    # set case
    else
        I := Set(List( H, x -> TransConstHomomorphismOps.ImageElm(hom, x) ));
    fi;

    # return the image
    return I;
end;

TransConstHomomorphismOps.PreImagesSet := function ( hom, I )
    local   H,          # preimage of <I>, result
            S,          # stabilizer in <H>
            T,          # corresponding stabilizer in <I>
            chain,      # stabchain in H
            K,          # kernel of <hom>
            conperminv, # inverse of hom.conperm
            gens,       # strong generators of <I>
            pres,       # their preimages in <H>
            top,        # is 'true' if <S> is <H>
            gen,        # one generator from <gens>
            pnt,        # one point in the orbit <T>
            img;        # the preimage of <pnt> in the orbit of <S>

    #N  18-Feb-92 <I> need not be a subset of 'Image( <hom> )'

    # handle special case that <I> is a subgroup of '<hom>.range'
    if IsDomain( I )  then

        # compute a stabilizer chain for <I>
        MakeStabChain( I );
        Size( I );
        InfoPermGroup1("#I  TransConstHomOps.PreImagesSet called for ",
                        GroupString(I,"I"),"\n");

        # initialize a list of strong gens of <I> and their preimages in <H>
        gens := [];
        pres := [];
        for gen  in I.generators  do
            Add( gens, gen );
            Add( pres, PreImagesRepresentative( hom, gen ) );
        od;

        # compute the kernel of <hom>
        K := Kernel( hom );

        # create the preimage group
        H := Subgroup(Parent(hom.source),Concatenation(pres,K.generators));
        if IsBound( H.orbit )  then return H;  fi;

        # loop over the basepoints of <I>
        conperminv := hom.conperm^(-1);
        S := rec( generators := ShallowCopy(H.generators), identity := () );
        chain := S;
        T := I;
        top := true;

        while IsBound( T.orbit )  do

            # make the generators for <S>
            if not top  then
                S.generators := ShallowCopy( K.generators );
                for gen  in T.generators  do
                    if not gen in gens  then
                        Add( gens, gen );
                        Add( pres, PreImagesRepresentative( hom, gen ) );
                    fi;
                    Add( S.generators, pres[ Position( gens, gen ) ] );
                od;
            fi;

            # make the orbit and the transversal for <S>
            S.orbit := [];
            S.transversal := [];
            for pnt  in T.orbit  do
                img := pnt ^ conperminv;
                Add( S.orbit, img );
                if pnt <> T.orbit[1]  then
                    gen := T.transversal[ pnt ];
                    S.transversal[ img ] := pres[ Position( gens, gen ) ];
                else
                    S.transversal[ img ] := S.identity;
                fi;
            od;
            # add a trivial stabilizer
            S.stabilizer := rec(
                generators := [],
                identity   := S.identity );

            # go down to the next step
            S := S.stabilizer;
            T := T.stabilizer;
            top := false;

        od;

        # append the kernel to the stabilizer chain of <H>
        #N  18-Feb-92 martin 'Copy' and 'ShallowCopy' should go away
        S.generators := ShallowCopy( K.generators );
        if IsBound( K.orbit )  then
            S.orbit       := ShallowCopy( K.orbit );
            S.transversal := ShallowCopy( K.transversal );
            S.stabilizer  := Copy( K.stabilizer );
        fi;

        # create record of H
        H.stabChain := chain;
        if IsBound(chain.stabilizer) then
            H.orbit := chain.orbit;
            H.stabilizer := chain.stabilizer;
            H.transversal := chain.transversal;
        fi;

        # give some information
        Size( H );
        InfoPermGroup1("#I  TransConstHomOps.PreImagesSet returns ",
                        GroupString(H,"H"),"\n");

    # delegate set case
    else
        H := OperationHomomorphismOps.PreImagesSet( hom, I );

    fi;

    # return the preimage
    return H;
end;


#############################################################################
##
#F  PermGroupOps.BlocksHomomorphism(<G>,<P>)   homomorphism for the operation
#F                                   of a permutation group on a block system
##
PermGroupOps.BlocksHomomorphism := function ( G, P )
    local   hom,        # homomorphism, result
            i, k;       # loop variables

    # make the homomorphism
    hom := rec(

        # tags
        isGeneralMapping    := true,
        domain              := Mappings,

        # source and range
        source              := G,
        range               := P,

        # get the blocks
        blocks              := P.operation.domain,

        # usefull information
        isMapping           := true,
        isHomomorphism      := true,
        isGroupHomomorphism := true,
        isBlocksHomomorphism := true,

        # operations record
        operations          := BlocksHomomorphismOps );

    # add also a list that says for each element which block it lies in
    hom.reps := [];
    for i  in [ 1 .. Length( hom.blocks ) ]  do
        for k  in hom.blocks[i]  do
            hom.reps[k] := i;
        od;
    od;

    # return the homomorphism
    return hom;
end;

BlocksHomomorphismOps := OperationsRecord(
    "BlocksHomomorphismOps",
    OperationHomomorphismOps );

BlocksHomomorphismOps.ImageElm := function ( hom, elm )
    local    img,       # image of <elm> under <hom>, result
             i;         # loop variable

    # make the image permutation as a list
    img := [];
    for i  in [ 1 .. Length( hom.blocks ) ]  do
        img[i] := hom.reps[ hom.blocks[i][1] ^ elm ];
    od;

    # return the image as a permutation
    return PermList( img );
end;

BlocksHomomorphismOps.ImagesElm := function ( hom, elm )
    return [ hom.operations.ImageElm( hom, elm ) ];
end;

BlocksHomomorphismOps.ImagesRepresentative
        := BlocksHomomorphismOps.ImageElm;

BlocksHomomorphismOps.ImagesSet := function ( hom, H )
    local   I,          # image of <H>, result
            base,       # base of action on blocks
            S,          # block stabilizer in <H>
            T,          # corresponding stabilizer in <I>
            chain,      # stabchain in I
            R,          # temporary stabilizer
            gens,       # strong generators of <H>
            imgs,       # their images in <I>
            top,        # 'true' if <T> is <I>
            gen,        # one generator from <gens>
            pnt,        # one point in the orbit <S>
            img,        # the image of <pnt> in the orbit of <T>
            blockStabsOrbit,        # orbit of the block stabilizers
            blockStabsTransversal,  # transversals of the block stabilizers
            i;          # loop variable

    # handle the special case that <H> is a subgroup of '<hom>.source'
    if IsDomain( H )  then

        # compute the generators for the image
        gens := [];
        imgs := [];
        for gen  in H.generators  do
            Add( gens, gen );
            Add( imgs, Image( hom, gen ) );
        od;

        # initialize the image group
        I := Subgroup( Parent( hom.range ), imgs );

        blockStabsOrbit := [];
        blockStabsTransversal := [];

        # start with the group
        S := H;
        T := rec( generators := ShallowCopy(I.generators), identity := () );
        chain := T;
        top := true;

        # loop over the blocks
#        base := Set( List( Intersection( Base(H),
#                  Union(hom.range.operation.domain) ), x -> hom.reps[x] ) );
        for i in [1.. Length( hom.blocks )] do

          # if <S> operates non-trivially on the block
          if ForAny( S.generators, g->hom.reps[hom.blocks[i][1]^g]<>i )  then

            # make sure that <S> has the rep. of the block as basepoint
            MakeStabChain( S, [ hom.blocks[i][1] ] );

            # if <S> does not already stabilize this block
            if      IsBound( S.orbit )
                and S.orbit[1] = hom.blocks[i][1]
                and not IsSubsetSet( hom.blocks[i], S.orbit )
            then

                # add orbit and transversal to the representative lists
                Add( blockStabsOrbit, S.orbit );
                Add( blockStabsTransversal, S.transversal );

                # make the generators for <T>
                if not top  then
                    T.generators := [];
                    for gen  in S.generators  do
                        if not gen in gens  then
                            Add( gens, gen );
                            Add( imgs, Image( hom, gen ) );
                        fi;
                        if imgs[ Position( gens, gen ) ] <> T.identity  then
                            Add( T.generators, imgs[ Position(gens,gen) ] );
                        fi;
                    od;
                fi;

                # make the orbit and the transversal of <T>
                T.orbit       := [ i ];
                T.transversal := [];
                T.transversal[i] := ();
                for pnt  in S.orbit  do
                    img := hom.reps[ pnt ];
                    if not img in T.orbit  then
                        Add( T.orbit, img );
                        gen := S.transversal[ pnt ];
                        T.transversal[ img ] := imgs[ Position(gens,gen) ];
                    fi;
                od;

                # add a trivial stabilizer to <T>
                T.stabilizer := rec(
                    identity    := T.identity,
                    generators  := [] );

                # make <R> the stabilizer of the block in <S>
                #N  18-Feb-91 martin 'Copy' and 'ShallowCopy' should go away
                R := ShallowCopy( Subgroup( Parent( S ), [] ) );
                R.generators := ShallowCopy( S.stabilizer.generators );
                R.orbit := [ S.orbit[1] ];
                R.transversal := [];
                R.transversal[ R.orbit[1] ] := R.identity;
                for pnt  in S.orbit  do
                    if pnt in hom.blocks[i]  and not pnt in R.orbit  then
                        gen := R.identity;
                        while R.orbit[1] ^ gen <> pnt  do
                            gen := LeftQuotient(S.transversal[pnt/gen],gen);
                        od;
                        PermGroupOps.AddGensExtOrb( R, [gen] );
                    fi;
                od;
                R.stabilizer := Copy( S.stabilizer );

                # prepare for the next step
                S := R;
                T := T.stabilizer;
                top := false;

            fi;

          fi;

        od;

        # create record of I
        I.stabChain := chain;
        if IsBound(chain.stabilizer) then
            I.orbit := chain.orbit;
            I.stabilizer := chain.stabilizer;
            I.transversal := chain.transversal;
        fi;

        # if <H> is the full group this also gives us the kernel
        if H = hom.source  and not IsBound( hom.kernel )  then
            hom.kernel := S;
            hom.blockStabsOrbit := blockStabsOrbit;
            hom.blockStabsTransversal := blockStabsTransversal;
        fi;

    # set case
    else
        I := Set(List( H, x -> BlocksHomomorphismOps.ImageElm(hom, x) ));
    fi;

    # return the images
    return I;
end;

BlocksHomomorphismOps.PreImagesRepresentative := function ( hom, elm )
    local   pre,        # preimage of <elm>, result
            pnt,        # one point of a set stabilizer
            i;          # loop variable

    # make sure that we know the iterated set stabilizers
    if not IsBound( hom.blockStabsOrbit )  then
        Image( hom );
    fi;

    # start with the identity as preimage
    pre := hom.source.identity;

    # loop over the blocks and their interated set stabilizers
    for i  in [ 1 .. Length( hom.blockStabsOrbit ) ]  do

        # find a rep. mapping 'blocks[<i>]' to 'blocks[<i>^<elm>]^(<pre>^-1)'
        pnt := First( hom.blocks[ hom.reps[hom.blockStabsOrbit[i][1]]^elm ],
                      pnt -> pnt / pre in hom.blockStabsOrbit[i] );
        while hom.blockStabsOrbit[i][1] ^ pre <> pnt  do
            pre := LeftQuotient(hom.blockStabsTransversal[i][pnt/pre],pre);
        od;

    od;

    # return the preimage
    return pre;
end;

BlocksHomomorphismOps.PreImagesSet := function ( hom, I )
    local   H;          # preimage of <I> under <hom>, result

    # handle special case that <I> is a subgroup of '<hom>.range'
    if IsDomain( I )  then

       # make sure we know a stabilizer chain for <I>
       MakeStabChain( I );

       # now compute the preimage by iterating
       H := BlocksHomomorphismOps.PreImagesSetStab( hom, I );

    # delegate set case
    else
        H := OperationHomomorphismOps.PreImagesSet( hom, I );

    fi;

    # return the preimage
    return H;
end;

BlocksHomomorphismOps.PreImagesSetStab := function ( hom, I )
    local   H,          # preimage of <I> under <hom>, result
            K,          # kernel of <hom>
            pnt,        # rep. of the block that is the basepoint <I>
            gen,        # one generator of <I>
            pre;        # a representative of its preimages

    # if <I> is trivial then preimage is the kernel of <hom>
    if I.generators = []  then
        K := Kernel(hom);
        H := Subgroup( Parent(K), K.generators );
        if IsBound( K.orbit )  then
            H.orbit       := ShallowCopy( K.orbit );
            H.transversal := ShallowCopy( K.transversal );
            H.stabilizer  := Copy( K.stabilizer );
            H.stabChain   := rec();
            H.stabChain.identity    := H.identity;
            H.stabChain.generators  := H.generators;
            H.stabChain.orbit       := H.orbit;
            H.stabChain.transversal := H.transversal;
            H.stabChain.stabilizer  := H.stabilizer;
        fi;

    # else begin with the preimage $H_{block[i]}$ of the stabilizer  $I_{i}$,
    # adding preimages of the generators of  $I$  to those of  $H_{block[i]}$
    # gives us generators for $H$. Because $H_{block[i][1]} \<= H_{block[i]}$
    # the stabilizer chain below $H_{block[i][1]}$ is already complete, so we
    # only have to care about the top level with the basepoint $block[i][1]$.
    else
        H := BlocksHomomorphismOps.PreImagesSetStab( hom, I.stabilizer );
        pnt := hom.blocks[ I.orbit[1] ][1];
        MakeStabChain(   H, [ pnt ] );
        ExtendStabChain( H, [ pnt ] );
        for gen  in I.generators  do
            pre := PreImagesRepresentative( hom, gen );
            if not IsBound( H.transversal[ pnt ^ pre ] )  then
                PermGroupOps.AddGensExtOrb( H, [ pre ] );
            fi;
        od;

    fi;

    # return the preimage
    return H;
end;

BlocksHomomorphismOps.KernelGroupHomomorphism := function ( hom )

    # when we compute the image we will also get the kernel
    Image( hom );

    # return the kernel
    return hom.kernel;
end;



