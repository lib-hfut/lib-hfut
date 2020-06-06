#############################################################################
##
#A  operatio.g                  GAP library                  Martin Schoenert
##
#A  @(#)$Id: operatio.g,v 3.29.1.1 1995/11/23 14:33:30 mschoene Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains those  functions  that  deal  with  group  operations.
#T nur f"ur Gruppen?
##
#H  $Log: operatio.g,v $
#H  Revision 3.29.1.1  1995/11/23  14:33:30  mschoene
#H  fixed a bug in 'Cycles' and 'CycleLengths' (found by Jean Michel)
#H
#H  Revision 3.29  1994/04/21  11:57:50  sam
#H  improved 'OnLines',
#H  generalized 'IsPrimitive',
#H  fixed 'operation' component
#H
#H  Revision 3.28  1994/02/02  10:23:26  sam
#H  components 'operationSomething' replaced by 'operation.something'
#H
#H  Revision 3.27  1993/02/09  14:38:21  martin
#H  changed 'Position' to 'PositionSorted' in 'Operation' etc.
#H
#H  Revision 3.26  1993/01/26  14:51:11  martin
#H  fixed a typo in 'GroupElementsOps.CycleLenght'
#H
#H  Revision 3.25  1992/10/13  16:02:44  martin
#H  added '<G>.operationImages'
#H
#H  Revision 3.24  1992/06/27  08:07:03  martin
#H  moved 'OnTuples', 'OnSets', etc. into the kernel
#H
#H  Revision 3.23  1992/06/03  16:29:42  martin
#H  added 'MaximalBlocks'
#H
#H  Revision 3.22  1992/05/04  19:02:18  martin
#H  fixed 'OperationHomomorphism' from incorrect dispatching
#H
#H  Revision 3.21  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.20  1992/03/11  15:30:04  martin
#H  fixed a very minor bug in 'IsFixpoint'
#H
#H  Revision 3.19  1992/03/10  11:36:16  martin
#H  added 'IsRegular' and 'IsSemiRegular'
#H
#H  Revision 3.18  1992/02/10  15:14:35  martin
#H  added the domain 'Mappings'
#H
#H  Revision 3.17  1992/01/31  14:30:15  martin
#H  added 'IsEquivalentOperation'
#H
#H  Revision 3.16  1992/01/27  14:00:23  martin
#H  improved 'OperationHomomorphismOps.Kernel'
#H
#H  Revision 3.15  1992/01/24  14:48:16  martin
#H  renamed 'Representative' to 'RepresentativeOperation'
#H
#H  Revision 3.14  1992/01/07  15:37:54  martin
#H  added 'DegreeOperation'
#H
#H  Revision 3.13  1991/12/18  14:38:38  martin
#H  fixed a minor bug in 'OperationHomomorphism'
#H
#H  Revision 3.12  1991/12/12  11:14:45  martin
#H  added 'Transitivity'
#H
#H  Revision 3.11  1991/12/12  09:19:59  martin
#H  changed 'ONPOINTS' to 'OnPoints', etc
#H
#H  Revision 3.10  1991/12/06  16:41:51  martin
#H  added 'OperationHomomorphism'
#H
#H  Revision 3.9  1991/12/06  15:37:09  martin
#H  changed 'Cycle' to default to 'GroupElementsOps.Cycle' etc.
#H
#H  Revision 3.8  1991/12/06  13:43:11  martin
#H  changed 'Permutation' and 'Operation' to use 'SortParallel'
#H
#H  Revision 3.7  1991/11/21  13:29:39  martin
#H  fixed a minor bug in 'GroupOps.IsPrimitive'
#H
#H  Revision 3.6  1991/11/08  14:12:33  martin
#H  changed 'GroupDomain' to 'Domain'
#H
#H  Revision 3.5  1991/10/08  10:59:56  martin
#H  fixed 'Stabilizer' from incorrect 'Closure' call
#H
#H  Revision 3.4  1991/09/28  12:15:55  martin
#H  fixed some minor problems
#H
#H  Revision 3.3  1991/09/27  13:31:52  martin
#H  changed to use 'GroupOps' and to call ops functions always with operation
#H
#H  Revision 3.2  1991/09/27  10:44:49  martin
#H  'Representative' now may return 'false'
#H
#H  Revision 3.1  1991/09/27  10:37:36  martin
#H  changed 'Stabilizer' to use 'Subgroup' and 'Closure'
#H
#H  Revision 3.0  1991/08/08  15:31:51  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  InfoOperation?(...) . . .  information function for the operation package
##
if not IsBound(InfoOperation1)  then InfoOperation1 := Ignore;  fi;
if not IsBound(InfoOperation2)  then InfoOperation2 := Ignore;  fi;


#############################################################################
##
#F  OnRightCosets( <set>, <g> ) . operation of group elements on right cosets
#F  OnLeftCosets( <set>, <g> )  .  operation of group elements on left cosets
##
OnRightCosets := function ( set, g )
    local   img,  e;
    img := [];
    for e  in set  do
        AddSet( img, e * g );
    od;
    return img;
end;

OnLeftCosets := function ( set, g )
    local   img,  e;
    img := [];
    for e  in set  do
        AddSet( img, g * e );
    od;
    return img;
end;


#############################################################################
##
#F  OnLines( <line>, <g> )  operation of group elements on subspaces of dim 1
#F  OnSubspaces( <space>, <g> ) . .  operation of group elements on subspaces
##
#N  10-Mar-92 martin still to add 'OnSubspaces'
##
OnLines := function( vec, g )
    local c;
    vec:= vec * g;
    c:= DepthVector( vec );
    if c <= Length( vec ) then
      vec:= vec / vec[c];
    fi;
    return vec;
    end;

#############################################################################
##
#F  Cycle( <g>, <d> ) . . . . . . . .  orbit of a point under a group element
##
Cycle := function ( arg )
    local   cyc,  D;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        D := Domain( [ arg[1] ] );
        cyc := D.operations.Cycle( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        D := Domain( [ arg[1] ] );
        cyc := D.operations.Cycle( arg[1], arg[2], arg[3] );
    else
        Error("usage: Cycle( <g>, <d> [, <operation>]");
    fi;

    # return the cycle <cyc>
    return cyc;
end;

GroupElementsOps.Cycle := function ( g, d, opr )
    local   cyc,        # cycle, result
            img;        # image running through the cycle

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  Cycle |<d>^<g>|=\c");
        cyc := [ d ];
        img := d ^ g;
        while img <> d  do
            Add( cyc, img );
            img := img ^ g;
        od;
        InfoOperation1("\r#I  Cycle |<d>^<g>|=",Length(cyc),"\n");

    # special case for operation on pairs
    elif opr = OnPairs  then
        InfoOperation1("#I  Cycle |<pair>^<g>|=\c");
        cyc := [ d ];
        img := [ d[1]^g, d[2]^g ];
        while img <> d  do
            Add( cyc, img );
            img := [ img[1]^g, img[2]^g ];
        od;
        InfoOperation1("\r#I  Cycle |<pair>^<g>|=",Length(cyc),"\n");

    # other operation
    else
        InfoOperation1("#I  Cycle |opr(<d>,<g>)|=\c");
        cyc := [ d ];
        img := opr( d, g );
        while img <> d  do
            Add( cyc, img );
            img := opr( img, g );
        od;
        InfoOperation1("#I  Cycle |opr(<d>,<g>)|=",Length(cyc),"\n");

    fi;

    # return the cycle <cyc>
    return cyc;
end;


#############################################################################
##
#F  CycleLength( <g>, <d> ) . length of the orbit of a point under an element
##
CycleLength := function ( arg )
    local   len,  D;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        D := Domain( [ arg[1] ] );
        len := D.operations.CycleLength( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        D := Domain( [ arg[1] ] );
        len := D.operations.CycleLength( arg[1], arg[2], arg[3] );
    else
        Error("usage: CycleLength( <g>, <d> [, <operation>]");
    fi;

    # return the length <len>
    return len;
end;

GroupElementsOps.CycleLength := function ( g, d, opr )
    local   len,        # cycle length, result
            d1,         # point in a tuple
            len1,       # cycle length of a point in a tuple
            img;        # image running through the cycle

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  CycleLength |<d>^<g>|=\c");
        len := 1;
        img := d ^ g;
        while img <> d  do
            len := len + 1;
            img := img ^ g;
        od;
        InfoOperation1("\r#I  CycleLength |<d>^<g>|=",len,"\n");

    # special case for operation on pairs and tuples
    elif opr = OnPairs  or opr = OnTuples then
        InfoOperation1("#I  CycleLength |<pair>^<g>|=\c");
        len := 1;
        for d1  in d  do
            len1 := 1;
            img := d1 ^ g;
            while img <> d1  do
                len1 := len1 + 1;
                img := img ^ g;
            od;
            len := LcmInt( len, len1 );
        od;
        InfoOperation1("\r#I  CycleLength |<pair>^<g>|=",len,"\n");

    # other operation
    else
        InfoOperation1("#I  CycleLength |opr(<d>,<g>)|=\c");
        len := 1;
        img := opr( d, g );
        while img <> d  do
            len := len + 1;
            img := opr( img, g );
        od;
        InfoOperation1("#I  CycleLength |opr(<d>,<g>)|=",len,"\n");

    fi;

    # return the cycle length <len>
    return len;
end;


#############################################################################
##
#F  Cycles( <g>, <D> )  . . . . . . . . . cycles of a domain under an element
##
Cycles := function ( arg )
    local   cycs,  D;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        D := Domain( [ arg[1] ] );
        cycs := D.operations.Cycles( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        D := Domain( [ arg[1] ] );
        cycs := D.operations.Cycles( arg[1], arg[2], arg[3] );
    else
        Error("usage: Cycles( <g>, <d> [, <operation>]");
    fi;

    # return the cycles <cycs>
    return cycs;
end;

GroupElementsOps.Cycles := function ( g, D, opr )
    local   cycs,       # cycles, result
            cyc,        # cycle
            img;        # image running through the cycle

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  Cycles |cycs|=\c");
        D := Set( D );
        cycs := [];
        while D <> []  do
            cyc := [ D[1] ];
            img := D[1] ^ g;
            while img <> D[1]  do
                Add( cyc, img );
                img := img ^ g;
            od;
            Add( cycs, cyc );
            SubtractSet( D, cyc );
            InfoOperation2("\r#I  Cycles |cycs|=",Length(cycs),"\c");
        od;
        InfoOperation2("\r#I  Cycles |cycs|=",Length(cycs),"\n");

    # special case for operation on pairs
    elif opr = OnPairs  then
        InfoOperation1("#I  Cycles |cycs|=\c");
        D := Set( D );
        cycs := [];
        while D <> []  do
            cyc := [ D[1] ];
            img := [ D[1][1]^g, D[1][2]^g ];
            while img <> D[1]  do
                Add( cyc, img );
                img := [ img[1]^g, img[2]^g ];
            od;
            Add( cycs, cyc );
            SubtractSet( D, cyc );
            InfoOperation2("\r#I  Cycles |cycs|=",Length(cycs),"\c");
        od;
        InfoOperation2("\r#I  Cycles |cycs|=",Length(cycs),"\n");

    # other operation
    else
        InfoOperation1("#I  Cycles |cycs|=\c");
        D := Set( D );
        cycs := [];
        while D <> []  do
            cyc := [ D[1] ];
            img := opr( D[1], g );
            while img <> D[1]  do
                Add( cyc, img );
                img := opr( img, g );
            od;
            Add( cycs, cyc );
            SubtractSet( D, cyc );
            InfoOperation2("\r#I  Cycles |cycs|=",Length(cycs),"\c");
        od;
        InfoOperation2("\r#I  Cycles |cycs|=",Length(cycs),"\n");

    fi;

    # return the cycles <cycs>
    return cycs;
end;


#############################################################################
##
#F  CycleLengths( <g>, <D> )  . . . . . . lengths of the cycles of an element
##
CycleLengths := function ( arg )
    local   lens,  D;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        D := Domain( [ arg[1] ] );
        lens := D.operations.CycleLengths( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        D := Domain( [ arg[1] ] );
        lens := D.operations.CycleLengths( arg[1], arg[2], arg[3] );
    else
        Error("usage: CycleLengths( <g>, <d> [, <operation>]");
    fi;

    # return the lengths <lens>
    return lens;
end;

GroupElementsOps.CycleLengths := function ( g, D, opr )
    local   lens,       # cycle lengths, result
            cyc,        # cycle
            img;        # image running through the cycle

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  CycleLengths |cycs|=\c");
        D := Set( D );
        lens := [];
        while D <> []  do
            cyc := [ D[1] ];
            img := D[1] ^ g;
            while img <> D[1]  do
                Add( cyc, img );
                img := img ^ g;
            od;
            Add( lens, Length( cyc ) );
            SubtractSet( D, cyc );
            InfoOperation2("\r#I  CycleLengths |lens|=",
                           Length(lens),"\c");
        od;
        InfoOperation2("\r#I  CycleLengths |lens|=",
                       Length(lens),"\n");

    # special case for operation on pairs
    elif opr = OnPairs  then
        InfoOperation1("#I  CycleLengths |lens|=\c");
        D := Set( D );
        lens := [];
        while D <> []  do
            cyc := [ D[1] ];
            img := [ D[1][1]^g, D[1][2]^g ];
            while img <> D[1]  do
                Add( cyc, img );
                img := [ img[1]^g, img[2]^g ];
            od;
            Add( lens, Length( cyc ) );
            SubtractSet( D, cyc );
            InfoOperation2("\r#I  CycleLengths |lens|=",
                           Length(lens),"\c");
        od;
        InfoOperation2("\r#I  CycleLengths |lens|=",
                       Length(lens),"\n");

    # other operation
    else
        InfoOperation1("#I  CycleLengths |lens|=\c");
        D := Set( D );
        lens := [];
        while D <> []  do
            cyc := [ D[1] ];
            img := opr( D[1], g );
            while img <> D[1]  do
                Add( cyc, img );
                img := opr( img, g );
            od;
            Add( lens, Length( cyc ) );
            SubtractSet( D, cyc );
            InfoOperation2("\r#I  CycleLengths |lens|=",
                           Length(lens),"\c");
        od;
        InfoOperation2("\r#I  CycleLengths |lens|=",
                       Length(lens),"\n");

    fi;

    # return the cycle lengths <lens>
    return lens;
end;


#############################################################################
##
#F  Permutation( <g>, <D> ) . . .  permutation of a group element on a domain
##
Permutation := function ( arg )
    local   prm,  D;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        D := Domain( [ arg[1] ] );
        prm := D.operations.Permutation( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        D := Domain( [ arg[1] ] );
        prm := D.operations.Permutation( arg[1], arg[2], arg[3] );
    else
        Error("usage: Permutation( <g>, <d> [, <operation>]");
    fi;

    # return the permutation <prm>
    return prm;
end;

GroupElementsOps.Permutation := function ( g, D, opr )
    local   prm,        # permutation, result
            set,        # domain <D> as set for faster Position
            pos,        # Position(<D>,<x>) = <pos>[ Position(<set>,<x>) ]
            i;          # loop variable

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  Permutation(<g>,<D>)              \c");

        # make a sorted copy <set> of the domain <D> and remember <pos>
        InfoOperation2("\r#I  Permutation(<g>,<D>) sorting <D>\c");
        set := ShallowCopy(D);
        pos := [1..Length(D)];
        SortParallel( set, pos );

        # check the domain <D> and give a hint that <set> is a set
        if not IsSet( set )  then
            Error("<D> must not contain an element twice");
        fi;

        # make the permutation <prm>
        InfoOperation2("\r#I  Permutation(<g>,<D>) make perm \c");
        prm := [];
        for i  in [1..Length(D)]  do
            prm[i] := pos[ PositionSorted( set, D[i]^g ) ];
        od;
        prm := PermList( prm );
        InfoOperation1("\r#I  Permutation(<g>,<D>) returns   \n");

    # special case for operation on pairs
    elif opr = OnPairs  then
        InfoOperation1("#I  Permutation(<g>,<D>)              \c");

        # make a sorted copy <set> of the domain <D> and remember <pos>
        InfoOperation2("\r#I  Permutation(<g>,<D>) sorting <D>\c");
        set := ShallowCopy(D);
        pos := [1..Length(D)];
        SortParallel( set, pos );

        # check the domain <D> and give a hint that <set> is a set
        if not IsSet( set )  then
            Error("<D> must not contain an element twice");
        fi;

        # make the permutation <prm>
        InfoOperation2("\r#I  Permutation(<g>,<D>) make perm \c");
        prm := [];
        for i  in [1..Length(D)]  do
            prm[i] := pos[ PositionSorted( set, [ D[i][1]^g, D[i][2]^g ] ) ];
        od;
        prm := PermList( prm );
        InfoOperation1("\r#I  Permutation(<g>,<D>) returns   \n");

    # other operation
    else
        InfoOperation1("#I  Permutation(<g>,<D>)              \c");

        # make a sorted copy <set> of the domain <D> and remember <pos>
        InfoOperation2("\r#I  Permutation(<g>,<D>) sorting <D>\c");
        set := ShallowCopy(D);
        pos := [1..Length(D)];
        SortParallel( set, pos );

        # check the domain <D> and give a hint that <set> is a set
        if not IsSet( set )  then
            Error("<D> must not contain an element twice");
        fi;

        # make the permutation <prm>
        InfoOperation2("\r#I  Permutation(<g>,<D>) make perm \c");
        prm := [];
        for i  in [1..Length(D)]  do
            prm[i] := pos[ PositionSorted( set, opr( D[i], g ) ) ];
        od;
        prm := PermList( prm );
        InfoOperation1("\r#I  Permutation(<g>,<D>) returns   \n");

    fi;

    # return the permutation <prm>
    return prm;
end;


#############################################################################
##
#F  IsFixpoint( <G>, <d> )  . . test if a group operates trivially on a point
##
IsFixpoint := function ( arg )
    local   G,          # group, first argument or alternatively
            g,          # group element, first argument
            d,          # point, second argument
            opr,        # operation, optional third argument
            isFix;      # is the point <d> a fixpoint, result

    # standard operation of a group element
    if Length(arg) = 2  and not IsGroup(arg[1])  then
        g := arg[1];  d := arg[2];
        isFix := (d^g = d);

    # special case for operation on pairs of a group element
    elif Length(arg) = 3  and arg[3] = OnPairs  and not IsGroup(arg[1])  then
        g := arg[1];  d := arg[2];
        isFix := (d[1]^g = d[1] and d[2]^g = d[2]);

    # other operation of a group element
    elif Length(arg) = 3  and not IsGroup(arg[1])  then
        g := arg[1];  d := arg[2];
        opr := arg[3];
        isFix := (opr(d,g) = d);

    # standard operation of a group
    elif Length(arg) = 2  then
        G := arg[1];  d := arg[2];
        isFix := true;
        for g  in G.generators  do
            isFix := isFix and (d^g = d);
        od;

    # special case for operation on pairs of a group
    elif Length(arg) = 3  and arg[3] = OnPairs  then
        G := arg[1];  d := arg[2];
        isFix := true;
        for g  in G.generators  do
            isFix := isFix and (d[1]^g = d[1] and d[2]^g = d[2]);
        od;

    # other operation of a group
    elif Length(arg) = 3  then
        G := arg[1];  d := Set( arg[2] );
        opr := arg[3];
        isFix := true;
        for g  in G.generators  do
            isFix := isFix and (opr(d,g) = d);
        od;

    else
        Error("usage: IsFixpoint( <G>, <d> [, <operation>] )");
    fi;

    # return the result
    return isFix;
end;


#############################################################################
##
#F  IsFixpointFree( <G>, <D> )  . . .  test if a group operates fixpoint free
##
IsFixpointFree := function ( arg )
    local   isFree, D;

    # special case for group element
    if not IsGroup(arg[1])  then
        if Length(arg) = 2  then
            D := Domain( [ arg[1] ] );
            isFree := D.operations.IsFixpointFree(arg[1],arg[2],OnPoints);
        elif Length(arg) = 3  then
            D := Domain( [ arg[1] ] );
            isFree := D.operations.IsFixpointFree(arg[1],arg[2],arg[3]);
        else
            Error("usage: IsFixpointFree( <g>, <D> [, <operation>] )");
        fi;

    # for a group use the operations function
    else
        if Length(arg) = 2  then
            isFree:=arg[1].operations.IsFixpointFree(arg[1],arg[2],OnPoints);
        elif Length(arg) = 3  then
            isFree:=arg[1].operations.IsFixpointFree(arg[1],arg[2],arg[3]);
        else
            Error("usage: IsFixpointFree( <G>, <d> [, <operation>]");
        fi;

    fi;

    # return the result
    return isFree;
end;

GroupElementsOps.IsFixpointFree := function ( g, D, opr )
    local   isFree,     # has the domain <D> no fixpoint, result
            pnt;        # point of the domain <D>

    # standard operation
    if   opr = OnPoints  then
        isFree := true;
        for pnt  in D  do
            isFree := isFree and (pnt^g <> pnt);
        od;

    # special case for the operation on pairs
    elif opr = OnPairs  then
        isFree := true;
        for pnt  in D  do
            isFree := isFree and (pnt[1]^g <> pnt[1] or pnt[2]^g <> pnt[2]);
        od;

    # other operation
    else
        isFree := true;
        for pnt  in D  do
            isFree := isFree and (opr(pnt,g) <> pnt);
        od;

    fi;

    # return the result
    return isFree;
end;

GroupOps.IsFixpointFree := function ( G, D, opr )
    local   isFree,     # has the domain <D> no fixpoint, result
            gen,        # generator of the group <G>
            pnt;        # point of the domain <D>

    # standard operation
    if   opr = OnPoints  then
        isFree := true;
        for pnt  in D  do
            if isFree  then
                isFree := false;
                for gen  in G.generators  do
                    isFree := isFree or (pnt^gen <> pnt);
                od;
            fi;
        od;

    # special case for operation on pairs of a group
    elif opr = OnPairs  then
        isFree := true;
        for pnt  in D  do
            if isFree  then
                isFree := false;
                for gen  in G.generators  do
                    isFree := isFree
                           or (pnt[1]^gen <> pnt[1] or pnt[2]^gen <> pnt[2]);
                od;
            fi;
        od;

    # other operation of a group
    else
        isFree := true;
        for pnt  in D  do
            if isFree  then
                isFree := false;
                for gen  in G.generators  do
                    isFree := isFree or (opr(pnt,gen) <> pnt);
                od;
            fi;
        od;

    fi;

    # return the result
    return isFree;
end;


#############################################################################
##
#F  DegreeOperation( <G>, <D> ) . . . . . . . . . . .  degree of an operation
##
DegreeOperation := function ( arg )
    local   deg;        # degree of <G> on <D>, result

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        deg := arg[1].operations.DegreeOperation(arg[1],arg[2],OnPoints);
    elif Length(arg) = 3  then
        deg := arg[1].operations.DegreeOperation(arg[1],arg[2],arg[3]);
    else
        Error("usage: DegreeOperation( <G>, <D> [, <operation>]");
    fi;

    # return the degree
    return deg;
end;

GroupOps.DegreeOperation := function ( G, D, opr )
    local   deg,        # degree of <G> on <D>, result
            gen,        # generator of the group <G>
            pnt,        # point of the domain <D>
            isFree;     # 'true' if <pnt> is moved by at least one <gen>

    # standard operation
    if   opr = OnPoints  then
        deg := 0;
        for pnt  in D  do
            isFree := false;
            for gen  in G.generators  do
                isFree := isFree or (pnt^gen <> pnt);
            od;
            if isFree  then
                deg := deg + 1;
            fi;
        od;

    # special case for operation on pairs of a group
    elif opr = OnPairs  then
        deg := 0;
        for pnt  in D  do
            isFree := false;
            for gen  in G.generators  do
                isFree := isFree
                       or (pnt[1]^gen <> pnt[1] or pnt[2]^gen <> pnt[2]);
            od;
            if isFree  then
                deg := deg + 1;
            fi;
        od;

    # other operation of a group
    else
        deg := 0;
        for pnt  in D  do
            isFree := false;
            for gen  in G.generators  do
                isFree := isFree or (opr(pnt,gen) <> pnt);
            od;
            if isFree  then
                deg := deg + 1;
            fi;
        od;

    fi;

    # return the degree
    return deg;
end;


#############################################################################
##
#F  IsTransitive( <G>, <D> )  test if a group operates transitive on a domain
##
IsTransitive := function ( arg )
    local   isTrans;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        isTrans := arg[1].operations.IsTransitive(arg[1],arg[2],OnPoints);
    elif Length(arg) = 3  then
        isTrans := arg[1].operations.IsTransitive(arg[1],arg[2],arg[3]);
    else
        Error("usage: IsTransitive( <G>, <D> [, <operation>]");
    fi;

    # return the result
    return isTrans;
end;

GroupOps.IsTransitive := function ( G, D, opr )
    local   isTrans;

    # test whether the domain is a subset of a single orbit
    if D = []  then
        isTrans := true;
    else
        isTrans := IsSubsetSet( G.operations.Orbit( G, D[1], opr ), D );
    fi;

    # return the result
    return isTrans;
end;


#############################################################################
##
#F  Transitivity( <G>, <D> )  . . . . . . . . .  transitivity of an operation
##
Transitivity := function ( arg )
    local   trans;      # transitivity of <G> on <D>, result

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        trans := arg[1].operations.Transitivity(arg[1],arg[2],OnPoints);
    elif Length(arg) = 3  then
        trans := arg[1].operations.Transitivity(arg[1],arg[2],arg[3]);
    else
        Error("usage: Transitivity( <G>, <D> [, <operation>]");
    fi;

    # return the transitivity
    return trans;
end;

GroupOps.Transitivity := function ( G, D, opr )
    if D = []  or not G.operations.IsTransitive( G, D, opr )  then
        return 0;
    else
        return 1 + Transitivity( Stabilizer( G, D[1], opr ),
                                 Difference( D, [ D[1] ] ),
                                 opr );
    fi;
end;


#############################################################################
##
#F  IsRegular( <G>, <D> ) . . . . . . . . .  test if a group operates regular
##
IsRegular := function ( arg )
    local   isReg, D;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        isReg := arg[1].operations.IsRegular( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        isReg := arg[1].operations.IsRegular( arg[1], arg[2], arg[3] );
    else
        Error("usage: IsRegular( <G>, <d> [, <operation>]");
    fi;

    # return the result
    return isReg;
end;

GroupOps.IsRegular := function ( G, D, opr )
    return     IsTransitive(  G, D, opr )
           and IsSemiRegular( G, D, opr );
end;


#############################################################################
##
#F  IsSemiRegular( <G>, <D> )  . . . . . test if a group operates semiregular
##
IsSemiRegular := function ( arg )
    local   isReg, D;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        isReg := arg[1].operations.IsSemiRegular( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        isReg := arg[1].operations.IsSemiRegular( arg[1], arg[2], arg[3] );
    else
        Error("usage: IsSemiRegular( <G>, <d> [, <operation>]");
    fi;

    # return the result
    return isReg;
end;

GroupOps.IsSemiRegular := function ( G, D, opr )
    return IsSemiRegular( Operation(G,D,opr), [1..Length(D)] );
end;


#############################################################################
##
#F  Orbit( <G>, <d> ) . . . . . . . . . . . .  orbit of a point under a group
##
Orbit := function ( arg )
    local   orb;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        orb := arg[1].operations.Orbit( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        orb := arg[1].operations.Orbit( arg[1], arg[2], arg[3] );
    else
        Error("usage: Orbit( <G>, <d> [, <operation>]");
    fi;

    # return the orbit <orb>
    return orb;
end;

GroupOps.Orbit := function ( G, d, opr )
    local   orb,        # orbit, result
            set,        # orbit <orb> as set for faster membership test
            gen,        # generator of the group <G>
            pnt,        # point in the orbit <orb>
            img;        # image of the point <pnt> under the generator <gen>

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  Orbit |<d>^<G>|=\c");
        orb := [ d ];
        set := [ d ];
        for pnt  in orb  do
            for gen  in G.generators  do
                img := pnt ^ gen;
                if not img in set  then
                    Add( orb, img );
                    AddSet( set, img );
                fi;
            od;
        od;
        InfoOperation1("\r#I  Orbit |<d>^<G>|=",Length(orb),"\n");

    # special case for operation on pairs
    elif opr = OnPairs  then
        InfoOperation1("#I  Orbit |<pair>^<G>|=\c");
        orb := [ d ];
        set := [ d ];
        for pnt  in orb  do
            for gen  in G.generators  do
                img := [ pnt[1]^gen, pnt[2]^gen ];
                if not img in set  then
                    Add( orb, img );
                    AddSet( set, img );
                fi;
            od;
        od;
        InfoOperation1("\r#I  Orbit |<pair>^<G>|=",Length(orb),"\n");

    # other operation
    else
        InfoOperation1("#I  Orbit |opr(<d>,<G>)|=\c");
        orb := [ d ];
        set := [ d ];
        for pnt  in orb  do
            for gen  in G.generators  do
                img := opr( pnt, gen );
                if not img in set  then
                    Add( orb, img );
                    AddSet( set, img );
                fi;
            od;
        od;
        InfoOperation1("\r#I  Orbit |opr(<d>,<G>)|=",Length(orb),"\n");

    fi;

    # return the orbit <orb>
    return orb;
end;


#############################################################################
##
#F  OrbitLength( <G>, <d> ) . .  length of the orbit of a point under a group
##
OrbitLength := function ( arg )
    local   len;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        len := arg[1].operations.OrbitLength( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        len := arg[1].operations.OrbitLength( arg[1], arg[2], arg[3] );
    else
        Error("usage: OrbitLength( <G>, <d> [, <operation>]");
    fi;

    # return the length <len>
    return len;
end;

GroupOps.OrbitLength := function ( G, d, opr )
    local   len;

    # compute the length
    len := Length( G.operations.Orbit( G, d, opr ) );

    # return the length <len>
    return len;
end;


#############################################################################
##
#F  Orbits( <G>, <D> )  . . . . . . . . . .  orbits of a domain under a group
##
Orbits := function ( arg )
    local   orbs;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        orbs := arg[1].operations.Orbits( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        orbs := arg[1].operations.Orbits( arg[1], arg[2], arg[3] );
    else
        Error("usage: Orbits( <G>, <D> [, <operation>]");
    fi;

    # return the orbits <orbs>
    return orbs;
end;

GroupOps.Orbits := function ( G, D, opr )
    local   orbs,       # orbits, result
            orb,        # orbit
            set,        # orbit <orb> as set for faster membership test
            gen,        # generator of the group <G>
            pnt,        # point in the orbit <orb>
            img;        # image of the point <pnt> under the generator <gen>

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  Orbits |orbs|=\c");
        D := Set( D );
        orbs := [];
        while D <> []  do
            orb := [ D[1] ];
            set := [ D[1] ];
            for pnt  in orb  do
                for gen  in G.generators  do
                    img := pnt ^ gen;
                    if not img in set  then
                        Add( orb, img );
                        AddSet( set, img );
                    fi;
                od;
            od;
            Add( orbs, orb );
            SubtractSet( D, orb );
            InfoOperation2("\r#I  Orbits |orbs|=",Length(orbs),"\c");
        od;
        InfoOperation1("\r#I  Orbits |orbs|=",Length(orbs),"\n");

    # special case for operation on pairs
    elif opr = OnPairs  then
        InfoOperation1("#I  Orbits |orbs|=\c");
        D := Set( D );
        orbs := [];
        while D <> []  do
            orb := [ D[1] ];
            set := [ D[1] ];
            for pnt  in orb  do
                for gen  in G.generators  do
                    img := [ pnt[1]^gen, pnt[2]^gen ];
                    if not img in set  then
                        Add( orb, img );
                        AddSet( set, img );
                    fi;
                od;
            od;
            Add( orbs, orb );
            SubtractSet( D, orb );
            InfoOperation2("\r#I  Orbits |orbs|=",Length(orbs),"\c");
        od;
        InfoOperation1("\r#I  Orbits |orbs|=",Length(orbs),"\n");

    # other operation
    else
        InfoOperation1("#I  Orbits |orbs|=\c");
        D := Set( D );
        orbs := [];
        while D <> []  do
            orb := [ D[1] ];
            set := [ D[1] ];
            for pnt  in orb  do
                for gen  in G.generators  do
                    img := opr( pnt, gen );
                    if not img in set  then
                        Add( orb, img );
                        AddSet( set, img );
                    fi;
                od;
            od;
            Add( orbs, orb );
            SubtractSet( D, orb );
            InfoOperation2("\r#I  Orbits |orbs|=",Length(orbs),"\c");
        od;
        InfoOperation1("\r#I  Orbits |orbs|=",Length(orbs),"\n");

    fi;

    # return the orbits <orbs>
    return orbs;
end;


#############################################################################
##
#F  OrbitLengths( <G>, <D> )  . . . . . . .  lengths of the orbits of a group
##
OrbitLengths := function ( arg )
    local   lens;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        lens := arg[1].operations.OrbitLengths( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        lens := arg[1].operations.OrbitLengths( arg[1], arg[2], arg[3] );
    else
        Error("usage: OrbitLengths( <G>, <D> [, <operation>]");
    fi;

    # return the orbit lengths <lens>
    return lens;
end;

GroupOps.OrbitLengths := function ( G, D, opr )
    local   lens,       # orbit lengths, result
            orb,        # orbit
            set,        # orbit <orb> as set for faster membership test
            gen,        # generator of the group <G>
            pnt,        # point in the orbit <orb>
            img;        # image of the point <pnt> under the generator <gen>

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  OrbitLengths |orbs|=\c");
        D := Set( D );
        lens := [];
        while D <> []  do
            orb := [ D[1] ];
            set := [ D[1] ];
            for pnt  in orb  do
                for gen  in G.generators  do
                    img := pnt ^ gen;
                    if not img in set  then
                        Add( orb, img );
                        AddSet( set, img );
                    fi;
                od;
            od;
            Add( lens, Length(orb) );
            SubtractSet( D, orb );
            InfoOperation2("\r#I  OrbitLengths |orbs|=",
                           Length(lens),"\c");
        od;
        InfoOperation1("\r#I  OrbitLengths |orbs|=",
                       Length(lens),"\n");

    # special case for operation on pairs
    elif opr = OnPairs  then
        InfoOperation1("#I  OrbitLengths |orbs|=\c");
        D := Set( D );
        lens := [];
        while D <> []  do
            orb := [ D[1] ];
            set := [ D[1] ];
            for pnt  in orb  do
                for gen  in G.generators  do
                    img := [ pnt[1]^gen, pnt[2]^gen ];
                    if not img in set  then
                        Add( orb, img );
                        AddSet( set, img );
                    fi;
                od;
            od;
            Add( lens, Length(orb) );
            SubtractSet( D, orb );
            InfoOperation2("\r#I  OrbitLengths |orbs|=",
                           Length(lens),"\c");
        od;
        InfoOperation1("\r#I  OrbitLengths |orbs|=",
                       Length(lens),"\n");

    # other operation
    else
        InfoOperation1("#I  OrbitLengths |orbs|=\c");
        D := Set( D );
        lens := [];
        while D <> []  do
            orb := [ D[1] ];
            set := [ D[1] ];
            for pnt  in orb  do
                for gen  in G.generators  do
                    img := opr( pnt, gen );
                    if not img in set  then
                        Add( orb, img );
                        AddSet( set, img );
                    fi;
                od;
            od;
            Add( lens, Length(orb) );
            SubtractSet( D, orb );
            InfoOperation2("\r#I  OrbitLengths |orbs|=",
                           Length(lens),"\c");
        od;
        InfoOperation1("\r#I  OrbitLengths |orbs|=",
                       Length(lens),"\n");

    fi;

    # return the orbit lengths <lens>
    return lens;
end;


#############################################################################
##
#F  Operation( <G>, <D> ) . . . . . . . . .  operation of a group on a domain
##
Operation := function ( arg )
    local   grp;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        grp := arg[1].operations.Operation( arg[1], arg[2], OnPoints );
        if not IsBound( grp.operation ) then
          grp.operation:= rec();
        fi;
        grp.operation.structure := arg[1];
        grp.operation.domain    := arg[2];
        grp.operation.operation := OnPoints;
    elif Length(arg) = 3  then
        grp := arg[1].operations.Operation( arg[1], arg[2], arg[3] );
        if not IsBound( grp.operation ) then
          grp.operation:= rec();
        fi;
        grp.operation.structure := arg[1];
        grp.operation.domain    := arg[2];
        grp.operation.operation := arg[3];
    else
        Error("usage: Operation( <G>, <D> [, <operation>]");
    fi;

    # return the operation group <grp>
    return grp;
end;

GroupOps.Operation := function ( G, D, opr )
    local   grp,        # operation group, result
            prms,       # generators of the operation group <grp>
            prm,        # generator of the operation group <grp>
            gen,        # generator of the group <G>
            set,        # domain <D> as set for faster Position
            pos,        # Position(<D>,<x>) = <pos>[ Position(<set>,<x>) ]
            i;          # loop variable

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  Operation(<G>,<D>)              \c");

        # make a sorted copy <set> of the domain <D> and remember <pos>
        InfoOperation2("\r#I  Operation(<G>,<D>) sorting <D>\c");
        set := ShallowCopy(D);
        pos := [1..Length(D)];
        SortParallel( set, pos );

        # check the domain <D> and give a hint that <set> is a set
        if not IsSet( set )  then
            Error("<D> must not contain an element twice");
        fi;

        # make the permutations <prms> and the operation group <grp>
        prms := [];
        for gen  in G.generators  do
            InfoOperation2("\r#I  Operation(<G>,<D>) make perm ",
                           Position( G.generators, gen ), "\c");
            prm := [];
            for i  in [1..Length(D)]  do
                prm[i] := pos[ PositionSorted( set, D[i]^gen ) ];
            od;
            Add( prms, PermList( prm ) );
        od;
        grp := Group( prms, () );
        grp.operation := rec( genimages := prms );
        InfoOperation1("\r#I  Operation(<G>,<D>) returns       \n");

    # special case for operation on pairs
    elif opr = OnPairs  then
        InfoOperation1("#I  Operation(<G>,<D>)              \c");

        # make a sorted copy <set> of the domain <D> and remember <pos>
        InfoOperation2("\r#I  Operation(<G>,<D>) sorting <D>\c");
        set := ShallowCopy(D);
        pos := [1..Length(D)];
        SortParallel( set, pos );

        # check the domain <D> and give a hint that <set> is a set
        if not IsSet( set )  then
            Error("<D> must not contain an element twice");
        fi;

        # make the permutations <prms> and the operation group <grp>
        prms := [];
        for gen  in G.generators  do
            InfoOperation2("\r#I  Operation(<G>,<D>) make perm ",
                           Position( G.generators, gen ), "\c");
            prm := [];
            for i  in [1..Length(D)]  do
                prm[i] := pos[PositionSorted(set,[D[i][1]^gen,D[i][2]^gen])];
            od;
            Add( prms, PermList( prm ) );
        od;
        grp := Group( prms, () );
        grp.operation := rec( genimages := prms );
        InfoOperation1("\r#I  Operation(<G>,<D>) returns       \n");

    # other operation
    else
        InfoOperation1("#I  Operation(<G>,<D>)              \c");

        # make a sorted copy <set> of the domain <D> and remember <pos>
        InfoOperation2("\r#I  Operation(<G>,<D>) sorting <D>\c");
        set := ShallowCopy(D);
        pos := [1..Length(D)];
        SortParallel( set, pos );

        # check the domain <D> and give a hint that <set> is a set
        if not IsSet( set )  then
            Error("<D> must not contain an element twice");
        fi;

        # make the permutations <prms> and the operation group <grp>
        prms := [];
        for gen  in G.generators  do
            InfoOperation2("\r#I  Operation(<G>,<D>) make perm ",
                           Position( G.generators, gen ), "\c");
            prm := [];
            for i  in [1..Length(D)]  do
                prm[i] := pos[ PositionSorted( set, opr( D[i], gen ) ) ];
            od;
            Add( prms, PermList( prm ) );
        od;
        grp := Group( prms, () );
        grp.operation := rec( genimages := prms );
        InfoOperation1("\r#I  Operation(<G>,<D>) returns       \n");

    fi;

    # return the permutation group <grp>
    return grp;
end;


#############################################################################
##
#F  OperationHomomorphism(<G>,<P>)  . . . . . homomorphism of a group into an
#F                                              operation group of this group
##
OperationHomomorphism := function ( G, P )
    local   hom;        # homomorphism from <G> to <P>, result

    # check the arguments
    if not IsRec( P )  or not IsBound( P.operation.structure )  then
#T besserer Name 'P.operation.source'?
        Error("<P> must be an operation structure");
    fi;
    if not IsRec( G )  or not IsSubset( P.operation.structure, G )  then
        Error( "<G> must be contained in the source of the operation" );
    fi;

    # make the operation homomorphism
    if G = P.operation.structure  then
        if not IsBound( P.operationHomomorphism )  then
            P.operationHomomorphism :=
                G.operations.OperationHomomorphism( G, P );
        fi;
        hom := P.operationHomomorphism;
    else
        hom := G.operations.OperationHomomorphism( G, P );
    fi;

    # return the homomorphism
    return hom;
end;

GroupOps.OperationHomomorphism := function ( G, P )
    local   hom;        # operation homomorphism of <G> into <P>, result

    # make the homomorphism
    hom := rec( );
    hom.isGeneralMapping := true;
    hom.domain          := Mappings;

    # enter the identifying stuff
    hom.source          := G;
    hom.range           := P;

    # enter information
    hom.isMapping       := true;
    hom.isHomomorphism  := true;
    hom.preImage        := G;
    if G = P.operation.structure  then
        hom.image       := P;
    fi;

    # enter the operations record
    hom.operations      := OperationHomomorphismOps;

    # return the homomorphism
    return hom;
end;

OperationHomomorphismOps := Copy( GroupHomomorphismOps );

OperationHomomorphismOps.ImageElm := function ( hom, elm )
    return Permutation( elm,
                        hom.range.operation.domain,
                        hom.range.operation.operation );
end;

OperationHomomorphismOps.ImagesElm := function ( hom, elm )
    return [ Permutation( elm,
                          hom.range.operation.domain,
                          hom.range.operation.operation ) ];
end;

OperationHomomorphismOps.ImagesRepresentative := function ( hom, elm )
    return Permutation( elm,
                        hom.range.operation.domain,
                        hom.range.operation.operation );
end;

OperationHomomorphismOps.PreImagesRepresentative := function ( hom, elm )
    local   rep,                # representative, result
            S,                  # stabilizer of '<hom>.source'
            rep2,               # representative in <S>
            i;                  # loop variable

    # delegate easy cases to the source
    if hom.range.operation.operation = OnPoints  then
        rep := RepresentativeOperation(
                               hom.source,
                               hom.range.operation.domain,
                               Permuted( hom.range.operation.domain, elm^-1 ),
                               OnTuples );

    # handle other operations because 'Representative' would not be able to
    # recognize special cases after composing the operation with 'OnTuples'
    else
        rep := hom.source.identity;
        S   := hom.source;
        i   := 1;
        while i <= Length(hom.range.operation.domain)  and rep <> false  do
            rep2 := RepresentativeOperation(
                                   S,
                                   hom.range.operation.domain[i],
                                   hom.range.operation.operation(
                                       hom.range.operation.domain[i^elm],
                                       rep^-1 ),
                                   hom.range.operation.operation );
            if rep2 <> false  then
                rep := rep2 * rep;
                S   := Stabilizer( S,
                                   hom.range.operation.domain[i],
                                   hom.range.operation.operation );
            else
                rep := false;
            fi;
            i := i + 1;
        od;
    fi;

    # return the representative
    return rep;
end;

OperationHomomorphismOps.KernelGroupHomomorphism := function ( hom )
    if hom.range.operation.operation = OnPoints  then
        return Intersection(
                    List( Orbits( hom.source,
                                  hom.range.operation.domain,
                                  OnPoints ),
                          orb -> Stabilizer( hom.source,
                                             orb,
                                             OnTuples )
                    )
               );
    else
        return Intersection(
                    List( Orbits( hom.source,
                                  hom.range.operation.domain,
                                  hom.range.operation.operation ),
                          orb -> Core( hom.source,
                                       Stabilizer( hom.source,
                                             orb[1],
                                             hom.range.operation.operation ) )
                    )
               );
    fi;
end;

OperationHomomorphismOps.Print := function ( hom )
    Print( "OperationHomomorphism( ", hom.source, ", ", hom.range, " )" );
end;


#############################################################################
##
#F  Blocks(<G>,<D>[,<seed>][,<operation>])  .  blocks of operation of a group
##
Blocks := function ( arg )
    local   blks;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        blks := arg[1].operations.Blocks( arg[1], arg[2], [], OnPoints );
    elif Length(arg) = 3  and IsList(arg[3])  then
        blks := arg[1].operations.Blocks( arg[1], arg[2], arg[3], OnPoints );
    elif Length(arg) = 3  and IsFunc(arg[3])  then
        blks := arg[1].operations.Blocks( arg[1], arg[2], [], arg[3] );
    elif Length(arg) = 4  then
        blks := arg[1].operations.Blocks( arg[1], arg[2], arg[3], arg[4] );
    else
        Error("usage: Blocks( <G>, <D> [, <seed>] [, <operation>]");
    fi;

    # return the blocks <blks>
    return blks;
end;

GroupOps.Blocks := function ( G, D, seed, opr )
    local   G2,         # group <G> operating on [1..Length(<D>)]
            D2,         # domain <D> as [1..Length(<D>)]
            seed2,      # seed <seed> as subset of <D2>
            blks,       # blocks, result
            blk,        # one block
            blks2,      # blocks when operationg on [1..Length(<D>)]
            blk2,       # one block when operating on [1..Length(<D>)]
            i;          # loop variable

    # convert domain to [1..Length(<D>)], group and seed correspondingly
    InfoOperation1("#I  BlocksGroup called\n");
    if not IsPermGroup(G) or not ForAll( D, IsInt ) or opr <> OnPoints  then
        G2 := G.operations.Operation( G, D, opr );
        D2 := [1..Length(D)];
        seed2 := List( seed, s -> Position( D, s ) );
    else
        G2 := G;
        D2 := D;
        seed2 := seed;
    fi;

    # compute the blocks
    blks2 := G2.operations.Blocks( G2, D2, seed2, OnPoints );

    # convert the blocks of [1..Length(<D>)] back into blocks of <D>
    if D <> D2  then
        blks := [];
        for blk2 in blks2  do
            blk := [];
            for i  in blk2  do
                AddSet( blk, D[i] );
            od;
            AddSet( blks, blk );
        od;
    else
        blks := blks2;
    fi;

    # return the blocks <blks>
    InfoOperation1("#I  BlocksGroup |<blocks>|=",Length(blks),"\n");
    return blks;
end;


#############################################################################
##
#F  MaximalBlocks(<G>,<D>[,<seed>][,<operation>]) . . . . . maximal blocks of
#F                                                       operation of a group
##
MaximalBlocks := function ( arg )
    local   blks;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        blks := arg[1].operations.MaximalBlocks(arg[1],arg[2],[],OnPoints);
    elif Length(arg) = 3  and IsList(arg[3])  then
        blks := arg[1].operations.MaximalBlocks(arg[1],arg[2],arg[3],
                                                OnPoints);
    elif Length(arg) = 3  and IsFunc(arg[3])  then
        blks := arg[1].operations.MaximalBlocks(arg[1],arg[2],[],arg[3]);
    elif Length(arg) = 4  then
        blks := arg[1].operations.MaximalBlocks(arg[1],arg[2],arg[3],arg[4]);
    else
        Error("usage: MaximalBlocks( <G>, <D> [, <seed>] [, <operation>]");
    fi;

    # return the blocks <blks>
    return blks;
end;

GroupOps.MaximalBlocks := function ( G, D, seed, opr )
    local   G2,         # group <G> operating on [1..Length(<D>)]
            D2,         # domain <D> as [1..Length(<D>)]
            seed2,      # seed <seed> as subset of <D2>
            blks,       # blocks, result
            blk,        # one block
            blks2,      # blocks when operationg on [1..Length(<D>)]
            blk2,       # one block when operating on [1..Length(<D>)]
            i;          # loop variable

    # convert domain to [1..Length(<D>)], group and seed correspondingly
    InfoOperation1("#I  MaximalBlocksGroup called\n");
    if not IsPermGroup(G) or not ForAll( D, IsInt ) or opr <> OnPoints  then
        G2 := G.operations.Operation( G, D, opr );
        D2 := [1..Length(D)];
        seed2 := List( seed, s -> Position( D, s ) );
    else
        G2 := G;
        D2 := D;
        seed2 := seed;
    fi;

    # compute the blocks
    blks2 := G2.operations.MaximalBlocks( G2, D2, seed2, OnPoints );

    # convert the blocks of [1..Length(<D>)] back into blocks of <D>
    if D <> D2  then
        blks := [];
        for blk2 in blks2  do
            blk := [];
            for i  in blk2  do
                AddSet( blk, D[i] );
            od;
            AddSet( blks, blk );
        od;
    else
        blks := blks2;
    fi;

    # return the blocks <blks>
    InfoOperation1("#I  MaximalBlocksGroup |<blocks>|=",Length(blks),"\n");
    return blks;
end;


#############################################################################
##
#F  IsPrimitive( <G>, <D> ) .  test if a group operates primitive on a domain
##
#T or if an object (record) is primitive ...
##
IsPrimitive := function ( arg )
    local   isPrim;

    # dispatch to the appropriate function
    if   Length( arg ) = 1 then
      if not IsBound( arg[1].isPrimitive ) then
        arg[1].isPrimitive:= arg[1].operations.IsPrimitive( arg[1] );
      fi;
      isPrim:= arg[1].isPrimitive;
    elif Length(arg) = 2  then
        isPrim := arg[1].operations.IsPrimitive( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        isPrim := arg[1].operations.IsPrimitive( arg[1], arg[2], arg[3] );
    else
        Error("usage: IsPrimitive( <G>, <D> [, <operation>]");
    fi;

    # return the result
    return isPrim;
end;

GroupOps.IsPrimitive := function ( G, D, opr )
    local   isPrim;

    isPrim := G.operations.IsTransitive( G, D, opr )
          and Length( G.operations.Blocks( G, D, [], opr ) ) = 1;

    # return the result
    return isPrim;
end;


#############################################################################
##
#F  Stabilizer( <G>, <d> )  . . . . . . . stabilizer of a point under a group
##
Stabilizer := function ( arg )
    local   stb;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        stb := arg[1].operations.Stabilizer( arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        stb := arg[1].operations.Stabilizer( arg[1], arg[2], arg[3] );
    else
        Error("usage: Stabilizer( <G>, <D> [, <operation>]");
    fi;

    # return the stabilizer <stb>
    return stb;
end;

GroupOps.Stabilizer := function ( G, d, opr )
    local   stb,        # stabilizer, result
            orb,        # orbit
            rep,        # representatives for the points in the orbit <orb>
            set,        # orbit <orb> as set for faster membership test
            gen,        # generator of the group <G>
            pnt,        # point in the orbit <orb>
            img,        # image of the point <pnt> under the generator <gen>
            sch;        # schreier generator of the stabilizer

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  Stabilizer |<gens>|=0\c");
        orb := [ d ];
        set := [ d ];
        rep := [ G.identity ];
        stb := Subgroup( Parent( G ), [] );
        for pnt  in orb  do
            for gen  in G.generators  do
                img := pnt ^ gen;
                if not img in set  then
                    Add( orb, img );
                    AddSet( set, img );
                    Add( rep, rep[Position(orb,pnt)]*gen );
                else
                    sch := rep[Position(orb,pnt)]*gen
                           / rep[Position(orb,img)];
                    if not sch in stb  then
                        stb := Closure( stb, sch );
                        InfoOperation2("\r#I  Stabilizer |<gens>|=",
                                       Length(stb.generators), "\c" );
                    fi;
                fi;
            od;
        od;
        InfoOperation1("\r#I  Stabilizer |<gens>|=",
                       Length(stb.generators),"\n");

    # compute iterated stabilizers for the operation on pairs or on tuples
    elif opr = OnPairs  or opr = OnTuples  then
        InfoOperation1("#I  Stabilizer |<fixed points>|=0\n");
        stb := G;
        for pnt in d  do
            stb := stb.operations.Stabilizer( stb, pnt, OnPoints );
            InfoOperation2("#I  Stabilizer |<fixed points>|=",
                           Position( d, pnt ), "\n" );
        od;
        InfoOperation1("#I  Stabilizer |<fixed points>|=",
                       Length(d),"\n");

    # other operation
    else
        InfoOperation1("#I  Stabilizer |<gens>|=0\c");
        orb := [ d ];
        set := [ d ];
        rep := [ G.identity ];
        stb := Subgroup( Parent(G), [] );
        for pnt  in orb  do
            for gen  in G.generators  do
                img := opr( pnt, gen );
                if not img in set  then
                    Add( orb, img );
                    AddSet( set, img );
                    Add( rep, rep[Position(orb,pnt)]*gen );
                else
                    sch := rep[Position(orb,pnt)]*gen
                           / rep[Position(orb,img)];
                    if not sch in stb  then
                        stb := Closure( stb, sch );
                        InfoOperation2("\r#I  Stabilizer |<gens>|=",
                                       Length(stb.generators), "\c" );
                    fi;
                fi;
            od;
        od;
        InfoOperation1("\r#I  Stabilizer |<gens>|=",
                       Length(stb.generators),"\n");

    fi;

    # return the stabilizer <stb>
    return stb;
end;


#############################################################################
##
#F  RepresentativeOperation(<G>,<d>,<e>)  . . . . . representative of a point
##
RepresentativeOperation := function ( arg )
    local   rep;

    # dispatch to the appropriate function
    if Length(arg) = 3  then
        rep := arg[1].operations.RepresentativeOperation(
                                          arg[1], arg[2], arg[3], OnPoints );
    elif Length(arg) = 4  then
        rep := arg[1].operations.RepresentativeOperation(
                                          arg[1], arg[2], arg[3], arg[4] );
    else
      Error("usage: RepresentativeOperation( <G>, <d>, <e> [, <operation>]");
    fi;

    # return the representative <rep>
    return rep;
end;

GroupOps.RepresentativeOperation := function ( G, d, e, opr )
    local   rep,        # representative, result
            orb,        # orbit
            set,        # orbit <orb> as set for faster membership test
            gen,        # generator of the group <G>
            pnt,        # point in the orbit <orb>
            img,        # image of the point <pnt> under the generator <gen>
            by,         # <by>[<pnt>] is a gen taking <frm>[<pnt>] to <pnt>
            frm;        # where <frm>[<pnt>] lies earlier in <orb> than <pnt>

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  RepresentativeOperation |<d>^<G>|=\c");
        if d = e  then return G.identity;  fi;
        orb := [ d ];
        set := [ d ];
        by  := [ G.identity ];
        frm := [ 1 ];
        for pnt  in orb  do
            for gen  in G.generators  do
                img := pnt ^ gen;
                if img = e  then
                    rep := gen;
                    while pnt <> d  do
                        rep := by[ Position(orb,pnt) ] * rep;
                        pnt := frm[ Position(orb,pnt) ];
                    od;
                    InfoOperation1("\r#I  RepresentativeOperation returns ",
                                   rep, "\n" );
                    return rep;
                elif not img in set  then
                    Add( orb, img );
                    AddSet( set, img );
                    Add( frm, pnt );
                    Add( by,  gen );
                fi;
            od;
        od;
        InfoOperation1("\r#I  RepresentativeOperation returns 'false'\n");
        return false;

    # special case for operation on pairs
    elif opr = OnPairs  then
        InfoOperation1("#I  RepresentativeOperation |<pair>^<G>|=\c");
        if d = e  then return G.identity;  fi;
        orb := [ d ];
        set := [ d ];
        by  := [ G.identity ];
        frm := [ 1 ];
        for pnt  in orb  do
            for gen  in G.generators  do
                img := [ pnt[1]^gen, pnt[2]^gen ];
                if img = e  then
                    rep := gen;
                    while pnt <> d  do
                        rep := by[ Position(orb,pnt) ] * rep;
                        pnt := frm[ Position(orb,pnt) ];
                    od;
                    InfoOperation1("\r#I  RepresentativeOperation returns ",
                                   rep, "\n" );
                    return rep;
                elif not img in set  then
                    Add( orb, img );
                    AddSet( set, img );
                    Add( frm, pnt );
                    Add( by,  gen );
                fi;
            od;
        od;
        InfoOperation1("\r#I  RepresentativeOperation returns 'false'\n");
        return false;

    # other operation
    else
        InfoOperation1("#I  RepresentativeOperation |opr(<d>,<G>)|=\c");
        if d = e  then return G.identity;  fi;
        orb := [ d ];
        set := [ d ];
        by  := [ G.identity ];
        frm := [ 1 ];
        for pnt  in orb  do
            for gen  in G.generators  do
                img := opr( pnt, gen );
                if img = e  then
                    rep := gen;
                    while pnt <> d  do
                        rep := by[ Position(orb,pnt) ] * rep;
                        pnt := frm[ Position(orb,pnt) ];
                    od;
                    InfoOperation1("\r#I  RepresentativeOperation returns ",
                                   rep, "\n" );
                    return rep;
                elif not img in set  then
                    Add( orb, img );
                    AddSet( set, img );
                    Add( frm, pnt );
                    Add( by,  gen );
                fi;
            od;
        od;
        InfoOperation1("\r#I  RepresentativeOperation returns 'false'\n");
        return false;

    fi;

end;


#############################################################################
##
#F  RepresentativesOperation( <G>, <d> )  . . . . representatives of an orbit
##
RepresentativesOperation := function ( arg )
    local   reps;

    # dispatch to the appropriate function
    if Length(arg) = 2  then
        reps := arg[1].operations.RepresentativesOperation(
                                                  arg[1], arg[2], OnPoints );
    elif Length(arg) = 3  then
        reps := arg[1].operations.RepresentativesOperation(
                                                  arg[1], arg[2], arg[3] );
    else
        Error("usage: RepresentativesOperation( <G>, <d> [, <operation>]");
    fi;

    # return the representatives <reps>
    return reps;
end;

GroupOps.RepresentativesOperation := function ( G, d, opr )
    local   reps,       # representatives for the points in the orbit, result
            orb,        # orbit
            set,        # orbit <orb> as set for faster membership test
            gen,        # generator of the group <G>
            pnt,        # point in the orbit <orb>
            img;        # image of the point <pnt> under the generator <gen>

    # standard operation
    if   opr = OnPoints  then
        InfoOperation1("#I  RepresentativesOperation |<orb>|=\c");
        orb := [ d ];
        set := [ d ];
        reps := [ G.identity ];
        for pnt  in orb  do
            for gen  in G.generators  do
                img := pnt ^ gen;
                if not img in set  then
                    Add( orb, img );
                    AddSet( set, img );
                    Add( reps, reps[Position(orb,pnt)]*gen );
                fi;
            od;
        od;
        InfoOperation1("\r#I  RepresentativesOperation |<orb>|=",
                       Length(orb),"\n");

    # other operation
    else
        InfoOperation1("#I  RepresentativesOperation |<orb>|=0\c");
        orb := [ d ];
        set := [ d ];
        reps := [ G.identity ];
        for pnt  in orb  do
            for gen  in G.generators  do
                img := opr( pnt, gen );
                if not img in set  then
                    Add( orb, img );
                    AddSet( set, img );
                    Add( reps, reps[Position(orb,pnt)]*gen );
                fi;
            od;
        od;
        InfoOperation1("\r#I  RepresentativesOperation |<orb>|=",
                       Length(orb),"\n");

    fi;

    # return the representatives <reps>
    return reps;
end;


#############################################################################
##
#F  IsEqualOperation(<G>,<D>,<oprG>,<H>,<E>,<oprH>)  . test if two operations
#F                                                  of a group are equivalent
##
IsEquivalentOperation := function ( arg )
    local   isEqv;      # is the operation equivalent, result

    # dispatch to the appropriate function
    if Length(arg) = 4  then
        isEqv := arg[1].operations.IsEquivalentOperation(
                        arg[1], arg[2], OnPoints,
                        arg[3], arg[4], OnPoints );
    elif Length( arg ) = 5  and IsGroup( arg[3] )  then
        isEqv := arg[1].operations.IsEquivalentOperation(
                        arg[1], arg[2], OnPoints,
                        arg[3], arg[4], arg[5] );
    elif Length( arg ) = 5  then
        isEqv := arg[1].operations.IsEquivalentOperation(
                        arg[1], arg[2], arg[3],
                        arg[4], arg[5], OnPoints );
    elif Length( arg ) = 6  then
        isEqv := arg[1].operations.IsEquivalentOperation(
                        arg[1], arg[2], arg[3],
                        arg[4], arg[5], arg[6] );
    else
        Error("usage: IsEquivalentOperation(<G>,<D>[,<operationG>],",
                                           "<H>,<E>[,<operationH>])");
    fi;

    # return the result
    return isEqv;

end;

GroupOps.IsEquivalentOperation := function ( G, D, oprG, H, E, oprH )
    local   isEqv,      # is the operation equivalent, result
            orbsG,      # orbits of <G>
            orbsH,      # orbits of <H>
            i,  k;      # loop variables

    # easy case first
    if DegreeOperation( G, D, oprG ) <> DegreeOperation( H, E, oprH )  then
        return false;
    fi;

    # compute the orbits
    orbsG := ShallowCopy( G.operations.Orbits( G, D, oprG ) );
    orbsH := ShallowCopy( H.operations.Orbits( H, E, oprH ) );

    # another simple test
    if Collected(List(orbsG,Length)) <> Collected(List(orbsH,Length))  then
        return false;
    fi;

    # loop over the orbits of <G>
    isEqv := true;
    i := 1;
    while i <= Length( orbsG )  and isEqv  do

        # try to match an orbit of <H>
        k := 1;
        while k <= Length( orbsH )
          and not GroupOps.IsEqvOprTrans(G,orbsG[i],oprG,H,orbsH[k],oprH)  do
            k := k + 1;
        od;

        # the matched orbit is no longer available in the future
        if k <= Length( orbsH )  then
            orbsH[k] := [];
        else
            isEqv := false;
        fi;

        i := i + 1;
    od;

    # return the result
    return isEqv;
end;

GroupOps.IsEqvOprTrans := function ( G, orbG, oprG, H, orbH, oprH )
    local   i;          # loop variable

    # easy case first
    if Length( orbG ) <> Length( orbH )  then
        return false;
    fi;

    # try all possible mappings
    for i  in [ 1 .. Length( orbH ) ]  do
        if GroupOps.IsEqvOprOrbit( G, orbG[1], oprG, H, orbH[i], oprH )  then
            return true;
        fi;
    od;

    # no possibility to map <orbG> onto <orbH>
    return false;
end;

GroupOps.IsEqvOprOrbit := function ( G, iniG, oprG, H, iniH, oprH )
    local    orbG,      # orbit of <iniG> under <G>
             orbH,      # orbit of <iniH> under <H>
             pntG,      # one point of <orbG>
             pntH,      # one point of <orbH>
             i,  k;     # loop variables

    # special case for standard operations
    if oprG = OnPoints  and oprH = OnPoints  then

        # make a parallel orbit algorithm
        orbG := [ iniG ];
        orbH := [ iniH ];
        i := 1;
        while i <= Length( orbG )  do
            for k  in [ 1 .. Length( G.generators ) ]  do
                pntG := orbG[ i ] ^ G.generators[ k ];
                pntH := orbH[ i ] ^ H.generators[ k ];
                if not pntG in orbG  then
                    if pntH in orbH  then
                        return false;
                    fi;
                    Add( orbG, pntG );
                    Add( orbH, pntH );
                else
                    if orbH[ Position( orbG, pntG ) ] <> pntH  then
                        return false;
                    fi;
                fi;
            od;
            i := i + 1;
        od;

    # general case
    else

        # make a parallel orbit algorithm
        orbG := [ iniG ];
        orbH := [ iniH ];
        i := 1;
        while i <= Length( orbG )  do
            for k  in [ 1 .. Length( G.generators ) ]  do
                pntG := oprG( orbG[ i ], G.generators[ k ] );
                pntH := oprH( orbH[ i ], H.generators[ k ] );
                if not pntG in orbG  then
                    if pntH in orbH  then
                        return false;
                    fi;
                    Add( orbG, pntG );
                    Add( orbH, pntH );
                else
                    if orbH[ Position( orbG, pntG ) ] <> pntH  then
                        return false;
                    fi;
                fi;
            od;
            i := i + 1;
        od;

    fi;

    # orbit computation complete, the orbits can be mapped
    return true;
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



