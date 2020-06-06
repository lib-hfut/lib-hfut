#############################################################################
##
#A  permstbc.g                  GAP library                         Udo Polis
#A                                                              & Akos Seress
##
#H  @(#)$Id: permstbc.g,v 3.13.1.5 1996/09/27 12:41:47 mschoene Exp $
##
#Y  Copyright (C)  1994,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the functions to compute and change stabilizer chains.
##
#H  $Log: permstbc.g,v $
#H  Revision 3.13.1.5  1996/09/27 12:41:47  mschoene
#H  fixed 'StabChain' from treating groups as stabchains
#H
#H  Revision 3.13.1.4  1996/09/17 12:28:56  mschoene
#H  changed 'StabChain', it should not enter 'G.stabChainOptions.knownBase'
#H
#H  Revision 3.13.1.3  1995/04/01 13:39:46  aseress
#H  improved 'StabChain' to avoid recomputing the top level
#H
#H  Revision 3.13.1.2  1994/10/11  12:52:22  ahulpke
#H  fixed 'MinimalStabChain' for the trivial group
#H
#H  Revision 3.13.1.1  1994/10/11  12:19:40  ahulpke
#H  Changed 'smallestBase' to 'MinimalStabChain'
#H
#H  Revision 3.13  1994/07/07  19:12:29  mschoene
#H  reindented Akos' functions to please 'makeinit'
#H
#H  Revision 3.12  1994/06/29  11:42:13  aseress
#H  added warning if given and computed size differ in .StabChainRandom
#H
#H  Revision 3.11  1994/06/27  10:52:30  aseress
#H  changed order of dispatching in StabChain; fixed ListStabChain
#H
#H  Revision 3.10  1994/06/21  15:10:46  aseress
#H  added SCRRandomSubproduct
#H
#H  Revision 3.9  1994/06/20  11:01:56  ahulpke
#H  odo not set small subgroups of large random group to deterministic
#H
#H  Revision 3.8  1994/06/20  09:10:14  aseress
#H  added handling of trivial group to ListStabChain
#H
#H  Revision 3.7  1994/06/17  16:03:24  aseress
#H  *** empty log message ***
#H
#H  Revision 3.6  1994/06/17  15:58:48  aseress
#H  added SCRExtendRecord
#H
#H  Revision 3.5  1994/06/17  14:07:53  aseress
#H  fixed ExtendStabChain
#H
#H  Revision 3.4  1994/06/15  08:20:50  aseress
#H  *** empty log message ***
#H
#H  Revision 3.3  1994/06/14  19:17:22  aseress
#H  avoided call to 'Filtered' in PermGroupOps.StabChainRandom
#H
#H  Revision 3.2  1994/06/14  17:06:41  aseress
#H  added speedup for lots of small orbits in PermGroupOps.StabChainRandom
#H  corrected discrepancy between records .knownBase and .known same place
#H
#H  Revision 3.1  1994/06/12  14:27:59  mschoene
#H  initial revision under RCS
#H
##


#############################################################################
##
#V  StabChainOptions
##
StabChainOptions := rec();


#############################################################################
##
#F  StabChain(<G>[,<options>])  . . . . . . . . .  compute a stabilizer chain
##
StabChain := function ( arg )
    local   chain,
            grp,
            opt,
            options,
            degree;

    # parse the arguments
    if   Length(arg) = 1  then
        grp := arg[1];
        opt := rec();
    elif Length(arg) = 2  then
        grp := arg[1];
        opt := arg[2];
    else
        Error("usage: StabChain( <G> [, <options>] )");
    fi;
    options := rec();

    # see whether the user wants a particular base
    if   IsBound( opt.base )  then
        options.base := opt.base;
    fi;

    # see whether the user wants it reduced
    if   IsBound( opt.reduced )  then
        options.reduced := opt.reduced;
    fi;

    # see whether the user knows strong generators
    if   IsBound( opt.strongGenerators )  then
        if not IsBound( options.base )  then
            Error("you must specify a base if you give strong generators");
        else
            options.strongGenerators := opt.strongGenerators;
        fi;
    fi;

    # start dispatching
    if  Length( grp.generators ) = 0  then
        chain := rec( generators := [],
                      identity   := () );

    # if strong generators are known
    elif IsBound( options.strongGenerators )  then
        chain := grp.operations.StabChainStrongGenerators(
                         options.strongGenerators,
                         options.base );

    # if it is a base change for a stabchain record (instead of a group)
    elif not IsBound( grp.operations ) then
        chain := PermGroupOps.StabChainChange(
                         grp,
                         options.base );

    # if it is base change
    elif IsBound( grp.stabChain )  then 
        if IsBound( options.base )  then
            chain := grp.operations.StabChainChange(
                             grp.stabChain,
                             options.base );
        else
            chain := grp.stabChain;
        fi;

    # if it is a base change but the group has no stabChain component
    elif IsBound( grp.stabilizer )  then
        #N  1996/09/30 M.Schoenert maybe we should signal an error
        grp.stabChain := rec();
        grp.stabChain.identity := ();
        grp.stabChain.generators  := grp.generators;
        grp.stabChain.orbit       := grp.orbit;
        grp.stabChain.transversal := grp.transversal;
        grp.stabChain.stabilizer  := grp.stabilizer;
        if IsBound( options.base )  then
            chain := grp.operations.StabChainChange(
                             grp.stabChain,
                             options.base );
        else
            chain := grp.stabChain;
        fi;

    # we have to construct a new stabchain from scratch
    else

       # see whether we know a base
       if   IsBound( opt.knownBase )  then
           options.knownBase := opt.knownBase;
       elif IsBound( grp.stabChainOptions )
        and IsBound( grp.stabChainOptions.knownBase )  then
           options.knownBase := grp.stabChainOptions.knownBase;
       elif IsBound( Parent(grp).stabChain )  then
           options.knownBase := BaseStabChain( Parent(grp).stabChain );
       elif IsBound( Parent(grp).stabChainOptions )
        and IsBound( Parent(grp).stabChainOptions.knownBase )  then
           options.knownBase := Parent(grp).stabChainOptions.knownBase;
       fi;

       # see whether we know the exact size
       if   IsBound( opt.size )  then
           options.size := opt.size;
       elif IsBound( grp.size )  then
           options.size := grp.size;
       elif IsBound( grp.stabChainOptions )
        and IsBound( grp.stabChainOptions.size )  then
           options.size := grp.stabChainOptions.size;
       fi;

       degree := PermGroupOps.NrMovedPoints(grp);

       # see how we are to verify the stabilizer chain
       if   IsBound( opt.random )  then
           options.random := opt.random;
       elif IsBound( grp.stabChainOptions )
        and IsBound( grp.stabChainOptions.random )  then
           options.random := grp.stabChainOptions.random;
       elif IsBound( Parent(grp).stabChainOptions )
        and IsBound( Parent(grp).stabChainOptions.random )  then
           options.random := Parent(grp).stabChainOptions.random;
       elif IsBound( StabChainOptions.random )  then
           options.random := StabChainOptions.random;
       else
           options.random := 1000;
       fi;
       if   options.random = false  then
           options.random := 1000;
       elif options.random = true   then
           options.random :=  900;
       fi;

       if degree <= 100  then
           options.random := 1000;
       fi;

       # if size is known, choose between methods according to degree
       if IsBound( options.size ) then 

          # ordinary Schreier Sims
          #N  1994/04/15 mschoene watch for 'size' or 'limit'
          if degree <= 100 and not IsBound( options.knownBase )  then
             if IsBound( options.base )  then
                chain := grp.operations.StabChain(
                             grp.generators,
                             options.base );
             else
                chain := grp.operations.StabChain(
                             grp.generators,
                             [] );
             fi;

          # ordinary Schreier Sims with known base
          #N  1994/04/15 mschoene watch for 'size' or 'limit'
          elif degree <= 100 and IsBound( options.knownBase )  then
             if IsBound( options.base )  then
                chain := grp.operations.StabChainKnownBase(
                             grp.generators,
                             options.base,
                             options.knownBase );
             else
                chain := grp.operations.StabChainKnownBase(
                             grp.generators,
                             [],
                             options.knownBase );
             fi;

          # random Schreier Sims
          else
             chain := grp.operations.StabChainRandom(
                         grp.generators, options );
          fi;

      # if size is not known
      else

          # see whether we know an upper limit for the size
          if  IsBound( options.size )  then
              options.limit := options.size;
          elif IsBound( opt.limit )  then
              options.limit := opt.limit;
          elif IsBound( grp.stabChainOptions )
           and IsBound( grp.stabChainOptions.limit )  then
              options.limit := grp.stabChainOptions.limit;
          elif IsBound( Parent(grp).size )  then
              options.limit := Parent(grp).size;
          elif IsBound( Parent(grp).stabChainOptions )
           and IsBound( Parent(grp).stabChainOptions.limit )  then
              options.limit := Parent(grp).stabChainOptions.limit;
          fi;

          # dispatch according to the things we know

          # ordinary Schreier Sims
          #N  1994/04/15 mschoene watch for 'size' or 'limit'
          if options.random >= 1000 and not IsBound( options.knownBase )  then
             if IsBound( options.base )  then
                chain := grp.operations.StabChain(
                             grp.generators,
                             options.base );
             else
                chain := grp.operations.StabChain(
                             grp.generators,
                             [] );
             fi;

          # ordinary Schreier Sims with known base
          #N  1994/04/15 mschoene watch for 'size' or 'limit'
          elif options.random >= 1000 and IsBound( options.knownBase )  then
             if IsBound( options.base )  then
                 chain := grp.operations.StabChainKnownBase(
                             grp.generators,
                             options.base,
                             options.knownBase );
             else
                 chain := grp.operations.StabChainKnownBase(
                             grp.generators,
                             [],
                             options.knownBase );
             fi;

          # random Schreier Sims
          elif options.random < 1000 and not IsBound(options.knownBase)  then
             chain := grp.operations.StabChainRandom(
                         grp.generators, options );

          # random Schreier Sims with known base
          elif options.random < 1000 and IsBound( options.knownBase )  then
              chain := grp.operations.StabChainRandomKnownBase(
                         grp.generators, options );

          fi;
      fi; # IsBound(options.size)
    fi; # dispatching cases

    # reduce or extend stabilizer chain
    if   IsBound( options.reduced )  and options.reduced = true   then
        chain := PermGroupOps.StabChainReduce(
                         chain );
    elif IsBound( options.reduced )  and options.reduced = false  then
        chain := PermGroupOps.StabChainExtend(
                         chain, options.base );
    fi;

    # call this part only if grp was a permutation group, not a stabChain
    if IsBound( grp.operations ) then

       # for compatibility copy into the group record
       if IsBound( chain.orbit )  then
           if IsEqualSet(grp.generators,chain.generators) then
               chain.generators  := grp.generators;
               grp.orbit         := chain.orbit;
               grp.transversal   := chain.transversal;
               grp.stabilizer    := chain.stabilizer;
           else
               grp.orbit         := [ chain.orbit[1] ];
               grp.transversal   := [];
               grp.transversal[grp.orbit[1]] := ();
               PermGroupOps.AddGensExtOrb( grp, grp.generators );
               grp.stabilizer    := chain.stabilizer;
               chain.generators  := grp.generators;
               chain.orbit       := grp.orbit;
               chain.transversal := grp.transversal;
           fi;
       fi;

       # if the parent is random, this group should be also
       # at base change or strong gens constr, may be no info about random
       if IsBound( options.random ) then
          if not IsParent(grp) and
             IsBound(Parent(grp).stabChainOptions) and
             IsBound(Parent(grp).stabChainOptions.random) then
             options.random:=Minimum( Parent(grp).stabChainOptions.random,
                                      options.random );
          fi;
          if IsBound(grp.stabChainOptions) then 
              grp.stabChainOptions.random := options.random;
          else 
              grp.stabChainOptions := rec(random := options.random);
          fi;
       fi;

       # enter the chain in the group record and return it
       grp.stabChain := chain;
    fi;

    return chain;
end;


#############################################################################
##
#F  PermGroupOps.StabChain(<gens>,<base>) . . . .  compute a stabilizer chain
##
PermGroupOps.StabChain := function ( gens, base )
    local   chain;
    chain := rec();
    chain.generators := gens;
    chain.identity   := ();
    PermGroupOps.StabChainStrong( chain, gens, base );
    return chain;
end;


#############################################################################
##
#F  PermGroupOps.StabChainKnownBase(<gens>,<base>,<known>)  . . . . compute a
#F                                        stabilizer chain if a base is known
##
PermGroupOps.StabChainKnownBase := function ( gens, base, known )
    return PermGroupOps.StabChain( gens, base );
end;


#############################################################################
##
#F  PermGroupOps.StabChainStrong(<S>,<new>,<base>) .  make a stabilizer strong
##
PermGroupOps.StabChainStrong := function ( S, new, base )
    local   gens,       # generators of <S>
            gen,        # one generator of <S>
            orb,        # orbit of <S>, same as '<S>.orbit'
            len,        # initial length of <orb>
            rep,        # representative of point in <orb>
            sch,        # schreier generator of '<S>.stabilizer'
            stb,        # stabilizer beneath <S>
            bpt,        # basepoint of <stb>, same as '<stb>.orbit[1]'
            i,  j;      # loop variables

    # find the index of the first point moved by <new> in '<base>+[1..]'
    i := 1;
    while i <= Length(base)
      and ForAll( new, gen -> base[i]^gen = base[i] )  do
        i := i + 1;
    od;
    if Length(base) < i  then
        while ForAll( new, gen -> (i-Length(base))^gen = i-Length(base) )  do
            i := i + 1;
        od;
    fi;

    # if necessary add a new stabilizer to the stabchain
    if not IsBound(S.stabilizer)  then
        if i <= Length(base)  then
            S.orbit               := [ base[i] ];
        else
            S.orbit               := [ i-Length(base) ];
        fi;
        S.transversal             := [];
        S.transversal[S.orbit[1]] := S.identity;
        S.stabilizer              := rec();
        S.stabilizer.identity     := S.identity;
        S.stabilizer.generators   := [];
    fi;

    # find the index of the basepoint in '<base>+[1..]'
    j := Position( base, S.orbit[1] );
    if j = false  then
        j := S.orbit[1] + Length(base);
    fi;

    # if the new generators move an earlier point insert a new stabilizer
    if i < j  then
        S.stabilizer              := ShallowCopy( S );
        S.stabilizer.generators   := ShallowCopy( S.generators );
        if i <= Length(base)  then
            S.orbit               := [ base[i] ];
        else
            S.orbit               := [ i-Length(base) ];
        fi;
        S.transversal             := [];
        S.transversal[S.orbit[1]] := S.identity;
    fi;

    # add the new generators to <S> and extend the orbit and transversal
    orb := S.orbit;
    len := Length(orb);
    PermGroupOps.AddGensExtOrb( S, new );

    # force all the new generators that fix the basepoint into the stabilizer
    for gen  in new  do
        if orb[1]^gen = orb[1]  then
            PermGroupOps.StabChainStrong( S.stabilizer, [ gen ], base );
        fi;
    od;

    # compute the Schreier generators (seems to work better backwards)
    for i  in Reversed([1..Length(orb)])  do

        # compute an inverse representant '<orb>[1]^(<rep>^-1) = <orb>[i]'
        rep := S.transversal[orb[i]];
        while orb[i] ^ rep <> orb[1]  do
            rep := rep * S.transversal[ orb[i]^rep ];
        od;

        # take only the new generators for old, all generators for new points
        if i <= len  then gens := new;  else gens := S.generators;  fi;
        for gen  in gens  do

            # avoid to compute schreier generators that will turn out trivial
            if gen <> S.transversal[ orb[i] / gen ]  then

                # divide (gen * rep)^-1 by the representantives
                sch := (gen * rep)^-1;
                stb := S;
                while Length(stb.generators) <> 0
                  and IsBound(stb.transversal[stb.orbit[1]^sch])  do
                    bpt := stb.orbit[1];
                    while bpt ^ sch <> bpt  do
                        sch := sch * stb.transversal[bpt^sch];
                    od;
                    stb := stb.stabilizer;
                od;

                # force nontrivial reduced Schreier generator into the stab.
                if sch <> S.identity  then
                    PermGroupOps.StabChainStrong( S.stabilizer, [sch], base );
                fi;

            fi;
        od;

    od;

end;


#############################################################################
##
#F  PermGroupOps.AddGensExtOrb(<S>,<new>) . . . . . add generators and extend
#F                                                      orbit and transversal
##
PermGroupOps.AddGensExtOrb := function ( S, new )
    local   gens,       # generators of <S> or <new>
            gen,        # one generator in <gens>
            orb,        # orbit of <S>
            len,        # length of the orbit
            i;          # loop variable

    # add the new generators to the generator list
    for gen  in new  do
        if not gen in S.generators  then
            Add( S.generators, gen );
        fi;
    od;

    # extend the orbit and the transversal with the new generators
    orb := S.orbit;
    len := Length(orb);
    i := 1;
    while i <= Length(orb)  do
        if i <= len  then gens := new;  else gens := S.generators;  fi;
        for gen  in gens  do
            if not IsBound(S.transversal[orb[i]/gen])  then
                S.transversal[orb[i]/gen] := gen;
                Add( orb, orb[i]/gen );
            fi;
        od;
        i := i + 1;
    od;

end;


#############################################################################
##
#F  PermGroupOps.StabChainRandom(<G>,<options>) . . . . . . . . . . compute a
#F                                                  stabilizer chain randomly
##
##  The  method  consists of  3  phases:  a  heuristic construction  and  two
##  checking  phases.  In the checking  phases,  we  take random  elements of
##  created set, multiply by  random subproduct of  generators, and sift down
##  by dividing with the  appropriate coset representatives. The stabchain is
##  correct when  all  siftees are  ().    In the first  checking  phase, all
##  computations are carried out with words  in strong generators and siftees
##  are checked by plugging in random points in words; in the second checking
##  phase, permutations are multiplied.
##
##  During the construction, we create new records for stabilizers:
##  S.aux = set of strong generators for S, temporarily created during the
##          construction. On the other hand, S.generators contains a strong
##          generating set for S which would have been created by the
##          deterministic method
##  S.treegen = elements of S.aux used in S.transversal
##  S.treegeninv = inverses of S.treegen; also used in S.transversal,
##                 and they are also elements of S.aux
##  S.treedepth = depth of Schreier tree of S
##  S.diam = sum of treedepths in stabilizer chain of S
##
##  After the  stabilizer chain  is  ready,  the  extra records are  deleted.
##  Transversals are rebuilt using the generators in the .generators records.
##
PermGroupOps.StabChainRandom := function(G,options)
    local degree,   # degree of G
          givenbase,# list of points from which first base points should come
          correct,  # boolean; true if a correct base is given
          order,    # size of G if given in input
          limit,    # upper bound on Size(G) given in input
          orbits,   # list of orbits of G
          orbits2,  # list of orbits of G
          k,        # number of pairs of generators checked
          param,    # list of parameters guiding number of repetitions
                    # in random constructions
          where,    # list indicating which orbit contains points in domain
          basesize, # list; i^th entry = number of base points in orbits[i]
          i,j,
          ready,    # boolean; true if stabilizer chain ready
          warning,  # used at warning if given and computed size differ
          new,      # list of permutations to be added to stab. chain
          result,   # output of checking phase; nontrivial if stabilizer
                    # chain is incorrect
          base,     # ordering of domain from which base points are taken
          missing;  # if a correct base was provided by input, missing
                    # contains those points of it which are not in
                    # constructed base

    G:=rec( generators := ShallowCopy(G), identity := () );
    if options.random = 1000 then
       #case of deterministic computation with known size
       k := 1;
    else 
       k:=First([1..14],x->(3/5)^x<1-options.random/1000);
    fi;
    if IsBound(options.knownBase) then
        param:=[k,4,0,0,0,0];
    else
        param:=[QuoInt(k,2),4,QuoInt(k+1,2),4,50,5];
    fi;
    if options.random <= 200 then 
       param[2] := 2;
       param[4] := 2;
    fi;

    #param[1] = number of pairs of random subproducts from generators in
    #           first checking phase
    #param[2] = (number of random elements from created set)/S.diam
    #           in first checking phase
    #param[3] = number of pairs of random subproducts from generators in
    #           second checking phase
    #param[4] = (number of random elements from created set)/S.diam
    #           in second checking phase
    #param[5] = maximum size of orbits in  which we evaluate words on all
    #           points of orbit
    #param[6] = minimum number of random points from orbit to plug in to check
    #           whether given word is identity on orbit

    degree := PermGroupOps.LargestMovedPoint(G);


    # prepare input of construction
    if IsBound(options.base) then
        givenbase := options.base;
    else
        givenbase := [];
    fi;

    if IsBound(options.size) then
        order := options.size;
        warning := 0;
        limit := 0;
    else
        order := 0;
        if IsBound(options.limit) then
            limit := options.limit;
        else
            limit := 0;
        fi;
    fi;

    if IsBound(options.knownBase) then
        correct := true;
    else
        correct := false;
    fi;

    if correct then
        # if correct  base was given as input, no need for orbit information
        base:=Concatenation(givenbase,Difference(options.knownBase,givenbase));
        missing := Set(options.knownBase);
        basesize := [];
        where := [];
        orbits := [];
    else
        # create ordering of domain used in choosing base points and
        # compute orbit information
        base:=Concatenation(givenbase,Difference([1..degree],givenbase));
        missing:=[];
        orbits2:=PermGroupOps.Orbits(G,[1..degree],OnPoints);
        #throw away one-element orbits
        orbits:=[];
        j:=0;
        for i in [1..Length(orbits2)] do 
            if Length(orbits2[i]) >1 then
               j:=j+1; orbits[j]:= orbits2[i];
            fi;
        od;
        basesize:=[];
        where:=[];
        for i in [1..Length(orbits)] do
            basesize[i]:=0;
            for j in [1..Length(orbits[i])] do
                where[orbits[i][j]]:=i;
            od;
        od;
        # temporary solution to speed up of handling of lots of small orbits
        # until compiler
        if Length(orbits) > degree/40 then
           param[1] := 0;
           param[3] := k;
        fi;
    fi;

    ready:=false;
    new:=G.generators;

    while not ready do
        SCRMakeStabStrong
           (G,new,param,orbits,where,basesize,base,correct,missing,true);
        # last parameter of input is true if function called for original G
        # in recursive calls on stabilizers, it is false
        # reason: on top level,
        #         we do not want to add anything to generating set

        # start checking
        if (PermGroupOps.Size(G) = order)
          or (PermGroupOps.Size(G)=limit)
        then
            ready := true;
        elif PermGroupOps.Size(G) < order then
            # we have an incorrect stabilizer chain
            # repeat checking until a new element is discovered
            result := ();
            if correct then
                # if correct base was provided, it is enough to check
                # images of base points to check whether a word is trivial
                # no need for second checking phase
                while result = () do
                    warning := warning + 1;
                    if warning > 5 then
                       Print("Warning, computed and given size differ","\n");
                    fi;
                    result := SCRStrongGenTest(G,param,orbits,
                                      basesize,base,correct,missing);
                od;
            else
                while result = () do
                    warning := warning + 1;
                    if warning > 5 then
                       Print("Warning, computed and given size differ","\n");
                    fi;
                    result:=SCRStrongGenTest(G,param,orbits,
                                    basesize,base,correct,missing);
                    if result = () then
                        # Print("entering SGT2","\n");
                        result:=SCRStrongGenTest2(G,param);
                    fi;
                od;
            fi;
            new:=[result];
            Unbind(G.size);
            warning := 0;
        else
            #no information or only upper bound about Size(G)
            # Print("entering SGT", "\n");
            result:=SCRStrongGenTest(G,param,orbits,basesize,
                                  base,correct,missing);
            if result <> () then
                new:=[result];
                Unbind(G.size);
            elif correct then
                # no need for second checking phase
                ready:=true;
                Unbind(G.size);
            else
                # Print("entering SGT2","\n");
                result:=SCRStrongGenTest2(G,param);
                if result = () then
                    ready:=true;
                    Unbind(G.size);
                else
                    new:=[result];
                    Unbind(G.size);
                fi;
            fi;
        fi;
    od;

    #restore usual record elements
    SCRRestoreRecord(G);
    return G;
end;


#############################################################################
##
##  SCRMakeStabStrong
##
##  heuristic stabilizer  chain  construction, with one random  subproduct on
##  each  level,  and one or two  (defined  by mlimit) random cosets  to make
##  Schreier generators
##
SCRMakeStabStrong := function ( S, new, param, orbits, where, basesize, base,
                                correct, missing, top )
    local   x,m,j,l,      # loop variables
            ran1,         # random permutation
            string,       # random 0-1 string
            w,            # random subproduct of generators
            len,          # number of generators of S
            mlimit,       # number of random elements to be tested
            coset,        # word representing coset of S
            residue,      # first component: remainder of Schreier generator
                          # after factorization; second component > 0
                          # if factorization unsuccesful
            jlimit,       # number of random points to plug into residue[1]
            ran,          # index of random point in an orbit of S
            g,            # permutation to be added to S.stabilizer
            gen,          # permutations used in S.transversal
            inv,          # their inverses
            firstmove;    # first point of base moved by an element of new

    if new <> [] then
        firstmove := First( base, x->ForAny( new, gen->x^gen<>x ) );
        # if necessary add a new stabilizer to the stabchain
        if not IsBound(S.stabilizer) then
            S.orbit                    := [firstmove];
            S.transversal              := [];
            S.transversal[S.orbit[1]]  := S.identity;
            S.generators               := [];
            S.treegen                  := [];
            S.treegeninv               := [];
            S.stabilizer               := rec();
            S.stabilizer.identity      := S.identity;
            S.stabilizer.aux           := [];
            S.stabilizer.generators    := [];
            S.stabilizer.diam          := 0;
            if not correct then
                basesize[where[S.orbit[1]]]
                    := basesize[where[S.orbit[1]]] + 1;
            fi;
            RemoveSet(missing,firstmove);
        else
            if Position(base,firstmove) < Position(base,S.orbit[1]) then
                S.stabilizer               := ShallowCopy(S);
                S.orbit                    := [firstmove];
                S.transversal              := [];
                S.transversal[S.orbit[1]]  := S.identity;
                S.generators := ShallowCopy(S.stabilizer.generators);
                S.treegen                  := [];
                S.treegeninv               := [];
                if not correct then
                    basesize[where[S.orbit[1]]]
                      := basesize[where[S.orbit[1]]] + 1;
                fi;
                RemoveSet(missing,firstmove);
            fi;
        fi;

        # on top level, we want to keep the original generators
        if not top or Length(S.generators) = 0  then
            Append(S.generators,new);
        fi;
        #construct orbit of basepoint
        SCRSchTree(S,new);

        #check whether new elements are really new in the system
        while new <> [] do
            g := SCRSift( S, new[Length(new)] );
            Unbind( new[Length(new)] );
            if g <> () then
                SCRMakeStabStrong(S.stabilizer,[g],param,orbits,
                                  where,basesize,base,correct,missing,false);
                S.diam:=S.treedepth+S.stabilizer.diam;
                S.aux:=Concatenation(S.treegen,
                                     S.treegeninv,S.stabilizer.aux);
            fi;
        od;
    fi;

    #check random Schreier generators
    gen := Concatenation(S.treegen,S.treegeninv,[()]);
    inv := Concatenation(S.treegeninv,S.treegen,[()]);
    len := Length(S.aux);
    #in case of more than one generator for S, form a random subproduct
    #otherwise, use the generator
    if len > 1 then
        ran1 := SCRRandomPerm(len);
        string := SCRRandomString(len);
        w := ();
        for x in [1..len] do
            w := w*(S.aux[x^ran1]^string[x]);
        od;
    else
        w:=S.aux[1];
    fi;

    # take random coset(s)
    mlimit:=1;
    m:=0;
    while m < mlimit do
        m := m+1;
        ran := RandomList([1..Length(S.orbit)]);
        coset := CosetRepAsWord(S.orbit[1],S.orbit[ran],S.transversal);
        coset := InverseAsWord(coset,gen,inv);
        if w <> () then
            # form Schreier generator and factorize
            Add(coset,w);
            residue := SiftAsWord(S,coset);
            # check whether factorization is succesful
            if residue[2] > 0  then
                # factorization is unsuccesful; use remainder for
                # construction in stabilizer
                g := Product(residue[1]);
                SCRMakeStabStrong(S.stabilizer,[g],param,orbits,where,
                                  basesize,base,correct,missing,false);
                S.diam := S.treedepth+S.stabilizer.diam;
                S.aux := Concatenation(S.treegen,S.treegeninv,
                                       S.stabilizer.aux);
                # get out of current loop
                m := 0;
            elif correct then
                # enough to check images of points in given base
                l := 0;
                while l < Length(missing) do
                    l := l+1;
                    if ImageInWord(missing[l],residue[1]) <> missing[l] then
                        # factorization is unsuccesful;
                        # use remainder for construction in stabilizer
                        g := Product(residue[1]);
                        SCRMakeStabStrong(S.stabilizer,[g],param,
                                          orbits,where,basesize,
                                          base,correct,missing,false);
                        S.diam := S.treedepth+S.stabilizer.diam;
                        S.aux := Concatenation(S.treegen,
                                               S.treegeninv,S.stabilizer.aux);
                        # get out of current loop
                        m := 0;
                        l := Length(missing);
                    fi;
                od;
            else
                l:=0;
                while l < Length(orbits) do
                    l:=l+1;
                    if Length(orbits[l]) > param[5] then
                        # in large orbits, plug in random points
                        j:=0;
                        jlimit:=Maximum(param[6],basesize[l]);
                        while j < jlimit do
                            j:=j+1;
                            ran:=RandomList([1..Length(orbits[l])]);
                            if ImageInWord(orbits[l][ran],residue[1])
                              <> orbits[l][ran]
                            then
                                # factorization is unsuccesful;
                                # use remainder for construction in stabilizer
                                g := Product(residue[1]);
                                SCRMakeStabStrong(S.stabilizer,[g],param,
                                                  orbits,where,basesize,
                                                  base,correct,missing,false);
                                S.diam := S.treedepth+S.stabilizer.diam;
                                S.aux := Concatenation(S.treegen,S.treegeninv,
                                                       S.stabilizer.aux);
                                # get out of current loop
                                m := 0;
                                j := jlimit;
                                l := Length(orbits);
                            fi;
                        od; #j loop
                    else
                        # in small orbits, check images of all points
                        j := 0;
                        while j < Length(orbits[l]) do
                            j := j+1;
                            if ImageInWord(orbits[l][j],residue[1])
                              <> orbits[l][j]
                            then
                                # factorization is unsuccesful;
                                # use remainder for construction in stabilizer
                                g := Product(residue[1]);
                                SCRMakeStabStrong(S.stabilizer,[g],param,
                                                  orbits,where,basesize,
                                                  base,correct,missing,false);
                                S.diam := S.treedepth+S.stabilizer.diam;
                                S.aux := Concatenation(S.treegen,S.treegeninv,
                                                       S.stabilizer.aux);
                                # get out of current loop
                                m := 0;
                                j := Length(orbits[l]);
                                l := Length(orbits);
                            fi;
                        od; #j loop
                    fi;
                od; #l loop
            fi;
        fi;
    od; #m loop

end;


#############################################################################
##
##  SCRStrongGenTest
##
##  tests whether product of a random element of S and a random subproduct of
##  the strong generators  of S is in S.   Computations are  carried out with
##  words in generators   representing  group  elements; random   points  are
##  plugged in to test whether a word represents  the identity.  If SGS for S
##  not complete, returns a permutation not in S.
##
SCRStrongGenTest := function ( S, param, orbits, basesize,
                               base, correct, missing)
    local   x,i,k,m,j,l,  # loop variables
            ran1,ran2,    # random permutations
            string,       # random 0-1 string
            w,            # list containing random subproducts of generators
            len,          # number of generators of S
            len2,         # length of short random subproduct
            mlimit,       # number of random elements to be tested
            ranword,      # random element of S as a word in generators
            residue,      # first component: remainder of ranword
                          # after factorization; second component > 0
                          # if factorization unsuccesful
            jlimit,       # number of random points to plug into residue[1]
            ran,          # index of random point in an orbit of S
            g;            # product of residue[1]

    k := 0;
    while k < param[1] do
        k := k+1;
        len := Length(S.aux);
        #in case of large S.aux, form random subproducts
        #otherwise, try all of them
        if len > 2*param[3] then
            ran1 := SCRRandomPerm(len);
            ran2 := SCRRandomPerm(len);
            len2 := RandomList([1 .. QuoInt(len,2)]);
            string := SCRRandomString(len+len2);

            # we form two random subproducts:
            # w[1] in a random ordering of all generators
            # w[2] in a random ordering of a random subset of them
            w:=[];
            w[1] := ();
            for x in [1 .. len] do
                w[1] := w[1]*(S.aux[x^ran1]^string[x]);
            od;
            w[2] := ();
            for x in [1 .. len2] do
                w[2] := w[2]*(S.aux[x^ran2]^string[x+len]);
            od;

        else
            # take next two generators of S (unless only one is left)
            w := [];
            w[1] := S.aux[2*k-1];
            if len > 2*k-1 then
                w[2] := S.aux[2*k];
            else
                w[2] := ();
            fi;
        fi;

        # take random elements of S as words
        m := 0;
        mlimit := param[2]*S.diam;
        while m < mlimit do
            m:=m+1;
            ranword := RandomElmAsWord(S);
            i := 0;
            while i < 2 do
                i := i+1;
                if w[i] <> () then
                    Append(ranword,[w[i]]);
                    residue := SiftAsWord(S,ranword);
                    if residue[2]>0 then
                        # factorization is unsuccesful;
                        # remainder is witness that SGS for S is not complete
                        g := Product(residue[1]);
                        # Print("k=",k," i=",i," m=",m," mlimit=",mlimit,"\n");
                        return g;
                    elif correct then
                        # enough to check whether base points are fixed
                        l:=0;
                        while l < Length(missing) do
                            l:=l+1;
                            if ImageInWord(missing[l],residue[1])
                              <> missing[l]
                            then
                                # remainder is not in S
                                g := Product(residue[1]);
                                return g;
                            fi;
                        od;
                    else
                        # plug in points from each orbit to check whether
                        # action on orbit is trivial
                        l:=0;
                        while l < Length(orbits) do
                            l:=l+1;
                            if Length(orbits[l]) > param[5] then
                                # on large orbits, plug in random points
                                j := 0;
                                jlimit := Maximum(param[6],basesize[l]);
                                while j < jlimit do
                                    j := j+1;
                                    ran := RandomList([1..Length(orbits[l])]);
                                    if ImageInWord(orbits[l][ran],residue[1])
                                      <> orbits[l][ran]
                                    then
                                        #remainder is not in S
                                        g := Product(residue[1]);
                                        return g;
                                    fi;
                                od; #j loop
                            else
                                # on small orbits, plug in all points
                                j := 0;
                                while j < Length(orbits[l]) do
                                    j := j+1;
                                    if ImageInWord( orbits[l][j],residue[1] )
                                      <> orbits[l][j]
                                    then
                                        # remainder is not in S
                                        g:=Product(residue[1]);
                                        return g;
                                    fi;
                                od; #j loop
                            fi;
                        od; #l loop
                    fi;
                fi;
            od; #i loop
        od; #m loop
        if len <= 2*k then
            #finished making Schr. generators with all in S.aux
            k := param[1];
        fi;
    od; #k loop

    return ();
end;


#############################################################################
##
##  SCRSift
##
##  tries to factor g as product of cosetreps in S; returns remainder
##
SCRSift := function ( S, g )
    local stb,   # the stabilizer of S we currently work with
          bpt;   # first point of stb.orbit

    stb := S;
    while IsBound( stb.stabilizer ) do
        bpt := stb.orbit[1];
        if IsBound( stb.transversal[bpt^g] ) then
            while bpt <> bpt^g do
                g := g*stb.transversal[bpt^g];
            od;
            stb := stb.stabilizer;
        else
            #current g witnesses that input was not in S
            return g;
        fi;
    od;

    return g;
end;


#############################################################################
##
##  SCRStrongGenTest2
##
##  tests whether product of a random element of S and a random subproduct of
##  the  strong generators of S is  in S.  Computations  are carried out with
##  complete permutations.
##
SCRStrongGenTest2 := function ( S, param )
    local   x,i,k,m,      # loop variables
            ran1,ran2,    # random permutations
            string,       # random 0-1 string
            w,            # list containing random subproducts of generators
            len,          # number of generators of S
            len2,         # length of short random subproduct
            mlimit,       # number of random elements to be tested
            ranelement,   # random element of S
            residue;      # remainder of ranelement after factorization

    k := 0;
    while k < param[3] do
        k := k+1;
        len := Length(S.aux);
        #in case of large S.aux, form random subproducts
        #otherwise, try all of them
        if len > 2*param[3] then
            ran1 := SCRRandomPerm(len);
            ran2 := SCRRandomPerm(len);
            len2 := RandomList([1 .. QuoInt(len,2)]);
            string := SCRRandomString(len+len2);

            # we form two random subproducts:
            # w[1] in a random ordering of all generators
            # w[2] in a random ordering of a random subset of them
            w:=[];
            w[1] := ();
            for x in [1 .. len] do
                w[1] := w[1]*(S.aux[x^ran1]^string[x]);
            od;
            w[2] := ();
            for x in [1 .. len2] do
                w[2] := w[2]*(S.aux[x^ran2]^string[x+len]);
            od;

        else
            # take next two generators of S (unless only one is left)
            w := [];
            w[1] := S.aux[2*k-1];
            if len > 2*k-1 then
                w[2] := S.aux[2*k];
            else
                w[2] := ();
            fi;
        fi;

        # take random elements of S
        m := 0;
        mlimit := param[4]*S.diam;
        while m < mlimit do
            m:=m+1;
            ranelement := PermGroupOps.Random(S);
            i := 0;
            while i < 2 do
                i := i+1;
                if w[i] <> () then
                    # test whether product of ranelement and w[i] in S
                    ranelement := ranelement*w[i];
                    residue := SCRSift(S,ranelement);
                    if residue <> () then
                        return residue;
                    fi;
                fi;
            od; #i loop
        od; #m loop
        if len <= 2*k then
            #finished checking all in S.aux
            k := param[3];
        fi;
    od; #k loop

    return ();
end;


#############################################################################
##
##  SCRNotice
##
##  checks whether   orbit  is closed  for  the   action of  permutations  in
##  genlist. If not, returns orbit point and generator witnessing.
##
SCRNotice := function ( orb, transversal, genlist )
    local flag, #first component of output; true if orb is closed for
                #action of genlist
          i,    #second component of output, index of point in orb moving out
          j ;   #third component, index of permutation in genlist moving orb[i]

    i := 0;
    flag := true;
    while i < Length(orb) and flag  do
        i := i+1;
        j := 0;
        while j < Length(genlist) and flag do
            j := j+1;
            if not IsBound(transversal[orb[i]^genlist[j]])  then
                flag := false;
            fi;
        od;
    od;

    return [flag,i,j];
end;


#############################################################################
##
##  SCRExtend
##
##  given a partial Schreier tree of depth d,
##  SCRExtends the partial Schreier tree to depth d+1
##  input, output coded in list of length 5
##
SCRExtend := function ( list )
    local orb,          #partial orbit
          transversal,  #partial transversal
          treegen,      #list of generators
          treegeninv,   #inverses of elements of treegen
                        #both treegen, treegeninv are used in transversal
          i, j,         #loop variables
          previous,     #index, showing end of level d-1 in orb
          len;          #length of orb at entering routine

    orb:=list[1];
    transversal:=list[2];
    treegen:=list[3];
    treegeninv:=list[4];
    previous:=list[5];
    len:=Length(orb);

    # for each point on level d, check whether one of the generators or
    # inverses moves it out of orb. If yes, add image to orb
    for i in [previous+1..len] do
        for j in [1..Length(treegen)] do
            if not IsBound(transversal[orb[i]^treegen[j]]) then
                transversal[orb[i]^treegen[j]] := treegeninv[j];
                Add(orb, orb[i]^treegen[j]);
            fi;
            if not IsBound(transversal[orb[i]^treegeninv[j]]) then
                transversal[orb[i]^treegeninv[j]] := treegen[j];
                Add(orb, orb[i]^treegeninv[j]);
            fi;
        od;
    od;

    # return Schreier tree of depth one larger
    return [orb,transversal,treegen,treegeninv,len];

end;


#############################################################################
##
##  SCRSchTree
##
##  creates Schreier tree for the group generated by S.generators \cup new
##
SCRSchTree := function ( S, new )
    local l,        #output of notice
          flag,     #first component of output
          i,        #second component of output
          j,        #third component of output
          word,     #list of permutations coding a coset representative
          g,        #the coset representative coded by word
          witness,  #a permutation moving a point out of S.orbit
          list;     #list coding input and output of 'extend'

    l := SCRNotice(S.orbit,S.transversal,new);
    flag := l[1];
    if flag then
        #do nothing; the orbit did not change
        return;
    else
        i := l[2];
        j := l[3];
        witness := new[j];
    fi;

    while not flag do
        word := CosetRepAsWord(S.orbit[1],S.orbit[i],S.transversal);
        g := Product(word);
        #add a new generator to treegen which moves S.orbit[1] out of S.orbit
        Add(S.treegen, g^(-1)*witness);
        Add(S.treegeninv, witness^(-1)*g);

        #recompute Schreier tree to new depth
        S.orbit := [S.orbit[1]];
        S.transversal := [];
        S.transversal[S.orbit[1]] := ();
        S.treedepth := 0;
        list := [S.orbit,S.transversal,S.treegen,S.treegeninv,0];
        flag := false;

        #with k generators, we build only a tree of depth 2k
        while not flag and S.treedepth < 2*Length(S.treegen) do
            list := SCRExtend(list);
            S.orbit := list[1];
            S.transversal := list[2];
            if Length(S.orbit) = list[5] then
                #the tree did not extend; orbit is closed for treegen
                flag := true;
            else
                S.treedepth := S.treedepth + 1;
            fi;
        od;
        #increased S.orbit may not be closed for all generators of S
        l := SCRNotice(S.orbit,S.transversal,S.generators);
        flag := l[1];
        if not flag then
            i := l[2];
            j := l[3];
            witness := S.generators[j];
        fi;
    od;

    #update record components aux, diam
    S.aux := Concatenation(S.treegen,S.treegeninv,S.stabilizer.aux);
    S.diam := S.treedepth+S.stabilizer.diam;

end;


#############################################################################
##
##  SCRRandomPerm
##
##  constructs random permutation in Sym(d)
##  without creating group record of Sym(d)
##
SCRRandomPerm := function ( d )
    local   rnd,        # random permutation, result
            tmp,        # temporary variable for swapping
            i,  k;      # loop variables

    # use Floyd\'s algorithm
    rnd := [ 1 .. d ];
    for i  in [ 1 .. d-1 ]  do
        k := RandomList( [ 1 .. d+1-i ] );
        tmp := rnd[d+1-i];
        rnd[d+1-i] := rnd[k];
        rnd[k] := tmp;
    od;

    # return the permutation
    return PermList( rnd );
end;


#############################################################################
##
##  SCRRandomString
##
##  constructs random 0-1 string of length n
##  same steps as RandomList, but uses created random number for 28 bits
##
SCRRandomString := function ( n )
    local i, j,     # loop variables
          k,        # number of 28 long substrings
          rnd,      # the random number which would be created by RandomList
          string;   # the random string constructed

    string:=[];
    k:=QuoInt(n-1,28);
    for i in [0..k-1] do
        # follow steps in RandomList to create a random number < 2^28
        R_N := R_N mod 55 + 1;
        R_X[R_N] := (R_X[R_N] + R_X[(R_N+30) mod 55+1]) mod 2^28;
        rnd:=R_X[R_N];
        # use each bit of rnd
        for j in [1 .. 28] do
            string[28*i+j] := rnd mod 2;
            rnd := QuoInt(rnd,2);
        od;
    od;

    # construct last <= 28 bits  of string
    R_N := R_N mod 55 + 1;
    R_X[R_N] := (R_X[R_N] + R_X[(R_N+30) mod 55+1]) mod 2^28;
    rnd:=R_X[R_N];
    for j in [28*k+1 .. n] do
        string[j] := rnd mod 2;
        rnd := QuoInt(rnd,2);
    od;

    return string;
end;

###############################################################################
##
##  SCRRandomSubproduct(list) . . . . random subproduct of permutations in list
##
SCRRandomSubproduct := function (list)
    local string,  # 0-1 string containing the exponents of elements of list
          random,  # the random subproduct 
          i;       # loop variable

    string := SCRRandomString(Length(list));
    random := ();
    for i in [1 .. Length(list)] do
        if string[i] = 1 then 
            random := random*list[i];
        fi;
    od;

    return random;
end;

#############################################################################
##
##  SCRExtendRecord
##
##  defines record elements used at random stabilizer chain construction
##
SCRExtendRecord := function(G)
    local list,       # list of stabilizer subgroups
          len,        # length of list
          i;          # loop variable

    list := ListStabChain(G);
    len := Length(list);
    list[len].diam := 0;
    list[len].aux := [];
    for i in [1 .. len - 1] do
        # list[len - i].real := list[len - i].generators;

        if Length(list[len - i].orbit) = 1 then 
            # in this case, SCRSchTree will not do anything; 
            # we have to define records treedepth, aux, and diameter
            list[len - i].treedepth := 0;
            list[len - i].aux := list[len - i + 1].aux;
            list[len - i].diam := list[len - i + 1].diam;
        fi;

        list[len - i].orbit := [ list[len - i].orbit[1] ];
        list[len - i].transversal := [];
        list[len - i].transversal[list[len - i].orbit[1]]
            := list[len - i].identity;
        list[len - i].treegen := [];
        list[len - i].treegeninv := [];
        SCRSchTree( list[len - i], list[len - i].generators );

    od;

end;


#############################################################################
##
##  SCRRestoreRecord
##
##  restores usual group records after random stabilizer chain construction
##
SCRRestoreRecord := function(G)
    local list,       # list of stabilizer subgroups
          len,        # length of list
          i;          # loop variable

    list := ListStabChain(G);
    len := Length(list);
    Unbind(list[len].diam);
    Unbind(list[len].aux);
    for i in [1 .. len - 1] do
        # list[len - i].generators := list[len - i].real;
        list[len - i].orbit := [ list[len - i].orbit[1] ];
        list[len - i].transversal := [];
        list[len - i].transversal[list[len - i].orbit[1]]
            := list[len - i].identity;
        PermGroupOps.AddGensExtOrb(list[len - i],list[len - i].generators);
        Unbind(list[len - i].aux);
        Unbind(list[len - i].treegen);
        Unbind(list[len - i].treegeninv);
        Unbind(list[len - i].treedepth);
        Unbind(list[len - i].diam);
    od;

end;


#############################################################################
##
#F  PermGroupOps.StabChainRandomKnownBase(<gens>,<base>,<known>)  . compute a
#F                               stabilizer chain randomly if a base is known
##
PermGroupOps.StabChainRandomKnownBase := function ( gens, options )
    return PermGroupOps.StabChainRandom( gens, options );
end;


#############################################################################
##
#F  PermGroupOps.StabChainChange(<G>,<base>)  . . . . . .  change a stabchain
#F                                                       for a different base
##
SC_level := 0;          # only for information

PermGroupOps.StabChainChange := function ( chain, base )
    local   stab,       # stabilizer in the stabchain
            cnj,        # conjugating permutation
            i;          # loop variable

    # give some information
    SC_level := 1;
    InfoPermGroup1("#I  StabChainChange called\n");

    # intialize the conjugating permutation
    cnj := ();

    # go down the stabchain
    stab := chain;
    i := 1;
    while i <= Length(base)  and IsBound(stab.stabilizer)  do

        # do not insert trivial stabilizers
        if ForAny( stab.generators, gen->(base[i]^cnj)^gen<>base[i]^cnj )  then

            # get the <i>th point of the base into the orbit of $H$
            InfoPermGroup2("#I    force ",base[i]^cnj," (=",base[i],"^cnj) ",
                           "to level ",SC_level,"\n");
            PermGroupOps.StabChainForcePoint( stab, base[i]^cnj );

            # extend the conjugating permutation
            while base[i]^cnj <> stab.orbit[1]  do
                cnj := cnj * stab.transversal[base[i]^cnj];
            od;

            # on to the next stabilizer
            stab := stab.stabilizer;
            SC_level := SC_level + 1;

        else
            InfoPermGroup2("#I    skip ",base[i]^cnj," (=",base[i],"^cnj) ",
                           "on level ",SC_level,"\n");
        fi;

        # on to the next basepoint
        i := i + 1;

    od;

    # conjugate to move all the points to the beginning of their orbits
    if cnj <> ()  then
        PermGroupOps.StabChainConjugate( chain, cnj^-1 );
    fi;
    InfoPermGroup1("#I  StabChainChange done\n");

    # return the chain
    return chain;
end;


#############################################################################
##
#F  PermGroupOps.StabChainForcePoint(<S>,<pnt>) .  force a point in the orbit
##
PermGroupOps.StabChainForcePoint := function ( S, pnt )

    # do nothing if <pnt> is already in the orbit of <S>
    if not IsBound(S.orbit)  or not pnt in S.orbit  then

        # if all generators of <S> fix <pnt> insert a trivial stabilizer
        if ForAll( S.generators, gen -> pnt ^ gen = pnt )  then

            InfoPermGroup2("#I      inserting trivial stabilizer for ",
                           pnt," on level ",SC_level,"\n");

            S.stabilizer              := ShallowCopy( S );
            S.stabilizer.generators   := ShallowCopy( S.generators );
            S.orbit                   := [ pnt ];
            S.transversal             := [];
            S.transversal[pnt]        := ();

        # otherwise
        else

            # get <pnt> in the orbit of the stabilizer
            SC_level := SC_level + 1;
            PermGroupOps.StabChainForcePoint( S.stabilizer, pnt );
            SC_level := SC_level - 1;

            # and swap the two stabilizers
            PermGroupOps.StabChainSwap( S );

        fi;

    else
        InfoPermGroup2("#I      found ",pnt," on level ",SC_level,"\n");
    fi;

end;


#############################################################################
##
#F  PermGroupOps.StabChainSwap(<S>) . . . . . . . . . exchange two basepoints
##
PermGroupOps.StabChainSwap := function ( S )
    local   a,  b,      # basepoints that are to be switched
            T,          # copy of $S$ with $T.stabilizer$ becomes $S_b$
            pnt,        # one point from $a^S$ not yet in $a^{T_b}$
            ind,        # index of <pnt> in $S.orbit$
            img,        # image $b^{Rep(S,pnt)^-}$
            gen,        # new generator of $T_b$
            i;          # loop variable

    # get the two basepoints $a$ and $b$ that we have to switch
    a := S.orbit[1];
    b := S.stabilizer.orbit[1];
    InfoPermGroup2("#I      swap ",b," with ",a," on level ",SC_level,"\n");

    # set $T = S$ and compute $T.orbit = b^T$ and a transversal $T/T_b$
    T := rec();
    T.identity       := ();
    T.generators     := S.generators;
    T.orbit          := [ b ];
    T.transversal    := [];
    T.transversal[b] := ();
    PermGroupOps.AddGensExtOrb( T, S.generators );

    # initialize $T.stabilizer$, which will become $T_b$
    T.stabilizer := rec();
    T.stabilizer.identity       := ();
    T.stabilizer.generators:=ShallowCopy(S.stabilizer.stabilizer.generators);
    T.stabilizer.orbit          := [ a ];
    T.stabilizer.transversal    := [];
    T.stabilizer.transversal[a] := ();

    # in the end $|b^T||a^{T_b}| = [T:T_{ab}] = [S:S_{ab}] = |a^S||b^{S_a}|$
    ind := 1;
    while Length(T.orbit) * Length(T.stabilizer.orbit)
        < Length(S.orbit) * Length(S.stabilizer.orbit)  do

        # choose a point $pnt \in a^S \ a^{T_b}$ with representative $s$
        repeat ind := ind + 1;  until not S.orbit[ind] in T.stabilizer.orbit;
        pnt := S.orbit[ind];

        # find out what $s^-$ does with $b$ (without computing $s$!)
        img := b;
        i := pnt;
        while i <> a  do
            img := img ^ S.transversal[i];
            i   := i   ^ S.transversal[i];
        od;

        # if $b^{s^-}} \in b^{S_a}$ with representative $r \in S_a$
        if IsBound(S.stabilizer.transversal[img])  then

            # with $gen = s^- r^-$ we have
            # $b^gen = {b^{s^-}}^{r^-} = img^{r-} = b$, so $gen \in S_b$
            # and $pnt^gen = {pnt^{s^-}}^{r^-} = a^{r-} = a$, so $gen$ is new
            gen := S.transversal[pnt];
            while pnt ^ gen <> a  do
                gen := gen * S.transversal[pnt^gen];
            od;
            while b ^ gen <> b  do
                gen := gen * S.stabilizer.transversal[b^gen];
            od;

            # add the new generator to $T_b$ and extend orbit and transversal
            PermGroupOps.AddGensExtOrb( T.stabilizer, [ gen ] );

        fi;

    od;

    # copy everything back into the stabchain
    S.generators                 := T.generators;
    S.orbit                      := T.orbit;
    S.transversal                := T.transversal;
    if Length(T.stabilizer.orbit) = 1  then
        S.stabilizer             := S.stabilizer.stabilizer;
    else
        S.stabilizer.generators  := T.stabilizer.generators;
        S.stabilizer.orbit       := T.stabilizer.orbit;
        S.stabilizer.transversal := T.stabilizer.transversal;
    fi;

end;


#############################################################################
##
#F  PermGroupOps.StabChainConjugate(<G>,<g>)  . . . . . conjugate a stabchain
##
PermGroupOps.StabChainConjugate := function ( chain, g )
    local    stab,      # stabilizer in stabchain
             sgs,       # strong generating system
             cnj,       # conjugated strong generating system
             old,       # old generators of a stabilizer
             orb,       # old orbit of a stabilizer
             trn,       # old transversal of a stabilizer
             i;         # loop variable

    # initialize the strong generators and their conjugates
    sgs := [ () ];
    cnj := [ () ];

    # go down the stabchain to conjugate every stabilizer
    stab := chain;
    while Length(stab.generators) <> 0  do

        # conjugate the generators of this stabilizer
        old := stab.generators;
        stab.generators := [];
        for i  in [1..Length(old)]  do
            if not old[i] in sgs  then
                Add( sgs, old[i] );
                Add( cnj, old[i]^g );
            fi;
            stab.generators[i] := cnj[ Position(sgs,old[i]) ];
        od;

        # conjugate the orbit and the transversal of this stabilizer
        orb              := stab.orbit;
        trn              := stab.transversal;
        stab.orbit       := [];
        stab.transversal := [];
        for i  in [1..Length(orb)]  do
            stab.orbit[i]                  :=orb[i]^g;
            stab.transversal[stab.orbit[i]]:=cnj[Position(sgs,trn[orb[i]])];
        od;

        # on to the next stabilizer
        stab := stab.stabilizer;

    od;

end;


#############################################################################
##
#F  PermGroupOps.StabChainStrongGenerators(<G>,<base>,<stronggens>) . . . . .
#F  construct a reduced stabilizer chain for a given strong generating system
##
PermGroupOps.StabChainStrongGenerators := function ( stronggens, base )
    local   chain,      # stabilizer chain, result
            stab,       # stabilizer in the chain
            bpt;        # base point

    # initialize the stabilizer chain
    stab  := rec();
    chain := stab;

    # loop over the basepoints
    for bpt  in base  do

        # if this step is not trivial
        if not ForAll( stronggens, gen -> bpt^gen = bpt )  then

            # add the generators
            stab.generators  := stronggens;
            stab.identity    := ();

            # calculate orbit and transversal on this level
            stab.orbit       := [ bpt ];
            stab.transversal := [];
            stab.transversal[ bpt ] := ();
            PermGroupOps.AddGensExtOrb( stab, stab.generators );

            # initialize next stabilizer and compute its generators
            stab.stabilizer  := rec( generators := [], identity := () );
            stronggens := Filtered( stronggens, gen -> bpt^gen = bpt );

            # and go down to the next level
            stab := stab.stabilizer;

        fi;

    od;

    # return the stabilizer chain
    return chain;
end;


#############################################################################
##
#F  PermGroupOps.StabChainReduce(<chain>) . . . .  remove trivial stabilizers
##
PermGroupOps.StabChainReduce := function ( chain )
    local   stab;          # stabilizer in the stabchain

    # go down the stabchain and remove trivial stabilizers
    stab := chain;
    while Length(stab.generators) <> 0  do

        # if this stabilizer is trivial copy the entries from the next level
        if Length(stab.orbit) = 1  then
            stab.generators  := stab.stabilizer.generators;
            stab.identity    := stab.stabilizer.identity;
            stab.orbit       := stab.stabilizer.orbit;
            stab.transversal := stab.stabilizer.transversal;
            stab.stabilizer  := stab.stabilizer.stabilizer;

        # otherwise go on with the next level
        else
            stab := stab.stabilizer;

        fi;

    od;

    # remove trivial stabilizers at the end of the stabchain
    Unbind( stab.orbit       );
    Unbind( stab.transversal );
    Unbind( stab.stabilizer  );

    # return the chain
    return chain;
end;


#############################################################################
##
#F  PermGroupOps.StabChainExtend(<chain>,<base>)   insert trivial stabilizers
##
PermGroupOps.StabChainExtend := function ( chain, base )
    local   stab,          # stabilizer of <chain>
            i;          # loop variable

    # go down the stabchain and insert trivial stabilizers
    stab := chain;
    i := 1;
    while i <= Length(base)  do

        # if necessary append a trivial stabilizer
        if Length(stab.generators) = 0  then

            stab.orbit                   := [ base[i] ];
            stab.transversal             := [];
            stab.transversal[base[i]]    := ();
            stab.stabilizer              := rec();
            stab.stabilizer.generators   := [];
            stab.stabilizer.identity     := ();

        # if necessary insert a trivial stabilizer
        elif base[i] <> stab.orbit[1]  then

            # test that the new base is really an extension of the current
            if ForAny( stab.generators, gen -> base[i]^gen <> base[i] )  then
                Error("<base> must reduce to base of <G>");
            fi;

            stab.stabilizer              := ShallowCopy(stab);
            stab.stabilizer.generators   := ShallowCopy( stab.generators );
            stab.orbit                   := [ base[i] ];
            stab.transversal             := [];
            stab.transversal[base[i]]    := stab.identity;

        fi;

        # on to the next basepoint and the next stabilizer
        stab := stab.stabilizer;
        i := i + 1;

    od;

    # return the stabchain
    return chain;
end;


#############################################################################
##
#F  BaseStabChain(<chain>)  . . . . . . . . . . . base for a stabilizer chain
##
BaseStabChain := function ( chain )
    local   base,
            stab;
    base := [];
    stab := chain;
    while Length(stab.generators) <> 0  do
        Add( base, stab.orbit[1] );
        stab := stab.stabilizer;
    od;
    return base;
end;


#############################################################################
##
#F  MakeStabChain(<G>[,<base>]) . . . . . . . . .  compute a stabilizer chain
#F                                                    for a permutation group
#F  MakeStabChainRandom(<G>[,<base>]) . . . . . .  compute a stabilizer chain
#F                                                    for a permutation group
#F  MakeStabChainStrongGenerators(<G>,<base>,<stronggens>)  . . . construct a
#F              reduced stabilizer chain for a given strong generating system
#F  ReduceStabChain(<G>)  . . . . remove trivial stabilizers from a stabchain
#F  ExtendStabChain(<G>,<base>) . . insert trivial stabilizers in a stabchain
##
MakeStabChain := function ( arg )
    if Length(arg) = 1  then
        if IsBound( arg[1].stabChain ) or Length( arg[1].generators )=0  then
            StabChain( arg[1],
                       rec( reduced := true ) );
        else
            StabChain( arg[1],
                   rec( base := [1..PermGroupOps.LargestMovedPoint(arg[1])],
                            reduced := true ) );
        fi;
    elif Length(arg) = 2  then
        StabChain( arg[1],
                   rec( base    := arg[2],
                        reduced := true ) );
    else
        Error("usage: MakeStabChain( <G> [, <base>] )");
    fi;
end;

MakeStabChainRandom := function ( arg )
    if Length(arg) = 1  then
        if IsBound( arg[1].stabChain )   or Length( arg[1].generators )=0 then
            StabChain( arg[1],
                       rec( reduced := true ) );
        else
            StabChain( arg[1],
                   rec( base := [1..PermGroupOps.LargestMovedPoint(arg[1])],
                            random := true,
                            reduced := true ) );
        fi;
    elif Length(arg) = 2  then
        StabChain( arg[1],
                   rec( base := arg[2],
                        random := true,
                        reduced := true ) );
    fi;
end;

MakeStabChainStrongGenerators := function ( grp, base, stronggens )
    StabChain( grp,
               rec( base := base,
                    strongGenerators := stronggens,
                    reduced := true ) );
end;

ReduceStabChain := function ( grp )
    StabChain( grp,
               rec( reduced := true ) );
end;

ExtendStabChain := function ( grp, base )
    StabChain( grp,
               rec( base := base,
                    reduced := false ) );
end;


#############################################################################
##
#F  ListStabChain(<G>)  . . stabilizer chain of a permutation group as a list
##
ListStabChain := function ( G )
    local   S,          # stabilizer of <G>
            lst;        # stabchain, result

    # handle trivial case
    if Length(G.generators) = 0 and not IsBound(G.stabilizer) then
       return [ G ];
    fi;

    # make sure that <G> has a stabchain
    if not IsBound(G.stabilizer)  then MakeStabChain( G );  fi;

    # go down the stabchain and collect the stabilizers
    lst := [];
    S := G;
    while IsBound(S.stabilizer)  do
        Add( lst, S );
        S := S.stabilizer;
    od;
    Add( lst, S );

    # return the stabchain
    return lst;
end;


#############################################################################
##
#F  PermGroupOps.MinimalStabChain(G) . . the stab. chain corresponding to the
##                                       minimal base of G
##
PermGroupOps.MinimalStabChain := function(G)
  if not IsBound(G.minimalStabChain) then
    if Length(G.generators)=0 then
      # special case for the trivial group
      G.minimalStabChain:=Copy(StabChain(G));
    else
      G.minimalStabChain:=Copy(StabChain(G,
	    rec(base:=[1..PermGroupOps.LargestMovedPoint(G)],
		reduced:=true)));
    fi;
  fi;
  return G.minimalStabChain;
end;

