##---------------------------------------------------------------------------##
##  File:
##	@(#) osinit.pl 2.2 98/08/10 23:38:25
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##	A library for setting up a script based upon the OS the script
##	is running under.  The main routine defined is OSinit.  See
##	the routine for specific information.
##---------------------------------------------------------------------------##
##    MHonArc -- Internet mail-to-HTML converter
##    Copyright (C) 1995-1998	Earl Hood, earlhood@usa.net
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

package mhonarc;

##---------------------------------------------------------------------------##
##	OSinit() checks what operating system we are running on set
##	some global variables that can be used by the calling routine.
##	All global variables are exported to package main.
##
##	Variables set:
##
##	    $MSDOS	=> Set to 1 if running under MS-DOS/Windows
##	    $MACOS	=> Set to 1 if running under Mac
##	    $UNIX	=> Set to 1 if running under Unix
##	    $VMS	=> Set to 1 if running under VMS
##	    $DIRSEP	=> Directory separator character
##	    $DIRSEPREX	=> Directory separator character for use in
##			   regular expressions.
##	    $PATHSEP	=> Recommend path list separator
##	    $CURDIR	=> Current working directory
##	    $PROG	=> Program name with leading pathname component
##			   stripped off.
##
##	If running under a Mac and the script is a droplet, command-line
##	options will be prompted for unless $noOptions argument is
##	set to true.
##
sub OSinit {
    my($noOptions) = shift;

    ##  Check what system we are executing under
    my($tmp);
    if ($^O =~ /vms/i) {
        $MSDOS = 0;  $MACOS = 0;  $UNIX = 0;  $VMS = 1;
	$DIRSEP = '/';  $CURDIR = '.';
	$PATHSEP = ':';

    } elsif (($^O !~ /cygwin/i) &&
    	     ($^O =~ /win/i) && 
    	     ($tmp = $ENV{'COMSPEC'}) &&
	     ($tmp =~ /[a-zA-Z]:\\/) &&
	     (file_exists($tmp))) {
        $MSDOS = 1;  $MACOS = 0;  $UNIX = 0;  $VMS = 0;
	$DIRSEP = '\\';  $CURDIR = '.';
	$PATHSEP = ';';

    } elsif (defined($MacPerl::Version)) {
        $MSDOS = 0;  $MACOS = 1;  $UNIX = 0;  $VMS = 0;
	$DIRSEP = ':';  $CURDIR = ':';
	$PATHSEP = ';';

    } else {
        $MSDOS = 0;  $MACOS = 0;  $UNIX = 1;  $VMS = 0;
	$DIRSEP = '/';  $CURDIR = '.';
	$PATHSEP = ':';
    }

    ##	Store name of program
    if ($MSDOS || $WINDOWS) {
        $DIRSEPREX = "\\\\\\/";
    } else {
        ($DIRSEPREX = $DIRSEP) =~ s/(\W)/\\$1/g;
    }
    ($PROG = $0) =~ s%.*[$DIRSEPREX]%%o;

    ##	Ask for command-line options if script is a Mac droplet
    ##		Code taken from the MacPerl FAQ
    if (!$noOptions &&
	defined($MacPerl::Version) &&
	( $MacPerl::Version =~ /Application$/ )) {

	# we're running from the app
	local( $cmdLine, @args );
	$cmdLine = &MacPerl::Ask( "Enter command line options:" );
	require "shellwords.pl";
	@args = &shellwords( $cmdLine );
	unshift( @ARGV, @args );
    }
}

##---------------------------------------------------------------------------##
##      OSis_absolute_path() returns true if a string is an absolute path
##
sub OSis_absolute_path {
 
    if ($MSDOS || $WINDOWS) {
        return $_[0] =~ /^([a-z]:)?[\\\/]/i;
    }
    if ($MACOS) {               ## Not sure about Mac
        return $_[0] =~ /^:/o;
    }
    $_[0] =~ m|^/|o;            ## Unix (fallback)
}

##---------------------------------------------------------------------------##
1;
