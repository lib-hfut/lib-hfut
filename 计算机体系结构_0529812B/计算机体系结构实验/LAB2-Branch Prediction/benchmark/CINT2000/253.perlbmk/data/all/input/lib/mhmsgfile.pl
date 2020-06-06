##---------------------------------------------------------------------------##
##  File:
##	@(#) mhmsgfile.pl 1.1 98/08/10 23:56:33
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##	MHonArc library for dealing with HTML message files.  Mainly
##	for parsing existing message files inorder to extract archive
##	related data.
##---------------------------------------------------------------------------##
##    MHonArc -- Internet mail-to-HTML converter
##    Copyright (C) 1998	Earl Hood, earlhood@usa.net
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
## Dependent libraries:
##	ewhutil.pl, mhtime.pl
##---------------------------------------------------------------------------##

##---------------------------------------------------------------------------##
##	parse_data_from_msg(): Function to parse the initial comment
##	declarations of a MHonArc message file into a hash.  A refernce
##	to resulting hash is returned.  Keys are the field names, and
##	values are arrays of field values.
##
sub parse_data_from_msg {
    my $fh = shift;	# An open filehandle
    my %field = ();
    my($field, $value);
    local($_);

    while ($_ = shift(@$fh)) {
	last  if /^<!--X-Head-End/;	# All done
	next  unless s/^<!--X-//;	# Skip non-field lines
	chomp;				# Drop EOL
	s/ -->$//;			# Remove comc
	($field, $value) = split(/: /, $_, 2);
	push(@{$field{lc $field}}, uncommentize($value));
    }
    \%field;
}

##---------------------------------------------------------------------------##
##	load_date_from_msg_file(): Function to read db data from a
##	a MHonArc message file directly into db hashes.
##
sub load_data_from_msg_file {
    my $filename = shift;	# Name of file to read
    my $msgnum	 = shift;	# Message number for file
    my $MSGFILE = file_open($filename);

    my $href = parse_data_from_msg($MSGFILE);

    if (!defined($href->{'subject'})) {
	warn qq/Warning: Unable to find Subject for "$filename"\n/;
	return 0;
    }

    my $index = "";
    my $date = $href->{'date'}[0];

    ## Determine date of message
    if (($date =~ /\S/) && (@array = parse_date($date))) {
	$index = get_time_from_date(@array[1..$#array]);
    } else {
	$index = time;
	$date  = &time2str("", $index, 1)  unless $date =~ /\S/;
    }
    $index .= $X . int($msgnum);

    ## Assign data to hashes
    $Date{$index} = $date;
    $Subject{$index} = $href->{'subject'}[0];
    $From{$index} = defined($href->{'from'}) ? $href->{'from'}[0] :
    					       'No author';
    if (defined($href->{'message-id'})) {
	$Index2MsgId{$index} = $href->{'message-id'}[0];
	$MsgId{$href->{'message-id'}[0]} = $index;
	$NewMsgId{$href->{'message-id'}[0]} = $index;
    }

    if (defined($href->{'content-type'})) {
	$ContentType{$index} = $href->{'content-type'}[0];
    } elsif (defined($href->{'contenttype'})) {		# older versions
	$ContentType{$index} = $href->{'contenttype'}[0];
    }

    if (defined($href->{'reference'})) {
	$Refs{$index} = join($X, @{$href->{'reference'}});
    } elsif (defined($href->{'reference-id'})) {	# older versions
	$Refs{$index} = join($X, @{$href->{'reference-id'}});
    }

    if (defined($href->{'derived'})) {
	$Derived{$index} = join($X, @{$href->{'derived'}});
    }

    $IndexNum{$index} = int($msgnum);

    1;
}

##---------------------------------------------------------------------------##
1;
