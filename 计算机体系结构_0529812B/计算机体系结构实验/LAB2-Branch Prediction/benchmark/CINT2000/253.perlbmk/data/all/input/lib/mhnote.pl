##---------------------------------------------------------------------------##
##  File:
##      @(#) mhnote.pl 1.1 98/08/10 23:56:33
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      Annotation routine for MHonArc.
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
##	Function for annotating messages.
##
sub annotate {
    my $notetxt = pop(@_);	# last arg is note data

    my(@numbers) = ();
    my($key, %Num2Index, $num, $i, $pg, $file);
    local($_);
    my $NOTEFILE;

    ## Create list of messages to annotate
    foreach (@_) {
	# range
	if (/^(\d+)-(\d+)$/) {
	    push(@numbers, $1 .. $2);	# range op removes leading zeros
	    next;
	}
	# single number
	if (/^\d+$/) {
	    push(@numbers, int($_));	# int() removes leading zeros
	    next;
	}
	# probably message-id
	push(@numbers, $_);
    }

    if ($#numbers < 0) {
	warn("Warning: No messages specified\n");
	return 0;
    }

    ## Make hash to perform deletions
    foreach $key (keys %IndexNum) {
	$Num2Index{$IndexNum{$key}} = $key;
    }

    ## Define %Index2MLoc for determining min main index page update
    $i=0; foreach $key (sort_messages()) {
	$Index2MLoc{$key} = $i++;
    }

    ## Make sure notes directory exists
    my $notedir = get_note_dir();

    ## Annotate messages
    foreach $num (@numbers) {
	if ($key = $Num2Index{$num} || $MsgId{$num}) {

	    ## write note to file
	    $file = join($DIRSEP, $notedir,
			 msgid_to_filename($Index2MsgId{$key}));
	    if (!($NOTEFILE = file_open($file))) {
		warn qq/Warning: Unable to create "$file": $!\n/;
		next;
	    }
	    push @$NOTEFILE, $notetxt;

	    ## flag message to be updated
	    $Update{$IndexNum{$key}} = 1;

	    ## mark where index page updates start
	    if ($MULTIIDX) {
		$pg = int($Index2MLoc{$key}/$IDXSIZE)+1;
		$IdxMinPg = $pg
		    if ($pg < $IdxMinPg || $IdxMinPg < 0);
		$pg = int($Index2TLoc{$key}/$IDXSIZE)+1;
		$TIdxMinPg = $pg
		    if ($pg < $TIdxMinPg || $TIdxMinPg < 0);
	    }

	    next;
	}

	# message not in archive
	warn qq/Warning: Message "$num" not in archive\n/;
    }

    ## Clear data that will get recomputed
    %Index2MLoc = ();

    write_pages();
    1;
}

##---------------------------------------------------------------------------##
1;
