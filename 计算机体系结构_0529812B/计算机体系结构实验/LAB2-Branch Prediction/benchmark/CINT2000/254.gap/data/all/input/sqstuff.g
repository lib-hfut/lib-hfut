#############################################################################
##
#A  sqstuff.g                   GAP library                  Alexander Wegner
##
#A  @(#)$Id: sqstuff.g,v 3.1 1994/06/20 11:52:06 fceller Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  All functions in this file will eventually be moved into "sq.g".
##
#H  $Log: sqstuff.g,v $
#H  Revision 3.1  1994/06/20  11:52:06  fceller
#H  'SolvableQuotient' returns a fp group even if the quotient is trivial
#H
#H  Revision 3.0  1994/05/19  13:41:40  sam
#H  Initial Revision under RCS
#H
##

#############################################################################
##
#F  InfoSQ? . . . . . . . . . . . . . . . . . . . . . . . .  show information
##
if not IsBound(InfoSQ1)  then InfoSQ1 := Print;  fi;	# progress info


#############################################################################
##
## NAME
##	"map" . . . . . . . . . . . . . . . . . . . . . .  corresponding word
##
## USAGE
##	map( <domain>, <word>, <codomain> )
##
## DESCRIPTION
##	The  function  map() is designed to take care of the situation, where
##	given a word <word> in the generators of a group <domain> the element
##	corresponding to <word> is required.
##
## RETURNS
##	<word> is a word  in a  n-generator group <domain>  and <codomain> is
##	also  a n-generator group. map() returns the  element  of  <codomain>
##	obtained by substituting <domain>.(i) by <codomain>.(i) for 1<=i<=n.
##
## EXAMPLE
##	X := AbstractGenerator( "X" );;
##	Y := AbstractGenerator( "Y" );;
##	S3 := rec( isFpGroup := true,
##	    generators := [ X,
##		Y ],
##	    relators := [ X^2,
##		X^-1*Y*X/Y^2,
##		Y^3 ] );;
##	result := map( S3, X*Y, AgGroupFpGroup( S3 ) );
##	# returns	X*Y
##	R := rec( isMatGroup := true,
##	    dimension := 2,
##	    field := GF(2),
##	    generators := [ [ [ Z(2)^0, Z(2)^0 ],
##			[ 0*Z(2), Z(2)^0 ] ],
##		[ [ 0*Z(2), Z(2)^0 ],
##			[ Z(2)^0, Z(2)^0 ] ] ] );;
##	map( AgGroupFpGroup( S3 ), result, R );
##	# returns	[ [ Z(2)^0, 0*Z(2) ],
##	#			[ Z(2)^0, Z(2)^0 ] ]
##
## FILES
##	LIBNAME/mapping.g
##
mapSQ := function( domain, word, codomain )
    local	domain, dgens, cgens, image, i, g, k;

    dgens := domain  .generators;
    cgens := codomain.generators;

    if IsFpGroup( domain ) then
	if IsAgGroup( codomain ) then
	    image := codomain.identity;
	elif IsMatGroup( codomain ) then
	    image := IdentityMat( codomain.dimension, codomain.field );
	fi;
	for i in [ 1..LengthWord( word ) ] do
		g := Subword( word, i, i );
		k := 1;
		while		(g   <>dgens[k])
			and	(g^-1<>dgens[k]) do
			k := k+1;
		od;
		if g = dgens[k] then
			image := image * cgens[k]   ;
		else
			image := image * cgens[k]^-1;
		fi;
	od;
    elif IsAgGroup( domain ) then
	if IsMatGroup( codomain ) then
	    image := IdentityMat( codomain.dimension, codomain.field );
	fi;
	for i in [ 1..Length( dgens ) ] do

		k := ExponentAgWord( word, i );

		if k <> 0 then
			image := image * cgens[i]^ k;
		fi;

	od;
    fi;

    return	image;
end;


#############################################################################
##
#+ convertSQ  . . . . . . . . . . . . . . . . . . .  convertSQ ListListMat to Mat
##
convertSQ := function( mat )
	local dim, i, j, k, RES, seq, x;

	dim := Length( mat[1][1] );

	RES := [];
	for j in [ 1..Length( mat ) ] do
		seq := mat[j][1];
		for k in [ 1..dim ] do
			Add( RES, ShallowCopy( seq[k] ) );
		od;
	od;
	for i in [ 2..Length( mat[1] ) ] do
		for j in [ 1..Length( mat ) ] do
			seq := mat[j][i]; x := ( j - 1) * dim;
			for k in [ 1..dim ] do
			    Append( RES[x+k], seq[k] );
			od;
		od;
	od;
 
	return	RES;
end;

#############################################################################
##
## NAME
##	"QuotientSpaceSQ"  . . . . . .  compute a basis for the quotient space
##
## USAGE
##	QuotientSpaceSQ( <vsp>, <ssp> )
##
## DESCRIPTION
##	QuotientSpaceSQ() computes a  basis for  the  quotient  space  of  the
##	vector space <vsp> with  respect  to  the subspace  <ssp>. The vector
##	space <vsp> must be given by a sequence of vectors which form a basis
##	for the vector space <vsp> and the subspace <ssp> must be  given by a
##	sequence of vectors which form a generating set for <ssp>.
##
## RETURNS
##	a sequence of vectors which form a basis for the  quotient  space  of
##	the vector space <vsp> with respect to the subspace <ssp>.
##
## EXAMPLE
##	QuotientSpaceSQ( TwoCocyclesSQ( S4, R ), TwoCoboundariesSQ( S4, R ) );
##	# returns	[ [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2),
##	#	0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2) ], [ 0*Z(2), 0*Z(2), 0*Z(2),
##	#	0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0 ] ]
##
## FILES
##	LIB/cohomo.g
##
QuotientSpaceSQ := function ( vsp, ssp )
	local	col, d, h, heads, j, l, qsp, row, zero;


	if 0 = Length(ssp)  then return vsp;  fi;
	zero := Field( vsp[1] ).zero;	#    determine  the  underlying field

	ssp := ShallowCopy(ssp); d := Length(ssp); l := Length(ssp[1]);

	#	determine a basis for the      subspace in a normal form

	heads := List( [ 1..l ], i->0 );

	row := 1; col := 1;
	while row <= d and col <= l do
		if ssp[row][col] = zero then
		   j := row;
		   while j < d and ssp[j][col] = zero do
			 j := j + 1;
		   od;
		   if ssp[j][col] = zero then
		      col := col + 1;
		   else
		      h := ssp[row]; ssp[row] := ssp[j]; ssp[j] := h;
		   fi;
		else
		   heads[col] := row;
		   ssp[row] := ssp[row][col]^-1 * ssp[row];
		   for j in [ row+1..d ] do
		       if ssp[j][col] <> zero then
			  ssp[j] := ssp[j] - ssp[j][col] * ssp[row];
		       fi;
		   od;
		   row := row + 1; col := col + 1;
		fi;
	od;

	vsp := ShallowCopy(vsp); d := Length(vsp); l := Length(vsp[1]);

	#	determine a basis for the quotientspace in a normal form

	row := 1; col := 1; qsp := [];
	while row <= d and col <= l do
		if vsp[row][col] = zero then
		   j := row;
		   while j < d and vsp[j][col] = zero do
			 j := j + 1;
		   od;
		   if vsp[j][col] = zero then
		      col := col + 1;
		   else
		      h := vsp[row]; vsp[row] := vsp[j]; vsp[j] := h;
		   fi;
		else
		   vsp[row] := vsp[row][col]^-1 * vsp[row];
		   for j in [ row+1..d ] do
		       if vsp[j][col] <> zero then
			  vsp[j] := vsp[j] - vsp[j][col] * vsp[row];
		       fi;
		   od;
		   if heads[col] = 0 then
		      Add( qsp, vsp[row] );
		      row := row + 1;
		   else
		      vsp[row] := vsp[row] - vsp[row][col] * ssp[heads[col]];
		      col := col + 1;
		   fi;
		fi;
	od;

	return( qsp );
end;



#############################################################################
##
#+ pfactors . . . . . . . . . . . simple routine to compute all prime factors
##
pfactorsSQ := function( n )
	local k, exp, factors, p, powers;

	exp := function( p )
		local e;

		e:=0; while n mod p = 0 do n:=QuoInt(n,p); e:=e+1; od;

		return e;
	end;

	if n = 0 then return rec( powers := [1], factors := [0] ); fi;
	if n = 1 then return rec( powers := [1], factors := [1] ); fi;
	if n < 0 then
	    k := 2; factors := [-1]; powers := [1]; n := -n;
	else
	    k := 1; factors := [  ]; powers := [ ];
	fi;

	if n mod 2 = 0 then powers[k]:=exp(2); factors[k]:=2; k:=k+1; fi;
	if n mod 3 = 0 then powers[k]:=exp(3); factors[k]:=3; k:=k+1; fi;
	p := 5;
	while p * p <= n do
	    if n mod p = 0 then powers[k]:=exp(p); factors[k]:=p; k:=k+1; fi;
	    p := p + 2;
	    if n mod p = 0 then powers[k]:=exp(p); factors[k]:=p; k:=k+1; fi;
	    p := p + 4;
	od;

	if n <> 1 then factors[k]:=n; powers[k]:=1; fi;

	return	rec( powers := powers, factors := factors );
end;

#############################################################################
##
#+ gaussSQ  . . . . . . . . . . gauss algorithm for systems of linear equations
##
gaussSQ := function ( ls, v )
	local head, null, sol, ffield, d, h, col, row, i, j, k, l;

	ffield := Field( ls[1] );

	head := [];
	null := [];

	d := Length( ls    ); row := 1;
	l := Length( ls[1] ); col := 1;

	while row <= d and col <= l do
	    if ls[row][col] = ffield.zero then
		j := row;
		while j < d and ls[j][col] = ffield.zero do
		    j := j + 1;
		od;
		if ls[j][col] = ffield.zero then
		    sol := [];
		    for j in [ 1..l ] do
			sol[j] := ffield.zero;
		    od;
		    for j in [ 1..row-1 ] do
			sol[head[j]] := - ls[j][col];
		    od;
		    sol[col] := ffield.one;
		    Add( null, sol );
		    col := col + 1;
		else
		    h := v [row]; v [row] := v [j]; v [j] := h;
		    h := ls[row]; ls[row] := ls[j]; ls[j] := h;
		fi;
	    else
		v [row] := ls[row][col]^-1 * v [row];
		ls[row] := ls[row][col]^-1 * ls[row];
		for j in Reversed( [ 1..row-1 ] ) do
		    if ls[j][col] <> ffield.zero then
			v [j] := v [j] - ls[j][col] * v [row];
			ls[j] := ls[j] - ls[j][col] * ls[row];
		    fi;
		od;
		for j in [ row+1..d ] do
		    if ls[j][col] <> ffield.zero then
			v [j] := v [j] - ls[j][col] * v [row];
			ls[j] := ls[j] - ls[j][col] * ls[row];
		    fi;
		od;
		head[row] := col; row := row + 1; col := col + 1;
	    fi;
	od;
	while col <= l do
		sol := [];
		for j in [ 1..l ] do
		    sol[j] := ffield.zero;
		od;
		for j in [ 1..row-1 ] do
		    sol[head[j]] := - ls[j][col];
		od;
		sol[col] := ffield.one;
		Add( null, sol );
		col := col + 1;
	od;

	return	rec(	null := null	,
			head := head	);
end;

#############################################################################
##
#+ minvSQ . . . . . . . . . . computes the inverse of a numbers modulo a second
##
minvSQ := function ( m, n )
    local  f, g, h, fm, fn, gm, gn, hm, hn, q;

    f := m; fm := 1; fn := 0;
    g := n; gm := 0; gn := 1;
    while g <> 0 do
	h := g; hm := gm; hn := gn;
	q := QuoInt(f,g); g := f-q*g; gm := fm-q*gm; gn := fn-q*gn;
	f := h; fm := hm; fn := hn;
    od;

    return( fm );
end;


#############################################################################
##
## NAME
##	"Conjugate" . . . . . . . . . . . . . . . . . . . algebraic conjugate
##
## USAGE
##	Conjugate( <F>, <mat>, k )
##
## DESCRIPTION
##	Let F be a finite field with p^n elements. Then the map x \mapsto x^p
##	is an automorphism of F. We can apply f : x \mapsto x^(p^k) to  every
##	entry in a matrix M over the field F. What results is a  new  matrix,
##	denoted fM. The matrix fM is called an algebraic conjugate of M.
##
## RETURNS
##	Conjugate() returns the algebraic conjugate f<mat> of <mat>.
##
## EXAMPLE
##	Conjugate( GF(2^6), [ [ Z(2^6)^58, Z(2^6)^53 ],
##		[ Z(2^6)^41, Z(2^6)^45 ] ], 3 );	# x \mapsto x^(2^3)
##	# returns	[ [ Z(2^6)^23, Z(2^6)^46 ],
##	#			[ Z(2^6)^13, Z(2^3)^5 ] ]
##
## FILES
##	LIBNAME/matrix.g
##
ConjugateSQ := function( F, mat, k )
	local	i,	j,	q;

	q := RemInt( F.char^k, F.char^F.degree-1 );

	mat := Copy( mat );
	for i in [ 1..Length( mat ) ] do
		for j in [ 1..Length( mat ) ] do
			mat[i][j] := mat[i][j] ^ q;
		od;
	od;

	return	mat;
end;



#############################################################################
##
## NAME
##	"blowup"  . . . . . . . . . . . . . . . . . . .  change of base field
##
## USAGE
##	blowup( <K>, <mat> )
##
## DESCRIPTION
##	Let T be a linear transformation in a finite dimensional vector space
##	V over a field K. Let (v_1,...,v_n) be a base of V over K and let M =
##	(m_{ij}) be the matrix of T relative to the given base. Moreover, let
##	K be a finite dimensional extension field  relative to a  subfield  F
##	and let (e_1,...,e_r) be a base for K over F. Then
##
##		(*)	(e_1v_1,...,e_rv_1;...;e_1v_n,...,e_rv_n)
##
##	is a base for V/F and so V is finite dimensional over F. Let R be the
##	regular representation of K relative to the  base (e_1,...,e_r). Then
##	the matrix of T determined by the base (*) is  (R(m_{ij})). In  other
##	words, the matrix of T relative to the base (*) is  obtained  by  re-
##	placing the entries, which are elements of K, by the matrices repres-
##	enting them in the regular matrix representation of K over F.
##
##		blowup() takes  a finite field <K> of order p^r relative to a
##	subfield of order p^m as first argument and  a matrix <mat> over K as
##	second  argument.  Let  z be a generator of the multiplicative  group
##	of K  then K=F(z) and (1,z,...,z^{r/m-1}) is a base for K/F. blowup()
##	returns a matrix which is obtained by replacing the entries of  <mat>
##	by the matrices representing them in the regular  matrix  representa-
##	tion of K relative to the base (1,z,...,z^{r/m-1}).
##
## EXAMPLE
##	blowup( GF(2^2)/GF(2), [[0*Z(2),Z(2)^0],[Z(2^2),Z(2^2)^2]] );
##	# returns	[ [ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ],
##	#			[ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ],
##	#			[ 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0 ],
##	#			[ Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2) ] ]
##
## FILES
##	LIB/matrix.g
##
BlowupFieldSQ := function ( K, mat )
	local	entry, i, j, k, RES, seq, x;

	mat := Copy( mat );
	if K.dimension <> 1 then
		RES := [];
		for i in [ 1..Length( mat ) ] do
			for j in [ 1..Length( mat ) ] do
			    entry := mat[i][j];
			    for k in [ 1..Length( K.base ) ] do
				RES[k] := Coefficients( K, entry * K.base[k] );
			    od;
			    mat[i][j] := TransposedMat( RES );
			od;
		od;

		RES := [];
		for j in [ 1..Length( mat ) ] do
			seq := mat[j][1];
			for k in [ 1..K.dimension ] do
				Add( RES, seq[k] );
			od;
		od;
		for i in [ 2..Length( mat ) ] do
			for j in [ 1..Length( mat ) ] do
			    seq := mat[j][i]; x := ( j - 1 ) * K.dimension;
			    for k in [ 1..K.dimension ] do
				Append( RES[x+k], seq[k] );
			    od;
			od;
		od;
		mat := RES;
	fi;

	return	mat;
end;


#############################################################################
##
## NAME
##	"distinguish" . . . . . . . . . . . . . .  distingish representations
##
## USAGE
##	distinguish( <aggrp>, <mgrps> )
##
## DESCRIPTION
##	Suppose a system of representatives of nonsimilar irreducible  repre-
##	sentations of a finite group over  some  field  is  given. Since  the
##	characters of nonsimilar  irreducible  representations  of  a  finite
##	group over any field are nonzero, distinct and  linear independent  a
##	list of elements of the group can be computed such that the  nonsimi-
##	lar irreducible representations can be distinguished by their degrees
##	and traces on these elements. Note that this is asking for much  less
##	than representatives of the conjugacy classes.
##
##		Let <aggrp> = <aggrp>_1 > ... > <aggrp>_n = < 1 > be a normal
##	series of a finite soluble group <aggrp> and let <mgrps> be a  system
##	of  representatives  of  nonsimilar  irreducible  representations  of
##	<aggrp>_i. Then  distinguish()  computes  elements of <aggrp>_i  such
##	that the nonsimilar irreducible representations can be  distinguished
##	by their degrees and traces on these elements.
##
## RETURNS
##	distinguish() returns a list of elements of <aggrp>_i such  that  the
##	nonsimilar irreducible representations <mgrps> can  be  distinguished
##	by their degrees and traces on these elements.
##
## EXAMPLE
##	A := AbstractGenerator( "A" );;
##	B := AbstractGenerator( "B" );;
##	C := AbstractGenerator( "C" );;
##	G := AgGroupFpGroup( rec(	#    G \cong < S, T |S^3=T^2=(S*T)^2>
##	    isFpGroup := true,		#    and S \mapsto B*C,T \mapsto  A*B
##	    generators := [ A,		#    extends to an ismorphism onto G.
##		B,
##		C ],
##	    relators := [ A*A*B^-1,
##		A^-1*B*A*B^-1,
##		A^-1*C*A*C^-2,
##		B*B,
##		B^-1*C*B*C^-1,
##		C*C*C ] ) );;
##	R := [ rec(			#    irreducible  representations  of
##	    isMatGroup := true,		#    G over the Galois Field GF(5).
##	    dimension := 1,
##	    field := GF( 5 ),
##	    generators := [ [ [ Z(5) ] ],
##		[ [ Z(5)^2 ] ],
##		[ [ Z(5)^0 ] ] ] ),
##	  rec( isMatGroup := true,
##	    dimension := 1,
##	    field := GF( 5 ),
##	    generators := [ [ [ Z(5)^3 ] ],
##		[ [ Z(5)^2 ] ],
##		[ [ Z(5)^0 ] ] ] ),
##	  rec( isMatGroup := true,
##	    dimension := 1,
##	    field := GF( 5 ),
##	    generators := [ [ [ Z(5)^2 ] ],
##		[ [ Z(5)^0 ] ],
##		[ [ Z(5)^0 ] ] ] ),
##	  rec( isMatGroup := true,
##	    dimension := 1,
##	    field := GF( 5 ),
##	    generators := [ [ [ Z(5)^0 ] ],
##		[ [ Z(5)^0 ] ],
##		[ [ Z(5)^0 ] ] ] ),
##	  rec( isMatGroup := true,
##	    dimension := 2,
##	    field := GF( 5 ),
##	    generators := [ [ [ Z(5)^3, Z(5)^2 ], [ 0*Z(5), Z(5) ] ],
##		[ [ Z(5)^2, 0*Z(5) ], [ 0*Z(5), Z(5)^2 ] ],
##		[ [ Z(5)^0, Z(5)^3 ], [ Z(5)^2, Z(5)^3 ] ] ] ),
##	  rec( isMatGroup := true,
##	    dimension := 2,
##	    field := GF( 5 ),
##	    generators := [ [ [ Z(5)^3, Z(5) ], [ Z(5)^0, Z(5) ] ],
##		[ [ Z(5)^0, 0*Z(5) ], [ 0*Z(5), Z(5)^0 ] ],
##		[ [ Z(5)^0, Z(5)^3 ], [ Z(5)^2, Z(5)^3 ] ] ] ) ];;
##	distinguish( G, R );
##	# returns	[ B ] or [ A*B, B*C ] or ...
##
## NOTE
##	The return values may vary since the elements are computed at random.
##
## FILES
##	LIBNAME/modules.g
##
## SEE ALSO
##	"IsEquivalent"
##
distinguishSQ := function ( aggrp, mgrps )
    local IsDistinct, IsUseless, i, j, k, liste, randword, trace, word;

    IsDistinct := function()
	local	i, j, k;

	for i in [ 1..Length( trace ) ] do
		for j in [ i+1..Length( trace ) ] do

			k := 1;
			while	k < Length( trace[i] )
				and	trace[i][k] = trace[j][k]
			do
				k := k + 1;
			od;
			if trace[i][k] = trace[j][k] then
				return( false );
			fi;

		od;
	od;

	return( true );
    end;



    IsUseless := function()
	local	i, k, l;

	l := Length( liste );
	for i in [ 1..l-1 ] do

		k := 1;
		while	k < Length( trace )
			and trace[k][i] = trace[k][l]
		do
			k := k + 1;
		od;
		if trace[k][i] = trace[k][l] then
			return( true );
		fi;

	od;

	return( false );
    end;



    randword := function ( G, i )
	local    aggens, j, word;

	aggens := G.generators;

	word := G.identity;
	for j in [ i..Length( aggens ) ] do
	    word := word*aggens[j]^
             Random( [ 0 .. RelativeOrderAgWord( aggens[j] )-1 ] );
	od;

	return( word );
    end;



    i := 0; repeat i := i+1; until IsBound( mgrps[1].generators[i] );
    mgrps := Filtered( mgrps, mgrp -> mgrp.dimension <> 1 );
    trace := List( [1..Length(mgrps)], i -> [ mgrps[i].dimension ] );

    k := 0; liste := [];
    while not IsDistinct() do

	k := k + 1;

	word := randword( aggrp, i );
	while word = aggrp.identity do
	    word := randword( aggrp, i );
	od;
	liste[k] := word;

	for j in [ 1..Length( trace ) ] do
	    trace[j][k] := TraceMat( mapSQ( aggrp, liste[k], mgrps[j] ) );
	od;

	while IsUseless() do

	    word := randword( aggrp, i );
	    while word = aggrp.identity do
		word := randword( aggrp, i );
	    od;
	    liste[k] := word;

	    for j in [ 1..Length( trace ) ] do
		trace[j][k] := TraceMat( mapSQ( aggrp, liste[k], mgrps[j] ) );
	    od;

	od;

    od;

    return( liste );
end;



#############################################################################
##
## NAME
##	"IsEquivalent"  . . . . . . . . . . . . . . . . . . . similarity test
##
## USAGE
##	IsEquivalent( <G>, <liste>, <x>, <y> )
##
## DESCRIPTION
##	Suppose a system of representatives of nonsimilar irreducible  repre-
##	sentations  of  a finite group and a list  of  elements of the finite
##	group is given such that the nonsimilar  irreducible  representations
##	can be distinguished by their degrees and traces  on these  elements.
##	Then irreducible representations similar to  representatives  of  the
##	system  of nonsimilar irreducible representations are similar iff the
##	degrees and traces on these elements coincide.
##
##		Let G = G_1 > ... > G_n = <1> be a normal series of a finite
##	soluble group  G  and suppose a system of representatives of nonsim-
##	ilar  irreducible  representations of G_i  is  given. IsEquivalent()
##	checks the similarity of the irreducible representations <x> and <y>
##	which are similar to representatives   of the  system  of nonsimilar
##	irreducible representations. In addition to the  irreducible  repre-
##	sentations IsEquivalent()  takes  a  list of elements <liste> of G_i
##	which distinguishes the system of nonsimilar irreducible representa-
##	tions by their degrees and traces on these elements as argument.
##
## RETURNS
##	true if the irreducible representations are similar, false otherwise.
##
## EXAMPLE
##	A := AbstractGenerator( "A" );;
##	B := AbstractGenerator( "B" );;
##	C := AbstractGenerator( "C" );;
##	G := AgGroupFpGroup( rec(	#    G \cong < S, T |S^3=T^2=(S*T)^2>
##	    isFpGroup := true,		#    and S \mapsto B*C,T \mapsto  A*B
##	    generators := [ A,		#    extends to an ismorphism onto G.
##		B,
##		C ],
##	    relators := [ A*A*B^-1,
##		A^-1*B*A*B^-1,
##		A^-1*C*A*C^-2,
##		B*B,
##		B^-1*C*B*C^-1,
##		C*C*C ] ) );;
##	X := rec( isMatGroup := true,
##	    dimension := 2,
##	    field := GF( 5 ),
##	    generators := [ [ [ Z(5)^3, Z(5)^2 ], [ 0*Z(5), Z(5) ] ],
##		[ [ Z(5)^2, 0*Z(5) ], [ 0*Z(5), Z(5)^2 ] ],
##		[ [ Z(5)^0, Z(5)^3 ], [ Z(5)^2, Z(5)^3 ] ] ] );;
##	Y := rec( isMatGroup := true,
##	    dimension := 2,
##	    field := GF( 5 ),
##	    generators := [ [ [ Z(5)^3, Z(5) ], [ Z(5)^0, Z(5) ] ],
##		[ [ Z(5)^0, 0*Z(5) ], [ 0*Z(5), Z(5)^0 ] ],
##		[ [ Z(5)^0, Z(5)^3 ], [ Z(5)^2, Z(5)^3 ] ] ] );;
##	IsEquivalent( G, [ G.2 ], X, Y );
##	# returns	 false
##
## FILES
##	LIBNAME/modules.g
##
## SEE ALSO
##	"distinguish"
##
IsEquivalentSQ := function( G, liste, x, y )
	local	i;

	if x.dimension = y.dimension then
	    if x.dimension = 1 then

		#############################################################
		##	Since linear representations are similar iff they are
		##	equal, just check the traces on the generators

		for i in [ 1..Length( x.generators ) ] do
		    if IsBound( x.generators[i] ) then
			if x.generators[i] <> y.generators[i] then
				return( false );
			fi;
		    fi;
		od;
		return( true );
	    else
		for i in [ 1..Length( liste ) ] do
		    if	TraceMat( mapSQ( G, liste[i], x ) ) <>
			TraceMat( mapSQ( G, liste[i], y ) ) then
			    return( false );
		    fi;
		od;
		return( true );
	    fi;
	else
	    return( false );
	fi;
end;



#############################################################################
##
## NAME
##	"conjugate" . . . . . . . . . . . . . . . .  conjugate representation
##
## USAGE
##	conjugate( <aggrp>, <mgrp>, g )
##
## DESCRIPTION
##	If N is a normal subgroup of a group G, and R is a representation  of
##	N, then for each g in G we define the conjugate representation  of  N
##	by n \mapsto R^g(n)=R(g^-1*n*g) for all n in N.
##
##		Let <aggrp>=<aggrp>_1>...><aggrp>_n=<1> be a normal series of
##	a finite soluble group <aggrp>  and  let  <mgrp> be a  representation
##	of <aggrp>_i. If g is in the normalizer of <aggrp>_i in <aggrp>, then
##	conjugate() computes the conjugate representation <mgrp>^g.
##
## RETURNS
##	conjugate() returns the conjugate representation <mgrp>^g.
##
## EXAMPLE
##	X := AbstractGenerator( "X" );
##	Y := AbstractGenerator( "Y" );
##	S3 := AgGroupFpGroup( rec(
##	    generators := [ X,
##		Y ],
##	    relators := [ X^2,
##		X^-1*Y*X/Y^2,
##		Y^3 ] ) );;
##	R := rec( isMatGroup := true,
##	    dimension := 1,
##	    field := GF(2^2),
##	    generators := [ ,
##		[ [ Z(2^2) ] ] ] );;
##	conjugateRepSQ( S3, R, S3.1 );
##	# returns	rec( isMatGroup := true,
##	#		    dimension := 1,
##	#		    field := GF(2^2),
##	#		    generators := [ ,
##	#			[ [ Z(2^2)^2 ] ] ] )
##
## FILES
##	LIBNAME/modules.g
##
conjugateRepSQ := function ( aggrp, mgrp, g )
	local	i, T;

	T := [];
	for i in [ 1..Length( mgrp.generators ) ] do
		if IsBound( mgrp.generators[i] ) then
			T[i] := mapSQ( aggrp, g^(-1)*aggrp.(i)*g, mgrp );
		fi;
	od;

	return	rec( isMatGroup := true,
		  dimension := mgrp.dimension,
		  field := mgrp.field,
		  generators := T );
end;



#############################################################################
##
## NAME
##	"induce"  . . . . . . . . . . . . . . . . . .  induced representation
##
## USAGE
##	induce( <mgrp>, <aggrp> )
##
## DESCRIPTION
##	Let H be  a subgroup of a  finite group G, and let K be an  arbitrary
##	field. For a left K[H]-module M, we  may form the induced K[G]-module
##	M^G=K[G]\otimes_{K[H]}M. If  R is the representation of H afforded by
##	the K[H]-module M, the  representation afforded  by M^G is called the
##	induced representation and will be denoted by R^G.
##
##		Let <aggrp>=<aggrp>_1>...><aggrp>_n=<1> be a normal series of
##	a finite soluble group <aggrp>. If <mgrp> is the representation of H=
##	<aggrp>_(i+1)<G=<aggrp>_i afforded by an K[H]-module M, then induce()
##	computes the induced representation <mgrp>^G afforded by M^G.
##
## RETURNS
##	induce() returns the induced representation <mgrp>^G afforded by M^G.
##
## EXAMPLE
##	X := AbstractGenerator( "X" );
##	Y := AbstractGenerator( "Y" );
##	S3 := AgGroupFpGroup( rec(
##	    generators := [ X,
##		Y ],
##	    relators := [ X^2,
##		X^-1*Y*X/Y^2,
##		Y^3 ] ) );;
##	R := rec( isMatGroup := true,
##	    dimension := 1,
##	    field := GF(2^2),
##	    generators := [ ,
##		[ [ Z(2^2) ] ] ] );;
##	induce( R, S3 );
##	# returns	rec( isMatGroup := true,
##	#		    dimension := 2,
##	#		    field := GF(2^2),
##	#		    generators := [ [ [ 0*Z(2), Z(2)^0 ],
##	#			[ Z(2)^0, 0*Z(2) ] ],
##	#		    [ [ Z(2^2), 0*Z(2) ],
##	#			[ 0*Z(2), Z(2^2)^2 ] ] ] )
##
## FILES
##	LIBNAME/modules.g
##
induceSQ := function ( mgrp, aggrp )
	local g, gens, index, zmat, imat, M, T, h, i, j;

	imat := IdentityMat( mgrp.dimension, mgrp.field );
	zmat := NullMat( mgrp.dimension, mgrp.dimension, mgrp.field );

	g := Length( mgrp.generators );
	while IsBound( mgrp.generators[g] ) do
		g := g - 1;
	od;

	gens := aggrp.generators; index := RelativeOrder( gens[g] );

	M := [[]];
	for j in [ 1..index ] do
		Add( M[1], zmat );
	od;
	M[1][index] := mapSQ( aggrp, gens[g]^index, mgrp );
	for i in [ 2..index ] do
		Add( M, [] );
		for j in [ 1..index ] do
			Add( M[i], zmat );
		od;
		M[i][i-1] := imat;
	od;

	T := []; T[g] := convertSQ( M );

	for h in [ g+1..Length( gens ) ] do
	    M := [];
	    for i in [ 1..index ] do
		Add( M, [] );
		for j in [ 1..index ] do
		    Add( M[i], zmat );
		od;
		M[i][i] := mapSQ( aggrp, gens[h]^(gens[g]^(i-1)), mgrp );
	    od;
	    T[h] := convertSQ( M );
	od;

	return	rec( isMatGroup := true,
		  dimension := index * mgrp.dimension,
		  field := mgrp.field,
		  generators := T );
end;



#############################################################################
##
## NAME
##	"AlgConjugates" . . . . . . . . . . . . . . . .  algebraic conjuagtes
##
## USAGE
##	AlgConjugates( <mgrp> )
##
## DESCRIPTION
##	Let E be any field, f an automorphism of E, and R a representation of
##	a  finite group G over E. We can apply f to every entry in the matrix
##	R(g) for every g in G. What results  is a new representation, denoted
##	fR. The representation fR is called an algebraic conjugate of R.
##
##		Let G=G_1>...>G_n=<1> be a normal series of a finite  soluble
##	group G and let <mgrp> be a representation of G_i over a finite field
##	E. AlgConjugates() computes the algebraic conjugates f<mgrp> for f in
##	the Galois group of E over the prime field of E.
##
## RETURNS
##	Let F be a finite field with p elements, E an extension  field  of  F
##	such that [ E:F ] = r. Then E is cyclic over F with Galois group  <f>
##	where f : x \mapsto x^p. AlgConjugates() returns the list
##
##			[ <mgrp>, f<mgrp>, ... , f^(r-1)<mgrp> ].
##
## EXAMPLE
##	AlgConjugates( rec( isMatGroup := true,
##	    dimension := 1,
##	    field := GF(2^2),
##	    generators := [ ,
##		[ [ Z(2^2) ] ] ] ) );
##	# returns	[ rec( isMatGroup := true,
##	#		    dimension := 1,
##	#		    field := GF(2^2),
##	#		    generators := [ ,
##	#			[ [ Z(2^2) ] ] ] ),
##	#		  rec( isMatGroup := true,
##	#		    dimension := 1,
##	#		    field := GF(2^2),
##	#		    generators := [ ,
##	#			[ [ Z(2^2)^2 ] ] ] ) ]
##
## FILES
##	LIBNAME/modules.g
##
AlgConjugatesSQ := function ( mgrp )
	local	E, S, T, i, k;

	E := mgrp.field;

	S := [ mgrp ];
	for k in [ 1..E.degree-1 ] do

		T := rec( isMatGroup := true,
			dimension := mgrp.dimension,
			field := mgrp.field,
			generators := [] );

		for i in [ 1..Length( mgrp.generators ) ] do
		    if IsBound( mgrp.generators[i] ) then
			T.generators[i] := ConjugateSQ(E,mgrp.generators[i],k);
		    fi;
		od;

		Add( S, T );

	od;

	return( S );
end;



#############################################################################
##
## NAME
##	"Blowup"  . . . . . . . . . . . . . . . . . . .  change of base field
##
## USAGE
##	Blowup( <field>, <mgrp> )
##
## DESCRIPTION
##	Let G be finite group  and  let K be a field. Let  V be a K[G]-module
##	and let T be the  representation of G corresponding to V with respect
##	to the basis (v_1,...,v_n) of V over K. Let K be a finite dimensional
##	extension field relative to  a subfield F and let (e_1,...,e_r) be a
##	base for K over F. Then
##
##		(*)	(e_1v_1,...,e_rv_1;...;e_1v_n,...,e_rv_n)
##
##	is a base for V/F and so V is finite dimensional over F. Let R be the
##	regular representation of K  relative to the base (e_1,...,e_r). Then
##	the matrix of g relative to the base (*) is (R(T(g)_{ij})). In  other
##	words, the matrix of g relative to the base (*) is  obtained  by  re-
##	placing the entries, which are elements of K, by the matrices repres-
##	enting them in the regular matrix representation of K over F.
##
##		Blowup() takes a representation <mgrp> over a finite field  K
##	of order p^n as first argument and a  finite  (sub)field  <field>  of
##	order p^m  as second argument. Let z be a generator of the  multipli-
##	cative group of K then K = F(z) and (1,z,...,z^(r/m)) is  a  base for
##	K/F. blowup() returns a representation which is obtained by replacing
##	the entries of <mgrp>(g) by the matrices  representing  them  in  the
##	regular matrix representation of K relative to (1,z,...,z^(r/m)).
##
## EXAMPLE
##	Blowup( GF(2^2)/GF(2),
##	    rec( isMatGroup := true,
##		dimension := 1,
##		field := GF(2^2),
##		generators := [ ,
##		    [ [ Z(2^2) ] ] ] ) );
##	# returns	rec( isMatGroup := true,
##	#		    dimension := 2,
##	#		    field := GF(2),
##	#		    generators := [ ,
##	#			[ [ 0*Z(2), Z(2)^0 ],
##	#			    [ Z(2)^0, Z(2)^0 ] ] ] )
##
## FILES
##	LIB/matrix.g
##
BlowupSQ := function( K, mgrp )
    local i, RES;

    if K.dimension <> 1 then

	RES := rec( isMatGroup := true,
		dimension := K.dimension * mgrp.dimension,
		field := K.field,
		generators := [] );

	for i in [ 1..Length( mgrp.generators ) ] do
		if IsBound( mgrp.generators[i] ) then
			RES.generators[i] := BlowupFieldSQ( K, mgrp.generators[i] );
		fi;
	od;

	mgrp := RES;

    fi;

    return mgrp;
end;



#############################################################################
##
## NAME
##	intertwine  . . . . . . . . . . . . . . . . . . . intertwining matrix
##
## USAGE
##	intertwine( <X>, <Y> )
##
## DESCRIPTION
##	Let X and Y be representations of an K-algebra, A. A nonzero matrix P
##	is said to intertwine X and Y if P*X(a) = Y(a)*P for all a in A. If X
##	and Y are irreducible, then P is square and nonsingular.
##
##		intertwine() takes irreducible representations <X> and <Y> of
##	a finite group as arguments and computes an intertwining matrix.
##
## RETURNS
##	intertwine() returns a matrix which intertwines <X> and <Y>.
##
## EXAMPLE
##	X := AbstractGenerator( "X" );
##	Y := AbstractGenerator( "Y" );
##	S3 := AgGroupFpGroup( rec(
##	    generators := [ X,
##		Y ],
##	    relators := [ X*X,
##		X^-1*Y*X/Y^2,
##		Y^3 ] ) );;
##	R := induceSQ( rec( isMatGroup := true,
##	    dimension := 1,
##	    field := GF(2^2),
##	    generators := [ ,
##		[ [ Z(2^2) ] ] ] ), S3 );;
##	intertwine( R, R );
##	# returns	[ [ Z(2)^0, 0*Z(2) ],
##	#			[ 0*Z(2), Z(2)^0 ] ]
##
## FILES
##	LIBNAME/modules.g
##
intertwineSQ := function ( xgrp, ygrp )
	local	i,    j,    k,    l,    n,

		MAT	,	#	buffer to set up mat( s )
		EQU	,	#	buffer to set up equ( s )

		xgen	,	#	generator of matrix group
		ygen	,	#	generator of matrix group

		field	,	#	field of representation
		NrEqu	,	#	number of equation( s )
		NrCol	,	#	number of column  ( s )

		ls	,	#	linear system of equ(s)
		HD	,	#	info. to  solve lsystem
		pl	,	#	solution(s)  of lsystem
		zv	;	#	zero  vector over field

	field := xgrp.field; NrCol := xgrp.dimension; NrEqu := 0;

	HD := []; zv := [];
	for i in [ 1..NrCol^2 ] do
		HD[i] := 0; zv[i] := field.zero;
	od;

	xgrp := xgrp.generators;
	ygrp := ygrp.generators;

	ls := [];
	for n in [ 1..Length( xgrp ) ] do
	    if IsBound( xgrp[n] ) then

		xgen := xgrp[n];
		ygen := ygrp[n];

		for i in [ 1..NrCol ] do
		  for j in [ 1..NrCol ] do

		    EQU := zv;
		    for k in [ 1..NrCol ] do
			EQU[i+(k-1)*NrCol] := EQU[i+(k-1)*NrCol]+xgen[k][j];
			EQU[k+(j-1)*NrCol] := EQU[k+(j-1)*NrCol]-ygen[i][k];
		    od;

		    for l in [ 1..NrCol^2 ] do
			    if EQU[l] <> field.zero then
				if HD[l] = 0 then

					NrEqu := NrEqu+1;
					HD[l] := NrEqu  ;

					ls[NrEqu] := EQU[l]^-1 * EQU;

				fi;
				EQU := EQU - EQU[l] * ls[HD[l]];
			    fi;
		    od;

		  od;
		od;

	    fi;
	od;

	for n in [ NrCol^2, NrCol^2-1 .. 1 ]  do

	    if HD[n] = 0 then

		#	non trivial solution

		pl := [];

		MAT := []; k := NrCol^2;
		for i in [ NrCol, NrCol-1 .. 1 ]  do
		    MAT[i] := [];
		    for j in [ NrCol, NrCol-1 .. 1 ]  do
			if n = k then
			    pl[k] := field.one ;
			elif HD[k] = 0 then
			    pl[k] := field.zero;
			else
			    pl[k] := field.zero;
			    for l in [ k+1..NrCol^2 ] do
				pl[k] := pl[k] - ls[HD[k]][l] * pl[l];
			    od;
			fi;
			MAT[i][j] := pl[k]; k := k - 1;
		    od;
		od;

		return( TransposedMat( MAT ) );

	    fi;

	od;

	Error( "there is no intertwining matrix" );
end;



#############################################################################
##
## NAME
##	"modules" . . . . . modular representations of a finite soluble group
##
## USAGE
##	modules( <aggrp>, <prime> [, <degree> ] )
##
## DESCRIPTION
##	Some of the deepest and most powerful results in group representation
##	theory involve modular representations, that is, representations over
##	fields of prime characteristic. If K and H are normal subgroups of  a
##	group G, with K<H and H/K is an elementary abelian p-group, then  H/K
##	may be viewed as an F[G]-module, where F is the field of order  p. In
##	this situation, the representation theory can give direct  structural
##	information about G.
##
##		modules() implements an algorithm to find all irreducible re-
##	presentations of a finite soluble group  over a finite field of prime
##	order : Going up a composition series G=G_0 > G_1 > ... > G_n=<1>  of
##	a finite  soluble group G all irreducible representations of G_i  may
##	be  constructed  from  those of G_(i+1)  by  extending the G_i-stable
##	irreducible representations to G_i, and by inducing up from each G_i-
##	orbit one non-stable irreducible representation to G_i.
##
##		modules() takes as arguments a finite soluble group ( the AG-
##	system must  exhibit a composition series for the group ) and a prime
##	number. An optional argument  may be  used  to impose  a bound on the
##	degrees of the irreducible representations.
##
## RETURNS
##      A sequence of irreducible representations of the finite soluble group
##	<aggrp> over the field of order <prime>.
##
## EXAMPLE
##	S := AbstractGenerator( "S" );;
##	T := AbstractGenerator( "T" );;
##	D5 := AgGroupFpGroup( rec(
##	  generators := [ T,
##	    S ],
##	  relators := [ T*T,
##	    Comm( S, T )/S^3,
##	    S*S*S*S*S ] ) );;
##	modules( D5, 2 );
##	# returns	[ rec( isMatGroup := true,
##	#		    dimension := 1,
##	#		    field := GF(2),
##	#		    generators := [ [ [ Z(2)^0 ] ],
##	#			[ [ Z(2)^0 ] ] ],
##	#		    AbsIrr := rec( isMatGroup := true,
##	#			dimension := 1,
##	#			field := GF(2),
##	#			generators := [ [ [ Z(2)^0 ] ],
##	#			    [ [ Z(2)^0 ] ] ] ) ),
##	#		  rec( isMatGroup := true,
##	#		    dimension := 4,
##	#		    field := GF(2),
##	#		    generators := [ [[Z(2)^0,0*Z(2),Z(2)^0,0*Z(2)],
##	#				[0*Z(2),Z(2)^0,0*Z(2),Z(2)^0],
##	#				[0*Z(2),0*Z(2),Z(2)^0,0*Z(2)],
##	#				[0*Z(2),0*Z(2),0*Z(2),Z(2)^0]],
##	#			[[0*Z(2),Z(2)^0,Z(2)^0,0*Z(2)],
##	#				[Z(2)^0,Z(2)^0,0*Z(2),Z(2)^0],
##	#				[Z(2)^0,Z(2)^0,Z(2)^0,0*Z(2)],
##	#				[Z(2)^0,0*Z(2),0*Z(2),Z(2)^0]] ],
##	#		    AbsIrr := rec( isMatGroup := true,
##	#			dimension := 2,
##	#			field := GF(2^2),
##	#			generators := [ [ [ Z(2)^0, Z(2)^0 ],
##	#				[ 0*Z(2), Z(2)^0 ] ],
##	#			    [ [ Z(2^2), Z(2)^0 ],
##	#				[ Z(2^2)^2, Z(2)^0 ] ] ] ) ) ]
##
## FILES
##	LIB/modules.g
##
ModulesSQ := function( arg )
    if Length(arg) = 2  then
        return arg[1].operations.Modules( arg[1], arg[2], 0 );
    else
        return arg[1].operations.Modules( arg[1], arg[2], arg[3] );
    fi;
end;


ModulesAgGroup := function ( arg )
  local	b,	#	loop on representations of G_i

	gc,	#	algebraic conjugate(s)
	cr,	#	conjugate representation

	d,	#	words to distinguish irreducible representations
	D,	#	words to distinguish algebraic conjugate(s)

	c, e, w,	#	finite field elements

	p,	#	prime number

	E, F, S, Q,	#	finite fields of characteristic p

	g, G,	#	soluble group and group element

	i, j, k, l,	#	building loops

  	n,	#	irreducible representations of G_i 
	N,	#	absolutely irreducible representations of G_i
	o,	#	irreducible representations of G_(i+1)
	O,	#	absolutely irreducible representations of G(i+1)

	f,	#	factors of cyclotomic polynomial
	s,	#	power of automorphism x \mapsto x^p

	r,	#	index of G_(i+1) in G_i
	x,	#	intertwining matrix

	Z,
	P,
	R;	#	bound for the rank of the representations

  if Length( arg ) = 2 then
	R := 2^31-1;
  elif Length( arg ) = 3 then
	R := arg[3];
        if R = 0  then
            R := 2^31-1;
        fi;
  else
	Error( "usage : modules( <grp>, <F> [, <rank> ] )" );
  fi;
  G := arg[1];
  p := arg[2].char;
  if arg[2].degree <> 1  then
      Error( "<F> must be a prime field" );
  fi;
    
  for i in [ Length(G.generators), Length(G.generators)-1 .. 1 ]  do
   if i = Length( G.generators ) then

    n := []; N := []; E := [ GF(p) ];

    g := G.generators[i]; r := RelativeOrder( g );

    if ( (p-1) mod r ) <> 0 then

#	If $r\!\not||E^*|$, then raising elements to the $r^{th}$ power is an
#	automorphism of the multiplicative group of $E$ and there is a unique
#	$c{\in}E$ such that $c^r=1$.

     Add( N, rec( isMatGroup := true,
	dimension := 1,
	field := E[1],
	generators := [] ) );
     N[Length(N)].generators[Length(G.generators)] := [[E[1].one]];
     Add( n, rec( isMatGroup := true,
	dimension := 1,
	field := E[1],
	generators := [] ) );
     n[Length(n)].generators[Length(G.generators)] := [[E[1].one]];

     if r <> p then

#	If $r\not=p$, then there are $r$ distinct roots of unity in an exten-
#	sion field of $E$. The $r^{th}$ cyclotomic polynomial $(x^r-1)/(x-1)$
#	factors into $\phi(r)/l$ distinct irreducible polynomials  in  $E[x]$
#	of the same degree $l$. The $r^{th}$ cyclotomic field $E^{(r)}$  over
#	$E$ is the splitting field for any such irreducible  factor  over $E$
#	and $[E^{(r)}:E]=l$ where $l$ is the least positive integer such that
#	$q^l{\equiv}1\bmod\,r$. Factorisation of polynomials can  be achieved
#	by Berlekamp's algorithm.

         f := Factors( Polynomial( E[1], List( [1..r], x -> E[1].one ) ) );
         l := Degree( f[1] );

      if l <= R then	#6789012345678901234567890123456789012345678901234567

       if not IsBound( E[l] ) then
	E[l] := GF( p^l );
       fi;
       for j in [ 1..Length( f ) ] do
	w := E[l].root^QuoInt( p^l-1, r );
	while Value( f[j], w ) <> E[1].zero do
	 w := w * E[l].root^QuoInt( p^l-1, r );
	od;
	Add( N, rec( isMatGroup := true,
	    dimension := 1,
	    field := E[l],
	    generators := [] ) );
	N[Length(N)].generators[Length(G.generators)] := [[w]];
	Add( n, BlowupSQ( E[l]/E[1], N[Length(N)] ) );
       od;

      fi;	#890123456789012345678901234567890123456789012345678901234567

     fi;

#	If $r=p$, then $x^r-1={(x-1)}^r$ and no further roots exist in $E$ or
#	extension fields of $E$.

    else	#	( (p-1) mod r ) = 0

#	If $r\,|\,|E^*|$, then $r\not=p$ and $E$ contains $r$ distinct  roots
#	of unity.

     w := E[1].root^QuoInt( p-1, r );
     for j in [ 1..r ] do
      Add( N, rec( isMatGroup := true,
	    dimension := 1,
	    field := E[1],
	    generators := [] ) );
      N[Length(N)].generators[Length(G.generators)] := [[w]];
      Add( n, rec( isMatGroup := true,
	    dimension := 1,
	    field := E[1],
	    generators := [] ) );
      n[Length(n)].generators[Length(G.generators)] := [[w]];
      w := w * E[1].root^QuoInt( p-1, r );
     od;

    fi;

   else		#	i <> Length( ... )

    o := n ; n := [];
    O := N ; N := [];

    g := G.generators[i]; r := RelativeOrder( g );

    d := distinguishSQ( G, o );

    for b in [ 1..Length( o ) ] do
     if IsRec( o[b] ) then

      cr := conjugateRepSQ( G, o[b], g );

#	Let $N{\lhd}G$ such that $G/N$ is a cyclic group of prime order  $r$,
#	$t{\in}G-N$ and  let $\gamma$ be the  automorphism of  $N$ defined by
#	$x\,\mapsto\,t^{-1}xt$. Let $F$ be a finite field and let $\bf{S}$ be
#	an absolutely irreducible representation of $N$ over a finite  exten-
#	sion field $E{\supseteq}F$ such that $E=F(\chi)$ where $\chi$ is  the
#	character afforded by $\bf{S}$. Then one of the following occurs :

      if not IsEquivalentSQ( G, d, cr, o[b] ) then

#	\item[(1)] If $\bf{S}\gamma$ is not similar  to  $\eta\bf{S}$ for all
#		$\eta{\in}Gal(E/F)$, then the induced representation $\bf{S}^
#		G$ is absolutely irreducible. If $\psi$ is the  character  of
#		$\bf{S}^G$, then $$F(\psi)=E\mbox{.}$$

       if o[b].dimension * r <= R then	#234567890123456789012345678901234567

	if IsRec( O[b] ) then
	 Add( N, induceSQ( O[b], G ) );
	fi;
	Add( n, induceSQ( o[b], G ) );

       fi;	#890123456789012345678901234567890123456789012345678901234567

#	The conjugate  representations of $\Bf{S}$ with respect to $G$ induce
#	up to representations similar to ${\Bf{S}}^G$ by Clifford's theorem.

       for j in [ 2..r ] do
	for l in [ b+1..Length( o ) ] do
	    if IsRec( o[l] ) then
		if IsEquivalentSQ( G, d, cr, o[l] ) then o[l] := b; fi;
	    fi;
	od;
	cr := conjugateRepSQ( G, cr, g );
       od;

      else	#	IsEquivalentSQ( ... )

       cr := conjugateRepSQ( G, O[b], g );
       gc := AlgConjugatesSQ(  O[b]  );

       s := 1; D := distinguishSQ( G, gc );
       while not IsEquivalentSQ( G, D, gc[s], cr ) do
	s := s + 1;
       od;

       if s <> 1 then

#	\item[(2)] If $\bf{S}\gamma$  is  similar  to  $\eta\bf{S}$ for  some
#		$1\not=\eta{\in}Gal(E/F)$, then $\bf{S}^G$ is  absolutely ir-
#		reducible. If  $\psi$ is  the  character of $\bf{S}^G$,  then
#		$F(\psi)=E'{\subset}E$ with $[E:E']=r$.

	F := O[b].field;
	if not IsBound( E[QuoInt(F.degree,r)] ) then
	 E[QuoInt(F.degree,r)] := GF( p^QuoInt(F.degree,r) );
	fi;
	S := E[QuoInt(F.degree,r)];

#	There is a matrix $\bf{Z}$ such that $\eta\bf{S}=\bf{Z}(\bf{S}\gamma)
#	\bf{Z}^{-1}$. Since $r=[G:N]$, it follows that
#	  $${\eta^r\bf{S}(n)=
#	    \eta^{r-1}\bf{Z}\cdots\eta\bf{Z}\bf{Z}{\bf{S}(t^r)}^{-1}\bf{S}(n)
#	    (\eta^{r-1}\bf{Z}\cdots\eta\bf{Z}\bf{Z}{\bf{S}(t^r)}^{-1})^{-1}$$
#	We know that $\eta^r=1$ because otherwise $\bf{S}$ would  be  realis-
#	able over a subfield  of $E$ contrary to the hypothesis  $E=F(\chi)$.
#	Hence   $\eta^r\bf{S}=\bf{S}$  and  $\eta^{r-1}\bf{Z}\cdots\eta\bf{Z}
#	\bf{Z}\:{\bf{S}(t^r)}^{-1}=f\bf{I}$ for some $f{\in}E^*$. The  scalar
#	$f$ is  in  $E'$, the fixed field  of $\eta$. Choosing $c{\in}E$ such
#	that $N_{E/E'}(c)=f$ where $N_{E/E'}$ denotes the  norm  map  and re-
#	placing $\bf{Z}$ by $c^{-1}\bf{Z}$ we may arrange that  $f=1$. Choose
#	a base for $E/E'$ and let $\rho$ be the regular representation of $E$
#	by $r{\times}r$ matrices over $E'$ determined by this  base. Further-
#	more, let $\bf{Y}$ be the matrix of $\eta^{-1}$ with  respect to  the
#	chosen base. Then $\rho(\eta(x))=\bf{Y}^{-1}\rho(x)\bf{Y}$ for all $x
#	{\in}E$. Now, define a representation $\bf{R}$ of $G$ over $E'$ by
#	    $\bf{R}(nt^i)=\rho(\bf{S}(n))(\bf{I}\otimes\bf{Y}^i)
#			\rho(\eta^{i-1}\bf{Z}\cdots\eta\bf{Z}\bf{Z})$
#	for   $i=0,\ldots,r-1$  and  $n{\in}N$. It  is  easily  checked  that
#	$\bf{R}$ is indeed a representation of $G$ equivalent to the  induced
#	representation $\bf{S}^G$.

	Z := intertwineSQ( cr, gc[s] );

	e := Z * mapSQ( G, g^-r, O[b] );
	for k in [ 1..r-1 ] do
	 e := ConjugateSQ( F, Z, (s-1)*k ) * e;
	od;
	e := e[1][1];

	c := F.root^QuoInt( LogFFE( e, F.root ),
		QuoInt( p^F.degree-1, p^S.degree-1 ));

	Z := c^-1 * Z;

        Q := F/S; P := minvSQ( p^(s-1), p^F.degree-1 );

	x := [];
        for j in [ 1..r ] do
	 x[j] := Coefficients( Q, Q.base[j]^P );
        od;
        x := KroneckerProduct( IdentityMat(
		O[b].dimension, S ), TransposedMat( x ) );

	Add( N, BlowupSQ( Q, O[b] ) );
	N[Length(N)].generators[i] := x * BlowupFieldSQ( Q, Z );
	Add( n, BlowupSQ( S/E[1], N[Length(N)] ) );

       else	#	s = 1

#	\item[(3)] If  $\bf{S}\gamma$  is  similar  to  $\bf{S}$, then  there
#		exists  an  invertible matrix  $\bf{P}_t$  such  that $\bf{S}
#		\gamma={\bf{P}_t}^{-1}\bf{S}\bf{P}_t$. Moreover, ${\bf{P}_t}^
#		r=e\bf{S}(t^r)$ for some  $e{\in}E$. Let  $c$  be  a $r^{th}$
#		root of $e$ which lies in $E$ or  possibly  in  an  extension
#		field of $E$. Then every irreducible  representation  of  $G$
#		which contains a component similar to $\bf{S}$ on restriction
#		to $N$ is similar to a  representation  defined by $\bf{R}_c:
#		t^in\,\mapsto\,c^i{\bf{P}_t}^i\bf{S}(n)$ for $i=0,\ldots,r-1$
#		and $n{\in}N$. If $\psi$ is the character of $\bf{R}_c$, then
#		$$F(\psi)=E(c)\mbox{.}$$
#			The characters of the representations $\bf{R}_c$  and
#		$\bf{R}_{c'}$ are Galois conjugate over $F$ if  and  only  if
#		$c$ and $c'$ have the same minimum polynomial over $E$.

	F := O[b].field;

	x := intertwineSQ( cr, gc[s] );

	e := mapSQ( G, g^r, O[b] ) * x^-r; e := e[1][1];

	if ( p^F.degree-1 ) mod r <> 0 then

#	If $r\!\not||E^*|$, then raising elements to the $r^{th}$ power is an
#	automorphism of the multiplicative group of $E$ and there is a unique
#	$c{\in}E$ such that $c^r=e$.

	 c := e^minvSQ( r, p^F.degree-1 );
         Add( N, rec( isMatGroup := true,
		dimension := O[b].dimension,
		field := F,
		generators := ShallowCopy( O[b].generators ) ) );
	 N[Length(N)].generators[i] := c * x;
	 Add( n, BlowupSQ( F/E[1], N[Length(N)] ) );
	 if r <> p then

#	If $r\not=p$, then there are $r$ distinct roots of unity in an exten-
#	sion field of $E$. The $r^{th}$ cyclotomic polynomial $(x^r-1)/(x-1)$
#	factors into $\phi(r)/l$ distinct irreducible polynomials  in  $E[x]$
#	of the same degree $l$. The $r^{th}$ cyclotomic field $E^{(r)}$  over
#	$E$ is the splitting field for any such irreducible  factor  over $E$
#	and $[E^{(r)}:E]=l$ where $l$ is the least positive integer such that
#	$q^l{\equiv}1\bmod\,r$. Factorisation of polynomials can  be achieved
#	by Berlekamp's algorithm.

          f := Factors( Polynomial( F, List( [1..r], x -> F.one ) ) );
          l := Degree( f[1] );

	  if o[b].dimension * l <= R then	#0123456789012345678901234567

	   S := F;
	   if not IsBound( E[S.degree*l] ) then
	    E[S.degree*l] := GF( p^(S.degree*l) );
	   fi;
	   F := E[S.degree*l];

	   for j in [ 1..Length( f ) ] do
	    w := F.root^( (p^F.degree-1)/r );
	    while Value( f[j], w ) <> E[1].zero do
	     w := w * F.root^( (p^F.degree-1)/r );
	    od;
	    Add( N, rec( isMatGroup := true,
		dimension := O[b].dimension,
		field := F,
		generators := ShallowCopy( O[b].generators ) ) );
	    N[Length(N)].generators[i] := w * c * x;
	    Add( n, BlowupSQ( F/E[1], N[Length(N)] ) );
	   od;

	  fi;	#890123456789012345678901234567890123456789012345678901234567

	 fi;

#	If $r=p$, then $x^r-e={(x-e)}^r$ and no further roots exist in $E$ or
#	extension fields of $E$.

	else	#	( p^F.degree-1 ) mod r = 0

#	If $r\,|\,|E^*|$, then $r\not=p$ and $E$ contains $r$ distinct  roots
#	of unity. Let $r^k$ be the biggest $r$ power dividing $|E^*|$.

	 k := 0;
	 while ( p^F.degree-1 ) mod r^( k+1 ) = 0 do
	  k := k + 1;
	 od;

	 if OrderFFE( e ) mod r^k <> 0 then

#	If  the  order of  $e$  in   $E^*$ is   not divisible by  $r^k$, then
#	$e^{|E^*|/r}=1$ and therefore $E$ contains $r$ roots of $x^r-e$.

	  c := F.root^QuoInt( LogFFE( e, F.root ), r );
	  for j in [ 1..r ] do
	   Add( N, rec( isMatGroup := true,
		dimension := O[b].dimension,
		field := F,
		generators := ShallowCopy( O[b].generators ) ) );
	   N[Length(N)].generators[i] := c * x;
	   Add( n, rec( isMatGroup := true,
		dimension := o[b].dimension,
		field := E[1],
		generators := ShallowCopy( o[b].generators ) ) );
	   n[Length(n)].generators[i] := BlowupFieldSQ( F/E[1], c * x );
	   c := c * F.root^QuoInt( p^F.degree-1, r );
	  od;

	 else	#	OrderFFE( e ) mod r^k = 0

#	If the order of $e$ in $E^*$ is divisible by $r^k$, then $e^{|E^*|/r}
#	\not=1$ and therefore $x^r-e$ has no root in $E$. Then $x^r-e$ is ir-
#	reducible over $E$.

	  S := F;
	  if not IsBound( E[S.degree*r] ) then
	   E[S.degree*r] := GF( p^(S.degree*r) ) ;
	  fi;
	  F := E[S.degree*r];

	  if O[b].dimension * F.degree <= R then	#89012345678901234567

	   c := F.root^QuoInt( LogFFE( e, F.root ), r );

	   Add( N, rec( isMatGroup := true,
		dimension := O[b].dimension,
		field := F,
		generators := ShallowCopy( O[b].generators ) ) );
	   N[Length(N)].generators[i] := c * x;
	   Add( n, BlowupSQ( F/E[1], N[Length(N)] ) );

	  fi;	#890123456789012345678901234567890123456789012345678901234567

	 fi;

	fi;

       fi; # s ...

      fi; # IsEqui ... ()

     fi;
    od;

   fi;
  od;

#	InfoSQ2( "\n" );
	for j in [ 1..Length( n ) ] do
#	    InfoSQ2( "\t ", n[j].dimension );
	    n[j].absolutelyIrreducible := N[j];
#	    InfoSQ2( "\t ", N[j].field.degree, "\n" );
	od;
#	InfoSQ2( "\n" );

	return( n );
end;


#############################################################################
##
## NAME
##	"intmatdiag"  . . . . . . . . . . .  normal form of an integer matrix
##
## USAGE
##	intmatdiag( M )
##
## DESCRIPTION
##	The invariant factor theorem for  integer  matrices  asserts that for
##	any m{\times}n integer matrix M there exists an invertible m{\times}m
##	integer  matrix P and an invertible n{\times}n integer  matrix Q such
##	that D = P * M * Q  is a diagonal matrix diag{ d_1, ... , d_k }, with
##	k = min(m,n) and where the d_i are non-negativ integers each dividing
##	its successor, and as such are uniquely determined by M. The diagonal
##	elements of this normal form are called the invariant factors of M.
##
##		intmatdiag() takes as argument  an  integer  matrix  <M>  and
##	determines integer matrices <P> and <Q> such that <P>*<M>*<Q> has the
##	normal form as decribed above.
##
## RETURNS
##	intmatdiag()  returns a record which contains the normal  form of the
##	integer matrix <M>. This  record  also  contains  invertible  integer
##	matrices <P> and <Q> and an integer matrix <I> such that <Q>*<I> = 1.
##
## EXAMPLE
##	M := [ [2,0,0,0], [0,5,0,0], [2,2,2,2] ];;
##	intmatdiag( M );
##	# returns	rec(
##	#		  D := [ [ 1, 0, 0, 0 ],
##	#		    [ 0, 2, 0, 0 ],
##	#		    [ 0, 0, 10, 0 ] ],
##	#		  P := [ [ -2, 1, 0 ],
##	#		    [ 3, -2, 1 ],
##	#		    [ -5, 2, 0 ] ],
##	#		  Q := [ [ 1, 0, -5, 0 ],
##	#		    [ 1, 0, -4, 0 ],
##	#		    [ 0, 1, 4, -1 ],
##	#		    [ 0, 0, 0, 1 ] ],
##	#		  I := [ [ -4, 5, 0, 0 ],
##	#		    [ 4, -4, 1, 1 ],
##	#		    [ -1, 1, 0, 0 ],
##	#		    [ 0, 0, 0, 1 ] ] )
##	#
##	#	D = P * M * Q, Q * I = 1 and I * Q = 1
##
## FILES
##	LIBNAME/epimorph.g
##
intmatdiagSQ := function( M )
##
##	If (m_{ij}) is the zero matrix, then (m_{ij}) is already in  diagonal
##	form. Otherwise, among those integers m_{ij} which are different from
##	zero there is one which is smallest in absolute value.  By appropiate
##	row and column interchange one may take m_{11} to be this number.
##
##		If m_{k1} \not = 0, k > 1, then m_{k1} = q * m_{11} + r where
##	q and r are integers and 0 <= r < |m_{11}|. Multiply the first row by
##	q and subtract it from the k-th row. Repeat the above procedure until
##	m_{21} = ... = m{m1} = 0.
##
##		If m_{1k} \not = 0, k > 1, then m_{1k} = q * m_{11} + r where
##	q and r are integers and 0 <= r < |m_{11}|. Multiply the first column
##	by q and subtract it from the k-th column. Each time the first column
##	is replaced  by  another column, apply  row operations so  that again
##	m_{21} = ... = m{m1} = 0.
##
##		Continuing in this way, one  obtains  a  matrix ( m_{ij} ) in
##	which m_{i1} = m_{ij} = 0, i,j \not 1. If there some m_{ij}=q*m{11}+r
##	where q and r are integers and 0 <= r < |m_{11}|, add the j-th column
##	to the first column, and proceed as before.
##
##		After finitely many replacements, one  arrives  at  a  matrix
##	( m_{ij} ) in which m_{i1}=m_{j1}=0, i,j \not 1, and  m_{11}  divides
##	m_{ij}. Starting again with the submatrix obtained  by  ignoring  the
##	first row and the first column, one arrives at a matrix ( m_{ij} ) in
##	which m_{ii} divides m_{jj}, 1<=i<j<=n and m_{ij}=0, i<>j.
##
##	REFERENCE
##		D. L. Johnson
##		Presentations of groups, LMSST 15
##		Cambridge University Press, 1990
##		Section 6.4 The invariant factor theorem for matrices
##
##		N. Jacobson
##		Basic Algebra I
##		W.H. Freeman and Company, 1985
##		Chapter 3.7 Equivalence of Matrices with Entries in a PID
##

	local	divisor, minimum, diagonal,
		#		These functions compute certain properties of
		#	the integer matrix <M>. divisor() and  minimum()  use
		#	the variables <k> and <l> for side effects !

		k, l,

		LIMIT,
		#		The algorithm proceeds  by  concidering  sub-
		#	matrices  of  the  integer matrix <M>. <LIMIT>  keeps
		#	track of the number of reductions.

		h, i, j,

		P, Q, I,

		col_add, row_add, reduce_col, reduce_row;
		#		These functions are used to perform  row  and
		#	column operations on the matrices.

	col_add := function ( h, f, j )
		local	i;

		for i in [ LIMIT..Length( M ) ] do
			M[i][h] := M[i][h] + f * M[i][j];
		od;
		for i in [ 1..Length( M[1] ) ] do
			Q[i][h] := Q[i][h] + f * Q[i][j];
		od;
		I[j] := I[j] - f * I[h];
	end;

	diagonal := function ()
		local	i, j;

		for i in [ LIMIT..Length( M ) ] do
			for j in [ LIMIT..Length( M[1] ) ] do
				if i <> j and M[i][j] <> 0 then
					return( false );
				fi;
			od;
		od;

		return( true );
	end;

	divisor := function ( div )
		local	i, j;

		for i in [ LIMIT..Length( M ) ] do
			for j in [ LIMIT..Length( M[1] ) ] do
				if M[i][j] mod div <> 0 then
					k := i; l := j; return( false );
				fi;
			od;
		od;

		return( true );
	end;

	minimum := function()
		local	abs, i, j, min;

		min := 0;
		for i in [ LIMIT..Length( M ) ] do
		    for j in [ LIMIT..Length( M[1] ) ] do
			if M[i][j] <> 0 then
				abs := AbsInt( M[i][j] );
				if abs < min or min = 0 then
					min := abs; k := i; l := j;
				fi;
			fi;
		    od;
		od;

		return( min );
	end;

	reduce_col := function ()
	    local	h, i, j, min;

	    for i in [ LIMIT+1..Length( M ) ] do
	      if M[i][LIMIT] <> 0 then
		repeat
		  min := M[LIMIT][LIMIT];
		  if M[i][LIMIT] mod min = 0 then
		    row_add( i, -QuoInt( M[i][LIMIT], min ), LIMIT );
		  else
		    row_add( i, -QuoInt( M[i][LIMIT], min ), LIMIT );
		    h := M[i]; M[i] := M[LIMIT]; M[LIMIT] := h;
		    h := P[i]; P[i] := P[LIMIT]; P[LIMIT] := h;
		  fi;
		until M[i][LIMIT] = 0;
	      fi;
	    od;
	end;

	reduce_row := function ()
	    local	h, i, j, min;

	    for j in [ LIMIT+1..Length( M[1] ) ] do
	      if M[LIMIT][j] <> 0 then
		repeat
		  min := M[LIMIT][LIMIT];
		  if M[LIMIT][j] mod min = 0 then
		    col_add( j, -QuoInt( M[LIMIT][j], min ), LIMIT );
		  else
		    col_add( j, -QuoInt( M[LIMIT][j], min ), LIMIT );
		    for i in [ LIMIT..Length( M ) ] do
			h := M[i][j]; M[i][j] := M[i][LIMIT]; M[i][LIMIT] := h;
		    od;
		    for i in [ 1..Length( M[1] ) ] do
			h := Q[i][j]; Q[i][j] := Q[i][LIMIT]; Q[i][LIMIT] := h;
		    od;
		    h := I[j]; I[j] := I[LIMIT]; I[LIMIT] := h;
		    reduce_col();
		  fi;
		until M[LIMIT][j] = 0;
	      fi;
	    od;
	end;

	row_add := function ( i, f, k )
		local	j;

		for j in [ LIMIT..Length( M[1] ) ] do
			M[i][j] := M[i][j] + f * M[k][j];
		od;
		for j in [ 1..Length( M ) ] do
			P[i][j] := P[i][j] + f * P[k][j];
		od;
	end;



	P := IdentityMat( Length( M    ) );
	M := Copy( M );
	Q := IdentityMat( Length( M[1] ) );
	I := IdentityMat( Length( M[1] ) );

	for LIMIT in [ 1..Minimum( Length( M ), Length( M[1] ) ) ] do
	    if minimum() <> 0 then

		h := M[k]; M[k] := M[LIMIT]; M[LIMIT] := h;
		h := P[k]; P[k] := P[LIMIT]; P[LIMIT] := h;
		for i in [ LIMIT..Length( M ) ] do
			h := M[i][l]; M[i][l] := M[i][LIMIT]; M[i][LIMIT] := h;
		od;
		for i in [ 1..Length( M[1] ) ] do
			h := Q[i][l]; Q[i][l] := Q[i][LIMIT]; Q[i][LIMIT] := h;
		od;
		h := I[l]; I[l] := I[LIMIT]; I[LIMIT] := h;

		reduce_col(); reduce_row();
		while not divisor( M[LIMIT][LIMIT] ) do
		    col_add( LIMIT, 1, l ); reduce_col(); reduce_row();
		od;

		if M[LIMIT][LIMIT] < 0 then
			M[LIMIT][LIMIT] := -M[LIMIT][LIMIT];
			for j in [ 1..Length( M ) ] do
				P[LIMIT][j] := -P[LIMIT][j];
			od;
		fi;

	    fi;
	od;

	return( rec( D := M, P := P, Q := Q, I := I ) );
end;



#############################################################################
##
## NAME
##	"initepi" . . . . . . . . .  decomposition of the commutator quotient
##
## USAGE
##	initepi( <fpgrp> )
##
## DESCRIPTION
##	Given a group  G,  its  derived  group  or commutator subgroup is the
##	group  G'  generated  by the set of all commutators of elements of G.
##	G'  is the "smallest" subgroup  of G with the  property that  G/G' is
##	abelian ( so that G/G' is the "largest" abelian quotient group ).
##		Given a finite  presentation  of  a  group  G, the commutator
##	quotient  group  G/G'  is  a  finitely  generated abelian  group. Any
##	finitely generated  abelian group  is a direct product of its torsion
##	group (  the  subgroup  of  elements of  finite  order  )  and a free
##	abelian group.  Furthermore any  finitely generated  abelian  torsion
##	group is a direct product of cyclic groups.
##
##		initepi() takes as argument a record representing a  finitely
##	presented  group and  calculates the decomposition of  the commutator
##	quotient into a direct product of cyclic groups.
##
## RETURNS
##	initepi() returns  a  record  which  describes  epimorphisms from the
##	finitely presented group <fpgrp> onto the torsion group and the  free
##	abelian group of the commutator quotient.
##
## EXAMPLE
##	A := AbstractGenerator( "A" );;
##	B := AbstractGenerator( "B" );;
##	C := AbstractGenerator( "C" );;
##	D := AbstractGenerator( "D" );;
##	E := AbstractGenerator( "E" );;
##	initepi( rec(
##		   isFpGroup := true,
##		   generators := [ A,
##		     B,
##		     C,
##		     D,
##		     E ],
##		   relators := [ A^2,
##		     B^5,
##		     (A*B*C*D)^2 ] ) );
##	# returns	rec(
##	#		  tor := rec(
##	#		    domain := rec(
##	#		      isFpGroup := true,
##	#		      generators := [ A,
##	#			B,
##	#			C,
##	#			D,
##	#			E ],
##	#		      relators := [ A^2,
##	#			B^5,
##	#			A*B*C*D*A*B*C*D ] ),
##	#		    image := rec(
##	#		      isFpGroup := true,
##	#		      generators := [ 1,
##	#			2,
##	#			3 ],
##	#		      relators := [ 1^2,
##	#			1^-1*2*1*2^-1,
##	#			1^-1*3*1*3^-1,
##	#			2^2*3^-1, 
##	#			2^-1*3*2*3^-1,
##	#			3^5 ] ),
##	#		    images := [ 2^5,
##	#		      2^6,
##	#		      1*2^4,
##	#		      IdWord,
##	#		      IdWord ],
##	#		    preimages := [ B*C,
##	#		      A*B,
##	#		      A*B*A*B ] ),
##	#		  free := rec(
##	#		    domain := rec(
##	#		      isFpGroup := true,
##	#		      generators := [ A,
##	#			B,
##	#			C,
##	#			D,
##	#			E ],
##	#		      relators := [ A^2,
##	#			B^5,
##	#			A*B*C*D*A*B*C*D ] ),
##	#		    image := rec(
##	#		      isFpGroup := true,
##	#		      generators := [ 4,
##	#			5 ],
##	#		      relators := [ 5^-1*4^-1*5*4 ] ),
##	#		    images := [ IdWord,
##	#		      IdWord,
##	#		      IdWord,
##	#		      4,
##	#		      5 ],
##	#		    preimages := [ D,
##	#		      E ] ) )
##
## FILES
##	LIBNAME/epimorph.g
##
InitEpimorphismSQ := function( fpgrp )
##
##	Let G = < g_1,...,g_n | R_i(g_1,...,g_n) = 1, 1<=i<=m > be a finitely
##	presented  group  then  G/G'  has  the  presentation  < q_1,...,q_n |
##	[q_i,q_j] = 1, 1<=i<j<=n, R_i(q_1,...,q_n) = 1, 1<=i<=m >. The kernel
##	of the epimorphism \phi:F_n \rightarrow G/G' of the free group F_n of
##	rank n generated by x_1,...,x_n onto G/G' defined by  x_i \mapsto q_i
##	contains  the  derived  group  {F_n}'  which is the normal closure of
##	the  set { [x_i,x_j] | 1<=i<j<=n }. The  epimorphism \phi induces the
##	epimorphism \bar{\phi}:\bar{F}_n \rightarrow G/G' of the free abelian
##	group  \bar{F}_n = F_n/{F_n}' generated by \bar{x}_1, ... , \bar{x}_n
##	onto G/G'. Changing to additive notation every element  in  \bar{F}_n
##	is  an  integer  linear combination of \bar{x}_1, ... , \bar{x}_n and
##	R_i(\bar{x}_1,...,\bar{x}_n) = \sum_{j=1}^{n} m_{ij} \bar{x}_j  where
##	m_{ij}  are integers. The m{\times}n integer matrix (m_{ij}) of these
##	relations is called the relation matrix for G/G'.
##		The invariant factor theorem  for  integer  matrices  asserts
##	that for any m{\times}n integer matrix M there exists  an  invertible
##	m{\times}m integer  matrix  P  and an invertible  n{\times}n  integer
##	matrix Q such that D = P*M*Q is a diagonal matrix  diag{d_1,...,d_k},
##	with k = min( m, n ) and where the d_i are non-negativ integers  each
##	dividing its successor, and as such are uniquely determined by M. The
##	d_i are called the in variant factors of M,  and are constructed by a
##	sequence of elementary row and column operations.
##		These operations change the generating set for \bar{F}_n  and
##	the kernel of the epimorphism \bar{\phi}. So the commutator  quotient
##	is isomorphic to the direct product of cyclic  groups  < z_i >  where
##	z_i is of order d_i if d_i > 0 and infinite cyclic  if d_i = 0.  Thus
##	G/G' has a presentation of the form < z_1,...,z_k | [ z_i, z_j ] = 1,
##	1<=i<j<=n, {z_1}^{d_1}=...={z_l}^{d_l}=1, d_i>=1, 1<=i<=l<=k >.
##
##		initepi() determines the relation matrix  of  the  commutator
##	quotient group  M =( m_{ij} ) and calculates  invertible  matrices  P
##	and  Q  such  that  the relation matrix D = P * M * Q  determines the
##	decomposition into a direct product of cyclic groups.
##
##	REFERENCE
##		D. L. Johnson
##		Presentations of groups, LMSST 15
##		Cambridge University Press, 1990
##		Section 6 Finitely generated Abelian Groups
##
##		N. Jacobson
##		Basic Algebra I
##		W.H. Freeman and Company, 1985
##		Chapter 3 Modules over Principal Ideal Domains
##

	local	g, gens	,	#	generator(s)
		r, rels	,	#	relation (s)

		ng	,	#	number of generator(s)
		nr	,	#	number of relation (s)

		pf	,	#	factor(s)
		pn	,	#	prime (s)
		pp	,	#	power (s)

		D, P, M, Q, I,

		torgrp	,	#	torsion group of commutator quotient
		TorGrp	,	#	torsion group of commutator quotient

		torgens, torrels, freegens, freerels,
		#		generator(s) and relation(s) for the  torsion
		#	group and the free abelian group.

		torimages, freeimages, torpreimages, freepreimages,
		#		the images of the generators of the  finitely
		#	presented  group in the commutator quotient and  pre-
		#	images  for the generators of the commutator quotient
		#	in the finitely presented group.

		i, j, k, l, RES,

		index	,
		#		<index> is a sequence providing the index  of
		#	the generator of the cyclic group of order  <D[i][i]>
		#	in the sequence of generator(s).

		order	,
		#		<order> is a sequence providing the  order(s)
		#	of the image(s)  of the generator(s)  of the finitely
		#	presented group <fpgrp>.

		array;

	gens := fpgrp.generators;	ng := Length( gens );
	rels := fpgrp.relators ;	nr := Length( rels );

	#####################################################################
	##
	##	build the relation matrix for the commutator  quotient  group

	M := [];
	for i in [ 1..Maximum( nr, ng ) ] do
	    M[i] := List( [ 1..ng ], i->0 );
	    if i <= nr then
		r := rels[i];
		for j in [ 1..LengthWord( r ) ] do
		    g := Subword( r, j, j );
		    k := 1;
		    while		(g   <>gens[k])
				and	(g^-1<>gens[k]) do
				k := k+1;
		    od;
		    if g = gens[k] then
			M[i][k] := M[i][k] + 1;
		    else
			M[i][k] := M[i][k] - 1;
		    fi;
		od;
	    fi;
	od;

	RES := intmatdiagSQ( M );		# calculate the normal  form  of  <M>

	D := RES.D; P := RES.P; Q := RES.Q; I := RES.I;

	# if CHECK then
	#     if Q*I <> IdentityMat( Length( Q ) ) then
	#         Error( "problems with integer matrix diagonalization" );
	#     elif D <> P * M * Q then
	#         Error( "problems with integer matrix diagonalization" );
	#     fi;
	# fi;
        
	index := [];
	order := [];

	#####################################################################
	##
	##		build presentations for  the torsion  group  and  the
	##	free abelian group of the commutator quotient

	torgens := []; torrels := []; freegens := []; freerels := [];

	g := 1;	pf := [];
	for i in [ 1..ng ] do

	  ###################################################################
	  ##
	  ##	build a presentation for the cyclic group of order  <D[i][i]>

	  if D[i][i] <> 0 then

	    if D[i][i] <> 1 then

	      index[i] := g;	#	<torgens[index[i]]> is the  generator

	      pf[i] := pfactorsSQ( D[i][i] );

	      for j in [ 1..Length( pf[i].factors ) ] do

		pn := pf[i].factors[j];
		pp := pf[i].powers [j];

		for k in [ 1..pp ] do

		  torgens[g] := AbstractGenerator( ConcatenationString( "e", String( g ) ) );

		  ###########################################################
		  ##
		  ##		each  generator  has  order <pn> modulo later
		  ##	ones and commutes with all the previous generators

		  torrels[g] := []; torrels[g][g] := torgens[g]^pn;
		  for l in [ 1..g-1 ] do
		    torrels[g][l] := torgens[g]^torgens[l]/torgens[g];
		  od;

		  ###########################################################
		  ##
		  ##		with the occurence of a generator  the  order
		  ##	of the previous generator has to be modified

		  if j <> 1 or k <> 1 then
		    torrels[g-1][g-1] := torrels[g-1][g-1]/torgens[g];
		  fi;

		  g := g + 1;

		od;

	      od;

	    fi;

	  else	#	<D[i][i]> = 0

	    index[i] := g - Length( torgens );

	    freegens[index[i]] := AbstractGenerator( ConcatenationString( "f", String( g ) ) );

	    for l in [ 1..Length( freegens )-1 ] do
	      Add( freerels, Comm( freegens[index[i]], freegens[l] ) );
	    od;

	    g := g + 1;

	  fi;

	od;

	k := 1; array := [];
	for j in [ 1..Length( torrels ) ] do
		for i in [ j..Length( torrels ) ] do
			array[k] := torrels[i][j]; k := k + 1;
		od;
	od;

	torgrp := rec(
		isFpGroup := true,
		generators := torgens,
                identity := IdWord,
		relators := array,
                operations := FpGroupOps );

	#####################################################################
	##
	##		calculate images for the generators of  the  finitely
	##	presented group in the commutator quotient

	TorGrp := AgGroupFpGroup( torgrp );	#    build the soluble  group

	torimages  := [];
	freeimages := [];

	for i in [ 1..ng ] do

	    torimages [i] := IdWord;
	    freeimages[i] := IdWord;

	    if D[i][i] <> 0 then

		for j in [ 1..ng ] do
		    if Q[i][j] <> 0 and D[j][j] <> 0 and D[j][j] <> 1 then
			torimages[i] := torimages[i]
			    * torgens [index[j]]^( Q[i][j] mod D[j][j] );
		    fi;
		od;

		if Length( torgens ) <> 0 then
		  order[i] := Order(TorGrp,mapSQ(torgrp,torimages[i],TorGrp));
		else
		  order[i] := 1;
		fi;

	    else	#	<D[i][i]> = 0

		for j in [ Length( torgens )+1..ng ] do
		    if Q[i][j] <> 0 then
			freeimages[i] := freeimages[i]
			    * freegens[index[j]]^( Q[i][j]             );
		    fi;
		od;

	    fi;

	od;

	#####################################################################
	##
	##		calculate preimages for the generators of the  commu-
	##	tator quotient in the finitely presented group

	torpreimages  := [];
	freepreimages := [];

	for i in [ 1..ng ] do
	    if D[i][i] <> 0 then
		if D[i][i] <> 1 then

		    r := IdWord;
		    for j in [ 1..ng ] do
			if torimages[j] <> IdWord then
			    r := r * gens[j] ^ ( I[i][j] mod order[j] );
			fi;
		    od;

		    g := index[i];
		    for j in [ 1..Length( pf[i].factors ) ] do

			pn := pf[i].factors[j];
			pp := pf[i].powers [j];

			for k in [ 1..pp ] do
			    torpreimages[g] := r; g := g + 1 ; r := r ^ pn;
			od;

		    od;

		fi;
	    else	#	<D[i][i]> = 0

		    r := IdWord;
		    for j in [ Length( torgens )+1..ng ] do
			if freeimages[j] <> IdWord then
                            r := r * gens[j] ^ ( I[i][j]              );
                        fi;
		    od;

		    freepreimages[index[i]] := r;

	    fi;
	od;

        torgrp.size := Size(TorGrp);
	return	rec(
		  tor := rec(
		    source := fpgrp,
		    image := torgrp,
		    images := torimages,
		    preimages := torpreimages,
                    operations := SQOps ),
		  free := rec(
		    source := fpgrp,
		    image := rec(
		      isFpGroup := true,
		      generators := freegens,
		      relators := freerels ),
		    images := freeimages,
		    preimages := freepreimages ) );
end;



#############################################################################
##
## NAME
##	"MakePreImages" . . . . . . . . . . . . . . . . . calculate preimages
##
## USAGE
##	MakePreImages( <epi>, <ext>, <images>, <actions> )
##
## DESCRIPTION
##	Let G = < g_1,...,g_n | r_i(g_1,...,g_n) = 1, 1<=i<=m > be a finitely
##	presented group and let H be a finite soluble group given by  an  AG-
##	presentation consisting of generators  h_1, ... , h_k  and  relations
##	s_i( h_1, ... , h_k ) = 1 for 1 <= i <= l. Let
##			    \varepsilon : G \rightarrow H
##	be an epimorphism given by the images
##			\varepsilon(g_i) = w_i( h_1, ... , h_k)
##	for g_i for 1<=i<=n and  words \hat{w}_1, ... , \hat{w}_k, such  that
##	h_i=\varepsilon(\hat{w}_i(g_1,...,g_n)) for 1<=i<=k. Let \tilde{H} be
##	an  extension of  the  group H  by  an irreducible finite dimensional
##	F_p[H]-module,  F_p=Z/pZ  for  some  prime number p.  With these data
##	given, it is a question of solving linear equations to check  whether
##	\varepsilon lifts to an epimorphism
##		\tilde\varepsilon : G \rightarrow \tilde{H},
##	i.e. an epimorphism satisfying \tilde \varepsilon \eta = \varepsilon,
##	where \eta is the natural homomorphism of \tilde{H}  onto H. In  view
##	of a repeated application of the lifting procedure it remains to cal-
##	culate preimages for the generators for \tilde{H}.
##		Suppose an epimorphism <epi> of a finitely presented  group G
##	onto a finite soluble group H is given. Let <ext> be an  extension of
##	H  by an irreducible finite dimensional F_p[H]-module, F_p = Z/pZ for
##	some prime number p. Finally, let <images> be a sequence of  words in
##	<ext> describing a lift \tilde\varepsilon of <epi> and <actions> be a
##	sequence of matrices over F_p describing the actions of  <images>  on
##	the irreducible finite dimensional module. Given these data  MakePre-
##	Images() calculates preimages for the generators of <ext>.
##
## RETURNS
##	a sequence of words which are preimages for the generators of  <ext>.
##
## EXAMPLES
##	S := AbstractGenerator( "S" );;
##	T := AbstractGenerator( "T" );;
##	X := AbstractGenerator( "X" );;
##	Y := AbstractGenerator( "Y" );;
##	epi := rec(
##	    source := rec(	# the dihedral group of order 8
##		isFpGroup := true,
##		generators := [ S,
##		    T ],
##		relators := [ S^4,
##		    T^2,
##		    (S*T)^2 ] ),
##	    image := rec(	# the elementary abelian group of order 4
##		isFpGroup := true,
##		generators := [ X,
##		    Y ],
##		relators := [ X^2,
##		    Comm( X, Y ),
##		    Y^2 ] ),
##	    images := [ Y,
##		X ],
##	    preimages := [ T,
##		S ] );;
##	Mgrp := rec(
##	    isMatGroup := true,
##	    dimension := 1,
##	    field := GF(2),
##	    generators := [ [ [ Z(2)^0 ] ],
##		[ [ Z(2)^0 ] ] ],
##	    AbsolutelyIrreducible := rec(
##		dimension := 1,
##		field := GF(2),
##		generators := [ [ [ Z(2)^0 ] ],
##		    [ [ Z(2)^0 ] ] ] ) );;
##	ext := AgGroupFpGroup( extend(
##	    epi.image, Mgrp, [ 0*Z(2), Z(2)^0, Z(2)^0 ] ) );;
##	images := [ ext.generators[2]*ext.generators[3], ext.generators[1] ];;
##	actions := [ [ [ Z(2)^0 ] ], [ [ Z(2)^0 ] ] ];;
##	MakePreImages( epi, ext, images, actions );
##	# returns	[ T, S^3, S^2 ]
##	S := AbstractGenerator( "S" );;
##	T := AbstractGenerator( "T" );;
##	X := AbstractGenerator( "X" );;
##	Y := AbstractGenerator( "Y" );;
##	epi := rec(
##	    source := rec(	# the symmetric group of degree 4
##		isFpGroup := true,
##		generators := [ S,
##		    T ],
##		relators := [ S^4,
##		    T^2,
##		    (S*T)^3 ] ),
##	    image := rec(	# the symmetric group of degree 3
##		isFpGroup := true,
##		generators := [ X,
##		    Y ],
##		relators := [ X^2,
##		    Y^X/Y^2,
##		    Y^3 ] ),
##	    images := [ X,
##	        X^-1*Y ],
##	    preimages := [ S,
##	        T^-1*S^-1*T^-1*S^-1 ] );;
##	Mgrp := rec(
##	    isMatGroup := true,
##	    dimension := 2,
##	    field := GF(2),
##	    generators := [ [ [ Z(2)^0, Z(2)^0 ], [ 0*Z(2), Z(2)^0 ] ],
##		[ [ 0*Z(2), Z(2)^0 ], [ Z(2)^0, Z(2)^0 ] ] ],
##	    AbsolutelyIrreducible := rec(
##		dimension := 2,
##		field := GF(2),
##		generators := [ [ [ Z(2)^0, Z(2)^0 ], [ 0*Z(2), Z(2)^0 ] ],
##		    [ [ 0*Z(2), Z(2)^0 ], [ Z(2)^0, Z(2)^0 ] ] ] ) );;
##	ext := AgGroupFpGroup( extend( epi.image, Mgrp, [ ] ) );;
##	images := [ ext.generators[1]*ext.generators[3],
##	    ext.generators[1]*ext.generators[2] ];;
##	actions := [ [ [ Z(2)^0, 0*Z(2) ], [ Z(2)^0, Z(2)^0 ] ],
##	    [ [ Z(2)^0, Z(2)^0 ], [ 0*Z(2), Z(2)^0 ] ] ];;
##	MakePreImages( epi, ext, images, actions );
##	# returns	[ S^3*T^-1*S^2*T,
##	#		    T^-1*S^-1*T^-1*S*T^-1*S^2*T,
##	#		    S^2*T^-1*S^2*T,
##	#		    S^2 ]
##
## FILES
##	LIBNAME/epimorph.g
##
MakePreImagesSQ := function( epi, ext, images, actions )
	local	Ggens	,	#	generator(s) [ epi.source   ]
		Qgens	,	#	generator(s) [ epi.image ]
		Qrels	,	#	relation (s) [ epi.image ]

		preimages	,	#	\hat{w_1},...,\hat{w_k}

		gen, i, j, k, l, next,

		Qimages	,	#	image(s) [ epi.images ]
		Wimages	,	#	\tilde\epsilon\hat{w_i}

		element, MinEl, word, MinWo,

		NrGenQuo	,
		NrGenExt	,

	    	h, field, ssp, kernel, bchng, basis, HD, v;

	# calculate \tilde{\epsilon}\hat{w_i}

	Ggens := epi.source.generators;
	preimages := ShallowCopy( epi.preimages );

	Wimages := [];
	for i in [ 1..Length( preimages ) ] do
	    Wimages[i] := ext.identity;
	    for j in [ 1..LengthWord( preimages[i] ) ] do

		gen := Subword( preimages[i], j, j );

		k := 1;
		while           (gen   <>Ggens[k])
			and     (gen^-1<>Ggens[k]) do
			k := k+1;
		od;
		if gen = Ggens[k] then
		    Wimages[i] := Wimages[i] * images[k];
		else
		    Wimages[i] := Wimages[i] * images[k]^-1;
		fi;

	    od;
	od;

	# calculate \tilde{\epsilon}s_i(\hat{w_1},...,\hat{w_k})

	Qgens := epi.image.generators;
	Qrels := epi.image.relators ;

	for i in [ 1..Length( Qrels ) ] do
	    element := ext.identity; word := IdWord;
	    for j in [ 1..LengthWord( Qrels[i] ) ] do

		gen := Subword( Qrels[i], j, j );

		k := 1;
		while           (gen   <>Qgens[k])
			and     (gen^-1<>Qgens[k]) do
			k := k + 1;
		od;
		if gen = Qgens[k] then
		    element := element * Wimages[k];
		    word := word * preimages[k];
		else
		    element := element * Wimages[k]^-1;
		    word := word * preimages[k]^-1;
		fi;

	    od;
	    if element <> ext.identity then
		if not IsBound( MinWo ) then
		    MinEl := element; MinWo := word;
		elif LengthWord( word ) < LengthWord( MinWo ) then
		    MinEl := element; MinWo := word;
		fi;
	    fi;
	od;

	# calculate \tilde{\epsilon}{g_i}^{-1}w_i(\hat{w_1},...,\hat{w_k})

	Qimages := epi.images;

	for i in [ 1..Length( Qimages ) ] do
	    element := images[i]^-1; word := Ggens[i]^-1;
	    for j in [ 1..LengthWord( Qimages[i] ) ] do

		gen := Subword( Qimages[i], j, j );

		k := 1;
		while		(gen   <>Qgens[k])
			and	(gen^-1<>Qgens[k]) do
			k := k+1;
		od;
		if gen = Qgens[k] then
		    element := element * Wimages[k];
		    word := word * preimages[k];
		else
		    element := element * Wimages[k]^-1;
		    word := word * preimages[k]^-1;
		fi;

	    od;
	    if element <> ext.identity then
		if not IsBound( MinWo ) then
		    MinEl := element; MinWo := word;
		elif LengthWord( word ) < LengthWord( MinWo ) then
		    MinEl := element; MinWo := word;
		fi;
	    fi;
	od;

##	A generator <MinEl>  for the irreducible finite dimensional   F_p[H]-
##	module and a preimage <MinWo> for this generator has been found.

	field := Field( actions[1][1] );

	v := [ ];
	for i in [ 1..Length( actions[1] ) ] do
	    v[i] := ExponentAgWord( MinEl, Length( Qgens )+i )*field.one;
	od;

##	A space W with basis <ssp> is calculated as smallest space containing
##	<v> that is invariant under the matrices of <actions>. In addition  a
##	basis <basis> for W is built up in echelon form. To  start with  this
##	echelon form contains the single vector <v>. Each vector of <ssp>  is
##	now multiplied by the matrices of <actions>, and the result expressed
##	as a linear combination in the vectors of <basis>. If necessary <ssp>
##	and <basis>  are extended and the  coefficients of the expression are
##	written as row of the matrix <bchng>. This process is continued until
##	the state is reached where every vector of <ssp> has been  multiplied
##	by the matrices of <actions>. Note  that the conjugate of a  preimage
##	corresponding to a vector of <ssp> by a generator of  G corresponding
##	to a matrix of <actions> is a preimage corresponding to  the  product
##	of the vector and the matrix.

	ssp := [ v ]; kernel := [ MinWo ];

	k := 1; while v[k]=field.zero do k:=k+1; od; basis:=[v*v[k]^-1];

	HD := []; bchng := [[]];
	for i in [ 1..Length( actions[1] ) ] do
	    HD[i] := 0; bchng[1][i] := field.zero;
	od;
	HD[k] := 1; bchng[1][1] := v[k];

	i := 1;
	l := 1;

	while i <= l do
	    for j in [ 1..Length( actions ) ] do

		v := actions[j] * ssp[i];

		h := []; for k in [1..Length(v)] do h[k] := field.zero; od;

		for k in [ 1..Length( v ) ] do

		    if v[k] <> field.zero then
			if HD[k] = 0 then
			    l := l + 1;
			    ssp[l] := actions[j] * ssp[i];
			    kernel[l] := kernel[i]^Ggens[j];
			    basis[l] := v*v[k]^-1;
			    HD[k] := l;
			    bchng[l] := h;
			fi;
		    fi;

		    if HD[k] <> 0 then
			h[HD[k]] := v[k]; v := v - v[k] * basis[HD[k]];
		    fi;

		od;
	    od;
	    i := i + 1;
	od;

##	A  basis  <ssp> for the irreducible finite dimensional  F_p[H]-module
##	and preimages for the vectors of <ssp> have been calculated.

	bchng := bchng^-1;
	for i in [ 1..Length( Wimages ) ] do

	    h := Wimages[i]^-1 * ext.generators[i];

	    v := [];
	    for j in [ 1..Length( actions[1] ) ] do
		v[j] := ExponentAgWord( h, Length( Qgens )+j )*field.one;
	    od;

	    h := [];
	    for k in [ 1..Length( actions[1] ) ] do
		h[HD[k]] := v[k]; v := v - v[k] * basis[HD[k]];
	    od;

	    h := h * bchng;

	    for k in [ 1..Length( actions[1] ) ] do
		if h[k] <> field.zero then
		    preimages[i] := preimages[i]*kernel[k]^Int( h[k] );
		fi;
	    od;

	od;

	ssp := ssp^-1;
	for i in [ 1..Length( actions[1] ) ] do
	    word := IdWord;
	    for k in [ 1..Length( actions[1] ) ] do
		if ssp[i][k] <> field.zero then
		    word := word*kernel[k]^Int(ssp[i][k]);
		fi;
	    od;
	    Add( preimages, word );
	od;

	return( preimages );
end;



#############################################################################
##
## NAME
##	"LiftEpimorphismSQ" . . . . . . . . . . . . . . . . . . . . lift an epimorphism
##
## USAGE
##	LiftEpimorphismSQ( <epi>, <Mgrp>, <cocycle> )
##
## DESCRIPTION
##	Let G = < g_1,...,g_n | r_i(g_1,...,g_n) = 1, 1<=i<=m > be a finitely
##	presented group and let H be a finite soluble group given by  an  AG-
##	presentation consisting of generators  h_1, ... , h_k  and  relations
##	s_i( h_1, ... , h_k ) = 1 for 1 <= i <= l. Let
##			    \varepsilon : G \rightarrow H
##	be an epimorphism given by the images
##			\varepsilon(g_i) = w_i( h_1, ... , h_k)
##	for g_i for 1<=i<=n and  words \hat{w}_1, ... , \hat{w}_k, such  that
##	h_i=\varepsilon(\hat{w}_i(g_1,...,g_n)) for 1<=i<=k. Let \tilde{H} be
##	an  extension of  the  group H  by  an irreducible finite dimensional
##	F_p[H]-module,  F_p=Z/pZ  for  some  prime number p.  With these data
##	given, it is a question of solving linear equations to check  whether
##	\varepsilon lifts to an epimorphism
##		\tilde\varepsilon : G \rightarrow \tilde{H},
##	i.e. an epimorphism satisfying \tilde \varepsilon \eta = \varepsilon,
##	where \eta is the natural homomorphism of \tilde{H} onto H.
##
##		Assume an epimorphism <epi> of a finitely presented  group  G
##	onto a finite soluble group H is given. Let <Mgrp> be an  irreducible
##	F_p[H]-module given by matrices over F_p describing the action of the
##	generators h_i and <cocycle> a 2-cocycle giving  rise to an extension
##	\tilde{H} of H by <Mgrp> ( <cocycle> given by
##			s_i(\tilde{h}_1,...,\tilde{h}_k)
##	for 1<=i<=l with \tilde{h}_i a preimage of  h_i  under  \eta ).
##		LiftEpimorphismSQ() checks whether \varepsilon lifts to an  epimorphism
##	\tilde\varepsilon : G \rightarrow \tilde{H}.
##
## RETURNS
##	an epimorphism  \tilde\varepsilon : G \rightarrow \tilde{H}, provided
##	there is such an epimorphism otherwise extdepi() returns \varepsilon.
##
## EXAMPLE
##	S := AbstractGenerator( "S" );;
##	T := AbstractGenerator( "T" );;
##	epi := initepi( rec(
##	    generators := [ S,
##		T ],
##	    relators := [ S^4,
##		T^2,
##		(S*T)^2 ] ) );;
##	Mgrp := rec(
##	    isMatGroup := true,
##	    dimension := 1,
##	    field := GF(2),
##	    generators := [ [ [ Z(2) ] ],
##		[ [ Z(2) ] ] ],
##	    AbsolutelyIrreducible := rec(
##		isMatGroup := true,
##		dimension := 1,
##		field := GF(2),
##		generators := [ [ [ Z(2) ] ],
##		    [ [ Z(2) ] ] ] ) );;
##	cocycle := [ 0*Z(2), Z(2), Z(2) ];;
##	LiftEpimorphismSQ( epi.tor, Mgrp, cocycle );
##	# returns	rec(
##	#		    source := rec(
##	#			generators := [ S,
##	#			    T ],
##	#			relators := [ S^4,
##	#			    T^2,
##	#			    S*T*S*T ] ),
##	#		    image := rec(
##	#			isFpGroup := true,
##	#			generators := [ 1,
##	#			    2,
##	#			    3 ],
##	#			relators := [ 1^2,
##	#			    1^-1*2*1*3^-1*2^-1,
##	#			    1^-1*3*1*3^-1,
##	#			    2^2*3^-1,
##	#			    2^-1*3*2*3^-1,
##	#			    3^2 ],
##	#			order := 8 ),
##	#		    images := [ 2*3,
##	#			1 ],
##	#		    preimages := [ T,
##	#			S^3,
##	#			S^2 ] )
##
## FILES
##	LIBNAME/epimorph.g
##
## SEE ALSO
##	"modules", "cobounds", "cocycles"
##
LiftEpimorphismSQ := function ( epi, M, cocycle )
	local	gg, ggens	,	#	generator(s) of <G>
		hg, hgens	,	#	generator(s) of <H>
		gr, grels	,	#	relation (s) of <G>
		hr, hrels	,	#	relation (s) of <H>

		K, E, Q,	#	field(s)

		e	,
		n	,
		z	,

		BASIS	,	#	basis of E/K

		sol	,
		hom	,
		hlp	,
		pol	,

		rls,  v, heads, rnull,	#	linear system(s)
		sls, HD, NrEqu, snull,	#	linear system(s)

		i, j, k, l, next, word, EQU, c, equ, zero, one, matrix,

		record, RES,	#	result(s) of functions

		sqg, ext,	#	extension of <H>

		eimage	,	#	images in the extension
		mimage	,	#	images in the matrixgrp

		images		,	#	images in the generator(s)
		preimages	;	#	generator(s) in the images

	ggens := epi.source.generators;
	grels := epi.source.relators ;

	hgens := epi.image.generators;
	hrels := epi.image.relators ;

	K := M.field; E := M.absolutelyIrreducible.field;

	if E <> K then

	    Q := E/K; z := Q.root; pol := MinPol( z );

	    BASIS := []; n := -(pol[1])^-1;
	    for i in [ Q.degree, Q.degree-1 .. 1 ] do
	      hlp := [];
	      for k in [ 1..Q.degree ] do
		Add( hlp, Q.one * Coefficients( Q, n * z^i * Q.base[k] )[1] );
	      od;
	      Add( BASIS, hlp );
	    od;

	fi;

	if IsVector( cocycle ) then
	  if E <> K then

	    hlp := [];
	    for i in [ 1..Length( cocycle ) ] do
	      for k in [ 1..Length( Q.base ) ] do
		Add( hlp, Coefficients( Q, cocycle[i] * Q.base[k] )[1] );
	      od;
	    od;
	    cocycle := hlp;

	  fi;
	fi;

	sqg := ExtensionSQ( epi.image, M, cocycle );

	ext := AgGroupFpGroup( sqg );	#	build the soluble group

	images	  := ShallowCopy( epi.images    );
	preimages := ShallowCopy( epi.preimages );

	eimage := []; mimage := [];
	for i in [ 1..Length( images ) ] do

            # ALICE!
            eimage[i] := MappedWord( images[i],
                                 sqg.generators,
                                                ext.generators );
            mimage[i] := TransposedMat( MappedWord( images[i],
                                 epi.image.generators,
                                     M.absolutelyIrreducible.generators ) );
	od;

	zero := NullMat( M.absolutelyIrreducible.dimension, M.absolutelyIrreducible.dimension, E );
	one  := IdentityMat( M.absolutelyIrreducible.dimension, E );

##	Let \tilde{g}_i := w_i(\tilde{h}_1,...,\tilde{h}_k) for 1<=i<=n. Then
##	the equations (*) r_i(\tilde{g}_1m_1,...,\tilde{g}_nm_n)=1  (1<=i<=m)
##	for (m_1,...,m_n) in M^n  are  F_p-linear  equations for the  coordi-
##	nates of the m_i in the implicitly given F_p-basis  of M. \varepsilon
##	lifts to a homomorphism if and only if (*) is soluble. In this case
##	all possible lifts \tilde\varepsilon are given by 
##			\tilde\varepsilon(g_i)=\tilde{g}_im_i
##	where (m_1,...,m_n) runs through the set S(*) of solutions of (*).

	v := []; rls := []; hom := true;

	for i in [ 1..Length(  grels ) ] do

	    EQU := [];
	    for j in [ 1..Length( ggens ) ] do
		EQU[j] := zero;
	    od;

	    gr := grels[i]; word := ext.identity; matrix := one;

	    for j in [ LengthWord(gr), LengthWord(gr)-1 .. 1 ] do
		k := 1;
		gg := Subword( gr, j, j );
		while		(gg   <>ggens[k])
			and	(gg^-1<>ggens[k]) do
			k := k+1;
		od;
		if gg = ggens[k] then
		    word := eimage[k] * word;
		    EQU[k] := EQU[k] + matrix;
		    matrix := matrix * mimage[k];
		else
		    word := eimage[k]^-1 * word;
		    matrix := matrix * mimage[k]^-1;
		    EQU[k] := EQU[k] - matrix;
		fi;
	    od;

	    if word <> ext.identity then hom := false; fi;

	    if E = K then
	      l := Length( hgens );
	      for j in [ l+1..l+M.dimension ] do
		Add( v, -ExponentAgWord( word, j ) * K.one );
	      od;
	    else
	      l := Length( hgens );
	      for j in [ 1..M.absolutelyIrreducible.dimension ] do

		hlp := [];
		for k in [ 1..Q.degree ] do
		  l := l + 1; Add( hlp, ExponentAgWord( word, l ) * Q.one );
		od;

		e := E.zero; next := Q.degree;
		for k in [ 1..Q.degree ] do
		  if hlp[k] <> 0 then
		    e := e+Int(hlp[k])*n*z^next; hlp := hlp-hlp[k]*BASIS[k];
		  fi;
		  next := next-1;
		od;

		Add( v, -e );

	      od;
	    fi;

	    Add( rls, EQU );

	od;

	rls := convertSQ( rls );

	record := gaussSQ( rls, v );

	heads := record.head;
	rnull := record.null;

    if IsVector( cocycle ) then

#	InfoSQ2( "\t\t\t  non split extension" );

# InfoSQ2( "\n" );

##	In case <cocycle> does not split \tilde\varepsilon is an epimorphism.

	if hom then
	    if rnull = [] then
		sol := 0*rls[1];
	    else
		sol := rnull[1];
	    fi;
	else

	    sol:=[]; for k in [1..Length(rls[1])] do sol[k]:=0; od;

	    for j in [ Length(rls), Length(rls)-1 .. 1 ] do
		if IsBound( heads[j] ) then

		    l := heads[j]; sol[l] := v[j];
		    for k in [ l+1..Length( rls[1] ) ] do
			sol[l] := sol[l] - rls[j][k] * sol[k];
		    od;

		else

		    if v[j] <> E.zero then
			return( epi );
		    fi;

		fi;
	    od;

	fi;
    else

#	InfoSQ2( "\t\t\t  ... split extension\n" );

	if Length( rnull ) = 0 then
	    return(  epi  );
	else

##	In case <cocycle> splits non-surjective lifts \tilde\varepsilon arise
##	( the ones whose images are complements of M in  \tilde{H} ). (*)  is
##	now a homogeneous set of equations and the non-surjective lifts  come
##	from the solutions of the homogeneous F_p-linear equations (**) :
##
##	s_i(\hat{w}_1(\tilde{g}_1m_1,...,\tilde{g}_nm_n),
##		...,\hat{w}_k(\tilde{g}_1m_1,...,\tilde{g}_nm_n))=1   1<=i<=l
##
##	\tilde{g}_jm_j=w_j(\hat{w}_1(\tilde{g}_1m_1,...,\tilde{g}_nm_n),
##		...,\hat{w}_k(\tilde{g}_1m_1,...,\tilde{g}_nm_n))     1<=j<=n
##
##	for (m_1,...,m_n) in S(*). Denote the space of solutions of  (**)  by
##	S(**). One has  S(**)<=S(*) and  \varepsilon can be lifted to an epi-
##	morphism \tilde\varepsilon if and only if S(**)<>S(*).

	    sls := [];

	    HD := [];
	    for i in [ 1..Length( ggens ) * M.absolutelyIrreducible.dimension ] do
		HD[i] := 0;
	    od;

	    NrEqu := 0;

	    for i in [ 1..Length( hrels ) ] do

		EQU := [];
		for j in [ 1..Length( ggens ) ] do
		    EQU[j] := zero;
		od;

		matrix := one; hr := hrels[i];

		for j in [ LengthWord(hrels[i]), LengthWord(hrels[i])-1 .. 1 ] do

		    hg := Subword( hr, j, j );

		    k := 1;
		    while	(hg   <>hgens[k])
			and	(hg^-1<>hgens[k]) do
			k:= k + 1;
		    od;
		    if hg = hgens[k] then
			gr := preimages[k]   ;
		    else
			gr := preimages[k]^-1;
		    fi;

		    for l in [ LengthWord(gr), LengthWord(gr)-1 .. 1 ] do

			gg := Subword( gr, l, l );

			k := 1;
			while		(gg   <>ggens[k])
				and	(gg^-1<>ggens[k]) do
				k := k + 1;
			od;
			if gg = ggens[k] then
			    EQU[k] := EQU[k] + matrix      ;
			    matrix := matrix * mimage[k]   ;
			else
			    matrix := matrix * mimage[k]^-1;
			    EQU[k] := EQU[k] - matrix      ;
			fi;

		    od;

		od;

		EQU := convertSQ( [EQU] );
		for k in [ 1..Length( EQU ) ] do
		    equ := EQU[k];
		    for l in [ 1..Length( equ ) ] do
			c := equ[l];
			if c <> K.zero then
			    if HD[l] = 0 then
				NrEqu := NrEqu+1;
				HD[l] := NrEqu;
				sls[NrEqu] := c^-1*equ;
			    fi;
			    equ := equ - c * sls[ HD[l] ] ;
			fi;       
		    od;
		od;

	    od;

	    for i in [ 1..Length( images ) ] do

		EQU := [];
		for j in [ 1..Length( ggens ) ] do
		    EQU[j] := zero;
		od;

		matrix:=mimage[i]^-1; EQU[i]:=zero-matrix; hr:=images[i];

		for j in [ LengthWord(images[i]), LengthWord(images[i])-1 .. 1 ]  do

		    hg := Subword( hr, j, j );

		    k := 1;
		    while	(hg   <>hgens[k])
			and	(hg^-1<>hgens[k]) do
			k:= k + 1;
		    od;
		    if hg = hgens[k] then
			gr := preimages[k]   ;
		    else
			gr := preimages[k]^-1;
		    fi;

		    for l in [ LengthWord(gr), LengthWord(gr)-1 .. 1 ] do

			gg := Subword( gr, l, l );

			k := 1;
			while		(gg   <>ggens[k])
				and	(gg^-1<>ggens[k]) do
				k := k + 1;
			od;
			if gg = ggens[k] then
			    EQU[k] := EQU[k] + matrix      ;
			    matrix := matrix * mimage[k]   ;
			else
			    matrix := matrix * mimage[k]^-1;
			    EQU[k] := EQU[k] - matrix      ;
			fi;

		    od;

		od;

		EQU := convertSQ( [EQU] );
		for k in [ 1..Length( EQU ) ] do
		    equ := EQU[k];
		    for l in [ 1..Length( equ ) ] do
			c := equ[l];
			if c <> K.zero then
			    if HD[l] = 0 then
				NrEqu := NrEqu+1;
				HD[l] := NrEqu;
				sls[NrEqu] := c^-1*equ;
			    fi;
			    equ := equ - c * sls[ HD[l] ] ;
			fi;       
		    od;
		od;

	    od;

	    if sls <> [] then
		snull := [];
		for i in [ Length(HD), Length(HD)-1 .. 1 ] do
		    if HD[i] = 0 then
			hlp := [];
			for j in [ Length(HD), Length(HD)-1 .. 1 ] do
			    if i = j then
				hlp[j] := E.one;
			    elif HD[j] = 0 then
				hlp[j] := E.zero;
			    else
				hlp[j] := E.zero;
				for k in [ j+1..Length( HD ) ] do
				    hlp[j] := hlp[j]-sls[HD[j]][k]*hlp[k];
				od;
			    fi;
			od;
			Add( snull, hlp );
		    fi;
		od;
		if snull <> [] then
		    rnull := QuotientSpaceSQ( rnull, snull );
		fi;
		if rnull = [] then
		    return( epi );
		else
		    sol := rnull[1];
		fi;
	    else
		return( epi );
	    fi;
	fi;

    fi;

	if E = K then

	    l := Length( hgens );

	    next := 1;
	    for i in [ 1..Length( images ) ] do
		for j in [ 1..M.dimension ] do
		    images[i] := images[i]*sqg.generators[l+j]^Int(sol[next]);
		    eimage[i] := eimage[i]*ext.generators[l+j]^Int(sol[next]);
		    next := next + 1;
		od;
	    od;

	else

	    mimage := [];
	    for i in [ 1..Length( images ) ] do
                mimage[i] := TransposedMat( MappedWord( images[i],
                                     epi.image.generators, M.generators ) );
	    od;

	    next := 1;
	    for i in [ 1..Length( images ) ] do
		l := Length( hgens );
		for j in [ 1..M.absolutelyIrreducible.dimension ] do
		    for k in [ 1..Q.degree ] do
			l := l + 1;
			hlp := Coefficients( Q, sol[next]*Q.base[k] )[1];
			images[i] := images[i]*sqg.generators[l]^Int(hlp);
			eimage[i] := eimage[i]*ext.generators[l]^Int(hlp);
		    od;
		    next := next + 1;
		od;    
	    od;

	fi;

	sqg.size := Product( List( [ 1..Length( ext.generators ) ],
		i -> RelativeOrder( ext.generators[i] ) ) );

	RES := rec(
		  source := epi.source,
		  image := sqg,
		  images := images,
		  preimages := MakePreImagesSQ( epi, ext, eimage, mimage ),
                  operations := SQOps );
	return RES;
end;
