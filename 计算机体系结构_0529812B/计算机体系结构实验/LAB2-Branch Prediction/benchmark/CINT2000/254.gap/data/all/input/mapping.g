#############################################################################
##
#A  mapping.g                   GAP library                  Martin Schoenert
#A                                                             & Frank Celler
##
#A  @(#)$Id: mapping.g,v 3.16.1.3 1996/06/11 14:50:23 mschoene Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This  file  contains  the  functions  that  mainly  deal  with  mappings.
##
#H  $Log: mapping.g,v $
#H  Revision 3.16.1.3  1996/06/11  14:50:23  mschoene
#H  fixed '.preimage' to '.preImage'
#H
#H  Revision 3.16.1.2  1995/12/11  12:03:58  mschoene
#H  allowed 'MappingByFunction' with inverse function
#H
#H  Revision 3.16.1.1  1994/10/25  08:58:05  htheisse
#H  introduced the use of 'OperationsRecord'
#H
#H  Revision 3.16  1994/06/21  15:39:47  sam
#H  fixed several calls of '..operations.(Pre)ImagesSet' for lists
#H
#H  Revision 3.15  1994/06/10  02:49:08  sam
#H  added 'MappingOps.IsHomomorphism' (for the moment ...)
#H
#H  Revision 3.14  1994/04/21  12:07:54  sam
#H  improved 'ImageElm', 'ImagesSet', 'PreImagesElm', 'ReImagesSet'
#H
#H  Revision 3.13  1994/03/09  13:23:58  sam
#H  moved 'Kernel' to 'dispatch.g'
#H
#H  Revision 3.12  1994/02/02  10:25:08  sam
#H  moved some functions to 'dispatch.g'
#H
#H  Revision 3.11  1993/06/07  14:23:02  sam
#H  fixed bug in 'MappingOps.\*'
#H
#H  Revision 3.10  1993/02/08  15:44:50  martin
#H  fixed 'IsInjective' for generic inverse mappings
#H
#H  Revision 3.9  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.8  1992/04/29  14:36:08  martin
#H  fixed 'Image' etc. from incorrect case testing
#H
#H  Revision 3.7  1992/04/02  16:59:22  martin
#H  hacked mappings operations records
#H
#H  Revision 3.6  1992/03/27  10:48:22  martin
#H  added 'MappingByFunction'
#H
#H  Revision 3.5  1992/03/27  10:45:54  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.4  1992/02/10  15:14:35  martin
#H  added the domain 'Mappings'
#H
#H  Revision 3.3  1992/02/07  12:04:48  martin
#H  fixed another stupid mistake in 'PowerMapping'
#H
#H  Revision 3.2  1992/02/07  11:49:47  martin
#H  fixed a stupied mistake in 'PowerMapping'
#H
#H  Revision 3.1  1992/01/07  12:02:07  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  IsGeneralMapping(<obj>) . . . . .  test if an object is a general mapping
##
IsGeneralMapping := function ( obj )
    return IsRec( obj )
       and IsBound( obj.isGeneralMapping )  and obj.isGeneralMapping;
end;


#############################################################################
##
#F  IsMapping(<map>)  . . . . . . . . . .  test if a mapping is single valued
##
IsMapping := function ( map )
    if not IsBound( map.isMapping )  then
        map.isMapping := map.operations.IsMapping( map );
    fi;
    return map.isMapping;
end;


#############################################################################
##
#F  Image(<map>[,<elm>])  . . . . . . . . image of an element under a mapping
##
Image := function ( arg )
    local   map,        # mapping <map>, first argument
            elm,        # element <elm>, second argument
            img;        # image of <elm> under <map>, result

    # image of the source under <map>, which may be multi valued in this case
    if   Length( arg ) = 1 then
        map := arg[1];
        if not IsBound( map.image )  then
            map.image := map.operations.ImagesSource( map );
        fi;
        img := map.image;

    elif Length( arg ) = 2 then

      map := arg[1];
      elm := arg[2];

      # image of a single element <elm> under the mapping <map>
      if   elm in Parent( map.source ) then

        img := map.operations.ImageElm( map, elm );

      # image of a set of elments <elm> under the mapping <map>
      elif  ((IsDomain( elm ) and IsSubset( Parent( map.source ), elm ))
          or (IsSet( elm )    and IsSubset( Parent( map.source ), elm ))) then
        img := map.operations.ImagesSet( map, elm );

      # image of a list of elments <elm> under the mapping <map>
      elif IsList( elm ) and IsSubset( Parent( map.source ), Set(elm) ) then
        img := map.operations.ImagesSet( map, Set( elm ) );

      # otherwise signal an error
      else
        Error("<elm> must be an element or a subset of '<map>.source'");
      fi;

    else
      Error("usage: Image( <map> ) or Image( <map>, <elm> )");
    fi;

    # return the image
    return img;
end;


#############################################################################
##
#F  Images(<map>,<elm>) . . . . . . . .  images of an element under a mapping
##
Images := function ( arg )
    local   map,        # mapping <map>, first argument
            elm,        # element <elm>, second argument
            imgs;       # images of <elm> under <map>, result

    # image of the source under <map>
    if Length( arg ) = 1  then
        map := arg[1];
        if not IsBound( map.image )  then
           map.image := map.operations.ImagesSource( map );
        fi;
        imgs := map.image;

    elif Length( arg ) = 2 then

        map := arg[1];
        elm := arg[2];

        # image of a single element <elm> under the mapping <map>
        if   elm in Parent( map.source ) then
          imgs := map.operations.ImagesElm( map, elm );

        # image of a set of elments <elm> under the mapping <map>
        elif ((IsDomain( elm ) and IsSubset( Parent( map.source ), elm ))
          or (IsSet( elm )    and IsSubset( Parent( map.source ), elm ))) then
          imgs := map.operations.ImagesSet( map, elm );

        # image of a list (not set) of elments <elm> under the mapping <map>
        elif IsList( elm ) and IsSubset( Parent( map.source ), Set(elm) ) then
          imgs := map.operations.ImagesSet( map, Set( elm ) );

        # otherwise signal an error
        else
          Error("<elm> must be an element or a subset of '<map>.source'");
        fi;
    else
      Error("usage: Images( <map> ) or Images( <map>, <elm> )");
    fi;

    # return the images
    return imgs;
end;


#############################################################################
##
#F  ImagesRepresentative(<map>,<elm>) one image of an element under a mapping
##
ImagesRepresentative := function ( map, elm )
    return map.operations.ImagesRepresentative( map, elm );
end;


#############################################################################
##
#F  PreImage(<bij>[,<img>]) . . . .  preimage of an element under a bijection
##
PreImage := function ( arg )
    local   bij,        # bijection <bij>, first argument
            img,        # element <img>, second argument
            pre;        # image of <img> under <bij>, result

    # preimage of the range under <bij>, which may be a multi valued mapping
    if Length( arg ) = 1  then
        bij := arg[1];
        if not IsBound( bij.preImage )  then
           bij.preImage := bij.operations.PreImagesRange( bij );
        fi;
        pre := bij.preImage;

    elif Length( arg ) = 2 then

        bij := arg[1];
        img := arg[2];

        # preimage of a single element <img> under the bijection <bij>
        if   img in bij.range  then
            pre := bij.operations.PreImageElm( bij, img );

        # preimage of a set of elments <img> under the bijection <bij>
        elif ((IsDomain( img ) and IsSubset( Parent( bij.range ), img ))
           or (IsSet( img )    and IsSubset( Parent( bij.range ), img )))
        then
            pre := bij.operations.PreImagesSet( bij, img );

        # preimage of a list of elments <img> under the bijection <bij>
        elif IsList( img ) and IsSubset( Parent( bij.range ), Set(img) ) then
            pre := bij.operations.PreImagesSet( bij, Set( img ) );

        # otherwise signal an error
        else
            Error("<img> must be an element or a subset of '<bij>.range'");
        fi;
    else
        Error("usage: PreImage( <bij> ) or PreImage( <bij>, <img> )");
    fi;

    # return the preimage
    return pre;
end;


#############################################################################
##
#F  PreImages(<map>,<img>)  . . . . . preimages of an element under a mapping
##
PreImages := function ( arg )
    local   map,        # mapping <map>, first argument
            img,        # element <img>, second argument
            pres;       # preimages of <img> under <map>, result

    # preimage of the range under <map>
    if Length( arg ) = 1  then
        map := arg[1];
        if not IsBound( map.preImage )  then
           map.preImage := map.operations.PreImagesRange( map );
        fi;
        pres := map.preImage;

    elif Length( arg ) = 2 then
        map := arg[1];
        img := arg[2];

        # preimage of a set of elements <img> under the mapping <map>
        if   ((IsDomain( img ) and IsSubset( Parent( map.range ), img ))
          or (IsSet( img )    and IsSubset( Parent( map.range ), img )))
        then
            pres := map.operations.PreImagesSet( map, img );

        # preimage of a set of elements <img> under the mapping <map>
        elif IsList( img ) and IsSubset( Parent( map.range ), Set( img ) ) then
            pres := map.operations.PreImagesSet( map, Set( img ) );

        # preimage of a single element <img> under the mapping <map>
        elif img in map.range  then
            pres := map.operations.PreImagesElm( map, img );

        # otherwise signal an error
        else
            Error("<img> must be an element or a subset of '<map>.range'");
        fi;
    else
        Error("usage: PreImages( <map> ) or PreImages( <map>, <img> )");
    fi;

    # return the preimages
    return pres;
end;


#############################################################################
##
#F  PreImagesRepresentative(<map>,<img>)  . . . .  one preimage of an element
#F                                                            under a mapping
##
PreImagesRepresentative := function ( map, img )
    return map.operations.PreImagesRepresentative( map, img );
end;


#############################################################################
##
#F  CompositionMapping(<map1>,<map2>) . . . . . . . . composition of mappings
##
CompositionMapping := function ( arg )
    local   com,        # composition of the arguments, result
            i;          # loop variable

    # check the arguments
    if Length( arg ) = 0  then
        Error("usage: CompositionMapping(<map1>..)");
    fi;

    # unravel the argument list
    if Length( arg ) = 1  and IsList( arg[1] )  then
        arg := arg[1];
    fi;

    # compute the composition
    com := arg[ Length( arg ) ];
    for i  in Reversed( [1..Length( arg )-1] )  do
        if not IsSubset( arg[i].source, com.range )  then
            Error("the range of <com> must be a subset of <map>");
        fi;
        com := com.operations.CompositionMapping( arg[i], com );
    od;

    # return the composition
    return com;
end;


#############################################################################
##
#F  PowerMapping(<map>,<n>) . . . . . . . . . . . . . . .  power of a mapping
##
PowerMapping := function ( map, n )
    local   pow;        # <map> raised to the <n>th power, result

    # check the arguments
    if not IsSubset( map.source, map.range )  then
        Error("'<map>.range' must be a subset of '<map>.source'");
    fi;
    if not IsInt( n )  or n < 0  then
        Error("<n> must be a nonnegative integer");
    fi;

    # compute the power
    pow := map.operations.PowerMapping( map, n );

    # return the power
    return pow;
end;


#############################################################################
##
#V  MappingOps  . . . . . . . . . . . . . . . . operation record for mappings
##
##  'MappingOps'  is the operation record of  mappings.  It  contains all the
##  default functions for mappings.
##
##  Most mappings  have operations records that  are created by making a copy
##  of 'MappingOps'  and overlaying the default  functions with more specific
##  ones.
##
MappingOps := OperationsRecord(
    "MappingOps" );

MappingOps.IsMapping := function ( map )
    local   isMap;      # 'true' if <map> is a mapping, result

    # test that each element of the source has exactely one image
    if IsFinite( map.source )  then
        isMap := ForAll( Elements( map.source ),
                         elm -> Size( Images( map, elm ) ) = 1 );

    # give up if <map> has an infinite source
    else
        Error("sorry, can not test if <map> is a mapping, infinite source");
    fi;

    # return the result
    return isMap;
end;


#############################################################################
##
#F  MappingOps.IsInjective(<map>)  . . . . . . test if a mapping is injective
##
MappingOps.IsInjective := function ( map )
    local   isInj;      # 'true' if <map> is injective, result

    # check that <map> is a mapping
    if not IsMapping( map )  then
        Error("<map> must be a single valued mapping");
    fi;

    # if the source is larger than the range, <map> can not be injective
    if Size( map.source ) > Size( map.range )  then
        isInj := false;

    # compare the size of the source with the size of the image
    elif IsFinite( map.source )  then
        isInj := Size( map.source ) = Size( Image( map ) );

    # give up if <map> has an infinite source
    else
        Error("sorry, can not test if <map> is injective, infinite source");
    fi;

    # return the result
    return isInj;
end;


#############################################################################
##
#F  MappingOps.IsSurjective(<map>) . . . . .  test if a mapping is surjective
##
MappingOps.IsSurjective := function ( map )
    local   isSur;      # 'true' if <map> is surjective, result

    # check that <map> is a mapping
    if not IsMapping( map )  then
        Error("<map> must be a single valued mapping");
    fi;

    # if the source is smaller than the range, <map> can not be surjective
    if Size( map.source ) < Size( map.range )  then
        isSur := false;

    # otherwise compare the size of the range with the size of the image
    elif IsFinite( map.range )  then
        isSur := Size( map.range ) = Size( Image( map ) );

    # give up if <map> has an infinite range
    else
        Error("sorry, can not test if <map> is surjective, infinite range");
    fi;

    # return the result
    return isSur;
end;


#############################################################################
##
#F  MappingOps.IsBijection(<map>)  . . . . . test if a mapping is a bijection
##
MappingOps.IsBijection := function ( map )
    return IsInjective( map )
       and IsSurjective( map );
end;


#############################################################################
##
#F  MappingOps.IsHomomorphism(<map>) . .  test if a mapping is a homomorphism
##
MappingOps.IsHomomorphism := function ( map )
    return IsGroupHomomorphism( map );
end;


#############################################################################
##
#F  MappingOps.IsMonomorphism(<map>) . . test if a mapping is an monomorphism
##
MappingOps.IsMonomorphism := function ( map )
    return IsHomomorphism( map )
       and IsInjective( map );
end;


#############################################################################
##
#F  MappingOps.IsEpimorphism(<map>)  . .  test if a mapping is an epimorphism
##
MappingOps.IsEpimorphism := function ( map )
    return IsHomomorphism( map )
       and IsSurjective( map );
end;


#############################################################################
##
#F  MappingOps.IsIsomorphism(<map>)  . .  test if a mapping is an isomorphism
##
MappingOps.IsIsomorphism := function ( map )
    return IsHomomorphism( map )
       and IsBijection( map );
end;


#############################################################################
##
#F  MappingOps.IsEndomorphism(<map>) . . test if a mapping is an endomorphism
##
MappingOps.IsEndomorphism := function ( map )
    return IsHomomorphism( map )
       and IsSubset( map.source, map.range );
end;


#############################################################################
##
#F  MappingOps.IsAutomorphism(<map>)  .  test if a mapping is an automorphism
##
MappingOps.IsAutomorphism := function ( map )
    return IsEndomorphism( map )
       and IsBijection( map );
end;

MappingOps.\= := function ( map1, map2 )
    local   isEql;      # 'true' if <map1> and <map2> are equal, result

    # if <map1> is a mapping
    if IsGeneralMapping( map1 )  then

        # and if <map2> is also a mapping
        if IsGeneralMapping( map2 )  then

            # maybe the properties we already know determine the result
            if (IsBound(map1.isMapping) and IsBound(map2.isMapping)
                and map1.isMapping <> map2.isMapping)
            or (IsBound(map1.isInjective) and IsBound(map2.isInjective)
                and map1.isInjective <> map2.isInjective)
            or (IsBound(map1.isSurjective) and IsBound(map2.isSurjective)
                and map1.isSurjective <> map2.isSurjective)
            or (IsBound(map1.isHomomorphism) and IsBound(map2.isHomomorphism)
                and map1.isHomomorphism <> map2.isHomomorphism)
            then
                isEql := false;

            # otherwise we must really test the equality
            else
                isEql := map1.source = map2.source
                    and map1.range  = map2.range
                    and ForAll( Elements( map1.source ),
                           elm -> map1.operations.ImagesElm( map1, elm )
                                = map2.operations.ImagesElm( map2, elm ) );
            fi;

        # a mapping and an object of another type are never equal
        else
            isEql := false;
        fi;

    # if <map1> is not a mapping
    else

        # a mapping and an object of another type are never equal
        if IsGeneralMapping( map2 )  then
            isEql := false;

        # at least one argument must be a mapping
        else
            Error("panic, either <map1> or <map2> must be a mapping");
        fi;

    fi;

    # return the result
    return isEql;
end;

MappingOps.\< := function ( map1, map2 )
    local   isLess,     # 'true' if <map1> is less than <map2>, result
            elms,       # elements of the source of <map1> and <map2>
            i;          # loop variable

    # if <map1> is not a mapping
    if IsGeneralMapping( map1 )  then

        # and if <map2> is also a mapping
        if IsGeneralMapping( map2 )  then

            # compare the sources and the ranges
            if map1.source <> map2.source  then
                isLess := map1.source < map2.source;
            elif map1.range <> map2.range  then
                isLess := map1.range < map2.range;

            # otherwise compare the images lexicographically
            else

                # find the first element where the images differ
                elms := Elements( map1.source );
                i := 1;
                while i <= Length( elms )
                  and map1.operations.ImagesElm( map1, elms[i] )
                    = map2.operations.ImagesElm( map2, elms[i] )  do
                    i := i + 1;
                od;

                # compare the image sets
                if i <= Length( elms )  then
                    isLess := map1.operations.ImagesElm( map1, elms[i] )
                            < map2.operations.ImagesElm( map2, elms[i] );
                else
                    isLess := false;
                fi;

            fi;

        # a mapping and an object of another type are never equal
        else
            isLess := IsBool( map2 ) or IsString( map2 )
                   or IsList( map2 ) or IsRec( map2 );
        fi;

    # if <map1> is not a mapping
    else

        # a mapping and an object of another type are never equal
        if IsGeneralMapping( map2 )  then
            isLess := not (IsBool( map1 ) or IsString( map1 )
                        or IsList( map1 ) or IsRec( map1 ));

        # at least one argument must be a mapping
        else
            Error("panic, either <map1> or <map2> must be a mapping");
        fi;

    fi;

    # return the result
    return isLess;
end;

MappingOps.\* := function ( map1, map2 )
    local   prd;

    # product of two mappings
    if      IsGeneralMapping( map1 )  and IsMapping( map1 )
        and IsGeneralMapping( map2 )  and IsMapping( map2 )
        and IsSubset( map2.source, map1.range )
    then
        prd := map1.operations.CompositionMapping( map2, map1 );

    # product of a mapping with a list, distribute
    elif    IsGeneralMapping( map1 )  and IsMapping( map1 )
        and IsList( map2 )
    then
        return List( map2, elm -> map1 * elm );
    elif    IsList( map1 )
        and IsGeneralMapping( map2 )  and IsMapping( map2 )
    then
        return List( map1, elm -> elm * map2 );

    # if this function is the operations function of the right operand
    # and the left operand has a different operations function, try that
    elif    IsRec( map2 )
        and IsBound( map2.operations )
        and IsBound( map2.operations.\* )
        and map2.operations.\* = MappingOps.\*
        and IsRec( map1 )
        and IsBound( map1.operations )
        and IsBound( map1.operations.\* )
        and map1.operations.\* <> MappingOps.\*
    then
        prd := map1.operations.\*( map1, map2 );

    # no other product involving a mapping is defined
    else
        Error("product of <map1> and <map2> is not defined");
    fi;

    # return the product
    return prd;
end;

MappingOps.\/ := function ( map1, map2 )
    return map1 * map2 ^ -1;
end;

MappingOps.\mod := function ( map1, map2 )
    return map1 ^ -1 * map2;
end;

MappingOps.Comm := function ( map1, map2 )
    return map1 ^ -1 * map2 ^ -1 * map1 * map2;
end;

MappingOps.\^ := function ( lft, rgt )
    local   pow;        # power of <lft> with <rgt>, result

    # conjugate of a mapping
    if IsGeneralMapping( lft )  and IsMapping( lft )
     and IsGeneralMapping( rgt )  and IsMapping( rgt )  then
        if not IsBijection( rgt )  then
            Error("<rgt> must be a bijection");
        fi;
        pow := rgt^-1 * lft * rgt;

    # image of an element under a mapping
    elif IsGeneralMapping( rgt )  and IsMapping( rgt )
        and lft in rgt.source
    then
        pow := rgt.operations.ImageElm( rgt, lft );

    # power of a mapping
    elif IsGeneralMapping( lft )  and IsMapping( lft )
        and IsInt( rgt )
    then
        if rgt < 0  then
            if not IsBijection( lft )  then
                Error("<lft> must be a bijection");
            fi;
            lft := lft.operations.InverseMapping( lft );
            lft.isMapping := true;
            rgt := - rgt;
        fi;
        if rgt <> 1  then
            if not IsSubset( lft.source, lft.range )  then
                Error("'<lft>.range' must be a subset of '<lft>.source'");
            fi;
            pow := lft.operations.PowerMapping( lft, rgt );
        else
            pow := lft;
        fi;

    # otherwise the power is not defined
    else
        Error("power of <lft> by <rgt> must be defined");
    fi;

    # return the power
    return pow;
end;

MappingOps.ImageElm := function ( map, elm )
    local   img;        # image of <elm> under <map>, result

    # check that <map> is a mapping
    if not IsMapping( map )  then
        Error("<map> must be a single valued mapping");
    fi;

    # take the first and only image of <elm> under <map>
    img := Elements( Images( map, elm ) )[1];

    # return the image
    return img;
end;

MappingOps.ImagesElm := function ( map, elm )
    Error("no default function to find images of <elm> under <map>");
end;

MappingOps.ImagesSet := function ( map, elms )
    local   imgs;       # images of <elms> under <map>, result

    # unite the images of the elements in <elm> under <map>
    imgs := Union( List( Elements( elms ), elm -> Images( map, elm ) ) );

    # return the images
    return imgs;
end;

MappingOps.ImagesSource := function ( map )
    return map.operations.ImagesSet( map, map.source );
end;

MappingOps.ImagesRepresentative := function ( map, elm )
    local   rep,        # representative, result
            imgs;       # all images of <elm> under <map>

    # get all images of <elm> under <map>
    imgs := Images( map, elm );

    # check that <elm> has at least one image under <map>
    if Size( imgs ) = 0  then
        Error("<elm> must have at least one image under <map>");
    fi;

    # pick one image from the source, which is probably a proper set
    #N  03-Nov-91 martin this should be
    #N  rep := Representative( imgs );
    rep := Elements( imgs )[1];

    # and return it
    return rep;
end;

MappingOps.PreImageElm := function ( bij, elm )
    local   pre;        # preimage of <elm> under <bij>, result

    # check that <bij> is a bijection
    if not IsBijection( bij )  then
        Error("<bij> must be a bijection, not an arbitrary mapping");
    fi;

    # take the first and only preimage of <elm> under <bij>
    pre := Elements( PreImages( bij, elm ) )[1];

    # return the preimage
    return pre;
end;

MappingOps.PreImagesElm := function ( map, elm )
    local   pres;       # preimages of <elm> under <map>, result

    # for a finite source simply run over the elements of the source
    if IsFinite( map.source )  then
        pres := Filtered( Elements( map.source ),
                          pre -> elm in Images( map, pre ) );

    # give up if <map> has an infinite source
    else
      Error("sorry, can not compute preimages under <map>, infinite source");
    fi;

    # return the result
    return pres;
end;

MappingOps.PreImagesSet := function ( map, elms )
    local   pres;       # preimages of <elms> under <map>, result

    # unite the preimages of the elements in <elm> under <map>
    pres := Union( List( Elements( elms ), elm -> PreImages( map, elm ) ) );

    # return the preimages
    return pres;
end;

MappingOps.PreImagesRange := function ( map )
    return map.operations.PreImagesSet( map, map.range );
end;

MappingOps.PreImagesRepresentative := function ( map, elm )
    local   rep,        # representative, result
            pres;       # all preimages of <elm> under <map>

    # get all preimages of <elm> under <map>
    pres := PreImages( map, elm );

    # check that <elm> has at least one preimage under <map>
    if Size( pres ) = 0  then
        Error("<elm> must have at least one preimage under <map>");
    fi;

    # pick one preimage from the source, which is probably a proper set
    #N  03-Nov-91 martin this should be
    #N  rep := Representative( imgs );
    rep := Elements( pres )[1];

    # and return it
    return rep;
end;


#############################################################################
##
#F  MappingOps.CompositionMapping(<map1>,<map2>)  composition of two mappings
##
MappingOps.CompositionMapping := function ( map1, map2 )
    local   com;        # composition of <map1> and <map2>, result

    # make the mapping record
    com := rec();
    com.isGeneralMapping := true;
    com.domain          := Mappings;

    # enter the source and the range
    com.source          := map2.source;
    com.range           := map1.range;

    # maybe we know that the mapping is single valued
    if      IsBound( map1.isMapping )  and map1.isMapping
        and IsBound( map2.isMapping )  and map2.isMapping
    then
        com.isMapping   := true;
    fi;

    # enter the identifying information
    com.map1            := map1;
    com.map2            := map2;

    # enter the operations record
    com.operations      := CompositionMappingOps;

    # return the composition
    return com;
end;


#############################################################################
##
#F  MappingOps.PowerMapping(<map>,<n>)  . . . . . . . . .  power of a mapping
##
MappingOps.PowerMapping := function ( map, n )
    local   pow,        # <map> raised to the <n>th power, result
            i;          # loop variable

    # compute the power
    pow := IdentityMapping( map.source );
    if n = 0  then
        return pow;
    fi;
    i := 2 ^ (LogInt( n, 2 ) + 1);
    while 1 < i  do
        pow := pow.operations.CompositionMapping( pow, pow );
        i := QuoInt( i, 2 );
        if i <= n  then
            pow := map.operations.CompositionMapping( pow, map );
            n := n - i;
        fi;
    od;

    # return the power
    return pow;
end;


#############################################################################
##
#F  MappingOps.InverseMapping(<map>) . . . . . . inverse mapping of a mapping
##
MappingOps.InverseMapping := function ( map )
    local   inv;

    # make the mapping record
    inv := rec();
    inv.isGeneralMapping := true;
    inv.domain          := Mappings;

    # enter source and range, and, if possible, preimage and image
    inv.source          := map.range;
    inv.range           := map.source;
    if IsBound( map.image )  then
        inv.preImage    := map.image;
    fi;
    if IsBound( map.preImage )  then
        inv.image       := map.preImage;
    fi;

    # maybe we know that this mapping is single valued
    if IsBound( map.isBijection )  and map.isBijection  then
        inv.isMapping   := true;
        inv.isInjective := true;
        inv.isSurjective:= true;
        inv.isBijection := true;
    fi;

    # we know the inverse mapping of the inverse mapping ;-)
    inv.inverseMapping  := map;

    # enter the operations record
    inv.operations      := InverseMappingOps;

    # return the inverse mapping
    return inv;
end;


#############################################################################
##
#V  CompositionMappingOps . . . . .  operations record for composite mappings
##
CompositionMappingOps := OperationsRecord(
    "CompositionMappingOps",
    MappingOps );

CompositionMappingOps.IsMapping := function ( com )
    if     IsMapping( com.map1 )
       and IsMapping( com.map2 )
    then
        return true;
    else
        return MappingOps.IsMapping( com );
    fi;
end;

CompositionMappingOps.IsInjective := function ( com )
    if      IsMapping( com.map1 )  and IsInjective( com.map1 )
        and IsMapping( com.map2 )  and IsInjective( com.map2 )
    then
        return true;
    else
        return MappingOps.IsInjective( com );
    fi;
end;

CompositionMappingOps.IsSurjective := function ( com )
    if      IsMapping( com.map1 )  and IsSurjective( com.map1 )
        and IsMapping( com.map2 )  and IsSurjective( com.map2 )
    then
        return true;
    else
        return MappingOps.IsInjective( com );
    fi;
end;

CompositionMappingOps.IsHomomorphism := function ( com )
    if      IsMapping( com.map1 )  and IsHomomorphism( com.map1 )
        and IsMapping( com.map2 )  and IsHomomorphism( com.map2 )  then
        return true;
    else
        return MappingOps.IsHomomorphism( com );
    fi;
end;

CompositionMappingOps.ImagesElm := function ( com, elm )
    return com.map1.operations.ImagesSet( com.map1,
               com.map2.operations.ImagesElm( com.map2,
                   elm ) );
end;

CompositionMappingOps.ImagesSet := function ( com, elms )
    return com.map1.operations.ImagesSet( com.map1,
               com.map2.operations.ImagesSet( com.map2,
                   elms ) );
end;

CompositionMappingOps.ImagesRepresentative := function ( com, elm )
    return com.map1.operations.ImagesRepresentative( com.map1,
               com.map2.operations.ImagesRepresentative( com.map2,
                   elm ) );
end;

CompositionMappingOps.PreImagesElm := function ( com, elm )
    return com.map2.operations.PreImagesSet( com.map2,
               com.map1.operations.PreImagesElm( com.map1,
                   elm ) );
end;

CompositionMappingOps.PreImagesSet := function ( com, elms )
    return com.map2.operations.PreImagesSet( com.map2,
               com.map1.operations.PreImagesSet( com.map1,
                   elms ) );
end;

CompositionMappingOps.PreImagesRepresentative := function ( com, elm )
    return com.map2.operations.PreImagesRepresentative( com.map2,
               com.map1.operations.PreImagesRepresentative( com.map1,
                   elm ) );
end;

CompositionMappingOps.Print := function ( com )
    Print( "CompositionMapping( ", com.map1, ", ", com.map2, " )" );
end;

CompositionMappingOps.IsGroupHomomorphism := function ( com )
    return MappingOps.IsGroupHomomorphism( com );
end;

CompositionMappingOps.KernelGroupHomomorphism := function ( com )
    return MappingOps.KernelGroupHomomorphism( com );
end;

CompositionMappingOps.IsFieldHomomorphism := function ( com )
    return MappingOps.IsFieldHomomorphism( com );
end;

CompositionMappingOps.KernelFieldHomomorphism := function ( com )
    return MappingOps.KernelFieldHomomorphism( com );
end;


#############################################################################
##
#V  InverseMappingOps . . . . . . . .  operations record for inverse mappings
##
InverseMappingOps := OperationsRecord(
    "InverseMappingOps",
    MappingOps );

InverseMappingOps.IsMapping := function ( inv )
    if IsMapping( inv.inverseMapping )  then
        return IsBijection( inv.inverseMapping );
    else
        return MappingOps.IsMapping( inv );
    fi;
end;

InverseMappingOps.IsInjective := function ( inv )
    if not IsMapping( inv )  then
        Error("<map> must be a single valued mapping");
    fi;
    if IsMapping( inv.inverseMapping )  then
        return IsBijection( inv.inverseMapping );
    else
        return MappingOps.IsInjective( inv );
    fi;
end;

InverseMappingOps.IsSurjective := function ( inv )
    if not IsMapping( inv )  then
        Error("<map> must be a single valued mapping");
    fi;
    if IsMapping( inv.inverseMapping )  then
        return IsBijection( inv.inverseMapping );
    else
        return MappingOps.IsSurjective( inv );
    fi;
end;

InverseMappingOps.IsHomomorphism := function ( inv )
    if not IsMapping( inv )  then
        Error("<map> must be a single valued mapping");
    fi;
    if IsMapping( inv.inverseMapping )
        and IsHomomorphism( inv.inverseMapping )
    then
        return IsBijection( inv.inverseMapping );
    else
        return MappingOps.IsHomomorphism( inv );
    fi;
end;

InverseMappingOps.ImageElm := function ( inv, elm )
    return inv.inverseMapping.operations.PreImageElm(
                inv.inverseMapping, elm );
end;

InverseMappingOps.ImagesElm := function ( inv, elm )
    return inv.inverseMapping.operations.PreImagesElm(
                inv.inverseMapping, elm );
end;

InverseMappingOps.ImagesSet := function ( inv, elms )
    return inv.inverseMapping.operations.PreImagesSet(
                inv.inverseMapping, elms );
end;

InverseMappingOps.ImagesRepresentative := function ( inv, elm )
    return inv.inverseMapping.operations.PreImagesRepresentative(
                inv.inverseMapping, elm );
end;

InverseMappingOps.PreImageElm := function ( inv, elm )
    return inv.inverseMapping.operations.ImageElm(
                inv.inverseMapping, elm );
end;

InverseMappingOps.PreImagesElm := function ( inv, elm )
    return inv.inverseMapping.operations.ImagesElm(
                inv.inverseMapping, elm );
end;

InverseMappingOps.PreImagesSet := function ( inv, elms )
    return inv.inverseMapping.operations.Images(
                inv.inverseMapping, elms );
end;

InverseMappingOps.PreImagesRepresentative := function ( inv, elm )
    return inv.inverseMapping.operations.ImagesRepresentative(
                inv.inverseMapping, elm );
end;

InverseMappingOps.Print := function ( inv )
    Print("InverseMapping( ",inv.inverseMapping," )");
end;

InverseMappingOps.IsGroupHomomorphism := function ( inv )
    return MappingOps.IsGroupHomomorphism( inv );
end;

InverseMappingOps.KernelGroupHomomorphism := function ( inv )
    return MappingOps.KernelGroupHomomorphism( inv );
end;

InverseMappingOps.IsFieldHomomorphism := function ( inv )
    return MappingOps.IsFieldHomomorphism( inv );
end;

InverseMappingOps.KernelFieldHomomorphism := function ( inv )
    return MappingOps.KernelFieldHomomorphism( inv );
end;


#############################################################################
##
#F  MappingByFunction(<D>,<E>,<fun>)  . . .  create a mapping from a function
##
MappingByFunction := function ( arg )
    local   map;        # mapping <map>, result

    # no inverse function given
    if Length(arg) = 3  then

        # make the mapping
        map := rec(

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
            preImage                := arg[1],
            
            # enter the operations record
            operations              := MappingByFunctionOps

        );

    # inverse function given
    elif Length(arg) = 4  then

        # make the mapping
        map := rec(

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
            isInjective             := true,
            isSurjective            := true,
            isBijection             := true,
            preImage                := arg[1],
            image                   := arg[2],

            # enter the operations record
            operations              := MappingByFunctionOps

        );

    # otherwise signal an error
    else
        Error(
          "usage: MappingByFunction( <D>, <E>, <fun> [, <inv>] )"
              );
    fi;

    # return the mapping
    return map;
end;

MappingByFunctionOps := OperationsRecord(
    "MappingByFunctionOps",
    MappingOps );

MappingByFunctionOps.ImageElm := function ( map, elm )
    return map.fun( elm );
end;

MappingByFunctionOps.ImagesElm := function ( map, elm )
    return [ map.fun( elm ) ];
end;

MappingByFunctionOps.ImagesRepresentative
  := function ( map, elm )
    return map.fun( elm );
end;

MappingByFunctionOps.PreImageElm := function ( map, elm )
    if IsBound( map.invFun )  then
        return map.invFun( elm );
    else
        return MappingOps.PreImageElm( map, elm );
    fi;
end;

MappingByFunctionOps.PreImagesElm := function ( map, elm )
    if IsBound( map.invFun )  then
        return [ map.invFun( elm ) ];
    else
        return MappingOps.PreImagesElm( map, elm );
    fi;
end;

MappingByFunctionOps.PreImagesRepresentative
  := function ( map, elm )
    if IsBound( map.invFun )  then
        return map.fun( elm );
    else
        return MappingOps.PreImagesRepresentative( map, elm );
    fi;
end;

MappingByFunctionOps.InverseMapping := function ( map )
    local   inv;
    if IsBound( map.invFun )  then
        inv := MappingByFunction( map.range, map.source,
                                  map.invFun, map.fun );
        inv.inverseMapping := map;
        return inv;
    else
        return MappingOps.InverseMapping( map );
    fi;
end;

MappingByFunctionOps.Print := function ( map )
    if not IsBound( map.invFun )  then
        Print( "MappingByFunction( ",
               map.source, ", ", map.range, ", ",
               map.fun, " )" );
    else
        Print( "MappingByFunction( ",
               map.source, ", ", map.range, ", ",
               map.fun, ", ", map.invFun, " )" );
    fi;
end;

MappingByFunctionOps.IsGroupHomomorphism := function ( map )
    return MappingOps.IsGroupHomomorphism( map );
end;

MappingByFunctionOps.KernelGroupHomomorphism := function ( map )
    return MappingOps.KernelGroupHomomorphism( map );
end;

MappingByFunctionOps.IsFieldHomomorphism := function ( map )
    return MappingOps.IsFieldHomomorphism( map );
end;

MappingByFunctionOps.KernelFieldHomomorphism := function ( map )
    return MappingOps.KernelFieldHomomorphism( map );
end;


#############################################################################
##
#F  Embedding(<S>,<T>)  . . . . . . . .  embedding of one domain into another
##
Embedding := function ( arg )
    if Length(arg) = 2  then
        return arg[2].operations.Embedding( arg[1], arg[2] );
    elif Length(arg) = 3  then
        return arg[2].operations.Embedding( arg[1], arg[2], arg[3] );
    else
        Error("usage: Embedding(<S>,<T>) or Embedding(<S>,<T>,<i>)");
    fi;
end;


#############################################################################
##
#F  Projection(<S>,<T>) . . . . . . . . projection of one domain onto another
##
Projection := function ( arg )
    if Length(arg) = 2  then
        return arg[1].operations.Projection( arg[1], arg[2] );
    elif Length(arg) = 3  then
        return arg[1].operations.Projection( arg[1], arg[2], arg[3] );
    else
        Error("usage: Projection(<S>,<T>) or Projection(<S>,<T>,<i>)");
    fi;
end;


#############################################################################
##
#V  Mappings  . . . . . . . . . . . . . . . . . . . .  domain of all mappings
#V  MappingsOps . . . . . .  operations record for the domain of all mappings
##
Mappings                := rec();

Mappings.isDomain       := true;

Mappings.name           := "Mappings";

Mappings.isFinite       := false;
Mappings.size           := "infinity";

Mappings.operations     := OperationsRecord( "MappingsOps", DomainOps );
MappingsOps             := Mappings.operations;

MappingsOps.\in        := function ( obj, Mappings )
    return IsMapping( obj );
end;

MappingsOps.Order       := GroupElementsOps.Order;

MappingsOps.Group       := function ( Mappings, gens, id )
    local   gen;

    # check the arguments
    if not IsMapping( id )  or not IsBijection( id )  then
        Error("<id> must be a bijection");
    fi;
    if id.source <> id.range  then
        Error("the source and range of <id> must be equal");
    fi;
    for gen  in gens  do
        if not IsMapping( gen )  or not IsBijection( gen )  then
            Error("<gen> must be a bijection");
        fi;
        if gen.source <> id.source  or gen.range <> id.range  then
            Error("<gen> must permute the source of <id>");
        fi;
    od;

    # delegate the work
    return GroupElementsOps.Group( Mappings, gens, id );
end;



