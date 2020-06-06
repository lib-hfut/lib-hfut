##---------------------------------------------------------------------------##
##  File:
##      @(#) mhrmm.pl 1.2 98/10/31 11:50:17
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      Rmm routine for MHonArc.
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
##	Function for removing messages.
##
sub rmm {
    local(@numbers) = ();
    local($key, %Num2Index, $num, $i, $pg);
    local($_);

    ## Create list of messages to remove
    foreach (@_) {
	# range
	if (/^(\d+)-(\d+)$/) {
	    push(@numbers, int($1) .. int($2));
	    next;
	}
	# single number
	if (/^\d+$/) {
	    push(@numbers, int($_));
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

    ## Set @MListOrder to flag next/prev messages to be updated.
    ## @TListOrder is already set since it is saved in db.
    @MListOrder = &sort_messages();
    $i=0; foreach $key (@MListOrder) {
	$Index2MLoc{$key} = $i++;
    }

    ## Remove messages
    foreach $num (@numbers) {
	if (($key = $Num2Index{$num}) || $MsgId{$num}) {
	    &delmsg($key);

	    # Need to flag messages that link to deleted message so
	    # they will be updated.
	    foreach (split(/$bs/o, $FollowOld{$index})) {
		$Update{$IndexNum{$_}} = 1;
	    }
	    $Update{$IndexNum{$TListOrder[$Index2TLoc{$key}-1]}} = 1;
	    $Update{$IndexNum{$TListOrder[$Index2TLoc{$key}+1]}} = 1;
	    $Update{$IndexNum{$MListOrder[$Index2MLoc{$key}-1]}} = 1;
	    $Update{$IndexNum{$MListOrder[$Index2MLoc{$key}+1]}} = 1;

	    # Mark where index page updates start
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

    ## Clear loc data; it will get recomputed
    @MListOrder = ();
    %Index2MLoc = ();

    &write_pages();
    1;
}

##---------------------------------------------------------------------------##
1;
