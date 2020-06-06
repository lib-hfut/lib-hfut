##---------------------------------------------------------------------------##
##  File:
##      @(#) mhthread.pl 2.4 98/10/10 16:29:57
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      Thread routines for MHonArc
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

##---------------------------------------------------------------------------
##	write_thread_index outputs the thread index
##
sub write_thread_index {
    local($onlypg) = shift;
    local($tmpl, $handle);
    local($index) = ("");
    local(*a);
    local($PageNum, $PageSize, $totalpgs, %Printed);
    local($lastlevel, $tlevel, $iscont, $i, $offstart, $offend);

    local($level) = 0;  	## !!!Used in print_thread!!!
    local($last0index) = '';

    ## Make sure list orders are set
    if (!scalar(@TListOrder)) {
	&compute_threads();
    }
    if (!scalar(@MListOrder)) {	# need for resource variable expansions
	@MListOrder = &sort_messages();
	%Index2MLoc = ();
	@Index2MLoc{@MListOrder} = (0 .. $#MListOrder);
    }

    &compute_page_total();
    @ThreadList = @TListOrder;
    $PageNum  = $onlypg || 1;
    $totalpgs = $onlypg || $NumOfPages;
 
    for ( ; $PageNum <= $totalpgs; ++$PageNum) {
	next  if $PageNum < $TIdxMinPg;

	if ($MULTIIDX) {
	    $offstart = ($PageNum-1) * $IDXSIZE;
	    $offend   = $offstart + $IDXSIZE-1;
	    $offend   = $#TListOrder  if $#TListOrder < $offend;
	    @a        = @TListOrder[$offstart..$offend];

	    if ($PageNum > 1) {
		$TIDXPATHNAME = join("", $OUTDIR, $DIRSEP,
				     $TIDXPREFIX, $PageNum, ".", $HtmlExt);
	    } else {
		$TIDXPATHNAME = join($DIRSEP, $OUTDIR, $TIDXNAME);
	    }

	} else {
	    $TIDXPATHNAME = join($DIRSEP, $OUTDIR, $TIDXNAME);
	    if ($IDXSIZE && (($i = ($#ThreadList+1) - $IDXSIZE) > 0)) {
		if ($TREVERSE) {
		    @NotIdxThreadList = splice(@ThreadList, $IDXSIZE);
		} else {
		    @NotIdxThreadList = splice(@ThreadList, 0, $i);
		}
	    }
	    *a = *ThreadList;
	}
	$PageSize = scalar(@a);

	if ($IDXONLY) {
	    $handle = 'STDOUT';
	} else {
	    ($handle = &file_create($TIDXPATHNAME, $GzipFiles)) ||
		die("ERROR: Unable to create $TIDXPATHNAME\n");
	}
	print STDOUT "Writing $TIDXPATHNAME ...\n"  unless $QUIET;

	push @$handle, "<!-- ", &commentize("MHonArc v$VERSION"), " -->\n";

	($tmpl = $TIDXPGBEG) =~ s/$VarExp/&replace_li_var($1,'')/geo;
	push @$handle, $tmpl;

	($tmpl = $THEAD) =~ s/$VarExp/&replace_li_var($1,'')/geo;
	push @$handle, $tmpl;

	## Flag visible messages for use in printing thread index page
	foreach $index (@a) { $TVisible{$index} = 1; }

	## Print index.  Print unless message has been printed, or
	## unless it has reference that is visible.
	$level = 0;		# !!!Used in print_thread!!!
	$lastlevel = $ThreadLevel{$a[0]};

	# check if continuing a thread
	if ($lastlevel > 0) {
	    ($tmpl = $TCONTBEG) =~ s/$VarExp/&replace_li_var($1,$a[0])/geo;
	    push @$handle, $tmpl;
	}
	# perform any indenting
	for ($i=0; $i < $lastlevel; ++$i) {
	    ++$level;
	    if ($level <= $TLEVELS) {
		($tmpl = $TINDENTBEG) =~ s/$VarExp/&replace_li_var($1,'')/geo;
		push @$handle, $tmpl;
	    }
	}
	# print index listing
	foreach $index (@a) {
	    $tlevel = $ThreadLevel{$index};
	    if (($lastlevel > 0) && ($tlevel < $lastlevel)) {
		for ($i=$tlevel; $i < $lastlevel; ++$i) {
		    if ($level <= $TLEVELS) {
			($tmpl = $TINDENTEND) =~
			    s/$VarExp/&replace_li_var($1,'')/geo;
			push @$handle, $tmpl;
		    }
		    --$level;
		}
		$lastlevel = $tlevel;
		if ($lastlevel < 1) {	# Check if continuation done
		    ($tmpl = $TCONTEND) =~
			s/$VarExp/&replace_li_var($1,'')/geo;
		    push @$handle, $tmpl;
		}
	    }
	    unless ($Printed{$index} ||
		    ($HasRef{$index} && $TVisible{$HasRef{$index}})) {
		&print_thread($handle, $index,
			      ($lastlevel > 0) ? 0 : 1);
	    }
	}
	# unindent if required
	for ($i=0; $i < $lastlevel; ++$i) {
	    if ($level <= $TLEVELS) {
		($tmpl = $TINDENTEND) =~ s/$VarExp/&replace_li_var($1,'')/geo;
		push @$handle, $tmpl;
	    }
	    --$level;
	}
	# close continuation if required
	if ($lastlevel > 0) {
	    ($tmpl = $TCONTEND) =~ s/$VarExp/&replace_li_var($1,'')/geo;
	    push @$handle, $tmpl;
	}

	## Reset visibility flags
	foreach $index (@a) { $TVisible{$index} = 0; }

	($tmpl = $TFOOT) =~ s/$VarExp/&replace_li_var($1,'')/geo;
	push @$handle, $tmpl;

	&output_doclink($handle);

	($tmpl = $TIDXPGEND) =~ s/$VarExp/&replace_li_var($1,'')/geo;
	push @$handle, $tmpl;

	push @$handle, "<!-- ".&commentize("MHonArc v$VERSION")." -->\n";

    }
}

##---------------------------------------------------------------------------
##	Routine to compute the order messages are listed by thread.
##	Main use is to provide the ability to correctly define
##	values for resource variables related to next/prev thread
##	message.
##
##	NOTE: Thread order is determined by all the messages in an
##	archive, and not by what is visible in the thread index page.
##	Hence, if the thread index page size is less than number of
##	messages, the next/prev messages of thread (accessible via
##	resource variables) will not necessarily correspond to the
##	actual physical next/prev message listed in the thread index.
##	
##	The call to do_thread() defines the TListOrder array for use
##	in expanding thread related resource variables.
##
sub compute_threads {
    local(%FirstSub2Index) = ();
    local(%Counted) = ();
    local(%stripsub) = ();
    local(@refs);
    local($index, $msgid, $refindex, $depth, $tmp);

    ##	Reset key data structures
    @TListOrder  = ();
    %Index2TLoc  = ();
    %ThreadLevel = ();
    %HasRef	 = ();
    %HasRefDepth = ();
    %Replies 	 = ();
    %SReplies 	 = ();

    ##	Sort by date first for subject based threads
    @ThreadList = sort increase_index keys %Subject;

    ##	Find first occurrances of subjects
    foreach $index (@ThreadList) {
	$tmp = lc $Subject{$index};
	1 while (($tmp =~ s/^$SubReplyRxp//io) ||
		 ($tmp =~ s/\s*-\s*re(ply|sponse)\s*$//io));

	$stripsub{$index} = $tmp;
	$FirstSub2Index{$tmp} = $index
	    unless defined($FirstSub2Index{$tmp}) ||
		   (defined($Refs{$index}) &&
		    grep($MsgId{$_}, split(/$X/o, $Refs{$index})));
    }

    ##	Compute thread data
    TCOMP: foreach $index (@ThreadList) {
	next  unless defined($Refs{$index});

	# Check for explicit threading
	if (@refs = split(/$X/o, $Refs{$index})) {
	    $depth = 0;
	    while ($msgid = pop(@refs)) {
		if (($refindex = $MsgId{$msgid})) {

		    $HasRef{$index} = $refindex;
		    $HasRefDepth{$index} = $depth;
		    if ($Replies{$refindex}) {
			$Replies{$refindex} .= $bs . $index;
		    } else {
			$Replies{$refindex} = $index;
		    }
		    next TCOMP;
		}
		++$depth;
	    }
	}

    } continue {
	# Check for subject-based threading
	if (!$HasRef{$index}) {
	    if (($refindex = $FirstSub2Index{$stripsub{$index}}) &&
		($refindex ne $index)) {

		$HasRef{$index} = $refindex;
		$HasRefDepth{$index} = 0;
		if ($SReplies{$refindex}) {
		    $SReplies{$refindex} .= $bs . $index;
		} else {
		    $SReplies{$refindex} = $index;
		}
	    }
	}
    }

    ## Calculate thread listing order
    @ThreadList = &t_sort_messages();
    foreach $index (@ThreadList) {
	unless ($Counted{$index} || $HasRef{$index}) {
	    &do_thread($index, 0);
	}
    }
}

##---------------------------------------------------------------------------
##	do_thread() computes the order messages are listed by thread.
##	Uses %Counted defined locally in compute_thread_from_list().
##	do_thread() main purpose is to set the TListOrder array and
##	Index2TLoc assoc array.
##
sub do_thread {
    local($idx, $level) = ($_[0], $_[1]);
    local(@repls, @srepls) = ();

    ## Get replies
    @repls  = sort increase_index split(/$bs/o, $Replies{$idx})
	if defined($Replies{$idx});
    @srepls = sort increase_index split(/$bs/o, $SReplies{$idx})
	if defined($SReplies{$idx});

    ## Add index to printed order list (IMPORTANT SIDE-EFFECT)
    push(@TListOrder, $idx);
    $Index2TLoc{$idx} = $#TListOrder;

    ## Mark message
    $Counted{$idx} = 1;
    $ThreadLevel{$idx} = $level;

    if (@repls) {
	foreach (@repls) {
	    &do_thread($_, $level + 1 + $HasRefDepth{$_});
	}
    }
    if (@srepls) {
	foreach (@srepls) {
	    &do_thread($_, $level + 1 + $HasRefDepth{$_});
	}
    }
}

##---------------------------------------------------------------------------
##	Routine to print thread.
##	Uses %Printed defined by caller.
##
sub print_thread {
    local($handle, $idx, $top) = ($_[0], $_[1], $_[2]);
    local(@repls, @srepls) = ();
    local($attop, $haverepls, $hvnirepls, $single, $depth, $i);

    ## Get replies
    @repls  = sort increase_index split(/$bs/o, $Replies{$idx})
	if defined($Replies{$idx});
    @srepls = sort increase_index split(/$bs/o, $SReplies{$idx})
	if defined($SReplies{$idx});
    $depth  = $HasRefDepth{$idx};
    $hvnirepls = (@repls || @srepls);

    @repls  = grep($TVisible{$_}, @repls);
    @srepls = grep($TVisible{$_}, @srepls);
    $haverepls = (@repls || @srepls);

    ## $hvnirepls is a flag if the message has replies, but they are
    ## not visible.  $haverepls is a flag if the message has visible
    ## replies.  $hvnirepls is used to determine the $attop and
    ## $single flags.  $haverepls is used for determine recursive
    ## calls and level.

    ## Print entry
    #$attop  = ($top && $haverepls);
    #$single = ($top && !$haverepls);
    $attop   = ($top && $hvnirepls);
    $single  = ($top && !$hvnirepls);

    if ($attop) {
	&print_thread_var($handle, $idx, *TTOPBEG);
    } elsif ($single) {
	&print_thread_var($handle, $idx, *TSINGLETXT);
    } else {
	## Check for missing messages
	if ($DoMissingMsgs) {
	    for ($i = $depth; $i > 0; $i--) {
		$level++;
		&print_thread_var($handle, $idx, *TLINONE);
		&print_thread_var($handle, $idx, *TSUBLISTBEG)
		    if $level <= $TLEVELS;
	    }
	}
	&print_thread_var($handle, $idx, *TLITXT);
    }

    ## Increment level count if their are replies
    if ($haverepls) {
	$level++;
    }

    ## Mark message printed
    $Printed{$idx} = 1;

    ## Print sub-threads
    if (scalar(@repls) || scalar(@srepls)) {
	&print_thread_var($handle, $idx, *TSUBLISTBEG)  if $level <= $TLEVELS;
	foreach (@repls) {
	    &print_thread($handle, $_);
	}
	if (@srepls) {
	    &print_thread_var($handle, $idx, *TSUBJECTBEG);
	    foreach (@srepls) {
		&print_thread($handle, $_);
	    }
	    &print_thread_var($handle, $idx, *TSUBJECTEND);
	}
	&print_thread_var($handle, $idx, *TSUBLISTEND)  if $level <= $TLEVELS;
    }

    ## Decrement level count if their were replies
    if ($haverepls) {
	$level--;
    }
    ## Check for missing messages
    if ($DoMissingMsgs && !($attop || $single)) {
	for ($i = $depth; $i > 0; $i--) {
	    &print_thread_var($handle, $idx, *TLINONEEND);
	    &print_thread_var($handle, $idx, *TSUBLISTEND)
		if $level <= $TLEVELS;
	    $level--;
	}
    }

    ## Close entry text
    if ($attop) {
	&print_thread_var($handle, $idx, *TTOPEND);
    } elsif (!$single) {
	&print_thread_var($handle, $idx, *TLIEND);
    }
}

##---------------------------------------------------------------------------
##	Print out text based upon resource variable referenced by *tvar.
##
sub print_thread_var {
    local($handle, $index, *tvar) = @_;
    local($i_p0, $filename, $tmpl, $msgnum);

    ($tmpl = $tvar) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
    push @$handle, $tmpl;
}

##---------------------------------------------------------------------------
##	make_thread_slice generates a slice of the thread listing.
##	Arguments are:
##
##	    $refindex	: Reference message index that slice is based
##	    $bcnt	: Number of messages before $refindex to list
##	    $acnt	: Number of messages after $refindex to list
##
##	Returns string containing thread slice text.
##
sub make_thread_slice {
    local($refindex, $bcnt, $acnt) = @_;
    local($slicetxt) = "";

    local($pos)   = $Index2TLoc{$refindex};
    local($start) = $pos - $bcnt;
    local($end)   = $pos + $acnt;
	  $start  = 0		  if $start < 0;
	  $end    = $#TListOrder  if $end > $#TListOrder;
    local(@a)	  = @TListOrder[$start..$end];

    local($lastlevel) = $ThreadLevel{$a[0]};
    local($level)     = 0;  	## !!!Used in print_thread!!!
    local(%Printed);		## !!!Used in print_thread!!!
    local($tmpl, $index, $tlevel, $iscont, $i);

    ($tmpl = $TSLICEBEG) =~ s/$VarExp/&replace_li_var($1,'')/geo;
    $slicetxt .= $tmpl;

    ## Flag visible messages for use in printing thread
    foreach $index (@a) { $TVisible{$index} = 1; }

    # check if continuing a thread
    if ($lastlevel > 0) {
	($tmpl = $TCONTBEG) =~ s/$VarExp/&replace_li_var($1,$a[0])/geo;
	$slicetxt .= $tmpl;
    }
    # perform any indenting
    for ($i=0; $i < $lastlevel; ++$i) {
	++$level;
	if ($level <= $TLEVELS) {
	    ($tmpl = $TINDENTBEG) =~ s/$VarExp/&replace_li_var($1,'')/geo;
	    $slicetxt .= $tmpl;
	}
    }
    # print index listing
    foreach $index (@a) {
	$tlevel = $ThreadLevel{$index};
	if (($lastlevel > 0) && ($tlevel < $lastlevel)) {
	    for ($i=$tlevel; $i < $lastlevel; ++$i) {
		if ($level <= $TLEVELS) {
		    ($tmpl = $TINDENTEND) =~
			s/$VarExp/&replace_li_var($1,'')/geo;
		    $slicetxt .= $tmpl;
		}
		--$level;
	    }
	    $lastlevel = $tlevel;
	    if ($lastlevel < 1) {	# Check if continuation done
		($tmpl = $TCONTEND) =~
		    s/$VarExp/&replace_li_var($1,'')/geo;
		$slicetxt .= $tmpl;
	    }
	}
	unless ($Printed{$index} ||
		($HasRef{$index} && $TVisible{$HasRef{$index}})) {
	    $slicetxt .= &make_thread($index, ($lastlevel > 0) ? 0 : 1);
	}
    }
    # unindent if required
    for ($i=0; $i < $lastlevel; ++$i) {
	if ($level <= $TLEVELS) {
	    ($tmpl = $TINDENTEND) =~ s/$VarExp/&replace_li_var($1,'')/geo;
	    $slicetxt .= $tmpl;
	}
	--$level;
    }
    # close continuation if required
    if ($lastlevel > 0) {
	($tmpl = $TCONTEND) =~ s/$VarExp/&replace_li_var($1,'')/geo;
	$slicetxt .= $tmpl;
    }

    ## Reset visibility flags
    foreach $index (@a) { $TVisible{$index} = 0; }

    ($tmpl = $TSLICEEND) =~ s/$VarExp/&replace_li_var($1,'')/geo;
    $slicetxt .= $tmpl;

    $slicetxt;
}

##---------------------------------------------------------------------------
##	Routine to generate text representing a thread.
##	Uses %Printed and $level defined by caller.
##
sub make_thread {
    local($idx, $top) = @_;
    local(@repls, @srepls);
    local($attop, $haverepls, $hvnirepls, $single, $depth, $i);
    local($ret) = "";

    ## Get replies
    @repls  = sort increase_index split(/$bs/o, $Replies{$idx});
    @srepls = sort increase_index split(/$bs/o, $SReplies{$idx});
    $depth  = $HasRefDepth{$idx};
    $hvnirepls = (@repls || @srepls);

    @repls  = grep($TVisible{$_}, @repls);
    @srepls = grep($TVisible{$_}, @srepls);
    $haverepls = (@repls || @srepls);

    ## $hvnirepls is a flag if the message has replies, but they are
    ## not visible.  $haverepls is a flag if the message has visible
    ## replies.  $hvnirepls is used to determine the $attop and
    ## $single flags.  $haverepls is used for determine recursive
    ## calls and level.

    ## Print entry
    $attop   = ($top && $hvnirepls);
    $single  = ($top && !$hvnirepls);

    if ($attop) {
	$ret .= &expand_thread_var($idx, *TTOPBEG);
    } elsif ($single) {
	$ret .= &expand_thread_var($idx, *TSINGLETXT);
    } else {
	## Check for missing messages
	if ($DoMissingMsgs) {
	    for ($i = $depth; $i > 0; $i--) {
		$level++;
		$ret .= &expand_thread_var($idx, *TLINONE);
		$ret .= &expand_thread_var($idx, *TSUBLISTBEG)
		    if $level <= $TLEVELS;
	    }
	}
	$ret .= &expand_thread_var($idx, *TLITXT);
    }

    ## Increment level count if their are replies
    if ($haverepls) {
	$level++;
    }

    ## Mark message printed
    $Printed{$idx} = 1;

    ## Print sub-threads
    if (@repls) {
	$ret .= &expand_thread_var($idx, *TSUBLISTBEG)  if $level <= $TLEVELS;
	foreach (@repls) {
	    $ret .= &make_thread($_);
	}
	$ret .= &expand_thread_var($idx, *TSUBLISTEND)  if $level <= $TLEVELS;
    }
    if (@srepls) {
	$ret .= &expand_thread_var($idx, *TSUBLISTBEG)  if $level <= $TLEVELS;
	$ret .= &expand_thread_var($idx, *TSUBJECTBEG);
	foreach (@srepls) {
	    $ret .= &make_thread($_);
	}
	$ret .= &expand_thread_var($idx, *TSUBJECTEND);
	$ret .= &expand_thread_var($idx, *TSUBLISTEND)  if $level <= $TLEVELS;
    }

    ## Decrement level count if their were replies
    if ($haverepls) {
	$level--;
    }
    ## Check for missing messages
    if ($DoMissingMsgs && !($attop || $single)) {
	for ($i = $depth; $i > 0; $i--) {
	    $ret .= &expand_thread_var($idx, *TLINONEEND);
	    $ret .= &expand_thread_var($idx, *TSUBLISTEND)
		if $level <= $TLEVELS;
	    $level--;
	}
    }

    ## Close entry text
    if ($attop) {
	$ret .= &expand_thread_var($idx, *TTOPEND);
    } elsif (!$single) {
	$ret .= &expand_thread_var($idx, *TLIEND);
    }

    $ret;
}

##---------------------------------------------------------------------------
##	Expand text based upon resource variable referenced by *tvar.
##
sub expand_thread_var {
    local($index, *tvar) = @_;
    local($i_p0, $filename, $expstr, $msgnum);

    ($expstr = $tvar) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
    $expstr;
}

##---------------------------------------------------------------------------
1;
