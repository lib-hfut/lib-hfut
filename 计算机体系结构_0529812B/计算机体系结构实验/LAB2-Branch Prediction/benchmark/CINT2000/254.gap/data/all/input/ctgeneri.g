#############################################################################
##
#A  ctgeneri.g                  GAP library                     Oliver Bonten
#A                                                            & Thomas Breuer
##
#A  @(#)$Id: ctgeneri.g,v 3.34.1.1 1995/06/29 13:24:58 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains  those  functions  that  construct character tables.
##
#H  $Log: ctgeneri.g,v $
#H  Revision 3.34.1.1  1995/06/29  13:24:58  sam
#H  generic tables are detected via the component 'isGenericTable' now
#H
#H  Revision 3.34  1994/04/21  12:14:28  sam
#H  introduced 'identifier' component
#H
#H  Revision 3.33  1994/03/29  10:02:32  sam
#H  improvements in 'CharTableFactorGroup'
#H
#H  Revision 3.32  1994/02/15  17:11:06  sam
#H  introduced 'size' instead of 'order'
#H
#H  Revision 3.31  1993/10/19  17:02:36  sam
#H  fixed possible absence of 'powermap' component
#H
#H  Revision 3.30  1993/09/21  12:01:15  sam
#H  allowed 'CharTableIsoclinic' for Brauer tables,
#H  replaced 'ConcatenationString' by 'Concatenation'
#H
#H  Revision 3.29  1993/06/28  07:35:55  sam
#H  improved 'CharTableSpecialized'
#H
#H  Revision 3.28  1993/02/11  11:02:14  sam
#H  necessary change in 'CharTableNormalSubgroup'
#H
#H  Revision 3.0  1991/09/03  14:15:05  goetz
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
#F  CharTableRegular( <tbl>, <p> ) .  table consisting of <p>-regular classes
##
CharTableRegular := function( tbl, prime )
    local i, regular, fusion, inverse;
    fusion:= [];
    inverse:= [];
    for i in [ 1 .. Length( tbl.orders ) ] do
      if tbl.orders[i] mod prime <> 0 then
        Add( fusion, i );
        inverse[i]:= Length( fusion );
      fi;
    od;

    regular:= rec( identifier:= Concatenation( "Regular(", tbl.name,
                                                ",", String( prime ), ")" ),
                   prime:= prime,
                   size := tbl.size,
                   orders:= tbl.orders{ fusion },
                   centralizers:= tbl.centralizers{ fusion },
                   powermap:= [],
                   fusions:= [],
                   ordinary:= tbl,
                   operations:= CharTableOps );

#T remove this when the time of changes has arrived!
    regular.order:= regular.size;
    regular.name:= regular.identifier;

    StoreFusion( regular, tbl, rec( map:= fusion, type:= "choice" ) );
    if IsBound( tbl.powermap ) then
      for i in [ 1 .. Length( tbl.powermap ) ] do
        if IsBound( tbl.powermap[i] ) then
          regular.powermap[i]:= CompositionMaps( inverse,
                                  tbl.powermap[i]{ fusion } );
        fi;
      od;
    fi;
    
    InitClassesCharTable( regular );
    
    return regular;
    end;


#############################################################################
##
#F  CharTableDirectProduct( <tbl1>, <tbl2> )
##
##  table of the direct product;
##
##  Note\: The table of the direct product will contain all $p$-th powermaps
##         for which $p$-th powermaps are stored on both tables.
##         Additionally, if the $p$-th powermap is stored on one table, and
##         $p$ does not divide the order of the other table, 'Powermap' is
##         called, and if the map is uniquely determined, the table of the
##         direct product will contain the $p$-th powermap, too.
##
CharTableDirectProduct := function( tbl1, tbl2 )
    local i, j, k, direct, ncc1, ncc2, orders1, orders2, orders1_i, orders,
          fus, powermap_k, powermap1_k, powermap2_k, ncc2_i, pow;
    
    if not IsCharTable( tbl1 ) or not IsCharTable( tbl2 ) then
      Error( "arguments must be character tables" );
    fi;
    
    direct:= rec( size := tbl1.order * tbl2.order,
                  identifier:= Concatenation( tbl1.identifier, "x", tbl2.identifier ),
                  centralizers:= KroneckerProduct( [ tbl1.centralizers ],
                                         [ tbl2.centralizers ] )[1]      );
#T remove this when the time of changes has arrived!
    direct.order:= direct.size;
    direct.name:= direct.identifier;

    ncc1:= Length( tbl1.centralizers );
    ncc2:= Length( tbl2.centralizers );

    # class parameters, if present in both tables
    if IsBound( tbl1.classparam ) and IsBound( tbl2.classparam ) then
      direct.classparam:= [];
      for i in [ 1 .. ncc1 ] do
        for j in [ 1 .. ncc2 ] do
          direct.classparam[ j + ncc2 * ( i - 1 ) ]:=
                       [ tbl1.classparam[i], tbl2.classparam[j] ];
        od;
      od;
    fi;

    # element orders, if present in both tables
    if IsBound( tbl1.orders ) and IsBound( tbl2.orders ) then
      orders1:= tbl1.orders;
      orders2:= tbl2.orders;
      orders:= [];
      for i in [ 1 .. ncc1 ] do
        orders1_i:= orders1[i];
        for j in [ 1 .. ncc2 ] do
          orders[ j + ncc2 * ( i - 1 ) ]:= Lcm( orders1_i, orders2[j] );
        od;
      od;
      direct.orders:= orders;
    fi;
    
    # power maps, if present in both tables
    direct.powermap:= [];
    if IsBound( tbl1.powermap ) and IsBound( tbl2.powermap ) then
      for k in Union( Filtered( [ 1 .. Length( tbl1.powermap ) ],
                                x -> IsBound( tbl1.powermap[x] ) ),
                      Filtered( [ 1 .. Length( tbl2.powermap ) ],
                                x -> IsBound( tbl2.powermap[x] ) ) ) do
    
        # compute the powermap of the compound tables if the prime does
        # not divide the order
    
        if not IsBound( tbl1.powermap[k] ) and tbl1.size mod k <> 0 then
          InfoCharTable2( "#I CharTableDirectProduct: Powermap(<tbl1>,", k,
                          ",rec(quick:=true) ) called\n" );
          pow:= Parametrized( Powermap( tbl1, k, rec( quick:= true ) ) );
          if ForAll( pow, IsInt ) then tbl1.powermap[k]:= pow; fi;
        fi;
        if not IsBound( tbl2.powermap[k] ) and tbl2.size mod k <> 0 then
          InfoCharTable2( "#I CharTableDirectProduct: Powermap( <tbl2>, ", k,
                          ",rec( quick:= true ) ) called\n" );
          pow:= Parametrized( Powermap( tbl2, k, rec( quick:= true ) ) );
          if ForAll( pow, IsInt ) then tbl2.powermap[k]:= pow; fi;
        fi;
    
        if IsBound( tbl1.powermap[k] ) and IsBound( tbl2.powermap[k] ) then
          powermap_k:= [];
          powermap1_k:= tbl1.powermap[k];
          powermap2_k:= tbl2.powermap[k];
          for i in [ 1 .. ncc1 ] do
            ncc2_i:= ncc2 * (i-1);
            for j in [ 1 .. ncc2 ] do
              powermap_k[ j + ncc2_i ]:=
                        powermap2_k[j] + ncc2 * ( powermap1_k[i] - 1 );
            od;
          od;
          direct.powermap[k]:= powermap_k;
        fi;
      od;
    fi;

    # irreducibles and character parameters, if present in both tables
    if IsBound( tbl1.irreducibles ) and IsBound( tbl2.irreducibles ) then

      direct.irreducibles:=
                   KroneckerProduct( tbl1.irreducibles, tbl2.irreducibles );

      direct.irredinfo:= List( direct.irreducibles, x -> rec() );

      if IsBound( tbl1.irredinfo ) and IsBound( tbl2.irredinfo ) and
         IsBound( tbl1.irredinfo[1] ) and IsBound( tbl2.irredinfo[1] ) and
         IsBound( tbl1.irredinfo[1].charparam ) and
         IsBound( tbl2.irredinfo[1].charparam ) then
        direct.charparam:= [];
        for i in [ 1 .. ncc1 ] do
          for j in [ 1 .. ncc2 ] do
            direct.irredinfo[ j + ncc2 * ( i - 1 ) ].charparam:=
              [ tbl1.irredinfo[i].charparam, tbl2.irredinfo[j].charparam ];
          od;
        od;
      fi;
    
    fi;

    # embeddings and projections
    direct.fusionsource:= [];
    fus:= [];
    for i in [ 1 .. ncc1 ] do
      for j in [ 1 .. ncc2 ] do fus[ ( i - 1 ) * ncc2 + j ]:= i; od;
    od;
    direct.fusions:= [ rec( name:= tbl1.identifier, map:= fus, type:= "factor" ) ];
    fus:= [];
    for i in [ 1 .. ncc1 ] do
      for j in [ 1 .. ncc2 ] do fus[ ( i - 1 ) * ncc2 + j ]:= j; od;
    od;
    direct.fusions[2]:= rec( name:= tbl2.identifier, map:= fus, type:= "factor" );
    fus:= [];
    for i in [ 1 .. ncc1 ] do fus[i]:= ( i - 1 ) * ncc2 + 1; od;
    if GetFusionMap( tbl1, direct ) <> false then
      for i in [ 1 .. Length( tbl1.fusions ) ] do
        if tbl1.fusions[i].name = direct.identifier then
          if tbl1.fusions[i].map <> fus then
            tbl1.fusions[i]:= rec( name:= direct.identifier,
                                   map:= fus, type:= "normal" );
            Add( direct.fusionsource, tbl1.identifier );
            Print( "#I CharTableDirectProduct: existing subgroup fusion on",
                   " <tbl1> replaced\n#I    by actual one\n" );
          fi;
        fi;
      od;
    else
      StoreFusion( tbl1, direct, rec( map:= fus, type:= "normal" ) );
    fi;
    fus:= [];
    for i in [ 1 .. ncc2 ] do fus[i]:= i; od;
    if GetFusionMap( tbl2, direct ) <> false then
      for i in [ 1 .. Length( tbl2.fusions ) ] do
        if tbl2.fusions[i].name = direct.identifier then
          if tbl2.fusions[i].map <> fus then
            tbl2.fusions[i]:= rec( name:= direct.identifier,
                                   map:= fus, type:= "normal" );
            Add( direct.fusionsource, tbl2.identifier );
            Print( "#I CharTableDirectProduct: existing subgroup fusion on",
                   " <tbl2> replaced\n#I    by actual one\n" );
          fi;
        fi;
      od;
    else
      StoreFusion( tbl2, direct, rec( map:= fus, type:= "normal" ) );
    fi;
    
    InitClassesCharTable( direct );
    direct.operations:= CharTableOps;
    
    return direct;
    end;


#############################################################################
##
#F  CharTableFactorGroup( <tbl>, <classes_of_normal_subgroup> )
##
##  the tbl of the factor group of <tbl> with respect to the intersection
##  of kernels of those irreducibles stored on <tbl> which contain
##  <classes_of_normal_subgroups> in their kernel;
##  if all irreducible characters of <tbl> are stored, the calculated
##  normal subgroup is the normal closure of <classes_of_normal_subgroup>.
##
CharTableFactorGroup := function( tbl, classes_of_normal_subgroup )
    local i, j, k, x, factortable, normal_subgroup, factorirreducibles, chi,
          suborder, classums, orders, facts, upper, lower, inverse, pow,
          facpow, images, values, rpow, dubious, factorfusion, classsums,
          factors;

    if Length( tbl.irreducibles ) < Length( tbl.irreducibles[1] ) then
      Print("#I CharTableFactorGroup: Some irreducible characters of <tbl>\n",
            "#I   are missing;\n",
            "#I   perhaps the calculated normal subgroup will be too big.\n");
    fi;

    factorirreducibles:= [];
    normal_subgroup:= [ 1 .. Length( tbl.centralizers ) ];
    for chi in tbl.irreducibles do
      if Difference( classes_of_normal_subgroup, KernelChar(chi) ) = [] then
        normal_subgroup:= Intersection( normal_subgroup, KernelChar(chi) );
        Add( factorirreducibles, chi );
      fi;
    od;
    suborder:= 0;    # the order of 'normal_subgroup'
    for i in normal_subgroup do suborder:= suborder + tbl.classes[ i ]; od;
    if tbl.size mod suborder <> 0 then
      Error("intersection of kernels of irreducible characters containing\n",
         "<classes_normal_subgroup> has an order not dividing that of <tbl>");
    fi;
    factortable:= rec( size:= tbl.size / suborder );
    factortable.identifier:= Concatenation( tbl.name, "/",
                                  String( classes_of_normal_subgroup ) );

#T Remove this when the time of changes has arrived!
    factortable.order:= factortable.size;
    factortable.name:= Concatenation( tbl.name, "/",
                                  String( classes_of_normal_subgroup ) );

    factorirreducibles:= CollapsedMat( factorirreducibles, [] );
    factorfusion:= factorirreducibles.fusion;
    factorirreducibles:= factorirreducibles.mat;
    #
    # centralizers of the factor group:
    # \[ \|C_{G\|N}(gN)\| = \frac{\|G\|/\|N\|}{\|Cl_{G/N}(gN)\|}
    # = \frac{\|G\|:\|N\|}{\frac{1}{\|N\|}\sum_{x fus gN} \|Cl_G(x)\|}
    # = \frac{\|G\|}{\sum_{x fus gN} \|Cl_G(x)\| \]
    #
    classsums:= [];
    for i in [ 1 .. Length( factorirreducibles[1] ) ] do
      classsums[i]:= 0;
    od;
    for i in [ 1 .. Length( factorfusion ) ] do
      classsums[ factorfusion[i] ]:=
                            classsums[ factorfusion[i] ] + tbl.classes[i];
    od;
    factortable.centralizers:= List( classsums, x -> tbl.size / x );
    if not ForAll( factortable.centralizers, IsInt ) then
      Print( "#I CharTableFactorGroup: not all centralizer orders\n",
             "#I    of the factor group are well defined\n" );
    fi;
    #
    factortable.powermap:= [];
    factortable.fusions:= [];
    factortable.fusionsource:= [ tbl.identifier ];
    factortable.irreducibles:= factorirreducibles;

    if IsBound( tbl.orders ) then

      # determine representative orders up to factors of suborder:
      #
      # 1. the representative order is a divisor of the gcd of all
      #    repres. orders of preimages (and divides 'factortable.size')
      #
      # 2. For all preimages $x$ of $gN$ we have
      #    \[ \frac{\langle x \rangle}{\gcd( \langle x \rangle, \|N\|)}
      #    \mbox{\rm divides} \|\langle gN \rangle\|, \]
      #    so  \[ lcm_{x fus gN}(\frac{\|\langle x \rangle\|}{\gcd(\|\langle
      #    x \rangle\|, \|N\|)}) \mbox{\rm divides} \|langle gN \rangle\|. \]
      #
      inverse:= InverseMap( factorfusion );
      orders:= CompositionMaps( tbl.orders, inverse );
      factors:= FactorsInt( suborder );
      if IsSet( orders[1] ) then
        if 1 in orders[1] then
          orders[1]:= 1;
        else
          Print("#I CharTableFactorGroup: class 1 cannot be the identity\n");
        fi;
      fi;
      for i in [ 2 .. Length( orders ) ] do
        if IsSet( orders[i] ) then
          upper:= GcdInt( Iterated( orders[i], GcdInt ), factortable.size );
          lower:= Lcm( List( orders[i], x -> x / GcdInt( x, suborder ) ) );
        else
          upper:= orders[i];
          lower:= orders[i] / GcdInt( orders[i], suborder );
        fi;
        if upper = 1 or upper mod lower <> 0 then
          Print( "#I CharTableFactorGroup: representative orders and",
                 " factorfusion\n",
                 "#I   are not consistent at classes ", inverse[i], "\n" );
          orders[i]:= Unknown();
        elif upper = lower then
          orders[i]:= upper;
        else
          orders[i]:= Difference( lower * DivisorsInt( upper/lower ), [1] );
          if Length( orders[i] ) = 1 then orders[i]:= orders[i][1]; fi;
        fi;
      od;
    fi;
    #
    # if powermaps of <tbl> are known, transfer them to 'factortable':
    #
    if IsBound( tbl.powermap ) then
      inverse:= InverseMap( factorfusion );
      for i in [ 1 .. Length( inverse ) ] do
        if IsInt( i ) then inverse[i]:= [ inverse[i] ]; fi;
      od;
      for i in [ 1 .. Length( tbl.powermap ) ] do
        if IsBound( tbl.powermap[i] ) then
          pow:= tbl.powermap[i];
          facpow:= [];
          for j in [ 1 .. Length( inverse ) ] do
            # if the powermap of <tbl> is unique for all preimages
            # of j all powers of the preimages must be equal;
            # if there is a proper parametrized map the power of
            # j is the image of the intersection of the powers
            # of all preimages.
            images:= Set( CompositionMaps( factorfusion,
                             CompositionMaps(tbl.powermap[i],inverse[j]) ) );
            if Length( images ) = 1 then
              facpow[j]:= images[1];
            elif ForAll( inverse[j], x -> IsInt( pow[x] ) )
                 and not IsInt( images[1] ) then
              Print( "#I CharTableFactorGroup: factorfusion and ", Ordinal(i),
                     " powermap inconsistent at classes ", inverse[j], "\n" );
              facpow[j]:= Unknown();
            else
              for k in [ 1 .. Length( images ) ] do
                if IsInt( images[k] ) then images[k]:= [ images[k] ]; fi;
              od;
              facpow[j]:= Iterated( images, Intersection );
              if facpow[j] = [] then
                Print( "#I CharTableFactorGroup: factorfusion and ",
                       Ordinal( i ), " powermap inconsistent at classes ",
                       inverse[j], "\n" );
                facpow[j]:= Unknown(0);
              fi;
            fi;
          od;
          factortable.powermap[i]:= facpow;
        fi;
      od;
    fi;
    #
    # initialize powermaps for prime divisors of 'factortable.size'
    # if not yet known:
    #
    for i in Set( FactorsInt( factortable.size ) ) do
      if i > 1 and not IsBound( factortable.powermap[i] ) then
        factortable.powermap[i]:= InitPowermap( factortable, i );
        Congruences( factortable, factorirreducibles,
                     factortable.powermap[i], i );
      fi;
    od;
    if IsBound( tbl.orders ) then

      # try to improve representative orders and powermaps:
      # For each prime divisor 'p' of 'factortable.size' we define a map
      # 'rpow[p]' as follows:
      # \['rpow[p][x]':=\left\{\begin{array}{lcl} x/p & ; & 'x mod p = 0\\
      #                    x & ; & \mbox{\rm otherwise}\end{array}\right.\]
      # (Of course we only define it for values 'x' which occur as possible
      # representative orders.)

      # Then we must have 'CompositionMaps( orders, factortable.powermap[p] )
      # = CompositionMaps( rpow[p], orders )', so 'TestConsistencyMaps'
      # is called.

      values:= [];
      for i in orders do
        if IsInt( i ) then
          AddSet( values, i );
        else
          values:= Union( values, i );
        fi;
      od;
      rpow:= [];
      for i in Set( FactorsInt( factortable.size ) ) do
        rpow[i]:= [];
        for x in values do
          if x mod i = 0 then
            rpow[i][x]:= x / i;
          else
            rpow[i][x]:= x;
          fi;
        od;
      od;
      TestConsistencyMaps( factortable.powermap, orders, rpow );
      if InfoCharTable2 <> Ignore then
        dubious:= [];
        for i in [ 1 .. Length( orders ) ] do
          if IsList( orders[i] ) then Add( dubious, i ); fi;
        od;
        if dubious <> [] then
          Print( "#I CharTableFactorGroup: The representative order is",
                 " dubious\n",
                 "#I    for classes", dubious, "\n" );
        fi;
      fi;

      factortable.orders:= orders;
    fi;

    # store the factor fusion on <tbl>;
    StoreFusion( tbl, factortable,
                 rec( map:= factorfusion, type:= "factor" ) );
    
    InitClassesCharTable( factortable );
    factortable.operations:= CharTableOps;
    
    return factortable;
    end;

#############################################################################
##
#F  CharTableNormalSubgroup( <tbl>, <classes\_of\_normal\_subgroup> )
##
##  returns the restriction of the character table <tbl> to the classes in
##  the list <classes\_of\_normal\_subgroup>.
##  This table is an approximation of the character table of this normal
##  subgroup. It has components 'size', 'identifier', 'centralizers', 'orders',
##  'classes', 'powermap', 'irreducibles' (contains those restrictions of
##  irreducibles of <tbl> which are irreducible), and 'fusions' (contains
##  the fusion in <tbl>).
##
##  In most cases, some classes of the normal subgroup must be split, see
##  "CharTableSplitClasses".
##
CharTableNormalSubgroup := function( tbl, classes_of_normal_subgroup )
    local p, result, err, inverse, chi, char;

    result:= rec( identifier:= Concatenation( "Rest(", tbl.name, ",",
                         String( classes_of_normal_subgroup ), ")" ) );
    result.size:= Sum( tbl.classes{ classes_of_normal_subgroup } );

#T Remove this when the time of changes has arrived!
    result.name:= result.identifier;
    result.order:= result.size;

    result.centralizers:= List( classes_of_normal_subgroup,
                                x -> result.size / tbl.classes[x] );
    result.orders:= tbl.orders{ classes_of_normal_subgroup };
    err:= Filtered( [ 1 .. Length( result.centralizers ) ],
                    x->not IsInt(result.centralizers[x]/result.orders[x]) );
    if err <> [] then
      Print( "#I CharTableNormalSubgroup:",
             " classes in " , err, " necessarily split\n" );
    fi;
    result.powermap:= [];
    inverse:= InverseMap( classes_of_normal_subgroup );
    if IsBound( tbl.powermap ) then
      for p in [ 1 .. Length( tbl.powermap ) ] do
        if IsBound( tbl.powermap[p] ) then
          result.powermap[p]:=
              CompositionMaps( inverse, CompositionMaps( tbl.powermap[p],
                                             classes_of_normal_subgroup ) );
        fi;
      od;
    fi;

    result.classes:= tbl.classes{ classes_of_normal_subgroup };
    result.operations:= CharTableOps;

    if tbl.size mod result.size <> 0 then
      Print( "#E CharTableNormalSubgroup:",
             " list of classes is not a normal subgroup\n" );
    else
      result.irreducibles:= [];
      for chi in tbl.irreducibles do
        char:= chi{ classes_of_normal_subgroup };
        if ScalarProduct( result, char, char ) = 1 and
           not char in result.irreducibles then
          Add( result.irreducibles, char );
        fi;
      od;
      p:= tbl.size / result.size;
      if IsPrimeInt( p ) then
        InfoCharTable2( "#I CharTableNormalSubgroup: The table must have ",
                        p * Length( tbl.centralizers ) -
                        ( p^2 - 1 ) * Length( result.irreducibles ),
                        " classes\n#I   (now ", Length(result.centralizers),
                        ", after nec. splitting ",
                        Length(result.centralizers) + (p-1) * Length( err ),
                        ")\n" );
      fi;
    fi;
    StoreFusion( result, tbl, Copy( classes_of_normal_subgroup ) );

    return result;
    end;


#############################################################################
##
#F  CharTableSplitClasses( <tbl>, <fusionmap> )
#F  CharTableSplitClasses( <tbl>, <fusionmap>, <exponent> )
##
##  returns a table where the classes of <tbl> are split according to
##  <fusionmap>; the first version is for splitting in normal subgroups,
##  the second for splitting in downward extensions.
##
##  concerned components of the table record:
##
##  'identifier':    '<tbl>.identifier' concatenated with the string of
##                  <fusionmap>;
##  'size':         unchanged
##  'centralizers': will be adjusted in the first case,
##                  will only be split up in the second case;
##  'classes':      will be adjusted in the first case, will be divided by
##                  the number of images in the second case;
##  'powermap':     all contained maps are adjusted
##                  (and will probably be parametrized afterwards);
##  'orders':       will be split in the first case,
##                  in the second case we have\:
##          A first approximation is given by the fact that
##          'tbl.orders[ <fusionmap>[i] ]' divides 'orders[i]' and 'orders[i]'
##          divides '<exponent> \* 'orders[ <fusionmap>[i] ]', where
##          <exponent> is regarded as the exponent of the normal subgroup
##          extending <tbl>.
##  'irreducibles': all irreducibles are indirected by <fusionmap>;
##  'fusions':      <fusionmap> is stored as factor fusion, and
##                  <tbl>.fusionsource is adjusted
##
CharTableSplitClasses := function( arg )
    local i, j, p, tbl, fusionmap, exponent, split, divs, inverse, len, class;

    if not ( Length( arg ) in [ 2, 3 ] and IsCharTable( arg[1] ) and
             IsList( arg[2] ) )
       or ( Length( arg ) = 2 and KernelChar( arg[2] ) <> [ 1 ] )
       or ( Length( arg ) = 3 and not IsInt( arg[3] )
                              and KernelChar( arg[2] ) = [ 1 ] ) then
      Error( "usage: CharTableSplitClasses( <tbl>, <fusionmap> )\n",
             " ( for splitting in normal subgroup )\n",
             " resp. CharTableSplitClasses(<tbl>,<fusionmap>,<exp>)\n",
             " ( for splitting in downward extension with normal subgroup\n",
             " of exponent <exp> )" );
    fi;
    tbl:= arg[1];
    fusionmap:= arg[2];
    inverse:= InverseMap( fusionmap );
    split:= rec( identifier:= Concatenation( "Split(", tbl.name,
                                             ",", String( fusionmap ), ")" ),
                 size:= tbl.size );

#T Remove this when the time of changes has arrived!
    split.order:= split.size;
    split.name:= split.identifier;

    if Length( arg ) = 2 then   # splitting in normal subgroup
      split.centralizers:= [];
      split.classes:= [];
      for i in [  1.. Length( inverse ) ] do
        if IsInt( inverse[i] ) then
          split.centralizers[ inverse[i] ]:= tbl.centralizers[i];
          split.classes[ inverse[i] ]:= tbl.classes[i];
        else
          len:= Length( inverse[i] );
          for j in inverse[i] do
            split.centralizers[j]:= tbl.centralizers[i] * len;
            split.classes[j]:= tbl.classes[i] / len;
          od;
        fi;
      od;
      split.orders:= Indirected( tbl.orders, fusionmap );
    else                        # downward extension
      exponent:= arg[3];
      split.centralizers:= Indirected( tbl.centralizers, fusionmap );
      split.classes:= [];
      for i in [ 1 .. Length( inverse ) ] do
        if IsInt( inverse[i] ) then
          split.classes[ inverse[i] ]:= tbl.classes[i];
        else
          for j in inverse[i] do
            split.classes[j]:= tbl.classes[i] / Length( inverse[i] );
          od;
        fi;
      od;
      divs:= DivisorsInt( exponent );
      split.orders:= Indirected( List( tbl.orders, x -> x*divs ), fusionmap );
      split.orders[1]:= 1;
      for i in [ 2 .. Length( fusionmap ) ] do
        if fusionmap[i] = 1 then                # delete order 1
          split.orders[i]:= Difference( split.orders[i], [ 1 ] );
        fi;
        if Length( split.orders[i] ) = 1 then
          split.orders[i]:= split.orders[i][1];
        fi;
      od;
    fi;
    if IsBound( tbl.powermap ) then
      split.powermap:= [];
      for i in [ 1 .. Length( tbl.powermap ) ] do
        if IsBound( tbl.powermap[i] ) then
          split.powermap[i]:=
               CompositionMaps( inverse,
                                CompositionMaps(tbl.powermap[i],fusionmap) );
          split.powermap[i][1]:= 1;
        fi;
      od;
      if Length( arg ) = 3 then

        # try to improve the powermaps inside the preimage of 1A:
        # if <exponent> is a prime power p^n, the nontrivial preimages
        # cannot map to 1A in powermaps prime to p; they cannot power to
        # themselves in the p-th powermap; they must power to 1A if
        # '<exponent> = p'.
        divs:= Set( Factors( exponent ) );
        if Length( divs ) = 1 and IsList( inverse[1] ) then
          i:= divs[1];
          for class in Difference( inverse[1], [ 1 ] ) do
            for p in [ 1 .. Length( split.powermap ) ] do
              if IsBound( split.powermap[p] ) then
                if GcdInt( i, p ) = 1 then
                  if IsList( split.powermap[p][ class ] ) then
                    split.powermap[p][ class ]:=
                             Difference( split.powermap[p][ class ], [1] );
                    if Length( split.powermap[p][ class ] ) = 1 then
                      split.powermap[p][ class ]:=
                              split.powermap[p][ class ][1];
                    fi;
                  fi;
                elif p = i then
                  if i = exponent then
                    split.powermap[p][ class ]:= 1;
                  else
                    if IsList( split.powermap[p][ class ] ) then
                      split.powermap[p][ class ]:=
                             Difference( split.powermap[p][class], [class] );
                      if Length( split.powermap[p][ class ] ) = 1 then
                        split.powermap[p][ class ]:=
                                split.powermap[p][ class ][1];
                      fi;
                    fi;
                  fi;
                fi;
              fi;
            od;
          od;
        fi;
      fi;
    fi;
    if IsBound( tbl.irreducibles ) then
      split.irreducibles:= Restricted( tbl.irreducibles, fusionmap );
    fi;
    StoreFusion( split, tbl, fusionmap ); 
    
    split.operations:= CharTableOps;
    
    return split;
    end;


#############################################################################
##
#F  CharTableCollapsedClasses( <tbl>, <fusionmap> )
##
##  returns a table where the classes of <tbl> are collapsed according to
##  <fusionmap>.
##
##  concerned fields of the table record:
##
##  'identifier':    '<tbl>.identifier' concatenated with the string of
##                  <fusionmap>;
##  'size':         unchanged
##  'classes':      sum over classlengths of preimages
##  'centralizers': adjusted with respect to 'size' and 'classes'
##  'powermap':     all contained maps are adjusted
##  'orders':         are collapsed
##  'irreducibles': indirections by the inverse of <fusionmap> of all
##                  irreducibles that collapse uniquely;
##  'fusions':      <fusionmap> is stored as fusion on <tbl>, and
##                  the fusionsource of the new table is adjusted
##
##  If some entries of 'orders' or 'powermap' become
##  parametrized because the values differ for preimages, a warning is
##  printed.
##
CharTableCollapsedClasses := function( tbl, fusionmap )
    local i, p, collaps, inverse, classes;
    collaps:= rec( identifier:= Concatenation( "Collapsed(", tbl.name, ",",
                                               String( fusionmap ), ")" ),
                   size:= tbl.size );

#T Remove this when the time of changes has arrived!
    collaps.order:= collaps.size;
    collaps.name:= collaps.identifier;

    inverse:= InverseMap( fusionmap );
    classes:= List( [ 1 .. Maximum( fusionmap ) ], x -> 0 );
    for i in [ 1 .. Length( fusionmap ) ] do
      classes[ fusionmap[i] ]:= classes[ fusionmap[i] ] + tbl.classes[i];
    od;
    collaps.centralizers:= List( classes, x -> collaps.size / x );
    collaps.orders:= CompositionMaps( tbl.orders, inverse );
    collaps.powermap:= [];
    if IsBound( tbl.powermap ) then
      for i in [ 1 .. Length( tbl.powermap ) ] do
        if IsBound( tbl.powermap[i] ) then
          collaps.powermap[i]:=
                CompositionMaps( fusionmap,
                                 CompositionMaps(tbl.powermap[i],inverse) );
        fi;
      od;
    fi;
    collaps.fusionsource:= [];
    StoreFusion( tbl, collaps, fusionmap );
    collaps.irreducibles:= Filtered( List( tbl.irreducibles,
                                    x -> CompositionMaps( x, inverse ) ),
                                    y -> ForAll( y, IsCyc ) );
    collaps.classes:= classes;
    for i in [ 1 .. Length( classes ) ] do
      if IsList( inverse[i] ) then
        if IsList( collaps.orders[i] )
           and ForAll( inverse[i], x -> IsInt( tbl.orders[x] ) ) then
          Print( "#E CharTableCollapsedClasses: orders in ", inverse[i],
                 " are different\n" );
        fi;
        for p in [ 1 .. Length( collaps.powermap ) ] do
          if IsBound(collaps.powermap[p]) and IsList(collaps.powermap[p][i])
             and ForAll( inverse[i], x -> IsInt( tbl.powermap[p][x] ) ) then
            Print( "#E CharTableCollapsedClasses: classes in ",
                   collaps.powermap[p][i], " must collapse because of\n",
                   "#E    ", Ordinal( p ), " powermap\n" );
          fi;
        od;
      fi;
    od;
    collaps.operations:= CharTableOps;
    
    return collaps;
    end;


#############################################################################
##
#F  CharTableIsoclinic( <tbl> )
#F  CharTableIsoclinic( <tbl>, <classes_of_normal_subgroup> )
##
##  for table of groups $2.G.2$, the character table of the isoclinic group
##  (see ATLAS, Chapter 6, Section 7)
##
CharTableIsoclinic := function( arg )

    local i,           # 'E(4)'
          j,           # loop variable
          chi,         # one character
          class,
          map,
          tbl,         # input table
          linear,      # linear characters of 'tbl'
          isoclinic,   # the isoclinic table, result
          center,      # nontrivial class(es) contained in the center
          nsg,         # index 2 subgroup
          outer,       # classes outside the index 2 subgroup
          images,
          factorfusion,
          reg;         # restriction to regular classes

    # check the argument
    if not ( Length( arg ) in [ 1, 2 ] and IsCharTable( arg[1] ) )
       or ( Length( arg ) = 2 and not IsList( arg[2] ) ) then
      Error( "usage: CharTableIsoclinic( tbl ) resp.\n",
             "       CharTableIsoclinic( tbl, classes_of_nsg )");
    fi;

    # get the ordinary table if necessary
    if IsBound( arg[1].ordinary ) then
      tbl:= arg[1].ordinary;
    else
      tbl:= arg[1];
    fi;
    if not IsBound( tbl.powermap ) then
      tbl.powermap:= [];
    fi;

    # compute the isoclinic table of the ordinary table

    # get the classes of the normal subgroup of index 2
    if Length( arg ) = 1 then
      linear:= Filtered( tbl.irreducibles, x -> x[1] = 1 );
      for chi in linear do
        if Sum( tbl.classes{ KernelChar( chi ) } ) <> tbl.size / 2 then
          linear:= Difference( linear, [ chi ] );
        fi;
      od;
      if Length( linear ) > 1 then
        Error( "normal subgroup of index 2 not uniquely determined,\n",
               "use CharTableIsoclinic( tbl, classes_of_nsg )" );
      fi;
      nsg:= KernelChar( linear[1] );
    else
      if Sum( tbl.classes{ arg[2] } ) <> tbl.size / 2 then
        Error( "normal subgroup must have index 2" );
      fi;
      nsg:= arg[2];
    fi;

    # get the central subgroup of order 2 lying in the above normal subgroup
    center:= Filtered( [ 2 .. Length( tbl.classes ) ],
                       x -> tbl.centralizers[1] = tbl.centralizers[x] );
    if Length( center ) <> 1 then
      Error( "There must be exactly two central elements" );
    fi;
    center:= center[1];

    # make the record of the isoclinic table
    isoclinic:= rec( identifier:= Concatenation( "Isoclinic(",tbl.identifier,")" ),
                     size         := tbl.size,
                     centralizers := Copy( tbl.centralizers ),
                     classes      := Copy( tbl.classes ),
                     orders       := Copy( tbl.orders ),
                     fusions      := [],
                     fusionsource := [],
                     powermap     := Copy( tbl.powermap ),
                     irreducibles := Copy( tbl.irreducibles ),
                     operations   := CharTableOps               );

#T Remove this when the time of changes has arrived!
    isoclinic.order:= isoclinic.size;
    isoclinic.name:= isoclinic.identifier;

    # classes outside the normal subgroup
    outer:= Difference( [ 1 .. Length( tbl.classes ) ], nsg );

    # adjust faithful characters in outer classes
    i:= E(4);
    for chi in Filtered( isoclinic.irreducibles,
                         x -> x[ center ] <> x[1] ) do
      for class in outer do
        chi[ class ]:= i * chi[ class ];
      od;
    od;

    # get the fusion map onto the factor group modulo the center
    CharTableFactorGroup( isoclinic, [ 1, center ] );   # very strange ...
    factorfusion:= isoclinic.fusions[1].map;
    isoclinic.fusions:= [];

    # adjust the power maps
    for j in [ 1 .. Length( isoclinic.powermap ) ] do
      if IsBound( isoclinic.powermap[j] ) then
        map:= isoclinic.powermap[j];
        if j mod 4 = 2 then

          # The squares lie in 'nsg'; for $g^2 = h$,
          # we have $(gi)^2 = hz$, so we must take the other
          # preimage under the factorfusion, if exists.

          for class in outer do
            images:= Filtered( Difference( nsg, [ map[class] ] ),
                              x -> factorfusion[x]
                                   = factorfusion[ map[ class ] ] );
            if Length( images ) = 1 then
              map[ class ]:= images[1];
              isoclinic.orders[ class ]:= 2 * isoclinic.orders[ images[1] ];
            fi;
          od;

        elif j mod 4 = 3 then
    
          # For $g^p = h$, we have $(gi)^p = hi^p = hiz$, so again
          # we must choose the other preimage under the
          # factorfusion, if exists; the 'p'-th powers lie outside
          # 'nsg' in this case.

          for class in outer do
            images:= Filtered( Difference( outer, [ map[ class ] ] ),
                              x -> factorfusion[x]
                                   = factorfusion[ map[ class ] ] );
            if Length( images ) = 1 then
              map[ class ]:= images[1];
            fi;
          od;

        fi;        # For j mod 4 in { 0, 1 } the map remains unchanged,
                   # since $g^p = h$ and $(gi)^p = hi^p = hi$ then.
      fi;
    od;

    # if we want the isoclinic table of a Brauer table then
    # transfer the normal subgroup information to the regular classes,
    # and adjust the irreducibles

    if tbl <> arg[1] then

      reg:= CharTableRegular( isoclinic, arg[1].prime );
      factorfusion:= GetFusionMap( reg, isoclinic );
      reg.irreducibles:= Copy( arg[1].irreducibles );
      center:= Position( factorfusion, center );
      outer:= Filtered( [ 1 .. Length( reg.centralizers ) ],
                        x -> factorfusion[x] in outer );

      for chi in Filtered( reg.irreducibles,
                           x -> x[ center ] <> x[1] ) do
        for class in outer do
          chi[ class ]:= i * chi[ class ];
        od;
      od;
  
      isoclinic:= reg;

    fi;

    # adjust the table name
    isoclinic.identifier:= Concatenation( "Isoclinic(", arg[1].identifier, ")" );

    # return the result
    return isoclinic;
    end;


#############################################################################
##
#F  CharTableQuaternionic( <4n> )
##
##  table of the quaternionic group of order <4n>
##
CharTableQuaternionic := function( four_n )
    local quaternionic;

    if four_n mod 4 <> 0 then
      Error( "argument must be a multiple of 4" );
    fi;
    if four_n = 4 then
      quaternionic:= CharTable( "Cyclic", 4 );
    else
      quaternionic:= CharTableIsoclinic( CharTable( "Dihedral", four_n ),
                                         [1..four_n/4+1] );
    fi;
    quaternionic.identifier:= Concatenation( "Q", String( four_n ) );

#T Remove this when the time of changes has arrived!
    quaternionic.name:= quaternionic.identifier;

    return quaternionic;
    end;


#############################################################################
##
#V  GEN_Q_P
##
##  for prime powers <q> at position <q> the unique prime divisor of <q>
##
#F  PrimeBase( q ) . . . . . . . . . . . . . . . Compute the Characteristic.
##
##  If q is a prime power, PrimeBase computes the prime of which it is a Power.
##  For the sake of speed, the results are stored in GEN_Q_P.
##
GEN_Q_P := [];

PrimeBase := function( q )
    if not IsBound( GEN_Q_P[q] ) then
      GEN_Q_P[q]:= FactorsInt( q )[1];
    fi;
    return( GEN_Q_P[q] );
    end;

#############################################################################
##
#F  CharTableSpecialized( <generic character table>, <q> )  . . Specialise q.
##
##  A generic table is detected by the component 'isGenericTable'.
##  (In former times the components 'classparam' and 'charparam' were
##  obligatory.)
##
##  This function does the actual specialisation.
##
CharTableSpecialized := function( gtab, q )

    local complete, irred, gen, taf, i, j, k, l, lencl, lench, parch, parcl,
          chr, genclass, classparam, genchar, charparam, class, parm;
      
    taf := rec();
    complete := true;
    
    #  A generic character table must contain at least functions to compute
    #  the parametrisation of classes and characters.
    
    if not IsBound( gtab.isGenericTable ) then
      Error("This is not a generic character table.");
    fi;
    
    #  Check if the argument is valid.
    if IsBound( gtab.domain ) and gtab.domain( q ) = false then
      Error( q, " is not a valid paramater for this generic table" );
    fi;
    
    #  If the generic table has a field 'wholetable' (a function which takes
    #  the generic table and 'q' as parameter), use this function to
    #  construct the whole table.
    if IsBound( gtab.wholetable ) then
      taf:= gtab.wholetable( gtab, q );
    else
    
      #  Get the parametrisation of classes and characters. Genclass stores
      #  for each class of the special character table the number of the
      #  class of the generic table gtab it stems from. Classparm stores the
      #  parameter of the special class. Genchar and Charparm do the same for
      #  characters.
    
      if not IsBound( gtab.classparam ) or not IsBound( gtab.charparam ) then
        Error("components 'classparam' and 'charparam' are missing");
      fi;

      genclass := []; classparam := [];
    
      for i in [1..Length(gtab.classparam)] do
        parm := gtab.classparam[i](q);
        Append( classparam, parm );
        Append( genclass, List( parm, j->i ) );
      od;
    
      genchar := []; charparam := [];
    
      for i in [1..Length(gtab.charparam)] do
        parm := gtab.charparam[i](q);
        Append( charparam, parm );
        Append( genchar, List( parm, j->i ) );
      od;
    
      #  Compute the name of the table.
    
      if IsBound( gtab.specializedname ) then
        taf.identifier:= gtab.specializedname( q );

#T Remove this when the time of changes has arrived!
        taf.name:= taf.identifier;

      else
        complete := false;
      fi;
    
      #  Compute the group order.
    
      if IsBound( gtab.order ) then
        taf.size := gtab.order(q);
        taf.order:= taf.size;
      else complete := false;
      fi;
    
      #  Compute centralizer and representative orders.
    
      if IsBound(gtab.centralizers) then 
        taf.centralizers := List( [1..Length(classparam)], ( j ->
          gtab.centralizers[ genclass[j] ]( q, classparam[j] )));
      else
        complete := false;
      fi;
    
      if IsBound(gtab.orders) then 
        taf.orders := List( [1..Length(classparam)], ( j ->
          gtab.orders[ genclass[j] ]( q, classparam[j] )));
      else
        complete := false;
      fi;
    
      #  Compute the powermap.
    
      taf.powermap := [];
      if IsBound( gtab.powermap ) and IsBound( taf.size ) then
        for i in Reversed(Set( Factors( taf.size ))) do
          taf.powermap[i] := [];
          for class in Reversed([1..Length( classparam )]) do
            parm := gtab.powermap[genclass[class]](q, classparam[class],i);
            k := 1;
            while genclass[k] <> parm[1] or classparam[k] <> parm[2] do 
              k := k+1;
            od;
            taf.powermap[i][class] := k;
          od;
        od;
      fi;
          
      #  Perform some initialisations, if the necessary data are present.
    
      if IsBound(gtab.classtext) then 
        taf.classtext := List( [1..Length(classparam)], ( j ->
          gtab.classtext[ genclass[j] ]( q, classparam[j] )));
      fi;
    
      #  Compute the character values.
    
      if IsBound( gtab.matrix ) then
        taf.irreducibles := gtab.matrix( q );
      elif IsBound(gtab.irreducibles) then
        taf.irreducibles :=
            List( [1..Length(charparam)],
                  i -> List( [1..Length(classparam)],
                             j -> gtab.irreducibles[genchar[i]][genclass[j]]
                                  ( q, charparam[i], classparam[j] ) ) );
      fi;
    
      taf.classparam := List( [ 1 .. Length( classparam ) ],
                              i -> [ genclass[i], classparam[i] ] );
      taf.irredinfo:= List( [ 1 .. Length( charparam ) ],
                            i->rec(charparam:= [genchar[i],charparam[i]]) );
    
      if IsBound( gtab.text ) 
        then taf.text:=Concatenation("computed using ",gtab.text);
      fi;
    fi;
    
    if IsBound( taf.centralizers ) then
      InitClassesCharTable( taf );
    fi;
    taf.operations:= CharTableOps;

    return taf;
    end;

