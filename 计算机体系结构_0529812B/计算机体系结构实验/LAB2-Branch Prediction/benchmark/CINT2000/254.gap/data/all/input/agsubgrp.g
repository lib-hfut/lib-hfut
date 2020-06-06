#############################################################################
##
#A  agsubgrp.g                  GAP library                      Frank Celler
##
#A  @(#)$Id: agsubgrp.g,v 3.30.1.3 1996/02/08 12:07:06 sam Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file  contains   most functions  for named subgroups,  all functions
##  dealing with  or computing induced  or canonical  generating systems  for
##  aggroups and all functions for orbit-stabilizer calculation.
##
#H  $Log: agsubgrp.g,v $
#H  Revision 3.30.1.3  1996/02/08  12:07:06  sam
#H  fixed change in 'AffineOperation' (somehow this was lost here,
#H  and since it was not lost in 'aginters.g' this caused errors)
#H
#H  Revision 3.30.1.2  1995/12/05  15:10:40  mschoene
#H  replaced 'Filtered( <list>, IsBound )' by 'Compacted( <list> )'
#H
#H  Revision 3.30.1.1  1995/12/04  15:55:18  beick
#H  added AgGroupOps.SystemNormalizer
#H
#H  Revision 3.30  1994/02/07  15:32:58  sam
#H  changed 'AgGroupOps.\^' (same as 'GroupOps.\^')
#H
#H  Revision 3.29  1994/02/02  10:18:43  sam
#H  moved 'Normalized', 'IsNormalized' to 'dispatch.g'
#H
#H  Revision 3.28  1993/04/06  16:25:37  fceller
#H  fixed a bug in 'FrattiniSubgroup'
#H
#H  Revision 3.27  1993/04/01  11:59:34  fceller
#H  'Closure' now checks if the elements already lies in the subgroup,
#H  replaced '= []' by 'Length = 0'
#H
#H  Revision 3.26  1993/03/30  12:43:37  fceller
#H  removed '.elementaryAbelianFactors'
#H
#H  Revision 3.25  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.24  1992/12/02  08:09:14  fceller
#H  moved 'CompositionSeries' and 'PCentralSeries' to "group.tex"
#H
#H  Revision 3.23  1992/11/30  18:36:51  fceller
#H  moved 'ElementaryAbelianSeries' and 'CompositionSeries' to "group.g"
#H
#H  Revision 3.22  1992/08/14  14:58:06  fceller
#H  'ElementaryAbelianSeries' now stores its result in the group record
#H  instead of just storing the factor groups.
#H
#H  Revision 3.21  1992/06/16  11:09:54  fceller
#H  added 'FrattiniSubgroup' for p-groups
#H
#H  Revision 3.20  1992/04/03  13:10:09  fceller
#H  changed 'Shifted...' into 'Sifted...'
#H
#H  Revision 3.19  1992/03/27  15:20:44  fceller
#H  fixed a typo in 'PCentralSeries'
#H
#H  Revision 3.18  1992/02/07  18:11:40  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/05/18  11:49:34  fceller
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

#F  MergedIgs( <G>, <V>, <gens>, <normalize> )  . . . . . igs of <gens> & <V>
##
AgGroupOps.MergedIgs := function( G, V, gens, normalize )

   local gensG, nrGensG,
         gensNew, gensOld,
         weightSeen, gensSeen,
         chain,
         subWeight,
         pag, group,
         i, j,
         id,
         cux, cuxw,
         u, uw, uPowers,
         v,
         x;

   # Get the number of group <G> generators, this is the maximal depth.
   gensG   := Igs( G );
   nrGensG := Length( gensG );

   # Make  a  table to look up the weight corresponding to a subgroup, if the
   # weight in the parent group is known.
   subWeight := [];
   for i  in [ 1 .. nrGensG ]  do
      subWeight[ DepthAgWord( gensG[ i ] ) ] := i;
   od;

   # At  first  we  have  not seen any weight or a pag-system. We make a list
   # <id> for each weight and a list of 'false' for each seen weight.
   id := G.identity;
   weightSeen := List( [ 1 .. nrGensG ], x -> false );
   pag        := List( [ 1 .. nrGensG ], x -> id    );

   # If a subgroup is known enter those generatos in the pag-system <pag>.
   if IsBound( V.isAgGroup )  then
      for v  in Igs( V )  do
         weightSeen[ subWeight[ DepthAgWord( v ) ] ] := true;
         pag       [ subWeight[ DepthAgWord( v ) ] ] := v;
      od;
   fi;

   # Maybe  we  have  trailing  'true'-s  at the end of <weightSeen>. In that
   # case <chain> is the leftmost position of those 'true'-s.
   chain := nrGensG + 1;
   while chain > 1 and weightSeen[ chain - 1 ]  do
      chain := chain - 1;
   od;

   # We  only  loop  over the different generators of <gens>. <gensSeen> must
   # contain at least <id>, while <gensNew> never contains it.
   gensNew  := Difference( Set( gens ), [ id ] );
   gensSeen := ShallowCopy( gensNew );
   AddSet( gensSeen, id );

   # <gensNew>  will  hold  the  generators  which  must  still be entered in
   # <pag>. If this is the empty list, we have entered all generators.
   while 0 < Length(gensNew)  do
      gensOld := gensNew;
      gensNew := Set( [] );
      for u  in gensOld  do
         uw := subWeight[ DepthAgWord( u ) ];

         # If  the subgroup weight of <u> has reached chain, nothing is to be
         # done with this <u>, as it will reduce to <id>.
         if uw < chain  then

            # Now repeat shifting <u> through the <pag> list, until we find a
            # position  containing  <id>.  Not  only  <u>  but all powers are
            # inserted.
            uPowers := [];
            repeat
               if pag[ uw ] <> id  then
                  if uw + 1 >= chain  then
                     u := id;
                  else
                     u := u / pag[uw]^( LeadingExponentAgWord( u )
                                          / LeadingExponentAgWord( pag[uw] )
                                        mod RelativeOrderAgWord( u ) );
                  fi;
               else
                  AddSet( gensSeen, u );
                  weightSeen[ uw ] := true;
                  Add( uPowers, u );
                  if uw + 1 >= chain  then
                     u := id;
                  else
                     u := u ^ RelativeOrderAgWord( u );
                  fi;
               fi;
               if u <> id  then
                  uw := subWeight[ DepthAgWord( u ) ];
               fi;
            until u = id or uw >= chain;

            # Add  the  commputators of the powers of <u> with <pag> words to
            # the new generators.
            if 0 < Length(uPowers)  then
               for u  in uPowers  do
                  for x  in pag  do
                     if x <> id
                        and subWeight[ Minimum( DepthAgWord( x ),
                                       DepthAgWord( u ) ) ] + 1 < chain
                     then
                        cux := Comm( u, x );
                        if not cux in gensSeen  then
                           cuxw := subWeight[ DepthAgWord( cux ) ];
                           weightSeen[ cuxw ] := true;
                           AddSet( gensNew, cux );
                           AddSet( gensSeen, cux );
                        fi;
                     fi;
                  od;
               od;
            fi;

            # Enter the generators <uPowers> in <pag>.
            for x  in uPowers  do
               pag[ subWeight[ DepthAgWord( x ) ] ] := x;
            od;

            # Update <chain>.
            while chain > 1 and weightSeen[ chain - 1 ]  do
               chain := chain - 1;
            od;
            for i  in [ chain .. nrGensG ]  do
               if pag[ i ] = id  then
                  pag[ i ] := gensG[ i ];
                  for j  in [ 1 .. chain - 1 ]  do
                     cux := Comm( pag[ i ], pag[ j ] );
                     if not cux in gensSeen  then
                        AddSet( gensSeen, cux );
                        AddSet( gensNew, cux );
                        weightSeen[ subWeight[ DepthAgWord(cux) ] ] := true;
                     fi;
                  od;
               fi;
            od;
         fi;
      od;
   od;

   # If <chain> has reached 1, we have generated the whole group <G>.
   if chain = 1  then
      if normalize  then
         Cgs( G );
      fi;
      return G;
   fi;

   # Remove <id> from <pag> and construct an aggroup record.
   group := AgSubgroup( G, Filtered( pag, x -> x <> id ), false );

   # Normalize if necessary.
   if normalize  then
       Normalize( group );
   fi;

   return group;

end;

MergedIgs := function( U, S, gens, normalize )
    return U.operations.MergedIgs( U, S, gens, normalize );
end;


#############################################################################
##
#F  MergedCgs( <G>, <objs> )  . . . . . . . . . . canonical generating system
##
AgGroupOps.MergedCgs := function( U, objs )

    local   W,  V,
            cW, cV,
            gen,
            N, Ns,      # normal subgroup(s)
            gens,       # all other generators
            G,          # Supergroup
            T;          # <gen>

    # Get parent group and trivial subgroup of <U>.
    G    := Parent( U );
    W    := TrivialSubgroup(G);
    cW   := [];
    gens := [];
    Ns   := [];

    # Sort  the  generators.  <gens>  holds  generating  elements, <Ns> holds
    # generating  normal  subgroups.  <W> will hold the non-normal generating
    # subgroup with longest composition length.
    for gen  in objs  do
        if IsAgWord( gen ) then
            Add( gens, gen );
        elif IsAgGroup( gen ) then
            V  := gen;
            cV := Igs( V );
            G  := Parent( G, V );

            # See if <V> is a normal subgroup.
            if IsBound( V.isNormal ) and V.isNormal  then
                Add( Ns, V );
            elif Length( cW ) < Length( cV )  then
                Append( gens, cW );
                W  := V;
                cW := cV;
            else
                Append( gens, cV );
            fi;
        else

            # Raise an error as we cannot use <gen>.
            Error( "sorry, I cannot use ", gen, " as generator" );
        fi;
    od;

    # Now use 'MergedIgs' and 'Sum'
    T := MergedIgs( U, W, gens, true );
    for N  in Ns  do
        T := SumAgGroup( N, T );
    od;

    return T;

end;

MergedCgs := function( U, L )
    return U.operations.MergedCgs( U, L );
end;


#############################################################################
##
#F  Closure( <U>, <obj> ) . . . . . . . . . . . . .  closure of <U> and <obj>
##
AgGroupOps.Closure := function( U, obj )
    local   C,  S;

    if IsAgGroup( obj )  then
    	S := Parent( U, obj );
    	if Length( Igs( U ) ) < Length( Igs( obj ) )  then
    	    C := MergedIgs( S, obj, Igs( U ), true );
    	else
    	    C := MergedIgs( S, U, Igs( obj ), true );
    	fi;
    elif obj in U  then
    	C := U;
    else
    	C := MergedIgs( Parent( U ), U, [ obj ], false );
    fi;
    return C;

end;


#############################################################################
##
#F  Igs( <U> )  . . . . . . . . . . . . . . . . . . induced generating system
##
AgGroupOps.Igs := function( U )
    local   L;

    L := MergedIgs( Parent( U ), rec(), U.generators, false );
    if IsBound( L.cgs )  then
        return L.cgs;
    else
    	return L.igs;
    fi;

end;

Igs := function( U )
    local   igs;

    if IsBound( U.igs )  then
        igs := U.igs;
    elif IsBound( U.cgs )  then
        igs := U.cgs;
    else
        igs := U.operations.Igs( U );
        if Length( igs ) = Length( U.parent.cgs )  then
            U.cgs := U.parent.cgs;
    	    igs   := U.cgs;
        else
      	    U.igs := igs;
        fi;
    fi;
    return igs;

end;


#############################################################################
##
#F  Cgs( <U> )	. . . . . . . . . . . . . . . . . canonical generating system
##
AgGroupOps.Cgs := function( U )
    return MergedIgs( Parent( U ), rec(), U.generators, true ).cgs;
end;
    
Cgs := function( U )
    local   cgs;

    if IsBound( U.cgs )  then
        cgs := U.cgs;
    elif IsBound( U.igs )  then
    	cgs := ShallowCopy( U.igs );
    	NormalizeIgs( cgs );
        U.cgs := cgs;
    else
        cgs := U.operations.Cgs( U );
        U.cgs := cgs;
    fi;
    return cgs;

end;


#############################################################################
##
#F  AgGroupOps.IsNormalized( <U> )  . . . . is induced system a canonical one
##
AgGroupOps.IsNormalized := function( U )
    local   gens, i, j, d, g;

    if not IsBound( U.igs )  then
        Cgs( U );
        return true;
    elif IsBound( U.cgs )  then
        if U.cgs = U.igs  then
            Unbind( U.igs );
            Unbind( U.shiftInfo );
            Unbind( U.compositionSeries );
            Unbind( U.elementaryAbelianFactors );
            return true;
        else
            return false;
        fi;
    else
        gens := U.igs;

        # Leading exponent equals one?
        for g  in gens  do
            if LeadingExponentAgWord( g ) <> 1  then
                return false;
            fi;
        od;

        # Zeros above diagonale?
        for i  in [ 2 .. Length( gens ) ]  do
            d := DepthAgWord( gens[ i ] );
            for j  in [ 1 .. i - 1 ]  do
                if ExponentAgWord( gens[ j ], d ) <> 0  then
                    return false;
                fi;
            od;
        od;

        # <gens> are normalized.
        U.cgs := gens;
        Unbind( U.igs );
        Unbind( U.shiftInfo );
        Unbind( U.compositionSeries );
        Unbind( U.elementaryAbelianFactors );

        return true;
    fi;

end;

#############################################################################
##
#F  AgGroupOps.Normalized( <U> )  . . . . . . . . . . . . . subgroup with cgs
##
AgGroupOps.Normalized := function( U )
    local   V;

    # Make a copy of the generators of <U>.
    V := ShallowCopy( U );
    V.generators := ShallowCopy( U.generators );
    if IsBound( U.igs )  then
        if U.igs = U.generators  then
            V.igs := V.generators;
        else
            V.igs := ShallowCopy( U.igs );
        fi;
    fi;
    if IsBound( U.cgs )  then
        if U.cgs = U.generators  then
            V.cgs := V.generators;
        else
            V.cgs := ShallowCopy( U.cgs );
        fi;
    fi;
    V.operations.Normalize( V );
    return V;

end;

#############################################################################
##
#F  Normalize( <U> )  . . . . . . . . . . . . . . . . . .  convert igs to cgs
##
AgGroupOps.Normalize := function( U )
    local   i, j, exp, gens;

    # If <U> is trivial or normalized return.
    if not IsBound( U.igs )  then
        U.generators := Cgs( U );
        return;
    elif IsBound( U.cgs )  then
        Unbind( U.igs );
        Unbind( U.shiftInfo );
        Unbind( U.compositionSeries );
        Unbind( U.elementaryAbelianFactors );
    	Unbind( U.abstractGenerators );
    	Unbind( U.factorInfo );
    	U.generators := U.cgs;
        return;
    fi;

    # Normalize igs.
    gens := ShallowCopy( U.igs );
    NormalizeIgs( gens );
    Unbind( U.igs );
    Unbind( U.shiftInfo );
    Unbind( U.compositionSeries );
    Unbind( U.elementaryAbelianFactors );
    Unbind( U.abstractGenerators );
    Unbind( U.factorInfo );
    U.cgs := gens;
    U.generators := gens;

end;

Normalize := function( U )
    U.operations.Normalize( U );
end;


#############################################################################
##
##  CopyAgGroup( <G> )	. . . . . . . . . . . . . .  . . copy an ag group <G>
##
CopyAgGroup := function( G )
    local   H;

    H := ShallowCopy( G );
    H.generators := ShallowCopy( G.generators );
    if IsBound( G.igs )  then
    	if G.igs = G.generators  then
    	    H.igs := H.generators;
    	else
    	    H.igs := ShallowCopy( G.igs );
    	fi;
    fi;
    if IsBound( G.cgs )  then
    	if G.cgs = G.generators  then
    	    H.cgs := H.generators;
    	elif IsBound( G.igs ) and G.cgs = G.igs  then
    	    H.cgs := H.igs;
    	else
    	    H.cgs := ShallowCopy( G.cgs );
    	fi;
    fi;
    return H;

end;


#############################################################################
##

#F  AgGroupOps.ConjugateSubgroup( <U>, <g> )  . . . . . . . . . . . <U> ^ <g>
##
AgGroupOps.ConjugateSubgroup := function( G, a )
    local   H,  g,  id,  pag;

    # Shift <a> through <G>.
    a := SiftedAgWord( G, a );
    if a = G.identity  then
    	return G;
    fi;

    # Conjugate all generators. Remove unbounds.
    pag := [];
    id  := G.identity;
    for g  in Reversed( Igs( G ) )  do
        g := g ^ a;
        while g <> id and IsBound( pag[ DepthAgWord( g ) ] )  do
            g := ReducedAgWord( g, pag[ DepthAgWord( g ) ] );
        od;
        if g <> id  then
            pag[ DepthAgWord( g ) ] := g;
        fi;
    od;
    pag := Compacted( pag );

    # Don't normalize the group.
    if IsBound( G.parent )  then
        H := AgSubgroup( G.parent, pag, false );
    else
        H := AgSubgroup( G, pag, false );
    fi;

    # copy usefull information
    if IsBound( G.isCyclic )  then
        H.isCyclic := G.isCyclic;
    fi;
    if IsBound( G.isElementaryAbelian )  then
        H.isElementaryAbelian := G.isElementaryAbelian;
    fi;
    if IsBound( G.isAbelian )  then
        H.isAbelian := G.isAbelian;
    fi;
    if IsBound( G.isNilpotent )  then
        H.isNilpotent := G.isNilpotent;
    fi;
    return H;

end;

#############################################################################
##
#F  AgGroupOps.\^( <G>, <obj> )
##
##  The difference between this and 'GroupOps.\^' is only that there the
##  dispatcher 'ConjugateSubgroup' is called.
##
AgGroupOps.\^ := function( G, obj )

    if   IsGroup( G ) then

      # The group is the left operand, return the conjugate of 'G' by 'obj'.
      return AgGroupOps.ConjugateSubgroup( G, obj );

    elif IsGroup( obj ) then

      # The group is the right operand.
      # Perhaps we wanted to call the exponentiation of the left operand.
      if IsRec( G ) and IsBound( G.operations )
                    and IsBound( G.operations.\^ )
                    and G.operations.\^ <> obj.operations.\^ then
        return G.operations.\^( G, obj );
      fi;
    else
      Error( "exponentiation is not defined" );
    fi;
    end;

#############################################################################
##
#F  AgGroupOps.ConjugateSubgroups( <G>, <U> ) . .  conjugate subgroups of <U>
##
AgGroupOps.ConjugateSubgroups := function( G, U )
    local   L,  f,  d,  u,  S;

    L := Cgs( U );
    f := function( c, g )
             d := [];
    	     for u  in c  do
    	         Add( d, u^g );
             od;
    	     d := HomomorphicIgs( d );
    	     NormalizeIgs( d );
    	     return d;
         end;
    S := Orbit( G, L, f );
    return List( S, x -> AgSubgroup( G, x, true ) );

end;


#############################################################################
##
#F  AgGroupOps.NormalClosure( <G>, <U> )  . . . . . . . . . .  normal closure
##
AgGroupOps.NormalClosure := function( arg )
    local   U, V, M, G, K, gens, subg, tmp, id, g, u;

    # If only one group is given, take the supergroup  of  the first argument
    # as default.
    U := arg[ Length( arg ) ];
    if Length( arg ) = 2  then
        V := arg[ 1 ];
    else
        V := Parent( U );
    fi;

    # If <U> or <V> is trivial, we can return.
    if 0 = Length(U.generators) or 0 = Length(V.generators)  then
        return U;
    fi;

    # Reduce  the  generators  of  <V>.  Conjugated <U> with those generators
    # until we reach a fixpoint.
    G    := Parent( U, V );
    gens := Set( List( V.generators, x -> SiftedAgWord( U, x ) ) );
    subg := U.generators;
    K    := U;
    id   := G.identity;
    repeat
        M := [];
        for g  in gens  do
            for u  in subg  do
                tmp := Comm( g, u );
                if tmp <> id  then
                    AddSet( M, tmp );
                fi;
            od;
        od;

        # For  groups  with  more  generators,  it is better to normalized in
        # order to reduce collecting costs.
        tmp  := MergedIgs( G, K, M, true );
        subg := FactorArg( tmp, K ).generators;
        K    := tmp;
    until 0 = Length(subg);

    # Normalize the group. See above
    return K;

end;


#############################################################################
##
#F  AgGroupOps.CommutatorSubgroup( <U>, <V> ) . . . . . . commutator subgroup
##
AgGroupOps.CommutatorSubgroup := function( arg )
    local   U, V, G, u, v, i, j, C;

    U := arg[ 1 ];
    if Length( arg ) = 2  then
        V := arg[ 2 ];
    else
        V := U;
    fi;
    G := Parent( U, V );
    if 0 = Length(U.generators) or 0 = Length(V.generators)  then
        return TrivialSubgroup(G);
    fi;

    # Construct cgs for <U> and <V>.
    Cgs( U );
    Cgs( V );

    # At  first compute all commutators [a,b] of generators a of <U> and b of
    # <V>. If <U> = <V>, we need only compute those with a > b.
    C := [];

    # Get the commutators of the generators;
    if U = V  then
        if IsBound( U.derivedSubgroup ) then
            return U.derivedSubgroup;
        fi;
        for i  in [ 1 .. Length( U.cgs ) ]  do
            for j  in [ i + 1 .. Length( V.cgs ) ]  do
                AddSet( C, Comm( V.cgs[ j ], U.cgs[ i ] ) );
            od;
        od;
        C := MergedIgs( G, rec(), C, true );
    else
        for u  in U.cgs  do
            for v  in V.cgs  do
                AddSet( C, Comm( v, u ) );
            od;
        od;
        C := Subgroup( G, C );

        # In order to conjugate with fewer elements, compute <U,V>. If one is
        # normal than we do not need the normal closure, see Glasby 1987.
        if     not ( IsBound( U.isNormal ) and U.isNormal )
           and not ( IsBound( V.isNormal ) and V.isNormal )
        then
            C := NormalClosure( Closure( U, V ), C );
        fi;
    fi;

    # That's it.
    return C;

end;


#############################################################################
##
#F  AgGroupOps.DerivedSubgroup( <U> ) . . . . . . . . . . .  derived subgroup
##
AgGroupOps.DerivedSubgroup := AgGroupOps.CommutatorSubgroup;


#############################################################################
##
#F  AgGroupOps.DerivedSeries( <U> ) . . . . . . . . . . . . .  derived series
##
##  Compute  the  derived  series  of  <U>.  Return a sequence of the derived
##  groups.  The group {1} is ( always ) part of this series.  This is nearly
##  the same as 'DerivedSeriesGroup'  but we will set 'isNormal' if <U>  is a
##  normal.
##
AgGroupOps.DerivedSeries := function( U )
    local   S, V;

    # Return if <U> = {1}.  Otherwise set 'isNormal' in <U>.
    if 0 = Length(U.generators)  then
        return [ U ];
    else
    	IsNormal( Parent( U ), U );
    fi;

    # Compute derived series by repeated calling of 'DerivedSubgroup'.
    V := U;
    S := [ U ];
    repeat
        V := DerivedSubgroup( V );
        if U.isNormal  then V.isNormal := true;  fi;
        Add( S, V );
    until 0 = Length(V.generators);

    # and return
    return S;

end;


#############################################################################
##
#F  AgGroupOps.LowerCentralSeries( <U> )  . . . . . . .  lower central series
##
AgGroupOps.LowerCentralSeries := function( U )
    local   S, v, u, C, V;

    # Test <U> = {1},  otherwise set 'isNormal' in <U>.
    if 0 = Length(U.generators)  then
        return [ U ];
    else
    	IsNormal( Parent( U ), U );
    fi;

    # Compute recursively Zi+1 := [G,Zi], Z0 := G.
    V := U;
    S := [];
    repeat
    	Cgs( V );
        if U.isNormal  then V.isNormal := true;  fi;
        Add( S, V );

        # In  order to avoid the normal closure in case of a not normal group
        # <U>, compute the commutator subgroup directly.
        C := [];
        for u  in U.cgs  do
            for v  in V.cgs  do
                AddSet( C, Comm( v, u ) );
            od;
        od;
        V := MergedIgs( V, rec(), C, true );
    until V = S[ Length( S ) ];

    # If Zi+1 = Zi, return.
    return S;

end;


#############################################################################
##
#F  AgGroupOps.Core( <G>, <U> ) . . . . . . . core of <U> under action of <G>
##
AgGroupOps.Core := function( V, U )
    local   N,  G,  v,  C;

    # Typecheck arguments and catch trivial cases.
    G := Parent( U, V );
    if IsSubgroup( U, V ) or IsTrivial(U) or IsTrivial(V)  then
        return U;
    fi;

    # Start with <U>.
    C := U;

    # Now  compute  intersection with all conjugate subgroups, conjugate with
    # all generators of V and its powers
    for v  in Reversed( Cgs( V ) )  do
        repeat
            N := ConjugateSubgroup( C, v );
            if C <> N  then
                C := Intersection( C, N );
            fi;
        until C = N;
        if 0 = Length(C.generators)  then
            return C;
        fi;
    od;
    return C;

end;


#############################################################################
##
#F  AgGroupOps.FrattiniSubgroup( <G> )  . . . . . .  frattini subgroup of <G>
##
AgGroupOps.FrattiniSubgroup := function( G )
    local   l,  k,  p,  i,  j,  F;

    # if <G> is trivial return
    if 0 = Length(G.generators)  then
    	F := G;

    # <G> must be a p-group
    elif 1 < Length(Set(Factors(Size(G))))  then
    	F := GroupOps.FrattiniSubgroup(G);

    # Frattini(<G>) = <G>^p * <G>'
    else
    	p := RelativeOrderAgWord(G.generators[1]);
    	l := Igs(G);
    	k := [ l[1]^p ];
    	for i  in [ 2 .. Length(l) ]  do
    	    for j  in [ 1 .. i-1 ]  do
    	    	Add(k, Comm(l[i], l[j]));
    	    od;
    	    Add(k, l[i]^p);
    	od;
    	F := MergedIgs(G, rec(), k, false);
    fi;

    # return the Frattini group
    return F;

end;


#############################################################################
##
#F  AgGroupOps.CompositionSeries( <U> ) . . . . . . . . .  composition series
##
AgGroupOps.CompositionSeries := function( U )
    local   g,  l,  S;

    # compute an induced generating system of <U>
    g := Igs( U );
    l := Length( g );
    S := List( [ 1 .. l + 1 ], x -> Sublist( g, [ x .. l ] ) );
    if IsBound( U.igs )  then
        S := List( S, x -> AgSubgroup( U, x, false ) );
    else
        S := List( S, x -> AgSubgroup( U, x, true ) );
    fi;

    # make sure the first element of <S> is <U>
    S[1] := U;

    # and return <S>
    return S;

end;


#############################################################################
##
#F  AgGroupOps.PCentralSeries( <U>, <p> ) .  . . . . . . . <p>-central series
##
AgGroupOps.PCentralSeries := function( U, p )
    local   L,  C,  S,  N,  P;

    # Start with <U>.
    L := [];
    N := U;
    repeat
    	Add( L, N );
        S := N;
        C := CommutatorSubgroup( U, S );
        P := List( FactorArg( S, C ).generators, x -> x ^ p );
        N := MergedIgs( S, C, P, true );
    until N = S;
    return L;

end;


#############################################################################
##

#F  PRump( <U>, <p> ) . . . . . . . . . . . . . . . . . . . . . . .  <p>-rump
##
PRump := function( U, p )
    local   P;

    if not IsPrimeInt( p )  then
    	Error( "<p> must be a prime" );
    else
    	P := U.operations.PRump( U, p );
    fi;
    return P;

end;

AgGroupOps.PRump := function( U, p )
    local   i,  C,  P;

    # Start with the derived subgroup of <U> and add <p>-powers.
    C := DerivedSubgroup( U );
    P := List( FactorArg( U, C ).generators, x -> x ^ p );
    return MergedIgs( U, C, P, true );

end;


#############################################################################
##
#F  CompositionSubgroup( <U>, <n> ) . . . . . . . . . .  composition subgroup
##
CompositionSubgroup := function( U, n )
    return U.operations.CompositionSubgroup( U, n );
end;

AgGroupOps.CompositionSubgroup := function( U, n )
    return CompositionSeries( U )[ n ];
end;


#############################################################################
##

#F  MeltElementaryAbelianSeriesAgGroup( <U> ) . . . . . .  melt series of <U>
##
##  Try to melt the elementary abelian series of <U>.
##
MeltElementaryAbelianSeriesAgGroup := function( U )
    local   P, S, L, i;

    # get elementary abelian series of <U>
    L := ElementaryAbelianSeries(U);
    P := TrivialSubgroup(U);
    S := [ P ];

    # and check for larger factors
    for i  in Reversed( [ 1 .. Length(L)-1 ] )  do
        if not IsElementaryAbelian( L[i] / P )  then
            P := L[i+1];
            Add( S, P );
        fi;
    od;
    Add( S, U );
    S := Reversed(S);

    # warn the user if the series has been changed
    if IsBound(U.elementaryAbelianSeries)  then
    	if U.elementaryAbelianSeries <> S  then
    	    Print( "#W  the elementary abelian series of <G> has ",
    	    	   "been changed\n" );
    	fi;
    fi;
    U.elementaryAbelianSeries := S;

end;


#############################################################################
##
#F  ElementaryAbelianSeriesThrough( <list> )  . . . . . . . . . . . . . local
##
ElementaryAbelianSeriesThrough := function( S )
    local   i,  N,  O,  I,  E,  L;

    # typecheck arguments
    if 0 < Length(S[Length(S)].generators)  then
        S := ShallowCopy( S );
        Add( S, TrivialSubgroup(S[1]) );
    fi;

    # start with the elementay series of the first group of <S>
    L := ElementaryAbelianSeries( S[ 1 ] );
    N := [ S[ 1 ] ];
    for i  in [ 2 .. Length( S ) - 1 ]  do
        O := L;
        L := [ S[ i ] ];
        for E  in O  do
            I := IntersectionSumAgGroup( E, S[ i ] );
            if not I.sum in N  then
                Add( N, I.sum );
            fi;
            if not I.intersection in L  then
                Add( L, I.intersection );
            fi;
        od;
    od;
    for E  in L  do
        if not E in N  then
            Add( N, E );
        fi;
    od;

    # return it.
    return N;

end;


#############################################################################
##
#F  AgGroupOps.ElementaryAbelianSeries( <U> ) . . . elementary abelian series
##
AgGroupOps.ElementaryAbelianSeries := function( U )

    local   ds,             # derived series
            L,              # elementary abelian series of parent
            S,              # elementary abelian series of <U>
            new, cgrp, grp, # Sylow & agemo loop groups
            i, j,           # loops
            g,              # elements of factors
            diff,           # reps of commutator factor group
            primes,         # primes of factor group seen so far
            p,              # loop for primes
            tmp;

    # if <U> is a list of normal subgroups,  disptach
    if IsList(U)  then
        return ElementaryAbelianSeriesThrough(U);
        
    # if <U> is trivial,  return
    elif 0 = Length(U.generators)  then
        return [ U ];
    fi;

    # if <U> is a parent,  try 'IsElementrayAbelianAgSeries'
    if IsParent(U) and IsElementaryAbelianAgSeries(U)  then
        return U.elementaryAbelianSeries;
    fi;
    
    # compute a elementary abelian series for the parent
    if not IsParent(U)  then
        L := ElementaryAbelianSeries( Parent(U) );
        U := Normalized(U);
        S := [ U ];
        for i  in [ 2 .. Length(L) ]  do
            grp := NormalIntersection( L[i], U );
            if U <> grp  then
                Add( S, grp );
                U := grp;
            fi;
            if 0 = Length(U.generators)  then
                return S;
            fi;
        od;
        Error( "elementary abelian series of parent is inconsistent" );
    fi;

    # compute the derived series of <U>
    ds := DerivedSeries(U);
    
    # compute Sylow subgroups and agemos
    L := [];
    for j  in [ 1 .. Length(ds)-1 ]  do
        new  := ds[j];
        cgrp := ds[j+1];
        diff := FactorArg( new, cgrp ).generators;

        # compute the set of primes,  but *do not* sort the primes
        primes := [];
        for g  in diff  do
            p := RelativeOrderAgWord(g);
            if not ( p in primes )  then
                Add( primes, p );
            fi;
        od;
        
        # loop over all primes and compute agemos
        for p  in primes  do
            repeat
                grp  := new;
                diff := List( diff, x -> x ^ p );
                new  := MergedIgs( U, cgrp, diff, true );
                if new <> grp then
                    Add( L, grp );
                fi;
            until new = grp;
        od;
    od;

    # add trivial group
    Add( L, TrivialSubgroup(U) );

    # this is an elementary abelian series
    return L;

end;


#############################################################################
##
#F  RefinedSubnormalSeries( <L> ) . . . . . . . . . refine a subnormal series
##
RefinedSubnormalSeries := function( L )

    local   N,        	# New step in the new series
            S,      	# Refined series
            ref, 	# Flag
    	    D,	    	# generators
            z,   	# Temporary
            i,  j;

    # Is series <L> already refined ?
    ref := true;
    for i  in [ 1 .. Length( L ) - 1 ]  do
        if Length( Igs(L[i]) ) <> Length( Igs(L[i+1]) )+1  then
            ref := false;
        fi;
    od;
    if ref  then
    	return L;
    fi;

    # It is not refined, so refine it now.
    N := L[ Length( L ) ];
    S := [ N ];
    for i  in Reversed( [ 1 .. Length( L ) - 1 ] )  do
        D := FactorArg( L[ i ], N ).generators;
        for j  in Reversed( [ 2 .. Length( D ) ] )  do
            N := MergedIgs( L[i], N, [ D[j] ], true );
            Add( S, N );
        od;
        N := L[ i ];
        Add( S, N );
    od;

    # Reverse series and return.
    return Reversed( S );

end;


#############################################################################
##

#F  AgOrbitStabilizer( <U>, <gens>, <p>, <op> ) . . . . . . . . . . . . orbit
##
AgOrbitStabilizer := function( arg )

    local   O,          # complete Orbit
            prod,       # Auxiliary Variable to compute agword rep
            n,          # Auxiliary Variable to compute agword rep
            S,          # Agword stabilizer
            i, j, k,    # Loop
            G,
            len,
    	    l1, l2,
            V,          # Parameter <gens>
            U,          # Generating system of <U>
            p,          # Our start point
            o,          # relative order of next generators
            op,         # operation
            useOp,      # must we use a new operation (0=*, 1=^, 2=<op>)
            mi,
            np,         # New point
            r,          # Temp
            e;          # Temp

    InfoAgGroup1( "#I  OrbitStabilizer: ", "|<group>| = ",
    	    	  StringPP( Size( arg[1] ) ), "\n" );

    # Catch trivial cases.
    if 0 = Length(arg[1].generators)  then
        InfoAgGroup1( "#I  OrbitStabilizer: returns ",
	              "|<orbit>| = 1, |<stab>| = 1 \n" );
        return rec( stabilizer := arg[ 1 ], orbit := [ arg[ 3 ] ] );
    fi;

    # Get generators.
    U := arg[ 1 ];
    G := Parent( U );
    U := Igs( U );
    V := arg[ 2 ];
    p := arg[ 3 ];

    # Get the operation, set flag <useOp> (0=*, 1=^, 2^<op>).
    if Length( arg ) = 4  then
        op := arg[ 4 ];
        if IsBool( op )  then
            if op  then
                useOp := 0;
            else
                useOp := 1;
            fi;
    	elif op = OnRight  then
    	    useOp := 0;
        elif op = OnPoints then
    	    useOp := 1;
    	else
            useOp := 2;
        fi;
    else
        useOp := 0;
    fi;
    if Length( U ) <> Length( V ) then
        Error( "not enough homomorphic generators for <U>" );
    fi;

    # Initialize all.
    O    := [ p ];
    prod := [ 1 ];
    n    := [ ];
    S    := [ ];

    # Start constructing orbit.
    for i  in Reversed( [ 1 .. Length( V ) ] )  do
        mi := V[ i ];
        if useOp = 0  then
            np := p * mi;
        elif useOp = 1  then
            np := p ^ mi;
        else
            np := op( p, mi );
        fi;

        # Is <np> really a new point or is it in <O>.
        j := Position( O, np );

        # Let's see if it is new (j = false).
        if j = false  then
            o := RelativeOrderAgWord( U[i] );
            Add( prod, prod[ Length( prod ) ] * o );
            Add( n, i );
            len := Length( O );
            if useOp = 0  then
    	    	l1 := 0;
    	    	O[ o * len ] := true;
                for k  in [ 1 .. o - 1 ]  do
    	    	    l2 := l1 + len;
                    for j  in [ 1 .. len ]  do
    	    	    	O[ j + l2 ] := O[ j + l1 ] * mi;
                    od;
    	    	    l1 := l2;
                od;
            elif useOp = 1  then
    	    	l1 := 0;
    	    	O[ o * len ] := true;
                for k  in [ 1 .. o - 1 ]  do
    	    	    l2 := l1 + len;
                    for j  in [ 1 .. len ]  do
    	    	    	O[ j + l2 ] := O[ j + l1 ] ^ mi;
                    od;
    	    	    l1 := l2;
                od;
            else
    	    	l1 := 0;
    	    	O[ o * len ] := true;
                for k  in [ 1 .. o - 1 ]  do
    	    	    l2 := l1 + len;
                    for j  in [ 1 .. len ]  do
    	    	    	O[ j + l2 ] := op( O[ j + l1 ], mi );
                    od;
    	    	    l1 := l2;
                od;
            fi;
        elif j = 1 then
            Add( S, U[i] );
        else
            r := G.identity;
            j := j - 1;
    	    len := Length( prod );
            for k  in [ 1 .. len - 1 ]  do
                e := QuoInt( j, prod[ len - k ] );
                r := U[ n[ len - k ] ] ^ e * r;
                j := j mod prod[ len - k ];
            od;
            Add( S, U[i] * r ^ -1 );
        fi;
    od;

    # <S> is a reversed IGS.
    S := AgSubgroup( G, Reversed( S ), false );

    InfoAgGroup1( "#I  OrbitStabilizer: returns ", "|<orbit>| = ",
    	    	  Length( O ), ", |<stab>| = ", StringPP(Size( S )), "\n" );

    return rec( stabilizer := S, orbit := O );

end;


#############################################################################
##
#F  LinearOperation( <U>, <V>, <phi> )  . . . . . . . . . . lineare operation
##
AgGroupOps.LinearOperation := function( U, V, phi )
    local   L,  B,  M;

    # Catch trivial cases.
    if 0 = Length(U.generators) then
        return rec( images := [] );
    fi;

    # Ok, now compute matrix.
    B := Base( V );
    L := List( Igs( U ), x -> List( B, y -> phi( y, x ) ) );
    List( L, IsMat );

    M := Group( L, L[1]^0 );
    M.images := L;
    return M;

end;

LinearOperation := function( U, V, phi )
    return U.operations.LinearOperation( U, V, phi );
end;


#############################################################################
##
#F  AffineOperation( <G>, <vectors>, <phi>, <tau> ) . . . . . . . . affine op
##
AgGroupOps.AffineOperation := function( U, vectors, phi, tau )
    local   i,  v,  m,  l,  one,  zero,  mats,  M;

    # Catch trivial cases.
    U := Igs( U );
    if 0 = Length(U)  then
        return rec( images := [] );
    fi;

    if IsRec( vectors ) then
#T The manual allows this.
#T Of course it should be changed, the basis not the space should be
#T the argument ...
      vectors:= Base( vectors );
    fi;
    one := tau( U[ 1 ] )[ 1 ] ^ 0;
    if Length( vectors ) = 0 then
        mats := List( U, x -> [ [ one ] ]);
    else
    	zero := 0 * one;

    	# First the linear operation.
    	mats := List( U, x -> List( vectors, y -> phi( y, x ) ) );
    	for m  in mats  do
            for l  in m  do
            	Add( l, zero );
            od;
    	od;
    	for i  in [ 1 .. Length( U ) ]  do
            v := tau( U[ i ] );
            Add( v, one );
            Add( mats[ i ], v );
    	od;
    	List( mats, IsMat );
    fi;

    M := Group( mats, mats[1]^0 );
    M.images := mats;
    return M;

end;

AffineOperation := function( U, V, phi, tau )
    return U.operations.AffineOperation( U, V, phi, tau );
end;


#############################################################################
##
#F  Orbit( <U>, <pt>, <op> )  . . . . . . . . . . . . . . . orbit algorithmus
##
AgGroupOps.Orbit := function( U, pt, op )

    # Catch trivial cases.
    if 0 = Length(U.generators)  then
        InfoAgGroup1( "#I  Orbit: |<group>| = 1\n#I  Orbit:",
    	    	      " returns |<orbit>| = 1, |<stab>| = 1\n" );
        return [ pt ];
    fi;

    # Start algorithm using 'AgOrbitStabilizer'.
    return AgOrbitStabilizer( U, Igs( U ), pt, op ).orbit;

end;


#############################################################################
##
#F  Stabilizer <U>, <pt>, <op> )  . . . .  . . . . . . stabilizer algorithmus
##
AgGroupOps.Stabilizer := function( arg )
    local   U, pt, useOp, op, R, old, S, p, u, ui, i, j, k, l;

    U  := arg[ 1 ];
    pt := arg[ 2 ];
    op := arg[ 3 ];
    InfoAgGroup1("#I  Stabilizer: |<group>| = ",StringPP(Size(U)),"\n");

    # Catch trivial cases.
    if 0 = Length(arg[1].generators)  then
        InfoAgGroup1("#I  Stabilizer: returns |<orbit>|=1, |<stab>|=1\n");
        return arg[ 1 ];
    fi;
    useOp := op <> OnPoints;

    # Get setup.
    R := [ U.identity ];
    S := [];

    # Step up composition series.
    for u  in Reversed( Igs( U ) )  do

        # Let's see if we have a new rep.
        l  := Length( R );
    	j  := 1;
        ui := u ^ -1;
        if useOp  then
            while j <= l and op( pt, ( R[ j ] * ui ) ) <> pt  do
                j := j + 1;
            od;
        else
            while j <= l and pt ^ ( R[ j ] * ui ) <> pt  do
                j := j + 1;
            od;
        fi;

        # If <j> > <l> then we have new rep.
        if j > l  then
            l   := Length( R );
            p   := RelativeOrderAgWord( u );
            old := ShallowCopy( R );
            for k  in [ 1 .. p - 1 ]  do
                for i in [ 1 .. l ]  do
                    old[ i ] := u * old[ i ];
                od;
                Append( R, old );
            od;
        else
            Add( S, u * R[ j ] ^ -1 );
        fi;
    od;

    # Give some information.
    S := AgSubgroup( U,  Reversed( S ), false );
    InfoAgGroup1( "#I  Stabilizer: returns |<orbit>| = ",
    	    	  Size( U ) / Size( S ), ", |<stab>| = ",
    	    	  StringPP( Size( S ) ), "\n" );
    return S;

end;



#############################################################################
##
#F AgGroupOps.SystemNormalizer( <G> ) . . . . . .normalizer of a Sylow system
##
AgGroupOps.SystemNormalizer := function( G )
    local i, sylow, norm;

    sylow := SylowSystem( G ).sylowSubgroups;
    if Length( sylow ) = 1  then return G; fi;
    norm := Normalizer( G, sylow[1] );
    for i  in [ 2..Length(sylow) ]  do
        norm := Intersection( norm, Normalizer( G, sylow[i] ) );
    od;
    return norm;
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
