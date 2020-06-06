#############################################################################
##
#A  agwords.g                   GAP library                      Frank Celler
##
#A  @(#)$Id: agwords.g,v 3.31 1994/01/12 08:55:28 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains all functions dealing with agwords.
##
#H  $Log: agwords.g,v $
#H  Revision 3.31  1994/01/12  08:55:28  sam
#H  fixed 'ExtraspecialGroup' again
#H
#H  Revision 3.30  1993/09/20  15:47:15  fceller
#H  added 'MappedAgWord'
#H
#H  Revision 3.29  1993/07/16  07:19:39  sam
#H  fixed 'ExtraspecialGroup
#H
#H  Revision 3.29  1993/07/16  07:19:39  sam
#H  fixed 'ExtraspecialGroup
#H
#H  Revision 3.28  1993/05/23  13:01:40  sam
#H  added 'AgWordsOps.ExtraspecialGroup'
#H
#H  Revision 3.26  1993/01/04  11:18:16  fceller
#H  changed 'DepthAgWord'
#H
#H  Revision 3.25  1992/12/16  19:47:27  martin
#H  replaced quoted record names with escaped ones
#H
#H  Revision 3.24  1992/05/08  09:38:56  fceller
#H  added dihedral, symmetric and alternating ag groups
#H
#H  Revision 3.23  1992/02/21  17:07:00  hbesche
#H  renamed 'Word' to 'AbstractGenerator'
#H
#H  Revision 3.22  1992/02/07  18:11:40  fceller
#H  Initial GAP 3.1 release.
#H
#H  Revision 3.1  1991/05/05  11:52:40  fceller
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

#F  WordList( <n>, <str> )  . . . . . . . construct <n> abstract words, local
##
WordList := function( n, str )
    local   w;

    if n = 1  then
    	w := [ AbstractGenerator( str ) ];
    else
    	w := List( [1 .. n], x -> 
    	           AbstractGenerator(ConcatenationString(str, String(x))) );
    fi;
    return w;

end;    


#############################################################################
##
#F  LetterInt( <n> )  . . . . . . . . . . . . . . .  integer to letter, local
##
LetterInt := function( n )
    local   letters, str, x, d;

    letters := [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                 "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
                 "u", "v", "w", "x", "y", "z" ];

    # Check the argument.  If <n> is small enough to be an index to <letters>
    # return that letter.
    if n < 1  then
        Error( "number must be positive" );
    elif n <= Length( letters )  then
        return letters[ n ];
    fi;

    # Divide n by 'Length( <letter> )' until we reached 0.
    str := "";
    n   := n - 1;
    d   := 1;
    repeat
        x   := n mod Length( letters ) + d;
        str := ConcatenationString( letters[ x ], str );
        n   := QuoInt( n, Length( letters ) );
        if n < 26  then d := 0;  fi;
    until n < 1;
    return str;

end;


#############################################################################
##

#F  AgWords . . . . . . . . . . . . . . . . . . . . . . . . .  ag word domain
#F  AgWordsOps  . . . . . . . . . . . . . . . . . . . . .  ag word oeprations
##
AgWords            := rec();

AgWords.isDomain   := true;
AgWords.name       := "AgWords";
AgWords.isFinite   := false;
AgWords.size       := "infinity";

AgWords.operations := Copy( GroupElementsOps );
AgWordsOps         := AgWords.operations;
AgWordsOps.\in    := function( g, AgWords ) return IsAgWord( g ); end;


#############################################################################
##
#F  AgWordsOps.Group( <D>, <gens>, <id> ) . . . . . . . create a parent group
##
AgWordsOps.Group := function( D, gens, id )
    local   G,  U;

    G := rec();
    G.isDomain   := true;
    G.isGroup    := true;
    G.isAgGroup  := true;
    G.generators := InformationAgWord( id ).generators;
    G.identity   := id;
    G.cgs        := G.generators;
    G.operations := AgGroupOps;
    U := Subgroup( G, gens );
    if U <> G  then
        return G.operations.Group( U );
    else
        if id in gens  then
            G.generators := Filtered( gens, x -> x <> id );
    	else
            G.generators := ShallowCopy( gens );
    	fi;
    	G.bijection := IdentityMapping( G );
    	return G;
     fi;

end;



#############################################################################
##
#F  AgWordsOps.AbelianGroup( <D>, <ords> )  . . . . . . . . . . abelian group
##
AgWordsOps.AbelianGroup := function( D, ords )
    local   i,  C,  F;

    # Use 'CyclicGroup' and 'LetterInt'.
    F := rec( generators := [], relators := [] );
    for i  in [ 1 .. Length( ords ) ]  do
       C := FpGroup( D.operations.CyclicGroup( D,ords[i], LetterInt(i) ) );
       Append( F.generators, C.generators );
       Append( F.relators,  C.relators );
    od;
    return AgGroupFpGroup( F );

end;


#############################################################################
##
#F  AgWordsOps.CyclicGroup( <D>, <n> )  . . . . . . . . . . . .  cyclic group
##
AgWordsOps.CyclicGroup := function( arg )
    local   n,  name,  pi,  F,  i;

    # Catch a rather hypothetical case <order> = 1. (Thanx HU)
    n := arg[ 2 ];
    if n = 1  then
       return AgGroupFpGroup( rec( generators := [], relators := [] ) );
    fi;

    # Make the new abstract generators.
    pi := Factors( n );
    F  := rec( relators := [] );
    if Length( arg ) = 3  then
        name := arg[ 3 ];
    elif Length( pi ) > 1  then
        name := ConcatenationString( "c", String( n ), "_" );
    else
        name := ConcatenationString( "c", String( n ) );
    fi;
    F.generators := WordList( Length( pi ), name );

    # We have only power relators.  'AgGroupFpGroup' adds commutators.
    for i  in [ 1 .. Length( pi ) - 1 ]  do
        Add( F.relators, F.generators[i]^pi[i] / F.generators[i+1] );
    od;
    Add( F.relators, F.generators[ Length(pi) ] ^ pi[ Length(pi) ] );
    return AgGroupFpGroup( F );

end;


#############################################################################
##
#F  AgWordsOps.DihedralGroup( <D>, <n> )  . . . . . . . . . .  dihedral group
##
AgWordsOps.DihedralGroup := function( AgWords, n )
    local   F,  d,  s;

    d := AbstractGenerator( "d" );
    s := AbstractGenerator( "s" );
    F := AgFpGroup( rec( generators := [s,d],
    	    	    	 relators   := [s^2,d^(n/2),d^s*d] ) );
    F.isGroup := true;
    F.isAgGroup := true;
    F.operations := AgGroupOps;
    return RefinedAgSeries(F);

end;


#############################################################################
##
#F  AgWordsOps.ElementaryAbelianGroup( <D>, <n> )  elementary abelian aggroup
##
AgWordsOps.ElementaryAbelianGroup := function( arg )
    local   n,  name,  p,  e,  F,  i;

    # Catch a rather hypothetical case <n> = 1. (Thanx HU)
    n := arg[ 2 ];
    if n = 1  then
       return AgGroupFpGroup( rec( generators := [], relators := [] ) );
    fi;

    # Make the new abstract generators.
    p := Factors( n );
    e := Length( p );
    p := p[ 1 ];
    F := rec( relators := [] );

    # Construct nice names.
    if Length( arg ) = 3  then
        name := arg[ 3 ];
    elif e > 1  then
        name := ConcatenationString( "m", String( n ), "_" );
    else
        name := ConcatenationString( "m", String( n ) );
    fi;
    F.generators := WordList( e, name );

    # We have only power relators.  'AgGroupFpGroup' will add commutators.
    F.relators := List( F.generators, x -> x ^ p );
    return AgGroupFpGroup( F );

end;


############################################################################
##
#F  AgWordsOps.ExtraspecialGroup( <D>, <order>, <exponent> )
##
AgWordsOps.ExtraspecialGroup := function( arg )

    local i,        # loop variable
          p,        # divisor of group order
          n,        # the group has order 'p'^(2*'n'+1)
          exponent, # exponent of the group, or symbols '+', '-'
          eps1,     # constant to distinguish odd and even 'p'
          eps2,     # constant to distinguish odd and even 'p'
          name,     # name of generators (default is "e")
          z,        # central element
          e;        # the group, result

    p:= Factors( arg[2] );
    exponent:= arg[3];

    if    Length( p ) = 1
       or Length( p ) mod 2 <> 1
       or Length( Set( p ) ) <> 1 then
      Error( "order of an extraspecial group is",
             " a nonprime odd power of a prime" );
    fi;

    n:= ( Length( p ) - 1 ) / 2;
    p:= p[1];

    # determine the required type of the group    

    if p = 2 then

      if n = 1 then
        eps1:= 1;
      else
        eps1:= 0;
      fi;

      if   exponent = '+' or exponent = "+" then
        # central product of 'n' dihedral groups of order 8
        eps2:= 0;
      elif exponent = '-' or exponent = "-" then
        # central product of 'n'-1 dihedral groups and a quaternionic group
        eps2:= 1;
      else
        Error( "<exponent> must be '+', '-', \"+\", or \"-\"" );
      fi;

    else

      if   exponent = p   or exponent = '+' or exponent = "+" then
        eps1:= 0;
      elif exponent = p^2 or exponent = '-' or exponent = "-" then
        eps1:= 1;
      else
        Error( "<exponent> must be <p>, <p>^2, '+', '-', \"+\", or \"-\"" );
      fi;
      eps2:= 0;
    fi;

    # Construct nice names.
    if Length( arg ) = 4 then
      name:= arg[4];
    else
      name:= "e";
    fi;

    e:= rec( generators := WordList( 2*n+1, name ) );
    z:= e.generators[ 2*n+1 ];

    # power relators
    e.relators:= [ e.generators[1]^p / z^eps1 ];
    for i in [ 2 .. 2*n-2 ] do
      Add( e.relators, e.generators[i]^p );
    od;
    if n > 1 then
      Add( e.relators, e.generators[ 2*n-1 ]^p / z^eps2 );
    fi;
    Add( e.relators, e.generators[  2*n  ]^p / z^eps2 );
    Add( e.relators, z^p );

    # nontrivial commutator relators
    for i in [ 1 .. n ] do
      Add( e.relators,
           Comm( e.generators[ 2*i-1 ], e.generators[ 2*i ] ) / z );
    od;

    # return the Ag group
    return AgGroupFpGroup( e );

    end;


#############################################################################
##
#F  AgWordsOps.SymmetricGroup( <D>, <n> ) . . . . . . . . . . symmetric group
##
AgWordsOps.SymmetricGroup := function( AgWords, n )

    if n > 4  then
    	Error( "<n> must be less than 5 for ", AgWords );
    fi;
    return AgGroup( SymmetricGroup( Permutations, n ) );

end;


#############################################################################
##
#F  AgWords.AlternatingGroup( <D>, <n> )  . . . . . . . . . alternating group
##
AgWordsOps.AlternatingGroup := function( AgWords, n )

    if n > 4  then
    	Error( "<n> must be less than 5 for ", AgWords );
    fi;
    return AgGroup( AlternatingGroup( Permutations, n ) );

end;


#############################################################################
##
#F  AgWordsOps.String( <D>, <g> )   . . . . .  convert an ag word to a string
##
AgWordsOps.String := function( D, g )
    local   i,  str,  names,  exps,  sparse;

    # There is no good way to print the identity,  so we use "IdAgWord".
    if g = g^0  then
        return "IdAgWord";
    fi;

    # Use  the  names returned by 'InformationAgWord' to construct the string
    # of  the  given  <g>.  'ExponentsAgWord'  yields the exponent vector for
    # these generators.
    names  := InformationAgWord( g ).names;
    str    := "";
    exps   := ExponentsAgWord( g );
    sparse := [];
    for i  in [ 1 .. Length( exps ) ]  do
        if exps[ i ] <> 0  then
            Add( sparse, [ i, exps[ i ] ] );
        fi;
    od;
    for i  in [ 1 .. Length( sparse ) ]  do
        if i > 1  then
            str := ConcatenationString( str, "*" );
        fi;
        str := ConcatenationString( str, names[ sparse[ i ][ 1 ] ] );
        if sparse[ i ][ 2 ] > 1  then
            str := ConcatenationString( str, "^", StringInt(sparse[i][2]) );
        fi;
    od;
    return str;

end;


#############################################################################
##
#F  AgWordsOps.Order( <D>, <g> )  . . . . . . . . . . . . . . .  order of <g>
##
AgWordsOps.Order := function( D, g )
    local   ord, id;

    # Raise <g> to n.th power, where n is the relative order of <g>.
    ord := 1;
    id  := g ^ 0;
    while g <> id  do
        ord := ord * RelativeOrderAgWord( g );
        g   := g ^ RelativeOrderAgWord( g );
    od;

    return ord;

end;


#############################################################################
##
#F  AgWordsOps.AsGroup( <L> ) . . . . . . . . . . . convert set into ag group
##
AgWordsOps.AsGroup := function( D )
    local   G,  S;

    D := Set( D );
    S := Group( InformationAgWord( D[1] ).generators, D[1]^0 );
    G := MergedCgs( S, D );
    if Size( G ) <> Size( D )  then
	Error( "the elements of <D> must form a group" );
    fi;
    return G;

end;


#############################################################################
##

#F  CanonicalAgWord( <U>, <u> ) . . . . . .  makes a canonical representative
##
CanonicalAgWord := function( U, u )
    local   x, y, i, first, d, e;

    if not IsBound( U.shiftInfo )  then
        U.operations.AddShiftInfo( U );
    fi;
    if U.shiftInfo.method = 7  then
        return u;
    elif U.shiftInfo.method = 4  then
        return U.identity;
    elif U.shiftInfo.method = 5  then
        first := U.shiftInfo.first;
        if TailDepthAgWord( u ) < first  then
            return u;
        else
            x := ExponentsAgWord( u, 1, first - 1 );
            y := U.parent.cgs;
            u := U.identity;
            for i  in [ 1 .. Length( x ) ]  do
                if x[ i ] > 0  then
                    u := u * y[ i ] ^ x[ i ];
                fi;
            od;
            return u;
        fi;
    elif U.shiftInfo.method = 6  then
        if not IsBound( U.igs )  then
            y := U.cgs;
            for x  in y  do
                d := DepthAgWord( x );
                e := ExponentAgWord( u, d );
                if e > 0  then
                    u := u / x ^ e;
                fi;
            od;
            return u;
        else
            y := U.igs;
            for x  in y  do
                d := DepthAgWord( x );
                e := ExponentAgWord( u, d );
                if e > 0  then
                    e := LeadingExponentAgWord( x ) / e
                         mod RelativeOrderAgWord( x );
                    u := u / x ^ e;
                fi;
            od;
            return u;
        fi;
    else
        Error( "factor arguments are not allowed" );
    fi;
end;


#############################################################################
##
#F  CentralWeight( <g> )  . . . . . . . . . . . . . . . central weight of <g>
##
##  This may become a dispatcher, but until now ...
##
CentralWeight := CentralWeightAgWord;


#############################################################################
##
#F  CompositionLength( <g> )  . . . . . .  composition length of the agseries
##
CompositionLength := function( g )

    if IsRec( g ) and IsBound( g.operations.CompositionLength )  then
    	return g.operations.CompositionLength( g );
    else
        return Domain( [g] ).operations.CompositionLength( g );
    fi;

end;

AgWordsOps.CompositionLength := function( g )
    return Length( InformationAgWord( g ).generators ) + 1;
end;


#############################################################################
##
#F  Depth( <g> )  . . . . . . . . . . . . . . . . . . . . . . .  depth of <g>
##
##  This may become a dispatcher, but until now ...
##
Depth := DepthAgWord;


#############################################################################
##
#F  LeadingExponent( <g> )  . . . . . . . . . . . . . leading exponent of <g>
##
##  This may become a dispatcher, but until now ...
##
LeadingExponent := LeadingExponentAgWord;


#############################################################################
##
#F  MappedAgWord( <g>, <l> )  . . . . . . . . . . . . . . . .  map an ag word
##
MappedAgWord := function( g, l )
    local   e,  r,  i;

    # get exponents of <g>
    e := ExponentsAgWord(g);

    # check that <l> has the correct length
    if Length(e) <> Length(l)  then
        Error( "incorrect number of images" );
    fi;

    # map word <g>
    r := l[1]^0;
    for i  in [ 1 .. Length(e) ]  do
        if e[i] <> 0  then
            r := r * l[i]^e[i];
        fi;
    od;

    # and return
    return r;

end;


#############################################################################
##
#F  RelativeOrder( <g>, <n> ) . . . . . . . . . . . . . relative order of <g>
##
##  This may become a dispatcher, but until now ...
##
RelativeOrder := RelativeOrderAgWord;


#############################################################################
##

#F  FactorGroupAgWord( <G>, <N>, <r> )  . . . . . .  factor agword in <G>/<N>
##
FactorGroupAgWord := function( G, N, r )
    local   factor,  depths,  info,  i;

    factor := FactorArg( G, N );
    depths := List( factor.generators, DepthAgWord );

    # Setup the agword infomation record.
    info := rec();
    info.kernel := N;
    info.group  := G;
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

    # Construct the new agwords.
    return info.canonical( info, r );

end;


#############################################################################
##
#V  FactorGroupAgWordOps  . . . . . .  factor group element operations record
##
FactorGroupAgWordOps := ShallowCopy( AgWordsOps );

# The representative are canonical, so we can compare them.
FactorGroupAgWordOps.\= := function( g, h )
    if g.info <> h.info  then
    	return false;
    else
    	return g.representative = h.representative;
    fi;
end;

FactorGroupAgWordOps.\< := function( g, h )
    return g.representative < h.representative;
end;

# The binary operators must canonicalize their results.
FactorGroupAgWordOps.\* := function( g, h )
    if g.info <> h.info  then
	Error( "*: operation not defined" );
    elif IsList( g )  then
        List( g, x -> x * h );
    else
        return g.info.canonical( g.info,
    	    	    	    	 g.representative
    	    	    	    	 * h.representative );
    fi;
end;

FactorGroupAgWordOps.\/ := function( g, h )
    if IsList( g )  then
	return List( g, x -> x / h );
    elif g.info <> h.info  then
	Error( "/: operation not defined" );
    else
        return g.info.canonical( g.info,
    	    	    	    	 g.representative
    	    	    	    	 / h.representative );
    fi;
end;

FactorGroupAgWordOps.\mod := function( g, h )
    if g.info <> h.info  then
	Error( "LeftQuotient: operation not defined" );
    fi;
    return g.info.canonical( g.info,
    	    	    	     g.representative
    	    	    	     mod h.representative );
end;

FactorGroupAgWordOps.Comm := function( g, h )
    if g.info <> h.info  then
	Error( "Comm: operation not defined" );
    fi;
        return g.info.canonical( g.info,
    	    	    	    	 Comm( g.representative,
    	    	    	    	       h.representative ) );
end;

FactorGroupAgWordOps.\^ := function( g, h )
    if IsInt( h ) or not IsRec( h )  then
        return g.info.canonical( g.info,
    	    	    	    	 g.representative ^ h );
    elif not IsRec( g )  then
        return g ^ h.representative;
    elif g.info <> h.info  then
	Error( "^: operation not defined" );
    else
        return g.info.canonical( g.info,
    	    	    	    	 g.representative
    	    	    	    	 ^ h.representative );
    fi;
end;


#############################################################################
##
#F  FactorGroupAgWordOps.Print  . . . . . . . . . . .  print a factor element
##
FactorGroupAgWordOps.Print := function( g )
    Print( "FactorGroupAgWord( ", g.info.group, ", ", 
	   g.info.kernel, ", ", g.representative, " )" );
end;


#############################################################################
##
#F  FactorGroupAgWordOps.Depth( <g> ) . . . . . . . . . . . . .  depth of <g>
##
FactorGroupAgWordOps.Depth := function( g )
    if g.representative = g.info.kernel.identity  then
        return Length(g.info.factor.generators)+1;
    else
        return g.info.depths[ DepthAgWord( g.representative ) ];
    fi;
end;


#############################################################################
##
#F  FactorGroupAgWordOps.ExponentsAgWord( <g> ) . . . . . .  exponents of <g>
##
FactorGroupAgWordOps.ExponentsAgWord := function( arg )
    local   l;

    l := Exponents( arg[1].info.factor, arg[1].representative );
    if Length( arg ) = 1  then
        return l;
    elif Length( arg ) = 3  then
        return Sublist( l, [ arg[2] .. arg[3] ] );
    else
        return Sublist( l, [ arg[2] .. arg[3] ] ) * arg[4]^0;
    fi;
end;


#############################################################################
##
#F  FactorGroupAgWordOps.ExponentAgWord( <g>, <i> ) . . . . <i>.th exp of <g>
##
FactorGroupAgWordOps.ExponentAgWord := function( g, i )
    return Exponents( g.info.factor, g.representative )[ i ];
end;


#############################################################################
##
#F  FactorGroupAgWordOps.LeadingExponent( <g> ) . . . . .  leading exp of <g>
##
FactorGroupAgWordOps.LeadingExponent := function( g )
    return LeadingExponentAgWord( g.representative );
end;


#############################################################################
##
#F  FactorGroupAgWordOps.ReducedAgWord( <g>, <h> )  . . .  reduce <g> and <h>
##
FactorGroupAgWordOps.ReducedAgWord := function( g, h )
    return g.info.canonical( g.info,
       	    	    	     ReducedAgWord( g.representative,
    	    	    	    	    	    h.representative ) );
end;


#############################################################################
##
#F  FactorGroupAgWordOps.RelativeOrder( <g> ) . . . . . relative order of <g>
##
FactorGroupAgWordOps.RelativeOrder := function( g )
    return RelativeOrderAgWord( g.representative );
end;


#############################################################################
##
#F  FactorGroupAgWordOps.IsAgWord( <g> )  . . . . . . . . . . . . . . . . yes
##
FactorGroupAgWordOps.IsAgWord := g -> true;


#############################################################################
##
#F  FactorGroupAgWordOps.String( <g> )  . . . . . . . . . . . . . . . . weird
##
FactorGroupAgWordOps.String := function( g )
    return String( g.representative );
end;


#############################################################################
##
#F  FactorGroupAgWordOps.InformationAgWord( <g> ) . . . . . . . . . see above
##
FactorGroupAgWordOps.InformationAgWord := function( g )
    local   res,  fac,  h,  r;

    res := InformationAgWord( g.representative );
    res.generators := [];
    for h  in g.info.factor.generators  do
        r := ShallowCopy( g );
    	r.representative := h;
    	Add( res.generators, r );
    od;
    r := ShallowCopy( g );
    r.representative := g.info.factor.identity;
    res.identity := r;
    res.names    := List( res.generators, FactorGroupAgWordOps.String );
    return res;

end;


#############################################################################
##
#F  FactorGroupAgWordOps.IsCompatibleAgWord( <g>, <h> )	. . <g> * <h> allowed
##
FactorGroupAgWordOps.IsCompatibleAgWord := function( g, h )

    return     IsAgWord( g ) 
           and IsFactorGroupElement( g )
           and IsAgWord( h ) 
           and IsFactorGroupElement( h ) 
           and g.info = h.info;

end;


#############################################################################
##
#F  FactorGroupAgWordOps.NormalizeIgs( <igs> )	. . . . .  normalize an <igs>
##
FactorGroupAgWordOps.NormalizeIgs := function( igs )
    local   i,  j,  exp;

    # Normalize leading exponent to one.
    for i  in [ 1 .. Length( igs ) ]  do
        igs[ i ] := igs[ i ] ^ ( 1 / LeadingExponentAgWord( igs[ i ] )
                                  mod RelativeOrderAgWord( igs[ i ] ) );
    od;

    # Make zeros above the diagonale.
    for i  in [ 1 .. Length( igs ) - 1 ]  do
        for j  in [ i + 1 .. Length( igs ) ]  do
            exp := ExponentAgWord( igs[ i ], DepthAgWord( igs[ j ] ) );
            if exp <> 0  then
                exp := RelativeOrderAgWord( igs[ j ] ) - exp;
                igs[ i ] := igs[ i ] * igs[ j ] ^ exp;
            fi;
        od;
    od;

end;
