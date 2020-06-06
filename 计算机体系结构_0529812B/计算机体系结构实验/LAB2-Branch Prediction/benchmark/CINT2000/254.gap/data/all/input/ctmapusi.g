#############################################################################
##
#A  ctmapusi.g                  GAP library                     Thomas Breuer
##
#A  @(#)$Id: ctmapusi.g,v 3.25 1994/04/21 12:13:56 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains  those  functions  that  mainly  deal  with maps.
##
#H  $Log: ctmapusi.g,v $
#H  Revision 3.25  1994/04/21  12:13:56  sam
#H  introduced 'identtifier' component
#H
#H  Revision 3.24  1994/02/15  17:12:15  sam
#H  allowed induction of class functions to tables
#H
#H  Revision 3.23  1993/10/19  16:51:12  sam
#H  fixed possible absence of 'powermap' component
#H
#H  Revision 3.22  1993/08/18  09:26:51  sam
#H  fixed 'Powmap'
#H
#H  Revision 3.21  1993/07/29  12:09:05  sam
#H  generalized 'Powmap'
#H
#H  Revision 3.20  1993/07/16  07:10:16  sam
#H  improved 'StoreFusion', made 'Restricted' and 'Induced' dispatchers
#H
#H  Revision 3.19  1993/02/11  11:14:58  sam
#H  change in 'Parametrized', due to new string handling
#H
#H  Revision 3.18  1992/07/31  10:28:53  sam
#H  'Indicator' does now work also for Brauer tables
#H
#H  Revision 3.17  1992/07/03  08:00:17  sam
#H  another change in 'StoreFusion'
#H
#H  Revision 3.16  1992/06/17  09:48:19  sam
#H  changed 'StoreFusion'
#H
#H  Revision 3.15  1992/02/06  11:44:48  sam
#H  changed 'GetFusionMap': now fusions between Brauer tables are allowed
#H
#H  Revision 3.14  1992/01/07  15:01:24  sam
#H  removed use of 'Function'
#H
#H  Revision 3.13  1991/12/20  10:08:55  sam
#H  renamed 'Projection' to 'ProjectionMap'
#H
#H  Revision 3.12  1991/12/13  13:15:55  sam
#H  replaced 'IsPrime' by 'IsPrimeInt'
#H
#H  Revision 3.11  1991/12/05  11:53:57  sam
#H  correction concerning fusionsource
#H
#H  Revision 3.10  1991/12/05  08:38:03  sam
#H  changed 'Add' in 'StoreFusion' to 'AddSet'
#H
#H  Revision 3.9  1991/12/04  17:21:58  sam
#H  changed 'CASPER' in header to 'GAP'
#H
#H  Revision 3.8  1991/12/03  09:05:12  sam
#H  functions indented
#H
#H  Revision 3.7  1991/10/24  08:41:51  sam
#H  bug in ElementOrdersPowermap
#H
#H  Revision 3.6  1991/10/10  10:06:44  sam
#H  little bug in 'ElementOrdersPowermap' fixed
#H
#H  Revision 3.5  1991/10/07  15:41:46  sam
#H  changed 'ScalarProduct' to '<tbl>.operations.ScalarProduct'
#H
#H  Revision 3.4  1991/10/07  13:40:11  casper
#H  added function 'ElementOrdersPowermap'
#H
#H  Revision 3.3  1991/10/01  09:37:14  sam
#H  two lines killed
#H
#H  Revision 3.2  1991/10/01  09:19:46  sam
#H  changed 'VERBOSE' to 'InfoCharTable2'
#H
#H  Revision 3.1  1991/09/03  15:11:07  goetz
#H  changed 'reps' to 'orders'.
#H
#H  Revision 3.0  1991/09/03  14:21:39  goetz
#H  Initial Revision.
#H
##


#############################################################################
##
#F  InfoCharTable1( ... ) . . . info function for the character table package
#F  InfoCharTable2( ... ) . . . info function for the character table package
##
    if not IsBound( InfoCharTable1 )  then InfoCharTable1 := Ignore;  fi;
    if not IsBound( InfoCharTable2 )  then InfoCharTable2 := Ignore;  fi;


#############################################################################
##
#F  InverseMap( <paramap> )  . . . . . . . . .  Inverse of a parametrized map
##
##  'InverseMap( <paramap> )[i]' is the unique preimage or the set of all
##  preimages of 'i' under <paramap>, if there are any; otherwise it is unbound.
##
##  We have 'CompositionMaps( <paramap>, InverseMap( <paramap> ) )'
##  the identity map.
##
InverseMap := function( paramap )
    local i, inversemap, im;
    inversemap:= [];
    for i in [ 1 .. Length( paramap ) ] do
      if IsSet( paramap[i] ) then
        for im in paramap[i] do
          if IsBound( inversemap[ im ] ) then
            AddSet( inversemap[ im ], i );
          else
            inversemap[ im ]:= [ i ];
          fi;
        od;
      else
        if IsBound( inversemap[ paramap[i] ] ) then
          AddSet( inversemap[ paramap[i] ], i );
        else
          inversemap[ paramap[i] ]:= [ i ];
        fi;
      fi;
    od;
    for i in [ 1 .. Length( inversemap ) ] do
      if IsBound( inversemap[i] ) and Length( inversemap[i] ) = 1 then
        inversemap[i]:= inversemap[i][1];
      fi;
    od;
    return inversemap;
    end;


#############################################################################
##
#F  CompositionMaps( <paramap2>, <paramap1> )
#F  CompositionMaps( <paramap2>, <paramap1>, <class> )
##
##  'CompositionMaps( <paramap2>, <paramap1> )' is a parametrized map with
##  image 'CompositionMaps( <paramap2>, <paramap1>, <class> )' at position
##  <class>. If '<paramap1>[<class>]' is unique,
##  'CompositionMaps( <paramap2>, <paramap1>, <class> ) =
##  <paramap2>[ <paramap1>[ <class> ] ]', otherwise it is the union of
##  '<paramap2>[i]' for 'i' in '<paramap1>[ <class> ]'.
##
CompositionMaps := function( arg )
    local i, j, k, x, map1, map2, class, result, newelement;

    if Length(arg) = 2 and IsList(arg[1]) and IsList(arg[2]) then

      map2:= arg[1];
      map1:= arg[2];
      result:= [];
      for i in [ 1 .. Length( map1 ) ] do
        if IsBound( map1[i] ) then
          result[i]:= CompositionMaps( map2, map1, i );
        fi;
      od;
      return result;

    elif Length( arg ) = 3
         and IsList( arg[1] ) and IsList( arg[2] ) and IsInt( arg[3] ) then

      map2:= arg[1];
      map1:= arg[2];
      class:= arg[3];
      if IsInt( map1[ class ] ) then
        return map2[ map1[ class ] ];
      else
        result:= [];
        for j in map1[ class ] do

          newelement:= map2[j];
          if IsList( newelement ) and not IsString( newelement ) then
            result:= Union( result, newelement );
          else
            AddSet( result, newelement );
          fi;

        od;
        if Length( result ) = 1 then result:= result[1]; fi;
        return result;
      fi;
    else
      Error(" usage: CompositionMaps( <map2>, <map1>, <class> ) resp.\n",
            "        CompositionMaps( <map2>, <map1> )" );
    fi;
    end;


#############################################################################
##
#F  ProjectionMap( <fusionmap> ) . . projection corresponding to a fusion map
##
##  We have 'CompositionMaps( <fusionmap>,ProjectionMap( <fusionmap> ) )' the
##  identity map, i.e. first projecting and then fusing yields the identity.
##  Note that <fusionmap> must not be a parametrized map.
##
ProjectionMap := function( fusionmap )
    local i, projection;
    projection:= [];
    for i in Reversed( [ 1 .. Length( fusionmap ) ] ) do
      projection[ fusionmap[i] ]:= i;
    od;
    return projection;
    end;


#############################################################################
##
#F  Indeterminateness( <paramap> ) . . . . the indeterminateness of a paramap
##
Indeterminateness := function( paramap )
    return Product( paramap, function(x)
                             if IsList(x) then return Length(x);
                             else return 1; fi; end );
    end;


#############################################################################
##
#F  PrintAmbiguity( <list>, <paramap> ) . . . .  ambiguity of characters with
##                                                       respect to a paramap
##
##  prints for each character in <list> the position, the indeterminateness
##  with respect to <paramap> and the list of ambiguous classes
##
PrintAmbiguity := function( list, paramap )
    local i, j, composition, classes;
    for i in [ 1 .. Length( list ) ] do
      composition:= CompositionMaps( list[i], paramap );
      Print( i, " ", Indeterminateness( composition ), " " );
      classes:= [];
      for j in [ 1 .. Length( composition ) ] do
        if IsList( composition[j] ) then Add( classes, j ); fi;
      od;
      Print( classes, "\n" );
    od;
    end;


#############################################################################
##
#F  Parametrized( <list> )
##
##  returns the smallest parametrized map containing all elements of <list>.
##  These elements may be maps or parametrized maps.
##
Parametrized := function( list )
    local i, j, parametrized;
    if list = [] then return []; fi;
    parametrized:= [];
    for i in [ 1 .. Length( list[1] ) ] do
      if ( IsList( list[1][i] ) and not IsString( list[1][i] ) ) 
         or list[1][i] = [] then
        parametrized[i]:= list[1][i];
      else
        parametrized[i]:= [ list[1][i] ];
      fi;
    od;
    for i in [ 2 .. Length( list ) ] do
      for j in [ 1 .. Length( list[i] ) ] do
        if ( IsList( list[i][j] ) and not IsString( list[i][j] ) ) 
           or list[i][j] = [] then
          parametrized[j]:= Union( parametrized[j], list[i][j] );
        else
          AddSet( parametrized[j], list[i][j] );
        fi;
      od;
    od;
    for i in [ 1 .. Length( list[1] ) ] do
      if Length( parametrized[i] ) = 1 then
        parametrized[i]:= parametrized[i][1];
      fi;
    od;
    return parametrized;
    end;


#############################################################################
##
#F  ContainedMaps( <paramap> )
##
##  returns the set of all contained maps of <paramap>
##
ContainedMaps := function( paramap )
    local i, j, containedmaps, copy;
    i:= 1;
    while i <= Length( paramap ) and
          ( not IsList( paramap[i] ) or IsString( paramap[i] ) ) do
      i:= i+1;
    od;
    if i > Length( paramap ) then
      return [ Copy( paramap ) ];
    else
      containedmaps:= [];
      copy:= ShallowCopy( paramap );
      for j in paramap[i] do
        copy[i]:= j;
        Append( containedmaps, ContainedMaps( copy ) );
      od;
      return containedmaps;
    fi;
    end;


#############################################################################
##
#F  Indirected( <character>, <paramap> )
##
##  'Indirected( <character>, <paramap> )[i]' = <character>[ <paramap>[i] ]',
##  if this value is unique; otherwise it is set undefined.
##  
Indirected := function( character, paramap )
    local i, j, imagelist, indirected;
    indirected:= [];
    for i in [ 1 .. Length( paramap ) ] do
      if IsInt( paramap[i] ) then
        indirected[i]:= character[ paramap[i] ];
      else
        imagelist:= [];
        for j in paramap[i] do AddSet( imagelist, character[j] ); od;
        if Length( imagelist ) = 1 then  #  unique
          indirected[i]:= imagelist[1];
        else
          indirected[i]:= Unknown();
        fi;
      fi;
    od;
    return indirected;
    end;


#############################################################################
##
#F  GetFusionMap( <source>, <destination> )
#F  GetFusionMap( <source>, <destination>, <specification> )
##
##  For ordinary character tables <source> and <destination>,
##  'GetFusionMap( <source>, <destination> )' returns the 'map' field of the
##  fusion stored on the table <source> that has the 'name' field
##  <destination>, and
##  'GetFusionMap( <source>, <destination>, <specification> )' gets that
##  fusion that additionally has the 'specification' field <specification>.
##  Both versions adjust the ordering of classes of <destination> using
##  '<destination>.permutation'.
##
##  If both <source> and <destination> are Brauer tables, i.e., they have
##  a record component 'ordinary' which is the corresponding ordinary
##  table, 'GetFusionMap' returns the fusion map corresponding to that
##  between the ordinary tables.
##
##  If no appropriate fusion could be found, 'false' is returned.
##
GetFusionMap := function( arg )
    local i, fus, name, permutation;
    if Length(arg) < 2 or Length(arg) > 3 
       or not ( IsCharTable( arg[1] ) and IsCharTable( arg[2] ) ) then
      Error("usage: GetFusionMap( <source>, <destination> ) resp.\n",
            "       GetFusionMap( <source>,<destination>,<specification> )");
    fi;

    # fusion between Brauer tables
    if IsBound( arg[1].ordinary ) and IsBound( arg[2].ordinary ) then
      if Length( arg ) = 2 then
        fus:= GetFusionMap( arg[1].ordinary, arg[2].ordinary );
      else
        fus:= GetFusionMap( arg[1].ordinary, arg[2].ordinary, arg[3] );
      fi;
      return
        CompositionMaps( InverseMap(GetFusionMap(arg[2],arg[2].ordinary)),
                      CompositionMaps(fus,
                                    GetFusionMap(arg[1],arg[1].ordinary)) );
    fi;

    # fusion between ordinary tables or from Brauer table in ordinary table
    if not IsBound( arg[1].fusions ) then return false; fi;
    name:= arg[2].identifier;
    if IsBound( arg[2].permutation ) then
      permutation:= arg[2].permutation;
    else
      permutation:= ();
    fi;
    for fus in arg[1].fusions do
      if fus.name = name then
        if Length( arg ) = 2 then
          if IsBound( fus.specification ) then
            Print( "#I GetFusionMap: Used fusion has specification ",
                     fus.specification, "\n");
          fi;
          return List( fus.map, function(x)
                                 if IsInt(x) then return x^permutation;
                                 else return List( x, y -> y^permutation );
                                 fi; end );
        elif arg[3] = fus.specification then
          return List( fus.map, function(x)
                                  if IsInt(x) then return x^permutation;
                                  else return List( x, y -> y^permutation );
                                  fi; end );
        fi;
      fi;
    od;
    return false;
    end;


#############################################################################
##
#F  StoreFusion( <source>, <destination>, <fusion> )
#F  StoreFusion( <source>, <destination>, <fusionmap> )
##
##  The record <fusion> is stored on <source> if no ambiguity arises.
##  The 'map' field of <fusion> is rejusted by '<destination>.permutation'.
##  '<source>.identifier' is added to '<destination>.fusionsource'.
##
##  If a list <fusionmap> is entered, the same holds for
##  '<fusion> = rec( map:= <fusionmap> )'.
##
StoreFusion := function( source, destination, fusion )
    local fus;
    if not ( IsList(fusion) or ( IsRec(fusion) and IsBound(fusion.map) ) )
       then
      Error( "<fusion> must be a list or a record containing at least",
             " <fusion>.map" );
    fi;
    if not IsBound( destination.identifier ) or
       ( IsRec( fusion ) and IsBound( fusion.name ) and
         fusion.name <> destination.identifier ) then
      Error( "<destination> must have a 'identifier' component;\n",
             "this will be equal to <fusion>.name");
    fi;
    if IsList( fusion ) then
      fusion:= rec( name:= destination.identifier, map:= fusion );
    else
      fusion.name:= destination.identifier;
    fi;

    if IsBound( destination.permutation ) then
      fusion.map:= List( fusion.map, x -> x/destination.permutation );
    fi;

    if not IsBound( source.fusions ) then source.fusions:= []; fi;
    if not IsBound( destination.fusionsource ) then
      destination.fusionsource:= [ source.identifier ];
    else
      destination.fusionsource:= Union( destination.fusionsource,
                                        [ source.identifier ] );
    fi;

    for fus in source.fusions do
      if fus.name = fusion.name then

        if fus.name <> "" then

          if fus.map <> fusion.map
             and ( not IsBound(fusion.specification)
               or ( IsBound( fus.specification )
                    and fusion.specification = fus.specification ) ) then

            # fusion to same destination, with different map,
            # not specified
            Error( "fusion to <destination> already stored on <source>;\n",
               " to store another one, assign different specifications",
               " to both fusions" );

          else

            # simply replace the old fusion
            source.fusions[ Position( source.fusions, fus ) ]:= fusion;
            return;

          fi;

        else

          # simply replace the old fusion
          source.fusions[ Position( source.fusions, fus ) ]:= fusion;
          return;

        fi;

      fi;
    od;

    # new fusion
    Add( source.fusions, fusion );
    end;


#############################################################################
##
#F  'ElementOrdersPowermap( <powermap> )'
##
##  returns the list of element orders given by the maps in the powermap
##  <powermap>.
##  The entries at positions where the powermaps do not uniquely determine
##  the element orders are set to an unknown.
##
ElementOrdersPowermap := function( powermap )
    local i, primes, elementorders, nccl, bound, newbound, map, pos;

    if powermap = [] then Error( "no powermaps bound" ); fi;

    primes:= Filtered( [ 1 .. Length( powermap ) ],
                       x -> IsBound( powermap[x] ) );
    nccl:= Length( powermap[ primes[1] ] );

    if InfoCharTable2 <> Ignore then
      for i in primes do
        if ForAny( powermap[i], IsList ) then
          InfoCharTable2( "#I ElementOrdersPowermap: ", Ordinal( i ),
                          " powermap not unique at classes\n",
                          "#I ", Filtered( [ 1 .. nccl ],
                                           x -> IsList( powermap[i][x] ) ),
                          " (ignoring these entries)\n" );
        fi;
      od;
    fi;
     
    elementorders:= [ 1 ];
    bound:= [ 1 ];

    while bound <> [] do
      newbound:= [];
      for i in primes do
        map:= powermap[i];
        for pos in [ 1 .. nccl ] do
          if IsInt( map[ pos ] ) and map[ pos ] in bound
             and IsBound( elementorders[ map[ pos ] ] )
             and not IsBound( elementorders[ pos ] ) then
            elementorders[ pos ]:= i * elementorders[ map[ pos ] ];
            AddSet( newbound, pos );
          fi;
        od;
      od;
      bound:= newbound;
    od;
    for i in [ 1 .. nccl ] do
      if not IsBound( elementorders[i] ) then
        elementorders[i]:= Unknown();
      fi;
    od;
    if InfoCharTable2 = Print and ForAny( elementorders, IsUnknown ) then
      Print( "#I ElementOrdersPowermap: element orders not determined for",
             " classes in\n",
             "#I ", Filtered( [ 1 .. nccl ],
                              x-> IsUnknown( elementorders[x] ) ), "\n" );
    fi;
    return elementorders;
    end;


#############################################################################
##
#F  Restricted( <tbl>, <subtbl>, <chars> )
#F  Restricted( <tbl>, <subtbl>, <chars>, <specification> )
#F  Restricted( <chars>, <fusionmap> )
##
##  returns the indirections of <chars> from <tbl> to <subtbl> by a fusion
##  map.  This map can either be entered directly as <fusionmap>, or it must
##  be stored on the table <subtbl>; in the latter case the value of the
##  'specification' field may be specified.
##
#F  Restricted( <chi>, <H> )
##
##  returns the restriction(s) of the <G>-character(s) <chi> to the subgroup
##  or downward extension <H> of <G>. 
##
Restricted := function( arg )

    if Length( arg ) > 1 then
      if IsList( arg[1] ) then
        if IsList( arg[1][1] ) then
          return List( arg[1], x -> Indirected( x, arg[2] ) );
        fi;
        return arg[1][1].operations.Restricted( arg );
      else
        return arg[1].operations.Restricted( arg );
      fi;
    else
      Error( "first argument must be record with component 'operations'" );
    fi;
    end;


#############################################################################
##
#F  Inflated( <source>, <destination>, <chars> )
#F  Inflated( <source>, <destination>, <chars>, <specification> )
#F  Inflated( <chars>, <fusionmap> )
##
Inflated := Restricted;


#############################################################################
##
#F  Induced( <subtbl>, <tbl>, <chars> )
#F  Induced( <subtbl>, <tbl>, <chars>, <specification> )
#F  Induced( <subtbl>, <tbl>, <chars>, <fusionmap> )
##
##  'Induced' induces <chars> from <subtbl> to <tbl>. The fusion
##  map can either be entered directly as <fusionmap>, or it must be stored
##  on the table <subtbl>; in the latter case the value of the
##  'specification' field may be specified.
##
##  Note that <specification> must not be a list!
##
#F  Induced( <chars>, <G> )
##
##  returns the characters induced to <G> of the <H>-characters <chars>.
##
Induced := function( arg )

    if Length( arg ) < 2 or Length( arg ) > 4
       or not ( ( IsCharTable( arg[1] ) and IsCharTable( arg[2] )
                     and IsList( arg[3] ) ) or
                ( IsList( arg[1] )
                     and ( IsGroup( arg[2] ) or IsCharTable( arg[2] ) ) ) )
      then

      Error("usage: Induced( <subtbl>, <tbl>, <chars> )\n",
           "resp. Induced( <subtbl>, <tbl>, <chars>, <specification> )\n",
           "resp. Induced( <subtbl>, <tbl>, <chars>, <fusionmap> )\n",
           "resp. Induced( <chars>, <G> )" );
    fi;

    if IsList( arg[1] ) then
      if Length( arg[1] ) = 0 then return []; fi;
      return arg[1][1].operations.Induced( arg );
    else
      return arg[1].operations.Induced( arg );
    fi;
    end;


#############################################################################
##
#F  CollapsedMat( <mat>, <maps> )
##
##  returns a record with fields 'mat' and 'fusion'; 
##  the 'fusion' field contains the fusion that collapses the columns of
##  <mat> that are identical also for all maps in the list <maps>, the
##  'mat' field contains the image of <mat> under that fusion.
##
CollapsedMat := function( mat, maps )
    local i, j, k, nontrivblock, nontrivblocks, row, rows, newblocks, values,
            blocks, pos, minima, fusion;
    nontrivblocks:= [ Set( [ 1 .. Length( mat[1] ) ] ) ];
    rows:= Concatenation( maps, mat );
    for row in rows do
      newblocks:= [];
      for nontrivblock in nontrivblocks do
        values:= [];
        blocks:= [];
        for k in nontrivblock do
          pos:= 1;
          while pos <= Length( values ) and values[ pos ] <> row[k] do
            pos:= pos + 1;
          od;
          if pos > Length( values ) then
            values[ pos ]:= row[k];
            blocks[ pos ]:= [ k ];
          else
            AddSet( blocks[ pos ], k );
          fi;
        od;
        for k in blocks do
          if Length( k ) > 1 then Add( newblocks, k ); fi;
        od;
      od;
      nontrivblocks:= newblocks;
    od;
    minima:= List( nontrivblocks, Minimum );
    nontrivblocks:= Permuted( nontrivblocks, Sortex( minima ) );
    minima:= Concatenation( [ 0 ], minima );
    fusion:= [];
    pos:= 1;
    for i in [ 1 .. Length( minima ) - 1 ] do
      for j in [ minima[i] + 1 .. minima[i+1] - 1 ] do
        if not IsBound( fusion[j] ) then
          fusion[j]:= pos;
          pos:= pos + 1;
        fi;
      od;
      for j in nontrivblocks[i] do fusion[j]:= pos; od;
      pos:= pos + 1;
    od;
    for i in [ minima[ Length( minima ) ] + 1 .. Length( mat[1] ) ] do
      if not IsBound( fusion[i] ) then
        fusion[i]:= pos;
        pos:= pos + 1;
      fi;
    od;
    return rec( mat:= Restricted( mat, ProjectionMap( fusion ) ),
                fusion:= fusion );
    end;


#############################################################################
##
#F  Powmap( <tbl>, <n> )
#F  Powmap( <tbl>, <n>, <class> )
#F  Powmap( <powermap>, <n> )
#F  Powmap( <powermap>, <n>, <class> )
##
##  For all valid classes <class>, 'Powmap( <powermap>, <n> )[ <class> ] =
##  Powmap( <powermap>, <n>, <class> )'.
##  'Powmap( <powermap>, <n>, <class> )' is the image of <class> under the
##  <n>-th powermap where this map is calculated from the powermaps of the
##  prime factors of <n> that must be stored in <powermap>.
##
Powmap := function( arg )
    local i, n, powermap, class, nth_powermap, map;
    if arg[1] = []
       or ( IsRec( arg[1] ) and not IsBound( arg[1].powermap ) ) then
      Error( "empty powermap" );
    fi;
    if Length( arg ) = 2 and IsInt( arg[2] ) then

      n:= arg[2];

      if IsList( arg[1] ) then
        powermap:= arg[1];
      elif IsCharTable( arg[1] ) then
        powermap:= arg[1].powermap;
      else
        Error("usage: Powmap(<tbl>,<n>[,<c>]) resp. Powmap(<map>,<n>[,<c>])");
      fi;

      if IsBound( powermap[n] ) then
        return powermap[n];
      else

        if IsList( arg[1] ) then
          nth_powermap:= [ 1 .. Length( powermap[ Length( powermap ) ] ) ];
        else
          nth_powermap:= [ 1 .. Length( arg[1].classes ) ];
        fi;

        for i in Factors( n ) do
          if not IsBound( powermap[i] ) then

            if IsList( arg[1] ) then
              Error( "powermap of prime factor ", i, " not available");
            else
              InfoCharTable2( "#I  Powmap: calling Powermap for prime ",
                              i, "\n" );
              arg[1].powermap[i]:=
                 Parametrized( Powermap( arg[1], i, rec( quick:= true ) ) );
            fi;

          fi;
          map:= powermap[i];
          nth_powermap:= CompositionMaps( map, nth_powermap );
        od;
        return nth_powermap;
      fi;

    elif Length( arg ) = 3 and IsInt( arg[2] ) and IsInt( arg[3] ) then

      n:= arg[2];
      class:= arg[3];
      if n = 1 then return class; fi;

      if IsList( arg[1] ) then
        powermap:= arg[1];
      elif IsCharTable( arg[1] ) then
        powermap:= arg[1].powermap;
      else
        Error("usage: Powmap(<tbl>,<n>[,<c>]) resp. Powmap(<map>,<n>[,<c>])");
      fi;

      if IsBound( powermap[n] ) then
        return powermap[n][ class ];
      else
        nth_powermap:= [ class ];
        for i in Factors( n ) do

          if not IsBound( powermap[i] ) then

            if IsList( arg[1] ) then
              Error( "powermap of prime factor ", i, " not available");
            else
              InfoCharTable2( "#I  Powmap: calling Powermap for prime ",
                              i, "\n" );
              arg[1].powermap[i]:=
                 Parametrized( Powermap( arg[1], i, rec( quick:= true ) ) );
            fi;

          fi;
          map:= powermap[i];
          nth_powermap[1]:= CompositionMaps( map, nth_powermap, 1 );
        od;
        return nth_powermap[1];
      fi;
    else
      Error( "usage: Powmap(powermap,n) resp. Powmap(powermap,n,class)" );
    fi;
    end;


#############################################################################
##
#F  InducedCyclic( <tbl> )
#F  InducedCyclic( <tbl>, \"all\" )
#F  InducedCyclic( <tbl>, <classes> )
#F  InducedCyclic( <tbl>, <classes>, \"all\" )
##
##  'InducedCyclic()' calculates characters induced up from cyclic subgroups
##  of <tbl> to <tbl>. If `"all"` is specified, all irreducible characters
##  of those subgroups are induced, otherwise only the permutation characters
##  are calculated. If a list <classes> is specified, only those cyclic
##  subgroups generated by these classes are considered, otherwise all classes
##  of <tbl> are considered. 'InducedCyclic()' returns a set of characters.
##
InducedCyclic := function( arg )
    local i, j, k, x, fusion, tbl, powermap, orders, inducedcyclic, single,
          approxpowermap, independent, classes, upper;

    if not ( Length( arg ) in [ 1, 2, 3 ] and IsCharTable( arg[1] ) ) or
       ( Length(arg) = 2 and not ( arg[2] = "all" or IsList(arg[2]) ) ) or
       ( Length(arg) = 3 and not ( arg[3] = "all" and IsList(arg[2]) ) ) then
      Error( "usage: InducedCyclic( tbl ) resp.\n",
      "              InducedCyclic( tbl, \"all\" ) resp.\n",
      "              InducedCyclic( tbl, classes ) resp.\n",
      "              InducedCyclic( tbl, classes, \"all\" )");
    fi;
    tbl:= arg[1];
    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;
    powermap:= tbl.powermap;
    orders:= tbl.orders;
    inducedcyclic:= [];
    independent:= [];
    for i in [ 1 .. Length( orders ) ] do independent[i]:= true; od;
    if Length( arg ) = 1 or ( Length( arg ) = 2 and arg[2] = "all" ) then
      classes:= [ 1 .. Length( orders ) ];
    else
      classes:= arg[2];
    fi;
    if classes <> Filtered( classes, x -> IsInt( orders[x] ) ) then
      Print( "#I InducedCyclic: will consider only classes",
             " with unique orders\n" );
      classes:= Filtered( classes, x -> IsInt( orders[x] ) );
    fi;
    if arg[ Length( arg ) ] = "all" then
      upper:= orders;
    else                           # only permutation characters
      upper:= [];
      for i in classes do upper[i]:= 1; od;
    fi;
    # check powermaps:
    for i in [ 1 .. Maximum( CompositionMaps( orders, classes ) ) ] do
      if IsPrimeInt( i ) and not IsBound( powermap[i] ) then
        Print( "#I InducedCyclic: powermap for prime ", i, " not available,\n",
               "#I      calling Powermap( ., ", i,
               ", rec( quick:= true ) )\n" );
        approxpowermap:= Parametrized( Powermap(tbl,i,rec(quick:= true)) );
        if ForAny( approxpowermap, IsSet ) then
          Print( "#I InducedCyclic: powermap for prime ", i,
                 " not determined\n" );
        fi;
        tbl.powermap[i]:= approxpowermap;
        Print( "#I InducedCyclic: ", Ordinal(i),
               " powermap stored on table\n" );
      fi;
    od;
    inducedcyclic:= [];
    for i in classes do                         # induce from i-th class
      if independent[i] then
        fusion:= [ i ];
        for j in [ 2 .. orders[i] ] do
          fusion[j]:= Powmap( powermap, j, i ); # j-th powermap at class i
        od;
        for k in [ 0 .. upper[i] - 1 ] do       # induce k-th character
          single:= [ ];
          for j in [ 1 .. Length( orders ) ] do single[j]:= 0; od;
          single[i]:= E( orders[i] ) ^ ( k );
          for j in [ 2 .. orders[i] ] do
            if IsInt( fusion[j] ) then
              if orders[ fusion[j] ] = orders[i] then

                # pos. is galois conj. class
                independent[ fusion[j] ]:= false;
              fi;
              single[ fusion[j] ]:=
                  single[ fusion[j] ] + E( orders[i] )^( k*j mod orders[i] );
            else
              for x in fusion[j] do single[x]:= Unknown(); od;
            fi;
          od;
          for j in [ 1 .. Length( orders ) ] do
            single[j]:= single[j] * tbl.centralizers[j] / orders[i];
            if not IsCycInt( single[j] ) then
              single[j]:= Unknown();
              Print( "#I InducedCyclic: subgroup order not dividing sum",
                     " (induce from class ", i, ")\n" );
            fi;
          od;
          AddSet( inducedcyclic, single );
        od;
      fi;
    od;
    return inducedcyclic;
    end;


#############################################################################
##
#F  Power( <powermap>, <characters>, <n> )
##
##  the indirections of <characters> by the <n>-th powermap; this map is
##  calculated from the powermap of the prime divisors of <n>.
##
Power := function( powermap, characters, n )
    local character, nth_powermap, power;
    power:= [];
    nth_powermap:= Powmap( powermap, n );
    for character in characters do
      Add( power, Indirected( character, nth_powermap ) );
    od;
    return power;
    end;


#############################################################################
##
#F  Indicator( <tbl>, <n> )
#F  Indicator( <tbl>, <characters>, <n> )
#F  Indicator( <modtbl>, 2 )
##
##  the list of <n>-th Frobenius-Schur indicators of <characters>
##  or <tbl>.irreducibles, for Brauer tables in characteristic $\not= 2$
##  the second indicator
##
Indicator := function( arg )
    local i, j, tbl, characters, n, indicator, principal, powers, power,
          ordindicator, chi, fus, odd;
    if not ( Length( arg ) in [ 2, 3 ] and IsCharTable( arg[1] )
             and IsInt( arg[ Length( arg ) ] ) )
       or ( Length( arg ) = 3 and not IsList( arg[2] ) ) then
      Error( "usage: Indicator( <tbl>, <n> )\n",
             " resp. Indicator( <tbl>, <characters>, <n> )" );
    fi;
    tbl:= arg[1];
    n:= arg[ Length( arg ) ];
    if Length( arg ) = 2 then
      characters:= tbl.irreducibles;
    else
      characters:= arg[2];
    fi;
    indicator:= [];
    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;
    if IsBound( tbl.prime ) then

      # Brauer table
      if Length( arg ) <> 2 or n <> 2 then
        Error("for Brauer table <tbl> only for irreducibles and <n> = 2");
      fi;
      if tbl.prime = 2 then
        Error( "for Brauer table <tbl> not for characteristic 2" );
      fi;

      # compute indicators block by block
      ordindicator:= Indicator( tbl.ordinary, tbl.ordinary.irreducibles, 2 );
      fus:= GetFusionMap( tbl, tbl.ordinary );
      for i in tbl.blocks do
        if not IsBound( i.decmat ) then
          i.decmat:= Decomposition( Sublist( tbl.irreducibles, i.modchars ),
                           List( Sublist( tbl.ordinary.irreducibles,
                                          i.ordchars ),
                                 x -> Sublist( x, fus ) ), "nonnegative" );
        fi;
        for j in [ 1 .. Length( i.modchars ) ] do
          chi:= tbl.irreducibles[ i.modchars[j] ];
          if ForAny( chi, x -> not IsInt(x) and GaloisCyc(x,-1) <> x ) then

            # indicator of a Brauer character is 0 iff it has
            # at least one nonreal value
            indicator[ i.modchars[j] ]:= 0;

          else

            # indicator is equal to the indicator of any real ordinary
            # character containing it as constituent, with odd multiplicity
            odd:= Filtered( [ 1 .. Length( i.decmat ) ],
                            x -> i.decmat[x][j] mod 2 <> 0 );
            odd:= List( odd, x -> ordindicator[ i.ordchars[x] ] );
            indicator[ i.modchars[j] ]:= First( odd, x -> x <> 0 );

          fi;
        od;
      od;

    else

      # ordinary table
      principal:= List( tbl.centralizers, x -> 1 );
      powers:= Power( tbl.powermap, characters, n );
      for power in powers do
        Add( indicator,
             tbl.operations.ScalarProduct( tbl, power, principal ) );
      od;

      if Length( arg ) = 3 then return indicator; fi;

    fi;

    # write indicator to the table
    if not IsBound( tbl.irredinfo ) then tbl.irredinfo:= []; fi;
    for i in [ 1 .. Length( characters ) ] do
      if not IsBound( tbl.irredinfo[i] ) then
        tbl.irredinfo[i]:= rec( indicator:= [] );
      elif not IsBound( tbl.irredinfo[i].indicator ) then
        tbl.irredinfo[i].indicator:= [];
      fi;
      tbl.irredinfo[i].indicator[n]:= indicator[i];
    od;
    InfoCharTable2( "#I Indicator: ", Ordinal( n ),
                    " indicator written to the table\n" );

    return indicator;
    end;


