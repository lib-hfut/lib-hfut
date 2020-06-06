##---------------------------------------------------------------------------##
##  File:
##	@(#) mhamain.pl 2.10 98/11/08 12:17:52
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##	Main library for MHonArc.
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

$VERSION = "2.3.3";
$VINFO =<<EndOfInfo;
  MHonArc v$VERSION (Perl $]) -- Hacked up for SPEC CPU2000
  Copyright (C) 1995-1998  Earl Hood, earlhood\@usa.net
  MHonArc comes with ABSOLUTELY NO WARRANTY and MHonArc may be copied only
  under the terms of the GNU General Public License, which may be found in
  the MHonArc distribution.
EndOfInfo

$CODE		= 0;
$ERROR  	= "";
@OrgARGV	= ();
$ArchiveOpen	= 0;

$_msgid_cnt	= 0;

###############################################################################
##	Public routines
###############################################################################

##---------------------------------------------------------------------------
##	initialize() does some initialization stuff.
##
sub initialize {
    ##	Turn off buffered I/O to terminal
    local($curfh) = select(STDOUT);
    $| = 1;
    select($curfh);

    ##	Check what system we are executing under
    require 'osinit.pl'	   || die("ERROR: Unable to require osinit.pl\n");
    &OSinit();

    ##	Require essential libraries
    require 'mhopt.pl'     || die("ERROR: Unable to require mhopt.pl\n");

    ##	Init some variables
    $ISLOCK     = 0;	# Database lock flag

    $StartTime	= 0;	# CPU start time of processing
    $EndTime	= 0;	# CPU end time of processing
}

##---------------------------------------------------------------------------
##	open_archive opens the archive
##
sub open_archive {
    eval { $StartTime = (times)[0]; };

    ## Set @ARGV if options passed in
    if (@_) { @OrgARGV = @ARGV; @ARGV = @_; }

    ## Set options
    local($optstatus);
    eval {
	$optstatus = get_resources();
    };

    ## Check for error
    if ($@ || $optstatus <= 0) {
	if ($@) {
	    $CODE = int($!) ? int($!) : 255;
	    $ERROR = $@;
	    warn "\n", $ERROR;
	} else {
	    if ($optstatus < 0) {
		$CODE = $! = 255;
		$ERROR = "ERROR: Problem loading resources\n";
	    } else {
		$CODE = 0;
	    }
	}
	close_archive();
	return 0;
    }
    $ArchiveOpen = 1;
    1;
}

##---------------------------------------------------------------------------
##	close_archive closes the archive.
##
sub close_archive {
    ## Remove lock
    remove_lock_file();

    ## Stop timing
    eval { $EndTime = (times)[0]; };
    my $cputime = $EndTime - $StartTime;

    ## Output time (if specified)
    if ($TIME) {
	printf(STDERR "\nTime: %.2f CPU seconds\n", $cputime);
    }

    ## Restore @ARGV
    if (@OrgARGV) { @ARGV = @OrgARGV; }

    $ArchiveOpen = 0;

    ## Return time
    $cputime;
}

##---------------------------------------------------------------------------
##	Routine to process input.  If no errors, routine returns the
##	CPU time taken.  If an error, returns undef.
##
sub process_input {

    ## Do processing
    if ($ArchiveOpen) {
	# archive already open, so doit
	eval { doit(); };

    } else {
	# open archive first (implictely pass @_ to open_archive)
	if (&open_archive) {
	    eval { doit(); };
	} else {
	    return undef;
	}
    }

    # check for error
    if ($@) {
	$CODE = (int($!) ? int($!) : 255)  unless $CODE;
	$ERROR = $@;
	&close_archive();
	warn "\n", $ERROR;
	return undef;
    }

    ## Cleanup
    close_archive();
}

###############################################################################
##	Private routines
###############################################################################

##---------------------------------------------------------------------------
##	Routine that does the work
##
sub doit {

    ## Check for non-archive modification modes.

    ## Just converting a single message to HTML
    if ($SINGLE) {
	single();
	return 1;
    }

    ## Text message listing of archive to standard output.
    if ($SCAN) {
	scan();
	return 1;
    }

    ## Annotating messages
    if ($ANNOTATE) {
	print STDOUT "Annotating messages in $OUTDIR ...\n"  unless $QUIET;

	if (!defined($NoteText)) {
	    print STDOUT "Please enter note text (terminated with EOF char):\n"
		unless $QUIET;
	    $NoteText = join("", <STDIN>);
	}
	return annotate(@ARGV, $NoteText);
    }

    ## Removing messages
    if ($RMM) {
	print STDOUT "Removing messages from $OUTDIR ...\n"
	    unless $QUIET;
	return rmm(@ARGV);
    }

    ## HTML message listing to standard output.
    if ($IDXONLY) {
	$QUIET = 0;
	IDXPAGE: {
	    &compute_page_total();
	    if ($IdxPageNum && $MULTIIDX) {
		if ($IdxPageNum =~ /first/i) {
		    $IdxPageNum = 1;
		    last IDXPAGE;
		} 
		if ($IdxPageNum =~ /last/i) {
		    $IdxPageNum = $NumOfPages;
		    last IDXPAGE;
		}
		$IdxPageNum = int($IdxPageNum);
		last IDXPAGE  if $IdxPageNum;
	    }
	    $MULTIIDX   = 0;
	    $IdxPageNum = 1;
	    $NumOfPages = 1;
	}
	if ($THREAD) {
	    &compute_threads();
	    &write_thread_index($IdxPageNum);
	} else {
	    &write_main_index($IdxPageNum);
	}
	return 1;
    }

    ## Get here, we are processing mail folders

    local($mesg, $tmp, $index, $sub, $from, $i, $date, $fh);
    local(%fields);

    $i = $NumOfMsgs;
    ##-------------------##
    ## Read mail folders ##
    ##-------------------##
    ## Just editing pages
    if ($EDITIDX) {
	print STDOUT "Editing $OUTDIR layout ...\n"  unless $QUIET;

    ## Adding a single message
    } elsif ($ADDSINGLE) {
	print STDOUT "Adding message to $OUTDIR\n"  unless $QUIET;
	$handle = $ADD;

	## Read mail head
	($index,$from,$date,$sub,$header) =
	    &read_mail_header($handle, *mesg, *fields);

	if ($index ne '') {
	    ($From{$index},$Date{$index},$Subject{$index}) =
		($from,$date,$sub);

	    $AddIndex{$index} = 1;
	    $IndexNum{$index} = &getNewMsgNum();

	    $MsgHead{$index} = $mesg;

	    ## Read rest of message
	    $Message{$index} = &read_mail_body(
					$handle,
					$index,
					$header,
				        *fields,
					$NoMsgPgs);
	}

    ## Adding/converting mail{boxes,folders}
    } else {
	print STDOUT ($ADD ? "Adding" : "Converting"), " messages to $OUTDIR"
	    unless $QUIET;
	local($mbox, $mesgfile, @files);

	foreach $mbox (@ARGV) {

	    ## MH mail folder (a directory)
	    if (0 && -d $mbox) {
		# Let's just not mention directory functions...
		# We won't ever hit this piece of code anyway.
#		if (!opendir(MAILDIR, $mbox)) {
#		    warn "\nWarning: Unable to open $mbox\n";
#		    next;
#		}
		$MBOX = 0;  $MH = 1;
		print STDOUT "\nReading $mbox "  unless $QUIET;
#		@files = sort numerically grep(/$MHPATTERN/o,
#					       readdir(MAILDIR));
#		closedir(MAILDIR);
		foreach (@files) {
		    $mesgfile = "${mbox}${DIRSEP}${_}";
		    if (!($fh = &file_open($mesgfile))) {
			warn "\nWarning: Unable to open message $mesgfile\n";
			next;
		    }
		    print STDOUT "."  unless $QUIET;
		    $mesg = '';
		    ($index,$from,$date,$sub,$header) =
			&read_mail_header($fh, *mesg, *fields);

		    #  Process message if valid
		    if ($index ne '') {
			($From{$index},$Date{$index},$Subject{$index}) =
			    ($from,$date,$sub);
			$MsgHead{$index} = $mesg;

			if ($ADD && !$SLOW) { $AddIndex{$index} = 1; }
			$IndexNum{$index} = &getNewMsgNum();

			$Message{$index} = &read_mail_body(
						$fh,
						$index,
						$header,
					        *fields,
						$NoMsgPgs);
			#  Check if conserving memory
			if ($SLOW && $DoArchive) {
			    &output_mail($index, 1, 1);
			    $Update{$IndexNum{$index}} = 1;
			    undef $MsgHead{$index};
			    undef $Message{$index};
			}
		    }
		}

	    ## UUCP mail box file
	    } else {
		if ($mbox eq "-") {
		    $fh = 'STDIN';
		} elsif (!($fh = &file_open($mbox))) {
		    warn "\nWarning: Unable to open $mbox\n";
		    next;
		}

		$MBOX = 1;  $MH = 0;
		print STDOUT "\nReading $mbox "  unless $QUIET;
		while ($_ = shift(@$fh)) { last if /$FROM/o; }
		MBOX: while ($#{@$fh} >= 0) {
		    print STDOUT "."  unless $QUIET;
		    $mesg = '';
		    ($index,$from,$date,$sub,$header) =
			&read_mail_header($fh, *mesg, *fields);

		    if ($index ne '') {
			($From{$index},$Date{$index},$Subject{$index}) =
			    ($from,$date,$sub);
			$MsgHead{$index} = $mesg;

			if ($ADD && !$SLOW) { $AddIndex{$index} = 1; }
			$IndexNum{$index} = &getNewMsgNum();

			$Message{$index} = &read_mail_body(
						$fh,
						$index,
						$header,
						*fields,
						$NoMsgPgs);
			if ($SLOW && $DoArchive) {
			    &output_mail($index, 1, 1);
			    $Update{$IndexNum{$index}} = 1;
			    delete($MsgHead{$index});
			    delete($Message{$index});
			}
		    } else {
			&read_mail_body($fh, $index, $header, *fields, 1);
		    }
		}

	    } # END: else UUCP mailbox
	} # END: foreach $mbox
    } # END: Else converting mailboxes

    ## All done if not creating an archive
    if (!$DoArchive) {
	return 1;
    }

    ## Check if there are any new messages
    if (!$EDITIDX && ($i == $NumOfMsgs)) {
	print STDOUT "\nNo new messages\n"  unless $QUIET;
	return 1;
    }

    ## Write pages
    &write_pages();
    1;
}

##---------------------------------------------------------------------------
##	write_pages writes out all archive pages and db
##
sub write_pages {
    local($i, $key, $index, $tmp, $tmp2);
    my(@array2);

    ## Remove old message if hit maximum size or expiration
    if (($MAXSIZE && ($NumOfMsgs > $MAXSIZE)) ||
	$ExpireTime ||
	$ExpireDateTime) {

	## Set @MListOrder and %Index2MLoc for properly marking messages
	## to be updated when a related messages are removed.  Thread
	## data should be around from db.

	@MListOrder = sort_messages();
	@Index2MLoc{@MListOrder} = (0 .. $#MListOrder);

	# Ignore termination signals
	#&ign_signals();

	## Expiration based upon time
	my($mloc, $tloc);
	foreach $index (sort increase_index keys %Subject) {
	    last  unless
		    ($MAXSIZE && ($NumOfMsgs > $MAXSIZE)) ||
		    (&expired_time(&get_time_from_index($index)));

	    &delmsg($index);

	    # Mark messages that need to be updated
	    if (!$NoMsgPgs) {
		$mloc = $Index2MLoc{$index};  $tloc = $Index2TLoc{$index};
		$Update{$IndexNum{$MListOrder[$mloc-1]}} = 1
		    if $mloc-1 >= 0;
		$Update{$IndexNum{$MListOrder[$mloc+1]}} = 1
		    if $mloc+1 <= $#MListOrder;
		$Update{$IndexNum{$TListOrder[$tloc-1]}} = 1
		    if $tloc-1 >= 0;
		$Update{$IndexNum{$TListOrder[$tloc+1]}} = 1
		    if $tloc+1 <= $#TListOrder;
		for ($i=2; $i <= $TSliceNBefore; ++$i) {
		    $Update{$IndexNum{$TListOrder[$tloc-$i]}} = 1
			if $tloc-$i >= 0;
		}
		for ($i=2; $i <= $TSliceNAfter; ++$i) {
		    $Update{$IndexNum{$TListOrder[$tloc+$i]}} = 1
			if $tloc-$i >= $#TListOrder;
		}
		foreach (split(/$bs/o, $FollowOld{$index})) {
		    $Update{$IndexNum{$_}} = 1;
		}
	    }

	    # Mark where index page updates start
	    if ($MULTIIDX) {
		$tmp = int($Index2MLoc{$index}/$IDXSIZE)+1;
		$IdxMinPg = $tmp
		    if ($tmp < $IdxMinPg || $IdxMinPg < 0);
		$tmp = int($Index2TLoc{$index}/$IDXSIZE)+1;
		$TIdxMinPg = $tmp
		    if ($tmp < $TIdxMinPg || $TIdxMinPg < 0);
	    }
	}
    }

    ## Reset MListOrder
    @MListOrder = &sort_messages();
    @Index2MLoc{@MListOrder} = (0 .. $#MListOrder);

    ## Compute follow up messages
    &compute_follow_ups(\@MListOrder);

    ##	Compute thread information (sets ThreadList, TListOrder, Index2TLoc)
    &compute_threads();

    ## Check for which messages to update when adding to archive
    if ($ADD) {
	if ($UPDATE_ALL) {
	    foreach $index (@MListOrder) { $Update{$IndexNum{$index}} = 1; }
	    $IdxMinPg = 0;
	    $TIdxMinPg = 0;

	} else {
	    $i = 0;
	    foreach $index (@MListOrder) {
		## Check for New follow-up links
		if ($FollowOld{$index} ne $Follow{$index}) {
		    $Update{$IndexNum{$index}} = 1;
		}
		## Check if new message; must update links in prev/next msgs
		if ($AddIndex{$index}) {

		    # Mark where main index page updates start
		    if ($MULTIIDX) {
			$tmp = int($Index2MLoc{$index}/$IDXSIZE)+1;
			$IdxMinPg = $tmp
			    if ($tmp < $IdxMinPg || $IdxMinPg < 0);
		    }

		    # Mark previous/next messages
		    $Update{$IndexNum{$MListOrder[$i-1]}} = 1
			if $i > 0;
		    $Update{$IndexNum{$MListOrder[$i+1]}} = 1
			if $i < $#MListOrder;
		}
		## Check for New reference links
		foreach (split(/$X/o, $Refs{$index})) {
		    $tmp = $MsgId{$_};
		    if (defined($IndexNum{$tmp}) && $AddIndex{$tmp}) {
			$Update{$IndexNum{$index}} = 1;
		    }
		}
		$i++;
	    }
	    $i = 0;
	    foreach $index (@TListOrder) {
		## Check if new message; must update links in prev/next msgs
		if ($AddIndex{$index}) {

		    # Mark where thread index page updates start
		    if ($MULTIIDX) {
			$tmp = int($Index2TLoc{$index}/$IDXSIZE)+1;
			$TIdxMinPg = $tmp
			    if ($tmp < $TIdxMinPg || $TIdxMinPg < 0);
		    }

		    # Mark previous/next message in thread
		    $Update{$IndexNum{$TListOrder[$i-1]}} = 1
			if $i > 0;
		    $Update{$IndexNum{$TListOrder[$i+1]}} = 1
			if $i < $#TListOrder;
		}
		$i++;
	    }
	}
    }

    ##	Compute total number of pages
    $i = $NumOfPages;
    &compute_page_total();

    ## Update all pages for $LASTPG$
    if ($UsingLASTPG && ($i != $NumOfPages)) {
	$IdxMinPg = 0;
	$TIdxMinPg = 0;
    }

    ##------------##
    ## Write Data ##
    ##------------##
    #&ign_signals();		# Ignore termination signals
    print STDOUT "\n"  unless $QUIET;

    ## Write indexes and mail
    &write_mail()		unless $NoMsgPgs;
    &write_main_index() 	if $MAIN;
    &write_thread_index()	if $THREAD;

    ## Write database
    print STDOUT "Writing database ...\n"  unless $QUIET;
    &output_db($DBPathName);

    ## Write any alternate indexes
    $IdxMinPg = 0; $TIdxMinPg = 0;
    my($rc, $rcfile);
    OTHERIDX: foreach $rc (@OtherIdxs) {
	$THREAD = 0;

	## find other index resource file
	IDXFIND: {
	    if (!file_exists($rc)) {
		$rcfile = join($DIRSEP, $OUTDIR, $rc);
		if (!file_exists($rcfile)) {
		    # look thru @INC to find file
		    local($_);
		    foreach (@INC) {
			$rcfile = join($DIRSEP, $_, $rc);
			if (file_exists($rcfile)) {
			    last IDXFIND;
			}
		    }
		    warn qq/Warning: Unable to find resource file "$rc"\n/;
		    next OTHERIDX;
		}

	    } else {
		$rcfile = $rc;
	    }
	}
	    
	## read resource file and print index
	if (&read_fmt_file($rcfile)) {
	    if ($THREAD) {
		@TListOrder = ();
		&write_thread_index();
	    } else {
		@MListOrder = ();
		&write_main_index();
	    }
	}
    }

    print STDOUT "$NumOfMsgs messages\n"  unless $QUIET;

}

##---------------------------------------------------------------------------
##	Compute follow-ups
##
sub compute_follow_ups {
    my $idxlst = shift;
    my($index, $tmp, $tmp2);
    my(@array);

    %Follow = ();
    foreach $index (@$idxlst) {
	$FolCnt{$index} = 0  unless $FolCnt{$index};
	if ( defined($Refs{$index}) &&
	     (@array = split(/$X/o, $Refs{$index}))) {

	    $tmp2 = $array[$#array];
	    next  unless defined($MsgId{$tmp2}) &&
			 defined($IndexNum{$MsgId{$tmp2}});
	    $tmp = $MsgId{$tmp2};
	    if ($Follow{$tmp}) { $Follow{$tmp} .= $bs . $index; }
	    else { $Follow{$tmp} = $index; }
	    ++$FolCnt{$tmp};
	}
    }
}

##---------------------------------------------------------------------------
##	Compute total number of pages
##
sub compute_page_total {
    if ($MULTIIDX && $IDXSIZE) {
	$NumOfPages   = int($NumOfMsgs/$IDXSIZE);
	++$NumOfPages      if ($NumOfMsgs/$IDXSIZE) > $NumOfPages;
	$NumOfPages   = 1  if $NumOfPages == 0;
    } else {
	$NumOfPages = 1;
    }
}

##---------------------------------------------------------------------------
##	write_mail outputs converted mail.  It takes a reference to an
##	array containing indexes of messages to output.
##
sub write_mail {
    local($hack) = (0);
    print STDOUT "Writing mail "  unless $QUIET;

    if ($SLOW && !$ADD) {
	$ADD = 1;
	$hack = 1;
    }

    foreach $index (@MListOrder) {
	print STDOUT "."  unless $QUIET;
	&output_mail($index, $AddIndex{$index}, 0);
    }

    if ($hack) {
	$ADD = 0;
    }

    print STDOUT "\n"  unless $QUIET;
}

##---------------------------------------------------------------------------
##	read_mail_header() is responsible for parsing the header of
##	a mail message.
##
sub read_mail_header {
    local($handle, *mesg, *fields) = @_;
    my(%l2o, $header, $index, $date, $tmp, @refs, @array);
    local($from, $sub, $msgid);
    local($_);

    $header = &readmail::MAILread_file_header($handle, *fields, *l2o);
    @refs = ();
    @array = ();

    ##------------##
    ## Get Msg-ID ##
    ##------------##
    $msgid = $fields{'message-id'} || $fields{'msg-id'} || 
	     $fields{'content-id'};
    if (defined($msgid)) {
	if ($msgid =~ /<([^>]*)>/) {
	    $msgid = $1;
	} else {
	    $msgid =~ s/^\s+//;
	    $msgid =~ s/\s+$//;
	}
    } else {
        # create bogus ID if none exists
	$msgid = join("", $$,'.',time,'.',$_msgid_cnt++,
			  '@NO-ID-FOUND.mhonarc.com');
    }

    ## Return if message already exists in archive
    if ($msgid && defined($MsgId{$msgid})) {
	return ("", "", "", "", "");
    }

    ##----------##
    ## Get date ##
    ##----------##
    $date = "";  $index = "";
    foreach (@DateFields) {
	next  unless $fields{$_};

	## Treat received field specially
	if ($_ eq 'received') {
	    @array = split(/;/,
			   (split(/$readmail::FieldSep/o, $fields{$_}))[0]);
	    $date = pop @array;
	## Any other field should just be a date
	} else {
	    $date = (split(/$readmail::FieldSep/o, $fields{$_}))[0];
	}
	$date =~ s/^\s+//;  $date =~ s/\s+$//;

	## See if time_t can be determined.
	if (($date =~ /\w/) && (@array = &parse_date($date))) {
	    $index = &get_time_from_date(@array[1..$#array]);
	    last;
	}
    }
    if ($index eq "") {
	warn qq/\nWarning: Could not parse date for message\n/,
	       qq/         Message-Id: <$msgid>\n/;
	# Use current time
	$index = time;
	# Set date string to local date if not defined
	$date  = &time2str("", $index, 1)  unless $date =~ /\S/;
    }

    ## Return if message too old to add
    if (&expired_time($index)) {
	return ("", "", "", "", "");
    }

    ##-------------##
    ## Get Subject ##
    ##-------------##
    if (defined($fields{'subject'}) and $fields{'subject'} =~ /\S/) {
	($sub = $fields{'subject'}) =~ s/\s+$//;
	$sub = subject_strip($sub)  if $SubStripCode;
    } else {
	$sub = 'No Subject';
    }

    ##----------##
    ## Get From ##
    ##----------##
    $from = "";
    foreach (@FromFields) {
	next  unless $fields{$_};
	$from = $fields{$_};
	last;
    }
    $from = 'No Author'  unless $from;

    ##----------------##
    ## Get References ##
    ##----------------##
    if (defined($tmp = $fields{'references'})) {
	while ($tmp =~ s/<([^<>]+)>//) {
	    push(@refs, $1);
	}
    }
    if (defined($tmp = $fields{'in-reply-to'})) {
	my $irtoid = "";
	while ($tmp =~ s/<([^<>]+)>//) { $irtoid = $1 };
	push(@refs, $irtoid)  if $irtoid;
    }

    ##------------------------##
    ## Create HTML for header ##
    ##------------------------##
    $mesg .= &htmlize_header(*fields, *l2o);

    ## Insure uniqueness of index
    $index .= $X . sprintf("%d",$LastMsgNum+1);

    if ($fields{'content-type'}) {
	($tmp = $fields{'content-type'}) =~ m%^\s*([\w-\./]+)%;
	$tmp = $1 || 'text/plain';
	$tmp =~ tr/A-Z/a-z/;
    } else {
	$tmp = 'text/plain';
    }
    $ContentType{$index} = $tmp;

    if ($msgid) {
	$MsgId{$msgid} = $index;
	$NewMsgId{$msgid} = $index;	# Track new message-ids
	$Index2MsgId{$index} = $msgid;
    }
    &remove_dups(*refs);                # Remove duplicate msg-ids
    $Refs{$index} = join($X, @refs)  if (@refs);

    ($index,$from,$date,$sub,$header);
}

##---------------------------------------------------------------------------
##	read_mail_body() reads in the body of a message.  The returned
##	filtered body is in $ret.
##
sub read_mail_body {
    local($handle, $index, $header, *fields, $skip) = @_;
    my($ret, $data) = ('', '');
    my(@files) = ();
    local($_);

    ## Define "globals" for use by filters
    ##	NOTE: This stuff can be handled better, and will be done
    ##	      when/if I get around to rewriting mhonarc in (OO) Perl 5.
    $MHAmsgnum = &fmt_msgnum($IndexNum{$index}) unless $skip;

    ## Slurp up message body
    ##	UUCP mailbox
    if ($MBOX) {
	if ($CONLEN && $fields{"content-length"}) { # Check for content-length
	    my($len, $cnt) = ($fields{"content-length"}, 0);
	    if ($len) {
		while ($_ = shift(@$handle)) {
		    $cnt += length($_);		# Increment byte count
		    $data .= $_  unless $skip;  # Save data
		    last  if $cnt >= $len	# Last if hit length
		}
	    }
	    # Slurp up bogus data if required (should I do this?)
	    while (!/$FROM/o && !eof($handle)) {
		$_ = shift(@$handle);
	    }

	} else {				# No content-length
	    while ($_ = shift(@$handle)) {
		last if /$FROM/o;
		$data .= $_  unless $skip;
	    }
	}

    ##	MH message file
    } elsif (!$skip) {
	local $/ = undef;
	$data = @$handle;
    }

    ## Filter data
    return ''  if $skip;
    $fields{'content-type'} = 'text/plain'
	if (!defined($fields{'content-type'})) ||
	   ($fields{'content-type'} !~ /\S/);
    ($ret, @files) = &readmail::MAILread_body($header, $data,
				    $fields{'content-type'},
				    $fields{'content-transfer-encoding'});
    $ret = join('',
		"<DL>\n",
		"<DT><STRONG>Warning</STRONG></DT>\n",
		"<DD>Could not process message with given Content-Type: \n",
		"<CODE>", $fields{'content-type'}, "</CODE>\n",
		"</DD>\n",
		"</DL>\n"
		)  unless $ret;
    if (@files) {
	$Derived{$index} = join($X, @files);
    }
    $ret;
}

##---------------------------------------------------------------------------
##	Output/edit a mail message.
##	    $index	=> current index (== $array[$i])
##	    $force	=> flag if mail is written and not editted, regardless
##	    $nocustom	=> ignore sections with user customization
##
sub output_mail {
    local($index, $force, $nocustom) = @_;
    local($msgi, $tmp, $tmp2, $template, @array2);
    local($filepathname, $tmppathname, $i_p0, $filename, $msghandle,
	  $msginfh, $drvfh);
    local($adding) = ($ADD && !$force && !$SINGLE);

    $i_p0 = &fmt_msgnum($IndexNum{$index});

    $filename     = &msgnum_filename($IndexNum{$index});
    $filepathname = join($DIRSEP, $OUTDIR, $filename);
    $tmppathname  = join($DIRSEP, $OUTDIR, "msgtmp.$$");

    if ($adding) {
	return ($i_p0,$filename)  unless $Update{$IndexNum{$index}};
	&file_rename($filepathname, $tmppathname);
	$msginfh = &file_open($tmppathname);
    }
    if ($SINGLE) {
	$msghandle = 'STDOUT';
    } else {
	$msghandle = &file_create($filepathname, $GzipFiles);
    }

    ## Output HTML header
    if ($adding) {
	while ($_ = shift(@$msginfh)) {
	    last if /<!--X-Body-Begin/;
	}
    }
    if (!$nocustom) {
	#&defineIndex2MsgId();

	# Output comments -- more informative, but can be used for
	#		     error recovering.
	push @$msghandle, ( 
	    "<!-- ".commentize("MHonArc v$VERSION")." -->\n",
	    "<!--X-Subject: ".commentize($Subject{$index})." -->\n",
	    "<!--X-From: ".commentize($From{$index})." -->\n",
	    "<!--X-Date: ".commentize($Date{$index})." -->\n",
	    "<!--X-Message-Id: ".commentize($Index2MsgId{$index})." -->\n",
	    "<!--X-Content-Type: ".commentize($ContentType{$index})." -->\n");
		  #ContentType

	if (defined($Refs{$index})) {
	    foreach (split(/$X/o, $Refs{$index})) {
		push @$msghandle,
		    "<!--X-Reference: ".&commentize($_)." -->\n";
			  #Reference-Id
	    }
	}
	if (defined($Derived{$index})) {
	    foreach (split(/$X/o, $Derived{$index})) {
		push @$msghandle,
		    "<!--X-Derived: ".&commentize($_)." -->\n";
	    }
	}
	push @$msghandle, "<!--X-Head-End-->\n";

	# Add in user defined markup
	($template = $MSGPGBEG) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
	push @$msghandle, $template;
    }
    push @$msghandle, "<!--X-Body-Begin-->\n";

    ## Output header
    if ($adding) {
	while ($_ = shift(@$msginfh)) {
	    last  if /<!--X-User-Header-End/ || /<!--X-TopPNI--/;
	}
    }
    push @$msghandle, "<!--X-User-Header-->\n";
    if (!$nocustom) {
	($template = $MSGHEAD) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
	push @$msghandle, $template;
    }
    push @$msghandle, "<!--X-User-Header-End-->\n";

    ## Output Prev/Next/Index links at top
    if ($adding) {
	while ($_ = shift(@$msginfh)) { last  if /<!--X-TopPNI-End/; }
    }
    push @$msghandle, "<!--X-TopPNI-->\n";
    if (!$nocustom && !$SINGLE) {
	($template = $TOPLINKS) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
	push @$msghandle, $template;
    }
    push @$msghandle, "\n<!--X-TopPNI-End-->\n";

    ## Output message data
    if ($adding) {
	$tmp2 = '';
	while ($_ = shift(@$msginfh)) {
	    $tmp2 .= $_;
	    last  if /<!--X-MsgBody-End/;
	}
	$tmp2 =~ s%($AddrExp)%&link_refmsgid($1,1)%geo;
	push @$msghandle, $tmp2;

    } else {
	push @$msghandle, "<!--X-MsgBody-->\n";
	push @$msghandle, "<!--X-Subject-Header-Begin-->\n";
	($template = $SUBJECTHEADER) =~
	    s/$VarExp/&replace_li_var($1,$index)/geo;
	push @$msghandle, $template;
	push @$msghandle, "<!--X-Subject-Header-End-->\n";

	$MsgHead{$index} =~ s%($AddrExp)%&link_refmsgid($1)%geo;
	$Message{$index} =~ s%($AddrExp)%&link_refmsgid($1)%geo;

	push @$msghandle, "<!--X-Head-of-Message-->\n";
	push @$msghandle, $MsgHead{$index};
	push @$msghandle, "<!--X-Head-of-Message-End-->\n";
	push @$msghandle, "<!--X-Head-Body-Sep-Begin-->\n";
	($template = $HEADBODYSEP) =~
	    s/$VarExp/&replace_li_var($1,$index)/geo;
	push @$msghandle, $template;
	push @$msghandle, "<!--X-Head-Body-Sep-End-->\n";
	push @$msghandle, "<!--X-Body-of-Message-->\n";
	push @$msghandle, $Message{$index}."\n";
	push @$msghandle, "<!--X-Body-of-Message-End-->\n";
	push @$msghandle, "<!--X-MsgBody-End-->\n";
    }

    ## Output any followup messages
    if ($adding) {
	while ($_ = shift(@$msginfh)) { last  if /<!--X-Follow-Ups-End/; }
    }
    push @$msghandle, "<!--X-Follow-Ups-->\n";
    ($template = $MSGBODYEND) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
    push @$msghandle, $template;
    if (!$nocustom && $DoFolRefs && defined($Follow{$index})) {
	@array2 = split(/$bs/o, $Follow{$index});
	if ($#array2 >= 0) {
	    ($template = $FOLUPBEGIN) =~
		s/$VarExp/&replace_li_var($1,$index)/geo;
	    push @$msghandle, $template;
	    foreach (@array2) {
		($template = $FOLUPLITXT) =~
		    s/$VarExp/&replace_li_var($1,$_)/geo;
		push @$msghandle, $template;
	    }
	    ($template = $FOLUPEND) =~
		s/$VarExp/&replace_li_var($1,$index)/geo;
	    push @$msghandle, $template;
	}
    }
    push @$msghandle, "<!--X-Follow-Ups-End-->\n";

    ## Output any references
    if ($adding) {
	while ($_ = shift(@$msginfh)) { last  if /<!--X-References-End/; }
    }
    push @$msghandle, "<!--X-References-->\n";
    if (!$nocustom && $DoFolRefs && defined($Refs{$index})) {
	@array2 = split(/$X/o, $Refs{$index});
	$tmp2 = 0;	# flag for when first ref printed
	if ($#array2 >= 0) {
	    foreach (@array2) {
		next  unless defined($MsgId{$_});
		next  unless defined($IndexNum{$MsgId{$_}});
		if (!$tmp2) {
		    ($template = $REFSBEGIN) =~
			s/$VarExp/&replace_li_var($1,$index)/geo;
		    push @$msghandle, $template;
		    $tmp2 = 1;
		}
		($template = $REFSLITXT) =~
		    s/$VarExp/&replace_li_var($1,$MsgId{$_})/geo;
		push @$msghandle, $template;
	    }

	    if ($tmp2) {
		($template = $REFSEND) =~
		    s/$VarExp/&replace_li_var($1,$index)/geo;
		push @$msghandle, $template;
	    }
	}
    }
    push @$msghandle, "<!--X-References-End-->\n";

    ## Output verbose links to prev/next message in list
    if ($adding) {
	while ($_ = shift(@$msginfh)) { last  if /<!--X-BotPNI-End/; }
    }
    push @$msghandle, "<!--X-BotPNI-->\n";
    if (!$nocustom && !$SINGLE) {
	($template = $BOTLINKS) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
	push @$msghandle, $template;
    }
    push @$msghandle, ("\n", "<!--X-BotPNI-End-->\n");

    ## Output footer
    if ($adding) {
	while ($_ = shift(@$msginfh)) {
	    last  if /<!--X-User-Footer-End/;
	}
    }
    push @$msghandle, "<!--X-User-Footer-->\n";
    if (!$nocustom) {
	($template = $MSGFOOT) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
	push @$msghandle, $template;
    }
    push @$msghandle, "<!--X-User-Footer-End-->\n";

    if (!$nocustom) {
	($template = $MSGPGEND) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
	push @$msghandle, $template;
    }

#    close($msghandle)  if (!$SINGLE);
    if ($adding) {
	#close($msginfh);
	&file_remove($tmppathname);
    }

    ## Create user defined files
    foreach (keys %UDerivedFile) {
	($tmp = $_) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
	$tmp2 = join($DIRSEP, $OUTDIR, $tmp);
	if ($drvfh = &file_create($tmp2, $GzipFiles)) {
	    ($template = $UDerivedFile{$_}) =~
		s/$VarExp/&replace_li_var($1,$index)/geo;
	    push @$drvfh, $template;
	    # close($drvfh);
	    if ($Derived{$index}) {
		$Derived{$index} .= $X . $tmp;
	    } else {
		$Derived{$index} = $tmp;
	    }
	} else {
	    warn "Warning: Unable to create $tmp2\n";
	}
    }
    if (defined($Derived{$index}) &&
	    (@array2 = split(/$X/o, $Derived{$index}))) {
	&remove_dups(*array2);
	$Derived{$index} = join($X, @array2);
    }

    ## Set modification times -- Use eval incase OS does not support utime.
    if ($MODTIME && !$SINGLE) {
	eval {
	    $tmp = &get_time_from_index($index);
	    @array2 = split(/$X/o, $Derived{$index});
	    grep($_ = $OUTDIR . $DIRSEP . $_, @array2);
	    unshift(@array2, $filepathname);
	    &file_utime($tmp, $tmp, @array2);
	};
    }

    ($i_p0, $filename);
}

#############################################################################
## Miscellaneous routines
#############################################################################

##---------------------------------------------------------------------------
##	delmsg delets a message from the archive.
##
sub delmsg {
    local($key) = @_;
    local($filename);
    local($pathname);

    #&defineIndex2MsgId();
    $msgnum = $IndexNum{$key};  return 0  if ($msgnum eq '');
    $filename = join($DIRSEP, $OUTDIR, &msgnum_filename($msgnum));
    delete $ContentType{$key};
    delete $Date{$key};
    delete $From{$key};
    delete $IndexNum{$key};
    delete $Refs{$key};
    delete $Subject{$key};
    delete $MsgId{$Index2MsgId{$key}};
    &file_remove($filename);
    foreach $filename (split(/$X/o, $Derived{$key})) {
	$pathname = (&OSis_absolute_path($filename)) ?
			$filename :
			join($DIRSEP, $OUTDIR, $filename);
	    &file_remove($pathname);
    }
    delete $Derived{$key};
    $NumOfMsgs--;
    1;
}

##---------------------------------------------------------------------------
##	Routine to convert a msgid to an anchor
##
sub link_refmsgid {
    local($refmsgid, $onlynew) = @_;

    if (defined($MsgId{$refmsgid}) &&
	defined($IndexNum{$MsgId{$refmsgid}}) &&
	(!$onlynew || $NewMsgId{$refmsgid})) {
	local($lreftmpl) = $MSGIDLINK;
	$lreftmpl =~ s/$VarExp/&replace_li_var($1,$MsgId{$refmsgid})/geo;
	$lreftmpl;
    } else {
	$refmsgid;
    }
}

##---------------------------------------------------------------------------
##	Retrieve next available message number.  Should only be used
##	when an archive is locked.
##
sub getNewMsgNum {
    $NumOfMsgs++; $LastMsgNum++;
    $LastMsgNum;
}

##---------------------------------------------------------------------------
##	ign_signals() sets mhonarc to ignore termination signals.  This
##	routine is called right before an archive is written/editted to
##	help prevent archive corruption.
##
sub ign_signals {
    $SIG{'ABRT'} = 'IGNORE';
    $SIG{'HUP'}  = 'IGNORE';
    $SIG{'INT'}  = 'IGNORE';
    $SIG{'PIPE'} = 'IGNORE';
    $SIG{'QUIT'} = 'IGNORE';
    $SIG{'TERM'} = 'IGNORE';
    $SIG{'USR1'} = 'IGNORE';
    $SIG{'USR2'} = 'IGNORE';
}

##---------------------------------------------------------------------------
##	set_handler() sets up the quit() routine to be called when
##	a termination signal is sent to mhonarc.
##
sub set_handler {
    $SIG{'ABRT'} = \&mhonarc::quit;
    $SIG{'HUP'}  = \&mhonarc::quit;
    $SIG{'INT'}  = \&mhonarc::quit;
    $SIG{'PIPE'} = \&mhonarc::quit;
    $SIG{'QUIT'} = \&mhonarc::quit;
    $SIG{'TERM'} = \&mhonarc::quit;
    $SIG{'USR1'} = \&mhonarc::quit;
    $SIG{'USR2'} = \&mhonarc::quit;
}

##---------------------------------------------------------------------------
##	Quit execution
##
sub quit {
    close_archive();
    exit 0;
}

##---------------------------------------------------------------------------
##	Create Index2MsgId if not defined
##
sub defineIndex2MsgId {
    if (!defined(%Index2MsgId)) {
	foreach (keys %MsgId) {
	    $Index2MsgId{$MsgId{$_}} = $_;
	}
    }
}

##---------------------------------------------------------------------------
1;
