#############################################################################
##
#A  ctmapcon.g                  GAP library                     Thomas Breuer
##
#A  @(#)$Id: ctmapcon.g,v 3.37 1994/06/21 14:58:27 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains  those  functions  that  are used to construct maps,
##  (mostly fusion maps and powermaps).
##
#H  $Log: ctmapcon.g,v $
#H  Revision 3.37  1994/06/21  14:58:27  sam
#H  fixed call of 'MakeStabChain
#H
#H  Revision 3.36  1994/04/21  12:13:09  sam
#H  fixed name of a record component
#H
#H  Revision 3.35  1994/03/28  08:06:02  sam
#H  improved 'InitPowermap'
#H
#H  Revision 3.34  1994/03/03  15:27:38  sam
#H  allowed component 'galomorphisms'
#H
#H  Revision 3.33  1994/02/18  17:07:59  sam
#H  allowed 'Powermap' call for Brauer tables
#H
#H  Revision 3.32  1993/10/19  16:58:25  sam
#H  fixed possible absence of 'powermap' component
#H
#H  Revision 3.31  1993/06/22  12:14:37  sam
#H  fixed bug in 'SubgroupFusions'
#H
#H  Revision 3.30  1993/06/15  08:24:35  sam
#H  fixed bug in 'InitPowermap'
#H
#H  Revision 3.29  1993/05/05  14:03:50  sam
#H  improved 'Powermap' a little bit
#H
#H  Revision 3.28  1993/04/28  13:04:28  sam
#H  two little improvements in 'SubgroupFusions'
#H
#H  Revision 3.27  1992/04/30  12:28:34  martin
#H  fixed bug in 'SubgroupFusions'
#H
#H  Revision 3.26  1992/03/06  13:20:48  sam
#H  little improvement in 'SubgroupFusions', stylistic changes
#H
#H  Revision 3.25  1992/02/24  13:17:51  sam
#H  removed minor bug in 'Powermap'
#H
#H  Revision 3.24  1992/02/04  15:40:45  sam
#H  fixed bug in 'ConsiderSmallerPowermaps'
#H
#H  Revision 3.23  1992/01/21  16:38:36  sam
#H  added 'CheckPermChar' (up to now a part of 'InitFusion') and
#H  changed 'SubgroupFusions'
#H
#H  Revision 3.22  1992/01/13  16:02:30  sam
#H  fixed little bug in 'ConsiderTableAutomorphisms',
#H  adjusted 'SubgroupFusions'
#H
#H  Revision 3.21  1992/01/09  11:21:45  sam
#H  added default initialisation for 'InfoPermGroup2'
#H
#H  Revision 3.20  1991/12/27  15:27:49  sam
#H  renamed 'PowermapsAllowedBySymmetrizations' to
#H  'PowermapsAllowedBySymmetrisations'
#H
#H  Revision 3.19  1991/12/20  10:13:58  sam
#H  renamed 'Kernel' to 'KernelChar'
#H
#H  Revision 3.18  1991/12/20  09:18:54  sam
#H  changed 'Consistency' to 'TestConsistencyMaps'
#H
#H  Revision 3.17  1991/12/20  08:22:26  sam
#H  changed call of 'LargestMovedPointPerm' to call of 'LargestMovedPoint'
#H
#H  Revision 3.16  1991/12/19  13:02:20  martin
#H  renamed 'SupportPerm' to 'LargestMovedPointPerm'
#H
#H  Revision 3.15  1991/12/17  08:28:27  sam
#H  little bug in InitPowermap fixed
#H
#H  Revision 3.14  1991/12/16  12:36:25  sam
#H  fixed little bug in 'RepresentativesFusions'
#H
#H  Revision 3.13  1991/12/13  13:15:11  sam
#H  replaced 'IsPrime' by 'IsPrimeInt'
#H
#H  Revision 3.12  1991/12/12  09:14:36  martin
#H  changed 'ONPOINTS' to 'OnPoints'
#H
#H  Revision 3.11  1991/12/04  17:49:26  sam
#H  added 'CharString'
#H
#H  Revision 3.10  1991/12/03  17:07:46  sam
#H  indented functions,
#H  changed functions which use permutation groups
#H
#H  Revision 3.9  1991/10/18  16:09:02  sam
#H  check of parameters in 'Powermap' changed
#H
#H  Revision 3.8  1991/10/09  18:13:19  sam
#H  check of parameters in 'SubgroupFusions' changed
#H
#H  Revision 3.7  1991/10/09  14:36:16  sam
#H  simplified use of "infinity"
#H
#H  Revision 3.6  1991/10/02  12:36:31  sam
#H  corrections
#H
#H  Revision 3.5  1991/10/01  13:45:00  casper
#H  changed 'E(3)' to '"infinity"',
#H  some '()' deleted
#H
#H  Revision 3.4  1991/10/01  09:16:33  sam
#H  changed 'VERBOSE' to 'InfoCharTable2'
#H
#H  Revision 3.3  1991/09/30  13:59:54  sam
#H  changed 'Gcd' to 'GcdInt'
#H
#H  Revision 3.2  1991/09/05  15:35:48  sam
#H  changed 'GcdList' to 'Gcd'
#H
#H  Revision 3.1  1991/09/03  15:09:33  goetz
#H  changed 'reps' to 'orders'.
#H
#H  Revision 3.0  1991/09/03  14:18:50  goetz
#H  Initial Revision.
#H
##


#############################################################################
##
#F  InfoCharTable?( ... ) . . . info function for the character table package
#F  InfoPermGroup2( ... ) . . . . . . info function for the permgroup package
#F  CharString( <char>, <str> ) . . . . . . . .  character information string
##
    if not IsBound( InfoCharTable1 )  then InfoCharTable1 := Ignore;  fi;
    if not IsBound( InfoCharTable2 )  then InfoCharTable2 := Ignore;  fi;
    if not IsBound( InfoPermGroup2 )  then InfoPermGroup2 := Ignore;  fi;

CharString := function( char, str )
    return ConcatenationString( str, " of degree ", String( char[1] ) );
    end;


#############################################################################
##
#F  UpdateMap( <char>, <paramap>, <indirected> )
##
##  improves <paramap> using that <indirected> is the indirection (possibly
##  parametrized) of <char> by <paramap>
##
UpdateMap := function( char, paramap, indirected )
    local i, j, value, fus;

    for i in [ 1 .. Length( paramap ) ] do
      if IsInt( paramap[i] ) then
        if indirected[i] <> char[ paramap[i] ] then
          Print( "#E UpdateMap: inconsistency at class ", i, "\n" );
          paramap[i]:= Unknown( );
        fi;
      else
        value:= indirected[i];
        if not IsList( value ) then value:= [ value ]; fi;
        fus:= [];
        for j in paramap[i] do
          if char[j] in value then Add( fus, j ); fi;
        od;
        if fus = [] then
          Print( "#E UpdateMap: inconsistency at class ", i, "\n" );
          paramap[i]:= Unknown( );
        else
          if Length( fus ) = 1 then fus:= fus[1]; fi;
          paramap[i]:= fus;
        fi;
      fi;
    od;
    end;


#############################################################################
##
#F  NonnegIntScalarProducts( <tbl>, <chars>, <candidate> )
##
##  returns 'true' if all scalar products of <candidate> with the characters
##  in the list <chars> are nonegative integers, 'false' otherwise.
##
NonnegIntScalarProducts := function( tbl, chars, candidate )
    local i, sc, classes, order, char, weighted;

    classes:= tbl.classes;
    order:= tbl.order;
    weighted:= [];
    for char in chars do
      for i in [ 1 .. Length( char ) ] do
        weighted[i]:= classes[i] * char[i];
      od;
      sc:= weighted * candidate;
      if not IsInt( sc / order ) or sc < 0 then return false; fi;
    od;
    return true;
    end;


#############################################################################
##
#F  IntScalarProducts( <tbl>, <chars>, <candidate> )
##
##  returns 'true' if all scalar products of <candidate> with the characters
##  in the list <chars> are integers, 'false' otherwise.
##
IntScalarProducts := function( tbl, chars, candidate )
    local i, classes, order, char, weighted;

    classes:= tbl.classes;
    order:= tbl.order;
    weighted:= [];
    for char in chars do
      for i in [ 1 .. Length( char ) ] do
        weighted[i]:= classes[i] * char[i];
      od;
      if not IsInt( weighted * candidate / order ) then return false; fi;
    od;
    return true;
    end;


#############################################################################
##
#F  ContainedSpecialVectors( <tbl>, <chars>, <paracharacter>, <func> )
##
##  returns the list of all elements <vec> of <paracharacter> which have
##  integral norm and integral scalar product with the principal character
##  of <tbl> and which satisfy <func>( <tbl>, <chars>, <vec> )
##
ContainedSpecialVectors := function( tbl, chars, paracharacter, func )
    local i, j, x, classes, unknown, images, number, index, direction,
          pos, oldvalue, newvalue, norm, sum, possibilities, order;

    paracharacter:= ShallowCopy( paracharacter );
    classes:= tbl.classes;
    order:= tbl.order;
    unknown:= [];
    images:= [];
    number:= [];
    index:= [];
    direction:= [];
    pos:= 1;
    for i in [ 1 .. Length( paracharacter ) ] do
      if IsList( paracharacter[i] ) then
        unknown[pos]:= i;
        images[pos]:= paracharacter[i];
        number[pos]:= Length( paracharacter[i]);
        index[pos]:= 1;
        direction[pos]:= 1;               # 1 means up, -1 means down
        paracharacter[i]:= paracharacter[i][1];
        pos:= pos + 1;
      fi;
    od;
    sum:= classes * paracharacter;
    norm:= classes * List( paracharacter, x -> x * GaloisCyc( x, -1 ) );
    possibilities:= [];
    if IsInt( sum / order ) and IsInt( norm / order) 
       and func( tbl, chars, paracharacter ) then
      possibilities[1]:= Copy( paracharacter );
    fi;
    i:= 1;
    while true do
      i:= 1;
      while i <= Length( unknown ) and 
         ( ( index[i] = number[i] and direction[i] = 1 ) or
              ( index[i] = 1 and direction[i] = -1 ) ) do
        direction[i]:= - direction[i];
        i:= i+1;
      od;
      if i > Length( unknown ) then             # we are through
        return possibilities;
      else                                      # update at position i
        oldvalue:= images[i][ index[i] ];
        index[i]:= index[i] + direction[i];
        newvalue:= images[i][ index[i] ];
        sum:= sum + classes[ unknown[i] ] * ( newvalue - oldvalue );
        norm:= norm + classes[ unknown[i] ]
                * (   newvalue * GaloisCyc( newvalue, -1 )
                    - oldvalue * GaloisCyc( oldvalue, -1 ) );
        if IsInt( sum / order ) and IsInt( norm / order ) then
          for j in [ 1 .. Length( unknown ) ] do
            paracharacter[ unknown[j] ]:= images[j][ index[j] ];
          od;
          if func( tbl, chars, paracharacter ) then
            Add( possibilities, Copy( paracharacter ) );
          fi;
        fi;
      fi;
    od;
    end;


#############################################################################
##
#F  ContainedPossibleCharacters( <tbl>, <chars>, <paracharacter> )
##
##  returns the list of all elements <vec> of <paracharacter> which have
##  integral norm, integral scalar product with the principal character
##  of <tbl> and nonnegative integral scalar product with all elements
##  of <chars>
##
ContainedPossibleCharacters := function(tbl, chars, paracharacter)
    return ContainedSpecialVectors( tbl, chars, paracharacter,
                                    NonnegIntScalarProducts );
    end;


#############################################################################
##
#F  ContainedPossibleVirtualCharacters( <tbl>, <chars>, <paracharacter> )
##
##  returns the list of all elements <vec> of <paracharacter> which have
##  integral norm, integral scalar product with the principal character
##  of <tbl> and integral scalar product with all elements of <chars>
##
ContainedPossibleVirtualCharacters :=function( tbl, chars, paracharacter )
    return ContainedSpecialVectors( tbl, chars, paracharacter,
                                    IntScalarProducts );
    end;


#############################################################################
##
#F  InitFusion( <subtbl>, <tbl> )
##
##  returns the (probably parametrized) map of the subgroup fusion from
##  <subtbl> to <tbl> using the following properties:
##
##  For any class 'i' of <subtbl> the centralizer of the image must be
##  a multiple of the centralizer of 'i', and
##
##  the representative order of 'i' is equal to the representative order
##  of its image (only used if representative orders are stored).
##
##  If no fusion map is possible, 'false' is returned.
##
InitFusion := function( subtbl, tbl )
    local i, j, k, upper, subcentralizers, subclasses, centralizers,
          initfusion, orders, subcentralizers, suborders, sameord, elm,
          errors, choice;

    if not ( IsCharTable( subtbl ) and IsCharTable( tbl ) ) then
      Error( "<subtbl>, <tbl> must be character tables" );
    fi;

    subcentralizers:= subtbl.centralizers;
    subclasses:= subtbl.classes;
    centralizers:= tbl.centralizers;
    initfusion:= [];
    upper:= [ 1 ]; # upper[i]: upper bound for the number of elements
                   # fusing in class i
    for i in [ 2 .. Length( centralizers ) ] do
      upper[i]:= Minimum( subtbl.order, tbl.classes[i] );
    od;

    # if orders are known
    if IsBound( subtbl.orders ) and IsBound( tbl.orders ) then
      orders   := tbl.orders;
      suborders:= subtbl.orders;
      sameord:= [];
      for i in [ 1 .. Length( orders ) ] do
        if IsInt( orders[i] ) then
          if IsBound( sameord[ orders[i] ] ) then
            AddSet( sameord[ orders[i] ], i );
          else
            sameord[ orders[i] ]:= [ i ];
          fi;
        else                 # para-orders
          for j in orders[i] do
            if IsBound( sameord[j] ) then
              AddSet( sameord[j], i );
            else
              sameord[j]:= [ i ];
            fi;
          od;
        fi;
      od;
      for i in [ 1 .. Length( suborders) ] do
        initfusion[i]:= [];
        if IsInt( suborders[i] ) then
          if not IsBound( sameord[ suborders[i] ] ) then
            InfoCharTable2( "#E InitFusion: no fusion possible because of ",
                            "representative orders\n" );
            return false;
          fi;
          for j in sameord[ suborders[i] ] do
            if centralizers[j] mod subcentralizers[i] = 0 and
                                    upper[j] >= subclasses[i] then
              AddSet( initfusion[i], j );
            fi;
          od;
        else                 # para-orders
          choice:= Filtered( suborders[i], x -> IsBound( sameord[x] ) );
          if choice = [] then
            InfoCharTable2( "#E InitFusion: no fusion possible because of ",
                            "representative orders\n" );
            return false;
          fi;
          for elm in choice do
            for j in sameord[ elm ] do
              if centralizers[j] mod subcentralizers[i] = 0 then
                AddSet( initfusion[i], j );
              fi;
            od;
          od;
        fi;
      od;

    # just centralizers are known:
    else
      for i in [ 1 .. Length( subcentralizers ) ] do
        initfusion[i]:= [];
        for j in [ 1 .. Length( centralizers ) ] do
          if centralizers[j] mod subcentralizers[i] = 0 and
                                    upper[j] >= subclasses[i] then
            AddSet( initfusion[i], j );
          fi;
        od;
      od;
    fi;

    # step 2: replace sets with exactly one element by that element
    errors:= [];
    for i in [ 1 .. Length( initfusion ) ] do
      if Length( initfusion[i] ) = 1 then
        initfusion[i]:= initfusion[i][1];
      elif Length( initfusion[i] ) = 0 then
        AddSet( errors, i );
      fi;
    od;
    if errors <> [] then
      InfoCharTable2( "#E InitFusion: no images for classes in ",
                      errors, "\n" );
      return false;
    fi;
    return initfusion;
    end;


#############################################################################
##
#F  CheckPermChar( <subtbl>, <tbl>, <fusionmap>, <permchar> )
##
##  tries to improve the parametrized fusion <fusionmap> from the character
##  table <subtbl> into the character table <tbl> using the permutation
##  character <permchar> that belongs to the required fusion\:
##
##  An upper bound for the number of elements fusing into each class is
##  $'upper[i]'=
##           '<subtbl>.order' \* '<permchar>[i]' / '<tbl>.centralizers[i]'$.
##
##  We first subtract from that the number of all elements which {\em must}
##  fuse into that class:
##  $'upper[i]':= 'upper[i]' -
##                      \sum_{'fusionmap[i]'='i'} '<subtbl>.classes[i]'$.
##
##  After that, we delete all those possible images 'j' in 'initfusion[i]'
##  which do not satisfy $'<subtbl>.classes[i]' \leq 'upper[j]'$
##  (local function 'deletetoolarge').
##
##  At last, if there is a class 'j' with
##  $'upper[j]' = \sum_{'j' \in 'initfusion[i]'}' <subtbl>.classes[i]'$,
##  then 'j' must be the image for all 'i' with 'j' in 'initfusion[i]'
##  (local function 'takealliffits').
##
##  'CheckPermChar' returns 'true' if no inconsistency occured, and 'false'
##  otherwise.
##
##  ('CheckPermChar' is used as subroutine of 'SubgroupFusions'.)
##
CheckPermChar := function( subtbl, tbl, fusionmap, permchar )
    local i, upper, deletetoolarge, takealliffits, totest, improved;

    upper:= [];
    if permchar = [] then

      # just check upper bounds
      for i in [ 1 .. Length( tbl.centralizers ) ] do
        upper[i]:= Minimum( subtbl.order, tbl.classes[i] );
      od;
    else

      # number of elements that fuse in each class
      for i in [ 1 .. Length( tbl.centralizers ) ] do
        upper[i]:= permchar[i] * subtbl.order / tbl.centralizers[i];
      od;
    fi;

    # subtract elements where the image is unique
    for i in [ 1 .. Length( fusionmap ) ] do
      if IsInt( fusionmap[i] ) then
        upper[ fusionmap[i] ]:= upper[ fusionmap[i] ] - subtbl.classes[i];
      fi;
    od;
    if Minimum( upper ) < 0 then
      InfoCharTable2( "#E CheckPermChar: too many preimages for classes in ",
                      Filtered( [ 1 .. Length( upper ) ],
                                x-> upper[x] < 0 ), "\n" );
      return false;
    fi;

    # Only those classes are allowed images which are not too big
    # also after diminishing upper:
    # 'deletetoolarge( <totest> )' excludes all those possible images 'x' in
    # sets 'fusionmap[i]' which are contained in the list <totest> and
    # which are larger than 'upper[x]'.
    # (returns 'i' in case of an inconsistency at class 'i', otherwise the
    # list of classes 'x' where 'upper[x]' was diminished)
    #
    deletetoolarge:= function( totest )
      local i, improved, delete;

      if totest = [] then return []; fi; 
      improved:= [];
      for i in [ 1 .. Length( fusionmap ) ] do
        if IsSet( fusionmap[i] )
           and Intersection( fusionmap[i], totest ) <> [] then
          fusionmap[i]:= Filtered( fusionmap[i],
                                    x -> ( subtbl.classes[i] <= upper[x] ) );
          if fusionmap[i] = [] then
            return i;
          elif Length( fusionmap[i] ) = 1 then
            fusionmap[i]:= fusionmap[i][1];
            AddSet( improved, fusionmap[i] );
            upper[ fusionmap[i] ]:= upper[fusionmap[i]] - subtbl.classes[i];
          fi;
        fi;
      od;
      delete:= deletetoolarge( improved );
      if IsInt( delete ) then
        return delete;
      else
        return Union( improved, delete );
      fi;
    end;

    # Check if there are classes into which more elements must fuse
    # than known up to now; if all possible preimages are
    # necessary to satisfy the permutation character, improve 'fusionmap'.
    # 'takealliffits( <totest> )' sets 'fusionmap[i]' to 'x' if 'x' is in
    # the list 'totest' and if all possible preimages of 'x' are necessary
    # to give 'upper[x]'.
    # (returns 'i' in case of an inconsistency at class 'i', otherwise the
    # list of classes 'x' where 'upper[x]' was diminished)
    #
    takealliffits:= function( totest )
      local i, j, preimages, sum, improved, take;
      if totest = [] then return []; fi;
      improved:= [];
      for i in Filtered( totest, x -> upper[x] > 0 ) do
        preimages:= [];
        for j in [ 1 .. Length( fusionmap ) ] do
          if IsSet( fusionmap[j] ) and i in fusionmap[j] then
            Add( preimages, j );
          fi;
        od;
        sum:= Sum( List( preimages, x -> subtbl.classes[x] ) );
        if sum = upper[i] then

          # take them all
          for j in preimages do fusionmap[j]:= i; od;
          upper[i]:= 0;
          Add( improved, i );
        elif sum < upper[i] then
          return i;
        fi;
      od;
      take:= takealliffits( improved );
      if IsInt( take ) then
        return take;
      else
        return Union( improved, take );
      fi;
    end;

    # Improve until no new improvement can be found!
    totest:= [ 1 .. Length( permchar ) ];
    while totest <> [] do
      improved:= deletetoolarge( totest );
      if IsInt( improved ) then
        InfoCharTable2( "#E CheckPermChar: no image possible for class ",
                        improved, "\n" );
        return false;
      fi;
      totest:= takealliffits( Union( improved, totest ) );
      if IsInt( totest ) then
        InfoCharTable2( "#E CheckPermChar: not enough preimages for class ",
                        totest, "\n" );
        return false;
      fi;
    od;
    return true;
    end;


#############################################################################
##
#F  ImproveMaps( <map2>, <map1>, <composition>, <class> )
##
##  utility for 'CommutativeDiagram' and 'TestConsistencyMaps';
##  <composition> must be a set that is known to be an upper bound for the
##  composition $( <map2> \circ <map1> )[ <class> ]$;
##  if $'<map1>[ <class> ]' = x$ is unique then $<map2>[ x ]$ must be a set,
##  it will be replaced by its intersection with <composition>;
##  if <map1>[ <class> ] is a set then all elements 'x' with
##  'Intersection( <map2>[ x ], <composition> ) = []' are excluded.
##
##  'ImproveMaps' returns     0 if no improvement was found
##                           -1 if <map1>[ <class> ] was improved
##                          <x> if <map2>[ <x> ] was improved
##
ImproveMaps := function( map2, map1, composition, class )
    local j, map1_i, newvalue;

    map1_i:= map1[ class ];
    if IsInt( map1_i ) then

      # case 1: map2[ map1_i ] must be a set,
      #         try to improve map2 at that position
      if composition <> map2[ map1_i ] then
        if Length( composition ) = 1 then
          map2[ map1_i ]:= composition[1];
        else
          map2[ map1_i ]:= composition;
        fi;

        # map2[ map1_i ] was improved
        return map1_i;
      fi;
    else

      # case 2: try to improve map1[ class ]
      newvalue:= [];
      for j in map1_i do
        if ( IsInt(map2[j]) and map2[j] in composition ) or
           ( IsSet(map2[j]) and Intersection(map2[j],composition)<>[] ) then
          AddSet( newvalue, j );
        fi;
      od;
      if newvalue <> map1_i then
        if Length( newvalue ) = 1 then
          map1[ class ]:= newvalue[1];
        else
          map1[ class ]:= newvalue;
        fi;
        return -1;                  # map1 was improved
      fi;
    fi;
    return 0;                       # no improvement
    end;


#############################################################################
##
#F  CommutativeDiagram( <paramap1>, <paramap2>, <paramap3>, <paramap4> )
#F  CommutativeDiagram( <paramap1>, <paramap2>, <paramap3>, <paramap4>,
#F                      <improvements> )
##
##  If 'CompositionMaps( <paramap2>, <paramap1> ) =
##      CompositionMaps( <paramap4>, <paramap3> )'
##  shall hold, the consistency is checked and the four maps
##  will be improved according to this condition.
##
##  If a record <improvements> with fields 'imp1', 'imp2', 'imp3', 'imp4' is
##  specified, only diagrams containing elements of 'imp<i>' as preimages of
##  <paramapi> are considered.
##
##  'CommutativeDiagram' returns 'false' if an inconsistency was found,
##  otherwise a record is returned that contains four lists 'imp1', \ldots,
##  'imp4':
##  'imp<i>' is the list of classes where <paramap_i> was improved.
##
##    i ---------> map1[i]
##    |              |
##    |              v
##    |          map2[ map1[i] ]
##    v
##  map3[i] ---> map4[ map3[i] ]
##
CommutativeDiagram := function( arg )
    local i, paramap1, paramap2, paramap3, paramap4, imp1, imp2, imp4,
          globalimp1, globalimp2, globalimp3, globalimp4, newimp1, newimp2,
          newimp4, map2_map1, map4_map3, composition, imp;

    if not ( Length(arg) in [ 4, 5 ] and IsList(arg[1]) and IsList(arg[2])
             and IsList( arg[3] ) and IsList( arg[4] ) )
       or ( Length( arg ) = 5 and not IsRec( arg[5] ) ) then
      Error("usage: CommutativeDiagram(<pmap1>,<pmap2>,<pmap3>,<pmap4>)\n",
          "resp. CommutativeDiagram(<pmap1>,<pmap2>,<pmap3>,<pmap4>,<imp>)");
    fi;
    paramap1:= arg[1];
    paramap2:= arg[2];
    paramap3:= arg[3];
    paramap4:= arg[4];
    if Length( arg ) = 5 then
      imp1:= Union( arg[5].imp1, arg[5].imp3 );
      imp2:= arg[5].imp2;
      imp4:= arg[5].imp4;
    else
      imp1:= List( [ 1 .. Length( paramap1 ) ] );
      imp2:= [];
      imp4:= [];
    fi;
    globalimp1:= [];
    globalimp2:= [];
    globalimp3:= [];
    globalimp4:= [];
    while imp1 <> [] or imp2 <> [] or imp4 <> [] do
      newimp1:= [];
      newimp2:= [];
      newimp4:= [];
      for i in [ 1 .. Length( paramap1 ) ] do
        if i in imp1
           or ( IsSet(paramap1[i]) and Intersection(paramap1[i],imp2)<>[] )
           or ( IsSet(paramap3[i]) and Intersection(paramap3[i],imp4)<>[] )
           or ( IsInt( paramap1[i] ) and paramap1[i] in imp2 )
           or ( IsInt( paramap3[i] ) and paramap3[i] in imp4 ) then
          map2_map1:= CompositionMaps( paramap2, paramap1, i );
          map4_map3:= CompositionMaps( paramap4, paramap3, i );
          if IsInt( map2_map1 ) then map2_map1:= [ map2_map1 ]; fi;
          if IsInt( map4_map3 ) then map4_map3:= [ map4_map3 ]; fi;
          composition:= Intersection( map2_map1, map4_map3 );
          if composition = [] then
            InfoCharTable2( "#E CommutativeDiagram: inconsistency at class",
                            i, "\n" );
            return false;
          fi;
          if composition <> map2_map1 then
            imp:= ImproveMaps( paramap2, paramap1, composition, i );
            if imp = -1 then
              AddSet( newimp1, i );
              AddSet( globalimp1, i );
            elif imp <> 0 then
              AddSet( newimp2, imp );
              AddSet( globalimp2, imp );
            fi;
          fi;
          if composition <> map4_map3 then
            imp:= ImproveMaps( paramap4, paramap3, composition, i );
            if imp = -1 then
              AddSet( newimp1, i );
              AddSet( globalimp3, i );
            elif imp <> 0 then
              AddSet( newimp4, imp );
              AddSet( globalimp4, imp );
            fi;
          fi;
        fi;
      od;
      imp1:= newimp1;
      imp2:= newimp2;
      imp4:= newimp4;
    od;
    return rec( imp1:= globalimp1, imp2:= globalimp2,
                imp3:= globalimp3, imp4:= globalimp4 );
    end;


#############################################################################
##
#F  CheckFixedPoints( <inside1>, <between>, <inside2> )
##
##  try to improve <between> using that <between> must map fixed points under
##  <inside1> to fixed points under <inside2> 
##
##  If an inconsistency occurs, return the list of classes where improvements
##  were found; otherwise return 'false'.
##
CheckFixedPoints := function( inside1, between, inside2 )
    local i, j, improvements, errors, image;

    improvements:= [];
    errors:= [];
    for i in [ 1 .. Length( inside1 ) ] do
      if inside1[i] = i then             # for all fixed points of 'inside1'
        if IsInt( between[i] ) then
          if inside2[ between[i] ] <> between[i] then
            if IsInt( inside2[ between[i] ] )
               or not between[i] in inside2[ between[i] ] then
              Add( errors, i );
            else
              inside2[ between[i] ]:= between[i];
              Add( improvements, i );
            fi;
          fi;
        else
          image:= [];
          for j in between[i] do
            if inside2[j] = j
               or ( IsSet( inside2[j] ) and j in inside2[j] ) then
              Add( image, j );
            fi;
          od;
          if image = [] then
            AddSet( errors, i );
          elif image <> between[i] then
            between[i]:= image;
            AddSet( improvements, i );
          fi;
        fi;
      fi;
    od;
    if errors = [] then
      if improvements <> [] then
        InfoCharTable2( "#I CheckFixedPoints: improvements at classes ",
                        improvements, "\n" );
      fi;
      return improvements;
    else
      InfoCharTable2( "#E CheckFixedPoints: no image possible for classes ",
                      errors, "\n" );
      return false;
    fi;
    end;
   

#############################################################################
##
#F  TransferDiagram( <inside1>, <between>, <inside2> )
#F  TransferDiagram( <inside1>, <between>, <inside2>, <improvements> )
##
##  Like in 'CommutativeDiagram', it is checked that
##  'CompositionMaps( <between>, <inside1> ) =
##  CompositionMaps( <inside2>, <between> )', that means
##  <between> occurs twice in each commutative diagram
##
##     i   -----> between[i]
##     |            |
##     |            v
##     |         inside2[ between[i] ]
##     v
##  inside1[i] ----> between[ inside1[i] ]
##
##  If a record <improvements> with fields 'impinside1', 'impbetween' and
##  'impinside2' is specified, only those diagrams with elements of
##  'impinside1' as preimages of <inside1>, elements of 'impbetween' as
##  preimages of <between> or elements of 'impinside2' as preimages of
##  <inside2> are considered.
##
##  When an inconsistency occurs, the program immediately returns 'false';
##  else it returns a record with lists 'impinside1', 'impbetween' and
##  'impinside2' of found improvements.
##
##  (calls 'CheckFixedPoints')
##
TransferDiagram := function( arg )
    local i, inside1, between, inside2, imp1, impb, imp2, globalimp1,
          globalimpb, globalimp2, newimp1, newimpb, newimp2, bet_ins1,
          ins2_bet, composition, imp, check;

    if not ( Length(arg) in [ 3, 4 ] and IsList(arg[1]) and IsList(arg[2])
             and IsList( arg[3] ) )
       or ( Length( arg ) = 4 and not IsRec( arg[4] ) ) then
      Error("usage: TransferDiagram(<inside1>,<between>,<inside2>) resp.\n",
            "       TransferDiagram(<inside1>,<between>,<inside2>,<imp> )" );
    fi;
    inside1:= arg[1];
    between:= arg[2];
    inside2:= arg[3];
    if Length( arg ) = 4 then
      imp1:= arg[4].impinside1;
      impb:= arg[4].impbetween;
      imp2:= arg[4].impinside2;
    else
      imp1:= List( [ 1 .. Length( inside1 ) ] );
      impb:= [];
      imp2:= [];
    fi;
    globalimp1:= [];
    globalimpb:= [];
    globalimp2:= [];
    while imp1 <> [] or impb <> [] or imp2 <> [] do
      newimp1:= [];
      newimpb:= [];
      newimp2:= [];
      for i in [ 1 .. Length( inside1 ) ] do
        if i in imp1 or i in impb
           or ( IsSet( inside1[i] ) and Intersection(inside1[i],impb)<>[] )
           or ( IsSet( between[i] ) and Intersection(between[i],imp2)<>[] )
           or ( IsInt( inside1[i] ) and inside1[i] in impb )
           or ( IsInt( between[i] ) and between[i] in imp2 ) then
          bet_ins1:= CompositionMaps( between, inside1, i );
          ins2_bet:= CompositionMaps( inside2, between, i );
          if IsInt( bet_ins1 ) then bet_ins1:= [ bet_ins1 ]; fi;
          if IsInt( ins2_bet ) then ins2_bet:= [ ins2_bet ]; fi;
          composition:= Intersection( bet_ins1, ins2_bet );
          if composition = [] then
            InfoCharTable2( "#I TransferDiagram: inconsistency at class ",
                            i, "\n" );
            return false;
          fi;
          if composition <> bet_ins1 then
            imp:= ImproveMaps( between, inside1, composition, i );
            if imp = -1 then
              AddSet( newimp1, i );
              AddSet( globalimp1, i );
            elif imp <> 0 then
              AddSet( newimpb, imp );
              AddSet( globalimpb, imp );
            fi;
          fi;
          if composition <> ins2_bet then
            imp:= ImproveMaps( inside2, between, composition, i );
            if imp = -1 then
              AddSet( newimpb, i );
              AddSet( globalimpb, i );
            elif imp <> 0 then
              AddSet( newimp2, imp );
              AddSet( globalimp2, imp );
            fi;
          fi;
        fi;
      od;
      imp1:= newimp1;
      impb:= newimpb;
      imp2:= newimp2;
    od;
    check:= CheckFixedPoints( inside1, between, inside2 );
    if check = false then
      return false;
    elif check <> [] then
      check:= TransferDiagram( inside1, between, inside2,
                               rec( impinside1:= [], impbetween:= check,
                                    impinside2:= [] ) );
      return rec( impinside1:= Union( check.impinside1, globalimp1 ),
                  impbetween:= Union( check.impbetween, globalimpb ),
                  impinside2:= Union( check.impinside2, globalimp2 ) );
    else
      return rec( impinside1:= globalimp1, impbetween:= globalimpb,
                  impinside2:= globalimp2 );
    fi;
    end;


#############################################################################
##
#F  TestConsistencyMaps( <powermap1>, <fusionmap>, <powermap2> )
#F  TestConsistencyMaps( <powermap1>, <fusionmap>, <powermap2>, <fus_imp> )
##
##  Like in 'TransferDiagram', it is checked that maps are commutative:
##  For all positions 'i' where both '<powermap1>[i]' and '<powermap2>[i]'
##  are bound, it must hold 'CompositionMaps( <fusionmap>, <powermap1>[i] ) =
##  CompositionMaps( <powermap2>[i], <fusionmap> )', that means
##  1. <fusionmap> occurs twice in each commutative diagram and
##  2. <fusionmap> is common for all considered elements of <powermap1> resp.
##     <powermap2>.
##
##  If a list <fus_imp> is specified, only those diagrams with
##  elements of <fus_imp> as preimaes of <fusionmap> are considered.
##
##  When an inconsistency occurs, the program immediately returns 'false';
##  otherwise 'true' is returned.
##
TestConsistencyMaps := function( arg )
    local i, j, x, powermap1, powermap2, pos, fusionmap, imp,
          fus_improvements, tr;

    if not ( Length(arg) in [ 3, 4 ] and IsList(arg[1]) and IsList(arg[2])
             and IsList( arg[3] ) )
       or ( Length( arg ) = 4 and not IsList( arg[4] ) ) then
      Error("usage: TestConsistencyMaps(<powmap1>,<fusmap>,<powmap2>)",
            " resp.\n    ",
            "TestConsistencyMaps(<powmap1>,<fusmap>,<powmap2>,<fus_imp>)");
    fi;
    powermap1:= [];
    powermap2:= [];
    pos:= [];
    for i in [ 1 .. Length( arg[1] ) ] do
      if IsBound( arg[1][i] ) and IsBound( arg[3][i] ) then
        Add( powermap1, arg[1][i] );
        Add( powermap2, arg[3][i] );
        Add( pos, i );
      fi;
    od;
    fusionmap:= arg[2];
    if Length( arg ) = 4 then
      imp:= arg[4];
    else
      imp:= [ 1 .. Length( fusionmap ) ];
    fi;
    fus_improvements:= List( [ 1 .. Length( powermap1 ) ], x -> imp );
    if fus_improvements = [] then return true; fi;     # no common powermaps
    i:= 1;
    while fus_improvements[i] <> [] do
      tr:= TransferDiagram( powermap1[i], fusionmap, powermap2[i],
                     rec( impinside1:= [],
                          impbetween:= fus_improvements[i],
                          impinside2:= [] ) );
      # (We are only interested in improvements of the fusionmap which may
      #  have occurred.)

      if tr = false then
        InfoCharTable2( "#I TestConsistencyMaps: inconsistency in powermap ",
                        pos[i], "\n" );
        return false;
      fi;
      for j in [ 1 .. Length( fus_improvements ) ] do
        fus_improvements[j]:= Union( fus_improvements[j], tr.impbetween );
      od;
      fus_improvements[i]:= [];
      i:= ( i mod Length( fus_improvements ) ) + 1;
    od;
    return true;
    end;


#############################################################################
##
#F  InitPowermap( <tbl>, <prime> )
##
##  returns a (parametrized) map that is a first approximation of the <prime>-th
##  powermap of <tbl>. The following properties are used:
##
##  1. For each class 'i', the centralizer order of the <prime>-th power must
##     be a multiple of the centralizer order of 'i'; if the representative
##     order of 'i' is relative prime to <prime>, the centralizer orders of
##     i and its image must be equal.
##
##  2. If <prime> divides the representative order <x> of the class 'i', the
##     representative order of its image must be $<x> / <prime>$; otherwise
##     the representative orders of 'i' and its image must be equal.
##
##  If there are classes for which no images are possible, 'false' is returned.
##
InitPowermap := function( tbl, prime )

    local i, j, k,        # loop variables
          powermap,       # power map for prime 'prime', result
          centralizers,   # centralizer orders of 'tbl'
          nccl,           # number of conjugacy classes of 'tbl'
          orders,         # representative orders of 'tbl' (if bound)
          sameord;        # contains at position <i> the list of those
                          # classes that (may) have representative order <i>

    powermap:= [];
    centralizers:= tbl.centralizers;
    nccl:= Length( centralizers );

    if IsBound( tbl.orders ) and IsList( tbl.orders ) then
    
      # Both orders and centralizers are known,
      # construct the list 'sameord'.

      orders:= tbl.orders;
      sameord:= [];

      for i in [ 1 .. Length( orders ) ] do

        if IsInt( orders[i] ) then

          if IsBound( sameord[ orders[i] ] ) then
            AddSet( sameord[ orders[i] ], i );
          else
            sameord[ orders[i] ]:= [ i ];
          fi;

        else

          # parametrized orders

          for j in orders[i] do
            if IsBound( sameord[j] ) then
              AddSet( sameord[j], i );
            else
              sameord[j]:= [ i ];
            fi;
          od;

        fi;

      od;

      for i in [ 1 .. nccl ] do

        powermap[i]:= [];

        if IsInt( orders[i] ) then

          if orders[i] mod prime = 0 then

            # maps to a class with representative order that is smaller
            # by a factor 'prime'

            for j in sameord[ orders[i] / prime ] do
              if centralizers[j] mod centralizers[i] = 0 then
                AddSet( powermap[i], j );
              fi;
            od;

          elif prime mod orders[i] = 1 then

            # necessarily fixed class
            powermap[i][1]:= i;

          else

            # maps to a class of same order

            for j in sameord[ orders[i] ] do
              if centralizers[j] = centralizers[i] then
                AddSet( powermap[i], j );
              fi;
            od;

          fi;  

        else

          # representative order is not uniquely determined

          for j in orders[i] do

            if j mod prime = 0 then

              # maps to a class with representative order that is smaller
              # by a factor 'prime'

              if IsBound( sameord[ j / prime ] ) then
                for k in sameord[ j / prime ] do
                  if centralizers[k] mod centralizers[i] = 0 then
                    AddSet( powermap[i], k );
                  fi;
                od;
              fi;

            elif prime mod j = 1 then

              # necessarily fixed class
              AddSet( powermap[i], i );

            else

              # maps to a class of same order
              for k in sameord[j] do
                if centralizers[k] = centralizers[i] then
                  AddSet( powermap[i], k );
                fi;
              od;

            fi;  
          od;

          if Gcd( orders[i] ) mod prime = 0 then

            # necessarily the representative order of the image is smaller
            RemoveSet( powermap[i], i );

          fi;
        fi;
      od;

    else

      # just centralizer orders are known

      for i in [ 1 .. nccl ] do
        powermap[i]:= [];
        for j in [ 1 .. nccl ] do
          if centralizers[j] mod centralizers[i] = 0 then
            AddSet( powermap[i], j );
          fi;
        od;
      od;

    fi;

    # Check whether a map is possible, and replace image lists of length 1
    # by their entry.

    for i in [ 1 .. nccl ] do
      if   Length( powermap[i] ) = 0 then
        InfoCharTable2( "#E InitPowermap: no image possible for classes\n",
                        "#E ", Filtered( [ 1..nccl ], x -> powermap[x]=[] ),
                        "\n" );
        return false;
      elif Length( powermap[i] ) = 1 then
        powermap[i]:= powermap[i][1];
      fi;
    od;

    # If the representative orders are not uniquely determined,
    # and the centre is not trivial, the image of class 1 is not uniquely
    # determined by the check of centralizer orders.

    if ( IsInt( powermap[1] ) and powermap[1] <> 1 ) or
       ( IsList( powermap[1] ) and not 1 in powermap[1] ) then
      Print( "#E InitPowermap: class 1 cannot contain the identity\n" );
      return false;
    fi;
    powermap[1]:= 1;

    return powermap;
    end;

#############################################################################
##
#F  Congruences( <tbl>, <chars>, <prime_powermap>, <prime> )
#F  Congruences( <tbl>, <chars>, <prime_powermap>, <prime>, \"quick\" )
##
##  improves <prime_powermap> which is an approximation for the <prime>-th
##  powermap of <tbl> using the property that for each element <chi> of
##  <chars> the congruence
##  $'Gal'( <chi>(g), <prime> ) \equiv <chi>(g^{<prime>}) \pmod{<prime>}$ holds;
##  if the representative order of $g$ is relative prime to <prime> we have
##  $'GaloisCyc( <chi>(g), <prime> ) = <chi>(g^{<prime>})$.
##  
##  If \"quick\" is specified, only those classes with ambiguous images are
##  considered.
##
##  If there are classes for which no images are possible, the value is the
##  empty list (not undefined!)
##
Congruences := function( arg )

    local i, j,
          tbl,       # character table, first argument
          chars,     # list of characters, second argument
          powermap,  # 
          prime,     #
          nccl,
          omega,
          images, newimage, cand_image, ok, char,
          errors;    # list of classes for that no images are possible

    # Check the arguments.
    if not ( Length( arg ) in [ 4, 5 ] and IsCharTable( arg[1] )
             and IsList(arg[2]) and IsList(arg[3]) and IsPrimeInt(arg[4]) )
       or ( Length( arg ) = 5 and arg[5] <> "quick" ) then
      Error("usage: Congruences(tbl,chars,powermap,prime,\"quick\")\n",
            " resp. Congruences(tbl,chars,powermap,prime)" );
    fi;

    # Get the arguments.
    tbl:= arg[1];
    chars:= arg[2];
    powermap:= arg[3];
    prime:= arg[4];

    nccl:= Length( powermap );
    omega:= [ 1 .. nccl ];
    if Length( arg ) = 5 then     # "quick": only consider ambiguous classes
      for i in [ 1 .. nccl ] do
        if IsInt( powermap[i] ) or Length( powermap[i] ) <= 1 then
          RemoveSet( omega, i );
        fi;
      od;
    fi;
    for i in omega do
      if IsInt( powermap[i] ) then
        images:= [ powermap[i] ];
      else
        images:= powermap[i];
      fi;
      newimage:= [];
      for cand_image in images do
        j:= 1;
        ok:= true;
        while j <= Length( chars ) and ok do   # loop over characters
          char:= chars[j];
          if not IsUnknown( char[ cand_image ] ) then
            if IsInt( char[i] ) then
              if not IsCycInt( ( char[ cand_image ] - char[i] ) / prime ) then
                ok:= false;
              fi;
            elif IsCyc( char[i] ) then
              if IsBound( tbl.orders ) and IsList( tbl.orders ) and
                 ( ( IsInt( tbl.orders[i] ) and tbl.orders[i] mod prime <> 0 ) 
                   or ( IsList( tbl.orders[i] )
                           and ForAll( tbl.orders[i],
                                       x -> x mod prime <> 0 ) ) ) then
                if char[ cand_image ] <> GaloisCyc( char[i], prime ) then
                  ok:= false;
                fi;
              elif not IsCycInt( ( char[ cand_image ]
                                 - GaloisCyc(char[i],prime) ) / prime ) then
                ok:= false;
              fi;
            fi;
          fi;
          j:= j+1;
        od;
        if ok then
          AddSet( newimage, cand_image );
        fi;
      od;
      powermap[i]:= newimage;
    od;

    # Replace lists of length 1 by their entries,
    # look for empty lists.
    errors:= [];    # list of classes for which no image is left
    for i in omega do
      if   Length( powermap[i] ) = 0 then
        Add( errors, i );
      elif Length( powermap[i] ) = 1 then
        powermap[i]:= powermap[i][1];
      fi;
    od;
    if Length( errors ) > 0 then
      Print( "#E Congruences(.,.,.,", prime,
             "): no image possible for classes ", errors, "\n" );
      return false;
    fi;
    return true;
    end;

#############################################################################
##
#F  ConsiderKernels( <tbl>, <chars>, <prime_powermap>, <prime> )
#F  ConsiderKernels( <tbl>, <chars>, <prime_powermap>, <prime>, \"quick\" )
##
##  improves <prime_powermap> which is an approximation of the <prime>-th
##  powermap of <tbl> using the property that for each element <chi> of
##  <chars> the kernel of <chi> is a normal subgroup of <tbl>.
##  So for every $g \in 'KernelChar( <chi> )'$ we have
##  $g^{<prime>} \in 'KernelChar( <chi> )'$;
##
##  Depending on the order of the factor group modulo 'KernelChar( <chi> )',
##  there are two further properties:
##  If the order is relative prime to <prime>, for each
##  $g \notin 'KernelChar( <chi> )'$ the <prime>-th power is not contained in
##  'KernelChar( <chi> )'.
##  If the order is equal to <prime>, the <prime>-th powers of all elements
##  lie in 'KernelChar( <chi> )'.
##
##  If 'KernelChar( <chi> )' has an order not dividing the order of <tbl>,
##  'false' is returned.
##
##  Also if no image is left for any class, 'false' is returned.
##
##  If '\"quick\"' is specified, only those classes are considered where
##  <prime_powermap> is ambiguous.
##
ConsiderKernels := function( arg )
    local i, tbl, chars, prime_powermap, prime, nccl, omega, kernels,
          chi, kernel, suborder;

    if not ( Length( arg ) in [ 4, 5 ] and IsCharTable( arg[1] ) and
             IsList( arg[2] ) and IsList( arg[3] ) and IsPrimeInt( arg[4] ) )
       or ( Length( arg ) = 5 and arg[5] <> "quick" ) then
      Error("usage: ConsiderKernels( tbl, chars, prime_powermap, prime )\n",
           "resp. ConsiderKernels(tbl,chars,prime_powermap,prime,\"quick\")");
    fi;

    tbl:= arg[1];
    chars:= arg[2];
    prime_powermap:= arg[3];
    prime:= arg[4];
    nccl:= Length( prime_powermap );
    omega:= Set( [ 1 .. nccl ] );
    kernels:= [];
    for chi in chars do AddSet( kernels, KernelChar( chi ) ); od;
    kernels:= Difference( kernels, Set( [ omega, [ 1 ] ] ) );
    if Length( arg ) = 5  then     # "quick": only consider ambiguous classes
      omega:= [];
      for i in [ 1 .. nccl ] do
        if IsSet(prime_powermap[i]) and Length( prime_powermap[i] ) > 1 then
          AddSet( omega, i );
        fi;
      od;
    fi;
    for kernel in kernels do
      suborder:= 0;
      for i in kernel do suborder:= suborder + tbl.classes[i]; od;
      if tbl.order mod suborder <> 0 then
        InfoCharTable2( "#E ConsiderKernels: kernel of character is not a",
                        " subgroup\n" );
        return false;
      fi;
      for i in Intersection( omega, kernel ) do
        if IsList( prime_powermap[i] ) then
          prime_powermap[i]:= Intersection( prime_powermap[i], kernel );
        else
          prime_powermap[i]:= Intersection( [ prime_powermap[i] ], kernel );
        fi;
        if Length( prime_powermap[i] ) = 1 then
          prime_powermap[i]:= prime_powermap[i][1];
        fi;
      od;
      if ( tbl.order / suborder ) mod prime <> 0 then
        for i in Difference( omega, kernel ) do
          if IsList( prime_powermap[i] ) then
            prime_powermap[i]:= Difference( prime_powermap[i], kernel );
          else
            prime_powermap[i]:= Difference( [ prime_powermap[i] ], kernel );
          fi;
          if Length( prime_powermap[i] ) = 1 then
            prime_powermap[i]:= prime_powermap[i][1];
          fi;
        od;
      elif ( tbl.order / suborder ) = prime then
        for i in Difference( omega, kernel ) do
          if IsList( prime_powermap[i] ) then
            prime_powermap[i]:= Intersection( prime_powermap[i], kernel );
          else
            prime_powermap[i]:= Intersection( [ prime_powermap[i] ], kernel );
          fi;
          if Length( prime_powermap[i] ) = 1 then
            prime_powermap[i]:= prime_powermap[i][1];
          fi;
        od;
      fi;
    od;
    if ForAny( prime_powermap, x -> x = [] ) then
      InfoCharTable2( "#I ConsiderKernels: no images left for classes ", 
                      Filtered( [ 1 .. Length( prime_powermap ) ],
                                x -> prime_powermap[x] = [] ), "\n" );
      return false;
    fi;
    return true;
    end;

#############################################################################
##
#F  ConsiderSmallerPowermaps( <tbl>, <prime_powermap>, <prime> )
#F  ConsiderSmallerPowermaps( <tbl>, <prime_powermap>, <prime>, \"quick\" )
##
##  If $<prime> > 'orders[i]'$, try to improve the <prime>-th powermap at
##  class 'i' using that $g_i^{'prime'} = g_i^{'prime mod orders[i]'}$;
##  so try to calculate the '( prime mod orders[i] )'-th powermap at class
##  'i'.
##
##  If '<tbl>.orders' is not bound, 'true' is returned without any tests.
##
##  If \"quick\" is specified only check those classes where <prime_powermap>
##  is not unique.
##
##  returns 'false' if there are classes for which no image is possible,
##  otherwise 'true'.
##
ConsiderSmallerPowermaps := function( arg )

    local i, j,            # loop variables
          tbl,             # character table
          prime_powermap,  # 2nd argument
          prime,           # 3rd argument
          omega,           # list of classes to be tested
          factors,         # factors modulo representative order
          image,           # possible images after testing
          old,             # possible images before testing
          errors;          # list of classes where no image is possible

    # check the arguments
    if not ( Length( arg ) in [ 3, 4 ] and IsCharTable( arg[1] )
             and IsList( arg[2] ) and IsPrimeInt( arg[3] ) )
       or ( Length( arg ) = 4 and arg[4] <> "quick" ) then
      Error( "usage: ",
        "ConsiderSmallerPowermaps(<tbl>,<prime_powermap>,<prime>) resp.\n",
        "ConsiderSmallerPowermaps(<tbl>,<prime_powermap>,<prime>,\"quick\")");
    fi;

    tbl:= arg[1];
    if not IsBound( tbl.orders ) then
      InfoCharTable2( "#I ConsiderSmallerPowermaps: no orders bound,",
                      " no test\n" );
      return true;
    fi;
    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;
    prime_powermap:= arg[2];
    prime:= arg[3];

    # 'omega' will be a list of classes to be tested
    omega:= [];

    if Length( arg ) = 4 then

      # 'quick' option: only test classes with ambiguities
      for i in [ 1 .. Length( prime_powermap ) ] do
        if IsSet( prime_powermap[i] ) and prime > tbl.orders[i] then
          Add( omega, i );
        fi;
      od;

    else

      # test all classes where reduction modulo representative orders
      # can yield conditions
      for i in [ 1 .. Length( prime_powermap ) ] do
        if prime > tbl.orders[i] then Add( omega, i ); fi;
      od;

    fi;

    # list of classes where no image is possible
    errors:= [];

    for i in omega do

      factors:= FactorsInt( prime mod tbl.orders[i] );
      if factors = [ 1 ] or factors = [ 0 ] then factors:= []; fi;

      if ForAll( Set( factors ), x -> IsBound( tbl.powermap[x] ) ) then

        # compute image under composition of power maps for smaller primes
        image:= [ i ];
        for j in factors do
          image:= [ CompositionMaps( tbl.powermap[j], image, 1 ) ];
        od;
        image:= image[1];

        # 'old': possible images before testing
        if IsInt( prime_powermap[i] ) then
          old:= [ prime_powermap[i] ];
        else
          old:= prime_powermap[i];
        fi;

        # compare old and new possibilities of images
        if IsInt( image ) then
          if image in old then 
            prime_powermap[i]:= image;
          else
            Add( errors, i );
            prime_powermap[i]:= [];
          fi;
        else
          image:= Intersection( image, old );
          if image = [] then
            Add( errors, i );
            prime_powermap[i]:= [];
          elif old <> image then
            if Length( image ) = 1 then image:= image[1]; fi;
            prime_powermap[i]:= image;
          fi;
        fi;

      fi;

    od;

    if Length( errors ) <> 0 then
      InfoCharTable2( "#E ConsiderSmallerPowermaps: no image possible",
                      " for classes ", errors, "\n" );
      return false;
    fi;

    return true;
    end;


#############################################################################
##
#F  PowermapsAllowedBySymmetrisations( <tbl>, <subchars>, <chars>, <pow>,
#F                                     <prime>, <parameters> )
##
##  <parameters> must be a record with fields <maxlen> (int), <contained>,
##  <minamb>, <maxamb> and <quick> (boolean).
##
##  First, for all $\chi \in <chars>$ let
##  'minus:= MinusCharacter( $\chi$, <pow>, <prime> )'. If
##  '<minamb> \< Indeterminateness( minus ) \< <maxamb>', construct
##  'poss:= contained( <tbl>, <subchars>, minus )'.
##  (<contained> is a function that will be 'ContainedCharacters' or
##  'ContainedPossibleCharacters'.)
##  If 'Indeterminateness( minus ) \< <minamb>', delete this character;
##  for unique minus-characters, if '<parameters>.quick = false', the
##  scalar products with <subchars> are checked.
##  (especially if the minus-character is unique, i.e.\ it is not quecked if
##  the symmetrizations of such a character decompose correctly).
##  Improve <pow> if possible.
##
##  If the minus character af a character *becomes* unique during the
##  processing, its scalar products with <subchars> are checked.
##
##  If no further improvement is possible, delete all characters with unique
##  minus-character, and branch:
##  If there is a character left with less or equal <maxlen> possible minus-
##  characters, compute the union of powermaps allowed by these characters;
##  otherwise choose a class 'c' which is significant for some
##  character, and compute the union of all allowed powermaps with image 'x' on
##  'c', where 'x' runs over '<pow>[c]'.
##
##  By recursion, one gets the list of powermaps which are parametrized on all
##  classes where no element of <chars> is significant, and which yield
##  nonnegative integer scalar products for the minus-characters of <chars>
##  with <subchars>.
##
##  If '<parameters>.quick = true', unique minus characters are never
##  considered.
##
PowermapsAllowedBySymmetrisations :=
              function( tbl, subchars, chars, pow, prime, parameters )

    local i, j, x, indeterminateness, numbofposs, lastimproved, minus, indet,
          poss, param, remain, possibilities, improvemap, allowedmaps, rat,
          powerchars, maxlen, contained, minamb, maxamb, quick;

    if chars = [] then return [ pow ]; fi;
    chars:= Set( chars );
    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;
    
    # but maybe there are characters with equal restrictions ...
    
    # record 'parameters'\:
    if not IsRec( parameters ) then
      Error( "<parameters> must be a record with fields 'maxlen',\n",
             "'contained', 'minamb', 'maxamb' and 'quick'" );
    fi;

    maxlen:= parameters.maxlen;
    contained:= parameters.contained;
    minamb:= parameters.minamb;
    maxamb:= parameters.maxamb;
    quick:= parameters.quick;
    
    if quick and Indeterminateness( pow ) < minamb then # immediately return
      InfoCharTable2( "#I PowermapsAllowedBySymmetrisations: ",
                      " indeterminateness of the map\n",
                      "#I    is smaller than the parameter value",
                      " 'minamb'; returned\n" );
      return [ pow ];
    fi;
    
    # step 1: check all in <chars>; if one has too big indeterminateness
    #         and contains irrational entries, append its rationalized
    #         character to <chars>.
    indeterminateness:= []; # at pos. i the indeterminateness of character i
    numbofposs:= [];        # at pos. 'i' the number of allowed restrictions
                            # for '<chars>[i]'
    lastimproved:= 0;       # last char which led to an improvement of 'pow';
                            # every run through the list may stop at this char
    powerchars:= [];        # at position 'i' the <prime>-th power of
                            # '<chars>[i]'
    i:= 1;
    while i <= Length( chars ) do
      powerchars[i]:= List( chars[i], x -> x ^ prime );
      minus:= MinusCharacter( chars[i], pow, prime );
      indet:= Indeterminateness( minus );
      indeterminateness[i]:= indet;
      if indet = 1 then
        if not quick
           and not NonnegIntScalarProducts( tbl, subchars, minus ) then
          return [];
        fi;
      elif indet < minamb then
        indeterminateness[i]:= 1;
      elif indet <= maxamb then
        poss:= contained( tbl, subchars, minus );
        if poss = [] then return []; fi;
        numbofposs[i]:= Length( poss );
        param:= Parametrized( poss );
        if param <> minus then  # improvement found
          UpdateMap( chars[i], pow, List( [ 1 .. Length( powerchars[i] ) ],
                             x-> powerchars[i][x] - prime * param[x] ) );
          lastimproved:= i;
          indeterminateness[i]:= Indeterminateness(
                                        CompositionMaps( chars[i], pow ) );
        fi;
      else
        numbofposs[i]:= "infinity";
        if ForAny( chars[i], x -> IsCyc(x) and not IsRat(x) ) then

          # maybe the indeterminateness of the rationalized character is
          # smaller but not 1
          rat:= RationalizedMat( [ chars[i] ] )[1];
          if not rat in chars then Add( chars, rat ); fi;
        fi;
      fi;
      i:= i + 1;
    od;
    if lastimproved > 0 then
      indeterminateness[ lastimproved ]:=
            Indeterminateness( CompositionMaps( chars[lastimproved], pow ) );
    fi;
    
    # step 2: (local function 'improvemap')
    #         loop over characters until no improvement is possible without a
    #         branch; update 'indeterminateness' and 'numbofposs';
    #         first character to test is at position 'first'; at least run up
    #         to character $'lastimproved' - 1$, update 'lastimproved' if an
    #         improvement occurs; return 'false' in the case of an
    #         inconsistency, 'true' otherwise.
    improvemap:= function( chars, pow, first, lastimproved,
                           indeterminateness, numbofposs, powerchars )
    local i, x, poss;
    i:= first;
    while i <> lastimproved do
      if indeterminateness[i] <> 1 then
        minus:= MinusCharacter( chars[i], pow, prime );
        indet:= Indeterminateness( minus );
        if indet < indeterminateness[i] then

          # only test those chars which now have smaller indeterminateness
          indeterminateness[i]:= indet;
          if indet = 1 then
            if not quick
               and not NonnegIntScalarProducts( tbl, subchars, minus ) then
              return false;
            fi;
          elif indet < minamb then
            indeterminateness[i]:= 1;
          elif indet <= maxamb then
            poss:= contained( tbl, subchars, minus );
            if poss = [] then return false; fi;
            numbofposs[i]:= Length( poss );
            param:= Parametrized( poss );
            if param <> minus then  # improvement found
              UpdateMap( chars[i], pow,
                         List( [ 1 .. Length( param ) ],
                               x -> powerchars[i][x] - prime * param[x] ) );
              lastimproved:= i;
              indeterminateness[i]:= Indeterminateness(
                                        CompositionMaps( chars[i], pow ) );
            fi;
          fi;
        fi;
      fi;
      if lastimproved = 0 then lastimproved:= i; fi;
      i:= i mod Length( chars ) + 1;
    od;
    indeterminateness[ lastimproved ]:=
            Indeterminateness( CompositionMaps( chars[lastimproved], pow ) );
    return true;
    end;
    
    # step 3: recursion; (local function 'allowedmaps')
    #         a) delete all characters which now have indeterminateness 1;
    #            their minus-characters (with respect to every powermap that
    #            will be found ) have nonnegative scalar products with
    #            <subchars>.
    #         b) branch according to a significant character or class
    #         c) for each possibility call 'improvemap' and then the recursion
    
    allowedmaps:= function( chars, pow, indeterminateness, numbofposs,
                            powerchars )
    local i, j, class, possibilities, poss, newpow, newpowerchars, newindet,
          newnumbofposs, copy;
    remain:= Filtered( [ 1 .. Length(chars) ], i->indeterminateness[i] > 1 );
    chars:=             Sublist( chars,             remain );
    indeterminateness:= Sublist( indeterminateness, remain );
    numbofposs:=        Sublist( numbofposs,        remain );
    powerchars:=        Sublist( powerchars,        remain );

    if chars = [] then
      InfoCharTable2( "#I PowermapsAllowedBySymmetrisations: no character",
                      " with indeterminateness\n#I    between ", minamb,
                      " and ", maxamb, " significant now\n" );
      return [ pow ];
    fi;
    possibilities:= [];
    if Minimum( numbofposs ) < maxlen then
      # branch according to a significant character
      # with minimal number of possible restrictions
      i:= Position( numbofposs, Minimum( numbofposs ) );
      InfoCharTable2( "#I PowermapsAllowedBySymmetrisations: branch at",
                      " character\n",
                      "#I     ", CharString( chars[i], "" ),
                      " (", numbofposs[i], " calls)\n" );
      poss:= contained( tbl, subchars,
                        MinusCharacter( chars[i], pow, prime ) );
      for j in poss do
        newpow:= Copy( pow );
        UpdateMap( chars[i], newpow, powerchars[i] - prime * j );
        newindet:= Copy( indeterminateness );
        newnumbofposs:= Copy( numbofposs );
        if improvemap( chars, newpow, i, 0, newindet, newnumbofposs,
                       powerchars ) then
          Append( possibilities,
                  allowedmaps( chars, newpow, newindet, newnumbofposs,
                               ShallowCopy( powerchars ) ) );
        fi;
      od;
      InfoCharTable2("#I PowermapsAllowedBySymmetrisations: return from",
                     " branch at character\n",
                     "#I     ", CharString( chars[i], "" ),
                     " (", numbofposs[i], " calls)\n" );
    else
    
      # branch according to a significant class in a
      # character with minimal nontrivial indet.
      i:= Position( indeterminateness, Minimum( indeterminateness ) );
                             # always nontrivial indet.!
      minus:= MinusCharacter( chars[i], pow, prime );
      class:= 1;
      while not IsList( minus[ class ] ) do class:= class + 1; od;
    
      InfoCharTable2( "#I PowermapsAllowedBySymmetrisations: ",
                      "branch at class ",
                      class, " (", Length( pow[ class ] ), " calls)\n" );
    
      # too many calls!!
      # (only those were necessary which are different for minus)
    
      for j in pow[ class ] do
        newpow:= Copy( pow );
        newpow[ class ]:= j;
        copy:= Copy( tbl.powermap );
        Unbind( copy[ prime ] );
        if TestConsistencyMaps( copy, newpow, copy ) then
          newindet:= Copy( indeterminateness );
          newnumbofposs:= Copy( numbofposs );
          if improvemap( chars, newpow, i, 0, newindet, newnumbofposs,
                         powerchars ) then
            Append( possibilities,
                    allowedmaps( chars, newpow, newindet, newnumbofposs,
                                 ShallowCopy( powerchars ) ) );
          fi;
        fi;
      od;
    
      InfoCharTable2( "#I PowermapsAllowedBySymmetrisations: return from",
                      " branch at class ", class, "\n" );
    
    fi;
    return possibilities;
    end;
    
    # start of the recursion:
    
    if lastimproved <> 0 then              # after step 1
      if not improvemap( chars, pow, 1, lastimproved, indeterminateness,
                         numbofposs, powerchars ) then
        return [];
      fi;
    fi;
    return allowedmaps( chars, pow, indeterminateness, numbofposs,
                        powerchars );
    end;
  

#############################################################################
##
#F  Powermap( <tbl>, <prime> )
#F  Powermap( <tbl>, <prime>, <parameters> )
##
##  returns a list of possibilities for the <prime>-th powermap of the
##  character table <tbl>.
##  If <tbl> is a Brauer table, the map is computed from the power map
##  of the ordinary table '<tbl>.ordinary' which may cause a call of
##  'Powermap' for this table.
##  
##  The optional record <parameters> may have the following fields\:
##  
##  'chars':\\
##       a list of characters which are used for the check of kernels
##       (see "ConsiderKernels"), the test of congruences (see "Congruences")
##       and the test of scalar products of symmetrisations
##       (see "PowermapsAllowedBySymmetrisations");
##       the default is '<tbl>.irreducibles'
##  
##  'powermap':\\
##       a (parametrized) map which is an approximation of the desired map
##  
##  'decompose':\\
##       a boolean; if 'true', the symmetrisations of 'chars' must have all
##       constituents in 'chars', that will be used in the algorithm;
##       if 'chars' is not bound and '<tbl>.irreducibles' is complete,
##       the default value of 'decompose' is 'true', otherwise 'false'
##  
##  'quick':\\
##       a boolean; if 'true', the subroutines are called with the option
##       '\"quick\"'; especially, a unique map will be returned immediately
##       without checking all symmetrisations; the default value is 'false'
##  
##  'parameters':\\
##       a record with fields 'maxamb', 'minamb' and 'maxlen' which control
##       the subroutine 'PowermapsAllowedBySymmetrisations'\:
##       It only uses characters with actual indeterminateness up to
##       'maxamb', tests decomposability only for characters with actual
##       indeterminateness at least 'minamb' and admits a branch only
##       according to a character if there is one with at most 'maxlen'
##       possible minus-characters.
##
Powermap := function( arg )

    local i, x,
          tbl,     # character table, first argument
          chars,
          prime,   # prime number, second argument
          powermap, indet,
          maxamb,
          minamb,
          maxlen,
          poss, rat, pow, approxval, powerval, approxpowermap, quick, ok,
          decompose,
          fus,      # Brauer table: fusion map from 'tbl' to 'tbl.ordinary'
          inv;      # Brauer table: inverse map of 'fus'
    
    if not ( Length( arg ) in [ 2, 3 ] and IsCharTable( arg[1] )
             and IsPrimeInt( arg[2] ) )
       or ( Length( arg ) = 3 and not IsRec( arg[3] ) ) then
      Error( "usage: Powermap( <tbl>, <prime> )\n",
             " resp. Powermap( <tbl>, <prime>, <parameters> )" );
    fi;
    
    tbl:=   arg[1];
    prime:= arg[2];

    if Length( arg ) = 3 then       # parameters
      if IsBound( arg[3].chars ) then
        chars:= arg[3].chars;
        decompose:= false;
      else
        if IsBound( tbl.irreducibles ) then
          chars:= tbl.irreducibles;
          if Length( chars ) = Length( tbl.centralizers ) then
            decompose:= true;
          else
            decompose:= false;
          fi;
        else
          chars:= [];
          decompose:= false;
        fi;
      fi;
      if IsBound( arg[3].powermap ) then
        approxpowermap:= arg[3].powermap;
      else
        approxpowermap:= [];
      fi;
      if IsBound( arg[3].quick ) and arg[3].quick = true then
        quick:= true;
      else
        quick:= false;
      fi;
      if IsBound( arg[3].decompose ) then
        if arg[3].decompose = true then
          decompose:= true;
        else
          decompose:= false;
        fi;
      fi;
      if IsBound( arg[3].parameters ) then
        maxamb:= arg[3].parameters.maxamb;
        minamb:= arg[3].parameters.minamb;
        maxlen:= arg[3].parameters.maxlen;
      else
        maxamb:= 100000;
        minamb:= 10000;
        maxlen:= 10;
      fi;
    else
      if IsBound( tbl.irreducibles ) then 
        chars:= tbl.irreducibles;
      else
        chars:= [];
      fi;
      if Length( chars ) = Length( tbl.centralizers ) then
        decompose:= true;
      else
        decompose:= false;
      fi;
      approxpowermap:= [];
      quick:= false;
      maxamb:= 100000;
      minamb:= 10000;
      maxlen:= 10;
    fi;
    
    # Is 'tbl' a Bauer table?
    if IsBound( tbl.ordinary ) then
      if IsBound( tbl.ordinary.powermap ) and
         IsBound( tbl.ordinary.powermap[ prime ] ) then
        powermap:= [ tbl.ordinary.powermap[ prime ] ];
      elif Length( arg ) = 2 then
        powermap:= Powermap( tbl.ordinary, prime );
      else
        powermap:= Powermap( tbl.ordinary, prime,
                            rec( quick      := quick,
                                 decompose  := decompose,
                                 parameters := rec( maxamb:= maxamb,
                                                    minamb:= minamb,
                                                    maxlen:= maxlen ) ) );
   # 'powermap' and 'chars' ???
      fi;
      fus:= GetFusionMap( tbl, tbl.ordinary );
      inv:= InverseMap( fus );
      return Set( List( powermap,
               x -> CompositionMaps( inv, CompositionMaps( x, fus ) ) ) );
    fi;

    # ordinary table
    powermap:= InitPowermap( tbl, prime );
    if powermap = false then
      InfoCharTable2( "#I Powermap: no initialization possible\n" );
      return [];
    fi;
    
    # use 'approxpowermap'\:
    
    for i in [ 1 .. Minimum( Length(approxpowermap), Length(powermap) ) ] do
      if IsBound( approxpowermap[i] ) then
        if IsInt( approxpowermap[i] ) then
          approxval:= [ approxpowermap[i] ];
        else
          approxval:= approxpowermap[i];
        fi;
        if IsInt( powermap[i] ) then
          powerval:= [ powermap[i] ];
        else
          powerval:= powermap[i];
        fi;
        powerval:= Intersection( approxval, powerval );
        if powerval = [] then
          Print( "#I Powermap: possible maps not compatible with ",
                 "<approxpowermap> at class ", i, "\n" );
          return [];
        elif Length( powerval ) = 1 then
          powermap[i]:= powerval[1];
        else
          powermap[i]:= powerval;
        fi;
      fi;
    od;
    
    if quick then
      ok:= Congruences( tbl, chars, powermap, prime, "quick" );
    else
      ok:= Congruences( tbl, chars, powermap, prime );
    fi;
    if not ok then
      InfoCharTable2( "#I Powermap: errors in Congruences\n" );
      return [];
    fi;
    if quick then
      ok:= ConsiderKernels( tbl, chars, powermap, prime, "quick" );
    else
      ok:= ConsiderKernels( tbl, chars, powermap, prime );
    fi;
    if not ok then
      InfoCharTable2( "#I Powermap: errors in ConsiderKernels\n" );
      return [];
    fi;
    if IsBound( tbl.powermap ) and IsList( tbl.powermap ) then
      if quick then
        ok:= ConsiderSmallerPowermaps( tbl, powermap, prime, "quick" );
      else
        ok:= ConsiderSmallerPowermaps( tbl, powermap, prime );
      fi;
      if not ok then
        InfoCharTable2( "#I Powermap: errors in ConsiderSmallerPowermaps\n" );
        return [];
      fi;
    fi;
    
    if InfoCharTable2 <> Ignore then
      Print( "#I Powermap: ", Ordinal( prime ),
             " powermap initialized; congruences, kernels and\n",
             "#I    maps for smaller primes considered.\n",
             "#I    The actual indeterminateness is ",
             Indeterminateness( powermap ), ".\n" );
      if quick then
        Print( "#I    (\"quick\" option specified)\n" );
      fi;
    fi;
    
    if quick and ForAll( powermap, IsInt ) then return [ powermap ]; fi;
    
    # now use restricted characters:
    # If the parameter \"decompose\" was entered, use decompositions
    # of minus-characters of <chars> into <chars>;
    # otherwise only check the scalar products with <chars>.
    
    if decompose then                 # usage of decompositions allowed
      if Indeterminateness( powermap ) < minamb then
        InfoCharTable2( "#I Powermap: indeterminateness too small for test",
                        " of decomposability\n" );
        poss:= [ powermap ];
      else
        InfoCharTable2( "#I Powermap: now test decomposability of rational ",
                        "minus-characters\n" );
        rat:= RationalizedMat( chars );
        poss:= PowermapsAllowedBySymmetrisations( tbl, rat, rat, powermap,
                             prime, rec( maxlen:= maxlen,
                                         contained:= ContainedCharacters,
                                         minamb:= minamb,
                                         maxamb:= "infinity",
                                         quick:= quick ) );
        if InfoCharTable2 <> Ignore then
          Print( "#I Powermap: decomposability tested,\n" );
          if Length( poss ) = 1 then
            Print( "#I    1 solution with indeterminateness ",
                   Indeterminateness( poss[1] ), "\n" );
          else
            Print( "#I    ", Length( poss ),
                   " solutions with indeterminateness\n",
                   List( poss, Indeterminateness ), "\n" );
          fi;
        fi;
        if quick and Length( poss ) = 1 and ForAll( poss[1], IsInt ) then
          return [ poss[1] ];
        fi;
      fi;
    else
      InfoCharTable2( "#I Powermap: no test of decomposability allowed\n" );
      poss:= [ powermap ];
    fi;
    
    InfoCharTable2( "#I Powermap: test scalar products",
                    " of minus-characters\n" );
    
    powermap:= [];
    for pow in poss do
      Append( powermap,
              PowermapsAllowedBySymmetrisations( tbl, chars, chars, pow,
                          prime, rec( maxlen:= maxlen,
                                      contained:= ContainedPossibleCharacters,
                                      minamb:= 1,
                                      maxamb:= maxamb,
                                      quick:= quick ) ) );
    od;

    if InfoCharTable2 <> Ignore then
      if ForAny( powermap, x -> ForAny( x, IsList ) ) then
        Print( "#I Powermap: ", Length(powermap), " parametrized solution" );
        if Length(powermap) = 1 then Print(",\n"); else Print("s,\n"); fi;
        Print( "#I    no further improvement was possible with given",
               " characters\n",
               "#I    and maximal checked ambiguity of ", maxamb, "\n" );
      else
        Print( "#I Powermap: ", Length( powermap ), " solution" );
        if Length(powermap) = 1 then Print("\n"); else Print("s\n"); fi;
      fi;
    fi;
    return powermap;
    end;


#############################################################################
##
#F  ConsiderTableAutomorphisms( <parafus>, <grp> )
##
##  improves the parametrized subgroup fusion map <parafus> so that
##  afterwards exactly one representative of fusion maps (that is contained
##  in <parafus>) in every orbit under the action of the permutation group
##  <grp> is contained in <parafus>.
##
##  The list of positions where improvements were found is returned.
##
ConsiderTableAutomorphisms := function( parafus, grp )
    local i, support, images, notstable, orbits, isunion, image, orb,
          im, found, prop;
    
    # step 1: Compute the subgroup of <grp> that acts on all images
    #         under <parafus>; if <parafus> contains all possible subgroup
    #         fusions, this is the whole group of table automorphisms of the
    #         supergroup table.
    
    if grp.generators = [] then return []; fi;
    images:= Set( parafus );
    notstable:= Filtered( images, x -> IsInt(x) and
                          ForAny( grp.generators, y->x^y<>x ) );
    if notstable = [] then
      MakeStabChain( grp );
    else
      InfoPermGroup2( "#I ConsiderTableAutomorphisms: not all generators fix",
                      " uniquely\n#I    determined images;",
                      " computing admissible subgroup\n" );
      grp:= Stabilizer( grp, notstable, OnTuples );
    fi;
    if grp.generators = [] then return []; fi;

    images:= Filtered( images, IsList );
    support:= grp.operations.LargestMovedPoint( grp );
    orbits:= List( Orbits( grp, [ 1 .. support ] ), Set );
                              # sets because entries of parafus are sets

    isunion:= function( image )
    while image <> [] do
      if image[1] > support then return true; fi;
      orb:= First( orbits, x -> image[1] in x );
      if Difference( orb, image ) <> [] then return false; fi;
      image:= Difference( image, orb );
    od;
    return true;
    end;

    notstable:= Filtered( images, x -> not isunion(x) );
    if notstable <> [] then
      InfoPermGroup2( "#I ConsiderTableAutomorphisms:",
                      " not all generators act;\n",
                      "#I    computing admissible subgroup\n" );
      for i in notstable do
        grp:= grp.operations.StabilizerSet( grp, i );
      od;
    
    #   prop:= function( perm )
    #          return ForAll( notstable, x -> Set( x^perm ) = x );
    #          end;
    #   grp:= SubgroupProperty( grp, prop );
    
    fi;
    
    # step 2: If possible, find a class where the image {\em is} a nontrivial
    #         orbit under <grp>, i.e. no other points are
    #         possible. Then replace the image by the first point of the
    #         orbit, and replace <grp> by the stabilizer of
    #         the new image in <grp>.
    
    found:= [];
    i:= 1;
    while i <= Length( parafus ) and grp.generators <> [] do
      if IsList( parafus[i] ) and parafus[i] in orbits then
        Add( found, i );
        parafus[i]:= parafus[i][1];
        grp:= grp.operations.Stabilizer( grp, parafus[i], OnPoints );
        if grp.generators <> [] then
          support:= grp.operations.LargestMovedPoint( grp );
          orbits:= List( Orbits( grp, [ 1 .. support ] ), Set );

          # Compute orbits of the smaller group; sets because entries
          # of parafus are sets

        fi;
      fi;
      i:= i + 1;
    od;
    
    # step 3: If 'grp' is not trivial, find classes where the image
    #         {\em contains} a nontrivial orbit under 'grp'. 
    
    i:= 1;
    while i <= Length( parafus ) and grp.generators <> [] do
      if IsList( parafus[i] ) and ForAny( grp.generators,
                                  x -> ForAny( parafus[i], y->y^x<>y ) ) then
        Add( found, i );
        image:= [];
        while parafus[i] <> [] do
    
          # now it is necessary to consider orbits of the smaller group,
          # since improvements in step 2 and 3 may affect the action
          # on the images.
    
          Add( image, parafus[i][1] );
          parafus[i]:= Difference( parafus[i], Orbit( grp, parafus[i][1] ) );
        od;
        for im in image do
          if grp.generators <> [] then
            grp:= grp.operations.Stabilizer( grp, im, OnPoints );
          fi;
        od;
        parafus[i]:= image;
      fi;
      i:= i+1;
    od;
    return found;
    end;


#############################################################################
##
#F  OrbitFusions( <subtblautomorphisms>, <fusionmap>, <tblautomorphisms> )
##
##  returns the orbit of the subgroup fusion map <fusionmap> under the
##  actions of maximal admissible subgroups of the table automorphisms
##  <subtblautomorphisms> of the subgroup table and <tblautomorphisms> of
##  the supergroup table.
##  The table automorphisms must be both permutation groups.
##
OrbitFusions := function( subtblautomorphisms, fusionmap, tblautomorphisms )
    local i, orb, gen, image;

    orb:= [ fusionmap ];
    for fusionmap in orb do
      for gen in subtblautomorphisms.generators do
        image:= Permuted( fusionmap, gen );
        if not image in orb then Add( orb, image ); fi;
      od;
    od;
    for fusionmap in orb do
      for gen in tblautomorphisms.generators do
        image:= [];
        for i in fusionmap do
          if IsInt( i ) then
            Add( image, i^gen );
          else
            Add( image, Set( OnTuples( i, gen ) ) );
          fi;
        od;
        if not image in orb then Add( orb, image ); fi;
      od;
    od;
    return orb;
    end;


#############################################################################
##
#F  OrbitPowermaps( <powermap>, <matautomorphisms> )
##
##  returns the orbit of the powermap <powermap> under the action of the
##  maximal admissible subgroup of the matrix automorphisms
##  <matautomorphisms> of the considered character table.
##  The matrix automorphisms must be a permutation group.
##
OrbitPowermaps := function( powermap, matautomorphisms )
    local nccl, orb, gen, image;

    nccl:= Length( powermap );
    orb:= [ powermap ];
    for powermap in orb do
      for gen in matautomorphisms.generators do
        image:= List( [ 1 .. nccl ], x -> powermap[ x^gen ] / gen );
        if not image in orb then Add( orb, image ); fi;
      od;
    od;
    return orb;
    end;


#############################################################################
##
#F  RepresentativesFusions( <subtblautomorphisms>, <listoffusionmaps>,
#F                          <tblautomorphisms> )
#F  RepresentativesFusions( <subtbl>, <listoffusionmaps>, <tbl> )
##
##  returns a list of representatives of subgroup fusions in the list
##  <listoffusionmaps> under the action of maximal admissible subgroups
##  of the table automorphisms <subtblautomorphisms> of the subgroup table
##  and <tblautomorphisms> of the supergroup table.
##  The table automorphisms must be both permutation groups.
##
RepresentativesFusions := function( subtblautomorphisms, listoffusionmaps,
                                    tblautomorphisms )
    local stable, prop, orbits, orbit;
    
    if listoffusionmaps = [] then return []; fi;
    listoffusionmaps:= Set( listoffusionmaps );
    
    if IsCharTable( subtblautomorphisms ) then
      if   IsBound( subtblautomorphisms.automorphisms ) then
        subtblautomorphisms:= subtblautomorphisms.automorphisms;
      elif IsBound( subtblautomorphisms.galomorphisms ) then
        subtblautomorphisms:= subtblautomorphisms.galomorphisms;
      else
        subtblautomorphisms:= Group( () );
        Print( "#I RepresentativesFusions:",
               " no subtable automorphisms stored\n" );
      fi;
    fi;
    if IsCharTable( tblautomorphisms ) then
      if   IsBound( tblautomorphisms.automorphisms ) then
        tblautomorphisms:= tblautomorphisms.automorphisms;
      elif IsBound( tblautomorphisms.galomorphisms ) then
        tblautomorphisms:= tblautomorphisms.galomorphisms;
      else
        tblautomorphisms:= Group( () );
        Print( "#I RepresentativesFusions: no table automorphisms stored\n" );
      fi;
    fi;
      
    # find the subgroups of the table automorphism groups which act on
    # <listoffusionmaps>\:
    
    stable:= Filtered( subtblautomorphisms.generators,
                    x -> ForAll( listoffusionmaps, 
                              y -> Permuted( y, x ) in listoffusionmaps ) );
    if not stable = subtblautomorphisms.generators then
      Print("#I RepresentativesFusions: Not all table automorphisms of the\n",
            "#I    subgroup table do act;",
            " computing the admissible subgroup.\n" );
      prop:= ( x -> ForAll( listoffusionmaps, 
                            y -> Permuted( y, x ) in listoffusionmaps ) );
      subtblautomorphisms:=
               PermGroupOps.SubgroupProperty( subtblautomorphisms, prop,
                                              Group( stable, () ) );
    fi;
    
    stable:= Filtered( tblautomorphisms.generators,
                    x -> ForAll( listoffusionmaps, 
                              y -> List( y, z->z^x ) in listoffusionmaps ) );
    if not stable = tblautomorphisms.generators then
      Print("#I RepresentativesFusions: Not all table automorphisms of the\n",
            "#I    supergroup table do act;",
            " computing the admissible subgroup.\n" );
      prop:= ( x -> ForAll( listoffusionmaps, 
                            y -> List( y, z -> z^x ) in listoffusionmaps ) );
      tblautomorphisms:= 
            PermGroupOps.SubgroupProperty( tblautomorphisms, prop,
                                           Group( stable, () ) );
    fi;
    
    # distribute the maps to orbits\:
    
    orbits:= [];
    while listoffusionmaps <> []  do
      orbit:= OrbitFusions( subtblautomorphisms, listoffusionmaps[1],
                            tblautomorphisms );
      Add( orbits, orbit );
      SubtractSet( listoffusionmaps, orbit );
    od;
    
    if InfoCharTable2 <> Ignore then
      if Length( orbits ) = 1 then
        Print( "#I RepresentativesFusions: There is 1 orbit of length ",
               Length( orbits[1] ), ".\n" );
      else
        Print( "#I RepresentativesFusions: There are ", Length( orbits ),
               " orbits of lengths ", List( orbits, Length ), ".\n" );
      fi;
    fi;
    
    # choose representatives\:
    
    return List( orbits, x -> x[1] );
    end;
    

#############################################################################
##
#F  RepresentativesPowermaps( <listofpowermaps>, <matautomorphisms> )
##
##  returns a list of representatives of powermaps in the list
##  <listofpowermaps> under the action of the maximal admissible subgroup
##  of the matrix automorphisms <matautomorphisms> of the considered
##  character matrix.
##  The matrix automorphisms must be a permutation group.
##
RepresentativesPowermaps := function( listofpowermaps, matautomorphisms )
    local nccl, stable, prop, orbits, orbit;
    
    if listofpowermaps = [] then return []; fi;
    listofpowermaps:= Set( listofpowermaps );
    
    # find the subgroup of the table automorphism group which acts on
    # <listofpowermaps>\:
    
    nccl:= Length( listofpowermaps[1] );
    stable:= Filtered( matautomorphisms.generators,
              x -> ForAll( listofpowermaps, 
              y -> List( [ 1..nccl ], z -> y[z^x]/x ) in listofpowermaps ) );
    if not stable = matautomorphisms.generators then
      Print( "#I RepresentativesPowermaps: Not all table automorphisms\n",
             "#I    do act; computing the admissible subgroup.\n" );
      prop:= ( x -> ForAll( listofpowermaps, 
               y -> List( [ 1..nccl ], z -> y[z^x]/x ) in listofpowermaps ) );
      if stable = [] then stable:= (); fi;
      matautomorphisms:=
            PermGroupOps.SubgroupProperty( matautomorphisms, prop,
                                           Group( stable, () ) );
    fi;
    
    # distribute the maps to orbits\:
    
    orbits:= [];
    while listofpowermaps <> []  do
      orbit:= OrbitPowermaps( listofpowermaps[1], matautomorphisms );
      Add( orbits, orbit );
      SubtractSet( listofpowermaps, orbit );
    od;
    
    if InfoCharTable2 <> Ignore then
      if Length( orbits ) = 1 then
        Print( "#I RepresentativesPowermaps: There is 1 orbit of length ",
               Length( orbits[1] ), ".\n" );
      else
        Print( "#I RepresentativesPowermaps: There are ", Length( orbits ),
               " orbits of lengths ", List( orbits, Length ), ".\n" );
      fi;
    fi;
    
    # choose representatives\:
    
    return List( orbits, x -> x[1] );
    end;
    

#############################################################################
##
#F  FusionsAllowedByRestrictions( <subtbl>, <tbl>, <subchars>, <chars>,
#F                                <fus>, <parameters> )
##
##  <parameters must be a record with fields <maxlen> (int), <contained>,
##  <minamb>, <maxamb> and <quick> (boolean).
##
##  First, for all $\chi \in <chars>$ let
##  'restricted:= CompositionMaps( $\chi$, <fus> )'.
##  If '<minamb> \< Indeterminateness( restricted ) \< <maxamb>', construct
##  'poss:= contained( <subtbl>, <subchars>, restricted )'.
##  (<contained> is a function that will be 'ContainedCharacters' or
##  'ContainedPossibleCharacters'.)
##  Improve <fus> if possible.
##
##  If 'Indeterminateness( restricted ) \< <minamb>', delete this character;
##  for unique restrictions and '<parameters>.quick = false', the scalar
##  products with <subchars> are checked.
##
##  If the restriction of a character *becomes* unique during the
##  processing, its scalar products with <subchars> are checked.
##
##  If no further improvement is possible, delete all characters with unique
##  restrictions or, more general, indeterminateness at most <minamb>,
##  and branch:
##  If there is a character left with less or equal <maxlen> possible
##  restrictions, compute the union of fusions allowed by these restrictions;
##  otherwise choose a class 'c' of <subgroup> which is significant for some
##  character, and compute the union of all allowed fusions with image 'x' on
##  'c', where 'x' runs over '<fus>[c]'.
##
##  By recursion, one gets the list of fusions which are parametrized on all
##  classes where no element of <chars> is significant, and which yield
##  nonnegative integer scalar products for the restrictions of <chars>
##  with <subchars> (or additionally decomposability).
##
##  If '<parameters>.quick = true', unique restrictions are never considered.
##
FusionsAllowedByRestrictions := function( subtbl, tbl, subchars, chars, fus,
                                          parameters )
    local x, i, j, indeterminateness, numbofposs, lastimproved, restricted,
          indet, rat, poss, param, remain, possibilities, improvefusion,
          allowedfusions, maxlen, contained, minamb, maxamb, quick;

    if chars = [] then return [ fus ]; fi;
    chars:= Set( chars );
    
    # but maybe there are characters with equal restrictions ...
    
    # record <parameters>\:
    if not IsRec( parameters ) then
      Error( "<parameters> must be a record with fields 'maxlen',\n",
             "'contained', 'minamb', 'maxamb' and 'quick'" );
    fi;

    maxlen:= parameters.maxlen;
    contained:= parameters.contained;
    minamb:= parameters.minamb;
    maxamb:= parameters.maxamb;
    quick:= parameters.quick;
    
    if quick and Indeterminateness( fus ) < minamb then # immediately return
      InfoCharTable2( "#I FusionsAllowedByRestrictions: indeterminateness of",
                      " the map\n#I    is smaller than the parameter value",
                      " 'minamb'; returned\n" );
      return [ fus ];
    fi;
    
    # step 1: check all in <chars>; if one has too big indeterminateness
    #         and contains irrational entries, append its rationalized char
    #         <chars>.
    indeterminateness:= []; # at position i the indeterminateness of char i
    numbofposs:= [];        # at position 'i' the number of allowed
                            # restrictions for '<chars>[i]'
    lastimproved:= 0;       # last char which led to an improvement of 'fus';
                            # every run through the list may stop at this char
    i:= 1;
    while i <= Length( chars ) do
      restricted:= CompositionMaps( chars[i], fus );
      indet:= Indeterminateness( restricted );
      indeterminateness[i]:= indet;
      if indet = 1 then
        if not quick
           and not NonnegIntScalarProducts(subtbl,subchars,restricted) then
          return [];
        fi;
      elif indet < minamb then
        indeterminateness[i]:= 1;
      elif indet <= maxamb then
        poss:= contained( subtbl, subchars, restricted );
        if poss = [] then return []; fi;
        numbofposs[i]:= Length( poss );
        param:= Parametrized( poss );
        if param <> restricted then  # improvement found
          UpdateMap( chars[i], fus, param );
          lastimproved:= i;
      
      # call of TestConsistencyMaps ? ( with respect to improved classes )
    
          indeterminateness[i]:= Indeterminateness(
                                        CompositionMaps( chars[i], fus ) );
        fi;
      else
        numbofposs[i]:= "infinity";
        if ForAny( chars[i], x -> IsCyc(x) and not IsRat(x) ) then
    
          # maybe the indeterminateness of the rationalized
          # character is smaller but not 1
          rat:= RationalizedMat( [ chars[i] ] )[1];
          AddSet( chars, rat );
        fi;
      fi;
      i:= i + 1;
    od;
    
    # step 2: (local function 'improvefusion')
    #         loop over chars until no improvement is possible without a
    #         branch; update 'indeterminateness' and 'numbofposs';
    #         first character to test is at position 'first'; at least run
    #         up to character $'lastimproved' - 1$; update 'lastimproved' if
    #         an improvement occurs;
    #         return 'false' in the case of an inconsistency, 'true'
    #         otherwise.

    #         Note:
    #         'subtbl', 'subchars' and 'maxlen' are global
    #         variables for this function, also (but not necessary) global are
    #         'restricted', 'indet' and 'param'.
    
    improvefusion:=
         function(chars,fus,first,lastimproved,indeterminateness,numbofposs)
    local i, poss;
    i:= first;
    while i <> lastimproved do
      if indeterminateness[i] <> 1 then
        restricted:= CompositionMaps( chars[i], fus );
        indet:= Indeterminateness( restricted );
        if indet < indeterminateness[i] then
    
          # only test those characters which now have smaller
          # indeterminateness
          indeterminateness[i]:= indet;
          if indet = 1 then
            if not quick and
               not NonnegIntScalarProducts(subtbl,subchars,restricted) then
              return false;
            fi;
          elif indet < minamb then
            indeterminateness[i]:= 1;
          elif indet <= maxamb then
            poss:= contained( subtbl, subchars, restricted );
            if poss = [] then return false; fi;
            numbofposs[i]:= Length( poss );
            param:= Parametrized( poss );
            if param <> restricted then  # improvement found
              UpdateMap( chars[i], fus, param );
              lastimproved:= i;
      
      # call of TestConsistencyMaps ? ( with respect to improved classes )
    
              indeterminateness[i]:= Indeterminateness(
                                        CompositionMaps( chars[i], fus ) );
            fi;
          fi;
        fi;
      fi;
      if lastimproved = 0 then lastimproved:= i; fi;
      i:= i mod Length( chars ) + 1;
    od;
    return true;
    end;
    
    # step 3: recursion; (local function 'allowedfusions')
    #         a) delete all characters which now have indeterminateness 1;
    #            their restrictions (with respect to every fusion that will be
    #            found ) have nonnegative scalar products with <subchars>.
    #         b) branch according to a significant character or class
    #         c) for each possibility call 'improvefusion' and then the
    #            recursion
    
    allowedfusions:= function( subpowermap, powermap, chars, fus,
                               indeterminateness, numbofposs )
    local i, j, class, possibilities, poss, newfus, newpow, newsubpow,
          newindet, newnumbofposs;
    remain:= Filtered( [ 1..Length( chars ) ], i->indeterminateness[i] > 1 );
    chars:=             Sublist( chars,             remain );
    indeterminateness:= Sublist( indeterminateness, remain );
    numbofposs:=        Sublist( numbofposs,        remain );

    if chars = [] then
      InfoCharTable2( "#I FusionsAllowedByRestrictions: no character with",
                      " indeterminateness\n#I    between ", minamb, " and ",
                      maxamb, " significant now\n" );
      return [ fus ];
    fi;
    possibilities:= [];
    if Minimum( numbofposs ) < maxlen then
    
      # branch according to a significant character
      # with minimal number of possible restrictions
      i:= Position( numbofposs, Minimum( numbofposs ) );
      InfoCharTable2("#I FusionsAllowedByRestrictions: branch at",
                      " character\n",
                      "#I     ", CharString( chars[i], "" ),
                      " (", numbofposs[i], " calls)\n" );
      poss:= contained( subtbl, subchars,
                        CompositionMaps( chars[i], fus ) );
      for j in poss do
        newfus:= Copy( fus );
        newpow:= Copy( powermap );
        newsubpow:= Copy( subpowermap );
        UpdateMap( chars[i], newfus, j );
        if TestConsistencyMaps( newsubpow, newfus, newpow ) then
          newindet:= Copy( indeterminateness );
          newnumbofposs:= Copy( numbofposs );
          if improvefusion(chars,newfus,i,0,newindet,newnumbofposs) then
            Append( possibilities,
                    allowedfusions( newsubpow, newpow, chars,
                                    newfus, newindet, newnumbofposs ) );
          fi;
        fi;
      od;
    
      InfoCharTable2("#I FusionsAllowedByRestrictions: return from branch at",
                     " character\n",
                     "#I     ", CharString( chars[i], "" ),
                     " (", numbofposs[i], " calls)\n" );
    
    else
    
      # branch according to a significant class in a
      # character with minimal nontrivial indet.
      i:= Position( indeterminateness, Minimum( indeterminateness ) );
      restricted:= CompositionMaps( chars[i], fus );
      class:= 1;
      while not IsList( restricted[ class ] ) do class:= class + 1; od;
      InfoCharTable2( "#I FusionsAllowedByRestrictions: branch at class ",
                      class, "\n#I     (", Length( fus[ class ] ),
                      " calls)\n" );
      for j in fus[ class ] do
        newfus:= Copy( fus );
        newfus[ class ]:= j;
        newpow:= Copy( powermap );
        newsubpow:= Copy( subpowermap );
        if TestConsistencyMaps( subpowermap, newfus, tbl.powermap ) then
          newindet:= Copy( indeterminateness );
          newnumbofposs:= Copy( numbofposs );
          if improvefusion(chars,newfus,i,0,newindet,newnumbofposs) then
            Append( possibilities,
                    allowedfusions( newsubpow, newpow, chars,
                                    newfus, newindet, newnumbofposs ) );
          fi;
        fi;
      od;
      InfoCharTable2("#I FusionsAllowedByRestrictions: return from branch at",
                     " class ", class, "\n" );
    fi;
    return possibilities;
    end;
    
    # begin of the recursion:
    if lastimproved <> 0 then
      if not improvefusion( chars, fus, 1, lastimproved, indeterminateness,
                            numbofposs ) then
        return [];
      fi;
    fi;
    return allowedfusions( subtbl.powermap, tbl.powermap, chars, fus,
                           indeterminateness, numbofposs );
    end;
  

#############################################################################
##
#F  SubgroupFusions( <subtbl>, <tbl> )
#F  SubgroupFusions( <subtbl>, <tbl>, <parameters )
##
##  returns the list of all subgroup fusion maps from <subtbl> into <tbl>.
##  
##  The optional record <parameters> may have the following fields\:
##  
##  'chars':\\
##       a list of characters of <tbl> which will be restricted to <subtbl>,
##       (see "FusionsAllowedByRestrictions");
##       the default is '<tbl.irreducibles'
##  
##  'subchars':\\
##       a list of characters of <subtbl> which are constituents of the
##       retrictions of 'chars', the default is '<subtbl>.irreducibles'
##  
##  'fusionmap':\\
##       a (parametrized) map which is an approximation of the desired map
##  
##  'decompose':\\
##       a boolean; if 'true', the restrictions of 'chars' must have all
##       constituents in 'subchars', that will be used in the algorithm;
##       if 'subchars' is not bound and '<subtbl>.irreducibles' is complete,
##       the default value of 'decompose' is 'true', otherwise 'false'
##  
##  'permchar':\\
##       a permutaion character; only those fusions are computed which
##       afford that permutation character
##  
##  'quick':\\
##       a boolean; if 'true', the subroutines are called with the option
##       '\"quick\"'; especially, a unique map will be returned immediately
##       without checking all symmetrisations; the default value is 'false'
##  
##  'parameters':\\
##       a record with fields 'maxamb', 'minamb' and 'maxlen' which control
##       the subroutine 'FusionsAllowedByRestrictions'\:
##       It only uses characters with actual indeterminateness up to
##       'maxamb', tests decomposability only for characters with actual
##       indeterminateness at least 'minamb' and admits a branch only
##       according to a character if there is one with at most 'maxlen'
##       possible restrictions.
##
SubgroupFusions := function( arg )
    local x, i, subtbl, tbl, subchars, chars, fus, maxamb, minamb,
          maxlen, poss, subgroupfusions, imp, subtaut, taut, quick,
          decompose, approxfus, fusval, approxval, permchar, grp;

    if not ( Length( arg ) in [ 2, 3 ] and IsCharTable( arg[1] )
             and IsCharTable( arg[2] ) )
       or ( Length( arg ) = 3 and not IsRec( arg[3] ) ) then
      Error( "SubgroupFusions( <subtbl>, <tbl> )\n",
             " resp. SubgroupFusions( <subtbl>, <tbl>, <parameters> )" );
    fi;
    
    subtbl:= arg[1];
    tbl:= arg[2];
    
    if Length( arg ) = 3 then
      if IsBound( arg[3].subchars ) then
        subchars:= arg[3].subchars;
        decompose:= false;
      else
        if IsBound( subtbl.irreducibles ) then
          subchars:= subtbl.irreducibles;
          if Length( subchars ) = Length( subtbl.centralizers ) then
            decompose:= true;
          else
            decompose:= false;
          fi;
        else
          subchars:= [];
          decompose:= false;
        fi;
      fi;
      if IsBound( arg[3].chars ) then
        chars:= arg[3].chars;
      else
        if IsBound( tbl.irreducibles ) then
          chars:= tbl.irreducibles;
        else
          chars:= [];
        fi;
      fi;
      if IsBound( arg[3].quick ) and arg[3].quick = true then
        quick:= true;
      else
        quick:= false;
      fi;
      if IsBound( arg[3].decompose ) then
        if arg[3].decompose = true then
          decompose:= true;
        else
          decompose:= false;
        fi;
      fi;
      if IsBound( arg[3].parameters ) and IsRec( arg[3].parameters ) then
        maxamb:= arg[3].parameters.maxamb;
        minamb:= arg[3].parameters.minamb;
        maxlen:= arg[3].parameters.maxlen;
      else
        maxamb:= 200000;
        minamb:= 10000;
        maxlen:= 10;
      fi;
      if IsBound( arg[3].fusionmap ) then
        approxfus:= arg[3].fusionmap;
      else
        approxfus:= [];
      fi;
    else
      decompose:= false;
      if IsBound( subtbl.irreducibles ) then
        subchars:= subtbl.irreducibles;
        if Length( subchars ) = Length( subtbl.centralizers ) then
          decompose:= true;
        fi;
      else
        subchars:= [];
      fi;
      if IsBound( tbl.irreducibles ) then
        chars:= tbl.irreducibles;
      else
        chars:= [];
      fi;
      quick:= false;
      approxfus:= [];
      maxamb:= 200000;
      minamb:= 10000;
      maxlen:= 10;
    fi;
    if Length( arg ) = 3 and IsBound( arg[3].permchar ) then
      permchar:= arg[3].permchar;
      if Length( permchar ) <> Length( tbl.centralizers ) then
        Error( "<permchar> must have same length as <tbl>.centralizers" );
      fi;
    else
      permchar:= [];
    fi;

    # initialize the fusion
    fus:= InitFusion( subtbl, tbl );
    if fus = false then 
      InfoCharTable2( "#E SubgroupFusions: no initialisation possible\n" );
      return [];
    fi;
    InfoCharTable2( "#I SubgroupFusions: fusion initialized\n" );
    
    # use 'approxfus'\:
    for i in [ 1 .. Minimum( Length( approxfus ), Length( fus ) ) ] do
      if IsBound( approxfus[i] ) then
        if IsInt( approxfus[i] ) then
          approxval:= [ approxfus[i] ];
        else
          approxval:= approxfus[i];
        fi;
        if IsInt( fus[i] ) then
          fusval:= [ fus[i] ];
        else
          fusval:= fus[i];
        fi;
        fusval:= Intersection( approxval, fusval );
        if fusval = [] then
          Print( "#I SubgroupFusions: possible maps not compatible with ",
                 "<approxfus> at class ", i, "\n" );
          return [];
        elif Length( fusval ) = 1 then
          fus[i]:= fusval[1];
        else
          fus[i]:= fusval;
        fi;
      fi;
    od;

    # use the permutation character for the first time
    if not CheckPermChar( subtbl, tbl, fus, permchar ) then
      InfoCharTable2( "#E SubgroupFusions:",
                      " inconsistency of fusion and permchar\n" );
      return [];
    fi;
    if permchar <> [] then
      InfoCharTable2("#I SubgroupFusions: permutation character checked\n");
    fi;

    # check consistency of fusion and powermaps
    if not TestConsistencyMaps( subtbl.powermap, fus, tbl.powermap ) then
      InfoCharTable2( "#E SubgroupFusions:",
                      " inconsistency of fusion and powermaps\n" );
      return [];
    fi;
    InfoCharTable2( "#I SubgroupFusions: consistency with powermaps",
                    " checked,\n#I    the actual indeterminateness is ",
                    Indeterminateness( fus ), "\n" );

    # may we return?
    if quick and ForAll( fus, IsInt ) then return [ fus ]; fi;
    
    # consider table automorphisms of the supergroup:
    if   IsBound( tbl.automorphisms ) then
      taut:= tbl.automorphisms;
    elif IsBound( tbl.galomorphisms ) then
      taut:= tbl.galomorphisms;
    else
      taut:= false;
      InfoCharTable2("#I SubgroupFusions: no table automorphisms stored\n");
    fi;

    if taut <> false then
      imp:= ConsiderTableAutomorphisms( fus, taut );
      if InfoCharTable2 <> Ignore then
        Print( "#I SubgroupFusions: table automorphisms checked, " );
        if imp = [] then
          Print( "no improvements\n" );
        else
          Print( "improvements at classes\n#I   ", imp, "\n" );
          if not TestConsistencyMaps(subtbl.powermap,fus,tbl.powermap,imp)
                                                                       then
            InfoCharTable2( "#I SubgroupFusions: inconsistency of",
                            " powermaps and fusion map\n" );
            return [];
          fi;
          InfoCharTable2( "#I SubgroupFusions: consistency with powermaps ",
                          "checked again,\n",
                          "#I    the actual indeterminateness is ",
                          Indeterminateness( fus ), "\n" );
        fi;
      fi;
    fi;

    # use the permutation character for the second time
    if not CheckPermChar( subtbl, tbl, fus, permchar ) then
      InfoCharTable2( "#E SubgroupFusions:",
                      " inconsistency of fusion and permchar\n" );
      return [];
    fi;
    if permchar <> [] then
      InfoCharTable2( "#I SubgroupFusions: permutation character checked",
                      " again\n");
    fi;
    
    if quick and ForAll( fus, IsInt ) then return [ fus ]; fi;
    
    # now use restricted characters:
    # If the parameter \"decompose\" was entered, use decompositions of
    # indirections of <chars> into <subchars>;
    # otherwise only check the scalar products with <subchars>.
    
    if decompose then                      # usage of decompositions allowed
      if Indeterminateness( fus ) < minamb then
        InfoCharTable2( "#I SubgroupFusions: indeterminateness too small",
                        " for test of decomposability\n" );
        poss:= [ fus ];
      else
        InfoCharTable2( "#I SubgroupFusions: now test decomposability of",
                        " rational restrictions\n" );
        poss:= FusionsAllowedByRestrictions( subtbl, tbl,
                      RationalizedMat( subchars ),
                      RationalizedMat( chars ), fus,
                      rec( maxlen:= maxlen,
                           contained:= ContainedCharacters,
                           minamb:= minamb,
                           maxamb:= "infinity",
                           quick:= quick ) );

        poss:= Filtered( poss, x ->
                  TestConsistencyMaps( subtbl.powermap, x, tbl.powermap ) );

        # use the permutation character for the third time
        poss:= Filtered( poss, x -> CheckPermChar(subtbl,tbl,x,permchar) );
    
        if InfoCharTable2 = Print then
          Print( "#I SubgroupFusions: decomposability tested,\n" );
          if Length( poss ) = 1 then
            Print( "#I    1 solution with indeterminateness ",
                   Indeterminateness( poss[1] ), "\n" );
          else
            Print( "#I    ", Length( poss ),
                   " solutions with indeterminateness\n#I    ",
                    List( poss, Indeterminateness ), "\n" );
          fi;
        fi;
      fi;

    else
      InfoCharTable2( "#I SubgroupFusions: no test of decomposability\n" );
      poss:= [ fus ];
    fi;
    
    InfoCharTable2( "#I SubgroupFusions: test scalar products",
                    " of restrictions\n" );
    
    subgroupfusions:= [];
    for fus in poss do
      Append( subgroupfusions,
              FusionsAllowedByRestrictions( subtbl, tbl, subchars, chars,
                        fus, rec( maxlen:= maxlen,
                                  contained:= ContainedPossibleCharacters,
                                  minamb:= 1,
                                  maxamb:= maxamb,
                                  quick:= quick ) ) );
    od;

    #  make orbits under the admissible subgroup of 'tbl.automorphisms'
    #  to get the whole set of all subgroup fusions;
    #  admissible means\:\  If there was an approximation 'fusionmap' in
    #  the argument record, this map must be respected; if the permutation
    #  character 'permchar' was entered, it must be respected, too.

    if   IsBound( tbl.automorphisms ) then
      taut:= tbl.automorphisms;
    elif IsBound( tbl.galomorphisms ) then
      taut:= tbl.galomorphisms;
    else
      taut:= false;
    fi;
    
    if taut <> false then
      if permchar = [] then
        grp:= taut;
      else

        # use the permutation character for the fourth time
        grp:= taut.operations.SubgroupProperty(
                   taut, x->ForAll([1..Length(permchar)],
                                          y->permchar[y]=permchar[y^x]) );
      fi;
      subgroupfusions:= Set( Concatenation( List( subgroupfusions,
                                x->OrbitFusions( Group(()), x, grp ) ) ) );
    fi;

    if approxfus <> [] then
      subgroupfusions:= Filtered( subgroupfusions,
          x -> ForAll( [ 1 .. Length( approxfus ) ],
                 y -> not IsBound( approxfus[y] )
                       or ( IsInt(approxfus[y]) and x[y] =  approxfus[y] )
                       or ( IsList(approxfus[y]) and IsInt( x[y] )
                            and x[y] in approxfus[y] )
                       or ( IsList(approxfus[y]) and IsList( x[y] )
                            and Difference( x[y], approxfus[y] ) = [] )));
    fi;

    if InfoCharTable2 <> Ignore then

      # if possible make orbits under the groups of table automorphisms
      if ForAll( subgroupfusions, x -> ForAll( x, IsInt ) ) then

        if   IsBound( subtbl.automorphisms ) then
          subtaut:= subtbl.automorphisms;
        elif IsBound( subtbl.galomorphisms ) then
          subtaut:= subtbl.galomorphisms;
        else
          subtaut:= Group( () );
        fi;
        if   IsBound( tbl.automorphisms ) then
          taut:= tbl.automorphisms;
        elif IsBound( tbl.galomorphisms ) then
          taut:= tbl.galomorphisms;
        else
          taut:= Group( () );
        fi;
        RepresentativesFusions( subtaut, subgroupfusions, taut );

      fi;

      # print the messages
      if ForAny( subgroupfusions, x -> ForAny( x, IsList ) ) then
        Print( "#I SubgroupFusions: ", Length( subgroupfusions ),
               " parametrized solution" );
        if Length( subgroupfusions ) = 1 then
          Print( ",\n" );
        else
          Print( "s,\n" );
        fi;
        Print( "#I    no further improvement was possible with",
               " given characters\n",
               "#I    and maximal checked ambiguity of ", maxamb, "\n" );
      else
        Print( "#I SubgroupFusions: ", Length( subgroupfusions ),
               " solution" );
        if Length( subgroupfusions ) = 1 then
          Print( "\n" );
        else
          Print( "s\n" );
        fi;
      fi;

    fi;
    return subgroupfusions;
    end;


