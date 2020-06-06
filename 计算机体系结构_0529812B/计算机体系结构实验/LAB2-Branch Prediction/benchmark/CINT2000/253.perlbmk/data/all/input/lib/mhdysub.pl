##---------------------------------------------------------------------------##
##  File:
##	@(#) mhdysub.pl 2.2 98/08/10 23:21:42
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      Definition of create_routines() that creates routines are
##	runtime.
##---------------------------------------------------------------------------##
##    MHonArc -- Internet mail-to-HTML converter
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
##    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
##---------------------------------------------------------------------------##

package mhonarc;

my $_sub_eval_cnt = 0;

##---------------------------------------------------------------------------
##	create_routines is used to dynamically create routines that
##	would benefit from being create at run-time.  Routines
##	that have to check against several regular expressions
##	are candidates.
##
sub create_routines {
    my($sub) = '';

    ##-----------------------------------------------------------------------
    ## exclude_field: Used to determine if field should be excluded from
    ## message header
    ##
    $sub  =<<'EndOfRoutine';
    sub exclude_field {
	my($f) = shift;
	my $ret = 0;
	EXC_FIELD_SW: {
EndOfRoutine

    # Create switch block for checking field against regular
    # expressions (a large || statement could also work).
    my $pat;
    foreach $pat (keys %HFieldsExc) {
	$sub .= join('',
		     'if ($f =~ /^',
		     $pat,
		     '/i) { $ret = 1;  last EXC_FIELD_SW; }',
		     "\n");
    }

    $sub .=<<'EndOfRoutine';
	}
	$ret;
    }
EndOfRoutine

    $sub .= "# $_sub_eval_cnt\n";  ++$_sub_eval_cnt;
    eval $sub;
    die("ERROR: Unable to create exclude_field routine:\n$@\n") if $@;

    ##-----------------------------------------------------------------------
    ## subject_strip: Used to apply user-defined s/// operations on
    ## message subjects as they are read;
    ##
    $sub  =<<EndOfRoutine;
    sub subject_strip {
	local(\$_) = shift;
	$SubStripCode;
	\$_;
    }
EndOfRoutine

    $sub .= "# $_sub_eval_cnt\n";  ++$_sub_eval_cnt;
    eval $sub;
    die("ERROR: Unable to create subject_strip routine:\n$@\n") if $@;

    ##-----------------------------------------------------------------------
    ##	Routine to determine last message number in use.
    ##
    $sub =<<'EndOfRoutine';
    sub get_last_msg_num {
	my($max) = -1;
	my $msgrex = '^'.
		     "\Q$MsgPrefix".
		     '(\d+)\.'.
		     "\Q$HtmlExt".
		     '$'; # '
	chop $msgrex  if ($HtmlExt =~ /html$/i);

	foreach (keys %mhonarc_files) {
	    if (/$msgrex/io) { $max = int($1)  if $1 > $max; }
	}
	$max;
    }
EndOfRoutine

    $sub .= "# $_sub_eval_cnt\n";  ++$_sub_eval_cnt;
    eval $sub;
    die("ERROR: Unable to create get_last_msg_num routine:\n$@\n") if $@;

    ##-----------------------------------------------------------------------
    ##	Routine to get base subject text from index
    ##
    $sub =<<'EndOfRoutine';
    sub get_base_subject {
	my($ret) = ($Subject{$_[0]});
	1 while $ret =~ s/$SubReplyRxp//io;
	$ret;
    }
EndOfRoutine

    $sub .= "# $_sub_eval_cnt\n";  ++$_sub_eval_cnt;
    eval $sub;
    die("ERROR: Unable to create get_base_subject routine:\n$@\n") if $@;
}

##---------------------------------------------------------------------------##
1;
