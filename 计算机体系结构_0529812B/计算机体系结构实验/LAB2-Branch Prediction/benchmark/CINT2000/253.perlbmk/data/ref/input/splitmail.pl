#!/usr/bin/perl 

#
# $Log: splitmail.pl,v $
# Revision 1.1  1999/04/09 10:07:39  channui
# kit68
#
# Revision 1.2  1999/02/16 07:31:28  cloyce
# MHonArc diffs, output shortening
#
# Revision 1.1  1999/02/15 23:10:46  cloyce
# Initial revision
#
# Revision 1.2  1998/11/09 23:27:40  cloyce
# *** empty log message ***
#
# Revision 1.1  1998/11/09 20:53:42  cloyce
# Initial revision
#
# Revision 1.3  1998/09/04 21:34:06  cloyce
# - Messages are now generated and hashed on-the-fly.  This saves about 50%
#   memory that would've just been dead space (direct generation of mbox array
#   vs. generate mbox string -> make mbox array).
# - Added duplicate checking.  This is an analog of another script I used for
#   the migration, but integrated this time.
# - Nice long runtime
#
# Revision 1.2  1998/09/01 22:06:42  cloyce
# Seems to work.
#
# Revision 1.1  1998/09/01 21:12:56  cloyce
# Initial revision
#
#

use Date::Format;
use Date::Parse;
use Mail::Header;
use Mail::Util;
use MD5;
$^H |= 1;	# use integer!
require 'mhamain.pl';

$| = 1;
# Debug levels.  Setting any level will cause validation to fail (duh)
# 1   -- general stuff
# 2   -- dump generated messages as they're processed
# 4   -- choose_header debugging
# 8   -- get_msg_line debugging
# 16  -- message checking heartbeat
# 32  -- show MD5 sums as they're generated
# 64  -- show numbers of body lines
# 128 -- output HTML messages
$debug = 0;

srand(1018987167);

# Get %headers, @headerlist, $words
require 'mailcomp.pm';

# These are globalish because they need to persist across calls to
# get_msg_line, and in some cases it would be stupid and time-consuming
# to calculate them over and over again.
my @header_order = qw(X-Yow Subject Date To From Message-Id); # Reverse order
my $horderre = '('.join('|', @header_order).')';
my @headerlist = grep { !/$horderre/o } keys %headers;
my $numlines = @lines+0;
my %num_hdrs = map { $_ => @{$headers{$_}}+0 } keys %headers;
my $msg_state = 0;		# 0 -- Start of message 'From_'
				# 1 -- Doing 'Received:' headers
				# 2 -- Other header generation
				# 3 -- Body generation
my ($num_received_hdrs, $num_hdr_lines, $num_body_lines) = (0,0,0);
my ($cur_msg_lines, %cur_seen_hdrs) = (0, ());
my @mhonarc_rcfile = read_mhonarc_rcfile();

# Get the command line parameters
my ($num_msgs,			# Number of messages to generate
    $header_min,		# Minimum number of headers (lines)
    $header_max,		# Maximum number of headers (lines)
    $lines_min,			# Minimum # lines in message
    $lines_max			# Maximum # lines in message
    ) = (@ARGV);

%openf = ();
%md5s = ();

# All of the message generation happens here, under the covers.
# Generate MD5s at the same time...
my $msgnum = $num_msgs;
foreach $msgref (read_random_mbox()) {
	my $md5 = MD5->hexhash(join('', @{$msgref}));
	print "$msgnum: $md5\n";
    $msgs{$md5} = $msgref;
	$msgnum--;
}

my $t = 0;
my $last_time = 0;
$num_msgs = (keys %msgs)+0;
print "\nsplitmail $num_msgs $header_min $header_max $lines_min $lines_max\n";

if ($debug & 32) {
    print "MD5s and references:\n";
    foreach (reverse sort keys %msgs) {
	print "$_: $msgs{$_}\n";
    }
}
print "Processing and locating duplicates:\n" if ($debug & 1);
foreach my $md5 (reverse sort keys %msgs) {
    print '.' if ($debug & 16);
    my $msgref = $msgs{$md5};
    print "$md5: $msgref\n" if ($debug & 32);
    if ($debug & 2) {
#	print Data::Dumper->Dump([$md5, $msgref], [qw(md5 msgref)]),"\n";
	print "$md5:\n";
	print ' '.join(' ', @{$msgref}),"\n";
    }
    my $m = new Mail::Header $msgref;
    undef %t;
    map { $t{$_} = 1 } $m->tags();
    if (exists $t{"Date"} || exists $t{'X-Info'}) {
        $last_time = $t;
        # Prefer a time in an X-Info: header (thanks, Alex!)
        my $xinfo = $m->get('X-Info');
        $xinfo =~ /Accepted by \S+ distribution list at (.*)/o;
        my ($xdate, $date, $now, $early) = ($1, $m->get('Date'), 1018987167, '1 Jan 1990');
        $xdate = str2time($xdate) if ($xdate ne '');
        $date = str2time($date);
        $early = str2time($early);
#        if (($xdate <= $now) && ($xdate > $early)) {
        if ($xdate > $early) {
            $t = $xdate;
#        } elsif (($date <= $now) && ($date > $early)) {
        } elsif ($date > $early) {
	    $t = $date;
        } else {
	    print "Bad X-Info and Date dates!  Going with ",time2str("%Y%m", $last_time),"\n\$xdate = $xdate \$date = $date \$early = $early \$now = $now \$last_time = $last_time\n";
            $t = $last_time;
        }
        $d = time2str("%Y%m", $t);
    } else {
        $d = 'NODATE';
	print "No date; filing in NODATE.arc\n";
    }
    $msgs_seen{$md5}++;
    for ($body1 = 0; $msgs{$md5}->[$body1] !~ /^$/o; $body1++) {};
    $body1++;		# Index of first body line
    my $numbody1 = @{$msgs{$md5}}+0;
    my $same = 0;
    foreach my $md5_2 (grep { !exists $msgs_seen{$_} } sort keys %msgs) {
	next if ($md5_2 eq '');
	for ($body2 = 0; $msgs{$md5_2}->[$body2] !~ /^$/o; $body2++) {};
	$body2++;		# Index of first body line
	my $numbody2 = @{$msgs{$md5_2}}+0;
	$same = 0;
	while (($body1 <= $numbody1) && ($body2 <= $numbody2) &&
               ($msgs{$md5}->[$body1] eq $msgs{$md5_2}->[$body2])) {
		$body1++;	
		$body2++;
	}
	$same = 0 if (($body1 > $numbody1) || ($body2 > $numbody2));
	print "$md5<->$md5_2: same\n" if $same;
    }
    if (!$same) {
	push @{$md5s{$d}}, $md5;
	push @{$mboxen{$d}}, @{$msgs{$md5}};
	$openf{$d} = 1;
    }
    delete $msgs{$md5};		# Save some memory
}

%mhonarc::mhonarc_files = ();
foreach (sort keys %openf) {
    print "Message hashes for $_\n";
    print join("\n", sort { lc($a) cmp lc($b) } @{$md5s{$_}}),"\n";
    # Call mhonarc for the lot of them
    # Preload $mhonarc::mhonarc_rcs{$_} with the contents of $mhonarc_rcfile
    @{$mhonarc::mhonarc_files{"$_/mhonarc.rc"}} = @mhonarc_rcfile; # Copy it
    # Make sure it has a mailbox to play with
    $mhonarc::mhonarc_files{"mbox.$_"} = $mboxen{$_}; # Don't copy it
    # mhonarc thinks it's been invoked from the command line, so it of course
    # wants to grub around with @ARGV.  That's okay with us... we're done with
    # it at this point.
    @ARGV = ('-definevars',
	     "ARC-DATE=\"$_\" MAIN-TITLE=\"SPEC CPU2000 virtual mailing list\"",
	     '-outdir', $_, '-rcfile', "$_/mhonarc.rc", "mbox.$_");
  mhonarc::initialize();
  mhonarc::process_input();
    # Now get MD5 sums for all of the various MHonArc files
    foreach my $mhonarcfile (sort { lc($a) cmp lc($b) } keys %mhonarc::mhonarc_files) {
	next if ($mhonarcfile =~ /\.mhonarc\.db/io);
	print "$mhonarcfile: ",
	MD5->hexhash(join('', @{$mhonarc::mhonarc_files{$mhonarcfile}})),"\n";
	print join('', @{$mhonarc::mhonarc_files{$mhonarcfile}}),"\n" if ($debug & 128);
    }
    %mhonarc::mhonarc_files = (); # Save a little memory
}

print "\n\n" if ($debug & 16);

#
# Following is the message generation state machine.  It's called by
# read_random_mbox() from the SPECified Mail::Utils distribution
#
sub get_msg_line {
    return undef unless ($num_msgs > 0);
    print "get_msg_line: msg_state == $msg_state:" if ($debug & 8);
    if ($msg_state == 0) {	# Start of new message; initialize everything
	$num_hdr_lines = int(rand($header_max - $header_min)) + $header_min;
        $num_hdr_lines = $header_max if ($num_header_lines > $header_max);

	$cur_msg_lines = 1;
	$num_received_hdrs = int(rand($num_hdr_lines - @header_order+0));
        $num_received_hdrs = 0 if ($num_received_hdrs+(@header_order+0) > $header_max);
	$num_msg_lines = int(rand($lines_max - $lines_min)) + $lines_min - $num_hdr_lines;
        $num_msg_lines = $lines_max - $num_hdr_lines if ($num_msg_lines > $lines_max - $num_hdr_lines);
	%cur_hdrs_seen = map { $_ => 0 } ('From_', 'Received', @header_order);
	# Transition to the next state
	$msg_state = 1;
	print "New message #$num_msgs: $num_hdr_lines headers ($num_received_hdrs Received:), $num_msg_lines body lines\n";
	# Each message must have an envelope 'From ', or it's not mbox format!
	print "From_: " if ($debug & 64);
	my $header = choose_header('From_');
	print " $header" if ($debug & 8);
	return $header;
    } elsif ($msg_state == 1) {	# Do received headers
	if ($num_received_hdrs > 0) {
	    $num_received_hdrs--;
	    $num_hdr_lines--;
	    print "Received: " if ($debug & 64);
	    my $header = choose_header('Received');
	    print " $header" if ($debug & 8);
	    return $header;
	} else {
	    $msg_state = 2;
	    print " 'Received:' done.  Transitioning to normal header lines\n" if ($debug & 8);
	    return get_msg_line();
	}
    } elsif ($msg_state == 2) {
	if ($num_hdr_lines > 0) {
	    my $hdrnum = int(rand(@headerlist+0));
	    my $hdr = $headerlist[$hdrnum];
	    if (!defined $header_order[$num_hdr_lines]) { # Choose a random one
		while (exists $cur_hdrs_seen{$hdr}) {
		    $hdrnum = int(rand(@headerlist+0));
		    $hdr = $headerlist[$hdrnum];
		}
	    } else {
		$hdr = $header_order[$num_hdr_lines];
	    }
	    $num_hdr_lines--;
	    print "$hdr: " if ($debug & 64);
	    my $header = choose_header($hdr);
	    print " $header" if ($debug & 8);
	    return $header;
	} else {
	    print "Body begins:\n" if ($debug & 64);
	    print " Headers done.  Transitioning to message body\n" if ($debug & 8);
	    $msg_state = 3;
	    return "\n";	# End of headers
	}
    } elsif ($msg_state == 3) {
	if ($num_msg_lines > 0) {
	    $num_msg_lines--;
	    my $linenum = int(rand($numlines));
	    print "$linenum\n" if ($debug & 64);
	    my $line = $lines[$linenum];
	    print " $linenum of $numlines = \"$line\"\n" if ($debug & 8);
	    return "$line\n";
	} else {
	    print " EOM\n" if ($debug & 8);
	    print "\n" if ($debug & 64);
	    $msg_state = 0;
	    $num_msgs--;
	    return "\n";	# End of message
	}
    }
}

sub choose_header {
    my ($hdr) = @_;
    print "choose_header($hdr): $num_hdrs{$hdr} choices\n" if ($debug & 4);
    my $hdrnum = int(rand($num_hdrs{$hdr}));
    my $header = $headers{$hdr}->[$hdrnum];
    print "  \"$header\"\n" if ($debug & 4);
    while (!defined($header) || $header =~ /^$/o) {
    	$hdrnum = int(rand($num_hdrs{$hdr}));
	$header = $headers{$hdr}->[$hdrnum];
	print "  \"$header\"\n" if ($debug & 4);
    }
    $cur_hdrs_seen{$hdr}++;
    print "$hdrnum\n" if ($debug & 64);
    return "$header\n";
}

sub read_mhonarc_rcfile {
    open(RCIN, "cpu2000_mhonarc.rc") || die "Couldn't open cpu2000_mhonarc.rc\nStopped";
    my @rc = <RCIN>;
    close(RCIN);
    return @rc;
}
