#############################################################################
##
#A  rowmodul.g                  GAP library                    J\"urgen Mnich
##
#A  @(#)$Id: rowmodul.g,v 3.6.1.2 1995/04/25 14:55:53 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains all functions for row modules.
##
#H  $Log: rowmodul.g,v $
#H  Revision 3.6.1.2  1995/04/25  14:55:53  sam
#H  got rid of 'FullRowSpace', 'SpaceGenerators', and 'Space'
#H
#H  Revision 3.6.1.1  1994/11/28  08:55:24  sam
#H  The file is superfluous now, but (other) row modules will be introduced
#H  soon.
#H
#H  Revision 3.6  1994/05/19  13:15:33  sam
#H  moved 'Submodule' to 'module.g'
#H
#H  Revision 3.5  1994/02/02  10:31:29  sam
#H  added 'RowModuleOps.Dimension'
#H
#H  Revision 3.4  1992/04/07  16:15:32  jmnich
#H  adapted to changes in the finite field module
#H
#H  Revision 3.3  1992/03/17  12:31:20  jmnich
#H  minor style changes, more bug fixes
#H
#H  Revision 3.2  1992/02/29  13:25:11  jmnich
#H  general library review, some bug fixes
#H
#H  Revision 3.1  1992/02/12  15:37:22  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  InfoModule1(...)  . . . . . . . . . . . . . . . . . . package information
#F  InfoModule2(...)  . . . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoModule1 )  then  InfoModule1 := Ignore;  fi;
if not IsBound( InfoModule2 )  then  InfoModule2 := Ignore;  fi;


#############################################################################
##
#V  RowModuleOps  . . . . . . . . . . . . . operations record for row modules
##
RowModuleOps := OperationsRecord( "RowModuleOps", DomainOps );

#############################################################################
##
#F  RowModuleOps.Print( <obj> ) . . . . . . . . . . . . .  print a row module
##
RowModuleOps.Print := function( M )
    if IsBound( M.name ) then
        Print( M.name );
    else
        Print( "RowModule( ", M.ring, ", ", M.abelianGroup, " )" );
    fi;
end;


#############################################################################
##
#F  RowModule( <matgroup> ) . . . . . . . . . . . . . . . create a row module
#F  RowModule( <ring>, <rowspace> ) . . . . . . . . . . . create a row module
#F  RowModule( <ring>, <dimension>, <field> ) . . . . . . create a row module
##
RowModule := function( arg )
    local   ring, rspace;

    if Length( arg ) = 1 then
        ring   := arg[1];
        rspace := ring.field ^ ring.dimension;
    elif Length( arg ) = 2 then
        ring   := arg[1];
        rspace := arg[2];
    elif Length( arg ) = 3 then
        ring   := arg[1];
        rspace := arg[3] ^ arg[2];
    else
        Error(  "usage: RowModule( <matgroup> )\n",
                "usage: RowModule( <ring>, <rowspace> )\n",
                "   or: RowModule( <ring>, <dimension>, <field> )" );
    fi;

    return rec(
        abelianGroup := rspace,
        ring         := ring,
        isRowModule  := true,
        isModule     := true,
        isDomain     := true,
        isFinite     := IsFinite( rspace ),
        operations   := RowModuleOps
    );
end;


#############################################################################
##
#F  IsRowModule( <obj> )  . . . . . . . . . test if an object is a row module
##
IsRowModule := function( obj )
    return IsRec( obj )
        and IsBound( obj.isRowModule ) and obj.isRowModule;
end;


#############################################################################
##
#F  RowModuleOps.Base( <rowmodule> )  . . . . . . . . . . . . . . . . . . . .
#F  . . . . . . . . . determines a standard form for the base of a row module
##
##  This  function determines a standard form for the base of a row module as
##  proposed by R.A.  Parker for a meataxe program.
##  This  base  has  properties  that enables meataxe programs to decide, for
##  example,  whether  two  given  cyclic modules are isomorphic or not.  See
##  'EquivalenceTest' for details on this special example.
##
##  returns
##
##      <base>
##
RowModuleOps.Base := function( module )
    local   base, sbase, insub, wgts, dim, len, v, w, wc, z, m, i, j;


    if Length( module.abelianGroup.generators ) = 0 then
      return [];
    fi;

    # base will hold the normalized, sorted base and sbase will hold
    # the unnormalized, chronological (Parker-) base

    len   := Length( Zero( module.abelianGroup ) );
    base  := [];
    sbase := [];
    insub := BlistList( [1..len], [] );

    ## first insert the module generators themselves

    for w in module.abelianGroup.generators do
        wc := ShallowCopy( w );
        i  := 1;
        while i <= len do
            if w[i] <> module.abelianGroup.field.zero then
                if insub[i] then
                    w := w - w[i] * base[i];
                else
                    w := w[i] ^ -1 * w;
                    Add( sbase, wc );
                    insub[i] := true;
                    base[i]  := w;
                    i        := len;
                fi;
            fi;
            i := i + 1;
        od;
    od;


    ## next handle the generator-images under ring operation

    for v in sbase do
        for m in module.ring.generators do
            w  := v * m;
            wc := ShallowCopy( w );
            i  := 1;
            while i <= len do
                if w[i] <> module.abelianGroup.field.zero then
                    if insub[i] then
                        w := w - w[i] * base[i];
                    else
                        w := w[i] ^ -1 * w;
                        Add( sbase, wc );
                        insub[i] := true;
                        base[i]  := w;
                        i        := len;
                    fi;
                fi;
                i := i + 1;
            od;
        od;
    od;

    # see whether the base should be normalized or not
#T kann weg (wird nirgendwo mehr gebraucht)

    if not IsBound( module.isNormalizedBase ) or module.isNormalizedBase then

        # collect the base and remember the elements' weights

        sbase := [];
        wgts  := [];
        dim   := 0;
        for i in [1..len] do
            if insub[i] then
                Add( sbase, base[i] );
                dim := dim + 1;
                wgts[dim] := i;
            fi;
        od;

        # now finally normalize the found base

        for i in [2..dim] do
            for j in [1..i-1] do
                z := sbase[j][wgts[i]];
                if z <> module.abelianGroup.field.zero then
                    sbase[j] := sbase[j] - z * sbase[i];
                fi;
            od;
        od;
    fi;

    return sbase;
end;


#############################################################################
##
#F  RowModuleOps.Dimension( <rowmodule> )
##
RowModuleOps.Dimension := function( rowmodule )
    return Length( Base( rowmodule ) );
    end;


#############################################################################
##
#F  RowModuleOps.Submodule( <rowmodule>, <rowspace> ) . . . . . . . . . . . .
#F  . . . . . . . . . . . . . . . . . . . . . submodule induced by <rowspace>
##
RowModuleOps.Submodule := function( module, vs )
    module := RowModule( module.ring, vs );
    module := RowModule( module.ring,
                         RowSpace( vs.field, Base( module ), Zero( vs ) ) );
    return module;
end;

#############################################################################
##
#F  RowModuleOps.Representation( <rowmodule>[, <submodule>] ) . . . . . . . .
#F  . . . . . . . . . . . . . . . . . representation afforded by a row module
##
RowModuleOps.Representation := function( arg )
    local   ring, vs, base, mats, id, hom, r, b, m;


    if Length( arg ) = 1 then
        ring := arg[1].ring;
        vs   := arg[1].abelianGroup;
    elif Length( arg ) = 2 then
        ring := arg[1].ring;
        vs   := arg[1].abelianGroup mod arg[2].abelianGroup;
    fi;

#     # if the base of the row space is the standardbase there is nothing to do
# 
#     if Information( vs ).isStandardBase then
#         hom := GroupHomomorphismByImages( ring, ring, ring.generators, ring.generators );
#         hom.base := Base( vs );
#         return hom;
#     fi;


    # calculate the matrices of the representation

    base := Base( vs );
    mats := [];
    for r in ring.generators do
        m := [];
        for b in base do
            Add( m, Coefficients( vs, b * r ) );
        od;
        Add( mats, m );
    od;


    # the representation is the homomorphism of the module's ring
    # into the matrix group

    if mats = [] then
        id  := IdentityMat( Length( base ), vs.field );
        hom := GroupHomomorphismByImages( ring,
                             MatGroup( mats, vs.field, id ),
                             ring.generators, mats );
    else
        hom := GroupHomomorphismByImages( ring,
                             MatGroup( mats, vs.field ),
                             ring.generators, mats );
    fi;

    hom.base := base;
    hom.range.images := mats;

    return hom;
end;


#############################################################################
##
#F  Representation( <domain>[, <subdomain>] ) . . . . . . . . . . . . . . . .
##
Representation := function( arg )
    local   rep;

    if IsDomain( arg[1] ) and IsBound( arg[1].operations.Representation ) then
        if Length( arg ) = 1 then
            rep := arg[1].operations.Representation( arg[1] );
        elif Length( arg ) = 2 then
            rep := arg[1].operations.Representation( arg[1], arg[2] );
        else
            Error( "usage: Representation( <domain>[, <subdomain>] )" );
        fi;
    else
        Error( "sorry, can't representation for <domain>" );
    fi;
    return rep;
end;


#############################################################################
##
#F  RowModuleOps.CompositionFactors( <rowmodule> )  . . . . . . . . . . . . .
#F  . . . . . . . . . . . . . . . . . . . composition factors of a row module
##
RowModuleOps.CompositionFactors := function( module )
    local   rep, comp;

    rep  := Representation( module );
    comp := CompositionFactors( rep.range );

    Apply( comp.bases, x -> x * rep.base );

    return comp;
end;


#############################################################################
##
#F  RowModuleOps.ProperSubmodule( <rowmodule>[, <matrix>] ) . . . . . . . . .
#F  . . . . . . . . . . . . . . . . . . . . . . . . . find a proper submodule
##
RowModuleOps.ProperSubmodule := function( arg )
    local   rep, subs;

    rep := Representation( arg[1] );
    if Length( arg ) = 1 then
        subs := InvariantSubspace( rep.range );
    elif Length( arg ) = 2 then
        subs := InvariantSubspace( rep.range, arg[2] ^ rep );
    else
        Error( "usage: ProperSubmodule( <rowmodule>[, <matrix>] )" );
    fi;

    if IsInt( subs ) then
        return subs;
    else
        return RowModule(
            arg[1].ring,
            RowSpace( arg[1].abelianGroup.field, Base( subs ) * rep.base ) );
 
    fi;
end;


#############################################################################
##
#F  ProperSubmodule( <domain> ) . . . . . . . . . . . . . . . . . . . . . . .
##
ProperSubmodule := function( D )
    local   subm;

    if IsDomain( D ) and IsBound( D.operations.ProperSubmodule ) then
        subm := D.operations.ProperSubmodule( D );
    else
        Error( "sorry, can't compute a proper submodule for <domain>" );
    fi;
    return subm;
end;


#############################################################################
##
#F  RowModuleOps.IrreducibilityTest( <rowmodule>[, <matrix>] )  . . . . . . .
#F  . . . . . . . . . . . . . . . .  test whether a row module is irreducible
##
RowModuleOps.IrreducibilityTest := function( arg )
    local   rep, test;

    rep := Representation( arg[1] );
    if Length( arg ) = 1 then
        test := IrreducibilityTest( rep.range );
    elif Length( arg ) = 2 then
        test := IrreducibilityTest( rep.range, arg[2] ^ rep );
    else
        Error( "usage: IrreducibilityTest( <rowmodule>[, <matrix>] )" );
    fi;

    if IsBound( test.invariantSubspace ) then
        test.submodule := RowModule(
            arg[1].ring,
            RowSpace( arg[1].abelianGroup.field,
                   Base( test.invariantSubspace ) * rep.base ) );
                     
        Unbind( test.invariantSubspace );
    fi;
end;


#############################################################################
##
#F  RowModuleOps.AbsoluteIrreducibilityTest( <rowmodule>[, <matrix>] )  . . .
#F  . . . . . . . . . . . . test whether a row module is absolute irreducible
##
RowModuleOps.AbsoluteIrreducibilityTest := function( arg )
    local   rep, test;

    rep := Representation( arg[1] );
    if Length( arg ) = 1 then
        test := AbsoluteIrreducibilityTest( rep.range );
    elif Length( arg ) = 2 then
        test := AbsoluteIrreducibilityTest( rep.range, arg[2] ^ rep );
    else
        Error( "usage: AbsoluteIrreducibilityTest( <rowmodule>[, <matrix>] )" );
    fi;

    if IsBound( test.invariantSubspace ) then
        test.submodule := RowModule(
            arg[1].ring,
            RowSpace( arg[1].abelianGroup.field,
                   Base( test.invariantSubspace ) * rep.base ) );
                     
        Unbind( test.invariantSubspace );
    fi;
end;


#############################################################################
##
#F  RowModuleOps.EquivalenceTest( <rowmodule>, <rowmodule> )  . . . . . . . .
#F  . . . . . . . . . . . . . . perform a test for equivalence of row modules
##
RowModuleOps.EquivalenceTest := function( module1, module2 )
    local   rep1, rep2;

    rep1 := Representation( module1 );
    rep2 := Representation( module2 );
    return EquivalenceTest( rep1.range, rep2.range );
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
