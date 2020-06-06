#############################################################################
##
#A  grphomom.g                  GAP library                      Frank Celler
#A                                                         & Martin Schoenert
##
#A  @(#)$Id: grphomom.g,v 3.33.1.7 1996/06/11 14:50:50 mschoene Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains dispatcher and default functions for grp homomorphism.
##
#H  $Log: grphomom.g,v $
#H  Revision 3.33.1.7  1996/06/11  14:50:50  mschoene
#H  fixed '.preimage' to '.preImage'
#H
#H  Revision 3.33.1.6  1996/06/11  08:48:43  htheisse
#H  'GHO.ImagesSet' now looks at 'isMapping' before calling 'CoKernel'
#H
#H  Revision 3.33.1.5  1996/06/10  13:33:40  mschoene
#H  fixed 'GHO.ImagesSet' and 'GHO.PreImagesSet' to intersect
#H
#H  Revision 3.33.1.4  1995/12/11  11:03:19  mschoene
#H  changed 'CompositionGH' and 'IdentityGH' to inherit from 'GHOps'
#H
#H  Revision 3.33.1.3  1995/12/08  10:39:26  mschoene
#H  added 'GroupHomomorphismByFunction'
#H
#H  Revision 3.33.1.2  1995/07/27  08:03:12  ahulpke
#H  Changed 'Copy' of operations records to 'OperationsRecord'
#H
#H  Revision 3.33.1.1  1994/10/26  16:30:08  ahulpke
#H  Added Auto- and Isomorphism search
#H
#H  Revision 3.33  1994/06/30  17:44:44  sam
#H  fixed calls of 'IsEqualSet'
#H
#H  Revision 3.32  1994/06/22  10:18:27  sam
#H  made call of 'GroupHomomorphismByImages' cheaper
#H
#H  Revision 3.31  1994/06/21  08:41:25  ahulpke
#H  Fixed error when multiplying group homomorphisms with and without .images
#H  entry
#H
#H  Revision 3.30  1994/02/02  10:30:23  sam
#H  moved 'KernelGroupHomomorphism' to 'dispatch.g'
#H
#H  Revision 3.29  1993/02/09  14:25:55  martin
#H  made undefined globals local
#H
#H  Revision 3.28  1993/01/27  11:27:14  martin
#H  fixed 'IsGroupHomomorphism' to return 'false' for field homomorphisms
#H
#H  Revision 3.27  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.26  1992/06/04  12:50:57  martin
#H  changed 'GroupHomomorphismsByImages' to accept empty lists
#H
#H  Revision 3.25  1992/06/03  17:26:20  martin
#H  improved 'GroupHomomorphismByImages'
#H
#H  Revision 3.24  1992/03/31  09:13:07  martin
#H  changed 'ConjugationGroupHomomorphism' and added 'InnerAutomorphism'
#H
#H  Revision 3.23  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.22  1992/02/21  13:33:31  martin
#H  fixed a minor bug in 'GroupHomomorphismByImages'
#H
#H  Revision 3.21  1992/02/11  12:44:04  martin
#H  added 'SmallestGenerators'
#H
#H  Revision 3.20  1992/02/10  15:14:35  martin
#H  added the domain 'Mappings'
#H
#H  Revision 3.19  1992/02/10  15:04:48  martin
#H  fixed comparison of homomorphisms to check for mapping first
#H
#H  Revision 3.18  1992/02/07  10:39:36  martin
#H  improved the homomorphism test slightly
#H
#H  Revision 3.17  1992/01/31  12:31:31  martin
#H  added 'GroupHomomorphismByImagesOps.PreImagesRepresentative'
#H
#H  Revision 3.16  1992/01/20  13:51:46  martin
#H  fixed 'GroupHomomorphismByImagesOps.CompositionMapping' argument order
#H
#H  Revision 3.15  1992/01/20  09:52:29  martin
#H  improved the argument check in 'GroupHomomorphismsByImages'
#H
#H  Revision 3.14  1992/01/14  16:48:03  martin
#H  fixed a minor problem in 'GroupHomomorphismByImages'
#H
#H  Revision 3.13  1992/01/07  12:44:14  martin
#H  changed everything
#H
#H  Revision 3.12  1991/11/07  09:36:15  fceller
#H  More new names because of new domain concept.
#H
#H  Revision 3.11  1991/09/30  10:53:45  fceller
#H  New Parent Group and Subgroup concept.
#H
#H  Revision 3.10  1991/09/25  13:02:28  fceller
#H  Add 'HomomorphicPreImage'.
#H
#H  Revision 3.9  1991/09/24  13:52:34  fceller
#H  '~.inverseMapping' is now installed for every homomorphism.
#H
#H  Revision 3.8  1991/09/19  07:55:04  fceller
#H  Homomorphism printing improved.
#H
#H  Revision 3.7  1991/09/18  13:58:19  fceller
#H  Fixed a minor bug in '='
#H
#H  Revision 3.6  1991/09/11  09:03:27  fceller
#H  Homomorphism '/' now allows lists as first argument.
#H
#H  Revision 3.5  1991/09/11  08:29:00  fceller
#H  Cosets improved
#H
#H  Revision 3.4  1991/09/09  07:51:36  fceller
#H  'SomethingAgGroup' is now 'AgGroupOps.Something'
#H
#H  Revision 3.3  1991/09/04  11:25:45  fceller
#H  'IsElement' is completely replaced by 'in'.
#H
#H  Revision 3.2  1991/09/04  10:35:25  fceller
#H  Cosets have moved from "group.g" to here
#H
#H  Revision 3.1  1991/09/04  10:14:25  fceller
#H  Initial release under RCS
#H
##


#############################################################################
##
#F  IsGroupHomomorphism(<fun>)  .  test if a function is a group homomorphism
##
IsGroupHomomorphism := function ( fun )
    if not IsBound( fun.isGroupHomomorphism )  then
        fun.isGroupHomomorphism := fun.operations.IsGroupHomomorphism( fun );
    fi;
    return fun.isGroupHomomorphism;
end;


#############################################################################
##
#F  GroupOps.IsHomomorphism(<fun>) test if a function is a group homomorphism
##
##  kann weg!
##
GroupOps.IsHomomorphism := IsGroupHomomorphism;


#############################################################################
##
#F  MappingOps.IsGroupHomomorphism(<fun>) . . . test if a function is a group
#F                                                               homomorphism
##
MappingOps.IsGroupHomomorphism := function ( fun )
    local   isHom;      # 'true' if <fun> is a homomorphism, result

    # check that <fun> is a function
    if not IsMapping( fun )  then
        Error("<fun> must be a single valued mapping");
    fi;

    # test that source and range are groups
    if not IsGroup( fun.source )  then
        return false;
    fi;
    if not IsGroup( fun.range )  then
        return false;
    fi;

    # test the linearity explicitely if the source is finite
    if IsFinite( fun.source )  then
        isHom := ForAll( Elements(fun.source),
                        x -> ForAll( fun.source.generators,
                                  y -> Image( fun, x * y )
                                     = Image( fun, x ) * Image( fun, y ) ) );

    # otherwise give up
    else
        Error("sorry, can not test if <fun> is a hom., infinite source");
    fi;

    # return the result
    return isHom;
end;


#############################################################################
##
#F  GroupOps.Kernel(<fun>)  . . . . . . . . .  kernel of a group homomorphism
##
GroupOps.Kernel := KernelGroupHomomorphism;


#############################################################################
##
#F  MappingOps.KernelGroupHomomorphism(<hom>)  kernel of a group homomorphism
##
MappingOps.KernelGroupHomomorphism := function ( hom )
    local   krn,        # kernel of <hom>, result
            g;          # random element of source

    # check that <hom> is a homomorphism
    if not IsHomomorphism(hom)  then
        Error("<hom> must be a homomorphism");
    fi;
    if not IsFinite( hom.source )  then
        Error("sorry, cannot compute kernel of <hom>, infinite source");
    fi;

    #N  16-Dec-91 martin this used to be
    #N  krn := AsSubgroup( Parent(hom.source),
    #N              Filtered( Elements(hom.source),
    #N                  elm -> Image(hom,elm) = hom.range.identity ) );

    # compute the kernel by trying random elements
    krn := TrivialSubgroup( Parent( hom.source ) );
    while Size( hom.source ) / Size( krn ) <> Size( Image( hom ) )  do
        g := Random( hom.source );
        if hom.operations.ImageElm( hom, g ) = hom.range.identity
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
#F  GroupHomomorphismOps  . . . . . operations record for group homomorphisms
##
GroupHomomorphismOps := OperationsRecord(
    "GroupHomomorphismOps",
    MappingOps );


#############################################################################
##
#F  GroupHomomorphismOps.IsInjective(<hom>) . . . . .  test if a homomorphism
#F                                                               is injective
##
GroupHomomorphismOps.IsInjective := function ( hom )
    return IsTrivial( Kernel( hom ) );
end;


#############################################################################
##
#F  GroupHomomorphismOps.IsSurjective(<hom>)  . . . .  test if a homomorphism
#F                                                              is surjective
##
GroupHomomorphismOps.IsSurjective := function ( hom )
    local image;
    image := Image( hom );
    if IsBound( hom.range.size ) then
        return hom.range.size = Size( image );
    else
        return ForAll( hom.range.generators, x -> x in image );
    fi;
end;


#############################################################################
##
#F  GroupHomomorphismOps.IsHomomorphism(<hom>)
##
GroupHomomorphismOps.IsHomomorphism := function ( hom )
    return IsGroupHomomorphism( hom );
end;


#############################################################################
##
#F  GroupHomomorphismOps.IsGroupHomomorphism(<hom>) . . . . . . . always true
##
GroupHomomorphismOps.IsGroupHomomorphism := function ( hom )
    return true;
end;


#############################################################################
##
#F  GroupHomomorphismOps.\=(<hom1>,<hom2>) . . . comparison of homomorphisms
##
GroupHomomorphismOps.\= := function ( hom1, hom2 )
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
#F  GroupHomomorphismOps.\<(<hom1>,<hom2>) . . . comparison of homomorphisms
##
GroupHomomorphismOps.\< := function ( hom1, hom2 )
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
#F  GroupHomomorphismOps.ImagesSet(<hom>,<elms>)  images of a set under a hom
##
GroupHomomorphismOps.ImagesSet := function ( hom, elms )
    if IsGroup( elms )  and IsSubset( hom.source, elms )  then
	if PreImage(hom) <> hom.source  then
            elms := Intersection( PreImage(hom), elms );
        fi;
        if not IsBound( hom.coKernel )  then
            if IsBound( hom.isMapping ) and hom.isMapping  then
                hom.coKernel := TrivialSubgroup( hom.range );
            else
                hom.coKernel := hom.operations.CoKernel( hom );
            fi;
        fi;
        return Closure( hom.coKernel,
                    Parent( hom.range ).operations.Subgroup(
                        Parent( hom.range ),
                        List( elms.generators,
                            gen -> ImagesRepresentative( hom, gen ) ) ) );
    else
        return MappingOps.ImagesSet( hom, elms );
    fi;
end;


#############################################################################
##
#F  GroupHomomorphismOps.PreImagesElm(<hom>,<elm>)  . . .  preimage of an elm
##
GroupHomomorphismOps.PreImagesElm := function ( hom, elm )
    return Coset( KernelGroupHomomorphism( hom ),
                  PreImagesRepresentative( hom, elm ) );
end;


#############################################################################
##
#F  GroupHomomorphismOps.PreImagesSet(<hom>,<elm>)  . . . . preimage of a set
##
GroupHomomorphismOps.PreImagesSet := function ( hom, elms )
    if IsGroup( elms )  and IsSubset( hom.range, elms )  then
        if Image(hom) <> hom.range  then
            elms := Intersection( Image(hom), elms );
        fi;
        return Closure( KernelGroupHomomorphism( hom ),
                    Parent( hom.source ).operations.Subgroup(
                        Parent( hom.source ),
                        List( elms.generators,
                            gen -> PreImagesRepresentative( hom, gen ) ) ) );
    else
        return MappingOps.PreImagesSet( hom, elms );
    fi;
end;


#############################################################################
##
#F  GroupHomomorphismOps.CompositionMapping(<map1>,<map2>)composition of homs
##
GroupHomomorphismOps.CompositionMapping := function ( map1, map2 )
    local   com;        # composition of <map1> and <map2>, result

    # handle the composition of two homomorphisms
    if IsGroupHomomorphism( map1 )  and IsGroupHomomorphism( map2 )  then

        # make the mapping record
        com := rec();
        com.isGeneralMapping := true;
        com.domain           := Mappings;

        # enter the source and the range
        com.source           := map2.source;
        com.range            := map1.range;

        # maybe we know that the mapping is a function
        com.isMapping        := true;
        com.isHomomorphism   := true;

        # enter the identifying information
        com.map1             := map1;
        com.map2             := map2;

        # enter the operations record
        com.operations       := CompositionGroupHomomorphismOps;

    # handle other mappings
    else

        com := MappingOps.CompositionMapping( map1, map2 );

    fi;

    # return the composition
    return com;
end;

CompositionGroupHomomorphismOps := OperationsRecord(
    "CompositionGroupHomomorphismOps",
    GroupHomomorphismOps );

CompositionGroupHomomorphismOps.IsMapping := function ( com )
    if     IsMapping( com.map1 )
       and IsMapping( com.map2 )
    then
        return true;
    else
        return MappingOps.IsMapping( com );
    fi;
end;

CompositionGroupHomomorphismOps.IsInjective := function ( com )
    if      IsMapping( com.map1 )  and IsInjective( com.map1 )
        and IsMapping( com.map2 )  and IsInjective( com.map2 )
    then
        return true;
    else
        return GroupHomomorphismOps.IsInjective( com );
    fi;
end;

CompositionGroupHomomorphismOps.IsSurjective := function ( com )
    if      IsMapping( com.map1 )  and IsSurjective( com.map1 )
        and IsMapping( com.map2 )  and IsSurjective( com.map2 )
    then
        return true;
    else
        return GroupHomomorphismOps.IsSurjective( com );
    fi;
end;

CompositionGroupHomomorphismOps.ImagesElm := function ( com, elm )
    return com.map1.operations.ImagesSet( com.map1,
               com.map2.operations.ImagesElm( com.map2,
                   elm ) );
end;

CompositionGroupHomomorphismOps.ImagesRepresentative
  := function ( com, elm )
    return com.map1.operations.ImagesRepresentative( com.map1,
               com.map2.operations.ImagesRepresentative( com.map2,
                   elm ) );
end;

CompositionGroupHomomorphismOps.ImagesSet := function ( com, elms )
    return com.map1.operations.ImagesSet( com.map1,
               com.map2.operations.ImagesSet( com.map2,
                   elms ) );
end;

CompositionGroupHomomorphismOps.PreImagesElm := function ( com, elm )
    return com.map2.operations.PreImagesSet( com.map2,
               com.map1.operations.PreImagesElm( com.map1,
                   elm ) );
end;

CompositionGroupHomomorphismOps.PreImagesRepresentative
  := function ( com, elm )
    return com.map2.operations.PreImagesRepresentative( com.map2,
               com.map1.operations.PreImagesRepresentative( com.map1,
                   elm ) );
end;

CompositionGroupHomomorphismOps.PreImagesSet := function ( com, elms )
    return com.map2.operations.PreImagesSet( com.map2,
               com.map1.operations.PreImagesSet( com.map1,
                   elms ) );
end;

CompositionGroupHomomorphismOps.InverseMapping := function ( com )
    return CompositionMapping(
                   InverseMapping( com.map2 ),
                   InverseMapping( com.map1 ) );
end;

CompositionGroupHomomorphismOps.KernelGroupHomomorphism := function ( com )
    return com.map2.operations.PreImagesSet( com.map2,
               com.map1.operations.KernelGroupHomomorphism( com.map1 ) );
end;

CompositionGroupHomomorphismOps.Print := function ( com )
    Print( "(", com.map2, " * ", com.map1, ")" );
end;


#############################################################################
##
#F  GroupOps.IdentityMapping(<G>) . . . . . . . . identity mapping on a group
##
GroupOps.IdentityMapping := function ( G )
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
    id.kernel           := TrivialSubgroup( G );

    # enter the operations record
    id.operations       := IdentityGroupHomomorphismOps;

    # return the mapping
    return id;
end;

IdentityGroupHomomorphismOps := OperationsRecord(
    "IdentityGroupHomomorphismOps",
    GroupHomomorphismOps );

IdentityGroupHomomorphismOps.ImageElm := function ( id, elm )
    return elm;
end;

IdentityGroupHomomorphismOps.ImagesElm := function ( id, elm )
    return [ elm ];
end;

IdentityGroupHomomorphismOps.ImagesRepresentative
  := function ( id, elm )
    return elm;
end;

IdentityGroupHomomorphismOps.ImagesSet := function ( id, elms )
    return elms;
end;

IdentityGroupHomomorphismOps.PreImageElm := function ( id, elm )
    return elm;
end;

IdentityGroupHomomorphismOps.PreImagesElm := function ( id, elm )
    return [ elm ];
end;

IdentityGroupHomomorphismOps.PreImagesRepresentative
  := function ( id, elm )
    return elm;
end;

IdentityGroupHomomorphismOps.PreImagesSet := function ( id, elms )
    return elms;
end;

IdentityGroupHomomorphismOps.CompositionMapping := function ( map1, map2 )
    if IsBound( map1.isIdentity )  then
        return map2;
    elif IsBound( map2.isIdentity )  then
        return map1;
    else
        Error("panic, neither <map1> nor <map2> is the identity");
    fi;
end;

IdentityGroupHomomorphismOps.InverseMapping := function ( id )
    return id;
end;

IdentityGroupHomomorphismOps.KernelGroupHomomorphism := function ( id )
    return TrivialSubgroup( id.source );
end;

IdentityGroupHomomorphismOps.Print := function ( id )
    Print("IdentityMapping( ",id.source," )");
end;


#############################################################################
##
#F  ConjugationGroupHomomorphism(<G>,<H>,<g>) . . . group homomorphism taking
#F                                                each element to a conjugate
##
ConjugationGroupHomomorphism := function ( G, H, g )
    local   cnj;        # conjugation homomorphism, result

    # check the arguments
    if not IsGroup( G )  then
        Error("<G> must be a group");
    fi;
    if not IsGroup( H )  then
        Error("<H> must be a group");
    fi;
    if not g in Parent( G, H )  then
        Error("<g> must lie in the common parent group of <G> and <H>");
    fi;
    if not ForAll( G.generators, gen -> gen ^ g in H )  then
        Error("<g> must map <G> into <H>");
    fi;

    # make the homomorphism
    cnj := rec();
    cnj.isGeneralMapping := true;
    cnj.domain           := Mappings;

    # enter the identifying information
    cnj.isConjugation    := true;
    cnj.source           := G;
    cnj.range            := H;
    cnj.element          := g;

    # enter usefull information
    cnj.isMapping        := true;
    cnj.isInjective      := true;
    cnj.isHomomorphism   := true;
    cnj.isMonomorphism   := true;
    cnj.isEndomorphism   := G = H;
    cnj.preImage         := G;
    cnj.kernel           := TrivialSubgroup( G );

    # enter the operations record
    cnj.operations       := ConjugationGroupHomomorphismOps;

    # return the homomorphism
    return cnj;
end;

ConjugationGroupHomomorphismOps := OperationsRecord(
    "ConjugationGroupHomomorphismOps",
    GroupHomomorphismOps );

ConjugationGroupHomomorphismOps.ImageElm := function ( cnj, elm )
    return elm ^ (cnj.element);
end;

ConjugationGroupHomomorphismOps.ImagesElm := function ( cnj, elm )
    return [ elm ^ (cnj.element) ];
end;

ConjugationGroupHomomorphismOps.ImagesRepresentative
  := function ( cnj, elm )
    return elm ^ (cnj.element);
end;

ConjugationGroupHomomorphismOps.ImagesSet := function ( cnj, elms )
    if IsGroup( elms )  and IsSubset( cnj.source, elms )  then
        return elms ^ (cnj.element);
    else
        return GroupHomomorphismOps.ImagesSet( cnj, elms );
    fi;
end;

ConjugationGroupHomomorphismOps.PreImageElm := function ( cnj, elm )
    if not IsBound( cnj.inverseElement )  then
        cnj.inverseElement := cnj.element ^ -1;
    fi;
    return elm ^ (cnj.inverseElement);
end;

ConjugationGroupHomomorphismOps.PreImagesElm := function ( cnj, elm )
    if not IsBound( cnj.inverseElement )  then
        cnj.inverseElement := cnj.element ^ -1;
    fi;
    return [ elm ^ (cnj.inverseElement) ];
end;

ConjugationGroupHomomorphismOps.PreImagesRepresentative
  := function ( cnj, elm )
    if not IsBound( cnj.inverseElement )  then
        cnj.inverseElement := cnj.element ^ -1;
    fi;
    return elm ^ (cnj.inverseElement);
end;

ConjugationGroupHomomorphismOps.PreImagesSet := function ( cnj, elms )
    if IsGroup( elms )  and IsSubset( cnj.source, elms )  then
        if not IsBound( cnj.inverseElement )  then
            cnj.inverseElement := cnj.element ^ -1;
        fi;
        return elms ^ (cnj.inverseElement);
    else
        return GroupHomomorphismOps.ImagesSet( cnj, elms );
    fi;
end;

ConjugationGroupHomomorphismOps.CompositionMapping := function ( cnj1, cnj2 )
    if      IsBound( cnj1.isConjugation )  and cnj1.isConjugation
        and IsBound( cnj2.isConjugation )  and cnj2.isConjugation
        and IsSubgroup( cnj1.source, cnj2.range )
    then
        return ConjugationGroupHomomorphism( cnj2.source, cnj1.range,
                                             cnj2.element * cnj1.element );
    else
        return GroupHomomorphismOps.CompositionMapping( cnj1, cnj2 );
    fi;
end;

ConjugationGroupHomomorphismOps.PowerMapping := function ( cnj, n )
    if IsEndomorphism( cnj )  then
        return ConjugationGroupHomomorphism( cnj.source, cnj.range,
                                             cnj.element^n );
    else
        return GroupHomomorphismOps.PowerMapping( cnj, n );
    fi;
end;

ConjugationGroupHomomorphismOps.InverseMapping := function ( cnj )
    if not IsBound( cnj.inverseElement )  then
        cnj.inverseElement := cnj.element ^ -1;
    fi;
    if IsSurjective( cnj )  then
        return ConjugationGroupHomomorphism( cnj.range, cnj.source,
                                             cnj.inverseElement );
    else
        return GroupHomomorphismOps.InverseMapping( cnj );
    fi;
end;

ConjugationGroupHomomorphismOps.Print := function ( cnj )
   if cnj.source = cnj.range  then
        Print( "InnerAutomorphism( ",cnj.source,", ",cnj.element," )");
   else
       Print( "ConjugationGroupHomomorphism( ",
                cnj.source,", ",cnj.range,", ",cnj.element," )");
   fi;
end;


#############################################################################
##
#F  InnerAutomorphism(<G>,<g>)  . . . . . . . .  create an inner automorphism
##
InnerAutomorphism := function ( G, g )
    local   cnj;        # conjugation homomorphism, result

    # check the arguments
    if not IsGroup( G )  then
        Error("<G> must be a group");
    fi;
    if not g in Parent( G )  then
        Error("<g> must lie in the parent group of <G>");
    fi;
    if not ForAll( G.generators, gen -> gen ^ g in G )  then
        Error("<g> must map <G> into <H>");
    fi;

    # make the homomorphism
    cnj := rec();
    cnj.isGeneralMapping := true;
    cnj.domain          := Mappings;

    # enter the identifying information
    cnj.isConjugation   := true;
    cnj.source          := G;
    cnj.range           := G;
    cnj.element         := g;

    # enter usefull information
    cnj.isMapping       := true;
    cnj.isInjective     := true;
    cnj.isSurjective    := true;
    cnj.isBijection     := true;
    cnj.isHomomorphism  := true;
    cnj.isMonomorphism  := true;
    cnj.isEpimorphism   := true;
    cnj.isIsomorphism   := true;
    cnj.isEndomorphism  := true;
    cnj.isAutomorphism  := true;
    cnj.image           := G;
    cnj.preImage        := G;
    cnj.kernel          := TrivialSubgroup( G );

    # enter the operations record
    cnj.operations      := ConjugationGroupHomomorphismOps;

    # return the homomorphism
    return cnj;
end;


#############################################################################
##
#F  GroupHomomorphismByImages(<G>,<H>,<gens>,<imgs>)  . . . .  create a group
#F                          homomorphism by the images of a generating system
##
GroupHomomorphismByImages := function ( G, H, gens, imgs )
    local   hom;        # homomorphism from <G> to <H>, result

    # check the arguments
    if not IsGroup( G )  then
        Error("<G> must be a group");
    elif not IsGroup( H )  then
        Error("<H> must be a group");
    #N  03-Jun-92 martin <gens> need no longer generate <G>
    # elif not IsEqualSet(gens,G.generators)
    #  and not G=Subgroup(Parent(G),gens)  then
    #    Error("<gens> must be a generating system for <G>");
    elif not IsEqualSet( Difference( imgs, [ H.identity ] ), H.generators )
         and not IsSubset(H,Set(imgs)) then
        Error("<imgs> must lie in <H>");
    elif Length( gens ) <> Length( imgs )  then
        Error("<gens> and <imgs> must have the same length");
    fi;

    # dispatch to the appropriate function
    hom := G.operations.GroupHomomorphismByImages( G, H, gens, imgs );

    # return the homomorphism
    return hom;
end;

GroupOps.GroupHomomorphismByImages := function ( G, H, gens, imgs )
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

    # enter usefull information (precious little)
    if IsEqualSet( Difference( gens, [ G.identity ] ), G.generators )  then
        hom.preImage    := G;
    else
        hom.preImage    := Parent(G).operations.Subgroup( Parent(G), gens );
    fi;
    if IsEqualSet( Difference( imgs, [ H.identity ] ), H.generators )  then
        hom.image       := H;
    else
        hom.image       := Parent(H).operations.Subgroup( Parent(H), imgs );
    fi;

    # enter the operations record
    hom.operations      := GroupHomomorphismByImagesOps;

    # return the homomorphism
    return hom;
end;

GroupHomomorphismByImagesOps := OperationsRecord(
    "GroupHomomorphismByImagesOps",
    GroupHomomorphismOps );

GroupHomomorphismByImagesOps.MakeMapping := function( hom )
    local   elms,       # elements of subgroup of '<hom>.source'
            elmr,       # representatives of <elms> in '<hom>.elements'
            imgs,       # elements of subgroup of '<hom>.range'
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

GroupHomomorphismByImagesOps.CoKernel := function ( hom )
    local   C,          # co kernel of <hom>, result
            gen,        # one generator of <C>
            i, k;       # loop variables

    # make sure we have the mapping
    if not IsBound( hom.elements )  then
        hom.operations.MakeMapping( hom );
    fi;

    # start with the trivial co kernel
    C := TrivialSubgroup( Parent( hom.range ) );

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

GroupHomomorphismByImagesOps.IsMapping := function ( hom )
    if not IsBound( hom.coKernel )  then
        hom.coKernel := hom.operations.CoKernel( hom );
    fi;
    return hom.source = hom.preImage
       and IsTrivial( hom.coKernel );
end;

GroupHomomorphismByImagesOps.IsGroupHomomorphism := function ( hom )
    return IsMapping( hom );
end;

GroupHomomorphismByImagesOps.ImageElm := function ( hom, elm )
    if not IsMapping( hom )  then
        Error("<hom> must be a single valued mapping");
    fi;
    if not IsBound( hom.elements )  then
        hom.operations.MakeMapping( hom );
    fi;
    return hom.images[ Position( hom.elements, elm ) ];
end;

GroupHomomorphismByImagesOps.ImagesElm := function ( hom, elm )
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

GroupHomomorphismByImagesOps.ImagesRepresentative
  := function ( hom, elm )
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

GroupHomomorphismByImagesOps.ImagesSet := function ( hom, elms )
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

GroupHomomorphismByImagesOps.PreImagesRepresentative := function ( hom, elm )
    if IsBound( hom.images )  and elm in hom.images  then
        return hom.elements[ Position( hom.images, elm ) ];
    else
        return ImagesRepresentative( InverseMapping( hom ), elm );
    fi;
end;

GroupHomomorphismByImagesOps.KernelGroupHomomorphism := function ( hom )
    local   krn,        # kernel of <hom>, result
            inv;        # inverse mapping of <hom>

    # compute the kernel as the co kernel of the inverse mapping
    inv := InverseMapping( hom );
    krn := inv.operations.CoKernel( inv );

    # return the kernel
    return krn;
end;

GroupHomomorphismByImagesOps.CompositionMapping := function ( hom1, hom2 )
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

	    # if hom1 has 'good' mapping functions, it will not bind images.
	    if IsBound(hom1.images) then
	      prd.genimages := List( [ 1 .. Length( prd.generators ) ],
				  i -> hom1.images[
					  Position( hom1.elements,
						    hom2.genimages[i] ) ] );
            else
	      # instead we will use the mapping facilities of hom1
	      prd.genimages := List( [ 1 .. Length( prd.generators ) ],
				  i -> hom1.operations.ImageElm(
					  hom1, hom2.genimages[i] ) );
	    fi;

            # enter useful information
            prd.isMapping       := true;
            prd.isHomomorphism  := true;
            prd.preImage        := hom2.source;


	    # note the images only, if they were already neccessary for hom1
	    # (They may be created by MakeMapping anyhow)
            if IsBound(hom1.elements) then
	      prd.elements := ShallowCopy( hom2.elements );
	      prd.images := List( [ 1 .. Length( prd.elements ) ],
				  i -> hom1.images[
					  Position( hom1.elements,
						    hom2.images[i] ) ] );
            fi;

            # enter the operations record
            prd.operations      := GroupHomomorphismByImagesOps;

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

GroupHomomorphismByImagesOps.InverseMapping := function ( hom )
    return GroupHomomorphismByImages(
                   hom.range,     hom.source,
                   hom.genimages, hom.generators );
end;

GroupHomomorphismByImagesOps.Print := function ( hom )
    Print( "GroupHomomorphismByImages( ",
           hom.source, ", ", hom.range, ", ",
           hom.generators, ", ", hom.genimages, " )" );
end;


#############################################################################
##
#F  GroupHomomorphismByFunction(<D>,<E>,<fun>)  . . . . create a homomorphism
#F                                                            from a function
##
GroupHomomorphismByFunction := function ( arg )
    local   hom;        # mapping <hom>, result

    # no inverse function given
    if Length(arg) = 3  then

        # make the mapping
        hom := rec(

            # enter the tag components
            isGeneralMapping        := true,
            domain                  := Mappings,
            isMappingByFunction     := true,

            # enter the source and the range
            source                  := arg[1],
            range                   := arg[2],
            fun                     := arg[3],

            # enter the known stuff
            isMapping               := true,
            isHomomorphism          := true,
            preImage                := arg[1],
            
            # enter the operations record
            operations              := GroupHomomorphismByFunctionOps

        );

    # inverse function given
    elif Length(arg) = 4  then

        # make the mapping
        hom := rec(

            # enter the tag components
            isGeneralMapping        := true,
            domain                  := Mappings,
            isMappingByFunction     := true,

            # enter the source and the range
            source                  := arg[1],
            range                   := arg[2],
            fun                     := arg[3],
            invFun                  := arg[4],

            # enter the known stuff
            isMapping               := true,
            isHomomorphism          := true,
            isInjective             := true,
	    isMonomorphism          := true,
            isSurjective            := true,
	    isEpimorphism           := true,
            isBijection             := true,
	    isIsomorphism           := true,
            preImage                := arg[1],
            image                   := arg[2],

            # enter the operations record
            operations              := GroupHomomorphismByFunctionOps

        );

    # otherwise signal an error
    else
        Error(
          "usage: GroupHomomorphismByFunction( <D>, <E>, <fun> [, <inv>] )"
              );
    fi;

    # return the mapping
    return hom;
end;

GroupHomomorphismByFunctionOps := OperationsRecord(
    "GroupHomomorphismByFunctionOps",
    GroupHomomorphismOps );

GroupHomomorphismByFunctionOps.ImageElm := function ( hom, elm )
    return hom.fun( elm );
end;

GroupHomomorphismByFunctionOps.ImagesElm := function ( hom, elm )
    return [ hom.fun( elm ) ];
end;

GroupHomomorphismByFunctionOps.ImagesRepresentative
  := function ( hom, elm )
    return hom.fun( elm );
end;

GroupHomomorphismByFunctionOps.PreImageElm := function ( hom, elm )
    if IsBound( hom.invFun )  then
        return hom.invFun( elm );
    else
        return GroupHomomorphismOps.PreImageElm( hom, elm );
    fi;
end;

GroupHomomorphismByFunctionOps.PreImagesElm := function ( hom, elm )
    if IsBound( hom.invFun )  then
        return [ hom.invFun( elm ) ];
    else
        return GroupHomomorphismOps.PreImagesElm( hom, elm );
    fi;
end;

GroupHomomorphismByFunctionOps.PreImagesRepresentative
  := function ( hom, elm )
    if IsBound( hom.invFun )  then
        return hom.fun( elm );
    else
        return GroupHomomorphismOps.PreImagesRepresentative( hom, elm );
    fi;
end;

GroupHomomorphismByFunctionOps.InverseMapping := function ( hom )
    local   inv;
    if IsBound( hom.invFun )  then
        inv := GroupHomomorphismByFunction( hom.range, hom.source,
                                            hom.invFun, hom.fun );
        inv.inverseMapping := hom;
        return inv;
    else
        return GroupHomomorphismOps.InverseMapping( hom );
    fi;
end;

GroupHomomorphismByFunctionOps.Print := function ( hom )
    if not IsBound( hom.invFun )  then
        Print( "GroupHomomorphismByFunction( ",
               hom.source, ", ", hom.range, ", ",
               hom.fun, " )" );
    else
        Print( "GroupHomomorphismByFunction( ",
               hom.source, ", ", hom.range, ", ",
               hom.fun, ", ", hom.invFun, " )" );
    fi;
end;


#############################################################################
##
#V  AutomorphismGroup(<G>) . . group of automorphisms, given as Homomorphisms
##
GroupOps.AutomorphismGroup := function(G)
local a,i,inn,b,elms,gp,au;
  # some special treatment for cyclic groups
  if not IsCyclic(G) then
    a:=Morphium(G,G,1);
  elif Size(G)=1 then
    a:=[];
  else
    b:=Filtered(G.generators,i->Order(G,i)=Size(G));
    if b=[] then
      b:=Filtered(Elements(G),i->Order(G,i)=Size(G));
    fi;
    b:=b[1];
    a:=List(PrimeResidueClassGroup(Size(G)).generators,
	      i->GroupHomomorphismByImages(G,G,[b],[b^i.representative]));
  fi;

  if IsGroup(a) then
    elms:=a.elms;
    gp:=List(G.generators,i->Position(elms,i));
    inn:=List(G.generators,k->PermList(List([1..Size(G)-1],i->Position(elms,
       elms[i]^k))));
    b:=Group(inn,());
    au:=[];
    for i in a.generators do
      if not i in b then
	b:=Group(Concatenation(b.generators,[i]),());
	Add(au,i);
      fi;
    od;
    a:=List(Concatenation(inn,au),
	      i->GroupHomomorphismByImages(G,G,G.generators,
			     List(gp,j->elms[j^i])));

    for i in a do
      i.isMapping:=true;
      i.isInjective:=true;
      i.isSurjective:=true;
      i.isBijection:=true;
    od;

    inn:=a{[1..Length(inn)]};

    a:=Group(a,IdentityMapping(G));
    a.permGroup:=b;
    a.elms:=elms;
    a.operations:=PermAutomorphismGroupOps;
  else
    inn:=List(G.generators,i->GroupHomomorphismByImages(G,G,
			    G.generators,List(G.generators,j->j^i)));
    a:=Concatenation(inn,a);

    for b in a do
      b.isMapping:=true;
      b.isInjective:=true;
      b.isSurjective:=true;
      b.isBijection:=true;
    od;

    a:=Group(a,IdentityMapping(G));
  fi;
  a.morphismDomain:=G;
  #inn:=GroupHomomorphismByImages(G,a,G.generators,inn);
  a.innerAutomorphisms:=inn;
  return a;
end;


#############################################################################
##
#P  IsomorphismGroups(<G>,<H>) . . . . . . . . . .  isomorphism from G onto H
##
IsomorphismGroups := function(G,H)
local m,n;
  if Size(G)<>Size(H) or
     Length(ConjugacyClasses(G))<>Length(ConjugacyClasses(H)) or
     (Size(G)<=100 and GroupId(G)<>GroupId(H)) then
   return false;
  fi;
  if Size(G)=1 then
    return GroupHomomorphismByImages(G,H,[],[]);
  fi;
  if IsCyclic(G) then
    if not IsCyclic(H) then
      return false;
    fi;
    m:=Filtered(G.generators,i->Order(G,i)=Size(G));
    if m=[] then
      m:=Filtered(Elements(G),i->Order(G,i)=Size(G));
    fi;
    m:=m[1];
    n:=Filtered(H.generators,i->Order(H,i)=Size(H));
    if n=[] then
      n:=Filtered(Elements(H),i->Order(H,i)=Size(H));
    fi;
    n:=n[1];
    return GroupHomomorphismByImages(G,H,[m],[n]); 
  else
    m:=Morphium(G,H,2);
    if IsList(m) and Length(m)>0 then
      return m[1];
    else
      return false;
    fi;
  fi;
end;



