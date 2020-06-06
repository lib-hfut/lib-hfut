#############################################################################
##
#A  domain.g                    GAP library                  Martin Schoenert
##
#A  @(#)$Id: domain.g,v 3.19.1.1 1995/09/28 14:42:44 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains those  functions  that  are  dispatcher  for  domains.
##
#H  $Log: domain.g,v $
#H  Revision 3.19.1.1  1995/09/28  14:42:44  sam
#H  fixed bug in 'DomainOps.Intersection
#H
#H  Revision 3.19  1994/06/10  02:43:29  sam
#H  added 'DomainOps.Parent'
#H
#H  Revision 3.18  1994/05/26  13:37:02  sam
#H  added 'DomainOps.IsParent'
#H
#H  Revision 3.17  1994/05/18  15:56:20  sam
#H  fixed 'Domain' for matrices over fields of characteristic zero
#H
#H  Revision 3.16  1994/02/15  17:10:08  sam
#H  'Size' accepts also records with 'size' component that are no domains
#H
#H  Revision 3.15  1994/02/02  10:11:44  sam
#H  moved 'Representative' to 'dispatch.g'
#H
#H  Revision 3.14  1993/03/18  09:19:25  martin
#H  the test for 'GaussianRationals' is now in 'Cyclotomics'
#H
#H  Revision 3.13  1993/02/15  10:08:58  fceller
#H  changed 'DomainOps.Print' to avoid kernel flaw
#H
#H  Revision 3.12  1993/02/10  20:28:19  martin
#H  changed 'Union' to accept empty list and 'Difference' to accept lists
#H
#H  Revision 3.11  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.10  1992/04/23  10:32:29  fceller
#H  added 'FiniteFieldMatrices'
#H
#H  Revision 3.9  1992/03/12  13:52:27  martin
#H  fixed 'Domain', the test for Gaussians must come before Cyclotomics
#H
#H  Revision 3.8  1992/01/24  14:48:49  martin
#H  added 'Representative'
#H
#H  Revision 3.7  1992/01/20  11:41:09  martin
#H  changed 'IsSubset' to be more careful about computing element sets
#H
#H  Revision 3.6  1992/01/15  11:00:27  martin
#H  changed 'Domain' to test for Gaussian rationals last
#H
#H  Revision 3.5  1991/12/04  11:13:01  martin
#H  added 'DefineName'
#H
#H  Revision 3.4  1991/12/04  08:46:30  martin
#H  added 'Domain'
#H
#H  Revision 3.3  1991/10/09  13:50:31  martin
#H  added 'DomainOps.Print'
#H
#H  Revision 3.2  1991/09/09  14:19:56  martin
#H  changed everything for 'DomainOps'
#H
#H  Revision 3.1  1991/08/09  09:41:09  martin
#H  fixed a minor bug in 'Size'
#H
#H  Revision 3.0  1991/08/08  15:29:15  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  IsDomain( <D> ) . . . . . . . . . . . . . . . . . . . . . test for domain
##
##  'IsDomain( <D> )'
##
##  'IsDomain' returns 'true' if <D> is a domain and 'false' otherwise.  Will
##  signal an error when <D> is an unbound variable.
##
IsDomain := function ( D )
    return IsRec( D )
       and IsBound( D.isDomain );
end;


#############################################################################
##
#F  Domain(<elms>)  . . . . . . . . . .  domain containing a list of elements
##
##  'Domain'  returns  a domain that   contains the elements  <elms>.   It is
##  the task  of  those domains  to  construct   groups,  fields,  etc.  from
##  those   elements.   'Domain' is  the only  function  that knows about the
##  basic types.
##
Domain := function ( elms )
    local   elm;

    # try to find a common domain
    if   ForAll( elms, IsInt )  then
        return Integers;
    elif ForAll( elms, IsRat )  then
        return Rationals;
    elif ForAll( elms, IsFFE )  then
        return FiniteFieldElements;
    elif ForAll( elms, IsPerm )  then
        return Permutations;
    elif ForAll( elms, IsMat )  then
    	if ForAll( elms, x -> IsFFE(x[1][1]) )  then
    	    return FiniteFieldMatrices;
    	elif ForAll( elms, x -> IsCyc( x[1][1] ) )  then
    	    return FieldMatrices;
    	else
            return Matrices;
    	fi;
    elif ForAll( elms, IsWord )  then
        return Words;
    elif ForAll( elms, IsAgWord )  then
        return AgWords;
    elif ForAll( elms, IsCyc )  then
        return Cyclotomics;
    else
        for elm  in elms do
            if    IsRec(elm)  and IsBound(elm.domain)
              and ForAll( elms, l -> l in elm.domain )
            then
                return elm.domain;
            fi;
        od;
        Error("sorry, the elements of <arg> lie in no common ring domain");
    fi;
end;


#############################################################################
##
#V  DomainOps . . . . . . . . . . .  operation record for the domain category
##
##  'DomainOps'   is  the operation  record  for domains.    It  contains the
##  functions for the domain operations, e.g., 'Size' and 'Intersection'.
##
##  The operations records for other categories are created  by making a copy
##  of this record  and then adding new functions.   For  example the  record
##  'GroupOps'  is a copy  of 'DomainOps' that  adds functions like 'Closure'
##  and 'Centralizer'.  Some functions will overlay  existing  entries of the
##  domain operations record.   In the above  example the   group function to
##  test for equality overlays the domain function.
##
DomainOps := OperationsRecord( "DomainOps" );


#############################################################################
##
#F  Elements( <D> ) . . . . . . . . . . . . . . . . . .  elements of a domain
#F  DomainOps.Elements( <D> ) . . . . . . . . . . . . .  elements of a domain
##
##  'Elements( <D> )'
##
##  'Elements' returns the set of elements of <D>, which must  be a domain or
##  a list.  If <D> is  a domain, 'Elements'  stores  the element list in the
##  record component '<D>.elements' for later use.
##
##  'DomainOps.Elements' is the default function to compute the elements of a
##  domain.   Since  there exists no  general  method  it  just  generates a,
##  hopefully meaningfull, error message.
##
##  'Elements'   is the most basic  function  of the domain  package.   Other
##  functions use 'Elements'.
##
Elements := function ( D )
    local   elms;
    if IsSet( D )  then
        elms := D;
    elif IsDomain( D )  and IsBound( D.elements )  then
        elms := D.elements;
    elif IsDomain( D )  then
        D.elements := D.operations.Elements( D );
        elms := D.elements;
    else
        Error("<D> must be a domain or a set");
    fi;
    return elms;
end;

DomainOps.Elements := function ( D )
    if IsBound( D.isFinite ) and not D.isFinite  then
        Error("the domain <D> must be finite to compute its elements");
    else
        Error("sorry, do not know how to compute the elements of <D>");
    fi;
end;


#############################################################################
##
#F  IsFinite( <D> ) . . . . . . . . . . . . . . .  test if a domain is finite
#F  DomainOps.IsFinite( <D> ) . . . . . . . . . .  test if a domain is finite
##
##  'IsFinite( <D> )'
##
##  'IsFinite'  returns  'true'  if the  domain <D>   is  finite  and 'false'
##  otherwise.  <D> may also be a proper  set,  which  of  course  is  always
##  finite.
##
##  'DomainOps.IsFinite' is  the  default function to  check if   a domain is
##  finite.  It is called from 'IsFinite( <D> )' if <D> is  a domain, instead
##  of a set.
##
IsFinite := function ( D )
    local   isFin;
    if IsSet( D )  then
        isFin := true;
    elif IsDomain( D )  and IsBound( D.isFinite )  then
        isFin := D.isFinite;
    elif IsDomain( D )  then
        D.isFinite := D.operations.IsFinite( D );
        isFin := D.isFinite;
    else
        Error("<D> must be a domain or a set");
    fi;
    return isFin;
end;

DomainOps.IsFinite := function ( D )
    return Size( D ) < "infinity";
end;


#############################################################################
##
#F  Size( <D> ) . . . . . . . . . . . . . . . . . .  size (order) of a domain
#F  DomainOps.Size( <D> ) . . . . . . . . . . . . .  size (order) of a domain
##
##  'Size( <D> )'
##
##  'Size' returns the order of the domain <D>, i.e.,  the number of elements
##  in the domain <D>.  If a  domain  is infinite, 'Size' returns  the string
##  '"infinity"'.  <D> may also be a proper set.
##
##  'DomainOps.Size' is the default function to compute the size of a domain.
##  It is called from 'Size( <D> )' if <D> is a domain.
##
Size := function ( D )
    local   size;
    if IsSet( D )  then
        size := Length( D );
    elif IsRec( D )  and IsBound( D.size )  then
        size := D.size;
    elif IsDomain( D )  then
        D.size := D.operations.Size( D );
        size := D.size;
    else
        Error("<D> must be a domain or a set");
    fi;
    return size;
end;

DomainOps.Size := function ( D )
    return Length( Elements( D ) );
end;


#############################################################################
##
#F  DomainOps.\=( <D>, <E> ) . . . . . . . . .  test for equality of domains
##
##  '<D> = <E>'
##
##  '=' returns 'true' if the two operands <D> and  <E> are equal and 'false'
##  otherwise.  Two  domains are considered  equal  if their sets of elements
##  are equal.    A domain is considered  to   be   equal to  the  set of its
##  elements.  A domain is never equal to another object that is not a domain
##  or a set.
##
##  'DomainOps.=' is the default function to compare domains.  It  is  called
##  from the binary operation '<D> = <E>' if either <D> or <E> is a domain.
##
DomainOps.\= := function ( D, E )
    local   isEql;
    if IsSet( D )  then
        if IsDomain( E )  and IsFinite( E )  then
            isEql :=     (Size( D ) = Size( E ))
                     and (D = Elements( E ));
        elif IsDomain( E )  then
            isEql := false;
        else
            Error("panic, neither <D> nor <E> is a domain");
        fi;
    elif IsDomain( D )  and IsFinite( D )  then
        if IsSet( E )  then
            isEql :=     (Size( D ) = Size( E ))
                     and (Elements( D ) = E);
        elif IsDomain( E )  and IsFinite( E )  then
            isEql :=     (Size( D ) = Size( E ))
                     and (Elements( D ) = Elements( E ));
        else
            isEql := false;
        fi;
    elif IsDomain( D )  then
        if IsDomain( E )  and IsFinite( E )  then
            isEql := false;
        elif IsDomain( E )  then
            Error("sorry, cannot compare the infinite domains <D> and <E>");
        else
            isEql := false;
        fi;
    else
        if IsDomain( E )  then
            isEql := false;
        else
            Error("panic, neither <D> nor <E> is a domain");
        fi;
    fi;
    return isEql;
end;


#############################################################################
##
#F  DomainOps.\<( <D>, <E> ) . . . . . . . . .  test for ordering of domains
##
##  '<D> \< <E>'
##
##  '\<' returns 'true' if <D> is smaller than <E> and 'false'  otherwise.  A
##  domain <D> is considered to be smaller than another domain <E> if the set
##  of elements of <D> is smaller  than the set of  elements of <E>.   Either
##  operand may also  be a   set.  Generally, if  a domain  is compared  with
##  another object the result is the same as the result  of comparing the set
##  of elements of the domain with the other object.
##
##  'DomainOps.<' is the  defaul function to  compare domains.  It  is called
##  from the binary operation '<D> \< <E>' if either <D> or <E> is a domain.
##
DomainOps.\< := function ( D, E )
    local   isLess;
    if IsSet( D )  then
        if IsDomain( E )  and IsFinite( E )  then
            isLess := (D < Elements( E ));
        elif IsDomain( E )  then
            Error("sorry, cannot compare <D> with the infinite domain <E>");
        else
            Error("panic, neither <D> nor <E> is a domain");
        fi;
    elif IsDomain( D )  and IsFinite( D )  then
        if IsSet( E )  then
            isLess := (Elements( D ) < E);
        elif IsDomain( E )  and IsFinite( E )  then
            isLess := (Elements( D ) < Elements( E ));
        elif IsDomain( E )  then
            Error("sorry, cannot compare <D> with the infinite domain <E>");
        else
            isLess := (Elements( D ) < E);
        fi;
    elif IsDomain( D )  then
        Error("sorry, cannot compare <E> with the infinite domain <D>");
    else
        if IsDomain( E )  and IsFinite( E )  then
            isLess := (D < Elements( E ));
        elif IsDomain( E )  then
            Error("sorry, cannot compare <D> with the infinite domain <E>");
        else
            Error("panic, neither <D> nor <E> is a domain");
        fi;
    fi;
    return isLess;
end;


#############################################################################
##
#F  DomainOps.\in( <d>, <D> )  . . . . . . . .  membership tests for domains
##
##  '<d> in <D>'
##
##  'in' returns 'true' if the element <d> lies in the domain <D> and 'false'
##  otherwise.
##
##  'DomainOps.in' is the default function to test for membership in domains.
##  It is called from the binary operation '<d> in <D>' if <D> is a domain.
##
DomainOps.\in := function ( d, D )
    local   isElm;
    if IsDomain( D )  and IsFinite( D )  then
        isElm := (d in Elements( D ));
    elif IsDomain( D )  then
        Error("sorry, cannot test if <d> lies in the infinite domain <D>");
    else
        Error("panic, <D> must be a domain");
    fi;
    return isElm;
end;


#############################################################################
##
#F  IsSubset( <D>, <E> )  . . . . . . . . . . . .  test for subset of domains
#F  DomainOps.IsSubset( <D>, <E> )  . . . . . . .  test for subset of domains
##
##  'IsSubset( <D>, <E> )'
##
##  'IsSubset' returns 'true' if <E>, which must be  a domain or  a set, is a
##  subset  of  <D>, which also   must be a  domain  or a  set, and   'false'
##  otherwise.
##
##  'DomainOps.IsSubset' is  the default function   to  test for  subsets  in
##  domains.  It is called from  'IsSubset( <D>, <E> )'  if  <D> or <E> is  a
##  domain.
##
IsSubset := function ( D, E )
    local   isSub;
    if IsList( D )  then
        if IsList( E )  then
            isSub := IsSubsetSet( D, E );
        elif IsDomain( E )  then
            isSub := E.operations.IsSubset( D, E );
        else
            Error("<E> must be a domain or a set");
        fi;
    elif IsDomain( D )  then
        if IsList( E )  then
            isSub := D.operations.IsSubset( D, E );
        elif IsDomain( E )  then
            isSub := E.operations.IsSubset( D, E );
        else
            Error("<E> must be a domain or a set");
        fi;
    else
        Error("<D> must be a domain or a set");
    fi;
    return isSub;
end;

DomainOps.IsSubset := function ( D, E )
    local   isSub;
    if IsSet( D )  then
        if IsDomain( E )  and IsFinite( E )  then
            isSub :=     (Size( D ) >= Size( E ))
                     and IsSubsetSet( D, Elements( E ) );
        elif IsDomain( E )  then
            isSub := false;
        else
            Error("panic, neither <D> nor <E> is a domain");
        fi;
    elif IsDomain( D ) and IsBound( D.elements )  then
        if IsDomain( E )  and IsFinite( E )  then
            isSub :=     (Size( D ) >= Size( E ))
                     and IsSubsetSet( Elements( D ), Elements( E ) );
        elif IsDomain( E )  then
            isSub := false;
        elif IsSet( E )  then
            isSub :=     (Size( D ) >= Size( E ))
                     and IsSubsetSet( Elements( D ), E );
        else
            Error("<E> must be a domain or a set");
        fi;
    elif IsDomain( D ) and IsFinite( D )  then
        if IsDomain( E )  and IsFinite( E )  then
            isSub :=     (Size( D ) >= Size( E ))
                     and ForAll( Elements( E ), e -> e in D );
        elif IsDomain( E )  then
            isSub := false;
        elif IsSet( E )  then
            isSub :=     (Size( D ) >= Size( E ))
                     and ForAll( E, e -> e in D );
        else
            Error("<E> must be a domain or a set");
        fi;
    elif IsDomain( D )  then
        if IsDomain( E )  and IsFinite( E )  then
            isSub := ForAll( Elements( E ), e -> e in D );
        elif IsDomain( E )  then
            Error("sorry, cannot compare the infinite domains <D> and <E>");
        elif IsSet( E )  then
            isSub := ForAll( E, e -> e in D );
        else
            Error("<E> must be a domain or a set");
        fi;
    else
        Error("<D> must be a domain or a set");
    fi;
    return isSub;
end;


#############################################################################
##
#F  Intersection( <D>, ... )  . . . . . . . . . . . . intersection of domains
#F  DomainOps.Intersection( <D>, <E> )  . . . . . . . intersection of domains
##
##  'Intersection( <D>, ... )'
##  'Intersection( <list> )'
##
##  'Intersection' returns the intersection  of its arguments,  which must be
##  domains or sets, or  the intersection of the domains  or sets in the list
##  <list>.
##
##  'DomainOps.Intersection'   is   the  default  function  to  compute   the
##  intersection of domains.  It is called from 'Intersection( <D>, <E> )' if
##  <D> or <E> is a domain.
##
Intersection := function ( arg )
    local   I,          # intersection, result
            D,          # domain or list, running over the arguments
            copied,     # true if I is a list not identical to anything else
            i;          # loop variable

    # unravel the argument list if necessary
    if Length(arg) = 1  and IsList(arg[1])  then
        arg := arg[1];
    fi;

    # start with the first domain or list
    I := arg[1];
    copied := false;

    # loop over the other domains or lists
    for i  in [2..Length(arg)]  do
        D := arg[i];
        if IsList( D )  then
            if IsSet( I )  then
                if not copied  then I := ShallowCopy( I );  fi;
                IntersectSet( I, D );
                copied := true;
            elif IsList( I )  then
                I := Set( I );
                IntersectSet( I, D );
                copied := true;
            elif IsDomain( I )  then
                I := I.operations.Intersection( I, D );
                copied := false;
            else
                Error("<D> must be a domain or a set");
            fi;
        elif IsDomain( D )  then
            if IsList( I )  or IsDomain( I )  then
                I := D.operations.Intersection( I, D );
                copied := false;
            else
                Error("<D> must be a domain or a set");
            fi;
        else
            Error("<D> must be a domain or a set");
        fi;
    od;

    # return the intersection
    return I;
end;

IntersectionSet := function ( D, E )
    local   I;
    if Length( D ) < Length( E )  then
        I := Set( D );
        IntersectSet( I, E );
    else
        I := Set( E );
        IntersectSet( I, D );
    fi;
    return I;
end;

DomainOps.Intersection := function ( D, E )
    local   I,  elm;
    if IsList( D )  then
        if IsList( E )  then
            Error("panic, neither <D> nor <E> is a domain");
        elif IsDomain( E )  and IsFinite( E )  then
            I := Set( D );
            IntersectSet( I, Elements( E ) );
        elif IsDomain( E )  then
            I := [];
            for elm  in Set( D )  do
                if elm  in E  then
                    AddSet( I, elm );
                fi;
            od;
        else
            Error("<E> must be a domain or a set");
        fi;
    elif IsDomain( D )  and IsFinite( D )  then
        if IsList( E )  then
            I := ShallowCopy( Elements( D ) );
            IntersectSet( I, E );
        elif IsDomain( E )  and IsFinite( E )  then
            I := ShallowCopy( Elements( D ) );
            IntersectSet( I, Elements( E ) );
        elif IsDomain( E )  then
            I := [];
            for elm  in Set( D )  do
                if elm  in E  then
                    AddSet( I, elm );
                fi;
            od;
        else
            Error("<E> must be a domain or a set");
        fi;
    elif IsDomain( D )  then
        if IsList( E )  then
            I := [];
            for elm  in Set( E )  do
                if elm  in D  then
                    AddSet( I, elm );
                fi;
            od;
        elif IsDomain( E )  and IsFinite( E )  then
            I := [];
            for elm  in Elements( E )  do
                if elm  in D  then
                    AddSet( I, elm );
                fi;
            od;
        elif IsDomain( E )  then
            Error("sorry, cannot intersect infinite domains <D> and <E>");
        else
            Error("<E> must be a domain or a set");
        fi;
    else
        Error("<D> must be a domain or a set");
    fi;
    return I;
end;


#############################################################################
##
#F  Union( <D>, ... ) . . . . . . . . . . . . . . . . . . .  union of domains
#F  DomainOps.Union( <D>, <E> ) . . . . . . . . . . . . . .  union of domains
##
##  'Union( <D>, ... )'
##  'Union( <list> )'
##
##  'Union' returns the  union of its arguments, which   must  be domains  or
##  sets, or the union of the domains or sets in the list <list>.
##
##  'DomainOps.Union'  is the  default  function  to  compute the   union  of
##  domains.  It   is called from 'Union(  <D>,  <E> )'  if <D> or  <E>  is a
##  domain.
##
Union := function ( arg )
    local   U,          # union, result
            D,          # domain or list, running over the arguments
            copied,     # true if U is a list not identical to anything else
            i;          # loop variable

    # unravel the argument list if necessary
    if Length(arg) = 1  and IsList(arg[1])  then
        if arg[1] = []  then return [];  fi;
        arg := arg[1];
    fi;

    # start with the first domain or list
    U := arg[1];
    copied := false;

    # loop over the other domains or lists
    for i  in [2..Length(arg)]  do
        D := arg[i];
        if IsList( D )  then
            if IsSet( U )  then
                if not copied  then U := ShallowCopy( U );  fi;
                UniteSet( U, D );
                copied := true;
            elif IsList( U )  then
                U := Set( U );
                UniteSet( U, D );
                copied := true;
            elif IsDomain( U )  then
                U := U.operations.Union( U, D );
                copied := false;
            else
                Error("<D> must be a domain or a set");
            fi;
        elif IsDomain( D )  then
            if IsList( U )  or IsDomain( U )  then
                U := D.operations.Union( U, D );
                copied := false;
            else
                Error("<D> must be a domain or a set");
            fi;
        else
            Error("<D> must be a domain or a set");
        fi;
    od;

    # return the union
    return U;
end;

UnionSet := function ( D, E )
    local   U;
    if Length( D ) < Length( E )  then
        U := Set( E );
        UniteSet( U, D );
    else
        U := Set( D );
        UniteSet( U, E );
    fi;
    return U;
end;

DomainOps.Union := function ( D, E )
    local   U,  elm;
    if IsList( D )  then
        if IsList( E )  then
            Error("panic, neither <D> nor <E> is a domain");
        elif IsDomain( E )  and IsFinite( E )  then
            U := Set( D );
            UniteSet( U, Elements( E ) );
        elif IsDomain( E )  then
            Error("sorry, cannot unite <D> with the infinite domain <E>");
        else
            Error("<E> must be a domain or a set");
        fi;
    elif IsDomain( D )  and IsFinite( D )  then
        if IsList( E )  then
            U := ShallowCopy( Elements( D ) );
            UniteSet( U, E );
        elif IsDomain( E )  and IsFinite( E )  then
            U := ShallowCopy( Elements( D ) );
            UniteSet( U, Elements( E ) );
        elif IsDomain( E )  then
            Error("sorry, cannot unite <D> with the infinite domain <E>");
        else
            Error("<E> must be a domain or a set");
        fi;
    elif IsDomain( D )  then
        if IsList( E )  or IsDomain( E )  then
            Error("sorry, cannot unite <E> with the infinite domain <D>");
        else
            Error("<E> must be a domain or a set");
        fi;
    else
        Error("<D> must be a domain or a set");
    fi;
    return U;
end;


#############################################################################
##
#F  DomainOps.IsParent( <D> )
##
DomainOps.IsParent := function( D )
    return not IsBound( D.parent );
    end;

#############################################################################
##
#F  DomainOps.Parent( <L> )
##
DomainOps.Parent := function( L )

    local D, # parent of first domain, result
          H; # loop over 'L'

    # Det the parent of the first domain.
    if IsBound( L[1].parent ) then
      D:= L[1].parent;
    else
      D:= L[1];
    fi;

    # Check that all other domains have the same parent.
    for H in L do
      if   IsBound( H.parent ) and H.parent <> D then
        Error( "<D> and <H> must have the same parent domain" );
      elif not IsBound( H.parent ) and H <> D  then
        Error( "<D> and <H> must have the same parent domain" );
      fi;
    od;

    # Return the parent.
    return D;
    end;

#############################################################################
##
#F  CartesianProduct( <D>,... ) . . . . . . . .  cartesian product of domains
##
CartesianProduct := function ( arg )
    local   i;
    
    # unravel the arguments
    if Length(arg) = 1  and IsList( arg[1] )  then
        arg := ShallowCopy( arg[1] );
    fi;

    # make all domains into sets
    for i  in [1..Length(arg)]  do
        arg[i] := Elements( arg[i] );
    od;

    # make the cartesian product
    return Cartesian( arg );
end;


#############################################################################
##
#F  Difference( <D>, <E> )  . . . . . . . . . . . . difference of two domains
##
Difference := function ( E, F )
    local   D;
    if IsList( E )  then
        if IsList( F )  then
            D := Set( E );
            SubtractSet( D, F );
        elif IsDomain( F )  then
            D := F.operations.Difference( Set( E ), F );
        else
            Error("<E> must be a domain or a set");
        fi;
    elif IsDomain( E )  then
        if IsList( F )  then
            D := E.operations.Difference( E, Set( F ) );
        elif IsDomain( F )  then
            D := E.operations.Difference( E, F );
        else
            Error("<E> must be a domain or a set");
        fi;
    else
        Error("<F> must be a domain or a set");
    fi;
    return D;
end;

DomainOps.Difference := function ( E, F )
    local   D, elm;
    if IsSet( E )  then
        if IsDomain( F )  and IsFinite( F )  then
            D := ShallowCopy( E );
            SubtractSet( D, Elements( F ) );
        elif IsDomain( F )  then
            D := [];
            for elm  in E  do
                if not elm  in F  then
                    AddSet( D, elm );
                fi;
            od;
        else
            Error("panic, neither <E> nor <F> is a domain");
        fi;
    elif IsDomain( E )  and IsFinite( E )  then
        if IsSet( F )  then
            D := ShallowCopy( Elements( E ) );
            SubtractSet( D, F );
        elif IsDomain( F )  and IsFinite( F )  then
            D := ShallowCopy( Elements( E ) );
            SubtractSet( D, Elements( F ) );
        elif IsDomain( F )  then
            D := [];
            for elm  in Elements( E )  do
                if not elm  in F  then
                    AddSet( D, elm );
                fi;
            od;
        else
            Error("<F> must be a domain or a set");
        fi;
    elif IsDomain( E )  then
        if IsDomain( F )  or IsSet( F )  then
            Error("sorry, cannot subtract from the infinite domain <E>");
        else
            Error("<F> must be a domain or a set");
        fi;
    else
        Error("<E> must be a domain or a set");
    fi;
    return D;
end;


#############################################################################
##
#F  DomainOps.Representative( <D> ) . . . . . . .  representative of a domain
##
##  'Representative' returns a representative of the domain <D>.
##
DomainOps.Representative := function ( D )
    if IsBound( D.representative )  then
        return D.representative;
    else
        Error("sorry, cannot select a representative of the domain <D>");
    fi;
end;


#############################################################################
##
#F  Random( <D> ) . . . . . . . . . . . . . . . .  random element of a domain
#F  DomainOps.Random( <D> ) . . . . . . . . . . .  random element of a domain
##
##  'Random( <D> )'
##
##  'Random' returns a random element  from <D>, which  must be a domain or a
##  list.
##
##  'DomainOps.Random' is the default function to compute random elements  of
##  a domain.  It is called from 'Random( <D> )' if <D> is a domain.
##
Random := function ( D )
    local   rand;
    if IsList( D )  then
        rand := RandomList( D );
    elif IsDomain( D )  then
        rand := D.operations.Random( D );
    else
        Error("<D> must be a domain or a list");
    fi;
    return rand;
end;

DomainOps.Random := function ( D )
    if IsFinite( D )  then
        return RandomList( Elements( D ) );
    else
        Error("sorry, cannot find random elms in the infinite domain <D>");
    fi;
end;


#############################################################################
##
#F  DomainOps.Print(<D>)  . . . . . . . . . . . . . . . . . .  print a domain
##
DomainOps.Print := function ( D )
    if IsBound( D.name )  then
        Print( D.name );
    else
        PrintRec( ShallowCopy(D) );
    fi;
end;


#############################################################################
##
#F  DefineName(<D>,<str>) . . . . . . . . . . . .  define a name for a domain
##
DefineName := function ( arg )
    local   D;

    D := arg[ 1 ];
    if not IsRec( D )  then
        Error("<D> must be a record");
    fi;
    if Length( arg ) = 2  then
        if IsBound( D.name )  and D.name <> arg[2]  then
          Print("#W  changing name from ",D.name," to ",arg[2]," for <D>\n");
        fi;
        D.name := arg[ 2 ];
    else
        if IsBound( D.name )  then
          Print("#W  removing name ",D.name," for <D>\n");
        fi;
        Unbind( D.name );
    fi;

end;

