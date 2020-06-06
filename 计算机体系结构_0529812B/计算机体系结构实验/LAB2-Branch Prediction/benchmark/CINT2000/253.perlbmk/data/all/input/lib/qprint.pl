##---------------------------------------------------------------------------##
##  File:
##	@(#) qprint.pl 2.2 98/08/10 23:38:44
##  Authors:
##      Earl Hood       earlhood@usa.net
##	Alan Barrett	barrett@daisy.ee.und.ac.za
##  Description:
##	This library defines the routine to decode "quoted-printable"
##	encoded data.
##	Usage:
##		require "quoted_printable.pl";
##		$text = &quoted_printable'qprdecode($data);
##
##---------------------------------------------------------------------------##
##    Copyright (C) 1995,1998	Earl Hood, earlhood@usa.net
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
##    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
##---------------------------------------------------------------------------##


package quoted_printable;

sub qprdecode {
    local($_) = shift;

    s/[^\S\r\n]*(\r?\n)/$1/g;	# remove trailing whitespace on each line
    s/\=\r?\n//g;		# remove soft linebreaks
    s/=(..)/pack("H2",$1)/ge;	# convert hex codes
    $_;				# return result
}

1;
