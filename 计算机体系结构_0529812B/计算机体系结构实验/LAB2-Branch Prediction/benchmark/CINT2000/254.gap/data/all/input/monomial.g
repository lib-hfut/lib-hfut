#############################################################################
##
#A  monomial.g                  GAP library                     Thomas Breuer
#A                                                         & Erzsebet Horvath
##
#A  @(#)$Id: monomial.g,v 3.2.1.6 1994/10/28 16:09:18 sam Rel $
##
#Y  Copyright 1993-1995,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the functions dealing with monomiality questions for
##  solvable groups.
##
#H  $Log: monomial.g,v $
#H  Revision 3.2.1.6  1994/10/28  16:09:18  sam
#H  fixed call of 'IsSolvable' (has to be checked first)
#H
#H  Revision 3.2.1.5  1994/10/04  07:56:02  sam
#H  replaced calls of 'OrbitsCharacters' by calls of 'OrbitRepresentatives...'
#H
#H  Revision 3.2.1.4  1994/09/26  09:10:27  sam
#H  beautified 'TestMonomialQuick'
#H
#H  Revision 3.2.1.3  1994/09/26  09:09:10  sam
#H  fixed bug in 'GroupOps.IsMonomial'
#H
#H  Revision 3.2.1.2  1994/09/22  10:28:09  sam
#H  added 'IntegersOps.IsMonomial'
#H
#H  Revision 3.2.1.1  1994/08/18  13:40:41  sam
#H  added a comment
#H
#H  Revision 3.2  1994/06/30  17:42:59  sam
#H  fixed call of 'InertiaSubgroup'
#H
#H  Revision 3.1  1994/06/22  07:38:56  sam
#H  fixed bad typo
#H
#H  Revision 3.0  1994/04/05  10:21:54  sam
#H  Initial Revision under RCS
#H
##

##############################################################################
##
#F  InfoMonomial( ... )
##
    if not IsBound( InfoMonomial ) then InfoMonomial:= Ignore; fi;

##############################################################################
##
#F  Alpha( <G> )
##
##  returns for a group <G> a list whose <i>-th entry is the maximal derived
##  length of groups $<G>  / \ker(\chi)$ for $\chi\in Irr(<G>)$ with
##  $\chi(1)$ at most the <i>-th irreducible degree of <G>.
##
##  The result is stored in the group record as '<G>.alpha'.
##
##  *Note* that this function needs factor groups of <G>, so it works
##  efficiently only for AG groups.
##
Alpha := function( G )

    local irr,        # irreducible characters of 'G'
          degrees,    # set of degrees of 'irr'
          chars,      # at position <i> all in 'irr' of degree 'degrees[<i>]'
          chi,        # one character
          alpha,      # result list
          max,        # maximal derived length found up to now
          kernels,    # at position <i> the kernels of all in 'chars[<i>]'
          minimal,    # list of minimal kernels
          relevant,   # minimal kernels of one degree
          k,          # one kernel
          ker,
          dl;         # list of derived lengths

    # If the result is already stored return it.
    if not IsBound( G.alpha ) then

      InfoMonomial( "#I  Alpha called for group ",
                     GroupString( G, "G" ), "\n" );

      # Compute the irreducible characters and the set of their degrees;
      # we need all irreducibles so it is reasonable to compute the table.
      irr:= CharTable( G ).irreducibles;
      degrees:= Set( List( irr, x -> x[1] ) );
      RemoveSet( degrees, 1 );

      # Distribute characters to degrees.
      chars:= List( degrees, x -> [] );
      for chi in irr do
        if chi[1] > 1 then
          Add( chars[ Position( degrees, chi[1] ) ], chi );
        fi;
      od;

      # Initialize
      alpha:= [ 1 ];
      max:= 1;

      # Compute kernels (as position lists)
      kernels:= List( chars, x -> Set( List( x, KernelChar ) ) );

      # list of all minimal elements found up to now
      minimal:= [];

      InfoMonomial( "#I  Alpha: There are ", Length( degrees ) + 1,
                     " different degrees.\n" );

      for ker in kernels do

        # We may remove kernels that contain a (minimal) kernel
        # of a character of smaller or equal degree.

        # Make sure to consider minimal elements of the actual degree first.
        Sort( ker, function(x,y) return Length(x) < Length(y); end );

        relevant:= [];

        for k in ker do
          if ForAll( minimal, x -> not IsSubsetSet( k, x ) ) then

            # new minimal element found
            Add( relevant, k );
            Add( minimal,  k );

          fi;
        od;

        # Give the trivial kernel a chance to be found first when we
        # consider the next larger degree.
        Sort( minimal, function(x,y) return Length(x) < Length(y); end );

        # Compute the derived lengths
        for k in relevant do

          dl:= Length( DerivedSeries(
                   FactorGroupNormalSubgroupClasses( G, k ) ) ) - 1;
          if dl > max then
            max:= dl;
          fi;

        od;

        Add( alpha, max );

      od;

      G.alpha:= alpha;
      InfoMonomial( "#I  Alpha returns ", alpha, "\n" );

    fi;

    return Copy( G.alpha );
    end;

##############################################################################
##
#F  Delta( <G> )
##
##  returns the list '[ 1, alp[2] - alp[1], ..., alp[<n>] - alp[<n>-1] ]'
##  where 'alp = Alpha( <G> )'.
##
##  (and stores the result in the group record)
##
Delta := function( G )

    local delta,  # result list
          alpha,  # 'Alpha( <G> )'
          r;      # loop variable

    if not IsBound( G.delta ) then

      delta:= [ 1 ];
      alpha:= Alpha( G );
      for r in [ 2 .. Length( alpha ) ] do
        delta[r]:= alpha[r] - alpha[r-1];
      od;
      G.delta:= delta;

    fi;

    return Copy( G.delta );
    end;

##############################################################################
##
#F  BergerCondition( <obj> )
##
##  Called with a character <chi>, 'BergerCondition' returns 'true' if
##  \[ ( \bigcap\{\ker(\psi);\psi(1) \< 'Degree( <chi> )'\} )^{\prime}
##     \leq \ker(<chi>). \]
##
##  Called with a group <G>, 'BergerCondition' returns 'true' if all
##  irreducible characters of <G> satisfy
##  \[ ( \bigcap_{\psi(1) \leq f_i}  \ker(\psi) )^{\prime} \leq
##       \bigcap_{\chi(1) = f_{i+1}} \ker(\chi) \ \forall 1 \leq i \leq n-1 \]
##  where $1 = f_1 \leq f_2 \leq\ldots \leq f_n$ are the distinct irreducible
##  degrees of <G>.
##
##  In the case that 'false' is returned 'InfoMonomial' tells about the
##  degree for that the inequality is violated.
##
BergerCondition := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.bergerCondition ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.bergerCondition:=
          struct.operations.BergerCondition( struct );
    fi;
    return struct.bergerCondition;
    end;

##############################################################################
##
#F  CharacterOps.BergerCondition( <chi> )
##
CharacterOps.BergerCondition := function( chi )

    local G,           # group of <chi>
          t,           # character table of $G$
          ker,         # intersection of kernels of smaller degree
          deg,         # degree of <chi>
          psi,         # one irreducible character of $G$
          kerchi,      # kernel of <chi> (as group)
          isberger;      # result

    InfoMonomial( "#I  BergerCondition called for character ",
                   CharacterString( chi ), "\n" );

    if chi.values[1] > 1 then

      # We need all characters of smaller degree,
      # so it is reasonable to compute the character table of the group
      t:= CharTable( chi.source );

      ker:= [ 1 .. Length( chi.values ) ];
      deg:= chi.values[1];
      for psi in t.irreducibles do
        if psi[1] < deg then
          IntersectSet( ker, KernelChar( psi ) );
        fi;
      od;

      # Check whether the derived group of this normal subgroup
      # lies in the kernel of 'chi'.
      kerchi:= KernelChar( chi.values );
      if IsSubsetSet( kerchi, ker ) then

        # no need to compute subgroups
        isberger:= true;

      else

        ker:= NormalSubgroupClasses( chi.source, ker );
        isberger:= IsSubgroup( Kernel( chi ), DerivedSubgroup( ker ) );

      fi;

    else

      isberger:= true;

    fi;

    InfoMonomial( "#I  BergerCondition returns ", isberger, "\n" );
    return isberger;
    end;

##############################################################################
##
#F  GroupOps.BergerCondition(  <G> )
##
GroupOps.BergerCondition := function( G )

    local t,           # character table of $G$
          psi,         # one irreducible character of $G$
          isberger,    # result
          degrees,     # different character degrees of 'G'
          kernels,     #
          pos,         #
          i,           # loop variable
          leftinters,  #
          left,        #
          right;       #

    InfoMonomial( "#I  BergerCondition called for group ",
                   GroupString( G, "G" ), "\n" );

    if Size( G ) mod 2 = 1 then

      isberger:= true;

    else

      t:= CharTable( G );
  
      # Compute the intersections of kernels of characters of same degree
      degrees:= [];
      kernels:= [];
      for psi in t.irreducibles do
        pos:= Position( degrees, psi[1] );
        if pos = false then
          Add( degrees, psi[1] );
          Add( kernels, KernelChar( psi ) );
        else
          IntersectSet( kernels[ pos ], KernelChar( psi ) );
        fi;
      od;
      SortParallel( degrees, kernels );
  
      # Let $1 = f_1 \leq f_2 \leq\ldots \leq f_n$ the distinct
      # irreducible degrees of 'G'.
      # We must have for all $1 \leq i \leq n-1$ that
      # \[ ( \bigcap_{\psi(1) \leq f_i}  \ker(\psi) )^{\prime} \leq
      #      \bigcap_{\chi(1) = f_{i+1}} \ker(\chi) \]
  
      i:= 1;
      isberger:= true;
      leftinters:= kernels[1];
  
      while i < Length( degrees ) and isberger do
  
        # 'leftinters' becomes $\bigcap_{\psi(1) \leq f_i} \ker(\psi)$.
        IntersectSet( leftinters, kernels[i] );
        if not IsSubsetSet( kernels[i+1], leftinters ) then
  
          # we have to compute the groups
          left:= DerivedSubgroup( NormalSubgroupClasses( G, leftinters ) );
          right:= NormalSubgroupClasses( G, kernels[i+1] );
          if not IsSubgroup( right, left ) then
  
            isberger:= false;
  
            InfoMonomial( "#I  BergerCondition:  violated for ",
                           "character of degree ", degrees[i+1], "\n" );
  
          fi;
  
        fi;
        i:= i+1;
      od;

    fi;

    InfoMonomial( "#I  BergerCondition returns ", isberger, "\n" );
    return isberger;
    end;

##############################################################################
##
#F  TestHomogeneous( <chi>, <N> )
##
##  returns a record with information whether the restriction of the group
##  character <chi> of the group $G$ to the normal subgroup <N> of $G$ is
##  homogeneous, i.e., is a multiple of an irreducible character.
##
##  <N> may be given also as list of conjugacy class positions w.r. to $G$.
##
TestHomogeneous := function( chi, N )

    local G,        # the group of <chi>
          t,        # character table of 'G'
          values,   # values of <chi>
          cl,       # classes of 'G' that form <N>
          norm,     # norm of the restriction of <chi> to <N>
          test,     # result record
          tn,       # table of <N>
          fus,      # fusion of conjugacy classes <N> in $G$
          rest,     # restriction of <chi> to <N>
          i,        # loop over characters of <N>
          scpr;     # one scalar product in <N>

    values:= chi.values;
    G:= chi.source;
    t:= CharTable( G );

    if IsList( N ) then
      cl:= N;
    else
      cl:= ClassesNormalSubgroup( chi.source, N );
    fi;

    norm:= Sum( cl, c -> t.classes[c] * values[c]
                                      * GaloisCyc( values[c], -1 ) );

    if norm = Sum( t.classes{ cl } ) then

      # The restriction is irreducible.
      test:= rec( isHomogeneous := true,
                  comment       := "restricts irreducibly" );
      return test;

    else

      # 'chi' restricts reducibly.
      # Compute the table of 'N' if necessary,
      # and check the constituents of the restriction
      N:= NormalSubgroupClasses( G, cl );
      tn:= CharTable( N );
      fus:= FusionConjugacyClasses( N, G );
      rest:= values{ fus };

      i:= 1;
      while i <= Length( tn.irreducibles ) do

        scpr:= ScalarProduct( tn, tn.irreducibles[i], rest );
        if scpr <> 0 then

          if scpr * tn.irreducibles[i][1] <> values[1] then

            # nonhomogeneous restriction found,
            # return the constituent
            test:= rec( isHomogeneous := false,
                        comment       := "restriction checked",
                        character     := Character( N, tn.irreducibles[i] ),
                        multiplicity  := scpr  );
            return test;

          else

            test:= rec( isHomogeneous := true,
                        comment       := "restriction checked",
                        character     := Character( N, tn.irreducibles[i] ),
                        multiplicity  := scpr  );
            return test;

          fi;

        fi;

        i:= i+1;

      od;

    fi;

    end;

##############################################################################
##
#F  TestQuasiPrimitive( <chi> )
##
##  returns a record with information about quasiprimitivity of the group
##  character <chi> (i.e., whether <chi> restricts homogeneously to every
##  normal subgroup of <G>).
##
##  The record contains at least the component
##  'isQuasiPrimitive':  \\ 'true' or 'false'.
##
##  If <chi> is not quasiprimitive then there is a component
##
##  'character':  \\ an irreducible constituent of a nonhomogeneous
##                   restriction of <chi>.
##
##  *Note*\:\ For solvable groups quasiprimitivity is the same as primitivity.
##
TestQuasiPrimitive := function( chi )

    local values,   # list of character values
          G,        # group of 'chi'
          t,        # character table of 'G'
          nsg,      # list of normal subgroups of 't'
          cen,      # centre of 'chi'
          allhomog, # are all restrictions up to now homogeneous?
          j,        # loop over normal subgroups
          testhom,  # test of homogeneous restriction
          test;     # result record

    InfoMonomial( "#I  TestQuasiPrimitive called for character ",
                   CharacterString( chi ), "\n" );

    if not IsBound( chi.testQuasiPrimitive ) then

      values:= chi.values;

      # Linear characters are primitive.
      if values[1] = 1 then

        test:= rec( isQuasiPrimitive := true,
                    comment          := "linear character" );

      else

        G:= chi.source;
        t:= CharTable( G );

        # Compute the normal subgroups of 'G' containing the centre of 'chi'.

        # Note that 'chi' restricts homogeneously to all normal subgroups
        # of 'G' if (and only if) it restricts homogeneously to all those
        # normal subgroups containing the centre of 'chi'.

        # {\em Proof:}
        # Let $N \unlhd G$ such that $Z(\chi) \not\leq N$.
        # We have to show that $\chi$ restricts homogeneously to $N$.
        # By our assumption $\chi_{N Z(\chi)}$ is homogeneous,
        # take $\vartheta$ the irreducible constituent.
        # Let $D$ a representation affording $\vartheta$ such that
        # the restriction to $N$ consists of block diagonal matrices
        # corresponding to the irreducible constituents.
        # $D( Z(\chi) )$ consists of scalar matrices,
        # thus $D( n^x ) = D( n )$ for $n\in N$, $x\in Z(\chi)$,
        # i.e., $Z(\chi)$ acts trivially on the irreducible constituents
        # of $\vartheta_N$,
        # i.e., every constituent of $\vartheta_N$ is invariant in $N Z(\chi)$,
        # i.e., $\vartheta$ (and thus $\chi$) restricts homogeneously to $N$.

        nsg:= NormalSubgroups( t );
        cen:= CentreChar( values );
        nsg:= Filtered( nsg, x -> IsSubsetSet( x, cen ) );

        allhomog:= true;
        j:= 1;

        while allhomog and j <= Length( nsg ) do

          testhom:= TestHomogeneous( chi, nsg[j] );
          if not testhom.isHomogeneous then

            # nonhomogeneous restriction found
            allhomog:= false;
            test:= rec( isQuasiPrimitive := false,
                        comment          := testhom.comment,
                        character        := testhom.character );

          fi;

          j:= j+1;

        od;

        if allhomog then
          test:= rec( isQuasiPrimitive := true,
                      comment          := "all restrictions checked" );
        fi;

      fi;

      chi.testQuasiPrimitive:= test;

    fi;

    InfoMonomial( "#I  TestQuasiPrimitive returns with '",
                   chi.testQuasiPrimitive.isQuasiPrimitive, "'\n" );

    return chi.testQuasiPrimitive;
    end;

##############################################################################
##
#F  IsQuasiPrimitive( <chi> )
##
##  returns whether the character <chi> of the group <G> is quasiprimitive,
##  i.e., restricts homogeneously to every normal subgroup of <G>.
##
IsQuasiPrimitive := function( chi )

    if not IsCharacter( chi ) then
      Error( "<chi> must be a group character record" );
    fi;

    if not IsBound( chi.isQuasiPrimitive ) then
      chi.isQuasiPrimitive:= TestQuasiPrimitive( chi ).isQuasiPrimitive;
    fi;
    return chi.isQuasiPrimitive;

    end;

##############################################################################
##
#F  CharacterOps.IsPrimitive( <chi> )
##
##  returns whether the character <chi> of the group <G> is quasiprimitive,
##  i.e., restricts homogeneously to every normal subgroup of <G>.
##
CharacterOps.IsPrimitive := function( chi )

    if not IsSolvable( chi.source ) then
      Error( "sorry, implemented for solvable groups only" );
    fi;

    if not IsBound( chi.isQuasiPrimitive ) then
      chi.isQuasiPrimitive:= TestQuasiPrimitive( chi ).isQuasiPrimitive;
    fi;
    return chi.isQuasiPrimitive;
    end;

##############################################################################
##
#F  TestInducedFromNormalSubgroup( <chi>, <N> )
#F  TestInducedFromNormalSubgroup( <chi> )
##
##  returns a record with information about whether the irreducible group
##  character <chi> of the group $G$ is induced from a proper normal subgroup
##  of $G$.
##
##  If <chi> is the only argument then it is checked whether there is a
##  maximal normal subgroup of $G$ from that <chi> is induced.
##
##  A second argument <N> must be a normal subgroup of $G$ or the list of
##  class positions of a normal subgroup of $G$.  Then it is checked
##  whether <chi> is induced from <N>.
##
##  The result contains always a component 'comment', a string.
##  The component 'isInduced' is 'true' or 'false', depending on whether
##  <chi> is induced.  In the 'true' case the component 'character'
##  contains a character of a maximal normal subgroup from that <chi> is
##  induced.
##
TestInducedFromNormalSubgroup := function( arg )

    local sizeN,      # size of <N>
          sizefactor, # size of $G / <N>$
          m,          # list of all maximal normal subgroups of $G$
          test,       # intermediate result
          tn,         # character table of <N>
          i,          # loop variable
          stop,       # check irreducibles until here only
          scpr,       # one scalar product in <N>
          N,          # optional second argument
          cl,         # classes corresponding to 'N'
          chi;        # first argument

    # check the arguments
    if Length( arg ) < 1 or Length( arg ) > 2
       or not IsCharacter( arg[1] ) then
      Error( "usage: TestInducedFromNormalSubgroup( <chi> [,<N>] )" );
    fi;

    chi:= arg[1];

    InfoMonomial( "#I  TestInducedFromNormalSubgroup called with\n",
                   "#I     character ", CharacterString( chi ), "\n" );

    if Length( arg ) = 1 then

      # 'TestInducedFromNormalSubgroup( <chi> )'

      if chi.values[1] = 1 then

        return rec( isInduced:= false,
                    comment  := "linear character" );

      else

        # Get all maximal normal subgroups.
        m:= MaximalNormalSubgroups( CharTable( chi.source ) );

        for N in m do

          test:= TestInducedFromNormalSubgroup( chi, N );
          if test.isInduced then
            return test;
          fi;

        od;

        return rec( isInduced := false,
                    comment   := "all maximal normal subgroups checked" );
      fi;

    else

      # 'TestInducedFromNormalSubgroup( <chi>, <N> )'

      N:= arg[2];

      # 1. If the degree of <chi> is not divisible by the index of <N> in $G$
      #    then <chi> cannot be induced from <N>.
      # 2. If <chi> does not vanish outside <N> it cannot be induced from <N>.
      # 3. Provided that <chi> vanishes outside <N>, <chi> is induced from <N>
      #    if and only if the restriction of <chi> to <N> has an irreducible
      #    constituent with multiplicity 1.
      #
      #    Since the scalar product of the restriction with itself has value
      #    $G \: N$, multiplicity 1 means that there are $G \: N$ conjugates
      #    of this constituent, so <chi> is induced from each of them.
      #
      #    This gives another necessary condition that is easy to check.
      #    Namely, <N> must have more than $G \: <N>$ conjugacy classes if
      #    <chi> is induced from <N>.

      if IsList( N ) then
        sizeN:= Sum( CharTable( chi.source ).classes{ N } );
      elif IsGroup( N ) then
        sizeN:= Size( N );
      else
        Error( "<N> must be a group or a list" );
      fi;

      sizefactor:= Size( chi.source ) / sizeN;

      if   chi.values[1] mod sizefactor <> 0 then

        return rec( isInduced := false,
                    comment   := "degree not divisible by index" );

      elif sizeN <= sizefactor then

        return rec( isInduced := false,
                    comment   := "<N> has too few conjugacy classes" );

      fi;

      if IsList( N ) then

        # Check whether the character vanishes outside <N>.
        for i in [ 2 .. Length( chi.values ) ] do
          if not i in N and chi.values[i] <> 0 then
            return rec( isInduced := false,
                        comment   := "<chi> does not vanish outside <N>" );
          fi;
        od;

        cl:= N;
        N:= NormalSubgroupClasses( chi.source, N );

      else

        # Check whether <N> has less conjugacy classes than its index is.
        if Length( ConjugacyClasses( N ) ) <= sizefactor then

          return rec( isInduced := false,
                      comment   := "<N> has too few conjugacy classes" );

        fi;

        cl:= ClassesNormalSubgroup( chi.source, N );

        # Check whether the character vanishes outside <N>.
        for i in [ 2 .. Length( chi.values ) ] do
          if not i in cl and chi.values[i] <> 0 then
            return rec( isInduced := false,
                        comment   := "<chi> does not vanish outside <N>" );
          fi;
        od;

      fi;

      # Compute the restriction to <N>.
      chi:= chi.values{ FusionConjugacyClasses( N, chi.source ) };

      # Check possible constituents.
      tn:= CharTable( N );
      stop:= Length( tn.irreducibles ) - sizefactor + 1;
      for i in [ 1 .. stop ] do

        scpr:= tn.operations.NoMessageScalarProduct( tn,
                                       tn.irreducibles[i], chi );

        if   scpr > 1 then

          return rec( isInduced := false,
                      comment   := Concatenation(
                                     "constituent with multiplicity ",
                                     String( scpr ) ) );

        elif scpr = 1 then

          return rec( isInduced := true,
                      comment   := "induced from component \'.character\'",
                      character := Character( N, tn.irreducibles[i] ) );

        fi;

      od;

      return rec( isInduced := false,
                  comment   := "all irreducibles of <N> checked" );

    fi;

    end;

##############################################################################
##
#F  IsInducedFromNormalSubgroup( <chi> )
##
##  returns whether the character <chi> of the group $G$ is induced from a
##  normal subgroup of $G$.
##
IsInducedFromNormalSubgroup := function( chi )

    if not IsCharacter( chi ) then
      Error( "<chi> must be a group character record" );
    fi;

    if not IsBound( chi.isInducedFromNormalSubgroup ) then
      chi.isInducedFromNormalSubgroup:=
                    TestInducedFromNormalSubgroup( chi ).isInduced;
    fi;
    return chi.isInducedFromNormalSubgroup;

    end;

##############################################################################
##
#F  TestSubnormallyMonomial( <obj> )
##
##  returns a record with information whether the group <G> or the
##  irreducible group character <chi> is subnormally monomial.
##
##  The result contains components 'comment' (a string)
##  and 'isSubnormallyMonomial' ('true' or 'false');
##  in the case that 'isSubnormallyMonomial' is 'false' there is also
##  a component 'character' that is not a SM character.
##
TestSubnormallyMonomial := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.testSubnormallyMonomial ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.testSubnormallyMonomial:=
          struct.operations.TestSubnormallyMonomial( struct );
    fi;
    return struct.testSubnormallyMonomial;
    end;

##############################################################################
##
#F  GroupOps.TestSubnormallyMonomial( <G> )
##
GroupOps.TestSubnormallyMonomial := function( G )

    local test,       # result record
          t,          # character table of 'G'
          orbits,     # orbits of characters
          chi,
          found,      # decision is found
          i;          # loop variable

    InfoMonomial( "#I  TestSubnormallyMonomial called for group ",
                   GroupString( G, "G" ), "\n" );

    if IsNilpotent( G ) then

      # Nilpotent groups are subnormally monomial.
      test:= rec( isSubnormallyMonomial:= true,
                  comment := "nilpotent group" );

    else

      # Check SM character by character,
      # one representative of each orbit under Galois conjugacy
      # and multiplication with linear characters only.

      t:= CharTable( G );
      orbits:= OrbitRepresentativesCharacters( t.irreducibles );

      # For each representative check whether it is SM.
      # (omit linear characters, i.e., first position)
      found:= false;
      i:= 2;
      while ( not found ) and i <= Length( orbits ) do

        chi:= orbits[i];
        if not TestSubnormallyMonomial( Character( G, chi )
                                   ).isSubnormallyMonomial then

          found:= true;
          test:= rec( isSubnormallyMonomial:= false,
                      character := Character( G, chi ),
                      comment   := "found not SM character" );

        fi;
        i:= i+1;

      od;

      if not found then

        test:= rec( isSubnormallyMonomial:= true,
                    comment   := "all irreducibles checked" );

      fi;

    fi;

    # Return the result.
    InfoMonomial( "#I  TestSubnormallyMonomial returns with '",
                   test.isSubnormallyMonomial, "'\n" );
    return test;
    end;

##############################################################################
##
#F  CharacterOps.TestSubnormallyMonomial( <chi> )
##
CharacterOps.TestSubnormallyMonomial := function( chi )

    local test,       # result record
          testsm;     # local function for recursive check

    InfoMonomial( "#I  TestSubnormallyMonomial called for character ",
                   CharacterString( chi ), "\n" );

    if    chi.values[1] = 1 then

      # Linear characters are subnormally monomial.
      test:= rec( isSubnormallyMonomial:= true,
                  comment := "linear character",
                  character := chi );

    elif IsBound( chi.source.isSubnormallyMonomial ) and
         chi.source.isSubnormallyMonomial then

      # If the group knows that it is subnormally monomial return this.
      test:= rec( isSubnormallyMonomial:= true,
                  comment := "subnormally monomial group",
                  character := chi );

    elif IsNilpotent( chi.source ) then

      # Nilpotent groups are subnormally monomial.
      test:= rec( isSubnormallyMonomial:= true,
                  comment := "nilpotent group",
                  character := chi );

    else

      # We have to check recursively.

      # Given a character 'chi' of the group $N$, and two classes lists
      # 'forbidden' and 'allowed' that describe all maximal normal
      # subgroups of $N$, where 'forbidden' denotes all those normal
      # subgroups through that 'chi' cannot be subnormally induced,
      # return either a linear character of a subnormal subgroup of $N$
      # from that 'chi' is induced, or 'false' if no such character exists.
      # If we reach a nilpotent group then we return a character of this
      # group, so the character is not necessarily linear.

      testsm:= function( chi, forbidden, allowed )

      local N,       # group of 'chi'
            mns,     # max. normal subgroups
            forbid,  #
            n,       # one maximal normal subgroup
            cl,
            len,
            nt,
            fus,
            rest,
            deg,
            const,
            nallowed,
            nforbid,
            gp,
            fusgp,
            test;

      forbid:= ShallowCopy( forbidden );
      N:= chi.source;
      chi:= chi.values;
      len:= Length( chi );

      # Loop over 'allowed'.
      for cl in allowed do

        if ForAll( [ 1 .. len ], x -> chi[x] = 0 or x in cl ) then

          # 'chi' vanishes outside 'n', so is induced from 'n'.

          n:= NormalSubgroupClasses( N, cl );
          nt:= CharTable( n );
  
          # Compute a constituent of the restriction of 'chi' to 'n'.
          fus:= FusionConjugacyClasses( n, N );
          rest:= chi{ fus };
          deg:= chi[1] * Size( n ) / Size( N );
          const:= First( nt.irreducibles,
                     x -> x[1] = deg and ScalarProduct( nt, x, rest ) > 0 );
          const:= Character( n, const );
  
          # Check termination.
          if   const.values[1] = 1 or IsNilpotent( const.source ) then
            return const;
          elif Length( allowed ) = 0 then
            return false;
          fi;
    
          # Compute allowed and forbidden maximal normal subgroups of 'n'.
          mns:= MaximalNormalSubgroups( nt );
          nallowed:= [];
          nforbid:= [];
          for gp in mns do
  
            # A group is forbidden if it is the intersection of a group
            # in 'forbid' with 'n'.
            fusgp:= Set( fus{ gp } );
            if ForAny( forbid, x -> IsSubsetSet( x, fusgp ) ) then
              Add( nforbid, gp );
            else
              Add( nallowed, gp );
            fi;
  
          od;
  
          # Check whether 'const' is subnormally induced from 'n'.
          test:= testsm( const, nforbid, nallowed );
          if test <> false then
            return test;
          fi;

        fi;

        # Add 'n' to the forbidden subgroups.
        Add( forbid, cl );

      od;
        
      # All allowed normal subgroups have been checked.
      return false;
      end;


      # Run the recursive search.
      # Here all maximal normal subgroups are allowed.
      test:= testsm( chi, [],
                     MaximalNormalSubgroups( CharTable( chi.source ) ) );

      # Prepare the output.
      if test = false then
        test:= rec( isSubnormallyMonomial:= false,
                    comment   := "all subnormal subgroups checked" );
      elif test.values[1] = 1 then
        test:= rec( isSubnormallyMonomial:= true,
                    comment   := "reduced to linear character",
                    character := test );
      else
        test:= rec( isSubnormallyMonomial:= true,
                    comment   := "reduced to nilpotent subgroup",
                    character := test );
      fi;

    fi;

    InfoMonomial( "#I  TestSubnormallyMonomial returns with '",
                   test.isSubnormallyMonomial, "'\n" );
    return test;

    end;

##############################################################################
##
#F  IsSubnormallyMonomial( <G> )
#F  IsSubnormallyMonomial( <chi> )
##
IsSubnormallyMonomial := function( obj )
    if not IsBound( obj.isSubnormallyMonomial ) then
      obj.isSubnormallyMonomial:=
           TestSubnormallyMonomial( obj ).isSubnormallyMonomial;
    fi;
    return obj.isSubnormallyMonomial;
    end;

####################################################################
##
#F  IntegersOps.IsMonomial( <n> )
##
##  returns 'true' if every group of order <n> is monomial,
##  and 'false' otherwise.
##
##  Let $\nu_p(n)$ denote the multiplicity of the prime $p$ as
##  factor of $n$, and $ord(p,q)$ the multiplicative order of $p \pmod{q}$.
##
##  Then there exists a nomonomial group of order $n$ if and only if
##  one of the following conditions is satisfied.
##
##  \begin{enumerate}
##  \item $\nu_2(n) \geq 2$ and there is a $p$ such that
##        $\nu_p(n) \geq 3$ and $p \equiv -1 \pmod{4}$,
##  \item $\nu_2(n) \geq 3$ and there is a $p$ such that
##        $\nu_p(n) \geq 3$ and $p \equiv  1 \pmod{4}$,
##  \item there are odd prime divisors $p$ and $q$ of $n$ such that
##        $ord(p,q)$ is even and $ord(p,q) < \nu_p(n)$
##        (especially $\nu_p(n) \geq 3$),
##  \item there is a prime divisor $q$ of $n$ such that
##        $\nu_2(n) \geq 2 ord(2,q) + 2$
##        (especially $\nu_2(n) \geq 4$),
##  \item $\nu_2(n) \geq 2$ and there is a $p$ such that
##        $p \equiv  1 \pmod{4}$, $ord(p,q)$ is odd,
##        and $2 ord(p,q) < \nu_p(n)$
##        (especially $\nu_p(n) \geq 3$).
##  \end{enumerate}
##
##  These five possibilities correspond to the five types of minimal
##  nonmonomial groups that can occur as subgroup or factor group of
##  the group with order $n$.
##
IntegersOps.IsMonomial := function( n )

    local factors,   # list of prime factors of 'n'
          collect,   # list of (prime divisor, exponent) pairs
          nu2,       # $\nu_2(n)$
          pair,      # loop over 'collect'
          pair2,     # loop over 'collect'
          ord;       # multiplicative order

    factors := FactorsInt( n );
    collect := Collected( factors );

    # Get $\nu_2(n)$.
    if 2 in factors then
      nu2:= collect[1][2];
    else
      nu2:= 0;
    fi;

    # Check for minimal nonmonomial groups of type 1.
    if nu2 >= 2 then
      for pair in collect do
        if pair[1] mod 4 = 3 and pair[2] >= 3 then
          return false;
        fi;
      od;
    fi;

    # Check for minimal nonmonomial groups of type 2.
    if nu2 >= 3 then
      for pair in collect do
        if pair[1] mod 4 = 1 and pair[2] >= 3 then
          return false;
        fi;
      od;
    fi;

    # Check for minimal nonmonomial groups of type 3.
    for pair in collect do
      for pair2 in collect do
        if pair[1] <> pair2[1] and pair2[1] <> 2 then
          ord:= OrderMod( pair[1], pair2[1] );
          if ord mod 2 = 0 and ord < pair[2] then
            return false;
          fi;
        fi;
      od;
    od;

    # Check for minimal nonmonomial groups of type 4.
    if nu2 >= 4 then
      for pair in collect do
        if pair[1] <> 2 and nu2 >= 2* OrderMod( 2, pair[1] ) + 2 then
          return false;
        fi;
      od;
    fi;

    # Check for minimal nonmonomial groups of type 5.
    if nu2 >= 2 then
      for pair in collect do
        if pair[1] mod 4 = 1 and pair[2] >= 3 then
          for pair2 in collect do
            if pair2[1] <> 2 then
              ord:= OrderMod( pair[1], pair2[1] );
              if ord mod 2 = 1 and 2 * ord < pair[2] then
                return false;
              fi;
            fi;
          od;
        fi;
      od;
    fi;

    # None of the five cases can occur.
    return true;

    end;

##############################################################################
##
#F  TestMonomialQuick( <obj> )
##
##  returns a record with components
##
##  'isMonomial': \\ either 'true' or 'false' or '"?"'
##
##  The function sets the 'isMonomial' flag if (non)monomiality was proved.
##
TestMonomialQuick := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.testMonomialQuick ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.testMonomialQuick:=
          struct.operations.TestMonomialQuick( struct );
    fi;
    return struct.testMonomialQuick;
    end;

##############################################################################
##
#F  CharacterOps.TestMonomialQuick( <chi> )
##
##  The following criteria are used for a group character <chi>.
##
##  o Linear characters are monomial.
##  o If the group has the component 'isMonomial' with value 'true' then
##    <chi> is monomial.
##  o If the codegree is a prime power then the character is monomial.
#T
#T  o Let $\pi$ be the set of primes in the codegree of <chi>.
#T    Then <chi> is induced from a Hall $\pi$ subgroup.
#T    A quick test would be to check cubefreeness of its group order.
##
##  o The factor group modulo the kernel is checked for monomiality
##    by 'TestMonomialQuick'.
##
##  It is *not* checked whether the whole group can be proved to be monomial
##  by 'TestMonomialQuick'.
##  (So for faithful characters no group check is done.)
##  This is because in a loop over several characters each time the group
##  test would be called.
##
CharacterOps.TestMonomialQuick := function( chi )

    local G,          # group of 'chi'
          test,       # the result record
          ker,        # kernel of 'chi'
          t,          # character table of 'G'
          grouptest;  # result of the call to 'G / ker'

    InfoMonomial( "#I  TestMonomialQuick called for character ",
                   CharacterString( chi ), "\n" );

    # If the character knows about being monomial return this.
    if   IsBound( chi.isMonomial ) then

      test:= rec( isMonomial := chi.isMonomial,
                  comment    := "was already stored" );

    else

      G   := chi.source;
      chi := chi.values;

      if chi[1] = 1 then

        # Linear characters are monomial.
        test:= rec( isMonomial := true,
                    comment    := "linear character" );

      elif IsPrimePowerInt( Size( G ) / chi[1] ) then

        # If the codegree is a prime power then the character is monomial
        # (Chillag, Mann, Manz).
        test:= rec( isMonomial := true,
                    comment    := "codegree is prime power" );

      else

        # Check whether the factor group modulo the kernel
        # can be proved quickly to be monomial.
        ker:= KernelChar( chi );
        if Length( ker ) > 1 then

          # Check whether the factor group modulo the kernel
          # is supersolvable.
          t:= CharTable( G );
          if IsSubsetSet( ker, SupersolvableResiduum( t ) ) then

            # First try to prove supersolvability without computing
            # the factor group.
#T Is there more one can do without this?
            test:= rec( isMonomial:= true,
                        comment:= "kernel factor group is supersolvable" );

          else

            grouptest:= TestMonomialQuick(
                         FactorGroupNormalSubgroupClasses( G, ker ) );
            if grouptest.isMonomial = true then

              test:= rec( isMonomial := true,
                          comment    := "kernel factor group is monomial" );

            else

              # No more cheap tests are available.
              test:= rec( isMonomial := "?",
                          comment    := "no decision by cheap tests" );

            fi;

          fi;

        else

          # No more cheap tests are available.
          test:= rec( isMonomial := "?",
                      comment    := "no decision by cheap tests" );

        fi;

      fi;

    fi;

    InfoMonomial( "#I  TestMonomialQuick returns with '",
                   test.isMonomial, "'\n" );
    return test;

    end;

##############################################################################
##
#F  GroupOps.TestMonomialQuick( <G> )
##
##  The following criteria are used for a group <G>.
##
##  o Nonsolvable groups are not monomial.
##  o If the group order is monomial then <G> is monomial.
##    (Note that monomiality of group orders is defined for solvable
##     groups only, so solvability has to be checked first.)
##  o Nilpotent groups are monomial.
##  o Abelian by supersolvable groups are monomial.
##  o Sylow abelian by supersolvable groups are monomial.
##    (Compute the Sylow subgroups of the supersolvable residuum,
##     and check whether they are abelian.)
##
GroupOps.TestMonomialQuick := function( G )

    local test,       # the result record
          ssr;        # supersolvable residuum of 'G'

    InfoMonomial( "#I  TestMonomialQuick called for group ",
                   GroupString( G, "G" ), "\n" );

    # If the character or group knows about being monomial return this.
    if   IsBound( G.isMonomial ) then

      test:= rec( isMonomial := G.isMonomial,
                  comment    := "was already stored" );

    elif not IsSolvable( G ) then

      # Monomial groups are solvable.
      test:= rec( isMonomial := false,
                  comment    := "not solvable group" );

    else

      if IsMonomial( Size( G ) ) then

        # Every group of this order is monomial.
        test:= rec( isMonomial := true,
                    comment    := "group order is monomial" );

      elif IsNilpotent( G ) then

        # Nilpotent groups are monomial.
        test:= rec( isMonomial := true,
                    comment    := "nilpotent group" );

      else

        ssr:= SupersolvableResiduum( G );

        if Size( ssr ) = 1 then

          # Supersolvable groups are monomial.
          test:= rec( isMonomial := true,
                      comment    := "supersolvable group" );

        elif IsAbelian( ssr ) then

          # Abelian by supersolvable groups are monomial.
          test:= rec( isMonomial := true,
                      comment    := "abelian by supersolvable group" );

        elif ForAll( Set( FactorsInt( Size( ssr ) ) ),
                     x -> IsAbelian( SylowSubgroup( ssr, x ) ) ) then

          # Sylow abelian by supersolvable groups are monomial.
          test:= rec( isMonomial := true,
                      comment    := "Sylow abelian by supersolvable group" );

        else

          # No more cheap tests are available.
          test:= rec( isMonomial := "?",
                      comment    := "no decision by cheap tests" );

        fi;

      fi;

    fi;

    InfoMonomial( "#I  TestMonomialQuick returns with '",
                   test.isMonomial, "'\n" );
    return test;
    end;

##############################################################################
##
#F  TestMonomial( <obj> )
##
##  returns a record containing information about monomiality of the group <G>
##  or the group character <chi>, respectively.
##
##  If a character <chi> was proved to be monomial the result contains
##  components 'isMonomial' (then 'true'), 'comment' (a string telling a
##  reason for monomiality), and if it was necessary to compute a linear
##  character from that <chi> is induced, also a component 'character'.
##
##  If <chi> or <G> was proved to be nonmonomial the component 'isMonomial'
##  is 'false', and in the case of <G> a nonmonomial character is contained
##  in the component 'character' if it had been necessary to compute it.
##
##  If the program cannot prove or disprove monomiality, then the result
##  record contains the component 'isMonomial' with value '\"?\"'.
##
##  The open problem is:
##  Can it happen that for all normal subgroups to that the restriction is
##  not homogeneous the inertia groups in question do not contain a subgroup
##  from that the character is induced?
##
##  The algorithm proceeds as follows.
##  Called with a character <chi> as argument, 'TestMonomialQuick( <chi> )'
##  is inspected first.  If this did not decide the question, we test all
##  those normal subgroups of $G$ to that <chi> restricts nonhomogeneously
##  whether the interesting character of the inertia subgroup is monomial.
##  (If <chi> is quasiprimitive then it is nonmonomial.)
##
##  Called with a group <G> the program checks whether all representatives
##  of character orbits are monomial.
##
TestMonomial := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.testMonomial ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.testMonomial:=
          struct.operations.TestMonomial( struct );
    fi;
    return struct.testMonomial;
    end;

##############################################################################
##
#F  CharacterOps.TestMonomial( <chi> )
##
CharacterOps.TestMonomial := function( chi )

    local G,         # group of 'chi'
          test,      # result record
          t,         # character table of 'G'
          nsg,       # list of normal subgroups of 'G'
          ker,       # kernel of 'chi'
          isqp,      # is 'chi' quasiprimitive
          i,         # loop over normal subgroups
          testhom,   # does 'chi' restrict homogeneously
          theta,     # constituent of the restriction
          found,     # monomial character found
          found2,    # monomial character found
          T,         # inertia group of 'theta'
          fus,       # fusion of conjugacy classes 'T' in 'G'
          deg,       # degree of 'theta'
          rest,      # restriction of 'chi' to 'T'
          j,         # loop over irreducibles of 'T'
          psi,       # character of 'T'
          testmon,   # test for monomiality
          orbits,    # orbits of irreducibles of 'T'
          poss;      # list of possibly nonmonomial characters

    InfoMonomial( "#I  TestMonomial called\n" );

    # elementary test for monomiality
    test:= TestMonomialQuick( chi );

    if test.isMonomial = "?" then

      G:= chi.source;

      if not IsSolvable( G ) then
        Error( "sorry, no implementation for nonsolvable groups" );
      fi;

      t:= CharTable( G );

      # Loop over all normal subgroups of 'G' to that <chi> restricts
      # nonhomogeneously.
      # (If there are no such normal subgroups then <chi> is
      # quasiprimitive hence not monomial.)
      nsg:= NormalSubgroups( t );
      ker:= KernelChar( chi.values );
      nsg:= Filtered( nsg, x -> IsSubsetSet( x, ker ) );

      isqp:= true;

      i:= 1;
      found:= false;

      while not found and i <= Length( nsg ) do

        testhom:= TestHomogeneous( chi, nsg[i] );
        if not testhom.isHomogeneous then

          isqp:= false;

          # Take a constituent 'theta' in a nonhomogeneous restriction.
          theta:= testhom.character;

          # We have $<chi>_N = e \sum_{i=1}^t \theta_i$.
          # <chi> is induced from an irreducible character of
          # $'T' = I_G(\theta_1)$ that restricts to $e \theta_1$,
          # so we have proved monomiality if $e = \theta(1) = 1$.
          if testhom.multiplicity = 1 and theta.values[1] = 1 then

            found:= true;
            test:= rec( isMonomial := true,
                        comment    := "induced from \'character\'",
                        character  := theta );

          else

            # Compute the inertia group 'T'.
            T:= InertiaSubgroup( G, theta );
            if TestMonomialQuick( T ).isMonomial = true then

              # 'chi' is induced from 'T', and 'T' is monomial.
              found:= true;
              test:= rec( isMonomial := true,
                          comment    := "induced from monomial subgroup",
                          subgroup   := T );

            else

              # Check whether a character of 'T' from that <chi>
              # is induced can be proved to be monomial.

              # First get all characters 'psi' of 'T'
              # from that <chi> is induced.
              t:= Irr( T );
              fus:= FusionConjugacyClasses( T, G );
              deg:= chi.values[1] / Index( G, T );
              rest:= chi.values{ fus };
              j:= 1;
              found2:= false;
              while not found2 and j <= Length(t) do
                if t[j].values[1] = deg and
                   ScalarProduct( T.charTable,
                                  t[j].values, rest ) <> 0 then
                  psi:= t[j];
                  testmon:= TestMonomial( psi );
                  if testmon.isMonomial = true then
                    found:= true;
                    found2:= true;
                    test:= testmon;
                  fi;
                fi;
                j:= j+1;
              od;

            fi;

          fi;

        fi;

        i:= i+1;

      od;

      if isqp then

        # <chi> is quasiprimitive, for a solvable group this implies
        # primitivity, for a nonlinear character this proves
        # nonmonomiality.
        test:= rec( isMonomial := false,
                    comment    := "quasiprimitive character" );

      elif not found then

        # We have tried all suitable normal subgroups and always got
        # back that the character of the inertia subgroup was
        # (possibly) nonmonomial.
        # So we do not know whether <chi> is monomial.
        test:= rec( isMonomial:= "?",
                    comment:= "all inertia subgroups checked, no result" );

      fi;

    fi;

    InfoMonomial( "#I  TestMonomial returns with '",
                   test.isMonomial, "'\n" );
    return test;
    end;

##############################################################################
##
#F  GroupOps.TestMonomial( <G> )
##
GroupOps.TestMonomial := function( G )

    local test,      # result record
          found,     # monomial character found
          testmon,   # test for monomiality
          j,         # loop over irreducibles of 'T'
          psi,       # character of 'T'
          orbits,    # orbits of irreducibles of 'T'
          poss;      # list of possibly nonmonomial characters

    InfoMonomial( "#I  TestMonomial called\n" );

    # elementary test for monomiality
    test:= TestMonomialQuick( G );

    if test.isMonomial = "?" then

      if Size( G ) mod 2 = 0 and ForAny( Delta( G ), x -> x > 1 ) then

        # For even order groups it is checked whether
        # the list 'Delta( G )' contains an entry that is bigger
        # than one. (For monomial groups and for odd order groups
        # this is always less then one, according to Taketa\'s Theorem
        # and Berger\'s result).

        test:= rec( isMonomial := false,
                    comment    := "list Delta( G ) contains entry > 1" );

      else

        orbits:= OrbitRepresentativesCharacters( Irr( G ) );
        found:= false;
        j:= 2;
        poss:= [];
        while ( not found ) and j <= Length( orbits ) do
          psi:= orbits[j];
          testmon:= TestMonomial( psi ).isMonomial;
          if testmon = false then
            found:= true;
          elif testmon = "?" then
            Add( poss, psi );
          fi;
          j:= j+1;
        od;

        if found then

          # nonmonomial character found
          test:= rec( isMonomial := false,
                      comment    := "nonmonomial character found",
                      character  := psi );

        elif Length( poss ) = 0 then

          # all checks answered 'true'
          test:= rec( isMonomial := true,
                      comment    := "all characters checked" );

        else

          test:= rec( isMonomial := "?",
                      comment    := "(possibly) nonmonomial characters found",
                      characters := poss );

        fi;

      fi;

    fi;

    # Return the result.
    InfoMonomial( "#I  TestMonomial returns with '", test.isMonomial,
                   "'\n" );
    return test;
    end;

##############################################################################
##
#F  GroupOps.IsMonomial( <struct> ) . . . . . . .  monomiality test for groups
#F  CharacterOps.IsMonomial( <struct> ) . . .  monomiality test for characters
##
GroupOps.IsMonomial := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isMonomial ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isMonomial:=
                  struct.operations.TestMonomial( struct ).isMonomial;
    fi;
    return struct.isMonomial;
    end;

CharacterOps.IsMonomial := GroupOps.IsMonomial;

##############################################################################
##
#F  TestRelativelySM( <G> )
#F  TestRelativelySM( <chi> )
#F  TestRelativelySM( <G>, <N> )
#F  TestRelativelySM( <chi>, <N> )
##
##  If the only argument is a SM group $G$ or an irreducible character of a
##  SM group $G$ then 'TestRelativelySM' returns a record with information
##  about whether the argument is relatively SM with respect to every normal
##  subgroup of $G$.
##
##  If there is a second argument, a normal subgroup <N> of $G$, then
##  'TestRelativelySM' returns a record with information whether the first
##  argument is relatively SM with respect to <N>, i.e, whether there is a
##  subnormal subgroup $H$ of $G$ that contains <N> such that the character
##  <chi> resp. every irreducible character of $G$ is induced from a character
##  $\psi$ of $H$ where the restriction of $\psi$ to <N> is irreducible.
##
##  The component 'isRelativelySM' is 'true' or 'false', the component
##  'comment' contains a string that describes the reason.
##  If the argument is <G>, and <G> is not relatively SM with respect to
##  a normal subgroup then the component 'character' contains a not
##  relatively SM character of such a normal subgroup.
##
##  *Note* that it is not checked whether $G$ is SM.
##
##  The algorithm for a character <chi> and a normal subgroup <N>
##  proceeds as follows.
##  If <N> is abelian or has nilpotent factor then <chi> is relatively SM
##  with respect to <N>.
##  Otherwise we check whether <chi> restricts irreducibly to <N>; in this
##  case we also get a positive answer.
##  Otherwise a subnormal subgroup from that <chi> is induced must be
##  contained in a maximal normal subgroup of <N>.  So we get all maximal
##  normal subgroups containing <N> from that <chi> can be induced, take a
##  character that induces to <chi>, and check recursively whether it is
##  relatively subnormally monomial with respect to <N>.
##
##  For a group $G$ we consider only representatives of character orbits.
##
TestRelativelySM := function( arg )

    local test,      # result record
          G,         # argument, group
          chi,       # argument, character of 'G'
          N,         # argument, normal subgroup of 'G'
          n,         # classes in 'N'
          t,         # character table of 'G'
          nsg,       # list of normal subgroups of 'G'
          newnsg,    # filtered list of normal subgroups
          orbits,    # orbits on 't.irreducibles'
          found,     # not relatively SM character found?
          i,         # loop over 'nsg'
          j,         # loop over characters
          fus,       # fusion of conjugacy classes 'N' in 'G'
          norm,      # norm of restriction of 'chi' to 'N'
          isrelSM,   # is the constituent relatively SM?
          check,     #
          induced,   # is a subnormal subgroup found from where
                     # the actual character can be induced?
          k;         # loop over 'newnsg'

    # step 1:
    # Check the arguments.
    if   Length( arg ) < 1 or Length( arg ) > 2 or not IsRec( arg[1] ) then
      Error( "first argument must be group or character" );
    elif IsBound( arg[1].testRelativelySM ) then
      return arg[1].testRelativelySM;
    fi;

    if IsGroup( arg[1] ) then
      G:= arg[1];
      InfoMonomial( "#I  TestRelativelySM called with group ",
                     GroupString( G, "G" ), "\n" );
    elif IsClassFunction( arg[1] ) then
      G:= arg[1].source;
      chi:= arg[1].values;
      InfoMonomial( "#I  TestRelativelySM called with character ",
                     CharacterString( G, "G" ), "\n" );
    fi;

    # step 2:
    # Get the interesting normal subgroups.

    # We want to consider normal subgroups and factor groups.
    # If this test  yields a solution we can avoid to compute
    # the character table of 'G'.
    # But if the character table of 'G' is already known we use it
    # and store the factor groups.

    if   Length( arg ) = 1 then

      # If a normal subgroup <N> is abelian or has nilpotent factor group
      # then <G> is relatively SM w.r. to <N>, so consider only the other
      # normal subgroups.

      if IsBound( G.charTable ) then

        nsg:= NormalSubgroups( G.charTable );
        newnsg:= [];
        for n in nsg do
          if not CharTableOps.IsNilpotentFactor( G.charTable, n ) then
            N:= NormalSubgroupClasses( G, n );
#T geht das?
#T        if IsSubset( n, centre ) and
            if not IsAbelian( N ) then
              Add( newnsg, N );
            fi;
          fi;
        od;
        nsg:= newnsg;

      else

        nsg:= NormalSubgroups( G );
        nsg:= Filtered( nsg, x -> not IsAbelian( x ) and
                                  not IsNilpotent( G / x ) );

      fi;

    elif Length( arg ) = 2 then

      nsg:= [];

      if IsList( arg[2] ) then

        if not CharTableOps.IsNilpotentFactor( G.charTable, arg[2] ) then
          N:= NormalSubgroupClasses( arg[2] );
          if not IsAbelian( N ) then
            nsg[1]:= N;
          fi;
        fi;

      elif IsGroup( arg[2] ) then

        N:= arg[2];
        if not IsAbelian( N ) and not IsNilpotent( G / N ) then
          nsg[1]:= N;
        fi;

      else
        Error( "second argument must be normal subgroup or classes list" );
      fi;

    fi;

    # step 3:
    # Test whether all characters are relatively SM for all interesting
    # normal subgroups.

    if Length( nsg ) = 0 then

      test:= rec( isRelativelySM := true,
#T  get rid of ConcatenationString!
                  comment        := ConcatenationString( "normal subgroups",
                        " are abelian or have nilpotent factor group" ) );

    else

      t:= CharTable( G );
      if IsGroup( arg[1] ) then

        # Compute representatives of orbits of characters.
        orbits:= OrbitRepresentativesCharacters( t.irreducibles );
        orbits:= orbits{ [ 2 .. Length( orbits ) ] };

      else
        orbits:= [ chi ];
      fi;

      # Loop over all normal subgroups in 'nsg' and all
      # irreducible characters in 'orbits' until a not rel. SM
      # character is found.
      found:= false;
      i:= 1;
      while ( not found ) and i <= Length( nsg ) do

        N:= nsg[i];
        j:= 1;
        while ( not found ) and j <= Length( orbits ) do

#T use the kernel or centre here!!
#T if N does not contain the centre of chi then we need not test?
#T Isn't it sufficient to consider the factor modulo
#T the product of 'N' and kernel of 'chi'?
          chi:= orbits[j];

          # Is the restriction of 'chi' to 'N' irreducible?
          # This means we can choose $H = G$.
          n:= ClassesNormalSubgroup( G, N );
          fus:= FusionConjugacyClasses( N, G );
          norm:= Sum( n, c -> CharTable( G ).classes[c] * chi[c]
                                        * GaloisCyc( chi[c], -1 ) );
  
          if norm = Size( N ) then

            test:= rec( isRelativelySM := true,
                        comment        := "irreducible restriction",
                        character      := Character( G, chi ) );

          else

            # If there is a subnormal subgroup $H$ from where <chi> is
            # induced then $H$ is contained in a maximal normal subgroup
            # of $G$ that contains <N>.

            # So compute all maximal subgroups ...
            newnsg:= MaximalNormalSubgroups( CharTable( G ) );

            # ... containing <N> ...
            newnsg:= Filtered( newnsg, x -> IsSubsetSet( x, n ) );

            # ... from where <chi> possibly can be induced.
            newnsg:= List( newnsg,
                           x -> TestInducedFromNormalSubgroup(
                                   Character( G, chi ),
                                   NormalSubgroupClasses( G, x ) ) );

            induced:= false;
            k:= 1;
            while not induced and k <= Length( newnsg ) do

              check:= newnsg[k];
              if check.isInduced then

                # check whether the constituent is relatively SM w.r. to <N>
                isrelSM:= TestRelativelySM( check.character, N );
                if isrelSM.isRelativelySM then
                  induced:= true;
                fi;

              fi;
              k:= k+1;

            od;

            if induced then
              test:= rec( isRelativelySM := true,
                          comment := "suitable character found",
                          character := isrelSM.character );
            else
              test:= rec( isRelativelySM := false,
                          comment := "all possibilities checked" );
            fi;

          fi;

          if not test.isRelativelySM then

            found:= true;
            test.character:= chi;
            test.normalSubgroup:= N;

          fi;

          j:= j+1;

        od;

        i:= i+1;

      od;

      if not found then

        # All characters are rel. SM w.r. to all normal subgroups.
        test:= rec( isRelativelySM := true,
                    comment        := "all possibilities checked" );
      fi;

    fi;

    if Length( arg ) = 1 then

      # The result depends only on the group resp. character,
      # we may store it.
      arg[1].testRelativelySM:= test;

    fi;

    InfoMonomial( "#I  TestRelativelySM returns with '",
                   chi.testRelativelySM.isrelSM, "'\n" );
    return test;
    end;

##############################################################################
##
#F  IsRelativelySM( <chi> )
#F  IsRelativelySM( <G> )
##
##  returns whether the the group <G> resp. the irreducible character <chi>
##  of the group <G> is relatively subnormally monomial with respect to
##  every normal subgroup of <G>.
##
##  <G> must be subnormally monomial.  (This is *not* checked.)
##
IsRelativelySM := function( chi_or_G )
    return TestRelativelySM( chi_or_G ).isRelativelySM;
    end;

##############################################################################
##
#F  IsMinimalNonmonomial( <G> )
##
##  returns 'true' if the group <G> is a minimal nonmonomial group, and
##  'false' otherwise.
##
IsMinimalNonmonomial := function( K )

    local F,          # Fitting subgroup
          factsize,   # index of 'F' in 'K'
          facts,      # prime factorization of the order of 'F'
          p,          # prime dividing the order of 'F'
          m,          # 'F' is of order $p ^ m $
          syl,        # Sylow subgroup
          gens,       # generators list
          C,          # centre of 'K' in dihedral case
          fc,         # element in $F C$
          q;          # half of 'factsize' in dihedral case

    # Compute the Fitting factor of the group.
    F:= FittingSubgroup( K );
    factsize:= Index( K, F );

    # The Fitting subgroup of a minimal nomonomial group is a $p$-group.
    facts:= FactorsInt( Size( F ) );
    p:= Set( facts );
    if Length( p ) > 1 then
      return false;
    fi;
    p:= p[1];
    m:= Length( facts );

    # Check for the five possible structures.
    if   factsize = 4 then

      # If $K$ is minimal nonmonomial then
      # $K / F(K)$ is cyclic of order 4,
      # $F(K)$ is extraspecial of order $p^3$ and of exponent $p$
      # where $p \equiv -1 \pmod{4}$.

      if     IsPrimeInt( p )
         and p >= 3
         and ( p + 1 ) mod 4 = 0
         and m = 3
         and Centre( F ) = FrattiniSubgroup( F )
         and Size( Centre( F ) ) = p then

        # Check that the factor is cyclic and acts irreducibly.
        # For that, it is sufficient that the square acts
        # nontrivially.

        syl:= SylowSubgroup( K, 2 );
        if     IsCyclic( syl )
           and ForAny( syl.generators,
                       x ->     Order( syl, x ) = 4
                            and ForAny( F.generators,
                                 y -> Comm( y, x^2 ) <> K.identity ) ) then
          return true;
        fi;

      fi;

    elif factsize = 8 then

      # If $K$ is minimal nonmonomial then
      # $K / F(K)$ is quaternion of order 8,
      # $F(K)$ is extraspecial of order $p^3$ and of exponent $p$
      # where $p \equiv 1 \pmod{4}$.

      if    IsPrimeInt( p )
         and p >= 5
         and ( p - 1 ) mod 4 = 0
         and m = 3
         and Centre( F ) = FrattiniSubgroup( F )
         and Size( Centre( F ) ) = p then

        # Check whether $K/F(K)$ is quaternion of order 8,
        # (i.e., is nonabelian with two *generators* of order 4 that do
        # not generate the same subgroup)
        # and that it acts irreducibly on $F$
        # For that, it is sufficient to show that the central involution
        # acts nontrivially.

        syl:= SylowSubgroup( K, 2 );
        gens:= Filtered( syl.generators, x -> Order( K, x ) = 4 );
        if     not IsAbelian( syl )
           and ForAny( gens,
                       x ->     x <> gens[1]
                            and x <> gens[1]^(-1)
                            and ForAny( F.generators,
                                 y -> Comm( y, x^2 ) <> K.identity ) ) then
          return true;
        fi;

      fi;

    elif factsize <> 2 and IsPrimeInt( factsize ) then

      # If $K$ is minimal nonmonomial then
      # $K / F(K)$ has order an odd prime $q$.
      # $F(K)$ is extraspecial of order $p^{2m+1}$ and of exponent $p$
      # where $2m$ is the order of $p$ modulo $q$.

      if    OrderMod( p, factsize ) = m-1
         and m mod 2 = 1
         and Centre( F ) = FrattiniSubgroup( F )
         and Size( Centre( F ) ) = p then

        # Furthermore, $F / Z(F)$ is a chief factor.
        # It is sufficient to show that the Fitting factor acts
        # trivially on $Z(F)$, and that there is no nontrivial
        # fixed point under the action on $F / Z(F)$.
        # These conditions are sufficient for our test.

        syl:= SylowSubgroup( K, factsize );
        if     IsCentral( Centre( F ), syl )
           and ForAny( F.generators,
                       x ->     not x in Centre( F )
                            and Comm( x, syl.generators[1] ) <> K.identity )
          then
          return true;
        fi;

      fi;

    elif factsize mod 2 = 0 and IsPrimeInt( factsize / 2 ) then

      # If $K$ is minimal nonmonomial then
      # $K / F(K)$ is dihedral of order $2 q$ where $q$ is an odd prime.
      # Let $m$ denote the order of 2 mod $q$.
      # $F(K)$ is a central product of an extraspecial group $F$ of order
      # $2^{2m+1}$ (that is purely dihedral) with a cyclic group $C$
      # of order $2^{s+1}$.
      # We have $C = Z(K)$ and $F(K) = C_K( F/Z(F) )$.

      q:= factsize / 2;
      m:= OrderMod( 2, q );

      if m mod 2 = 1 then

        # Compute a Sylow $q$ subgroup $Q$, with generator $r$.
        syl:= SylowSubgroup( K, q );

        # Show that the Fitting factor is dihedral.
        if not IsConjugate( K, syl.generators[1], syl.generators[1]^-1 ) then
          return false;
        fi;

        # The centralizer of $Q$ is $Q \times C$.
        # Take an element $fc$ in $F(K) \setminus C$ with $f\in F$,
        # $c\in C$ (exists, since otherwise $Q$ would centralize $F(K)$),
        # and consider $[r,fc] = [r,f] \in F$.  This commutator cannot lie
        # in $Z = F \cap C$ since this would imply that $r^2$ fixes $f$,
        # because of odd order this means $r$ fixes $f$, a contradiction.
        # Thus we find $F$ as the normal closure of $[r,f]$,
        # of order $2^{2m+1}$..
        C:= SylowSubgroup( Centralizer( K, syl ), 2 );
        fc:= First( F.generators, x -> not x in C );
        F:= NormalClosure( K,
                      Subgroup( K, [ Comm( syl.generators[1], fc ) ] ) );

        if    Size( F ) <> 2^(2*m+1)
           or IsAbelian( F )
           or not IsCentral( K, C )
           or not IsCyclic( C )
           or Size( Intersection( F, C ) ) <> 2         then
          return false;
        fi;
        
        # Now $Q$ acts nontrivially on $F$, and because every nontrivial
        # irreducible 2-modular representation of $D_{2q}$ has degree
        # $2m$ we have necessarily $F / Z$ an irreducible module, thus
        # $F$ must be extraspecial

        return true;

      fi;

    elif factsize mod 4 = 0 and IsPrimeInt( factsize / 4 ) then

      # $K / F(K)$ is a central extension of the dihedral group of order
      # $2 t$ where $t$ is an odd prime, such that all involutions lift to
      # elements of order 4.  $F(K)$ is an extraspecial $p$-group
      # for an odd prime $p$ with $p \equiv 1 \pmod{4}$.
      # Let $m$ denote the order of $p$ mod $t$, then $F(K)$ is of order
      # $p^{2m+1}$, and $m$ is odd.

      if    m mod 2 <> 0
         and ( p - 1 ) mod 4 = 0
         and OrderMod( p, factsize / 4 ) = ( m-1 ) / 2
         and Centre( F ) = FrattiniSubgroup( F )
         and Size( Centre( F ) ) = p then

        # Check whether the factor has the required isomorphism type,
        # i.e., whether it is of order $4t$ where $t$ is an odd prime,
        # and each element of order 4 inverts a generator of the
        # Sylow $t$ subgroup (then the presentation is satisfied).

        # Check whether the action of the factor on $F$ is irreducible.
        # Since every faithful representation is of the required
        # dimension we must only check that the central involution and
        # the generator of the Sylow $t$ subgroup both act nontrivially.

        syl:= SylowSubgroup( K, factsize / 4 ).generators[1];
        gens:= SylowSubgroup( K, 2            ).generators;
        gens:= Filtered( gens, x -> Order( K, x ) = 4 );

        if     Length( gens ) > 0
           and syl * gens[1] * syl = gens[1]
           and ForAny( F.generators,
                       x -> Comm( gens[1], x ) <> K.identity )
           and ForAny( F.generators,
                       x -> Comm( syl,     x ) <> K.identity ) then

          return true;

        fi;

      fi;

    fi;

    # None of the structure conditions is satisfied.
    return false;
    end;

##############################################################################
##
#F  MinimalNonmonomialGroup( <p>, <factsize> )
##
##  returns the minimal nonmonomial group described by the parameters
##  <factsize> and <p> if such a group exists, and 'false' otherwise.
##
##  Suppose that the required group $K$ exists.
##  <factsize> must be the size of the Fitting factor $K / F(K)$.
##  <p> denotes the number $s$ such that the centre $Z(K)$ has order $2^s$
##  in the case that <factsize> is twice an odd prime; in all other cases
##  <p> is the (unique) prime that divides the order of $F(K)$.
##
MinimalNonmonomialGroup := function( p, factsize )

    local K,          # holds a presentation of the result
          rels,       # relators of 'K'
          name,       # name of 'K'
          t,          # number with suitable multiplicative order
          form,       # matrix of the commutator form
          x,          # indeterminate
          val,        # one entry in 'form'
          i,          # loop
          j,          # loop
          v,          # coefficient vector
          rhs,        # right hand side of a relator when viewed as relation
          q,          # another name for 'factsize'
          2m,         # exponent of size of Frattini factor of group $F$
          m,          # half of '2m'
          facts,      # factors of cylotomic polynomial
          coeff,      # coefficients vector of one factor in 'facts'
          inv,        # inverse of first in 'coeff'
          f,          # 'GF(2)'
          s,          # exponent of centre (minus 1) in dihedral case 
          W,          # part of matrix of an order 2 automorphism
          Winv,       # part of matrix of an order 2 automorphism
          Atr;        # transposed of $A$

    if   factsize = 4 then

      # $K / F(K)$ is cyclic of order 4,
      # $F(K)$ is extraspecial of order $p^3$ and of exponent $p$
      # where $p \equiv -1 \pmod{4}$.

      if not IsPrimeInt( p ) or p < 3 or ( p + 1 ) mod 4 <> 0 then
        InfoMonomial( "#I <p> must be a prime congruent 1 mod 4\n" );
        K:= false;
      else

        K:= FreeGroup( 5 );
        name:= ConcatenationString( String(p), "^(1+2):4" );
        rels:= [
                  # the relators of the cyclic group
                  K.1^2 / K.2, K.2^2,
        
                  # the relators of the extraspecial group
                  K.3^p, K.4^p, K.5^p, Comm( K.3, K.4 ) / K.5,
  
                  # the action of the cyclic group
                  K.3^K.1 / K.4,    K.4^K.1 / K.3^-1,
                  K.3^K.2 / K.3^-1, K.4^K.2 / K.4^-1    ];

      fi;

    elif factsize = 8 then

      # $K / F(K)$ is quaternion of order 8,
      # $F(K)$ is extraspecial of order $p^3$ and of exponent $p$
      # where $p \equiv 1 \pmod{4}$.

      if not IsPrimeInt( p ) or p < 5 or ( p - 1 ) mod 4 <> 0 then
        InfoMonomial( "#I  <p> must be a prime congruent 1 mod 4\n" );
        K:= false;
      else

        # Choose $t$ with $t^2 \equiv -1 \pmod{p}$.
        t:= PrimitiveRootMod( p ) ^ ( (p-1)/4 );
        
        K:= FreeGroup( 6 );
        name:= ConcatenationString( String(p), "^(1+2):Q8" );
        rels:= [
                 # the relators of the quaternion group
                 K.1^2 / K.3, K.2^2 / K.3, K.3^2, (K.2^K.1 ) / ( K.2^-1 ),
       
                 # the relators of the extraspecial group
                 K.4^p, K.5^p, K.6^p, Comm( K.4, K.5 ) / K.6,
 
                 # the action of the quaternion group
                 K.4^K.1 / K.4^t,  K.5^K.1 / K.5^( (1/t) mod p ),
                 K.4^K.2 / K.5,    K.5^K.2 / K.4^-1,
                 K.4^K.3 / K.4^-1, K.5^K.3 / K.5^-1  ];

      fi;

    elif factsize <> 2 and IsPrimeInt( factsize ) then

      # $K / F(K)$ has order an odd prime $q$.
      # $F(K)$ is extraspecial of order $p^{2m+1}$ and of exponent $p$
      # where $2m$ is the order of $p$ modulo $q$,

      q:= factsize;
      2m:= OrderMod( p, q );

      if 2m = 0 or 2m mod 2 <> 0 then
        InfoMonomial( "#I  order of <p> mod <factsize> must be",
                       " nonzero and even\n" );
        K:= false;
      else

        m:= 2m / 2;

        # The 'q'-th cyclotomic polynomial splits over the field with
        # 'p' elements into factors of degree '2*m'.
        facts:= Factors( CyclotomicPolynomial( GF(p), q ) );

        # Take the coefficients i$a_1, a_2, \ldots, a_{2m}, 1$ of a factor.
        coeff:= IntVecFFE( (-1) * facts[1].coefficients );

        # Compute the vector $\epsilon$.
        v:= [];
        v[ 2m-1 ]:= 1;
        for i in [ m .. 2m-2 ] do
          v[i]:= 0;
        od;
        for j in [ m-1, m-2 .. 1 ] do
          v[j]:= coeff[ j+2 ] - coeff[j];
          for i in [ 1 .. m-j-1 ] do
            v[j]:= v[j] + v[ m-i ] * coeff[ m+i+j+1 ];
          od;
          v[j]:= v[j] mod p;
        od;

        # Write down the presentation,
        K:= FreeGroup( 2m+2 );
        name:= ConcatenationString( String(p), "^(1+", String( 2m ), "):",
                                    String(q) );

        # power relators \ldots
        rels:= [ K.1^q ];
        if p = 2 then
          for j in [ 2 .. 2m+1 ] do
            Add( rels, K.(j)^p / K.(2m+2) );
          od;
          Add( rels, K.( 2m+2 )^p );
        else
          for j in [ 2 .. 2m+2 ] do
            Add( rels, K.(j)^p );
          od;
        fi;

        # \ldots action of the automorphism, \ldots
        for j in [ 2 .. 2m ] do
          Add( rels, K.(j)^K.1 / K.(j+1) );
        od;
        rhs:= K.identity;
        for j in [ 1 .. 2m ] do
          rhs:= rhs * K.(j+1)^Int( coeff[j] );
        od;

        Add( rels, K.(2m+1)^K.1 / rhs );

        # \ldots and commutator relators.
        for i in [ 3 .. 2m+1 ] do
          for j in [ 2 .. i-1 ] do
            Add( rels, Comm( K.(i), K.(j) ) / K.(2m+2)^v[ 2m+j-i ] );
          od;
        od;

      fi;

    elif factsize mod 2 = 0 and IsPrimeInt( factsize / 2 ) then

      # $K / F(K)$ is dihedral of order $2 q$ where $q$ is an odd prime.
      # Let $m$ denote the order of 2 mod $q$ (which is odd).
      # $F(K)$ is a central product of an extraspecial group $F$ of order
      # $2^{2m+1}$ (that is purely dihedral) with a cyclic group $C$
      # of order $2^{s+1}$.  Note that in this case the second argument
      # is $s+1$.
      # We have $C = Z(K)$ and $F(K) = C_K( F/Z(F) )$.

      s:= p-1;
      q:= factsize / 2;
      m:= OrderMod( 2, q );

      if m mod 2 = 0 then
        InfoMonomial( "#I  order of 2 mod <factsize>/2 must be odd\n" );
        K:= false;
      else

        # The first generator is $t$, the second is $r$,
        # generators 3 to $3+s-1$ are the powers of $t$ that are
        # not contained in $Z(K)$.
        K:= FreeGroup( 2*m + s + 3 );
        name:= ConcatenationString( "2^(1+", String( 2*m ), ")" );
        if s > 0 then
          name:= ConcatenationString( "(", name, "Y", String( 2^(s+1) ), ")" );
        fi;
        name:= ConcatenationString( name, ":D", String( factsize ) );
 
        rels:= [];

        # $t^2$ is a generator of $Z(K)$.
        if s = 0 then

          # $t$ squares to $z$ or the identity, since for $s = 0$ we have
          # $Z(K) = \langle z \rangle$.
          # Here we choose the identity in order to get Dade\'s example.
          rels[1]:= K.1^2 / K.identity;

        else

          # Describe the cyclic group spanned by $t^2$.
          rels[1]:= K.1^2 / K.2;
          for i in [ 2 .. s ] do
            rels[i]:= K.(i)^2 / K.(i+1);
          od;
          rels[ s+1 ]:= K.( s+1 )^2 / K.( 2*m+s+3 );
  
        fi;

        # The $(s+2)$-nd generator is $r$, that of order $q$.
        rels[ s+2 ]:= K.( s+2 )^q;

        # $t$ inverts $r$.
        rels[ s+3 ]:= K.( s+2 ) ^ K.1 / K.( s+2 )^-1;

        # The remaining $2m+1$ generators form the extraspecial group $F$.
        for i in [ s+3 .. 2*m+s+3 ] do
          rels[ i+1 ]:= K.( i )^2;
        od;
        for i in [ 1 .. m ] do
          Add( rels, Comm( K.( s+2+i ), K.( s+2+m+i ) ) / K.( 2*m+s+3 ) );
        od;

        # Describe the actions of $t$ and $r$ on $F$.
        # First we construct the matrices of the linear actions on the
        # Frattini factor of $F$.  (Note that because of even characteristic
        # the sign plays no role here.)
        f:= GF(2);
        facts:= Factors( CyclotomicPolynomial( f, q ) );
        coeff:= facts[1].coefficients;

        Atr:= NullMat( m, m, f );
        for i in [ 1 .. m-1 ] do
          Atr[i+1][i]:= f.one;
        od;
        for i in [ 1 .. m ] do
          Atr[i][m]:= coeff[i];
        od;

        v:= 0 * Atr[1];
        v[1]:= f.one;
        W:= [ v ];
        for i in [ 2 .. m ] do
          v:= v * Atr;
          W[i]:= v;
        od;

        Winv:= W^-1;

        W     := List( W   , IntVecFFE );
        Winv  := List( Winv, IntVecFFE );
        coeff := IntVecFFE( coeff );

        # The action of $t$ is described by 'W' and its inverse.
        for i in [ s+3 .. s+m+2 ] do
          rhs:= K.identity;
          for j in [ 1 .. m ] do
            rhs:= rhs * K.( s+2+m+j )^W[i-s-2][j];
          od;
          Add( rels, K.(i) ^ K.1 / rhs );
        od;
        for i in [ s+m+3 .. s+2*m+2 ] do
          rhs:= K.identity;
          for j in [ 1 .. m ] do
            rhs:= rhs * K.( s+2+j )^Winv[i-s-m-2][j];
          od;
          Add( rels, K.(i) ^ K.1 / rhs );
        od;
        
        # The action of $r$ is described by $A$ and its transposed inverse.
        # (first half)
        for i in [ s+3 .. s+m+1 ] do
          Add( rels, K.(i) ^ K.(s+2) / K.(i+1) );
        od;
        rhs:= K.identity;
        for j in [ 1 .. m ] do
          rhs:= rhs * K.( s+2+j )^coeff[j];
        od;
        Add( rels, K.( s+m+2 ) ^ K.(s+2) / rhs );

        # (second half)
        for i in [ s+m+3 .. s+2*m+1 ] do
          Add( rels, K.(i) ^ K.(s+2) / ( K.(s+m+3)^coeff[i-s-m-1] * K.(i+1) ) );
        od;
        Add( rels, K.( s+2*m+2 ) ^ K.(s+2) / K.(s+m+3) );

      fi;

    elif factsize mod 4 = 0 and IsPrimeInt( factsize / 4 ) then

      # $K / F(K)$ is a central extension of the dihedral group of order
      # $2 t$ where $t$ is an odd prime, such that all involutions lift to
      # elements of order 4.  $F(K)$ is an extraspecial $p$-group
      # for an odd prime $p$ with $p \equiv 1 \pmod{4}$.
      # Let $m$ denote the order of $p$ mod $t$, then $F(K)$ is of order
      # $p^{2m+1}$, and $m$ is odd.

      t:= factsize / 4;
      m:= OrderMod( p, t );

      if m mod 2 = 0 or ( p - 1 ) mod 4 <> 0 then
        InfoMonomial( "#I  order of <p> mod <t> must be odd,",
                      " <p> congr. 1 mod 4\n" );
        K:= false;
      else

        facts:= Factors( CyclotomicPolynomial( GF(p), t ) );
        coeff:= IntVecFFE( facts[1].coefficients );
        inv:= Int( facts[1].coefficients[1]^-1 );
  
        # The symplectic form (that will be used to define the
        # commutator form) is derived from the standard symplectic form
        # for the 2-dimensional vector space over $GF(p^{2m})$ by first
        # blowing up to the $2m$ dimensional vector space over $GF(p)$,
        # and then projecting onto $GF(p)$ (that is, the first component).

        # (We need only the lower triangle of the matrix of the form,
        # and this is nonzero only in the lower left square.)

        form:= [];
        for i in [ 1 .. m ] do
          form[i]:= [];
          for j in [ 1 .. m-i+1 ] do
            form[i][j]:= 0;
          od;
        od;
        form[1][1]:= -1;
        x:= X( GF(p) );
        for i in [ 2 .. m ] do
          val:= x^(i+m-2) mod facts[1];
          val:= - Int( ShiftedCoeffs( val.coefficients, val.valuation )[1] );
          for j in [ i .. m ] do
            form[ m+i-j ][j]:= val;
          od;
        od;

        # Write down the presentation.
        K:= FreeGroup( 2*m + 4 );
        name:= ConcatenationString( String(p), "^(1+", String( 2*m), "):2.D",
                                    String( factsize/2 ) );

        # power relations,
        rels:= [ K.1^2 / K.3, K.2^t / K.3, K.3^2 ];
        for i in [ 4 .. 2*m+4 ] do
          Add( rels, K.(i)^p );
        od;
        
        # action of the Frattini factor,
        # first the order 4 element
        for i in [ 4 .. m+3 ] do
          Add( rels, K.(i)^K.1 / K.( i+m )^-1 );
          Add( rels, K.( i+m )^K.1 / K.( i ) );
        od;
        Add( rels, K.2 ^ K.1 / K.2^-1 );
  
        # (The element of order $2t$ ...)
        for i in [ 4 .. m+2 ] do
          Add( rels, K.(i)^K.2 / K.(i+1)^-1 );
        od;
        rhs:= K.identity;
        for i in [ 1 .. m ] do
          rhs:= rhs * K.( i+3 )^coeff[i];
        od;
        Add( rels, K.( m+3 )^K.2 / rhs );
  
        rhs:= K.identity;
        for i in [ 1 .. m ] do
          rhs:= rhs * K.( m+i+3 )^( coeff[i+1] * inv );
        od;
        Add( rels, K.( m+4 )^K.2 / rhs );
  
        for i in [ 5 .. m+3 ] do
          Add( rels, K.( m+i )^K.2 / K.( m+i-1 )^-1 );
        od;
  
        # (The central involution of the Fitting factor inverts.)
        for i in [ 4 .. m+3 ] do
          Add( rels, K.(i)^K.3 / K.(i)^-1 );
          Add( rels, K.( i+m )^K.3 / K.( i+m )^-1 );
        od;
  
        # The extraspecial group is defined by the commutator form
        # constructed above.
        for i in [ m+1 .. 2*m ] do
          for j in [ 1 .. m ] do
            Add( rels, Comm( K.(i+3), K.(j+3) ) / K.( 2*m + 4 )^form[i-m][j] );
          od;
        od;

      fi;

    else
      K:= false;
    fi;

    if IsRec( K ) then
      K:= AgGroupFpGroup( K / rels );
      K.name:= name;
    fi;
    return K;
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
