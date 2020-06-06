#############################################################################
##
#A  classfun.g                  GAP library                     Thomas Breuer
##
#A  @(#)$Id: classfun.g,v 3.2.1.1 1994/10/04 07:46:11 sam Rel $
##
#Y  Copyright 1993-1995,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the functions dealing with class functions.
##
#H  $Log: classfun.g,v $
#H  Revision 3.2.1.1  1994/10/04  07:46:11  sam
#H  added 'OrbitChar', 'OrbitRepresentativesCharacters',
#H  fixed 'OrbitsCharacters'
#H
#H  Revision 3.2  1994/04/21  12:23:08  sam
#H  improved the 'InertiaSubgroup' routines
#H
#H  Revision 3.1  1994/02/25  09:10:30  sam
#H  initial revision under RCS
#H
##

#############################################################################
##
#F  IsClassFunction( <obj> )
##
IsClassFunction := function( obj )
    return IsRec( obj ) and
           IsBound( obj.isClassFunction ) and
           obj.isClassFunction;
    end;

#############################################################################
##
#V  ClassFunctions  . . . . . . . . . . . . . . domain of all class functions
#V  ClassFunctionsOps . . . . . . . .  operations record for 'ClassFunctions'
##
ClassFunctionsOps := OperationsRecord( "ClassFunctionsOps", MappingsOps );

ClassFunctions := rec( name:=  "ClassFunctions",
                       isDomain       := true,
                       isFinite       := false,
                       size           := "infinity",
                       operations     := ClassFunctionsOps );

ClassFunctionsOps.\in := function( obj, ClassFunctions )
    return IsClassFunction( obj );
    end;

#############################################################################
##
#F  ClassFunctionsOps.Group( ClassFunctions, <gens>, <id> )
##
ClassFunctionsOps.Group := function( ClassFunctions, gens, id )

    local gen;

    # check the arguments
    if not IsClassFunction( id ) or not ForAll( id.values, x -> x = 1 ) then
      Error( "<id> must be the trivial character" );
    fi;
    for gen in gens do

      # All values must be roots of unity.
      if not IsClassFunction( gen ) then
        Error( "<gen> must be a class function" );
      elif not ForAll( gen.values, x -> x = -1 or Norm( x ) = 1 ) then
        Error( "values of <gen> must be roots of unity" );
      fi;

    od;

    # delegate the work
    return GroupElementsOps.Group( ClassFunctions, gens, id );
    end;

#############################################################################
##
#V  ClassFunctionOps
##
ClassFunctionOps := OperationsRecord( "ClassFunctionOps", MappingOps );

#############################################################################
##
#F  ClassFunction( <G>, <values> )
#F  ClassFunction( <G>, <chi> )
##
ClassFunction := function( G, chi )

     if  IsList( chi ) then

       # class function specified by group and values list
       return rec( isGeneralMapping := true,
                   domain           := ClassFunctions,
                   isMapping        := true,
                   isClassFunction  := true,
                   source           := G,
                   range            := Cyclotomics,
                   values           := chi,
                   operations       := ClassFunctionOps );

     elif IsClassFunction( chi ) then

       # Regard <chi> as class function of <G>.
       if   ( IsBound( chi.source.factorNum ) and G = chi.source.factorNum ) or
            IsSubset( chi.source, G ) then

         # Regard character of factor group '<G> / N' as character of <G>,
         # or restrict the character to a subgroup
         return ClassFunction( G,
           chi.values{ FusionConjugacyClasses( G, chi.source ) } );

       elif IsBound( G.factorNum ) and chi.source = G.factorNum then

         # Regard character of group 'H' as character of factor 'G = H / N'
         # if possible.
         chi:= CompositionMaps( chi.values,
                         InverseMap( 
                  FusionConjugacyClasses( chi.source, G ) ) );
         if   not IsList( chi[1] ) then
           return ClassFunction( G, chi );
         else
           Error( "normal subgroup not contained in kernel of class function" );
         fi;

       else
         Error( "groups are not compatible" );
       fi;

     else
       Error( "usage: ClassFunction(<repres>) or ClassFunction(<G>,<values>)" );
     fi;
     end;

#############################################################################
##
#F  ClassFunctionOps.Print( <chi> ) . . . . . . . . .  print a class function
##
ClassFunctionOps.Print := function( chi )
    if IsBound( chi.name ) then
      Print( chi.name );
    else
      Print( "ClassFunction( ", chi.source, ", ", chi.values, " )" );
    fi;
    end;

#############################################################################
##
#F  ClassFunctionOps.Display( <chi>, <arec> ) . . .  display a class function
##
ClassFunctionOps.Display := function( chi, arec )
    arec:= ShallowCopy( arec );
    arec.chars:= [ chi.values ];
    DisplayCharTable( CharTable( chi.source ), arec );
    end;

#############################################################################
##
#F  ClassFunctionOps.IsInjective( <chi> )
##
##  Avoid to call 'Size' for the source, decide this from the values list.
##
ClassFunctionOps.IsInjective := function( chi )
    local i;
    for i in SizesConjugacyClasses( chi.source ) do
      if i > 1 then
        return false;
      fi;
    od;
    return Length( Image( chi ) ) = Length( chi.values );
    end;

#############################################################################
##
#F  ClassFunctionOps.IsSurjective( <chi> )
##
##  Avoid to call 'Size' for the source, decide this from the values list.
##
ClassFunctionOps.IsSurjective := function( chi )
    if not IsFinite( chi.range ) then
      return false;
    else
      return Size( Image( chi ) ) = Size( chi.range );
    fi;
    end;

#############################################################################
##
#F  ClassFunctionOps.ImagesSource( <chi> ) . . . .  image of a class function
##
ClassFunctionOps.ImagesSource := function( chi )
    return Set( chi.values );
    end;

#############################################################################
##
#F  ClassFunctionOps.ImageElm( <chi>, <g> )  . . . .  evaluate class function
##
ClassFunctionOps.ImageElm := function( chi, g )

    local G,    # underlying group
          ord,  # order of the element
          i;    # loop over conjugacy classes of 'G'

    # Handle the case that we evaluate on a class number or class name.
    if IsInt( g ) then
      return chi.values[g];
    elif IsString( g ) then
      if IsBound( chi.source.classnames ) then
        return chi.values[ Position( chi.source.classnames, g ) ];
      else
        Error( "sorry, no class names stored" );
      fi;
    else
      G:= chi.source;
      ord:= Order( G, g );
      for i in [ 1 .. Length( ConjugacyClasses( G ) ) ] do
        if ord = Order( G, Representative( G.conjugacyClasses[i] ) ) and
           g in G.conjugacyClasses[i] then
          return chi.values[i];
        fi;
      od;
      Error( "<g> must be an element of '<chi>.source'" );
    fi;
    end;

#############################################################################
##
#F  ClassFunctionOps.ImagesElm( <chi>, <g> ) . . . .  evaluate class function
##
ClassFunctionOps.ImagesElm := function( chi, g )
    return [ chi.operations.ImageElm( chi, g ) ];
    end;

#############################################################################
##
#F  ClassFunctionOps.ImagesSet( <chi>, <set> ) . . .  evaluate class function
##
ClassFunctionOps.ImagesSet := function( chi, set )
    return Set( List( set, x -> chi.operations.ImageElm( chi, x ) ) );
    end;

#############################################################################
##
#F  ClassFunctionOps.PreImagesRange( <chi> )
##
ClassFunctionOps.PreImagesRange := function( chi )
    return chi.source;
    end;

#############################################################################
##
#F  ClassFunctionOps.PreImagesElm( <chi>, <elm> )
##
ClassFunctionOps.PreImagesElm := function( chi, elm )
    return Union( chi.source.conjugacyClasses{ 
                     Filtered( [ 1 .. Length( chi.values ) ],
                               i -> chi.values[i] = elm ) } );
    end;

#############################################################################
##
#F  ClassFunctionOps.PreImagesSet( <chi>, <elms> )
##
ClassFunctionOps.PreImagesSet := function( chi, elms )
    return Union( chi.source.conjugacyClasses{ 
                     Filtered( [ 1 .. Length( chi.values ) ],
                               i -> chi.values[i] in elms ) } );
    end;

#############################################################################
##
#F  ClassFunctionOps.PreImagesRepresentative( <chi>, <elm> )
##
ClassFunctionOps.PreImagesRepresentative := function( chi, elm )
    local i;
    for i in [ 1 .. Length( chi.values ) ] do
      if chi.values[i] = elm then
        return Representative( chi.source.conjugacyClasses[i] );
      fi;
    od;
    Error( "<elm> is not in the range of <chi>" );
    end;

#############################################################################
##
#F  ClassFunctionOps.Centre( <chi> ) . . . . . . . centre of a class function
##
ClassFunctionOps.Centre := function( chi )
    return NormalSubgroupClasses( chi.source, CentreChar( chi.values ) );
    end;

#############################################################################
##
#F  ClassFunctionOps.Degree( <chi> ) . . . . . . . degree of a class function
##
ClassFunctionOps.Degree := function( chi )
    return chi.values[1];
    end;

#############################################################################
##
#F  ClassFunctionOps.IsFaithful( <chi> )
##
ClassFunctionOps.IsFaithful := function( chi )
    return Length( KernelChar( chi.values ) ) = 1;
    end;

#############################################################################
##
#F  ClassFunctionOps.Kernel( <chi> ) . . . . . . . kernel of a class function
##
ClassFunctionOps.Kernel := function( chi )
    if IsGroup( chi.source ) then
      return NormalSubgroupClasses( chi.source, KernelChar( chi.values ) );
    else
      return KernelChar( chi.values );
    fi;
    end;

#############################################################################
##
#F  ClassFunctionOps.Norm( <chi> ) . . . . . . . . . . norm of class function
##
ClassFunctionOps.Norm := function( chi )
    return ScalarProduct( chi, chi );
    end;

#############################################################################
##
#F  ClassFunctionOps.\=( <chi>, <psi> ) . . . . . equality of class functions
##
ClassFunctionOps.\= := function( chi, psi )
    if IsClassFunction( chi ) and IsClassFunction( psi ) then
      return     chi.source = psi.source
             and chi.range  = psi.range
             and chi.values = psi.values;
    else
      return false;
    fi;
    end;

#############################################################################
##
#F  ClassFunctionOps.\<( <chi>, <psi> ) . . . . comparison of class functions
##
ClassFunctionOps.\< := function( chi, psi )
    if   chi.source < psi.source then
      return true;
    elif chi.source = psi.source then
      if   chi.range < psi.range then
        return true;
      elif chi.range = psi.range then
        return chi.values < psi.values;
      fi;
    fi;
    return false;
    end;

#############################################################################
##
#F  ClassFunctionOps.\+( <chi>, <psi> ) . . . . . . .  sum of class functions
##
ClassFunctionOps.\+ := function( chi, psi )
    if chi.source = psi.source then
      return ClassFunction( chi.source, chi.values + psi.values );
    else
      Error( "<chi> and <psi> must be class functions of the same",
             " group,\n",
             "with same lists of conjugacy classes" );
    fi;
    end;

#############################################################################
##
#F  ClassFunctionOps.\-( <chi>, <psi> ) . . . . difference of class functions
##
ClassFunctionOps.\- := function( chi, psi )
    if chi.source = psi.source then
      return ClassFunction( chi.source, chi.values - psi.values );
    else
      Error( "<chi> and <psi> must be class functions of the same",
             " group,\n",
             "with same lists of conjugacy classes" );
    fi;
    end;

#############################################################################
##
#F  ClassFunctionOps.\*( <chi>, <psi> ) . . tensor product of class functions
#F  ClassFunctionOps.\*( <cyc>, <psi> ) . . scalar multiple of class function
##
ClassFunctionOps.\* := function( chi, psi )
    if   IsList( psi ) then
      return List( psi, x -> chi * x );
    elif IsCyc( psi ) then
      return ClassFunction( chi.source, psi * chi.values );
    elif not IsClassFunction( psi ) then
      Error( "<psi> must be a class function or list of class functions" );
    elif IsCyc( chi ) then
      return ClassFunction( psi.source, chi * psi.values );
    elif IsClassFunction( chi ) then
      if chi.source = psi.source then
        return ClassFunction( chi.source,
                        List( [ 1 .. Length( chi.values ) ],
                              x -> chi.values[x] * psi.values[x] ) );
      else
        Error( "<chi> and <psi> must be class functions of the same",
               " group,\n",
               "with same lists of conjugacy classes" );
      fi;
    elif IsList( chi ) then
      return List( chi, x -> x * psi );
    elif IsMapping( chi ) then
      return CompositionMapping( psi, chi );
    else
      Error( "cannot form the product of <chi> and <psi>" );
    fi;
    end;

#############################################################################
##
#F  ClassFunctionOps.\/( <chi>, <cyc> ) . . . . . . .  divide by a cyclotomic
##
ClassFunctionOps.\/ := function( chi, n )
    if IsCyc( n ) then
      return ClassFunction( chi.source, chi.values / n );
    else
      Error( "divisor must be a cyclotomic" );
    fi;
    end;

#############################################################################
##
#F  ClassFunctionOps.\^
##
##  <chi>^<n>    tensor power of a class function <chi> by natural number <n>
##  <chi>^<g>    conjugate class function of <chi> under action of <g>
##  <g>^<chi>    value of <chi> on group element <g>
##
ClassFunctionOps.\^ := function( chi, obj )

    if   IsInt( obj ) then

      # tensor power of 'chi'
      return ClassFunction( chi.source, List( chi.values, x -> x ^ obj ) );

    elif IsClassFunction( obj ) then

      if IsClassFunction( chi ) then
        # ``conjugation\'\'
        return chi;
      else
        # value of class function 'obj' on element 'chi'
        return obj.operations.ImageElm( obj, chi );
      fi;

    elif IsGroup( obj ) or IsCharTable( obj ) then

      return Induced( [ chi ], obj )[1];

    elif IsPerm( obj ) and not IsPermGroup( chi.source ) then

      # 'obj' acts on the values list, e.g., as a table automorphism.
      return ClassFunction( chi.source, Permuted( chi.values, obj ) );

    elif IsGroupElement( obj ) then

      # conjugate class function
      return ClassFunctionOps.ConjugateClassFunction( chi, obj );

    else

      Error( "exponent must be nonneg. integer, group element, or group" );

    fi;
    end;

#############################################################################
##
#F  GlobalPartitionClasses( <G> )
##
GlobalPartitionClasses := function( G )

    local list,     # one list in 'part'
          part,     # partition that has to be respected
          orb,      # possible image points
          j,        # loop over 'orb'
          pt;       # one point to map

    if not IsBound( G.globalPartitionClasses ) then

      if IsBound( G.charTable ) and
         IsBound( G.charTable.automorphisms ) then
  
          # The orbits define the finest possible global partition.
          part:= Filtered( Orbits( G.charTable.automorphisms,
                                   [ 1 .. Length( G.charTable.classes ) ] ),
                           x -> Length( x ) > 1 );
  
      else
  
        # Conjugate classes must have same representative order and
        # same centralizer order.
  
        if IsBound( G.charTable ) then
  
          list:= List( [ 1 .. Length( G.charTable.classes ) ],
                       i -> [ G.charTable.orders[i],
                              G.charTable.centralizers[i] ] );
#T use power maps!!
          
        else
  
          list:= List( ConjugacyClasses( G ),
                       x -> [ Order( G, x.representative ),
                              Size( x.centralizer ) ] );
#T  Use power maps also ?
        fi;
  
        orb:= [];
        part:= [];
        for j in [ 1 .. Length( list ) ] do
          pt:= Position( orb, list[j] );
          if pt = false then
            Add( orb, list[j] );
            Add( part, [ j ] );
          else
            Add( part[ pt ], j );
          fi;
        od;
  
      fi;
  
      # Store the partition;
      G.globalPartitionClasses:= part;

    fi;
    return G.globalPartitionClasses;
    end;

#############################################################################
##
#F  ClassFunctionOps.CorrespondingPermutation(   <G>, <g> )
#F  ClassFunctionOps.CorrespondingPermutation( <chi>, <g> )
##
##  If the first argument is a group then the permutation of conjugacy
##  classes is returned that is induced by the group element <g>.
##
##  If the first argument is a class function <chi> then the returned
##  permutation will at least yield the same conjugate class function as
##  the permutation induced by <g>, that is, the images are not computed
##  for orbits on that <chi> is constant.
##
ClassFunctionOps.CorrespondingPermutation := function( G, g )

    local values,   # list of class function values
          classes,  # list of conjugacy classes
          part,     # partition that has to be respected
          base,     # base of aut. group
          images,   # list of images
          pt,       # one point to map
          im,       # actual image class
          orb,      # possible image points
          found,    # image point found? (boolean value)
          j,        # loop over 'orb'
          perm,     # permutation, result
          list,     # one list in 'part'
          first,    # first point in orbit of 'g'
          min;      # minimal length of nontrivial orbit of 'g'

    # Test whether 'g' is the identity
#T I need a function 'Order( g )' !!
    if g = g^0 then
      return ();
    fi;

    if IsClassFunction( G ) then
      values:= G.values;
      G:= G.source;
    else
      values:= false;
    fi;

    classes:= G.conjugacyClasses;

    # Use the best known partition of the classes of 'G'
    # into unions of orbits.
    if   IsBound( G.charTable ) and
         IsBound( G.charTable.automorphisms ) then

      part:= G.charTable.automorphisms;

      # Compute the images of the basepoints of this group.
      base:= Base( part );
      images:= [];
      for pt in base do
        im:= classes[ pt ].representative ^ g;
        orb:= Orbit( part, pt );
        found:= false;
        j:= 1;
        while not found do
#T better CanonicalClassElement ??
          if im in classes[ orb[j] ] then
            Add( images, orb[j] );
            found:= true;
          fi;
          j:= j+1;
        od;
      od;

      # Determine the group element.
#T Is there really no function that does exactly this?
      perm:= RepresentativeOperation( part, base, images, OnTuples );
#T I should check somehow whether 'obj' really normalizes!!!
   
    else

      # We can use only a partition into unions of orbits.

      part:= GlobalPartitionClasses( G );

      # Compute orbits of 'g' on the lists in 'part', store the images.
      # Note that if we have taken away a union of orbits such that the
      # number of remaining points is smaller than the smallest prime
      # divisor of the order of 'g' then all these points must be fixed.
#T I need a function 'Order( g )' !!
#T    min:= Order( g );
      if g in Parent( classes[1].group ) then
        min:= Order( Parent( classes[1].group ), g );
      else
        first:= g^0;
        orb:= g;
        min:= 1;
        while orb <> first do
          min:= min+1;
          orb:= orb * g;
        od;
      fi;
      min:= FactorsInt( min )[1];
      images:= [];

      for list in part do

        if Length( list ) = 1 then

          # necessarily fixed point
          images[ list[1] ]:= list[1];

        elif values <> false and
             Length( Set( values{ list } ) ) = 1 then

          # We may take any permutation of the orbit.
          for j in list do
            images[j]:= j;
          od;

        else

          orb:= Copy( list );
          while Length( orb ) >= min do
  
            # There may be nontrivial orbits.
            pt:= orb[1];
            first:= pt;
            j:= 1;
  
            while j <= Length( orb ) do
  
              im:= classes[ pt ].representative ^ g;
              found:= false; 
              while j <= Length( orb ) and not found do
#T better CanonicalClassElement ??
                if im in classes[ orb[j] ] then
                  images[pt]:= orb[j];
                  found:= true;
                fi;
                j:= j+1;
              od;
  
              RemoveSet( orb, pt );
  
              if found then
                j:= 1;
                pt:= images[pt];
              fi;
  
            od;
  
            # The image must be the first point of the orbit under 'g'.
            images[pt]:= first;
  
          od;
  
          # The remaining points of the orbit must be fixed.
          for pt in orb do
            images[pt]:= pt;
          od;

        fi;

      od;
          
      # Determine the group element.
      perm:= PermList( images );
   
    fi;

    return perm;
    end;

#############################################################################
##
#F  PermClassesHomomorphism( <H> )
##
##  returns the group homomorphism mapping each element of the normalizer of
##  <H> in its parent to the induced permutation of the conjugacy classes of
##  <H>.
##
PermClassesHomomorphism := function( H )

    local N,     # normalizer of 'H' in its parent
          gens;  # images of the generators of 'N'

    if not IsBound( H.permClassesHomomorphism ) then

      N:= Normalizer( Parent( H ), H );

      # compute the permutations corresponding to the generators of 'N'.
      gens:= List( N.generators, g ->
            ClassFunctionOps.CorrespondingPermutation( H, g ) );
      H.permClassesHomomorphism:=
                     GroupHomomorphismByImages( N, Group( gens, () ),
                                                N.generators, gens );
    fi;
    return H.permClassesHomomorphism;
    end;

#############################################################################
##
#F  ClassFunctionOps.ConjugateClassFunction( <chi>, <obj> )
##
##  Let $P$ be the parent of '<chi>.source'.
##  If $<obj> = g$ is an element of the normalizer in $P$ of '<chi>.source',
##  and if $G = '<chi>.source.normalizer'$ is bound, then
##  we use the information stored in '<chi>.source.permClassesHomomorphism',
##  that is,
##  we write $g = \prod_i g_i^{a_i}$ in terms of the generators $g_i$ of $G$,
##  and compute the permutation $\pi_g = \prod_i \pi_{g_i}^{a_i}$, where the
##  $\pi_{g_i}$ have already been computed.
##
##  If <obj> just acts on '<chi>.source' via '\^' then we compute the
##  permutation of classes induced by this action in the same way as the
##  $\pi_{g_i}$ mentioned above are computed
##  (see 'ClassFunctionOps.CorrespondingPermutation').
##  
ClassFunctionOps.ConjugateClassFunction := function( chi, obj )

    local G,      # normalizer of 'chi.source' in its parent
          gens,   # permutations corresponding to generators
          i,      # loop over 'exp'
          perm;   # conjugating permutation

    # For elements of the parent group, check whether they normalize
    # 'chi.source'.
    if obj in Parent( chi.source ) and
       ForAny( chi.source.generators, x -> not x ^ obj in chi.source ) then
      Error( "<obj> does not normalize" );
    fi;

    if ( IsNormal( Parent( chi.source ), chi.source ) or
         IsBound( chi.source.normalizer ) ) and
       obj in chi.source then

      # Compute the image of 'obj' under the homomorphism.
      perm:= Image( PermClassesHomomorphism( chi.source), obj );

    else

#T Check whether 'obj' normalizes?
      perm:= ClassFunctionOps.CorrespondingPermutation( chi, obj );

    fi;

    return ClassFunction( chi.source, Permuted( chi.values, perm ) );
    end;

#############################################################################
##
#F  ClassFunctionOps.ScalarProduct( <dummy>, <chi>, <psi> )
##
ClassFunctionOps.ScalarProduct := function( dummy, chi, psi )

    local i, size, weights, scalarproduct;

    if chi.source <> psi.source then
      Error( "<chi> and <psi> must be class functions of the same group" );
    fi;

    weights:= SizesConjugacyClasses( chi.source );
    size:= Size( chi.source );
    chi:= chi.values;
    psi:= psi.values;
    scalarproduct:= 0;
    for i in [ 1 .. Length( weights ) ] do
      scalarproduct:= scalarproduct
                      + weights[i] * chi[i] * GaloisCyc( psi[i], -1 );
    od;

    return scalarproduct / size;

    end;

#############################################################################
##
#F  ClassFunctionOps.Restricted( <arglist> )
##
ClassFunctionOps.Restricted := function( arglist )

    local chars, H, fus;

    if IsList( arglist[1] ) then
      chars:= arglist[1];
    else
      chars:= [ arglist[1] ];
    fi;

    H:= arglist[2];
    fus:= FusionConjugacyClasses( H, chars[1].source );

    return List( chars, x -> ClassFunction( H, x.values{ fus } ) );

    end;

#############################################################################
##
#F  ClassFunctionOps.Induced( [ <char>, <G> ] )
##
ClassFunctionOps.Induced := function( arglist )
    local char, G, H, size, Gcentsizes, fusion, Hsize, Hclasslengths, Gnccl,
          Hnccl, induced, chi, singleinduced, j;

    if IsList( arglist[1] ) then
      if Length( arglist[1] ) = 0 then return []; fi;
      char:= arglist[1];
    else
      char:= [ arglist[1] ];
    fi;

    G:= arglist[2];

    if not IsClassFunction( char[1] )
       or not ForAll( char, x -> x.source = char[1].source ) then

      Error( "<char> must be (list of) class function(s) ",
             "of the same subgroup of <G>" );

    fi;

    H:= char[1].source;
    char:= List( char, x -> x.values );

    if not IsBound( G.charTable ) then
      size:= Size( G );
      Gcentsizes:= List( SizesConjugacyClasses( G ), x -> size / x );
    else
      size:= G.charTable.size;
      Gcentsizes:= G.charTable.centralizers;
    fi;

    fusion:= FusionConjugacyClasses( H, G );

    Hsize:= Size( H );
    Hclasslengths:= SizesConjugacyClasses( H );

    Gnccl:= Length( Gcentsizes );
    Hnccl:= Length( Hclasslengths );

    # list of induced class functions
    induced:= [];

    for chi in char do

      # initialize zero vector
      singleinduced:= [];
      for j in [ 1 .. Gnccl ] do singleinduced[j]:= 0; od;

      # add the weighted values
      for j in [ 1 .. Hnccl ] do
        if chi[j] <> 0 then
          singleinduced[ fusion[j] ]:=
              singleinduced[ fusion[j] ] + chi[j] * Hclasslengths[j];
        fi;
      od;

      # multiply be the weight
      for j in [ 1 .. Gnccl ] do
        singleinduced[j]:= singleinduced[j] * Gcentsizes[j] / Hsize;
      od;

      Add( induced, ClassFunction( G, singleinduced ) );

    od;

    return induced;

    end;

#############################################################################
##
#F  ClassFunctionOps.Eigenvalues( <chi>, <class> )
##
ClassFunctionOps.Eigenvalues := function( chi, class )

    local tbl;

    if not IsBound( chi.eigenvalues ) then
      chi.eigenvalues:= [];
    fi;
    if not IsBound( chi.eigenvalues[ class ] ) then
      tbl:= CharTable( chi.source );
      chi.eigenvalues[ class ]:=
           tbl.operations.Eigenvalues( tbl, chi.values, class );
    fi;
    return chi.eigenvalues[ class ];
    end;

#############################################################################
##
#V  VirtualCharacterOps
##
VirtualCharacterOps := OperationsRecord( "VirtualCharacterOps",
                                         ClassFunctionOps );

#############################################################################
##
#F  VirtualCharacter( <G>, <values> )
#F  VirtualCharacter( <G>, <chi> )
##
VirtualCharacter := function( G, values )
    local chi;
    chi:= ClassFunction( G, values );
    chi.isVirtualCharacter := true;
    chi.operations         := VirtualCharacterOps;
    return chi;
    end;

#############################################################################
##
#F  IsVirtualCharacter( <obj> )
##
IsVirtualCharacter := function( obj )

    local irr,
          chi,
          scpr;

    if not IsClassFunction( obj ) then
      return false;
    elif IsBound( obj.isVirtualCharacter ) then
      return obj.isVirtualCharacter;
    else
      irr:= Irr( obj.source );
      for chi in irr do
        scpr:= ScalarProduct( chi, obj );
        if not IsInt( scpr ) then
          return false;
        fi;
      od;
    fi;
    obj.isVirtualCharacter:= true;
    obj.operations:= VirtualCharacterOps;
    return true;
    end;

#############################################################################
##
#F  VirtualCharacterOps.Print( <chi> ) . . . . . .  print a virtual character
##
VirtualCharacterOps.Print := function( chi )
    if IsBound( chi.name ) then
      Print( chi.name );
    else
      Print( "VirtualCharacter( ", chi.source, ", ", chi.values, " )" );
    fi;
    end;

#############################################################################
##
#F  VirtualCharacterOps.\+( <chi>, <psi> ) . . . .  sum of virtual characters
##
VirtualCharacterOps.\+ := function( chi, psi )
    if IsClassFunction( chi ) and IsClassFunction( psi ) and
       chi.source = psi.source then
      if IsBound( chi.isVirtualCharacter ) and chi.isVirtualCharacter and
         IsBound( psi.isVirtualCharacter ) and psi.isVirtualCharacter then
        return VirtualCharacter( chi.source, chi.values + psi.values );
      else
        return ClassFunction( chi.source, chi.values + psi.values );
      fi;
    else
      Error( "<chi> and <psi> must be virtual characters of the same",
             " group,\n",
             "with same lists of conjugacy classes" );
    fi;
    end;

#############################################################################
##
#F  VirtualCharacterOps.\-( <chi>, <psi> ) . difference of virtual characters
##
VirtualCharacterOps.\- := function( chi, psi )
    return VirtualCharacterOps.\+( chi, (-1) * psi );
    end;

#############################################################################
##
#F  VirtualCharacterOps.\*( <chi>, <psi> ) . .  tensor product of virt. char.
#F  VirtualCharacterOps.\*( <int>, <psi> ) . .  tensor product of virt. char.
##
VirtualCharacterOps.\* := function( chi, psi )
    if   IsList( psi ) then
      return List( psi, x -> chi * x );
    elif IsInt( psi ) then
      return VirtualCharacter( chi.source, psi * chi.values );
    elif IsCyc( psi ) then
      return ClassFunction( chi.source, psi * chi.values );
    elif not IsClassFunction( psi ) then
      Error( "<psi> must be a class function or list of class functions" );
    elif IsInt( chi ) then
      if IsBound( psi.isVirtualCharacter ) and psi.isVirtualCharacter then
        return VirtualCharacter( psi.source, chi * psi.values );
      else
        return ClassFunction( psi.source, chi * psi.values );
      fi;
    elif IsCyc( chi ) then
      return ClassFunction( psi.source, chi * psi.values );
    elif IsClassFunction( chi ) then
      if chi.source = psi.source then
        if IsBound( chi.isVirtualCharacter ) and chi.isVirtualCharacter then
          return VirtualCharacter( chi.source,
                          List( [ 1 .. Length( chi.values ) ],
                                x -> chi.values[x] * psi.values[x] ) );
        else
          return ClassFunction( chi.source,
                          List( [ 1 .. Length( chi.values ) ],
                                x -> chi.values[x] * psi.values[x] ) );
        fi;
      else
        Error( "<chi> and <psi> must be class functions of the same",
               " group,\n",
               "with same lists of conjugacy classes" );
      fi;
    elif IsList( chi ) then
      return List( chi, x -> x * psi );
    elif IsMapping( chi ) then
      return CompositionMapping( psi, chi );
    else
      Error( "cannot form the product of <chi> and <psi>" );
    fi;
    end;

#############################################################################
##
#F  VirtualCharacterOps.\^
##
##  <chi>^<n>    tensor power of a virtual character <chi> by nat. number <n>
##  <chi>^<g>    conjugate virtual character of <chi> under action of <g>
##  <g>^<chi>    value of <chi> on group element <g>
##
VirtualCharacterOps.\^ := function( chi, obj )

    local result;

    result:= ClassFunctionOps.\^( chi, obj );

    # Adjust some components if possible.
    if IsClassFunction( result ) and not ( IsInt( obj ) and obj < 0 ) then
      result.isVirtualCharacter := true;
      result.operations         := VirtualCharacterOps;
    fi;
    return result;

    end;

#############################################################################
##
#F  VirtualCharacterOps.IsIrreducible( <chi> )
##
VirtualCharacterOps.IsIrreducible := function( chi )
    return ScalarProduct( chi, chi ) = 1;
    end;

#############################################################################
##
#F  ClassFunctionOps.IsIrreducible( <chi> )
##
ClassFunctionOps.IsIrreducible := function( chi )
    if IsVirtualCharacter( chi ) then
      return Norm( chi ) = 1;
    else
      Error( "<chi> must be a (virtual) character" );
    fi;
    end;

#############################################################################
##
#F  VirtualCharacterOps.Restricted( <arglist> )
##
VirtualCharacterOps.Restricted := function( arglist )

    local chars,
          H,
          fus,
          rest,
          i;
    
    if IsList( arglist[1] ) then
      chars:= arglist[1];
    else
      chars:= [ arglist[1] ];
    fi;

    H:= arglist[2];
    fus:= FusionConjugacyClasses( H, chars[1].source );

    rest:= [];
    for i in [ 1 .. Length( chars ) ] do
      if   IsBound( chars[i].isVirtualCharacter ) and
           chars[i].isVirtualCharacter then
        rest[i]:= VirtualCharacter( H, chars[i].values{ fus } );
      else
        rest[i]:= ClassFunction( H, chars[i].values{ fus } );
      fi;
    od;
    return rest;
    end;

#############################################################################
##
#F  VirtualCharacterOps.Induced( [ <char>, <G> ] )
##
VirtualCharacterOps.Induced := function( arglist )
    local ind,    # intermediate buffer
          result, # list of induced characters
          i;      # loop over list of induced characters

    ind:= ClassFunctionOps.Induced( arglist );
    result:= [];
    for i in [ 1 .. Length( ind ) ] do
      if IsBound( arglist[1][i].isVirtualCharacter ) and
         arglist[1][i].isVirtualCharacter then
        result[i]:= VirtualCharacter( arglist[2], ind[i].values );
      else
        result[i]:= ind[i];
      fi;
    od;

    return result;
    end;

#############################################################################
##
#F  VirtualCharacterOps.Constituents( <chi> ) .  irred. constituents of <chi>
##
VirtualCharacterOps.Constituents := function( chi )

    local irr,    # irreducible characters of 'chi.source'
          const,  # list of constituents, result
          deg,    # degree of 'chi'
          i,      # loop over 'irr'
          scpr;   # one scalar product

    irr:= Irr( chi.source );
    const:= [];

    if   IsCharacter( chi ) then

      deg:= chi.values[1];
      i:= 1;
      while deg > 0 and i <= Length( irr ) do
        scpr:= ScalarProduct( chi, irr[i] );
        if scpr <> 0 then
          deg:= deg - scpr * irr[i].values[1];
          Add( const, irr[i] );
        fi;
        i:= i+1;
      od;

    elif IsVirtualCharacter( chi ) then

      for i in irr do
        scpr:= ScalarProduct( chi, i );
        if scpr <> 0 then
          Add( const, i );
        fi;
      od;

    else
      Error( "<chi> must be a (virtual) character" );
    fi;

    return Set( const );
    end;

#############################################################################
##
#V  CharacterOps
##
CharacterOps := OperationsRecord( "CharacterOps",
                                  VirtualCharacterOps );

#############################################################################
##
#F  Character( <repres> )
#F  Character( <G>, <values> )
#F  Character( <G>, <chi> )
##
Character := function( arg )

    local G,     # group
          chi;   # character

    if Length( arg ) = 1 and IsHomomorphism( arg[1] ) then

      # character of a matrix representation <repres>
      return arg[1].operations.Character( arg[1] );

    elif Length( arg ) = 2 then

      chi:= ClassFunction( arg[1], arg[2] );
      chi.isVirtualCharacter := true;
      chi.isCharacter        := true;
      chi.operations         := CharacterOps;
      return chi;

    else
      Error( "usage: Character(<repres>) or Character(<G>,<values>)" );
    fi;
    end;

#############################################################################
##
#F  IsCharacter( <obj> )
##
IsCharacter := function( obj )

    local irr,
          chi,
          scpr,
          foundneg;

    if not IsClassFunction( obj ) then
      return false;
    elif IsBound( obj.isCharacter ) then
      return obj.isCharacter;
    elif IsBound( obj.isVirtualCharacter ) then
      if not obj.isVirtualCharacter then
        obj.isCharacter:= false;
        return false;
      else

        # 'obj' is known to be a virtual character.
        # Proper characters have positive degree.
        if obj.values[1] <= 0 then
          obj.isCharacter:= false;
          return false;
        fi;

        # Check the scalar products with all irreducibles.
        irr:= Irr( obj.source );
        for chi in irr do
          scpr:= ScalarProduct( chi, obj );
          if scpr < 0 then
            obj.isCharacter:= false;
            return false;
          fi;
        od;
        foundneg:= false;

      fi;

    else

      # check also for virtual character
      foundneg:= false;
      irr:= Irr( obj.source );
      for chi in irr do
        scpr:= ScalarProduct( chi, obj );
        if not IsInt( scpr ) then
          obj.isVirtualCharacter:= false;
          obj.isCharacter:= false;
          return false;
        elif scpr < 0 then
          foundneg:= true;
        fi;
      od;

    fi;

    obj.isVirtualCharacter:= true;
    if not foundneg then
      obj.isCharacter:= true;
      obj.operations:= CharacterOps;
    else
      obj.operations:= VirtualCharacterOps;
    fi;

    return not foundneg;

    end;

#############################################################################
##
#F  CharacterOps.Print( <chi> ) . . . . . . . . . . . . . . print a character
##
CharacterOps.Print := function( chi )
    if IsBound( chi.name ) then
      Print( chi.name );
    else
      Print( "Character( ", chi.source, ", ", chi.values, " )" );
    fi;
    end;

#############################################################################
##
#F  CharacterOps.Determinant( <chi> ) . . . . . . .  determinant of character
##
CharacterOps.Determinant := function( chi )
    return Character( chi.source,
                    DeterminantChar( CharTable( chi.source ), chi.values ) );
    end;

#############################################################################
##
#F  ClassFunctionOps.Determinant( <chi> ) . . . . .  determinant of character
##
ClassFunctionOps.Determinant := function( chi )
    if IsCharacter( chi ) then
      return Character( chi.source,
                    DeterminantChar( CharTable( chi.source ), chi.values ) );
    else
      Error( "<chi> must be a character" );
    fi;
    end;

#T kann weg, wenn Inheritance-Mechanismus ge"andert ist:
VirtualCharacterOps.Determinant := ClassFunctionOps.Determinant;

#############################################################################
##
#F  CharacterOps.Omega( <chi> ) . . . . . . . . . . . . . . central character
##
CharacterOps.Omega := function( chi )
    return ClassFunction( chi.source,
                        CentralChar( CharTable( chi.source ), chi.values ) );
    end;

#############################################################################
##
#F  ClassFunctionOps.Omega( <chi> ) . . . . . . . . . . . . central character
##
ClassFunctionOps.Omega := function( chi )
    if IsCharacter( chi ) then
      return ClassFunction( chi.source,
                        CentralChar( CharTable( chi.source ), chi.values ) );
    else
      Error( "<chi> must be a character" );
    fi;
    end;

#T kann weg, wenn Inheritance-Mechanismus ge"andert ist:
VirtualCharacterOps.Omega := ClassFunctionOps.Omega;

#############################################################################
##
#F  CharacterOps.Order( <chi> ) . . . . . . . . . . . . . determinantal order
##
CharacterOps.Order := function( chi )
    return Lcm( List( DeterminantChar( CharTable( chi.source ), chi.values ),
                      NofCyc ) );
    end;

#############################################################################
##
#F  ClassFunctionOps.Order( <chi> ) . . . . . . . . . . . determinantal order
##
ClassFunctionOps.Order := function( chi )
    if IsCharacter( chi ) then
      return CharacterOps.Order( chi );
    else
      Error( "<chi> must be a character" );
    fi;
    end;

#T kann weg, wenn Inheritance-Mechanismus ge"andert ist:
VirtualCharacterOps.Order := ClassFunctionOps.Order;

#############################################################################
##
#F  CharacterOps.\+( <chi>, <psi> ) . . . . . . . . . . . . sum of characters
##
CharacterOps.\+ := function( chi, psi )
    if IsClassFunction( chi ) and IsClassFunction( psi ) and
       chi.source = psi.source then
      if   IsBound( chi.isCharacter ) and chi.isCharacter and
           IsBound( psi.isCharacter ) and psi.isCharacter then
        return Character( chi.source, chi.values + psi.values );
      elif IsBound( chi.isVirtualCharacter ) and chi.isVirtualCharacter and
           IsBound( psi.isVirtualCharacter ) and psi.isVirtualCharacter then
        return VirtualCharacter( chi.source, chi.values + psi.values );
      else
        return ClassFunction( chi.source, chi.values + psi.values );
      fi;
    else
      Error( "<chi> and <psi> must be  characters of the same",
             " group,\n",
             "with same lists of conjugacy classes" );
    fi;
    end;

#############################################################################
##
#F  CharacterOps.\*( <chi>, <psi> ) . . . . . .  tensor product of characters
#F  CharacterOps.\*( <int>, <psi> ) . . . . . .  scalar multiple of character
##
CharacterOps.\* := function( chi, psi )
    if   IsList( psi ) then
      return List( psi, x -> chi * x );
    elif IsInt( psi ) and psi >= 0 then
      return Character( chi.source, psi * chi.values );
    elif IsInt( psi ) then
      return VirtualCharacter( chi.source, psi * chi.values );
    elif IsCyc( psi ) then
      return ClassFunction( chi.source, psi * chi.values );
    elif not IsClassFunction( psi ) then
      Error( "<psi> must be a class function or list of class functions" );
    elif IsInt( chi ) then
      if   chi > 0 and IsBound( psi.isCharacter ) and psi.isCharacter then
        return Character( psi.source, chi * psi.values );
      elif IsBound( psi.isVirtualCharacter ) and psi.isVirtualCharacter then
        return VirtualCharacter( psi.source, chi * psi.values );
      else
        return ClassFunction( psi.source, chi * psi.values );
      fi;
    elif IsCyc( chi ) then
      return ClassFunction( psi.source, chi * psi.values );
    elif IsClassFunction( chi ) then
      if chi.source = psi.source then
        if   IsBound( chi.isCharacter ) and chi.isCharacter then
          return Character( chi.source,
                          List( [ 1 .. Length( chi.values ) ],
                                x -> chi.values[x] * psi.values[x] ) );
        elif IsBound( chi.isVirtualCharacter ) and chi.isVirtualCharacter then
          return VirtualCharacter( chi.source,
                          List( [ 1 .. Length( chi.values ) ],
                                x -> chi.values[x] * psi.values[x] ) );
        else
          return ClassFunction( chi.source,
                          List( [ 1 .. Length( chi.values ) ],
                                x -> chi.values[x] * psi.values[x] ) );
        fi;
      else
        Error( "<chi> and <psi> must be class functions of the same",
               " group,\n",
               "with same lists of conjugacy classes" );
      fi;
    elif IsList( chi ) then
      return List( chi, x -> x * psi );
    elif IsMapping( chi ) then
      return CompositionMapping( psi, chi );
    else
      Error( "cannot form the product of <chi> and <psi>" );
    fi;
    end;

#############################################################################
##
#F  CharacterOps.\^
##
##  <chi>^<n>    tensor power of a  character <chi> by nat. number <n>
##  <chi>^<g>    conjugate  character of <chi> under action of <g>
##  <g>^<chi>    value of <chi> on group element <g>
##
CharacterOps.\^ := function( chi, obj )

    local result;

    result:= ClassFunctionOps.\^( chi, obj );

    # Adjust some components if possible.
    if IsClassFunction( result ) and
       ( chi.values[1] = 1 or not IsInt( obj ) or obj >= 0 ) then
      result.isCharacter := true;
      result.operations  := CharacterOps;
    fi;
    return result;
    end;

#############################################################################
##
#F  CharacterOps.Restricted( <arglist> )
##
CharacterOps.Restricted := function( arglist )

    local chars,
          H,
          fus,
          rest,
          i;
    
    if IsList( arglist[1] ) then
      chars:= arglist[1];
    else
      chars:= [ arglist[1] ];
    fi;

    H:= arglist[2];
    fus:= FusionConjugacyClasses( H, chars[1].source );

    rest:= [];
    for i in [ 1 .. Length( chars ) ] do
      if   IsBound( chars[i].isCharacter ) and chars[i].isCharacter then
        rest[i]:= Character( H, chars[i].values{ fus } );
      elif IsBound( chars[i].isVirtualCharacter )
           and chars[i].isVirtualCharacter then
        rest[i]:= VirtualCharacter( H, chars[i].values{ fus } );
      else
        rest[i]:= ClassFunction( H, chars[i].values{ fus } );
      fi;
    od;
    return rest;
    end;

#############################################################################
##
#F  CharacterOps.Induced( [ <char>, <G> ] )
##
CharacterOps.Induced := function( arglist )
    local ind,    # intermediate buffer
          result, # list of induced characters
          i;      # loop over list of induced characters

    ind:= ClassFunctionOps.Induced( arglist );
    result:= [];
    for i in [ 1 .. Length( ind ) ] do
      if   IsBound( arglist[1][i].isCharacter )
         and arglist[1][i].isCharacter then
        result[i]:= Character( arglist[2], ind[i].values );
      elif IsBound( arglist[1][i].isVirtualCharacter )
         and arglist[1][i].isVirtualCharacter then
        result[i]:= VirtualCharacter( arglist[2], ind[i].values );
      else
        result[i]:= ind[i];
      fi;
    od;

    return result;
    end;

##############################################################################
##
##  Many computations for group characters of a group $G$ involve computations
##  in normal subgroups or factor groups of $G$.
##
##  In some cases the character table of $G$ is sufficient, a question about a
##  normal subgroup $N$ can be answered if one knows the conjugacy classes
##  that form $N$, e.g., the question whether a character of $G$ restricts
##  irreducibly to $N$.  But other questions require the computation of $N$ or
##  even more information, like the character table of $N$.
##
##  In order to do these computations only once, in the group record of $G$
##  there are components to store normal subgroups, the corresponding lists of
##  conjugacy classes, and (if necessary) the factor groups, namely
##
##  'nsg': \\        list of normal subgroups of $G$, may be incomplete,
##
##  'nsgclasses': \\ at position $i$ the list of positions of conjugacy
##                   classes forming the $i$-th entry of the 'nsg' component,
##
##  'nsgfactors': \\ at position $i$ (if bound) the factor group
##                   modulo the $i$-th entry of the 'nsg' component.
##
##  The functions
##
##     'NormalSubgroupClasses',
##     'FactorGroupNormalSubgroupClasses', and
##     'ClassesNormalSubgroup'
##
##  use these components, and they are the only functions that do this.
##
##  So if you need information about a normal subgroup for that you know the
##  conjugacy classes, you should get it using 'NormalSubgroupClasses'.  If
##  the normal subgroup was already used it is just returned, with all the
##  knowledge it contains.  Otherwise the normal subgroup is added to the
##  lists, and will be available for the next call.
##
##  For example, if you are dealing with kernels of characters using the
##  'Kernel' function you make use of this feature because 'Kernel' calls
##  'NormalSubgroupClasses'.
##
##############################################################################

##############################################################################
##
#F  NormalSubgroupClasses( <G>, <classes> )
##
##  returns the normal subgroup of the group <G> that consists of the
##  conjugacy classes whose positions are in the list <classes>.
##
##  If '<G>.nsg' does not yet contain the required normal subgroup, and if the
##  component '<G>.normalSubgroups' is bound then the result will be identical
##  with the group in '<G>.normalSubgroups'.
##
NormalSubgroupClasses := function( G, classes )

    local pos,        # position of the group in the list of such groups
          ccl,        # <G>-conjugacy classes in our normal subgroup
          size,       # size of our normal subgroup
          candidates, # bound normal subgroups that possibly are our group
          group,      # the normal subgroup
          repres,     # list of representatives of conjugacy classes
          found,      # normal subgroup already identified
          i;          # loop over normal subgroups

    # Initialize components to store kernel information.
    if not IsBound( G.nsg ) then
      G.nsg        := [];
      G.nsgclasses := [];
      G.nsgfactors := [];
    fi;

    classes:= Set( classes );
    pos:= Position( G.nsgclasses, classes );
    if pos = false then

      # The group is not yet stored here, try 'G.normalSubgroups'.
      if IsBound( G.normalSubgroups ) then

        # Identify our normal subgroup.
        ccl:= ConjugacyClasses( G ){ classes };
        size:= Sum( ccl, Size );
        candidates:= Filtered( G.normalSubgroups, x -> Size( x ) = size );
        if Length( candidates ) = 1 then
          group:= candidates[1];
        else
          repres:= List( ccl, Representative );
          found:= false;
          i:= 0;
          while not found do
            i:= i+1;
            if ForAll( repres, x -> x in candidates[i] ) then
              found:= true;
            fi;
          od;
          group:= candidates[i];
        fi;

      else

        # The group is not yet stored, we have to construct it.
        repres:= List( ConjugacyClasses(G), Representative );
        group := NormalClosure( G, Subgroup( Parent(G), repres{ classes } ) );

      fi;

      Add( G.nsgclasses, classes );
      Add( G.nsg       , group   );
      pos:= Length( G.nsg );

    fi;

    return G.nsg[ pos ];

    end;

##############################################################################
##
#F  ClassesNormalSubgroup( <G>, <N> )
##
##  returns the list of positions of conjugacy classes of the group <G> that
##  are contained in the normal subgroup <N> of <G>.
##
ClassesNormalSubgroup := function( G, N )

    local classes,    # result list
          found,      # 'N' already found?
          pos,        # position in 'G.nsg'
          ccl;        # conjugacy classes of 'G'

    # Initialize components to store kernel information.
    if not IsBound( G.nsg ) then
      G.nsg        := [];
      G.nsgclasses := [];
      G.nsgfactors := [];
    fi;

    # Search for 'N' in 'G.nsg'.
    found:= false;
    pos:= 0;
    while ( not found ) and pos < Length( G.nsg ) do
      pos:= pos+1;
      if IsIdentical( N, G.nsg[ pos ] ) then
        found:= true;
      fi;
    od;
    if not found then
      pos:= Position( G.nsg, N );
    fi;

    if pos = false then

      # The group is not yet stored here, try 'G.normalSubgroups'.
      if IsBound( G.normalSubgroups ) then

        # Identify our normal subgroup.
        N:= G.normalSubgroups[ Position( G.normalSubgroups, N ) ];

      fi;

      ccl:= ConjugacyClasses( G );
      classes:= Filtered( [ 1 .. Length( ccl ) ],
                          x -> Representative( ccl[x] ) in N );

      Add( G.nsgclasses, classes );
      Add( G.nsg       , N       );
      pos:= Length( G.nsg );

    fi;

    return G.nsgclasses[ pos ];

    end;

##############################################################################
##
#F  FactorGroupNormalSubgroupClasses( <G>, <classes> )
##
##  returns the factor group of the group <G> modulo the normal subgroup of
##  <G> that consists of the conjugacy classes whose positions are in the
##  list <classes>.
##
FactorGroupNormalSubgroupClasses := function( G, classes )

    local f,     # the result
          pos;   # position in list of normal subgroups

    if not IsBound( G.nsgclasses ) then

      f:= G / NormalSubgroupClasses( G, classes );
      G.nsgfactors[1]:= f;

    else

      pos:= Position( G.nsgclasses, classes );
      if pos = false then
        f:= G / NormalSubgroupClasses( G, classes );
        G.nsgfactors[ Length( G.nsgclasses ) ]:= f;
      elif IsBound( G.nsgfactors[ pos ] ) then
        f:= G.nsgfactors[ pos ];
      else
        f:= G / G.nsg[ pos ];
        G.nsgfactors[ pos ]:= f;
      fi;

    fi;

    return f;
    end;

#############################################################################
##
#F  CharacterString( <chi> ) . . . . . . . group character information string
##
CharacterString := function( chi )
    return Concatenation( "of degree ", StringInt( chi.values[1] ),
                          " of group ", GroupString( chi.source, "G" ) );
    end;

#############################################################################
##
#F  Irr( <G> )  . . . . . . . . . . . . list of irreducible characters of <G>
##
Irr := function( G )

    if not IsBound( G.irr ) then
      G.irr:= List( CharTable( G ).irreducibles, x -> Character( G, x ) );
    fi;
    return G.irr;
    end;


#############################################################################
##
#F  InertiaSubgroup( <G>, <chi> ) . . . . . . inertia subgroup of a character
##
##  
##  Given a character $\chi$ of a group $H$ that is given as subgroup of
##  the group $P$, compute for $G \leq N = N_P(H)$ the inertia subgroup
##  $I_G(\chi) = \{ g\in G; \chi^g = \chi \}$ where the conjugate class
##  function $\chi^g$ is defined by $\chi^g(h) = \chi(h^g)$.
##  
##  Let $\pi(g)$ denote the permutation of the conjugacy classes $Cl(H)$
##  that is induced by the conjugation action of $g$.  The map $\pi$ is
##  then a homomorphism $N\rightarrow S_{Cl(H)}$, obviously $H\leq\ker\pi$.
##  
##  Here is an algorithm to compute $I_G(\chi)$.
##  Since $N_G(\chi) = G \cap I_N(\chi)$ we need to consider only the
##  case $G = N$.
##  
##  \begin{enumerate}
##  \item Let $(O_i;i\in I)$ be a partition of $Cl(H)$ such that each
##        set $O_i$ is invariant under automorphisms of $H$.
##        For example, take $I = \{ (\|g\|,\|C_H(g)\|); g\in H \}$ and
##        $O_{(a,b)} = \{ g\in H; \|g\|=a, \|C_H(g)\|=b \}$, or refine
##        this using power maps or the table automorphism group of $H$.
##        Note that this is independent of $\chi$.
##  
##  \item Refine this partition using $\chi$.
##        Define $V_{\chi} = \{ \chi(g); g\in H \}$ and
##        $J = I\times V_{\chi}$, and write
##        $\tilde{O}_{i,x} = \{ g\in O_i; \chi(g) = x \}$.
##        Then $I_N(\chi) = \bigcap_{j\in J} Stab_{\pi(N)}(\tilde{O}_j)$
##        where $Stab$ denotes the set stabilizer.
##  
##        We need not inspect those sets where no refinement occurs, i.e., 
##        those with $\tilde{O}_{i,x} = O_i$ for a value $x$.
##        Especially, if $\chi$ does not impose refinement conditions then
##        it is necessarily invariant, that is, $I_N(\chi) = N$.
##  
##  \item If the partition $p = (\tilde{O}_j;j\in J)$ is already stored in
##        a list of partitions and their stabilizers then return the
##        intersection of $G$ with the corresponding stabilizer.
##  
##  \item If we have already stored the stabilizer of a refinement
##        $p^{\prime}$ of $p$ then let $S = Stab_{\pi(N)}(p^{\prime})$.
##        Otherwise take $S$ the trivial group.
##        $S$ is a subgroup of $\pi(I_N(\chi))$.
##  
##  \item Define the homomorphism $\pi$ by computing the images $\pi(g)$
##        for $g$ in a generating set of $N$.
##        This is again independent of $\chi$.
##  
##  \item Compute $\bigcap_{j\in J} Stab_{\pi(N)}(\tilde{O}_j)$.
##        If $J = \{j_1,j_2,\ldots,j_n\}$ then this can be done by first
##        initializing $T = Stab_{\pi(N)}(\tilde{O}_{j_1})$ and then
##        replacing $T$ by $Stab_T(\tilde{O}_{j_i}$ for $i = 2,3,\ldots,n$.
##  
##        The subgroup $S$ can be used to speed up the computations.
##  
##  \item Compute $I_N(\chi)$ which is the full preimage of $T$ under $\pi$.
##  
##  \item Store the partition $p$ and $I_N(\chi)$ in the lists.
##  
##  \item Output $I_G(\chi) = G \cap I_N(\chi)$.
##  \end{enumerate}
##  
InertiaSubgroup := function( G, chi )

    local H,          # group of 'chi'
          N,          # normalizer of 'H' in its parent
          global,     # global partition of classes
          part,       # refined partition
          p,          # one set in 'global' and 'part'
          val,        # one value in 'p'
          values,     # list of character values on 'p'
          new,        # list of refinements of 'p'
          hom,        # 'PermClassesHomomorphism( H )'
          i,          # loop over stored partitions
          pos,        # position where to store new partition later
          found,      # flag:  Is 'part' already stored?
          substab,    # known subgroup of the inertia group
          stab,       # the inertia subgroup, result
          len;        # length of 'part'

    if not ( IsCharacter( chi ) and IsSubgroup( G, chi.source ) ) then
      Error( "<chi> must be a character of a subgroup of <G>" );
    fi;

    if not IsBound( chi.inertiaSubgroup ) then

      H:= chi.source;

      # 1. Compute the global partition.
      global:= GlobalPartitionClasses( H );

      # 2. Refine the partition using the character values distribution.
      #    We need only those parts where we really get a refinement.
      part:= [];
      for p in global do
        val:= chi.values[ p[1] ];
        if ForAny( p,  x-> chi.values[x] <> val ) then
          # proper refinement
          values:= [];
          new:= [];
          for i in p do
            pos:= Position( values, chi.values[i] );
            if pos = false then
              Add( values, chi.values[i] );
              Add( new, [ i ] );
            else
              Add( new[ pos ], i );
            fi;
          od;
          Append( part, new );
        fi;
      od;

      N:= Normalizer( Parent( H ), H );
      if Size( N ) = Size( Parent( H ) ) then
        N:= Parent( H );
      fi;
#T a situation where I would prefer if this would be settled in general.

      if   Length( part ) = 0 then

        # If no refinement occurs, the character is necessarily invariant
        # in $N$.
        stab:= N;

      else

        if not IsBound( H.inertiaInfo ) then
          H.inertiaInfo:= rec( partitions  := [],
                               stabilizers := [] );
        fi;

        # 3. Check whether $I_N( 'part' )$ is already stored.
        pos:= Position( H.inertiaInfo.partitions, part );
        if pos <> false then

          if G = N then
            stab:= H.inertiaInfo.stabilizers[ pos ];
          else
            stab:= Intersection( H.inertiaInfo.stabilizers[ pos ], G );
          fi;

        else

          # 4. If not, try to take a stored partition that is a
          #    refinement of 'part'.
          #    The partitions are stored according to increasing length,
          #    so we have to check those partitions that are longer than
          #    'part', and may take the first that fits.
          len:= Length( part );

          # We will insert the stabilizer at position 'pos' later.
          pos:= 1;
          while pos <= Length( H.inertiaInfo.partitions ) and
                Length( H.inertiaInfo.partitions[ pos ] ) <= len do
            pos:= pos+1;
          od;

          found:= false;
          i:= pos - 1;
          while i < Length( H.inertiaInfo.partitions ) and not found do

            i:= i+1;
            if ForAll( H.inertiaInfo.partitions[i],
                       x -> ForAny( part, y -> IsSubset( y, x ) ) ) then
              found:= true;
            fi;

          od;
#T  Up to now we do not use 'substab'
          if found then

            # The stabilizer is a subgroup of the required inertia group.
#T map this under pi!
            substab:= H.inertiaInfo.stabilizers[i];

          else
            substab:= Group( () );
          fi;

          # 5. Compute the corresponding permutations if necessary.
          hom:= PermClassesHomomorphism( H );

          # 6. Compute the stabilizer of 'part' in 'permgrp'.
          stab:= hom.range;
          for p in part do
            stab:= stab.operations.StabilizerSet( stab, p );
#T  Here I would like to give 'substab' as additional argument!!
          od;

          # 7. Compute the preimage in $N$.
          stab:= PreImage( hom, stab );

          # 8. Store the stabilizer at position 'pos'.
          for i in Reversed( [ pos ..
                               Length( H.inertiaInfo.partitions ) ] ) do
            H.inertiaInfo.partitions[ i+1 ]:= H.inertiaInfo.partitions[i];
            H.inertiaInfo.stabilizers[ i+1 ]:= H.inertiaInfo.stabilizers[i];
          od;
          H.inertiaInfo.partitions[ pos ]:= part;
          H.inertiaInfo.stabilizers[ pos ]:= stab;

        fi;
      fi;

      if G <> N then
        stab:= Intersection( stab, G );
      fi;
      if   Size( stab ) = Size( H ) then
        stab:= H;
      elif Size( stab ) = Size( N ) then
        stab:= N;
      fi;

      # Store the inertia subgroup.
      chi.inertiaSubgroup:= AsSubgroup( Parent( H ), stab );

    fi;

    # 9. Return the result.
    return chi.inertiaSubgroup;
    end;

##############################################################################
##
#F  OrbitChar( <chi>, <linear> )
##
##  returns the orbit of the character values list <chi> under the action of
##  Galois automorphisms and multiplication with the linear characters in
##  the list <linear>.
##
##  It is assumed that <linear> is closed under Galois automorphisms and
##  tensoring.
##  (This means that we can first form the orbit under Galois action, and
##  then apply the linear characters to all Galois conjugates.)
##
OrbitChar := function( chi, linear )

    local classes,   # range of positions in 'chi'
          nofcyc,    # describes the conductor of values of 'chi'
          gens,      # generators of Galois automorphism group
          orb,       # the orbit, result
          gen,       # loop over 'gens'
          image;     # one image of 'chi' under operation

    classes:= [ 1 .. Length( chi ) ];
    nofcyc:= NofCyc( chi );

    # Apply Galois automorphisms if necessary.
    orb:= [ chi ];
    if nofcyc > 1 then
      gens:= Flat( GeneratorsPrimeResidues( nofcyc ).generators );
      for chi in orb do
        for gen in gens do
          image:= List( chi, x -> GaloisCyc( x, gen ) );
          if not image in orb then
            Add( orb, image );
          fi;
        od;
      od;
    fi;

    # Apply multiplication with linear characters.
    for chi in orb do
      for gen in linear do
        image:= List( classes, x -> gen[x] * chi[x] );
        if not image in orb then
          Add( orb, image );
        fi;
      od;
    od;
      
    # Return the orbit.
    return orb;
    end;

##############################################################################
##
#F  OrbitsCharacters( <irr> )
##
##  returns a list of orbits of the characters <irr> under the action of
##  Galois automorphisms and multiplication with linear characters.
##
OrbitsCharacters := function( irr )

    local irrvals,     # list of value lists
          oldirrvals,  # store original succession
          G,           # underlying group
          linear,      # linear characters of 'tbl'
          orbits,      # list of orbits, result
          indices,     # from 1 to number of conjugacy classes of 'tbl'
          orb,         # one orbit
          gens,        # generators of the acting group
          chi,         # one irreducible character
          gen,         # one generator of the acting group
          image,       # image of a character
          i,           # loop over one orbit
          pos;         # position of value list in 'oldirrvals'

    orbits:= [];

    if Length( irr ) > 0 then

      if IsCharacter( irr[1] ) then

        # Replace group characters by their value lists.
        # Store the succession in the original list.
        irrvals:= List( irr, x -> x.values );
        oldirrvals:= ShallowCopy( irrvals );
        irrvals:= Set( irrvals );

      else
        irrvals:= Set( irr );
      fi;

      indices:= [ 1 .. Length( irrvals[1] ) ];

      # Compute the orbit of linear characters if there are any.
      linear:= Filtered( irrvals, x -> x[1] = 1 );

      if Length( linear ) > 0 then

        # The linear characters form an orbit.
        # We remove them from the other characters,
        # and remove the trivial character from 'linear'.
        orb:= ShallowCopy( linear );
        SubtractSet( irrvals, linear );
        RemoveSet( linear, List( linear[1], x -> 1 ) );

        # Make 'linear' closed under Galois automorphisms.
        gens:= Flat( GeneratorsPrimeResidues(
                        NofCyc( Flat( linear ) ) ).generators );

        for chi in orb do
          for gen in gens do
            image:= List( chi, x -> GaloisCyc( x, gen ) );
            if not image in orb then
              Add( orb, image );
            fi;
          od;
        od;

        # Make 'linear' closed under multiplication with linear characters.
        for chi in orb do
          for gen in linear do
            image:= List( indices, x -> gen[x] * chi[x] );
            if not image in orb then
              Add( orb, image );
            fi;
          od;
        od;

        orbits[1]:= orb;

      fi;

      # Compute the other orbits.
      while Length( irrvals ) > 0 do

        orb:= OrbitChar( irrvals[1], linear );
        Add( orbits, orb );
        SubtractSet( irrvals, orb );

      od;

      # Replace the value lists by the group characters
      # if the input was a list of characters.
      # Be careful not to copy characters if not necessary.
      if IsCharacter( irr[1] ) then
        G:= irr[1].source;
        for orb in orbits do
          for i in [ 1 .. Length( orb ) ] do
            pos:= Position( oldirrvals, orb[i] );
            if pos = false then
              orb[i]:= Character( G, orb[i] );
            else
              orb[i]:= irr[ pos ];
            fi;
          od;
        od;
      fi;

    fi;

    return orbits;
    end;

##############################################################################
##
#F  OrbitRepresentativesCharacters( <irr> )
##
##  returns a list of representatives of the orbits of the characters <irr>
##  under the action of Galois automorphisms and multiplication with linear
##  characters.
##
OrbitRepresentativesCharacters := function( irr )

    local irrvals,     # list of value lists
          oldirrvals,  # store original succession
          chi,         # loop over 'irrvals'
          linear,      # linear characters in 'irr'
          nonlin,      # nonlinear characters in 'irr'
          repres,      # list of representatives, result
          orb;         # one orbit

    repres:= [];

    if Length( irr ) > 0 then

      if IsCharacter( irr[1] ) then

        # Replace group characters by their value lists.
        # Store the succession in the original list.
        irrvals:= List( irr, x -> x.values );
        oldirrvals:= ShallowCopy( irrvals );
        irrvals:= Set( irrvals );

      else
        irrvals:= Set( irr );
      fi;

      # Get the linear characters.
      linear := [];
      nonlin := [];
      for chi in irrvals do
        if chi[1] = 1 then
          Add( linear, chi );
        else
          Add( nonlin, chi );
        fi;
      od;
      if Length( linear ) > 0 then
        repres[1]:= linear[1];
      fi;

      # Compute orbits and remove them until the set is empty.
      while Length( nonlin ) > 0 do
        Add( repres, nonlin[1] );
        orb:= OrbitChar( nonlin[1], linear );
        SubtractSet( nonlin, orb );
      od;

      # Replace the value lists by the group characters
      # if the input was a list of characters.
      # Do not copy characters!
      if IsCharacter( irr[1] ) then
        repres:= List( repres, x -> irr[ Position( oldirrvals, x ) ] );
      fi;

    fi;

    # Return the representatives.
    return repres;
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

