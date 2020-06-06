#############################################################################
##
#A  aggroup.g                   GAP library                      Frank Celler
##
#A  @(#)$Id: aggroup.g,v 3.53 1994/07/06 13:10:56 ahulpke Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This  file  contains  all  functions  for  creating aggroups and changing
##  collectors. It also contains the functions for  converting  aggroups into
##  PermGroups and MatGroups.
##
#H  $Log: aggroup.g,v $
#H  Revision 3.53  1994/07/06  13:10:56  ahulpke
#H  Added AgGrOps.SubdirectProduct to allow usage of 'Projection'
#H
#H  Revision 3.52  1994/06/17  12:31:30  beick
#H  added trivial case to 'MinimalGeneratingSet'
#H
#H  Revision 3.51  1994/05/11  11:46:41  fceller
#H  changed names of generators created in 'DirectProduct'
#H
#H  Revision 3.50  1994/04/08  12:58:30  sam
#H  made 'AgSubgroup' a dispatcher, added 'ReadLib' statement
#H
#H  Revision 3.49  1994/02/17  10:39:15  fceller
#H  'FpGroup' now sets 'relators'  even if the group is trivial
#H
#H  Revision 3.48  1994/02/16  14:37:37  fceller
#H  replaced 'LogVecFFE' by 'IntVecFFE'
#H
#H  Revision 3.47  1994/02/02  10:16:56  fceller
#H  fixed 'MakeVecFFE'
#H
#H  Revision 3.46  1994/02/02  10:09:17  sam
#H  added 'AgGroupOps.CharacterDegrees', 'AgGroupOps.SupersolvableResiduum',
#H  added component 'choice' in result of 'RefinedAgSeries'
#H
#H  Revision 3.45  1993/08/19  07:29:54  fceller
#H  added 'MinimalGeneratingSet'
#H
#H  Revision 3.44  1993/07/29  22:30:22  martin
#H  replaced "lattgrp" by "grplatt"
#H
#H  Revision 3.43  1993/07/26  10:46:05  fceller
#H  added 'AgGroupOps.PgGroup' and 'AgGroupOps.RationalClasses'
#H
#H  Revision 3.42  1993/03/11  16:56:45  fceller
#H  added 'SemidirectProductAgGroupOps'
#H
#H  Revision 3.41  1993/01/18  18:44:40  martin
#H  added character table computation
#H
#H  Revision 3.40  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.39  1992/10/13  15:18:10  martin
#H  fixed 'AgGroupOps.SemidirectProduct', the images of <G> operate with '^'
#H
#H  Revision 3.38  1992/08/03  12:32:23  fceller
#H  'RefinedAgSeries' now returns always a new group
#H
#H  Revision 3.37  1992/05/29  10:06:13  fceller
#H  fixed bug in 'PermGroupAgGroup'
#H
#H  Revision 3.36  1992/04/07  12:53:37  fceller
#H  changed comparison with '0'
#H
#H  Revision 3.35  1992/04/03  13:10:09  fceller
#H  changed 'Shifted...' into 'Sifted...'
#H
#H  Revision 3.34  1992/03/30  07:47:09  fceller
#H  changed 'Exponents' slightly.
#H
#H  Revision 3.33  1992/03/27  11:14:51  martin
#H  changed mapping to general mapping and function to mapping
#H
#H  Revision 3.32  1992/03/26  15:14:33  martin
#H  changed 'SemiDirectProduct' to 'SemidirectProduct'
#H
#H  Revision 3.31  1992/02/29  15:00:57  fceller
#H  use 'MakeVecFFE'
#H
#H  Revision 3.30  1992/02/21  16:47:27  hbesche
#H  renamed 'Word' to 'AbstractGenerator'
#H
#H  Revision 3.29  1992/02/21  14:02:02  fceller
#H  'i' was undeclared in 'CollectorlessFactorGroup'.
#H
#H  Revision 3.28  1992/02/07  18:11:40  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/05/06  21:26:46  fceller
#H  Initial revision
##


#############################################################################
##
#F  InfoAgGroup1( <arg> ) . . . . . . . . . . . . . . . . package information
#F  InfoAgGroup2( <arg> ) . . . . . . . . . . . . . package debug information
##
if not IsBound( InfoAgGroup1 )  then InfoAgGroup1 := Ignore;  fi;
if not IsBound( InfoAgGroup2 )  then InfoAgGroup2 := Ignore;  fi;


#############################################################################
##
#V  AgGroupOps  . . . . . . . . . . . . . . . . . . aggroup operations record
##
AgGroupOps := OperationsRecord( "AgGroupOps", GroupOps );


#############################################################################
##
#F  AgGroupOps.\=  . . . . . . . . . . . . . . . . . . . . . . equality test
##
AgGroupOps.\= := function( G, H )
    local   isEql;
    if     IsRec( G ) 
       and IsRec( H )
       and IsBound( G.isAgGroup )
       and IsBound( H.isAgGroup )
       and G.isAgGroup
       and H.isAgGroup
    then
    	if IsCompatibleAgWord( G.identity, H.identity )  then
    	    isEql := Cgs( G ) = Cgs( H );
    	else
    	    isEql := false;
    	fi;
    else
	isEql := GroupOps.\=( G, H );
    fi;
    return isEql;
end;


#############################################################################
##
#F  AgGroupOps.\<  . . . . . . . . . . . . . . . . . . . . . . .  comparison
##
AgGroupOps.\< := function( G, H )
    local   isLess;
    if IsAgGroup( G ) and IsAgGroup( H )  then
    	if IsCompatibleAgWord( G.identity, H.identity )  then
   	    isLess := Reversed( Cgs(G) ) < Reversed( Cgs(H) );
    	else
    	    isLess := G.identity < H.identity;
    	fi;
    else
	isLess := GroupOps.\<( G, H );
    fi;
    return isLess;
end;


#############################################################################
##
#F  AgGroupOps.\/  . . . . . . . . . . . . . . . . . . . . . .  factor group
##
AgGroupOps.\/ := function( G, N )

    if IsInt( N )  then
        N := CompositionSubgroup( G, N );
    fi;
    return FactorGroup( G, N );

end;


#############################################################################
##
#F  AgGroupOps.\in . . . . . . . . . . . . . . . . . . . . . membership test
##
##  We use 'SiftedAgWord' in order to decide membership.
##
AgGroupOps.\in := function( g, G )
    return     IsCompatibleAgWord( G.identity, g )
           and SiftedAgWord( G, g ) = G.identity;
end;


#############################################################################
##
#F  AgGroupOps.Group( <U> ) . . . . . . . . . . . . . . create a parent group
##
AgGroupOps.Group := function( U )
    local   G;

    if Index( Parent( U ), U ) = 1  then
        G := CopyAgGroup( Parent( U ) );
    	G.bijection := GroupHomomorphismByImages(G,U,G.cgs,Parent(U).cgs);
    	G.bijection.range := U;
    else
        G := U / TrivialSubgroup( U );
        G.bijection := NaturalHomomorphism( U, G ) ^ -1;
    fi;
    return G;

end;


#############################################################################
##
#F  AgGroupOps.Subgroup( <G>, <gens> )  . . . .  construct ag subgroup record
##
AgGroupOps.Subgroup := function( G, gens )
    local   id;

    id := G.identity;
    if IsBound( G.parent )  then
        return rec( generators := Filtered( gens, x -> x<>id ),
                    identity   := id,
   	    	    isDomain   := true,
                    isGroup    := true,
                    isAgGroup  := true,
                    parent     := G.parent,
                    operations := G.operations );
    else
        return rec( generators := Filtered( gens, x -> x<>id ),
                    identity   := id,
    	    	    isDomain   := true,
                    isGroup    := true,
                    isAgGroup  := true,
                    parent     := G,
                    operations := G.operations );
    fi;

end;


#############################################################################
##
#F  AgGroupOps.FpGroup( <U> ) . . . . . . . . . . presentation of an ag group
##
AgGroupOps.FpGroup := function( arg )
    local   U,  gens,  u,  F,  i,  j,  k,  v,  names,  l,  r;

    # check trivial case
    U := arg[1];
    if 0 = Length(U.generators)  then
    	F := FreeGroup(0);
        F.relators := [];
        return F;
    fi;

    # get induced generating system of <U>
    gens := Igs(U);

    # Try to find suitable names for this generators.
    if Length(arg) = 2 then
    	names := WordList( Length( gens ), arg[2] );
    else
        names := List( Sublist( InformationAgWord( gens[1] ).names,
                       List( gens, DepthAgWord ) ), AbstractGenerator );
    fi;

    # compute the power/commutator presentation
    F := Group( names, IdWord );
    F.relators := [];

    # at first the power-part of the presentation
    for i  in [ 1 .. Length(gens) ]  do
        l := F.generators[i] ^ RelativeOrderAgWord( gens[i] );
        u := gens[i] ^ RelativeOrderAgWord( gens[i] );
        v := U.operations.Exponents( U, u, Integers );
        r := IdWord;
        for k  in [ 1 .. Length(v) ]  do
            if v[k] <> 0  then
                r := r * F.generators[k] ^ v[k];
            fi;
        od;
        Add( F.relators, l / r );
    od;

    # now the commutator-part of the presenation
    for i  in [ 1 .. Length(gens) ]  do
        for j  in [ i+1 .. Length(gens) ]  do
            l := Comm( F.generators[j], F.generators[i] );
            u := Comm( gens[j], gens[i] );
            v := U.operations.Exponents( U, u, Integers );
            r := IdWord;
            for k  in [ 1 .. Length(v) ]  do
                if v[k] <> 0  then
                    r := r * F.generators[k] ^v[k];
                fi;
            od;
            Add( F.relators, l / r );
        od;
    od;

    # Return the presenation.
    return F;

end;


#############################################################################
##
#F  AgGroupOps.Order( <D>, <g> )  . . . . . . . . . . . . . . .  order of <g>
##
AgGroupOps.Order := function( D, g )
    local   ord, id;

    # Raise <g> to n.th power, where n is the relative order of <g>.
    ord := 1;
    id  := D.identity;
    while g <> id  do
        ord := ord * RelativeOrderAgWord( g );
        g   := g ^ RelativeOrderAgWord( g );
    od;

    return ord;

end;


#############################################################################
##
#F  AgGroupOps.PgGroup( <G> ) . . . . . . convert <G> into pg presented group
##
AgGroupOps.PgGroup := function( G )
    local  div;

    div := Set(FactorsInt(Size(G)));
    if 1 < Length(div)  then
        Error( " < G> must be a p-group" );
    fi;
    return IsomorphismAgGroup( PCentralSeries( G, div[1] ) ).range;
end;


###########################################################################
##
#F  AgGroupOps.CharacterDegrees( <G> )  . .  degrees of irrducible characters
##
AgGroupOps.CharacterDegrees := function( G )

    if IsBound( G.charTable ) then
      return Collected( List( G.charTable.irreducibles, x -> x[1] ) );
    else
      return CharDegAgGroup( G, 0 );
    fi;
    end;


#############################################################################
##
#F  AgGroupOps.RationalClasses( <G> ) . . . .  rational classes for ag groups
##
AgGroupOps.RationalClasses := function( G )
    if IsPrimePowerInt(Size(G))  then
        return RationalClassesPAgGroup(G);
    else
        return RationalClassesAgGroup(G);
    fi;
end;


##############################################################################
##
#F  AgGroupOps.SupersolvableResiduum( <G> ) . . supersolvable residuum of <G>
##
##  The  algorithm  constructs a  descending series  of normal subgroups with
##  supersolvable factor  group from <G> to  its  supersolvable residuum such
##  that any subgroup that refines this series is normal in <G>.
##  One step of  the algorithm does the following.   Suppose <N> is a  normal
##  subgroup of <G>  with supersolvable  factor  group.  Then the  commutator
##  factor group  of  <N> is  constructed  and   decomposed into   its  Sylow
##  subgroups.  For each of them the Frattini factorgroup is found which is a
##  G-module.  We are interested only  in those submodules with 1-dimensional
##  factor.   For   these cases the   eigenspaces of  the dual  submodule are
##  calculated,   and the preimages  of their  orthogonal  spaces are used to
##  construct new normal  subgroups with   supersolvable factorgroup. If   no
##  eigenspace is found within one step, the residdum is reached.
##
##  A  component '.ds' is added  to the group record   which has the property
##  that any composition  series through '.ds'  from <G> down to the residuum
##  is a chief series.
## 
AgGroupOps.SupersolvableResiduum := function( g )

    local   ssr, assr, dh, df, p, ph, ff, mg, fs, np, gen, cf, pu, v, ve, b,
            i, z, o, s, gs, idm, ii, vsl, nvsl, nullspace, iii, iiii, iiiii,
            tmp, tmp2, pp;

    # catch a trivial case
    g.ds := [g];
    if IsAbelian(g)  then
        Add(g.ds,TrivialSubgroup(g));
        return g.ds[2];
    fi;

    # find small generating system 'gs' of g
    gs := [ g.generators[1] ];
    p  := 2;
    o  := Order( g, g.generators[1] );
    repeat
        s := Subgroup( Parent(g), Concatenation(gs,[g.generators[p]]) );
        if Size(s) > o  then
            Add( gs,g .generators[p] );
            o := Size(s);
        fi;
        p := p+1;
    until s = g;

    ssr := DerivedSubgroup( g );
    Add( g.ds, ssr );

    repeat

        # remember the last candidate  as 'assr'
        assr := ssr;
        ssr  := DerivedSubgroup(assr);
        dh   := NaturalHomomorphism( assr, assr/ssr );

        # 'df' is the commutator factorgroup 'assr/ssr'
        df := dh.range;
        fs := FactorsInt( Size( df ) );

        # 'gen' collects the generators for the next candidate
        gen := Copy( df.generators );
        for p  in Set(fs)  do

            np := Product( Filtered( fs, x -> x <> p ) );
            pp := Product( Filtered( fs, x -> x  = p ) );

            # 'pu' is the Sylow 'p' subgroup of the commutator factorgroup
            pu := Subgroup( df, List( df.generators, x -> x^np ) );

            # remove the p-part from the generatorlist 'gen'
            gen :=List(gen,x->x^pp);

            # add the agemo_1 to the generatorlist
            tmp :=List( Igs(pu), x->x^p );
            Append( gen, tmp );
            ph := NaturalHomomorphism( pu, pu/Subgroup(df,tmp) );

            # ff is the Frattini factorgroup
            ff := ph.range;
            if Size(ff) > p then
                idm:=IdentityMat(Length(Factors(Size(ff))),GF(p));

                # mg is  the list of matrices  for the operation  of g on the
                # dual space of the module
                mg := Filtered( List( gs, x ->
                        Transposed( List( ff.generators, y -> 
                          Z(p)^0*Exponents( ff, Image( ph,
                            Image( dh, PreImagesRepresentative(
                              dh, PreImagesRepresentative(ph,y))^x)))))^-1),
                              z -> z<>idm );

                # vsl is a list of all the simultaneous eigenspaces
                vsl := [VectorSpace(idm,GF(p))];
                for ii  in mg  do
                    nvsl := [];

                    # all eigenvalues of ii will be used 
                    for iii  in List( Filtered( Factors(
                            CharacteristicPolynomial(ii)),
                            x->Length(x.coefficients)=2),
                            y->-y.coefficients[1])
                    do
                        nullspace := NullspaceMat(ii-iii*idm);
                        if 0 < Length(nullspace)  then 
                            nullspace := VectorSpace(nullspace,GF(p));
                            for iiii  in vsl  do
                                iiiii := Intersection(iiii,nullspace);
                                if 0 < Length(iiiii.generators)  then
                                    Add(nvsl,iiiii);
                                fi;
                            od;
                        fi;
                    od;
                    vsl := nvsl;
                od;

                # now calculate the dual spaces of the eigensp.
                if 0 = Length(vsl)  then
                    Append( gen, pu.generators );
                else

                    # tmp collects the eigenspaces
                    tmp := [];
                    for ii  in vsl  do

                        # tmp2 will be the dualspace base
                        tmp2 := [];
                        Append( tmp, ii.generators );
                        nullspace := NullspaceMat(Transposed(tmp));
                        for v  in nullspace  do

                            # construct a group element corresponding to
                            # the basis element of the submodule
                            ve := ff.identity;
                            for i  in [1..Length(v)]  do
                                z := IntVecFFE(v,i);
                                if z <> 0  then
                                    ve := ve*ff.generators[i]^z;
                                fi;
                            od;
                            Add( tmp2, PreImagesRepresentative(ph,ve) );
                        od;
                        Add( g.ds, PreImage( dh,
                                Subgroup( df, Concatenation(tmp2,gen) ) ) );
                    od;
                    Append( gen, tmp2 );
                fi;
            else
                Add( g.ds, PreImage(dh,Subgroup(df,gen)) );
            fi;
        od;

        # generate the new candidate and clear-up the generators
        ssr := Subgroup( Parent(g),
                      Igs( PreImage( dh, Subgroup( df, gen ) ) ) );

    until Size( ssr ) = 1 or assr = ssr;
    return ssr;

end;


#############################################################################
##
#F  AgSubgroup( <G>, <gens>, <flag> ) . . . . . . . . . . . . . . ag subgroup
##
AgSubgroup := function( G, gens, flag )
    return G.operations.AgSubgroup( G, gens, flag );
    end;

#############################################################################
##
#F  AgGroupOps.AgSubgroup( <G>, <gens>, <flag> ). . . . . . . . . ag subgroup
##
AgGroupOps.AgSubgroup := function( G, gens, flag )

    if flag  then
        if IsBound( G.cgs ) and not IsBound( G.igs ) and G.cgs = gens  then
            return G;
        fi;
    else
        if IsBound( G.igs ) and G.igs = gens  then
            return G;
        fi;
    fi;
    if IsBound( G.parent )  then
        if flag  then
            return rec( generators := gens,
                        identity   := G.identity,
                        cgs        := gens,
   	    	        isDomain   := true,
                        isGroup    := true,
                        isAgGroup  := true,
                        parent     := G.parent,
                        operations := G.operations );
        else
            return rec( generators := gens,
                        identity   := G.identity,
                        igs        := gens,
    	    	        isDomain   := true,
                        isGroup    := true,
                        isAgGroup  := true,
                        parent     := G.parent,
                        operations := G.operations );
        fi;
    else
        if Length( gens ) = Length( G.cgs )  then
            if flag  then
                return rec( generators := gens,
                            identity   := G.identity,
                            cgs        := gens,
   	    	    	    isDomain   := true,
                            isGroup    := true,
                            isAgGroup  := true,
                            operations := G.operations );
            else
                return rec( generators := gens,
                            identity   := G.identity,
                            cgs        := G.cgs,
                            igs        := gens,
    	    	    	    isDomain   := true,
                            isGroup    := true,
                            isAgGroup  := true,
                            operations := G.operations );
            fi;
        else
            if flag  then
                return rec( generators := gens,
                            identity   := G.identity,
                            cgs        := gens,
    	    	    	    isDomain   := true,
                            isGroup    := true,
                            isAgGroup  := true,
                            parent     := G,
                            operations := G.operations );
            else
                return rec( generators := gens,
                            identity   := G.identity,
                            igs        := gens,
    	    	    	    isDomain   := true,
                            isGroup    := true,
                            isAgGroup  := true,
                            parent     := G,
                            operations := G.operations );
            fi;
        fi;
    fi;

end;


#############################################################################
##
#F  ChangeCollector( <G>, <name> )  . . . . . . . change collector of aggroup
##
ChangeCollector := function( arg )
    local   G;

    # Check the arguments.
    if    Length( arg ) < 2
       or Length( arg ) > 3
       or not IsAgGroup( arg[ 1 ] )
       or not IsString( arg[ 2 ] )
       or ( Length( arg ) = 3 and not IsInt( arg[ 3 ] ) )
    then
        Error( "usage: ChangeCollector( <G>, <collector>, [<n>] )" );
    fi;
    G := arg[ 1 ];
    if not IsParent( G )  then
        Error( "<G> must be a parent group" );
    fi;

    # Change collector using 'SetCollectorAgWord'.
    if Length( arg ) = 2  then
       SetCollectorAgWord( G.identity, arg[ 2 ] );
    else
       SetCollectorAgWord( G.identity, arg[ 2 ], arg[ 3 ] );
    fi;

end;


#############################################################################
##
#F  RefinedAgSeries( <G> )  . . . . . . . . . . . . . aggroup with PAG-system
##
RefinedAgSeries := function( G )
    local   F, idx, gens, new, names, facs, prods, len, wrds, coeffs, map,
            i, j, choice;

    # Check the arguments.
    if not IsAgGroup( G )  then
        Error( "usage: RefinedAgSeries( <G> )" );
    elif not IsParent( G )  then
        Error( "<G> must be the parent group" );
    elif G.generators = []  then  
    	return G;
    fi;

    # Get  the  generators  of <G> and names of those generators. Make a list
    # of  lists  of  the factors of the indices. Concatenate this list to get
    # the new indices.
    gens  := G.generators;
    names := InformationAgWord( gens[ 1 ] ).names;
    idx   := List( gens, RelativeOrderAgWord );
    facs  := List( idx, Factors );
    idx   := Concatenation( facs );

    # If there are no composite numbers, return <G>.
    # if Length( Filtered( facs, x -> Length( x ) > 1 ) ) = 0  then
    #     return G;
    # fi;

    # The new group will have a component 'choice', a list of those positions
    # in the generators list of the new group that correspond to the
    # generators of <G>.
    choice:= [];

    # Construct the generators  If the relative  order of  a generator  is  a
    # prime, do not change the name.   Otherwise add "_i"  to the name, for i
    # from 1 upto the number of factors.
    wrds := [];
    for i  in [ 1 .. Length( facs ) ]  do
        choice[i]:= Length( wrds ) + 1;
        if Length( facs[ i ] ) = 1  then
            Add( wrds, AbstractGenerator( names[ i ] ) );
        else
    	    Append( wrds, WordList( Length( facs[i] ), names[i] ) );
        fi;
    od;

    # Make the products  of  the factors  of   <facs> and  a list  of the new
    # generators (that are the powers of those products).
    prods := List( facs, x -> List( [ 1 .. Length( x ) ], y ->
                   Product( Sublist( x, [ 1 .. y-1 ] ) ) ) );
    new := [];
    for i  in [ 1 .. Length( prods ) ]  do
        Append( new, List( prods[ i ], x -> gens[ i ] ^ x ) );
    od;
    len := Length( new );

    # 'coeffs' takes the products and a number and returns the coeffs need to
    # express this number in the product.
    coeffs := function( ps, n )
        local 	c,  x;
        c := [];
        for x  in Reversed( ps )  do
            Add( c, QuoInt( n, x ) );
            n := n mod x;
        od;
        return Reversed( c );
    end;

    # 'map' takes an agwords an expresses its in the new words of <wrds>.
    map := function( a )
        local 	L;
        L := ExponentsAgWord( a );
        L := List( [ 1 .. Length( L ) ], x -> coeffs( prods[ x ], L[ x ] ) );
    	L := Concatenation( L );
        return Product( [ 1 .. len ], x -> wrds[ x ] ^ L[ x ] );
    end;

    # Now we can construct the new power/commutator presentation.
    F := rec( generators := wrds,  relators := [] );
    for i  in [ 1 .. len ]  do
        Add( F.relators, wrds[i]^idx[i] / map( new[i]^idx[i] ) );
    od;
    for i  in [ 1 .. len - 1 ]  do
        for j  in [ i + 1 .. len ]  do
            Add(F.relators, Comm(wrds[j],wrds[i])/map(Comm(new[j],new[i])));
        od;
    od;
    F:= AgGroupFpGroup( F );
    F.choice:= choice;

    return F;

end;


#############################################################################
##
#F  SiftedAgWord( <U>, <g> )  . . . . . remainder of shifting <g> through <U>
##
SiftedAgWord := function( U, g )

    # Make sure that <U> has 'shiftInfo'.
    if  not IsBound( U.shiftInfo )  then
        U.operations.AddShiftInfo( U );
    fi;

    # Use the suggested method in order to shift <g> through <U>.
    if U.shiftInfo.method = 7  then

        # <U> is a trivial factorgroup or subgroup.
        if IsBound( U.isFactorArg ) and U.isfactorArg  then
            return SiftedAgWord( U.factorDen, g );
        else
            return g;
        fi;
    elif U.shiftInfo.method = 4  then

        # <U> is the supergroup.
        return U.identity;
    elif U.shiftInfo.method = 5  or U.shiftInfo.method = 1  then

        # <U> is a composition subgroup.
        if DepthAgWord( g ) < U.shiftInfo.first  then
            return g;
        else
            return U.identity;
        fi;
    elif U.shiftInfo.method = 6  then

        # <U> is no composition subgroup.
        while g <> U.identity  do
            if IsBound( U.shiftInfo.depths[ DepthAgWord( g ) ] )  then
                g := ReducedAgWord( g, U.shiftInfo.gens[ U.shiftInfo.depths[
                                    DepthAgWord( g ) ] ] );
            else
                return g;
            fi;
        od;
        return g;
    elif U.shiftInfo.method = 2 or U.shiftInfo.method = 3  then

        # <U> is a factorgroup.
        while g <> U.identity  do
            if not IsBound( U.shiftInfo.depths[ DepthAgWord( g ) ] )  then
                return g;
            elif U.shiftInfo.depths[ DepthAgWord( g ) ] < 0  then
                g := ReducedAgWord( g, U.shiftInfo.subs[ -U.shiftInfo.depths[
                                    DepthAgWord( g ) ] ] );
            else
                g := ReducedAgWord( g, U.shiftInfo.gens[ U.shiftInfo.depths[
                                    DepthAgWord( g ) ] ] );
            fi;
        od;
        return g;
    else

       # Something is wrong.
       Error( "ShiftAgWord: unkown method ", U.shiftInfo.method,
              " (internal error)" );
    fi;

end;


#############################################################################
##
#F  Exponents( <U>, <u> ) . . . . . . . . . . . exponent vector of <u> in <U>
##
Exponents := function( arg )
    if Length(arg) = 2  then
        return arg[1].operations.Exponents( arg[1], arg[2], Integers );
    else
        return arg[1].operations.Exponents( arg[1], arg[2], arg[3] );
    fi;
end;

AgGroupOps.Exponents := function( U, u, F )
    local   exps, tmp, dep;

    # Make sure that <U> has 'shiftInfo'.
    if  not IsBound( U.shiftInfo )  then
        U.operations.AddShiftInfo( U );
    fi;

    # Use the suggested method in order to compute the exponent vector.
    if u = U.identity  then
        exps := ShallowCopy( U.shiftInfo.list );
    elif U.shiftInfo.method = 7  then
        return [];
    elif U.shiftInfo.method = 4
        or U.shiftInfo.method = 5
        or U.shiftInfo.method = 1
    then
        if IsFFE( F.one )  then
            return ExponentsAgWord( u,
                                    U.shiftInfo.first,
                                    U.shiftInfo.last,
                                    F.root );
        elif F.one = 1  then
            return ExponentsAgWord( u,
                                    U.shiftInfo.first,
                                    U.shiftInfo.last );
    	else
            return ExponentsAgWord( u,
                                    U.shiftInfo.first,
                                    U.shiftInfo.last ) * F.one;
        fi;
    elif U.shiftInfo.method = 6  then
        exps := ShallowCopy( U.shiftInfo.list );
        while u <> U.identity  do
            dep := U.shiftInfo.depths[ DepthAgWord( u ) ];
            tmp := LeadingExponentAgWord( u )
                     / LeadingExponentAgWord( U.shiftInfo.gens[ dep ] )
                   mod RelativeOrderAgWord( u );
            exps[ dep ] := tmp;
            u := U.shiftInfo.gens[ dep ] ^ tmp mod u;
        od;
    elif U.shiftInfo.method = 3  then
        exps := ShallowCopy( U.shiftInfo.list );
        while u <> U.identity  do
            dep := U.shiftInfo.depths[ DepthAgWord( u ) ];
            if dep < 0  then
                u := ReducedAgWord( u, U.shiftInfo.subs[ -dep ] );
            else
                tmp := LeadingExponentAgWord( u )
                         / LeadingExponentAgWord( U.shiftInfo.gens[ dep ] )
                       mod RelativeOrderAgWord( u );
                exps[ U.shiftInfo.factorDepths[ DepthAgWord( u ) ] ] := tmp;
                u := U.shiftInfo.gens[ dep ] ^ tmp mod u;
            fi;
        od;
    elif U.shiftInfo.method = 2  then
        exps := ShallowCopy( U.shiftInfo.list );
        while u <> U.identity and DepthAgWord( u ) <= U.shiftInfo.last  do
            dep := U.shiftInfo.depths[ DepthAgWord( u ) ];
            tmp := LeadingExponentAgWord( u )
                     / LeadingExponentAgWord( U.shiftInfo.gens[ dep ] )
                   mod RelativeOrderAgWord( u );
            exps[ dep ] := tmp;
            u := U.shiftInfo.gens[ dep ] ^ tmp mod u;
        od;
    else
        Error( "Exponents: unkown method ", U.shiftInfo.method );
    fi;

    # If the <U> is elementary abelian group with a field, make a vector.
    if IsFFE(F.one)  then
        MakeVecFFE( exps, F.one );
        return exps;
    elif F.one = 1  then
    	return exps;
    else
        return exps * F.one;
    fi;

end;


#############################################################################
##
#F  FactorArg( <U>, <N> ) . . . . . . . . . . . . . .  factor argument record
#V  FactorArgOps  . . . . . . . . . . . . . . . . . . . . factor argument ops
##
FactorArgOps := rec();

FactorArg := function( U, N )
    local   G, depths;

    if not IsBound( FactorArgOps.Parent )  then
    	FactorArgOps.Parent       := AgGroupOps.Parent;
    	FactorArgOps.IsParent     := AgGroupOps.IsParent;
    	FactorArgOps.AddShiftInfo := AgGroupOps.AddShiftInfo;
    	FactorArgOps.Exponents    := AgGroupOps.Exponents;
    fi;
    G := rec( factorNum   := U,
              factorDen   := N,
              identity    := U.identity,
              isFactorArg := true,
    	      operations  := FactorArgOps );
    depths := Set( List( Igs( N ), DepthAgWord ) );
    G.generators := Filtered(Igs(U), x->not DepthAgWord(x) in depths);

    return G;

end;

AgGroupOps.\mod := FactorArg;


#############################################################################
##
#F  AgGroupOps.MinimalGeneratingSet( <G> )  . compute a minimal generating set
##
AgGroupOps.MinimalGeneratingSet := function( G )
    local    mins,  M,  N;
    
    # catch trivial case
    if Length( G.generators ) = 0  then
        return [ ];
    fi;

    # <mins> is a minimal generating set in <G> / <M>
    M    := G;
    mins := [G.identity];
    while not G = Subgroup( G, mins )  do
        N := DerivedSubgroup(M);
        InfoAgGroup2( "#I  normal subgroup: ", N, "\n" );
        
        # compute a minimal generating set for <G> / <N>
        mins := G.operations.MinimalGens( G, M, N, mins );
        M    := N;
    od;
    return Set(mins);

end;

AgGroupOps.MinimalGens := function( G, M, N, mins )
    local   GN,  alpha,  minN,  MN,  series,  LN,  UN,  bigUN,  meet;

    GN     := G/N;
    alpha  := NaturalHomomorphism( G, GN );
    minN   := List( mins, x -> x^alpha );
    MN     := Subgroup( GN, List( M.generators, x -> x^alpha ) );
    series := [ TrivialSubgroup(GN) ];
    LN     := series[1];
    UN     := Subgroup( GN, minN );
    bigUN  := Closure( UN, LN );
    while not GN = UN  do
        meet := NormalIntersection( MN, bigUN );
        if not meet = LN  then
            Add( series, meet );
        fi;
        LN    := series[Length(series)];
        minN  := G.operations.MinimalGens2( GN, MN, LN, minN );
        UN    := Subgroup( GN, minN );
        bigUN := Closure( UN, LN );
        InfoAgGroup2( "#I  new <mins>: ", minN, "\n" );
        if GN = bigUN  then
            MN := LN;
            Unbind( series[Length(series)] );
        fi;
    od;
    return List( minN, x -> PreImagesRepresentative(alpha, x) );
end;

AgGroupOps.MinimalGens2 := function( GN, MN, LN, minN )
    local   GL,  alpha,  ML,  minL,  gensML,  r,  s,  y,  newgens,  meet;

    # <minN> generates a complement of <MN> / <LN> in <GN> / <LN>
    GL := GN / LN;

    # we are looking for a generating system of a non-complement
    alpha  := NaturalHomomorphism( GN, GL );
    ML     := Subgroup( GL, List(MN.generators, x -> x^alpha) );
    minL   := List(minN, x -> x^alpha);
    gensML := ML.generators;

    # try to modify <minL> to get a non-complement
    for r  in gensML  do
        for s  in [1..Length(minL)]  do
            y := r * minL[s];
            newgens := Copy(minL);
            newgens[s] := y;
            meet := NormalIntersection( ML, Subgroup( GL, newgens ) );
            if 1 < Size(meet)  then
                return List(newgens, x -> PreImagesRepresentative(alpha, x));
            fi;
        od;
    od;

    # add one element of <MN> / <LN>
    Add( minL, gensML[1] );
    return List( minL, x -> PreImagesRepresentative(alpha, x) );

end;


#############################################################################
##
#F  AgGroupPcp( <P> ) . . . . . . . . . . . . . . convert a pcp into ag group
##
AgGroupPcp := function( P )
    local   G;

    G := AgPcp( P );
    return Group( G.generators, G.identity );
end;


#############################################################################
##
#F  MatGroupAgGroup( <G>, <M> ) . . . . . . . . . . . . . . . .  matrix group
##
MatGroupAgGroup := function( G, M )
    local   V,  base,  p;

    # Typecheck arguments
    if not IsAgGroup( G ) or not IsAgGroup( M )  then
        Error( "usage: MatGroupAgGroup( <G>, <M> )" );
    elif M.generators = []  then
        Error( "<M> must not be trivial" );
    elif not IsElementaryAbelian( M )  then
        Error( "<M> must be elementary abelian" );
    elif not IsNormal( G, M )  then
        Error( "<G> must normalize <M>" );
    fi;

    # Get the prime, construct the matrices.
    base := Igs( M );
    p := RelativeOrderAgWord( base[ 1 ] );
    M := ShallowCopy( M );
    M.field := GF( p );
    V := rec( isDomain := true, base := base, field := M.field );
    return LinearOperation( G, V, function( x, a ) return
                                   M.operations.Exponents( M, x^a, M.field );
                                  end );

end;


#############################################################################
##
#F  PermGroupAgGroup( <G>, <U> )  . . . . . . . . . . . . . permutation group
##
PermGroupAgGroup := function( G, U )
    local   C;

    # Typecheck arguments
    if not IsAgGroup( G ) or not IsAgGroup( U )  then
        Error( "usage: PermGroupAgGroup( <G>, <U> )" );
    elif not IsSubgroup( G, U )  then
        Error( "<U> must be a subgroup of <G>" );
    fi;

    # Construct cosets.
    C := G.operations.Cosets( G, U );

    # Return permutation group.
    return Group( List( Igs( G ), x -> PermList( List(
                        C, p -> Position( C, p*x ) ) ) ), () );
end;


#############################################################################
##
#F  AgGroupFpGroup( <P> ) . . . . . . . . . . . . . . . . . create an aggroup
##
AgGroupFpGroup := function( P )
    local   G,  i;

    # Initialize  the  aggroup using the internal function 'AgFpGroup'. If an
    # error  is  detected  in  the  argument <P>, this function will raise an
    # error.
    G := AgFpGroup( P );
    G.isDomain  := true;
    G.isGroup   := true;
    G.isAgGroup := true;

    # This  group  contains  a  canonical generating system, so it is already
    # normalized.
    G.cgs := G.generators;

    # Add the operations record for an aggroup.
    G.operations := AgGroupOps;

    # Check if the indices are primes.
    if ForAny( G.generators, x->not IsPrimeInt(RelativeOrderAgWord(x)))  then
       Print("#W  AgGroupFpGroup: composite index, use 'RefinedAgSeries'\n");
    fi;

    # Add <G>.n
    for i  in [ 1 .. Length( G.generators ) ]  do
    	G.( String( i ) ) := G.generators[ i ];
    od;

    # That's it.
    return G;

end;


#############################################################################
##
#F  DirectProductAgGroupOps . . . . . . . .  ops for embedding and projection
##
DirectProductAgGroupOps := rec(); # <AgGroupOps>


#############################################################################
##
#F  DirectProductAgGroupOps.Embedding( <G>, <D>, <i> )	. . . . . . embedding
##
DirectProductAgGroupOps.Embedding := function( arg )
    local   G,  D,  C,  i,  k,  emb;

    # get arguments
    G := arg[1];
    D := arg[2];
    if Length( arg ) = 2  then
        i := 0;
        for k  in [ 1 .. Length( D.groups ) ]  do
	    C := D.groups[k];
	    if Parent( C ) = Parent( G ) and IsSubgroup( C, G )  then
		if i <> 0  then
		    Error( "<G> appears in several components of <D>" );
		fi;
		i := k;
	    fi;
	od;
	if i = 0  then
	    Error( "<G> is no component of <D>" );
	fi;
    else
	i := arg[3];
    fi;

    # either <G> is an element of <D>.groups or we must restrict
    emb := D.embeddings[i];
    if G <> D.groups[i]  then
	emb := GroupHomomorphismByImages( G, D, Cgs( G ), List( Cgs( G ),
	                                  x -> Image( emb, x ) ) );
	emb.isMapping := true;
    fi;
    return emb;

end;

#############################################################################
##
#F  DirectProductAgGroupOps.Projection( <D>, <G>, <i> )	. . . . .  projection
##
DirectProductAgGroupOps.Projection := function( arg )
    local   G,  D,  i,  k;

    # get arguments
    D := arg[1];
    G := arg[2];
    if Length( arg ) = 2  then
        i := 0;
        for k  in [ 1 .. Length( D.groups ) ]  do
	    if G = D.groups[k]  then
		if i <> 0  then
		    Error( "<G> appears in several components of <D>" );
		fi;
		i := k;
	    fi;
	od;
	if i = 0  then
	    Error( "<G> is no component of <D>" );
	fi;
    else
	i := arg[3];
    fi;

    # return projection
    return D.projections[i];

end;


#############################################################################
##
#F  AgGroupOps.DirectProduct( <L> )   . . . . . . . . . . . .  direct product
##
AgGroupOps.DirectProduct := function( L )
    local   D,  r,  i,  j,  gens,  rels,  x,  F,  k,  l;

    # All groups must be ag groups.
    if not ForAll( L, z -> IsList( z ) or IsAgGroup( z ) ) then
    	return GroupOps.DirectProduct( L );
    fi;

    # Use 'FpGroup' to get the presentation.
    D := [];
    r := [];
    i := 1;
    j := 1;
    gens := [];
    rels := [];
    for x  in L  do
        if IsList(x)  then
            F := x[1].operations.FpGroup( x[1], x[2] );
            Add( D, CopyAgGroup(x[1]) );
        else
            F := x.operations.FpGroup( x, LetterInt(j) );
            Add( D, CopyAgGroup( x ) );
            j := j + 1;
        fi;
        Append( gens, F.generators );
        Append( rels, F.relators );
        Add( r, i );
        i := i + Length( F.generators );
    od;
    Add( r, i );

    # Construct the ag group.
    F := AgGroupFpGroup( rec( generators := gens, relators := rels ) );
    F.groups := D;
    F.operations := DirectProductAgGroupOps;

    # Construct the embeddings.
    F.embeddings := [];
    for k  in [ 1 .. Length( D ) ]  do
	F.embeddings[k] := GroupHomomorphismByImages( D[k], F, Igs(D[k]),
			       Sublist(F.generators, [r[k] .. r[k+1]-1]) );
    od;

    # Construct the projections.
    F.projections := [];
    for k  in [ 1 .. Length( D ) ]  do
	gens := [];
	for l  in [ 1 .. Length( D ) ]  do
	    if l = k  then
		Append( gens, Igs( D[l] ) );
	    else
		Append( gens, List( Igs( D[l] ), x -> D[k].identity ) );
	    fi;
	od;
	F.projections[k] := GroupHomomorphismByImages(F, D[k], Cgs(F), gens);
    od;

    # Return the direct product.
    return F;

end;


#############################################################################
##
#F  AgGroupOps.SubdirectProduct(<G1>,<G2>,<phi1>,<phi2>)  . subdirect product
##
AgGroupOps.SubdirectProduct := function ( G1, G2, phi1, phi2 )
    local   S,          # subdirect product of <G1> and <G2>, result
            gens,       # generators of <S>
            D,          # direct product of <G1> and <G2>
            emb1, emb2, # embeddings of <G1> and <G2> into <D>
	    i,          # loop variable
            gen;        # one generator of <G1> or Kernel( <phi2> )

    if not IsAgGroup(G1) and IsAgGroup(G2) then
      return GroupOps.SubdirectProduct(G1,G2,phi1,phi2);
    fi;

    # make the direct product and the embeddings
    D := DirectProduct( G1, G2 );
    emb1 := Embedding( G1, D, 1 );
    emb2 := Embedding( G2, D, 2 );

    # the subdirect product is generated by $(g_1,x_{g_1})$ where $g_1$ loops
    # over the  generators of $G_1$  and $x_{g_1} \in   G_2$ is abitrary such
    # that $g_1^{phi_1} = x_{g_1}^{phi_2}$ and by $(1,k_2)$ where $k_2$ loops
    # over the generators of the kernel of $phi_2$.
    gens := [];
    for gen  in G1.generators  do
        Add( gens, gen^emb1 * PreImagesRepresentative(phi2,gen^phi1)^emb2 );
    od;
    for gen in Kernel( phi2 ).generators  do
        Add( gens, gen ^ emb2 );
    od;

    # and make the subdirect product
    S := AgGroup( D.operations.Subgroup( D, gens ) );
    S.isSubdirectProduct        := true;

    # enter the information that relates to the construction
    S.groups                    := [ G1, G2 ];
    S.homomorphisms             := [ phi1, phi2 ];

    # note the projections
    S.projections:=[];
    for i in [1..2] do
      # transfer projections
      S.projections[i]:=GroupHomomorphismByImages(S,S.groups[i],S.generators,
			 List(S.generators,j->Image(D.projections[i],
						Image(S.bijection,j))));
    od;

    # enter the operations record
    S.operations                := Copy( SubdirectProductOps );
    S.operations.Projection     := D.operations.Projection;

    # return the subdirect product
    return S;
end;


#############################################################################
##
#F  SemidirectProductAgGroupOps . . . . . .  ops for embedding and projection
##
SemidirectProductAgGroupOps := rec(); # <AgGroupOps>


#############################################################################
##
#F  SemidirectProductAgGroupOps.Embedding( <G>, <S>, <i> )  . . . . embedding
##
SemidirectProductAgGroupOps.Embedding := function( G, S, i )
    local   emb;

    # embbedings are stored in <S>.embeddings
    emb := S.embeddings[i];

    # either <G> is an element of <S>.groups or we must restrict
    if G <> S.groups[i]  then
	emb := GroupHomomorphismByImages( G, S, Cgs(G), List( Cgs(G),
	                                  x -> Image( emb, x ) ) );
	emb.isMapping := true;
    fi;
    return emb;

end;

#############################################################################
##
#F  SemidirectProductAgGroupOps.Projection( <S>, <G>, <i> ) . . .  projection
##
SemidirectProductAgGroupOps.Projection := function( S, G, i )

    # return projection
    return S.projections[i];

end;


#############################################################################
##
#F  SemidirectProduct( <G>, <a>, <H> )	. . . . . . . . .  semidirect product
##
AgGroupOps.SemidirectProduct := function( G, a, H )
    local   F, FG, FH, gensG, gensH, abstG, abstH, lenH, m, v, r, l, i, j, k;

    # Both <G> and <H> must be ag groups.
    if not IsAgGroup( H ) or not IsAgGroup( G )  then
        return GroupOps.SemidirectProduct( G, a, H );
    fi;
    	
    # Normalize and copy <G> and <H>.
    G := Normalized( G );
    H := Normalized( H );
    Unbind( G.field );
    Unbind( H.field );
    FG := G.operations.FpGroup( G, "g" );
    FH := H.operations.FpGroup( H, "h" );

    # Construct the free direct product.
    F  := rec( generators := Concatenation( FG.generators, FH.generators ),
               relators   := Concatenation( FG.relators,   FH.relators ) );

    # Add the operation of <G> on <H> using <a>.
    gensG := Igs( G );
    abstG := FG.generators;
    gensH := Igs( H );
    abstH := FH.generators;
    lenH  := Length( gensH );
    for i  in [ 1 .. Length( gensG ) ]  do
        for j  in [ 1 .. lenH ]  do
            l := abstH[ j ] ^ abstG[ i ];
            m := gensH[j] ^ Image( a, gensG[i] );
            v := H.operations.Exponents( H, m, Integers );
            r := IdWord;
            for k  in [ 1 .. lenH ]  do
                if v[k] <> 0  then
                    r := r * abstH[k] ^ v[k];
                fi;
            od;
            Add( F.relators, l / r );
        od;
    od;

    # Construct the ag group and the embeddings and projections.
    F := AgGroupFpGroup( F );
    F.operations := SemidirectProductAgGroupOps;
    F.groups := [ G, H ];
    F.embeddings := [];
    l := Sublist( F.generators, [ 1 .. Length(Igs(G)) ] );
    F.embeddings[1] := GroupHomomorphismByImages( G, F, Igs( G ), l );
    l := Sublist( F.generators, [ Length(Igs(G))+1 .. Length(Igs(F)) ] );
    F.embeddings[2] := GroupHomomorphismByImages( H, F, Igs( H ), l );
    F.projections := [];
    l := Concatenation( Igs(G), List( Igs(H), x -> G.identity ) );
    F.projections[1] := GroupHomomorphismByImages( F, G, Igs(F), l );
    l := Concatenation( List( Igs(G), x -> H.identity ), Igs(H) );
    F.projections[2] := GroupHomomorphismByImages( F, H, Igs(F), l );
    return F;

end;


#############################################################################
##
#F  SemidirectMatProduct( <G>, <a> )  . . . semi direct product with matrices
##
SemidirectMatProduct := function( G, a )
    local   FG, dim, p, abstM, F, gensG, abstG, i, j, k, l, r, mat, R;

    # Normalize and copy <G>.
    G := Normalized( G );
    Unbind( G.field );
    FG := G.operations.FpGroup( G, "g" );

    # <a>  is  homomorphism  into a  matrix  group. Get   the  dimension  of
    # the underlying vectorspace.
    R     := a.range;
    dim   := Length( R.identity[ 1 ] );
    p     := CharFFE( R.generators[1][1][1] );
    abstM := WordList( dim, "h" );

    # Construct the free direct product.
    F := rec( generators := Concatenation( FG.generators, abstM ),
              relators   := Concatenation( FG.relators,
                                           List( abstM, x -> x ^ p ) ) );

    # Add the operation of <G> on the vectorspace.
    gensG := Igs( G );
    abstG := FG.generators;
    for i  in [ 1 .. Length( gensG ) ]  do
        mat := Image( a, gensG[ i ] );
        for j  in [ 1 .. Length( mat ) ]  do
            l := abstM[ j ] ^ abstG[ i ];
            r := IdWord;
            for k  in [ 1 .. Length(mat[j]) ]  do
                if IntVecFFE(mat[j],k) <> 0  then
                    r := r * abstM[k] ^ IntVecFFE(mat[j],k);
                fi;
            od;
            Add( F.relators, l / r );
        od;
    od;
    return AgGroupFpGroup( F );

end;


#############################################################################
##
#F  WreathProduct( <G>, <H>, <f> )  . . . . . . . . . . . . .  wreath product
##
AgGroupOps.WreathProduct := function( G, H, f )
    local   i, j, k, lenG, lenH, FG, FH, deg, gens, rels, E, b, bi, a, aij;

    # Both <H> and <G> must be ag groups.
    if not IsAgGroup( H ) or not IsAgGroup( G )  then
    	return GroupOps.WreathProduct( G, H, f );
    fi;
    G := Normalized( G );
    H := Normalized( H );
    Unbind( G.field );
    Unbind( H.field );

    # Get degree of range of <f>.
    deg := PermGroupOps.LargestMovedPoint( Image( f, H ) );

    # Construct enough generators for the wreath product.
    lenG := Length( Igs( G ) );
    lenH := Length( Igs( H ) );

    # Get the presentation for both groups.
    FG := G.operations.FpGroup( G, "x" );
    FH := G.operations.FpGroup( H, "h" );

    # <bi> are the abstract generators for the complement isomorph <H>.
    bi := FH.generators;
    b  := Igs( H );

    # <aij> are the abstract gens for the <deg> subgroups ismorph to <G>.
    a   := FG.generators;
    aij := List( [ 1 .. deg ], y -> List( [ 1 .. lenG ], 
                 x -> AbstractGenerator(
           ConcatenationString( "n", String( y ), "_", String( x ) ) ) ) );

    # Make a list of all generators.
    gens := Concatenation( bi, Iterated( aij, Concatenation ) );

    # Start with the relators for <H>.
    rels := FH.relators;

    # Add the relators of <G> <deg> times.
    for i  in [ 1 .. deg ]  do
        Append( rels, List( FG.relators, x -> MappedWord( x, a, aij[i]) ) );
    od;

    # At last the operation of <H> on the <deg> <G>s.
    for i  in [ 1 .. lenH ]  do
        for j  in [ 1 .. deg ]  do
            for k  in [ 1 .. lenG ]  do
                Add( rels, aij[j][k] ^ bi[i]/aij[j^(Image(f,b[i]))][k] );
            od;
        od;
    od;

    # Return an ag group.
    return AgGroupFpGroup( rec( generators := gens, relators := rels ) );

end;


#############################################################################
##

#F  CollectorlessFactorGroup( <U>, <N> )  . . . . . . . . . . new factorgroup
##
CollectorlessFactorGroup := function( U, N )
    local   G,  i;

    G := U.operations.CollectorlessFactorGroup( U, N );

    # Add generators and <U> and <N>.
    G.factorNum := U;
    G.factorDen := N;
    for i  in [ 1 .. Length( G.generators ) ]  do
        G.( i ) := G.generators[ i ];
    od;

    # return the group
    return G;

end;

CanonicalAgWord7 := function( I, g )
    return rec( representative       := g,
    	    	info                 := I,
    	    	operations           := FactorGroupAgWordOps,
    	    	isFactorGroupElement := true );

end;

CanonicalAgWord4 := function( I, g )
    return rec( representative       := I.kernel.identity,
    	        info                 := I,
    	    	operations           := FactorGroupAgWordOps,
    	    	isFactorGroupElement := true );
end;

CanonicalAgWord5 := function( I, g )
    local   x, y, i, first;
    first := I.kernel.shiftInfo.first;
    if TailDepthAgWord( g ) < first  then
    	return rec( representative       := g,
    	            info                 := I,
    	    	    operations           := FactorGroupAgWordOps,
    	    	    isFactorGroupElement := true );
    else
        x := ExponentsAgWord( g, 1, first - 1 );
        y := I.kernel.parent.cgs;
        g := I.kernel.identity;
        for i  in [ 1 .. Length(x) ]  do
            if x[i] > 0  then
                g := g * y[i] ^ x[i];
            fi;
        od;
    	return rec( representative       := g,
    	            info                 := I,
    	    	    operations           := FactorGroupAgWordOps,
    	    	    isFactorGroupElement := true );
    fi;
end;

CanonicalAgWord6a := function( I, g )
    local   y, x, d, e;
    y := I.kernel.cgs;
    for x  in y  do
        d := DepthAgWord( x );
        e := ExponentAgWord( g, d );
        if e > 0  then
            g := g / x ^ e;
        fi;
    od;
    return rec( representative       := g,
    	        info                 := I,
    	    	operations           := FactorGroupAgWordOps,
    	    	isFactorGroupElement := true );
end;

CanonicalAgWord6b := function( I, g )
    local   y, x, d, e;
    y := I.kernel.igs;
    for x  in y  do
        d := DepthAgWord( x );
        e := ExponentAgWord( g, d );
        if e > 0  then
            e := LeadingExponentAgWord( x ) / e mod RelativeOrderAgWord( x );
            g := g / x ^ e;
        fi;
    od;
    return rec( representative       := g,
    	        info                 := I,
    	    	operations           := FactorGroupAgWordOps,
    	    	isFactorGroupElement := true );
end;

AgGroupOps.CollectorlessFactorGroup := function( U, N )
    local   G,  factor,  depths,  info,  i,  gens,  id;

    N := CopyAgGroup( N );
    U := CopyAgGroup( U );
    factor := FactorArg( U, N );
    depths := List( factor.generators, DepthAgWord );

    # Setup the agword infomation record.
    info := rec();
    info.kernel := N;
    info.group  := U;
    info.factor := factor;
    info.depths := [];
    for i  in [ 1 .. Length( depths ) ]  do
        info.depths[ depths[ i ] ] := i;
    od;

    # Select a function in order to compute a canonical rep.
    if not IsBound( info.kernel.shiftInfo )  then
        info.kernel.operations.AddShiftInfo( info.kernel );
    fi;

    if info.kernel.shiftInfo.method = 1  then
        Error( "factor arguments are not allowed" );
    elif info.kernel.shiftInfo.method = 2  then
        Error( "factor arguments are not allowed" );
    elif info.kernel.shiftInfo.method = 3  then
        Error( "factor arguments are not allowed" );
    elif info.kernel.shiftInfo.method = 4  then
        info.canonical := CanonicalAgWord4;
    elif info.kernel.shiftInfo.method = 5  then
        info.canonical := CanonicalAgWord5;
    elif info.kernel.shiftInfo.method = 6  then
        if IsBound( info.kernel.igs )  then
            info.canonical := CanonicalAgWord6b;
        else
            info.canonical := CanonicalAgWord6a;
        fi;
    elif info.kernel.shiftInfo.method = 7  then
        info.canonical := CanonicalAgWord7;
    else
        Error( "unkown method ", info.kernel.shiftInfo.method );
    fi;

    # Construct the new ag words.
    gens := List( factor.generators, x -> info.canonical( info, x ) );
    id   := info.canonical( info, N.identity );

    # Construct new ag group.
    G := rec();
    G.isDomain   := true;
    G.isGroup    := true;
    G.isAgGroup  := true;
    G.generators := gens;
    G.identity   := id;
    G.cgs        := G.generators;
    G.operations := AgGroupOps;
    return G;

end;


#############################################################################
##

#F  CayleyInputAgGroup( <U>, <name> )   . . . . . . . . . cayley input string
##
##  Compute  the  pc-presentation  for a  finite polycyclic  group  as cayley
##  input.  Return  this  input  as string.  The group will be named "G", the
##  generators  "G.i".  The  workspace for this group in cayley will be saved
##  under <name>.
##
CayleyInputAgGroup := function( U, name )

    local   gens,
            word,
            wordString,
            lines,
            newLines,
            i, j;


    # <lines>  will  hold the various lines of the input for cayley,they will
    # be concatenated later.
    lines := [];

    # Get the generators for the group  <U>.
    gens := Igs( U );

    # Make the preamble for Cayley. Initialize the group and generators.
    Add( lines, "PRINT 'A group of order "                          );
    Add( lines, String( Size( U ) )                                 );
    Add( lines, " will be defined.';\n"                             );
    Add( lines, "\" This presentation was computed by GAP \";\n"    );
    Add( lines, "G = FGRANK( "                                      );
    Add( lines, String( Length( gens ) )                            );
    Add( lines, " );\n"                                             );
    Add( lines, "G.PCRELATIONS :\n"                                 );

    # A function will yield the string for a word.
    wordString := function( a )
        local k, l, list, str, count;
        list := U.operations.Exponents( U, a, Integers );
        k := 1;
        while k <= Length( list ) and list[k] = 0  do k := k + 1;  od;
        if k > Length( list )  then return "IDENTITY";  fi;
        if list[ k ] <> 1  then
            str := ConcatenationString(
                "G.", String( k ), "^", String( list[ k ] ) );
        else
            str := ConcatenationString( "G.", String( k ) );
        fi;
        count := LengthString( str );
        for l  in [ k + 1 .. Length( list ) ]  do
            if count > 60  then
                str   := ConcatenationString( str, "\n    " );
                count := 4;
            fi;
            count := count - LengthString( str );
            if list[ l ] > 1  then
                str := ConcatenationString(
                    str, "*G.", String( l ), "^", String( list[ l ] ) );
            elif list[ l ] = 1  then
                str := ConcatenationString( str, "*G.", String( l ) );
            fi;
            count := count + LengthString( str );
        od;
        return str;
    end;

    # Add the power presentation part.
    for i  in [ 1 .. Length( gens ) ]  do
        Add( lines, "G."                                                 );
        Add( lines, String( i )                                          );
        Add( lines, "^"                                                  );
        Add( lines, String( RelativeOrderAgWord( gens[ i ] ) )           );
        Add( lines, " =\n    "                                           );
        Add( lines, wordString( gens[i]^RelativeOrderAgWord( gens[i] ) ) );
        Add( lines, ",\n"                                                );
    od;

    # Add the commutator presentation part.
    for i  in [ 1 .. Length( gens ) - 1 ]  do
        for j  in [ i + 1 .. Length( gens ) ]  do
            if i <> Length( gens ) - 1 or j <> i + 1  then
                Add( lines, "(G."                                       );
                Add( lines, String( j )                                 );
                Add( lines, ",G."                                       );
                Add( lines, String( i )                                 );
                Add( lines, ") =\n    "                                 );
                Add( lines, wordString( Comm( gens[ j ], gens[ i ] ) )  );
                Add( lines, ",\n"                                       );
            else
                Add( lines, "(G."                                       );
                Add( lines, String( j )                                 );
                Add( lines, ",G."                                       );
                Add( lines, String( i )                                 );
                Add( lines, ") =\n    "                                 );
                Add( lines, wordString( Comm( gens[ j ], gens[ i ] ) )  );
                Add( lines, ";\n"                                       );
            fi;
       od;
    od;

    # Add a postambel.
    Add( lines, "PRINT 'A group of order ',ORDER( G ),' is defined.';\n"   );
    Add( lines, "PRINT 'It will be saved under "                           );
    Add( lines, name                                                       );
    Add( lines, ".cws and is called G.';\n"                                );
    Add( lines, "save '"                                                   );
    Add( lines, name                                                       );
    Add( lines, ".cws';\nbye;\n"                                           );

    # Concatenate all lines and return.
    while Length( lines ) > 1  do
        if Length( lines ) mod 2 = 1  then
            Add( lines, "" );
        fi;
        newLines := [];
        for i  in [ 1 .. Length( lines ) / 2 ]  do
            newLines[ i ] := ConcatenationString( lines[2*i-1], lines[2*i] );
        od;
        lines := newLines;
    od;
    return lines[ 1 ];

end;


#############################################################################
##
#F  GapInputAgGroup( <U>, <name> )  . . . . . . . . . . . .  gap input string
##
##  Compute  the  pc-presentation for a finite polycyclic group as gap input.
##  Return  this  input  as  string.  The group  will  be  named  <name>, the
##  generators "g<i>".
##
GapInputAgGroup := function( U, name )

    local   gens,
            word,
            wordString,
            newLines,
            lines,
            i, j;


    # <lines>  will  hold  the  various  lines of the input for gap, they are
    # concatenated later.
    lines := [];

    # Get the generators for the group <U>.
    gens := Igs( U );

    # Make the preamble for GAP. Initialize the group and the generators.
    Add( lines, "##\n"                                                  );
    Add( lines, "## The presentation has been computed by GAP\n"        );
    Add( lines, "##\n"                                                  );
    Add( lines, "Print( \"A group of order "                            );
    Add( lines, String( Size( U ) )                                     );
    Add( lines, " will be defined.\\n\" );\n"                           );
    for i  in [ 1 .. Length( gens ) ]  do
        Add( lines, "g"             );
        Add( lines, String( i )     );
        Add( lines, " := AbstractGenerator( \"g" );
        Add( lines, String( i )     );
        Add( lines, "\" );\n"       );
    od;
    Add( lines, "GROUP := rec( generators := [\n"   );
    for i  in [ 1 .. Length( gens ) - 1 ]  do
        Add( lines, "g"         );
        Add( lines, String( i ) );
        Add( lines, ",\n"       );
    od;
    Add( lines, "g"                         );
    Add( lines, String( Length( gens ) )    );
    Add( lines, "],\n"                      );
    Add( lines, "relators := [\n"           );

    # A function will yield the string for a word.
    wordString := function( a )
        local k, l, list, str, count;
        list := U.operations.Exponents( U, a, Integers );
        k := 1;
        while k <= Length( list ) and list[k] = 0  do k := k + 1;  od;
        if k > Length( list )  then return "IdWord";  fi;
        if list[ k ] <> 1  then
            str := ConcatenationString( "g", String( k ), "^",
                String( list[ k ] ) );
        else
            str := ConcatenationString( "g", String( k ) );
        fi;
        count := LengthString( str ) + 15;
        for l  in [ k + 1 .. Length( list ) ]  do
            if count > 60  then
                str   := ConcatenationString( str, "\n    " );
                count := 4;
            fi;
            count := count - LengthString( str );
            if list[ l ] > 1  then
                str := ConcatenationString( str, "*g", String( l ), "^",
                    String( list[ l ] ) );
            elif list[ l ] = 1  then
                str := ConcatenationString( str, "*g", String( l ) );
            fi;
            count := count + LengthString( str );
        od;
        return str;
    end;

    # Add the power presentation part.
    for i  in [ 1 .. Length( gens ) ]  do
        Add( lines, ConcatenationString( "g", String( i ), "^",
            String( RelativeOrderAgWord( gens[ i ] ) ), " / ( ",
            wordString( gens[ i ] ^ RelativeOrderAgWord( gens[ i ] ) ),
	    " ),\n" ) );
    od;

    # Add the commutator presentation part.
    for i  in [ 1 .. Length( gens ) - 1 ]  do
        for j  in [ i + 1 .. Length( gens ) ]  do
            if i <> Length( gens ) - 1 or j <> i + 1  then
                Add( lines, ConcatenationString( "Comm( g", String( j ),
                    ", g",  String( i ), " ) / ( ",
                    wordString( Comm( gens[ j ], gens[ i ] ) ), " ),\n" ) );
            else
                Add( lines, ConcatenationString( "Comm( g", String( j ),
                    ", g", String( i ), " ) / ( ",
                    wordString( Comm( gens[ j ], gens[ i ] ) ), " )\n" ) );
            fi;
       od;
    od;
    Add( lines, "] );\n" );

    # Postamble.
    Add( lines, name                                );
    Add( lines, " := AgGroupFpGroup( GROUP );\n"    );
    for i  in [ 1 .. Length( gens ) ]  do
        Add( lines, "g"                 );
        Add( lines, String( i )         );
        Add( lines, " := "              );
        Add( lines, name                );
        Add( lines, ".generators[ "     );
        Add( lines, String( i )         );
        Add( lines, " ];\n"             );
    od;
    Add( lines, "Print(\"A group of order \", Size("         );
    Add( lines, name                                         );
    Add( lines, "), \" has been defined.\\n\");\n"           );
    Add( lines, "Print(\"It is called "                      );
    Add( lines, name                                         );
    Add( lines, "\\n\");\n"                                  );

    # Concatenate all lines and return.
    while Length( lines ) > 1  do
        if Length( lines ) mod 2 = 1  then
            Add( lines, "" );
        fi;
        newLines := [];
        for i  in [ 1 .. Length( lines ) / 2 ]  do
            newLines[ i ] := ConcatenationString( lines[2*i-1], lines[2*i] );
        od;
        lines := newLines;
    od;
    return lines[ 1 ];

end;


#############################################################################
##
#F  SogosInputAgGroup( <U>, <name> )  . . . . . . . . . .  sogos input string
##
##  Compute  the  pc-presentation  for  a  finite polycyclic  group as  sogos
##  input.  Return  this input as string. The group will be named <name>, the
##  generators "gi".
##
SogosInputAgGroup := function( U, name )

    local   gens,
            word,
            wordString,
            shift,
            newLines,
            lines,
            i, j;


    # <lines>  will  hold the various lines of the input for sogos, they will
    # be concatenated later.
    lines := [];

    # Get the generators for the group <U>.
    gens := Igs( U );

    #  Make the preamble for Sogos. Initialize the group and the generators.
    Add( lines, "\" A group of order "                                  );
    Add( lines, String( Size( U ) )                                     );
    Add( lines, " will be defined. \"\n"                                );
    Add( lines, "\" The presentation has been computed by GAP \";\n"    );
    Add( lines, "group: "                                               );
    Add( lines, name                                                    );
    Add( lines, ";\n"                                                   );
    Add( lines, "generators:\n"                                         );
    for i  in [ 1 .. Length( gens ) - 1 ]  do
        Add( lines, "g"         );
        Add( lines, String( i ) );
        Add( lines, ",\n"       );
    od;
    Add( lines, "g"                         );
    Add( lines, String( Length( gens ) )    );
    Add( lines, ";\n"                       );
    Add( lines, "pc relations:\n"           );

    # A function will will yield the string for a word.
    wordString := function( a )
        local k, l, list, str, count;
        list := U.operations.Exponents( U, a, Integers );
        k := 1;
        while k <= Length( list ) and list[k] = 0  do k := k + 1;  od;
        if k > Length( list )  then return "1";  fi;
        if list[ k ] <> 1  then
            str := ConcatenationString( "g", String( k ), "^",
                String( list[ k ] ) );
        else
            str := ConcatenationString( "g", String( k ) );
        fi;
        count := LengthString( str ) + 15;
        for l  in [ k + 1 .. Length( list ) ]  do
            if count > 60  then
                str   := ConcatenationString( str, "\n    " );
                count := 4;
            fi;
            count := count - LengthString( str );
            if list[ l ] > 1  then
                str := ConcatenationString( str, "*g", String( l ), "^",
                    String( list[ l ] ) );
            elif list[ l ] = 1  then
                str := ConcatenationString( str, "*g", String( l ) );
            fi;
            count := count + LengthString( str );
        od;
        return str;
    end;

    # Add the power presentation part.
    for i  in [ 1 .. Length( gens ) ]  do
        Add( lines, ConcatenationString( "g", String( i ), "^",
            String( RelativeOrderAgWord( gens[ i ] ) ), " = ",
            wordString( gens[ i ] ^ RelativeOrderAgWord( gens[ i ] ) ),
	    ",\n" ) );
    od;

    # Add the commutator presentation part.
    for i  in [ 1 .. Length( gens ) - 1 ]  do
        for j  in [ i + 1 .. Length( gens ) ]  do
            if i <> Length( gens ) - 1 or j <> i + 1  then
                Add( lines, ConcatenationString( "[g", String( j ), ",g",
                    String( i ), "] = ", wordString( Comm( gens[ j ],
                    gens[ i ] ) ), ",\n" ) );
            else
                Add( lines, ConcatenationString( "[g", String( j ), ",g",
                    String( i ), "] = ", wordString( Comm( gens[ j ],
                    gens[ i ] ) ), ";\n" ) );
            fi;
       od;
    od;

    # Postamble.
    Add( lines, "order;\n" );
    Add( lines, "elementary abelian series;\n" );
    Add( lines, "save workspace, file = '" );
    Add( lines, name );
    Add( lines, ".sws';\n" );
    Add( lines, "input;\n" );

    # Concatenate all lines and return.
    while Length( lines ) > 1  do
        if Length( lines ) mod 2 = 1  then
            Add( lines, "" );
        fi;
        newLines := [];
        for i  in [ 1 .. Length( lines ) / 2 ]  do
            newLines[ i ] := ConcatenationString( lines[2*i-1], lines[2*i] );
        od;
        lines := newLines;
    od;
    return lines[ 1 ];

end;


#############################################################################
##
#F  CGSInputAgGroup( <U>, <name> )  . . . . . . . . . .  generate input files
##
CGSInputAgGroup := function( U, name )

    local   gapFile,
            sogosFile,
            cayleyFile;

    gapFile    := ConcatenationString( name, ".gap" );
    sogosFile  := ConcatenationString( name, ".sog" );
    cayleyFile := ConcatenationString( name, ".cay" );

    PrintTo( gapFile,    GapInputAgGroup   ( U, name ) );
    PrintTo( sogosFile,  SogosInputAgGroup ( U, name ) );
    PrintTo( cayleyFile, CayleyInputAgGroup( U, name ) );

end;


#############################################################################
##

#F  Read .  . . . . . . . . . . . . . . . . . . . . load other group packages
##
ReadLib( "agprops"  );
ReadLib( "agsubgrp" );
ReadLib( "aghomomo" );
ReadLib( "agcoset"  );
ReadLib( "agnorm"   );
ReadLib( "aghall"   );
ReadLib( "aginters" );
ReadLib( "agcomple" );
ReadLib( "agclass"  );
ReadLib( "agcent"   );
ReadLib( "agctbl"   );
ReadLib( "onecohom" );
ReadLib( "saggroup" );


#############################################################################
##
#F  MergeOperationsEntries( <src>, <dst> )  . . . . . . . . . fix ops entries
##
MergeOperationsEntries := function( src, dst )
    local   sen,  den,  cpy,  nam;

    sen := Set( RecFields( src ) );
    den := Set( RecFields( dst ) );
    cpy := Difference( sen, den );
    for nam  in cpy  do
	dst.( nam ) := src.( nam );
    od;

end;

MergeOperationsEntries( AgGroupOps, DirectProductAgGroupOps );
MergeOperationsEntries( AgGroupOps, SemidirectProductAgGroupOps );

