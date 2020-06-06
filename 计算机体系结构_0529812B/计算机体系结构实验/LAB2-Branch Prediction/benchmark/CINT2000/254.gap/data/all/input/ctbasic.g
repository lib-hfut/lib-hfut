#############################################################################
##
#A  ctbasic.g                   GAP library                     Thomas Breuer
#A                                                           & Goetz Pfeiffer
##
#A  @(#)$Id: ctbasic.g,v 3.54.1.1 1994/09/02 14:51:30 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains basic functions for dealing with characters in GAP.
##
#H  $Log: ctbasic.g,v $
#H  Revision 3.54.1.1  1994/09/02  14:51:30  sam
#H  fixed bug in 'DisplayCharTable'
#H
#H  Revision 3.54  1994/06/30  17:41:59  sam
#H  added VERY bad hack in 'IsCharTable' (mainly because of CHEVIE)
#H
#H  Revision 3.53  1994/06/03  11:43:08  sam
#H  fixed name printing in 'DisplayCharTable'
#H
#H  Revision 3.52  1994/04/21  12:16:10  sam
#H  introduced 'identifier' component
#H
#H  Revision 3.51  1994/03/29  10:01:45  sam
#H  moved 'CharTableOps' to 'chartabl.g',
#H  minor other changes
#H
#H  Revision 3.50  1993/11/10  09:08:25  sam
#H  fixed another small bug in 'DisplayCharTable'
#H
#H  Revision 3.49  1993/11/08  18:12:17  sam
#H  fixed little bug
#H
#H  Revision 3.48  1993/11/08  17:59:11  sam
#H  changed 'DisplayCharTable' to accept user defined 'stringEntry' function
#H
#H  Revision 3.47  1993/11/02  09:49:45  sam
#H  added function 'CharTableOps.NoMessageScalarProduct'
#H
#H  Revision 3.46  1993/10/19  17:10:29  sam
#H  fixed possible absence of 'powermap' component
#H
#H  Revision 3.45  1993/08/12  07:18:10  sam
#H  fixed 'DisplayCharTable' for empty character list
#H
#H  Revision 3.44  1993/07/28  07:34:26  sam
#H  fixed 'PrintToCAS', added 'CharTableOps.Display'
#H
#H  Revision 3.43  1993/07/27  13:28:20  sam
#H  fixed 'DisplayCharTable'
#H
#H  Revision 3.42  1993/07/12  14:17:06  sam
#H  fixed column widths in 'DisplayCharTable'
#H
#H  Revision 3.41  1993/06/28  07:37:00  sam
#H  fixed 'ClassNamesCharTable'
#H
#H  Revision 3.40  1993/06/22  12:39:56  sam
#H  changed 'Induced', 'Restricted' to be dispatchers;
#H  added these functions to 'CharTableOps'
#H
#H  Revision 3.39  1993/05/10  09:37:36  goetz
#H  fixed bug in 'SortCharactersCharTable'.
#H
#H  Revision 3.38  1993/05/05  13:57:00  sam
#H  'DisplayCharTable' now accepts also tables without '.powermap'
#H
#H  Revision 3.37  1993/04/23  10:10:58  sam
#H  fixed byg in 'CharTable'
#H
#H  Revision 3.36  1993/02/11  18:16:33  sam
#H  changes in 'SortCharactersCharTable' (due to new string handling)
#H
#H  Revision 3.35  1993/02/11  15:23:55  sam
#H  changes in 'CharTableOps', 'BrauerTableOps'
#H
#H  Revision 3.34  1993/02/11  11:06:16  sam
#H  change in 'BrauerTableOps'
#H
#H  Revision 3.33  1993/02/09  08:57:02  sam
#H  changed 'ScalarProduct' to be a dispatcher only
#H
#H  Revision 3.32  1992/12/23  16:41:06  sam
#H  fixed bug in DisplayCharTable, due to changes in the kernel of GAP
#H
#H  Revision 3.31  1992/09/07  07:17:35  sam
#H  bug in 'CharTable' fixed
#H
#H  Revision 3.30  1992/08/10  15:46:25  sam
#H  added dispatcher 'CharTable'
#H
#H  Revision 3.29  1992/07/01  16:39:29  sam
#H  added function 'SortCharTable'
#H
#H  Revision 3.28  1992/06/16  15:16:14  sam
#H  recorrected 'DisplayCharTable'
#H
#H  Revision 3.27  1992/06/16  12:14:47  goetz
#H  corrected 'DisplayCharTable'.
#H
#H  Revision 3.25  1992/06/01  13:38:03  goetz
#H  changed 'DisplayCharTable' to print more types of data.
#H
#H  Revision 3.24  1992/05/30  14:30:23  sam
#H  now 'tbl.group.conjugacyClasses' are sorted by 'SortClassesCharTable'
#H
#H  Revision 3.23  1992/04/03  17:45:36  martin
#H  changed the author line
#H
#H  Revision 3.22  1992/04/02  16:57:44  martin
#H  replaced 'Linelength' by 'ScreenSize'
#H
#H  Revision 3.21  1992/03/10  17:19:59  goetz
#H  changed return format of 'NrPolyhedralSubgroups'.
#H
#H  Revision 3.20  1992/03/03  14:05:30  sam
#H  added 'ClassStructureCharTable'
#H
#H  Revision 3.19  1992/01/07  15:22:07  sam
#H  removed use of 'RecField', 'SetRecField'
#H
#H  Revision 3.18  1992/01/07  15:10:56  sam
#H  changed 'SortClassesCharTable' for case of permutation ()
#H
#H  Revision 3.17  1991/12/20  10:10:13  sam
#H  renamed 'Kernel' to 'KernelChar'
#H
#H  Revision 3.16  1991/12/19  16:23:08  sam
#H  stylistic changes in 'TestCharTable'
#H
#H  Revision 3.15  1991/12/07  16:29:29  sam
#H  changed 'BrauerTableOps.Print' for field 'ordinary'
#H
#H  Revision 3.14  1991/12/04  17:18:04  sam
#H  changed 'CASPER' in header to 'GAP'
#H
#H  Revision 3.13  1991/12/04  13:49:15  martin
#H  added a single <space>
#H
#H  Revision 3.12  1991/12/03  16:32:41  sam
#H  correction concerning table automorphisms
#H
#H  Revision 3.11  1991/12/03  08:35:59  sam
#H  now 'automorphisms' is a group, not a list
#H
#H  Revision 3.10  1991/12/03  08:30:47  sam
#H  deleted 'Ordinal', 'Sortex', 'Permuted',
#H  removed history,
#H  changed 'tableautomorphisms' to 'automorphisms',
#H  indented functions
#H
#H  Revision 3.9  1991/11/14  18:13:47  sam
#H  changed 'CoeffsCyc' to 'COEFFSCYC',
#H  added ' ' in 'CharTableOps.Print'
#H
#H  Revision 3.8  1991/11/06  16:32:27  sam
#H  added 'Print' to 'CharTableOps'
#H
#H  Revision 3.7  1991/10/18  15:53:46  sam
#H  'Position' returns 'false' not '0' ...
#H
#H  Revision 3.6  1991/10/08  08:13:01  sam
#H  added 'CharTableOps'
#H
#H  Revision 3.5  1991/10/07  15:29:26  sam
#H  changed 'ScalarProduct' to '<tbl>.operations.ScalarProduct'
#H
#H  Revision 3.4  1991/10/07  15:21:42  sam
#H  changed 'TestCharTable' (now uses 'ElementOrdersPowermap')
#H
#H  Revision 3.3  1991/10/01  14:24:24  casper
#H  changed 'Gcd' to 'GcdInt'
#H
#H  Revision 3.2  1991/09/05  14:48:16  sam
#H  changed 'Quo' to 'QuoInt', 'Abs' to 'AbsInt'
#H
#H  Revision 3.1  1991/09/03  13:08:07  goetz
#H  changed 'reps' to 'orders'.
#H
#H  Revision 3.0  1991/09/03  12:58:37  casper
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
#F  IsCharTable( <obj> )  . . . . . . . . . .  is an object a character table
##
IsCharTable := function( obj )

#T bad hack until the 'name' and 'order' components disappear.
#T The argument is that something that claims to be a character table
#T should not fail in programs that expect character tables ...

    if IsRec( obj ) and IsBound( obj.centralizers ) then
      if IsBound( obj.name ) and not IsBound( obj.identifier ) then
        obj.identifier:= obj.name;
      fi;
      if IsBound( obj.order ) and not IsBound( obj.size ) then
        obj.size:= obj.order;
      fi;
      return IsBound( obj.identifier );
    else
      return false;
    fi;
#     return     IsRec( obj )
#            and IsBound( obj.centralizers )
#            and IsBound( obj.identifier );
    end;

#############################################################################
##
#F  InitClassesCharTable( <tbl> )  . . initialize classes of character tables
##
InitClassesCharTable := function( tbl )
    local x, order, initclasses;
    if not IsInt( tbl.centralizers[1] ) then return; fi; # generic tables
    order:= tbl.centralizers[1];
    initclasses:= List( tbl.centralizers, x -> order / x );
    if not ForAll( initclasses, IsInt ) then
      Print( "#E InitClassesCharTable: not all centralizer orders divide",
             " the group order\n" );
    fi;
    tbl.classes:= initclasses;
    return initclasses;
    end;


#############################################################################
##
#F  InverseClassesCharTable( <tbl> )
##
##  returns the list mapping each class of the character table <tbl> to its
##  inverse class (can be regarded as (-1)-th powermap).
##
##  computed from characters stored in <tbl>.irreducibles
##
InverseClassesCharTable := function( tbl )
    local i, elm, isinverse, inv, isinv, irreds, candidates, remain;

    inv:= [ 1 ];             # The inverse of the identity is the identity.
    if not IsBound( tbl.irreducibles ) or tbl.irreducibles = [] then
      Print( "#E InverseClassesCharTable: no irreducibles stored\n" );
      return List( [ 1 .. Length( tbl.centralizers ) ], x -> Unknown() );
    fi;
    irreds:= tbl.irreducibles;

    isinverse:= function( i, elm )         # is 'elm' the inverse of 'i' ?
    local k;
    for k in [ 1 .. Length( irreds ) ] do
      if IsUnknown( irreds[k][elm] ) then
        return Unknown();
      elif irreds[k][i] <> GaloisCyc( irreds[k][elm], -1 ) then
        return false;
      fi;
    od;
    return true;
    end;

    remain:= [ 2 .. Length( irreds[1] ) ];
    for i in [ 2 .. Length( irreds[1] ) ] do
      if not IsBound( inv[i] ) then
        candidates:= [];
        for elm in remain do
          isinv:= isinverse( i, elm );
          if isinv = true then
            AddSet( candidates, elm );
          elif IsUnknown( isinv ) then
            inv[i]:= Unknown();
          fi;
        od;
        if not IsBound( inv[i] ) then
          if Length( candidates ) = 1 then
            inv[ candidates[1] ]:= i;
            inv[ i ]:= candidates[1];
            remain:= Difference( remain, Set( [ i, inv[i] ] ) );
          else
            inv[i]:= candidates;
          fi;
        fi;
      fi;
    od;
    return inv;
    end;


#############################################################################
##
#F  PrintToCAS( <tbl>, <filename> )
#F  PrintToCAS( <filename>, <tbl> )
##
##  prints a CAS library tbl of the GAP table <tbl> to the file
##  <filename> with linelength 'SizeScreen()[1]'
##
PrintToCAS := function( filename, tbl )
    local funct, ll;
    if IsString( tbl ) and IsRec( filename ) then   # allow other succession
      ll:= tbl;
      tbl:= filename;
      filename:= ll;
    fi;
    ll:= SizeScreen()[1];
    
    funct:= function( tbl )
    local i, j, strin, convertcyclotom, convertrow, column, fus;
    if IsBound( tbl.identifier ) then                 # name
      Print( "'", tbl.identifier, "'\n" );
    else
      Print( "'NN'\n" );
    fi;
    Print( "00/00/00. 00.00.00.\n" );                 # date
    if IsBound( tbl.centralizers ) then               # nccl, cvw, ctw
      Print( "(", String( Length( tbl.centralizers ) ), ","
                , String( Length( tbl.centralizers ) ), ",0," );
    else
      Print( "(0,0,0," );
    fi;
    if IsBound( tbl.irreducibles ) then               # max
      Print( String( Length( tbl.irreducibles ) ), "," );
      if Length( tbl.irreducibles ) = Length( Set( tbl.irreducibles ) ) then
        Print( "-1," );                               # link
      else
        Print( "0," );                                # link
      fi;
    fi;
    Print( "0)\n" );                                  # tilt
    if IsBound( tbl.text ) then                       # text
      Print( "text:\n(#", tbl.text, "#),\n" );
    fi;
    if IsBound( tbl.order ) then                      # order
      Print( "order=", String( tbl.order ) );
    fi;
    #
    convertcyclotom:= function( cyc )
    local i, str, coeffs;
    coeffs:= COEFFSCYC( cyc );
    str:= ConcatenationString( "\n<w", String( Length( coeffs ) ), "," );
    if coeffs[1] <> 0 then
      str:= ConcatenationString( str, String( coeffs[1] ) );
    fi;
    i:= 2;
    while i <= Length( coeffs ) do
      if LengthString( str ) + LengthString( String( coeffs[i] ) )
                             + LengthString( String( i-1 ) ) + 4 >= ll then
        Print( str, "\n" );
        str:= "";
      fi;
      if coeffs[i] < 0 then
        str:= ConcatenationString( str, "-" );
        if coeffs[i] <> -1 then
          str:= ConcatenationString( str, String( -coeffs[i] ) );
        fi;
        str:= ConcatenationString( str, "w", String( i-1 ) );
      elif coeffs[i] > 0 then
        str:= ConcatenationString( str, "+" );
        if coeffs[i] <> 1 then
          str:= ConcatenationString( str, String( coeffs[i] ) );
        fi;
        str:= ConcatenationString( str, "w", String( i-1 ) );
      fi;
      i:= i+1;
    od;
    Print( str, "\n>\n" );
    end;
    #    
    convertrow:= function( list )
    local i, str;
    if IsCycInt( list[1] ) and not IsInt( list[1] ) then
      convertcyclotom( list[1] );
      str:= "";
    elif IsUnknown( list[1] ) or IsList( list[1] ) then
      str:= "?";
    else
      str:= String( list[1] );
    fi;
    i:= 2;
    while i <= Length( list ) do
      if IsCycInt( list[i] ) and not IsInt( list[i] ) then
        Print( str, "," );
        convertcyclotom( list[i] );
        str:= "";
      elif IsUnknown( list[i] ) or IsList( list[i] ) then
        if LengthString( str ) + 4 < ll then
          str:= ConcatenationString( str, ",?" );
        else
          Print( str, ",?\n" );
          str:= "";
        fi;
      else
        if LengthString(str) + LengthString( String(list[i]) ) + 5 < ll then
          str:= ConcatenationString( str, ",", String( list[i] ) );
        else
          Print( str, ",\n" );
          str:= String( list[i] );
        fi;
      fi;
      i:= i+1;
    od;
    Print( str, "\n" );
    end;
    #
    if IsBound( tbl.centralizers ) then                 # centralizers
      Print( ",\ncentralizers:(\n" );
      convertrow( tbl.centralizers );
      Print( ")" );
    fi;
    if IsBound( tbl.orders ) then                       # orders
      Print( ",\nreps:(\n" );
      convertrow( tbl.orders );
      Print( ")" );
    fi;
    if IsBound( tbl.print ) then                        # print
      Print( ",\nprint:(\n" );
      convertrow( tbl.print );
      Print( ")" );
    fi;
    if IsBound( tbl.powermap ) then                     # powermaps
      for i in [ 1 .. Length( tbl.powermap ) ] do
        if IsBound( tbl.powermap[i] ) then
          Print( ",\npowermap:", String(i), "(\n" );
          convertrow( tbl.powermap[i] );
          Print( ")" );
        fi;
      od;
    fi;
    if IsBound( tbl.classtext ) then                    # classtext
                                                        # (partitions)
      Print(",\nclasstext:'part'\n($[" );
      convertrow( tbl.classtext[1] );
      Print( "]$" );
      for i in [ 2 .. Length( tbl.classtext ) ] do
        Print( "\n,$[" );
        convertrow( tbl.classtext[i] );
        Print( "]$" );
      od;
      Print( ")" );
    fi;
    if IsBound( tbl.fusions ) then                      # fusions
      for fus in tbl.fusions do
        if IsBound( fus.type ) then
          if fus.type = "normal" then
            Print( ",\nnormal subgroup " );
          elif fus.type = "factor" then
            Print( ",\nfactor " );
          else
            Print( ",\n" );
          fi;
        else
          Print( ",\n" );
        fi;
        Print( "fusion:'", fus.name, "'(\n" );
        convertrow( fus.map );
        Print( ")" );
      od;
    fi;
    if IsBound( tbl.characters ) then                  # characters ...
      Print( ",\ncharacters:" );
      for i in tbl.characters do
        Print( "\n(" );
        convertrow( i );
        Print( ",0:0)" );
      od;
    elif IsBound( tbl.irreducibles ) then              # ... or irreducibles
      Print( ",\ncharacters:" );
      for i in tbl.irreducibles do
        Print( "\n(" );
        convertrow( i );
        Print( ",0:0)" );
      od;
    fi;
    if IsBound( tbl.irredinfo ) then                   # indicators and blocks
      if IsBound( tbl.irredinfo[1].block ) then
        for i in [ 2 .. Length( tbl.irredinfo[1].block ) ] do
          if IsBound( tbl.irredinfo[1].block[i] ) then
            column:= [];
            for j in [ 1 .. Length( tbl.irreducibles ) ] do
              column[j]:= tbl.irredinfo[j].block[i];
            od;
            Print( ",\nblocks:", String( i ), "(\n" );
            convertrow( column );
            Print( ")" );
          fi;
        od;
      fi;
      if IsBound( tbl.irredinfo[1].indicator ) then
        for i in [ 2 .. Length( tbl.irredinfo[1].indicator ) ] do
          if IsBound( tbl.irredinfo[1].indicator[i] ) then
            column:= [];
            for j in [ 1 .. Length( tbl.irreducibles ) ] do
              column[j]:= tbl.irredinfo[j].indicator[i];
            od;
            Print( ",\nindicator:", String( i ), "(\n" );
            convertrow( column );
            Print( ")" );
          fi;
        od;
      fi;
    fi;
    if ll > 27 then
      Print( ";\n/// converted from GAP" );
    else
      Print( ";\n///" );
    fi;
    return "\n";
    end;
    PrintTo( filename, funct( tbl ) );
    end;


#############################################################################
##
#F  TestCharTable( <tbl> )
##
##  checks consistency of informations in the head of the character table
##  <tbl>, checks if the first orthogonality relation is satisfied.
##
TestCharTable := function( tbl )
    local i, j, k, x, flag, order, nccl, classes, centralizers, powermap,
          characters, map, row, sum;
    if not IsCharTable( tbl ) then
      Print( "#E TestCharTable: object is not a character table,",
             " no tests\n" );
      return false;
    fi;
    flag:= true;
    centralizers:= tbl.centralizers;
    if IsBound( tbl.order ) then
      order:= tbl.order;
    else
      order:= centralizers[1];
    fi;
    if centralizers[1] <> order then
      Print( "#E TestCharTable(", tbl.identifier,
             "): centralizer of identity not equal to group order\n" );
      flag:= false;
    fi;
    nccl:= Length( centralizers );
    if not ( IsBound( tbl.classes ) and IsList( tbl.classes ) ) then
      classes:= List( tbl.centralizers, x-> order / x );
    else
      classes:= tbl.classes;
    fi;
    if Sum( classes ) <> order then
      Print( "#E TestCharTable(", tbl.identifier,
             "): sum of classlengths not equal to group order\n" );
      flag:= false;
    fi;
    if Length( classes ) <> nccl then
      Print( "#E TestCharTable(", tbl.identifier,
             "): number of conjugacy classes not unique\n" );
      flag:= false;
    fi;
    if ForAny( [ 1..nccl ], i -> classes[i]*centralizers[i] <> order ) then
      Print( "#E TestCharTable(", tbl.identifier,
             "): classlengths and centralizer orders inconsistent\n" );
      flag:= false;
    fi;
    if IsBound( tbl.orders ) then
      if nccl <> Length( tbl.orders ) then
        Print( "#E TestCharTable(", tbl.identifier,
               "): number of conjugacy classes not unique\n" );
        flag:= false;
      else
        for i in [ 1 .. Length( tbl.orders ) ] do
          if not ( ( IsInt( tbl.orders[i] )
                     and tbl.centralizers[i] mod tbl.orders[i] = 0 ) or
                   ( IsSet( tbl.orders[i] )
                     and Set( List( tbl.orders[i],
                          x-> tbl.centralizers[i] mod x ) ) = [ 0 ] ) ) then
            Print( "#E TestCharTable(", tbl.identifier,
                   "): not all representative orders divide the\n",
                   "#E   corresponding centralizer order\n" );
            flag:= false;
          fi;
        od;
      fi;
    fi;
    if IsBound( tbl.powermap ) then
      for map in Set( tbl.powermap ) do
        if nccl <> Length( map ) then
          Print( "#E TestCharTable(", tbl.identifier,
                 "): number of conjugacy classes not unique\n" );
          flag:= false;
        fi;
      od;

      # if all powermaps are stored, check if they are consistent with
      # the representative orders

      if IsBound( tbl.orders ) and
         ForAll( Set( FactorsInt( order ) ),
                 x -> IsBound( tbl.powermap[x] ) ) and
         tbl.orders <> ElementOrdersPowermap( tbl.powermap ) then
        flag:= false;
        Print( "#E TestCharTable(", tbl.identifier,
               "): representative orders and powermaps inconsistent\n" );
      fi;
    fi;
    if IsBound( tbl.classnames ) then
      for k in [ 1 .. nccl ] do
        if tbl.( tbl.classnames[k] ) <> k then
          Print( "#E TestCharTable(", tbl.identifier,
                 "): classnames inconsistent for class", k, "\n" );
          flag:= false;
        fi;
      od;
    fi;
    if IsBound( tbl.irreducibles ) then
      if flag = false then
        Print("#E TestCharTable: corrupt table, no test of orthogonality\n");
        return false;
      fi;
      characters:= tbl.irreducibles;
      for i in [ 1 .. Length( characters ) ] do
        row:= [];
        for j in [ 1 .. Length( characters[i] ) ] do
          row[j]:= GaloisCyc( characters[i][j], -1 ) * classes[j];
        od;
        for j in [ 1 .. i ] do
          sum:= row * characters[j];
          if ( i = j and sum <> order ) or ( i <> j and sum <> 0 ) then
            flag:= false;
            Print( "#E TestCharTable(", tbl.identifier,
                   "): Scpr( ., X[", i, "], X[", j, "] ) = ",
                   sum / order, "\n" );
          fi;
        od;
      od;
      if centralizers <> Sum( characters,
                              x -> List( x, y -> y * GaloisCyc(y,-1) ) ) then
        flag:= false;
        Print( "#E TestCharTable(", tbl.identifier,
               "): centralizer orders inconsistent with irreducibles\n" );
      fi;
      if IsBound(tbl.irredinfo) and IsBound(tbl.irredinfo[1].indicator) then
        for i in [ 2 .. Length( tbl.irredinfo[1].indicator ) ] do
          if IsBound( tbl.irredinfo[1].indicator[i] ) then
            if List( tbl.irredinfo, x -> x.indicator[i] )
               <> Indicator( tbl, tbl.irreducibles, i ) then
              Print( "#E TestCharTable(", tbl.identifier,
                     "): ", Ordinal( i ), " indicator not correct\n" );
              flag:= false;
            fi;
          fi;
        od;
      fi;
    fi;
    return flag;
    end;


#############################################################################
##
#F  ClassNamesCharTable( <tbl> ) . . . . . . class names of a character table
##
##  computes  names  for the classes of  the character table <tbl> as strings
##  consisting of the order of an element of the class and and least one
##  distinguishing letter.
##
##  The list of these names at the same time the returned value of this
##  function and stored in '<tbl>.classnames'.
##  
##  Moreover for each class a record component with its name is constructed,
##  containing the position of this name in the list 'classnames' as its
##  value.
##
##  If '<tbl>.classnames' is unbound, 'ClassNamesCharTable' is automatically
##  called by  'DisplayCharTable' (see "DisplayCharTable").
##
##  Note that once the class names are computed the resulting record
##  components are stored on <tbl>. They are not deleted by another call of
##  'ClassNamesCharTable'.
##
ClassNamesCharTable := function( tbl )

    local i,        # loop variable
          alpha,    # alphabet
          lalpha,   # length of the alphabet
          number,   # at position <i> the current number of
                    # classes of order <i>
          names,    # list of classnames, result
          name;     # local function returning right combination of letters

    if IsBound( tbl.classnames ) then
      return tbl.classnames;
    fi;

    alpha:= ["a","b","c","d","e","f","g","h","i","j","k","l",
             "m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
    lalpha:= Length( alpha );

    name:= function(n)
       local name;

       name:= "";
       while n > 0 do
          name:= ConcatenationString( alpha[ (n-1) mod lalpha + 1 ], name);
          n:= QuoInt( n-1, lalpha );
       od;
       return name;
    end;

    names:= [];

    if IsBound( tbl.orders ) then

      number:= [];
      for i in [ 1 .. Length( tbl.classes ) ] do
        if not IsBound( number[ tbl.orders[i] ] ) then
          number[ tbl.orders[i] ]:= 1;
        fi;
        names[i]:= ConcatenationString( String( tbl.orders[i] ),
                                        name( number[ tbl.orders[i] ] ) );
        number[ tbl.orders[i] ]:= number[ tbl.orders[i] ] + 1;
      od;

    else

      names[1]:= ConcatenationString( "1", alpha[1] );
      for i in [ 2 .. Length( tbl.classes ) ] do
        names[i]:= ConcatenationString( "?", name( i-1 ) );
      od;

    fi;

    # store result on character table
    tbl.classnames:= names;
    for i in [ 1 .. Length( names ) ] do
      tbl.( names[i] ):= i;
    od;

    # return the list of classnames
    return names;

    end;


#############################################################################
##
#F  CharTable( <group> )
##
##  returns '<group>.operations.CharTable( <group> )' resp.
##  '<group>.charTable' if one of these components exists.
##
#F  CharTable( <tblname> )
#F  CharTable( <series>, <parameters> )
##
##  return the value of 'CharTableLibrary' with the same argument(s).
##
CharTable := function( arg )

    if Length(arg) < 1 or not
         ( IsString(arg[1]) or IsGroup(arg[1]) or IsCharTable(arg[1]) ) then
      Error( "usage: CharTable( <grp> ) resp. CharTable( <tblname> )\n",
             "         resp. CharTable( <series>, <parameters> )" );
    fi;

    if   IsCharTable( arg[1] ) then

      return arg[1];

    elif IsGroup( arg[1] ) then

      if IsBound( arg[1].charTable ) then
        return arg[1].charTable;
      elif IsBound( arg[1].operations.CharTable ) then
        arg[1].charTable:= arg[1].operations.CharTable( arg[1] );
        return arg[1].charTable;
      else
        Error( "Sorry, I don't know how to ",
               "construct the table of <grp>\n");
      fi;

    else

      return CharTableLibrary( arg );

    fi;
    end;

#############################################################################
##
#F  DisplayCharTable( <tbl> [, <arec> ] )
##
DisplayCharTable := function( arg )
    local i, j,          # loop variables
          tbl,           # character table
          chars,         # list of characters
          cnr,           # list of character numbers
          cletter,       # character name
          classes,       # list of classes
          powermap,      # list of primes
          centralizers,  # boolean
          cen,           # factorized centralizers
          fak,           # factorization
          prime,         # loop over primes
          primes,        # prime factors of order
          prin,          # column widths
          nam,           # classnames
          col,           # number of columns already printed
          acol,          # nuber of columns on next page
          len,           # width of next page
          ncols,         # total number of columns
          linelen,       # line length
          q,             # quadratic cyc / powermap entry
          indicator,     # list of primes
          indic,         # indicators
          iw,            # width of indicator column
          letters,       # the alphabet
          irrstack,      # list of known cycs
          colWidth,      # local function
          irrName,       # local function
          stringEntry,   # local function
          cc,            # column number
          charnames,     # list of character names
          charvals;      # matrix of strings of character values

    # compute the width of column 'col'
    colWidth:= function( col )
       local len, width;

       # the class name should fit into the column
       width:= Length( nam[col] );

       # the class names of power classes should fit into the column
       for i in powermap do
         len:= Length( nam[ tbl.powermap[i][ col ] ] );
         if len > width then
           width:= len;
         fi;
       od;

       # each character value should fit into the column
       for i in [ 1 .. Length( cnr ) ] do
         len:= Length( charvals[i][ col ] );
         if len > width then
           width:= len;
         fi;
       od;

       # at least one blank should separate the column entries
       return width + 1;

    end;

    # names of irrationalities
    irrName:= function(n)
       local i, ll, name;

       name:= "";
       ll:= Length(letters);
       while n > 0 do
          name:= ConcatenationString(letters[(n-1) mod ll + 1], name);
          n:= QuoInt(n-1, ll);
       od;
       return name;
    end;

    # scan arg
    if not ( ( Length( arg ) = 1 and IsCharTable( arg[1] ) ) or
             ( Length( arg ) = 2 and IsCharTable( arg[1] )
                 and ( IsRec(arg[2]) or IsList(arg[2]) )   ) ) then
      Error( "usage: DisplayCharTable( <tbl> [, <arec>] )" );
    fi;
    
    tbl:= arg[1];
       
    # define function to display a single entry
    # (function in one variable)
    if   IsBound( tbl.stringEntry ) then
      stringEntry:= tbl.stringEntry;
    elif IsBound( tbl.operations.StringEntry ) then
      stringEntry:= tbl.operations.StringEntry;
    else

      # string function as known
      stringEntry:= function( entry )
         local i, done, val;
  
         if IsCyc(entry) and not IsInt(entry) then
            # find shorthand for cyclo
            i:= 1; done:= false;
            while i <= Length(irrstack) and not done do
               if entry = irrstack[i] then
                  entry:= irrName(i);
                  done:= true;
               elif entry = -irrstack[i] then
                  entry:= ConcatenationString("-", irrName(i));
                  done:= true;
               fi;
               if not done then
                  val:= GaloisCyc(irrstack[i], -1);
                  if entry = val then
                     entry:= ConcatenationString("/", irrName(i));
                     done:= true;
                  elif entry = -val then
                     entry:= ConcatenationString("-/", irrName(i));
                     done:= true;
                  fi;
               fi;
               if not done then
                  val:= StarCyc(irrstack[i]);
                  if entry = val then
                     entry:= ConcatenationString("*", irrName(i));
                     done:= true;
                  elif -entry = val then
                     entry:= ConcatenationString("-*", irrName(i));
                     done:= true;
                  fi;
               fi;
               i:= i+1;
            od;
            if not done then 
               Add(irrstack, entry);
               entry:= irrName(Length(irrstack));
            fi;
         elif entry = 0 then
            entry:= ".";
         elif ( IsList( entry ) and not IsString( entry ) )
              or IsUnknown( entry ) then
            entry:= "?";
         else
            entry:= String(entry);
         fi;
  
         return entry;
      end;

    fi;

    irrstack:= [];
    letters:= [ "A","B","C","D","E","F","G","H","I","J","K","L","M",
                "N","O","P","Q","R","S","T","U","V","W","X","Y","Z" ];

    # default:
    if IsBound( tbl.irreducibles ) then
      chars:= tbl.irreducibles;
    else
      chars:= [];
    fi;
    classes:= [1..Length(tbl.classes)];
    if IsBound( tbl.powermap ) then
      powermap:= Filtered( [ 1 .. Length( tbl.powermap ) ],
                           x -> IsBound( tbl.powermap[x] ) );
    else
      powermap:= [];
    fi;
    centralizers:= true;
    cletter:= "X";
    cnr:= [ 1 .. Length( chars ) ];
    indicator:= [];

    # options
    if IsBound(arg[2]) then

       if IsList( arg[2] ) then
         arg[2]:= rec( chars:= arg[2] );
       fi;

       if IsBound(arg[2].chars) then
          if IsMat(arg[2].chars) then
             chars:= arg[2].chars;
             cletter:= "Y";
             cnr:= [1..Length(chars)];
          elif IsVector(arg[2].chars) then
             cnr:= arg[2].chars;
             chars:= Sublist(chars, cnr);
          elif IsInt(arg[2].chars) then
             chars:= [chars[arg[2].chars]];
             cnr:= [arg[2].chars];
          else
             chars:= [];
          fi;
       fi;
       if IsBound(arg[2].letter) and arg[2].letter in letters then
          cletter:= arg[2].letter;
       fi;
       if IsBound( arg[2].classes ) then
         if IsInt( arg[2].classes ) then
           classes:= [ arg[2].classes ];
         else
           classes:= arg[2].classes;
         fi;
       fi;
       if IsBound(arg[2].powermap) then
          if IsInt(arg[2].powermap) then
             powermap:= [arg[2].powermap];
          elif IsList(arg[2].powermap) then
             powermap:= arg[2].powermap;
          elif arg[2].powermap = false then
             powermap:= [];
          fi;
       fi;
       if IsBound(arg[2].centralizers) and arg[2].centralizers = false then
          centralizers:= false;
       fi;
       if IsBound(arg[2].indicator) and not (IsBound(arg[2].chars) and
                               IsMat(arg[2].chars)) then
          if arg[2].indicator = true then
             indicator:= [2];
          elif IsVector(arg[2].indicator) then
             indicator:= Set(Filtered(arg[2].indicator,x->IsInt(x) and x>0));
          fi;
       fi;
    fi;

    # line length
    linelen:= SizeScreen()[1] - 1;

    # A character table has a name.
#T change this!
    if tbl.name <> tbl.identifier then
      Print( tbl.name, "\n\n" );
    else
      Print( tbl.identifier, "\n\n" );
    fi;

    # prepare centralizers
    if centralizers then
       cen:= [];
       fak:= FactorsInt( tbl.size );
       primes:= Set(fak);
       for prime in primes do
          cen[prime]:= [Length(Filtered(fak, x->x=prime))];
       od;
    fi;

    # prepare classnames
    if IsBound(tbl.classnames) then
       nam:= tbl.classnames;
    else
       nam:= ClassNamesCharTable(tbl);
    fi;
#T change function 'ClassNames' ...

    # prepare character names
    charnames:= [];
    if IsBound( tbl.irredinfo ) then
      for i in [ 1 .. Length( cnr ) ] do
        if IsBound( tbl.irredinfo[ cnr[i] ].charname ) then
          charnames[i]:= tbl.irredinfo[ cnr[i] ].charname;
        else
          charnames[i]:= Concatenation( cletter, ".", String( cnr[i] ) );
        fi;
      od;
    else
      for i in [ 1 .. Length( cnr ) ] do
        charnames[i]:= Concatenation( cletter, ".", String( cnr[i] ) );
      od;
    fi;

    # prepare indicator
    iw:= [0];
    if indicator <> [] and not IsBound(tbl.irredinfo) then
       indicator:= [];
    fi;
    if indicator <> [] then
       indic:= [];
       for i in indicator do
          indic[i]:= [];
          for j in cnr do
             if IsBound(tbl.irredinfo[j]) and
                IsBound(tbl.irredinfo[j].indicator) and
                IsBound(tbl.irredinfo[j].indicator[i]) then
                indic[i][j]:= tbl.irredinfo[j].indicator[i];
             fi;
          od;
          if indic[i] = [] then
             Unbind(indic[i]);
          else
             if i = 2 then
                iw[i]:= 2;
             else
                iw[i]:= Maximum(Length(String(Maximum(Set(indic[i])))),
                       Length(String(Minimum(Set(indic[i])))),
                       Length(String(i)))+1;
             fi;
             iw[1]:= iw[1] + iw[i];
          fi;
       od;
       iw[1]:= iw[1] + 1;
       indicator:= Filtered(indicator, x-> IsBound(indic[x]));
    fi;

    if Length( cnr ) = 0 then
      prin:= [ 3 ];
    else
      prin:= [ Maximum( List( charnames, Length ) ) + 3 ];
    fi;

    # prepare list for strings of character values
    charvals:= List( chars, x -> [] );

    # Number Of Columns
    ncols:= Length(classes) + 1;

    # Anzahl bereits gedruckter Spalten
    col:= 1;

    while col < ncols do

       # determine number of cols for next page
       acol:= 0;
       if indicator <> [] then
          prin[1]:= prin[1] + iw[1];
       fi;
       len:= prin[1];
       while col+acol < ncols and len < linelen do
          acol:= acol + 1;
          if Length(prin) < col + acol then
             cc:= classes[ col + acol - 1 ];
             for i in [ 1 .. Length( cnr ) ] do
               charvals[i][ cc ]:= stringEntry( chars[i][ cc ] );
             od;
             prin[col + acol]:= colWidth( classes[col + acol - 1] );
          fi;
          len:= len + prin[col+acol];
       od;
       if len >= linelen then
          acol:= acol-1;
       fi;

       # centralizers
       if centralizers then
          for i in [col..col+acol-1] do
             fak:= FactorsInt( tbl.centralizers[classes[i]] );
             for prime in Set( fak ) do
                cen[prime][i]:= Length(Filtered(fak, x->x=prime));
             od;
          od;
          for j in [1..Length(cen)] do
             if IsBound(cen[j]) then
                for i in [col..col+acol-1] do
                   if not IsBound(cen[j][i]) then
                      cen[j][i]:= ".";
                   fi;
                od;
             fi;
          od;

          for prime in primes do
             Print( String( prime, prin[1] ) );
             for j in [1..acol] do
               Print( String( cen[prime][col+j-1], prin[col+j] ) );
             od;
             Print("\n");
          od;
          Print("\n");
       fi;

       # classnames
       Print( String( "", prin[1] ) );
       for i in [ 1 .. acol ] do
         Print( String( nam[classes[col+i-1]], prin[col+i] ) );
       od;
       Print("\n");

       # powermaps
       if powermap <> [] and IsBound(tbl.powermap) then
          for i in powermap do
             if IsBound(tbl.powermap[i]) then
                Print( String( Concatenation( String(i), "P" ), prin[1] ) );
                for j in [1..acol] do
                   q:= tbl.powermap[i][classes[col+j-1]];
                   if IsInt(q) then
                      Print( String( nam[q], prin[col+j] ) );
                   else
                      Print( String( "?", prin[col+j] ) );
                   fi;
                od;
                Print("\n");
             fi;
          od;
       fi;

       # empty column resp. indicators
       if indicator <> [] then
          prin[1]:= prin[1] - iw[1];
          Print( String( "", prin[1] ) );
          for i in indicator do
             Print( String( i, iw[i] ) );
          od;
       fi;
       Print("\n");

       # the characters
       for i in [1..Length(chars)] do

          # character name
          Print( String( charnames[i], -prin[1] ) );

          # indicators
          for j in indicator do
             if IsBound(indic[j][cnr[i]]) then
                if j = 2 then
                   if indic[j][cnr[i]] = 0 then
                      Print( String( "o", iw[j] ) );
                   elif indic[j][cnr[i]] = 1 then
                      Print( String( "+", iw[j] ) );
                   elif indic[j][cnr[i]] = -1 then
                      Print( String( "-", iw[j] ) );
                   fi;
                else
                   if indic[j][cnr[i]] = 0 then
                      Print( String( "0", iw[j] ) );
                   else
                      Print( String( stringEntry(indic[j][cnr[i]]), iw[j]) );
                   fi;
                fi;
             else
                Print( String( "", iw[j] ) );
             fi;
          od;
          if indicator <> [] then
            Print(" ");
          fi;
          for j in [ 1 .. acol ] do
            Print( String( charvals[i][ classes[col+j-1] ], prin[ col+j ] ) );
          od;
          Print("\n");
       od;
       col:= col + acol;
       Print("\n");
       indicator:= [];
    od;

    # print legend for cyclos
    for i in [1..Length(irrstack)] do
       Print(irrName(i), " = ", irrstack[i], "\n");
       q:= Quadratic(irrstack[i]);
       if IsRec(q) then
          if q.a <> 0 then
             q.t:= String(q.a);
          else
             q.t:= "";
          fi;
          if AbsInt(q.b) > 1 then
             if q.t = "" then
                q.t:= String(q.b);
             elif q.b > 0 then
                q.t:= ConcatenationString(q.t, "+", String(q.b));
             else
                q.t:= ConcatenationString(q.t, String(q.b));
             fi;
          elif q.b = 1 and q.t <> "" then
             q.t:= ConcatenationString(q.t, "+");
          elif q.b = -1 then
             q.t:= ConcatenationString(q.t, "-");
          fi;
          q.t:= ConcatenationString(q.t, "ER(", String(q.root), ")");
          if q.d <> 1 then
             q.t:= ConcatenationString("(", q.t, ")/", String(q.d));
          fi;
          Print("  = ", q.t, " = ", q.ATLAS, "\n");
       fi;
    od;

    end;


#############################################################################
##
#F  ClassMultCoeffCharTable( <tbl>,<c1>,<c2>,<c3> ) . . class mult coefficent
##
ClassMultCoeffCharTable := function(tbl, c1 ,c2, c3)

    local char, res;

    res:= 0;

    for char in tbl.irreducibles do
       res:= res + char[c1] * char[c2] * GaloisCyc(char[c3], -1) / char[1];
    od;

    return tbl.classes[c1] * tbl.classes[c2] * res / tbl.order;

    end;


#############################################################################
##
#F ClassStructureCharTable(<tbl>,<classes>) . . gener. class mult. coefficent
##
ClassStructureCharTable := function( tbl, classes )

    local chi, res, exp, summand, cl;

    res:= 0;
    exp:= Length( classes ) - 2;
    if exp < 0 then
      Error( "length of <classes> must be at least 2" );
    fi;

    for chi in tbl.irreducibles do
      summand:= 1;
      for cl in classes do
        summand:= summand * chi[cl];
      od;
      res:= res + summand / ( chi[1] ^ exp );
    od;

    for cl in classes do
      res:= res * tbl.classes[cl];
    od;
    return res / tbl.order;

    end;


#############################################################################
##
#F  MatClassMultCoeffsCharTable( <tbl>, <class> )
#F                                     . . . matrix of class mult coefficents
##
##  returns a matrix <M> of structure constants where
##  '<M>[j][k] = ClassMultCoeffCharTable( <tbl>, <class>, j, k )'
##
MatClassMultCoeffsCharTable := function( tbl, class )
    local j, k, result, nccl, row;
    result:= [];
    nccl:= Length( tbl.centralizers );
    for j in [ 1 .. nccl ] do
      row:= [];
      for k in [ 1 .. nccl ] do
        row[k]:= ClassMultCoeffCharTable( tbl, class, j, k );
      od;
      result[j]:= row;
    od;
    return result;
    end;


#############################################################################
##
#F  RealClassesCharTable( <tbl> ) . . . .  the real-valued classes of a table
##
##  An element $x$ is real iff it is conjugate with its inverse
##  $x^-1 = x^{o(x)-1}$.
##
RealClassesCharTable := function(tbl)
    local i, p, k, oo, po, cla, nccl, powmap, res;

    res:= [];
    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;
    powmap:= tbl.powermap;
    nccl:= Length(tbl.orders);

    for i in [1..nccl] do
       # test x ~ x^-1
       oo:= tbl.orders[i];
       if oo <= 2 then
          Add(res, i);
       else

          po:= Factors(oo-1);
          cla:= i;
          for p in po do
             if not IsBound(powmap[p]) then
                powmap[p]:= Powermap(tbl, p, rec( quick:= true ) );
             fi;
             cla:= powmap[p][cla];
          od;
          if cla = i then 
             Add(res, i);
          fi;

       fi;
    od;

    return res;

    end;


#############################################################################
##
#F  ClassOrbitCharTable( <tbl>, <cc> )  . . . .  classes of a cyclic subgroup
##
ClassOrbitCharTable := function(tbl, cc)
    local i, p, cla, oo, po, powmap, res;

    res:= [cc];
    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;
    powmap:= tbl.powermap;
    oo:= tbl.orders[cc];

    # find all generators of <cc>
    for i in [2..oo-1] do
       if GcdInt(i, oo) = 1 then
          po:= Factors(i);
          cla:= cc;
          for p in po do
             if not IsBound(powmap[p]) then
                powmap[p]:= Powermap(tbl, p, rec( quick:= true ) );
                if Length( powmap[p] ) = 1 then
                   powmap[p]:= powmap[p][1];
                else
                   Print( "#I ClassOrbitCharTable: powermap not",
                          " uniquely determined\n" );
                   powmap[p]:= Parametrized( powmap[p] );
                fi;
             fi;
             cla:= powmap[p][cla];
          od;
          AddSet(res, cla);
       fi;
    od;

    return res;

    end;


#############################################################################
##
#F  NrPolyhedralSubgroups( <tbl>, <c1>, <c2>, <c3>)  . # polyhedral subgroups
##
NrPolyhedralSubgroups := function(tbl, c1, c2, c3)
    local res, ord;

    if tbl.orders[c1] = 2 then
       res:= ClassMultCoeffCharTable(tbl, c1, c2, c3) * tbl.classes[c3];
       if tbl.orders[c2] = 2 then
          if tbl.orders[c3] = 2 then   # V4
             ord:= Length(Set([c1, c2, c3]));
             if ord = 2 then
                res:= res * 3;
             elif ord = 3 then
                res:= res * 6;
             fi;
             res:= res / 6;
             if not IsInt(res) then
                Error("noninteger result");
             fi;
             return rec(number:= res, type:= "V4");
          elif tbl.orders[c3] > 2 then   # D2n
             ord:= tbl.orders[c3];
             if c1 <> c2 then 
                res:= res * 2;
             fi;
             res:= res * Length(ClassOrbitCharTable(tbl,c3))/(ord*Phi(ord));
             if not IsInt(res) then
                Error("noninteger result");
             fi;
             return rec(number:= res, 
                        type:= ConcatenationString("D" ,String(2*ord)));
          fi;
       elif tbl.orders[c2] = 3 then
          if tbl.orders[c3] = 3 then   # A4
             res:= res * Length(ClassOrbitCharTable(tbl, c3)) / 24;
             if not IsInt(res) then
                Error("noninteger result");
             fi;
             return rec(number:= res, type:= "A4");
          elif tbl.orders[c3] = 4 then   # S4
             res:= res / 24;
             if not IsInt(res) then
                Error("noninteger result");
             fi;
             return rec(number:= res, type:= "S4");
          elif tbl.orders[c3] = 5 then   # A5
             res:= res * Length(ClassOrbitCharTable(tbl, c3)) / 120;
             if not IsInt(res) then
                Error("noninteger result");
             fi;
             return rec(number:= res, type:= "A5");
          fi;
       fi;
    fi;

    end;


#############################################################################
##
#F  ClassRootsCharTable( <tbl> )  . . . . . . . . nontrivial root of elements
##
ClassRootsCharTable := function( tbl )

    local i, nccl, pmap, root;

    nccl:= Length(tbl.classes);
    root:= List([1..nccl], x->[]);

    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;
    for pmap in tbl.powermap do
       for i in [1..nccl] do
          if i <> pmap[i] and tbl.orders[i] <> tbl.orders[pmap[i]] then
             AddSet(root[pmap[i]], i);
          fi;
       od;
    od;

    return root;

end;


#############################################################################
##
#F  SortCharactersCharTable( <tbl> )\\
#F  SortCharactersCharTable( <tbl>, <permutation> )\\
#F  SortCharactersCharTable( <tbl>, <chars> )\\
#F  SortCharactersCharTable( <tbl>, <chars>, <permutation> )\\
#F  SortCharactersCharTable( <tbl>, <chars>, \"norm\" )\\
#F  SortCharactersCharTable( <tbl>, <chars>, \"degree\" )
##
##  If no list <chars> of characters of the character table <tbl> is
##  entered, 'SortCharactersCharTable' sorts '<tbl>.irreducibles'; then
##  additionally the list '<tbl>.irredinfo' is permuted by the same
##  permutation. Otherwise 'SortCharactersCharTable' sorts the list <chars>.
##
##  There are three possibilities to sort characters\:\ 
##  They can be sorted according to ascending norms (parameter '\"norm\"'),
##  to ascending degree (parameter '\"degree\"') or both (no third parameter),
##  i.e.\ characters with same norm are sorted according to ascending degree,
##  and characters with smaller norm precede those with bigger norm.
##
##  Rational characters always will precede other ones with same norm resp.\ 
##  same degree afterwards. The trivial character, if contained in <chars>
##  resp.\ <tbl>.irreducibles, will always be sorted to the first position.
##
##  'SortCharactersCharTable' returns the permutation that was applied to
##  <chars>.
##  If <list> is specified this permutation is applied to this list, too.
##
##  To apply a particular permutation to a list of characters, use "Permuted".
##
SortCharactersCharTable := function( arg )
    local i, tbl, chars, listtosort, len, permutation, permuted, list, pos,
          entry;
    if not ( Length( arg ) in [ 1, 2, 3 ] and IsCharTable( arg[1] ) )
       or ( Length( arg ) = 2
          and not ( IsList( arg[2] ) or IsPerm( arg[2] )
                    or ( IsString( arg[2] )
                         and SubString( arg[2],1,3 ) in ["deg","nor"] ) ) )
       or ( Length( arg ) = 3
          and not ( IsList(arg[2]) and ( IsPerm(arg[3]) or ( IsString(arg[3])
                    and SubString( arg[3],1,3 ) in ["deg","nor"] ) ) ) ) then
      Error( "usage: SortCharactersCharTable( <tbl> )\n",
     "         resp. SortCharactersCharTable( <tbl>, <perm> )\n",
     "         resp. SortCharactersCharTable( <tbl>, <chars> )\n",
     "         resp. SortCharactersCharTable( <tbl>, <chars>, <perm> )\n",
     "         resp. SortCharactersCharTable( <tbl>, <chars>, \"norm\" )\n",
     "         resp. SortCharactersCharTable( <tbl>, <chars>, \"degree\" )" );
    fi;
    tbl:= arg[1];
    if Length( arg ) > 1 and not IsPerm( arg[2] )
       and ( not IsString( arg[2] ) or arg[2] = [] ) then
      chars:= arg[2];
    else
      chars:= tbl.irreducibles;
    fi;
    if chars = [] then return (); fi;
    listtosort:= [];
    if IsPerm( arg[ Length( arg ) ] ) then
                         # SortCharactersCharTable( tbl, perm )
                         # SortCharactersCharTable( tbl, chars, perm )
      permutation:= arg[ Length( arg ) ];
    else
      if Length( arg ) = 1 or ( Length( arg ) = 2 and
           IsList( arg[2] ) and not IsString( arg[2] ) ) then
                         # SortCharactersCharTable( tbl ) or
                         # SortCharactersCharTable( tbl, chars ) or
                         # (stable) sort according to norms and degrees
        len:= 4;
        for i in [ 1 .. Length( chars ) ] do
          listtosort[i]:=
                 [ tbl.operations.ScalarProduct(tbl,chars[i],chars[i]),
                   chars[i][1], ForAll( chars[i], IsRat ), i ];
        od;
      elif ( IsString( arg[2] ) and arg[2]{ [ 1..3 ] } = "nor" )
           or ( Length( arg ) = 3 and arg[3]{ [ 1..3 ] } = "nor" ) then
                       # SortCharacters( tbl, "norm" ) or
                       # SortCharacters( tbl, chars, "norm" ):
                       # (stable) sort according to norms
        len:= 3;
        for i in [ 1 .. Length( chars ) ] do
          listtosort[i]:=
                 [ tbl.operations.ScalarProduct(tbl,chars[i],chars[i]),
                   ForAll( chars[i], IsRat ), i ];
        od;
      else             # SortCharacters( tbl, "degree" ) or
                       # SortCharacters( tbl, chars, "degree" ):
                       # (stable) sort according to degrees
        len:= 3;
        for i in [ 1 .. Length( chars ) ] do
          listtosort[i]:= [ chars[i][1], ForAll( chars[i], IsRat ), i ];
        od;
      fi;
      Sort( listtosort );
      for i in [ 1 .. Length( chars ) ] do
        listtosort[i]:= listtosort[i][ len ];
      od;
      permutation:= PermList( listtosort )^(-1);
    fi;
    permuted:= Permuted( chars, permutation );
    for i in [ 1 .. Length( chars ) ] do chars[i]:= permuted[i]; od;
    if IsBound( tbl.irredinfo ) and ( Length( arg ) = 1 or IsPerm( arg[2] )
                    or IsString( arg[2] ) ) then

      # adjust '<tbl>.irredinfo'
      tbl.irredinfo:= Permuted( tbl.irredinfo, permutation );

    fi;
    entry:=  List( [ 1 .. Length( chars[1] ) ], x -> 1 );
    pos:= Position( chars, entry );
    if pos <> false and pos > 1 and not IsPerm( arg[ Length( arg ) ] ) then
                           # triv. char. is contained but not at position 1
      for i in Reversed( [ 1 .. pos-1 ] ) do chars[ i+1 ]:= chars[i]; od;
      chars[1]:= entry;
      if IsBound( tbl.irredinfo ) and ( Length( arg ) = 1
         or IsString( arg[2] ) ) then

        # adjust '<tbl>.irredinfo'
        entry:= tbl.irredinfo[pos];
        for i in Reversed( [ 1 .. pos-1 ] ) do
          tbl.irredinfo[ i+1 ]:= tbl.irredinfo[i];
        od;
        tbl.irredinfo[1]:= entry;

      fi;
      permutation:= permutation * PermList( Concatenation( [2..pos], [1] ) );

    fi;
    return permutation;
    end;


#############################################################################
##
#F  SortClassesCharTable( <tbl> )
#F  SortClassesCharTable( <tbl>, \"centralizers\" )
#F  SortClassesCharTable( <tbl>, \"representatives\" )
#F  SortClassesCharTable( <tbl>, <permutation> )
#F  SortClassesCharTable( <chars>, <permutation> )
##
##  The last form simply permutes the classes of all elements of <chars>
##  by <permutation>. All other forms take a character table <tbl> as
##  parameter, and 'SortClassesCharTable' permutes the classes of <tbl>:
##  'SortClassesCharTable( <tbl>, \"centralizers\" )
##           sorts the classes according to descending centralizer orders,
##  'SortClassesCharTable( <tbl>, \"representatives\" )
##           sorts the classes according to ascending representative orders,
##  'SortClassesCharTable( <tbl> )
##           sorts the classes according to ascending representative orders,
##           and classes with equal representative orders according to
##           descending centralizer orders
##  'SortClassesCharTable( <tbl>, <permutation> )
##           sorts the classes by application of <permutation>
##
##  After having calculated the permutation, 'SortClassesCharTable' will
##  adjust the following fields of <tbl>:
##
##  1. by application of the permutation: orders, centralizers, classes, print,
##     irreducibles, classtext, classparam, all fusion maps, classnames,
##     the 'chars' component of entries of 'projectives',
##     the 'conjugacyClasses' component of 'group'
##  2. the fields corresponding to <tbl>.classnames
##  3. by conjugation with the permutation: all powermaps, automorphisms
##  4. galoisfams.classes
##  5. by multiplication with the permutation: <tbl>.permutation
##
SortClassesCharTable := function( arg )
    local i, j, k, x, chars, permutation, listtosort, tbl, orders, classes,
          len, fusions, powermap, galoisfams, result, list, permmap, inverse;
    if not ( ( Length( arg ) = 1 and IsCharTable( arg[1] ) )
             or ( Length(arg) = 2 and ( ( IsList(arg[1]) and IsPerm(arg[2]) )
                or ( IsCharTable( arg[1] ) and
                     ( IsString( arg[2] ) or IsPerm( arg[2] ) ) ) ) ) ) then
      Error( "usage: SortClassesCharTable( <tbl> )\n",
     "         resp. SortClassesCharTable( <tbl>, \"centralizers\" )\n",
     "         resp. SortClassesCharTable( <tbl>, \"representatives\" )\n",
     "         resp. SortClassesCharTable( <tbl>, <perm> )\n",
     "         resp. SortClassesCharTable( <chars>, <perm> )" );
    fi;
    if IsList( arg[1] ) then       # SortClassesCharTable( chars, perm )
      chars:= arg[1];
      permutation:= arg[2];
      for i in [ 1 .. Length( chars ) ] do
        chars[i]:= Permuted( chars[i], permutation );
      od;
      return permutation;
    fi;
    tbl:= arg[1];
    orders:= tbl.orders;
    classes:= tbl.classes;
    if Length( arg ) = 2 and IsPerm( arg[2] ) then
                                   # SortClassesCharTable( tbl, perm )
      permutation:= arg[2];  
    else
      listtosort:= [];
      if Length( arg ) = 1 then    # SortClassesCharTable( tbl ):
         # (stable) sort according to ascending orders and classes
        len:= 3;
        for i in [ 1 .. Length( orders ) ] do
          listtosort[i]:= [ orders[i], classes[i], i ];
        od;
      else                # SortClassesCharTable( tbl, string ):
                          # (stable) sort according to orders or centralizers
        len:= 2;
        if arg[2]{ [ 1..3 ] } = "cen" then
          for i in [ 1 .. Length( classes ) ] do
            listtosort[i]:= [ classes[i], i ];
          od;
        else
          for i in [ 1 .. Length( orders ) ] do
            listtosort[i]:= [ orders[i], i ];
          od;
        fi;
      fi;
      Sort( listtosort );
      for i in [ 1 .. Length( listtosort ) ] do
        listtosort[i]:= listtosort[i][ len ];
      od;
      permutation:= PermList( listtosort )^(-1);
    fi;

    if permutation = () then return (); fi;

    tbl.orders:=         Permuted( orders, permutation );
    tbl.centralizers:= Permuted( tbl.centralizers, permutation );
    tbl.classes:=      Permuted( classes, permutation );
    if IsBound( tbl.print ) then
      tbl.print:= Permuted( tbl.print, permutation );
    fi;
    if IsBound( tbl.irreducibles ) then
      SortClassesCharTable( tbl.irreducibles, permutation );
    fi;
    if IsBound( tbl.classtext ) then
      tbl.classtext:= Permuted( tbl.classtext, permutation );
    fi;
    if IsBound( tbl.classparam ) then
      tbl.classparam:= Permuted( tbl.classparam, permutation );
    fi;
    if IsBound( tbl.fusions ) then
      for i in tbl.fusions do
        i.map:= Permuted( i.map, permutation );
      od;
    fi;
    if IsBound( tbl.projectives ) then
      for i in tbl.projectives do
        SortClassesCharTable( i.chars, permutation );
      od;
    fi;
    if IsBound( tbl.group ) and IsBound(tbl.group.conjugacyClasses) then
      tbl.group.conjugacyClasses:=
               Permuted( tbl.group.conjugacyClasses, permutation );
    fi;

    if IsBound( tbl.classnames ) then
      tbl.classnames:= Permuted( tbl.classnames, permutation );
      for i in [ 1 .. Length( tbl.classnames ) ] do
        tbl.( tbl.classnames[i] ):= i;
      od;
    fi;
    if IsBound( tbl.powermap ) then
      permmap:= List( permutation );
      inverse:= List( permutation^(-1) );
      for k in [ Length(permmap)+1 .. Length(tbl.centralizers) ] do
        permmap[k]:= k;
        inverse[k]:= k;
      od;
      for k in [ 1 .. Length( tbl.powermap ) ] do
        if IsBound( tbl.powermap[k] ) then
          tbl.powermap[k]:= CompositionMaps( permmap,
                               CompositionMaps(tbl.powermap[k],inverse) );
        fi;
      od;
    fi;
    if IsBound( tbl.galomorphisms ) then           # conjugate
      tbl.galomorphisms:= Group( List( tbl.galomorphisms.generators,
                                       x->x^permutation ), () );
    fi;
    if IsBound( tbl.automorphisms ) then           # conjugate
      tbl.automorphisms:= Group( List( tbl.automorphisms.generators,
                                       x->x^permutation ), () );
    fi;
    if IsBound(tbl.permutation) then
      tbl.permutation:= tbl.permutation * permutation;
    else
      tbl.permutation:= permutation;
    fi;
    return permutation;
    end;


#############################################################################
##
#F  SortCharTable( <tbl>, <kernel> )
#F  SortCharTable( <tbl>, <normalseries> )
#F  SortCharTable( <tbl>, <facttbl>, <kernel> )
##
##  sorts classes and 'irreducibles' of the character table <tbl>, and
##  returns a record with components 'columns' and 'rows', which are the
##  permutations applied to classes and characters.
##
##  The first form sorts the classes at positions contained in the list
##  <kernel> to the beginning, and sorts all characters in
##  '<tbl>.irreducibles' such that the first characters are those that
##  contain <kernel> in their kernel.
##
##  The second form does the same successively for all kernels $k_i$ in
##  the list $'normalseries' = [ k_1, k_2, \ldots, k_n ]$ where
##  $k_i$ must be a sublist of $k_{i+1}$ for $1 \leq i \leq n-1$.
##
##  The third form computes the table <F> of the factor group of <tbl>
##  modulo the normal subgroup formed by the classes whose positions are
##  contained in the list <kernel>;
##  <F> must be permutation equivalent to the table <facttbl> (in the
##  sense of "TransformingPermutationsCharTables"), else 'false' is
##  returned.  The classes of <tbl> are sorted such that the preimages
##  of a class of <F> are consecutive, and that the succession of
##  preimages is that of <facttbl>.  '<tbl>.irreducibles' is sorted as
##  by 'SortCharTable( <tbl>, <kernel> )'.
##  (*Note* that the transformation is only unique up to table automorphisms
##  of <F>, and this need not be unique up to table automorphisms of <tbl>.)
##
##  All rearrangements of classes and characters are stable, i.e., the
##  relative positions of classes and characters that are not distinguished
##  by any relevant property is not changed.
##
##  The 'permutation' component of <tbl> is changed if necessary,
##  see "Conventions for Character Tables".
##
SortCharTable := function( arg )
     local i, j, tbl, kernels, list, columns, rows, chi, F, facttbl, kernel,
           trans, ker;

     # check the arguments
     if not ( Length( arg ) in [ 2, 3 ] and IsCharTable( arg[1] ) and
              IsList( arg[ Length( arg ) ] ) and
              ( Length( arg ) = 2 or IsCharTable( arg[2] ) ) ) then
       Error( "usage: SortCharTable( <tbl>, <kernel> ) resp.\n",
              "       SortCharTable( <tbl>, <normalseries> ) resp.\n",
              "       SortCharTable( <tbl>, <facttbl>, <kernel> )" );
     fi;

     tbl:= arg[1];

     if Length( arg ) = 2 then

       # sort w.r. to kernel or series of kernels
       kernels:= arg[2];
       if kernels = [] then
         return rec( columns:= (), rows:= () );
       fi;

       # regard single kernel as special case of normal series
       if IsInt( kernels[1] ) then kernels:= [ kernels ]; fi;

       # permutation of classes\:
       # 'list[i] = k' if 'i' is contained in 'kernels[k]' but not
       # in 'kernels[k-1]'; only the first position contains a zero
       # to ensure that the identity is not moved.
       # If class 'i' is not contained in any of the kernels we have
       # 'list[i] = ""'.
       list:= [ 0 ];
       for i in [ 2 .. Length( tbl.centralizers ) ] do
         list[i]:= "";
       od;
       for i in [ 1 .. Length( kernels ) ] do
         for j in kernels[i] do
           if not IsInt( list[j] ) then list[j]:= i; fi;
         od;
       od;
       columns:= Sortex( list );

       # permutation of characters
       # 'list[i] = -(k+1)' if '<tbl>.irreducibles[i]' has 'kernels[k]'
       # in its kernel but not 'kernels[k+1]'; if the 'i'--th irreducible
       # contains none of 'kernels' in its kernel we have 'list[i] = -1',
       # for an irreducible with kernel containing 'kernels[ Length( kernels ) ]
       # the value is '-(Length( kernels ) + 1)'.
       list:= [];
       if IsBound( tbl.irreducibles ) then
         for chi in tbl.irreducibles do
           i:= 1;
           while i <= Length( kernels ) and ForAll( kernels[i],
                                                    x -> chi[x] = chi[1] ) do
             i:= i+1;
           od;
           Add( list, -i );
         od;
         rows:= Sortex( list );
       else
         rows:= ();
       fi;

     else

       # sort w.r. to table of factor group
       facttbl:= arg[2];
       kernel:= arg[3];
       F:= CharTableFactorGroup( tbl, kernel );
       trans:= TransformingPermutationsCharTables( F, facttbl );
       if trans = false then
         InfoCharTable2( "#I SortCharTable:\n",
                         " tables of factor groups not compatible\n" );
         return false;
       fi;

       # permutation of classes\:
       # 'list[i] = k' if 'i' maps to the 'j'--th class of <F>, and
       # 'trans.columns[j] = i'
       list:= OnTuples( GetFusionMap( tbl, F ), trans.columns );
       columns:= Sortex( list );

       # permutation of characters\:
       # divide '<tbl>.irreducibles' into two parts, those containing
       # the kernel of the factor fusion in their kernel (value 0),
       # and the others (value 1); do not forget to permute characters
       # of the factor group with 'trans.rows'.
       if IsBound( tbl.irreducibles ) then
         ker:= KernelChar( GetFusionMap( tbl, F ) );
         list:= [];
         for chi in tbl.irreducibles do
           if ForAll( ker, x -> chi[x] = chi[1] ) then
             Add( list, 0 );
           else
             Add( list, 1 );
           fi;
         od;
         rows:= Sortex( list ) * trans.rows;
       else
         rows:= ();
       fi;

       # delete the fusion to 'F' on 'tbl'
       Unbind( tbl.fusions[ Length( tbl.fusions ) ] );

     fi;

     # sort and return
     SortClassesCharTable( tbl, columns );
     SortCharactersCharTable( tbl, rows );
     return rec( columns:= columns, rows:= rows );

     end;

