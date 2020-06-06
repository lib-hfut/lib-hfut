#############################################################################
##
#A  grplatt.g                   GAP library                  Martin Schoenert
#A                                                            & Juergen Mnich
##
#H  @(#)$Id: grplatt.g,v 3.18.1.1 1994/08/31 07:31:54 mschoene Rel $
##
#Y  Copyright (C)  1993,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the functions for conjugacy classes of subgroups.
##
#N  1994/05/10 mschoene 'IsomorphismPerfectGroup' should not call 'Elements'
#N  1994/05/17 mschoene replace 'ShallowCopyNoSC' with 'ShallowCopy'
#N                      when stabchains cannot be mutated any more
##
#H  $Log: grplatt.g,v $
#H  Revision 3.18.1.1  1994/08/31  07:31:54  mschoene
#H  added generic methods for 'ConjugacyClassesMaximalSubgroups', etc.
#H
#H  Revision 3.18  1994/06/14  06:21:10  vfelsch
#H  made output and manual consistent
#H
#H  Revision 3.17  1994/06/12  12:18:02  mschoene
#H  changed 'ShallowCopyNoSC' to also unbind '<S>.stabChain'
#H
#H  Revision 3.16  1994/05/19  14:22:58  mschoene
#H  changed 'NormalSubgroups' back to use 'ShallowCopy'
#H
#H  Revision 3.15  1994/05/17  13:41:43  mschoene
#H  replaced 'ShallowCopy' with 'ShallowCopyNoSC'
#H
#H  Revision 3.14  1994/05/16  09:54:30  mschoene
#H  changed 'LatticeSubgroups' to throw away elements lists sooner
#H
#H  Revision 3.13  1994/05/11  13:59:08  mschoene
#H  changed 'MinimalSupergroups' etc. to avoid computing the elements of <G>
#H
#H  Revision 3.12  1994/05/10  12:30:18  mschoene
#H  added 'Zuppos' to compute the zuppos list without using 'Elements'
#H
#H  Revision 3.11  1994/05/06  12:27:01  mschoene
#H  changed 'ConjugacyClassSubgroupsOps' to remember the normalizer
#H
#H  Revision 3.10  1994/05/06  12:22:44  mschoene
#H  changed 'LatticeSubgroups' etc. to avoid sorting zuppos lists
#H
#H  Revision 3.9  1994/05/06  12:13:59  mschoene
#H  changed 'TableOfMarks' likewise
#H
#H  Revision 3.8  1994/05/06  12:09:42  mschoene
#H  changed 'PrintClassSubgroupLattice' likewise
#H
#H  Revision 3.7  1994/05/06  12:06:00  mschoene
#H  changed 'LatticeSubgroups' again to keep only vital information
#H
#H  Revision 3.6  1994/04/20  09:00:06  mschoene
#H  changed 'LatticeSubgroups' to keep only vital information
#H
#H  Revision 3.5  1994/04/18  09:13:30  mschoene
#H  fixed 'LatticeSubgroups'.  If a layer had no subgroups, it would unbind
#H  the last entry of 'classesZ', so 'Add' would add at the wrong place.
#H
#H  Revision 3.4  1994/02/25  11:40:40  sam
#H  added 'GroupOps.MaximalNormalSubgroups'
#H
#H  Revision 3.3  1994/02/02  10:15:36  sam
#H  moved some dispatchers to 'dispatch.g'
#H
#H  Revision 3.2  1993/07/30  11:13:57  martin
#H  changed 'Lattice' so that it can be applied to other domains
#H
#H  Revision 3.1  1993/07/29  21:44:40  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  InfoLattice?(...) . . . . . . . . . . . information functions for lattice
##
if not IsBound(InfoLattice1)  then InfoLattice1 := Ignore;  fi;
if not IsBound(InfoLattice2)  then InfoLattice2 := Ignore;  fi;

ShallowCopyNoSC := function ( G )
    local   S;
    S := ShallowCopy( G );
    Unbind( S.orbit );
    Unbind( S.transversal );
    Unbind( S.stabilizer );
    Unbind( S.stabChain );
    return S;
end;


#############################################################################
##
#F  IsConjugacyClassSubgroups(<C>)  . . . . . . . test for class of subgroups
##
IsConjugacyClassSubgroups := function ( C )
    return IsRec( C )
       and IsBound( C.isConjugacyClassSubgroups )
       and C.isConjugacyClassSubgroups;
end;


#############################################################################
##
#F  ConjugacyClassSubgroups(<G>,<H>)  . . . . . . create a class of subgroups
##
ConjugacyClassSubgroups := function ( G, H )

    # check the arguments
    if not IsGroup( G )  then
        Error("<G> must be a group");
    elif not IsSubgroup( G, H )  then
        Error("<H> must be a subgroup of <G>");
    fi;

    # create the class
    return G.operations.ConjugacyClassSubgroups( G, H );

end;

GroupOps.ConjugacyClassSubgroups := function ( G, H )
    local   C;

    # make the conjugacy class
    C := rec( );
    C.isDomain                  := true;
    C.isConjugacyClassSubgroups := true;

    # enter the identifying information
    C.group          := G;
    C.representative := H;

    # enter the operations record
    C.operations     := ConjugacyClassSubgroupsGroupOps;

    # return the conjugacy class
    return C;

end;


#############################################################################
##
#F  ConjugacyClassSubgroupsGroupOps . . . . . . operations record for classes
##
ConjugacyClassSubgroupsGroupOps := Copy( DomainOps );

ConjugacyClassSubgroupsGroupOps.Elements := function ( C )
    if not IsBound( C.normalizer )  then
        C.normalizer := Normalizer( C.group, C.representative );
    fi;
    return Set( List( RightTransversal( C.group, C.normalizer ),
                      t -> C.representative^t ) );
end;

ConjugacyClassSubgroupsGroupOps.Size := function ( C )
    if not IsBound( C.normalizer )  then
        C.normalizer := Normalizer( C.group, C.representative );
    fi;
    return Index( C.group, C.normalizer );
end;

ConjugacyClassSubgroupsGroupOps.\= := function ( C, D )
    local    isEql;
    if    IsRec( C )  and IsBound( C.isConjugacyClassSubgroups )
      and IsRec( D )  and IsBound( D.isConjugacyClassSubgroups )
      and C.group = D.group
    then
        isEql := Size( C ) = Size( D )
             and Size( C.representative ) = Size( D.representative )
             and RepresentativeOperation( C.group,
                                          D.representative,
                                          C.representative ) <> false;
    else
        isEql := DomainOps.\=( C, D );
    fi;
    return isEql;
end;

ConjugacyClassSubgroupsGroupOps.\in := function ( H, C )
    return Size( H ) = Size( C.representative )
       and RepresentativeOperation( C.group,
                                    H, C.representative ) <> false;
end;

ConjugacyClassSubgroupsGroupOps.Random := function ( C )
    return C.representative ^ Random( C.group );
end;

ConjugacyClassSubgroupsGroupOps.Print := function ( C )
    Print("ConjugacyClassSubgroups( ",C.group,", ",C.representative," )");
end;

ConjugacyClassGroupOps.\* := function ( C, D )
    if IsConjugacyClass( C )  then
        return Elements( C ) * D;
    elif IsConjugacyClass( D )  then
        return C * Elements( D );
    else
        Error("panic, neither <C> nor <D> is a class of subgroups");
    fi;
end;


#############################################################################
##
#F  GroupOps.ConjugacyClassesSubgroups(<G>) . classes of subgroups of a group
##
GroupOps.ConjugacyClassesSubgroups := function ( G )
    return LatticeSubgroups( G ).classes;
end;


#############################################################################
##
#F  GroupOps.Lattice(<G>) . . . . . . . . . . . . . . . .  lattice of a group
##
GroupOps.Lattice := function ( G )
    return LatticeSubgroups( G );
end;


#############################################################################
##
#F  GroupOps.LatticeSubgroups(<G>)  . . . . . . . . . .  lattice of subgroups
##
GroupOps.LatticeSubgroups := function ( G )
    local   lattice,            # lattice (result)
            factors,            # factorization of <G>'s size
            zuppos,             # generators of prime power order
            zupposPrime,        # corresponding prime
            zupposPower,        # index of power of generator
            nrClasses,          # number of classes
            classes,            # list of all classes
            classesZups,        # zuppos blist of classes
            classesExts,        # extend-by blist of classes
            perfect,            # classes of perfect subgroups of <G>
            perfectNew,         # this class of perfect subgroups is new
            perfectZups,        # zuppos blist of perfect subgroups
            layerb,             # begin of previous layer
            layere,             # end of previous layer
            H,                  # representative of a class
            Hzups,              # zuppos blist of <H>
            Hexts,              # extend blist of <H>
            C,                  # class of <I>
            I,                  # new subgroup found
            Ielms,              # elements of <I>
            Izups,              # zuppos blist of <I>
            Icopy,              # copy of <I>
            N,                  # normalizer of <I>
            Nzups,              # zuppos blist of <N>
            Ncopy,              # copy of <N>
            Jzups,              # zuppos of a conjugate of <I>
            Kzups,              # zuppos of a representative in <classes>
            reps,               # transversal of <N> in <G>
            h, i, k, l, r;      # loop variables

    # compute the factorized size of <G>
    factors := Factors( Size( G ) );

    # compute a system of generators for the cyclic sgr. of prime power size
    InfoLattice1( "#I  <G> has \c" );
    zuppos := Zuppos( G );
    InfoLattice1( Length(zuppos), " zuppos, \c" );

    # compute the prime corresponding to each zuppo and the index of power
    zupposPrime := [];
    zupposPower := [];
    for r  in zuppos  do
        i := SmallestRootInt( Order( G, r ) );
        Add( zupposPrime, i );
        k := 0;
        while k <> false  do
            k := k + 1;
            if GcdInt( i, k ) = 1  then
                l := Position( zuppos, r^(i*k) );
                if l <> false  then
                    Add( zupposPower, l );
                    k := false;
                fi;
            fi;
        od;
    od;
    InfoLattice1( "powers computed\n" );

    # get the perfect subgroups of <G>
    #N  1993/07/27 martin backward compatibility
    if IsBound( G.perfectSubgroups )  then
        perfect := G.perfectSubgroups;
    elif IsBound( G.representativesPerfectSubgroups )  then
        perfect := G.representativesPerfectSubgroups;
    elif IsBound( G.conjugacyClassesPerfectSubgroups )  then
        perfect := List(G.conjugacyClassesPerfectSubgroups,Representative);
    else
        perfect := RepresentativesPerfectSubgroups( ShallowCopyNoSC( G ) );
    fi;
    perfectZups := [];
    perfectNew  := [];
    for i  in [1..Length(perfect)]  do
        I := perfect[i];
        Icopy := ShallowCopyNoSC( I );
        I.size := Size( Icopy );
        perfectZups[i] := BlistList( zuppos, Elements( Icopy ) );
        perfectNew[i] := true;
    od;
    InfoLattice1( "#I  <G> has ", Length(perfect),
                  " representatives of perfect subgroups\n" );

    # initialize the classes list
    nrClasses := 1;
    classes    :=[ConjugacyClassSubgroups(G,TrivialSubgroup(G))];
    classesZups:=[BlistList(zuppos,[G.identity])];
    classesExts:=[DifferenceBlist(BlistList(zuppos,zuppos),classesZups[1])];
    layerb := 1;
    layere := 1;

    # loop over the layers of group (except the group itself)
    for l  in [1..Length(factors)-1]  do
        InfoLattice1( "#I  doing layer ", l, ", ",
                      "previous layer has ", layere-layerb+1, " classes\n" );

        # extend representatives of the classes of the previous layer
        for h  in [layerb..layere]  do

            # get the representative, its zuppos blist and extend-by blist
            InfoLattice2( "#I    extending subgroup ", h, ", \c" );
            H := classes[h].representative;
            Hzups := classesZups[h];
            Hexts := classesExts[h];
            InfoLattice2( "size = ", Size(H), "\n" );

            # loop over the zuppos whose <p>-th power lies in <H>
            for i  in [1..Length(zuppos)]  do
                if Hexts[i] and Hzups[zupposPower[i]]  then

                    # make the new subgroup <I>
                    I := Subgroup( Parent(G), Concatenation( H.generators,
                                                             [zuppos[i]] ) );
                    Icopy := ShallowCopyNoSC( I );
                    Icopy.size := Size( H ) * zupposPrime[i];
                    I.size := Size( Icopy );
                    InfoLattice2( "#I      found new class ",
                                  nrClasses+1, ", \c" );

                    # compute the zuppos blist of <I>
                    Ielms := Elements( Icopy );
                    Izups := BlistList( zuppos, Ielms );
                    InfoLattice2( "size = ", Size( I ), ", \c" );

                    # compute the normalizer of <I>
                    N := Normalizer( G, Icopy );
                    Ncopy := ShallowCopyNoSC( N );
                    N.size := Size( Ncopy );
                    if IsParent(G)  and not IsBound(I.normalizer)  then
                        I.normalizer := Subgroup( Parent(G), N.generators );
                        I.normalizer.size := Size( N );
                    fi;
                    InfoLattice2( "length = ", Size(G) / Size(N), ", \c" );

                    # make the new conjugacy class
                    C := ConjugacyClassSubgroups( G, I );
                    C.size := Size( G ) / Size( N );
                    C.normalizer := Subgroup( Parent(G), N.generators );
                    nrClasses := nrClasses + 1;
                    classes[nrClasses] := C;

                    # store the extend by list
                    if l < Length(factors)-1  then
                        classesZups[nrClasses] := Izups;
                        Nzups := BlistList( zuppos, Elements( Ncopy ) );
                        SubtractBlist( Nzups, Izups );
                        classesExts[nrClasses] := Nzups;
                    fi;

                    # compute the transversal
                    reps := RightTransversal( G, Ncopy );
                    Unbind( Icopy );
                    Unbind( Ncopy );
                    InfoLattice2( "tested \c" );

                    # loop over the conjugates of <I>
                    for r  in reps  do

                        # compute the zuppos blist of the conjugate
                        if r = G.identity  then
                            Jzups := Izups;
                        else
                            Jzups := BlistList( zuppos, OnTuples(Ielms,r) );
                        fi;

                        # loop over the already found classes
                        for k  in [h..layere]  do
                            Kzups := classesZups[k];

                            # test if the <K> is a subgroup of <J>
                            if IsSubsetBlist( Jzups, Kzups )  then

                                # don't extend <K> by the elements of <J>
                                SubtractBlist( classesExts[k], Jzups );

                            fi;

                        od;

                    od;

                    # now we are done with the new class
                    Unbind( Ielms );
                    Unbind( reps );
                    InfoLattice2( "inclusions\n" );

                fi; # if Hexts[i] and Hzups[zupposPower[i]]  then ...
            od; # for i  in [1..Length(zuppos)]  do ...

            # remove the stuff we don't need any more
            Unbind( classesZups[h] );
            Unbind( classesExts[h] );

        od; # for h  in [layerb..layere]  do ...

        # add the classes of perfect subgroups
        for i  in [1..Length(perfect)]  do
            if    perfectNew[i]
              and IsPerfect(perfect[i])
              and Length(Factors(Size(perfect[i]))) = l
            then

                # make the new subgroup <I>
                I := perfect[i];
                Icopy := ShallowCopyNoSC( I );
                I.size := Size( Icopy );
                InfoLattice2( "#I      found perfect class ",
                              nrClasses+1, ", \c" );

                # compute the zuppos blist of <I>
                Ielms := Elements( Icopy );
                Izups := BlistList( zuppos, Ielms );
                InfoLattice2( "size = ", Size( I ), ", \c" );

                # compute the normalizer of <I>
                N := Normalizer( G, Icopy );
                Ncopy := ShallowCopyNoSC( N );
                N.size := Size( Ncopy );
                if IsParent(G)  and not IsBound(I.normalizer)  then
                    I.normalizer := Subgroup( Parent(G), N.generators );
                    I.normalizer.size := Size( N );
                fi;
                InfoLattice2( "length = ", Size(G) / Size(N), ", \c" );

                # make the new conjugacy class
                C := ConjugacyClassSubgroups( G, I );
                C.size := Size( G ) / Size( N );
                C.normalizer := Subgroup( Parent(G), N.generators );
                nrClasses := nrClasses + 1;
                classes[nrClasses] := C;

                # store the extend by list
                if l < Length(factors)-1  then
                    classesZups[nrClasses] := Izups;
                    Nzups := BlistList( zuppos, Elements( Ncopy ) );
                    SubtractBlist( Nzups, Izups );
                    classesExts[nrClasses] := Nzups;
                fi;

                # compute the transversal
                reps := RightTransversal( G, Ncopy );
                Unbind( Icopy );
                Unbind( Ncopy );
                InfoLattice2( "tested \c" );

                # loop over the conjugates of <I>
                for r  in reps  do

                    # compute the zuppos blist of the conjugate
                    if r = G.identity  then
                        Jzups := Izups;
                    else
                        Jzups := BlistList( zuppos, OnTuples(Ielms,r) );
                    fi;

                    # loop over the perfect classes
                    for k  in [i+1..Length(perfect)]  do
                        Kzups := perfectZups[k];

                        # throw away classes that appear twice in perfect
                        if Jzups = Kzups  then
                            perfectNew[k] := false;
                            perfectZups[k] := [];
                        fi;

                    od;

                od;

                # now we are done with the new class
                Unbind( Ielms );
                Unbind( reps );
                InfoLattice2( "equalities \n" );

                # unbind the stuff we dont need any more
                perfectZups[i] := [];

            fi; # if IsPerfect(I) and Length(Factors(Size(I))) = layer the...
        od; # for i  in [1..Length(perfect)]  do

        # on to the next layer
        layerb := layere+1;
        layere := nrClasses;

    od; # for l  in [1..Length(factors)-1]  do ...

    # add the whole group to the list of classes
    InfoLattice1( "#I  doing layer ", Length(factors), ", ",
                  "previous layer has ", layere-layerb+1, " classes\n" );
    InfoLattice2( "#I      found whole group, ",
                  "size = ", Size(G), ", ", "length = 1\n" );
    C := ConjugacyClassSubgroups( G, G );
    C.size := 1;
    nrClasses := nrClasses + 1;
    classes[nrClasses] := C;

    # return the list of classes
    InfoLattice1( "#I  <G> has ", nrClasses, " classes, ",
                  "and ", Sum( classes, Size ), " subgroups\n" );

    # sort the classes
    Sort( classes,
                  function ( c, d )
                     return Size(Representative(c)) < Size(Representative(d))
                        or (Size(Representative(c)) = Size(Representative(d))
                            and Size(c) < Size(d));
                   end );

    # create the lattice
    lattice := rec();
    lattice.isLattice  := true;
    lattice.classes    := classes;
    lattice.group      := G;
    lattice.printLevel := 0;
    lattice.operations := LatticeSubgroupsOps;

    # return the lattice
    return lattice;
end;


#############################################################################
##
#V  LatticeSubgroupOps  . . . . . . . operations record for subgroup lattices
##
LatticeSubgroupsOps := rec();

LatticeSubgroupsOps.Print := function ( L )
    local   i;
    for i  in [1..Length(L.classes)]  do
        PrintClassSubgroupLattice( L, i );
    od;
    Print("LatticeSubgroups( ",L.group," )");
end;

LatticeSubgroupsOps.SetPrintLevel := function ( L, printLevel )
    L.printLevel := printLevel;
end;

PrintClassSubgroupLattice := function ( L, i )
    local   printStuff,         # determines what to print
            I,                  # representative of the <i>-th class
            N,                  # normalizer of <I> in <G>
            reps,               # transversal of <N> in <G>
            max,                # maximal subgroup identification
            min,                # minimal supergroup identification
            J,                  # conjugated maximal subgroup representative
            M,                  # normalizer of <J> in <G>
            reps2,              # transversal of <M> in <G>
            k, l;               # loop variables

    # get the actor
    I := L.classes[i].representative;

    # select which stuff to print
    if IsBound( L.printStuff )  then
        printStuff := L.printStuff;
    else
        if   not IsBound( L.printLevel )  or L.printLevel = 0  then
            printStuff := [];
        elif L.printLevel = 1  then
            printStuff := [ "class" ];
        elif L.printLevel = 2  then
            printStuff := [ "class", "rep", "repMax" ];
        elif L.printLevel = 3  then
            printStuff := [ "class", "rep", "repMax", "con" ];
        elif L.printLevel = 4  then
            printStuff := [ "class", "rep", "repMax",
                                     "con", "conMax" ];
        else
            printStuff := [ "class", "rep", "repMax", "repMin",
                                     "con", "conMax", "conMin" ];
        fi;
    fi;

    # print the class line
    if "class" in printStuff  then
        Print( "#I  class ",  i,         ", ",
                   "size ",   Size(I), ", ",
                   "length ", Size(L.classes[i]), "\n" );
    fi;

    # print the representative
    if "rep" in printStuff  then
        Print( "#I    representative ", I.generators, "\n" );
    fi;

    # print the maximals of the representative
    if "repMax" in printStuff  then
        Print( "#I      maximals \c" );
        for max  in L.operations.MaximalSubgroups( L )[i]  do
            Print( max, " \c" );
        od;
        Print( "\n" );
    fi;

    # print the minimals of the representative
    if "repMin" in printStuff  then
        Print("#I      minimals \c");
        for min  in L.operations.MinimalSupergroups( L )[i]  do
            Print( min, " \c" );
        od;
        Print( "\n" );
    fi;

    # loop over the conjugates
    if   "con"    in printStuff
      or "conMax" in printStuff
      or "conMin" in printStuff
    then

        # get the transversal
        N := Normalizer( L.group, ShallowCopyNoSC(I) );
        reps := RightTransversal( L.group, ShallowCopyNoSC(N) );
        for k  in [2..Length(reps)]  do

            # print the conjugate
            if "con"  in printStuff  then
                Print( "#I    conjugate ", k, " by ", reps[k], " ",
                       "is ", OnTuples(I.generators,reps[k]), "\n" );
            fi;

            # print the maximals of the conjugate
            if "conMax" in printStuff  then
                Print("#I      maximals \c");
                for max  in L.operations.MaximalSubgroups( L )[i]  do
                    J := L.classes[max[1]].representative;
                    M := Normalizer( L.group, ShallowCopyNoSC( J ) );
                    reps2 := RightTransversal( L.group, ShallowCopyNoSC(M) );
                    l := 1;
                    while not reps2[max[2]] * reps[k] / reps2[l] in M  do
                        l := l + 1;
                    od;
                    Print( [ max[1], l ], " \c" );
                od;
                Print( "\n" );
            fi;

            # print the minimals of the conjugate
            if "conMin" in printStuff  then
                Print("#I      minimals \c");
                for min in L.operations.MinimalSupergroups( L )[i]  do
                    J := L.classes[min[1]].representative;
                    M := Normalizer( L.group, ShallowCopyNoSC( J ) );
                    reps2 := RightTransversal( L.group, ShallowCopyNoSC(M) );
                    l := 1;
                    while not reps2[min[2]] * reps[k] / reps2[l] in M  do
                        l := l + 1;
                    od;
                    Print( [ min[1], l ], " \c" );
                od;
                Print( "\n" );
            fi;

        od;

    fi;
                  
end;

LatticeSubgroupsOps.MaximalSubgroups := function ( L )
    local   maximals,           # maximals as pair <class>, <conj> (result)
            maximalsZups,       # their zuppos blist
            cnt,                # count for information messages
            zuppos,             # generators of prime power order
            classes,            # list of all classes
            classesZups,        # zuppos blist of classes
            I,                  # representative of a class
            Ielms,              # elements of <I>
            Izups,              # zuppos blist of <I>
            Icopy,              # copy of <I>
            N,                  # normalizer of <I>
            Ncopy,              # copy of <N>
            Jzups,              # zuppos of a conjugate of <I>
            Kzups,              # zuppos of a representative in <classes>
            reps,               # transversal of <N> in <G>
            i, k, l, r;         # loop variables

    # maybe we know it already
    if IsBound( L.maximalSubgroups )  then
        return L.maximalSubgroups;
    fi;

    # compute the lattice, fetch the classes, zuppos, and representatives
    classes := L.classes;
    classesZups := [];

    # compute a system of generators for the cyclic sgr. of prime power size
    InfoLattice1( "#I  <G> has \c" );
    zuppos := Zuppos( L.group );
    InfoLattice1( Length(zuppos), " zuppos\n" );

    # initialize the maximals list
    InfoLattice1( "#I  computing maximal relationship\n" );
    maximals := List( classes, c -> [] );
    maximalsZups := List( classes, c -> [] );

    # find the minimal supergroups of the whole group
    InfoLattice2( "#I    testing class ", Length(classes), ", \c" );
    classesZups[Length(classes)] := BlistList( zuppos, zuppos );
    InfoLattice2( "size = ", Size(L.group), ", \c" );
    InfoLattice2( "length = 1, \c" );
    InfoLattice2( "included in 0 minimal subs\n" );

    # loop over all classes
    for i  in [Length(classes)-1,Length(classes)-2..1]  do

        # take the subgroup <I>
        I := classes[i].representative;
        Icopy := ShallowCopyNoSC( I );
        InfoLattice2( "#I    testing class ", i, ", \c" );

        # compute the zuppos blist of <I>
        Ielms := Elements( Icopy );
        Izups := BlistList( zuppos, Ielms );
        classesZups[i] := Izups;
        InfoLattice2( "size = ", Size(Icopy), ", \c" );

        # compute the normalizer of <I>
        N := Normalizer( L.group, Icopy );
        Ncopy := ShallowCopyNoSC( N );
        InfoLattice2( "length = ", Size(L.group) / Size(N), ", \c" );

        # compute the right transversal
        reps := RightTransversal( L.group, Ncopy );
        Unbind( Icopy );
        Unbind( Ncopy );
        InfoLattice2( "included in \c" );

        # initialize the counter
        cnt := 0;

        # loop over the conjugates of <I>
        for r  in [1..Length(reps)]  do

            # compute the zuppos blist of the conjugate
            if reps[r] = L.group.identity  then
                Jzups := Izups;
            else
                Jzups := BlistList( zuppos, OnTuples(Ielms,reps[r]) );
            fi;

            # loop over all other (larger classes)
            for k  in [i+1..Length(classes)]  do
                Kzups := classesZups[k];

                # test if the <K> is a minimal supergroup of <J>
                if    IsSubsetBlist( Kzups, Jzups )
                  and ForAll( maximalsZups[k],
                              zups -> not IsSubsetBlist(zups,Jzups) )
                then
                    Add( maximals[k], [ i, r ] );
                    Add( maximalsZups[k], Jzups );
                    cnt := cnt + 1;
                fi;

            od;

        od;

        # inform about the count
        Unbind( Ielms );
        Unbind( reps );
        InfoLattice2( cnt, " minimal sups\n" );

    od;

    # return the maximals list
    L.maximalSubgroups := maximals;
    return maximals;
end;

LatticeSubgroupsOps.MinimalSupergroups := function ( L )
    local   minimals,           # minimals as pair <class>, <conj> (result)
            minimalsZups,       # their zuppos blist
            cnt,                # count for information messages
            zuppos,             # generators of prime power order
            classes,            # list of all classes
            classesZups,        # zuppos blist of classes
            I,                  # representative of a class
            Ielms,              # elements of <I>
            Izups,              # zuppos blist of <I>
            Icopy,              # copy of <I>
            N,                  # normalizer of <I>
            Ncopy,              # copy of <N>
            Jzups,              # zuppos of a conjugate of <I>
            Kzups,              # zuppos of a representative in <classes>
            reps,               # transversal of <N> in <G>
            i, k, l, r;         # loop variables

    # maybe we know it already
    if IsBound( L.minimalSupergroups )  then
        return L.minimalSupergroups;
    fi;

    # compute the lattice, fetch the classes, zuppos, and representatives
    classes := L.classes;
    classesZups := [];

    # compute a system of generators for the cyclic sgr. of prime power size
    InfoLattice1( "#I  <G> has \c" );
    zuppos := Zuppos( L.group );
    InfoLattice1( Length(zuppos), " zuppos\n" );

    # initialize the minimals list
    InfoLattice1( "#I  computing minimal relationship\n" );
    minimals := List( classes, c -> [] );
    minimalsZups := List( classes, c -> [] );

    # loop over all classes
    for i  in [1..Length(classes)-1]  do

        # take the subgroup <I>
        I := classes[i].representative;
        Icopy := ShallowCopyNoSC( I );
        InfoLattice2( "#I    testing class ", i, ", \c" );

        # compute the zuppos blist of <I>
        Ielms := Elements( Icopy );
        Izups := BlistList( zuppos, Ielms );
        classesZups[i] := Izups;
        InfoLattice2( "size = ", Size(Icopy), ", \c" );

        # compute the normalizer of <I>
        N := Normalizer( L.group, Icopy );
        Ncopy := ShallowCopyNoSC( N );
        InfoLattice2( "length = ", Size(L.group) / Size(N), ", \c" );

        # compute the right transversal
        reps := RightTransversal( L.group, Ncopy );
        Unbind( Icopy );
        Unbind( Ncopy );
        InfoLattice2( "includes \c" );

        # initialize the counter
        cnt := 0;

        # loop over the conjugates of <I>
        for r  in [1..Length(reps)]  do

            # compute the zuppos blist of the conjugate
            if reps[r] = L.group.identity  then
                Jzups := Izups;
            else
                Jzups := BlistList( zuppos, OnTuples(Ielms,reps[r]) );
            fi;

            # loop over all other (smaller classes)
            for k  in [1..i-1]  do
                Kzups := classesZups[k];

                # test if the <K> is a maximal subgroup of <J>
                if    IsSubsetBlist( Jzups, Kzups )
                  and ForAll( minimalsZups[k],
                              zups -> not IsSubsetBlist(Jzups,zups) )
                then
                    Add( minimals[k], [ i, r ] );
                    Add( minimalsZups[k], Jzups );
                    cnt := cnt + 1;
                fi;

            od;

        od;

        # inform about the count
        Unbind( Ielms );
        Unbind( reps );
        InfoLattice2( cnt, " maximal subs\n" );

    od;

    # find the maximal subgroups of the whole group
    InfoLattice2( "#I    testing class ", Length(classes), ", \c" );
    InfoLattice2( "size = ", Size( L.group ), ", \c" );
    InfoLattice2( "length = 1, \c" );
    InfoLattice2( "includes \c" );
    cnt := 0;
    for k  in [1..Length(classes)-1]  do
        if minimals[k] = []  then
            Add( minimals[k], [ Length(classes), 1 ] );
            cnt := cnt + 1;
        fi;
    od;
    InfoLattice2( cnt, " maximal subs\n" );

    # return the minimals list
    L.minimalSupergroups := minimals;
    return minimals;
end;


#############################################################################
##
#F  GroupOps.ConjugacyClassesPerfectSubgroups(<G>)
##
##  'ConjugacyClassesPerfectSubgroups' returns   the  conjugacy  classes   of
##  perfect subgroups of the finite group <G>.
##
GroupOps.ConjugacyClassesPerfectSubgroups := function ( G )
    local   classes,            # classes, result
            rep;                # representative

    # compute the 
    classes := [];
    for rep  in RepresentativesPerfectSubgroups( G )  do
        if not ForAny( classes, c -> rep in c )  then
            Add( classes, ConjugacyClassSubgroups( G, rep ) );
        fi;
    od;

    # return the classes
    return classes;

end;


#############################################################################
##
#F  GroupOps.RepresentativesPerfectSubgroups( <G> )
##
##  'RepresentativesPerfectSubgroups' returns  a list that contains  at least
##  one  subgroup in each conjugacy  class of perfect  subgroups of the group
##  <G>.
##
GroupOps.RepresentativesPerfectSubgroups := function ( G )
    local   reps,               # representatives, result
            rep,                # one representative
            ders,               # derived series of <G>
            resd,               # solvable residuum of <G>
            perc,               # perfect group from the catalogue
            perf,               # converted into a real group
            subc,               # subgroup record of <perc>
            subf,               # corresponding subgroup of <perf>
            iso;                # isomorphism between <perf> and <resd>

    # compute the solvable residuum of <G>
    ders := DerivedSeries( G );
    resd := ders[Length(ders)];

    # easy case first
    if resd.generators = []  then
        return [];
    fi;

    # otherwise check through the perfect groups catalogue
    for perc  in PerfectGroupsCatalogue  do

        # make the perfect group (should fix up the catalogue)
        perf := Group( perc.generators, IdWord );
        perf.relators               := perc.relations;
        perf.isPerfect              := true;
        perf.size                   := perc.size;
        perf.PGantirelators         := perc.antirelations;
        perf.PGinvariants           := perc.grouptype;
        perf.PGinvariantsGenerators := perc.generatortype;
        perf.representativesPerfectSubgroups := [];
        for subc  in perc.subgroups  do
            subf := Subgroup( perf, subc.generators );
            subf.size      := subc.size;
            subf.isPerfect := true;
            Add( perf.representativesPerfectSubgroups, subf );
        od;

        # try to compute an isomorphism
        iso := IsomorphismPerfectGroup( perf, resd );

        # if this worked, them map the subgroups
        if iso <> false  then
            InfoLattice1("#I  identified type of solvable residuum\n");
            reps := [ resd ];
            for subf  in perf.representativesPerfectSubgroups  do
                rep := Image( iso, subf );
                rep.isPerfect := true;
                rep.size      := subf.size;
                Add( reps, rep );
            od;
            return reps;
        fi;

    od;

    # bad luck for the user
    Error("sorry, can' t identify the group's solvable residuum");

end;


#############################################################################
##
#F  IsomorphismPerfectGroup(<P>,<R>)  . . . . .  try to construct isomorphism
##
##  'IsomorphismPerfectGroup' returns an  isomorphism from  the perfect group
##  <P> from the perfect groups  catalogue to the concrete  group <R>.  If no
##  such isomorphism exists, then 'IsomorphismPerfectGroup' returns 'false'.
##
IsomorphismPerfectGroupHelp := function ( P, R, imgs, C )
    local   iso,                # isomorphism, result
            rel,                # relator or antirelator
            inv,                # invariants of the next generator
            cls,                # possible class of next generator
            orb;                # orbit in <cls> under <C>

    # if we have choosen all images, test that this is a homorphism
    if Length(P.generators) = Length(imgs)  then

        # test if the mapping is a homomorphism
        for rel  in P.relators  do
            if MappedWord( rel, P.generators, imgs ) <> R.identity  then
                return false;
            fi;
        od;

        # test if the mapping is bijection
        for rel  in P.PGantirelators  do
            if MappedWord( rel, P.generators, imgs )  = R.identity  then
                return false;
            fi;
        od;

        # found the isomorphism
        iso := GroupHomomorphismByImages( P, R, P.generators, imgs );
        iso.isMapping      := true;
        iso.isHomomorphism := true;
        return iso;

    else

        # we have some information
        inv := P.PGinvariantsGenerators[Length(imgs)+1];

        # loop over the conjugacy classes
        for cls  in ConjugacyClasses(R)  do

            # only take those of the correct order and length
            if    Order( R, Representative(cls) ) = inv[1]
              and Size(cls) = inv[4]
            then

                # try the representatives under the operation of <C>
                for orb  in Orbits( C, Elements(cls) )  do

                    # only take those that have the correct length
                    if Length( orb ) = inv[2]  then

                        # try to extend the mapping
                        iso := IsomorphismPerfectGroupHelp( P, R,
                                   Concatenation( imgs, [orb[1]] ),
                                   Centralizer( C, orb[1] ) );
                        if iso <> false  then
                            return iso;
                        fi;

                    fi;

                od;

            fi;

        od;

        # no possible extension found
        return false;

    fi;

end;

IsomorphismPerfectGroup := function ( P, R )
    local   inv;                # invariants of the group <P>

    # compare the size of <P> and the group <R>
    if P.size <> Size(R)  then
        return false;
    fi;

    # test all the stored invariants
    for inv  in P.PGinvariants do

        # nr of elements of order inv[2] is inv[3]
        if inv[1] = 1
          and Sum(    Filtered( ConjugacyClasses( R ),
                                c -> Order(R,Representative(c)) = inv[2] ),
                      Size ) <> inv[3]
        then
            return false;

        # nr of <G>-classes of order inv[2] and size inv[3] is inv[4]
        # elif inv[1] = 2
        # then

        # nr of <R>-classes of order inv[2] and size inv[3] is inv[4]
        elif inv[1] = 3
          and Number( Filtered( ConjugacyClasses( R ),
                                c -> Order(R,Representative(c)) = inv[2] ),
                      c -> Size(c) = inv[3] ) <> inv[4]
        then
            return false;

        # nr of elms of order inv[2] with roots of order inv[3] is inv[4]
        # elif inv[1] = 4
        # then

        fi;

    od;

    # try to create an isomorphism
    return IsomorphismPerfectGroupHelp( P, R, [], R );

end;


#############################################################################
##
#F  GroupOps.ConjugacyClassesMaximalSubgroups(<G>)  . .  conjugacy classes of
#F                                                          maximal subgroups
##
GroupOps.ConjugacyClassesMaximalSubgroups := function ( G )
    local   maxs, lat;

    # simply compute all conjugacy classes and take the maximals
    lat := LatticeSubgroups( G );
    maxs := lat.operations.MaximalSubgroups( lat )[Length(lat.classes)];
    maxs := lat.classes{ Set( maxs{[1..Length(maxs)]}[1] ) };
    return maxs;
end;


#############################################################################
##
#F  GroupOps.MaximalSubgroups(<G>)  . . . . . .  maximal subgroups of a group
##
GroupOps.MaximalSubgroups := function ( G )
    return Concatenation( List( ConjugacyClassesMaximalSubgroups( G ),
                                Elements ) );
end;


#############################################################################
##
#F  GroupOps.NormalSubgroups(<G>) . . . . . . . . normal subgroups of a group
##
GroupOps.NormalSubgroups := function ( G )
    local   nrm;        # normal subgroups of <G>, result

    # compute the normal subgroup lattice above the trivial subgroup
    nrm := G.operations.NormalSubgroupsAbove(G,TrivialSubgroup(G),[]);

    # sort the normal subgroups according to their size
    Sort( nrm, function( a, b ) return Size( a ) < Size( b ); end );

    # and return it
    return nrm;

end;

GroupOps.NormalSubgroupsAbove := function ( G, N, avoid )
    local   R,          # normal subgroups above <N>, result
            C,          # one conjugacy class of <G>
            g,          # representative of a conjugacy class of <G>
            M;          # normal closure of <N> and <g>

    # initialize the list of normal subgroups
    InfoGroup1("#I    normal subgroup of order ",Size(N),"\n");
    R := [ N ];

    # make a shallow copy of avoid, because we are going to change it
    avoid := ShallowCopy( avoid );

    # for all representative that need not be avoided and do not ly in <N>
    for C  in ConjugacyClasses( G )  do
        g := Representative( C );

        if not g in avoid  and not g in N  then

            # compute the normal closure of <N> and <g> in <G>
            M := NormalClosure( G, Closure( N, g ) );
            if ForAll( avoid, rep -> not rep in M )  then
                Append( R, G.operations.NormalSubgroupsAbove(G,M,avoid) );
            fi;

            # from now on avoid this representative
            Add( avoid, g );
        fi;
    od;

    # return the list of normal subgroups
    return R;

end;


##############################################################################
##
#F  GroupOps.MaximalNormalSubgroups( <G> )
##
##  *Note* that the maximal normal subgroups of a group <G> can be computed
##  easily if the character table of <G> is known.  So if you need the table
##  anyhow, you should compute it before computing the maximal normal
##  subgroups.
##
GroupOps.MaximalNormalSubgroups := function( G )
    local repres,   # representatives of conjugacy classes
          maximal,  # list of maximal normal subgroups, result
          normal,   # list of normal subgroups
          n;        # one normal subgroup

    if IsBound( G.charTable ) then

      # Compute the maximal kernels as class position sets.
      repres:= List( ConjugacyClasses( G ), Representative );
      maximal:= MaximalNormalSubgroups( G.charTable );

      # Form the corresponding groups.
      maximal:= List( maximal, x -> NormalSubgroupClasses( G, x ) );

    else

      # Compute all normal subgroups.
      normal:= NormalSubgroups( G );

      # Remove non-maximal elements.
      Sort( normal, function(x,y) return Size(x) > Size(y); end );
      maximal:= [];
      for n in normal{ [ 2 .. Length( normal ) ] } do
        if ForAll( maximal, x -> not IsSubset( x, n ) ) then

          # A new maximal element is found.
          Add( maximal, n );

        fi;
      od;

    fi;

    # Return the result.
    return maximal;

end;


#############################################################################
##
#F  LatticeNormalSubgroups(<G>) . . . . . . . . . lattice of normal subgroups
##
##  'LatticeNormalSubgroups' is not yet implemented.
##


#############################################################################
##
#F  GroupOps.TableOfMarks(<G>)  . . . . . . . . . . . . make a table of marks
##
GroupOps.TableOfMarks := function ( G )
    local   tom,                # table of marks (result)
            mrks,               # marks for one class
            ind,                # index of <I> in <N>
            zuppos,             # generators of prime power order
            classes,            # list of all classes
            classesZups,        # zuppos blist of classes
            I,                  # representative of a class
            Ielms,              # elements of <I>
            Izups,              # zuppos blist of <I>
            Icopy,              # copy of <I>
            N,                  # normalizer of <I>
            Ncopy,              # copy of <N>
            Jzups,              # zuppos of a conjugate of <I>
            Kzups,              # zuppos of a representative in <classes>
            reps,               # transversal of <N> in <G>
            i, k, l, r;         # loop variables

    # compute the lattice, fetch the classes, zuppos, and representatives
    classes := ConjugacyClassesSubgroups( G );
    classesZups := [];

    # compute a system of generators for the cyclic sgr. of prime power size
    InfoLattice1( "#I  <G> has \c" );
    zuppos := Zuppos( G );
    InfoLattice1( Length(zuppos), " zuppos\n" );

    # initialize the table of marks
    InfoLattice1( "#I  computing table of marks\n" );
    tom := rec( subs := List( classes, c -> [] ),
                marks := List( classes, c -> [] ) );

    # loop over all classes
    for i  in [1..Length(classes)-1]  do

        # take the subgroup <I>
        I := classes[i].representative;
        Icopy := ShallowCopyNoSC( I );
        InfoLattice2( "#I    testing class ", i, ", \c" );

        # compute the zuppos blist of <I>
        Ielms := Elements( Icopy );
        Izups := BlistList( zuppos, Ielms );
        classesZups[i] := Izups;
        InfoLattice2( "size = ", Size(Icopy), ", \c" );

        # compute the normalizer of <I>
        N := Normalizer( G, Icopy );
        Ncopy := ShallowCopyNoSC( N );
        ind := Size( Ncopy ) / Size( Icopy );
        InfoLattice2( "length = ", Size(G) / Size(N), ", \c" );

        # compute the right transversal
        reps := RightTransversal( G, Ncopy );
        Unbind( Icopy );
        Unbind( Ncopy );
        InfoLattice2( "includes \c" );

        # set up the marking list
        mrks    := 0 * [1..Length(classes)];
        mrks[1] := Length(reps) * ind;
        mrks[i] := 1 * ind;

        # loop over the conjugates of <I>
        for r  in [1..Length(reps)]  do

            # compute the zuppos blist of the conjugate
            if reps[r] = G.identity  then
                Jzups := Izups;
            else
                Jzups := BlistList( zuppos, OnTuples(Ielms,reps[r]) );
            fi;

            # loop over all other (smaller classes)
            for k  in [2..i-1]  do
                Kzups := classesZups[k];

                # test if the <K> is a subgroup of <J>
                if IsSubsetBlist( Jzups, Kzups )  then
                    mrks[k] := mrks[k] + ind;
                fi;

            od;

        od;

        # compress this line into the table of marks
        for k  in [1..i]  do
            if mrks[k] <> 0  then
                Add( tom.subs[i], k );
                Add( tom.marks[i], mrks[k] );
            fi;
        od;
        Unbind( Ielms );
        Unbind( reps );
        InfoLattice2( Length(tom.marks[i]), " classes\n" );

    od;

    # handle the whole group
    InfoLattice2( "#I    testing class ", Length(classes), ", \c" );
    InfoLattice2( "size = ", Size( G ), ", \c" );
    InfoLattice2( "length = 1, \c" );
    InfoLattice2( "includes \c" );
    tom.subs[Length(classes)] := [1..Length(classes)] + 0;
    tom.marks[Length(classes)] := 0 * [1..Length(classes)] + 1;
    InfoLattice2( Length(tom.marks[Length(classes)]), " classes\n" );

    # return the table of marks
    return tom;
end;


#############################################################################
##
#F  Zuppos(<G>) .  set of generators for cyclic subgroups of prime power size
##
Zuppos := function ( G )
    if not IsBound( G.zuppos )  then
        G.zuppos := G.operations.Zuppos( G );
    fi;
    return G.zuppos;
end;

GroupOps.Zuppos := function ( G )
    local   zuppos,             # set of zuppos, result
            c,                  # a representative of a class of elements
            o,                  # its order
            N,                  # normalizer of < c >
            t;                  # loop variable

    # compute the zuppos
    zuppos := [ G.identity ];
    for c  in List( ConjugacyClasses( G ), Representative )  do
        o := Order( G, c );
        if IsPrimePowerInt( o )  then
            if ForAll( [2..o], i -> Gcd(o,i) <> 1 or not c^i in zuppos ) then
                N := Normalizer( G, Subgroup( Parent(G), [ c ] ) );
                for t  in RightTransversal( G, N )  do
                    Add( zuppos, c^t );
                od;
            fi;
        fi;
    od;

    # return the set of zuppos
    Sort( zuppos );
    IsSet( zuppos );
    return zuppos;
end;



