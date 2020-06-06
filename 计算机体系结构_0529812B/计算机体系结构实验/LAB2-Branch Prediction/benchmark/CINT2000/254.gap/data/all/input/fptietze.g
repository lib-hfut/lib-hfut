#############################################################################
##
#A  fptietze.g                GAP library                      Volkmar Felsch
##
#A  @(#)$Id: fptietze.g,v 3.4.1.4 1996/03/12 14:03:41 vfelsch Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions that compute presentations of  subgroups  of
##  finitely presented groups.
##
#H  $Log: fptietze.g,v $
#H  Revision 3.4.1.4  1996/03/12  14:03:41  vfelsch
#H  corrected bugs in TzFindCyclicJoins
#H
#H  Revision 3.4.1.3  1996/02/16  09:58:00  vfelsch
#H  commented out the call of TzFindCyclicJoins which contains a bug
#H
#H  Revision 3.4.1.2  1995/11/03  10:56:47  werner
#H  fixed a bug in TzHandleLength1Or2Relators()
#H          (discovered by a run of Tibor & Zoltan space group routines)
#H
#H  Revision 3.4.1.1  1994/11/24  10:52:04  vfelsch
#H  fixed a bug in function TzEliminateFromTree
#H
#H  Revision 3.4  1994/06/22  14:16:59  vfelsch
#H  updated PresentationOps.Save
#H
#H  Revision 3.3  1994/05/27  08:44:13  vfelsch
#H  added missing messages for certain Tietze eliminations
#H
#H  Revision 3.2  1993/07/23  09:08:41  felsch
#H  fixed bug in AddGenerator
#H
#H  Revision 3.1  1993/01/18  18:57:57  martin
#H  initial revision under RCS.
#H
##


#############################################################################
##
##  Some symbolic constants.
##

TZ_NUMGENS := 1;
TZ_NUMRELS := 2;
TZ_TOTAL := 3;
TZ_GENERATORS := 4;
TZ_INVERSES := 5;
TZ_RELATORS := 6;
TZ_LENGTHS := 7;
TZ_FLAGS := 8;
TZ_MODIFIED := 10;
TZ_NUMREDUNDS := 11;
TZ_STATUS := 15;
TZ_LENGTHTIETZE := 20;

TR_TREELENGTH := 3;
TR_PRIMARY := 4;
TR_TREENUMS := 5;
TR_TREEPOINTERS := 6;
TR_TREELAST := 7;


#############################################################################
##
#V  PresentationOps . . . . . . . . . . . . .  presentation record operations
##
PresentationOps := rec( );


#############################################################################
##
#F  PresentationOps.Print( <T> )  . . . .  pretty print a presentation record
##
PresentationOps.Print := function ( T )

    local numgens, numrels, tietze, total;

    # get number of generators, number of relators, and total length.
    tietze := T.tietze;
    numgens := tietze[TZ_NUMGENS] - tietze[TZ_NUMREDUNDS];
    numrels := tietze[TZ_NUMRELS];
    total := tietze[TZ_TOTAL];

    # print the Tietze status line.
    Print( "<< presentation with ", numgens, " gens and ", numrels,
        " rels of total length ", total, " >>" );

end;


#############################################################################
##
#F  PresentationOps.Save( <file>, <T>, <name> )  . . . .  presentation record
#F                                                                    to file
##
##  'PresentationOps.Save'  writes  the given  Tietze record  to file  <file>
##  with name <name>.
##
PresentationOps.Save := function( file, T, name )

    local TzSaveToFile;

    TzSaveToFile := function( T, name )

        local comp, i, gens, length, n, numgens, tietze;

        # get some local variables.
        tietze := T.tietze;
        gens := tietze[TZ_GENERATORS];
        numgens := tietze[TZ_NUMGENS];

        # first write the definition of the new record to the file.
        Print( name, " := rec();\n" );

        # now write the whole contents of the tietze record to file, but
        # replace T.generators by a list of the internal genarator names
        # and T.tietze[TZ_GEBERATORS] by an empty list, and suppress all
        # those components which are words.
        for n in RecFields(T) do
        comp := T.(n);
        if IsWord( comp ) and n <> "identity" then ;
        elif n = "primaryGeneratorWords" then ;
        elif n = "operations" then
            Print( name, ".operations := PresentationOps;\n" );
        elif n = "generators" then
            # rename the abstract generators.
            Print( name, ".generators := [\n" );
            for i in [ 1 .. numgens ] do
                if i < numgens then  Print( " \"", gens[i], "\",\n" );
                else  Print( " \"", gens[i], "\" ];\n" );  fi;
            od;
        elif n = "tietze" then
            length := Length( comp );
            Print( name, ".tietze := [ " );
            for i in [ 1 .. length ] do
                if i = TZ_GENERATORS then
                    Print( 0 );
                else
                    Print( comp[i] );
                fi;
                if i < length then  Print( ", " );  fi;
            od;
            Print( " ];\n" );
        elif IsString( comp ) then
            Print( name, ".", n, " := \"", comp, "\";\n" );
        else
            Print( name, ".", n, " := ", comp, ";\n" );
        fi;
        od;

        # reconstruct the list of generators and the record components which
        # keep the generators, and print a message.
        Print( "TzRecoverFromFile( ", name, ", \"", name, "\" );\n" );
    end;

    PrintTo( file, TzSaveToFile( T, name ) );

end;


#############################################################################
##
#F  AddGenerator( <Tietze record> [, <gen> ] ) . . . . . . .  add a generator
##
##  'AddGenerator'  extends  the given  Tietze presentation  by a  generator.
##
##  Let  i  be the smallest positive integer  which has not yet been used  as
##  a generator number  and for which no component  T.i  exists so far in the
##  given  Tietze record  T, say.  If no second argument  has been specified,
##  then a new abstract generator _xi  is defined and then added as component
##  T.i  to the given Tietze record.  Otherwise, the given abstract generator
##  is added as component  T.i  to the given Tietze record.
##
AddGenerator := function ( arg )

    local gen, gens, new, numgens, recfields, string, T, tietze;

    # check the number of arguments.
    if Length( arg ) > 2 or Length( arg ) < 1 then  Error(
        "usage: AddGenerator( <Tietze record> [, <gen> ] )" );
    fi;

    # check the first argument to be a Tietze record.
    T := arg[1];
    TzCheckRecord( T );

    tietze := T.tietze;
    gens := tietze[TZ_GENERATORS];
    numgens := tietze[TZ_NUMGENS];

    if Length( arg ) = 1 then

        # define an abstract generator, add it to the set of generators, and
        # print a message.
        gen := TzNewGenerator( T );
        if T.printLevel >= 1 then
            Print( "#I  new generator is ", gen, "\n");
        fi;

    else

        # check the second argument to be an abstract generator.
        gen := arg[2];
        if not ( IsWord( gen ) and LengthWord( gen ) = 1 ) then
            Error( "second argument must be an abstract generator" );
        fi;

        # check the given generator for not already being contained.
        if gen in gens or gen^-1 in gens then  Print(
            "#I  generator ", gen, " is already in the presentation\n" );
            return;
        fi;

        # if there is a tree of generators, delete it.
        if IsBound( T.tree ) then  Unbind( T.tree );  fi;

        # determine the next free generator number.
        new := T.nextFree;
        recfields := RecFields( T );
        while String( new ) in recfields do  new := new + 1;  od;
        T.nextFree := new + 1;

        # add gen to the set of generators.
        numgens := numgens + 1;
        gens[numgens] := gen;
        T.(String( new )) := gen;
        T.components[numgens] := new;
        tietze[TZ_NUMGENS] := numgens;
        tietze[TZ_INVERSES] := Concatenation( [numgens], tietze[TZ_INVERSES],
            [-numgens] );
    fi;

    tietze[TZ_MODIFIED] := true;
end;


#############################################################################
##
#F  AddRelator( <Tietze record>, <word> )  . . . . . . . . . .  add a relator
##
##  'AddRelator'  adds the given  relator  to the given  Tietze presentation.
##
AddRelator := function ( T, word )

    local flags, leng, lengths, numrels, rel, rels, tietze;

    # check the first argument to be a Tietze record.
    TzCheckRecord( T );

    if T.printLevel >= 3 then  Print( "#I  adding relator ",word,"\n" );  fi;

    tietze := T.tietze;
    rels := tietze[TZ_RELATORS];
    numrels := tietze[TZ_NUMRELS];
    flags := tietze[TZ_FLAGS];
    lengths := tietze[TZ_LENGTHS];

    # add rel to the relators of T, and make the Tietze lists consistent.
    rel := TzRelator( tietze, word );
    if rel = false then
        Error( "given word is not a word in the Tietze generators" );
    fi;
    leng := Length( rel );
    if leng > 0 then
        numrels := numrels + 1;
        rels[numrels] := rel;
        lengths[numrels] := leng;
        flags[numrels] := 1;
        tietze[TZ_NUMRELS] := numrels;
        tietze[TZ_TOTAL] := tietze[TZ_TOTAL] + leng;
        tietze[TZ_MODIFIED] := true;
    fi;
end;


#############################################################################
##
#F  DecodeTree( <Tietze record> )  . . . .  decode a subgroup generators tree
##
##  'DecodeTree'  applies the tree decoding method to a subgroup presentation
##  provided by the  Reduced Reidemeister-Schreier  or by the  Modified Todd-
##  Coxeter method.
##
##  rels    is the set of relators.
##  gens    is the set of generators.
##  total   is the total length of all relators.
##
DecodeTree := function ( T )

    local count, decode, looplimit, primary, tietze, trlast;

    # check the given argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;
    tietze := T.tietze;

    # check if there is a tree of generators.
    if not IsBound( T.tree ) then
        Error( "there is not tree to decode it" );
    fi;
    decode := true;

    # substitute substrings by shorter ones.
    TzSearch( T );

    # now run our standard strategy and repeat it.
    looplimit := T.loopLimit;
    count := 0;
    while count < looplimit and tietze[TZ_TOTAL] > 0 do

        # replace substrings by substrings of equal length.
        TzSearchEqual( T );
        if tietze[TZ_MODIFIED] then  TzSearch( T );  fi;

        # eliminate generators.
        TzEliminateGens( T, decode  );
        if tietze[TZ_MODIFIED] then
            TzSearch( T );
            if tietze[TZ_MODIFIED] then  TzSearch( T );  fi;
            if tietze[TZ_MODIFIED] then  TzSearchEqual( T );  fi;
            if tietze[TZ_MODIFIED] then  TzSearch( T );  fi;
            count := count + 1;
        else
            count := looplimit;
        fi;

        if T.printLevel = 1 then  TzPrintStatus( T, true );  fi;
    od;

    # if the tree decoding has been finished, delete the tree.
    primary := T.tree[TR_PRIMARY];
    trlast := T.tree[TR_TREELAST];
    if trlast <= primary then
        Unbind( T.tree );
    else
        Print( "\n", "#I  **********  WARNING:  the tree decoding is",
            " incomplete !  **********\n\n",
            "#I  hence the isomporphism type of the presented group may",
            " have changed,\n",
            "#I  you should continue by first calling the 'DecodeTree'",
            " command again,\n",
            "#I  possibly after changing the Tietze option parameters",
            " appropriately\n\n" );
    fi;

end;


#############################################################################
##
#F  FpGroupPresentation( <Tietze record> ) . . . .  converts the given Tietze
#F                                         presentation to a fin. pres. group
##
##  'FpGroupPresentation'  constructs the group  defined by the  given Tietze
##  presentation and returns the group record.
##
FpGroupPresentation := function ( T )

    local G, gens, grels, i, ident, rels, tietze;

    if T.printLevel >= 3 then
        Print( "#I  converting the Tietze presentation to a group\n" );
    fi;

    # check the given argument to be a Tietze record.
    TzCheckRecord( T );

    # tidy up the Tietze presentation.
    tietze := T.tietze;
    if tietze[TZ_NUMREDUNDS] > 0 then  TzRemoveGenerators( T );  fi;
    TzSort( T );

    # convert the Tietze relators.
    gens := Copy( tietze[TZ_GENERATORS] );
    ident := T.identity;
    rels := tietze[TZ_RELATORS];
    grels := [ ];
    for i in rels do
        if i <> [ ] then Add( grels, TzWord( tietze, i ) ); fi;
    od;

    # create a group record with that presentation and return it.
    G := Group( gens, ident );
    G.relators := grels;
    G.identity := T.identity;
    return G;
end;


#############################################################################
##
#F  PresentationFpGroup( <G> [,<print level>] ) . . .  create a Tietze record
##
##  'PresentationFpGroup'  creates a presentation, i.e. a  Tietze record, for
##   the given finitely presented group.
##
PresentationFpGroup := function ( arg )

    local G, ggens, grels, i, invs, lengths, numgens, numrels, printlevel,
          rels, T, tietze, total;

    # check the first argument to be a finitely presented group.
    G := arg[1];
    if not ( IsRec( G ) and IsBound( G.isFpGroup ) and G.isFpGroup ) then
        Error( "first argument must be a finitely presented group" );
    fi;

    # check the second argument to be an integer.
    printlevel := 1;
    if Length( arg ) = 2 then  printlevel := arg[2];  fi;
    if not IsInt( printlevel ) then
        Error( "second argument must be an integer" );
    fi;

    # Create the Tietze record.
    T := rec( );
    T.isTietze := true;
    T.operations := PresentationOps;

    # Initialize the Tietze stack.
    ggens := G.generators;
    grels := G.relators;
    tietze := 0 * [ 1 .. TZ_LENGTHTIETZE ];
    numgens := Length( ggens );
    tietze[TZ_NUMGENS] := numgens;
    tietze[TZ_GENERATORS] := Copy( ggens );
    invs := ( numgens + 1 ) - [ 1 .. 2 * numgens + 1 ];
    tietze[TZ_INVERSES] := invs;
    numrels := Length( grels );
    rels := 0 * [ 1 .. numrels ];
    lengths := 0 * [ 1 .. numrels ];
    total := 0;
    for i in [ 1 .. numrels ] do
        rels[i] := TzRelator( tietze, grels[i] );
        if rels[i] = false then
            Error( "given relator is not a word in the group generators" );
        fi;
        lengths[i] := Length( rels[i] );
        total := total + lengths[i];
    od;
    tietze[TZ_NUMRELS] := numrels;
    tietze[TZ_RELATORS] := rels;
    tietze[TZ_LENGTHS] := lengths;
    tietze[TZ_FLAGS] := 1 + 0 * [ 1 .. numrels ];
    tietze[TZ_TOTAL] := total;
    tietze[TZ_STATUS] := [ 0, 0, -1 ];
    tietze[TZ_MODIFIED] := false;
    T.generators := tietze[TZ_GENERATORS];
    T.tietze := tietze;
    T.components := 0 * [ 1 .. numgens ];
    for i in [ 1 .. numgens ] do
        T.(String( i )) := ggens[i];
        T.components[i] := i;
    od;
    T.nextFree := numgens + 1;
    T.identity := G.identity;

    # initialize the Tietze options by their default values.
    T.eliminationsLimit := 100;
    T.expandLimit := 150;
    T.generatorsLimit := 0;
    T.lengthLimit := "infinity";
    T.loopLimit := "infinity";
    T.printLevel := printlevel;
    T.saveLimit := 10;
    T.searchSimultaneous := 20;

    # print the status line.
    if T.printLevel >= 2 then  TzPrintStatus( T, true );  fi;

    # handle relators of length 1 or 2.
    TzHandleLength1Or2Relators( T );

    # sort the relators and print the status line.
    TzSort( T );
    if T.printLevel >= 2 then  TzPrintStatus( T, true );  fi;

    # return the Tietze record.
    return T;
end;


#############################################################################
##
#F  RemoveRelator( <Tietze record>, <n> ) . . . . . . . . .  remove a relator
#F                                                        from a presentation
##
##  'RemoveRelator'   removes   the  nth  relator   from  the  given   Tietze
##  presentation.
##
RemoveRelator := function ( T, n )

    local invs, leng, lengths, num, numgens1, numrels, rels, tietze;

    # check the first argument to be a Tietze record.
    TzCheckRecord( T );

    # get some local variables.
    tietze := T.tietze;
    rels := tietze[TZ_RELATORS];
    numrels := tietze[TZ_NUMRELS];
    lengths := tietze[TZ_LENGTHS];
    invs := tietze[TZ_INVERSES];
    numgens1 := tietze[TZ_NUMGENS] + 1;

    # check the second argument to be in range.
    if ( n < 1 or n > numrels ) then
        Error( "relator number out of range" );
    fi;

    # print a message.
    if T.printLevel >= 3 then
        Print( "#I  removing the ", n, "th relator\n" );
    fi;

    # check if the nth relator has defined an involution.
    leng := lengths[n];
    if leng = 2 and rels[n][1] = rels[n][2] then
        num := rels[n][1];
        if num < 0 then  num := -num;  fi;
        if invs[numgens1+num] = num then  invs[numgens1+num] := -num;  fi;
    fi;

    # remove the nth relator, and make the Tietze lists consistent.
    rels[n] := [ ];
    lengths[n] := 0;
    tietze[TZ_TOTAL] := tietze[TZ_TOTAL] - leng;
    TzSort( T );
    if T.printLevel >= 2 then  TzPrintStatus( T, true );  fi;
end;


#############################################################################
##
#F  SimplifiedFpGroup( <FpGroup> ) . . . . . . . . .  sinplify the FpGroup by
#F                                                     Tietze transformations
##
##  'SimplifiedFpGroup'  returns a group  isomorphic to the given one  with a
##  presentation which has been tried to simplify via Tietze transformations.
##
SimplifiedFpGroup := function ( G )

    local H, T;

    # check the given argument to be a finitely presented group.
    if not ( IsRec( G ) and IsBound( G.isFpGroup ) and G.isFpGroup ) then
        Error( "argument must be a finitely presented group" );
    fi;

    # convert the given group presentation to a Tietze presentation.
    T := PresentationFpGroup( G, 0 );

    # perform Tietze transformations.
    TzGo( T );

    # reconvert the Tietze presentation to a group presentation.
    H := FpGroupPresentation( T );

    # return the resulting group record.
    return H;
end;


#############################################################################
##
#F  TzCheckRecord( <Tietze record> )  . . . .  check Tietze record components
##
##  'TzCheckRecord'  checks some components of the  given Tietze record to be
##  consistent.
##
TzCheckRecord := function ( T )

    local tietze;

    # check the given argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;

    # check the generator lists to be consistent.
    tietze := T.tietze;
    if not ( IsIdentical( T.generators, tietze[TZ_GENERATORS] ) ) or
        Length( tietze[TZ_GENERATORS] ) <> tietze[TZ_NUMGENS] then
        Error( "inconsistent generator lists" );
    fi;

    # check the inverses list.
    if Length( tietze[TZ_INVERSES] ) <> 2 * tietze[TZ_NUMGENS] + 1 then
        Error( "inconsistent generator inverses" );
    fi;

    # check the relator list.
    if Length( tietze[TZ_RELATORS] ) <> tietze[TZ_NUMRELS] or
        Length( tietze[TZ_LENGTHS] ) <> tietze[TZ_NUMRELS] or
        Length( tietze[TZ_FLAGS] ) <> tietze[TZ_NUMRELS] then
        Error( "inconsistent relators" );
    fi;

end;


#############################################################################
##
#F  TzEliminate( <Tietze record> ) . . . . . . . . . . eliminates a generator
#F  TzEliminate( <Tietze record>, <gen> )  . . . . . eliminates generator gen
#F  TzEliminate( <Tietze record>, <n> ) . . . . . . . eliminates n generators
##
##  If a generator has been specified,  then  'TzEliminate'  eliminates it if
##  possible, i. e. if it can be isolated in some appropriate relator.  If no
##  generator  has  been  specified ,   then  'TzEliminate'  eliminates  some
##  appropriate  generator  if possible  and if the resulting total length of
##  the relators will not exceed the parameter T.lengthLimit.
##
TzEliminate := function ( arg )

    local eliminations, gennum, n, numgens, numgenslimit, T, tietze;

    # check the number of arguments.
    if Length( arg ) > 2 or Length( arg ) < 1 then
        Error( "usage: TzEliminate( <Tietze record> [, <generator> ] )" );
    fi;

    # check the first argument to be a Tietze record.
    T := arg[1];
    TzCheckRecord( T );
    tietze := T.tietze;

    # get the arguments.
    gennum := 0;
    n := 1;
    if Length( arg ) = 2 then
        if IsInt( arg[2] ) then
            n := arg[2];
        else
            gennum := Position( tietze[TZ_GENERATORS], arg[2] );
            if gennum = false then  Error(
                "usage: TzEliminate( <Tietze record> [, <generator> ] )" );
            fi;
        fi;
    fi;

    if n = 1 then

        # call the appropriate routine to eliminate one generator.
        if gennum = 0 then  TzEliminateGen1( T );
        else  TzEliminateGen( T, gennum );  fi;
        if tietze[TZ_NUMREDUNDS] > 0 then  TzRemoveGenerators( T );  fi;

        # handle relators of length 1 or 2.
        TzHandleLength1Or2Relators( T );

        # sort the relators and print the status line.
        TzSort( T );
        if T.printLevel >= 1 then  TzPrintStatus( T, true );  fi;

    else

        # eliminate n generators.
        numgens := tietze[TZ_NUMGENS];
        eliminations := T.eliminationsLimit;
        numgenslimit := T.generatorsLimit;
        T.eliminationsLimit := n;
        T.generatorsLimit := numgens - n;
        TzEliminateGens( T );
        T.eliminationsLimit := eliminations;
        T.generatorsLimit := numgenslimit;
    fi;
end;


#############################################################################
##
#F  TzEliminateFromTree( <Tietze record> ) . .  eliminates the last generator
#F                                                              from the tree
##
##  'TzEliminateFromTree'  eliminates  the  last  Tietze  generator.  If that
##  generator cannot be isolated in any Tietze relator,  then it's definition
##  is  taken  from  the tree  and added  as an  additional  Tietze  relator,
##  extending  the  set  of  Tietze generators  appropriately,  if necessary.
##  However,  the elimination  will not be  performed  if the resulting total
##  length of the relators  cannot be guaranteed  to not exceed the parameter
##  T.lengthLimit.
##
TzEliminateFromTree := function ( T )

    local exp, factor, flags, gen, gens, i, invnum, invs, leng, length,
          lengths, num, numgens, numrels, occRelNum, occur, occTotal, pair,
          pair1, pointers, pos, pptrtr, primary, ptr, rel, rels, space,
          spacelimit, string, tietze, tree, treelength, treeNums, trlast,
          word;

    # check the first argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;

    # get some local variables.
    tietze := T.tietze;
    gens := tietze[TZ_GENERATORS];
    numgens := tietze[TZ_NUMGENS];
    invs := tietze[TZ_INVERSES];
    rels := tietze[TZ_RELATORS];
    numrels := tietze[TZ_NUMRELS];
    flags := tietze[TZ_FLAGS];
    lengths := tietze[TZ_LENGTHS];

    # get some more local variables.
    tree := T.tree;
    treelength := tree[TR_TREELENGTH];
    primary := tree[TR_PRIMARY];
    trlast := tree[TR_TREELAST];
    treeNums := tree[TR_TREENUMS];
    pointers := tree[TR_TREEPOINTERS];

    spacelimit := T.lengthLimit;
    tietze[TZ_MODIFIED] := false;
    occTotal := 0;

    # get the number of the last occurring generator.
    while occTotal = 0 do

        # get the number of the last generator.
        while trlast > primary and pointers[trlast] <= treelength do
            trlast := trlast - 1;
        od;
        tree[TR_TREELAST] := trlast;
        if trlast <= primary then  return;  fi;

        # determine the number of occurrences of the last generator.
        num := pointers[trlast] - treelength;
        occur := TzOccurrences( tietze, num );
        occTotal := occur[1][1];

        # if the last generator does not occur in the relators, mark it to
        # be redundant.
        if occTotal = 0 then
            invs[numgens+1-num] := 0;
            tietze[TZ_NUMREDUNDS] := tietze[TZ_NUMREDUNDS] + 1;
            trlast := trlast - 1;
        fi;
    od;

    if occur[3][1] > 1 then

        # print a message.
        if T.printLevel >= 2 then
            Print( "#I  adding relator from tree position ", trlast, "\n" );
        fi;

        # get the defining word from the tree.
        pair := [ 0, 0 ];
        for i in [ 1 .. 2 ] do

            exp := 1;
            ptr := tree[i][trlast];
            if ptr < 0 then
                exp := - exp;
                ptr := - ptr;
            fi;

            if pointers[ptr] = ptr then
                # add this tree generator to the list of generators.
                gen := TzNewGenerator( T );
                numgens := tietze[TZ_NUMGENS];
                gens := tietze[TZ_GENERATORS];
                invs := tietze[TZ_INVERSES];
                treeNums[numgens] := ptr;
                pointers[ptr] := treelength + numgens;
                if T.printLevel >= 2 then
                    Print( "#I  adding generator ", gens[numgens],
                    " from tree position ", ptr, "\n" );
                fi;
            else
                # find this tree generator in the list of generators.
                while ptr > 0 and pointers[ptr] <= treelength do
                    ptr := pointers[ptr];
                    if ptr < 0 then
                        exp := - exp;
                        ptr := - ptr;
                    fi;
                od;
            fi;

            # now get the generator number of the current factor.
            if ptr = 0 then
                factor := 0;
            else
                factor := pointers[ptr] - treelength;
                if treeNums[factor] < 0 then  exp := - exp;  fi;
                if exp < 0 then  factor := invs[numgens+1+factor];  fi;
            fi;
            pair[i] := factor;
        od;

        # invert the defining word, if necessary.
        if treeNums[num] < 0 then
            pair1 := pair[1];
            pair[1] := invs[numgens+1+pair[2]];
            pair[2] := invs[numgens+1+pair1];
        fi;

        # add the correponding relator to the set of relators.
        invnum := invs[numgens+1+num];
        if pair[1] = invs[numgens+1+pair[2]] then
            rel := [ invnum ];  leng := 1;
        elif pair[1] = 0 then
            rel := [ invnum, pair[2] ];  leng := 2;
        elif pair[2] = 0 then
            rel := [ invnum, pair[1] ];  leng := 2;
        else
            rel := [ invnum, pair[1], pair[2] ];  leng := 3;
        fi;
        numrels := numrels + 1;
        rels[numrels] := rel;
        lengths[numrels] := leng;
        flags[numrels] := 1;
        tietze[TZ_NUMRELS] := numrels;
        tietze[TZ_TOTAL] := tietze[TZ_TOTAL] + leng;
        tietze[TZ_MODIFIED] := true;

        # if the new relator has length at most 2, handle it by calling the
        # appropriate subroutine, and then return.
        if leng <= 2 then
            TzHandleLength1Or2Relators( T );
            trlast := trlast - 1;
            while trlast > primary and pointers[trlast] <= treelength do
                trlast := trlast - 1;
            od;
            tree[TR_TREELAST] := trlast;
            return;
        fi;

        # else update the number of occurrences of the last generator, and
        # continue.
        occTotal := occTotal + 1;
        occur[1][1] := occTotal;
        occur[2][1] := numrels;
        occur[3][1] := 1;
    fi;

    occRelNum := occur[2][1];

    length := lengths[occRelNum];
    space := (occTotal - 1) * (length - 1) - length;

    if tietze[TZ_TOTAL] + space <= spacelimit then

        # find the substituting word.
        gen := num;
        rel := rels[occRelNum];
        length := lengths[occRelNum];
        pos := Position( rel, gen );
        if pos = false then
            gen := -gen;
            pos := Position( rel, gen );
        fi;
        word := Concatenation( Sublist( rel, [pos+1..length] ),
            Sublist( rel, [1..pos-1] ) );

        # replace all occurrences of gen by word^-1.
        if T.printLevel >= 2 then
            Print( "#I  eliminating ", gens[num], " = " );
            if gen > 0 then  Print( TzWord( tietze, word )^-1, "\n" );
            else  Print( TzWord( tietze, word ), "\n" );  fi;
        fi;
        TzSubstituteGen( tietze, -gen, word );

        # mark gen to be redundant.
        invs[numgens+1-num] := 0;
        tietze[TZ_NUMREDUNDS] := tietze[TZ_NUMREDUNDS] + 1;
        tietze[TZ_MODIFIED] := true;
        trlast := trlast - 1;
        while trlast > primary and pointers[trlast] <= treelength do
            trlast := trlast - 1;
        od;
        tree[TR_TREELAST] := trlast;
    fi;
end;


#############################################################################
##
#F  TzEliminateGen( <Tietze record>, <n> ) . . . eliminates the nth generator
##
##  'TzEliminateGen' eliminates the Tietze generator tietze[TZ_GENERATORS][n]
##  if possible, i. e. if that generator can be isolated  in some appropriate
##  Tietze relator.  However,  the elimination  will not be  performed if the
##  resulting total length of the relators cannot be guaranteed to not exceed
##  the parameter T.lengthLimit.
##
TzEliminateGen := function ( T, num )

    local gen, gens, invs, length, lengths, numgens, numrels, occRelNum,
          occur, occTotal, pos, rel, rels, space, spacelimit, tietze, word;

    # check the first argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;
    tietze := T.tietze;
    spacelimit := T.lengthLimit;

    tietze[TZ_MODIFIED] := false;

    gens := tietze[TZ_GENERATORS];
    numgens := tietze[TZ_NUMGENS];
    invs := tietze[TZ_INVERSES];
    rels := tietze[TZ_RELATORS];
    numrels := tietze[TZ_NUMRELS];
    lengths := tietze[TZ_LENGTHS];

    # check the second argument to be a generator number in range.
    if not IsInt( num ) or num <= 0 or num > numgens then  Error(
        "TzEliminateGen: second argument is not a valid generator number" );
    fi;

    # determine the number of occurrences of the given generator.
    occur := TzOccurrences( tietze, num );
    occTotal := occur[1][1];
    if occTotal > 0 and occur[3][1] = 1 then

        occRelNum := occur[2][1];

        length := lengths[occRelNum];
        space := (occTotal - 1) * (length - 1) - length;

        if tietze[TZ_TOTAL] + space <= spacelimit then

            # if there is a tree of generators and if the generator to be
            # deleted is not the last generator, then delete the tree.
            if num < numgens and IsBound( T.tree ) then
                Unbind( T.tree );
            fi;

            # find the substituting word.
            gen := num;
            rel := rels[occRelNum];
            length := lengths[occRelNum];
            pos := Position( rel, gen );
            if pos = false then
                gen := -gen;
                pos := Position( rel, gen );
            fi;
            word := Concatenation( Sublist( rel, [pos+1..length] ),
                Sublist( rel, [1..pos-1] ) );

            # replace all occurrences of gen by word^-1.
            if T.printLevel >= 2 then
                Print( "#I  eliminating ", gens[num], " = " );
                if gen > 0 then  Print( TzWord( tietze, word )^-1, "\n" );
                else  Print( TzWord( tietze, word ), "\n" );  fi;
            fi;
            TzSubstituteGen( tietze, -gen, word );

            # mark gen to be redundant.
            invs[numgens+1-num] := 0;
            tietze[TZ_NUMREDUNDS] := tietze[TZ_NUMREDUNDS] + 1;
            tietze[TZ_MODIFIED] := true;
        fi;
    fi;
end;


#############################################################################
##
#F  TzEliminateGen1( <Tietze record> )  . . . . . . .  eliminates a generator
##
##  'TzEliminateGen1'  tries to  eliminate a  Tietze generator:  If there are
##  Tietze generators which occur just once in certain Tietze relators,  then
##  one of them is chosen  for which the product of the length of its minimal
##  defining word  and the  number of its  occurrences  is minimal.  However,
##  the elimination  will not be performed  if the resulting  total length of
##  the  relators   cannot  be  guaranteed   to  not  exceed   the  parameter
##  T.lengthLimit.
##
TzEliminateGen1 := function ( T )

    local gen, gens, i, invs, ispace, j, length, lengths, modified, num,
          numgens, numrels, occur, occMultiplicities, occRelNum, occRelNums,
          occTotals, pos, rel, rels, space, spacelimit, tietze, total, word;

    # check the given argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;
    tietze := T.tietze;
    spacelimit := T.lengthLimit;

    gens := tietze[TZ_GENERATORS];
    numgens := tietze[TZ_NUMGENS];
    invs := tietze[TZ_INVERSES];
    rels := tietze[TZ_RELATORS];
    numrels := tietze[TZ_NUMRELS];
    lengths := tietze[TZ_LENGTHS];

    occur := TzOccurrences( tietze );
    occTotals := occur[1];
    occRelNums := occur[2];
    occMultiplicities := occur[3];

    modified := false;
    num := 0;
    space := 0;

    for i in [ 1 .. numgens ] do
        if IsBound( occMultiplicities[i] ) and occMultiplicities[i] = 1 then
            total := occTotals[i];
            length := lengths[occRelNums[i]];
            ispace := (total - 1) * (length - 1) - length;
            if num = 0 or ispace <= space then
                num := i;
                space := ispace;
            fi;
        fi;
    od;

    if num > 0 and tietze[TZ_TOTAL] + space <= spacelimit then

        # if there is a tree of generators and if the generator to be deleted
        # is not the last generator, then delete the tree.
        if num < numgens and IsBound( T.tree ) then
            Unbind( T.tree );
        fi;

        # find the substituting word.
        gen := num;
        occRelNum := occRelNums[num];
        rel := rels[occRelNum];
        length := lengths[occRelNum];
        pos := Position( rel, gen );
        if pos = false then
            gen := -gen;
            pos := Position( rel, gen );
        fi;
        word := Concatenation( Sublist( rel, [pos+1..length] ),
            Sublist( rel, [1..pos-1] ) );

        # replace all occurrences of gen by word^-1.
        if T.printLevel >= 2 then
            Print( "#I  eliminating ", gens[num], " = " );
            if gen > 0 then  Print( TzWord( tietze, word )^-1, "\n" );
            else  Print( TzWord( tietze, word ), "\n" );  fi;
        fi;
        TzSubstituteGen( tietze, -gen, word );

        # mark gen to be redundant.
        invs[numgens+1-num] := 0;
        tietze[TZ_NUMREDUNDS] := tietze[TZ_NUMREDUNDS] + 1;
        modified := true;
    fi;

    tietze[TZ_MODIFIED] := modified;
end;


#############################################################################
##
#F  TzEliminateGens( <Tietze record> [, <decode>] )  .  Eliminates generators
##
##  'TzEliminateGens'  repeatedly eliminates generators from the presentation
##  of the given group until at least one  of  the  following  conditions  is
##  violated:
##
##  (1) The  current  number of  generators  is greater  than  the  parameter
##      T.generatorsLimit.
##  (2) The   number   of   generators   eliminated   so  far  is  less  than
##      the parameter T.eliminationsLimit.
##  (3) The  total length of the relators  has not yet grown  to a percentage
##      greater than the parameter T.expandLimit.
##  (4) The  next  elimination  will  not  extend the total length to a value
##      greater than the parameter T.lengthLimit.
##
##  If a  second argument  has been  specified,  then it is  assumed  that we
##  are in the process of decoding a tree.
##
TzEliminateGens := function ( arg )

    local bound, decode, maxnum, modified, num, redundantsLimit, T, tietze;

    # check the number of arguments.
    if Length( arg ) > 2 or Length( arg ) < 1 then
        Error( "usage: TzEliminateGens( <Tietze record> [, <decode> ] )" );
    fi;

    # check the first argument to be a Tietze record.
    T := arg[1];
    TzCheckRecord( T );

    if T.printLevel >= 3 then  Print( "#I  eliminating generators\n" );  fi;

    # get the second argument.
    decode := Length( arg ) = 2;

    tietze := T.tietze;
    redundantsLimit := 5;
    maxnum := T.eliminationsLimit;
    bound := tietze[TZ_TOTAL] * (T.expandLimit / 100);
    modified := false;
    tietze[TZ_MODIFIED] := true;
    num := 0;
    while  tietze[TZ_MODIFIED]  and  num < maxnum  and
        tietze[TZ_TOTAL] <= bound and
        tietze[TZ_NUMGENS] - tietze[TZ_NUMREDUNDS] > T.generatorsLimit  do
        if decode then
            TzEliminateFromTree( T );
        else
            TzEliminateGen1( T );
        fi;
        if tietze[TZ_NUMREDUNDS] = redundantsLimit then
            TzRemoveGenerators( T );
        fi;
        modified := modified or tietze[TZ_MODIFIED];
        num := num + 1;
    od;
    tietze[TZ_MODIFIED] := modified;
    if tietze[TZ_NUMREDUNDS] > 0 then  TzRemoveGenerators( T );  fi;

    if modified then
        # handle relators of length 1 or 2.
        TzHandleLength1Or2Relators( T );
        # sort the relators and print the status line.
        TzSort( T );
        if T.printLevel >= 2 then  TzPrintStatus( T, true );  fi;
    fi;
end;


#############################################################################
##
#F  TzFindCyclicJoins( <Tietze record> )  . . . . . . handle cyclic subgroups
##
##  'TzFindCyclicJoins'  searches for  power and commutator relators in order
##  to find  pairs of generators  which  generate a  common  cyclic subgroup.
##  It uses these pairs to introduce new relators,  but it does not introduce
##  any new generators as is done by 'TzSubstituteCyclicJoins'.
##
TzFindCyclicJoins := function ( T )

    local e, exp, exponents, fac, flags, gen, gens, ggt, i, invs, j, k, l,
          length, lengths, n, newstart, next, num, numgens, numrels, prev,
          powers, rel, rels, T, tietze, word;

    if T.printLevel >= 3 then
        Print( "#I  searching for cyclic joins\n" );
    fi;

    # check the given argument to be a Tietze record.
    TzCheckRecord( T );
    tietze := T.tietze;
    tietze[TZ_MODIFIED] := false;

    # start the routine and repeat it whenever a generator has been
    # eliminated.
    newstart := true;
    while newstart do

      # try to find exponents for the generators.
      exponents := TzGeneratorExponents( T );
      if Sum( exponents ) = 0 then  return;  fi;

      # initialize some local variables.
      newstart := false;
      gens := tietze[TZ_GENERATORS];
      numgens := tietze[TZ_NUMGENS];
      rels := tietze[TZ_RELATORS];
      numrels := tietze[TZ_NUMRELS];
      lengths := tietze[TZ_LENGTHS];
      invs := tietze[TZ_INVERSES];
      flags := tietze[TZ_FLAGS];

      # now work off all commutator relators of length 4.
      i := 0;
      while i < numrels do

        # find the next commutator.
        i := i + 1;
        rel := rels[i];
        if lengths[i] = 4 and rel[1] = invs[numgens+1+rel[3]] and
          rel[2] = invs[numgens+1+rel[4]] then

          # There is a commutator relator of the form [a,b]. Check if
          # there are also power relators of the form a^m or b^n.

          num := [ AbsInt( rel[1] ), AbsInt( rel[2] ) ];
          exp := [ exponents[num[1]], exponents[num[2]] ];
          fac := [ 0, 0 ];
          e   := [ 0, 0 ];

          # If there is at least one relator of the form a^m or b^n, then
          # search for a relator of the form  a^s * b^t  (modulo [a,b])
          # with s prime to m or t prime to n, respectively. For, if s is
          # prime to m, then we can use the Euclidian algorithm to
          # express a as a power of b and then eliminate a.

          if exp[1] > 0 or exp[2] > 0 then

             j := 0;
             while j < numrels do

                # get the next relator.
                j := j + 1;
                if lengths[j] > 0 and j <> i then
                   rel := rels[j];

                   # check whether rel is a word in a and b.
                   length := lengths[j];
                   e[1]   := 0;
                   e[2]   := 0;
                   powers := 0;
                   prev   := 0;
                   l      := 0;
                   while l < length do
                      l := l + 1;
                      next := rel[l];
                      if next <> prev then
                         powers := powers + 1;
                         prev := next;
                      fi;
                      if next = num[1] then  e[1] := e[1] + 1;
                      elif next = num[2] then  e[2] := e[2] + 1;
                      elif next = -num[1] then  e[1] := e[1] - 1;
                      elif next = -num[2] then  e[2] := e[2] - 1;
                      else l := length + 1;
                      fi;
                   od;

                   if l = length and powers > 1 then

                      # reduce exponents, if possible.
                      for k in [ 1, 2 ] do
                         fac[k] := num[k];
                         if exp[k] > 0 then
                            e[k] := e[k] mod exp[k];
                            if e[k] > exp[k]/2 then
                               e[k] := exp[k] - e[k];
                               fac[k] := - fac[k];
                            fi;
                         elif e[k] < 0 then
                            e[k] := - e[k];
                            fac[k] := - fac[k];
                         fi;
                         if fac[k] < 0 then
                            fac[k] := invs[numgens+1-fac[k]];
                         fi;
                      od;

                      # now the e[k] are non-negative.
                      for k in [ 1, 2 ] do
                         if e[k] > 0 and e[3-k] = 0 then
                            exp[k] := GcdInt( e[k], exp[k] );
                            if exp[k] <> exponents[num[k]] then
                               exponents[num[k]] := exp[k];
                               e[k] := exp[k];
                            fi;
                         fi;
                      od;

                      # reduce the current relator, if possible.
                      if e[1] + e[2] < length or powers > 2 then
                         rel := [ ];
                         if e[1] > 0 then  rel := Concatenation(
                            rel, fac[1] + 0 * [1..e[1]] );
                         fi;
                         if e[2] > 0 then  rel := Concatenation(
                            rel, fac[2] + 0 * [1..e[2]] );
                         fi;
                         rels[j] := rel;
                         lengths[j] := e[1] + e[2];
                         tietze[TZ_TOTAL] := tietze[TZ_TOTAL] - length
                            + lengths[j];
                         flags[j] := 1;
                         tietze[TZ_MODIFIED] := true;
                         if T.printLevel >= 3 then  Print(
                            "#I  rels[",j,"] reduced to ",rels[j],"\n" );
                         fi;
                      fi;

                      # try to find a generator that can be deleted.
                      if e[1] = 1 then  n := num[1];
                      elif e[2] = 1 then  n := num[2];
                      else n := 0;
                         for k in [ 1, 2 ] do
                            if n = 0 and e[k] > 1 and
                               GcdInt( e[k], exp[k] ) = 1 then
                               ggt := Gcdex( e[k], exp[k] );
                               gen := [gens[num[1]], gens[num[2]]];
                               if fac[1] < 0 then  gen[1] := gen[1]^-1;  fi;
                               if fac[2] < 0 then  gen[2] := gen[2]^-1;  fi;
                               word := gen[k] * gen[3-k]^(e[3-k]*ggt.coeff1);
                               AddRelator( T, word );
                               numrels := tietze[TZ_NUMRELS];
                               n := num[k];
                            fi;
                         od;
                      fi;

                      # eliminate a generator if it is possible and allowed.
                      if n <> 0 and T.generatorsLimit < numgens then
                         TzEliminate( T );
                         tietze[TZ_MODIFIED] := true;
                         j := numrels;
                         i := numrels;
                         if TZ_NUMGENS < numgens then
                            newstart := true;
                         fi;
                      fi;
                   fi;
                fi;
             od;
          fi;
        fi;
      od;
    od;

    if tietze[TZ_MODIFIED] then
        # handle relators of length 1 or 2.
        TzHandleLength1Or2Relators( T );
        # sort the relators and print the status line.
        TzSort( T );
        if T.printLevel >= 1 then  TzPrintStatus( T, true );  fi;
    fi;
end;


#############################################################################
##
#F  TzGeneratorExponents( <Tietze record> ) . . . list of generator exponents
##
##  'TzGeneratorExponents'  tries to find exponents for the Tietze generators
##  and return them in a list parallel to the list of the generators.
##
TzGeneratorExponents := function ( T )

    local exp, exponents, flags, i, invs, j, l, length, lengths, num, num1,
          numgens, numrels, rel, rels, tietze;

    if T.printLevel >= 3 then
        Print( "#I  trying to find generator exponents\n" );
    fi;

    # check the given argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;
    tietze := T.tietze;

    numgens := tietze[TZ_NUMGENS];
    rels := tietze[TZ_RELATORS];
    numrels := tietze[TZ_NUMRELS];
    lengths := tietze[TZ_LENGTHS];
    invs := tietze[TZ_INVERSES];
    flags := tietze[TZ_FLAGS];

    # Initialize the exponents list.
    exponents := 0 * [1..numgens];

    # Find all relators which are powers of a single generator.
    for i in [ 1 .. numrels ] do
        if lengths[i] > 0 then
            rel := rels[i];
            length := lengths[i];
            num1 := rel[1];
            j := 2;
            while j <= length and rel[j] = num1 do  j := j + 1;  od;
            if j > length then
                num := AbsInt( num1 );
                if exponents[num] = 0 then  exp := length;
                else  exp := GcdInt( exponents[num], length );  fi;
                exponents[num] := exp;
                if exp < length then
                    rels[i] := num + 0 * [ 1 .. exp ];
                    lengths[i] := exp;
                    tietze[TZ_TOTAL] := tietze[TZ_TOTAL] - length + exp;
                    flags[i] := 1;
                    tietze[TZ_MODIFIED] := true;
                elif num1 < 0 then
                    rels[i] := - rel;
                fi;
            fi;
        fi;
    od;

    return exponents;
end;


#############################################################################
##
#F  TzGo( <Tietze record> [, <silent> ) . . . . .  run Tietze transformations
##
##  'TzGo'  automatically  performs  suitable  Tietze transformations  of the
##  presentation in the given Tietze record.
##
##  If "silent" is specified as true, then the printing of the status line by
##  'TzGo' in case of T.printLevel = 1 is suppressed.
##
##  rels    is the set of relators.
##  gens    is the set of generators.
##  total   is the total length of all relators.
##
TzGo := function ( arg )

    local count, looplimit, printstatus, T, tietze;

    # get the arguments.
    T := arg[1];
    printstatus := T.printLevel = 1 and
        not ( Length( arg ) > 1 and IsBool( arg[2] ) and arg[2] );

    # check the first argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;
    tietze := T.tietze;

    # substitute substrings by shorter ones.
    TzSearch( T );

    # now run our standard strategy and repeat it.
    looplimit := T.loopLimit;
    count := 0;
    while count < looplimit and tietze[TZ_TOTAL] > 0 do

        # replace substrings by substrings of equal length.
        TzSearchEqual( T );
        if tietze[TZ_MODIFIED] then  TzSearch( T );  fi;

        # eliminate generators.
        TzEliminateGens( T );
        if tietze[TZ_MODIFIED] then
            TzSearch( T );
            count := count + 1;
        else
            count := looplimit;
        fi;

        if printstatus then  TzPrintStatus( T, true );  fi;
    od;

    # try to find cyclic subgroups by looking at power and commutator
    # relators.
    if tietze[TZ_TOTAL] > 0 then
        TzFindCyclicJoins( T );
        if tietze[TZ_MODIFIED] then  TzSearch( T );  fi;
        if printstatus then  TzPrintStatus( T, true );  fi;
    fi;

end;

SimplifyPresentation := TzGo;


#############################################################################
##
#F  TzGoGo( <Tietze record> ) . . . . .  run the Tietze go command repeatedly
##
##  'TzGoGo'  calls  the 'TzGo' command  again  and again  until it  does not
##  reduce the presentation any more.  'TzGo' automatically performs suitable
##  Tietze  transformations  of the presentation  in the given Tietze record.
##
##  rels    is the set of relators.
##  gens    is the set of generators.
##  total   is the total length of all relators.
##
TzGoGo := function ( T )

    local count, numgens, numrels, silentGo, tietze, total;

    # check the given argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;

    # initialize the local variables.
    tietze := T.tietze;
    numgens := tietze[TZ_NUMGENS];
    numrels := tietze[TZ_NUMRELS];
    total := tietze[TZ_TOTAL];
    silentGo := T.printLevel = 1;
    count := 0;

    #loop over the Tietze transformations.
    while count < 5 do
        TzGo( T, silentGo );
        count := count + 1;
        if silentGo and ( tietze[TZ_NUMGENS] < numgens or
            tietze[TZ_NUMRELS] < numrels ) then
            TzPrintStatus( T, true );
        fi;
        if tietze[TZ_NUMGENS] < numgens or tietze[TZ_NUMRELS] < numrels or
            tietze[TZ_TOTAL] < total then
            numgens := tietze[TZ_NUMGENS];
            numrels := tietze[TZ_NUMRELS];
            total := tietze[TZ_TOTAL];
            count := 0;
        fi;
    od;

    if silentGo then  TzPrintStatus( T, true );  fi;
end;


#############################################################################
##
#F  TzHandleLength1Or2Relators( <Tietze record> ) . . . handle short relators
##
##  'TzHandleLength1Or2Relators'  searches for  relators of length 1 or 2 and
##  performs suitable Tietze transformations for each of them:
##
##  Generators occurring in relators of length 1 are eliminated.
##
##  Generators  occurring  in square relators  of length 2  are marked  to be
##  involutions.
##
##  If a relator  of length 2  involves two  different  generators,  then the
##  generator with the  larger number is substituted  by the other one in all
##  relators and finally eliminated from the set of generators.
##
TzHandleLength1Or2Relators := function ( T )

    local absrep2, done, flags, gens, i, invs, j, length, lengths, numgens,
          numgens1, numrels, pointers, ptr, ptr1, ptr2, redunds, rels, rep,
          rep1, rep2, tietze, tree, treelength, treeNums;

    if T.printLevel >= 3 then  Print( "#I  handling short relators\n" );  fi;

    # check the given argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;
    tietze := T.tietze;

    gens := tietze[TZ_GENERATORS];
    invs := tietze[TZ_INVERSES];
    rels := tietze[TZ_RELATORS];
    lengths := tietze[TZ_LENGTHS];
    flags := tietze[TZ_FLAGS];
    numgens := tietze[TZ_NUMGENS];
    numrels := tietze[TZ_NUMRELS];
    redunds := tietze[TZ_NUMREDUNDS];
    numgens1 := numgens + 1;
    done := false;

    tree := 0;
    if IsBound( T.tree ) then
        tree := T.tree;
        treelength := tree[TR_TREELENGTH];
        pointers := tree[TR_TREEPOINTERS];
        treeNums := tree[TR_TREENUMS];
    fi;

    while not done do

        done := true;

        # loop over all relators and find those of length 1 or 2.
        for i in [ 1 .. numrels ] do
            length := lengths[i];
            if length <= 2 and length > 0 and flags[i] <= 2 then

                done := false;

                # find the current representative of the first factor.
                rep1 := rels[i][1];
                while invs[numgens1-rep1] <> rep1 do
                    rep1 := invs[numgens1-rep1];
                od;

                if length = 1 then

                    # handle a relator of length 1.
                    if rep1 <> 0 then
                        rep1 := AbsInt( rep1 );
                        invs[numgens1-rep1] := 0;
                        invs[numgens1+rep1] := 0;
                        if tree <> 0 then
                            ptr1 := AbsInt( treeNums[rep1] );
                            pointers[ptr1] := 0;
                            treeNums[rep1] := 0;
                        fi;
                        if T.printLevel >= 2 then
                            Print( "#I  eliminating ", gens[rep1],
                                " = IdWord\n" );
                        fi;
                        redunds := redunds + 1;
                    fi;
                else

                    # find the current representative of the second factor.
                    rep2 := rels[i][2];
                    while invs[numgens1-rep2] <> rep2 do
                        rep2 := invs[numgens1-rep2];
                    od;

                    # handle a relator of length 2.
                    if AbsInt( rep2 ) < AbsInt( rep1 ) then
                        rep := rep1;  rep1 := rep2;  rep2 := rep;
                    fi;
                    if rep1 < 0 then  rep1 := - rep1;  rep2 := - rep2;  fi;
                    if rep1 = 0 then

                        # the relator is in fact of length at most 1.
                        if rep2 <> 0 then
                            rep2 := AbsInt( rep2 );
                            invs[numgens1-rep2] := 0;
                            invs[numgens1+rep2] := 0;
                            if tree <> 0 then
                                ptr2 := AbsInt( treeNums[rep2] );
                                pointers[ptr2] := 0;
                                treeNums[rep2] := 0;
                            fi;
                            if T.printLevel >= 2 then
                                Print( "#I  eliminating ", gens[rep2],
                                    " = IdWord\n" );
                            fi;
                            redunds := redunds + 1;
                        fi;

                    elif rep1 <> - rep2 then

                        if invs[numgens1+rep1] < 0 and ( rep1 = rep2 or
                            invs[numgens1-rep2] = invs[numgens1+rep2] ) then
                            # make the relator a square relator, ...
                            rels[i][1] := rep1;  rels[i][2] := rep1;
                            # ... mark it appropriately, ...
                            flags[i] := 3;
                            # ... and mark rep1 to be an involution.
                            invs[numgens1+rep1] := rep1;
                        fi;

                        # handle a non-square relator of length 2.
                        if rep1 <> rep2 then
                            absrep2 := AbsInt( rep2 );
                            invs[numgens1-rep2] := invs[numgens1+rep1];
                            invs[numgens1+rep2] := rep1;
                            if tree <> 0 then

                                ptr1 := AbsInt( treeNums[rep1] );
                                ptr2 := AbsInt( treeNums[absrep2] );
                                if ptr2 < ptr1 then
                                    ptr := ptr2;
                                    if treeNums[rep1] * treeNums[absrep2]
                                        * rep2 > 0 then
                                        ptr := - ptr;
                                        treeNums[rep1] := ptr;
                                        pointers[ptr2] := treelength + rep1;
                                    fi;
                                    ptr2 := ptr1;
                                    ptr1 := AbsInt( ptr );
                                fi;
                                if rep2 > 0 then
                                    ptr1 := - ptr1;
                                fi;
                                pointers[ptr2] := ptr1;
                                treeNums[absrep2] := 0;
                            fi;
                            if T.printLevel >= 2 then
                                Print( "#I  eliminating ", gens[absrep2],
                                    " = " );
                                if rep2 > 0 then
                                    Print( TzWord( tietze,
                                        [ invs[numgens1+rep1] ] ), "\n" );
                                else
                                    Print( gens[rep1], "\n" );
                                fi;
                            fi;
                            redunds := redunds + 1;

                        fi;
                    fi;
                fi;
            fi;
        od;

        if not done then

            # for each generator determine its current representative.
            for i in [ 1 .. numgens ] do
                if invs[numgens1-i] <> i then
                    rep := invs[numgens1-i];
                    invs[numgens1-i] := invs[numgens1-rep];
                    invs[numgens1+i] := invs[numgens1+rep];
                fi;
            od;

            # perform the replacements.
            TzReplaceGens( tietze );
        fi;
    od;

    # tidy up the Tietze generators.
    tietze[TZ_NUMREDUNDS] := redunds;
    if redunds > 0 then  TzRemoveGenerators( T );  fi;

    # Print( "#I  total length = ", tietze[TZ_TOTAL], "\n" );
end;


#############################################################################
##
#F  TzMostFrequentPairs( <Tietze record>, <n> ) . . . .  occurrences of pairs
##
##  'TzMostFrequentPairs'  returns a list  describing the  n  most frequently
##  occurruing relator subwords of the form  g1 * g2,  where  g1  and  g2 are
##  different generators or their inverses.
##
TzMostFrequentPairs := function ( T, nmax )

    local gens, i, j, k, max, n, nmax, numgens, occlist, pairs, tietze;

    # check the first argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;

    # check the second argument.
    if not IsInt( nmax ) or nmax <= 0 then
        Error( "second argument must be a positive integer" );
    fi;

    # intialize some local variables.
    tietze := T.tietze;
    gens := tietze[TZ_GENERATORS];
    numgens := tietze[TZ_NUMGENS];
    occlist := 0 * [ 1 .. 4 * numgens ];
    pairs := [ ];
    n := 0;

    if nmax = 1 then
        max := 0;

        # find a pair [gen[i], gen[j]] of generators or inverse generators
        # such that the word gen[i] * gen[j] is a most often occurring
        # relator subword.
        for i in [ 1 .. numgens-1 ] do
            occlist := TzOccurrencesPairs( tietze, i, occlist );
            for j in [ i+1 .. numgens ] do
                for k in [ 1 .. 4 ] do
                    if occlist[(4-k)*numgens+j] >= max then
                        max := occlist[(4-k)*numgens+j];
                        pairs[1] := [ max, i, j, 4 - k ];
                        n := 1;
                    fi;
                od;
            od;
        od;

    else

        # compute a sorted list which for each word of the form
        # gen[i]^+-1 * gen[j]^+-1, with i  not equal to j, contains the
        # (negative) number of occurrences of that word as relator subword,
        # the (negative) two indices i and j, and a sign flag (the negative
        # values will make the list be sorted in reversed order).
        for i in [ 1 .. numgens-1] do
            occlist := TzOccurrencesPairs( tietze, i, occlist );
            for j in [ i+1 .. numgens ] do
                for k in [ 0 .. 3 ] do
                    if occlist[k*numgens+j] > 0 then
                        n := n + 1;
                        pairs[n] := [ - occlist[k*numgens+j], - i, - j, k ];
                    fi;
                od;
            od;
            if n > nmax then
                Sort( pairs );
                pairs := Sublist( pairs, [1..nmax] );
                n := nmax;
            fi;
        od;

        # sort the list, and then invert the negative entries.
        Sort( pairs );
        for i in [ 1 .. n ] do
            pairs[i][1] := - pairs[i][1];
            pairs[i][2] := - pairs[i][2];
            pairs[i][3] := - pairs[i][3];
        od;
    fi;

    return pairs;
end;


#############################################################################
##
#F  TzNewGenerator( <Tietze record> ) . . . . . . . . .  adds a new generator
##
##  'TzNewGenerator'  defines a  new  abstract generator  and adds it  to the
##  given presentation.
##
##  Let  i  be the smallest positive integer  which has not yet been used  as
##  a generator number  and for which no component  T.i  exists so far in the
##  given  Tietze record  T,  say.  A new abstract generator  _xi  is defined
##  and then added as component  T.i  to the given Tietze record.
##
TzNewGenerator := function ( T )

    local gen, gens, numgens, recfields, new, string, tietze;

    # check the argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "first argument must be a Tietze record" );
    fi;

    # get some local variables.
    tietze := T.tietze;
    gens := tietze[TZ_GENERATORS];
    numgens := tietze[TZ_NUMGENS];

    # determine the next free generator number.
    new := T.nextFree;
    recfields := RecFields( T );
    while String( new ) in recfields do  new := new + 1;  od;
    T.nextFree := new + 1;

    # define the new abstract generator.
    string := ConcatenationString( "_x", String( new ) );
    gen := AbstractGenerator( string );
    T.(String( new )) := gen;

    # add the new generator to the presentation.
    numgens := numgens + 1;
    gens[numgens] := gen;
    T.components[numgens] := new;
    tietze[TZ_NUMGENS] := numgens;
    tietze[TZ_INVERSES] := Concatenation( [numgens], tietze[TZ_INVERSES],
        [-numgens] );

    return gen;
end;


#############################################################################
##
#F  TzPrint( <Tietze record> [,<list>] ) . print internal Tietze presentation
##
##  'TzPrint'  prints the current generators and relators of the given Tietze
##  record in their  internal representation.  The optional  second parameter
##  can be  used  to specify  the numbers  of the  relators  to  be  printed.
##  Default: all relators are printed.
##
TzPrint := function ( arg )

    local gens, i, leng, lengths, list, numrels, rels, T, tietze;

    # check the first argument to be a Tietze record.
    T := arg[1];
    TzCheckRecord( T );

    # initialize the local variables.
    tietze := T.tietze;
    gens := tietze[TZ_GENERATORS];
    rels := tietze[TZ_RELATORS];
    numrels := tietze[TZ_NUMRELS];
    lengths := tietze[TZ_LENGTHS];

    # print the generators.
    if gens = [] then
        Print( "#I  there are no generators\n" );
    else
        Print( "#I  generators: ", gens, "\n" );
    fi;

    # if the relators list is empty, print an appropriate message.
    if numrels = 0 then
        Print( "#I  there are no relators\n" );
        return;
    fi;

    # else print the relators.
    Print( "#I  relators:\n" );
    if Length( arg ) = 1 then
        for i in [1 .. numrels] do
            Print( "#I  ", i, ".  ", lengths[i], "  ", rels[i], "\n" );
        od;
    else
        list := arg[2];
        for i in list do
            if 1 <= i and i <= numrels then
                Print( "#I  ", i, ".  ", lengths[i], "  ", rels[i], "\n" );
            fi;
        od;
    fi;
end;


#############################################################################
##
#F  TzPrintGenerators( <Tietze record> [,<list>] ) . . . . . print generators
##
##  'TzPrintGenerators'  prints the generators of the given  Tietze presenta-
##  tion together with the  number of their occurrences.  The optional second
##  parameter  can be used to specify  the numbers  of the  generators  to be
##  printed.  Default: all generators are printed.
##
TzPrintGenerators := function ( arg )

    local gens, i, invs, leng, list, max, min, num, numgens, occur, T,
          tietze;

    # check the first argument to be a Tietze record.
    T := arg[1];
    TzCheckRecord( T );

    # initailize some local variables.
    tietze := T.tietze;
    gens := tietze[TZ_GENERATORS];
    invs := tietze[TZ_INVERSES];
    numgens := tietze[TZ_NUMGENS];

    # if the generators list is empty, print an appropriate message.
    if numgens = 0 then
        Print( "#I  there are no generators\n" );
        return;
    fi;

    # else determine the list of generators to be printed.
    if Length( arg ) = 1 then
        list := [ 1 .. numgens ];
        min := 1;
        max := numgens;
    else
        # check the second argument to be a list.
        list := arg[2];
        if not ( IsList( list ) ) then
            Error( "second argument must be a list" );
        fi;
        if list = [] then  list := [ 0 ];  fi;
        leng := Length( list );

        if IsRange( list ) then
            min := Maximum( list[1], 1 );
            max := Minimum( list[leng], numgens );
            list := [ min .. max ];
        else
            min := Maximum( Minimum( list ), 1 );
            max := Minimum( Maximum( list ), numgens );
        fi;
    fi;

    if min = max then

        # determine the number of occurrences of the specified generator.
        occur := TzOccurrences( tietze, max );

        # print the generator.
        num := occur[1][1];
        if num = 1 then
            Print( "#I  ",max,".  ",gens[max],"   ",num," occurrence " );
        else
            Print( "#I  ",max,".  ",gens[max],"   ",num," occurrences" );
        fi;
        if invs[numgens+1+max] > 0 then  Print( "   involution" );  fi;
        Print( "\n" );

    elif min < max then

        # determine the number of occurrences for all generators.
        occur := TzOccurrences( tietze );

       # print the generators.
        for i in list do
            if 1 <= i and i <= numgens then
                num := occur[1][i];
                if num = 1 then
                    Print( "#I  ",i,".  ",gens[i],"   ",num," occurrence " );
                else
                    Print( "#I  ",i,".  ",gens[i],"   ",num," occurrences" );
                fi;
                if invs[numgens+1+i] > 0 then  Print( "   involution" );  fi;
                Print( "\n" );
            fi;
        od;
    fi;
end;


#############################################################################
##
#F  TzPrintLengths( <Tietze record> )  . . . . . . . .  print relator lengths
##
##  'TzPrintLengths'  prints  a list  of all  relator  lengths  of the  given
##  presentation record.
##
TzPrintLengths := function ( T )

    local tietze;

    # check the argument to be a Tietze record.
    TzCheckRecord( T );
    tietze := T.tietze;

    # print the list of relator lengths;
    Print( tietze[TZ_LENGTHS], "\n" );
end;


#############################################################################
##
#F  TzPrintOptions( <Tietze record> )  . . . . .  print Tietze record options
##
##  'TzPrintOptions'  prints the  components of a Tietze record,  suppressing
##  all those components  which are not options of the Tietze transformations
##  routines.
##

TzOptionNames := [ "eliminationsLimit", "expandLimit", "generatorsLimit",
    "lengthLimit", "loopLimit", "printLevel", "saveLimit",
    "searchSimultaneous" ];

TzRecordOps := rec();

TzRecordOps.Print := function ( T )
    local  len, i, nam, lst;
    len  := 0;
    for nam in RecFields( T )  do
        if nam in TzOptionNames  then
            if len < LengthString( nam )  then
                len := LengthString( nam );
            fi;
            lst := nam;
        fi;
    od;
    Print( "rec(\n" );
    for nam  in RecFields( T )  do
        if nam in TzOptionNames  then
            Print( PrintRecIndent, nam );
            for i  in [LengthString(nam)..len]  do
                Print( " " );
            od;
            Print( ":= ", T.(nam) );
            if nam <> lst  then  Print( ",\n" );  fi;
        fi;
    od;
    Print( " )" );
end;

TzPrintOptions := function ( T )

    local operations;

    # check the argument to be a Tietze record.
    TzCheckRecord( T );

    # Print all components of T which are options.
    if IsBound( T.operations )  then
        operations := T.operations;
    fi;
    T.operations := TzRecordOps;
    Print( T );
    if IsBound( operations )  then
        T.operations := operations;
    else
        Unbind( T.operations );
    fi;
    Print( "\n" );
end;


#############################################################################
##
#F  TzPrintPairs( <Tietze record> [,<n>] ) . . . . print occurrences of pairs
##
##  'TzPrintPairs'  prints the n most often occurring relator subwords of the
##  form  a * b,  where a and b are  different generators  or their inverses,
##  together with their numbers of occurrences. The default value of n is 10.
##  If n has been specified to be zero, then it is interpreted as "infinity".
##
TzPrintPairs := function ( arg )

    local geni, genj, gens, k, m, n, num, pairs, T, tietze;

    # check the first argument to be a Tietze record.
    T := arg[1];
    TzCheckRecord( T );

    # get the second argument.
    n := 10;
    if Length( arg ) > 1 then  n := arg[2];  fi;
    if not IsInt( n ) or n < 0 then
        Error( "second argument must be a positive integer" );
    fi;
    if n = 0 then  n := "infinity";  fi;

    # intialize the local variables.
    tietze := T.tietze;
    gens := tietze[TZ_GENERATORS];

    # determine the n most frequently occurring pairs.
    pairs := TzMostFrequentPairs( T, n );

    # print them.
    n := Length( pairs );
    for m in [ 1 .. n ] do
        num := pairs[m][1];
        k := pairs[m][4];
        geni := gens[pairs[m][2]];
        if k > 1 then  geni := geni^-1;  fi;
        genj := gens[pairs[m][3]];
        if k mod 2 = 1 then  genj := genj^-1;  fi;
        if num = 1 then  Print(
            "#I  ",m,".  ",num,"  occurrence  of  ",geni," * ",genj,"\n" );
        elif num > 1 then  Print(
            "#I  ",m,".  ",num,"  occurrences of  ",geni," * ",genj,"\n" );
        fi;
    od;
end;


#############################################################################
##
#F  TzPrintPresentation( <Tietze record> ) . . . . . . . . print presentation
##
##  'TzPrintGenerators'  prints the  generators and the  relators of a Tietze
##  presentation.
##
TzPrintPresentation := function ( T )

    # check the given argument to be a Tietze record.
    TzCheckRecord( T );

    # print the generators.
    Print( "#I  generators:\n" );
    TzPrintGenerators( T );

    # print the relators.
    Print( "#I  relators:\n" );
    TzPrintRelators( T );

    # print the status line.
    TzPrintStatus( T );
end;


#############################################################################
##
#F  TzPrintRelators( <Tietze record> [,<list>] ) . . . . . . . print relators
##
##  'TzPrintRelators'  prints the relators of the given  Tietze presentation.
##  The optional second parameter  can be used to specify the  numbers of the
##  relators to be printed.  Default: all relators are printed.
##
TzPrintRelators := function ( arg )

    local i, list, numrels, rels, T, tietze;

    # check the first argument to be a Tietze record.
    T := arg[1];
    TzCheckRecord( T );

    # initailize the local variables.
    tietze := T.tietze;
    rels := tietze[TZ_RELATORS];
    numrels := tietze[TZ_NUMRELS];

    # if the relators list is empty, print an appropriate message.
    if numrels = 0 then
        Print( "#I  there are no relators\n" );
        return;
    fi;

    # else print the relators.
    if Length( arg ) = 1 then
        for i in [1 .. numrels] do
            Print( "#I  ", i, ". ", TzWord( tietze, rels[i] ), "\n" );
        od;
    else
        list := arg[2];
        for i in list do
            if 1 <= i and i <= numrels then
                Print( "#I  ", i, ". ", TzWord( tietze, rels[i] ), "\n" );
            fi;
        od;
    fi;
end;


#############################################################################
##
#F  TzPrintStatus( <Tietze record> [, <norepeat> ] ) . . .  print status line
##
##  'TzPrintStatus'  prints the number of generators, the number of relators,
##  and the total length of all relators in the  Tietze  presentation  of the
##  given group.  If  "norepeat"  is specified as true,  then the printing is
##  suppressed if none of the three values has changed since the last call.
##
TzPrintStatus := function ( arg )

    local norepeat, numgens, numrels, status, T, tietze, total;

    # get the arguments.
    T := arg[1];
    norepeat := Length( arg ) > 1 and IsBool( arg[2] ) and arg[2];

    # check the first argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "first argument must be a Tietze record" );
    fi;
    tietze := T.tietze;
    total := tietze[TZ_TOTAL];

    # get number of generators and number of relators.
    numgens := tietze[TZ_NUMGENS] - tietze[TZ_NUMREDUNDS];
    numrels := tietze[TZ_NUMRELS];

    status := [ numgens, numrels, total ];
    if not ( status = tietze[TZ_STATUS] and norepeat ) then

        # print the Tietze status line.
        if IsBound( T.name ) then  Print( "#I  ", T.name, " has " );
        else Print( "#I  there are " );  fi;
        if status[1] = 1 then  Print( status[1], " generator" );
        else  Print( status[1], " generators" );  fi;
        if status[2] = 1 then  Print( " and ", status[2], " relator" );
        else  Print( " and ", status[2], " relators" );  fi;
        Print( " of total length ", status[3], "\n" );

        # save the new status.
        tietze[TZ_STATUS] := status;
    fi;
end;


#############################################################################
##
#F  TzRecoverFromFile( <Tietze record>, <name> ) . .  recover a Tietze record
#F                                              which has been read from file
##
##  'TzRecoverFromFile'  reconstructs the lists  T.tietze[TZ_GENERATORS]  and
##  T.generators  as well as the components of  T  which keep the generators,
##  where T is expected to be a Tietze record which has just been read from a
##  file to which it had been written by the 'Save' command. 
##
TzRecoverFromFile := function ( T, name )

    local comps, gens, i;

    # check the first argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "first argument must be a Tietze record" );
    fi;

    # check the Tietze record to be a legal save file image.
    if T.tietze[TZ_GENERATORS] <> 0 then
        Error( "Tietze record not from legal save file" );
    fi;

    # get some local variables.
    gens := T.generators;
    comps := T.components;

    # reconstruct the lists.
    for i in [ 1 .. Length( gens ) ] do
        gens[i] := AbstractGenerator( gens[i] );
        T.(String(comps[i])) := gens[i];
    od;
    T.tietze[TZ_GENERATORS] := gens;

    # print a message.
    Print( "#I  presentation record ", name, " read from file\n" );
end;


#############################################################################
##
#F  TzRemoveGenerators( <Tietze record> ) . . . . Remove redundant generators
##
##  'TzRemoveGenerators'   deletes  the   redundant  Tietze  generators   and
##  renumbers  the non-redundant ones  accordingly.  The redundant generators
##  are  assumed   to  be   marked   in  the   inverses  list   by  an  entry
##  invs[numgens+1-i] <> i.
##
TzRemoveGenerators := function ( T )

    local comps, gens, i, invs, j, numgens, numgens1, oldnumgens, pointers,
          redunds, tietze, tree, treelength, treeNums;

    if T.printLevel >= 3 then
        Print( "#I  renumbering the Tietze generators\n" );
    fi;

    # check the given argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;

    tietze := T.tietze;
    redunds := tietze[TZ_NUMREDUNDS];
    if redunds = 0 then  return;  fi;

    comps := T.components;
    gens := tietze[TZ_GENERATORS];
    invs := tietze[TZ_INVERSES];
    numgens := tietze[TZ_NUMGENS];
    numgens1 := numgens + 1;
    tree := 0;

    if IsBound( T.tree ) then

        tree := T.tree;
        treelength := tree[TR_TREELENGTH];
        treeNums := tree[TR_TREENUMS];
        pointers := tree[TR_TREEPOINTERS];

        # renumber the non-redundant generators in the relators.
        j := 0;
        for i in [ 1 .. numgens ] do
            if invs[numgens1-i] = i then
                j := j + 1;
                if j < i then
                    comps[j] := comps[i];
                    treeNums[j] := treeNums[i];
                    pointers[AbsInt(treeNums[j])] := treelength + j;
                    invs[numgens1-i] := j;
                    if invs[numgens1+i] > 0 then  invs[numgens1+i] := j;
                    else  invs[numgens1+i] := -j;  fi;
                fi;
            else
                Unbind( T.(String(comps[i])) );
                invs[numgens1-i] := 0;
                invs[numgens1+i] := 0;
            fi;
        od;

    else

        # renumber the non-redundant generators in the relators.
        j := 0;
        for i in [ 1 .. numgens ] do
            if invs[numgens1-i] = i then
                j := j + 1;
                if j < i then
                    comps[j] := comps[i];
                    invs[numgens1-i] := j;
                    if invs[numgens1+i] > 0 then  invs[numgens1+i] := j;
                    else  invs[numgens1+i] := -j;  fi;
                fi;
            else
                Unbind( T.(String(comps[i])) );
                invs[numgens1-i] := 0;
                invs[numgens1+i] := 0;
            fi;
        od;

    fi;

    if j <> numgens - redunds then
         Error( "This is a bug.  You should never get here.\n",
         "Please send a copy of your job to the GAP administrators.\n" );
    fi;
    TzRenumberGens( tietze );

    # update the generators list and the lists related to it.
    for i in [ 1 .. numgens ] do
        j := invs[numgens1-i];
        if j < i and j > 0 then
            gens[j] := gens[i];
            invs[numgens1-j] := j;
            invs[numgens1+j] := invs[numgens1+i];
        fi;
    od;
    j := numgens;
    numgens := numgens - redunds;
    tietze[TZ_INVERSES] :=
        Sublist( invs, [numgens1-numgens..numgens1+numgens] );
    while j > numgens do
        Unbind( gens[j] );
        Unbind( comps[j] );
        if tree <> 0 then  Unbind( treeNums[j] );  fi;
        j := j - 1;
    od;

    tietze[TZ_NUMGENS] := numgens;
    tietze[TZ_NUMREDUNDS] := 0;
end;


#############################################################################
##
#F  TzSearch( <Tietze record> ) . . . . . . .  search subwords and substitute
##
##  'TzSearch'  searches for  relator subwords  which in some  relator have a
##  complement of shorter length  and which occur in other relators, too, and
##  uses them to reduce these other relators.
##
TzSearch := function ( T )

    local altered, flags, i, flag, j, k, lastj, leng, lengths, lmax, loop,
          maxlen, modified, numrels, oldtotal, rels, save, simultan,
          simultanlimit, tietze;

    if T.printLevel >= 3 then  Print( "#I  searching subwords\n" );  fi;

    # check the given argument to be a Tietze record.
    TzCheckRecord( T );
    tietze := T.tietze;
    simultanlimit := T.searchSimultaneous;

    rels := tietze[TZ_RELATORS];
    lengths := tietze[TZ_LENGTHS];
    flags := tietze[TZ_FLAGS];
    tietze[TZ_MODIFIED] := false;
    save := T.saveLimit / 100;

    loop := tietze[TZ_TOTAL] > 0;  while loop do

        TzSort( T );
        numrels := tietze[TZ_NUMRELS];
        modified := false;
        oldtotal := tietze[TZ_TOTAL];

        # search subwords with shorter complements, and substitute.
        flag := 0;
        i := 1;
        while i < numrels do
            if flags[i] <= 1 and lengths[i] > 0 then
                leng := lengths[i];
                lmax := leng + (leng + 1) mod 2;
                if flag < flags[i] then  flag := flags[i];  fi;
                simultan := 1;
                j := i;
                lastj := 0;
                k := i + 1;
                while k <= numrels and lengths[k] <= lmax and
                    simultan < simultanlimit do
                    if flags[k] <= 1 and
                        ( lengths[k] = leng or lengths[k] = lmax ) then
                        lastj := j;
                        j := k;
                        simultan := simultan + 1;
                    fi;
                    k := k + 1;
                od;
                while k <= numrels and ( lengths[k] < leng or
                    flags[k] > 1 or flag = 0 and flags[k] = 0 ) do
                    k := k + 1;
                od;
                if k > numrels then  j := lastj;  fi;
                if i <= j then
                    altered := TzSearchC( tietze, i, j );
                    modified := modified or altered > 0;
                    i := j;
                fi;
            fi;
            i := i + 1;
        od;

        # reset the Tietze flags.
        for i in [ 1 .. numrels ] do
            if flags[i] = 1 or flags[i] = 2 then
                flags[i] := flags[i] - 1;
            fi;
        od;

        if modified then
            if tietze[TZ_TOTAL] < oldtotal then
                tietze[TZ_MODIFIED] := true;
                # handle relators of length 1 or 2.
                TzHandleLength1Or2Relators( T );
                # sort the relators and print the status line.
                TzSort( T );
                if T.printLevel >= 2 then  TzPrintStatus( T, true );  fi;
            fi;
        fi;

        loop := tietze[TZ_TOTAL] < oldtotal and tietze[TZ_TOTAL] > 0 and
                (oldtotal - tietze[TZ_TOTAL]) / oldtotal >= save;
    od;
end;


#############################################################################
##
#F  TzSearchEqual( <Tietze record> ) . . . .  search subwords of equal length
##
##  'TzSearchEqual'  searches  for  Tietze relator  subwords  which  in  some
##  relator  have a  complement of  equal length  and which  occur  in  other
##  relators, too, and uses them to modify these other relators.
##
TzSearchEqual := function ( T )

    local altered, equal, i, j, k, lastj, leng, lengths, modified, numrels,
          oldtotal, rels, simultan, simultanlimit, tietze;

    if T.printLevel >= 3 then
        Print( "#I  searching subwords of equal length\n" );
    fi;

    # check the given argument to be a Tietze record.
    TzCheckRecord( T );
    tietze := T.tietze;
    simultanlimit := T.searchSimultaneous;

    TzSort( T );

    rels := tietze[TZ_RELATORS];
    lengths := tietze[TZ_LENGTHS];
    numrels := tietze[TZ_NUMRELS];
    modified := false;
    oldtotal := tietze[TZ_TOTAL];
    equal := true;

    # substitute substrings by substrings of equal length.
    i := 1;
    while i < numrels do
        leng := lengths[i];
        if leng > 3 and leng mod 2 = 0 then
            simultan := 1;
            j := i;
            lastj := 0;
            k := i + 1;
            while k <= numrels and lengths[k] <= leng and
                simultan < simultanlimit do
                if lengths[k] = leng then
                    lastj := j;
                    j := k;
                    simultan := simultan + 1;
                fi;
                k := k + 1;
            od;
            while k <= numrels and lengths[k] < leng do
                k := k + 1;
            od;
            if k > numrels then  j := lastj;  fi;
            if i <= j then
                altered := TzSearchC( tietze, i, j, equal );
                modified := modified or altered > 0;
                i := j;
            fi;
        fi;
        i := i + 1;
    od;

    if modified then
        if tietze[TZ_TOTAL] < oldtotal then
            tietze[TZ_MODIFIED] := true;
            # handle relators of length 1 or 2.
            TzHandleLength1Or2Relators( T );
            # sort the relators and print the status line.
            TzSort( T );
            if T.printLevel >= 2 then  TzPrintStatus( T, true );  fi;
        fi;
    fi;
end;


#############################################################################
##
#F  TzSort( <Tietze record> ) . . . . . . . . . . . . . . . . . sort relators
##
##  'TzSort'  sorts the relators list of the given Tietze Record T, say, and,
##  in parallel, the search flags list.  Note:  All relators  of length 0 are
##  removed from the list.
##
##  The sorting algorithm used is the same as in the GAP function Sort.
##
TzSort := function ( T )

    if T.printLevel >= 3 then  Print( "#I  sorting the relators\n" );  fi;

    # check the given argument to be a Tietze record.
    if not ( IsBound( T.isTietze ) and T.isTietze ) then
        Error( "argument must be a Tietze record" );
    fi;

    if T.tietze[TZ_NUMRELS] > 1 then  TzSortC( T.tietze );  fi;
end;


#############################################################################
##
#F  TzSubstitute( <Tietze record> [, <n> [,<elim> ] ] ) . .  substitute a new
#F                                                                  generator
##
##  'TzSubstitute'  first determines the  n most frequently occurring relator
##  subwords of the form  g1 * g2,  where g1 and g2  are different generators
##  or their inverses,  and sorts them  by decreasing numbers of occurrences.
##  Let  a * b  be the  last word  in that list,  and let  i  be the smallest
##  positive integer for which there is no component  T.i so far in the given
##  Tietze record T, then 'TzSubstitute' adds to the given presentation a new
##  generator  T.i  and a new relator  T.i^-1 * a * b,  and it  replaces  all
##  occurrences of  a * b  in the relators by  T.i.  Finally,  if elim = 1 or
##  elim = 2, it eliminates the generator a or b, respectively.  Otherwise it
##  eliminates some generator  by just calling  subroutine 'TzEliminateGen1'.
##
##  The two arguments are optional. If they are specified, then n is expected
##  to be a positive integer,  and  elim  is expected to be  0, 1, or 2.  The
##  default values are n = 1 and elim = 0.
##

TzSubstitute := function ( arg )

    local elim, gen, i, invs, j, k, n, narg, numgens, pair, pairs,
          printlevel, T, tietze, word;

    # check the number of arguments.
    narg := Length( arg );
    if narg < 1 or narg > 3 then  Error(
       "usage: TzSubstitute( <Tietze record> [, <n> [, <elim> ] ] )" );
    fi;

    # check the first argument to be a Tietze record.
    T := arg[1];
    TzCheckRecord( T );

    # get the second argument, and check it to be a positive integer.
    n := 1;
    if narg >= 2 then
        n := arg[2];
        if not IsInt( n ) or n < 1 then
            Error( "second argument must be a positive integer" );
        fi;
    fi;

    # get the third argument, and check it to be 0,  1, or 2.
    elim := 0;
    if narg = 3 then
        elim := arg[3];
        if not IsInt( elim ) or elim < 0 or elim > 2 then
            Error( "third argument must be 0, 1, or 2" );
        fi;
    fi;

    # check the number of generators to be at least 2.
    tietze := T.tietze;
    numgens := tietze[TZ_NUMGENS];
    if numgens < 2 then  return;  fi;

    # initialize some local variables.
    printlevel := T.printLevel;
    invs := tietze[TZ_INVERSES];

    # determine the n most frequently occurring relator subwords of the form
    # g1 * g2, where g1 and g2 are different generators or their inverses,
    # and sort them  by decreasing numbers of occurrences.
    pairs := TzMostFrequentPairs( T, n );
    if Length( pairs ) < n then
        if narg > 1 and printlevel >= 1 then
            Print( "#I  TzSubstitute: second argument is out of range\n" );
        fi;
        return;
    fi;

    # get the nth pair [ a, b ], say, from the list.
    i := pairs[n][2];
    j := pairs[n][3];
    k := pairs[n][4];
    if k > 1 then  i := invs[numgens+1+i];  fi;
    if k mod 2 = 1 then  j := invs[numgens+1+j];  fi;
    pair := [i, j];

    # add the word a * b as a new generator.
    gen := TzNewGenerator( T );
    word := TzWord( tietze, pair );
    if T.printLevel >= 1 then  Print(
        "#I  substituting new generator ",gen," defined by ",word,"\n" );
    fi;
    AddRelator( T, gen^-1 * word );

    # replace all relator subwords of the form a * b by the new generator.
    T.printLevel := 0;
    TzSearch( T );
    T.printLevel := printlevel;

    #  eliminate a generator.
    if printlevel = 1 then  T.printLevel := 2;  fi;
    if elim > 0 then
        TzEliminateGen( T, AbsInt( pair[elim] ) );
    else
        TzEliminateGen1( T );
    fi;
    T.printLevel := printlevel;
    if tietze[TZ_MODIFIED] then  TzSearch( T );  fi;
    if tietze[TZ_NUMREDUNDS] > 0 then  TzRemoveGenerators( T );  fi;

    if T.printLevel >= 1 then  TzPrintStatus( T, true );  fi;
end;


#############################################################################
##
#F  TzSubstituteCyclicJoins( <Tietze record> ) . . common roots of generators
##
##  'TzSubstituteCyclicJoins'  tries to find pairs of  commuting generators a
##  and b, say, such that exponent(a) is prime to exponent(b).  For each such
##  pair, their product a * b is substituted as a new generator,  and a and b
##  are eliminated.
##
TzSubstituteCyclicJoins := function ( T )

    local exp, exp1, exp2, exponents, gen, gen2, gens, i, invs, lengths, n2,
          next, num, num1, num2, numgens, numrels, printlevel, rel, rels,
          tietze;

    # check the given argument to be a Tietze record.
    TzCheckRecord( T );

    if T.printLevel >= 3 then
        Print( "#I  substituting cyclic joins\n" );
    fi;

    # Try to find exponents for the generators.
    exponents := TzGeneratorExponents( T );
    tietze := T.tietze;
    tietze[TZ_MODIFIED] := false;

    if Sum( exponents ) = 0 then  return;  fi;

    # sort the relators by their lengths.
    TzSort( T );

    # initialize some local variables.
    gens := tietze[TZ_GENERATORS];
    numgens := tietze[TZ_NUMGENS];
    rels := tietze[TZ_RELATORS];
    numrels := tietze[TZ_NUMRELS];
    lengths := tietze[TZ_LENGTHS];
    invs := tietze[TZ_INVERSES];
    printlevel := T.printLevel;

    # Now work off all commutator relators of length 4.
    i := 1;
    while i <= numrels and lengths[i] <= 4 do

        rel := rels[i];
        if lengths[i] = 4 and rel[1] = invs[numgens+1+rel[3]] and
            rel[2] = invs[numgens+1+rel[4]] then

            # There is a commutator relator of the form [a,b]. Check if
            # there are also power relators of the form a^m or b^n.

            num1 := AbsInt( rel[1] );  exp1 := exponents[num1];
            num2 := AbsInt( rel[2] );  exp2 := exponents[num2];

            # If there are relators a^m and b^n with m prime to n, then
            # a = (a*b)^n,  b = (a*b)^m,  and  (a*b)^(m*n) = 1.  Hence we
            # may define a new generator g, say, by a*b together with the
            # two relations  a = g^n  and  b = g^m,  and then eliminate a
            # and b.  (Note that we can take a^-1 instead of a or b^-1
            # instead of b.)

            if exp1 > 0 and exp2 > 0 and GcdInt( exp1, exp2 ) = 1 then

                gen := TzNewGenerator( T );
                numgens := tietze[TZ_NUMGENS];
                invs := tietze[TZ_INVERSES];

                if printlevel >= 1 then
                    Print( "#I  substituting new generator ",gen,
                        " defined by ",gens[num1]*gens[num2],"\n" );
                fi;

                AddRelator( T, gens[num1] * gen^-exp2 );
                AddRelator( T, gens[num2] * gen^-exp1 );

                # save gens[num2] before eliminating gens[num1] because
                # its number may change.
                gen2 := gens[num2];
                if printlevel = 1 then  T.printLevel := 2;  fi;
                TzEliminate( T, gens[num1] );
                num2 := Position( gens, gen2 );
                TzEliminate( T, gens[num2] );
                T.printLevel := printlevel;
                numgens := tietze[TZ_NUMGENS];
                numrels := tietze[TZ_NUMRELS];
                invs := tietze[TZ_INVERSES];
                tietze[TZ_MODIFIED] := true;
                i := 0;
            fi;
        fi;
        i := i + 1;
    od;

    if tietze[TZ_MODIFIED] then
        # handle relators of length 1 or 2.
        TzHandleLength1Or2Relators( T );
        # sort the relators and print the status line.
        TzSort( T );
        if printlevel >= 1 then  TzPrintStatus( T, true );  fi;
    fi;
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


