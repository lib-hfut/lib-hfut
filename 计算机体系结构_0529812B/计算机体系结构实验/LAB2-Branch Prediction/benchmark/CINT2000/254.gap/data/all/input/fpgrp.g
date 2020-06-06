#############################################################################
##
#A  fpgrp.g                     GAP library                  Martin Schoenert
##
#H  @(#)$Id: fpgrp.g,v 3.23.1.13 1997/04/10 13:05:02 mschoene Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the  functions dealing with finitely presented groups.
##
#H  $Log: fpgrp.g,v $
#H  Revision 3.23.1.13  1997/04/10 13:05:02  mschoene
#H  fixed 'LowIndexSubgroups' for the case that a subgroup is given
#H
#H  Revision 3.23.1.12  1996/09/12 13:52:04  mschoene
#H  fixed handling of abelian invariants
#H
#H  Revision 3.23.1.11  1996/06/11 14:48:40  mschoene
#H  fixed '.preimage' to '.preImage'
#H
#H  Revision 3.23.1.10  1995/11/25  22:42:44  mschoene
#H  allowed list of names as only argument of 'FreeGroup' (3.28 -> 3.29)
#H
#H  Revision 3.23.1.9  1995/11/25  15:51:34  mschoene
#H  cleaned up the handling of involutory generators
#H
#H  Revision 3.23.1.8  1995/11/23  11:11:12  mschoene
#H  fixed 'LowIndexSubgroups' for the case that a subgroup is given
#H
#H  Revision 3.23.1.7  1995/04/19  13:31:35  werner
#H  fixed AbelianInvariants() to handle groups with no relators
#H
#H  Revision 3.23.1.6  1995/03/21  16:51:13  sam
#H  fixed 'FpGroupOps.\=' (suggested by Derek Holt)
#H
#H  Revision 3.23.1.5  1995/02/22  08:12:05  sam
#H  fixed 'IsPerfect' for f.p. groups
#H  (suggested by Derek Holt)
#H
#H  Revision 3.23.1.4  1994/10/10  08:34:35  fceller
#H  fixed 'CosetTableFpGroup' from crashing while processing 'IdWord'
#H
#H  Revision 3.23.1.3  1994/08/23  10:51:37  mschoene
#H  fixed 'LISFG' to include the generators of <H>
#H
#H  Revision 3.23.1.2  1994/08/22  11:07:16  vfelsch
#H  added a forgotten fi;
#H
#H  Revision 3.23.1.1  1994/08/22  09:45:53  vfelsch
#H  fixed CosetTableFpGroup for square relators
#H
#H  Revision 3.23  1994/06/06  11:14:07  mschoene
#H  fixed 'AbelianInvariants' for the case of more generators than relators
#H
#H  Revision 3.22  1994/05/27  08:23:33  vfelsch
#H  improved: Size method for monomial representation
#H
#H  Revision 3.21  1994/03/24  13:29:20  sam
#H  added 'LatticeSubgroups' (Error message)
#H
#H  Revision 3.20  1994/01/25  15:00:55  fceller
#H  added 'Exponent'
#H
#H  Revision 3.19  1994/01/17  16:55:04  sam
#H  changed the four '.operationSomething' components to be inside a nice
#H  record, added 'FpGroupOps.CharTable'
#H
#H  Revision 3.18  1993/07/30  09:27:02  martin
#H  changed the 'Size' method to use monomial representation
#H
#H  Revision 3.17  1993/07/26  06:54:46  martin
#H  added 'FGO.FactorGroup' and 'FGO.FactorGroupRelation'
#H
#H  Revision 3.16  1993/05/05  15:09:29  fceller
#H  added maximal limit for 'CosetTableFpGroup'
#H
#H  Revision 3.15  1993/03/23  19:26:03  martin
#H  added 'FpGroupOps.\='
#H
#H  Revision 3.14  1993/03/11  17:36:41  fceller
#H  fixed 'IsAbelian', added 'IsCentral', 'IsElementaryAbelian' and
#H  'IsTrivial'
#H
#H  Revision 3.13  1993/03/10  19:15:53  fceller
#H  added 'EuclideanQuotient', 'EuclideanRemainder' and 'QuotientRemainder'
#H
#H  Revision 3.12  1993/02/09  14:25:55  martin
#H  made undefined globals local
#H
#H  Revision 3.11  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.10  1992/12/03  12:57:43  fceller
#H  renamed 'IsEquivalent' to 'IsIdentical'
#H
#H  Revision 3.9  1992/10/07  08:43:30  martin
#H  fixed another minor problem in 'LowIndexSubgroupsFpGroup'
#H
#H  Revision 3.8  1992/10/02  17:38:39  martin
#H  added 'FpGroupOps.GroupHomomorphismByImages'
#H
#H  Revision 3.7  1992/10/02  17:20:33  martin
#H  fixed 'LowIndexSubgroupsFpGroup'
#H
#H  Revision 3.6  1992/10/02  17:14:30  martin
#H  added some information printing to 'CosetTableFpGroup'
#H
#H  Revision 3.5  1992/08/14  15:41:31  fceller
#H  'FpGroupOps.AbelianInvariants' now calls 'DiagonalizeMat'
#H  instead of 'ElementaryDivisorsMat'
#H
#H  Revision 3.4  1992/08/14  09:24:26  fceller
#H  replaced handle comparision by 'IsEquivalent'
#H
#H  Revision 3.3  1992/07/15  13:36:19  martin
#H  added packages "fpsgpres" and "fptietze"
#H
#H  Revision 3.2  1992/07/15  12:42:39  martin
#H  added 'RelsSortedByStartGens' and modified 'CosetTableFpGroup'
#H
#H  Revision 3.1  1992/04/07  19:41:42  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  InfoFpGroup?(...) . . . . . information function for the fp group package
##
if not IsBound(InfoFpGroup1)  then InfoFpGroup1 := Ignore;  fi;
if not IsBound(InfoFpGroup2)  then InfoFpGroup2 := Ignore;  fi;


#############################################################################
##
#F  FreeGroup( <rank> [, <name> ] ) . . . . . . . .  free group of given rank
##
FreeGroup := function ( arg )
    local   F,          # free group of rank <rank>, result
            gens,       # generators of <F>
            names,      # names of the generators
            i;          # loop variable

    # get and check the argument list
    if   Length( arg ) = 1  and IsInt( arg[1] )  then
        gens  := [];
        names := [];
        for i  in [1..arg[1]]  do
            names[i] := ConcatenationString( "f", ".", String(i) );
            gens[i]  := AbstractGenerator( names[i] );
        od;
    elif Length( arg ) = 2  and IsInt( arg[1] )  then
        gens  := [];
        names := [];
        for i  in [1..arg[1]]  do
            names[i] := ConcatenationString( arg[2], ".", String(i) );
            gens[i]  := AbstractGenerator( names[i] );
        od;
    elif 1 <= Length( arg )  and ForAll( arg, IsString )  then
        names := arg;
        gens  := [];
        for i  in [1..Length(arg)]  do
            gens[i]  := AbstractGenerator( names[i] );
        od;
    elif Length( arg ) = 1 and IsList( arg[1] ) then
        names := arg[1];
        gens  := [];
        for i in [ 1 .. Length( names ) ] do
          gens[i]:= AbstractGenerator( names[i] );
        od;
    else
        Error("usage: FreeGroup(<name1>,<name2>..) or FreeGroup(<rank>)");
    fi;

    # make the group
    F := Group( gens, IdWord );
    F.namesGenerators := names;

    # return the group
    return F;
end;


#############################################################################
##
#V  Words . . . . . . . . . . . . . . . . . . . . . . . . domain of all words
#V  WordsOps  . . . . . . . . . operations record for the domain of all words
##
Words                           := rec();
Words.isDomain                  := true;

Words.name                      := "Words";

Words.isFinite                  := false;
Words.size                      := "infinity";

Words.operations                := Copy( GroupElementsOps );
WordsOps                        := Words.operations;


#############################################################################
##
#F  WordsOps.\in( <g>, Words ) . membership test for the domain of all words
##
WordsOps.\in := function ( g, Words )
    return IsWord( g );
end;


#############################################################################
##
#F  IsFpGroup(<D>)  . . . . . . . . . . . . . is an object a fin. pres. group
##
IsFpGroup := function ( obj )
    return     IsRec( obj )
           and IsBound( obj.isFpGroup )  and obj.isFpGroup;
end;


#############################################################################
##
#F  WordsOps.Group  . . . . . . . . . . . . . . . . create a fin. pres. group
##
WordsOps.Group := function ( Words, gens, id )
    local   G;          # finitely presented group, result

    # check that all generators have length 1
    if not ForAll( gens, g -> LengthWord( g ) = 1 )  then
        Error("the generators must have length 1 (maybe use 'Subgroup')");
    fi;

    # let the default function do the main work
    G := GroupElementsOps.Group( Words, gens, id );

    # add the tag
    G.isFpGroup         := true;

    # add the operations record
    G.operations        := FpGroupOps;

    # return the group
    return G;
end;


#############################################################################
##
#V  FpGroupOps  . . . . . . . . . . . operations record for fin. pres. groups
##
##  create  an  error  message  for those  group  functions that  are not
##  working for finitely presented group.
##
FpGroupOps := Copy( GroupOps );

FpGroupOps.Centralizer := function(arg)
    Error( "this function will not work for finitely presented groups.\n",
           "Please use 'OperationCosetsFpGroup' in order to construct ",
    	   "an\nisomorphic permutation group" );
end;

FpGroupOps.Centre             := FpGroupOps.Centralizer;
FpGroupOps.Factorization      := FpGroupOps.Centralizer;
FpGroupOps.ConjugacyClasses   := FpGroupOps.Centralizer;


#############################################################################
##
#F  FpGroupOps.Subgroup(<G>,<gens>) .   make a subgroup of a fin. pres. group
##
FpGroupOps.Subgroup := function ( G, gens )
    local   S;          # subgroup, result

    # let the default function do the main work
    S := GroupOps.Subgroup( G, gens );

    # add the finitely presented groups tag
    S.isFpGroup := true;

    # add the finitely presented groups operations record
    S.operations := FpGroupOps;

    # return the subgroup
    return S;
end;


#############################################################################
##
#F  FpGroupOps.TrivialSubgroup(<G>) .  trivial subgroup of a fin. pres. group
##
FpGroupOps.TrivialSubgroup := function ( G )
    local   T;          # trivial subgroup of <G>, result

    # let the default function do the main work
    T := GroupOps.TrivialSubgroup( G );

    # remove the elements list
    Unbind( T.elements );

    # return the trivial subgroup
    return T;
end;


#############################################################################
##
#F  FpGroupOps.FactorGroup(<G>,<N>) . . . . . . . . . . . make a factor group
##
FpGroupOps.FactorGroup := function ( G, N )
    local   F,          # factor group, result
            gens,       # generators of factor group
            names,      # their names
            rels,       # relators of factor group
            rel,        # one relator
            i;          # loop variable

    # make the generators
    names := [];
    gens  := [];
    for i  in [1..Length(G.generators)]  do
        if IsBound( G.namesGenerators )  then
            names[i] := G.namesGenerators[i];
            gens[i]  := AbstractGenerator( names[i] );
        else
            names[i] := ConcatenationString( "g", ".", String(i) );
            gens[i]  := AbstractGenerator( names[i] );
        fi;
    od;

    # make the factor group
    F := Group( gens, IdWord );
    F.namesGenerators := names;

    # add the relators
    rels := [];
    if IsBound( G.relators )  then
        for rel  in G.relators  do
            Add( rels, MappedWord( rel, G.generators, F.generators ) );
        od;
    fi;
    for rel  in N.generators  do
        Add( rels, MappedWord( rel, G.generators, F.generators ) );
    od;
    F.relators := rels;

    # return the result
    return F;
end;


#############################################################################
##
#F  FpGroupOps.FactorGroupRelation(<G>,<N>) . . . . . . . make a factor group
##
FpGroupOps.FactorGroupRelation := function ( G, N )
    local   F,          # factor group, result
            gens,       # generators of factor group
            names,      # their names
            rels,       # relators of factor group
            rel,        # one relator
            i;          # loop variable

    # make the generators
    names := [];
    gens  := [];
    for i  in [1..Length(G.generators)]  do
        if IsBound( G.namesGenerators )  then
            names[i] := G.namesGenerators[i];
            gens[i]  := AbstractGenerator( names[i] );
        else
            names[i] := ConcatenationString( "g", ".", String(i) );
            gens[i]  := AbstractGenerator( names[i] );
        fi;
    od;

    # make the factor group
    F := Group( gens, IdWord );
    F.namesGenerators := names;

    # add the relators
    rels := [];
    if IsBound( G.relators )  then
        for rel  in G.relators  do
            Add( rels, MappedWord( rel, G.generators, F.generators ) );
        od;
    fi;
    for rel  in N  do
        Add( rels, MappedWord( rel, G.generators, F.generators ) );
    od;
    F.relators := rels;

    # return the result
    return F;
end;


#############################################################################
##
#F  RelatorRepresentatives(<rels>)   set of representatives of a list of rels
##
##  'RelatorRepresentatives' returns a set of  relators,  that  contains  for
##  each relator in the list <rels> its minimal cyclical  permutation  (which
##  is automatically cyclically reduced).
##
RelatorRepresentatives := function ( rels )
    local   reps, rel, cyc, min, i;

    reps := [];

    # loop over all nontrivial relators
    for rel in rels  do
        if rel <> IdWord  then

            # find the minimal cyclic permutation
            cyc := rel;
            min := cyc;
            for i  in [1..LengthWord(rel)-1]  do
                cyc := cyc ^ Subword(rel,i,i);
                if cyc    < min  then min := cyc;     fi;
                if cyc^-1 < min  then min := cyc^-1;  fi;
            od;

            # if the relator is new, add it to the representatives
            if not min in reps  then
                AddSet( reps, min );
            fi;

        fi;
    od;

    # return the representatives
    return reps;
end;


#############################################################################
##
#F  RelsSortedByStartGen(<gens>,<rels>,<table>)
#F                                         relators sorted by start generator
##
##  'RelsSortedByStartGen'  is a  subroutine of the  Felsch Todd-Coxeter  and
##  the  Reduced Reidemeister-Schreier  routines. It returns a list which for
##  each  generator or  inverse generator  contains a list  of all cyclically
##  reduced relators,  starting  with that element,  which can be obtained by
##  conjugating or inverting given relators.  The relators are represented as
##  lists of the coset table columns corresponding to the generators and,  in
##  addition, as lists of the respective column numbers.
##
RelsSortedByStartGen := function ( gens, rels, table )
    local   relsGen,                    # resulting list
            rel, cyc,                   # one relator and cyclic permutation
            length, extleng,            # length and extended length of rel
            base, base2,                # base length of rel
            gen,                        # one generator in rel
            nums, invnums,              # numbers list and inverse
            cols, invcols,              # columns list and inverse
            p, p1, p2,                  # positions of generators
            i, j, k;                    # loop variables

    # check that the table has the right number of columns
    if 2 * Length(gens) <> Length(table) then
        Error( "table length is inconsistent with number of generators" );
    fi;

    # check that involutory generators have identical table columns
    for i  in [ 1 .. Length(gens) ]  do
        if    (    (gens[i]^2 in rels or gens[i]^-2 in rels)
            and not IsIdentical( table[2*i-1], table[2*i] ))
           or (not (gens[i]^2 in rels or gens[i]^-2 in rels)
            and     IsIdentical( table[2*i-1], table[2*i] ))
        then
            Error( "table inconsistent with square relators" );
        fi;
    od;

    # initialize the list to be constructed
    relsGen := 0 * [ 1 .. 2*Length(gens) ];
    for i  in [ 1 .. Length(gens) ]  do
        relsGen[ 2*i-1 ] := [];
        if not IsIdentical( table[ 2*i-1 ], table[ 2*i ] )  then
            relsGen[ 2*i ] := [];
        else
            relsGen[ 2*i ] := relsGen[ 2*i-1 ];
        fi;
    od;

    # now loop over all parent group relators
    for rel  in rels  do

        # get the length and the basic length of relator rel
        length := LengthWord( rel );
        base := 1;
        cyc := rel ^ Subword( rel, base, base );
        while cyc <> rel do
            base := base + 1;
            cyc := cyc ^ Subword( rel, base, base );
        od;

        # ignore square relators
        if length <> 2 or base <> 1 then

            # initialize the columns and numbers lists corresponding to the
            # current relator
            base2 := 2 * base;
            extleng := 2 * ( base + length ) - 1;
            nums := 0 * [1 .. extleng];  invnums := 0 * [1 .. extleng];
            cols := 0 * [1 .. extleng];  invcols := 0 * [1 .. extleng];

            # compute the lists
            i := 0;  j := 1;  k := base2 + 3;
            while i < base do
                i := i + 1;  j := j + 2;  k := k - 2;
                gen := Subword( rel, i, i );
                p := Position( gens, gen );
                if p = false then
                    p := Position( gens, gen^-1 );
                    p1 := 2 * p;
                    p2 := 2 * p - 1;
                else
                    p1 := 2 * p - 1;
                    p2 := 2 * p;
                fi;
                nums[j]   := p1;         invnums[k-1] := p1;
                nums[j-1] := p2;         invnums[k]   := p2;
                cols[j]   := table[p1];  invcols[k-1] := table[p1];
                cols[j-1] := table[p2];  invcols[k]   := table[p2];
                Add( relsGen[p1], [ nums, cols, j ] );
                Add( relsGen[p2], [ invnums, invcols, k ] );
            od;

            while j < extleng do
                j := j + 1;
                nums[j] := nums[j-base2];  invnums[j] := invnums[j-base2];
                cols[j] := cols[j-base2];  invcols[j] := invcols[j-base2];
            od;

            nums[1] := length;          invnums[1] := length;
            cols[1] := 2 * length - 3;  invcols[1] := cols[1];
        fi;
    od;

    # return the list
    return relsGen;
end;


#############################################################################
##
#F  SortRelsSortedByStartGen(<relsGen>) sort the relators sorted by start gen
##
##  'SortRelsSortedByStartGen' sorts the relators lists  sorted  by  starting
##  generator to get better  results  of  the  Reduced  Reidemeister-Schreier
##  (this is not needed for the Felsch Todd-Coxeter).
##
SortRelsSortedByStartGen := function ( relsGen )
    local   less, list;

    # 'less' defines an ordering on the triples [ nums, cols, startpos ]
    less := function ( triple1, triple2 )
        local diff, i, k, nums1, nums2;

        if triple1[1][1] <> triple2[1][1] then
            return triple1[1][1] < triple2[1][1];
        fi;

        nums1 := triple1[1];  nums2 := triple2[1];
        i := triple1[3];
        diff := triple2[3] - i;
        k := i + nums1[1] + 2;
        while i < k do
            if nums1[i] <> nums2[i+diff] then
                return nums1[i] < nums2[i+diff];
            fi;
            i := i + 2;
        od;

        return false;
    end;

    # sort the resulting lists
    for list  in relsGen  do
        Sort( list, less );
    od;
end;


#############################################################################
##
#F  CosetTableFpGroup(<G>,<H>)  . . . . . . . . . . .  do a coset enumeration
##
##  'CosetTableFpGroup'   applies   a  Felsch  strategy   Todd-Coxeter  coset
##  enumeration to construct a coset table of H in G.
##
if not IsBound( CosetTableFpGroupDefaultLimit )  then
    CosetTableFpGroupDefaultLimit := 1000;
fi;
if not IsBound( CosetTableFpGroupDefaultMaxLimit )  then
    CosetTableFpGroupDefaultMaxLimit := 64000;
fi;

CosetTableFpGroup := function ( G, H )
    local   next,  prev,            # next and previous coset on lists
            firstFree,  lastFree,   # first and last free coset
            firstDef,   lastDef,    # first and last defined coset
            firstCoinc, lastCoinc,  # first and last coincidence coset
            table,                  # columns in the table for gens
            rels,                   # representatives of the relators
            relsGen,                # relators sorted by start generator
            subgroup,               # rows for the subgroup gens
            deductions,             # deduction queue
            i, gen, inv,            # loop variables for generator
            g,                      # loop variable for generator col
            rel,                    # loop variables for relation
            p, p1, p2,              # generator position numbers
            app,                    # arguments list for 'MakeConsequences'
            limit,                  # limit of the table
            maxlimit,               # maximal size of the table
            j,                      # integer variable
            length, length2,        # length of relator (times 2)
            cols,
            gen,
            nums,
            l,
            nrdef,                  # number of defined cosets
            nrmax,                  # maximal value of the above
            nrdel,                  # number of deleted cosets
            nrinf;                  # number for next information message

    # check the arguments
    if not IsParent(G)  or G <> Parent(H)  then
        Error( "<G> must be the parent group of <H>" );
    fi;
    if not IsBound(G.relators) or 0 = Length(G.relators)  then
        if 0 < Length(G.generators) and 0 = Length(H.generators)  then
     	    Error( "index of <H> in <G> is infinite" );
    	fi;
    fi;

    # check if the coset table is already available
    if IsBound( H.cosetTable ) then return H.cosetTable; fi;

    # give some information
    InfoFpGroup1( "#I  ", "CosetTableFpGroup called:\n" );
    InfoFpGroup2( "#I      defined deleted alive   maximal\n");
    nrdef := 1;
    nrmax := 1;
    nrdel := 0;
    nrinf := 1000;

    # initialize size of the table
    limit    := CosetTableFpGroupDefaultLimit;
    maxlimit := CosetTableFpGroupDefaultMaxLimit;

    # define one coset (1)
    firstDef  := 1;  lastDef  := 1;
    firstFree := 2;  lastFree := limit;

    # make the lists that link together all the cosets
    next := [2..limit+1];  next[1] := 0;  next[limit] := 0;
    prev := [0..limit-1];  prev[2] := 0;

    # compute the representatives for the relators
    rels := RelatorRepresentatives( G.relators );

    # make the columns for the generators
    table := [];
    for gen  in G.generators  do
        g := 0 * [1..limit];
        Add( table, g );
        if not (gen^2 in rels or gen^-2 in rels) then
            g := 0 * [1..limit];
        fi;
        Add( table, g );
    od;

    # make the rows for the relators and distribute over relsGen
    relsGen := RelsSortedByStartGen( G.generators, rels, table );

    # make the rows for the subgroup generators
    subgroup := [];
    for rel  in H.generators  do
        length := LengthWord( rel );
        length2 := 2 * length;
        nums := 0 * [1 .. length2];
        cols := 0 * [1 .. length2];

        # compute the lists.
        i := 0;  j := 0;
        while i < length do
            i := i + 1;  j := j + 2;
            gen := Subword( rel, i, i );
            p := Position( G.generators, gen );
            if p = false then
                p := Position( G.generators, gen^-1 );
                p1 := 2 * p;
                p2 := 2 * p - 1;
            else
                p1 := 2 * p - 1;
                p2 := 2 * p;
            fi;
            nums[j]   := p1;  cols[j]   := table[p1];
            nums[j-1] := p2;  cols[j-1] := table[p2];
        od;
        Add( subgroup, [ nums, cols ] );
    od;

    # add an empty deduction list
    deductions := [];

    # make the structure that is passed to 'MakeConsequences'
    app := [ table, next, prev, relsGen, subgroup ];

    # run over all the cosets
    while firstDef <> 0  do

        # run through all the rows and look for undefined entries
        for i  in [ 1 .. Length( table ) ]  do
            gen := table[i];

            if gen[firstDef] = 0  then

                inv := table[i + 2*(i mod 2) - 1];

                # if necessary expand the table
                if firstFree = 0  then
                    if 0 < maxlimit and  maxlimit <= limit  then
                        maxlimit := Maximum(maxlimit*2,limit*2);
                        Error( "the coset enumeration has defined more ",
                               "than ", limit, " cosets:\ntype 'return;' ",
                               "if you want to continue with a new limit ",
                               "of ", maxlimit, " cosets,\ntype 'quit;' ",
                               "if you want to quit the coset ",
                               "enumeration,\ntype 'maxlimit := 0; return;'",
                               " in order to continue without a limit,\n" );
                    fi;
                    next[2*limit] := 0;
                    prev[2*limit] := 2*limit-1;
                    for g  in table  do g[2*limit] := 0;  od;
                    for l  in [limit+2..2*limit-1]  do
                        next[l] := l+1;
                        prev[l] := l-1;
                        for g  in table  do g[l] := 0;  od;
                    od;
                    next[limit+1] := limit+2;
                    prev[limit+1] := 0;
                    for g  in table  do g[limit+1] := 0;  od;
                    firstFree := limit+1;
                    limit := 2*limit;
                    lastFree := limit;
                fi;

                # update the debugging information
                nrdef := nrdef + 1;
                if nrmax <= firstFree  then
                    nrmax := firstFree;
                fi;

                # define a new coset
                gen[firstDef]   := firstFree;
                inv[firstFree]  := firstDef;
                next[lastDef]   := firstFree;
                prev[firstFree] := lastDef;
                lastDef         := firstFree;
                firstFree       := next[firstFree];
                next[lastDef]   := 0;

                # set up the deduction queue and run over it until it's empty
                app[6] := firstFree;
                app[7] := lastFree;
                app[8] := firstDef;
                app[9] := lastDef;
                app[10] := i;
                app[11] := firstDef;
                nrdel := nrdel + MakeConsequences( app );
                firstFree := app[6];
                lastFree := app[7];
                firstDef := app[8];
                lastDef  := app[9];

                # give some information
                while nrinf <= nrdef+nrdel  do
                    InfoFpGroup2( "#I\t", nrdef, "\t", nrinf-nrdef, "\t",
                                          2*nrdef-nrinf, "\t", nrmax, "\n" );
                    nrinf := nrinf + 1000;
                od;

            fi;
        od;

        firstDef := next[firstDef];
    od;

    InfoFpGroup1( "#I\t", nrdef, "\t", nrdel, "\t",
                          nrdef-nrdel, "\t", nrmax, "\n" );

    # standardize the table
    StandardizeTable( table );

    # return the table
    H.cosetTable := table;
    return H.cosetTable;
end;


#############################################################################
##
#F  FpGroupOps.\in( <w>, <G> ) . . . . membership test for fin. pres. groups
##
FpGroupOps.\in := function ( w, H )
    local   G,          # parent of <H>
            g,          # one generator of <G>
            c,          # coset in tracing
            i;          # loop variable

    # handle trivial case first
    if not IsWord( w )  then
        return false;

    # handle the parent group by testing the letters of the word
    elif IsParent( H )  then
        for i  in [ 1 .. LengthWord( w ) ]  do
            g := Subword( w, i, i );
            if not g in H.generators  and not g^-1 in H.generators  then
                return false;
            fi;
        od;
        return true;

    # otherwise trace the word through the coset table
    else
        G := Parent( H );
        if not IsBound( H.cosetTable )  then
            H.cosetTable := CosetTableFpGroup( G, H );
        fi;
        c := 1;
        for i  in [ 1 .. LengthWord( w ) ]  do
            g := Subword( w, i, i );
            if g in G.generators  then
                c := H.cosetTable[ 2*Position(G.generators,g)-1 ][ c ];
            elif g^-1 in G.generators  then
                c := H.cosetTable[ 2*Position(G.generators,g^-1) ][ c ];
            else
                return false;
            fi;
        od;
        return c = 1;

    fi;

end;


#############################################################################
##
#F  FpGroupOps.\=(<G>,<H>)  . . . . . . . . . . . . . are two fp groups equal
##
FpGroupOps.\= := function ( G, H )
    local   isEql;

    # avoid calling 'IsFinite' as in 'GroupOps.\='
    if IsGroup( G )  then
        if IsGroup( H )  then
            isEql :=    G.generators = H.generators
                     or IsEqualSet( G.generators, H.generators )
                     or (ForAll( H.generators, gen -> gen in G )
                     and ForAll( G.generators, gen -> gen in H ) );
        elif IsCoset( H )  then
            isEql := G = H.group
                 and H.representative in G;
        elif IsDomain( H )  then
            isEql := DomainOps.\=( G, H );
        else
            isEql := false;
        fi;
    elif IsCoset( G )  then
        if IsGroup( H )  then
            isEql := G.group = H
                 and G.representative in H;
        else
            isEql := DomainOps.\=( G, H );
        fi;
    elif IsDomain( G )  then
        isEql := DomainOps.\=( G, H );
    else
        isEql := false;
    fi;
    return isEql;

end;

#############################################################################
##
#F  FpGroupOps.IsPerfect( <G> ) . . . . . . . . .  test if a group is perfect
##
FpGroupOps.IsPerfect := function ( G )
    return Length(AbelianInvariants(CommutatorFactorGroup(G)))=0;
end;


#############################################################################
##
#F  FpGroupOps.IsSubset(<G>,<H>)  . . . . is one fp group a subset of another
##
FpGroupOps.IsSubset := function ( G, H )
    local   isSub;

    # avoid calling 'IsFinite' as in 'GroupOps.IsSubset'
    if IsGroup( G )  then
        if IsGroup( H )  then
            isSub :=    G.generators = H.generators
                     or IsSubsetSet( G.generators, H.generators )
                     or (IsBound( H.parent ) and G = H.parent)
                     or ForAll( H.generators, gen -> gen in G );
        elif IsCoset( H )  then
            isSub := IsSubset( G, H.group )
                 and H.representative in G;
        else
            isSub := DomainOps.IsSubset( G, H );
        fi;
    elif IsCoset( G )  then
        if IsGroup( H )  then
            isSub := H.identity in G
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
#F  FpGroupOps.Size(<G>)  . . . . . . . . . . . .  size of a fin. pres. group
##
FpGroupOps.Size := function ( G )
    local   H, T;

    # handle free and trivial group
    if 0 = Length(G.generators)  then
    	return 1;
    elif IsParent(G)  and not IsBound(G.relators)  then
        return "infinity";
    elif IsParent(G) and 0 = Length(G.relators)  then
    	return "infinity";

    # handle parent group by computing the index of the trivial subgroup
    elif IsParent(G)  then
        H := Subgroup( G, [ MostFrequentGeneratorFpGroup( G ) ] );
        T := AugmentedCosetTableMtc( G, H, -1, "_x" );
        if T.exponent = "infinity"  then
            return "infinity";
        else
            return H.index * T.exponent;
        fi;

    # handle other groups via 'Index'
    else
        return Size( Parent(G) ) / Index( Parent(G), G );
    fi;

end;


#############################################################################
##
#F  MostFrequentGeneratorFpGroup( <G> )  . . . . . .  most frequent generator
##
##  'MostFrequentGeneratorFpGroup'  returns the  first generator of the given
##  finitely  presented group  which occurs most frequently  in the relators.
##
MostFrequentGeneratorFpGroup := function ( G )

    local altered, gens, i, invs, max, j, num, numgens, numrels, occur,
          power, rel, rels, set, tietze;

    # check the first argument to be a finitely presented group.
    if not ( IsRec( G ) and IsBound( G.isFpGroup ) and G.isFpGroup ) then
        Error( "argument must be a finitely presented group" );
    fi;

    # Get some local variables.
    gens := G.generators;
    rels := G.relators;
    numgens := Length( gens );
    numrels := Length( rels );

    # Initialize a counter.
    occur := 0 * [ 1 .. numgens ];
    power := 0 * [ 1 .. numgens ];

    # Initialize a Tietze stack.
    tietze := 0 * [ 1 .. TZ_LENGTHTIETZE ];
    tietze[TZ_NUMGENS] := numgens;
    tietze[TZ_GENERATORS] := Copy( gens );
    invs := ( numgens + 1 ) - [ 1 .. 2 * numgens + 1 ];
    tietze[TZ_INVERSES] := invs;

    # convert the relators to vectors of generator numbers and count their
    # occurrences.
    for j in [ 1 .. numrels ] do
        rel := TzRelator( tietze, rels[j] );
        if rel = false then
            Error( "given relator is not a word in the group generators" );
        fi;
        for i in rel do
            if i > 0 then
                occur[i] := occur[i] + 1;
            else
                occur[-i] := occur[-i] + 1;
            fi;
        od;
        # check the current relator for being a power relator.
        set := Set( rel );
        if Length( set ) = 2 then
            num := [ 0, 0 ];
            for i in rel do
                if i = set[1] then num[1] := num[1] + 1;
                else num[2] := num[2] + 1; fi;
            od;
            if num[1] = 1 then
                power[AbsInt( set[2] )] := AbsInt( set[1] );
            elif num[2] = 1 then
                power[AbsInt( set[1] )] := AbsInt( set[2] );
            fi;
        fi;
    od;

    # increase the occurrences numbers of generators which are roots of
    # other ones, but avoid infinite loops.
    i := 1;
    altered := true;
    while altered do
        altered := false;
        for j in [ i .. numgens ] do
            if power[j] > 0 and power[power[j]] = 0 then
                occur[j] := occur[j] + occur[power[j]];
                power[j] := 0;
                altered := true;
                if i = j then i := i + 1; fi;
            fi;
        od;
    od;

    # find the most frequently occurring generator and return it.
    i := 1;
    max := occur[1];
    for j in [ 2 .. numgens ] do
        if occur[j] > max then
            i := j;
            max := occur[j];
        fi;
    od;
    return gens[i];
end;


#############################################################################
##
#F  FpGroupOps.Index(<G>,<H>) . . . . . . . . . . . . . .  index of subgroups
##
FpGroupOps.Index := function ( G, H )
    if IsParent( G )  then
        if not IsBound( H.cosetTable )  then
            H.cosetTable := CosetTableFpGroup( G, H );
        fi;
        return Length( H.cosetTable[1] );
    else
        return Index( Parent( H ), H ) / Index( Parent( G ), G );
    fi;
end;


#############################################################################
##
#F  FpGroupOps.Elements(<G>)  . . . . . . . .  elements of a fin. pres. group
##
FpGroupOps.Elements := function ( G )
    local   elms,       # elements of <G>, result
            table,      # coset table of <1> in <G>
            c,          # one coset in of <1> in <G>
            i, k, l;    # loop variables

    # handle parent groups
    if IsParent( G )  then
        if Size( G ) = "infinity"  then
            Error("sorry cannot list the elements of the free group <G>");
        fi;
        table := CosetTableFpGroup( G, TrivialSubgroup(G) );
        elms := [ IdWord ];
        for i  in [ 2 .. Length( table[1] ) ]  do
            k := 1;
            for l  in [ 2 .. Length( G.generators ) ]  do
                if table[ 2*l ][ i ] < table[ 2*k ][ i ]  then
                    k := l;
                fi;
            od;
            Add( elms, elms[ table[ 2*k ][ i ] ] * G.generators[ k ] );
        od;
        return elms;

    # otherwise
    else
        elms := Filtered( Elements( Parent( G ) ), elm -> elm in G );
        return elms;
    fi;

end;


#############################################################################
##
#F  FpGroupOps.Exponent( <G> )  . . . . . . . . . . . . . . . exponent of <G>
##
FpGroupOps.Exponent := function( G )
    if IsBound(G.conjugacyClasses)  then
        return Lcm( List( G.conjugacyClasses, x -> Order( G, x ) ) );
    else
        return Lcm( List( Elements(G), x -> Order( G, x ) ) );
    fi;
end;


#############################################################################
##
#F  FpGroupOps.Intersection(<G>,<H>)  . intersection of two fin. pres. groups
##
FpGroupOps.Intersection := function ( G, H )
    local   I,          # intersection of <G> and <H>, result
            rels,       # representatives for the relators
            table,      # coset table for <I> in its parent
            nrcos,      # number of cosets of <I>
            tableG,     # coset table of <G>
            nrcosG,     # number of cosets of <G>
            tableH,     # coset table of <H>
            nrcosH,     # number of cosets of <H>
            nrgens,     # number of generators of the parent of <G> and <H>
            ren,        # if 'ren[<i>]' is 'nrcosH * <iG> + <iH>' then the
                        # coset <i> of <I> corresponds to the intersection
                        # of the pair of cosets <iG> of <G> and <iH> of <H>
            ner,        # the inverse mapping of 'ren'
            cos,        # coset loop variable
            gen,        # generator loop variable
            img;        # image of <cos> under <gen>

    # delegate exceptional case
    if Parent( G ) <> Parent( H )  then
        return DomainOps.Intersection( G, H );
    fi;

    # handle trivial cases
    if IsParent( G )  then
        return H;
    elif IsParent( H )  then
        return G;
    fi;

    # make sure both subgroups have a coset table
    if not IsBound( G.cosetTable )  then
        G.cosetTable := CosetTableFpGroup( Parent( G ), G );
    fi;
    tableG := G.cosetTable;
    nrcosG := Length( tableG[1] ) + 1;
    if not IsBound( H.cosetTable )  then
        H.cosetTable := CosetTableFpGroup( Parent( H ), H );
    fi;
    tableH := H.cosetTable;
    nrcosH := Length( tableH[1] ) + 1;

    # initialize the table for the intersection
    rels := RelatorRepresentatives( Parent( G ).relators );
    nrgens := Length( Parent( G ).generators );
    table := [];
    for gen  in [ 1 .. nrgens ]  do
        table[ 2*gen-1 ] := [];
        if     Parent( G ).generators[ gen ]^2  in rels
            or Parent( G ).generators[ gen ]^-2 in rels
        then
            table[ 2*gen ] := table[ 2*gen-1 ];
        else
            table[ 2*gen ] := [];
        fi;
    od;

    # set up the renumbering
    ren := 0 * [ 1 .. nrcosG * nrcosH ];
    ner := 0 * [ 1 .. nrcosG * nrcosH ];
    ren[ 1*nrcosH + 1 ] := 1;
    ner[ 1 ] := 1*nrcosH + 1;
    nrcos := 1;

    # the coset table for the intersection is the transitive component of 1
    # in the *tensored* permutation representation
    cos := 1;
    while cos <= nrcos  do

        # loop over all entries in this row
        for gen  in [ 1 .. nrgens ]  do

            # get the coset pair
            img := nrcosH * tableG[ 2*gen-1 ][ QuoInt( ner[ cos ], nrcosH ) ]
                          + tableH[ 2*gen-1 ][ ner[ cos ] mod nrcosH ];

            # if this pair is new give it the next available coset number
            if ren[ img ] = 0  then
                nrcos := nrcos + 1;
                ren[ img ] := nrcos;
                ner[ nrcos ] := img;
            fi;

            # and enter it into the coset table
            table[ 2*gen-1 ][ cos ] := ren[ img ];
            table[ 2*gen   ][ ren[ img ] ] := cos;

        od;

        cos := cos + 1;
    od;

    # now make the subgroup
    I := Subgroup( Parent( G ), GeneratorsCosetTable( Parent( G ), table ) );
    I.cosetTable := table;

    # and return it
    return I;
end;

GeneratorsCosetTable := function ( G, table )
    local   gens,               # generators for the subgroup
            rels,               # representatives for the relators
            relsGen,            # relators sorted by start generator
            deductions,         # deduction queue
            ded,                # index of current deduction in above
            nrdeds,             # current number of deductions in above
            nrgens,             # number of generators of <G>
            cos,                # loop variable for coset
            i, gen, inv,        # loop variables for generator
            g,                  # loop variable for generator col
            rel,                # loop variable for relation
            p, p1, p2,          # generator position numbers
            triple,             # loop variable for relators as triples
            app,                # arguments list for 'ApplyRel'
            x, y, c;

    nrgens := 2 * Length( G.generators ) + 1;
    gens := [];

    # make all entries in the table negative
    for cos  in [ 1 .. Length( table[1] ) ]  do
        for gen  in table  do
            if 0 < gen[cos]  then
                gen[cos] := -gen[cos];
            fi;
        od;
    od;

    # make the rows for the relators and distribute over relsGen
    rels := RelatorRepresentatives( G.relators );
    relsGen := RelsSortedByStartGen( G.generators, rels, table );

    # make the structure that is passed to 'ApplyRel'
    app := 0 * [ 1 .. 4 ];

    # run over all the cosets
    cos := 1;
    while cos <= Length( table[1] )  do

        # run through all the rows and look for undefined entries
        for i  in [1..Length(G.generators)]  do
            gen := table[2*i-1];

            if gen[cos] < 0  then

                inv := table[2*i];

                # make the Schreier generator for this entry
                x := IdWord;
                c := cos;
                while c <> 1  do
                    g := nrgens - 1;
                    y := nrgens - 1;
                    while 0 < g  do
                        if AbsInt(table[g][c]) <= AbsInt(table[y][c])  then
                            y := g;
                        fi;
                        g := g - 2;
                    od;
                    x := G.generators[ y/2 ] * x;
                    c := AbsInt(table[y][c]);
                od;
                x := x * G.generators[ i ];
                c := AbsInt( gen[ cos ] );
                while c <> 1  do
                    g := nrgens - 1;
                    y := nrgens - 1;
                    while 0 < g  do
                        if AbsInt(table[g][c]) <= AbsInt(table[y][c])  then
                            y := g;
                        fi;
                        g := g - 2;
                    od;
                    x := x * G.generators[ y/2 ]^-1;
                    c := AbsInt(table[y][c]);
                od;
                if x <> IdWord  then
                    Add( gens, x );
                fi;

                # define a new coset
                gen[cos]   := - gen[cos];
                inv[ gen[cos] ] := cos;

                # set up the deduction queue and run over it until it's empty
                deductions := [ [i,cos] ];
                nrdeds := 1;
                ded := 1;
                while ded <= nrdeds  do

                    # apply all relators that start with this generator
                    for triple in relsGen[deductions[ded][1]] do
                        app[1] := triple[3];
                        app[2] := deductions[ded][2];
                        app[3] := -1;
                        app[4] := app[2];
                        if ApplyRel( app, triple[2] ) then
                            triple[2][app[1]][app[2]] := app[4];
                            triple[2][app[3]][app[4]] := app[2];
                            nrdeds := nrdeds + 1;
                            deductions[nrdeds] := [triple[1][app[1]],app[2]];
                        fi;
                    od;

                    ded := ded + 1;
                od;

            fi;
        od;

        cos := cos + 1;
    od;

    # return the generators
    return gens;
end;


#############################################################################
##
#F  FpGroupOps.Order(<G>,<w>) . . . order of an element in a fin. pres. group
##
FpGroupOps.Order := function ( G, w )
    local   ord,        # order of <w>, result
            table,      # coset table of the trivial subgroup of <G>
            g,          # one generator of <G>
            c,          # coset in tracing
            i;          # loop variable

    # trace the word through the coset table of the identity until we hit 1
    G := Parent( G );
    if Size( G ) = "infinity"  then
      Error("sorry, cannot find the order of <w> in the infinite group <G>");
    fi;
    table := CosetTableFpGroup( G, TrivialSubgroup(G) );
    c := 1;
    ord := 0;
    repeat
        for i  in [ 1 .. LengthWord( w ) ]  do
            g := Subword( w, i, i );
            if g in G.generators  then
                c := table[ 2*Position(G.generators,g)-1 ][ c ];
            elif g^-1 in G.generators  then
                c := table[ 2*Position(G.generators,g^-1) ][ c ];
            else
                Error("<w> must lie in <G>");
            fi;
        od;
        ord := ord + 1;
    until c = 1;
    return ord;

end;


#############################################################################
##
#F  FpGroupOps.Closure(<G>,<g>) . closure of a subgroup in a fin. pres. group
##
FpGroupOps.Closure := function ( G, w )
    local   C,          # closure of <G> and <w>, result
            g;          # one generator

    # closure with the parent
    if IsParent( G )  then
        return G;
    fi;

    # handle the closure of a subgroup with another subgroup
    if IsGroup( w )  then
        C := G;
        for g  in w.generators  do
            C := Closure( C, g );
        od;
        return C;
    fi;

    # if possible test if the element lies in the group already
    if IsBound( G.cosetTable )  and w in G  then
        return G;
    fi;

    # otherwise make a new group
    C := Subgroup( Parent( G ), Concatenation( G.generators, [ w ] ) );

    # return the closure
    return C;
end;


#############################################################################
##
#F  FpGroupOps.Normalizer(<G>,<H>)  . . . .  normalizer in a fin. pres. group
##
FpGroupOps.Normalizer := function ( G, H )
    local   N,          # normalizer of <H> in <G>, result
            table,      # coset table of <H> in its parent
            nrcos,      # number of cosets in the table
            nrgens,     # 2*(number of generators of <H>s parent)+1
            iseql,      # true if coset <c> normalizes <H>
            r, s,       # renumbering of the coset table and its inverse
            c, d, e,    # coset loop variables
            g, h;       # generator loop variables

    # handle the case the <H> is contained in <G>
    if IsParent( G )  or IsSubgroup( G, H )  then

        # first we need the coset table of <H>
        if not IsBound( H.cosetTable )  then
            H.cosetTable := CosetTableFpGroup( Parent( H ), H );
        fi;
        table := H.cosetTable;
        nrcos := Length( table[1] );
        nrgens := 2*Length( Parent(H).generators ) + 1;

        # find the cosets of <H> in its parent whose elements normalize <H>
        N := H;
        for c  in [ 2 .. nrcos ]  do

            # test if the renumbered table is equal to the original table
            r := 0 * [ 1 .. nrcos ];
            s := 0 * [ 1 .. nrcos ];
            r[c] := 1;  s[1] := c;
            e := 1;
            iseql := true;
            d := 1;
            while d <= nrcos  and iseql  do
                g := 1;
                while g < nrgens  and iseql  do
                    if r[ table[g][s[d]] ] = 0  then
                        e := e + 1;
                        r[ table[g][s[d]] ] := e;
                        s[ e ] := table[g][s[d]];
                    fi;
                    iseql := (r[ table[g][s[d]] ] = table[g][d]);
                    g := g + 2;
                od;
                d := d + 1;
            od;

            # add the representative of this coset if it normalizes
            if iseql  then
                r := IdWord;
                d := c;
                while d <> 1  do
                    g := nrgens - 1;
                    h := nrgens - 1;
                    while 0 < g  do
                        if table[g][d] <= table[h][d]  then
                            h := g;
                        fi;
                        g := g - 2;
                    od;
                    r := Parent( H ).generators[ h/2 ] * r;
                    d := table[h][d];
                od;
                if r in G  and not r in N  then
                    N := Closure( N, r );
                fi;
            fi;

        od;

    # delegate other cases
    else

        N := GroupOps.Normalizer( G, H );

    fi;

    # return the normalizer
    return N;
end;


#############################################################################
##
#F  FpGroupOps.IsAbelian( <G> ) . . . . test if a fin. pres. group is abelian
##
FpGroupOps.IsAbelian := function ( G )

    local   isAbelian,  # result
            g, h,       # two generators of <G>
            i, k,       # loop variables
    	    P;          # parent of <G>

    P := Parent(G);
    isAbelian := true;
    for i  in [ 1 .. Length( G.generators ) - 1 ]  do
        g := G.generators[i];
        for k  in [ i + 1 .. Length( G.generators ) ]  do
            h := G.generators[k];
            isAbelian :=     isAbelian
                         and (Comm( g, h ) in P.relators
                           or Comm( g, h ) in TrivialSubgroup(P));
        od;
    od;
    return isAbelian;

end;


#############################################################################
##
#F  FpGroupOps.IsCentral( <G>, <H> )  . . . test if <H> is centralized by <G>
##
FpGroupOps.IsCentral := function ( G, H )

    local   g, h,       # generators of <G> and <H>
    	    P,          # parent of <G> and <H>
    	    T;          # trivial subgroup

    P := Parent(G);
    T := TrivialSubgroup(G);
    for g  in G.generators  do
    	for h  in H.generators  do
    	    if not ( Comm(h,g) in P.relators or Comm(h,g) in T )  then
    	    	return false;
    	    fi;
    	od;
    od;

end;


#############################################################################
##
#F  FpGroupOps.IsElementaryAbelian( <G>, <H> )	. . test if <G> is elementary
##
FpGroupOps.IsElementaryAbelian := function ( G )

    local   p,          # a possible prime
    	    T;          # trivial subgroup

    if not IsAbelian(G)  then
    	return false;
    elif IsTrivial(G)  then
    	return false;
    elif not IsFinite(G)  then
    	return false;
    else
    	p := Order( G, G.generators[1] );
    	if not IsPrime(p)  then
    	    return false;
    	else
    	    T := TrivialSubgroup(G);
    	    return ForAll( G.generators, x -> x^p in T );
    	fi;
    fi;

end;


#############################################################################
##
#F  FpGroupOps.IsTrivial( <G> ) . . . . . . . . . . .  test if <G> is trivial
##
FpGroupOps.IsTrivial := function ( G )
    if 0 = Length(G.generators)  then
        return true;
    else
        return Size(G) = 1;
    fi;
end;


#############################################################################
##
#F  FpGroupOps.CommutatorFactorGroup( <G> ) . . . . . commutator factor group
#F                                                      of a fin. pres. group
##
FpGroupOps.CommutatorFactorGroup := function ( G )
    local   C,          # commutator factor group of <G>, result
            gens,       # generators of <C>
            rels,       # relators of <C>
            rel,        # one relation of <C>
            old,        # one relation of <G>
            g, h,       # two generators of <G> or <C>
            i, k;       # loop variables

    # we can handle only groups with relators
    if not IsParent( G )  then
        G := FpGroup( G );
    fi;

    # make a new set of generators
    gens := [];
    for i  in [ 1 .. Length( G.generators ) ]  do
        gens[i] := AbstractGenerator(
                        ConcatenationString( "c.", String( i ) )
                   );
    od;

    # make the relators
    rels := [];
    if IsBound(G.relators)  then
        for old  in G.relators  do
            rel := IdWord;
            for i  in [ 1 .. LengthWord( old ) ]  do
                g := Subword( old, i, i );
                if g in G.generators  then
                    rel := rel * gens[ Position( G.generators, g ) ];
                else
                    rel := rel * gens[ Position( G.generators, g^-1 ) ]^-1;
                fi;
            od;
            Add( rels, rel );
        od;
    fi;

    # add the commutator relators
    for i  in [ 1 .. Length( gens ) - 1 ]  do
        g := gens[i];
        for k  in [ i + 1 .. Length( gens ) ]  do
            h := gens[k];
            if not Comm( g, h ) in rels  then
                Add( rels, Comm( g, h ) );
            fi;
        od;
    od;

    # make the commutator factor group and return it
    C := Group( gens, IdWord );
    C.relators := rels;
    C.isAbelian := true;
    return C;
end;


#############################################################################
##
#F  FpGroupOps.AbelianInvariants(<G>) . . .  abelian invariants of an abelian
#F                                                           fin. pres. group
##
FpGroupOps.AbelianInvariants := function ( G )
    local   mat,        # relation matrix of <G>
            row,        # one row of <mat>
            rel,        # one relation of <G>
            g,          # one letter of <rel>
            p,          # position of <g> or its inverse in '<G>.generators'
            i;          # loop variable
    
    # If G is a subgroup of a finitely presented group, find a
    # presentation for G first. 
    if not IsParent( G )  then 
        G := FpGroup( G );
    fi;
    
    # handle groups with no relators
    if not IsBound(G.relators) or Length( G.relators ) = 0 then
        return [1..Length(G.generators)] * 0;
    fi;
    
    # make the relation matrix
    mat := [];
    for rel  in G.relators  do
        row := [];
        for i  in [ 1 .. Length( G.generators ) ]  do
            row[i] := 0;
        od;
        for i  in [ 1 .. LengthWord( rel ) ]  do
            g := Subword( rel, i, i );
            p := Position( G.generators, g );
            if p <> false  then
                row[ p ] := row[ p ] + 1;
            else
                p := Position( G.generators, g^-1 );
                row[ p ] := row[ p ] - 1;
            fi;
        od;
        Add( mat, row );
    od;

    # diagonalize the matrix
    DiagonalizeMat( mat );

    # return the abelian invariants
    return AbelianInvariantsOfList( DiagonalOfMat( mat ) );
end;


#############################################################################
##
#F  OperationCosetsFpGroup(<G>,<H>) . . . . . . . . . operation on the cosets
##
OperationCosetsFpGroup := function ( G, H )
    local   P,          # permutation group, result
            gens,       # generators of <P>
            i;          # loop variable

    # check the arguments
    if not IsParent( G )  or G <> Parent( H )  then
        Error("<G> must be the parent group of <H>");
    fi;

    # first we need the coset table of <H>
    if not IsBound( H.cosetTable )  then
        H.cosetTable := CosetTableFpGroup( G, H );
    fi;

    # now make the permutation group
    gens := [];
    for i  in [1..Length(H.cosetTable)/2]  do
        Add( gens, PermList( H.cosetTable[2*i-1] ) );
    od;
    P := Group( gens, () );
    P.operation := rec( structure  := G,
                        domain     := H,
                        operation  := "OperationCosetsFpGroup",
                        genimages  := gens );

    # return the permutation group
    return P;
end;


#############################################################################
##
#F  FpGroupOps.OperationHomomorphism(<G>,<P>) . . . .  operation homomorphism
#F                                            from a finitely presented group
##
FpGroupOps.OperationHomomorphism := function ( G, P )
    local   hom;
    if P.operation.operation = "OperationCosetsFpGroup"  then
        hom := GroupHomomorphismByImages( G, P,
                                      G.generators, P.operation.genimages );
        hom.isMapping := true;
    else
        hom := GroupOps.OperationsHomomorphism( G, P );
    fi;
    return hom;
end;


#############################################################################
##
#F  FpGroupOps.CharTable( <G> ) . . . . . . . . . . . . . . . character table
##
FpGroupOps.CharTable := function( G )

    local op,   # isomorphic permutation group
          hom;  # operation homomorphism from 'G' to 'op'

    # Compute an isomorphic permutation group.
    op:= OperationCosetsFpGroup( G, TrivialSubgroup( G ) );

    # Store the table of this group in 'G', and store 'G' in the table.
    G.charTable:= CharTable( op );
    G.charTable.group:= G;

    # Add the list of conjugacy classes to 'G'.
    hom:= OperationHomomorphism( G, op );
    G.conjugacyClasses:= List( op.conjugacyClasses,
                           x -> ConjugacyClass( G, PreImagesRepresentative(
                                                hom, x.representative ) ) );
    # Return the result.
    return G.charTable;

    end;

#############################################################################
##
#F  FpGroupOps.LatticeSubgroups( <G> )
##
FpGroupOps.LatticeSubgroups := function( G )
    Error( "this function will not work for finitely presented groups.\n",
           "Please use 'OperationCosetsFpGroup' in order to construct ",
    	   "an\nisomorphic permutation group" );
    end;

#############################################################################
##
#F  FpGroupOps.GroupHomomorphismByImages(<G>,<H>,<gens>,<imgs>) . . .  create
#F   a finitely presented group homomorphism by images of a generating system
##
FpGroupHomomorphismByImagesOps := Copy( GroupHomomorphismByImagesOps );

FpGroupOps.GroupHomomorphismByImages := function ( G, H, gens, imgs )
    local   hom;        # homomorphism from <G> to <H>, result

    # check that we can handle the situation
    if Set( gens ) <>  Set( G.generators )  then
        Error("arbitrary generating systems not yet allowed for fp groups");
    fi;

    # make the homomorphism
    hom := rec();
    hom.isGeneralMapping := true;
    hom.domain          := Mappings;

    # enter the identifying information
    hom.source          := G;
    hom.range           := H;
    hom.generators      := gens;
    hom.genimages       := imgs;

    # enter usefull information (precious little)
    if IsEqualSet( gens, G.generators )  then
        hom.preImage    := G;
    else
        hom.preImage    := Parent(G).operations.Subgroup( Parent(G), gens );
    fi;
    if IsSubsetSet( imgs, H.generators )  then
        hom.image       := H;
    else
        hom.image       := Parent(H).operations.Subgroup( Parent(H), imgs );
    fi;

    # enter the operations record
    hom.operations      := FpGroupHomomorphismByImagesOps;

    # return the homomorphism
    return hom;
end;

FpGroupHomomorphismByImagesOps.CoKernel := function ( hom )
    local   C;

    C := NormalClosure( hom.image,
                        Subgroup( Parent( hom.image ),
                                  List( hom.source.relators,
                                        rel -> MappedWord( rel,
                                                           hom.generators,
                                                           hom.genimages))));

    return C;
end;

FpGroupHomomorphismByImagesOps.IsMapping := function ( hom )
    return hom.source = hom.preImage
       and ForAll( hom.source.relators,
                   rel -> MappedWord( rel, hom.generators, hom.genimages )
                          = hom.range.identity );
end;

FpGroupHomomorphismByImagesOps.IsGroupHomomorphism := function ( hom )
    return IsMapping( hom );
end;

FpGroupHomomorphismByImagesOps.ImageElm := function ( hom, elm )
    if not IsMapping( hom )  then
        Error("<hom> must be a single valued mapping");
    fi;
    return MappedWord( elm, hom.generators, hom.genimages );
end;

FpGroupHomomorphismByImagesOps.ImagesElm := function ( hom, elm )
    if not IsBound( hom.coKernel )  then
        hom.coKernel := hom.operations.CoKernel( hom );
    fi;
    return hom.coKernel * MappedWord( elm, hom.generators, hom.genimages );
end;

FpGroupHomomorphismByImagesOps.ImagesSet := function ( hom, elms )
    if IsGroup( elms )  and IsSubset( hom.source, elms )  then
        if not IsBound( hom.coKernel )  then
            hom.coKernel := hom.operations.CoKernel( hom );
        fi;
        return Closure( hom.coKernel,
                        Parent( hom.range ).operations.Subgroup(
                                Parent( hom.range ),
                                List( elms.generators,
                                      gen -> MappedWord( gen,
                                                         hom.generators,
                                                         hom.genimages))));
    else
        return GroupHomomorphismOps.ImagesSet( hom, elms );
    fi;
end;

FpGroupHomomorphismByImagesOps.ImagesRepresentative := function ( hom, elm )
    return MappedWord( elm, hom.generators, hom.genimages );
end;

FpGroupHomomorphismByImagesOps.CompositionMapping := function ( hom1, hom2 )
    local   prd;        # product of <hom1> and <hom2>, result

    # product of a homomorphism by generator images
    if IsHomomorphism( hom2 )  and IsBound( hom2.genimages )  then

        # with another homomorphism
        if IsHomomorphism( hom1 )  then

            # just do it
            prd := GroupHomomorphismByImages(
                        hom2.source,
                        hom1.range,
                        hom2.generators,
                        List( hom2.genimages, img -> Image( hom1, img ) ) );

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

FpGroupHomomorphismByImagesOps.Print := function ( hom )
    Print( "GroupHomomorphismByImages( ",
           hom.source, ", ", hom.range, ", ",
           hom.generators, ", ", hom.genimages, " )" );
end;


#############################################################################
##
#F  IsIdenticalPresentationFpGroup( <G>, <H> )  . . . . .  check presentation
##
IsIdenticalPresentationFpGroup := function( G, H )
    local   rg,  rh;

    # <G> and <H> must be parents
    if not IsParent(G)  then
        Error( "<G> must be a parent" );
    fi;
    if not IsParent(G)  then
        Error( "<G> must be a parent" );
    fi;

    # check the number of gens and the presentation
    if Length(G.generators) <> Length(H.generators)  then
        return false;
    elif not IsBound(G.relators) and not IsBound(H.relators)  then
        return true;
    else
        rg := Set(G.relators);
        rh := Set(H.relators);
        return     Length(rg) = Length(rh)
               and rg = Set( List( rh, x -> MappedWord( x,
                   H.generators, G.generators ) ) );
    fi;

end;


#############################################################################
##
#F  LowIndexSubgroupsFpGroup(<G>,<index>) . find all subgroups of small index
#F                                                      in a fin. pres. group
##
LowIndexSubgroupsFpGroup := function ( G, H, index )
    local   subs,       # subgroups of <G>, result
            sub,        # one subgroup
            gens,       # generators of <sub>
            table,      # coset table
            nrgens,     # 2*(number of generators)+1
            nrcos,      # number of cosets in the coset table
            action,     # 'action[<i>]' is "definition" or "choice" or "ded"
            actgen,     # 'actgen[<i>]' is the gen where this action was
            actcos,     # 'actcos[<i>]' is the coset where this action was
            nract,      # number of actions
            nrded,      # number of deductions already handled
            coinc,      # 'true' if a coincidence happened
            gen,        # current generator
            cos,        # current coset
            rels,       # representatives for the relators
            relsGen,    # relators sorted by start generator
            subgroup,   # rows for the subgroup gens
            app,        # arguments list for 'ApplyRel'
            later,      # 'later[<i>]' is <> 0 if <i> is smaller than 1
            nrfix,      # index of a subgroup in its normalizer
            pair,       # loop variable for subgroup generators as pairs
            rel,        # loop variable for relators
            triple,     # loop variable for relators as triples
            r, s, x, y, # loop variables
            g, c, d,    # loop variables
            p, p1, p2,  # generator position numbers
            length,     # relator length
            length2,    # twice a relator length
            cols,
            gen,
            nums,
            done,
            i, j;       # loop variables

    # give some information
    InfoFpGroup1("#I  LowIndexSubgroupsFpGroup called\n");

    # check the arguments
    if not IsParent( G )  or G <> Parent( H )  then
        Error("<G> must be the parent group of <H>");
    fi;

    # initialize the subgroup list
    subs := [];

    # initialize table
    rels := RelatorRepresentatives( G.relators );
    nrgens := 2*Length(G.generators)+1;
    nrcos := 1;
    table := [];
    for gen  in G.generators  do
        g := 0*[1..index];
        Add( table, g );
        if not (gen^2 in rels or gen^-2 in rels) then
            g := 0*[1..index];
        fi;
        Add( table, g );
    od;

    # make the rows for the relators and distribute over relsGen
    relsGen := RelsSortedByStartGen( G.generators, rels, table );

    # make the rows for the subgroup generators
    subgroup := [];
    for rel  in H.generators  do
        length := LengthWord( rel );
        length2 := 2 * length;
        nums := 0 * [1 .. length2];
        cols := 0 * [1 .. length2];

        # compute the lists.
        i := 0;  j := 0;
        while i < length do
            i := i + 1;  j := j + 2;
            gen := Subword( rel, i, i );
            p := Position( G.generators, gen );
            if p = false then
                p := Position( G.generators, gen^-1 );
                p1 := 2 * p;
                p2 := 2 * p - 1;
            else
                p1 := 2 * p - 1;
                p2 := 2 * p;
            fi;
            nums[j]   := p1;  cols[j]   := table[p1];
            nums[j-1] := p2;  cols[j-1] := table[p2];
        od;
        Add( subgroup, [ nums, cols ] );
    od;

    # make an structure that is passed to 'ApplyRel'
    app := 0 * [ 1 .. 4 ];

    # set up the action stack
    nract := 1;
    action := [ "choice" ];
    gen := 1;
    actgen := [ gen ];
    cos := 1;
    actcos := [ cos ];

    # set up the lexicographical information list
    later := 0 * [1..index];

    # do an exhaustive backtrack search
    while 1 < nract  or table[1][1] < 2  do

        # find the next choice that does not already appear in this col.
        c := table[ gen ][ cos ];
        repeat
            c := c + 1;
        until index < c  or table[ gen+1 ][ c ] = 0;

        # if there is a further choice try it
        if action[nract] <> "definition"  and c <= index  then

            # remove the last choice from the table
            d := table[ gen ][ cos ];
            if d <> 0  then
                table[ gen+1 ][ d ] := 0;
            fi;

            # enter it in the table
            table[ gen ][ cos ] := c;
            table[ gen+1 ][ c ] := cos;

            # and put information on the action stack
            if c = nrcos + 1  then
                nrcos := nrcos + 1;
                action[ nract ] := "definition";
            else
                action[ nract ] := "choice";
            fi;

            # run through the deduction queue until it is empty
            nrded := nract;
            coinc := false;
            while nrded <= nract and not coinc  do

                # if there are still subgroup generators apply them
                for pair in subgroup  do
                    app[1] := 2;
                    app[2] := 1;
                    app[3] := Length(pair[2])-1;
                    app[4] := 1;
                    if ApplyRel( app, pair[2] )  then
                        if   pair[2][app[1]][app[2]] <> 0  then
                            coinc := true;
                        elif pair[2][app[3]][app[4]] <> 0  then
                            coinc := true;
                        else
                            pair[2][app[1]][app[2]] := app[4];
                            pair[2][app[3]][app[4]] := app[2];
                            nract := nract + 1;
                            action[ nract ] := "deduction";
                            actgen[ nract ] := pair[1][app[1]];
                            actcos[ nract ] := app[2];
                        fi;
                    fi;
                od;

                # apply all relators that start with this generator
                for triple in relsGen[actgen[nrded]]  do
                    app[1] := triple[3];
                    app[2] := actcos[ nrded ];
                    app[3] := -1;
                    app[4] := app[2];
                    if ApplyRel( app, triple[2] )  then
                        if   triple[2][app[1]][app[2]] <> 0  then
                            coinc := true;
                        elif triple[2][app[3]][app[4]] <> 0  then
                            coinc := true;
                        else
                            triple[2][app[1]][app[2]] := app[4];
                            triple[2][app[3]][app[4]] := app[2];
                            nract := nract + 1;
                            action[ nract ] := "deduction";
                            actgen[ nract ] := triple[1][app[1]];
                            actcos[ nract ] := app[2];
                        fi;
                    fi;
                od;

                nrded := nrded + 1;
            od;

            # unless there was a coincidence check lexicography
            nrfix := 1;
            for x  in [2..nrcos]  do

                # set up the renumbering
                r := 0 * [1..nrcos];
                s := 0 * [1..nrcos];
                r[x] := 1;  s[1] := x;

                # run through the old and the new table in parallel
                c := 1;  y := 1;
                done := coinc or later[x] <> 0;
                while c <= nrcos and not done  do

                    # get the corresponding coset for the new table
                    d := s[c];

                    # loop over the entries in this row
                    g := 1;
                    while g < nrgens and not done  do

                        # if either entry is missing, we cannot decide yet
                        if table[g][c] = 0  or table[g][d] = 0  then
                            done := true;

                        # if old and new contain defs, extend the renumbering
                        elif table[g][c] = y+1 and r[ table[g][d] ] = 0  then
                            y := y + 1;
                            r[ table[g][d] ] := y;
                            s[ y ] := table[g][d];

                        # if only new contains a def, old must be earlier
                        elif r[ table[g][d] ] = 0  then
                            later[x] := nract;
                            done := true;

                        # if olds entry is smaller, old must be earlier
                        elif table[g][c] < r[ table[g][d] ]  then
                            later[x] := nract;
                            done := true;

                        # if news entry is smaller, test if new contains sgr
                        elif r[ table[g][d] ] < table[g][c]  then

                            # test whether <x> fixes <H>
                            coinc := true;
                            for pair in subgroup  do
                                app[1] := 2;
                                app[2] := x;
                                app[3] := Length(pair[2])-1;
                                app[4] := x;
                                if ApplyRel( app, pair[2] )  then

                                    # coincidence: <x> does not fix <H>
                                    if   pair[2][app[1]][app[2]] <> 0  then
                                        later[x] := nract;
                                        coinc := false;
                                    elif pair[2][app[3]][app[4]] <> 0  then
                                        later[x] := nract;
                                        coinc := false;

                                    # non-closure (ded): <x> may not fix <H>
                                    else
                                        coinc := false;
                                    fi;

                                # non-closure (not ded): <x> may not fix <H>
                                elif app[1] <= app[3]  then
                                    coinc := false;
                                fi;

                            od;

                            done := true;

                        fi;

                        g := g + 2;
                    od;

                    c := c + 1;
                od;

                if c = nrcos + 1  then
                    nrfix := nrfix + 1;
                fi;

            od;

            # if there was no coincidence
            if not coinc  then

                # look for another empty place
                c := cos;
                g := gen;
                while c <= nrcos  and table[ g ][ c ] <> 0  do
                    g := g + 2;
                    if g = nrgens  then
                        c := c + 1;
                        g := 1;
                    fi;
                od;

                # if there is an empty place, make this a new choice point
                if c <= nrcos  then

                    nract := nract + 1;
                    action[ nract ] := "choice"; # necessary?
                    gen := g;
                    actgen[ nract ] := gen;
                    cos := c;
                    actcos[ nract ] := cos;
                    table[ gen ][ cos ] := 0; # necessary?

                # otherwise we found a subgroup
                else

                    # give some information
                    InfoFpGroup2( "#I   class ", Length(subs)+1,
                                  " of index ", nrcos,
                                  " and length ", nrcos / nrfix, "\n" );

                    # find a generating system for the subgroup
                    gens := ShallowCopy( H.generators );
                    for i  in [ 1 .. nract ]  do
                        if action[ i ] = "choice"  then
                            x := IdWord;
                            c := actcos[i];
                            while c <> 1  do
                                g := nrgens - 1;
                                y := nrgens - 1;
                                while 0 < g  do
                                    if table[g][c] <= table[y][c]  then
                                        y := g;
                                    fi;
                                    g := g - 2;
                                od;
                                x := G.generators[ y/2 ] * x;
                                c := table[y][c];
                            od;
                            x := x * G.generators[ (actgen[i]+1)/2 ];
                            c := table[ actgen[i] ][ actcos[i] ];
                            while c <> 1  do
                                g := nrgens - 1;
                                y := nrgens - 1;
                                while 0 < g  do
                                    if table[g][c] <= table[y][c]  then
                                        y := g;
                                    fi;
                                    g := g - 2;
                                od;
                                x := x * G.generators[ y/2 ]^-1;
                                c := table[y][c];
                            od;
                            Add( gens, x );
                        fi;
                    od;

                    # add the coset table
                    sub := Subgroup( Parent( G ), gens );
                    sub.cosetTable := [];
                    for g  in [ 1 .. Length( G.generators ) ]  do
                        sub.cosetTable[2*g-1]
                                := Sublist( table[2*g-1], [1..nrcos] );
                        if     G.generators[g]^2  in G.relators
                            or G.generators[g]^-2 in G.relators
                        then
                            sub.cosetTable[2*g]
                                := sub.cosetTable[2*g-1];
                        else
                            sub.cosetTable[2*g]
                                := Sublist( table[2*g], [1..nrcos] );
                        fi;
                    od;

                    # add this subgroup to the list of subgroups
                    #N  05-Feb-92 martin should be 'ConjugacyClassSubgroup'
                    Add( subs, sub );

                    # undo all deductions since the previous choice point
                    while action[ nract ] = "deduction"  do
                        g := actgen[ nract ];
                        c := actcos[ nract ];
                        d := table[ g ][ c ];
                        if g mod 2 = 1  then
                            table[ g   ][ c ] := 0;
                            table[ g+1 ][ d ] := 0;
                        else
                            table[ g   ][ c ] := 0;
                            table[ g-1 ][ d ] := 0;
                        fi;
                        nract := nract - 1;
                    od;
                    for x  in [2..index]  do
                        if nract <= later[x]  then
                            later[x] := 0;
                        fi;
                    od;

                fi;

            # if there was a coincendence go back to the current choice point
            else

                # undo all deductions since the previous choice point
                while action[ nract ] = "deduction"  do
                    g := actgen[ nract ];
                    c := actcos[ nract ];
                    d := table[ g ][ c ];
                    if g mod 2 = 1  then
                        table[ g   ][ c ] := 0;
                        table[ g+1 ][ d ] := 0;
                    else
                        table[ g   ][ c ] := 0;
                        table[ g-1 ][ d ] := 0;
                    fi;
                    nract := nract - 1;
                od;
                for x  in [2..index]  do
                    if nract <= later[x]  then
                        later[x] := 0;
                    fi;
                od;

            fi;

        # go back to the previous choice point if there are no more choices
        else

            # undo the choice point
            if action[ nract ] = "definition"  then
                nrcos := nrcos - 1;
            fi;
            g := actgen[ nract ];
            c := actcos[ nract ];
            d := table[ g ][ c ];
            if g mod 2 = 1  then
                table[ g   ][ c ] := 0;
                table[ g+1 ][ d ] := 0;
            else
                table[ g   ][ c ] := 0;
                table[ g-1 ][ d ] := 0;
            fi;
            nract := nract - 1;

            # undo all deductions since the previous choice point
            while action[ nract ] = "deduction"  do
                g := actgen[ nract ];
                c := actcos[ nract ];
                d := table[ g ][ c ];
                if g mod 2 = 1  then
                    table[ g   ][ c ] := 0;
                    table[ g+1 ][ d ] := 0;
                else
                    table[ g   ][ c ] := 0;
                    table[ g-1 ][ d ] := 0;
                fi;
                nract := nract - 1;
            od;
            for x  in [2..index]  do
                if nract <= later[x]  then
                    later[x] := 0;
                fi;
            od;

            cos := actcos[ nract ];
            gen := actgen[ nract ];

        fi;

    od;

    # give some final information
    InfoFpGroup1("#I  LowIndexSubgroupsFpGroup returns ",
                 Length(subs), " classes\n" );

    # return the subgroups
    return subs;
end;


#############################################################################
##
#R  Read  . . . . . . . . . . . . .  read other function from the other files
##
ReadLib( "fptietze" );
ReadLib( "fpsgpres" );


