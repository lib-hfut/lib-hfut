#############################################################################
##
#A  string.g                    GAP library                      Frank Celler
##
#A  @(#)$Id: string.g,v 3.22.1.1 1995/03/15 10:13:08 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the string functions.
##
#H  $Log: string.g,v $
#H  Revision 3.22.1.1  1995/03/15  10:13:08  sam
#H  fixed 'StringFFE' (misuse of 'LogFFE')
#H
#H  Revision 3.22  1994/05/16  10:51:45  mschoene
#H  changed 'StringTime' to fill with '0' instead of spaces
#H
#H  Revision 3.21  1994/03/04  08:59:22  sam
#H  added 'WordAlp'
#H
#H  Revision 3.20  1994/01/12  13:09:13  werner
#H  Ordinal(100*n+11) now yields (100*n+11)th (not (100*n+11)st)
#H
#H  Revision 3.19  1993/09/14  13:30:57  fceller
#H  fixed 'StringInt' to return a real string
#H
#H  Revision 3.18  1993/07/22  12:02:42  fceller
#H  faster 'StringInt'
#H
#H  Revision 3.17  1993/02/05  08:53:05  martin
#H  fixed 'PrintArray', used 'Flat' for a matrix of strings
#H
#H  Revision 3.16  1992/02/20  14:07:27  fceller
#H  'PrintArry' now allows list args.
#H
#H  Revision 3.15  1992/01/29  09:49:16  martin
#H  added 'StringFFE'
#H
#H  Revision 3.14  1992/01/13  13:23:23  martin
#H  changed 'CoeffsCyc' to 'COEFFSCYC'
#H
#H  Revision 3.13  1992/01/09  16:13:47  martin
#H  improved 'PrintRec' to support '~'
#H
#H  Revision 3.12  1992/01/02  10:13:11  martin
#H  removed 'RecField'
#H
#H  Revision 3.11  1991/12/19  13:02:20  martin
#H  renamed 'SupportPerm' to 'LargestMovedPointPerm'
#H
#H  Revision 3.10  1991/10/14  10:54:43  martin
#H  added 'Ordinal'
#H
#H  Revision 3.9  1991/10/09  13:16:13  martin
#H  added 'PrintRec'
#H
#H  Revision 3.8  1991/10/09  13:01:10  martin
#H  added 'StringRat' and 'StringCyc'
#H
#H  Revision 3.7  1991/08/12  11:31:56  fceller
#H  add 'StringRec'
#H
#H  Revision 3.6  1991/08/09  12:24:48  fceller
#H  Changed 'Quo|Abs|Log' into '...Int'
#H
#H  Revision 3.5  1991/06/25  10:56:35  fceller
#H  A small mistake in 'StringPP', 13*13 was printed as 2^13.
#H
#H  Revision 3.4  1991/06/21  16:41:16  fceller
#H  'StringPP' for prime powers string added.
#H
#H  Revision 3.3  1991/05/31  13:36:57  fceller
#H  'IdAgWord' adapted.
#H
#H  Revision 3.2  1991/05/10  11:23:50  fceller
#H  General identity of agwords removed.
#H
#H  Revision 3.1  1991/05/06  11:23:50  fceller
#H  Initial revision
#H
##


#############################################################################
##
#F  StringInt( <n> )  . . . . . . . . . . . convert integer <n> into a string
##
StringInt := function ( n )
    local  str,  num,  digits;

    # construct the string without sign
    num := AbsInt( n );
    digits := [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ];
    str := "";
    repeat
	Add( str, digits[num mod 10 + 1] );
        num := QuoInt( num, 10 );
    until num = 0;

    # add the sign and return
    if n < 0  then
	Add( str, '-' );
    fi;
    str := str{[Length(str),Length(str)-1 .. 1]};
    IsString(str);
    return str;
end;


#############################################################################
##
#F  StringRat( <rat> )  . . . . . . . . . .  convert a rational into a string
##
StringRat := function ( rat )
    local   str;

    str := StringInt( Numerator(rat) );
    if Denominator(rat) <> 1  then
        str := ConcatenationString( str, "/", StringInt(Denominator(rat)) );
    fi;

    return str;
end;


#############################################################################
##
#F  StringCyc( <cyc> )  . . . . . . . . . .  convert cyclotomic into a string
##
StringCyc := function( cyc )
    local i, j, En, coeffs, str;

    # get the coefficients
    coeffs := COEFFSCYC( cyc );

    # get the root as a string
    En := ConcatenationString( "E(", StringInt( Length( coeffs ) ), ")" );

    # print the first non zero coefficient
    i := 1;
    while coeffs[i] = 0 do i:= i+1; od;
    if i = 1  then
        str := StringRat( coeffs[1] );
    elif coeffs[i] = -1 then
        str := ConcatenationString( "-", En );
    elif coeffs[i] = 1 then
        str := En;
    else
        str := ConcatenationString( StringRat( coeffs[i] ), "*", En );
    fi;
    if 2 < i  then
        str := ConcatenationString( str, "^", StringInt(i-1) );
    fi;

    # print the other coefficients
    for j  in [i+1..Length(coeffs)]  do
        if   coeffs[j] =  1  then
            str := ConcatenationString(str,"+",En);
        elif coeffs[j] = -1  then
            str := ConcatenationString(str,"-",En);
        elif coeffs[j] >  0  then
            str := ConcatenationString(str,"+",StringRat(coeffs[j]),"*",En);
        elif coeffs[j] <  0  then
            str := ConcatenationString(str,StringRat(coeffs[j]),"*",En);
        fi;
        if 2 < j  and coeffs[j] <> 0  then
            str := ConcatenationString(str,"^",StringInt(j-1));
        fi;
    od;

    # return the string
    return str;
end;


#############################################################################
##
#F  StringFFE( <ffe> )  . . . .  convert a finite field element into a string
##
StringFFE := function ( ffe )
    local   str, root;
    if   ffe = 0 * ffe  then
        str := ConcatenationString("0*Z(",StringInt(CharFFE(ffe)),")");
    else
        str := ConcatenationString("Z(",StringInt(CharFFE(ffe)));
        if DegreeFFE(ffe) <> 1  then
            str := ConcatenationString(str,"^",StringInt(DegreeFFE(ffe)));
        fi;
        str := ConcatenationString(str,")");
        root:= Z( CharFFE( ffe ) ^ DegreeFFE( ffe ) );
        if LogFFE( ffe, root ) <> 1  then
            str := ConcatenationString(str,"^",StringInt(LogFFE(ffe,root)));
        fi;
    fi;
    return str;
end;


#############################################################################
##
#F  StringPerm( <perm> )  . . . . . . . . . convert permutation into a string
##
StringPerm := function( perm )
    local   str,  i,  j;

    if perm = perm ^ 0 then
        str := "()";
    else
        str := "";
        for i  in [ 1 .. LargestMovedPointPerm( perm ) ]  do
            j := i ^ perm;
            while j > i  do j := j ^ perm;  od;
            if j = i and i ^ perm <> i  then
                str := ConcatenationString( str, "(", StringInt( i ) );
                j := i ^ perm;
                while j > i do
                    str := ConcatenationString( str, ",", StringInt( j ) );
                    j := j ^ perm;
                od;
                str := ConcatenationString( str, ")" );
            fi;
        od;
    fi;
    return str;

end;


#############################################################################
##
#F  StringAgWord( <g> ) . . . . . . . . . . . . convert an agword to a string
##
StringAgWord := function( g )
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
#F  StringBool( <bool> )  . . . . . . . . . . . convert boolean into a string
##
StringBool := function( bool )

    if bool  then
        return "true";
    else
        return "false";
    fi;

end;


#############################################################################
##
#F  StringList( <list> )  . . . . . . . . . . . .  convert list into a string
##
StringList := function( list )
    local   str, i;

    str := "[ ";
    for i in [ 1 .. Length( list ) ]  do
        if IsBound( list[ i ] )  then
            str := ConcatenationString( str, String( list[ i ] ) );
        fi;
        if i <> Length( list )  then
            str := ConcatenationString( str, ", " );
        fi;
    od;
    return ConcatenationString( str, " ]" );

end;


#############################################################################
##
#F  StringRec( <rec> )	. . . . . . . . . . . .  convert record into a string
##
StringRec := function( record )
    local   str,  nam,  com;

    if IsBound(record.operations) and IsBound(record.operations.String)  then
    	str := record.operations.String( record );
    else
    	str := "rec( ";
    	com := false;
    	for nam  in RecFields( record )  do
    	    if com  then
    	    	str := ConcatenationString( str, ", " );
    	    else
    	    	com := true;
    	    fi;
    	    str := ConcatenationString( str, nam, " := ",
                                        String( record.(nam) ) );
    	od;
    	str := ConcatenationString( str, " )" );
    fi;
    return str;

end;


#############################################################################
##
#F  String( <obj>, <width> ) . . . . . . . . . . convert object into a string
##
##  Main dispatcher for 'StringType( <obj> )', where <Type> is  the  type  of
##  <obj>.
##
String := function( arg )
    local   str, blanks, obj, fill;

    # Check the arguments.
    if Length( arg ) < 1
       or Length( arg ) > 2
       or ( Length( arg ) = 2 and not IsInt( arg[ 2 ] ) )
    then
        Error( "usage: String( <obj> ) or String( <obj>, <width> )" );
    fi;
    obj := arg[ 1 ];

    # Dispatcher.
    if   IsInt( obj )     then str := StringInt   ( obj );
    elif IsRat( obj )     then str := StringRat   ( obj );
    elif IsCyc( obj )     then str := StringCyc   ( obj );
    elif IsFFE( obj )     then str := StringFFE   ( obj );
    elif IsPerm( obj )    then str := StringPerm  ( obj );
    elif IsAgWord( obj )  then str := StringAgWord( obj );
    elif IsBool( obj )    then str := StringBool  ( obj );
    elif IsString( obj )  then str := obj;
    elif IsList( obj )    then str := StringList  ( obj );
    elif IsRec( obj )     then str := StringRec   ( obj );
    else Error( "String: cannot convert ", obj, " into a string" );
    fi;

    # If no <width> is given or it is to small, return.
    if Length( arg ) = 1 or LengthString( str ) >= AbsInt( arg[ 2 ] )  then
        return str;
    fi;

    # If <width> is positive, blanks are filled in from the left.
    blanks := "                                                 ";
    if arg[ 2 ] > 0  then
        fill := arg[ 2 ] - LengthString( str );
        while fill > 0  do
            if fill >= LengthString( blanks )  then
                str := ConcatenationString( blanks, str );
            else
                str := ConcatenationString( SubString( blanks,1,fill ),str );
            fi;
            fill := arg[ 2 ] - LengthString( str );
        od;
    else
        fill :=  - arg[ 2 ] - LengthString( str );
        while fill > 0  do
            if fill >= LengthString( blanks )  then
                str := ConcatenationString( str, blanks );
            else
                str := ConcatenationString( str,SubString( blanks,1,fill ) );
            fi;
            fill :=  - arg[ 2 ] - LengthString( str );
        od;
    fi;
    return str;

end;


#############################################################################
##
#F  PrintArray( <array> ) . . . . . . . . . . . . . . . . pretty print matrix
##
PrintArray := function( array )
    local   arr,  max,  l,  k;

    if array = [[]]  then
    	Print( "[ [ ] ]\n" );
    elif array = []  then
	Print( "[ ]\n" );
    elif not ForAll( array, IsList )  then
	arr := List( array, x -> String( x ) );
	max := Maximum( List( arr, LengthString ) );
	Print( "[ ", String( arr[ 1 ], max + 1 ) );
	for l  in [ 2 .. Length( arr ) ]  do
	    Print( ", ", String( arr[ l ], max + 1 ) );
	od;
	Print( " ]\n" );
    else
    	arr := List( array, x -> List( x, String ) );
    	max := Maximum( List( arr, x -> Maximum( List(x,LengthString) ) ) );
        Print( "[ " );
    	for l  in [ 1 .. Length( arr ) ]  do
    	    if l > 1  then
    	    	Print( "  " );
    	    fi;
            Print( "[ " );
            for k  in [ 1 .. Length( arr[ l ] ) ]  do
            	Print( String( arr[ l ][ k ], max + 1 ) );
            	if k = Length( arr[ l ] )  then
                    Print( " ]" );
            	else
                    Print( ", " );
            	fi;
            od;
            if l = Length( arr )  then
            	Print( " ]\n" );
            else
            	Print( ",\n" );
            fi;
    	od;
    fi;

end;


#############################################################################
##
#F  PrintRec(<record>)  . . . . . . . . . . . . . . . . . . .  print a record
##
##  'PrintRec' must  call 'Print'  so that 'Print'   assigns  the record   to
##  '~' and  prints for  example 'rec( a := ~  )'  in this  form and does not
##  go into an  infinite loop 'rec( a  := rec(  a := ...'.   To make  'Print'
##  do the right   thing, we  assign to '<record>.operation'  the  operations
##  record 'RecordOps', which contains the appropriate 'Print' function.
##
PrintRecIgnore := [ "operations", "parent" ];

PrintRecIndent := "  ";

RecordOps := rec();

RecordOps.Print := function ( record )
    local  len, i, nam, lst, printRecIndent;
    len  := 0;
    for nam in RecFields( record )  do
        if len < LengthString( nam )  then
            len := LengthString( nam );
        fi;
        lst := nam;
    od;
    Print( "rec(\n" );
    for nam  in RecFields( record )  do
        if not nam in PrintRecIgnore then
            if not IsRec( record.(nam) )  then
                Print( PrintRecIndent, nam );
                for i  in [LengthString(nam)..len]  do
                    Print( " " );
                od;
                Print( ":= ", record.(nam) );
                if nam <> lst  then  Print( ",\n" );  fi;
            else
                Print( PrintRecIndent, nam );
                for i  in [LengthString(nam)..len]  do
                    Print( " " );
                od;
                Print( ":= " );
                printRecIndent := PrintRecIndent;
                PrintRecIndent := ConcatenationString(PrintRecIndent,"  ");
                PrintRec( record.(nam) );
                if nam <> lst  then Print( ",\n" );  fi;
                PrintRecIndent := printRecIndent;
            fi;
        else
            Print( PrintRecIndent, nam );
            for i  in [LengthString(nam)..len]  do
                Print( " " );
            od;
            Print( ":= ..." );
            if nam <> lst  then Print( ",\n" );  fi;
        fi;
    od;
    Print( " )" );
end;

PrintRec := function ( record )
    local   operations;
    if IsBound( record.operations )  then
        operations := record.operations;
    fi;
    record.operations := RecordOps;
    Print( record );
    if IsBound( operations )  then
        record.operations := operations;
    else
        Unbind( record.operations );
    fi;
end;


#############################################################################
##
#F  StringDate( <date> )  . . . . . . . . convert date into a readable string
#F  WeekDay( <date> ) . . . . . . . . . . . . . . . . . . . weekday of a date
#F  DMYDay( <day> ) . . .  convert days since 01-Jan-1970 into day-month-year
#F  DayDMY( <dmy> ) . . .  convert day-month-year into days since 01-Jan-1970
#F  DaysInYear( <year> )  . . . . . . . . .  days in a year, knows leap-years
#F  DaysInMonth( <month>, <year> )  . . . . days in a month, knows leap-years
##
DaysInYear := function ( year )
    if year mod 4 in [1,2,3]  or year mod 400 in [100,200,300]  then
        return 365;
    else
        return 366;
    fi;
end;

DaysInMonth := function ( month, year )
    if month in [ 1, 3, 5, 7, 8, 10, 12 ]  then
        return 31;
    elif month in [ 4, 6, 9, 11 ]  then
        return 30;
    elif year mod 4 in [1,2,3]  or year mod 400 in [100,200,300]  then
        return 28;
    else
        return 29;
    fi;
end;

DMYDay := function ( day )
    local  year, month;
    year := 1970;
    while DaysInYear(year) <= day  do
        day   := day - DaysInYear(year);
        year  := year + 1;
    od;
    month := 1;
    while DaysInMonth(month,year) <= day  do
        day   := day - DaysInMonth(month,year);
        month := month + 1;
    od;
    return [ day+1, month, year ];
end;

DayDMY := function ( dmy )
    local  year, month, day;
    day   := dmy[1]-1;
    month := dmy[2];
    year  := dmy[3];
    while 1 < month  do
        month := month - 1;
        day   := day + DaysInMonth( month, year );
    od;
    while 1970 < year  do
        year  := year - 1;
        day   := day + DaysInYear( year );
    od;
    return day;
end;

NameWeekDay := [ "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" ];
WeekDay := function ( date )
    if IsList( date )  then date := DayDMY( date );  fi;
    return NameWeekDay[ (date + 3) mod 7 + 1 ];
end;

NameMonth :=  [ "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ];
StringDate := function ( date )
    if IsInt( date )  then date := DMYDay( date );  fi;
    return ConcatenationString(
        String(date[1],2), "-", NameMonth[date[2]], "-", String(date[3],4) );
end;


#############################################################################
##
#F  StringTime( <time> )  . convert hour-min-sec-milli into a readable string
#F  HMSMSec( <sec> )  . . . . . . . .  convert seconds into hour-min-sec-mill
#F  SecHMSM( <hmsm> ) . . . . . . . . convert hour-min-sec-milli into seconds
##
HMSMSec := function ( sec )
    local  hour, minute, second, milli;
    hour   := QuoInt( sec, 3600000 );
    minute := QuoInt( sec,   60000 ) mod 60;
    second := QuoInt( sec,    1000 ) mod 60;
    milli  :=         sec            mod 1000;
    return [ hour, minute, second, milli ];
end;

SecHMSM := function ( hmsm )
    return 3600000*hmsm[1] + 60000*hmsm[2] + 1000*hmsm[3] + hmsm[4];
end;

StringTime := function ( time )
    local   string;
    if IsInt( time )  then time := HMSMSec( time );  fi;
    string := "";
    if time[1] <  10  then Append( string, " " );  fi;
    Append( string, String(time[1]) );
    Append( string, ":" );
    if time[2] <  10  then Append( string, "0" );  fi;
    Append( string, String(time[2]) );
    Append( string, ":" );
    if time[3] <  10  then Append( string, "0" );  fi;
    Append( string, String(time[3]) );
    Append( string, "." );
    if time[4] < 100  then Append( string, "0" );  fi;
    if time[4] <  10  then Append( string, "0" );  fi;
    Append( string, String(time[4]) );
    return string;
end;


#############################################################################
##
#F  StringPP( <int> ) . . . . . . . . . . . . . . . . . . . . P1^E1 ... Pn^En
##
StringPP := function( n )
    local   l, p, e, i, prime, str;

    if n = 1  then
        return "1";
    elif n = -1  then
        return "-1";
    elif n = 0  then
        return "0";
    elif n < 0  then
        l := Factors( -n );
	str := "-";
    else
        l := Factors( n );
	str := "";
    fi;
    p := [];
    e := [];
    for prime  in Set( l )  do
        Add( p, prime );
        Add( e, Length( Filtered( l, x -> prime = x ) ) );
    od;

    if e[ 1 ] = 1   then
        str := ConcatenationString( str, String( p[ 1 ] ) );
    else
        str := ConcatenationString( str, String( p[ 1 ] ),
	                                 "^", String( e[ 1 ] ) );
    fi;

    for i  in [ 2 .. Length( p ) ]  do
        if e[ i ] = 1  then
	    str := ConcatenationString( str, "*", String( p[ i ] ) );
        else
	    str := ConcatenationString( str, "*", String( p[ i ] ),
	                                     "^", String( e[ i ] ) );
        fi;
    od;

    return str;

end;


#############################################################################
##
#F  Ordinal(<n>)  . . . . . . . . . . . . . . ordinal of an integer as string
##
Ordinal := function ( n )
    local   str;
    if   n mod 10 = 1  and n mod 100 <> 11  then
        str := ConcatenationString( StringInt(n), "st" );
    elif n mod 10 = 2  and n mod 100 <> 12  then
        str := ConcatenationString( StringInt(n), "nd" );
    elif n mod 10 = 3  and n mod 100 <> 13  then
        str := ConcatenationString( StringInt(n), "rd" );
    else
        str := ConcatenationString( StringInt(n), "th" );
    fi;
    return str;
end;

############################################################################
##
#F  WordAlp( <alpha>, <nr> ) . . . . . .  <nr>-th word over alphabet <alpha>
##
##  returns a string that is the <nr>-th word over the alphabet <alpha>,
##  w.r. to word length and lexicographical order.
##  The empty word is 'WordAlp( <alpha>, 0 )'.
##
WordAlp := function( alpha, nr )

    local lalpha,   # length of the alphabet
          word,     # the result
          nrmod;    # position of letter

    lalpha:= Length( alpha );
    word:= "";
    while nr <> 0 do
      nrmod:= nr mod lalpha;
      if nrmod = 0 then nrmod:= lalpha; fi;
      Add( word, alpha[ nrmod ] );
      nr:= ( nr - nrmod ) / lalpha;
    od;
    return Reversed( word );
    end;

