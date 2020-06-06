##---------------------------------------------------------------------------##
##  File:
##	@(#) mhrcfile.pl 2.6 98/10/10 16:29:34
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      Routines for parsing resource files
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
##    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
##    02111-1307, USA
##---------------------------------------------------------------------------##

package mhonarc;

##---------------------------------------------------------------------------
##	read_resource_file() parses the resource file.
##	(The code for this routine could probably be simplified).
##
sub read_resource_file {
    my($file) = shift;
    my($line, $tag, $label, $acro, $hr, $type, $routine, $plfile,
       $url, $arg, $tmp, @a);
    my($elem, $attr, $override, $handle, $pathhead, $chop);
    $override = 0;

    # This could probably be handled more prettily via a Tie, but I don't
    # have time to learn them right now.
    #$handle = &file_open($file);
    $handle = $mhonarc_files{$file};
    die "read_resource_file got a wierd reference (",ref($handle),") trying to open \"$file\".  A list of possible files follows: ".join("\n", keys %mhonarc_files)."\nStopped" if (ref($handle) ne 'ARRAY');

    if ($file =~ m%(.*[$DIRSEPREX])%o) {
	$pathhead = $1;
    } else {
	$pathhead = '';
    }

    print STDOUT "Reading resource file: $file ...\n"  unless $QUIET;
    while (defined($line = shift(@$handle))) {
	next unless $line =~ /^\s*<([^>]+)>/;
	$attr = '';
	($elem, $attr) = split(' ', $1, 2);
	$attr = ''  unless defined($attr);
	$elem =~ tr/A-Z/a-z/;
	$override = ($attr =~ /override/i);
	$chop = ($attr =~ /chop/i);

      FMTSW: {
	if ($elem eq "authorbegin") {		# Begin for author group
	    $AUTHBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "authorend") {		# End for author group
	    $AUTHEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "authsort") {		# Sort msgs by author
	    $AUTHSORT = 1;
	    $NOSORT = 0;  $SUBSORT = 0;
	    last FMTSW;
	}
	if ($elem eq "botlinks") {		# Bottom links in message
	    $BOTLINKS = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "charsetconverters") {	# Charset filters
	    if ($override) {
		%readmail::MIMECharSetConverters = ();
		%readmail::MIMECharSetConvertersSrc = ();
	    }
	    while (defined($line = shift(@$handle))) {
		last  if $line =~ /^\s*<\/charsetconverters\s*>/i;
		next  if $line =~ /^\s*$/;
		$line =~ s/\s//g;
		if ($line =~ /;/) {	# using Perl 5 qualification
		    ($type,$routine,$plfile) = split(/;/,$line,3);
		} else {
		    ($type,$routine,$plfile) = split(/:/,$line,3);
		}
		$type =~ tr/A-Z/a-z/;
		$readmail::MIMECharSetConverters{$type}    = $routine;
		$readmail::MIMECharSetConvertersSrc{$type} = $plfile
		    if defined($plfile) and $plfile =~ /\S/;
	    }
	    last FMTSW;
	}
	if ($elem eq "conlen") {
	    $CONLEN = 1; last FMTSW;
	}
	if ($elem eq "datefields") {
	    @a = &get_list_content($handle, $elem);
	    if (@a) { @DateFields = @a; }
	    last FMTSW;
	}
	if ($elem eq "daybegin") {		# Begin for day group
	    $DAYBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "dayend") {		# End for day group
	    $DAYEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "decodeheads") {
	    $DecodeHeads = 1; last FMTSW;
	}
	if ($elem eq "definederived") {		# Custom derived file
	    %UDerivedFile = ()  if $override;
	    $line = shift(@$handle);
	    last FMTSW if $line =~ /^\s*<\/definederived\s*>/i;
	    $line =~ s/\s//g;
	    $UDerivedFile{$line} = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "definevar") {		# Custom resource variable
	    @CustomRcVars = ()  if $override;
	    $line = shift(@$handle);
	    last FMTSW if $line =~ /^\s*<\/definevar\s*>/i;
	    $line =~ s/\s//g;
	    $CustomRcVars{$line} = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "doc") {			# Link to documentation
	    $NODOC = 0; last FMTSW;
	}
	if ($elem eq "docurl") {		# Doc URL
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$DOCURL = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "dbfile") {		# Database file
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s//g;
		$DBFILE = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "excs") {			# Exclude header fields
	    %HFieldsExc = ()  if $override;
	    while (defined($line = shift(@$handle))) {
		last  if $line =~ /^\s*<\/excs\s*>/i;
		$line =~ s/\s//g;  $line =~ tr/A-Z/a-z/;
		$HFieldsExc{$line} = 1  if $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "expireage") {		# Time in seconds until expire
	    if (($tmp = &get_elem_int($handle, $elem, 1)) ne '') {
		$ExpireTime = $tmp;
	    }
	    last FMTSW;
	}
	if ($elem eq "expiredate") {		# Expiration date
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$ExpireDate = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "fieldstyles") {		# Field text style
	    while (defined($line = shift(@$handle))) {
		last  if $line =~ /^\s*<\/fieldstyles\s*>/i;
		next  if $line =~ /^\s*$/;
		$line =~ s/\s//g;  $line =~ tr/A-Z/a-z/;
		($label, $tag) = split(/:/,$line);
		$HeadFields{$label} = $tag;
	    }
	    last FMTSW;
	}
	if ($elem eq "fieldorder") {		# Field order
	    @FieldOrder = ();  %FieldODefs = ();
	    while (defined($line = shift(@$handle))) {
		last  if $line =~ /^\s*<\/fieldorder\s*>/i;
		next  if $line =~ /^\s*$/;
		$line =~ s/\s//g;  $line =~ tr/A-Z/a-z/;
		push(@FieldOrder, $line);
		$FieldODefs{$line} = 1;
	    }
	    # push(@FieldOrder,'-extra-')  if (!$FieldODefs{'-extra-'});
	    last FMTSW;
	}
	if ($elem eq "fieldsbeg") {		# Begin markup of mail head
	    $FIELDSBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "fieldsend") {		# End markup of mail head
	    $FIELDSEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "fldbeg") {		# Begin markup of field text
	    $FLDBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "fldend") {		# End markup of field text
	    $FLDEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "folrefs") {		# Print explicit fol/refs
	    $DoFolRefs = 1; last FMTSW;
	}
	if ($elem eq "folupbegin") {		# Begin markup for follow-ups
	    $FOLUPBEGIN = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "folupend") {		# End markup for follow-ups
	    $FOLUPEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "foluplitxt") {		# Follow-up link markup
	    $FOLUPLITXT = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "footer") {		# Footer file
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s//g;
		$FOOTER = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "fromfields") {		# Fields to get author
	    @a = &get_list_content($handle, $elem);
	    if (@a) { @FromFields = @a; }
	    last FMTSW;
	}
	if ($elem eq "gmtdatefmt") {		# GMT date format
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$GMTDateFmt = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "gzipexe") {		# Gzip executable
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s+$//g;
		$GzipExe = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "gzipfiles") {
	    $GzipFiles = 1;  last FMTSW;
	}
	if ($elem eq "gziplinks") {
	    $GzipLinks = 1;  last FMTSW;
	}
	if ($elem eq "headbodysep") {
	    $HEADBODYSEP = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "header") {		# Header file
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s//g;
		$HEADER = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "htmlext") {		# Extension for HTML files
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s//g;
		$HtmlExt = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "icons") {			# Icons
	    %Icons = ()  if $override;
	    while (defined($line = shift(@$handle))) {
		last  if $line =~ /^\s*<\/icons\s*>/i;
		next  if $line =~ /^\s*$/;
		$line =~ s/\s//g;
		($type, $url) = split(/:/,$line,2);
		$type =~ tr/A-Z/a-z/;
		$Icons{$type} = $url;
	    }
	    last FMTSW;
	}
	if ($elem eq "idxfname") {		# Index filename
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s//g;
		$IDXNAME = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "idxlabel") {		# Index label
	    $IDXLABEL = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "idxpgbegin") {		# Opening markup of index
	    $IDXPGBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "idxpgend") {		# Closing markup of index
	    $IDXPGEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "idxprefix") {		# Prefix for main idx pages
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s//g;
		$IDXPREFIX = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "idxsize") {		# Size of index
	    if (($tmp = &get_elem_int($handle, $elem, 1)) ne '') {
		$IDXSIZE = $tmp;
	    }
	    last FMTSW;
	}
	if ($elem eq "include") {		# Include other rc files
	    while (defined($line = shift(@$handle))) {
		last  if $line =~ /^\s*<\/include\s*>/i;
		next  if $line =~ /^\s*$/;
		$line =~ s/\s+$//;
		$line = $pathhead . $line  if ($line !~ /$DIRSEPREX/o);
		&read_resource_file($line);
	    }
	    last FMTSW;
	}
	if ($elem eq "labelbeg") {		# Begin markup of label
	    $LABELBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "labelend") {		# End markup of label
	    $LABELEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "labelstyles") {		# Field label style
	    while (defined($line = shift(@$handle))) {
		last  if $line =~ /^\s*<\/labelstyles\s*>/i;
		next  if $line =~ /^\s*$/;
		$line =~ s/\s//g;  $line =~ tr/A-Z/a-z/;
		($label, $tag) = split(/:/,$line);
		$HeadHeads{$label} = $tag;
	    }
	    last FMTSW;
	}
	if ($elem eq "listbegin") {		# List begin
	    $LIBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "listend") {		# List end
	    $LIEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "litemplate") {		# List item template
	    $LITMPL = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "localdatefmt") {		# Local date format
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$LocalDateFmt = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "mailto") {		# Convert e-mail addrs
	    $NOMAILTO = 0; last FMTSW;
	}
	if ($elem eq "mailtourl") {		# mailto URL
	    while (defined($line = shift(@$handle))) {
		last  if $line =~ /^\s*<\/mailtourl\s*>/i;
		next  if $line =~ /^\s*$/;
		$line =~ s/\s//g;
		$MAILTOURL = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "main") {			# Print main index
	    $MAIN = 1; last FMTSW;
	}
	if ($elem eq "maxsize") {		# Size of archive
	    if (($tmp = &get_elem_int($handle, $elem, 1)) ne '') {
		$MAXSIZE = $tmp;
	    }
	    last FMTSW;
	}
	if ($elem eq "msgbodyend") {		# Markup after message body
	    $MSGBODYEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "msgpgs") {		# Output message pages
	    $NoMsgPgs = 0; last FMTSW;
	}
	if ($elem eq "msgprefix") {		# Prefix for message files
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s//g;
		$MsgPrefix = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "mhpattern") {		# File pattern MH-like dirs
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$MHPATTERN = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "mimefilters") {		# Mime filters
	    if ($override) {
		%readmail::MIMEFilters = ();
		%readmail::MIMEFiltersSrc = ();
	    }
	    while (defined($line = shift(@$handle))) {
		last  if $line =~ /^\s*<\/mimefilters\s*>/i;
		next  if $line =~ /^\s*$/;
		$line =~ s/\s//g;
		if ($line =~ /;/) {	# using Perl 5 qualification
		    ($type,$routine,$plfile) = split(/;/,$line,3);
		} else {
		    ($type,$routine,$plfile) = split(/:/,$line,3);
		}
		$type =~ tr/A-Z/a-z/;
		$readmail::MIMEFilters{$type}    = $routine;
		$readmail::MIMEFiltersSrc{$type} = $plfile  if $plfile =~ /\S/;
	    }
	    last FMTSW;
	}
	if ($elem eq "mimeargs") {		# Mime arguments
	    %readmail::MIMEFiltersArgs = ()  if $override;
	    while (defined($line = shift(@$handle))) {
		last  if     $line =~ /^\s*<\/mimeargs\s*>/i;
		next  unless $line =~ /\S/;
		$line =~ s/^\s+//;
		if ($line =~ /;/) {	# using Perl 5 qualification
		    ($type, $arg) = split(/;/,$line,2);
		} else {
		    ($type, $arg) = split(/:/,$line,2);
		}
		$type =~ tr/A-Z/a-z/  if $type =~ m%/%;
		$readmail::MIMEFiltersArgs{$type} = $arg;
	    }
	    last FMTSW;
	}
	if ($elem eq "months") {		# Full month names
	    @a = &get_list_content($handle, $elem);
	    if (scalar(@a)) {
		@Months = @a;
	    }
	    last FMTSW;
	}
	if ($elem eq "monthsabr") {		# Abbreviated month names
	    @a = &get_list_content($handle, $elem);
	    if (scalar(@a)) {
		@months = @a;
	    }
	    last FMTSW;
	}
	if ($elem eq "modtime") {		# Mod time same as msg date
	    $MODTIME = 1; last FMTSW;
	}
	if ($elem eq "msgfoot") {		# Message footer text
	    $MSGFOOT = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "msggmtdatefmt") {		# Message GMT date format
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$MsgGMTDateFmt = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "msghead") {		# Message header text
	    $MSGHEAD = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "msgidlink") {
	    $MSGIDLINK = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "msglocaldatefmt") {	# Message local date format
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$MsgLocalDateFmt = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "msgpgbegin") {		# Opening markup of message
	    $MSGPGBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "msgpgend") {		# Closing markup of message
	    $MSGPGEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "msgsep") {		# Message separator
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$FROM = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "multipg") {		# Print multi-page indexes
	    $MULTIIDX = 1; last FMTSW;
	}
	if ($elem eq "nextbutton") {		# Next button link in message
	    $NEXTBUTTON = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "nextbuttonia") {
	    $NEXTBUTTONIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "nextlink") {		# Next link in message
	    $NEXTLINK = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "nextlinkia") {
	    $NEXTLINKIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "nextpglink") {		# Next page link in index
	    $NEXTPGLINK = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "nextpglinkia") {
	    $NEXTPGLINKIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "news") {			# News for linking
	    $NONEWS = 0; last FMTSW;
	}
	if ($elem eq "noauthsort") {		# Do not sort msgs by author
	    $AUTHSORT = 0;
	    last FMTSW;
	}
	if ($elem eq "noconlen") {		# Ignore content-length
	    $CONLEN = 0; last FMTSW;
	}
	if ($elem eq "nodecodeheads") {		# Don't decode charsets
	    $DecodeHeads = 0; last FMTSW;
	}
	if ($elem eq "nodoc") {			# Do not link to docs
	    $NODOC = 1; last FMTSW;
	}
	if ($elem eq "nofolrefs") {		# Don't print explicit fol/refs
	    $DoFolRefs = 0; last FMTSW;
	}
	if ($elem eq "nogzipfiles") {		# Don't gzip files
	    $GzipFiles = 0;  last FMTSW;
	}
	if ($elem eq "nogziplinks") {		# Don't add ".gz" to links
	    $GzipLinks = 0;  last FMTSW;
	}
	if ($elem eq "nomailto") {		# Do not convert e-mail addrs
	    $NOMAILTO = 1; last FMTSW;
	}
	if ($elem eq "nomain") {		# No main index
	    $MAIN = 0; last FMTSW;
	}
	if ($elem eq "nomodtime") {		# Do not change mod times
	    $MODTIME = 0; last FMTSW;
	}
	if ($elem eq "nomsgpgs") {		# Do not print message pages
	    $NoMsgPgs = 1; last FMTSW;
	}
	if ($elem eq "nomultipg") {		# Single page index
	    $MULTIIDX = 0; last FMTSW;
	}
	if ($elem eq "nonews") {		# Ignore news for linking
	    $NONEWS = 1; last FMTSW;
	}
	if ($elem eq "noreverse") {		# Sort in normal order
	    $REVSORT = 0; last FMTSW;
	}
	if ($elem eq "nosort") {		# Do not sort messages
	    $NOSORT = 1;
	    last FMTSW;
	}
	if ($elem eq "nosubsort") {		# Do not sort msgs by subject
	    $SUBSORT = 0;
	    last FMTSW;
	}
	if ($elem eq "note") {			# Annotation markup
	    $NOTE = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "notedir") {		# Notes directory
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$NoteDir = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "noteia") {		# No Annotation markup
	    $NOTEIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "noteicon") {		# Note icon
	    $NOTEICON = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "noteiconia") {		# Note icon when no annotation
	    $NOTEICONIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "nothread") {		# No thread index
	    $THREAD = 0; last FMTSW;
	}
	if ($elem eq "notreverse") {		# Thread sort in normal order
	    $TREVERSE = 0; last FMTSW;
	}
	if ($elem eq "nourl") {			# Ignore URLs
	    $NOURL = 1; last FMTSW;
	}
	if ($elem eq "nouselocaltime") {	# Not using localtime
	    $UseLocalTime = 0; last FMTSW;
	}
	if ($elem eq "nousinglastpg") {		# Not using $LASTPG$
	    $UsingLASTPG = 0; last FMTSW;
	}
	if ($elem eq "otherindexes") {		# Other indexes
	    @OtherIdxs = ()  if $override;
	    unshift(@OtherIdxs, &get_pathname_content($handle, $elem));
	    last FMTSW;
	}
	if ($elem eq "perlinc") {		# Define perl search paths
	    @PerlINC = ()  if $override;
	    unshift(@PerlINC, &get_pathname_content($handle, $elem));
	    last FMTSW;
	}
	if ($elem eq "prevbutton") {		# Prev button link in message
	    $PREVBUTTON = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "prevbuttonia") {		# Prev i/a button link
	    $PREVBUTTONIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "prevlink") {		# Prev link in message
	    $PREVLINK = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "prevlinkia") {		# Prev i/a link
	    $PREVLINKIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "prevpglink") {		# Prev page link for index
	    $PREVPGLINK = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "prevpglinkia") {
	    $PREVPGLINKIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "refsbegin") {		# Explicit ref links begin
	    $REFSBEGIN = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "refsend") {		# Explicit ref links end
	    $REFSEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "refslitxt") {		# Explicit ref link
	    $REFSLITXT = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "reverse") {		# Reverse sort
	    $REVSORT = 1;
	    last FMTSW;
	}
	if ($elem eq "sort") {			# Sort messages by date
	    $NOSORT = 0;
	    $AUTHSORT = 0;  $SUBSORT = 0;
	    last FMTSW;
	}
	if ($elem eq "subjectarticlerxp") {	# Regex for language articles
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$SubArtRxp = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "subjectreplyrxp") {	# Regex for reply text
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$SubReplyRxp = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "subjectstripcode") {	# Code to strip subjects
	    $SubStripCode = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "subsort") {		# Sort messages by subject
	    $SUBSORT = 1;
	    $AUTHSORT = 0;  $NOSORT = 0;
	    last FMTSW;
	}
	if ($elem eq "subjectbegin") {		# Begin for subject group
	    $SUBJECTBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "subjectend") {		# End for subject group
	    $SUBJECTEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "subjectheader") {
	    $SUBJECTHEADER = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tcontbegin") {		# Thread cont. start
	    $TCONTBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tcontend") {		# Thread cont. end
	    $TCONTEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "thead") {			# Thread idx head
	    $THEAD = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tfoot") {			# Thread idx foot
	    $TFOOT = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tidxfname") {		# Threaded idx filename
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s//g;
		$TIDXNAME = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "tidxlabel") {		# Thread index label
	    $TIDXLABEL = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tidxpgbegin") {		# Opening markup of thread idx
	    $TIDXPGBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tidxpgend") {		# Closing markup of thread idx
	    $TIDXPGEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tidxprefix") {		# Prefix for thread idx pages
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s//g;
		$TIDXPREFIX = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "timezones") {		# Time zones
	    %Zone = ()  if $override;
	    while (defined($line = shift(@$handle))) {
		last  if $line =~ /^\s*<\/timezones\s*>/i;
		$line =~ s/\s//g;  $line =~ tr/a-z/A-Z/;
		($acro,$hr) = split(/:/,$line);
		$acro =~ tr/a-z/A-Z/;
		$Zone{$acro} = $hr;
	    }
	    last FMTSW;
	}
	if ($elem eq "tindentbegin") {		# Thread indent start
	    $TINDENTBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tindentend") {		# Thread indent end
	    $TINDENTEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "title") {			# Title of index page
	    $TITLE = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tlevels") {		# Level of threading
	    if (($tmp = &get_elem_int($handle, $elem, 1)) ne '') {
		$TLEVELS = $tmp;
	    }
	    last FMTSW;
	}
	if ($elem eq "tlinone") {		# Markup for missing message
	    $TLINONE = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tlinoneend") {		# End markup for missing msg
	    $TLINONEEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tlitxt") {		# Thread idx list item
	    $TLITXT = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tliend") {		# Thread idx list item end
	    $TLIEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "toplinks") {		# Top links in message
	    $TOPLINKS = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tnosubsort") {		# No subject order for threads
	    $TSUBSORT = 0;
	    last FMTSW;
	}
	if ($elem eq "tnosort") {		# Raw order for threads
	    $TNOSORT = 1; $TSUBSORT = 0;
	    last FMTSW;
	}
	if ($elem eq "tslice") {
	    ($TSliceNBefore, $TSliceNAfter) =
		&get_list_content($handle, $elem);
	    last FMTSW;
	}
	if ($elem eq "tslicebeg") {		# Start of thread slice
	    $TSLICEBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tsliceend") {		# End of thread slice
	    $TSLICEEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tsort") {			# Date order for threads
	    $TNOSORT = 0; $TSUBSORT = 0;
	    last FMTSW;
	}
	if ($elem eq "tsubsort") {		# Subject order for threads
	    $TNOSORT = 0; $TSUBSORT = 1;
	    last FMTSW;
	}
	if ($elem eq "tsublistbeg") {		# List begin in sub-thread
	    $TSUBLISTBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tsublistend") {		# List end in sub-thread
	    $TSUBLISTEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tsubjectbeg") {		# Begin markup for sub thread
	    $TSUBJECTBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tsubjectend") {		# End markup for sub thread
	    $TSUBJECTEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tsingletxt") {		# Markup for single msg
	    $TSINGLETXT = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "ttopbegin") {		# Begin for top of a thread
	    $TTOPBEG = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "ttopend") {		# End for a thread
	    $TTOPEND = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "ttitle") {		# Title of threaded idx
	    $TTITLE = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "thread") {		# Create thread index
	    $THREAD = 1; last FMTSW;
	}
	if ($elem eq "tnextbutton") {		# Thread Next button link
	    $TNEXTBUTTON = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tnextbuttonia") {
	    $TNEXTBUTTONIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tnextlink") {		# Thread Next link
	    $TNEXTLINK = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tnextlinkia") {
	    $TNEXTLINKIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tnextpglink") {		# Thread next page link
	    $TNEXTPGLINK = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tnextpglinkia") {
	    $TNEXTPGLINKIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tprevbutton") {		# Thread Prev button link
	    $TPREVBUTTON = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tprevbuttonia") {
	    $TPREVBUTTONIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tprevlink") {		# Thread Prev link in message
	    $TPREVLINK = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tprevlinkia") {
	    $TPREVLINKIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tprevpglink") {		# Thread previous page link
	    $TPREVPGLINK = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "tprevpglinkia") {
	    $TPREVPGLINKIA = &get_elem_content($handle, $elem, $chop);
	    last FMTSW;
	}
	if ($elem eq "treverse") {		# Reverse order of threads
	    $TREVERSE = 1; last FMTSW;
	}
	if ($elem eq "umask") {		# Umask of process
	    if ($line = &get_elem_last_line($handle, $elem)) {
		$line =~ s/\s//g;
		$UMASK = $line;
	    }
	    last FMTSW;
	}
	if ($elem eq "uselocaltime") {		# Use localtime for day groups
	    #$UseLocalTime = 1; last FMTSW;
	}
	if ($elem eq "usinglastpg") {
	    $UsingLASTPG = 1; last FMTSW;
	}
	if ($elem eq "weekdays") {		# Full weekday name
	    @a = &get_list_content($handle, $elem);
	    if (scalar(@a)) {
		@Weekdays = @a;
	    }
	    last FMTSW;
	}
	if ($elem eq "weekdaysabr") {		# Abbreviated weekday name
	    @a = &get_list_content($handle, $elem);
	    if (scalar(@a)) {
		@weekdays = @a;
	    }
	    last FMTSW;
	}

      } ## End FMTSW
    $UseLocalTime = 0;
    }
    1;
}

##----------------------------------------------------------------------
sub get_elem_content {
    local($filehandle, $gi, $chop) = @_;
    local($ret) = '';

    while ($_ = shift(@$filehandle)) {
	last  if /^\s*<\/$gi\s*>/i;
	$ret .= $_;
    }
    $ret =~ s/\r?\n?$//  if $chop;
    $ret;
}

##----------------------------------------------------------------------
sub get_elem_int {
    local($filehandle, $gi, $abs) = @_;
    local($ret) = '';

    while ($_ = shift(@$filehandle)) {
	last  if /^\s*<\/$gi\s*>/i;
	next  unless /^\s*[-+]?\d+\s*$/;
	s/[+\s]//g;
	s/-//  if $abs;
	$ret = $_;
    }
    $ret;
}

##----------------------------------------------------------------------
sub get_elem_last_line {
    local($filehandle, $gi) = @_;
    local($ret) = '';

    while ($_ = shift(@$filehandle)) {
	last  if /^\s*<\/$gi\s*>/i;
	next  unless /\S/;
	$ret = $_;
    }
    $ret =~ s/\r?\n?$//;
    $ret;
}

##----------------------------------------------------------------------
sub get_list_content {
    local($filehandle, $gi) = @_;
    local(@items) = ();

    while ($_ = shift(@$filehandle)) {
	last  if /^\s*<\/$gi\s*>/i;
	next  unless /\S/;
	s/\r?\n?$//;
	push(@items, split(/[:;]/, $_));
    }
    @items;
}

##----------------------------------------------------------------------
sub get_pathname_content {
    local($filehandle, $gi) = @_;
    local(@items) = ();

    while ($_ = shift(@$filehandle)) {
	last  if /^\s*<\/$gi\s*>/i;
	next  unless /\S/;
	s/\r?\n?$//;
	push(@items, split(/$PATHSEP/o, $_));
    }
    @items;
}

##---------------------------------------------------------------------------##
1;
