#############################################################################
##
#A  pq.g                        GAP library                     Werner Nickel
#A                                                           & Alice Niemeyer
##
#A  @(#)$Id: pq.g,v 3.10 1992/08/19 11:24:41 fceller Rel $
##
#Y  Copyright 1991,  Mathematics Research Section,  ANU,  Canberra, Australia
##
##   This file contains an  implementation of  the  $p$-quotient algorithm as
##  specified by  Havas and  Newman  ("Application  of computers to questions
##  like  those  of  Burnside"  in Lecture Notes in Mathematics 806, Springer
##  1980).  Many tricks and techniques  used in  this  implementation are not
##  published  and  we learnt  them in many discussions from  Mike Newman. He
##  also explained and  pointed out to us  important sections of  the FORTRAN
##  code  of the Canberra   Nilpotent  Quotient  Program, which  is  the only
##  (written)  source of information  on  the  implementation  and  the  fine
##  details of the $p$-Quotient Algorithm.
##
##   This  implementation is written for GAP 3.1 and Frank Celler's extension
##  of the Pc-Module which makes it possible to handle central extensions  of
##  $p$-groups  more efficiently  than  this  was  possible in  GAP 2.6.  The
##  current internal code supporting the needs for the $p$-quotient algorithm
##  was written by  Frank Celler according  to  the observations made in many
##  experimental  versions  of the  $p$-Quotient Algorithm.  At  the  time of
##  writing  the  current  implementation  runs within a factor of two of the 
##  FORTRAN standalone.
##
##  THE PQ-DATA-STRUCTURE RECORD:
##
##   The   $p$-Quotient  Algorithm   deals  with  finite   presentations  for
##  $p$-quotients of groups. In the implementation, we store a finite presen-
##  tation  of a $p$-quotient $Q$  of a group in a record which we will  call
##  the PQp record. It contains the following record fields :
##
##   .generators               A list of abstract generators which generate Q
##   .pcp                      An internal pcp-description for Q
##   .identity                 The identity element of the group Q
##   .dimensions               A  list, where dimensions[i] is the  dimension
##                             of the $i$-th factor in the lower exponent-$p$
##                             central series calculated by the  $p$-Quotient 
##                             Algorithm
##   .prime                    An integer, which is the prime $p$
##   .one                      A finite field element, the unit of  $GF(p)$
##   .maxgennr                 An integer used to create names for generators
##   .nrgens                   An integer, the  number  of  generators of the
##                             previously computed quotient, used to identify
##                             the last element in .generators which does not 
##                             lie in the $p$-multiplicator
##   .nrnewgens                An integer specifying  how many new generators
##                             are still  alive.  It  is  used  to  determine 
##                             quickly, whether the $p$-quotient is completed
##   .defining                 A list of two sets :
##          .defining[1]         -  contains  the  triangle-indices  of those
##                                  commutators that  define  a new  ( or, in
##                                  the  process  of  the $p$-cover algorithm
##                                  also, pseudo ) generator
##          .defining[2]         -  contains  the indices of those generators
##                                  whose $p$-th  powers  define  a  new ( or 
##                                  pseudo ) generator
##   .definedby                A list which contains the  definition  of  the 
##                             $k$-th generator  in  the  $k$-th place. There 
##                             are  three  different types of entries, namely
##                             lists, positive and negative integers :
##          [ j, i ]             -  the generator is defined as commutator of
##                                  the  $j$-th  and  the  $i$-th  element in 
##                                  .generators
##            i                  -  the generator is defined as $p$-th  power
##                                  of the $i$-th element in .generators
##           -i                  -  the generator is  defined  as an image of
##                                  the $i$-th generator  in the presentation
##                                  for  $G$,  consequently  it  must  be  of
##                                  weight 1
##   .isdefinition             A list of two boolean lists
##          .isdefinition[1]     -  the $(j-2)d+i$-th entry  is  true  if the
##                                  commutator of the $j$-th and  the  $i$-th
##                                  generator  is a  definition,  else  false 
##                                  ($d$=.dimensions[1])
##          .isdefinition[2]     -  the  $i$-th  entry  is true if the $p$-th
##                                  power  of  the  $i$-th  generator   is  a
##                                  definition, else false
##   .epimorphism              A  list  containing  an  image in $Q$ for each
##                             generator of  $G$.  The  image  is  one of the 
##                             following:
##                i              - the image is the $i$-th element of 
##                                 .generators
##                word           - the image is word,  which is a word in the 
##                                 generators of $Q$
##   .pInverse                 A list containing the inverse of $i$ in  GF(p)
##                             at position $i$.
##
#H  $Log: pq.g,v $
#H  Revision 3.10  1992/08/19  11:24:41  fceller
#H  'exponents' is now added in 'FirstClassPQp'
#H
#H  Revision 3.9  1992/08/19  10:00:48  fceller
#H  changed 'SavePQp' to 'Save'
#H
#H  Revision 3.8  1992/08/10  12:21:05  fceller
#H  added 'FpGroup' support
#H
#H  Revision 3.7  1992/06/29  14:00:06  fceller
#H  cleand up a few names
#H
#H  Revision 3.6  1992/06/04  07:04:20  fceller
#H  added 'AgGroup' for PqPresentation
#H
#H  Revision 3.5  1992/04/03  18:22:09  martin
#H  changed the author line
#H
#H  Revision 3.4  1992/02/20  16:41:58  fceller
#H  '.relations' renamed to '.relators'.
#H
#H  Revision 3.3  1991/09/30  10:55:44  fceller
#H  Long lines removed, they cause problems with mailer.
#H
#H  Revision 3.2  1991/09/24  15:50:10  fceller
#H  Removed unnecessery error message.
#H
#H  Revision 3.1  1991/09/13  09:12:00  fceller
#H  Inital Release under RCS
#H
##
##


#############################################################################
##
#F  InfoPQ1( <arg> )  . . . . . . . . . . . . . . . . . . package information
#F  InfoPQ2( <arg> )  . . . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoPQ1 )  then InfoPQ1 := Print;  fi;
if not IsBound( InfoPQ2 )  then InfoPQ2 := Ignore;  fi;


#############################################################################
##

#F  PQpOps  . . . .  . . . . . . . . . . . . . . . .  presentation operations
##
PQpOps := rec();


#############################################################################
##
#F  PQpOps.Print( <P> ) . . . . . . . . . . . . . . . . .  print a PQp record
##
PQpOps.Print := function( P )

    local   i,  j,  com,  lst;

    Print("PQp( rec( \n");
    Print("   generators  := ", P.generators,",\n"  );
    Print("   definedby   := ", P.definedby, ",\n"  );
    Print("   prime       := ", P.prime, ",\n"      );
    Print("   dimensions  := ", P.dimensions, ",\n" );
    Print("   epimorphism := ", P.epimorphism, ",\n");

    Print("   powerRelators := [ " );
    for i  in [1 .. Length(P.generators)]  do
        if PowerPcp(P.pcp, i) = IdWord  then
            Print(P.generators[i],"^",P.prime);
        else
            Print(P.generators[i],"^",P.prime,"/(",PowerPcp(P.pcp,i),")");
        fi;
        if i < Length(P.generators) then
            Print(", ");
        else
            Print(" ],\n");
        fi;
    od;

    com := false;
    lst := [];
    Print( "   commutatorRelators := [ " );
    for i  in [2 .. Length(P.generators)]  do
        for j in  [1 .. i-1]  do
            if CommPcp(P.pcp, i, j) <> IdWord  then
                if com  then
                    Print(", ");
                else
                    com := true;
                fi;
                Print("Comm(",P.generators[i],",",P.generators[j],
                      ")/(",CommPcp(P.pcp, i, j),")");
                Add(lst, [i,j]);
            fi;
        od;
    od;
    Print(" ],\n   definingCommutators := ", lst, " ) )" );

end;



#############################################################################
##
#F  PQpOps.AgGroup  . . . . . . . . . . . . . . . .  convert into an ag group
##
PQpOps.AgGroup := function( P )
    return AgGroupPcp(P.pcp);
end;


#############################################################################
##
#F  PQpOps.FpGroup  . . . . . . . . . . . . . . . .  convert into an fp group
##
PQpOps.FpGroup := function( P )
    return FpGroup(AgGroupPcp(P.pcp));
end;


#############################################################################
##
#F  PQp( <R> )  . . . . . . . . . . . . . . . . . . . .  restore a PQp record
##
##  'PQp' takes as argument a GAP record containing all information necessary
##  to  restore the internal pcp-description, such as the GAP  record created
##  by the function 'Print'.
##
PQp := function(G)

    local       P, i, j, cw, ii, r, rr, k, w;

    P := Pcp("a", Length(G.generators), G.prime, "combinatorial");
    P := rec( generators       := GeneratorsPcp(P),
              pcp              := P,
              prime            := G.prime,
              one              := Z(G.prime)^0,
              nrgens           := Length(G.generators),
              maxgennr         := Length(G.generators)+1,
              nrnewgens        := Length(G.generators),
              defining         := [[],[]],
              definedby        := Copy(G.definedby),
              isdefinition     := [ BlistList([],[]),
                                    BlistList([],[]) ],
              dimensions       := Copy(G.dimensions),
              epimorphism      := Copy(G.epimorphism),
              isPQp            := true,
              operations       := PQpOps
         );

    for i  in [ 1 .. Length(G.generators) ]  do
        Add(P.isdefinition[2], false);
    od;
    for i  in [ 1 .. Length(P.generators)*P.dimensions[1]]  do
        Add(P.isdefinition[1], false);
    od;
    for k in [ 1 .. Length(P.definedby)] do
        if IsList(P.definedby[k]) then
            j := P.definedby[k][1];
            i := P.definedby[k][2];
            P.isdefinition[1][(j-2)*P.dimensions[1]+i] := true;
            AddSet(P.defining[1], TriangleIndex(j,i));
        elif P.definedby[k] > 0 then
            P.isdefinition[2][P.definedby[k]] := true;
            AddSet(P.defining[2], P.definedby[k]);
        fi;
    od;

    P.identity := P.generators[1]^0;

    # compute inverses of 1 .. p-1 in GF(p) as suggested by M. Sch"onert
    r := PrimitiveRootMod( P.prime );  rr := r;
    i := 1/r mod P.prime;              ii := i;
    P.pInverse := [1];
    while rr <> 1  do
        P.pInverse[rr] := ii;
        rr := rr * r mod P.prime;
        ii := ii * i mod P.prime;
    od;
        
    cw := [];
    for i  in [ 1 .. Length(G.dimensions) ]  do
        for j  in [ 1 .. G.dimensions[i] ]  do
            cw[Length(cw)+1] := i;
        od;
    od;
    DefineCentralWeightsPcp(P.pcp, cw);

    for i  in [ 1 .. Length(G.generators) ]  do
        w := G.powerRelators[i]^-1 * G.generators[i]^G.prime;
        DefinePowerPcp(P.pcp, i, MappedWord(w,G.generators,P.generators));
    od;

    for i  in [ 1 .. Length(G.commutatorRelators) ]  do
        w := G.commutatorRelators[i]^-1
             * Comm(G.generators[G.definingCommutators[i][1]],
                    G.generators[G.definingCommutators[i][2]]);
        DefineCommPcp(P.pcp,
                      G.definingCommutators[i][1],
                      G.definingCommutators[i][2],
                      MappedWord(w, G.generators, P.generators));
    od;

    for i  in [ 1 .. Length(P.epimorphism) ]  do
        if not IsInt(P.epimorphism[i])  then
            P.epimorphism[i] :=
                MappedWord(G.epimorphism[i],G.generators,P.generators);
        fi;
    od;
    return P;

end;

#############################################################################
##
#F  SavePQp( <file>, <P>, <N> ) . . . . . . . . . . . . . . saves <P> to file
##
##  'SavePQp' prints the PQp record <P> to the file <file> with name <N>.
##
PQpOps.Save := function( file, P, N )

    local       i;

    PrintTo(file, "");
    for i  in [ 1 .. Length(P.generators) ]  do
        AppendTo(file, P.generators[i], " := AbstractGenerator(\"",
                 P.generators[i],"\");\n");
    od;
    AppendTo(file, N, " := ", P, ";");

end;
SavePQp := PQpOps.Save;


#############################################################################
##


#F  InitPQp( <rank>, <prime> )  . . . . . . . . . .  initializes a PQp record
##  
##  'InitPQp' creates a  PQp record for an  elementary abelian  group of rank
##  <rank> and order <prime>^<rank>.
##
InitPQp := function( rank, prime )

    local   i, ii, r, rr, P;


    P := rec();
    if rank > 0 then
        P.pcp          := Pcp( "g", rank, prime, "combinatorial" );
        P.generators   := GeneratorsPcp( P.pcp );
        P.identity     := P.generators[1]^0;
    else
        P.generators := [];
    fi;
    P.dimensions   := [];
    P.prime        := prime;
    P.maxgennr     := Length(P.generators)+1;
    P.nrgens       := 0;
    P.nrnewgens    := 0;
    P.one          := Z(P.prime)^0;
    P.defining     := [ [], [] ];
    P.definedby    := [];
    P.isdefinition := [ BlistList( [], [] ), BlistList( [], [] ) ];
    P.epimorphism  := [];
    P.pInverse     := [1];
    P.unused       := 0;
    P.isPQp        := true;
    P.operations   := PQpOps;

    # initialise the .definedby entries for the first <rank> generators
    for i  in [ 1 .. Length(P.generators)]  do
        P.definedby[i] := -i;
    od;

    # compute inverses of 1 .. p-1 in GF(p) as suggested by M. Sch"onert
    r := PrimitiveRootMod( P.prime );  rr := r;
    i := 1/r mod P.prime;              ii := i;
    while rr <> 1  do
        P.pInverse[rr] := ii;
        rr := rr * r mod P.prime;
        ii := ii * i mod P.prime;
    od;

    # initialise .epimorphism
    for i  in [1 .. rank] do  P.epimorphism[i] := i;  od;
    return P;

end;


#############################################################################
##
#F  AddGeneratorsPQp( <P>, <cl> ) . . . . . . . .  adds new/pseudo generators
##  
##  This function  adds the  new and pseudo generators to the PQp record  <P>
##  corresponding to  weight <cl>. Call a generator  $g$  a new generator  if
##  <cl> is the  maximal  class  of the $p$-quotient  and  call  it a  pseudo
##  generator otherwise.  Whether <cl> is  the maximal class is tested in the
##  code by comparing <cl> to the length of '<P>.dimensions'.
##
##  The rule for adding new/pseudo generators of weight <cl> is :
##  1) for a relation $[ b, a ] = w$ add a new/pseudo generator $g$ such that
##     the relation  becomes $[ b,  a  ] =   wg$, if  the relation is   not a
##     definition and $wt(a) =  1$  and $wt(b)  =  <cl>-1$.   Call   this the
##     definition of the new/pseudo generator $g$.
##  2) for a relation $a^p =  w$ add a new/pseudo generator $g$ such that the
##     $wt(a) = 1$ or $a$ is defined as a $p$-th  power and $wt(a) = <cl>-1$.
##     Call this the definition of $g$.
##
AddGeneratorsPQp := function( P, cl )

    local   i, j, x, k, l;


    # set l to the number of generators of weight less or equal cl
    l := 0;
    for i  in [1 .. cl]  do l := l + P.dimensions[i];  od;
        
    # Add new/pseudo generators to the commutators
    k  := Length(P.definedby) + 1;
    for  j  in [ l-P.dimensions[cl]+1 .. l]  do

        # define pseudo generators for commutator relations
        for  i in [1 .. Minimum(P.dimensions[1],j-1)]  do

            # add new/pseudo generators to all  rhs of  relations,  which are
            # not definitions
            x := TriangleIndex(j,i);
            if  cl = Length(P.dimensions)  then
                AddSet( P.defining[1], x );
                P.definedby[k] := [ j, i ];
                DefineCommPcp( P.pcp, j, i, P.generators[k] );
                k := k + 1;
            elif  not x in P.defining[1] then
                AddSet( P.defining[1], x );
                P.definedby[k] := [ j, i ];
                AddCommPcp( P.pcp, j, i, P.generators[k] );
                k := k + 1;
            fi;
        od;
    od;

    # add new/pseudo generators to the $p^{th}$-powers
    for  i  in [l-P.dimensions[cl]+1 .. l]  do

        # Add  a new/pseudo  generator for each  generator  $a_i$, for  which
        # $a_i$ is not a definition and $a_i$ is defined as $p$-th power
        if  IsInt( P.definedby[i] ) then
            if  cl = Length(P.dimensions)  then
                AddSet( P.defining[2], i );
                P.definedby[k] := i;
                DefinePowerPcp( P.pcp, i, P.generators[k] );
                k := k + 1;
            elif not i in P.defining[2] then
                AddSet( P.defining[2], i );
                P.definedby[k] := i;
                AddPowerPcp( P.pcp, i, P.generators[k] );
                k := k + 1;
            fi;
        fi;
    od;

end;


#############################################################################
##
#F  DefineGeneratorsPQp( <P> )  . . . . . . . . defines new/pseudo generators
##
##  DefineGeneratorsPQp() creates the new and pseudo generators necessary for
##  the computation of  the $p$-cover  of the group defined by the PQp record
##  <P> and adds them to the internal power commutator presentation '<P>.pcp'
##  of the PQp record by the function 'ExtendCentralPcp'.
##
DefineGeneratorsPQp := function( P )

    local   l,  i,  nr_newgens, newgens, cl;

    # l will be the number of generators of weight less or equal <cl>
    l := Sum( P.dimensions );
    newgens := [];
    for  cl in  Reversed( [1 .. Length(P.dimensions)] )  do
        nr_newgens := 0;

        # The following  for-loop can  be avoided  by storing  the  number of
        # generators per  class  defined  by  $p^{th}$-powers  in  the  group
        # record.   But that should  not have  a  significant impact  on  the
        # performance of the PQ.
        for  i in [ l-P.dimensions[cl]+1 .. l]  do

            # Test if $a_i$ was defined as a $p$-th power
            if  IsInt(P.definedby[i]) then
                nr_newgens := nr_newgens + 1;
            fi;
        od;

        # Compute the number of  commutators of the form [ cl, 1 ].  Note the
        # different handling in case cl = 1.  If cl is the maximal class this
        # gives us the number of new generators.
        if cl = 1 then
            nr_newgens := nr_newgens + P.dimensions[1]*(P.dimensions[1]-1)/2;
        else
            nr_newgens := nr_newgens + P.dimensions[1]*P.dimensions[cl];
        fi;

        # Subtract from the  number of  generators  those that have survived.
        # This is the number of pseudo generators.
        if cl < Length(P.dimensions) then
            nr_newgens := nr_newgens - P.dimensions[cl+1];
        fi;

        if cl = Length(P.dimensions) then 
            P.nrnewgens := P.nrgens + nr_newgens; 
            P.nrnewgensleft := nr_newgens;
        fi;

        # Create the new/pseudo generators.
        if cl < Length(P.dimensions) then
            for i in [ 1 .. nr_newgens ] do     # "p" as in "p"seudo
                Add( newgens, "p" );
            od;
        else
            for i in [ 1 .. nr_newgens ] do
                Add(newgens,ConcatenationString("a",StringInt(P.maxgennr)));
                P.maxgennr := P.maxgennr + 1;
            od;
        fi;
        l := l - P.dimensions[cl];
    od;

    # define some pseudo generators to lift the epimorphism
    for i in [ 1 .. Length(P.epimorphism) ] do
        if not IsInt( P.epimorphism[i] ) then
           Add( newgens, "e" ); # "e" as in epimorphism
        fi;
    od;
    ExtendCentralPcp( P.pcp, newgens, P.prime );
    P.generators := GeneratorsPcp( P.pcp );

    return P;

end;

#############################################################################
##
#F  TailsPQp( <P> ) . . . . . . . .  computes a covering presentation for <P>
##
##  'TailsPQp' computes a not  necessarily consistent, covering  presentation
##  for <P>.  For  each class cl computed so far 'AddGeneratorsPQp' is called
##  to   add   the   new/pseudo    generators   created    by   a   call   to
##  'DefineGeneratorsPQp' for this class.
##
##  'AddGeneratorsPQp' modifies the relations of the form
##  1) $[ b, a ] = w$ with $wt(b) = cl$ and $wt(a) = 1$
##  2) $c^p      = v$  with $wt(c) = cl$ and $c$ is  either defined as $p$-th
##                                          power or $wt(c) = 1 (=cl)$.
##
##  A theoretical argument shows that for all other relations the word in the
##  new/pseudo generators with  which  to modify  each  relation (called  the
##  `tail' of the relation) can be computed.  This  is done  in this function
##  and the relations are modified accordingly.
##
TailsPQp := function( P )

    local     i, j, k, clnrgen, cl, g, x, y, z, endcl, enddim, Q;

    Q := P.pcp;
    clnrgen := Length(P.generators);

    P := DefineGeneratorsPQp(P);
    for  cl in  Reversed( [1 .. Length(P.dimensions)] )  do

        # add new/pseudo generators
        AddGeneratorsPQp(P, cl);

        # Compute the tails of the new/pseudo generators.  First the tails of
        # the $p^{th}$-powers are computed
        for  i in  Reversed([clnrgen-P.dimensions[cl]+1 .. clnrgen])  do

            # compute tails  for $p^{th}$-powers  $a_i^p$ for which $a_i$  is
            # defined as a commutator
            if IsList(P.definedby[i])  then
                g := P.definedby[i][1];
                y := P.generators[ g ];
                z := P.generators[ P.definedby[i][2] ];

                #    (y^p*z) / (y^(p-1) * (y*z))
                x := DifferencePcp( Q,
                         ProductPcp( Q, PowerPcp( Q, g ), z),
                         ProductPcp( Q,
                                     PowerPcp( Q, y, P.prime-1 ),
                                     ProductPcp( Q, y, z ) ) );
                if x <> P.identity  then AddPowerPcp( Q, i, x );  fi;
            fi;
        od;
        clnrgen := clnrgen - P.dimensions[cl];

        # Next compute the tails of the commutators
        endcl  := P.nrgens;
        for k  in [ cl .. Length(P.dimensions) ]  do
            endcl := endcl - P.dimensions[k];
        od;

        enddim := P.dimensions[1]+1;
        k := 1;
        while  cl-k >= k+1  do
            for  i in  [enddim ..  enddim+P.dimensions[k+1]]  do
                if  IsList(P.definedby[i])  then
                    # the second generator is defined as commutator
                    y := P.generators[ P.definedby[i][1] ];
                    z := P.generators[ P.definedby[i][2] ];
                    g := ProductPcp( Q, y, z );
                    j := endcl;
                    while  j > i and j > endcl - P.dimensions[cl-k]  do
                        x := P.generators[j];
                        #  ((x*y)*z) / (x*(y*z))
                        x := DifferencePcp( Q, 
                                 ProductPcp( P.pcp,
                                 ProductPcp(Q,x,y), z),
                                     ProductPcp(Q,x,g) );
                        if x <> P.identity then
                           AddCommPcp( Q, j, i, x );
                        fi;
                         j := j - 1;
                    od;
                elif  P.definedby[i] > 0  then

                    # The second generator is defined as $p$-th power
                    # and is not one of the first generators (which are
                    # defined by the epimorphism).
                    z := P.definedby[i];
                    y := P.generators[z];
                    g := PowerPcp( Q, z );
                    z := PowerPcp( Q,y,P.prime-1);
                    j := endcl;
                    while  j > i and j > endcl - P.dimensions[cl-k]  do
                        x := P.generators[j];
                        #  ((x*y) * y^(p-1)) / (x*y^p)
                        x := DifferencePcp( Q,
                                ProductPcp( Q,
                                    ProductPcp(Q,x,y), z),
                                    ProductPcp(Q,x,g) );
                        if x <> P.identity then
                            AddCommPcp( Q, j, i, x );
                        fi;
                        j := j - 1;
                    od;
                fi;
            od;
            endcl  := endcl  - P.dimensions[cl-k];
            enddim := enddim + P.dimensions[k+1];
            k      := k + 1;
        od;
    od;

    return P;
end;

#############################################################################
##
#F  EchelonizePQp( <P>, <sys>, <w> )  . . . . . .  echelonize <w> along <sys>
##
##  'EchelonizePQp'  takes the word  <w> in the  generators of <P> of highest
##  weight and views  it as a linear equation over $GF(p)$. This is possible,
##  because  the generators of highest  weight  are central and of order $p$.
##  Furthermore, <sys>  is a  system  of words in  the  generators  of <P> of
##  highest weight, also  regarded  as linear  equations and in reduced form.
##  'EchelonizePQp' reduces <w>  along the system of linear  equations <sys>.
##  If <w> is not the identity after the echelonisation,  it is added  to the
##  system of equations.
##
EchelonizePQp := function( P, sys, w )

    local  wd, t, i;

    w := TailReducedPcp( P.pcp, sys.ls, w );

    if w = P.identity  then return 1; fi;

    wd := TailDepthPcp( P.pcp, w );
    w := PowerPcp( P.pcp, w, P.pInverse[ ExponentPcp(P.pcp,w,wd) ] );

    sys.ls[ wd ] := w;
    for i  in sys.del  do
        t := ExponentPcp( P.pcp, sys.ls[i], wd );
        if t <> 0  then
            sys.ls[i] := DifferencePcp(P.pcp,sys.ls[i],PowerPcp(P.pcp,w,t));
        fi;
    od;
    Add( sys.del, wd );
    if wd <= P.nrnewgens then
        P.nrnewgensleft := P.nrnewgensleft - 1;
        if P.nrnewgensleft = 0 then return 0; fi;
    fi;

    return 1;

end;

#############################################################################
##
#F  ConsistencyPQp( <P> ) . . . . . . . . . . . . . determine inconsistencies
##
##  'ConsistencyPQp'  evaluates all the  relations of  the consistency  test.
##  Each relation which is not satisfied yields a linear equation. The set of
##  linear  equations is returned. In  the  case that  <P>  is  a  consistent
##  presentation the set of linear equations is empty. (cf. M.R. Vaughan-Lee:
##  "An Aspect of the Nilpotent Quotient Algorithm",  in Computational Group
##  Theory, edited by Michael D. Atkinson)
##
ConsistencyPQp := function( P )

    local i, j, k, a, b, c,d,  wtb, nrwt, linsys, wt, ai, ap;

    linsys := rec( ls := [], del := [] );

    # store in nrwt[i] the number of generators of weight less than i
    nrwt := [0];
    for i in [2 .. Length(P.dimensions)+1 ] do
        nrwt[i] := nrwt[i-1] + P.dimensions[i-1];
    od;

    # Loop through all possible weights a consistency relation can have.
    for wt in Reversed( [ 3 .. Length(P.dimensions)+1 ] ) do
        InfoPQ2( "#I  ConsistencyPQp: (a^p) * a = a * (a^p)\n" );

        # Check the relations $a^p*a = a*a^p$
        if wt mod 2 = 1 then
            # run through all $a$ with $2*wt(a) + 1 = wt$
            for i in [nrwt[(wt-1)/2]+1 .. nrwt[(wt-1)/2+1] ] do
                a  := P.generators[i];
                ap := PowerPcp( P.pcp, i );
                a  := DifferencePcp( P.pcp, 
                         ProductPcp( P.pcp, ap, a ),
                         ProductPcp( P.pcp, a, ap ));
                if a <> P.identity then
                    if EchelonizePQp( P, linsys, a ) = 0 then
                        return 0;
                    fi;
                fi;
            od;
        fi;
        InfoPQ2( "#I  ConsistencyPQp:  b*(a^p) = (b*a)*a^(p-1)\n" );

        # Check the consistency relation $b*(a^p) = b*a*(a^{(p-1)})$
        # for b > a.
        # wt = wt( b * a^p ) = wt(a) + wt(b) + 1 = wt
        # Loop through possible weights for a, namely wt(a) = i
        for i in [1 .. wt-2] do
            for k in [nrwt[i]+1 .. nrwt[i+1]] do
                a  := P.generators[k];
                ap := PowerPcp( P.pcp, k );
                ai := PowerPcp( P.pcp,a,P.prime-1);
                d := nrwt[wt-i];
                # wt(b) = wt-i-1, thus d-1 is the last choice for b
                if P.isdefinition[2][k] then
                    # b > ap was done in TailsPQp, here we do b <= ap
                    d := Minimum(Position(P.generators,ap),d);
                fi;
                # run through $b$ with $d>=b>a$ and $wt(b) = wt-i-1$
                for j in [Maximum(k+1,nrwt[wt-i-1]+1) .. d] do
                    b := P.generators[j];
                    b := DifferencePcp( P.pcp,
                             ProductPcp( P.pcp, b, ap ),
                             ProductPcp( P.pcp,
                                  ProductPcp(P.pcp,b,a), ai ));
                    if b <> P.identity  then
                       if EchelonizePQp( P, linsys, b ) = 0 then
                            return 0;
                        fi;
                    fi;
                od;
            od;
        od;
        InfoPQ2( "#I  ConsistencyPQp: (b^p)*a  =  b^(p-1)*b*a\n" );

        # Check the consistency relations $(b^p)*a = (b^{(p-1)})*b*a$
        # wt = wt(b^p*a) = wt(a) + wt(b) + 1 = wt(b) + 2
        # for b > a and wt(a) = 1
        # Loop through the generators of weight 1
        for  i in [1 .. P.dimensions[1]]  do
            a := P.generators[i];
            # run through all $b$ with $wt(b) = wt - 2$
            for  j in [Maximum(i+1,nrwt[wt-2]+1) .. nrwt[wt-1]]  do
                if  not P.isdefinition[1][(j-2)*P.dimensions[1]+i]  then
                    # if [b,a] is a definition of x, say then
                    # b^p*a was used to compute the tail of x^p
                    b := P.generators[j];
                    b := DifferencePcp( P.pcp,
                             ProductPcp( P.pcp, PowerPcp( P.pcp, j ), a),
                             ProductPcp( P.pcp,
                                 PowerPcp( P.pcp,b,P.prime-1),
                                 ProductPcp(P.pcp,b,a)));
                    if b <> P.identity  then
                        if EchelonizePQp( P, linsys, b ) = 0 then
                                return 0;
                        fi;
                    fi;
                fi;
            od;
        od;
        InfoPQ2( "#I  ConsistencyPQp: (c*b)*a  =  c*(b*a)\n" );

        # and  relations $(c*b)*a = c*(b*a)$
        for i in [1 .. P.dimensions[1]] do 
            a := P.generators[i];
            # run through all $b$ with $wt(b) >= 1$ and
            # $wt(b) <= wt(c) = wt - wt(b) - wt(a) = wt - wt(b) - 1$,
            # which is  the condition $2 * wt(b) <= wt - 1$
            wtb := 1;
            while 2 * wtb <= wt - 1 do
                for j in [Maximum(i+1,nrwt[wtb]+1) .. nrwt[wtb+1]] do
                    b := P.generators[j];
                    ap := ProductPcp(P.pcp,b,a);
                    d := nrwt[wt-wtb];
                    if  P.isdefinition[1][(j-2)*P.dimensions[1]+i]  then
                        d := Minimum(d,
                            Position(P.generators,CommPcp(P.pcp,j,i)));
                    fi;
                    # wt(c) = wt - wt(b) - 1
                    for k in [Maximum(j+1,nrwt[wt-wtb-1]+1) .. d] do
                        c := P.generators[k];
                        c := DifferencePcp( P.pcp,
                                 ProductPcp(P.pcp,
                                     ProductPcp(P.pcp,c,b),a),
                                 ProductPcp(P.pcp, c, ap ) );
                        if c <> P.identity  then
                            if EchelonizePQp( P, linsys, c ) = 0 then
                                return 0;
                            fi;
                        fi;
                    od;
                od;
                wtb := wtb + 1;
            od;
        od;
    od;

    return linsys;

end;


#############################################################################
##
#F  ElimTailsPQp( <P>, <sys> )  . . . . . .  eliminate superfluous generators
##
##  'ElimTailsPQp'  takes  two parameters <P> and <sys>.  <sys> is a list  of
##  words in the generators of <P> of highest weight.  Each  word specifies a
##  relation between a superfluous generator  and other generators of highest
##  weight,  by which  the superfluous one is to be replaced.  'ElimTailsPQp' 
##  eliminates all occurrences of superfluous generators.
##
ElimTailsPQp := function( P, sys )

    local       words, del, wasDefComm, wasDefPow, defby,
                i, j, k, r, Q, tmp;

    if sys.ls <> [] then
        del := sys.del;
        words := sys.ls;
    fi;

    if sys.ls = [] or del = [] then
        P.unused := 0;
        Add( P.dimensions, Length( P.generators ) - P.nrgens );
        P.nrgens := Length( P.generators );
        i := P.dimensions[1];
        j := P.dimensions[Length(P.dimensions)]; 

        # Enlarge the boolean list .isdefinition[1] and .isdefinition[2]
        for k in [1..j] do Add( P.isdefinition[2], false ); od;
        for k in [ 1..j*i ] do Add(P.isdefinition[1], false); od;

        # Update the entries in the boolean list .isdefinition[1]
        # and .isdefinition[2]
        for k in [P.nrgens-j+1 .. P.nrgens] do
            if IsList(P.definedby[k]) then
                 P.isdefinition[1][(P.definedby[k][1]-2)*i+P.definedby[k][2]] 
                 := true;
            elif P.definedby[k] > 0  then
                 P.isdefinition[2][P.definedby[k]] := true;
            fi;
        od;
        
        return P;
    fi;

    if Length( del ) = Length( P.generators )  then
        P := InitPQp( 0, P.prime );
        return( P );
    fi;
    Q := P.pcp;

    # At  first  run  through the  sequence  of  tails  and  delete  all  the
    # definitions of new/pseudo generators
    wasDefComm := [];
    wasDefPow  := [];
    for i in del  do
        defby := P.definedby[ i ];
        if IsList(defby) then

            # Use 'SubtractCommPcp', since del[i] is a tail generator
            SubtractCommPcp( Q, defby[1], defby[2], words[i] );
            AddSet( wasDefComm, TriangleIndex(defby[1],defby[2]));
        elif defby > 0 then
            SubtractPowerPcp( Q, defby, words[i] );
            AddSet( wasDefPow, defby );
        else
            defby := -defby;
            if IsInt( P.epimorphism[ defby ] ) then
                P.epimorphism[defby] :=
                    DifferencePcp( P.pcp, P.generators[i],words[i]);
            else
                P.epimorphism[defby] :=
                    DifferencePcp( P.pcp, P.epimorphism[defby],words[i]);
            fi;
        fi;
    od;

    # In this loop we check all the commutator relations and loop through all
    # generators of the previous step
    for i in [1 .. P.nrgens] do
        # loop through all generators such that the
        # Triangle Index is defined
        for j  in [ 1 .. i - 1 ]  do
            if not TriangleIndex(i,j) in P.defining[1] then

                # The commutator  does not  define  a new  generator thus all
                # occurrences  of generators to  be  eliminated on the  right
                # hand side  of this commutator relation have to be  replaced
                # by corresponding words in the remaining generators.
                tmp := CommPcp( Q, i, j );
                if tmp <> P.identity  then
                    r := TailReducedPcp( Q, words, tmp );
                    DefineCommPcp( Q, i, j, r );
                fi;
            fi;
        od;
    od;

    P.defining[1] := Difference( P.defining[1], wasDefComm );

    # In this loop we check all the  power relations and loop through all the
    # generators
    for i in [1 .. P.nrgens] do

        # Does the power define a generator ?
        if not i in P.defining[2] then

            # The power does not define  a new generator thus all occurrences
            # of generators to be eliminated  on the  right hand side of this
            # power relation  have to be  replaced by corresponding words  in
            # the remaining generators.
            tmp := PowerPcp( Q, i );
            if tmp <> P.identity then
                 r := TailReducedPcp( Q, words, tmp );
                 DefinePowerPcp( Q, i, r );
            fi;
        fi;
    od;

    P.defining[2] := Difference( P.defining[2], wasDefPow );

    defby := [];
    k := 1;
    for i in [ 1 .. Length(P.definedby) ] do
        if not i in del then
            defby[k]   := P.definedby[i];
            k := k + 1;
        fi;
    od;
    P.definedby := defby;

    P.unused := Length( del );
    Add( P.dimensions, Length( P.generators ) - P.nrgens - P.unused );
    P.nrgens := Length( P.generators ) - Length( del );

    ShrinkPcp( Q, del );
    P.generators := GeneratorsPcp(Q);

    i := P.dimensions[1];
    j := P.dimensions[Length(P.dimensions)]; 

    # Enlarge the boolean list .isdefinition[1] and .isdefinition[2]
    for k in [1..j] do Add( P.isdefinition[2], false ); od;
    for k in [ 1..j*i ] do Add(P.isdefinition[1], false); od;

    # Update  the  entries   in  the  boolean  lists <P>.isdefinition[1]  and
    # <P>.isdefinition[2]
    for k in [P.nrgens-j+1 .. P.nrgens] do
        if IsList(P.definedby[k]) then
            P.isdefinition[1][(P.definedby[k][1]-2)*i+P.definedby[k][2]] 
            := true;
        elif P.definedby[k] > 0 then
            P.isdefinition[2][P.definedby[k]] := true;
        fi;
    od;

    for k  in [ 1 .. Length(P.epimorphism) ]  do
        if not IsInt( P.epimorphism[k] )  then

            # Convert the data structure
            P.epimorphism[k] := SumPcp( Q, P.epimorphism[k], P.identity );
        else
            i := 0;
            for  j in [ 1 .. P.epimorphism[k] ]  do
                if  not j in del  then
                    i := i + 1;
                fi;
            od;
            P.epimorphism[k] := i;
        fi;
    od;
    return P;

end;


#############################################################################
##
#F  LiftHomomorphismPQp( <G>, <P>, <linsys> ) .  lift homomorphism to p-cover
##
##  'LiftHomomorphismPQp' attempts to  lift the  homomorphism  from the given
##  finitely presented group <G> onto the p-cover of a  previously calculated
##  $p$-quotient. In doing so it obtains relations  between the generators of
##  the $p$-multiplier in  order  to satisfy  the relations of  the  finitely
##  presented group.  It uses these  relations to eliminate some (or possibly
##  all) of the generators of the $p$-multiplier.
##
LiftHomomorphismPQp := function( G, P, linsys )

    local   i, s, images, k, x;

    # determine the number of pseudo generators needed here
    k := 0;
    for i in [ 1 .. Length(P.epimorphism) ] do
        if not IsInt( P.epimorphism[i] ) then
            k := k+1;
        fi;
    od;

    k := Length(P.generators) - k + 1;

    # add pseudo generators to the images of the homomorphism
    for i in [ 1 .. Length(P.epimorphism) ] do
        if not IsInt( P.epimorphism[i] ) then
            P.epimorphism[i] :=
                SumPcp( P.pcp, P.epimorphism[i],P.generators[k]);
            P.definedby[k] := -i;
            k := k+1;
        fi;
    od;

    # temporarily write all images as group elements
    images := Copy( P.epimorphism );
    for i in [ 1 .. Length(images) ] do
        if IsInt(images[i]) then
            images[i] := P.generators[images[i]];
        fi;
    od;

    # compute the images of the relations of P under
    # the epimorphism
    for i in [ 1 .. Length(G.relators) ] do
        s   := MappedWord( G.relators[i], G.generators,images );
        s   := NormalWordPcp( P.pcp, s );
        s   := PowerPcp( P.pcp, s, G.exponents[i] );
        EchelonizePQp( P, linsys, s );
    od;

    return [linsys,P];

end;



#############################################################################
##
#F  CleanUpPQp( <P> ) . . . . . . . . . . . . . . . . . . . . .  clean up <P>
##
CleanUpPQp := function( P )

    local i, defby;

    # Delete all the new and pseudo generators introduced
    for i in [ P.nrgens+1 .. Length(P.definedby) ] do
        defby := P.definedby[i];
        if IsList(defby) then
            RemoveSet( P.defining[1],TriangleIndex(defby[1],defby[2]) );
            P.isdefinition[1][(defby[1]-2)*P.dimensions[1]+defby[2]] 
                := false;
        else
            if defby < 0 then defby := -defby; fi;
            RemoveSet( P.defining[2], defby );
            P.isdefinition[2][defby] := false;
        fi;
    od;
    P.definedby   := Sublist( P.definedby, [ 1 .. P.nrgens ] );
    ShrinkPcp( P.pcp, [P.nrgens+1 .. Length(P.generators)] );
    P.generators := GeneratorsPcp(P.pcp);
    P.nrgens     := Length(P.generators);
    P.nrnewgens  := 0;

end;

#############################################################################
##
#F  FirstClassPQp( <G>, <p> ) . . . . . . . . computes the p-abelian quotient
##
##  'FirstClassPQp'  returns  a  PQp  record  for  the  exponent-$p$-class  1
##  quotient of <G>.
##
FirstClassPQp := function( G, p )

    local       erg, P;

    # add '<G>.exponents' and 'G.relators' if missing
    if not IsBound(G.relators)  then
        G.relators := [];
    fi;
    if not IsBound(G.exponents) then
        G.exponents := List(G.relators, x -> 1);
    fi;

    P := InitPQp(Length(G.generators), p);
    erg := ConsistencyPQp(P);
    if erg = 0 then
        CleanUpPQp(P);
        return P;
    fi;
    erg := LiftHomomorphismPQp(G, P, erg);
    P   := ElimTailsPQp( erg[2], erg[1] );
    return P;

end;



#############################################################################
##
#F  PQuotient( <G>, <p>, <cl> ) . . . . . . .  computes a $p$-quotient of <G>
##
##  'PQuotient' computes the class <cl> $p$-quotient of the group  <G>  given
##  by generators and relations. If <cl> is 0 it either computes the  largest
##  $p$-quotient, if there is a largest, or  runs forever or until one of the
##  following is satisfied:
##
##                a) GAP runs into a segmentation fault
##                b) GAP runs into a bus error
##                c) GAP runs out of memory
##                d) K. Lux is using the program (will result in an error)
##                e) GAP is killed by an annoyed user
##                f) The machine crashes
##                g) The machine is rebooted
##                h) The sky falls down
##
PQuotient := function(G, p, cl)

    local   i, forever, P, erg, t;

    # Check the arguments
    if not IsPrime(p) then
        Error("<p> must be a prime");
    fi;
    if not IsInt( cl ) or cl < 0 then
        Error("<cl> must be a non-negative integer");
    fi;

    # add '<G>.exponents' and 'G.relators' if missing
    if not IsBound(G.relators)  then
        G.relators := [];
    fi;
    if not IsBound(G.exponents) then
        G.exponents := List(G.relators, x -> 1);
    fi;

    # Who wants to run forever?
    forever := false;
    if cl = 0  then forever := true;  fi;

    # initialise <P>
    P := FirstClassPQp( G, p );
    erg := rec( ls := [], del := [] );
    if Length(P.generators) = 0 then return P; fi;
    t := Runtime();
    InfoPQ1( "#I  PQuotient: class 1 : ", P.dimensions[1], "\n" );

    # main loop
    i := 2;
    while i <= cl or forever do
       InfoPQ1( "#I  PQuotient: Runtime : ", Runtime()-t, "\n" );
       P   := TailsPQp(P);
       erg := ConsistencyPQp(P);
       if erg = 0 then 
          CleanUpPQp(P); 
          InfoPQ1( "#I  PQuotient: <G> has exponent-p-class :",
                   Length(P.dimensions), "\n",
                  "Runtime : ", Runtime()-t, "\n" );
          return P; 
       fi;
       erg := LiftHomomorphismPQp(G, P, erg);
       P   := ElimTailsPQp( erg[2], erg[1] );

       if P.dimensions[ Length( P.dimensions ) ] = 0  then
          P.dimensions := Sublist(P.dimensions, [1..Length(P.dimensions)-1]);
    	  P.nrnewgens := 0;
    	  InfoPQ1( "#I  PQuotient: <G> has exponent-p-class :",
                   Length(P.dimensions), "\n", "Runtime : ",
    	    	   Runtime()-t, "\n" );
    	  return P;
       fi;

       InfoPQ1( "#I  PQuotient: class ", i, " : ",
                P.dimensions[Length(P.dimensions)], "\n" );
       i := i+1;
    od;
    InfoPQ1( "#I  PQuotient: Runtime : ", Runtime()-t, "\n" );
    return P;

end;

pQuotient     := PQuotient;
PrimeQuotient := PQuotient;


#############################################################################
##
#F  NextClassPQp( <G>, <P> )  . . . . . . . . . . . .  compute the next class
##
##  Let <P> be a PQp record for the class $c$-quotient of <G>. 'NextClassPQp'
##  returns a PQp  record for the class  $c+1$ quotient  of <G>, if it exists
##  and <P> otherwise.
## 
NextClassPQp := function( G, P )

    local   P, erg;

    P   := TailsPQp(P);
    erg := ConsistencyPQp(P);
    if erg = 0 then
    	InfoPQ1("#I  NextClassPQp: <G> has no larger p-quotient\n");
    	CleanUpPQp(P);
    	return P;
    fi;
    erg := LiftHomomorphismPQp(G, P, erg);
    P   := ElimTailsPQp( erg[2], erg[1] );

    if P.dimensions[ Length( P.dimensions ) ] = 0  then
    	P.dimensions := Sublist( P.dimensions, [1..Length(P.dimensions)-1]);
    	P.nrnewgens  := 0;
    fi;
    return P;

end;


#############################################################################
##
#F  Weight( <P>, <w> )  . . . . . . . . . .  compute the weight of <w> in <P>
##
##  Let <P> be a PQp record and <w> a word in the generators of <P>. 'Weight'
##  returns the weight of <w>.
##
Weight := function( P, w )
    return P.operations.Weight(P, w);
end;

PQpOps.Weight := function (P, w )

    local   i, d, wt;

    d  := DepthPcp(P.pcp, w);
    i  := 1;
    wt := 1;
    while i < d do
    	i  := i + P.dimensions[wt];
    	wt := wt + 1;
    od;
    return wt-1;

end;

#############################################################################
##
#F  PQpOps.Factorization( <P>, <w> )  . .  express w in the generators of <P>
##
##  Let <P> be a  PQp  record  and  <w>  a word  in  the generators  of  <P>.
##  'PQpOps.Factorization' returns  a  word expressing  <w> in the  weight  1
##  generators.
##
PQpOps.Factorization := function( P, w )

    local    i, gens, wt;

    # check '<P>.abstractGenerators'
    if IsBound(P.abstractGenerators)  then
    	if Length(P.abstractGenerators) <> Length(P.generators)  then
       	    Error("not enough abstract generators");
    	fi;
    else
    	P.abstractGenerators := P.generators;
    fi;

    # Build a list gens which contains  the  word defining generator i in the
    # i-th position. Note that we use the  operators * and ^, since we do not
    # want to collect the word in the group <P>.
    gens := [];
    for i in [1 .. Length(P.generators) ] do
        if IsInt( P.definedby[i] ) then
            if P.definedby[i] < 0 then
                gens[i] := P.generators[i];
            else
                gens[i] := P.generators[P.definedby[i]]^P.prime;
            fi;
        else
            gens[i] := P.generators[P.definedby[i][1]]^-1
    	    	       * P.generators[P.definedby[i][2]]^-1
    	    	       * P.generators[P.definedby[i][1]]
    	    	       * P.generators[P.definedby[i][2]];
        fi;
    od;

    wt := TailDepthPcp( P.pcp,w );
    while wt > 1 do
        w  := MappedWord( w, P.abstractGenerators, gens );
        wt := wt - 1;
    od;

    return w;

end;

#############################################################################
##

#E  Emacs . . . . . . . . . . . . . . . . . . . . . . . local emacs variables
##
## Local Variables:
## mode:           outline
## outline-regexp: "#F\\|#V\\|#E"
## eval:           (hide-body)
## End:
##
