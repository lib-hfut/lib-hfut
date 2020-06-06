#############################################################################
##
#A  alghomom.g                  GAP library                   Thomas Breuer ?
##
#A  @(#)$Id: alghomom.g,v 3.0.1.1 1996/06/11 14:48:18 mschoene Exp $
##
#Y  Copyright 1990-1993,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains dispatcher and default functions for alg homomorphism.
##
##  As is obvious, nearly everything in this file is copied from
##  'grphomom.g'. (Avoid this!)
##
#H  $Log: alghomom.g,v $
#H  Revision 3.0.1.1  1996/06/11  14:48:18  mschoene
#H  fixed '.preimage' to '.preImage'
#H
#H  Revision 3.0  1994/05/19  13:20:43  sam
#H  Initial Revision under RCS
#H
##

#############################################################################
##
#F  IsAlgebraHomomorphism(<obj>)  .  test if <obj> is an algebra homomorphism
##
IsAlgebraHomomorphism := function( obj )
    if not IsBound( obj.isAlgebraHomomorphism ) then
        obj.isAlgebraHomomorphism:= obj.operations.IsAlgebraHomomorphism(obj);
    fi;
    return obj.isAlgebraHomomorphism;
    end;

#############################################################################
##
#F  IsUnitalAlgebraHomomorphism(<obj>)
##
IsUnitalAlgebraHomomorphism := function( obj )
    if not IsBound( obj.isUnitalAlgebraHomomorphism ) then
        obj.isUnitalAlgebraHomomorphism:=
              obj.operations.IsUnitalAlgebraHomomorphism(obj);
    fi;
    return obj.isUnitalAlgebraHomomorphism;
    end;

#############################################################################
##
#F  AlgebraOps.IsHomomorphism(<fun>) test if <fun> is an algebra homomorphism
##
AlgebraOps.IsHomomorphism := IsAlgebraHomomorphism;

#############################################################################
##
#F  MappingOps.IsAlgebraHomomorphism(<fun>) . . . test if <fun> is an algebra
#F                                                               homomorphism
##
MappingOps.IsAlgebraHomomorphism := function( fun )
    local   isHom;      # 'true' if <fun> is a homomorphism, result

    # check that <fun> is a function
    if not IsMapping( fun )  then
      Error( "<fun> must be a single valued mapping" );
    fi;

    # test that source and range are algebras
    if not IsAlgebra( fun.source )  then
      return false;
    fi;
    if not IsAlgebra( fun.range )  then
      return false;
    fi;

    # test the linearity explicitely if the source is finite
    if IsFinite( fun.source )  then
      isHom:= ForAll( Elements(fun.source),
                      x -> ForAll( fun.source.generators,
                                  y -> Image( fun, x * y )
                                     = Image( fun, x ) * Image( fun, y ) ) );

    # otherwise give up
    else
      Error( "sorry, can not test if <fun> is a hom., infinite source" );
    fi;

    # return the result
    return isHom;
    end;

#############################################################################
##
#F  KernelAlgebraHomomorphism(<fun>)  . . . kernel of an algebra homomorphism
##
KernelAlgebraHomomorphism := function( fun )
    if not IsBound( fun.kernelAlgebraHomomorphism )  then
        fun.kernelAlgebraHomomorphism
            := fun.operations.KernelAlgebraHomomorphism(fun);
    fi;
    return fun.kernelAlgebraHomomorphism;
    end;

#############################################################################
##
#F  AlgebraOps.Kernel(<fun>)  . . . . . . . kernel of an algebra homomorphism
##
AlgebraOps.Kernel := KernelAlgebraHomomorphism;

#############################################################################
##
#F  MappingOps.KernelAlgebraHomomorphism(<hom>)  . . . . kernel of an algebra
#F                                                               homomorphism
##
MappingOps.KernelAlgebraHomomorphism := function( hom )
    local   krn,        # kernel of <hom>, result
            g;          # random element of source

    # check that <hom> is a homomorphism
    if not IsHomomorphism(hom)  then
        Error("<hom> must be a homomorphism");
    fi;
    if not IsFinite( hom.source )  then
        Error("sorry, cannot compute kernel of <hom>, infinite source");
    fi;

    # compute the kernel by trying random elements
    krn := TrivialSubalgebra( Parent( hom.source ) );
    while Size( hom.source ) / Size( krn ) <> Size( Image( hom ) )  do
        g := Random( hom.source );
        if hom.operations.ImageElm( hom, g ) = Zero( hom.range )
            and not g in krn
        then
            krn := Closure( krn, g );
        fi;
    od;

    # return the kernel
    return krn;
    end;

#############################################################################
##
#V  AlgebraHomomorphismOps  . . . operations record for algebra homomorphisms
##
AlgebraHomomorphismOps := OperationsRecord( "AlgebraHomomorphismOps",
                                            MappingOps );

#############################################################################
##
#F  AlgebraHomomorphismOps.IsInjective(<hom>) . . . .  test if a homomorphism
#F                                                               is injective
##
AlgebraHomomorphismOps.IsInjective := function( hom )
    return IsTrivial( KernelAlgebraHomomorphism( hom ) );
    end;

#############################################################################
##
#F  AlgebraHomomorphismOps.IsSurjective(<hom>)  . . .  test if a homomorphism
#F                                                              is surjective
##
AlgebraHomomorphismOps.IsSurjective := function( hom )
    return Size( hom.range ) = Size( Image( hom ) );
    end;

#############################################################################
##
#F  AlgebraHomomorphismOps.IsAlgebraHomomorphism(<hom>) . . . . . . . always true
##
AlgebraHomomorphismOps.IsAlgebraHomomorphism := function( hom )
    return true;
    end;

#############################################################################
##
#F  AlgebraHomomorphismOps.\=(<hom1>,<hom2>) . . . comparison of homomorphisms
##
AlgebraHomomorphismOps.\= := function( hom1, hom2 )
    local   isEql;

    # if <hom1> is a homomorphisms
    if IsGeneralMapping( hom1 )  and IsHomomorphism( hom1 )  then

        # and if <hom2> is a homomorphisms
        if IsGeneralMapping( hom2 )  and IsHomomorphism( hom2 )  then

            # maybe the properties we already know determine the result
            if (IsBound(hom1.isInjective) and IsBound(hom2.isInjective)
                and hom1.isInjective <> hom2.isInjective)
            or (IsBound(hom1.isSurjective) and IsBound(hom2.isSurjective)
                and hom1.isSurjective <> hom2.isSurjective)
            then
                isEql := false;

            # otherwise we must really test the equality
            else
                isEql := hom1.source = hom2.source
                    and hom1.range  = hom2.range
                    and ForAll( hom1.source.generators,
                           elm -> Image(hom1,elm) = Image(hom2,elm) );

              # Check the image of the 'one' if one of the homomorphisms
              # is unital.
              if   IsUnitalAlgebraHomomorphism( hom1 ) then
                if not IsUnitalAlgebraHomomorphism( hom2 ) then
                  isEql:= isEql and
                     Image( hom2, One( hom1.source ) ) = One( hom1.range );
                fi;
              elif IsUnitalAlgebraHomomorphism( hom2 ) then
                isEql:= isEql and
                   Image( hom1, One( hom2.source ) ) = One( hom2.range );
              fi;
              
            fi;

        # a homomorphism and an object of another type are never equal
        else
            isEql := false;
        fi;

    # if <hom1> is not a homomorphism
    else

        # a homomorphism and an object of another type are never equal
        if IsHomomorphism( hom2 )  then
            isEql := false;

        # at least one argument must be a mapping
        else
            Error("panic, either <hom1> or <hom2> must be a mapping");
        fi;

    fi;

    # return the result
    return isEql;
    end;

#############################################################################
##
#F  AlgebraHomomorphismOps.\<(<hom1>,<hom2>) . . . comparison of homomorphisms
##
AlgebraHomomorphismOps.\< := function( hom1, hom2 )
    local   isLess,     # 'true' if <hom1> is less than <hom2>, result
            gens,       # smallest gens of the source of <hom1> and <hom2>
            i;          # loop variable

    # if <hom1> is a homomorphism
    if IsGeneralMapping( hom1 )  and IsHomomorphism( hom1 )  then

        # and if <hom2> is also a homomorphism
        if IsGeneralMapping( hom2 )  and IsHomomorphism( hom2 )  then

            # compare the sources and the ranges
            if hom1.source <> hom2.source  then
                isLess := hom1.source < hom2.source;
            elif hom1.range <> hom2.range  then
                isLess := hom1.range < hom2.range;

            # otherwise compare the images lexicographically
            else

                # find the first element where the images differ
                gens := SmallestGenerators( hom1.source );
                i := 1;
                while i <= Length( gens )
                  and hom1.operations.ImagesElm( hom1, gens[i] )
                    = hom2.operations.ImagesElm( hom2, gens[i] )  do
                    i := i + 1;
                od;

                # compare the image sets
                if i <= Length( gens )  then
                    isLess := hom1.operations.ImagesElm( hom1, gens[i] )
                            < hom2.operations.ImagesElm( hom2, gens[i] );
                else
                    isLess := false;
                fi;

            fi;

        # delegate the comparison of a homomorphism and a mapping
        elif IsGeneralMapping( hom2 )  then
            isLess := MappingOps.\<( hom1, hom2 );

        # a homomorphism and an object of another type are never equal
        else
            isLess := IsBool( hom2 ) or IsString( hom2 )
                   or IsList( hom2 ) or IsRec( hom2 );
        fi;

    # if <hom1> is a mapping (but not a homomorphism)
    elif IsGeneralMapping( hom1 )  then

        # delegate the comparison of a mapping and a homomorphism
        if IsGeneralMapping( hom2 )  and IsHomomorphism( hom2 )  then
            isLess := MappingOps.\<( hom1, hom2 );

        # at least one argument must be a homomorphism
        else
            Error("panic, either <hom1> or <hom2> must be a homomorphism");
        fi;

    # if <hom1> is not even a mapping
    else

        # an object of another type and a homormorphism are never equal
        if IsGeneralMapping( hom2 )  and IsHomomorphism( hom2 )  then
            isLess := not (IsBool( hom1 ) or IsString( hom1 )
                        or IsList( hom1 ) or IsRec( hom1 ));

        # at least one argument must be a mapping
        else
            Error("panic, either <hom1> or <hom2> must be a homorphism");
        fi;

    fi;

    # return the result
    return isLess;
    end;

#############################################################################
##
#F  AlgebraHomomorphismOps.ImagesSet(<hom>,<elms>)  images of set under a hom
##
AlgebraHomomorphismOps.ImagesSet := function( hom, elms )
    if IsAlgebra( elms )  and IsSubset( hom.source, elms )  then
        return Parent( hom.range ).operations.Subalgebra( Parent( hom.range ),
                        List( elms.generators, gen -> Image( hom, gen ) ) );
    else
        return MappingOps.ImagesSet( hom, elms );
    fi;
    end;

#############################################################################
##
#F  AlgebraHomomorphismOps.PreImagesElm(<hom>,<elm>)  . . .  preimage of an elm
##
AlgebraHomomorphismOps.PreImagesElm := function( hom, elm )
    return Coset( KernelAlgebraHomomorphism( hom ),
                  PreImagesRepresentative( hom, elm ) );
#T needs Coset of algebras!
end;

#############################################################################
##
#F  AlgebraHomomorphismOps.PreImagesSet(<hom>,<elm>)  . . . . preimage of a set
##
AlgebraHomomorphismOps.PreImagesSet := function( hom, elms )
    if IsAlgebra( elms )  and IsSubset( hom.range, elms )  then
        return Closure( KernelAlgebraHomomorphism( hom ),
                    Parent( hom.source ).operations.Subalgebra(
                        Parent( hom.source ),
                        List( elms.generators,
                            gen -> PreImagesRepresentative( hom, gen ) ) ) );
    else
        return MappingOps.PreImagesSet( hom, elms );
    fi;
end;


CompositionAlgebraHomomorphismOps := OperationsRecord(
                                      "CompositionAlgebraHomomorphismOps",
                                      CompositionMappingOps );

CompositionAlgebraHomomorphismOps.IsInjective :=
           AlgebraHomomorphismOps.IsInjective;

CompositionAlgebraHomomorphismOps.IsSurjective :=
           AlgebraHomomorphismOps.IsSurjective;

CompositionAlgebraHomomorphismOps.IsAlgebraHomomorphism :=
           AlgebraHomomorphismOps.IsAlgebraHomomorphism;

CompositionAlgebraHomomorphismOps.\= :=
           AlgebraHomomorphismOps.\=;

CompositionAlgebraHomomorphismOps.ImageElm := function( com, elm )
    return com.map1.operations.ImageElm( com.map1,
               com.map2.operations.ImageElm( com.map2,
                   elm ) );
    end;

CompositionAlgebraHomomorphismOps.PreImagesElm :=
           AlgebraHomomorphismOps.PreImagesElm;

CompositionAlgebraHomomorphismOps.KernelAlgebraHomomorphism := function( com )
    return com.map2.operations.PreImagesSet( com.map2,
               com.map1.operations.KernelAlgebraHomomorphism( com.map1 ) );
    end;

CompositionAlgebraHomomorphismOps.Print := function( com )
    Print( "(", com.map2, " * ", com.map1, ")" );
    end;

#############################################################################
##
#F  AlgebraHomomorphismOps.CompositionMapping(<map1>,<map2>)composition of homs
##
AlgebraHomomorphismOps.CompositionMapping := function( map1, map2 )
    local   com;        # composition of <map1> and <map2>, result

    # handle the composition of two homomorphisms
    if IsAlgebraHomomorphism( map1 )  and IsAlgebraHomomorphism( map2 )  then

        # make the mapping record
        com := rec();
        com.isGeneralMapping := true;
        com.domain          := Mappings;

        # enter the source and the range
        com.source          := map2.source;
        com.range           := map1.range;

        # maybe we know that the mapping is a function
        com.isMapping       := true;
        com.isHomomorphism  := true;

        # enter the identifying information
        com.map1            := map1;
        com.map2            := map2;

        # enter the operations record
        com.operations      := CompositionAlgebraHomomorphismOps;

    # handle other mappings
    else

        com := MappingOps.CompositionMapping( map1, map2 );

    fi;

    # return the composition
    return com;
end;


IdentityAlgebraHomomorphismOps := OperationsRecord(
                                           "IdentityAlgebraHomomorphismOps",
                                           MappingOps );

IdentityAlgebraHomomorphismOps.ImageElm := function( id, elm )
    return elm;
end;

IdentityAlgebraHomomorphismOps.ImagesElm := function( id, elm )
    return [ elm ];
end;

IdentityAlgebraHomomorphismOps.ImagesSet := function( id, elms )
    return elms;
end;

IdentityAlgebraHomomorphismOps.PreImageElm := function( id, elm )
    return elm;
end;

IdentityAlgebraHomomorphismOps.PreImagesElm := function( id, elm )
    return [ elm ];
end;

IdentityAlgebraHomomorphismOps.PreImagesSet := function( id, elms )
    return elms;
end;

IdentityAlgebraHomomorphismOps.\= := AlgebraHomomorphismOps.\=;

IdentityAlgebraHomomorphismOps.\< := AlgebraHomomorphismOps.\<;

IdentityAlgebraHomomorphismOps.CompositionMapping := function( map1, map2 )
    if IsBound( map1.isIdentity )  then
        return map2;
    elif IsBound( map2.isIdentity )  then
        return map1;
    else
        Error("panic, neither <map1> nor <map2> is the identity");
    fi;
end;

IdentityAlgebraHomomorphismOps.InverseMapping := function( id )
    return id;
end;

IdentityAlgebraHomomorphismOps.Print := function( id )
    Print("IdentityMapping( ",id.source," )");
end;

#############################################################################
##
#F  AlgebraOps.IdentityMapping(<G>) . . . . .  identity mapping on an algebra
##
AlgebraOps.IdentityMapping := function( G )
    local   id;         # identity mapping on <G>, result

    # make the mapping
    id := rec();
    id.isGeneralMapping := true;
    id.domain           := Mappings;

    # enter the identification
    id.isIdentity       := true;
    id.source           := G;
    id.range            := G;

    # enter usefull information
    id.isMapping        := true;
    id.isInjective      := true;
    id.isSurjective     := true;
    id.isBijection      := true;
    id.isHomomorphism   := true;
    id.isMonomorphism   := true;
    id.isEpimorphism    := true;
    id.isIsomorphism    := true;
    id.isEndomorphism   := true;
    id.isAutomorphism   := true;
    id.image            := G;
    id.preImage         := G;
    id.kernel           := TrivialSubalgebra( G );

    # enter the operations record
    id.operations       := IdentityAlgebraHomomorphismOps;

    # return the mapping
    return id;
end;

#############################################################################
##
#V  AlgebraHomomorphismByImagesOps
##
AlgebraHomomorphismByImagesOps := OperationsRecord(
                                        "AlgebraHomomorphismByImagesOps",
                                        AlgebraHomomorphismOps );

#############################################################################
##
#F  AlgebraHomomorphismByImages(<G>,<H>,<gens>,<imgs>)  . . . . . . create an
#F                  algebra homomorphism by the images of a generating system
##
AlgebraHomomorphismByImages := function( G, H, gens, imgs )
    local   hom;        # homomorphism from <G> to <H>, result

    # check the arguments
    if not IsAlgebra( G )  then
        Error("<G> must be a algebra");
    elif not IsAlgebra( H )  then
        Error("<H> must be a algebra");
    elif not IsEqualSet(imgs,H.generators) and not IsSubset(H,Set(imgs)) then
        Error("<imgs> must lie in <H>");
    elif Length( gens ) <> Length( imgs )  then
        Error("<gens> and <imgs> must have the same length");
    fi;

    # dispatch to the appropriate function
    hom := G.operations.AlgebraHomomorphismByImages( G, H, gens, imgs );

    # return the homomorphism
    return hom;
end;

AlgebraOps.AlgebraHomomorphismByImages := function( G, H, gens, imgs )
    local   hom;        # homomorphism from <G> to <H>, result

    # make the homomorphism
    hom := rec( );
    hom.isGeneralMapping := true;
    hom.domain          := Mappings;

    # enter the identifying information
    hom.source          := G;
    hom.range           := H;
    hom.generators      := gens;
    hom.genimages       := imgs;

    # enter useful information (precious little)
    if IsEqualSet( gens, G.generators )  then
        hom.preImage    := G;
    else
        hom.preImage    := Parent(G).operations.Subalgebra( Parent(G), gens );
    fi;
    if IsEqualSet( imgs, H.generators )  then
        hom.image       := H;
    else
        hom.image       := Parent(H).operations.Subalgebra( Parent(H), imgs );
    fi;

    # enter the operations record
    hom.operations      := AlgebraHomomorphismByImagesOps;

    # return the homomorphism
    return hom;
end;

AlgebraHomomorphismByImagesOps.MakeMapping := function( hom )
    local   elms,       # elements of subalgebra of '<hom>.source'
            elmr,       # representatives of <elms> in '<hom>.elements'
            imgs,       # elements of subalgebra of '<hom>.range'
            imgr,       # representatives of <imgs> in '<hom>.images'
            rep,        # one new element of <elmr> or <imgr>
            i, j, k;    # loop variables

    # if necessary compute the mapping with a Dimino algorithm
    if not IsBound( hom.elements )  then
        hom.elements := [ hom.source.identity ];
        hom.images   := [ hom.range.identity ];
        for i  in [ 1 .. Length( hom.generators ) ]  do
            elms := ShallowCopy( hom.elements );
            elmr := [ hom.source.identity ];
            imgs := ShallowCopy( hom.images );
            imgr := [ hom.range.identity ];
            j := 1;
            while j <= Length( elmr )  do
                for k  in [ 1 .. i ]  do
                    rep := elmr[j] * hom.generators[k];
                    if not rep in hom.elements  then
                        Append( hom.elements, elms * rep );
                        Add( elmr, rep );
                        rep := imgr[j] * hom.genimages[k];
                        Append( hom.images, imgs * rep );
                        Add( imgr, rep );
                    fi;
                od;
                j := j + 1;
            od;
            SortParallel( hom.elements, hom.images );
            IsSet( hom.elements );      # give a hint that this is a set
        od;
    fi;
end;

AlgebraHomomorphismByImagesOps.CoKernel := function( hom )
    local   C,          # co kernel of <hom>, result
            gen,        # one generator of <C>
            i, k;       # loop variables

    # make sure we have the mapping
    if not IsBound( hom.elements )  then
        hom.operations.MakeMapping( hom );
    fi;

    # start with the trivial co kernel
    C := TrivialSubalgebra( Parent( hom.range ) );

    # for each element of the source and each generator of the source
    for i  in [ 1 .. Length( hom.elements ) ]  do
        for k  in [ 1 .. Length( hom.generators ) ]  do

            # the co kernel must contain the corresponding Schreier generator
            gen := hom.images[i] * hom.genimages[k]
                 / hom.images[ Position( hom.elements,
                                         hom.elements[i]*hom.generators[k])];
            C := Closure( C, gen );

        od;
    od;

    # return the co kernel
    return C;
end;

AlgebraHomomorphismByImagesOps.IsMapping := function( hom )
    if not IsBound( hom.coKernel )  then
        hom.coKernel := hom.operations.CoKernel( hom );
    fi;
    return hom.source = hom.preImage
       and IsTrivial( hom.coKernel );
end;

AlgebraHomomorphismByImagesOps.IsAlgebraHomomorphism := function( hom )
    return IsMapping( hom );
end;

AlgebraHomomorphismByImagesOps.ImageElm := function( hom, elm )
    if not IsMapping( hom )  then
        Error("<hom> must be a single valued mapping");
    fi;
    if not IsBound( hom.elements )  then
        hom.operations.MakeMapping( hom );
    fi;
    return hom.images[ Position( hom.elements, elm ) ];
end;

AlgebraHomomorphismByImagesOps.ImagesElm := function( hom, elm )
    local   p;
    if not IsBound( hom.elements )  then
        hom.operations.MakeMapping( hom );
    fi;
    if not IsBound( hom.coKernel )  then
        hom.coKernel := hom.operations.CoKernel( hom );
    fi;
    p := Position( hom.elements, elm );
    if p <> false  then
        return hom.coKernel * hom.images[ p ];
    else
        return [];
    fi;
end;

AlgebraHomomorphismByImagesOps.ImagesSet := function( hom, elms )
    if IsAlgebra( elms )  and IsSubset( hom.source, elms )  then
        if hom.preImage <> hom.source  then
            elms := Intersection( hom.preImage, elms );
        fi;
        if not IsBound( hom.coKernel )  then
            hom.coKernel := hom.operations.CoKernel( hom );
        fi;
        return Closure( hom.coKernel,
                        Parent( hom.range ).operations.Subalgebra(
                                Parent( hom.range ),
                                List( elms.generators,
                                      gen -> ImagesRepresentative( hom,
                                                                   gen ) )));
    else
        return AlgebraHomomorphismOps.ImagesSet( hom, elms );
    fi;
end;

AlgebraHomomorphismByImagesOps.ImagesRepresentative := function( hom, elm )
    local   p;
    if not IsBound( hom.elements )  then
        hom.operations.MakeMapping( hom );
    fi;
    p := Position( hom.elements, elm );
    if p <> false  then
        return hom.images[ p ];
    else
        Error("<elm> has no image under <hom>");
    fi;
end;

AlgebraHomomorphismByImagesOps.PreImagesRepresentative := function( hom, elm )
    if IsBound( hom.images )  and elm in hom.images  then
        return hom.elements[ Position( hom.images, elm ) ];
    else
        return ImagesRepresentative( InverseMapping( hom ), elm );
    fi;
end;

AlgebraHomomorphismByImagesOps.KernelAlgebraHomomorphism := function( hom )
    local   krn,        # kernel of <hom>, result
            inv;        # inverse mapping of <hom>

    # compute the kernel as the co kernel of the inverse mapping
    inv := InverseMapping( hom );
    krn := inv.operations.CoKernel( inv );

    # return the kernel
    return krn;
end;

AlgebraHomomorphismByImagesOps.CompositionMapping := function( hom1, hom2 )
    local   prd;        # product of <hom1> and <hom2>, result

    # product of a homomorphism by generator images
    if IsHomomorphism( hom1 )  and IsBound( hom1.genimages )  then

        # with another homomorphism by generator images
        if IsHomomorphism( hom2 )  and IsBound( hom2.genimages )  then

            # make sure we have all the images of both homomorphisms
            if not IsBound( hom1.images )  then
                hom1.operations.MakeMapping( hom1 );
            fi;
            if not IsBound( hom2.images )  then
                hom2.operations.MakeMapping( hom2 );
            fi;

            # make the homomorphism
            prd := rec( );
            prd.isGeneralMapping := true;
            prd.domain          := Mappings;

            # enter the identifying information
            prd.source          := hom2.source;
            prd.range           := hom1.range;
            prd.generators := ShallowCopy( hom2.generators );
            prd.genimages := List( [ 1 .. Length( prd.generators ) ],
                                i -> hom1.images[
                                        Position( hom1.elements,
                                                  hom2.genimages[i] ) ] );

            # enter useful information
            prd.isMapping       := true;
            prd.isHomomorphism  := true;
            prd.preImage        := hom2.source;
            prd.elements := ShallowCopy( hom2.elements );
            prd.images := List( [ 1 .. Length( prd.elements ) ],
                                i -> hom1.images[
                                        Position( hom1.elements,
                                                  hom2.images[i] ) ] );

            # enter the operations record
            prd.operations      := AlgebraHomomorphismByImagesOps;

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

AlgebraHomomorphismByImagesOps.InverseMapping := function( hom )
    return AlgebraHomomorphismByImages( hom.range,
                                      hom.source,
                                      hom.genimages,
                                      hom.generators );
end;

AlgebraHomomorphismByImagesOps.Print := function( hom )
    Print( "AlgebraHomomorphismByImages( ",
           hom.source, ", ", hom.range, ", ",
           hom.generators, ", ", hom.genimages, " )" );
end;

#############################################################################
##
#V  UnitalAlgebraHomomorphismOps
##
UnitalAlgebraHomomorphismOps :=
             OperationsRecord( "UnitalAlgebraHomomorphismOps",
                               AlgebraHomomorphismOps );

#############################################################################
##
#F  UnitalAlgebraHomomorphismOps.ImagesSet(<hom>,<elms>)
##
UnitalAlgebraHomomorphismOps.ImagesSet := function( hom, elms )
    if IsUnitalAlgebra( elms )  and IsSubset( hom.source, elms )  then
        return Parent( hom.range ).operations.UnitalSubalgebra(
                        Parent( hom.range ),
                        List( elms.generators, gen -> Image( hom, gen ) ) );
    else
      return MappingOps.ImagesSet( hom, elms );
    fi;
    end;

#############################################################################
##
#F  UnitalAlgebraHomomorphismOps.PreImagesSet(<hom>,<elm>)
##
UnitalAlgebraHomomorphismOps.PreImagesSet := function( hom, elms )
    if IsAlgebra( elms )  and IsSubset( hom.range, elms )  then
        return Closure( KernelAlgebraHomomorphism( hom ),
                    Parent( hom.source ).operations.UnitalSubalgebra(
                        Parent( hom.source ),
                        List( elms.generators,
                            gen -> PreImagesRepresentative( hom, gen ) ) ) );
    else
        return MappingOps.PreImagesSet( hom, elms );
    fi;
end;

#############################################################################
##
#V  OperationHomomorphismAlgebraOps
##
OperationHomomorphismAlgebraOps := OperationsRecord(
                                     "OperationHomomorphismAlgebraOps",
                                     AlgebraHomomorphismOps );

#############################################################################
##
#F  OperationHomomorphismAlgebraOps.Print( <hom> )
##
OperationHomomorphismAlgebraOps.Print := function ( hom )
    Print( "OperationHomomorphism( ", hom.source, ", ", hom.range, " )" );
    end;

#############################################################################
##
#F  OperationHomomorphismAlgebraOps.ImageElm( <hom>, <elm> )
##
OperationHomomorphismAlgebraOps.ImageElm := function ( hom, elm )
    local expr;
    if Length( hom.source.generators ) = 0 then

      # 'elm' is necessarily the zero element of the source
      return Zero( hom.range );

    else
      expr:= hom.source.operations.AbstractExpression( hom.source, elm );
      return MappedExpression( expr.expression, expr.generators,
                               hom.genimages );
    fi;
    end;

#############################################################################
##
#F  OperationHomomorphismAlgebraOps.ImagesElm( <hom>, <elm> )
##
OperationHomomorphismAlgebraOps.ImagesElm := function ( hom, elm )
    return [ hom.operations.ImageElm( hom, elm ) ];
    end;

#############################################################################
##
#F  OperationHomomorphismAlgebraOps.ImagesRepresentative( <hom>, <elm> )
##
OperationHomomorphismAlgebraOps.ImagesRepresentative := function ( hom, elm )
    return hom.operations.ImageElm( hom, elm );
    end;

#############################################################################
##
#F  OperationHomomorphismAlgebraOps.PreImagesRepresentative( <hom>, <elm> )
##
OperationHomomorphismAlgebraOps.PreImagesRepresentative := function( hom,
                                                                     elm )
    local expr;

    if Length( hom.range.generators ) = 0 then

      # 'elm' is necessarily the zero element of the range.
      return Zero( hom.source );

    else

      expr:= hom.range.operations.AbstractExpression( hom.range, elm );
      return MappedExpression( expr.expression, expr.generators,
                               hom.genpreimages );
    fi;
    end;

#############################################################################
##
#V  OperationHomomorphismUnitalAlgebraOps
##
##  operations record for operation homomorphisms of unital algebras, that
##  is, also the homomorphism is unital.
##  Note that this implies we do not need to print the homomorphism as
##  unital one.
##
OperationHomomorphismUnitalAlgebraOps := OperationsRecord(
                                     "OperationHomomorphismUnitalAlgebraOps",
                                     UnitalAlgebraHomomorphismOps );

#############################################################################
##
#F  OperationHomomorphismUnitalAlgebraOps.Print( <hom> )
##
OperationHomomorphismUnitalAlgebraOps.Print := 
                                       OperationHomomorphismAlgebraOps.Print;

#############################################################################
##
#F  OperationHomomorphismUnitalAlgebraOps.ImageElm( <hom>, <elm> )
##
OperationHomomorphismUnitalAlgebraOps.ImageElm := function ( hom, elm )
    local expr;
    expr:= hom.source.operations.AbstractExpression( hom.source, elm );
    return MappedExpression( expr.expression, expr.generators,
                             hom.genimages );
    end;

#############################################################################
##
#F  OperationHomomorphismAlgebraOps.ImagesElm( <hom>, <elm> )
##
OperationHomomorphismAlgebraOps.ImagesElm := function ( hom, elm )
    return [ hom.operations.ImageElm( hom, elm ) ];
    end;

#############################################################################
##
#F  OperationHomomorphismUnitalAlgebraOps.ImagesRepresentative( <hom>,<elm> )
##
OperationHomomorphismUnitalAlgebraOps.ImagesRepresentative :=
                                                         function( hom, elm )
    return hom.operations.ImageElm( hom, elm );
    end;

#############################################################################
##
#F  OperationHomomorphismUnitalAlgebraOps.PreImagesRepresentative
#F                                                           ( <hom>, <elm> )
##
OperationHomomorphismUnitalAlgebraOps.PreImagesRepresentative :=
                                                         function( hom, elm )
    local expr;

    expr:= hom.range.operations.AbstractExpression( hom.range, elm );
    return MappedExpression( expr.expression, expr.generators,
                             hom.genpreimages );
    end;

#############################################################################
##
#E  Emacs . . . . . . . . . . . . . . . . . . . . . . . local emacs variables
##
##  Local Variables:
##  mode:               outline
##  outline-regexp:     "#F\\|#V\\|#E"
##  fill-column:        73
##  fill-prefix:        "##  "
##  eval:               (hide-body)
##  End:
##
