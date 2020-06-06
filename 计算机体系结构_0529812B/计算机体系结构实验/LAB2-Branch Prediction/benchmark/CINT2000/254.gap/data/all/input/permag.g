#############################################################################
##
#A  permag.g                    GAP library                    Heiko Thei"sen
##
#A  @(#)$Id: permag.g,v 3.17 1994/07/10 21:19:44 mschoene Rel $
##
#Y  Copyright 1990-1993,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This  file  contains  functions  that  calculate  composition  series for
##  solvable permutation groups and convert such groups into ag groups.
##
#H  $Log: permag.g,v $
#H  Revision 3.17  1994/07/10  21:19:44  mschoene
#H  adapted to new stabchains
#H
#H  Revision 3.16  1994/06/27  13:55:28  htheisse
#H  inserted the'.stabChain' components, avoided comparison with [  ]
#H
#H  Revision 3.15  1994/03/04  18:03:27  htheisse
#H  changed the order of the cases to be checked in 'AgGroup'
#H
#H  Revision 3.14  1994/03/04  17:16:04  htheisse
#H  threw out a superfluous local variable (pgens) in ExponentsPerm...
#H
#H  Revision 3.13  1994/01/14  16:12:46  ahulpke
#H  corrected an error in the handling of sets
#H
#H  Revision 3.12  1993/10/19  17:01:50  theissen
#H  fixed a bug that occured when <G> already had a stabilizer chain
#H
#H  Revision 3.11  1993/09/15  18:09:03  theissen
#H  fixed a stupid bug (by deleting a line)
#H
#H  Revision 3.10  1993/09/14  16:06:57  theissen
#H  removed a memory-consuming for loop
#H
#H  Revision 3.9  1993/07/21  16:48:33  theissen
#H  avoided the use of 'Subgroup' in 'ClosureNormalizingElementPermGroup'
#H
#H  Revision 3.8  1993/07/16  16:05:07  theissen
#H  improved the d.l. bound, stopped copying of element lists
#H
#H  Revision 3.7  1993/02/10  10:11:14  martin
#H  moved 'PermGroupOps.CompositionSeries' to "permcser"
#H
#H  Revision 3.6  1993/02/09  14:25:55  martin
#H  made undefined globals local
#H
#H  Revision 3.5  1993/01/25  13:02:33  fceller
#H  changed names of abstract gens to "g"
#H
#H  Revision 3.4  1993/01/15  14:46:54  theissen
#H  fixed a minor bug to allow ag conversion of the trivial group
#H
#H  Revision 3.3  1993/01/12  11:49:06  theissen
#H  implemented the use of a bssgs to save memory
#H
#H  Revision 3.2  1992/12/02  09:01:10  fceller
#H  Initial GAP 3.2 revision
#H
##


#############################################################################
##
#F  MaximalBlocksPGroup( <G>, <D> ) . . . . . . . find a maximal block system
##
MaximalBlocksPGroup := function( G, D )
    local   B;

    D := Blocks( G, D );
    if Length(D) = 1  then
        return D;
    fi;
    B := D;
    while not IsPrime(Length(D))  do
        G := Operation( G, D, OnSets );
        D := Blocks( G, [1..Length(G.operationDomain)] );
        B := List( D, d -> Concatenation( Sublist( B, d ) ) );
    od;
    return B;
end;


#############################################################################
##
#F  OrderFactorGroupElement(<G>,<g>)  . . . . . . . . order of G*g in <G,g>/G
##
OrderFactorGroupElement := function( G, g )
    local   ord, div;

    if g = G.identity  then
        return 1;
    fi;
    ord := Order( G, g );
    for div  in Set(FactorsInt(ord))  do
        while ord mod div = 0 and g^(ord/div) in G  do
            ord := ord / div;
        od;
    od;
    return ord;
end;


#############################################################################
##
#F  InsertStabChain( <G>, <base>, <sgs> ) . . . . . insert a stabilizer chain
##
##  This function inserts a stabilizer chain in the group record of <G> along
##  the base <base> using the strong generating set <sgs>.
##
InsertStabChain := function( G, base, sgs )
    local  K,  pt;
    
    K := G;
    for pt  in base  do
        K.identity          := G.identity;
        K.generators        := sgs;
        K.orbit             := [ pt ];
        K.transversal       := [  ];
        K.transversal[ pt ] := K.identity;
        K.stabilizer        := rec(  );
        PermGroupOps.AddGensExtOrb( K, sgs );
        sgs := Filtered( sgs, s -> pt ^ s = pt );
        K := K.stabilizer;
    od;
    K.identity   := G.identity;
    K.generators := [  ];
    if IsGroup( G )  then
        G.stabChain := rec( identity := G.identity,
                          generators := ShallowCopy( G.generators ),
                               orbit := G.orbit,
                         transversal := G.transversal,
                          stabilizer := G.stabilizer );
    fi;
end;

#############################################################################
##
#F  ClosureNormalizingElementPermGroup( <H>, <y> )  .  closure of <H> and <y>
##
##  This function uses an idea  of C. Sims  to extend a permutation group <H>
##  with a normalizing element <y>, also extending the stabilizer chain.  The
##  method is faster than the standard algorithm because a generating set for
##  each  stabilizer in the chain can easily be obtained and the extension of
##  the basic  orbits does  not require a full orbit  algorithm.  Besides, if
##  '<H>.bssgs'  is  a base-strong  subnormal generating system upon  call of
##  this procedure the  result will  also have  bound a system '.bssgs'  with
##  this property.
##
##  <y> must be an element of the parent of <H> and must normalize <H>.  This
##  is *not* checked.
##
ClosureNormalizingElementPermGroup := function( orgH, y )
    local  name,  H,  G,  z,  newgens,  orbit,  pnt,  o,  w,  m,  p;

    # Do not change the original argument.
    H := rec(  );
    for name  in Intersection( RecFields( orgH ),
	[ "isDomain", "isGroup", "isPermGroup", "isFinite",
          "parent", "operations" ] )  do
    	H.( name ) := orgH.( name );
    od;
    for name  in Intersection( RecFields( orgH ),
    	[ "identity", "generators", "bssgs",
    	  "orbit", "transversal", "stabilizer", "stabChain" ] )  do
    	H.( name ) := Copy( orgH.( name ) );
    od;

    if IsBound( H.bssgs )  then
    	newgens := [  ];
    fi;

    # <G> will loop over the stabilizer chain.
    G := H;
    z := y;

    while z <> H.identity  do

	# If necessary, extend the base.
	if not IsBound( G.orbit )  then
	    G.orbit                     := [ LargestMovedPointPerm( z ) ];
	    G.transversal	        := [  ];
	    G.transversal[ G.orbit[1] ] := H.identity;
	    G.stabilizer	   	:= rec( identity   := H.identity,
						generators := [  ] );
        fi;

	# Extend the orbit with the new generator.
	orbit := ShallowCopy( G.orbit );
	pnt := orbit[ 1 ];
	m := 1;
	w := z;
	while not pnt/w in orbit  do
	    for o  in orbit  do
		Add( G.orbit, o/w );
		G.transversal[ o/w ] := z;
	    od;
	    m := m+1;
	    w := w*z;
	od;

	# If no bssgs is present,  put in <z> as  generator in the stabilizer
	# chain.
	if not IsBound( newgens )  and  not z in G.generators  then
	    Add( G.generators, z );
	fi;

	# If a bssgs is  present  and the orbit is  properly extended, put in
	# <z> and its  powers as new polycyclic generators, otherwise let <z>
	# = <w>.
	if m > 1  then
	    if IsBound( newgens )  then
		for p  in FactorsInt( m )  do
		    Add( newgens, z );
		    z := z^p;
		od;
	    else
		z := w;
	    fi;
	fi;
	
	# Now <z>  = <w>. Find a cofactor to <z> such that  the product fixes
	# <pnt>.
	while pnt^z <> pnt  do
	    z := z * G.transversal[ pnt^z ];
	od;

	# Go down one step in the stabilizer chain.
	G := G.stabilizer;

    od;

    # If a bssgs of <H>  is present, extend it  by <newgens> and also  extend
    # the generator sets of the stabilizer chain.
    if IsBound( newgens )  then
	H.bssgs := Concatenation( newgens, H.bssgs );
    	G := H;
    	while Length( newgens ) > 0  do
	    G.generators := Concatenation( newgens, G.generators );
    	    newgens := Filtered( newgens,
    	    	    	    	 g -> G.orbit[ 1 ] ^ g = G.orbit[ 1 ] );
    	    G := G.stabilizer;
    	od;
    fi;
    
    # Also update '<H>.stabChain'.
    H.stabChain := rec( identity := H.identity,
                           orbit := H.orbit,
                     transversal := H.transversal,
                      stabilizer := H.stabilizer,
                      generators := ShallowCopy( H.generators ) );
        
    return H;

end;

#############################################################################
##

#F  PermGroupOps.OrbitTransversal( <G>, <d> ) . . . . . orbit and transversal
##
PermGroupOps.OrbitTransversal := function( G, d )
    local  max,  orb,  new,  pnt,  gen,  img;

    orb := rec( orbit := [d], transversal := [] );
    orb.transversal[d] := G.identity;
    max := 0;
    for gen  in G.generators  do
        if gen <> G.identity and max < LargestMovedPointPerm(gen)  then
            max := LargestMovedPointPerm(gen);
        fi;
    od;
    if d in [1..max]   then
        new := BlistList( [1..max], [1..max] );
        new[d] := false;
        for pnt  in orb.orbit  do
            for gen  in G.generators  do
                img := pnt/gen;
                if new[img]  then
                    Add( orb.orbit, img );
                    orb.transversal[img] := gen;
                    new[img] := false;
                fi;
            od;
        od;
    fi;
    return orb;

end;


#############################################################################
##
#F  PermGroupOps.TryElementaryAbelianSeries(<G>)  . . . . try to build an eas
##
##  This function  starts with the series (<K>_1) where <K>_1 is the  trivial
##  subgroup     of     <G>     and    extends     this     series    calling
##  'ExtendElementaryAbelianSeriesPermGroup' with  each  generator  of <G> in
##  turn. If <G> is solvable this will result in an elementary abelian series
##  (<G>,...,<K>_1), otherwise 'ExtendElementaryAbelianSeriesPermGroup'  will
##  return 'false'  because  an upper bound on  the derived length, which  is
##  calculated according  to J.D.  Dixon, is exceeded.  If  <G>  is solvable,
##  this  function binds and returns an elementary  abelian series, otherwise
##  it  returns 'false'.   The  flag  '<G>.isSolvable'  is also  set  by this
##  function.
##
PermGroupOps.TryElementaryAbelianSeries := function( G )
    local   N,  y,  base,  n,  c,  log,  bound;

    # if <G> is trivial return 
    if Length( G.generators ) = 0  then
        G.elementaryAbelianSeries := [ G ];
        G.isSolvable  		  := true;
        G.bssgs                   := [  ];
        return G.elementaryAbelianSeries;
    else
        n := PermGroupOps.LargestMovedPoint(G);
    fi;

    # compute an upper bound for the derived length of <G>, assuming that <G>
    # is solvable. According to Dixon (1968) this is (5 log_3(deg(<G>)))/2
    log := 0;
    c   := 1;
    while c < n  do
        log := log + 1;
        c   := c*3;
    od;
    bound := 5*log/2;

    # If the size of <G> is known, try to improve the bound.
    if IsBound( G.size )  and  Length( FactorsInt( G.size ) ) < bound  then
    	bound := Length( FactorsInt( G.size ) );
    fi;

    # start with the trivial subgroup
    N := TrivialSubgroup(G);
    N.bssgs := [  ];
    G.elementaryAbelianSeries := [ N ];
    for y  in G.generators  do
        N := ExtendElementaryAbelianSeriesPermGroup( G, y, bound );
        if N = false  then
            G.isSolvable := false;
            Unbind( G.elementaryAbelianSeries );
            return false;
        fi;
    od;

    # copy the information stored in <N> to <G>
    G.isSolvable := true;               
    if not IsBound( G.orbit )  then
        G.bssgs       := N.bssgs;
	G.orbit       := N.orbit;
	G.transversal := N.transversal;
	G.stabilizer  := N.stabilizer;
    fi;
    if not IsBound( G.stabChain )  then
        G.stabChain   := N.stabChain;
    fi;

    return G.elementaryAbelianSeries;

end;

#############################################################################
##

#F  ExtendElementaryAbelianSeriesPermGroup( <G>, <y>, <der> ) . . . . . local
##
##  This function assumes  that <G>  has bound  a partial  elementary abelian
##  series,  i.e.  a  sequence  (<K>_m,...,<K>_1)  of normal  subgroups  with
##  elementary  abelian  factors.   It  extends  this   series  to  a  series
##  (<K>_n,...,<K>_1) where <K>_n  is the normal closure of <K>_m and <y> and
##  further  normal  subgroups  <K>_{n-1},...,<K>_{m+1}  may be  inserted  to
##  ensure elementary abelian factors.  The method is due to C. Sims and will
##  terminate if <G> is solvable.  To avoid endless loops  the function takes
##  the counter  <der> which must  be  0 when this function is called  from a
##  program and  which measures the  depth of the commutators we are  working
##  with.  If  <G> is solvable, commutators cannot have arbitrary depth and a
##  bound can be calculated only from the degree of <G>.   When this function
##  is called from outside, the third argument <der> must be this bound.
##
ExtendElementaryAbelianSeriesPermGroup := function( G, y, der )
    local   N,  M,  U,  V,  Z,  z,  T,  done,  u,  v,  w,  q;
  
    # If we are too deep in the derived series, then <G> is not solvable.
    if der < 0  then
        return false;
    fi;

    # Try to extend the series.
    N := G.elementaryAbelianSeries[ 1 ];
    M := N;
    U := [  ];
    Z := [ y ];
    while Length( Z ) > 0  do
    	z := Z[ 1 ];
    	RemoveSet( Z, z );
    	if not z in M  then

    	    # Every  new element  must   commute mod <N>  with   the elements
    	    # already in <U>.
    	    T := U;
    	    done := false;
            while not done  and  Length( T ) > 0  do
                u := T[ 1 ];
                T := T{ [ 2 .. Length( T ) ] };
                w := Comm( u, z );

                # If  <z> and  <u> do  not  commute mod  <N>,  extend <N>  to
                # NormalClosure( <N>,  [<z>,<u>] ),  going  one step  further
                # down the derived series.
                if not w in N  then
                    N := ExtendElementaryAbelianSeriesPermGroup(G, w, der-1);
                    if N = false  then
                        return false;
                    fi;

                    # Set M := <N,U> for the  new N,  V  <  U  contains those
                    # generators that  are actually  needed in the  extension
                    # process, i.e. M=<N,V>.
                    M := N;
                    V := [  ];
                    for v  in U  do
                        if not v in M  then
                            M := ClosureNormalizingElementPermGroup( M, v );
                            AddSet( V, v );
                        else
                            RemoveSet( T, v );
                        fi;
                    od;

                    # Restore U such that M = <N,U>.
                    U := V;

                    # If z in M then M is an elementary abelian extension  of
                    # N  containing z, so  no  further conjugates need to  be
                    # considered.
                    if z in M  then
                        done := true;
                    fi;

                fi;
            od;

    	    # Extend <M> with <z>, if still necessary.
    	    if not done  then
		M := ClosureNormalizingElementPermGroup( M, z );
		AddSet( U, z );
    	    fi;

            # Store the conjugates of <z>.
            UniteSet( Z, List( G.generators, g -> z ^ g ) );

    	fi;
    od;

    # Now construct the extension $M = < N, U >$. $M/N$ is abelian.
    if Length( U ) > 0  then

	# Insert   intermediate subgroups    to  achieve  elementary  abelian
	# factors.
        M := N;
	q := OrderFactorGroupElement( N, U[ 1 ] );
	while q > 1  do
	    q := q / FactorsInt( q )[ 1 ];
	    for z  in U  do
		M := ClosureNormalizingElementPermGroup( M, z ^ q );
	    od;
	    G.elementaryAbelianSeries := Concatenation( [ M ],
					     G.elementaryAbelianSeries );
	od;

    fi;
    return M;

end;


#############################################################################
##
#F  BaseStrongSubnormalGeneratingSetPPermGroup(<G>)  base and sgs for p-group
##
##  For intransitive <G>, this function  uses a  constituent  homomorphism to
##  get  a  base and  sgs  from  base  and  sgs for  kernel and  image.   For
##  imprimitive <G>, it likewise uses a blocks homomorphism to get a base and
##  sgs  from those of kernel  and  image. Finally,  if <G> is transitive and
##  primitive,  it must be isomorphic to <Z>_<p> so base and sgs are obvious.
##  The result  is bound to '<G>.polycyclicGenerators'  and  the  base can be
##  retrieved by 'Base(<G>)'.
##
BaseStrongSubnormalGeneratingSetPPermGroup := function( G )
    local   degree, pi, K, I, Delta, blocks, i, reps, rep, s, t, done;

    # if <G> is trivial return
    if IsTrivial( G ) then
	G.polycyclicGenerators := [  ];
    	return;
    fi;

    # find a non-trivial orbit
    degree := PermGroupOps.LargestMovedPoint( G );
    i := 0;
    repeat
        i := i+1;
        Delta := PermGroupOps.OrbitTransversal( G, i );
    until 1 < Length(Delta.orbit);

    # <G> is intransitive
    if Length(Delta.orbit)<degree then
        pi := OperationHomomorphism( G, Operation(G,Delta.orbit) );
        K  := Kernel(pi);
        BaseStrongSubnormalGeneratingSetPPermGroup(K);
        I := Image(pi);
        BaseStrongSubnormalGeneratingSetPPermGroup(I);
        G.polycyclicGenerators := Concatenation(
            List( I.polycyclicGenerators,
                  s -> PreImagesRepresentative(pi,s) ),
            K.polycyclicGenerators );
        InsertStabChain(
            G,
            Concatenation(List(Base(I),i->i^(pi.conperm^-1)),Base(K)),
            G.polycyclicGenerators );

    # <G> is transitive
    else
        blocks := MaximalBlocks( G, [1..degree] );

        # <G> is imprimitive
        if 1 < Length(blocks)  then
            K := Stabilizer( G, blocks[1], OnSets );
            BaseStrongSubnormalGeneratingSetPPermGroup(K);
            i := First( G.generators, gen->not gen in K );
            G.polycyclicGenerators := Concatenation(
		[i],
		K.polycyclicGenerators );
            InsertStabChain( G, Base(K), G.polycyclicGenerators );

        # <G> is primitive, thus isomorphic to <Z>_<p>
        else
            G.polycyclicGenerators := [ G.generators[1] ];
            InsertStabChain( G, [degree], G.polycyclicGenerators );
        fi;
    fi;
end;


#############################################################################
##
#F  ExponentsPermSolvablePermGroup( <G>, <g> [, <start> ] ) . . . . . . . . .
#F  . . . . . .  exponents of <g> as normal word in the pag generators of <G>
##
##  For  a  solvable  permutation  group <G>  with  bssgs '<G>.bssgs'  and an
##  element  <g> in <G>,  this function  determines the exponent vector <exp>
##  such     that     '<g>      =     <G>.bssgs[<start>]^exp[<start>]     ...
##  <G>.bssgs[<n>]^exp[<n>]'.  Alternatively, if  <G> has bound a composition
##  series and the corresponding  pag system is bound  to '<G>.pagSystem', no
##  bssgs  is needed. If a  value for <start> is  known,  it can  be given as
##  third argument, otherwise it is defaulted to 1.
##
ExponentsPermSolvablePermGroup := function( arg )
    local  G,  g,  start,  exp,  eps,  h,  H,  pnt,  i;

    # Get the arguments.
    G := arg[ 1 ];
    g := arg[ 2 ];
    if Length( arg ) > 2  then
	start := arg[ 3 ];
    else
	start := 1;
    fi;

    exp := [  ];

    # If <G> has not bound a bssgs, use a stupid division algorithm.
    if not IsBound( G.bssgs )  then
       	for i  in [ start .. Length( G.pagSystem ) ]  do
            exp[ i ] := 0;
    	    while not g in G.compositionSeries[ i + 1 ]  do
    	    	exp[ i ] := exp[ i ] + 1;
    	    	g := G.pagSystem[ i ] mod g;
    	    od;
    	od;
    	return exp;
    fi;

    # Mind the offset <start>.
    for i  in [ start .. Length( G.bssgs ) ]  do

        # Find the base level of the <i>-th generator, remove the part of <g>
	# not fixing the earlier basepoints.
	h := g;
     	H := G;
        while IsBound( H.orbit )  and  H.orbit[ 1 ] ^ G.bssgs[ i ] =
				       H.orbit[ 1 ]  do
	    pnt := H.orbit[ 1 ];
	    while pnt ^ h <> pnt  do
		h := h * H.transversal[ pnt^h ];
	    od;
            H := H.stabilizer;
  	od;

        # Determine the <i>-th exponent.
	eps := 0;
        pnt := H.orbit[ 1 ] ^ h;
	while H.transversal[ pnt ] = G.bssgs[ i ]  do
	    eps := eps + 1;
	    pnt := pnt / G.bssgs[ i ];
	od;
        exp[ i ] := eps;

	# Remove next factor of <g>.
	g := G.bssgs[ i ] ^ eps mod g;

    od;

    # Return the result.
    return exp;

end;
    
#############################################################################
##						
#F  PcPresentationPermGroup( <series>, <pgens>, <index>, <isNilp> ) . . local
##
##  This function calculates a pc presentation  for <G>=<series>[ 1 ] along a
##  composition series that   refines  <series>.  <pgens>  must  contain  the
##  generator list according to the  composition series of <G>.  <series> can
##  be an elementary abelian  series, in which  case <index>  is a list  such
##  that    '<pgens>[<index[i]>]'  ...   '<pgens>[<index[i+1]>-1]'  are   the
##  generators  of the  <i>-th     elementary abelian factor   in   <series>.
##  Otherwise <series>   must equal '<G>.compositionSeries'  and <index> must
##  equal '[1..Length(<G>.compositionSeries)]'.
##
##  If <isNilp>  is true,  <series> must equal '<G>.compositionSeries'  which
##  must be a central series of <G>.  In this case, the composition series of
##  the resulting ag group is also a central series.
##
##  This     function    is    called    by    'PermGroupOps.AgGroup'     and
##  'PermGroupOps.PgGroup'.
##
PcPresentationPermGroup := function( series, pgens, index, isNilp )
    local   PC,  m,  p,  i,  i2,  n,  n2,  start,  k,  exp,  word,  rel;

    # <PC> will hold the presentation
    m  := Length( pgens );
    PC := rec( relations  := [],
               generators := WordList( m, "g" ) );

    # Find the relations of the p-th powers. Use  the  vector space structure
    # of the elementary abelian factors.
    for i  in [ 1 .. Length(series)-1 ]  do
        p := OrderFactorGroupElement(
                 series[i+1],
                 pgens[index[i]] );
        for n  in [ index[i] .. index[i+1]-1 ]  do
    	    word := PC.generators[n] ^ p;
	    rel  := word^0;
	    exp  := ExponentsPermSolvablePermGroup
		    ( series[ 1 ], pgens[n]^p, index[i+1] );
            for k  in [ index[i+1] .. m ]  do
		rel := rel * PC.generators[k]^exp[k];
            od;
            Add( PC.relations, word/rel );
        od;
    od;

    # Find the relations of the commutators.
    for i  in [ 1 .. Length(series)-1 ]  do
        for n  in [ index[i] .. index[i+1]-1 ]  do
            for i2  in [ 1 .. i-1 ]  do
                if isNilp then
                    start := n+1;
                else
                    start := index[i2+1];
                fi;
                for n2  in [ index[i2] .. index[i2+1]-1 ]  do
    	    	    word := Comm( PC.generators[n], PC.generators[n2] );
		    rel  := word^0;
	  	    exp  := ExponentsPermSolvablePermGroup
			    ( series[1], Comm(pgens[n], pgens[n2]), start );
                    for k  in [ start .. m ]  do
			rel := rel * PC.generators[k]^exp[k];
    	            od;
    	            Add( PC.relations, word/rel );
                od;
            od;
            for n2  in [ index[i] .. n-1 ]  do
    	    	word := Comm( PC.generators[n], PC.generators[n2] );
		rel  := word^0;
		exp  := ExponentsPermSolvablePermGroup
		        ( series[1], Comm(pgens[n], pgens[n2]), index[i+1] );
                for k  in [ index[i+1] .. m ]  do
		    rel := rel * PC.generators[k]^exp[k];
                od;
                Add( PC.relations, word/rel );
            od;
        od;
    od;
    return PC;

end;

#############################################################################
##
#F  CompositionSeriesSolvablePermGroup( <G> ) . . . . . .  composition series
##
CompositionSeriesSolvablePermGroup := function( G )
    local  compositionSeries,  N,  elabstep,  i,  pgens,  g,  ord,  cof,
           fac,  newgens, gen;

    # If  a subnormal series (with abelian factors) and polycyclic generators
    # are  given, refine  the  series  to have <Z>_<p>-factors  by adding the
    # polycyclic generators and their powers one by one.
    if IsBound(G.subnormalSeries)  then
        pgens             := G.polycyclicGenerators;
	newgens           := [  ];
        compositionSeries := [  ];
        for i  in [ 1 .. Length(pgens) ]  do
            N := G.subnormalSeries[i+1];
            g := pgens[i];
            ord := OrderFactorGroupElement( N, g );
            cof := 1;
            for fac  in FactorsInt(ord)  do
                if cof = 1  then
                    Add( newgens, g );
                    Add( compositionSeries, G.subnormalSeries[i] );
                    g := g ^ fac;
                elif cof < ord  then
                    Add( newgens, g );
                    Add( compositionSeries,
                         ClosureNormalizingElementPermGroup( N, g ) );
                    g := g ^ fac;
                fi;
                cof := cof * fac;
            od;
        od;
        Add( compositionSeries, TrivialSubgroup(G) );
	G.polycyclicGenerators := newgens;

    else

	# Otherwise: First determine an elementary abelian  series for <G> in
	# order to get a bssgs. An elementary abelian series without bssgs is
	# no good.
        if IsBound( G.elementaryAbelianSeries )
           and not IsBound( G.elementaryAbelianSeries[ 1 ].bssgs )  then
            Unbind( G.elementaryAbelianSeries );
        fi;
	ElementaryAbelianSeries( G );

	# Start with the trivial subgroup.
	N := TrivialSubgroup( G );
	compositionSeries := [ N ];

	# Loop over the elementary abelian series.
	for elabstep  in Reversed
	    ( [ 1 .. Length( G.elementaryAbelianSeries ) - 1 ] )  do

	    # For  each elementary abelian factor,  add  in the  intermediate
	    # composition factors given by the pag system of <G>.
	    for gen  in Reversed( Sublist
		( G.elementaryAbelianSeries[ elabstep ].bssgs, [ 2 ..
		  Length( G.elementaryAbelianSeries[ elabstep   ].bssgs ) -
	          Length( G.elementaryAbelianSeries[ elabstep+1 ].bssgs ) ]
                ) )  do
		N := ClosureNormalizingElementPermGroup( N, gen );
		compositionSeries := Concatenation( [ N ], 
		                         compositionSeries );
	    od;

	    # Finally add in the subgroup from the elementary abelian series.
	    N := G.elementaryAbelianSeries[ elabstep ];
	    compositionSeries := Concatenation( [ N ], compositionSeries );

	od;

    fi;

    # Put in some extra information for 'DisplayCompositionSeries'.
    for i  in [ 1 .. Length( compositionSeries ) - 1 ]  do
        N := compositionSeries[ i ];
        N.cspgNormal := compositionSeries[ i + 1 ];
        N.cspgFactor := CyclicGroup( Index( N, N.cspgNormal ) );
        N.operations := ShallowCopy( N.operations );
        N.operations.FactorGroup := function( N, H )
            if H = N.cspgNormal  then
                return N.cspgFactor;
            else
                return PermGroupOps.FactorGroup( N, H );
            fi;
        end;
    od;
                                                         
    # Return the result.
    return compositionSeries;

end;


#############################################################################
##
#F  SubnormalSeriesPPermGroup(<G>)  . . . . .  subnormal series for <p>-group
##
##  This function returns a subnormal series for <G>. A polycyclic generating
##  system for this series  that also contains strong generating sets for all
##  members of the subnormal series is bound to '<G>.polycyclicGenerators'.
##
SubnormalSeriesPPermGroup := function( G )
    local   subnormalSeries,  H,  gen;

    BaseStrongSubnormalGeneratingSetPPermGroup( G );
    H := TrivialSubgroup(G);
    H.stabChain := rec( identity := G.identity,
                      generators := [  ] );
    ExtendStabChain( H, Base( G ) );
    subnormalSeries := [ H ];
    for gen in Reversed( Sublist( G.polycyclicGenerators,
        [ 2 .. Length(G.polycyclicGenerators) ] ) )  do
        H := ClosureNormalizingElementPermGroup( H, gen );
        subnormalSeries := Concatenation( [H], subnormalSeries );
    od;
    subnormalSeries := Concatenation( [G], subnormalSeries );
    return subnormalSeries;

end;


#############################################################################
##
#F  CentralCompositionSeriesPPermGroup( <G> ) . .  central composition series
##
##  This function calls 'SubnormalSeriesPPermGroup' to  calculate a subnormal
##  series with  strong generating  set and then improves it to be a  central
##  series maintaining the good properties of the generating set.  The method
##  used is known as Holt's algorithm.
##
CentralCompositionSeriesPPermGroup := function( G )
    local   words,  H,  gens,  base,  a,  f,  n,  i,  j,  h,  k,  l,  eps,
	    old_gen_k, list,  pgens,  tmp,  s,  p,  compositionSeries;

    # <G> must be a <p>-group
    tmp := Set( FactorsInt( Size(G) ) );
    if 1 < Length(tmp)  then
        Error( "<G> must be a p-group" );
    fi;
    p := tmp[1];

    # calculate  a  base-adapted  subnormal  series   and   refine  it  to  a
    # composition series
    G.subnormalSeries := SubnormalSeriesPPermGroup(G);
    compositionSeries := CompositionSeriesSolvablePermGroup(G);
    base  := Base(G);
    pgens := G.polycyclicGenerators;
    n     := Length(pgens);

    # improve the composition series to a  p-central series  maintaining  the
    # base-adaption (Holt's algorithm)
    for i  in Reversed([1..n-2])  do
        for j  in Reversed([i+2..n])  do
            h := Comm( pgens[j], pgens[i] );
            while not h in compositionSeries[j+1]  do
                f := First([i+1..n], x -> not h in compositionSeries[x+1]);
		eps := 1;
		h := pgens[f] mod h;
		while not h in compositionSeries[ f+1 ]  do
		    eps := eps + 1;
		    h := pgens[f] mod h;
		od;
                if eps > 1  then
                    h := h^((1/eps) mod p);
                fi;
                k := f;
                for l  in [f+1..j]  do
		    eps := 0;
                    while not h in compositionSeries[ l+1 ]  do
			eps := eps + 1;
			h := pgens[l] mod h;
		    od;
                    if eps > 0  then
                        old_gen_k := pgens[k];
                        a := PositionProperty( base, b->b ^ pgens[l] <> b );
                        tmp := pgens[k] * pgens[l]^eps;
                        for s  in [ k+1 .. l ]  do
                            pgens[s-1] := pgens[s];
                        od;
                        pgens[l] := tmp;
                        if a <> false
                           and ForAll(Sublist(base,[1..a]),b->b^old_gen_k=b)
                        then
                            pgens[l-1] := old_gen_k;
                        fi;
                        k := l;
                    fi;
                od;
                if k <> j then
                    tmp := pgens[k];
                    for s  in [ k+1 .. j ]  do
                        pgens[s-1] := pgens[s];
                    od;
                    pgens[j] := tmp;
                fi;
                for l  in [ f+1 .. j ]  do
                    gens := Sublist( pgens, [l..n] );
                    compositionSeries[l] := Subgroup( Parent(G), gens );
                    InsertStabChain( compositionSeries[l], base, gens );
                od;
                h := Comm( pgens[j], pgens[i] );
            od;
        od;
    od;

    return compositionSeries;

end;


#############################################################################
##

#F  PermGroupOps.AgGroup(<G>) . . . . .  make an ag group out of a perm group
##
PermGroupOps.AgGroup := function( G )
    local   PC,  A,  series,  index,  pgens,  i,  gen;
 
    # An elementary abelian series without bssgs is no good.
    if     IsBound( G.elementaryAbelianSeries )
       and not IsBound( G.elementaryAbelianSeries[ 1 ].bssgs )  then
        Unbind( G.elementaryAbelianSeries );
    fi;
    
    # If <G>  has already bound an elementary  abelian series with  bssgs, we
    # are lucky.   If <G> has bound  no series we  calculate a new elementary
    # abelian series, because it is the  most elegant solution.  Then we find
    # the positions in the bssgs  where the generators  of each factor in the
    # series start.
    if    IsBound( G.elementaryAbelianSeries )
       or not IsBound( G.compositionSeries )  then
	series := ElementaryAbelianSeries( G );
	pgens  := series[ 1 ].bssgs;
        index  := List( series, x -> Length( pgens ) - Length( x.bssgs )+1 );
        
    # If  <G> has bound  a composition series, find  a pag system and use the
    # standard division algorithm to find the pc presentation.
    else
    	series := G.compositionSeries;
    	index  := [ 1 .. Length( series ) ];
        if IsBound( series[ 1 ].bssgs )  then
            pgens := series[ 1 ].bssgs;
        else
            pgens  := [  ];
            for i  in [ 1 .. Length( series ) - 1 ]  do
                repeat
                    gen := Random( series[ i ] );
                until not gen in series[ i + 1 ];
                pgens[ i ] := gen;
            od;
            G.pagSystem := pgens;
        fi;
    fi;

    # Calculate a pc presentation for <G>.
    PC := PcPresentationPermGroup( series, pgens, index, false );

    # Construct the ag group <A> and the bijection between <A> and <G>.
    A := AgGroupFpGroup(PC);
    A.bijection := GroupHomomorphismByImages(A,G,A.generators,pgens);
    A.bijection.isMapping           := true;
    A.bijection.isGroupHomomorphism := true;
    A.bijection.isInjective         := true;
    A.bijection.isMonomorphism      := true;
    A.bijection.isSurjective        := true;
    A.bijection.isEpimorphism       := true;
    A.bijection.isBijection         := true;
    A.bijection.isIsomorphism       := true;
    return A;

end;

#############################################################################
##
#F  PermGroupOps.PgGroup(<G>) . . . . . . . .  pg group out of <p>-perm group
##
PermGroupOps.PgGroup := function( G )
    local   PC,  A,  series,  index;
 
    # Find a central series of <G>.
    series := CentralCompositionSeriesPPermGroup( G );
    index  := [ 1 .. Length( series )+1 ];

    # Calculate a pc presentation for <G>.
    PC := PcPresentationPermGroup( series, G.polycyclicGenerators,
			           index, true );

    # and construct the ag group <A> and the bijection between <A> and <G>
    A := AgGroupFpGroup(PC);
    A.bijection := GroupHomomorphismByImages(A,G,A.generators,
					     G.polycyclicGenerators);
    A.bijection.isMapping           := true;
    A.bijection.isGroupHomomorphism := true;
    A.bijection.isInjective         := true;
    A.bijection.isMonomorphism      := true;
    A.bijection.isSurjective        := true;
    A.bijection.isEpimorphism       := true;
    A.bijection.isBijection         := true;
    A.bijection.isIsomorphism       := true;
    return A;

end;


#############################################################################
##
#F  PermGroupOps.ElementaryAbelianSeries( <G> ) . . elementary abelian series
##
PermGroupOps.ElementaryAbelianSeries := function( G )
    if IsList(G)  then
        return GroupOps.ElementaryAbelianSeries(G);
    else
        PermGroupOps.TryElementaryAbelianSeries(G);
        return G.elementaryAbelianSeries;
    fi;
end;


#############################################################################
##
#F  PermGroupOps.IsSolvable( <G> )  . . . . . . . . . .  test for solvability
##
##  'PermGroupOps.IsSolvable' calls 'PermGroupOps.TryElementaryAbelianSeries'
##  and returns the flag '<G>.isSolvable' which is set by that function.
##
PermGroupOps.IsSolvable := function( G )
    PermGroupOps.TryElementaryAbelianSeries( G );
    return G.isSolvable;
end;


#############################################################################
#E  Emacs-Variablen
##  Local Variables:
##  mode:             outline-minor
##  outline-regexp:   "#[AEFTV]"
##  fill-column:      77
##  End:
#############################################################################
