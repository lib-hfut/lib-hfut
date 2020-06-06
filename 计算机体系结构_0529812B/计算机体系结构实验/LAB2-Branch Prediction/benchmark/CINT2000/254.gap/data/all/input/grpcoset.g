#############################################################################
##
#A  grpcoset.g                  GAP library                  Martin Schoenert
##
#A  @(#)$Id: grpcoset.g,v 3.19.1.5 1995/11/27 12:18:51 mschoene Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains dispatcher and default functions for coset  functions.
##
#H  $Log: grpcoset.g,v $
#H  Revision 3.19.1.5  1995/11/27  12:18:51  mschoene
#H  allowed '<grp> ^ <elm>' for factor group elements
#H
#H  Revision 3.19.1.4  1994/12/14  18:41:02  ahulpke
#H  modified LeftTransversal
#H
#H  Revision 3.19.1.3  1994/11/15  09:19:54  ahulpke
#H  fixd typo in GroupOps.PermutationCharacter
#H
#H  Revision 3.19.1.2  1994/10/11  12:19:40  ahulpke
#H  Changed 'smallestBase' to 'MinimalStabChain'
#H
#H  Revision 3.19.1.1  1994/08/31  07:45:32  ahulpke
#H  fixed 'flip' case in CalcDoubleCosets
#H
#H  Revision 3.19  1994/06/21  10:20:22  ahulpke
#H  Threw away a @$#% Random in GroupOps.LeftCosets
#H
#H  Revision 3.18  1994/04/21  12:00:08  sam
#H  fixed multiplication
#H
#H  Revision 3.17  1994/01/25  15:03:19  fceller
#H  removed emacs variables
#H
#H  Revision 3.16  1993/09/04  18:05:09  ahulpke
#H  fixed Error in 'Extension'
#H
#H  Revision 3.15  1993/07/28  16:40:34  martin
#H  moved 'RightTransversal' to "grpcoset", added 'LeftTransversal'
#H
#H  Revision 3.14  1993/07/26  06:48:21  martin
#H  added '<G> / <relators>'
#H
#H  Revision 3.13  1993/06/18  13:53:45  martin
#H  fixed bound for very small groups
#H
#H  Revision 3.12  1993/03/10  13:18:11  fceller
#H  added dispatcher for 'PermutationCharacter'
#H
#H  Revision 3.11  1993/03/08  15:07:35  fceller
#H  fixed call to 'AgGroupOps.GenRelOrdersAgGroup'
#H
#H  Revision 3.10  1993/01/18  18:55:57  martin
#H  added double coset functions
#H
#H  Revision 3.9  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.8  1992/06/01  12:04:10  martin
#H  fixed a minor problem in 'FactorGroupElementsOps.Order'
#H
#H  Revision 3.7  1992/05/08  16:20:25  martin
#H  changed 'FactorGroupOps.*' to avoid 'FactorGroupElement' dispatcher
#H
#H  Revision 3.6  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.5  1992/03/25  08:31:06  martin
#H  fixed a few problems for natural homomorphisms
#H
#H  Revision 3.4  1992/02/10  15:14:35  martin
#H  added the domain 'Mappings'
#H
#H  Revision 3.3  1992/01/30  10:38:20  martin
#H  changed 'NaturalHomomorphism', not every is surjective
#H
#H  Revision 3.2  1992/01/29  09:09:38  martin
#H  changed 'Order' to take two arguments, group and element
#H
#H  Revision 3.1  1992/01/07  12:31:47  martin
#H  initial revision under RCS
##


#############################################################################
##
#F  Transversal(<G>,<U>)  . . . . . . . . . . . . . . . . . right transversal
##
Transversal := function ( G, U )
    return RightTransversal( G, U );
end;


#############################################################################
##
#F  RightTransversal(<G>,<U>) . . . . . . . . . . . . . . . right transversal
##
RightTransversal := function ( G, U )
    local   T;          # right transversal of <U> in <G>, result

    # check the arguments
    if not IsGroup( G )  then
        Error("<G> must be a group");
    fi;
    if not IsSubgroup( G, U )  then
        Error("<U> must be a subgroup of <G>");
    fi;

    # compute the right transversal
    if IsParent( G )  then
        if not IsBound( U.rightTransversal )  then
            U.rightTransversal := G.operations.RightTransversal( G, U );
        fi;
        T := U.rightTransversal;
    else
        T := G.operations.RightTransversal( G, U );
    fi;

    # return the right transversal
    return T;
end;

GroupOps.RightTransversal := function ( G, U )
    return List( RightCosets( G, U ), c -> c.representative );
end;


#############################################################################
##
#F  LeftTransversal(<G>,<U>)  . . . . . . . . . . . . . . .  left transversal
##
LeftTransversal := function ( G, U )
    local   T;          # right transversal of <U> in <G>, result

    # check the arguments
    if not IsGroup( G )  then
        Error("<G> must be a group");
    fi;
    if not IsSubgroup( G, U )  then
        Error("<U> must be a subgroup of <G>");
    fi;

    # compute the left transversal
    if IsParent( G )  then
        if not IsBound( U.leftTransversal )  then
            U.leftTransversal := G.operations.LeftTransversal( G, U );
        fi;
        T := U.leftTransversal;
    else
        T := G.operations.LeftTransversal( G, U );
    fi;

    # return the left transversal
    return T;
end;

GroupOps.LeftTransversal := function ( G, U )
    # it is better to invert r.t. reps, because we might get them faster,
    # then by 'LeftTransversal'.
    return List( RightTransversal(G,U), r->r^-1);
end;


#############################################################################
##
#F  GroupOps.\*(<G>,<H>) . . . . . . . . . . . . . . . . . product of groups
##
GroupOps.\* := function ( G, H )
    local   P;          # product of <G> and <H>, result
    if IsGroup( G )  and H in Parent( G )  then
        P := RightCoset( G, H );
    elif IsGroup( H )  and G in Parent( H )  then
        P := LeftCoset( H, G );
    elif IsGroup( G )  then
        P := Elements( G ) * H;
    elif IsGroup( H )  then
        P := G * Elements( H );
    else
        Error("panic, neither <G> nor <H> is a group");
    fi;
    return P;
end;


#############################################################################
##
#F  IsRightCoset(<C>) . . . . . . . . . .  test if an object is a right coset
##
IsRightCoset := function ( C )
    return IsRec( C )
       and IsBound( C.isRightCoset )
       and C.isRightCoset;
end;

IsCoset := function ( C )
    return IsRightCoset( C );
end;


#############################################################################
##
#F  RightCoset(<U>,<g>) . . . . . . . . . . . . . . . .  create a right coset
##
RightCoset := function ( arg )
    local   C;
    if Length( arg ) = 1  and IsGroup( arg[1] )  then
        C := arg[1].operations.RightCoset( arg[1], arg[1].identity );
    elif Length( arg ) = 2  and IsGroup( arg[1] )  then
        if not arg[2] in Parent( arg[1] )  then
            Error("<g> must be in the parent group of <U>");
        fi;
        C := arg[1].operations.RightCoset( arg[1], arg[2] );
    else
        Error("usage: RightCoset( <U> [, <g>] )");
    fi;
    return C;
end;

Coset := function ( arg )
    if Length( arg ) = 1  then
        return RightCoset( arg[1] );
    elif Length( arg ) = 2  then
        return RightCoset( arg[1], arg[2] );
    else
        Error("usage: Coset( <U> [, <g>] )");
    fi;
end;


#############################################################################
##
#F  GroupOps.RightCoset(<U>,<g>)  . . . . . . . . . . .  create a right coset
#V  RightCosetGroupOps  . . . . . . .  operations record of cosets in a group
##
##  'GroupOps.RightCoset'  is the   default   function   to create a    right
##  coset.   It only  stuffs <U>   and  <g>  in  a  record  and  enters   the
##  operations record 'RightCosetGroupOps'.
##
##  'RightCosetGroupOps'  is the operations  record  of  right  cosets  in  a
##  generic  group.  Thus 'RightCosetGroupOps'  is the operations  record  of
##  default functions  for right  cosets.   Right cosets in special  types of
##  groups, e.g.,  permutation  groups,  inherit  the   default  functions by
##  making  a  copy   of  'RightCosetGroupOps' and  overlaying   the  default
##  functions with more efficient ones.
##
GroupOps.RightCoset := function ( U, g )
    local   C;          # right coset of <U> and <g>, result

    # make the domain
    C := rec( );
    C.isDomain          := true;
    C.isRightCoset      := true;

    # enter the identifying information
    C.group             := U;
    C.representative    := g;

    # enter knowledge
    if IsBound( U.isFinite )  then
        C.isFinite      := U.isFinite;
    fi;
    if IsBound( U.size )  then
        C.size          := U.size;
    fi;

    # enter the operations record
    C.operations        := RightCosetGroupOps;

    # return the coset
    return C;
end;

RightCosetGroupOps := Copy( DomainOps );

RightCosetGroupOps.Elements := function ( C )
    local   elms;       # elements of the coset <C>, result

    # compute the set of elements
    elms := Set( Elements( C.group ) * C.representative );

    # return the set of elements
    return elms;
end;

RightCosetGroupOps.IsFinite := function ( C )
    return IsFinite( C.group );
end;

RightCosetGroupOps.Size := function ( C )
    return Size( C.group );
end;

RightCosetGroupOps.\= := function( C, D )
    local   isEql;

    # compare a right coset
    if IsRightCoset( C )  then

        # with another right coset
        if IsRightCoset( D )  then
            isEql := C.group = D.group
                     and C.representative / D.representative in C.group;

        # with a subgroup, which is a special right coset
        elif IsGroup( D )  then
            isEql := C.group = D  and C.representative in C.group;

        # with something else
        else
            isEql := DomainOps.\=( C, D );
        fi;

    # compare a subgroup, which is a special right coset
    elif IsGroup( C )  then

        # with a right coset
        if IsRightCoset( D )  then
            isEql := C = D.group  and D.representative in C;

        # with something else
        else
            Error("panic, neither <C> nor <D> is a right coset");
        fi;

    # compare something else
    else

        # with a right coset
        if IsRightCoset( D )  then
            isEql := DomainOps.\=( C, D );

        # with another something else
        else
            Error("panic, neither <C> nor <D> is a right coset");
        fi;

    fi;

    # return the result
    return isEql;
end;

RightCosetGroupOps.\in := function ( g, C )

    # use the list of elements of the subgroup if they are known
    if IsBound( C.group.elements )  then
        return g/C.representative in C.group.elements;

    # otherwise leave it to the subgroup to sort things out
    else
        return g/C.representative in C.group;
    fi;

end;

RightCosetGroupOps.Intersection := function ( C, D )
    local   I;          # intersection of <C> and <D>, result

    # special case of intersection of two right cosets
    if IsRightCoset( C )  and IsRightCoset( D )  and C.group = D.group  then

        # its either the whole coset
        if C.representative/D.representative in C.group  then
            I := ShallowCopy( C );

        # or it is empty
        else
            I := [];
        fi;

    # intersection of a right coset with something else
    else
        I := DomainOps.Intersection( C, D );
    fi;

    # return the intersection
    return I;
end;

RightCosetGroupOps.Union := function ( C, D )
    local   U;          # union of <C> and <D>, result

    # special case of intersection of two right cosets
    if IsRightCoset( C )  and IsRightCoset( D )  and C.group = D.group  then

        # its either the whole coset
        if C.representative/D.representative in C.group  then
            U := ShallowCopy( C );

        # or the union
        else
            U := DomainOps.Union( C, D );
        fi;

    # union of  a right coset and something else
    else
        U := DomainOps.Union( C, D );
    fi;

    # return the union
    return U;
end;

RightCosetGroupOps.Random := function ( C )
    return Random( C.group ) * C.representative;
end;

RightCosetGroupOps.Print := function( C )
    if IsBound( C.name )  then
        Print( C.name );
    else
        Print( "(", C.group, "*", C.representative, ")" );
    fi;
end;

RightCosetGroupOps.\* := function ( C, D )
    local   E;          # product of <C> and <D>, result
    if IsRightCoset( C )  and D in Parent( C.group )  then
        E := RightCoset( C.group, C.representative * D );
    elif IsRightCoset( C )  then
        E := Elements( C ) * D;
    elif IsRightCoset( D )  then
        E := C * Elements( D );
    else
        Error("product of <C> and <D> is not defined");
    fi;
    return E;
end;


#############################################################################
##
#F  RightCosets(<G>,<U>)  . . . . . . . right cosets of a subgroup in a group
##
RightCosets := function ( G, U )
    local   C;          # right cosets of <U> in <G>, result

    # check the arguments
    if not IsGroup( G )  then
        Error("<G> must be a group");
    fi;
    if not IsSubgroup( G, U )  then
        Error("<U> must be a subgroup of <G>");
    fi;

    # compute the right cosets
    if IsParent( G )  then
        if not IsBound( U.rightCosets )  then
            U.rightCosets := G.operations.RightCosets( G, U );
        fi;
        C := U.rightCosets;
    else
        C := G.operations.RightCosets( G, U );
    fi;

    # return the right cosets
    return C;
end;

Cosets := function ( G, U )
    return RightCosets( G, U );
end;


#############################################################################
##
#F  GroupOps.RightCosets(<G>,<U>) . . . right cosets of a subgroup in a group
## 
GroupOps.RightCosets := function ( G, U )
    return Orbit( G, RightCoset( U ), OnRight );
end;


#############################################################################
##
#F  IsLeftCoset(<C>)  . . . . . . . . . . . test if an object is a left coset
##
IsLeftCoset := function ( C )
    return IsRec( C )
       and IsBound( C.isLeftCoset )
       and C.isLeftCoset;
end;


#############################################################################
##
#F  LeftCoset(<U>,<g>)  . . . . . . . . . . . . . . . . . create a left coset
##
LeftCoset := function ( arg )
    local   C;
    if Length( arg ) = 1  and IsGroup( arg[1] )  then
        C := arg[1].operations.LeftCoset( arg[1], arg[1].identity );
    elif Length( arg ) = 2  and IsGroup( arg[1] )  then
        if not arg[2] in Parent( arg[1] )  then
            Error("<g> must be in the parent group of <U>");
        fi;
        C := arg[1].operations.LeftCoset( arg[1], arg[2] );
    else
        Error("usage: LeftCoset( <U> [, <g>] )");
    fi;
    return C;
end;


#############################################################################
##
#F  GroupOps.LeftCoset(<U>,<g>) . . . . . . . . . . . . . create a left coset
#V  LeftCosetGroupOps . . . . . . . .  operations record of cosets in a group
##
##  'GroupOps.LeftCoset' is the default  function  to  create a  left  coset.
##  It only   stuffs <U> and <g>  in  a  record  and  enters   the operations
##  record 'LeftCosetGroupOps'.
##
##  'LeftCosetGroupOps'   is the  operations  record of  left   cosets   in a
##  generic group.    Thus  'LeftCosetGroupOps' is the  operations  record of
##  default functions  for left  cosets.    Left cosets in special   types of
##  groups,   e.g.,  permutation groups,   inherit the   default functions by
##  making  a   copy  of 'LeftCosetGroupOps'   and  overlaying   the  default
##  functions with more efficient ones.
##
GroupOps.LeftCoset := function ( U, g )
    local   C;          # left coset of <U> and <g>, result

    # make the domain
    C := rec( );
    C.isDomain          := true;
    C.isLeftCoset      := true;

    # enter the identifying information
    C.group             := U;
    C.representative    := g;

    # enter knowledge
    if IsBound( U.isFinite )  then
        C.isFinite      := U.isFinite;
    fi;
    if IsBound( U.size )  then
        C.size          := U.size;
    fi;

    # enter the operations record
    C.operations        := LeftCosetGroupOps;

    # return the coset
    return C;
end;

LeftCosetGroupOps := Copy( DomainOps );

LeftCosetGroupOps.Elements := function ( C )
    local   elms;       # elements of the coset <C>, result

    # compute the set of elements
    elms := Set( C.representative * Elements( C.group ) );

    # return the set of elements
    return elms;
end;

LeftCosetGroupOps.IsFinite := function ( C )
    return IsFinite( C.group );
end;

LeftCosetGroupOps.Size := function ( C )
    return Size( C.group );
end;

LeftCosetGroupOps.\= := function( C, D )
    local   isEql;

    # compare a left coset
    if IsLeftCoset( C )  then

        # with another left coset
        if IsLeftCoset( D )  then
            isEql := C.group = D.group
              and LeftQuotient(C.representative,D.representative) in C.group;

        # with a subgroup, which is a special left coset
        elif IsGroup( D )  then
            isEql := C.group = D  and C.representative in C.group;

        # with something else
        else
            isEql := DomainOps.\=( C, D );
        fi;

    # compare a subgroup, which is a special left coset
    elif IsGroup( C )  then

        # with a left coset
        if IsLeftCoset( D )  then
            isEql := C = D.group  and D.representative in C;

        # with something else
        else
            Error("panic, neither <C> nor <D> is a left coset");
        fi;

    # compare something else
    else

        # with a left coset
        if IsLeftCoset( D )  then
            isEql := DomainOps.\=( C, D );

        # with another something else
        else
            Error("panic, neither <C> nor <D> is a left coset");
        fi;

    fi;

    # return the result
    return isEql;
end;

LeftCosetGroupOps.\in := function ( g, C )

    # use the list of elements of the subgroup if they are known
    if IsBound( C.group.elements )  then
        return LeftQuotient( g, C.representative ) in C.group.elements;

    # otherwise leave it to the subgroup to sort things out
    else
        return LeftQuotient( g, C.representative ) in C.group;
    fi;

end;

LeftCosetGroupOps.Intersection := function ( C, D )
    local   I;          # intersection of <C> and <D>, result

    # special case of intersection of two left cosets
    if IsLeftCoset( C )  and IsLeftCoset( D )  and C.group = D.group  then

        # its either the whole coset
        if LeftQuotient(C.representative,D.representative) in C.group  then
            I := ShallowCopy( C );

        # or it is empty
        else
            I := [];
        fi;

    # intersection of a left coset with something else
    else
        I := DomainOps.Intersection( C, D );
    fi;

    # return the intersection
    return I;
end;

LeftCosetGroupOps.Union := function ( C, D )
    local   U;          # union of <C> and <D>, result

    # special case of intersection of two left cosets
    if IsLeftCoset( C )  and IsLeftCoset( D )  and C.group = D.group  then

        # its either the whole coset
        if LeftQuotient(C.representative,D.representative) in C.group  then
            U := ShallowCopy( C );

        # or the union
        else
            U := DomainOps.Union( C, D );
        fi;

    # union of  a left coset and something else
    else
        U := DomainOps.Union( C, D );
    fi;

    # return the union
    return U;
end;

LeftCosetGroupOps.Random := function ( C )
    return C.representative * Random( C.group );
end;

LeftCosetGroupOps.Print := function( C )
    if IsBound( C.name )  then
        Print( C.name );
    else
        Print( "(", C.representative, "*", C.group, ")" );
    fi;
end;

LeftCosetGroupOps.\* := function ( C, D )
    local   E;          # product of <C> and <D>, result
    if IsLeftCoset( D )  and C in Parent( D.group )  then
        E := LeftCoset( D.group, C * D.representative );
    elif IsLeftCoset( D )  then
        E := C * Elements( D );
    elif IsLeftCoset( C )  then
        E := Elements( C ) * D;
    else
        Error("product of <C> and <D> is not defined");
    fi;
    return E;
end;


#############################################################################
##
#F  LeftCosets(<G>,<U>) . . . . . . . .  left cosets of a subgroup in a group
##
LeftCosets := function ( G, U )
    local   C;          # left cosets of <U> in <G>, result

    # check the arguments
    if not IsGroup( G )  then
        Error("<G> must be a group");
    fi;
    if not IsSubgroup( G, U )  then
        Error("<U> must be a subgroup of <G>");
    fi;

    # compute the left cosets
    if IsParent( G )  then
        if not IsBound( U.leftCosets )  then
            U.leftCosets := G.operations.LeftCosets( G, U );
        fi;
        C := U.leftCosets;
    else
        C := G.operations.LeftCosets( G, U );
    fi;

    # return the left cosets
    return C;
end;


#############################################################################
##
#F  GroupOps.LeftCosets(<G>,<U>)  . . .  left cosets of a subgroup in a group
## 
GroupOps.LeftCosets := function ( G, U )
    return List( RightCosets( G, U ),
		    C -> LeftCoset( U, C.representative^-1 ) );
end;


#############################################################################
##
#F  IsDoubleCoset( <C> )  . . . . . . . . test if an object is a double coset
##
IsDoubleCoset := function ( C )
    return IsRec( C )
       and IsBound( C.isDoubleCoset )
       and C.isDoubleCoset;
end;


#############################################################################
##
#F  DoubleCoset(<U>,<g>,<V>)  . . . . . . . . . . . . . create a double coset
##
DoubleCoset := function ( U, g, V )

    # check that the arguments lie in a common parent
    if not IsGroup( U )  then
        Error("<U> must be a group");
    fi;
    if not IsGroup( V )  then
        Error("<V> must be a group");
    fi;
    if not g in Parent( U, V )  then
        Error("<g> must lie in the common parent group of <U> and <V>");
    fi;

    # dispatch
    return U.operations.DoubleCoset( U, g, V );
end;


#############################################################################
##
#F  GroupOps.DoubleCoset(<U>,<g>,<V>) . . . . . . . . . create a double coset
#V  DoubleCosetGroupOps . . . . operations record of double cosets in a group
##
##  'GroupOps.DoubleCoset' is the default function to create a double  coset.
##  It only stuffs <U>, <g>, and <V> in a record and  enters  the  operations
##  record 'DoubleCosetGroupOps'.
##
##  'DoubleCosetGroupOps' is   the operations record  of double   cosets in a
##  generic group.  Thus 'DoubleCosetGroupOps'   is the operations record  of
##  default functions for  double cosets.  Double cosets  in special types of
##  groups, e.g., permutation groups, inherit the default functions by making
##  a copy of 'DoubleCosetGroupOps' and overlaying the default functions with
##  more efficient ones.
##
##  The  default  functions for double    cosets deal with double  cosets  by
##  computing  the list of   right cosets of   <U> whose union is  the double
##  coset.  This list is  simply the orbit  of the right  coset '<U> \*\ <g>'
##  under <V>.   This list  is  only computed  on  demand,  i.e., it is   not
##  automatically  computed  by  'GroupOps.DoubleCoset'.  This   allows other
##  double coset creation functions to fall back on 'GroupOps.DoubleCoset'.
##
GroupOps.DoubleCoset := function ( U, g, V )
    local   C;          # double coset, result

    # create the domain
    C := rec( );
    C.isDomain          := true;
    C.isDoubleCoset     := true;

    # enter the identification
    C.leftGroup         := U;
    C.representative    := g;
    C.rightGroup        := V;

    # enter knowledge
    if IsBound( U.isFinite )  and IsBound( V.isFinite )  then
        C.isFinite      := U.isFinite and V.isFinite;
    fi;

    # enter the operations record
    C.operations        := DoubleCosetGroupOps;

    # return the double coset
    return C;
end;

DoubleCosetGroupOps := Copy( DomainOps );

DoubleCosetGroupOps.Elements := function ( C )

    # make sure that the double coset is finite
    if not IsFinite( C )  then
        Error("the double coset <C> must be finite to compute its elements");
    fi;

    # get the list of right cosets
    if not IsBound( C.rightCosets )  then
        C.rightCosets := Orbit( C.rightGroup,
                                Coset( C.leftGroup, C.representative ),
                                OnRight );
    fi;

    # return the set of Elements
    return Union( List( C.rightCosets, Elements ) );
end;

DoubleCosetGroupOps.IsFinite := function ( C )
    return IsFinite( C.leftGroup ) and IsFinite( C.rightGroup );
end;

DoubleCosetGroupOps.Size := function ( C )

    # make sure that the double coset is finite
    if not IsFinite( C )  then
        return "infinity";
    fi;

    # get the list of right cosets
    if not IsBound( C.rightCosets )  then
        C.rightCosets := Orbit( C.rightGroup,
                                Coset( C.leftGroup, C.representative ),
                                OnRight );
    fi;

    # return the size
    return Size( C.leftGroup ) * Length( C.rightCosets );
end;

DoubleCosetGroupOps.\= := function ( C, D )
    local   isEql;

    # compare a double coset
    if IsDoubleCoset( C )  then

        # with another double coset
        if IsDoubleCoset( D )  then

            # over the same subgroups
            if C.leftGroup = D.leftGroup and C.rightGroup = D.rightGroup then
                isEql := C.representative in D;

            # over different subgroups
            else
                isEql := DomainOps.\=( C, D );
            fi;

        # with something else
        else
            isEql := DomainOps.\=( C, D );
        fi;

    # compare something else
    else

        # with a double coset
        if IsDoubleCoset( D )  then
            isEql := DomainOps.\=( C, D );

        # with another something else
        else
            Error("panic, neither <C> nor <D> is a double coset");
        fi;

    fi;

    # return the result
    return isEql;
end;

DoubleCosetGroupOps.\in := function ( g, C )

    # make sure that the double coset is finite
    if not IsFinite( C )  then
        Error(
           "sorry, can not test if <g> lies in the infinite double coset <C>"
        );
    fi;

    # get the list of right cosets
    if not IsBound( C.rightCosets )  then
        C.rightCosets := Orbit( C.rightGroup,
                                Coset( C.leftGroup, C.representative ),
                                OnRight );
    fi;

    # return the result
    return ForAny( C.rightCosets, cos -> g in cos );
end;

DoubleCosetGroupOps.Intersection := function ( C, D )
    local   I;          # intersection of <C> and <D>, result

    # special case for the intersection of two double cosets
    if      IsDoubleCoset( C )
        and IsDoubleCoset( D )
        and C.leftGroup  = D.leftGroup
        and C.rightGroup = D.rightGroup
    then

        # its either the whole double coset
        if C.representative in D  then
            I := C;

        # or its empty
        else
            I := [];
        fi;

    # intersection of a double coset with something else
    else
        I := DomainOps.Intersection( C, D );
    fi;

    # return the intersection
    return I;
end;

DoubleCosetGroupOps.Union := function ( C, D )
    local   U;          # union of <C> and <D>, result

    # special case for the union of two double cosets
    if      IsDoubleCoset( C )
        and IsDoubleCoset( E )
        and C.leftGroup  = D.leftGroup
        and C.rightGroup = D.rightGroup
    then

        # its either the whole double coset
        if C.representative in D  then
            U := C;

        # or the union
        else
            U := DomainOps.Union( C, D );
        fi;

    # union of a double coset with something else
    else
        U := DomainOps.Union( C, D );
    fi;

    # return the union
    return U;
end;

DoubleCosetGroupOps.Random := function ( C )

    # make sure that the double coset is finite
    if not IsFinite( C )  then
      Error(
       "sorry, can not find a random elment in the infinite double coset <C>"
      );
    fi;

    # get the list of right cosets
    if not IsBound( C.rightCosets )  then
        C.rightCosets := Orbit( C.rightGroup,
                                Coset( C.leftGroup, C.representative ),
                                OnRight );
    fi;

    # get a random right coset and a random element of this coset
    return Random( Random( C.rightCosets ) );
end;

DoubleCosetGroupOps.\Print := function ( C )
    if IsBound( C.name )  then
        Print( C.name );
    else
        Print("DoubleCoset( ",C.leftGroup,", ",C.representative,", ",
              C.rightGroup," )");
    fi;
end;

DoubleCosetGroupOps.\* := function ( C, D )
    local   E;
    if IsDoubleCoset( C )  then
        E := Elements( C ) * D;
    elif IsDoubleCoset( D )  then
        E := C * Elements( D );
    else
        Error("panic, neither <C> nor <D> is a double coset");
    fi;
    return E;
end;


#############################################################################
##
#F  DoubleCosets(<G>,<U>,<V>) . . . . . . .  list of double cosets in a group
##
DoubleCosets := function ( G, U, V )

    # check that the arguments lie in a common parent group
    if not IsGroup( G )  then
        Error("<G> must be a group");
    fi;
    if not IsSubgroup( G, U )  then
        Error("<U> must be a subgroup of <G>");
    fi;
    if not IsSubgroup( G, V )  then
        Error("<V> must be a subgroup of <G>");
    fi;

    # dispatch
    return G.operations.DoubleCosets( G, U, V );
end;


#############################################################################
##
#F  GroupOps.DoubleCosets(<G>,<U>,<V>)  . .  list of double cosets in a group
##
GroupOps.DoubleCosets := function ( G, U, V )
    local   C,          # list of double cosets, result
            elm;        # one element of <G>

    # initialize the list of double cosets
    C := [ DoubleCoset( U, G.identity, V ) ];
    while Sum( List( C, Size ) ) <> Size( G )  do
        elm := Random( G );
        if ForAll( C, c -> not elm in c )  then
            Add( C, DoubleCoset( U, elm, V ) );
        fi;
    od;

    # return the list of double cosets
    return C;
end;


#############################################################################
##
#F  InfoCoset1  . . . . . . . . . . . . . . . information for coset functions
##
if not IsBound(InfoCoset1)  then InfoCoset1:=Ignore;  fi;


#############################################################################
##
#F  CalcDoubleCosets( <G>, <A>, <B> ) . . . . . . . . .  double cosets: A\G/B
## 
##  special DoubleCosets routine for PermGroups and small AgGroups, using an
##  ascending chain of subgroups from A to G, using the fact, that a
##  double coset is an union of right cosets
##
CalcDoubleCosets := function(G,a,b)
local CCE,c,a1,a2,r,s,t,rg,st,i,j,q,nr,o,nu,step,p,set,img,k,sch,rep,sifa,
      stabs,nstab,lst,compst,e,cnt,rt,flip,dcs,unten,pg;

  pg:=IsBound(G.isPermGroup) and  G.isPermGroup;
  # if a is small and b large, compute cosets b\G/a and take inverses of the
  # representatives: Since we compute stabilizers in b and a chain down to
  # a, this is remarkable faster

  if 3*Size(a)<2*Size(b) then
    c:=b;
    b:=a;
    a:=c;
    flip:=true;
    InfoCoset1("#I DoubleCosetFlip\n");
  else
    flip:=false;
  fi;

  CCE:=G.operations.MainEntryCCE;
  if not(pg) then
    GenRelOrdersAgGroup(G);
  fi;
  c:=AscendingChain(G,a);
  r:=[G.identity];
  stabs:=[b];
  dcs:=[];
  for step in [1..Length(c)-1] do
    a1:=c[Length(c)-step+1];
    a2:=c[Length(c)-step];
    InfoCoset1("#I Step :",Size(a1)/Size(a2),"\n");

    # is this the last step?
    unten:=step=Length(c)-1;

    # shall we compute stabilizers?
    compst:=not(unten) or a2.normalStep;

    if pg then
      # prepare special base for CCE
      PermGroupOps.MinimalStabChain(a2);
    else
      # force computation of a Cgs
      Cgs(a2);
    fi;

    t:=RightTransversal(a1,a2);
    s:=[];
    nr:=[];
    nstab:=[];
    for nu in [1..Length(r)] do
      lst:=stabs[nu];
      sifa:=Size(a2)*Size(b)/Size(lst); 
      p:=r[nu];

      rg:=Set(List(t,i->CCE(G,a2,i*p)));

      # if a2 is normal in a1, the stabilizer is the same for all Orbits of
      # right cosets. Thus we need to compute only one, and will receive all
      # others by simple calculations afterwards

      if a2.normalStep then
	cnt:=1;
      else
	cnt:=Length(rg);
      fi;

      while rg<>[] and cnt>0 do
	cnt:=cnt-1;

	# compute orbit and stabilizers for the next step
        # own Orbitalgorithm and stabilizer computation
	
	e:=rg[1];
	Add(nr,e);

	# note: e is canonic representative
	o   := [ e ];
	set := [ e ];
	rep := [ b.identity ];
	st := Subgroup(Parent(G), [] );
	for i  in o  do
	  for j  in lst.generators  do
	    img:=CCE(G,a2,i*j);
	    if not img in set  then
	      Add( o, img );
	      AddSet( set, img );
	      Add( rep, rep[Position(o,i)]*j );
	    elif compst then
	      sch := rep[Position(o,i)]*j
		     / rep[Position(o,img)];
	      if not sch in st  then
		st := G.operations.Subgroup(Parent(G),Union(st.generators,[sch]));
	      fi;
	    fi;
	  od;
	od;

        if unten then
	  if flip then
	    p:=a.operations.DoubleCoset(b,e^(-1),a);
	  else
	    p:=a.operations.DoubleCoset(a,e,b);
	  fi;
	  p.size:=sifa*Length(set);
	  Add(dcs,p);
	fi;

	SubtractSet(rg,set);

	Add(nstab,st);

      od;

      if a2.normalStep then
	# in the normal case, we can obtain the other orbits easily via
	# the orbit theorem (same stabilizer)
	rt:=RightTransversal(lst,st);
	o:=sifa*Length(set); #order
	while rg<>[] do
	  e:=rg[1];
	  Add(nr,e);

	  if unten then
	    if flip then
	      p:=a.operations.DoubleCoset(a,e^(-1),b);
	    else
	      p:=a.operations.DoubleCoset(a,e,b);
	    fi;
	    p.size:=o;
	    Add(dcs,p);
	  fi;

	  SubtractSet(rg,set);
	  Add(nstab,st);
	  SubtractSet(rg,List(rt,i->CCE(G,a2,e*i)));
	od;
      fi;

    od;
    stabs:=nstab;
    r:=nr;
  od;

  return dcs;
end;


#############################################################################
##
#F  AscendingChain(<G>,<U>) . . . . . . .  chain of subgroups G=G_1>...>G_n=U
##
##  Dispatcher for the AscendingChain routines.  Additionally, the normalStep
##  entry is forced.
##
AscendingChain := function(G,U)
local c,i;
  if not IsBound(U.ascendingChain) then
    c:=G.operations.AscendingChain(G,U);
    U.ascendingChain:=c;
    for i in [1..Length(c)-1] do
      if not IsBound(c[i].normalStep) then
	c[i].normalStep:=IsNormal(c[i+1],c[i]);
      fi;
    od;
  fi;
  return U.ascendingChain;
end;

GroupOps.AscendingChain := function(G,U)
  return RefinedChain(G,[U,G]);
end;


#############################################################################
##
#F  RefinedChain(<G>,<c>) . . . . . . . . . . . . . . . .  refine chain links
##
##  <c> is an ascending chain in the Group <G>. The task of this routine is
##  to refine c, i.e. if there is a "link" U>L in c with [U:L] too big,
##  this procedure tries to find Subgroups G_0,...,G_n of G; such that 
##  U=G_0>...>G_n=L. This is done by extending L inductively: Since normal
##  steps can help in further calculations, the routine first tries to
##  extend to the normalizer in U. If the subgroup is self-normalizing,
##  the group is extended via a random element. If this results in a step
##  too big, it is repeated several times to find hopefully a small
##  extension!
##
RefinedChain := function(G,cc)
  local bound,a,b,c,cnt,r,i,j,bb;
  bound:=(10*LogInt(Size(G),10)+1)*Maximum(Factors(Size(G)));
  c:=[];  
  for i in [2..Length(cc)] do  
    Add(c,cc[i-1]);
    if Index(cc[i],cc[i-1]) > bound then
      # c:=Concatenation(c,RefinedChainLink(G,cc[i],cc[i-1]));
      a:=cc[i-1];
      while Index(cc[i],a)>bound do
	# try extension via normalizer
	b:=Normalizer(cc[i],a);
	if b<>a then
	 # extension by normalizer surely is a normal step
	  a.normalStep:=true;
	  bb:=b;
        else
	  bb:=cc[i];
	  a.normalStep:=false;
        fi;
	if b=a then
	  b:=Centralizer(cc[i],Centre(a));
	fi;
	if b=a or Index(b,a)>bound then
	  cnt:=8+2^(LogInt(Index(bb,a),5)+2);
	  repeat
	    if Index(bb,a)<3000 then
	      b:=Extension(bb,a);
	      if b=false then
		b:=bb;
	      fi;
	      cnt:=0;
	    else
	    # larger indices may take more tests...
	      InfoCoset1("#W Random\n");
	      repeat
		r:=Random(bb);
	      until not(r in a);
	      if a.normalStep then
		b:=Closure(a,r);
              else
		# self normalizing subgroup: thus every element not in <a>
     		# will surely map one generator out
	        j:=0;
		repeat
		  j:=j+1;
                until not(a.generators[j]^r in a);
		r:=a.generators[j]^r;

		b:=Closure(a,r);
	      fi;
	      if Size(b)<Size(bb) then
		bb:=b;
		InfoCoset1("#I improvement found\n");
	      fi;
	      cnt:=cnt-1;
	    fi;
	  until Index(bb,a)<=bound or cnt<1;
	fi;
	a:=b;
	if a<>cc[i] then #not upper level
	  Add(c,a);
	fi;
      od;
    fi;
  od;
  Add(c,cc[Length(cc)]);
  return c;
end;


#############################################################################
##
##  Extension(<G>,<U>)  . . . . . . . . . . . . . . . . subgroup, extending U
##
##  This routine tries to find a subgroup E of G, such that G>E>U. If U is
##  maximal, it returns false. This is done by finding minimal blocks for
##  the operation of G on the Right Cosets of U.
##
Extension := function(G,U)
  local t,o,b,p,bl,q;

  if U=G then
    return false;
  fi;
  t:=CanonicalRightTransversal(G,U);
  o:=Operation(G,t,OnCanonicalCosetElements(G,U));
  b:=Blocks(o,PermGroupOps.MovedPoints(o));
  if Length(b)=1 then
    return false;
  else
    p:=Position(t,G.identity);
    bl:=Filtered(b,i->p in i)[1];
    if bl[1]=p then
      q:=bl[2];
    else
      q:=bl[1];
    fi;
    return Closure(U,t[p] mod t[q]);
  fi;
end;


#############################################################################
##
#F  CanonicalRightTransversal(<G>,<U>) .  RightTransversal for U\G containing
#F                                                  canonical representatives
##
CanonicalRightTransversal := function(G,U)
  local c,i;
  #c:=List(RightTransversal(G,U),i->U.operations.CanonicalCosetElement(U,i));
  # don't use bound traverse-> we'll modify it
  c:=G.operations.RightTransversal(G,U);
  for i in [1..Length(c)] do
    c[i]:=U.operations.CanonicalCosetElement(U,c[i]);
  od;
  Sort(c);
  return c;
end;


#############################################################################
##
#F  CanonicalCosetElement( <U>, <g> ) . . . . compute canonical coset element
##
CanonicalCosetElement := function(arg)
  local C;
  if Length(arg)=2 then
    # subgroup, representative
    return arg[1].operations.CanonicalCosetElement(arg[1],arg[2]);
  else
    C:=arg[1];
    if IsRightCoset(C) then
      return C.group.operations.CanonicalCosetElement(C.group,C.representative);
    elif IsGroup(C) then
      return C.identity;
    else 
      Error("usage: CanonicalCosetElement(<G>,<r>) or C.C.E.(<Coset>)");
    fi;
  fi; 
end;

GroupOps.CanonicalCosetElement := function(U,g)
  return Set(Elements(U*g))[1];
end;


#############################################################################
##
#F  OnCanonicalCosetElements(<G>,<U>) . .  create operation function for CCEs
##
##  This function returns another function that can be used like 'OnPoints'
##  to operate on canonical coset elements.
##
OnCanonicalCosetElements := function(G,U)
  return G.operations.OnCanonicalCosetElements(G,U);
end;

GroupOps.OnCanonicalCosetElements := function(G,U)
  return function(a,b)
	   return U.operations.CanonicalCosetElement(U,a*b);
	 end;
end;


#############################################################################
##
#F  PermutationCharacter(<G>,<U>) . permutation character of G on cosets of U
##
PermutationCharacter := function( arg )
    if Length(arg) = 1  then
	return arg[1].operations.PermutationCharacter( arg[1] );
    elif Length(arg) = 2  then
	return arg[1].operations.PermutationCharacter( arg[1], arg[2] );
    else
	return Error( "usage: PermutationCharacter( <G>, <U> )" );
    fi;
end;

GroupOps.PermutationCharacter := function( G, U )
    local   C,  c,  E,  I,  cl,  s,  i;

    # compute the conjugacy classes of <G>
    C :=ConjugacyClasses(G);

    # if the group is small or the elements are known use direct calculation
    if Size(G) < 1000 or IsBound(G.elements)  then
        c := [];
        E := Elements(U);
        I := Size(G) / Length(E);
        for cl  in C  do
    	    i := ShallowCopy(Elements(cl));
    	    IntersectSet( i, E );
    	    Add( c, I * Length(i) / Size(cl) );
        od;

    # otherwise use the double coset function
    else
        s := Size(U);
        c := [ Index(G,U) ];
        for i  in [ 2 .. Length(C) ]  do
	    Add( c, Number( DoubleCosets( G, U,
	        Subgroup( Parent(G), [C[i].representative]) ),
		x -> Size(x)=s ) );
        od;
    fi;

    # return the character
    return c;

end;



#############################################################################
##
#F  IsFactorGroupElement(<C>) . . test if an object is a factor group element
##
IsFactorGroupElement := function ( C )
    return IsRec( C )
       and IsBound( C.isFactorGroupElement )
       and C.isFactorGroupElement;
end;


#############################################################################
##
#F  FactorGroupElement(<N>,<g>) . . . . . . . . . make a factor group element
##
FactorGroupElement := function ( arg )
    local   C;
    if Length( arg ) = 1  and IsGroup( arg[1] )  then
        C := arg[1].operations.FactorGroupElement( arg[1], arg[1].identity );
    elif Length( arg ) = 2  and IsGroup( arg[1] )  then
        if not arg[2] in Parent( arg[1] )  then
            Error("<g> must be in the parent group of <U>");
        fi;
        C := arg[1].operations.FactorGroupElement( arg[1], arg[2] );
    else
        Error("usage: FactorGroupElement( <N> [, <g>] )");
    fi;
    return C;
end;

GroupOps.FactorGroupElement := function ( N, g )
    local   C;          # factor group element of <N> and <g>, result

    # make the factor group element
    C := rec( );
    C.isGroupElement       := true;
    C.isFactorGroupElement := true;
    C.domain               := FactorGroupElements;

    # enter the identifying information
    C.element              := N.operations.RightCoset( N, g );

    # enter the operations record
    C.operations           := FactorGroupElementOps;

    # return the coset
    return C;
end;


#############################################################################
##
#V  FactorGroupElementOps . . . .  operations record of factor group elements
##
FactorGroupElementOps := Copy( GroupElementOps );

FactorGroupElementOps.\* := function ( c, d )
    local   prd;        # product of <c> and <d>, result
    if      IsFactorGroupElement(c)
        and IsFactorGroupElement(d)
        and c.element.group = d.element.group
    then
        prd := c.element.group.operations.FactorGroupElement(
                                   c.element.group,
                                     c.element.representative
                                   * d.element.representative );
    elif IsList( c )  then
        prd := List( c, x -> x * d );
    elif IsList( d )  then
        prd := List( d, x -> c * x );
    elif IsRec( c ) and IsFactorGroupElement( d ) and IsBound( c.operations ) and
         IsBound( c.operations.\* ) and c.operations.\* <> d.operations.\* then
        return c.operations.\*( c, d );
    else
        Error("product of <c> and <d> is not defined");
    fi;
    return prd;
end;

FactorGroupElementOps.\/ := function ( c, d )
    local   quo;        # quotient of <c> and <d>, result
    if      IsFactorGroupElement(c)
        and IsFactorGroupElement(d)
        and c.element.group = d.element.group
    then
        quo := c.element.group.operations.FactorGroupElement(
                                   c.element.group,
                                     c.element.representative
                                   / d.element.representative );
    elif IsList( c )  then
        quo := List( c, x -> x / d );
    elif IsList( d )  then
        quo := List( d, x -> c / x );
    else
        Error("quotient of <c> and <d> is not defined");
    fi;
    return quo;
end;

FactorGroupElementOps.\mod := function ( c, d )
    local   quo;        # left quotient of <c> and <d>, result
    if      IsFactorGroupElement(c)
        and IsFactorGroupElement(d)
        and c.element.group = d.element.group
    then
        quo := c.element.group.operations.FactorGroupElement(
                                   c.element.group,
                                       c.element.representative
                                   mod d.element.representative );
    elif IsList( c )  then
        quo := List( c, x -> x mod d );
    elif IsList( d )  then
        quo := List( d, x -> c mod x );
    else
        Error("left quotient of <c> and <d> is not defined");
    fi;
    return quo;
end;

FactorGroupElementOps.\^ := function ( c, d )
    local   pow;        # power of <c> and <d>, result
    if      IsFactorGroupElement(c)
        and IsFactorGroupElement(d)
        and c.element.group = d.element.group
    then
        pow := c.element.group.operations.FactorGroupElement(
                                   c.element.group,
                                     c.element.representative
                                   ^ d.element.representative );
    elif IsInt( d )  then
        pow := c.element.group.operations.FactorGroupElement(
                                   c.element.group,
                                   c.element.representative ^ d );
    elif IsGroup( c )  then
        pow := c.operations.\^( c, d );
    else
        Error("power of <c> and <d> is not defined");
    fi;
    return pow;
end;

FactorGroupElementOps.Comm := function ( c, d )
    local   comm;       # commutator of <c> and <d>, result
    if      IsFactorGroupElement(c)
        and IsFactorGroupElement(d)
        and c.element.group = d.element.group
    then
        comm := c.element.group.operations.FactorGroupElement(
                                    c.element.group,
                                    Comm( c.element.representative,
                                          d.element.representative ) );
    else
        Error("commutator of <c> and <d> is not defined");
    fi;
    return comm;
end;

FactorGroupElementOps.Print := function ( c )
    Print("FactorGroupElement( ",c.element.group,", ",
          c.element.representative," )");
end;


#############################################################################
##
#F  FactorGroupElements . . . . . . . . . domain of all factor group elements
#F  FactorGroupElementsOps  . . . . operations record for FactorGroupElements
##
FactorGroupElements             := rec();
FactorGroupElements.isDomain    := true;

FactorGroupElements.name        := "FactorGroupElements";

FactorGroupElements.isFinite    := false;
FactorGroupElements.size        := "infinity";

FactorGroupElements.operations  := Copy( GroupElementsOps );
FactorGroupElementsOps          := FactorGroupElements.operations;

FactorGroupElementsOps.Order := function ( G, c )
    local   ord,        # order of the coset <c>, result
            rep,        # representative of the coset <c>
            grp,        # group of the coset <c>
            div;        # prime divisor of the order of <rep>

    # compute the order
    rep := c.element.representative;
    grp := c.element.group;
    ord := Order( Parent(grp), rep );
    for div in Set( Factors( ord ) )  do
        while ord <> 1  and ord mod div = 0  and rep^(ord/div) in grp  do
            ord := ord / div;
        od;
    od;

    # return the order
    return ord;
end;

FactorGroupElementsOps.\in     := function ( g, FactorGroupElements )
    return IsFactorGroupElement( g );
end;


#############################################################################
##
#F  FactorGroup(<G>,<N>)  . . . . . . . . . . . . . . factor group of a group
##
FactorGroup := function ( G, N )
    local   F;          # factor of <G> over <N>, result

    # check the arguments
    if not IsGroup( G )  then
        Error("<G> must be a group");
    fi;
    if    (not IsGroup(N)  or not IsSubgroup(G,N)  or not IsNormal(G,N))
      and (not IsList(N)  or not ForAll( N, n -> n in G ))
    then
        Error("<N> must be a normal subgroup of <G>");
    fi;

    # first handle the case of a quotient by a normal subgroup
    if IsGroup( N )  then

        # make the factor group
        if IsParent( G )  then
            if not IsBound( N.factorGroup )  then
                N.factorGroup := G.operations.FactorGroup( G, N );
            fi;
            F := N.factorGroup;
        else
            F := G.operations.FactorGroup( G, N );
        fi;

        # return the factor group
        F.factorNum := G;
        F.factorDen := N;

    # otherwise compute the factor by a relation
    else

        # make the factor group
        F := G.operations.FactorGroupRelation( G, N );

    fi;

    return F;
end;

GroupOps.\/ := function ( G, N )
    return FactorGroup( G, N );
end;

GroupOps.FactorGroup := function ( G, N )
    local   F;          # factor of <G> over <N>, result

    # make the factor group
    F := Group( List( G.generators, gen -> FactorGroupElement(N,gen) ),
                FactorGroupElement(N,G.identity) );

    # return the factor group
    return F;
end;

GroupOps.FactorGroupRelation := function ( G, N )

    # make the factor group
    return FactorGroup( G, NormalClosure( G, Subgroup( G, N ) ) );

end;


#############################################################################
##
#F  FactorGroupElementsOps.Group(<D>,<gens>,<id>) . . . create a factor group
##
FactorGroupElementsOps.Group := function ( FactorGroupElements, gens, id )
    local   G;          # permutation group <G>, result

    # check the arguments
    if not ForAll( gens, gen->gen.element.group
                         =gens[1].element.group )  then
        Error("the factor group elements must have the same subgroup");
    fi;

    # let the default function do the main work
    G := GroupElementsOps.Group( FactorGroupElements, gens, id );

    # add the permutation group tag
    G.isFactorGroup     := true;

    # add the operations record
    G.operations        := FactorGroupOps;

    # return the factor group
    return G;
end;


#############################################################################
##
#F  NaturalHomomorphism(<G>,<F>)  .  natural homomorphism onto a factor group
##
NaturalHomomorphism := function ( G, F )
    local   hom;        # natural homomorphism of <G> onto <F>, result

    # check the arguments
    if not IsGroup( F )  or not IsBound( F.factorNum )  then
        Error("<F> must be a factor group");
    fi;
    if not IsGroup( G )  or not IsSubgroup( F.factorNum, G )  then
        Error("<G> must be a subgroup of the numerator of <F>");
    fi;

    # compute the homomorphism
    if G = F.factorNum  then
        if not IsBound( F.naturalHomomorphism )  then
            F.naturalHomomorphism := F.operations.NaturalHomomorphism(G,F);
        fi;
        hom := F.naturalHomomorphism;
    else
        hom := F.operations.NaturalHomomorphism( G, F );
    fi;

    # return the homomorphism
    return hom;
end;

GroupOps.NaturalHomomorphism := function ( G, F )
    local   hom;        # natural homomorphism from <G> onto <F>, result

    # make the homomorphism
    hom := rec();
    hom.isGeneralMapping := true;
    hom.domain          := Mappings;
    hom.source          := G;
    hom.range           := F;

    # enter usefull information
    hom.isMapping       := true;
    hom.isHomomorphism  := true;
    hom.isEndomorphism  := false;
    hom.isAutomorphism  := false;
    hom.preImage        := hom.source;
    if G = F.factorNum  then
        hom.isInjective     := IsTrivial( F.factorDen );
        hom.isSurjective    := true;
        hom.isBijection     := hom.isInjective;
        hom.isMonomorphism  := hom.isInjective;
        hom.isEpimorphism   := true;
        hom.isIsomorphism   := hom.isInjective;
        hom.image           := hom.range;
        hom.kernel          := F.factorDen;
    fi;

    # enter the operations record
    hom.operations      := NaturalHomomorphismOps;

    # return the homomorphism
    return hom;
end;

NaturalHomomorphismOps := Copy( GroupHomomorphismOps );

NaturalHomomorphismOps.ImageElm := function ( hom, elm )
    return FactorGroupElement( hom.range.factorDen, elm );
end;

NaturalHomomorphismOps.ImagesElm := function ( hom, elm )
    return [ FactorGroupElement( hom.range.factorDen, elm ) ];
end;

NaturalHomomorphismOps.ImagesRepresentative := function ( hom, elm )
    return FactorGroupElement( hom.range.factorDen, elm );
end;

NaturalHomomorphismOps.PreImagesElm := function ( hom, elm )
    if hom.source = hom.range.factorNum  then
        return elm.element;
    else
        return Coset( Kernel( hom ), PreImagesRepresentative( hom, elm ) );
    fi;
end;

NaturalHomomorphismOps.PreImagesRepresentative := function ( hom, elm )
    if hom.source = hom.range.factorNum  then
        return elm.element.representative;
    else
        return Elements( Intersection( hom.source, elm.element ) )[1];
    fi;
end;

NaturalHomomorphismOps.KernelGroupHomomorphism := function ( hom )
    return Intersection( hom.source, hom.range.factorDen );
end;

NaturalHomomorphismOps.Print := function ( hom )
    Print("NaturalHomomorphism( ",hom.source,", ",hom.range," )");
end;


#############################################################################
##

#F  FactorGroupOps  . . . . . . . . . . . operations record for factor groups
##
##  This  comes so late, because  we first wanted to  make all assignments to
##  'GroupOps', of which we take a copy now.
##
FactorGroupOps  := Copy( GroupOps );


#############################################################################
##
#F  FactorGroupOps.in . . . . . . . . . . . . . . . . . . . . membership test
##
FactorGroupOps.\in := function ( elm, F )
    return IsFactorGroupElement( elm )
       and elm.element.group = F.factorDen
       and elm.element.representative in F.factorNum;
end;

#############################################################################
##
#F  FactorGroupOps.Elements( <F> )  . . . . . . . . . . . all elements of <F>
##
FactorGroupOps.Elements := function ( F )
    local   elms,       # elements of <F>, result
            cos,        # coset of normal subgroup in whole group
            elm;        # factor group element for <cos>

    # make the set of elements
    elms := [];
    for cos  in Set( RightCosets( F.factorNum, F.factorDen ) )  do
        elm := rec();
        elm.isGroupElement       := true;
        elm.isFactorGroupElement := true;
        elm.domain               := FactorGroupElements;
        elm.element              := cos;
        elm.operations           := FactorGroupElementOps;
        Add( elms, elm );
    od;

    # return the set of elements
    return elms;
end;


#############################################################################
##
#F  FactorGroupOps.Size( <F> )  . . . . . . . . . . . . . . . . . size of <F>
##
FactorGroupOps.Size := function ( F )
    return Index( F.factorNum, F.factorDen );
end;


#############################################################################
##
#F  FactorGroupOps.Random( <F> )  . . . . . . . . . . . . .  a random element
##
FactorGroupOps.Random := function ( F )
    if IsBound( F.elements )  then
        return Random( F.elements );
    else
        return FactorGroupElement( F.factorDen, Random(F.factorNum) );
    fi;
end;


#############################################################################
##
#F  FactorGroupOps.Order( <G>, <c> )  . . . . . . . . . . . . .  order of <c>
##
FactorGroupOps.Order := function ( G, c )
    local   ord,        # order of the coset <c>, result
            rep,        # representative of the coset <c>
            grp,        # group of the coset <c>
            div;        # prime divisor of the order of <rep>

    # compute the order
    rep := c.element.representative;
    grp := c.element.group;
    ord := Order( Parent(grp), rep );
    for div in Set( Factors( ord ) )  do
        while ord <> 1  and ord mod div = 0  and rep^(ord/div) in grp  do
            ord := ord / div;
        od;
    od;

    # return the order
    return ord;
end;


#############################################################################
##
#F  FactorGroupOps.Print( <F> ) . . . . . . . . . . . . . . . . nice printing
##
FactorGroupOps.Print := function ( F )
    Print("(",F.factorNum," / ",F.factorDen,")");
end;
