#############################################################################
##
#A  ctgapmoc.g                  GAP library                     Thomas Breuer
##
#A  @(#)$Id: ctgapmoc.g,v 3.10.1.1 1996/06/11 07:14:00 sam Exp $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions used for conversion of GAP tables
##  to MOC format.
##
#H  $Log: ctgapmoc.g,v $
#H  Revision 3.10.1.1  1996/06/11  07:14:00  sam
#H  fixed bug in 'PrintNumber' (which previously omitted digits)
#H
#H  Revision 3.10  1994/06/10  04:44:29  sam
#H  fixed order and name components
#H
#H  Revision 3.9  1994/05/26  11:36:09  sam
#H  fixed bug in 'Subfields'
#H
#H  Revision 3.8  1994/04/21  12:01:19  sam
#H  introduced 'OperationsRecord',
#H  introduced 'identifier'component
#H
#H  Revision 3.7  1994/02/02  09:25:47  sam
#H  'PrintToMOC' accepts a matrix now
#H
#H  Revision 3.6  1993/10/19  17:05:04  sam
#H  fixed possible absence of 'powermap' component
#H
#H  Revision 3.5  1993/09/20  10:43:41  sam
#H  fixed bug, adjusted functions dealing with strings
#H
#H  Revision 3.4  1992/12/23  16:33:06  sam
#H  fixed minor bug
#H
#H  Revision 3.3  1992/12/03  13:34:46  sam
#H  fixed bug in 'PrintToMOC'
#H
#H  Revision 3.2  1992/11/16  12:36:38  jmueller
#H  changed 'PrintToMOC' in case of <tbl>, <chars>
#H
#H  Revision 3.1  1992/08/12  15:08:51  sam
#H  corrected encoding of MOC3 numbers
#H
#H  Revision 3.0  1992/08/12  13:26:24  sam
#H  initial revision under RCS
#H
##

#############################################################################
##
#F  FieldInfo( <F> )
##
##  returns for a number field <F> a record with components
##  'nofcyc'  : the conductor of <F>,
##  'repres'  : a list of orbit representatives forming the Parker base
##              of the number field,
##  'stabil'  : a smallest generating system of the stabilizer, and
##  'MOCfield': the field with the Parker as 'base' component.
##
FieldInfo := function( F )
    local i, j, n, orbits, cycs, coeffs, base, repres, rank, max, pos,
          sub, sub2, stabil, elm, numbers, orb, orders, gens;

    if F = Rationals then
      return rec( nofcyc:= 1,
                  repres:= [ 0 ],
                  stabil:= [],
                  MOCfield:= Rationals );
    fi;

    n:= NofCyc( F.generators );

    # representatives of orbits under the action of 'F.stabilizer'
    # on '[ 0 .. n ]'
    numbers:= [ 0 .. n-1 ];
    orbits:= [];
    while numbers <> [] do
      orb:= Set( List( numbers[1] * F.stabilizer, x -> x mod n ) );
      Add( orbits, orb );
      SubtractSet( numbers, orb );
    od;

    # orbitsums under the corresponding action on 'n'--th roots of unity
    cycs:= List( orbits, x -> Sum( x, y -> E(n)^y ) );
    coeffs:= List( cycs, x -> CoeffsCyc( x, n ) );

    # the Parker base
    gens:= [ 1 ];
    base:= [ coeffs[1] ];
    repres:= [ 0 ];
    rank:= 1;

# besser 'while' !!

    for i in [ 1 .. Length( coeffs ) ] do
      if RankMat( Union( base, [ coeffs[i] ] ) ) > rank then
        rank:= rank + 1;
        Add( gens, cycs[i] );
        Add( base, coeffs[i] );
        Add( repres, orbits[i][1] );
      else

# weg !!

        Unbind( cycs[i] );
        Unbind( coeffs[i] );
        Unbind( orbits[i] );
      fi;
    od;

    # compute small generating system for the stabilizer:
    # Start with the empty generating system.
    # Add the smallest number of maximal multiplicative order to
    # the generating system, remove all points in the new group.
    # Proceed until one has a generating system for the stabilizer.
    orders:= List( F.stabilizer, x -> OrderMod( x, n ) );
    orders[1]:= 0;
    max:= Maximum( orders );
    stabil:= [];
    sub:= [ 1 ];
    while max <> 0 do
      pos:= Position( orders, max );
      elm:= F.stabilizer[ pos ];
      AddSet( stabil, elm );
      sub2:= sub;
      for i in [ 1 .. max-1 ] do
        sub2:= Union( sub2, List( sub, x -> ( x * elm^i ) mod n ) );
      od;
      sub:= sub2;
      for j in sub do
        orders[ Position( F.stabilizer, j ) ]:= 0;
      od;
      max:= Maximum( orders );
    od;

    return rec( nofcyc:= n,
                repres:= repres,
                stabil:= stabil,
                MOCfield:= NF( 0, gens ) );
    end;


#############################################################################
##
#F  Subfields( <F> )
##
##  returns the list of subfields of the number field <F>
##
Subfields := function( F )

    local n, cl;

    if not IsNumberField( F ) then
      Error( "<F> must be a number field" );
    fi;
    n:= NofCyc( F.generators );
    cl:= ConjugacyClassesSubgroups( GaloisGroup( F ) );
    cl:= List( cl, x -> List( x.representative.generators,
                              y -> y.galois ) );
    cl:= List( cl, x -> Union( F.stabilizer, x ) );

    return List( cl, x -> NF( n, x ) );
    end;

#############################################################################
##
#F  MAKElb11( <listofns> )
##
##  prints field information for fields with conductor $Q_n$ where <n> is in
##  the list <listofns>;
##
##  'MAKElb11( [ 3 .. 189 ] )' will print something very similar to
##  Richard Parker\'s file 'lb11'.
##
MAKElb11 := function( listofns )
    local n, f, k, j, fields, info, num, stabs;

    # 12 entries per row
    num:= 12;

    for n in listofns do

      if n > 2 and n mod 4 <> 2 then

        fields:= Filtered( Subfields( CF(n) ),
                           x -> NofCyc( x.generators ) = n );
        fields:= List( fields, FieldInfo );
        stabs:=  List( fields,
                       x -> Concatenation( [ x.nofcyc, Length( x.repres ),
                                           Length(x.stabil) ], x.stabil ) );
        fields:= List( fields,
                       x -> Concatenation( [ x.nofcyc, Length( x.repres ) ],
                                           x.repres, [ Length( x.stabil ) ],
                                           x.stabil ) );

        # sort fields according to degree and stabilizer generators
        fields:= Permuted( fields, Sortex( stabs ) );
        for f in fields do
          for k in [ 0 .. QuoInt( Length( f ), num ) - 1 ] do
            for j in [ 1 .. num ] do
              Print( String( f[ k*num + j ], 4 ) );
            od;
            Print( "\n " );
          od;
          for j in [ num * QuoInt( Length(f), num ) + 1 .. Length(f) ] do
            Print( String( f[j], 4 ) );
          od;
          Print( "\n" );
        od;

      fi;

    od;
    end;


#############################################################################
##
#F  StructureConstants( <ring> )
##
##  The multiplication in a ring <ring> with vector space base
##  $'<ring>.base' = ( v_1, \ldots, v_n )$ is determined by the so--called
##  structure matrices $M_k = [ m_{ijk} ]_{ij}, 1 \leq i \leq n$.
##  The $M_k$ are defined by $v_i v_j = \sum_{k} m_{i,j,k} v_k$.
##  Let $a = [ a_1, \ldots, a_n ], b = [ b_1, \ldots, b_n ]$.  Then
##  \[ ( \sum_i a_i v_i ) ( \sum_j b_j v_j )
##     = \sum_{i,j} a_i b_j ( v_i v_j )
##     = \sum_k ( \sum_j ( \sum_i a_i m_{i,j,k} ) b_j ) v_k
##     = \sum_k ( a M_k b^{tr} ) v_k \ . \]
##
##  'StructureConstants' returns the list $[ M_1, \ldots, M_n ]$.
##
##  *Note*\:\ To compute the structure matrices it is necessary to have a
##  'Coefficients' function for <ring>.
##
StructureConstants := function( ring )
    local i, j, k, n, prod, result;
    n:= Length( ring.base );
    result:= [];
    for k in [ 1 .. n ] do
      result[k]:= [];
    od;
    for i in [ 1 .. n ] do
      for k in [ 1 .. n ] do
        result[k][i]:= [];
      od;
      for j in [ 1 .. n ] do
        prod:= Coefficients( ring, ring.base[i] * ring.base[j] );
        for k in [ 1 .. n ] do
          result[k][i][j]:= prod[k];
        od;
      od;
    od;
    return result;
    end;


#############################################################################
##
#F  PowerInfo( <listoffields>, <galoisfams>, <powermap>, <prime> )
##
##  For a list <listoffields> of fields or zeros (as produced in
##  "MOCTable") the information of labels '30220' and '30230' is
##  computed.  This is a sequence
##  \[ x_{1,1} x_{1,2} \ldots x_{1,m_1} 0 x_{2,1} x_{2,2} \ldots x_{2,m_2}
##   0 \ldots 0 x_{n,1} x_{n,2} \ldots x_{n,m_n} 0 \]
##  with the followong meaning.
##  Let $[ a_1, a_2, \ldots, a_n ]$ be a character in MOC format.
##  The value of the character obtained on indirection by the <prime>--th
##  power map at position $i$ is
##  \[ x_{i,1} a_{x_{i,2}} + x_{i,3} a_{x_{i,4}} + \ldots
##   + x_{i,m_i-1} a_{x_{i,m_i}} \ . \]
##
##  The information is computed as follows.
##
##  If $g$ and $g^{<prime>}$ generate the same cyclic group, write the
##  <prime>--th conjugates of the base vectors $v_1, \ldots, v_k$ as
##  $\tilde{v_i} = \sum_{j=1}^{k} c_{ij} v_j$.  The $j$--th coefficient
##  of the <prime>--th conjugate of $\sum_{i=1}^{k} a_i v_i$ is then
##  $\sum_{i=1}^{k} a_i c_{ij}$.
##
##  If $g$ and $g^{<prime>}$ generate different cyclic groups, write the
##  base vectors $w_1, \ldots, w_{k^{\prime}}$ in terms of the $v_i$ as
##  $w_i = \sum_{j=1}^{k} c_{ij} v_j$.  The $v_j$--coefficient of the
##  indirection of $\sum_{i=1}^{k^{\prime}} a_i w_i$ is then
##  $\sum_{i=1}^{k^{\prime}} a_i c_{ij}$.
##
##  For $<prime> = -1$ (complex conjugation) we have of course
##  $k = k^{\prime}$ and $w_i = \overline{v_i}$.  In this case the
##  parameter <powermap> may have any value.  Otherwise <powermap>
##  must be the 'powermap' component of the underlying character table;
##  for any Galois automorphism of a cyclic subgroup, it must contain
##  a map covering this automorphism.
##
##  <galoisfams> is a list that describes the Galois conjugacy;
##  its format is equal to that of the 'galoisfams' component in the
##  record returned by 'GaloisMat'.
##
##  'PowerInfo' returns a list containing the information for <prime>,
##  the part of class 'i' is stored in a list at position 'i'.
##
##  *Note* that 'listoffields' refers to all classes, not only
##  representatives of cyclic subgroups; non-leader classes of Galois
##  families must have value 0.
##
PowerInfo := function( listoffields, galoisfams, powermap, prime )
    local i, j, k, c, n, f, power, im, oldim, imf, pp, entry,
          startcycsubgps;

    # compute the first class of a cyclic subgroup in the {\MOC} table,
    # for rerpresentatives only
    startcycsubgps:= [];
    k:= 1;
    for i in [ 1 .. Length( galoisfams ) ] do
      if galoisfams[i] = 1 then
        startcycsubgps[i]:= k;
        k:= k+1;
      elif IsList( galoisfams[i] ) then
        startcycsubgps[i]:= k;
        k:= k + Length( galoisfams[i] );
      fi;
    od;

    power:= [];
    i:= 1;
    while i <= Length( listoffields ) do

      if listoffields[i] in [ 1, Rationals ] then

        # rational class
        if prime = -1 then
          Add( power, [ 1, i, 0 ] );
        else

          # 'prime'--th power of class 'i' (of course rational)
          Add( power, [ 1, powermap[ prime ][i], 0 ] );

        fi;

      elif listoffields[i] <> 0 then

        # the field
        f:= listoffields[i];

        if prime = -1 then

          # the coefficient matrix
          c:= List( f.base, x -> Coefficients( f, GaloisCyc( x, -1 ) ) );
          im:= i;

        else

          # the image class and field
          oldim:= powermap[ prime ][i];
          if galoisfams[ oldim ] = 1 then
            im:= oldim;
          else
            im:= 1;
            while not IsList( galoisfams[ im ] ) or
                  not oldim in galoisfams[ im ][1] do
              im:= im+1;
            od;
          fi;

          if listoffields[ im ] = 1 then

            # maps to rational class 'im'
            c:= [ Coefficients( f, 1 ) ];

          elif im = i then

            # just Galois conjugacy
            c:= List( f.base, x -> Coefficients( f, GaloisCyc(x,prime) ) );

          else

            # compute embedding of the image field
            imf:= listoffields[ im ];
            pp:= false;
            for j in [ 2 .. Length( powermap ) ] do
              if IsBound( powermap[j] ) and powermap[j][ im ] = oldim then
                pp:= j;
              fi;
            od;
            if pp = false then
              Error( "PowerInfo cannot compute Galois autom. for ", im,
                     " -> ", oldim, " from powermap" );
            fi;

            c:= List( imf.base, x -> Coefficients( f, GaloisCyc(x,pp) ) );

          fi;

        fi;

        # the power info for column 'i' of the {\MOC} table,
        # and all other columns in the same cyclic subgroup

        im:= startcycsubgps[ im ];

        entry:= [];
        n:= Length( c );
        for j in [ 1 .. Length( c[1] ) ] do
          for k in [ 1 .. n ] do
            if c[k][j] <> 0 then
              Append( entry, [ c[k][j], im + k - 1 ] );
            fi;
          od;
          Add( entry, 0 );
        od;
        Add( power, entry );

      fi;
      i:= i+1;
    od;
    return power;
    end;


#############################################################################
##
#F  ScanMOC( <list> )
##
##  returns a record containing the information encoded in the list <list>
##  the components of the result are the labels in <list>.  If <list> is in
##  MOC2 format (10000--format) the names of components are 30000--numbers,
##  if it is in MOC3 format the names of components have yABC--format.
##
ScanMOC := function( list )
    local digits, positive, negative, specials, number,
          pos, result,
          scannumber2,     # scan a number in {\MOC2} format
          scannumber3,     # scan a number in {\MOC3} format
          label, component;

    # some constants used for MOC3 format
    digits:= "0123456789";
    positive:= "abcdefghij";
    negative:= "klmnopqrs";
    specials:= "tuvw";

    # check the argument
    if not IsList( list ) then
      Error( "argument must be a list" );
    fi;

    # local functions: scan a number of {\MOC2} or {\MOC3} format
    scannumber2:= function()
    number:= 0;
    while list[ pos ] < 10000 do

      # number is not complete
      number:= 10000 * number + list[ pos ];
      pos:= pos + 1;
    od;
    if list[ pos ] < 20000 then
      number:= 10000 * number + list[ pos ] - 10000;
    else
      number:= - ( 10000 * number + list[ pos ] - 20000 );
    fi;
    pos:= pos + 1;
    return number;
    end;

    scannumber3:= function()
    number:= 0;
    while list[ pos ] in digits do

      # number is not complete
      number:= 10000 * number
                    + 1000 * Position( digits, list[ pos   ] )
                    +  100 * Position( digits, list[ pos+1 ] )
                    +   10 * Position( digits, list[ pos+2 ] )
                    +        Position( digits, list[ pos+3 ] )
                    - 1111;
      pos:= pos + 4;
    od;

    # end of number or small number
    if list[ pos ] in positive then

      # small positive number
      number:= Position( positive, list[ pos ] ) - 1;

    elif list[ pos ] in negative then

      # small negative number
      number:= - Position( negative, list[ pos ] );

    else

      if   list[ pos ] = 't' then
        number:= 10 * Position( digits, list[ pos+1 ] )
                 +    Position( digits, list[ pos+2 ] )
                 - 11;
        pos:= pos + 2;
      elif list[ pos ] = 'u' then
        number:= - 10 * Position( digits, list[ pos+1 ] )
                 -      Position( digits, list[ pos+2 ] )
                 + 11;
        pos:= pos + 2;
      elif list[ pos ] = 'v' then
        number:= 10000 * number
                    + 1000 * Position( digits, list[ pos+1 ] )
                    +  100 * Position( digits, list[ pos+2 ] )
                    +   10 * Position( digits, list[ pos+3 ] )
                    +        Position( digits, list[ pos+4 ] )
                    - 1111;
        pos:= pos + 4;
      elif list[ pos ] = 'w' then
        number:= - 10000 * number
                    - 1000 * Position( digits, list[ pos+1 ] )
                    -  100 * Position( digits, list[ pos+2 ] )
                    -   10 * Position( digits, list[ pos+3 ] )
                    -        Position( digits, list[ pos+4 ] )
                    + 1111;
        pos:= pos + 4;
      fi;
    fi;
    pos:= pos + 1;
    return number;
    end;

    # convert <list>
    result:= rec();
    pos:= 1;

    if IsInt( list[1] ) then

      # MOC2 format
      if list[1] = 30100 then pos:= 2; fi;
      while pos <= Length( list ) and list[ pos ] <> 31000 do
        label:= list[ pos ];
        pos:= pos + 1;
        component:= [];
        while pos <= Length( list ) and list[ pos ] < 30000 do
          Add( component, scannumber2() );
        od;
        result.( label ):= component;
      od;

    else

      # MOC3 format
      if list{ [ 1 .. 4 ] } = "y100" then
        pos:= 5;
      fi;

      while pos <= Length( list ) and list[ pos ] <> 'z' do

        # label: 'yABC'
        label:= list{ [ pos .. pos+3 ] };
        pos:= pos + 4;
        component:= [];
        while pos <= Length( list ) and not list[ pos ] in "yz" do
          Add( component, scannumber3() );
        od;
        result.( label ):= component;
      od;
    fi;

    return result;
    end;


#############################################################################
##
#F  MOCChars( <tbl>, <gapchars> )
##
##  returns translations of {\GAP} format characters <gapchars> to MOC
##  format.  <tbl> must be a {\GAP} format table or a MOC format table.
##
MOCChars := function( tbl, gapchars )
    local i, result, chi, MOCchi;

    # take the MOC format (if necessary, construct the MOC format table first)
    if not IsBound( tbl.isMOCformat ) then
      if IsBound( tbl.MOCtbl ) then
        tbl:= tbl.MOCtbl;
      else
        tbl:= MOCTable( tbl );
      fi;
    fi;

    # translate the characters
    result:= [];
    for chi in gapchars do
      MOCchi:= [];
      for i in [ 1 .. Length( tbl.fields ) ] do
        if tbl.fields[i] = Rationals then
          Add( MOCchi, chi[ tbl.repcycsub[i] ] );
        else
          Append( MOCchi, Coefficients( tbl.fields[i],
                                        chi[ tbl.repcycsub[i] ] ) );
        fi;
      od;
      Add( result, MOCchi );
    od;
    return result;
    end;


#############################################################################
##
#F  GAPChars( <tbl>, <mocchars> )
##
##  returns translations of MOC format characters <mocchars> to {\GAP}
##  format.  <tbl> must be a {\GAP} format table or a MOC format table.
##
##  <mocchars> may also be a list of integers, e.g., a component containing
##  characters in a record produced by "ScanMOC".
##
GAPChars := function( tbl, mocchars )
    local i, j, val, result, chi, GAPchi, map, pos, numb, nccl;

    # take the MOC format table (if necessary, construct it first)
    if not IsBound( tbl.isMOCformat ) then
      if IsBound( tbl.MOCtbl ) then
        tbl:= tbl.MOCtbl;
      else
        tbl:= MOCTable( tbl );
      fi;
    fi;

    # 'map[i]' is the list of columns of the MOC table that belong to
    # the 'i'--th cyclic subgroup of the MOC table
    map:= [];
    pos:= 0;
    for i in [ 1 .. Length( tbl.fields ) ] do
      Add( map, pos + [ 1 .. Length( tbl.fields[i].base ) ] );
      pos:= pos + Length( tbl.fields[i].base );
    od;

    result:= [];

    # if 'mocchars' is not a list of lists, divide it into pieces of length
    # 'nccl'
    if not IsList( mocchars[1] ) then
      nccl:= Length( tbl.GAPtbl.centralizers );
      mocchars:= List( [ 1 .. Length( mocchars ) / nccl ],
                       i -> mocchars{ [ (i-1)*nccl+1 .. i*nccl ] } );
    fi;

    for chi in mocchars do
      GAPchi:= [];
      # loop over classes of the {\GAP} table
      for i in [ 1 .. Length( tbl.galconjinfo ) / 2 ] do

        # the number of the cyclic subgroup in the MOC table
        numb:= tbl.galconjinfo[ 2*i - 1 ];
        if tbl.fields[ numb ] = Rationals then

          # rational class
          GAPchi[i]:= chi[ map[ tbl.galconjinfo[ 2*i-1 ] ][1] ];

        elif tbl.galconjinfo[ 2*i ] = 1 then

          # representative of cyclic subgroup, not rational
          GAPchi[i]:= chi{ map[ numb ] } * tbl.fields[ numb ].base;

        else

          # irrational class, no representative:
          # conjugate the value on the representative class
          GAPchi[i]:=
             GaloisCyc( GAPchi[ ( Position( tbl.galconjinfo, numb ) + 1 ) / 2 ],
                        tbl.galconjinfo[ 2*i ] );

        fi;
      od;
      Add( result, GAPchi );
    od;
    return result;
    end;


#############################################################################
##
#V  MOCTableOps  . . . . . . . . . . . . . . . . .  operations for MOC tables
##
MOCTableOps := OperationsRecord( "MOCTableOps" );

MOCTableOps.Print :=  function( tbl )
     local i, flds, val;
     Print( "rec( " );
     flds:= RecFields( tbl );
     for i in [ 1 .. Length( flds ) - 1 ] do
       val:= tbl.( flds[i] );
       if   flds[i] = "ordinary" then
         Print( "ordinary := \"",
                tbl.ordinary.identifier, "\", " );
       elif flds[i] = "GAPtbl" then
         Print( "GAPtbl := CharTable( \"",
                tbl.GAPtbl.identifier, "\" ), " );
       elif IsString( val ) then
         Print( flds[i], " := \"", val, "\", " );
       else
         Print( flds[i], " := ", val, ", " );
       fi;
     od;
     if flds <> [] then
       i:= Length( flds );
       val:=  tbl.( flds[i] );
       if   flds[i] = "ordinary" then
         Print( "ordinary := \"",
                tbl.ordinary.identifier, "\", " );
       elif flds[i] = "GAPtbl" then
         Print( "GAPtbl := CharTable( \"",
                tbl.GAPtbl.identifier, "\" ), " );
       elif IsString( val ) then
         Print( flds[i], " := \"", val, "\"" );
       else
         Print( flds[i], " := ", val );
       fi;
     fi;
     Print( " )" );
     end;


#############################################################################
##
#F  MOCTable( <gaptbl> )
#F  MOCTable( <gaptbl>, <basicset> )
##
##  return the MOC table record of the {\GAP} table <gaptbl> and stores it
##  in the component 'MOCtbl' of <gaptbl>.
##
##  The first form can be used for ordinary ($G.0$) tables, for $G.p$ tables
##  one has to specify a basic set <basicset> which must be a list of 
##  positions of the basic set characters in the 'irreducibles' component
##  of the corresponding ordinary table (which is stored in
##  <gaptbl>.ordinary).
##
##  The result contains the information of <gaptbl> in a format similar to
##  the MOC 3 format, the table itself can e.g. easily be printed out or be
##  used to print out characters using "PrintToMOC".
##
##  The components of the result are
##  'name'        : the string 'MOCTable(<name>)' where <name> is the
##                  'identifier' component of <gaptbl>,
##  'isMOCformat' : has value 'true',
##  'GAPtbl'      : the record <gaptbl>,
##  'operations'  : equal to 'MOCTableOps', containing just an appropriate
##                  'Print' function,
##  'prime'       : the characteristic of the field (label 30105 in MOC),
##  'centralizers': centralizer orders for cyclic subgroups (label 30130)
##  'orders'      : element orders for cyclic subgroups (label 30140)
##  'fields'      : at position 'i' the number field generated by the
##                  character values of the 'i'--th cyclic subgroup;
##                  the 'base' component of each field is a Parker base,
##                  (the length of 'fields' is equal to the value of label
##                  30110 in MOC).
##  'cycsubgps'   : 'cycsubgps[i] = j' means that class 'i' of
##                  the {\GAP} table belongs to the 'j'--th cyclic subgroup
##                  of the {\GAP} table,
##  'repcycsub'   : 'repcycsub[j] = i' means that class 'i' of
##                  the {\GAP} table is the representative of
##                  the 'j'--th cyclic subgroup of the {\GAP} table.
##                  *Note* that the representatives of {\GAP} table and
##                  MOC table need not agree!
##  'galconjinfo' : a list $[ r_1,c_1,r_2,c_2,\ldots,r_n,c_n ]$
##                  which means that the $i$--th class of the GAP table is
##                  the $c_i$--th conjugate of the representative of
##                  the $r_i$--th cyclic subgroup on the MOC table.
##                  (This is used to translate back to GAP format,
##                  stored under label 30160)
##  '30170'       : (power maps) for each cyclic subgroup (except
##                  the trivial one) and each prime divisor of
##                  the representative order store four values, the number
##                  of the subgroup, the power, the number of the cyclic
##                  subgroup containing the image, and the power to which
##                  the representative must be raised to give the image
##                  class.  (This is used only to construct the '30230'
##                  power map/embedding information.)
##                  In 'result.30170' only a list of lists (one for each
##                  cyclic subgroup) of all these values is stored,
##                  it will not be used by {\GAP}.
##  'tensinfo'    : tensor product information, used to compute the
##                  coefficients of the Parker base for tensor products
##                  of characters (label 30210 in MOC).
##                  For a field with vector space base $(v_1,v_2,\ldots,v_n)$
##                  the tensor product information of a cyclic subgroup
##                  in MOC (as computed by 'fct') is either 1 (for rational
##                  classes) or a sequence
##                  \[ n x_{1,1} y_{1,1} z_{1,1} x_{1,2} y_{1,2} z_{1,2}
##                     \ldots x_{1,m_1} y_{1,m_1} z_{1,m_1} 0 x_{2,1} y_{2,1}
##                     z_{2,1} x_{2,2} y_{2,2} z_{2,2} \ldots x_{2,m_2}
##                     y_{2,m_2} z_{2,m_2} 0 \ldots x_{n,m_n} y_{n,m_n}
##                     z_{n,m_n} 0 \]
##                  which means that the coefficient of $v_k$ in the product
##                  \[ ( \sum_{i=1}^{n} a_i v_i ) ( \sum_{j=1}^{n} b_j v_j ) \]
##                  is equal to
##                  \[ \sum_{i=1}^{m_k} x_{k,i} a_{y_{k,i}} b_{z_{k,i}}\ . \]
##                  On a MOC table in {\GAP} the 'tensinfo' component is
##                  a list of lists, each containing exactly the sequence
##  'invmap'      : inverse map to compute complex conjugate characters,
##                  label 30220 in MOC.
##  'powerinfo'   : field embeddings for $p$--th symmetrizations, $p$ prime
##                  in '[ 2 .. 19 ]'; note that the necessary power maps
##                  must be stored on <gaptbl> to compute this component.
##                  (label 30230 in MOC)
##  '30900'       : basic set of restricted ordinary irreducibles in the
##                  case of nonzero characteristic, all ordinary irreducibles
##                  else.
##
MOCTable := function( arg )
    if Length( arg ) = 1 and IsRec( arg[1] ) then
      return MOCTable0( arg[1] );
    elif Length( arg ) = 2 and IsRec( arg[1] ) and IsList( arg[2] ) then
      return MOCTableP( arg[1], arg[2] );
    else
      Error( "usage: MOCTable( <gaptbl> ) resp.",
                   " MOCTable( <gaptbl>, <basicset> )" );
    fi;
    end;


#############################################################################
##
#F  MOCTable0( <gaptbl> )
##
##  MOC format table of ordinary {\GAP} table <gaptbl>
##
MOCTable0 := function( gaptbl )
    local i, j, k, d, n, p, result, trans, gal, extendedfields, entry, pow,
          im, cl, field, struct, rep, aut;

    if not IsBound( gaptbl.powermap ) then
      gaptbl.powermap:= [];
    fi;

    # initialize the record
    result:= rec( identifier
                    := Concatenation( "MOCTable(", gaptbl.identifier, ")" ),
                  isMOCformat:= true,
                  prime  := 0,
                  fields := [],
                  GAPtbl := gaptbl,
                  operations := MOCTableOps );
    gaptbl.MOCtbl:= result;

#T !!
    result.name:= result.identifier;

    # 1. Compute necessary information to encode the irrational columns.
    #
    #    Each family of $n$ Galois conjugate classes is replaced by $n$
    #    integral columns, each number field with Parker base as
    #    integral base is stored in the component 'fields' of the result.
    #
    trans:= TransposedMat( gaptbl.irreducibles );
    gal:= GaloisMat( trans ).galoisfams;

    result.cycsubgps:= [];
    result.repcycsub:= [];
    result.galconjinfo:= [];
    for i in [ 1 .. Length( gal ) ] do
      if gal[i] = 1 then
        Add( result.repcycsub, i );
        result.cycsubgps[i]:= Length( result.repcycsub );
        Append( result.galconjinfo, [ Length( result.repcycsub ), 1 ] );
      elif gal[i] <> 0 then
        Add( result.repcycsub, i );
        n:= Length( result.repcycsub );
        for k in gal[i][1] do
          result.cycsubgps[k]:= n;
        od;
        Append( result.galconjinfo, [ Length( result.repcycsub ), 1 ] );
      else
        rep:= result.repcycsub[ result.cycsubgps[i] ];
        aut:= gal[ rep ][2][ Position( gal[ rep ][1], i ) ]
                 mod NofCyc( trans[i] );
        Append( result.galconjinfo, [ result.cycsubgps[i], aut ] );
      fi;
    od;

    # centralizer orders and element orders
    # (for representatives of cyclic subgroups only)
    result.centralizers:= gaptbl.centralizers{ result.repcycsub };
    result.orders:= gaptbl.orders{ result.repcycsub };

    # the fields (for cyclic subgroups only)
    result.fields:= List( result.repcycsub,
                          i -> FieldInfo( Field( trans[i] ) ).MOCfield );

    # fields for all classes (used by 'PowerInfo')
    extendedfields:= List( [ 1 .. Length( gal ) ], x -> 0 );
    for i in [ 1 .. Length( result.repcycsub ) ] do
      extendedfields[ result.repcycsub[i] ]:= result.fields[i];
    od;

    # '30170' powermaps:
    # for each cyclic subgroup (except the trivial one) and each prime
    # divisor of the representative order store four values, the number
    # of the subgroup, the power, the number of the cyclic subgroup
    # containing the image, and the power to which the representative
    # must be raised to give the image class.
    # (This is used only to construct the '30230' power map/embedding
    # information.)
    # In 'result.30170' only a list of lists (one for each cyclic subgroup)
    # of all these values is stored, it will not be used by {\GAP}.
    #
    result.30170:= [ [] ];
    for i in [ 2 .. Length( result.repcycsub ) ] do

      entry:= [];
      for d in Set( FactorsInt( gaptbl.orders[ result.repcycsub[i] ] ) ) do

        # cyclic subgroup 'i' to power 'd'
        Add( entry, i );
        Add( entry, d );
        pow:= gaptbl.powermap[d][ result.repcycsub[i] ];

        if gal[ pow ] = 1 then

          # rational class
          Add( entry, Position( result.repcycsub, pow ) );
          Add( entry, 1 );

        else

          # get the representative 'im'
          im:= result.repcycsub[ result.cycsubgps[ pow ] ];
          cl:= Position( gal[ im ][1], pow );

          # the image is class 'im' to power 'gal[ im ][2][cl]'
          Add( entry, Position( result.repcycsub, im ) );
          Add( entry, gal[ im ][2][cl]
                              mod gaptbl.orders[ result.repcycsub[i] ] );

        fi;

      od;

      Add( result.30170, entry );

    od;

    # tensor product information, used to compute the coefficients of
    # the Parker base for tensor products of characters.
    result.tensinfo:= [];
    for field in result.fields do
      if field = Rationals then
        Add( result.tensinfo, [ 1 ] );
      else
        struct:= StructureConstants( field );
        n:= Length( struct );
        entry:= [ n ];
        for i in [ 1 .. n ] do
          for j in [ 1 .. n ] do
            for k in [ 1 .. n ] do
              if struct[i][j][k] <> 0 then
                Append( entry, [ struct[i][j][k], j, k ] );
              fi;
            od;
          od;
          Add( entry, 0 );
        od;
        Add( result.tensinfo, entry );
      fi;
    od;

    # '30220' inverse map (to compute complex conjugate characters)
    result.invmap:= PowerInfo( extendedfields, gal, 0, -1 );

    # '30230' power map (field embeddings for $p$--th symmetrizations,
    #                    $p$ prime in '[ 2 .. 19 ]');
    #         note that the necessary power maps must be stored on 'gaptbl'

    # add missing power maps
    for p in [ 2 .. Maximum( Maximum( gaptbl.orders ), 19 ) ] do
      if not IsBound( gaptbl.powermap[p] ) and IsPrimeInt( p ) then
        gaptbl.powermap[p]:=
               Parametrized( Powermap( gaptbl, p, rec( quick:= true ) ) );
      fi;
    od;

    result.powerinfo:= [];
    for p in [ 2, 3, 5, 7, 11, 13, 17, 19 ] do
      result.powerinfo[p]:=
                PowerInfo( extendedfields, gal, gaptbl.powermap, p );
    od;

    # '30900': here all irreducible characters
    result.30900:= MOCChars( result, gaptbl.irreducibles );

    return result;
    end;


#############################################################################
##
#F  MOCTableP( <gaptbl>, <basicset> )
##
##  MOC format table of modular {\GAP} table <gaptbl>, with basic set of
##  ordinary irreducibles at positions in '<gaptbl>.ordinary.irreducibles'
##  given in <basicset>
##
MOCTableP := function( gaptbl, basicset )
    local i, j, p, result, fusion, mocfusion, images, ordinary, fld, pblock,
          invpblock, ppart, ord, degrees, defect, deg, charfusion, pos,
          repcycsub, ncharsperblock, restricted, invcharfusion, inf, mapp;

    # check the arguments
    if not ( IsRec( gaptbl ) and IsBound( gaptbl.ordinary ) and
             IsList( basicset ) ) then
      Error( "<gaptbl> must be a record with component 'ordinary',",
             " <basicset> must be a list" );
    fi;

    # if necessary, compute the MOC format table of the ordinary table 
    if not IsBound( gaptbl.ordinary.MOCtbl ) then
      MOCTable0( gaptbl.ordinary );
    fi;

    # transfer information from ordinary MOC table to 'result'
    ordinary:= gaptbl.ordinary.MOCtbl;
    fusion:= GetFusionMap( gaptbl, gaptbl.ordinary );
    images:= Set( ordinary.cycsubgps{ fusion } );

    # initialize the record
    result:= rec( identifier
                   := Concatenation( "MOCTable(", gaptbl.identifier, ")" ),
                  isMOCformat:= true,
                  prime  := gaptbl.prime,
                  fields := [],
                  ordinary:= gaptbl.ordinary.MOCtbl,
                  GAPtbl := gaptbl,
                  operations := MOCTableOps );
    gaptbl.MOCtbl:= result;

#T remove this ...
    result.name := result.identifier;

    result.cycsubgps:= List( fusion,
                   x -> Position( images, ordinary.cycsubgps[x] ) );
    repcycsub:= ProjectionMap( result.cycsubgps );
    result.repcycsub:= repcycsub;

    mocfusion:= CompositionMaps( ordinary.cycsubgps, fusion );

    # fusion map to restrict characters from 'ordinary' to 'result'
    charfusion:= [];
    pos:= 1;
    for i in [ 1 .. Length( result.cycsubgps ) ] do
      Add( charfusion, pos );
      pos:= pos + 1;
      while pos <= Length( result.ordinary.GAPtbl.orders ) and
            result.ordinary.GAPtbl.orders[ pos ] mod gaptbl.prime = 0 do
        pos:= pos + 1;
      od;
    od;

    StoreFusion( result, ordinary, charfusion );
    invcharfusion:= InverseMap( charfusion );

    result.galconjinfo:= [];
    for i in fusion do
      Append( result.galconjinfo,
              [ Position( images, ordinary.galconjinfo[ 2*i-1 ] ),
                ordinary.galconjinfo[ 2*i ] ] );
    od;

    for fld in [ "centralizers", "orders", "fields", "30170",
                 "tensinfo", "invmap" ] do
      result.( fld ):= List( result.repcycsub,
                             i -> ordinary.( fld )[ mocfusion[i] ] );
    od;

    mapp:= InverseMap( CompositionMaps( ordinary.cycsubgps,
               CompositionMaps( charfusion,
                   InverseMap( result.cycsubgps ) ) ) );
    for i in [ 2 .. Length( result.30170 ) ] do
      for j in 2 * [ 1 .. Length( result.30170[i] ) / 2 ] - 1 do
        result.30170[i][j]:= mapp[ result.30170[i][j] ];
      od;
    od;


    result.powerinfo:= [];
    for p in [ 2, 3, 5, 7, 11, 13, 17, 19 ] do

      inf:= List( result.repcycsub,
                  i -> ordinary.powerinfo[p][ mocfusion[i] ] );
      for i in [ 1 .. Length( inf ) ] do
        pos:= 2;
        while pos < Length( inf[i] ) do
          while inf[i][ pos + 1 ] <> 0 do
            inf[i][ pos ]:= invcharfusion[ inf[i][ pos ] ];
            pos:= pos + 2;
          od;
          inf[i][ pos ]:= invcharfusion[ inf[i][ pos ] ];
          pos:= pos + 3;
        od;
      od;
      result.powerinfo[p]:= inf;

    od;

    # '30310' number of $p$--blocks
    pblock:= List( gaptbl.ordinary.irredinfo,
                   x -> x.pblock[ result.prime ] );
    invpblock:= InverseMap( pblock );
    for i in [ 1 .. Length( invpblock ) ] do
      if IsInt( invpblock[i] ) then
        invpblock[i]:= [ invpblock[i] ];
      fi;
    od;
    result.30310:= Maximum( pblock );

    # '30320' defect, numbers of ordinary and modular characters per block
    result.30320:= [ ];
    ppart:= 0;
    ord:= gaptbl.size;
    while ord mod gaptbl.prime = 0 do
      ppart:= ppart + 1;
      ord:= ord / gaptbl.prime;
    od;

    for i in [ 1 .. Length( invpblock ) ] do
      defect:= gaptbl.prime ^ ppart;
      for j in invpblock[i] do
        deg:= gaptbl.ordinary.irreducibles[j][1];
        while deg mod defect <> 0 do
          defect:= defect / gaptbl.prime;
        od;
      od;
      restricted:= List( gaptbl.ordinary.irreducibles{ invpblock[i] },
                         x -> x{ fusion } );
      ncharsperblock:=
           Sum( restricted,
                y -> gaptbl.operations.ScalarProduct( gaptbl, y, y ) );
      Add( result.30320,
           [ ppart - Length( FactorsInt( defect ) ),
             Length( invpblock[i] ),
             ncharsperblock ] );
    od;

    # '30350' distribution of ordinary irreducibles to blocks
    #         (irreducible character number 'i' has number 'i')
    result.30350:= Copy( invpblock );

    # '30360' distribution of basic set characters to blocks:
    result.30360:= List( invpblock,
                         x -> List( Intersection( x, basicset ),
                                    y -> Position( basicset, y ) ) );

    # '30370' positions of basic set characters in 'irreducibles' (per block)
    result.30370:= List( invpblock, x -> Intersection( x, basicset ) );

    # '30550' decomposition of ordinary irreducibles in basic set
    basicset:= ordinary.GAPtbl.irreducibles{ basicset };
    basicset:= MOCChars( result, Restricted( basicset, fusion ) );
    result.30550:= DecompositionInt( basicset,
                          Restricted( ordinary.30900, charfusion ), 30 );

    # '30900' basic set of restricted ordinary irreducibles,
    result.30900:= basicset;

    return result;
    end;


#############################################################################
##
#F  PrintToMOC( <moctbl> )
#F  PrintToMOC( <moctbl>, <chars> )
##
##  prints the MOC3 format of the character table <moctbl>.  If the second
##  argument <chars> is specified, the (MOC format) characters in <chars>
##  are stored under label '30900', else the basic set of ordinary
##  irreducibles is stored there.
##  <moctbl> must be a MOC table in {\GAP} as produced by "MOCTable".
##
##  The MOC3 code of a 5 digit number in MOC2 code is given by the
##  following list.
##  (Note that the code must contain only lower case letters.)
##
##  'ABCD'    for '0ABCD'
##  'a'       for '10000'
##  'b'       for '10001'          'k'       for '20001'
##  'c'       for '10002'          'l'       for '20002'
##  'd'       for '10003'          'm'       for '20003'
##  'e'       for '10004'          'n'       for '20004'
##  'f'       for '10005'          'o'       for '20005'
##  'g'       for '10006'          'p'       for '20006'
##  'h'       for '10007'          'q'       for '20007'
##  'i'       for '10008'          'r'       for '20008'
##  'j'       for '10009'          's'       for '20009'
##  'tAB'     for '100AB'
##  'uAB'     for '200AB'
##  'vABCD'   for '1ABCD'
##  'wABCD'   for '2ABCD'
##  'yABC'    for '30ABC'
##  'z'       for '31000'
##
##  *Note* that any long number in MOC2 format is divided into packages of
##  length 4, the beginning (!) filled with leading zeros if necessary.
##  Such a number with decimals $d_1, d_2, \ldots, d_{4n+k}$ is the sequence
##  \[ 0d_1d_2d_3d_4 \ldots 0d_{4n-3}d_4n-2}d_{4n-1}d_{4n}
##     xd_{4n+1}\ldots d_{4n+k} \]
##  where $0 \leq k \leq 3$, and the first digit of $x$ is $1$ if the number
##  is positive, it is $2$ if the number is negative, and then follow $(4-k)$
##  zeros.
##
PrintToMOC := function( arg )
    local i, j, d, p,              # loop variables
          tbl,                     # contained in 'arg'
          ncol, free,              # number of columns for printing
          sizescreen,              # remember size of screen
          lettP, lettN, digit,     # lists of letters for encoding
          Pr, PrintNumber,         # local functions for printing
          trans, gal,
          repcycsub,
          ord,                     # corresponding ordinary table
          fus, invfus,             # transfer between ord. and modular table
          restr,                   # restricted ordinary irreducibles
          basicset, BS,            # numbers in basic set, basic set itself
          aut, gallist, fields,
          F,
          pow, im, cl,
          info, chi,
          dec;

    # 1. Preliminaries\:
    #    initialisations, local functions needed for encoding and printing

    # number of columns for printing
    ncol:= 80;
    sizescreen:= SizeScreen();
    SizeScreen( [ 82 ] );
    free:= ncol;

    # encode numbers in '[ -9 .. 9 ]' as letters
    lettP:= "abcdefghij";
    lettN:= "klmnopqrs";
    digit:= "0123456789";

    # local function 'Pr'\:\ print 'string' in lines of length 'ncol'
    Pr:= function( string )
    local len;
    len:= Length( string );
    if len <= free then
      Print( string );
      free:= free - len;
    else
      if free > 0 then
        Print( string{ [ 1 .. free ] } );
        string:= string{ [ free+1 .. len ] };
      fi;
      Print( "\n" );
      for i in [ 1 .. Int( ( len - free ) / ncol ) ] do
        Print( string{ [ 1 .. ncol ] }, "\n" );
        string:= string{ [ ncol+1 .. Length( string ) ] };
      od;
      free:= ncol - Length( string );
      if free <> ncol then Print( string ); fi;
    fi;
    end;

    # local function 'PrintNumber'\:\ print {\MOC3} code of number 'number'
    PrintNumber:= function( number )
    local i, sumber, sumber1, sumber2, len, rest;
    sumber:= String( AbsInt( number ) );
    len:= Length( sumber );
    if len > 4 then

      # long number, fill with leading zeros
      rest:= len mod 4;
      if rest = 0 then rest:= 4; fi;
      for i in [ 1 .. 4-rest ] do
        sumber:= Concatenation( "0", sumber );
        len:= len+1;
      od;

      sumber1:= sumber{ [ 1 .. len - 4 ] };
      sumber2:= sumber{ [ len - 3 .. len ] };

      # code of last digits is always 'vABCD' or 'wABCD'
      if number >= 0 then
        sumber:= Concatenation( sumber1, "v", sumber2 );
      else
        sumber:= Concatenation( sumber1, "w", sumber2 );
      fi;

    else

      # short numbers (up to 9999), encode the last digits
      if len = 1 then
        if number >= 0 then
          sumber:= [ lettP[ Position( digit, sumber[1] )     ] ];
        else
          sumber:= [ lettN[ Position( digit, sumber[1] ) - 1 ] ];
        fi;
      elif len = 2 then
        if number >= 0 then
          sumber:= Concatenation( "t", sumber );
        else
          sumber:= Concatenation( "u", sumber );
        fi;
      elif len = 3 then
        if number >= 0 then
          sumber:= Concatenation( "v0", sumber );
        else
          sumber:= Concatenation( "w0", sumber );
        fi;
      else
        if number >= 0 then
          sumber:= Concatenation( "v", sumber );
        else
          sumber:= Concatenation( "w", sumber );
        fi;
      fi;
    fi;

    # print the code in lines of length 'ncol'
    Pr( sumber );
    end;

    if Length( arg ) = 1 and IsMat( arg[1] ) then

#       Pr( "y100" );

      # number of columns
      Pr( "y110" );
      PrintNumber( Length( arg[1] ) );
      PrintNumber( Length( arg[1] ) );

      # matrix entries under label '30900'
      Pr( "y900" );
      for i in arg[1] do
        for j in i do
          PrintNumber( j );
        od;
      od;

      Pr( "z" );

    elif not ( Length( arg ) in [ 1, 2 ] and IsRec( arg[1] ) and
             ( Length( arg ) = 1 or IsList( arg[2] ) ) ) then
      Error( "usage: PrintToMOC( <moctbl> ) resp.",
                   " PrintToMOC( <moctbl>, <chars> )" );

    else

      tbl:= arg[1];
  
      # '30100' start of the table
      Pr( "y100" );
  
      # '30105' characteristic of the field
      Pr( "y105" );
      PrintNumber( tbl.prime );
  
      # '30110' number of p-regular classes and of cyclic subgroups
      Pr( "y110" );
      PrintNumber( Length( tbl.GAPtbl.centralizers ) );
      PrintNumber( Length( tbl.centralizers ) );
  
      # '30130' centralizer orders
      Pr( "y130" );
      for i in tbl.centralizers do PrintNumber( i ); od;
  
      # '30140' representative orders of cyclic subgroups
      Pr( "y140" );
      for i in tbl.orders do PrintNumber( i ); od;
  
      # '30150' field information
      Pr( "y150" );
  
      # loop over cyclic subgroups
      for i in tbl.fields do
        if i = Rationals then
  
          PrintNumber( 1 );
  
        else
  
          F:= FieldInfo( i );
          PrintNumber( F.nofcyc );           # $\Q(e_N)$ is the conductor
          PrintNumber( Length( F.repres ) ); # degree of the field
          for j in F.repres do
            PrintNumber( j );                # representatives of the orbits
          od;
          PrintNumber( Length( F.stabil ) ); # no. of generators for stabilizer
          for j in F.stabil do
            PrintNumber( j );                # generators for stabilizer
          od;
  
        fi;
      od;
  
      # '30160' galconjinfo of classes:
      Pr( "y160" );
      for i in tbl.galconjinfo do PrintNumber( i ); od;
  
      # '30170' powermaps
      Pr( "y170" );
      for i in Flat( tbl.30170 ) do PrintNumber( i ); od;
  
      # '30210' tensor product information
      Pr( "y210" );
      for i in Flat( tbl.tensinfo ) do PrintNumber( i ); od;
  
      # '30220' inverse map (to compute complex conjugate characters)
      Pr( "y220" );
      for i in Flat( tbl.invmap ) do PrintNumber( i ); od;
  
      # '30230' power map (field embeddings for $p$--th symmetrizations,
      #                    $p$ in '[ 2, 3, 5, 7, 11, 13, 17, 19 ]');
      #         note that the necessary power maps must be stored on 'tbl'
      Pr( "y230" );
      for p in [ 2, 3, 5, 7, 11, 13, 17 ] do
        PrintNumber( p );
        for j in Flat( tbl.powerinfo[p] ) do PrintNumber( j ); od;
        Pr( "y050" );
      od;
      # no '30050' at the end!
      PrintNumber( 19 );
      for j in Flat( tbl.powerinfo[19] ) do PrintNumber( j ); od;
  
      # '30310' number of p-blocks
      if IsBound( tbl.30310 ) then
        Pr( "y310" );
        PrintNumber( tbl.30310 );
      fi;
  
      # '30320' defect, number of ordinary and modular characters per block
      if IsBound( tbl.30320 ) then
        Pr( "y320" );
        for i in tbl.30320 do
          PrintNumber( i[1] );
          PrintNumber( i[2] );
          PrintNumber( i[3] );
          Pr( "y050" );
        od;
      fi;
  
      # '30350' relative numbers of ordinary characters per block
      if IsBound( tbl.30350 ) then
        Pr( "y350" );
        for i in tbl.30350 do
          for j in i do PrintNumber( j ); od;
          Pr( "y050" );
        od;
      fi;
  
      # '30360' distribution of basic set characters to blocks\:
      #         relative numbers in the basic set
      if IsBound( tbl.30360 ) then
        Pr( "y360" );
        for i in tbl.30360 do
          for j in i do PrintNumber( j ); od;
          Pr( "y050" );
        od;
      fi;
  
      # '30370' relative numbers of basic set characters (blockwise)
      if IsBound( tbl.30370 ) then
        Pr( "y370" );
        for i in tbl.30370 do
          for j in i do PrintNumber( j ); od;
          Pr( "y050" );
        od;
      fi;
  
      # '30500' matrices of scalar products of Brauer characters with PS
      #         (per block)
      if IsBound( tbl.30500 ) then
        Pr( "y700" );
        for i in tbl.30700 do
          for j in Concatenation( i ) do PrintNumber( j ); od;
          Pr( "y050" );
        od;
      fi;
  
      # '30510' absolute numbers of '30500' characters
      if IsBound( tbl.30510 ) then
        Pr( "y510" );
        for i in tbl.30510 do PrintNumber( i ); od;
      fi;
  
      # '30550' decomposition of ordinary characters into basic set
      if IsBound( tbl.30550 ) then
        Pr( "y550" );
        for i in Concatenation( tbl.30550 ) do
          PrintNumber( i );
        od;
      fi;
  
      # '30590' ??
      # '30690' ??
  
      # '30700' matrices of scalar products of PS with BS (per block)
      if IsBound( tbl.30700 ) then
        Pr( "y700" );
        for i in tbl.30700 do
          for j in Concatenation( i ) do PrintNumber( j ); od;
          Pr( "y050" );
        od;
      fi;
  
      # '30710'
      if IsBound( tbl.30710 ) then
        Pr( "y710" );
        for i in tbl.30710 do PrintNumber( i ); od;
      fi;
  
      # '30900' basic set of restricted ordinary irreducibles,
      #         or characters in <chars>
  
      Pr( "y900" );
      if Length( arg ) = 2 then
  
        # case 'PrintToMOC( <tbl>, <chars> )'
        for chi in arg[2] do
          for i in chi do PrintNumber( i ); od;
        od;
  
      elif IsBound( tbl.30900 ) then
  
        # case 'PrintToMOC( <tbl> )'
        for i in Concatenation( tbl.30900 ) do PrintNumber( i ); od;
  
      fi;
  
      # '31000' end of table
      Pr( "z\n" );

    fi;

    # reset size of screen
    SizeScreen( sizescreen );
    end;


