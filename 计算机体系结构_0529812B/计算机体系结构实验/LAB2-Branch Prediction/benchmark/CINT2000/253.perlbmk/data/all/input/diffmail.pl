#!/usr/bin/perl 

#
# $Log: diffmail.pl,v $
# Revision 1.1  1999/04/23 05:15:39  channui
# kit71
#
# Revision 1.1  1999/04/16 09:12:02  channui
# kit70
#
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
use Mail::Util;
use MD5;
require 'specdiff.pm';
require 'compare.pm';
$^H |= 1;	# use integer!

$| = 1;
# Debug levels.  Setting any level will cause validation to fail (duh)
# 1   -- general stuff
# 2   -- dump generated messages as they're processed
# 4   -- choose_header debugging
# 8   -- get_msg_line debugging
# 16  -- message checking heartbeat
# 32  -- 
# 64  -- show numbers of body lines
# 128 -- output the contents of all files (could be long!)
$debug = 0;

srand(1018987167);      # This number is important

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
@specdiff_opts = qw(--lines 0 --quiet --calctol -m --cw);

# Get the command line parameters
my ($mboxes,                    # Number of mailboxes to generate
    $num_msgs,			# Number of messages/mailbox to generate
    $header_min,		# Minimum number of headers (lines)
    $header_max,		# Maximum number of headers (lines)
    $lines_min,			# Minimum # lines in message
    $lines_max			# Maximum # lines in message
    ) = (@ARGV);

%openf = ();
@msgs = ();

# Make $mboxes mboxes to run specdiff over
# All of the message generation happens here, under the covers.
my $msgnum = $num_msgs;
for (my $i = 0; $i < $mboxes; $i++) {
  $::sd_files{"mbox$i"} = join('', read_random_mbox_msgs());
  push @msgs, \$::sd_files{"mbox$i"};
  $num_msgs = $msgnum;
}

my $t = 0;
my $last_time = 0;
$msgnum = 0;

print "\ndiffmail $mboxes $num_msgs $header_min $header_max $lines_min $lines_max\n";

print "diffing...\n" if ($debug & 1);

# Iterate over all the combinations of all the mailboxes
for (my $i = 0; $i < $mboxes; $i++) {
  for (my $j = $i; $j < $mboxes; $j++) {
    my @fnames = ( sprintf("one%03d", $msgnum) );
    $msgnum++;
    push @fnames, sprintf("two%03d", $msgnum);
    $msgnum++;
    print "($i, $j): ";
    $::sd_files{$fnames[0]} = $msgs[$i];
    $::sd_files{$fnames[1]} = $msgs[$j];
    my @opts = (@specdiff_opts, @fnames);
    print "spec_diff(",join(', ', @opts),")\n";
    SPECdiff::specdiff_main(@opts);
    map { delete $::sd_files{$_} } @fnames;
  }
}

foreach (sort keys %::sd_files) {
    print "$_: ", MD5->hexhash($::sd_files{$_}),"\n";
    print $::sd_files{$_},"\n" if ($debug & 128);
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
