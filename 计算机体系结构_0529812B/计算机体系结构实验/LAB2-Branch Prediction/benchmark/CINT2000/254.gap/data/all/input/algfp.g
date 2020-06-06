#############################################################################
##
#A  algfp.g                     GAP library                     Thomas Breuer
##
#A  @(#)$Id: algfp.g,v 3.2 1994/06/10 02:42:38 sam Rel $
##
#Y  Copyright 1994-1995,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the functions dealing with finitely presented algebras
##
#H  $Log: algfp.g,v $
#H  Revision 3.2  1994/06/10  02:42:38  sam
#H  fixed 'MappedExpression' and two times 'UnitalAlgebra'
#H
#H  Revision 3.1  1994/05/26  12:47:12  sam
#H  fixed 'Coefficients'
#H
#H  Revision 3.0  1994/05/19  13:17:26  sam
#H  Initial Revision under RCS
#H
##

##
#T  TODO:
#T  At the moment it is allowed (but not documented) to invert f.p. algebra
#T  elements consisting of one summand only.
#T  This is useful for the application in the {\MeatAxe} (for remembering
#T  the origin of a matrix) and also for {\VE} if the preimages component
#T  contains inverses.
#T  Shall it be forbidden?
##

#############################################################################
##
#F  IsFpAlgebraElement( <obj> )
##
IsFpAlgebraElement := function( obj )
    return IsRec( obj )
           and IsBound( obj.isFpAlgebraElement )
           and obj.isFpAlgebraElement;
    end;

############################################################################
##
#F  MappedExpression( <expr>, <gens1>, <gens2> )
##
##  For an arithmetic expression <expr> in terms of '<gens1>',
##  'MappedExpression' returns the corresponding expression in terms of
##  <gens2>.
##
##  Note that it is expected that one can raise elements in <gens2> to the
##  zero-th power.
##
MappedExpression := function( expr, gens1, gens2 )

    local mapped,  # the mapped expression, result
          exps,    # exponent vector
          i;       # loop over summands

    if   IsWord( expr ) then

      mapped:= MappedWord( expr, gens1, gens2 );

    elif IsFpAlgebraElement( expr ) then

      gens1:= List( gens1, x -> x.words[1] );

      if Length( expr.words ) = 0 then
        mapped:= 0 * gens2[1];
      else

        if expr.words[1] = IdWord then
          mapped:= expr.coeff[1] * gens2[1]^0;
        elif expr.coeff[1] = expr.coeff[1] ^ 2 then
          mapped:= MappedWord( expr.words[1], gens1, gens2 );
        else
          mapped:= expr.coeff[1] * MappedWord( expr.words[1], gens1, gens2 );
        fi;

        for i in [ 2 .. Length( expr.words ) ] do
          mapped:= mapped
                 + expr.coeff[i] * MappedWord( expr.words[i], gens1, gens2 );
        od;

      fi;

    else
      Error( "<expr> must be word or element of a f.p. algebra" );
    fi;
    return mapped;
    end;

############################################################################
##
#V  FFLISTS
##
##  global list of field information.
##
FFLISTS := [];

############################################################################
##
#F  FFList( <F> )
##
##  For a finite field <F> it returns a list <l> giving the correspondence
##  between the {\MeatAxe} numbering and the {\GAP} numbering of the finite
##  field elements.
##
##  The element of <F> corresponding to {\MeatAxe} number <n> is then
##  '<l>[ <n>+1 ]',
##  and the {\MeatAxe} number of the field element <z> is
##  'Position( <l>, <z> ) -1'.
##
##  This program was originally written by Meinolf Geck.
##
FFList := function( F )
    local elms,
          sizeF;

    sizeF:= Size( F );
    if not IsBound( FFLISTS[ sizeF ] ) then

      elms:= List( Cartesian( List( [1 .. F.dimension ],
                                    i -> [0 .. F.char-1 ] ) ),
                   Reversed);
      FFLISTS[ sizeF ]:= List( elms, i -> Sum( [ 1 .. F.dimension ],
                                               j -> i[j] * F.root^(j-1) ) );

    fi;
    return FFLISTS[ sizeF ];
    end;

#############################################################################
##
#F  ElementAlgebra( <A>, <nr> ) . . . . . . . . .  <nr>-th element in algebra
##
##  returns the <nr>-th element in terms of the generators of the algebra
##  <A>.
##  Let $n$ be the number of generators of <A>.
##  We form the elements as linear combinations with coefficients in the
##  base field of <A>, w.r. to the basis defined by the ordering according
##  to length and lexicographic order, that is,
##  $1, a_1, a_2, \ldots, a_n, a_1^2, a_1 a_2, a_1 a_3, \ldots, a_1 a_n,
##  a_2 a_1, \ldots, a_2 a_n, \ldots, a_n^2, a_1^3, a_1^2 a_2, \ldots,
##  a_1^2 a_n, a_1 a_2 a_1, \ldots$.
##
##  *Note* that this function assumes an identity element for <A>, that
##  is, the 0-th power of a generator, and that the base field must be
##  finite.
##
##  Let $q$ be the order of '<A>.field', and $<nr> = \sum{i=0}^k a_i q^i$
##  the $q$-adic expression of <nr>.
##  Then the $a_i$-th element of '<A>.field' is the coefficient of the
##  $i$-th base element in the required algebra element.
##  The ordering of field elements is the same as that defined in the
##  {\MeatAxe} package, that is, the <m>-th element of the field <F> is
##  'FFList( <F> )[ <m>+1 ]'.
##
ElementAlgebra := function( A, nr )

    local a, b, ab, w,      # needed for words of standard fingerprint
          sizeF,            # size of 'A.field'
          coeff,            # $q$-adic expression of 'nr'
          fflist,           # list of field elements
          element,          # algebra element, result
          gens,             # 'A.generators'
          n,                # number of generators of 'A'
          counter,          # 'n'-adic counter
          counterlength,    # length of 'counter'
          pos,              # loop over positions in 'coeff'
          len,              # length of 'coeff'
          word,             # one summand
          j;                # loop over 'counter'

    sizeF:= Size( A.field );

    if not IsInt( nr ) then
      Error( "<nr> must be an integer" );
    elif nr = 0 then
      return Zero( A );
    elif nr < 0 then
      a  := A.generators[1];
      b  := A.generators[2];
      ab := a * b;
      w:= ab + a + b;
      if nr = -1 then return w; fi;
      w:= w + ab * b;
      if nr = -2 then return w; fi;
      w:= a + b * w;
      if nr = -3 then return w; fi;
      w:= b + w;
      if nr = -4 then return w; fi;
      w:= ab + w;
      if nr = -5 then return w; fi;
      w:= a + w;
      if nr = -6 then return w; fi;
      Error( "negative numbers must be in [ -6 .. -1 ]" );
 
    elif not IsInt( sizeF ) then
      Error( "base field must be finite" );
    fi;

    gens:= A.generators;
    n:= Length( gens );
    if n = 0 then
      Error( "need at least one generator" );
    fi;

    coeff:= CoefficientsQadic( nr, sizeF );
    fflist:= FFList( A.field );

    # Try to avoid computing the identity if it is not really needed.
    if coeff[1] <> 0 then
      element:= coeff[1] * One( A );
    fi;

    # Initialize a 'n'-adic counter that encodes words corresponding
    # to the positions in 'coeff'.
    # The value $[ k_1, k_2, \ldots, k_i ]$ means the word
    # $a_{k_i} a_{k_{i-1}} \cdots a_{k_1}$ where $1\leq k_j\leq n$.

    # We have $n^i$ words of length $i$, so whenever an overflow
    # occurs, we enlarge the length of the counter by one, and
    # reset all values to '1'.

    counter:= [ 1 ];
    counterlength:= 1;
    pos:= 2;
    len:= Length( coeff );

    while pos <= len do

      # If the coefficient is nonzero, construct the 'pos'-th basis
      # element, and add the appropriate multiple to 'element'.
      if coeff[ pos ] <> 0 then

        # The basis element is described by the value of 'counter'.
        word:= gens[ counter[1] ];
        for j in [ 2 .. counterlength ] do
          word:= gens[ counter[j] ] * word;
        od;
        if IsBound( element ) then
          element:= element + fflist[ coeff[ pos ] + 1 ] * word;
        else
          element:= fflist[ coeff[ pos ] + 1 ] * word;
        fi;

      fi;

      # Increase the counter.  Enlarge it if necessary.
      j:= 1;
      while j <= counterlength and counter[j] = n do
        counter[j]:= 1;
        j:= j+1;
      od;
      if j <= counterlength then
        counter[j]:= counter[j] + 1;
      else
        counter[j]:= 1;
        counterlength:= j;
      fi;

      # Go to the next word.
      pos:= pos+1;

    od;

    # Return the algebra element.
    return element;
    end;

#############################################################################
##
#F  NumberAlgebraElement( <a> )
##
##  returns the number <N> such that the f.p. algebra element <a> is the
##  <N>-th element of its algebra <A> with respect to the ordering defined
##  in 'ElementAlgebra'.
##
##  Let '<A>.field' be $F$, and <n> the number of generators of <A>.
##  If $a = \sum_{i=1}^m c_i w_i$ with $c_i \in F$, and $w_i$ words in terms
##  of the generators of <A>, then
##  $<N> = \sum_{i=1}^m c_i^{\prime} 'NumberAlgebraElement'( <A>, w_i )$
##  where $c_i$ is the $c_i^{\prime}$-th element of $F$.
##
##  The word $w = a_{i_1} a_{i_2} \ldots a_{i_p}$ is at position
##  $1 + \sum{j=1}^p i_j n^{p-j}$ in the ordering of algebra elements,
##  since its index vector is $(i_1, i_2, \ldots, i_p)$, so among the words
##  of length $p$ it is at position $1 + \sum_{j=1}^p (i_j -1) n^{p-j}$,
##  and we have to add the number of shorter words which is
##  $\sum_{j=1}^p n^{p-j}$.
##
NumberAlgebraElement := function( a )

    local gens,    # abstract generators of the free algebra generators
          n,       # number of generators
          fflist,  # field elements in canonical ordering
          q,       # size of the field
          number,  # number of 'a', result
          i,       # loop over words in 'a'
          pos,     # 'n'-adic expression of a word
          l,       # number of a word
          j;       # loop over 'pos'

    if not IsFpAlgebraElement( a ) then
      Error( "<a> must be an element of a free algebra" );
    fi;

    gens:= List( a.domain.generators, x -> x.words[1] );
    n:= Length( gens );

    fflist:= FFList( a.domain.field );
    q:= Length( fflist );

    number:= 0;
    for i in [ 1 .. Length( a.words ) ] do

      # Get the $n$-adic expression for the $i$-th word $w$.
      pos:= List( [ 1 .. LengthWord( a.words[i] ) ],
                  x -> Position( gens, Subword( a.words[i], x, x ) ) );

      # Compute $l$ such that $w$ is the $(l+1)$-th word of $A$.
      l:= 0;
      for j in [ 1 .. Length( pos ) ] do
        l:= l * n + pos[j];
      od;

      # $w$ has number $q^l$ where $q$ is the size of $F$.
      number:= number + ( Position( fflist, a.coeff[i] ) - 1 ) * q^l;

    od;

    # Return the number.
    return number;
    end;

#############################################################################
##
#V  FpAlgebraElementOps . . . operations record for elements of f.p. algebras
##
FpAlgebraElementOps := OperationsRecord( "FpAlgebraElementOps",
                                         AlgebraElementOps );

#############################################################################
##
#F  FpAlgebraElement( <A>, <coeff>, <words> ) . . . element of a f.p. algebra
##
##  An element of a f.p. algebra is represented as sum of words in abstract
##  generators, with coefficients in the base field of the algebra.
##  In {\GAP}, this is a record with the appropriate components.
##
##  *Note* that we do not check whether the coefficients in 'coeff' lie in
##  the base field of 'A', and we do also not check whether the coefficients
##  are all nonzero.
##
FpAlgebraElement := function( A, coeff, words )

    return rec( isAlgebraElement   := true,
                isFpAlgebraElement := true,
                domain             := A,
                coeff              := coeff,
                words              := words,
                operations         := FpAlgebraElementOps    );
    end;

#############################################################################
##
#F  FpAlgebraElementOps.String
##
FpAlgebraElementOps.String := function( elm )

    local i,   # loop over the summands
          ps,  # string, result
          pos; # 1 or 2, depending on whether 'IdWord' is contained

    if   Length( elm.words ) = 0 then

      ps:= Concatenation( "FpAlgebraElement( ", elm.domain, ", [], [] )" );

    else

      ps:= "";

      # Do not print the identity of the algebra as 'IdWord',
      # since this cannot be multiplied with field elements,
      # or added to algebra elements.

      if elm.words[1] = IdWord then
        if elm.coeff[1] <> elm.domain.field.one then
          Append( ps, String( elm.coeff[1] ) );
          Add( ps, '*' );
        fi;
        Append( ps, String( elm.domain.generators[1] ) );
        Append( ps, "^0" );
        Add( ps, '+' );
        pos:= 2;
      else
        pos:= 1;
      fi;

      for i in [ pos .. Length( elm.words ) ] do
        if elm.coeff[i] <> elm.domain.field.one then
          Append( ps, String( elm.coeff[i] ) );
          Add( ps, '*' );
        fi;
        Append( ps, String( elm.words[i] ) );
        Add( ps, '+' );
      od;
      Unbind( ps[ Length( ps ) ] );

    fi;

    return ps;

    end;

#############################################################################
##
#F  FpAlgebraElementOps.Print
##
FpAlgebraElementOps.Print := function( elm )
    local i;

    if   IsBound( elm.name ) then
      Print( elm.name );
    elif Length( elm.words ) = 0 then

      # Print the zero element.
      Print( elm.domain.zero );

    else

      if elm.coeff[1] <> elm.domain.field.one then
        Print( elm.coeff[1], "*" );
      fi;
      if elm.words[1] = IdWord then

        # Consider the special case of the empty word.
        # Do not print the identity of the algebra as 'IdWord',
        # since this cannot be multiplied with field elements,
        # or added to algebra elements.
        Print( elm.domain.one );
      else
        Print( elm.words[1] );
      fi;

      for i in [ 2 .. Length( elm.words ) ] do
        Print( "+" );
        if elm.coeff[i] <> elm.domain.field.one then
          Print( elm.coeff[i], "*" );
        fi;
        Print( elm.words[i] );
      od;

    fi;
    end;

#############################################################################
##
#F  FpAlgebraElementOps.\=( <x>, <y> )
##
FpAlgebraElementOps.\= := function( x, y )

    local A,      # underlying algebra
          ophom;  # operation homomorphism

    if IsFpAlgebraElement( x ) then

      if IsFpAlgebraElement( y ) then
          
         if x.coeff = y.coeff and x.words = y.words then

           # identical expression
           return true;
         elif    Length( x.domain.relators ) = 0
              or Length( y.domain.relators ) = 0
              or not x in y.domain
              or not y in x.domain then

           # Compare elements of a free algebra or of different algebras.
           return false;
         else

           # Ask the matrix representation.
           A:= x.domain;
           ophom:= OperationHomomorphism( A, A.operations.MatAlgebraA( A ) );
           return Image( ophom, x ) = Image( ophom, y );
        fi;

      else
        return false;
      fi;

    elif IsFpAlgebraElement( y ) then
      return false;
    else
      Error( "panic, either <x> or <y> must be a f.p. algebra element" );
    fi;
    end;

#############################################################################
##
#F  FpAlgebraElementOps.\<( <x>, <y> )
##
FpAlgebraElementOps.\< := function( x, y )

    local A, ophom;

    if IsFpAlgebraElement( x ) and IsFpAlgebraElement( y ) then

      if x.domain = y.domain then

        if Length( x.domain.relators ) = 0 then

          # Compare elements of the same free algebra.
          return x.words < y.words or
                 ( x.words = y.words and x.coeff < y.coeff );

        else

          # The algebra is not free, compare the images in the
          # matrix algebra.
          A:= x.domain;
          ophom:= OperationHomomorphism( A, A.operations.MatAlgebraA( A ) );
          return Image( ophom, x ) < Image( ophom, y );

        fi;

      else

        # Compare the domains.
        return x.domain < y.domain;

      fi;

    else
      Error( "<x> and <y> must be f.p. algebra elements" );
    fi;
    end;

#############################################################################
##
#F  FpAlgebraElementOps.\+( <x>, <y> )
##
FpAlgebraElementOps.\+ := function( x, y )
    local lenx, leny, posx, posy, words, coeff, coe;
    if    IsFpAlgebraElement( x ) then

      if IsFpAlgebraElement( y ) and x.domain = y.domain then

        lenx:= Length( x.words );
        leny:= Length( y.words );
        posx:= 1;
        posy:= 1;

        words:= [];
        coeff:= [];

        while posy <= leny do

          while     posx <= lenx
                and x.words[ posx ] < y.words[ posy ] do
            Add( words, x.words[ posx ] );
            Add( coeff, x.coeff[ posx ] );
            posx:= posx + 1;
          od;

          if posx > lenx then

            Append( words, y.words{ [ posy .. leny ] } );
            Append( coeff, y.coeff{ [ posy .. leny ] } );
            posy:= leny + 1;

          elif x.words[ posx ] = y.words[ posy ] then

            coe:= x.coeff[ posx ] + y.coeff[ posy ];
            if coe <> 0 * x.coeff[1] then
              Add( words, x.words[ posx ] );
              Add( coeff, coe );
            fi;
            posx:= posx + 1;
            posy:= posy + 1;

          else

            Add( words, y.words[ posy ] );
            Add( coeff, y.coeff[ posy ] );
            posy:= posy + 1;

          fi;

        od;

        Append( words, x.words{ [ posx .. lenx ] } );
        Append( coeff, x.coeff{ [ posx .. lenx ] } );

        return FpAlgebraElement( x.domain, coeff, words );

      elif IsList( y ) then
        return List( y, i -> x + i );
      else
        Error( "<x> and <y> must be elements of the same f.p. algebra" );
      fi;

    elif IsFpAlgebraElement( y ) and IsList( x ) then
      return List( x, i -> i + y );
    else
      Error( "<x> and <y> must be elements of the same f.p. algebra" );
    fi;
    end;

#############################################################################
##
#F  FpAlgebraElementOps.\-( <x>, <y> )
##
FpAlgebraElementOps.\- := function( x, y )
    return x + (- y.domain.field.one) * y;
    end;

#############################################################################
##
#F  FpAlgebraElementOps.\*( <x>, <y> )
##
FpAlgebraElementOps.\* := function( x, y )

    local i, pos, word, coef, leny, posx, posy, words, coeff;

    if   IsFpAlgebraElement( x ) and IsFpAlgebraElement( y ) then

      # product of two algebra elements
      if x.domain = y.domain then

        leny:= Length( y.words );

        words:= [];
        coeff:= [];

        for posx in [ 1 .. Length( x.words ) ] do

          for posy in [ 1 .. leny ] do

            word:= x.words[ posx ] * y.words[ posy ];
            coef:= x.coeff[ posx ] * y.coeff[ posy ];
            pos := PositionSorted( words, word );

            if   IsBound( words[ pos ] ) and words[ pos ] = word then

              # just change the coefficient
              coeff[ pos ]:= coeff[ pos ] + coef;

            else

              # new word to insert
              if   pos <= Length( words ) then

                # make the right position for the new word free
                for i in Reversed( [ pos .. Length( words ) ] ) do
                  words[ i+1 ]:= words[i];
                  coeff[ i+1 ]:= coeff[i];
                od;

              fi;

              words[ pos ]:= word;
              coeff[ pos ]:= coef;

            fi;

          od;

        od;

      fi;

      return FpAlgebraElement( x.domain, coeff, words );

    elif IsFpAlgebraElement( x ) and y in x.domain.field then

      # product of algebra element with field element
      if y = x.domain.field.zero then
        return FpAlgebraElement( x.domain, [], [] );
      else
        return FpAlgebraElement( x.domain,
                                 List( x.coeff, c -> c * y ),
                                 x.words );
      fi;

    elif IsFpAlgebraElement( y ) and x in y.domain.field then

      # product of field element with algebra element
      if x = y.domain.field.zero then
        return FpAlgebraElement( y.domain, [], [] );
      else
        return FpAlgebraElement( y.domain,
                                 List( y.coeff, c -> x * c ),
                                 y.words );
      fi;

    elif IsFpAlgebraElement( y ) and IsInt( x ) then

      # product of integer with algebra element
      if x * y.domain.field.one = y.domain.field.zero then
        return FpAlgebraElement( y.domain, [], [] );
      else
        return FpAlgebraElement( y.domain,
                                 List( y.coeff, c -> x * c ),
                                 y.words );
      fi;

    elif IsList( x ) and IsFpAlgebraElement( y ) then

      # product of vector over algebra with algebra element
      return List( x, z -> z * y );

    elif IsList( y ) and IsFpAlgebraElement( x ) then

      # product of algebra element with vector over algebra
      return List( y, z -> x * z );

    else

      Error( "panic, at least one of <x>, <y> must be an algebra element" );

    fi;

    end;

#############################################################################
##
#F  FpAlgebraElementOps.\/( <x>, <y> )
##
FpAlgebraElementOps.\/ := function( x, y )

    if IsFpAlgebraElement( x ) and y in x.domain.field then
      return FpAlgebraElement( x.domain,
                               List( x.coeff, c -> c / y ),
                                     x.words );
    else
      Error( "division only by elements of the base field" );
    fi;
    end;

#############################################################################
##
#F  FpAlgebraElementOps.\^( <x>, <n> )
##
FpAlgebraElementOps.\^ := function( x, n )

    local i, result;

    if IsFpAlgebraElement( x ) and IsInt( n ) then

      if   n = 0 then
        result:= x.domain.one;
      elif n > 0 then
        result:= x;
        for i in [ 2 .. n ] do result:= result * x; od;
#T improve!

      elif Length( x.words ) = 1 then

        # Allow inverting of elements that are multiples of a single word.
        # This is useful for the {\MeatAxe}, and also occurs in preimages
        # of {\VE} output.
        result:= FpAlgebraElement( x.domain, [ x.coeff[1]^-1 ],
                                             [ x.words[1]^-1 ] );
      else
        Error( "<x> must be an algebra element, <n> nonnegative integer" );
      fi;

    elif IsFpAlgebraElement( n ) and IsList( x ) then

      # action of algebra on its free module
      return List( x, z -> z * n );

    else
      Error( "<x> must be an algebra element, <n> nonnegative integer" );
    fi;
    return result;
    end;

#############################################################################
##
#V  FpAlgebraOps  . . . . . . . . . . . . operations record for f.p. algebras
##
##  Finitely presented algebras are always unital.
##
FpAlgebraOps := OperationsRecord( "FpAlgebraOps", UnitalAlgebraOps );

#############################################################################
##
#V  FpAlgebraElementsOps
##
FpAlgebraElementsOps := OperationsRecord( "FpAlgebraElementsOps",
                                          AlgebraElementsOps );

#############################################################################
##
#F  FpAlgebraElementsOps.Algebra  . . . . . . . . create a fin. pres. algebra
##
FpAlgebraElementsOps.Algebra := function( FpAlgebraElements, F, gens, one )
    local A;            # finitely presented algebra, result

    # check that all generators have length 1
    if not ForAll( gens, g ->   Length( g.words ) = 1
                            and LengthWord( g.words[1] ) = 1 )  then
      Error( "the generators must have length 1 (maybe use 'Subalgebra')" );
    fi;

    # let the default function do the main work
    A:= AlgebraElementsOps.UnitalAlgebra( AlgebraElements, F, gens, one );

    # add the tag
    A.isFpAlgebra:= true;

    # add the operations record
    A.operations:= FpAlgebraOps;

    # return the algebra
    return A;
    end;

#############################################################################
##
#F  IsFpAlgebra( <obj> )
##
IsFpAlgebra := function( obj )
    return IsRec( obj )
           and IsBound( obj.isFpAlgebra )
           and obj.isFpAlgebra;
    end;

#############################################################################
##
#F  FreeAlgebra( <F>, <rank> ) . . . . . . . . . . free algebra of given rank
#F  FreeAlgebra( <F>, <rank>, <name> )
#F  FreeAlgebra( <F>, <name1>, <name2>, ... )
##
FreeAlgebra := function( arg )

    local   F,          # coefficients field
            A,          # free algebra, result
            i,          # loop over generators of <A>
            one,        # identity element of the algebra
            names,      # names of the algebra generators
            algname,    # uniform generators name
            g;          # one generator of 'A'

    # Check the argument list.
    if not ( Length( arg ) > 1 and
             ( IsRing( arg[1] ) or IsField( arg[1] ) ) and
             ( IsInt( arg[2] ) or IsList( arg[2] ) or
               ForAll( [ 2 .. Length( arg ) ],
                       x -> IsString( arg[x] ) ) ) ) then

      Error( "usage: FreeAlgebra(<F>,<rank>) or FreeAlgebra(<F>,<name1>,...)" );

    fi;

    F:= arg[1];

    # Make the algebra.
    A:= rec( isDomain        := true,
             isAlgebra       := true,
             isUnitalAlgebra := true,
             isFpAlgebra     := true,
             field           := F,
             operations      := FpAlgebraOps );

    # Construct names of generators.
    if   Length( arg ) = 2 and IsInt( arg[2] ) then
      names:= List( [ 1 .. arg[2] ],
                    x -> Concatenation( "a.", String(x) ) );
      algname:= "a";
    elif Length( arg ) = 2 and IsList( arg[2] ) then
      names:= arg[2];
    elif Length( arg ) = 3 and IsInt( arg[2] ) then
      names:= List( [ 1 .. arg[2] ],
                    x -> Concatenation( arg[3], ".", String(x) ) );
      algname:= arg[3];
    else
      names:= arg{ [ 2 .. Length( arg ) ] };
    fi;
    A.namesGenerators:= names;

    # Free algebras always contain an identity element and a zero element.
    A.one  := FpAlgebraElement( A, [ F.one ], [ IdWord ] );
    A.zero := FpAlgebraElement( A, [], [] );

    # Make the generators.
    A.generators:= List( names,
                         x -> FpAlgebraElement( A, [ F.one ],
                                        [ AbstractGenerator( x ) ] ) );
    A.relators:= [];

    if IsBound( algname ) then
      A.algname   := algname;
      A.one.name  := ConcatenationString( algname, ".one" );
      A.zero.name := ConcatenationString( algname, ".zero" );
    else
      A.one.name  := ConcatenationString( names[1], "^0" );
      A.zero.name := ConcatenationString( "0*", names[1] );
    fi;

    # Make generators easily accessible.
    for i in [ 1 .. Length( A.generators ) ] do
      A.(i):= A.generators[i];
    od;

    # Return the algebra.
    return A;
    end;

#############################################################################
##
#F  FpAlgebra( <algebra> )
#F  FpAlgebra( <F>, <fpgroup> )
##
FpAlgebra := function( arg )
    if Length( arg ) = 1 and IsAlgebra( arg[1] ) then
      return arg[1].operations.FpAlgebra( arg[1].field, arg[1] );
    elif Length( arg ) = 2 and IsField( arg[1] ) and IsDomain( arg[2] ) then
      return arg[2].operations.FpAlgebra( arg[1], arg[2] );
    else
      Error( "usage: FpAlgebra( <algebra> ) resp. FpAlgebra( <F>, <D> )" );
    fi;
    end;

#############################################################################
##
#F  FpAlgebraOps.FpAlgebra( <F>, <A> )
##
##  returns a finitely presented algebra for <A>.
##  If <A> is a parent algebra just <A> is returned, for a subalgebra of a
##  finitely presented algebra first a faithful matrix representation is
##  computed, and then a presentation for that matrix algebra is returned.
##
FpAlgebraOps.FpAlgebra := function( F, A )
    if IsParent( A ) then
      return A;
    else
      return FpAlgebra( A.operations.MatAlgebraA( A ) );
    fi;
    end;

#############################################################################
##
#F  FpGroupOps.FpAlgebra( <F>, <fpgroup> )
##
##  returns the group algebra of the finitely presented group <fpgroup> over
##  the field <F>.
##  The number of algebra generators is twice the number of group generators,
##  the first half corresponding to the group generators, the second half to
##  their inverses.
##
FpGroupOps.FpAlgebra := function( F, fpgroup )

    local n,         # no. of generators
          A,         # the f.p. algebra, result
          relators,  # algebra relators
          invgens,   # inverses of group generators
          w,         # one group relator
          rel,       # one algebra relator
          j,         # loop over letters in 'w'
          pos;       # position of letter in algebra generators

    if not ( IsRing( F ) or IsField( F ) ) or not IsFpGroup( fpgroup ) then
      Error( "<F> must be a field, <fpgroup> a f.p. group" );
    fi;

    n:= Length( fpgroup.generators );
    A:= FreeAlgebra( F, 2 * n );

    relators:= [];

    # Generator $n+i$ is the inverse of generator $i$.
    Append( relators, List( [ 1 .. n ],
                      i -> A.generators[i] * A.generators[n+i] - A.one ) );
    Append( relators, List( [ 1 .. n ],
                      i -> A.generators[n+i] * A.generators[i] - A.one ) );

    # Write the group relators in terms of the algebra relators,
    # replace powers of inverses of generators.
    invgens:= List( fpgroup.generators, x -> x^-1 );
    for w in fpgroup.relators do
      rel:= A.one;
      for j in [ 1 .. LengthWord( w ) ] do
        pos:= Position( fpgroup.generators, Subword( w, j, j ) );
        if pos = false then
          pos:= n + Position( invgens, Subword( w, j, j ) );
        fi;
        rel:= rel * A.generators[ pos ];
      od;
      Add( relators, rel - A.one );
    od;

    A:= A / relators;
#T provide info for the embedding!
    return A;
    end;

#############################################################################
##
#F  PrintDefinitionFpAlgebra( <A>, <name> )
##
PrintDefinitionFpAlgebra := function( A, name )

    local i,      # loop over generators of <A>
          names;  # names of generators

    if not IsFpAlgebra( A ) then
      Error( "<A> must be a finitely presented algebra" );
    fi;

    names:= FreeAlgebra( A.field, Length( A.generators ), name ).generators;
    Print( name, ":= FreeAlgebra( ", A.field );
    for i in [ 1 .. Length( A.namesGenerators ) ] do
      Print( ", \"", A.namesGenerators[i], "\"" );
    od;
    Print( " );\n" );

    if Length( A.relators ) > 0 then
      Print( name, ":= ", name, " / ",
             List( A.relators,
                   x -> MappedExpression( x, A.generators, names ) ),
             ";\n" );
    fi;
    end;

#############################################################################
##
#F  FpAlgebraOps.UnitalSubalgebra(<A>,<gens>)
##
##  All subalgebras of f.p. algebras are by definition unital.
##
FpAlgebraOps.UnitalSubalgebra := function( A, gens )
    local   S;          # subalgebra, result

    # let the default function do the main work
    S:= UnitalAlgebraOps.Subalgebra( A, gens );

    # add the finitely presented algebras tag
    S.isFpAlgebra := true;

    # add the finitely presented algebras operations record
    S.operations:= FpAlgebraOps;

    # return the subalgebra
    return S;
    end;

#############################################################################
##
#F  FpAlgebraOps.Subalgebra(<A>,<gens>)
##
FpAlgebraOps.Subalgebra := FpAlgebraOps.UnitalSubalgebra; 

#############################################################################
##
#F  FpAlgebraOps.TrivialSubalgebra(<A>) . trivial subalgebra of a f.p.algebra
##
FpAlgebraOps.TrivialSubalgebra := function( A )
    local   T;          # trivial subalgebra of <A>, result

    # let the default function do the main work
    T:= UnitalAlgebraOps.TrivialSubalgebra( A );

    # remove the elements list
    Unbind( T.elements );

    # return the trivial subalgebra
    T.operations:= FpAlgebraOps;
    return T;
    end;

#############################################################################
##
#F  FpAlgebraOps.\in( <a>, <H> )
##
##  membership test for f.p. algebras, as far as possible
##
FpAlgebraOps.\in := function( a, H )
    local   G,          # parent of <H>
            gens,       # abstract generators involved in generators of <H>
            c,          # coset in tracing
            w,          # one word in an f.p. algebra element
            i,          # loop variable
            ophom,      # operation homomorphism
            P;          # parent algebra

    # Handle the trivial case first.
    if not IsFpAlgebraElement( a ) then
      return false;

    # Handle the parent algebra by testing the letters of the words.
    elif IsParent( H )  then
      gens:= List( H.generators, x -> x.words[1] );
      for w in a.words do
        for i in [ 1 .. LengthWord( w ) ] do
          if not Subword( w, i, i ) in gens then return false; fi;
        od;
      od;
      return true;

    elif not a in Parent( H ) then
      return false;

    # Otherwise ask the isomorphic matrix algebra
    else

      Print( "#I membership test for f.p. algebra element ...\n" );
      P:= Parent( H );
      ophom:= OperationHomomorphism( P, P.operations.MatAlgebraA( P ) );
      return Image( ophom, a ) in Image( ophom, H );

    fi;
    end;

#############################################################################
##
#F  FpAlgebraOps.IsFinite( <A> )
##
FpAlgebraOps.IsFinite := function( A )
    if   not IsFinite( A.field ) then
      return false;
    elif Length( A.generators ) = 0 then
      return true;
    elif Length( A.relators ) = 0 then
      return false;
    elif IsBound( A.matAlgebraA ) then
      return true;
    else
#T try to construct matrix repr.?
      Error( "cannot decide whether the f.p. algebra <A> is finite" );
    fi;
    end;

#############################################################################
##
#F  FpAlgebraOps.IsSubset(<G>,<H>)  . is one f.p. algebra a subset of another
##
FpAlgebraOps.IsSubset := function( G, H )
    local   isSub;

    # avoid calling 'IsFinite' as in 'UnitalAlgebraOps.IsSubset'
    if IsFpAlgebra( G )  then
        if IsFpAlgebra( H )  then
            isSub :=    G.generators = H.generators
                     or (IsBound( H.parent ) and G = H.parent)
                     or ForAll( H.generators, gen -> gen in G );
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
#F  FpAlgebraOps.\/( <A>, <relators> )  . . . . . . . . . . quotient by ideal
##
FpAlgebraOps.\/ := function( A, relators )
    local F;

    if not IsFpAlgebra( A ) and Length( A.relators ) = 0 then
      Error( "<A> must be a free algebra" );
    fi;

    if IsBound( A.algname ) then
      F:= FreeAlgebra( A.field, Length( A.generators ), A.algname );
    else
      F:= FreeAlgebra( A.field, Copy( A.namesGenerators ) );
    fi;
    F.relators:= List( relators,
                    x -> MappedExpression( x, A.generators, F.generators ) );
    return F;
    end;

#############################################################################
##
#F  FpAlgebraOps.Operation( <A>, <Q>, <opr> )
##
##  returns the matrix algebra representation of the action of <A>
##  on the quotient module <Q>.
##
##  This function tries to load the {\VE} share library.
##
FpAlgebraOps.Operation := function( A, Q, opr )

    local Qgens,   # generators of 'Q'
          i,       # loop over generators
          ophom,
          opmod;

    if   not IsModule( Q ) then
      Error( "<Q> must be a (factor module of a) free module" );
    elif IsBound( Q.factorDen ) then

      # The module is given explicitly as a quotient.
      Qgens:= Q.factorDen.generators;

    else

      # The module is not a quotient module, set the denominator to the
      # zero module.
      Qgens:= [ Zero( Q ) ];

    fi;

    if opr = OnPoints or opr = OnRight or opr = "mtx" then

      # Load the {\VE} package if it is not yet present.
      RequirePackage( "ve" );
      if not IsBound( FpAlgebraOps.OperationQuotientModule ) then
        Error( "'ve' share library cannot be loaded" );
      fi;
      opr:= FpAlgebraOps.OperationQuotientModule( A, Qgens, opr );

    else
      Error( "sorry, only supported operations are 'OnPoints', 'OnRight'" );
    fi;

    # Handle the action on *submodules* of (quotients of) free modules.
    if not IsParent( Q ) then

      # Get the images of the generators of 'Q' in the module for 'opr'.
      if IsBound( Q.factorDen ) then
        Qgens:= Generators( Q.factorNum );
      else
        Qgens:= Generators( Q );
      fi;

      ophom:= OperationHomomorphism( A, opr );
      opmod:= OperationModule( Q, ophom );

#T 'operation' component!
Error("sorry!");

    fi;

    return opr;
    end;

#############################################################################
##
#F  FpAlgebraOps.MatAlgebraA( <A> )
##
##  The algebra acts faithfully on itself via right multiplication.
##
FpAlgebraOps.MatAlgebraA := function( A )
    local P;

    # Compute an isomorphic matrix algebra for the parent of <A>.
    P:= Parent( A );

    if IsBound( P.isFinite ) and not P.isFinite then
      Error( "sorry, parent is infinite" );
    else

      if not IsBound( P.matAlgebraA )  then

        # Load the {\VE} package if it is not yet present.
        RequirePackage( "ve" );
        if not IsBound( FpAlgebraOps.OperationQuotientModule ) then
          Error( "'ve' share library cannot be loaded" );
        fi;

        P.matAlgebraA:= FpAlgebraOps.OperationQuotientModule( P,
                                          [ [ P.zero ] ], OnPoints );
        P.matAlgebraA.operation.structure := P;
        P.matAlgebraA.operation.domain    := P^1;
        P.matAlgebraA.operation.operation := OnPoints;

      fi;

      # Compute the compatible isomorphic matrix algebra for <A>.
      if not IsBound( A.matAlgebraA )  then
        A.matAlgebraA:= UnitalSubalgebra( P.matAlgebraA,
              List( A.generators,
                    a -> MappedExpression( a, P.generators,
                                     P.matAlgebraA.operation.genimages ) ) );
      fi;

    fi;
    return A.matAlgebraA;
    end;

#############################################################################
##
#F  FpAlgebraOps.Size( <A> )
##
FpAlgebraOps.Size := function( A )
    local op;

    # handle free and trivial algebra
    if   0 = Length( A.generators ) then
      return Size( A.field );
    elif IsParent( A ) and 0 = Length( A.relators ) then
      return "infinity";
    elif not IsFinite( A.field ) then
      return "infinity";

    # Compute a faithful matrix representation.
    else

      # The algebra acts faithfully on itself by right multiplication.
      return Size( A.operations.MatAlgebraA( A ) );

    fi;
    end;

#############################################################################
##
#F  FpAlgebraOps.Base( <A> ) . . . . . . . . . . . . . base of a f.p. algebra
##
FpAlgebraOps.Base := function( A )
    local base,       # base of <A>, result
          ophom;      # operation homomorphism to matrix algebra

    # Check for a free algebra.
    if IsParent( A ) and
       ( not IsBound( A.relators ) or Length( A.relators ) = 0 ) then
        Error( "sorry, algebra is not finite dimensional" );
    elif Length( A.generators ) = 0 then
      base:= [ A.one ];
    else
      ophom:= OperationHomomorphism( A, A.operations.MatAlgebraA( A ) );
      base:= List( Base( A.matAlgebraA ),
                   x -> PreImagesRepresentative( ophom, x ) );
    fi;
    return base;
    end;

#############################################################################
##
#F  FpAlgebraOps.Dimension(<A>)
##
FpAlgebraOps.Dimension := function( A )
    return Length( Base( A ) );
    end;

#############################################################################
##
#F  FpAlgebraOps.Elements(<A>)  . . . . . . . . .  elements of a f.p. algebra
##
FpAlgebraOps.Elements := function( A )
    local base,    # base of <A>
          elms,    # elements of <A>, result
          new,     # intermediate elements list
          i,       # loop over field elements
          gen;     # loop over base elements

    if not IsFinite( A.field ) then
      Error("sorry, cannot list the elements of infinite algebra <A>");
    fi;

    base:= Base( A );
    elms:= [ A.zero ];
    for gen in base do
      new:= [];
      for i in Elements( A.field ) do
        Append( new, List( elms, x -> x + i*gen ) );
      od;
      elms:= new;
    od;
    Sort( elms );
    return elms;
    end;

#############################################################################
##
#F  FpAlgebraOps.Coefficients( <A>, <a> )
##
##  Compute a base for <A>.
##  This is a preimage of the base for the faithful matrix representation,
##  so we map <a> under the operation homomorphism, and take the coefficients
##  of the image.
##
#T will be forbidden!!
##
FpAlgebraOps.Coefficients := function( A, a )
    Base( A );
    return Coefficients( Basis( A.matAlgebraA ),
           Image( A.matAlgebraA.operationHomomorphism, a ) );
    end;

#############################################################################
##
#F  FpAlgebraOps.Intersection(<G>,<H>)  . . intersection of two f.p. algebras
##
FpAlgebraOps.Intersection := function( G, H )
    local   I,          # intersection of <G> and <H>, result
            M,          # matrix algebra
            ophom;      # operation homomorphism

    # delegate exceptional case
    if Parent( G ) <> Parent( H )  then
      I:= DomainOps.Intersection( G, H );

    # handle trivial cases
    elif IsParent( G )  then
      I:= H;
    elif IsParent( H )  then
      I:= G;

    # intersection of two subalgebras
    else
      M:= G.operations.MatAlgebraA( Parent( G ) );
      ophom:= OperationHomomorphism( Parent( G ), M );
      I:= Intersection( G.operations.matAlgebraA( G ),
                        H.operations.matAlgebraA( H ) );
      I:= UnitalSubalgebra( Parent( G ),
                      List( I.generators,
                            x -> PreImagesRepresentative( ophom, x ) ) );
    fi;

    return I;
    end;

#############################################################################
##
#F  FpAlgebraOps.Closure(<A>,<a>) . closure of a subalgebra in a f.p. algebra
##
FpAlgebraOps.Closure := function( A, w )
    local   C,          # closure of <A> and <w>, result
            g;          # one generator

    # closure with the parent
    if IsParent( A )  then
      return A;
    fi;

    # handle the closure of a subalgebra with another subalgebra
    if IsAlgebra( w )  then
      C := A;
      for g  in w.generators  do
        C := Closure( C, g );
      od;
      return C;
    fi;

    # if possible test if the element lies in the algebra already
    if w in A.generators or
       ( IsBound( A.elements ) and w in A.elements ) or
       ( IsBound( A.matAlgebraA ) and
         MappedExpression( w, Parent(A).generators, Parent(A).matAlgebraA )
           in A.matAlgebraA ) then
      return A;
    fi;

    # otherwise make a new algebra
    C:= UnitalSubalgebra( Parent( A ), Concatenation( A.generators, [ w ] ) );

    # return the closure
    return C;
    end;

#############################################################################
##
#F  FpAlgebraOps.IsAbelian( <A> ) . . . . . . . . . .  test if <A> is abelian
##
FpAlgebraOps.IsAbelian := function( A )
    local i, j, isab;
    if   Length( A.generators ) <= 1 then
      isab:= true;
    elif Length( A.relators ) = 0 then
      isab:= false;
    else
      isab:= true;
      for i in [ 2 .. Length( A.generators ) ] do
        for j in [ 2 .. i-1 ] do
          if not (  A.generators[i] * A.generators[j]
                  - A.generators[j] * A.generators[i] in A.relators or
                    A.generators[j] * A.generators[i]
                  - A.generators[i] * A.generators[j] in A.relators ) then
            isab:= false;
          fi;
        od;
      od;
      if not isab then
        isab:= IsAbelian( A.operations.MatAlgebraA( A ) );
      fi;
    fi;
    return isab;
    end;

#############################################################################
##
#F  FpAlgebraOps.AbstractExpression( <A>, <elm> )
##
##  used by the operation homomorphisms
##
FpAlgebraOps.AbstractExpression := function( A, elm )
    return rec( generators := A.generators,
                expression := elm );
    end;

#############################################################################
##
#F  FpAlgebraOps.FieldMultiplicity( <A>, <elm> )
##
FpAlgebraOps.FieldMultiplicity := function( A, elm )
    return elm.coeff[1];
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
