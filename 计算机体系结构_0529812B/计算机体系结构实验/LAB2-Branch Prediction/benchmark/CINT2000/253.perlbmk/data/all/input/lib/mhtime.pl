##---------------------------------------------------------------------------##
##  File:
##	@(#) mhtime.pl 2.2 98/08/10 23:43:24
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      Time related routines for mhonarc
##---------------------------------------------------------------------------##
##    Copyright (C) 1996-1998	Earl Hood, earlhood@usa.net
##
##    This program is free software; you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation; either version 2 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program; if not, write to the Free Software
##    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
##    02111-1307, USA
##---------------------------------------------------------------------------##

##---------------------------------------------------------------------------##
##      Date variables for date routines
##
{
    package mhtime;

    %Month2Num = (
	'jan', 0, 'feb', 1, 'mar', 2, 'apr', 3, 'may', 4, 'jun', 5, 'jul', 6,
	'aug', 7, 'sep', 8, 'oct', 9, 'nov', 10, 'dec', 11,
    );
    %WDay2Num = (
	'sun', 0, 'mon', 1, 'tue', 2, 'wed', 3, 'thu', 4, 'fri', 5, 'sat', 6,
    );

    @weekdays = ('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
    @Weekdays = ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
		 'Friday', 'Saturday');
    @months   = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug',
		 'Sep', 'Oct', 'Nov', 'Dec');
    @Months   = ('January', 'February', 'March', 'April', 'May', 'June',
		 'July', 'August', 'September', 'October', 'November',
		 'December');

    $p_weekdays = "Mon|Tue|Wed|Thu|Fri|Sat|Sun";
    $p_months   = "Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec";
    $p_hrminsec = '\d{1,2}:\d\d:\d\d';
    $p_hrmin    = '\d{1,2}:\d\d';
    $p_day      = '\d{1,2}';
    $p_year     = '\d\d\d\d|\d\d';
}

##---------------------------------------------------------------------------
##	Set weekday and month names.  This allows localization of
##	names.
##
sub set_date_names {
    package mhtime;

# No.
    return;
    local(*in_wd, *in_Wd, *in_m, *in_M) = @_;
    @weekdays = @in_wd	if scalar(@in_wd);
    @Weekdays = @in_Wd	if scalar(@in_Wd);
    @months   = @in_m 	if scalar(@in_m);
    @Months   = @in_M 	if scalar(@in_M);
}

##---------------------------------------------------------------------------
##	Get date in date(1)-like format.  $local flag is if local time
##	should be used.
##
sub getdate {
    &time2str('', time, $_[0]);
}

##---------------------------------------------------------------------------
##	Convert a calander time to a string.  Similar to strftime(3).
##
sub time2str {
    package mhtime;

    my($fmt, $time, $local) = @_;
    my($date) = "";

# Let's always run on GMT
    $local = 0;

    ## Get current date/time
    my($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = gmtime($time);

    my($yearfull, $hour12);
    $yearfull = $year + 1900;
    $hour12   = $hour > 12 ? $hour-12 : $hour;

    ## Format output
    if ($fmt =~ /\S/) {
	$fmt =~ s/\%a/$weekdays[$wday]/g;
	$fmt =~ s/\%A/$Weekdays[$wday]/g;
	$fmt =~ s/\%b/$months[$mon]/g;
	$fmt =~ s/\%B/$Months[$mon]/g;

	$sec	  = sprintf("%02d", $sec);
	$min	  = sprintf("%02d", $min);
	$hour	  = sprintf("%02d", $hour);
	$hour12   = sprintf("%02d", $hour12);
	$mday	  = sprintf("%02d", $mday);
	$mon	  = sprintf("%02d", $mon+1);
	$year	  = sprintf("%02d", $year);
	$yearfull = sprintf("%04d", $yearfull);
	$wday	  = sprintf("%02d", $wday+1);
	$yday	  = sprintf("%03d", $yday);

	$fmt =~ s/\%d/$mday/g;
	$fmt =~ s/\%H/$hour/g;
	$fmt =~ s/\%I/$hour12/g;
	$fmt =~ s/\%j/$yday/g;
	$fmt =~ s/\%m/$mon/g;
	$fmt =~ s/\%M/$min/g;
	$fmt =~ s/\%n/\n/g;
	$fmt =~ s/\%p/am/g if ($hour < 12);
	$fmt =~ s/\%p/pm/g if ($hour >= 12);
	$fmt =~ s/\%P/AM/g if ($hour < 12);
	$fmt =~ s/\%P/PM/g if ($hour >= 12);
	$fmt =~ s/\%S/$sec/eg;
	$fmt =~ s/\%w/$wday/g;
	$fmt =~ s/\%y/$year/g; 
	$fmt =~ s/\%Y/$year+1900/ge; 

	$fmt =~ s/\%\%/\%/g ; 

	$date = $fmt ;

    } else {
	$date = sprintf("%s %s %02d %02d:%02d:%02d ".
				($local ? "%d" : "GMT %d"),
			$weekdays[$wday], $months[$mon],
			$mday, $hour, $min, $sec, $yearfull);
    }
    $date ;
}

##---------------------------------------------------------------------------
##	parse_date takes a string date specified like the output of
##	date(1) into its components.  Parsing a string for a date is
##	ugly since we have to watch out for differing formats.
##
##	The following date formats are looked for:
##
##	    Wdy DD Mon YY HH:MM:SS Zone
##	    DD Mon YY HH:MM:SS Zone
##	    Wdy Mon DD HH:MM:SS Zone YYYY
##	    Wdy Mon DD HH:MM:SS YYYY
##
##	The routine keys off of the day of time field "HH:MM:SS" and
##	scans realtive to its location.
##
##	If the parse fails, a null array is returned. Thus the routine
##	may be used as follows:
##
##          if ( (@x = &parse_date($date)) ) { Success }
##          else { Fail }
##
##	If success the array contents are as follows:
##
##	    (Weekday (0-6), Day of the month (1-31), Month (0-11),
##	     Year, Hour, Minutes, Seconds, Time Zone)
##
##	Contributer(s): Frank J. Manion <FJ_Manion@fccc.edu>
##
sub parse_date {
    package mhtime;

    local($date) = $_[0];
    local($wday, $mday, $mon, $yr, $time, $hr, $min, $sec, $zone);
    local(@array);
    local($start, $rest);

    # Try to find the date by focusing on the "\d\d:\d\d" field.
    # All parsing is then done relative to this location.
    #
    $date =~ s/^\s+//;  $time = "";  $rest = "";
    #	 Don't use $p_hrmin(sec) vars in split due to bug in perl 5.003.
    ($start, $time, $rest) = split(/(\b\d{1,2}:\d\d:\d\d)/o, $date, 2);
    ($start, $time, $rest) = split(/(\b\d{1,2}:\d\d)/o, $date, 2)
	    if !defined($time) or $time eq "";
    return ()
	unless defined($time) and $time ne "";

    ($hr, $min, $sec) = split(/:/, $time);
    $sec = 0  unless $sec;          # Sometimes seconds not defined

    # Strip $start of all but the last 4 tokens,
    # and stuff all tokens in $rest into @array
    #
    @array = split(' ', $start);
    $start = join(' ', ($#array-3 < 0) ? @array[0..$#array] :
					 @array[$#array-3..$#array]);
    @array = split(' ', $rest);
    $rest  = join(' ', ($#array  >= 1) ? @array[0..1] :
					 $array[0]);
    # Wdy DD Mon YY HH:MM:SS Zone
    if ( $start =~
	 /($p_weekdays),*\s+($p_day)\s+($p_months)\s+($p_year)$/io ) {

	($wday, $mday, $mon, $yr, $zone) = ($1, $2, $3, $4, $array[0]);

    # DD Mon YY HH:MM:SS Zone
    } elsif ( $start =~ /($p_day)\s+($p_months)\s+($p_year)$/io ) {
	($mday, $mon, $yr, $zone) = ($1, $2, $3, $array[0]);

    # Wdy Mon DD HH:MM:SS Zone YYYY
    # Wdy Mon DD HH:MM:SS YYYY
    } elsif ( $start =~ /($p_weekdays),?\s+($p_months)\s+($p_day)$/io ) {
	($wday, $mon, $mday) = ($1, $2, $3);
	if ( $rest =~ /^(\S+)\s+($p_year)/o ) {	# Zone YYYY
	    ($zone, $yr) = ($1, $2);
	} elsif ( $rest =~ /^($p_year)/o ) {	# YYYY
	    ($yr) = ($1);
	} else {				# zilch, use current year
	    warn "Warning: No year in date, using current\n";
	    $yr = (gmtime(time))[5];
	}

    # All else fails!
    } else {
	return ();
    }

    # Modify month and weekday for lookup
    $mon  = $Month2Num{lc $mon}  if defined($mon);
    $wday = $WDay2Num{lc $wday}  if defined($wday);

    ($wday, $mday, $mon, $yr, $hr, $min, $sec, $zone);
}

##---------------------------------------------------------------------------
##	Routine to convert time in seconds to a month, day, and year
##	format.  The format can be "mmddyy", "yymmdd", "ddmmyy".  The
##	year can be specifed as "yyyy" if a 4 digit year is needed.
##
sub time2mmddyy {
    package mhtime;

    local($time, $fmt) = ($_[0], $_[1]);
    local($day,$mon,$year,$ylen);
    if ($time) {
	($day,$mon,$year) = (gmtime($time))[3,4,5];
	$year += 1900;

	## Compute length for year field
	$ylen = $fmt =~ s/y/y/g;
	substr($year, 0, 4 - $ylen) = '';

	## Create string
	if ($fmt =~ /ddmmyy/i) {	# DDMMYY
	    $tmp = sprintf("%02d/%02d/%0${ylen}d", $day, $mon+1, $year);

	} elsif ($fmt =~ /yymmdd/i) {	# YYMMDD
	    $tmp = sprintf("%0${ylen}d/%02d/%02d", $year, $mon+1, $day);

	} else {			# MMDDYY
	    $tmp = sprintf("%02d/%02d/%0${ylen}d", $mon+1, $day, $year);
	}

    } else {
	$tmp = "--/--/--";
    }
}

##---------------------------------------------------------------------------
##	zone_offset_to_secs translates a [+-]HHMM zone offset to
##	seconds.
##
sub zone_offset_to_secs {
    local($off) = shift;
    local($sign, $min);

    if (length($off) < 4) {
	warn qq{Warning: "$off" not a valid timezone offset\n};
	return 0;
    }
    if ($off =~ s/-//) {		# Check for sign
	$sign = -1;
    } else {
	$sign = 1;  s/\+//;
    }
    $min = substr($off, -2, 2);		# Extract minutes
    substr($off, -2, 2) = "";		# Just leave hour in $off
    $sign * (($off * 3600) + ($min * 60));

}

##---------------------------------------------------------------------------##
1;
