##---------------------------------------------------------------------------##
##  File:
##      @(#) mhsingle.pl 1.2 98/10/31 12:10:13
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      Routines for converting a single message to HTML
##---------------------------------------------------------------------------##
##    MHonArc -- Internet mail-to-HTML converter
##    Copyright (C) 1995-1998   Earl Hood, earlhood@usa.net
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

##---------------------------------------------------------------------------
##	Routine to perform conversion of a single mail message to
##	HTML.
##
sub single {
    local($mhead,$index,$from,$date,$sub,$header,$handle,$mesg,
	  $template,$filename,%fields);

    ## Prevent any verbose output
    $QUIET = 1;

    ## See where input is coming from
    if ($ARGV[0]) {
	($handle = &file_open($ARGV[0])) ||
	    die("ERROR: Unable to open $ARGV[0]\n");
	$filename = $ARGV[0];
    } else {
	$handle = 'STDIN';
    }

    ## Read header
    ($index,$from,$date,$sub,$header) =
	&read_mail_header($handle, *mhead, *fields);

    ($From{$index},$Date{$index},$Subject{$index}) = ($from,$date,$sub);
    $MsgHead{$index} = $mhead;

    ## Read rest of message
    $Message{$index} = &read_mail_body($handle, $index, $header, *fields);

    ## Set index list structures for replace_li_var()
    @MListOrder = &sort_messages();
    %Index2MLoc = ();
    @Index2MLoc{@MListOrder} = (0 .. $#MListOrder);

    ## Output mail
    &output_mail($index, 1, 0);

}

##---------------------------------------------------------------------------
1;
