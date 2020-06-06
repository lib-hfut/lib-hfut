#############################################################################
##
#A  group.g                     GAP library                      Frank Celler
##
#H  @(#)$Id: group.g,v 3.85.1.6 1996/06/11 14:51:24 mschoene Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains dispatcher and default functions for  group functions.
##
##  Namely it  contains   the functions that   construct groups and  subgroup
##  (e.g.   'Group'  and  'Subgroup'), the  functions  that implement  domain
##  functions  (e.g.  'GroupOp.Element'), the  functions   that  test  if   a
##  group has  a  certain property  (e.g.   'IsPerfect'), the  functions that
##  test  properties  for subgroups (e.g.   'IsNormal'),  the  functions that
##  compute  important  subgroups (e.g.    'SylowSubgroup'),  the   functions
##  that  compute  series   (e.g.  'LowerCentralSeries'), and   the functions
##  that compute other information for subgroups (e.g. 'Index').
##
##  Further functions  that can be   applied to groups  are  in 'grpcoset.g',
##  'grphomom.g', 'grpprods.g' and 'operatio.g'.
##
#H  $Log: group.g,v $
#H  Revision 3.85.1.6  1996/06/11  14:51:24  mschoene
#H  fixed '.preimage' to '.preImage'
#H
#H  Revision 3.85.1.5  1995/03/02  14:31:48  vfelsch
#H  bug fixed in 'IsomorphismTypeFiniteSimpleGroup'
#H
#H  Revision 3.85.1.4  1995/01/03  11:33:47  ahulpke
#H  moved reading of 'grplatt' before 'grpcoset'
#H
#H  Revision 3.85.1.3  1994/11/14  15:20:22  ahulpke
#H  fixed IrreducibleGeneratingSet
#H
#H  Revision 3.85.1.2  1994/10/26  16:36:04  ahulpke
#H  Added 'IrreducibleGeneratingSet'
#H
#H  Revision 3.85.1.1  1994/08/31  07:31:07  mschoene
#H  added generic method for 'FrattiniSubgroup'
#H
#H  Revision 3.85  1994/06/27  17:08:50  sam
#H  added a comment
#H
#H  Revision 3.84  1994/06/16  13:54:17  sam
#H  moved 'NumberConjugacyClasses' here
#H
#H  Revision 3.83  1994/06/15  12:34:48  sam
#H  moved 'Components' (in modified form) to 'dispatch.g'
#H
#H  Revision 3.82  1994/06/09  18:54:22  sam
#H  fixed GroupOps.\=
#H
#H  Revision 3.81  1994/04/21  12:17:06  sam
#H  moved dispatchers 'Centralizer', 'IsCentral' to 'dispatch.g',
#H  added a 'ReadLib' statement
#H
#H  Revision 3.80  1994/03/14  14:53:59  sam
#H  improved 'GroupOps.\=' again
#H
#H  Revision 3.79  1994/03/10  17:04:24  sam
#H  improved 'GroupOps.\='
#H
#H  Revision 3.78  1994/03/04  14:07:14  ahulpke
#H  added hack for 'Centralizer' and 'Normalizer' in case no common
#H  parent group is defined as GAP object.
#H
#H  Revision 3.77  1994/03/03  15:35:15  ahulpke
#H  fixed an error in 'GroupOps.Exponent'
#H
#H  Revision 3.76  1994/03/03  15:26:06  sam
#H  moved two functions to 'dispatch.g',
#H  fixed 'GroupOps.FusionConjugacyClasses'
#H
#H  Revision 3.75  1994/02/15  16:32:23  sam
#H  moved 'GroupOps.FusionConjugacyClasses' here
#H
#H  Revision 3.74  1994/02/07  15:31:52  sam
#H  changed 'GroupOps.\^' (allows now also <obj>^<G>)
#H
#H  Revision 3.73  1994/02/02  17:02:51  sam
#H  added 'GroupOps.SizesConjugacyClasses'
#H
#H  Revision 3.72  1994/01/25  14:59:42  fceller
#H  added 'Components',  changed 'Exponent'
#H
#H  Revision 3.71  1994/01/17  14:32:16  sam
#H  changed some of the dispatchers (moved to 'dispatch.g')
#H
#H  Revision 3.70  1993/12/06  10:43:11  sam
#H  fixed 'FittingSubgroup'
#H
#H  Revision 3.69  1993/07/30  12:04:12  martin
#H  added 'IsomorphismTypeFiniteSimpleGroup' and 'DisplayCompositionSeries'
#H
#H  Revision 3.68  1993/07/29  21:49:41  martin
#H  changed "lattgrp" to "grplatt", moved 'NormalSubgroups' there
#H
#H  Revision 3.67  1993/07/26  11:23:49  fceller
#H  added rational classes
#H
#H  Revision 3.67  1993/07/26  11:08:30  fceller
#H  added rational classes
#H
#H  Revision 3.66  93/07/14  09:56:25  fceller
#H  changed 'FittingSubgroup' to call 'PCore'
#H  changed 'DerivedSubgroup' to be careful with perfect groups
#H  
#H  Revision 3.65  1993/04/01  11:51:31  fceller
#H  added 'JenningsSeries' and 'DimensionsLoewyFactors'
#H
#H  Revision 3.64  1993/03/16  11:30:43  ahulpke
#H  Abelian case for ConjugacyClasses, use of .elements field in
#H  ConjugacyClassOps.\in
#H
#H  Revision 3.63  1993/02/11  17:50:25  martin
#H  the code to compute the radical was incorrect
#H
#H  Revision 3.62  1993/02/10  10:11:14  martin
#H  added 'PCore' and 'Radical'
#H
#H  Revision 3.61  1993/01/18  18:54:52  martin
#H  added character table computation
#H
#H  Revision 3.60  1993/01/04  11:16:53  fceller
#H  added 'Exponent'
#H
#H  Revision 3.59  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.58  1992/12/02  08:08:42  fceller
#H  moved 'CompositionSeries' and 'PCentralSeries' to "group.tex"
#H
#H  Revision 3.57  1992/11/30  18:35:28  fceller
#H  added 'ElementaryAbelianSeries' and 'CompositionSeries'
#H
#H  Revision 3.56  92/08/10  12:21:05  fceller
#H  fixed 'AgGroup' problem for PQp
#H  
#H  Revision 3.55  1992/06/23  08:56:49  fceller
#H  'Factorization' should work not only for groups but for all
#H  structures with generators.
#H
#H  Revision 3.54  1992/06/04  07:04:20  fceller
#H  added 'AgGroup' for PqPresentation
#H
#H  Revision 3.53  1992/06/01  11:14:12  martin
#H  changed 'Subgroup' to really ignore identities in the generators list
#H
#H  Revision 3.52  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.51  1992/03/12  20:27:10  fceller
#H  fixed a minor bug.
#H
#H  Revision 3.50  1992/02/12  15:44:23  martin
#H  added the lattice package
#H
#H  Revision 3.49  1992/02/11  12:44:04  martin
#H  added 'SmallestGenerators'
#H
#H  Revision 3.48  1992/02/11  12:39:49  martin
#H  improved 'GroupOps.IsSubset' for common cases
#H
#H  Revision 3.47  1992/02/07  13:36:09  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/05/06  11:23:50  fceller
#H  Initial revision under RCS.
##


#############################################################################
##
#F  InfoGroup?( ... ) . . . . . .  information function for the group package
##
if not IsBound( InfoGroup1 )  then InfoGroup1 := Ignore;  fi;
if not IsBound( InfoGroup2 )  then InfoGroup2 := Ignore;  fi;


#############################################################################
##
#F  GroupString(<G>,<name>) . . . . . . . . . . . .  group information string
##
GroupString := function ( G, name )
    if IsBound( G.name )  then
        if IsBound( G.size )  then
            return ConcatenationString(
                        G.name, " ",
                        "(size ", StringInt(G.size), ")"
                   );
        else
            return G.name;
        fi;
    else
        if IsBound( G.size )  then
            return ConcatenationString(
                        "<", name, "> ",
                        "(", StringInt(Length(G.generators)), " gens, ",
                        "size ", StringInt(G.size), ")"
                   );
        else
            return ConcatenationString(
                        "<", name, "> ",
                        "(", StringInt(Length(G.generators)), " gens)"
                   );
        fi;
    fi;
end;


#############################################################################
##
#V  GroupOps  . . . . . . . . . . . . . . . . .  operations record for groups
##
##  'GroupOps' is the operations record for groups.  This is initially a copy
##  of 'DomainOps'.  This way all the default methods for domains are
##  inherited.
##
##  The operations records for special groups are created by making a copy of
##  this record and overlaying some functions.  This way those groups inherit
##  the default methods.
##
GroupOps := OperationsRecord( "GroupOps", DomainOps );


#############################################################################
##
#F  Group(<gen>,...) or Group(<gens>,<id>) or Group(<D>)  . .  create a group
##
Group := function ( arg )
    local   G,          # group containing the elements of <arg>, result
            D,          # domain containing the elements of <arg>
            gens,       # elements of <arg> as a flat list
            id,         # identity element
            i;          # loop variable

    # if called with one domain argument look in the operations record
    if Length( arg ) = 1 and IsDomain( arg[1] )  then
        G := arg[1].operations.Group( arg[1] );

    # special case for matrices, because they look like lists
    elif Length( arg ) = 2 and IsMat( arg[1] )  then
        gens := arg;
        id   := arg[1]^0;
        D    := Domain( gens );
        G    := D.operations.Group( D, gens, id );

    # list of generators plus identity
    elif Length( arg ) = 2 and IsList( arg[1] )  then
        gens := arg[1];
        id   := arg[2];
        D    := Domain( Concatenation( gens, [ id ] ) );
        G    := D.operations.Group( D, gens, id );

    # generators
    elif 0 < Length( arg )  then
        gens := arg;
        id   := arg[1]^0;
        D    := Domain( gens );
        G    := D.operations.Group( D, gens, id );

    # no argument given, error
    else
        Error("usage: Group(<gen>,...) or Group(<gens>,<id>) or Group(<D>)");
    fi;

    # return the group
    for i  in [ 1 .. Length(G.generators) ]  do
        G.(i) := G.generators[i];
    od;
    return G;

end;

GroupElementsOps.Group := function ( GroupElements, gens, id )
    local   G;          # group containing <gens>, result

    # make the domain
    G            := rec();
    G.isDomain   := true;
    G.isGroup    := true;

    # enter identification
    G.identity   := id;
    if id in gens  then
        G.generators := Filtered( gens, gen -> gen <> id );
    else
        G.generators := ShallowCopy( gens );
    fi;

    # enter operations record
    G.operations := GroupOps;

    # return the group
    return G;

end;


#############################################################################
##
#F  AsGroup( <D> )  . . . . . . . . . . . . . . . .  view a domain as a group
##
AsGroup := function ( D )
    local   G;

    # check that the argument is a domain or a list
    if not IsDomain( D )  and not IsList( D )  then
        Error( "<D> must be a list or a domain" );
    fi;

    # convert a domain into a group
    if IsDomain( D )  then
        G := D.operations.AsGroup( D );

    # convert a list into a group
    else
        G := Domain( D ).operations.AsGroup( D );
    fi;

    # return the group
    return G;

end;

GroupElementsOps.AsGroup := function ( D )
    local   G,  L;

    # handle trivial case
    if IsGroup( D )  then
        G := ShallowCopy( D );

    # otherwise take elements from the domain
    else
        D := Set( D );
        L := ShallowCopy( D );
        G := TrivialSubgroup( Group( D, D[1]^0 ) );
        SubtractSet( L, Elements( G ) );
        while 0 < Length(L)  do
            G := Closure( G, L[1] );
            SubtractSet( L, Elements( G ) );
        od;
        if Length( Elements( G ) ) <> Length( D )  then
            Error( "the elements of <D> must form a group" );
        fi;
        G := Group( G.generators, D[1]^0 );
        G.elements := D;
        G.isFinite := true;
        G.size     := Length( D );
    fi;

    # return the group
    return G;

end;

GroupOps.AsGroup := function( G )
    return ShallowCopy( G );
end;


#############################################################################
##
#F  IsGroup( <obj> )  . . . . . . . . . . . . .  test if an object is a group
##
IsGroup := function ( obj )
    return     IsRec( obj )
           and IsBound( obj.isGroup )
           and obj.isGroup;
end;


#############################################################################
##
#F  GroupOps.IsParent( <G> )  . . . . . . . test if a group is a parent group
##
GroupOps.IsParent := function ( G )
    return not IsBound( G.parent );
end;


#############################################################################
##
#F  Parent( <G>, ... )  . . . . . . . . . . . . . . . . . common parent group
##
Parent := function ( arg )
    local   G;

    # check the number of arguments
    if Length( arg ) = 0  then
        Error( "usage: Parent( <G>, ... )" );
    fi;

    # compute the parent group
    G := arg[1].operations.Parent( arg );

    # return the parent group
    return G;

end;

GroupOps.Parent := function ( L )
    local   G,          # parent of first group, result
            H;          # loop variable

    # get the parent of the first group
    if IsBound( L[1].parent )  then
        G := L[1].parent;
    else
        G := L[1];
    fi;

    # check that all other groups have the same parent
    for H  in L  do
        if IsBound( H.parent )  and H.parent <> G  then
            Error( "<G> and <H> must have the same parent group" );
        elif not IsBound( H.parent ) and H <> G  then
            Error( "<G> and <H> must have the same parent group" );
        fi;
    od;

    # return the parent
    return G;

end;


#############################################################################
##
#V  MaintainedGroupInfo . . . . . . . . . . . . . . .  maintained info fields
##
MaintainedGroupInfo := [
    "isCyclic", "isElementaryAbelian", "isAbelian", "isSolvable",
    "isNilpotent", "isPerfect", "isSimple", "isFinite", "size"
];


#############################################################################
##
#F  GroupOps.Group( <D> ) . . . . . . . . . . convert a subgroup into a group
##
GroupOps.Group := function ( D )
    local   G,          # group for the domain <D>, result
            name;       # component name in the group record

    # make the group
    G := Group( D.generators, D.identity );

    # copy information
    for name  in Intersection( RecFields( D ), MaintainedGroupInfo ) do
        G.(name) := D.(name);
    od;

    # return the group
    return G;

end;


#############################################################################
##
#F  GroupOps.Elements( <G> )  . . . . . . . .  set of the elements of a group
##
GroupOps.Elements := function ( G )
    local   H,          # subgroup of the first generators of <G>
            gen;        # generator of <G>

    # start with the trivial group and its element list
    H := TrivialSubgroup( G );
    H.elements := [ H.identity ];

    # add the generators one after the other
    for gen  in G.generators  do
        H := GroupOps.Closure( H, gen );
    od;

    # return the list of elements
    return H.elements;

end;


#############################################################################
##
#F  GroupOps.\=( <G>, <H> )  . . . . . . . . .  test if two groups are equal
##
GroupOps.\= := function ( G, H )
    local   isEql;

    if   IsRec( G ) and IsList( H ) then
      return DomainOps.\=( G, H );
    elif IsRec( H ) and IsList( G ) then
      return DomainOps.\=( G, H );
    elif not IsRec( G ) or not IsRec( H ) then

      # The objects are different, or a tricky user called
      # 'GroupOps.\=' explicitly.
      return false;

    elif IsGroup( G ) and IsFinite( G )  then
        if IsGroup( H ) and IsFinite( H )  then
            isEql :=    G.generators = H.generators
                     or IsEqualSet( G.generators, H.generators )
                     or (    Size( G ) = Size( H )
                         and ForAll( G.generators, gen -> gen in H ));
        elif IsGroup( H )  then
            isEql := false;
        elif IsCoset( H ) and IsFinite( H )  then
            if G <> H.group  then
                isEql := false;
            else
                isEql := H.representative in H.group;
            fi;
        elif IsCoset( H )  then
            isEql := false;
        else
            isEql := DomainOps.\=( G, H );
        fi;
    elif IsGroup( G )  then
        if IsGroup( H )  and IsFinite( H )  then
            isEql := false;
        elif IsGroup( H )  then
            isEql :=    G.generators = H.generators
                     or IsEqualSet( G.generators, H.generators )
                     or (    ForAll( G.generators, gen -> gen in H )
                         and ForAll( H.generators, gen -> gen in G ));
        elif IsCoset( H ) and IsFinite( H )  then
            isEql := false;
        elif IsCoset( H )  then
            if G <> H.group  then
                isEql := false;
            else
                isEql := H.representative in H.group;
            fi;
        else
            isEql := DomainOps.\=( G, H );
        fi;
    elif IsCoset( G ) and IsFinite( G )  then
        if IsGroup( H ) and IsFinite( H )  then
            if G.group <> H  then
                isEql := false;
            else
                isEql := G.representative in G.group;
            fi;
        elif IsGroup( H )  then
            isEql := false;
        else
            isEql := DomainOps.\=( G, H );
        fi;
    elif IsCoset( G )  then
        if IsGroup( H ) and IsFinite( H )  then
            isEql := false;
        elif IsGroup( H )  then
            if G.group <> H  then
                isEql := false;
            else
                isEql := G.representative in G.group;
            fi;
        else
            isEql := DomainOps.\=( G, H );
        fi;
    else
        isEql := DomainOps.\=( G, H );
    fi;
    return isEql;

end;


#############################################################################
##
#F  GroupOps.IsSubset( <G>, <H> ) . . . . . . . . . test for subset of groups
##
GroupOps.IsSubset := function ( G, H )
    local   isSub;

    if IsGroup( G ) and IsFinite( G )  then
        if IsGroup( H ) and IsFinite( H )  then
            isSub :=    G.generators = H.generators
                     or IsSubsetSet( G.generators, H.generators )
                     or (IsBound( H.parent ) and G = H.parent)
                     or (    Size( G ) >= Size( H )
                         and ForAll( H.generators, gen -> gen in G ));
        elif IsGroup( H )  then
            isSub := false;
        elif IsCoset( H ) and IsFinite( H )  then
            isSub := IsSubset( G, H.group )
                 and H.representative in G;
        elif IsCoset( H )  then
            isSub := false;
        else
            isSub := DomainOps.IsSubset( G, H );
        fi;
    elif IsGroup( G )  then
        if IsGroup( H )  and IsFinite( H )  then
            isSub :=    G.generators = H.generators
                     or IsSubsetSet( G.generators, H.generators )
                     or (IsBound( H.parent ) and G = H.parent)
                     or ForAll( H.generators, gen -> gen in G );
        elif IsGroup( H )  then
            isSub :=    G.generators = H.generators
                     or IsSubsetSet( G.generators, H.generators )
                     or (IsBound( H.parent ) and G = H.parent)
                     or ForAll( H.generators, gen -> gen in G );
        elif IsCoset( H ) and IsFinite( H )  then
            isSub := IsSubset( G, H.group )
                 and H.representative in G;
        elif IsCoset( H )  then
            isSub := IsSubset( G, H.group )
                 and H.representative in G;
        else
            isSub := DomainOps.IsSubset( G, H );
        fi;
    elif IsCoset( G ) and IsFinite( G )  then
        if IsGroup( H ) and IsFinite( H )  then
            isSub := G.identity in G.group
                 and ForAll( H.generators, gen -> gen in G );
        elif IsGroup( H )  then
            isSub := false;
        else
            isSub := DomainOps.IsSubset( G, H );
        fi;
    elif IsCoset( G )  then
        if IsGroup( H ) and IsFinite( H )  then
            isSub := G.identity in G.group
                 and ForAll( H.generators, gen -> gen in G );
        elif IsGroup( H )  then
            isSub := G.identity in G.group
                 and ForAll( H.generators, gen -> gen in G );
        else
            isSub := DomainOps.IsSubset( G, H );
        fi;
    else
        isSub := DomainOps.IsSubset( G, H );
    fi;
    return isSub;

end;


#############################################################################
##
#F  GroupOps.Intersection( <G>, <H> ) . . . . . . . .  intersection of groups
##
GroupOps.Intersection := function ( G, H )

    # if one argument is a list, filter this list
    if IsList( G )  then
        return Filtered( G, g -> g in H );
    elif IsList( H )  then
        return Filtered( H, g -> g in G );
    fi;

    # if the groups have different parents, use the domain method
    if IsBound( G.parent )  then
        if IsBound( H.parent )  then
            if G.parent <> H.parent  then
                return DomainOps.Intersection( G, H );
            fi;
        elif H <> G.parent  then
            return DomainOps.Intersection( G, H );
        fi;
    else
        if IsBound( H.parent )  then
            if G <> H.parent  then
                return DomainOps.Intersection( G, H );
            fi;
        elif G <> H  then
            return DomainOps.Intersection( G, H );
        fi;
    fi;

    # construct this group of stabilizer of a right coset
    if not IsFinite( G )  then
        return Stabilizer( H, Coset( G ), OnRight );
    elif not IsFinite( H )  then
        return Stabilizer( G, Coset( H ), OnRight );
    elif Size( G ) < Size( H )  then
        return Stabilizer( G, Coset( H ), OnRight );
    else
        return Stabilizer( H, Coset( G ), OnRight );
    fi;

end;


#############################################################################
##
#F  GroupOps.Print( <G> ) . . . . . . . . . . . . . . .  pretty print a group
##
GroupOps.Print := function ( G )
    local   i;

    # if the group has a name we use this
    if IsBound( G.name )  then
        Print( G.name );

    # if the group is a parent print it as 'Group(...)'
    elif not IsBound( G.parent )  then

        # if the group is not trivial the identity need not be printed
        if 0 < Length(G.generators)  then
            Print( "Group( ");
            for i  in [ 1 .. Length(G.generators)-1 ]  do
                Print( G.generators[i], ", " );
            od;
            Print( G.generators[Length(G.generators)], " )" );

        # if the group is trivial print it as 'Group( <id> )'
        else
            Print( "Group( ", G.identity, " )" );
        fi;

    # if the group is a subgroup print it as 'Subgroup(...)'
    else
        Print( "Subgroup( ", G.parent, ", ", G.generators, " )" );
    fi;

end;


#############################################################################
##
#F  Subgroup( <G>, <gens> ) . . . . . . . . . . . . . . . . create a subgroup
##
Subgroup := function ( G, gens )
    local   U,          # subgroup of <G> with generators <gens>, result
            i;          # loop variable

    # check the arguments
    if not IsGroup( G ) then
      Error( "<G> must be a group" );
    fi;
    G:= Parent( G );
    if not ForAll( gens, gen -> gen in G )  then
        Error( "the generators <gens> must lie in <G>" );
    fi;

    # make the subgroup
    U := G.operations.Subgroup( G, gens );
    for i  in [ 1 .. Length( U.generators ) ]  do
        U.(i) := U.generators[i];
    od;

    # return the subgroup
    return U;

end;

GroupOps.Subgroup := function ( G, gens )
    local   U;          # subgroup of <G> generated by <gens>, result

    # remove the identity from the list of generators
    if G.identity in gens  then
        gens := Filtered( gens, gen -> gen <> G.identity );
    else
        gens := ShallowCopy( gens );
    fi;

    # handle special case
    if IsEqualSet( G.generators, gens )  then
        U := G;
#T sam, June 27th, 1994
#T This makes it impossible to regard the group as a subgroup of itself
#T (which is used e.g. for AG groups).
#T If this shortcut is removed, the 'ShallowCopy' calls inside of
#T 'Subgroup' calls may be removed all over he library.

    # otherwise
    else

        # make the subgroup
        U            := rec();
        U.isDomain   := true;
        U.isGroup    := true;
        U.parent     := G;

        # enter the identification
        U.identity   := G.identity;
        U.generators := gens;

        # enter the operations record
        U.operations := GroupOps;

    fi;

    # return the subgroup
    return U;

end;


#############################################################################
##
#F  AsSubgroup( <G>, <U> )  . . . . view a group as subgroup of another group
##
AsSubgroup := function ( G, U )

    # check the arguments
    if not IsGroup( G )  or not IsParent( G )  then
        Error( "<G> must be a parent group" );
    fi;
    if not IsGroup( U )  then
        Error( "<U> must be a group" );
    fi;
    if not ForAll( U.generators, gen -> gen in G )  then
        Error( "the generators of <U> must lie in <G>" );
    fi;

    # dispatch
    return G.operations.AsSubgroup( G, U );

end;

GroupOps.AsSubgroup := function ( G, U )
    return G.operations.Subgroup( G, U.generators );
end;


#############################################################################
##
#F  GroupOps.Centralizer( <G>, <obj> ) . . .  centralizer of subgroup/element
##
GroupOps.Centralizer := function ( G, obj )
    local   C,          # centralizer of <obj> in <G>, result
            gen;        # one generator of subgroup <obj>

    # centralizer of a subgroup
    if IsGroup( obj )  then
        C := G;
        for gen  in obj.generators  do
            C := Stabilizer( C, gen );
        od;

    # centralizer of an element in a subgroup
    else
        C := Stabilizer( G, obj );
    fi;

    # return the centralizer
    return C;

end;


#############################################################################
##
#F  GroupOps.Centre( <G> )  . . . . . . . . . . . . . . . . centre of a group
##
GroupOps.Centre := function ( G )
    local   C;          # centre of <G>, result

    # if <G> is abelian it is its own centre
    if IsBound( G.isAbelian )  and G.isAbelian  then
        C := G;

    # otherwise compute the centralizer of <G> in <G>
    else
        C := Centralizer( G, G );
    fi;

    # return the centre
    return C;

end;

#############################################################################
##
#F  GroupOps.Closure(<G>,<obj>)  . . . closure of group with group or element
##
GroupOps.Closure := function ( G, obj )
    local   C,          # closure '\< <G>, <obj> \>', result
            gen,        # generator of <G> or <C>
            reps,       # representatives of cosets of <G> in <C>
            rep;        # representative of coset of <G> in <C>

    # handle the closure of a group with a subgroup
    if IsGroup( obj )  then
        if IsParent( G )  then
            C := G;
        elif IsParent( obj )  then
            C := obj;
        else
            C := G;
            for gen in obj.generators  do
                C := G.operations.Closure( C, gen );
            od;
        fi;

    # closure of a group with a single element
    else

        # try to avoid adding an element to a group that already contains it
        if   IsParent( G )
          or obj in G.generators
          or obj^-1 in G.generators
          or (IsBound( G.elements )  and obj in G.elements)
          or obj = G.identity
        then
            return G;
        fi;

        # make the closure group
        C := G.operations.Subgroup( Parent(G),
                                    Concatenation( G.generators, [obj] ) );

        # if <G> is nonabelian then so is <C>
        if IsBound( G.isAbelian ) and not G.isAbelian  then
            C.isAbelian := false;
        elif IsBound( G.isAbelian )  then
            C.isAbelian := ForAll( G.generators,
                                   gen -> Comm(gen,obj)=G.identity );
        fi;

        # if <G> is infinite then so is <C>
        if IsBound( G.isFinite ) and not G.isFinite  then
            C.isFinite := false;
            C.size     := "infinity";
        fi;

        # if the elements of <G> are known then extend this list
        if IsBound( G.elements )  then

            # if <G>^<obj> = <G> then <C> = <G> * <obj>
            if ForAll( G.generators, gen -> gen ^ obj in G.elements )  then
                InfoGroup2( "#I   new generator normalizes\n" );
                C.elements := ShallowCopy( G.elements );
                rep := obj;
                while not rep in G.elements  do
                    Append( C.elements, G.elements * rep );
                    rep := rep * obj;
                od;
                C.elements := Set( C.elements );
                C.isFinite := true;
                C.size     := Length( C.elements );

            # otherwise use a Dimino step
            else
                InfoGroup2( "#I   new generator normalizes not\n" );
                C.elements := ShallowCopy( G.elements );
                reps := [ G.identity ];
                InfoGroup2( "\r#I   |<cosets>| = ",Length(reps), "\c" );
                for rep  in reps  do
                    for gen  in C.generators  do
                        if not rep * gen in C.elements  then
                            Append( C.elements, G.elements * (rep * gen) );
                            Add( reps, rep * gen );
                            InfoGroup2( "\r#I   |<cosets>| = ",
                                        Length(reps),"\c");
                        fi;
                    od;
                od;
                InfoGroup2( "\n" );
                C.elements := Set( C.elements );
                C.isFinite := true;
                C.size := Length( C.elements );

            fi;
        fi;

    fi;

    # return the closure
    return C;

end;


#############################################################################
##
#F  GroupOps.CommutatorFactorGroup(<G>) .  commutator factor group of a group
##
GroupOps.CommutatorFactorGroup := function ( G )
    return FactorGroup( G, DerivedSubgroup( G ) );
end;


#############################################################################
##
#F  CommutatorSubgroup( <U>, <V> )  . . . . commutator subgroup of two groups
##
CommutatorSubgroup := function ( U, V )
    local   C;

    # check that the arguments are groups with a common parent
    if not IsGroup( U )  then
        Error( "<U> must be a group" );
    elif not IsGroup( V )  then
        Error( "<V> must be a group" );
    fi;

    # <U> and <V> must have a common parent
    Parent( U, V );
    InfoGroup1( "#I  CommutatorSubgroup: of <U> and <V>\n" );

    # compute the commutator subgroup
    C := U.operations.CommutatorSubgroup( U, V );

    # return the commutator subgroup
    InfoGroup1( "#I  CommutatorSubgroup: ", GroupString(C,"C"), "\n" );
    return C;

end;

GroupOps.CommutatorSubgroup := function ( U, V )
    local   C, u, v, c;

    # [ <U>, <V> ] = normal closure of < [ <u>, <v> ] >.
    C := TrivialSubgroup( U );
    for u  in U.generators  do
        for v  in V.generators  do
            c := Comm( u, v );
            if not c in C  then
                C := Closure( C, c );
            fi;
        od;
    od;
    return NormalClosure( Closure( U, V ), C );

end;


#############################################################################
##
#F  Core( <G>, <U> )  . . . . . . . . . . . . . core of a subgroup in a group
##
Core := function ( G, U )
    local   C;          # core of <U> in <G>, result

    # check that the arguments are groups with a common parent
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    elif not IsGroup( U )  then
        Error( "<U> must be a group" );
    fi;
    Parent( G, U );
    InfoGroup1( "#I  Core: of ", GroupString(U,"U"), " in ",
                GroupString(G,"G"), "\n");

    # compute the core
    if IsParent( G )  then
        if not IsBound( U.core )  then
            U.core := G.operations.Core( G, U );
        fi;
        C := U.core;
    else
        C := G.operations.Core( G, U );
    fi;

    # return the core
    InfoGroup1( "#I  Core: returns ", GroupString(C,"C"), "\n" );
    return C;

end;

GroupOps.Core := function ( G, U )
    local   C,          # core of <U> in <G>, result
            i;          # loop variable

    # start with the subgroup <U>
    C := U;
    InfoGroup2("#I  Core: approx. is ",GroupString(C,"C"),"\n");

    # loop until all generators normalize <C>
    i := 1;
    while i <= Length( G.generators )  do

        # if <C> is not normalized by this generator take the intersection
        # with the conjugate subgroup and start all over again
        if not ForAll( C.generators, gen -> gen ^ G.generators[i] in C ) then
            C := Intersection( C, C ^ G.generators[i] );
            InfoGroup2("#I  Core: approx. is ",GroupString(C,"C"),"\n");
            i := 1;

        # otherwise try the next generator
        else
            i := i + 1;
        fi;

    od;

    # return the core
    return C;

end;


#############################################################################
##
#F  GroupOps.DerivedSubgroup( <G> ) . . . . . . . derived subgroup of a group
##
GroupOps.DerivedSubgroup := function ( G )
    local   D,          # derived subgroup of <G>, result
            i,  j,      # loops
            comm;       # commutator of two generators of <G>

    # find the subgroup generated by the commutators of the generators
    D := TrivialSubgroup( G );
    for i  in [ 2 .. Length( G.generators ) ]  do
        for j  in [ 1 .. i - 1 ]  do
            comm := Comm( G.generators[i], G.generators[j] );
            if not comm in D  then
                D := Closure( D, comm );
            fi;
        od;
    od;

    # return the normal closure of <D> in <G>
    D := NormalClosure( G, D );
    if D = G  then D := G;  fi;
    return D;

end;


#############################################################################
##
#F  GroupOps.FittingSubgroup( <G> ) . . . . . . . Fitting subgroup of a group
##
GroupOps.FittingSubgroup := function ( G )
    local   F;

    if 0 = Length(G.generators)  then
        F := G;
    else
        F := Subgroup( Parent( G ), Union( List( Set( Factors( Size( G ) ) ),
                         p -> PCore( G, p ).generators ) ) );
    fi;
    return F;

end;


#############################################################################
##
#F  GroupOps.FrattiniSubgroup( <G> )  . . . . .  Frattini subgroup of a group
##
GroupOps.FrattiniSubgroup := function ( G )
    return Intersection( List( ConjugacyClassesMaximalSubgroups( G ),
                               C -> Core( G, Representative(C) ) ) );
end;


#############################################################################
##
#F  NormalClosure( <G>, <U> ) . . . . normal closure of a subgroup in a group
##
NormalClosure := function ( G, U )
    local   N;          # normal closure of <U> in <G>, result

    # check that the arguments are groups with a common parent
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    elif not IsGroup( U )  then
        Error( "<U> must be a group" );
    fi;

    # <G> and <U> must have a common parent
    Parent( G, U );
    InfoGroup1( "#I  NormalClosure: of ", GroupString(U,"U"), " in ",
                GroupString(G,"G"), "\n");

    # compute the normal closure
    if IsParent( G )  then
        if not IsBound( U.normalClosure )  then
            U.normalClosure := G.operations.NormalClosure( G, U );
        fi;
        N := U.normalClosure;
    else
        N := G.operations.NormalClosure( G, U );
    fi;

    # return the normal closure
    InfoGroup1( "#I  NormalClosure: returns ", GroupString(N,"N"), "\n" );
    return N;

end;

GroupOps.NormalClosure := function ( G, U )
    local   N,          # normal closure of <U> in <G>, result
            gensG,      # generators of the group <G>
            genG,       # one generator of the group <G>
            gensN,      # generators of the group <N>
            genN,       # one generator of the group <N>
            cnj;        # conjugated of a generator of <U>

    # get a set of generators of <G>
    if IsFinite( G )  then
        gensG := G.generators;
    else
        gensG := Concatenation(G.generators,List(G.generators,gen->gen^-1));
    fi;

    # make a copy of the group to be closed
    N := ShallowCopy( U );
    InfoGroup2("#I   |<gens>| = ",Length(N.generators),"\n");

    # loop over all generators of N
    gensN := ShallowCopy( N.generators );
    for genN  in gensN  do

        # loop over the generators of G
        for genG  in gensG  do

            # make sure that the conjugated element is in the closure
            cnj := genN ^ genG;
            if not cnj in N  then
                InfoGroup2("#I   |<gens>| = ",Length(N.generators),"+1\n");
                N := Closure( N, cnj );
                Add( gensN, cnj );
            fi;

        od;

    od;

    # return the normal closure
    return N;

end;


#############################################################################
##
#F  NormalIntersection( <N>, <U> )  . . . . . intersection with normal subgrp
##
GroupOps.NormalIntersection := GroupOps.Intersection;

NormalIntersection := function( N, U )
    return N.operations.NormalIntersection( N, U );
end;


#############################################################################
##
#F  Normalizer( <G>, <U> )  . . . . . . . . . . . .  normalizer of a subgroup
##
Normalizer := function ( G, U )
    local   N;          # normalizer of <U> in <G>, result

    # check that the arguments are groups with a common parent
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    elif not IsGroup( U )  then
        Error("<U> must be a group");
    fi;

    if G.identity=U.identity and Parent(G)<>Parent(U) then
      # both groups are in common undefined supergroup
      N:=Stabilizer(G,U,function(g,e)
		    return Group(List(g.generators,i->i^e),g.identity);
		  end);
      return N;
    fi;
    # <G> and <U> must have a common parent
    Parent( G, U );
    InfoGroup1( "#I  Normalizer: of ", GroupString(U,"U"), " in ",
                GroupString(G,"G"), "\n");

    # compute the normalizer
    if IsParent( G )  then
        if not IsBound( U.normalizer )  then
            U.normalizer := G.operations.Normalizer( G, U );
        fi;
        N := U.normalizer;
    else
        N := G.operations.Normalizer( G, U );
    fi;

    # return the normalizer
    InfoGroup1("#I  Normalizer: returns ",GroupString(N,"N"),"\n");
    return N;

end;

GroupOps.Normalizer := function ( G, U )
    return Stabilizer( G, U, G.operations.ConjugateSubgroup );
end;

#############################################################################
##
#F  NumberConjugacyClasses( [<U>, ]<H> )  . . . . . . . . . . . . . . . . . .
#F  . . . . .  compute the number of conjugacy classes of elements in a group
##
##  number of conjugacy classes of <H> [under the action of <U>]
##
NumberConjugacyClasses := function( arg )

    # check that the argument is a group
    if not IsGroup( arg[1] )  then
      Error("<G> must be a group");
    fi;
    InfoGroup1("#I  NumberConjugacyClasses: ",GroupString(arg[1],"G"),"\n");

    if Length( arg ) = 1 then

      # number of conjugacy classes of 'arg[1]'
      if not IsBound( arg[1].numberConjugacyClasses )  then

        if IsBound( arg[1].conjugacyClasses ) then
          arg[1].numberConjugacyClasses := Length(arg[1].conjugacyClasses);
        else
          arg[1].numberConjugacyClasses :=
                        arg[1].operations.NumberConjugacyClasses( arg[1] );
        fi;

      fi;

      # return the number of classes
      InfoGroup1( "#I  NumberConjugacyClasses: returns ",
                  arg[1].NumberConjugacyClasses, "\n" );
      return arg[1].numberConjugacyClasses;

    elif Length( arg ) = 2 then

      # number of conjugacy classes of 'arg[2]' under the action of 'arg[1]'
      return arg[1].operations.NumberConjugacyClasses( arg[1], arg[2] );

    else
      Error( "usage: NumberConjugacyClasses( [<U>, ]<H> )" );
    fi;

end;

#############################################################################
##
#F  GroupOps.NumberConjugacyClasses( [<U>, ]<H> )
##
GroupOps.NumberConjugacyClasses := function( arg )
    if Length( arg ) = 1 then
      return Length( ConjugacyClasses( arg[1] ) );
    else
      return Number( ConjugacyClasses( arg[1] ),
                     x -> x.representative in arg[2] );
    fi;
    end;

#############################################################################
##
#F  PCore( <G>, <p> ) . . . . . . . . . . . . . . . . . . . p-core of a group
##
##  'PCore' returns the <p>-core of the group <G>, i.e., the  largest  normal
##  <p> subgroup of <G>.  This is the core of the <p> Sylow subgroups.
##
PCore := function ( G, p )

    # check the arguments
    if not IsGroup( G )  then
        Error("<G> must be a group");
    fi;
    if not IsInt( p )  or p < 0  or not IsPrime( p )  then
        Error("<p> must be a prime");
    fi;

    # compute the <p>-core
    if not IsBound( G.pCores )  then
        G.pCores := [];
    fi;
    if not IsBound( G.pCores[p] )  then
        G.pCores[p] := G.operations.PCore( G, p );
    fi;

    # return the <p>-core
    return G.pCores[p];
end;

GroupOps.PCore := function ( G, p )
    return Core( G, SylowSubgroup( G, p ) );
end;


#############################################################################
##
#F  GroupOps.Radical( <G> ) . . . . . . . . . . . . . . .  radical of a group
##
##  'Radical' returns the radical of <G>, i.e., the largest  normal  solvable
##  subgroup of <G>.
##
GroupOps.Radical := function ( G )
    local   R,  p;
    if IsSolvable( G )  then
        R := G;
    else
        Error("sorry, cannot compute the radical of <G>");
    fi;
    return R;
end;


#############################################################################
##
#F  SylowSubgroup( <G>, <p> ) . . . . . . . . . . .  Sylowsubgroup of a group
##
SylowSubgroup := function ( G, p )

    # check the arguments
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    elif not IsFinite( G )  then
        Error( "<G> must be a finite group" );
    elif not IsInt( p ) or p < 2 or not IsPrime( p )  then
        Error( "<p> must be a positive prime" );
    fi;
    InfoGroup1( "#I  SylowSubgroup: ",GroupString(G,"G"),", <p> = ",p,"\n" );

    # compute the Sylow subgroup
    if not IsBound( G.sylowSubgroups )  then
        G.sylowSubgroups := [];
    fi;
    if not IsBound( G.sylowSubgroups[p] )  then
        G.sylowSubgroups[p] := G.operations.SylowSubgroup( G, p );
    fi;

    # return the Sylow subgroup
    InfoGroup1("#I  SylowSubgroup: ",
               GroupString(G.sylowSubgroups[p],"S"),"\n");
    return G.sylowSubgroups[p];

end;

GroupOps.SylowSubgroup := function ( G, p )
    local   S,          # <p>-Sylow subgroup of <G>, result
            r;          # random element of <G>

    # repeat until <S> is the full <p>-Sylow subgroup
    S := TrivialSubgroup( G );
    while Size( G ) / Size( S ) mod p = 0  do

        # find an element of order <p> that normalizes <S>
        repeat
            repeat
                r := Random( G );
            until Order( G, r ) mod p = 0;
            r := r ^ (Order( G, r ) / p);
        until not r in S  and ForAll( S.generators, g -> g ^ r in S );

        # add it to <S>
        S := Closure( S, r );

    od;

    # return the <p>-Sylow subgroup
    return S;       
end;


#############################################################################
##
#F  GroupOps.TrivialSubgroup( <G> ) . . . . . . . trivial subgroup of a group
##
GroupOps.TrivialSubgroup := function ( G )
    local   T;

    # check if <G> is a parent group
    if IsBound( G.parent )  then
        T := Subgroup( G.parent, [] );
    else
        T := Subgroup( G, [] );
    fi;

    # add the set of elements
    T.elements := [ T.identity ];
    return T;

end;

#############################################################################
##
#F  GroupOps.FusionConjugacyClasses( <S>, <R> ) . . . . . . .  compute fusion
##
##  The fusion of the conjugacy classes from the group <S> to the group <R>
##  is returned as a list containing at position $i$ the position of the
##  conjugacy class of <R> containing the $i$--th conjugacy class of <S>.
##  If both <S> and <R> have a component 'charTable', the fusion is stored
##  in '<S>.charTable'.
## 
GroupOps.FusionConjugacyClasses := function( S, R )

    local i, k, t, p,  # loop and help variables
          Sclasses,    # conjugacy classes of S
          Rclasses,    # conjugacy classes of R
          fusion,      # the fusion map
          hom,         # natural homomorphism from S onto R
          orders;      # list of orders of representatives

    if not IsGroup( S ) or not IsGroup( R ) then
        Error("usage: FusionConjugacyClasses( <subgroup>, <group>      )\n",
       "              FusionConjugacyClasses( <group>   , <factorgroup>)\n");
    fi;

    # if the fusion is already stored, return it
    if IsBound( S.fusionConjugacyClasses ) then
      for i in S.fusionConjugacyClasses do
        if i.range = R then
          return i.map;
        fi;
      od;
    fi;

    Sclasses:= ConjugacyClasses( S );
    Rclasses:= ConjugacyClasses( R );

    fusion:= [];

    if Parent( S ) = Parent( R ) then 

      # subgroup fusion

      if IsBound( R.charTable ) then
        orders:= R.charTable.orders;
      else
        orders:= List( Rclasses, x -> Order( R, x.representative ) );
      fi;

      for i in Sclasses do
        k:= i.representative;
        t:= Order( R, k );
        p:= 0;
        repeat
          p:= p+1;
        until t = orders[p] and k in Rclasses[p];
        Add( fusion, p );
      od;

    else

      # factor fusion

      hom:= NaturalHomomorphism( S, R );

      for i in Sclasses do
        k:= Image( hom, i.representative );
        p:= 0;
        repeat
          p:=p+1;
        until k in Rclasses[p];
        Add( fusion, p );
      od;

    fi;

    # store the fusion in the group
    if not IsBound( S.fusionConjugacyClasses ) then
      S.fusionConjugacyClasses:= [];
    fi;
    Add( S.fusionConjugacyClasses,
         rec( source := S, map := fusion, range := R ) );

    # store the fusion in '<S>.charTable' if possible
    if IsBound( S.charTable ) and IsBound( R.charTable ) then
      StoreFusion( S.charTable, R.charTable, fusion );
    fi;

    return fusion;

    end;

#############################################################################
##
#F  GroupOps.DerivedSeries( <G> ) . . . . . . . . . derived series of a group
##
GroupOps.DerivedSeries := function ( G )
    local   S,          # derived series of <G>, result
            D;          # derived subgroups

    # print out a warning for infinite groups
    if not IsFinite( G )  then
        Print("#W  DerivedSeries: may not stop for infinite group <G>\n");
    fi;

    # compute the series by repeated calling of 'DerivedSubgroup'
    S := [ G ];
    InfoGroup2( "#I  DerivedSeries: step ", Length(S), "\n" );
    D := DerivedSubgroup( G );
    while D <> S[ Length(S) ]  do
        Add( S, D );
        InfoGroup2( "#I  DerivedSeries: step ", Length(S), "\n" );
        D := DerivedSubgroup( D );
    od;

    # return the series when it becomes stable
    return S;

end;


#############################################################################
##
#F  ElementaryAbelianSeries( <G> )  . .  elementary abelian series of a group
##
ElementaryAbelianSeries := function( G )
    local   L,  i;

    # if <G> is a list compute a elementary series through a given normal one
    if IsList( G )  then
    	if not IsSolvable( G[1] )  then
    	    Error( "<G> must be solvable" );
    	fi;
        for i  in [ 1 .. Length(G)-1 ]  do
          if not IsNormal(G[1],G[i+1]) or not IsSubgroup(G[i],G[i+1])  then
              Error( "<G> must be normal series" );
          fi;
        od;
    	L := G[1].operations.ElementaryAbelianSeries( G );

    # otherwise compute a elementary series if it is not known
    else
    	if not IsSolvable( G )  then
    	    Error( "<G> must be solvable" );
    	fi;
        if not IsBound( G.elementaryAbelianSeries )  then
    	    L := G.operations.ElementaryAbelianSeries( G );
    	    G.elementaryAbelianSeries := L;
    	else
    	    L := G.elementaryAbelianSeries;
        fi;
    fi;
    return L;

end;

GroupOps.ElementaryAbelianSeries := function( G )
    local   A,  f,  L;

    # if <G> is a list convert all groups in that list
    if IsList( G )  then
    	A := AgGroup( G[1] );
    	f := A.bijection^-1;
    	L := A.operations.ElementaryAbelianSeries(List(G,x->Image(f,x)));
    	f := A.bijection;

    # convert <G> into an ag group
    else
        A := AgGroup( G );
    	f := A.bijection;
    	L := A.operations.ElementaryAbelianSeries( Image( f^-1, G ) );
    fi;

    # convert back into <G>
    return List( L, x -> Image( f, x ) );

end;


#############################################################################
##
#F  GroupOps.CompositionSeries( <G> ) . . . . . composition series of a group
##
GroupOps.CompositionSeries := function( G )
    Error( "cannot compute the composition series of <G>" );
end;


#############################################################################
##
#F  DisplayCompositionSeries(<S>) . . . . . . .  display a composition series
##
DisplayCompositionSeries := function ( S )
    local   i, f;

    # ok, we accept groups too
    if IsGroup( S )  then
        S := CompositionSeries( S );
    fi;

    # display the composition series
    Print( GroupString( S[1], "G" ), "\n" );
    for i  in [1..Length(S)-1]  do
        f := S[i].operations.FactorGroup( S[i], S[i+1] );
        Print( " | ",IsomorphismTypeFiniteSimpleGroup(f),"\n");
        if i < Length(S)-1  then
            Print( GroupString( S[i+1], "S" ), "\n" );
        else
            Print( GroupString( S[i+1], "1" ), "\n" );
        fi;
    od;

end;


#############################################################################
##
#F  GroupOps.LowerCentralSeries( <G> )  . . . lower central series of a group
##
GroupOps.LowerCentralSeries := function ( G )
    local   S,          # lower central series of <G>, result
            C;          # commutator subgroups

    # print out a warning for infinite groups
    if not IsFinite( G )  then
      Print("#W  LowerCentralSeries: may not stop for infinite group <G>\n");
    fi;

    # compute the series by repeated calling of 'CommutatorSubgroup'
    S := [ G ];
    InfoGroup2( "#I  LowerCentralSeries: step ", Length(S), "\n" );
    C := DerivedSubgroup( G );
    while C <> S[ Length(S) ]  do
        Add( S, C );
        InfoGroup2( "#I  LowerCentralSeries: step ", Length(S), "\n" );
        C := CommutatorSubgroup( G, C );
    od;

    # return the series when it becomes stable
    return S;

end;


#############################################################################
##
#F  PCentralSeries( <G>, <p> )  . . . . . .  . . . . . . . <p>-central series
##
PCentralSeries := function ( G, p )

    # <p> must be a prime
    if not IsPrimeInt( p )  then
    	Error( "<p> must be a prime" );
    fi;

    # check if already know this p-central series
    if not IsBound( G.pCentralSeries )  then
    	G.pCentralSeries := [];
    fi;
    if not IsBound( G.pCentralSeries[p] )  then
    	G.pCentralSeries[p] := G.operations.PCentralSeries( G, p );
    fi;
    return G.pCentralSeries[p];

end;

GroupOps.PCentralSeries := function( G, p )
    local   i,  L,  C,  S,  N,  P;

    # Start with <G>.
    L := [];
    N := G;
    repeat
    	Add( L, N );
        S := N;
        C := CommutatorSubgroup( G, S );
        P := Subgroup( Parent(G), List( S.generators, x -> x ^ p ) );
        N := Closure( C, P );
    until N = S;
    return L;

end;


#############################################################################
##
#F  SubnormalSeries( <G>, <U> ) . subnormal series from a group to a subgroup
##
SubnormalSeries := function ( G, U )
    local   S;          # subnormal series of <U> in <G>, result

    # check thet the arguments are groups with a common parent
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    elif not IsGroup( U )  then
        Error( "<U> must be a group" );
    fi;

    # <G> and <U> must have a common parent
    Parent( G, U );
    InfoGroup1( "#I  SubnormalSeries: of ", GroupString(U,"U"), " in ",
                GroupString(G,"G"), "\n");

    # compute the subnormal series
    if IsParent( G )  then
        if not IsBound( U.subnormalSeries )  then
            U.subnormalSeries := G.operations.SubnormalSeries( G, U );
        fi;
        S := U.subnormalSeries;
    else
        #N 9-Dec-91 fceller: we could use a subnormal series of the parent
        S := G.operations.SubnormalSeries( G, U );
    fi;

    # return the result
    InfoGroup1( "#I  SubnormalSeries: returns series of length ",
                Length( S ),"\n");
    return S;

end;

GroupOps.SubnormalSeries := function ( G, U )
    local   S,          # subnormal series of <U> in <G>, result
            C;          # normal closure of <U> in <G> resp. <C>

    # compute the subnormal series by repeated calling of 'NormalClosure'
    S := [ G ];
    InfoGroup2( "#I  SubnormalSeries: step ", Length(S), "\n" );
    C := NormalClosure( G, U );
    while C <> S[ Length( S ) ]  do
        Add( S, C );
        InfoGroup2( "#I  SubnormalSeries: step ", Length(S), "\n" );
        C := NormalClosure( C, U );
    od;

    # return the series
    return S;

end;


#############################################################################
##
#F  GroupOps.UpperCentralSeries( <G> )  . . . upper central series of a group
##
GroupOps.UpperCentralSeries := function ( G )
    local   S,          # upper central series of <G>, result
            C,          # centre
            hom;        # homomorphisms of <G> to '<G>/<C>'

    # print out a warning for infinite groups
    if not IsFinite( G )  then
      Print("#W  UpperCentralSeries: may not stop for infinite group <G>\n");
    fi;

    # compute the series by repeated calling of 'CommutatorSubgroup'
    S := [ TrivialSubgroup( G ) ];
    InfoGroup2( "#I  UpperCentralSeries: step ", Length(S), "\n" );
    C := Centre( G );
    while C <> S[ Length(S) ]  do
        Add( S, C );
        InfoGroup2( "#I  UpperCentralSeries: step ", Length(S), "\n" );
        hom := NaturalHomomorphism( G, G / C );
        C := PreImage( hom, Centre( hom.range ) );
    od;

    # return the series when it becomes stable
    return Reversed( S );

end;

#############################################################################
##
#F  GroupOps.SizesConjugacyClasses( <G> )
##
GroupOps.SizesConjugacyClasses := function( G )

    if IsBound( G.charTable ) then
      return G.charTable.classes;
    else
      return List( ConjugacyClasses( G ), Size );
    fi;
    end;

#############################################################################
##
#F  GroupOps.IsAbelian( <G> ) . . . . . . . . . .  test if a group is abelian
##
GroupOps.IsAbelian := function ( G )
    local   i, j;       # loop variables

    # test if every generator commutes with all the others
    for i  in [ 2 .. Length(G.generators) ]  do
        for j  in [ 1 .. i-1 ]  do
            if Comm( G.generators[i], G.generators[j] ) <> G.identity  then
                return false;
            fi;
        od;
    od;

    # all generators commute, return 'true'
    return true;

end;

#############################################################################
##
#F  GroupOps.IsCentral( <G>, <U> ) . . . . is a group centralized by another?
##
GroupOps.IsCentral := function ( G, U )
    local   g,          # one generator of <G>
            u;          # one generator of <U>

    # test if all generators of <U> are fixed by the generators of <G>
    for u  in U.generators  do
        for g  in G.generators  do
            if Comm( u, g ) <> U.identity  then
                return false;
            fi;
        od;
    od;

    # all generators of <U> are fixed, return 'true'
    return true;

end;


#############################################################################
##
#F  IsConjugate(<G>,<x>,<y>)  . test if two objects are conjugated in a group
##
IsConjugate := function ( G, x, y )
    local   isConj;     # 'true' if <x> and <y> are conjugated, result

    # check the arguments
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    fi;
    if IsGroup( x )  then
        Parent( G, x, y );
    else
        if not x in Parent(G)  or not y in Parent(G)  then
            Error( "<x> and <y> must lie in the parent group of <G>" );
        fi;
    fi;
    InfoGroup1( "#I  IsConjugate: is <x> conjugated to <y> in ",
                GroupString(G,"G"), "\n");

    # test if <x> and <y> are conjugated in <G>
    isConj := G.operations.IsConjugate( G, x, y );

    # return the result
    InfoGroup1( "#I  IsConjugate: returns ",isConj,"\n" );
    return isConj;

end;

GroupOps.IsConjugate := function ( G, x, y )
    return RepresentativeOperation( G, x, y ) <> false;
end;


#############################################################################
##
#F  GroupOps.IsCyclic( <G> )  . . . . . . . . . . . test if a group is cyclic
##
GroupOps.IsCyclic := function ( G )
    local   isCyclic;   # 'true' if <G> is cyclic, result

    # if <G> is not abelian it is certainly not cyclic
    if not IsAbelian( G )  then
        isCyclic := false;

    # if <G> has only one generator it is certainly cyclic
    elif Length( G.generators ) <= 1  then
        isCyclic := true;

    # if <G> is finite, test if the <p>-th powers of the generators
    # generate a subgroup of index <p> for all prime divisors <p>
    elif IsFinite( G )  then
        isCyclic := ForAll( Set( Factors( Size( G ) ) ),
                p -> Index( G, Subgroup( Parent( G ),
                                         List(G.generators,g->g^p)) ) = p );

    # otherwise test if the abelian invariants are that of $Z$
    else
        isCyclic := AbelianInvariants( G ) = [ 0 ];
    fi;

    # return the result
    return isCyclic;

end;


#############################################################################
##
#F  GroupOps.IsElementaryAbelian(<G>) . test if a group is elementary abelian
##
GroupOps.IsElementaryAbelian := function ( G )
    local   isEla,      # 'true' if <G> is elementary abelian, result
            p;          # order of one generator of <G>

    # if <G> is not abelian it is certainly not elementary abelian
    if not IsAbelian( G )  then
        isEla := false;

    # if <G> is trivial it is certainly elementary abelian
    elif IsTrivial( G )  then
        isEla := true;

    # if <G> is infinite it is certainly not elementary abelian
    elif IsBound( G.isFinite ) and not G.isFinite  then
        isEla := false;

    # otherwise compute the order of the first generator
    else
        p := Order( G, G.generators[1] );

        # if the order is not a prime <G> is certainly not elementary abelian
        if not IsPrime( p )  then
            isEla := false;

        # otherwise test that all other generators have order <p>
        else
            isEla := ForAll( G.generators, gen -> gen^p = G.identity );
        fi;

    fi;

    # return the result
    return isEla;

end;


#############################################################################
##
#F  GroupOps.IsNilpotent( <G> )   . . . . . . .  test if a group is nilpotent
##
GroupOps.IsNilpotent := function ( G )
    local   S;          # lower central series of <G>

    # give a warning if the group is infinite
    if not IsFinite( G )  then
        Print( "#W  IsNilpotent: may not stop for infinite group <G>" );
    fi;

    # compute the lower central series
    S := LowerCentralSeries( G );

    # <G> is nilpotent if the lower central series reaches the trivial group
    return IsTrivial( S[ Length( S ) ] );

end;


#############################################################################
##
#F  IsNormal( <G>, <U> )  . . . . .  test if a group is normalizer by another
##
IsNormal := function ( G, U )
    local   isNor;      # 'true' if <U> is normal in <G>, result

    # check that the arguments are groups with a common parent
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    elif not IsGroup( U )  then
        Error("<U> must be a group");
    fi;

    # <U> and <G> must have a common parent
    Parent( G, U );
    InfoGroup1( "#I  IsNormal: is ", GroupString(U,"U"),
                " normal in ", GroupString(G,"G"), "\n" );
 
    # if <G> is the parent, use the entry '<U>.isNormal'
    if IsParent( G )  then
        if not IsBound( U.isNormal )  then
            U.isNormal := G.operations.IsNormal( G, U );
        fi;
        isNor := U.isNormal;

    # otherwise
    else
        if IsBound( U.isNormal )  and U.isNormal  then
            isNor := true;
        else
            isNor := G.operations.IsNormal( G, U );
        fi;
    fi;

    # return the result
    InfoGroup1( "#I  IsNormal: returns ", isNor, "\n" );
    return isNor;

end;

GroupOps.IsNormal := function ( G, U )
    local   gens,       # generators of <G>
            gen,        # one generator of <G>
            u;          # one generator of <U>

    # get a generating system of <G>
    if IsFinite( G )  then
        gens := Set( G.generators );
    else
        gens := ShallowCopy( G.generators );
        Append( gens, List( G.generators, gen -> gen ^ -1 ) );
    fi;

    # test if all generators of <U> are left in <U>
    for u  in U.generators  do
        for gen  in gens  do
            if not u^gen in U  then
                return false;
            fi;
        od;
    od;

    # all generators of <U> are left in <U>, return 'true'
    return true;

end;


#############################################################################
##
#F  GroupOps.IsPerfect( <G> ) . . . . . . . . . .  test if a group is perfect
##
GroupOps.IsPerfect := function ( G )
    local   isPerfect;  # 'true' if <G> is perfect, result

    # if the group is finite test the index of the derived subgroup
    if IsFinite(G)  then
        isPerfect := Index( G, DerivedSubgroup(G) ) = 1;

    # otherwise test the abelian invariants of the commutator factor group
    else
        isPerfect := Length(AbelianInvariants(CommutatorFactorGroup(G)))=0;
    fi;

    # return the result
    return isPerfect;

end;


#############################################################################
##
#F  GroupOps.IsSimple( <G> )  . . . . . . . . . . . test if a group is simple
##
GroupOps.IsSimple := function ( G )
    local   C,          # one conjugacy class of <G>
            g;          # representative of <C>

    # loop over the conjugacy classes
    for C  in ConjugacyClasses( G )  do
        g := Representative( C );
        if g <> G.identity
            and NormalClosure( G, Subgroup( Parent(G), [ g ] ) ) <> G
        then
            return false;
        fi;
    od;

    # all classes generate the full group
    return true;
end;


#############################################################################
##
#F  GroupOps.IsSolvable( <G> )  . . . . . . . . . test if a group is solvable
##
GroupOps.IsSolvable := function ( G )
    local   S;          # derived series of <G>

    # give a warning for infinite groups, where this may run forever
    if not IsFinite( G )  then
        Print( "#W  IsSolvable: may not stop for infinite group <G>" );
    fi;

    # compute the derived series of <G>
    S := DerivedSeries( G );

    # the group is solvable if the derived series reaches the trivial group
    return IsTrivial( S[ Length( S ) ] );

end;


#############################################################################
##
#F  IsSubgroup( <G>, <U> )  . . . .  test if a group is a subgroup of another
##
IsSubgroup := function ( G, U )
    local   isSub;

    # check that the arguments are groups with a common parent
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    elif not IsGroup( U )  then
        Error( "<U> must be a group" );
    fi;
    Parent( G, U );
    InfoGroup1( "#I  IsSubgroup: is ", GroupString(U,"U"),
                " a subgroup of ", GroupString(G,"G"), "\n");

    # test if <U> is a subgroup of <G>
    if IsParent( G )  then
        isSub := true;
    else
        isSub := G.operations.IsSubgroup( G, U );
    fi;

    # return the result
    InfoGroup1( "#I  IsSubgroup: returns ", isSub, "\n" );
    return isSub;

end;

GroupOps.IsSubgroup := function ( G, U )
    local   isSub;      # 'true' if <U> is a subgroup of <G>, result

    # if the elements of <G> are known use then
    if IsBound( G.elements )  then
        isSub := IsSubsetSet( G.elements, Set( U.generators ) );

    # otherwise test if the generators lie in <G>
    else
        isSub := ForAll( U.generators, gen -> gen in G );
    fi;

    # return the result
    return isSub;

end;


#############################################################################
##
#F  IsSubnormal( <G>, <U> ) . . . . . test if a group is subnormal in another
##
IsSubnormal := function ( G, U )
    local   isSub;

    # check that the arguments are groups with a common parent
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    elif not IsSubgroup( G, U )  then
        Error( "<U> must be a subgroup of <G>" );
    fi;

    # <U> and <G> must have a common parent
    Parent( G, U );
    InfoGroup1( "#I  IsSubnormal: is ", GroupString(U,"U"),
                " subnormal in ", GroupString(G,"G"), "\n" );

    # if <G> is the parent, use the entry '<U>.isSubnormal'
    if IsParent( G )  then
        if not IsBound( U.isSubnormal )  then
            U.isSubnormal := G.operations.IsSubnormal( G, U );
        fi;
        isSub := U.isSubnormal;

    # otherwise
    else
        if IsBound( U.isSubnormal ) and U.isSubnormal  then
            isSub := true;
        else
            isSub := G.operations.IsSubnormal( G, U );
        fi;
    fi;

    # return the result
    InfoGroup1( "#I  IsSubnormal: returns ", isSub, "\n" );
    return isSub;

end;

GroupOps.IsSubnormal := function ( G, U )
    local   S;          # subnormal series of <U> in <G>

    # compute the subnormal series of <U> in <G>
    S := SubnormalSeries( G, U );

    # <U> is subnormal if the series reaches <U>
    return S[ Length(S) ] = U;

end;


#############################################################################
##
#F  GroupOps.IsTrivial( <G> ) . . . . . . . . . .  test if a group is trivial
##
GroupOps.IsTrivial := function ( G )
    return 0 = Length(G.generators);
end;


###########################################################################
##
#F  GroupOps.CharacterDegrees( <G> )  . . . . . character degress of irr(<G>)
##
GroupOps.CharacterDegrees := function( G )
    return List( CharTable( G ).irreducibles, x -> x[1] );
end;


#############################################################################
##
#F  GroupOps.AbelianInvariants( <G> ) . . . . . abelian invariants of a group
##
GroupOps.AbelianInvariants := function ( G )
    local   G,  H,  p,  l,  r,  i,  j,  gns,  inv,  ranks, g;

    if not IsFinite(G)  then
        Error( "<G> must be a finite group" );
    elif 0 = Length(G.generators)  then
        return [];
    fi;

    gns := G.generators;
    inv := [];
    for p  in Set( Factors( Size( G ) ) )  do
        ranks := [];
        repeat
            H := TrivialSubgroup( G );
            for g  in gns  do
                H := Closure( H, g ^ p );
            od;
            r := Size( G ) / Size( H );
            InfoGroup2( "#I  AbelianInvariants: |<G>| = ", Size( G ),
                        ", |<H>| = ", Size( H ), "\n" );
            G   := H;
            gns := G.generators;
            if r <> 1  then  Add( ranks, Length( Factors( r ) ) );  fi;
        until r = 1;
        InfoGroup2( "#I  AbelianInvariants: <ranks> = ", ranks, "\n" );
        l := List( [ 1 .. ranks[1] ], x -> 1 );
        for i  in ranks  do
            for j  in [ 1 .. i ]  do
                l[ j ] := l[ j ] * p;
            od;
        od;
        Append( inv, l );
    od;

    Sort( inv );
    return inv;

end;


#############################################################################
##
#F  GroupOps.Exponent( <G> )  . . . . . . . . . . . . . . . . exponent of <G>
##
GroupOps.Exponent := function( G )
    return Lcm(List(ConjugacyClasses(G),x->Order(G,Representative(x))));
end;


#############################################################################
##
#F  Index( <G>, <U> ) . . . . . . . . . . . .  index of a subgroup in a group
##
Index := function ( G, U )
    local   index;      # index of <U> in <G>, result

    # check that the arguments are groups with a common parent
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    elif not IsGroup( U )  then
        Error( "<U> must be a group" );
    fi;

    # <G> and <U> must have a common parent
    Parent( G, U );
    InfoGroup1("#I  Index: of ", GroupString(U,"U"), " in ",
                GroupString(G,"G"), "\n");

    # compute the index
    if IsParent( G )  then
        if not IsBound( U.index )  then
            U.index := G.operations.Index( G, U );
        fi;
        index := U.index;
    else
        index := G.operations.Index( G, U );
    fi;

    # return the index
    InfoGroup1("#I  Index: returns ",index,"\n");
    return index;

end;

GroupOps.Index := function ( G, U )
    return Size( G ) / Size( U );
end;


#############################################################################
##
#F  GroupOps.SmallestGenerators(<G>)  . smallest generating system of a group
##
GroupOps.SmallestGenerators := function ( G )
    local   gens,       # smallest generating system of <G>, result
            gen,        # one generator of <gens>
            H;          # subgroup generated by <gens> so far

    # start with the empty generating system and the trivial subgroup
    gens := [];
    H := TrivialSubgroup( G );

    # loop over the elements of <G> in their order
    for gen  in Elements( G )  do

        # add the element not lying in the subgroup generated by the previous
        if not gen in H  then
            Add( gens, gen );
            H := Closure( H, gen );

            # it is important to know when to stop
            if Size( H ) = Size( G )  then
                return gens;
            fi;

        fi;

    od;

    # well we should never come here
    Error("panic, <G> not generated by its elements");
end;


#############################################################################
##
#F  Agemo( <G>, <p> ) . . . . . . . . . . . . . . .  agemo of a <p>-group <G>
##
Agemo := function( G, p )

    # <G> must be a <p>-group
    if 1 < Length(Set(Factors(Size(G))))  then
        Error( "<G> must be a p-group" );
    fi;
    if Size(G) mod p <> 0  then
        Error( "<G> must be a <p>-group" );
    fi;
    
    # if the agemo is unknown compute it
    if not IsBound(G.agemo)  then
        G.agemo := G.operations.Agemo(G,p);
    fi;
    
    # and return
    return G.agemo;
    
end;

GroupOps.Agemo := function( G, p )
    local   A,  C;
    
    # if <G> is abelian,  raise the generators to the p.th power
    if IsAbelian(G)  then
        A := Subgroup( G, List( G.generators, x -> x^p ) );
        
    # otherwise compute the conjugacy classes of elements
    else
        C := Set( List( ConjugacyClasses(G), x -> Representative(x)^p ) );
        A := NormalClosure( G, G.operations.Subgroup( Parent(G), C ) );
    fi;
    
    # and return
    return A;
    
end;


#############################################################################
##
#F  AgemoAbove( <G>, <C>, <p> )	. . . . . . . . . . . . . . . . . . . . local
##
AgemoAbove := function( G, C, p )
    local   A;
    
    # if we know the agemo,  return
    if IsBound(G.agemo)  then
        return G.agemo;
    fi;
    
    # if the derived subgroup of <G> is contained in <C> it is easy
    if IsSubgroup( C, DerivedSubgroup(G) )  then
        A := Subgroup( Parent(G), List( G.generators, x -> x^p ) );
        
    # otherwise use 'Agemo'
    else
        InfoGroup2( "#I  computing conjugacy classes for agemo\n" );
        G.agemo := G.operations.Agemo( G, p );
        A := G.agemo;
    fi;
    
    # and return
    return A;
    
end;

        
#############################################################################
##
#F  JenningsSeries( <G> ) . . . . . . . . . . .  jennings series of a p-group
##
JenningsSeries := function( G )

    # if we know the series,  return
    if IsBound(G.jenningsSeries)  then
    	return G.jenningsSeries;
    fi;

    # <G> must be a p-group
    if not IsFinite(G) or not IsPrimePowerInt(Size(G))  then
    	Error( "<G> must be a p-group" );
    fi;

    # compute the series and return
    G.jenningsSeries := G.operations.JenningsSeries(G);
    return G.jenningsSeries;

end;

GroupOps.JenningsSeries := function( G )
    local   p,  n,  i,  C,  L;
    
    # get the prime
    p := Factors(Size(G))[1];
    
    # and compute the series
    L := [ G ];
    while not IsTrivial( L[Length(L)] )  do
        n := Length(L)+1;
        i := QuoInt( n+p-1, p );
        C := CommutatorSubgroup( L[n-1], G );
        L[n] := Closure( C, AgemoAbove( L[i], C, p ) );
    od;
    
    # and return
    return L;
    
end;


#############################################################################
##
#F  DimensionsLoewyFactors( <G> )  . . . . . . dimension of the loewy factors
##
DimensionsLoewyFactors := function( G )

    # if we know the series,  return
    if IsBound(G.dimensionsLoewyFactors)  then
    	return G.dimensionsLoewyFactors;
    fi;

    # <G> must be a p-group
    if not IsFinite(G) or not IsPrimePowerInt(Size(G))  then
    	Error( "<G> must be a p-group" );
    fi;

    # compute the series and return
    G.dimensionsLoewyFactors := G.operations.DimensionsLoewyFactors(G);
    return G.dimensionsLoewyFactors;

end;

GroupOps.DimensionsLoewyFactors := function( G )
    local   p,  J,  x,  P,  i,  s,  j;
    
    # get the prime and the jennings series
    p := Factors(Size(G))[1];
    J := JenningsSeries(G);
    
    # construct the jennings polynomial over the rationals
    x := X(Rationals);
    P := x^0;
    for i  in [ 1 .. Length(J)-1 ]  do
        s := 0*x;
        for j  in [ 0 .. p-1 ]  do
            s := s + x^(j*i);
        od;
        P := P * s^LogInt( Index( J[i], J[i+1] ), p );
    od;
    
    # the coefficients are the dimension of the loewy series
    return ShiftedCoeffs( P.coefficients, P.valuation );
    
end;


#############################################################################
##
#F  IsomorphismTypeFiniteSimpleGroup(<G>) . . . . . . . . . . ismorphism type
##
IsomorphismTypeFiniteSimpleGroup := function (G)
    local   size,       # size of <G>
            size2,      # size of simple group
            p,          # dominant prime of <size>
            q,          # power of <p>
            m,          # <q> = <p>^<m>
            n,          # index, e.g., the $n$ in $A_n$
            g,          # random element of <G>
            C;          # centralizer of <g>

    # check that <G> is simple
    if IsGroup( G )  and not IsSimple( G )  then
        Error("<G> must be simple");
    fi;

    # grab the size of <G>
    if IsGroup( G )  then
        size := Size(G);
    elif IsInt( G )  then
        size := G;
    else
        Error("<G> must be a group or the size of a group");
    fi;

    # test if <G> is a cyclic group of prime size
    if IsPrime( size )  then
        return Concatenation( "Z(", String(size), ")" );
    fi;

    # test if <G> is A(5) ~ A(1,4) ~ A(1,5)
    if size = 60  then
        return Concatenation( "A(5) ",
                            "~ A(1,4) = L(2,4) ",
                            "~ B(1,4) = O(3,4) ",
                            "~ C(1,4) = S(2,4) ",
                            "~ 2A(1,4) = U(2,4) ",
                            "~ A(1,5) = L(2,5) ",
                            "~ B(1,5) = O(3,5) ",
                            "~ C(1,5) = S(2,5) ",
                            "~ 2A(1,5) = U(2,5)" );
    fi;

    # test if <G> is A(6) ~ A(1,9)
    if size = 360  then
        return Concatenation( "A(6) ",
                            "~ A(1,9) = L(2,9) ",
                            "~ B(1,9) = O(3,9) ",
                            "~ C(1,9) = S(2,9) ",
                            "~ 2A(1,9) = U(2,9)" );
    fi;

    # test if <G> is either A(8) ~ A(3,2) ~ D(3,2) or A(2,4)
    if size = 20160  then

        # check that <G> is a group
        if not IsGroup( G )  then
            return Concatenation( "cannot decide from size alone between ",
                                  "A(8) ",
                                "~ A(3,2) = L(4,2) ",
                                "~ D(3,2) = O+(6,2) ",
                                "and ",
                                  "A(2,4) = L(3,4) " );
        fi;

        # compute the centralizer of an element of order 5
        repeat
            g := Random(G);
        until Order(G,g) mod 5 = 0;
        g := g ^ (Order(G,g) / 5);
        C := Centralizer( G, g );

        # the centralizer in A(8) has size 15, the one in A(2,4) has size ...
        if Size(C) = 15 then
            return Concatenation( "A(8) ",
                                "~ A(3,2) = L(4,2) ",
                                "~ D(3,2) = O+(6,2)" );
        else
            return "A(2,4) = L(3,4)";
        fi;

    fi;

    # test if <G> is A(n)
    n := 6;  size2 := 360;
    repeat
        n := n + 1;  size2 := size2 * n;
    until size <= size2;
    if size = size2  then
        return Concatenation( "A(", String(n), ")" );
    fi;

    # test if <G> is one of the sporadic simple groups
    if size = 2^4 * 3^2 * 5 * 11  then
        return "M(11)";
    elif size = 2^6 * 3^3 * 5 * 11  then
        return "M(12)";
    elif size = 2^3 * 3 * 5 * 7 * 11 * 19  then
        return "J(1)";
    elif size = 2^7 * 3^2 * 5 * 7 * 11  then
        return "M(22)";
    elif size = 2^7 * 3^3 * 5^2 * 7  then
        return "HJ = J(2) = F(5-)";
    elif size = 2^7 * 3^2 * 5 * 7 * 11 * 23  then
        return "M(23)";
    elif size = 2^9 * 3^2 * 5^3 * 7 * 11  then
        return "HS";
    elif size = 2^7 * 3^5 * 5 * 17 * 19  then
        return "J(3)";
    elif size = 2^10 * 3^3 * 5 * 7 * 11 * 23  then
        return "M(24)";
    elif size = 2^7 * 3^6 * 5^3 * 7 * 11  then
        return "Mc";
    elif size = 2^10 * 3^3 * 5^2 * 7^3 * 17  then
        return "He = F(7)";
    elif size = 2^14 * 3^3 * 5^3 * 7 * 13 * 29  then
        return "Ru";
    elif size = 2^13 * 3^7 * 5^2 * 7 * 11 * 13  then
        return "Suz";
    elif size = 2^9 * 3^4 * 5 * 7^3 * 11 * 19 * 31  then
        return "ON";
    elif size = 2^10 * 3^7 * 5^3 * 7 * 11 * 23  then
        return "Co(3)";
    elif size = 2^18 * 3^6 * 5^3 * 7 * 11 * 23  then
        return "Co(2)";
    elif size = 2^17 * 3^9 * 5^2 * 7 * 11 * 13  then
        return "Fi(22)";
    elif size = 2^14 * 3^6 * 5^6 * 7 * 11 * 19  then
        return "HN = F(5) = F = F(5+)";
    elif size = 2^8 * 3^7 * 5^6 * 7 * 11 * 31 * 37 * 67  then
        return "Ly";
    elif size = 2^15 * 3^10 * 5^3 * 7^2 * 13 * 19 * 31  then
        return "Th = F(3) = E = F(3/3)";
    elif size = 2^18 * 3^13 * 5^2 * 7 * 11 * 13 * 17 * 23  then
        return "Fi(23)";
    elif size = 2^21 * 3^9 * 5^4 * 7^2 * 11 * 13 * 23  then
        return "Co(1) = F(2-)";
    elif size = 2^21 * 3^3 * 5 * 7 * 11^3 * 23 * 29 * 31 * 37 * 43  then
        return "J(4)";
    elif size = 2^21 * 3^16 * 5^2 * 7^3 * 11 * 13 * 17 * 23 * 29  then
        return "Fi(24) = F(3+)";
    elif size = 2^41*3^13*5^6*7^2*11*13*17*19*23*31*47  then
        return "B = F(2+)";
    elif size = 2^46*3^20*5^9*7^6*11^2*13^3*17*19*23*29*31*41*47*59*71  then
        return "M = F(1)";
    fi;

    # from now on we deal with groups of Lie-type

    # calculate the dominant prime of size
    q := Maximum( List( Collected( Factors( size ) ), s -> s[1]^s[2] ) );
    p := Factors( q )[1];

    # test if <G> is the Chevalley group A(1,7) ~ A(2,2)
    if size = 168  then
        return Concatenation( "A(1,7) = L(2,7) ",
                            "~ B(1,7) = O(3,7) ",
                            "~ C(1,7) = S(2,7) ",
                            "~ 2A(1,7) = U(2,7) ",
                            "~ A(2,2) = L(3,2)" );
    fi;

    # test if <G> is the Chevalley group A(1,8), where p = 3 <> char.
    if size = 504  then
        return Concatenation( "A(1,8) = L(2,8) ",
                            "~ B(1,8) = O(3,8) ",
                            "~ C(1,8) = S(2,8) ",
                            "~ 2A(1,8) = U(2,8)" );
    fi;

    # test if <G> is a Chevalley group A(1,2^<k>-1), where p = 2 <> char.
    if    p = 2  and IsPrime(q-1)
      and size = (q-1) * ((q-1)^2-1) / Gcd(2,(q-1)-1)
    then
        return Concatenation( "A(",  "1", ",", String(q-1), ") ",
                            "= L(",  "2", ",", String(q-1), ") ",
                            "~ B(",  "1", ",", String(q-1), ") ",
                            "= O(",  "3", ",", String(q-1), ") ",
                            "~ C(",  "1", ",", String(q-1), ") ",
                            "= S(",  "2", ",", String(q-1), ") ",
                            "~ 2A(", "1", ",", String(q-1), ") ",
                            "= U(",  "2", ",", String(q-1), ")" );
    fi;

    # test if <G> is a Chevalley group A(1,2^<k>), where p = 2^<k>+1 <> char.
    if    p <> 2  and IsPrimePowerInt( p-1 )
      and size = (p-1) * ((p-1)^2-1) / Gcd(2,(p-1)-1)
    then
        return Concatenation( "A(",  "1", ",", String(p-1), ") ",
                            "= L(",  "2", ",", String(p-1), ") ",
                            "~ B(",  "1", ",", String(p-1), ") ",
                            "= O(",  "3", ",", String(p-1), ") ",
                            "~ C(",  "1", ",", String(p-1), ") ",
                            "= S(",  "2", ",", String(p-1), ") ",
                            "~ 2A(", "1", ",", String(p-1), ") ",
                            "= U(",  "2", ",", String(p-1), ")" );
    fi;

    # try to find <n> and <q> for size of A(n,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        n := 0;
        repeat
            n := n + 1;
            size2 := q^(n*(n+1)/2)
                   * Product( [2..n+1], i -> q^i-1 ) / Gcd(n+1,q-1);
        until size <= size2;
    until size = size2 or n = 1;

    # test if <G> is a Chevalley group A(1,q) ~ B(1,q) ~ C(1,q) ~ 2A(1,q)
    # non-simple: A(1,2) ~ S(3), A(1,3) ~ A(4),
    # exceptions: A(1,4) ~ A(1,5) ~ A(5), A(1,7) ~ A(2,2), A(1,9) ~ A(6)
    if n = 1  and size = size2  then
        return Concatenation( "A(", "1", ",", String(q), ") ",
                            "= L(", "2", ",", String(q), ") ",
                            "~ B(", "1", ",", String(q), ") ",
                            "= O(", "3", ",", String(q), ") ",
                            "~ C(", "1", ",", String(q), ") ",
                            "= S(", "2", ",", String(q), ") ",
                            "~ 2A(","1", ",", String(q), ") ",
                            "= U(", "2", ",", String(q), ")" );
    fi;

    # test if <G> is a Chevalley group A(3,q) ~ D(3,q)
    # exceptions: A(3,2) ~ A(8)
    if n = 3  and size = size2  then
        return Concatenation( "A(", "3", ",", String(q), ") ",
                            "= L(", "4", ",", String(q), ") ",
                            "~ D(", "3", ",", String(q), ") ",
                            "= O+(","6", ",", String(q), ") " );
    fi;

    # test if <G> is a Chevalley group A(n,q)
    if size = size2  then
        return Concatenation( "A(", String(n),   ",", String(q), ") ",
                            "= L(", String(n+1), ",", String(q), ") " );
    fi;

    # try to find <n> and <q> for size of B(n,q) = size of C(n,q)
    # exceptions: B(1,q) ~ A(1,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        n := 1;
        repeat
            n := n + 1;
            size2 := q^(n^2)
                   * Product( [1..n], i -> q^(2*i)-1 ) / Gcd(2,q-1);
        until size <= size2;
    until size = size2  or n = 2;

    # test if <G> is a Chevalley group B(2,3) ~ C(2,3) ~ 2A(3,2) ~ 2D(3,2)
    if n = 2  and q = 3  and size = size2  then
        return Concatenation( "B(2,3) = O(5,3) ",
                            "~ C(2,3) = S(4,3) ",
                            "~ 2A(3,2) = U(4,2) ",
                            "~ 2D(3,2) = O-(6,2)" );
    fi;

    # test if <G> is a Chevalley group B(2,q) ~ C(2,q)
    # non-simple: B(2,2) ~ S(6)
    if n = 2  and size = size2  then
        return Concatenation( "B(", "2", ",", String(q), ") ",
                            "= O(", "5", ",", String(q), ") ",
                            "~ C(", "2", ",", String(q), ") ",
                            "= S(", "4", ",", String(q), ")" );
    fi;

    # test if <G> is a Chevalley group B(n,2^m) ~ C(n,2^m)
    # non-simple: B(2,2) ~ S(6)
    if p = 2  and size = size2  then
        return Concatenation( "B(", String(n),     ",", String(q), ") ",
                            "= O(", String(2*n+1), ",", String(q), ") ",
                            "~ C(", String(n),     ",", String(q), ") ",
                            "= S(", String(2*n),   ",", String(q), ")" );
    fi;

    # test if <G> is a Chevalley group B(n,q) or C(n,q), 2 < n and q odd
    if p <> 2  and size = size2  then

        # check that <G> is a group
        if not IsGroup( G )  then
            return Concatenation( "cannot decide from size alone between ",
                                  "B(", String(n),     ",", String(q), ") ",
                                "= O(", String(2*n+1), ",", String(q), ") ",
                                "and ",
                                  "C(", String(n),   ",", String(q), ") ",
                                "= S(", String(2*n), ",", String(q), ")" );
        fi;

        # find a <p>-central element and its centralizer
        C := Centre(SylowSubgroup(G,p));
        repeat
            g := Random(C);
        until Order(C,g) = p;
        C := Centralizer(G,g);

        if Size(C) mod (q^(2*n-2)-1) <> 0 then
            return Concatenation( "B(", String(n),     ",", String(q), ") ",
                                "= O(", String(2*n+1), ",", String(q), ")" );
        else
            return Concatenation( "C(", String(n),   ",", String(q), ") ",
                                "= S(", String(2*n), ",", String(q), ")" );
        fi;

    fi;

    # test if <G> is a Chevalley group D(n,q)
    # non-simple: D(2,q) ~ A(1,q)xA(1,q)
    # exceptions: D(3,q) ~ A(3,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        n := 3;
        repeat
            n := n + 1;
            size2 := q^(n*(n-1)) * (q^n-1)
                   * Product([1..n-1],i->q^(2*i)-1) / Gcd(4,q^n-1);
        until size <= size2;
    until size = size2  or n = 4;
    if size = size2  then
        return Concatenation( "D(",  String(n),   ",", String(q), ") ",
                            "= O+(", String(2*n), ",", String(q), ")" );
    fi;

    # test whether <G> is an exceptional Chevalley group E(6,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        size2 := q^36 * (q^12-1)*(q^9-1)*(q^8-1)
                      *(q^6-1)*(q^5-1)*(q^2-1) / Gcd(3,q-1);
    until size <= size2;
    if size = size2 then
        return Concatenation( "E(", "6", ",", String(q), ")" );
    fi;

    # test whether <G> is an exceptional Chevalley group E(7,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        size2 := q^63 * (q^18-1)*(q^14-1)*(q^12-1)*(q^10-1)
                      *(q^8-1)*(q^6-1)*(q^2-1) / Gcd(2,q-1);
    until size <= size2;
    if size = size2  then
        return Concatenation( "E(", "7", ",", String(q), ")" );
    fi;

    # test whether <G> is an exceptional Chevalley group E(8,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        size2 := q^120 * (q^30-1)*(q^24-1)*(q^20-1)*(q^18-1)
                       *(q^14-1)*(q^12-1)*(q^8-1)*(q^2-1);
    until size <= size2;
    if size = size2  then
        return Concatenation( "E(", "8", ",", String(q), ")" );
    fi;

    # test whether <G> is an exceptional Chevalley group F(4,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        size2 := q^24 * (q^12-1)*(q^8-1)*(q^6-1)*(q^2-1);
    until size <= size2;
    if size = size2  then
        return Concatenation( "F(4,", String(q), ")" );
    fi;

    # test whether <G> is an exceptional Chevalley group G(2,q)
    # exceptions: G(2,2) ~ U(3,3).2
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        size2 := q^6 * (q^6-1)*(q^2-1);
    until size <= size2;
    if size = size2  then
        return Concatenation( "G(", "2", ",", String(q), ")" );
    fi;

    # test if <G> is 2A(2,3), where p = 2 <> char.
    if size = 3^3*(3^2-1)*(3^3+1)  then
        return "2A(2,3) = U(3,3)";
    fi;

    # try to find <n> and <q> for size of 2A(n,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        n := 1;
        repeat
            n := n + 1;
            size2 := q^(n*(n+1)/2)
                   * Product([2..n+1],i->q^i-(-1)^i) / Gcd(n+1,q+1);
        until size <= size2;
    until size = size2  or n = 2;

    # test if <G> is a Steinberg group 2A(3,q) ~ 2D(3,q)
    # excetions: 2A(3,2) ~ B(2,3) ~ C(2,3)
    if n = 3  and size = size2  then
        return Concatenation( "2A(", "3", ",", String(q), ") ",
                            "= U(",  "4", ",", String(q), ") ",
                            "~ 2D(", "3", ",", String(q), ") ",
                            "= O-(", "6", ",", String(q), ")" );
    fi;

    # test if <G> is a Steinberg group 2A(n,q)
    # non-simple: 2A(2,2) ~ 3^2 . Q(8)
    if size = size2  then
        return Concatenation( "2A(", String(n),   ",", String(q), ") ",
                            "= U(",  String(n+1), ",", String(q), ")" );
    fi;

    # test whether <G> is a Suzuki group 2B(2,q) = 2C(2,q) = Sz(q)
    # non-simple: 2B(2,2) = 5:4
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        size2 := q^2 * (q^2+1)*(q-1);
    until size <= size2;
    if p = 2  and m mod 2 = 1  and size = size2  then
        return Concatenation( "2B(", "2", ",", String(q), ") ",
                            "= 2C(", "2", ",", String(q), ") ",
                            "= Sz(",           String(q), ")" );
    fi;

    # test whether <G> is a Steinberg group 2D(n,q)
    # exceptions: 2D(3,q) ~ 2A(3,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        n := 3;
        repeat
            n := n + 1;
            size2 := q^(n*(n-1)) * (q^n+1)
                   * Product([1..n-1],i->q^(2*i)-1) / Gcd(4,q^n+1);
        until size <= size2;
    until size = size2  or n = 4;
    if size = size2  then
        return Concatenation( "2D(", String(n),   ",", String(q), ") ",
                            "= O-(", String(2*n), ",", String(q), ")" );
    fi;

    # test whether <G> is a Steinberg group 3D4(q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        size2 := q^12 * (q^8+q^4+1)*(q^6-1)*(q^2-1);
    until size <= size2;
    if size = size2  then
        return Concatenation( "3D(", "4", ",", String(q), ")" );
    fi;


    # test whether <G> is a Steinberg group 2E6(q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        size2 := q^36 * (q^12-1)*(q^9+1)*(q^8-1)
                       *(q^6-1)*(q^5+1)*(q^2-1) / Gcd(3,q+1);
    until size <= size2;
    if size = size2  then
        return Concatenation( "2E(", "6", ",", String(q), ")" );
    fi;

    # test if <G> is the Ree group 2F(4,q)'
    if size = 2^12 * (2^6+1)*(2^4-1)*(2^3+1)*(2-1) / 2  then
        return "2F(4,2) = Ree(2)' = Tits";
    fi;

    # test whether <G> is a Ree group 2F(4,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        size2 := q^12 * (q^6+1)*(q^4-1)*(q^3+1)*(q-1);
    until size <= size2;
    if p = 2  and 1 < m  and m mod 2 = 1  and size = size2  then
        return Concatenation( "2F(", "4", ",", String(q), ") ",
                           "= Ree(",           String(q), ")" );
    fi;

    # test whether <G> is a Ree group 2G(2,q)
    m := 0;  q := 1;
    repeat
        m := m + 1;  q := q * p;
        size2 := q^3 * (q^3+1)*(q-1);
    until size <= size2;
    if p = 3  and 1 < m  and m mod 2 = 1  and size = size2  then
        return Concatenation( "2G(", "2", ",", String(q), ") ",
                           "= Ree(",           String(q), ")" );
    fi;

    # or a new simple group is found
    return "A new simple group, whoaw";
end;


#############################################################################
##

#F  IsConjugacyClass( <C> ) . . test if an object is a conjugacy class record
##
IsConjugacyClass := function ( C )
    return     IsRec(C)
           and IsBound(C.isConjugacyClass)
           and C.isConjugacyClass;
end;


#############################################################################
##
#V  ConjugacyClassGroupOps  . . . . . operations record for conjugacy classes
##
ConjugacyClassGroupOps := OperationsRecord( "ConjugacyClassGroupOps",
                                            DomainOps );

ConjugacyClassGroupOps.Elements := function ( C )
    return Set( Orbit( C.group, C.representative ) );
end;

ConjugacyClassGroupOps.Size := function ( C )
    if not IsBound( C.centralizer )  then
        C.centralizer := Centralizer( C.group, C.representative );
    fi;
    return Index( C.group, C.centralizer );
end;

ConjugacyClassGroupOps.\= := function ( C, D )
    local    isEql;

    if    IsRec( C )  and IsBound( C.isConjugacyClass )
      and IsRec( D )  and IsBound( D.isConjugacyClass )
      and C.group = D.group
    then
        isEql := C.size = D.size
             and Order( C.group, C.representative )
               = Order( D.group, D.representative )
             and RepresentativeOperation(
                                C.group,
                                D.representative,
                                C.representative ) <> false;
    else
        isEql := DomainOps.\=( C, D );
    fi;
    return isEql;

end;

ConjugacyClassGroupOps.\in := function ( g, C )
    if IsBound( C.elements ) then
      return g in C.elements;
    else
      return     g in C.group
	     and Order( C.group, g ) = Order( C.group, C.representative )
	     and RepresentativeOperation( C.group,
					  g,
					  C.representative ) <> false;
    fi;
end;

ConjugacyClassGroupOps.Random := function ( C )
    return C.representative ^ Random( C.group );
end;

ConjugacyClassGroupOps.\* := function ( C, D )
    if IsConjugacyClass( C )  then
        return Elements( C ) * D;
    elif IsConjugacyClass( D )  then
        return C * Elements( D );
    else
        Error( "panic, neither <C> nor <D> is a conjugacy class" );
    fi;
end;

ConjugacyClassGroupOps.Print := function ( C )
    Print( "ConjugacyClass( ", C.group, ", ", C.representative, " )" );
end;


#############################################################################
##
#F  ConjugacyClass( <G>, <g> )  . .  conjugacy class of an element in a group
##
ConjugacyClass := function ( G, g )
    return G.operations.ConjugacyClass( G, g );
end;

GroupOps.ConjugacyClass := function ( G, g )
    local   C;

    # make the domain
    C := rec( );
    C.isDomain          := true;
    C.isConjugacyClass  := true;

    # enter the identifying information
    C.group             := G;
    C.representative    := g;

    # enter the operations record
    C.operations        := ConjugacyClassGroupOps;

    # return the conjugacy class
    return C;

end;


#############################################################################
##
#F  GroupOps.ConjugacyClasses( <G> )  . . . . .  conjugacy classes of a group
##
GroupOps.ConjugacyClasses := function ( G )
    local   classes,    # conjugacy classes of <G>, result
            class,      # one class of <G>
            elms;       # elements of <G>

    # initialize the conjugacy class list
    classes := [ ConjugacyClass( G, G.identity ) ];
    InfoGroup1( "#I    1. class of order 1 and length 1 ",
                "(1 of ",Size(G)," elements)\n" );

    # if the group is small, or if its elements are known 
    # or if the group is abelian, do it the hard way
    if Size( G ) <= 1000 or IsBound( G.elements )  or IsAbelian( G ) then

        # get the elements
        elms := Difference( Elements( G ), [ G.identity ] );

        # while we have not found all conjugacy classes
        while 0 < Length(elms)  do

            # add the class of the first element
            class := ConjugacyClass( G, elms[1] );
            Add( classes, class );
            InfoGroup1( "#I    ", Length(classes),
                        ". class of order ", Order(G,elms[1]),
                        " and length ", Size(class),
                        " (", Sum(List(classes,Size)), " elements)\n" );

            # remove the elements of this class
            SubtractSet( elms, Elements( class ) );

        od;

    # otherwise use probabilistic algorithm
    else

        # while we have not found all conjugacy classes
        while Sum( List( classes, Size ) ) <> Size( G )  do

            # try random elements
            G.operations.ConjugacyClassesTry( G, classes, Random(G), 0, 1 );

        od;

    fi;

    # return the conjugacy classes
    return classes;

end;

GroupOps.ConjugacyClassesTry := function ( G, classes, elm, length, fixes )
    local   C,          # new class
            D,          # another new class
            new,        # new classes
            i;          # loop variable

    # if the element is not in one of the known classes add a new class
    if ForAll( classes, D -> length mod Size(D) <> 0 or not elm in D )  then
        C := ConjugacyClass( G, elm );
        Add( classes, C );
        new := [ C ];
        if length = 0  then
            InfoGroup1("#I    ",Length(classes),
                       ". class of order ",Order(G,elm),
                       " and length ",Size(C),
                       " (",Sum(List(classes,Size))," elements)\n");
        else
            InfoGroup1("#I    ",Length(classes),
                       ". class of power order ",Order(G,elm),
                       " and length ",Size(C),
                       " (",Sum(List(classes,Size))," elements)\n");
        fi;

        # try powers that keep the order, compare only with new classes
        for i  in [2..Order(G,elm)-1]  do
            if GcdInt( i, Order(G,elm) * fixes ) = 1  then
                if not elm^i in C  then
                    if ForAll( new, D -> not elm^i in D )  then
                        D := ConjugacyClass( G, elm^i );
                        Add( classes, D );
                        Add( new, D );
                        InfoGroup1("#I    ",Length(classes),
                                   ". class of same order",
                                   " and same length ",
                                   " (",Sum(List(classes,Size)),
                                   " elements)\n");
                    fi;
                elif IsPrime(i)  then
                    fixes := fixes * i;
                fi;
            fi;
        od;

        # try also the powers of this element that reduce the order
        for i  in Set( FactorsInt( Order( G, elm ) ) )  do
            G.operations.ConjugacyClassesTry(G,classes,elm^i,Size(C),fixes);
        od;

    fi;

end;


#############################################################################
##

#F  IsRationalClass( <C> )  . . .  test whether an object is a rational class
##
IsRationalClass := function( C )
    return     IsRec(C)
           and IsBound(C.isRationalClass)
           and C.isRationalClass;
end;


#############################################################################
##
#V  RationalClassGroupOps . . . . . .  operations record for rational classes
##
RationalClassGroupOps := OperationsRecord( "RationalClassGroupOps",
                                           DomainOps );

RationalClassGroupOps.\in := function( g, C )
    local  irr;

    if g = C.group.identity  then
        return g = C.representative;
    fi;
    if IsBound(C.galoisGroup)  then
        irr := RationalClassGroupOps.IrrationalExponents(C);  
    else
        irr := Filtered( [1..C.order-1], i -> GcdInt(i,C.order)=1 );
    fi;
    return ForAny( irr, e ->
        RepresentativeOperation(C.group, g, C.representative^e) <> false );
end;

RationalClassGroupOps.\= := function( C, D )
    local  isEql;

    if IsRationalClass(C)  then
        if IsRationalClass(D)  then
            isEql := C.representative in D;
        else
            isEql := false;
        fi;
    else
        if IsRationalClass(D)  then
            isEql := false;
        else
            Error( "panic, neither <C> nor <D> is a rational class" );
        fi;
    fi;
    return isEql;

end;

RationalClassGroupOps.Print := function( C )
    Print( "RationalClass( ", C.group, ", ", C.representative, " )" );
end;

RationalClassGroupOps.Elements := function( C )
    local  class;

    class := Elements( ConjugacyClass( C.group, C.representative ) );
    return Union( List( RationalClassGroupOps.IrrationalExponents(C),
           e -> List( class, c -> c^e ) ) );
end;

RationalClassGroupOps.Size := function( C )
    if not IsBound(C.centralizer)  then
        C.centralizer := Centralizer( C.group, C.representative );
    fi;
    return   Index(C.group,C.centralizer) 
           * Phi(C.order)
           / Size(RationalClassGroupOps.GaloisGroup(C));
end;


#############################################################################
##
#F  RationalClassGroupOps.GaloisGroup( <C> )  . . .   Galois group of a class
##
#N  fceller: 'ResidueAgWord' should be a mapping
##
RationalClassGroupOps.GaloisGroup := function( C )
    local  prcg;

    if not IsBound(C.galoisGroup)  then
        if C.order = 1  then
            C.galoisGroup := GroupPrimeResidues(1);
        else
            prcg := GroupPrimeResidues(C.order);
            C.galoisGroup := prcg.operations.SubgroupProperty(
                prcg,
                e -> RepresentativeOperation(
                    C.group,
                    C.representative, 
                    C.representative^ResidueAgWord(prcg,e) ) <> false );
        fi;
    fi;
    return C.galoisGroup;
end;


#############################################################################
##
#F  RationalClassGroupOps.IrrationalExponents( <C> )  .  irrational exponents
##
#N  fceller: 'ResidueAgWord' should be a mapping
##
RationalClassGroupOps.IrrationalExponents := function( C )
    local  G;

    if not IsBound(C.irrationalExponents)  then
        G := RationalClassGroupOps.GaloisGroup(C);
        C.irrationalExponents := List(
            RightTransversal( Parent(G), G ),
            g -> ResidueAgWord( G, g ) );
    fi;
    return C.irrationalExponents;
end;


#############################################################################
##
#F  RationalClassGroupOps.Decomposed( <C> ) . .  split into conjugacy classes
##
#N  fceller: 'ResidueAgWord' should be a mapping
##
RationalClassGroupOps.Decomposed := function( C )
    local  classes,  i,  j,  k,  t,  residues;

    if C.order = 1  then
        classes := [ ConjugacyClass( C.group, C.representative ) ];
        if IsBound(C.centralizer)  then
            classes[1].centralizer := C.centralizer;
        fi;
    else
        classes := List( RationalClassGroupOps.IrrationalExponents(C), 
            e -> ConjugacyClass( C.group, C.representative^e ) );

        # add the powermaps
        residues := List( Elements( C.galoisGroup ),
                          el -> ResidueAgWord( C.galoisGroup, el ) );
        for i  in [ 1 .. Length(classes) ]  do
            classes[i].powers := [];
            for j  in [ 1 .. Length(classes) ]  do
                for k  in residues  do
                    t := C.irrationalExponents[j]*k/C.irrationalExponents[i];
                    classes[i].powers[ t mod C.order ] := classes[j];
                od;
            od;
        od;

        if IsBound(C.centralizer)  then
            for i  in [ 1 .. Length(classes) ]  do
                classes[i].centralizer := C.centralizer;
            od;
        fi;
    fi;

    # temporary bug fix
    for C  in classes  do
        C.domain := C.group;
    od;

    return classes;
end;


#############################################################################
##
#F  RationalClass( <G>, <g> ) . . . . rational class of an element in a group
##
RationalClass := function(arg)
    return arg[1].operations.RationalClass(arg);
end;

GroupOps.RationalClass := function( arg )
    local   class;

    # unravel the arguments
    if Length(arg) = 1  then
        arg := arg[1];
    fi;

    # construct the class record
    class                 := rec();
    class.group           := arg[1];
    class.representative  := arg[2];
    class.isDomain        := true;
    class.isRationalClass := true;
    class.operations      := RationalClassGroupOps;
    
    # a third parameter is the centralizer
    if Length(arg) >= 3  then
        class.centralizer := arg[3];
    fi;

    # a fourth parameter is the galois group
    if Length(arg) = 4  then
        class.galoisGroup := arg[4];
    fi;

    # bind the order an return
    class.order := Order( class.group, class.representative );
    return class;

end;


#############################################################################
##
#F  GroupOps.RationalClasses( <G> ) . . . . . . . rational classes of a group
##
GroupOps.RationalClasses := function(  G  )
    local   rcl;

    rcl := [];
    while Sum( rcl, Size ) < Size( G )  do
        G.operations.RationalClassesTry( G, rcl, Random(G) );
    od;
    Sort(rcl, function(x,y) return x.representative<y.representative; end);
    return rcl;
end;

GroupOps.RationalClassesTry := function(  G, classes, elm  )
    local   C,          # new class
            D,          # another new class
            i;          # loop variable

    # if the element is not in one of the known classes add a new class
    if ForAll( classes, D -> not elm in D )  then
        C := RationalClass( G, elm );
        Add( classes, C );

        # try the powers of this element that reduce the order
        for i  in Set(FactorsInt(Order(G,elm)))  do
            G.operations.RationalClassesTry( G, classes, elm ^ i );
        od;

    fi;

end;

#############################################################################
##
#F  ConjugateSubgroup( <G>, <obj> ) . . . . . . . . . .  conjugate of a group
##
ConjugateSubgroup := function ( G, g )

    # check the arguments
    if not IsGroup( G )  then
        Error( "<G> must be a group" );
    elif not g in Parent( G )  then
        Error( "<g> must be an element of the parent group of <G>" );
    fi;

    # dispatch
    return G.operations.ConjugateSubgroup( G, g );

end;

GroupOps.ConjugateSubgroup := function ( G, g )
    local   H,          # conjugated subgroup of <G>, result
            name;       # component name in the group record

    # special case if <g> is in <G>
    if IsBound( G.elements )  and g in G.elements  or g in G.generators  then
        return G;
    fi;

    # create the domain
    H := Subgroup( Parent( G ), OnTuples( G.generators, g ) );

    # copy usefull information
    for name  in Intersection( RecFields( G ), MaintainedGroupInfo )  do
        H.(name) := G.(name);
    od;

    # copy the list of elements if present
    if IsBound( G.elements )  then
        H.elements := OnSets( G.elements, g );
    fi;

    # return the conjugated subgroup
    return H;

end;

#############################################################################
##
#F  GroupOps.\^( <G>, <obj> )
##
GroupOps.\^ := function( G, obj )

    if   IsGroup( G ) then

      # The group is the left operand, return the conjugate of 'G' by 'obj'.
      return ConjugateSubgroup( G, obj );

    elif IsGroup( obj ) then

      # The group is the right operand.
      # Perhaps we wanted to call the exponentiation of the left operand.
      if IsRec( G ) and IsBound( G.operations )
                    and IsBound( G.operations.\^ )
                    and G.operations.\^ <> obj.operations.\^ then
        return G.operations.\^( G, obj );
      fi;
    else
      Error( "exponentiation is not defined" );
    fi;
    end;

#############################################################################
##
#F  ConjugateSubgroups( <G>, <U> )  . . .  conjugated subgroups of a subgroup
##
ConjugateSubgroups := function ( G, U )

    # check that the arguments are groups with a common parent
    if not IsGroup( G )  then
        Error("<G> must be a group");
    elif not IsGroup( U )  then
        Error("<U> must be a group");
    fi;
    Parent( G, U );

    # dispatch
    return G.operations.ConjugateSubgroups( G, U );

end;

GroupOps.ConjugateSubgroups := function ( G, U )
    return Orbit( G, U );
end;


#############################################################################
##
#F  AbstractElementsGroup( <group> )  . . . . elements in abstract generators
##
AbstractElementsGroup := function ( G )
    local   elms, e, reps, aReps, aElms, i, k, j;

    InfoGroup1( "#I  AbstractElementsGroup: ", GroupString( G, "G" ), "\n" );

    # start with the identity subgroup
    G.elements := [ G.identity ];
    G.abstractElements := [ IdWord ];

    # run over the subgroups <1> <= <G.1> <= <G.1,G.2> <= <G.1,G.2,G.3> ..
    for i  in [ 1 .. Length( G.generators ) ]  do

        # start with the trivial transversal of the previous subgroup
        reps  := [ G.identity ];
        aReps := [ IdWord ];
        elms  := ShallowCopy( G.elements );
        aElms := ShallowCopy( G.abstractElements );

        # perform an orbit algorithm for the representatives
        j := 1;
        while j <= Length( reps )  do
            for k  in [ 1 .. i ]  do

                # if new, add e to representatives and the coset to elements
                e := reps[ j ] * G.generators[ k ];
                if not e in elms  then
                    Add( reps, e );
                    Append( elms, G.elements * e );
                    e := aReps[ j ] * G.abstractGenerators[ k ];
                    Add( aReps, e );
                    Append( aElms, G.abstractElements * e );
                fi;

            od;
            j := j + 1;
        od;

        # on to the next subgroup
        G.elements := elms;
        G.abstractElements := aElms;
        InfoGroup2( "#I  AbstractElementsGroup: |<G.elements>| = ",
                    Length( G.elements ), ", ", i, ".th generator\r" );
    od;

    # We must sort by hand
    InfoGroup2( "#I  AbstractElementsGroup: sorting",
                "                                \r" );
    e := [ 1 .. Length( G.elements ) ];
    k := function ( a, b )  return G.elements[ a ] < G.elements[ b ];  end;
    Sort( e, k );
    G.elements := Sublist( G.elements, e );
    G.abstractElements := Sublist( G.abstractElements, e );

    InfoGroup1( "#I  AbstractElementsGroup: |<G>.elements| = ",
                Length( G.elements ), "\n" );

    # return the list of elements and abstract elements
    return G;

end;


#############################################################################
##
#F  Factorization( <G>, <g> ) . . . factorize a group element into generators
##
Factorization := function ( G, g )
    local   F;

    # compute the factorization
    F := G.operations.Factorization( G, g );

    # return the factorization
    return F;

end;

GroupOps.Factorization := function ( G, g )
    local   p;

    # abort if group is infinite
    if not IsFinite( G )  then
        Error( "sorry, cannot factor <g> in the infinite group <G>" );
    fi;

    # we need a list of abstract elements
    if not IsBound( G.abstractElements )  then
        if not IsBound( G.abstractGenerators )  then
            G.abstractGenerators := WordList( Length(G.generators), "x" );
        fi;
        AbstractElementsGroup( G );
    fi;

    # is <g> an element of <G> ?
    p := Position( G.elements, g );
    if p = false  then
        Error("<g> must be an element of <G>");
    fi;
    return G.abstractElements[ p ];

end;


#############################################################################
##
#F  GroupOps.Components( <G>, <g> ) . . . . . . . . primary components of <g>
##
##  'Components' returns a list of group elements [g1,  .., gn] such that  if
##  order(<g>) = p1^n1 * .. * pn^nn then
##
##  i)   the gi are unique defined
##  ii)  gi is of order pi^ni
##  iii) the gi commute
##  iv)  g = g1 * .. * gn
##
GroupOps.Components := function( G, g )

    local  o,         # order of g = p1^n1 * .. * pn^nn
           p,         # pi^ni
           q,         # o / p
           x,         # ni
           gcd,       # 1 = coeff1 * p + coeff2 * q
           prime,     # pi
           factors;   # list of primfactors of g

    if g = G.identity  then  
        return [];
    fi;
    o := Order( G, g );
    factors := Factors( o );
    if Length( Set( factors ) ) = 1  then
        return [ g ];
    else
        prime := factors[1];
        x := Length( Filtered( factors, y -> y = prime ) );
        p := prime ^ x;
        q := o / p;
        gcd := Gcdex ( p, q );
        return Concatenation( Components( G, g ^ (gcd.coeff1 * p) ),
                              [ g ^ (gcd.coeff2 * q) ] );
    fi;

end;


#############################################################################
##
#F  AgGroup( <G> )  . . . . . . . . . . . . . . . view a group as an ag group
##
AgGroup := function ( G )
    local   H;

    if IsBound(G.isPQp) and G.isPQp  then
    	H := G.operations.AgGroup(G);
    elif not IsGroup(G)  then
        Error("<G> must be a group");
    elif not IsFinite(G)  then
        Error("<G> must be finite group");
    elif not IsSolvable(G)  then
        Error("<G> must be finite solvable group");
    elif IsBound(G.operations.AgGroup)  then
        H := G.operations.AgGroup(G);
    else
        Error("sorry, cannot convert <G> into an ag group");
    fi;
    return H;

end;

GroupOps.AgGroup := function ( G )

    local   D,      # derived series of <G>
            B,      # ag-system
            BP,     # relative order of <B>[i]
            L,      # generators of factor groups
                    # abstract generators in second part
            M,      # <D>[ i+1 ]
            N,      # subgroup of <D>[ i ] / M
            Q,      # <p>-agemo of <N>
                    # composition list in second part
            R,      # relators
            p,      # one primefactor of |<D>[i] / <D>[i+1]|
            P,
            S,
            i,  j;

    # Compute the derived series, step down the agemos.
    S  := Parent( G );
    D  := DerivedSeries( G );
    B  := [];
    BP := [];
    for i  in [ 1 .. Length( D ) - 1 ]  do
        InfoGroup2( "#I  AgGroup: derived step ", i, "\n" );
        L := D[ i ].generators;
        M := D[ i + 1 ];
        for p  in Set( Factors( Index( D[ i ], M ) ) )  do
            InfoGroup2( "#I  AgGroup: prime ", p, "\n" );
            N := Closure( M, Subgroup( S, L ) );
            L := Set( List( L, x -> x ^ p ) );
            Q := Closure( M, Subgroup( S, L ) );
            while N <> Q  do
                P := Q;
                j := 1;
                while N <> P  do
                    while N.generators[ j ] in P  do
                        j := j + 1;
                    od;
                    Add( B, N.generators[ j ] );
                    Add( BP, p );
                    P := Closure( P, N.generators[ j ] );
                od;
                L := Set( List( L, x -> x ^ p ) );
                N := Q;
                Q := Closure( M, Subgroup( S, L ) );
            od;
        od;
    od;

    # Now compute a presentation for the ag system <B>
    L := WordList( Length( B ), "g" );
    Q := [];
    j := Length( B );
    for i  in [ 2 .. j + 1 ]  do
        Q[ i ] := Subgroup( S, Sublist( B, [ i .. j ] ) );
        Q[ i ].abstractGenerators := Sublist( L, [ i .. j ] );
    od;
    R := [];
    for i  in [ 1 .. Length( B ) ]  do
        Add( R, L[i]^BP[i] / Factorization( Q[ i+1 ], B[i]^BP[i] ) );
    od;
    for i  in [ 1 .. Length( B ) - 1 ]  do
        for j  in [ i + 1 .. Length( B ) ]  do
            Add( R, Comm(L[j],L[i])/Factorization(Q[i+1],Comm(B[j],B[i])) );
        od;
    od;
    Q := AgGroupFpGroup( rec( generators := L, relators := R ) );
    Q.bijection := GroupHomomorphismByImages( Q, G, Q.generators, B );
    Q.bijection.isMapping           := true;
    Q.bijection.isHomomorphism      := true;
    Q.bijection.isIsomorphism       := true;
    Q.bijection.isGroupHomomorphism := true;
    Q.bijection.isInjective         := true;
    Q.bijection.isSurjective        := true;
    Q.bijection.isBijection         := true;
    return Q;

end;


#############################################################################
##
#F  PermGroup( <G> )  . . . . . . . . . . . . .  view a group as a perm group
##
PermGroup := function ( G )

    # check that the argument is a finite group
    if not IsGroup( G ) or not IsFinite( G )  then
        Error("<G> must be a finite group");
    fi;

    # find a permutation group
    if not IsBound( G.permGroup )  then
        G.permGroup := G.operations.PermGroup( G );
    fi;

    # return the permutation group
    InfoGroup1("#I  PermGroup: returns ",GroupString(G.permGroup,"P"),"\n");
    return G.permGroup;

end;

GroupOps.PermGroup := function ( G )
    local   P;          # permutation group isomorphic to <G>, result

    # make the permutation group
    P := Operation( G, Elements( G ), OnRight );

    # make the bijection from <P> to <G>
    P.bijection := InverseMapping( OperationHomomorphism( G, P ) );
    P.bijection.isMapping       := true;
    P.bijection.isInjective     := true;
    P.bijection.isSurjective    := true;
    P.bijection.isBijection     := true;
    P.bijection.isHomomorphism  := true;
    P.bijection.isMonomorphism  := true;
    P.bijection.isEpimorphism   := true;
    P.bijection.isIsomorphism   := true;
    P.bijection.image           := G;
    P.bijection.preImage        := P;
    P.bijection.kernel          := TrivialSubgroup( P );

    # return the permutation group
    return P;

end;


#############################################################################
##
#F  IrreducibleGeneratingSet(<G>) . . . returns an irreducible generating set
##
IrreducibleGeneratingSet := function(G)
  if IsBound(G.operations.MinimalGeneratingSet) then
    # we can do even better
    return G.operations.MinimalGeneratingSet(G);
  else
    return G.operations.IrreducibleGeneratingSet(G);
  fi;
end;

GroupOps.IrreducibleGeneratingSet := function (G)
local  i, U, gens;
  gens := Set(G.generators);
  i := 1;
  while i < Length(gens)  do
    U:=Subgroup(Parent(G),
		gens{Difference([1..Length(gens)],[i])});
    if Size(U)<Size(G) then
      i:=i+1;
    else
      gens:=U.generators;
    fi;
  od;
  return gens;
end;


#############################################################################
##
#R  Read  . . . . . . . . . . . . .  read other function from the other files
##
ReadLib( "grphomom" );
ReadLib( "operatio" );
ReadLib( "grplatt"  );
ReadLib( "grpcoset" );
ReadLib( "grpprods" );
ReadLib( "grpctbl"  );
ReadLib( "monomial"  );

