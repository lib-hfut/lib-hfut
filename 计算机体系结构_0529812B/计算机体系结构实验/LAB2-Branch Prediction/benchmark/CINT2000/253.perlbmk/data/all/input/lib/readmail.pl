##---------------------------------------------------------------------------##
##  File:
##	@(#) readmail.pl 2.3 98/10/24 17:17:37
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      Library defining routines to parse MIME e-mail messages.  The
##	library is designed so it may be reused for other e-mail
##	filtering programs.  The default behavior is for mail->html
##	filtering, however, the defaults can be overridden to allow
##	mail->whatever filtering.
##
##	Public Functions:
##	----------------
##	($data) =
##	    &MAILdecode_1522_str($str);
##	($data, @files) =
##	    &MAILread_body($header, $body, $ctypeArg, $encodingArg);
##	($header) =
##	    &MAILread_file_header($handle, *fields, *l2o);
##	($header) =
##	    &MAILread_header(*mesg, *fields, *l2o);
##
##	($disposition, $filename) =
##	    &MAILhead_get_disposition(*fields);
##
##---------------------------------------------------------------------------##
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

package readmail;

##---------------------------------------------------------------------------##
##	Scalar Variables
##

##  Variable storing the mulitple fields separator value for the
##  the read header routines.

$FieldSep	= "\034";

##  Flag if message headers are decoded in the parse header routines:
##  MAILread_header, MAILread_file_header.  This only affects the
##  values of the field hash created.  The original header is still
##  passed as the return value.
##
##  The only 1522 data that will be decoded is data encoded with charsets
##  set to "-decode-" in the %MIMECharSetConverters hash.

$DecodeHeader	= 0;

##---------------------------------------------------------------------------##
##	Variables for folding information related to the functions used
##	for processing MIME data.  Variables are defined in the scope
##	of main.

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  MIMEDecoders is the associative array for storing functions for
##  decoding mime data.
##
##	Keys => content-transfer-encoding (should be in lowercase)
##	Values => function name.
##
##  Function names should be qualified with package identifiers.
##  Functions are called as follows:
##
##	$decoded_data = &function($data);
##
##  The value "as-is" may be used to allow the data to be passed without
##  decoding to the registered filter, but the decoded flag will be
##  set to true.

%MIMEDecoders			= ()
    unless defined(%MIMEDecoders);
%MIMEDecodersSrc		= ()
    unless defined(%MIMEDecodersSrc);

##	Default settings:
$MIMEDecoders{"7bit"}		  = "as-is"
    unless defined($MIMEDecoders{"7bit"});
$MIMEDecoders{"8bit"}		  = "as-is"
    unless defined($MIMEDecoders{"8bit"});
$MIMEDecoders{"binary"}		  = "as-is"
    unless defined($MIMEDecoders{"binary"});
$MIMEDecoders{"base64"}		  = "base64::b64decode"
    unless defined($MIMEDecoders{"base64"});
$MIMEDecoders{"quoted-printable"} = "quoted_printable::qprdecode"
    unless defined($MIMEDecoders{"quoted-printable"});
$MIMEDecoders{"x-uuencode"}	  = "base64::uudecode"
    unless defined($MIMEDecoders{"x-uuencode"});
$MIMEDecoders{"x-uue"}     	  = "base64::uudecode"
    unless defined($MIMEDecoders{"x-uue"});
$MIMEDecoders{"uuencode"}  	  = "base64::uudecode"
    unless defined($MIMEDecoders{"uuencode"});

$MIMEDecodersSrc{"base64"}	  	= "base64.pl"
    unless defined($MIMEDecodersSrc{"base64"});
$MIMEDecodersSrc{"quoted-printable"}	= "qprint.pl"
    unless defined($MIMEDecodersSrc{"quoted-printable"});
$MIMEDecodersSrc{"x-uuencode"}	 	= "base64.pl"
    unless defined($MIMEDecodersSrc{"x-uuencode"});
$MIMEDecodersSrc{"x-uue"}     	 	= "base64.pl"
    unless defined($MIMEDecodersSrc{"x-uue"});
$MIMEDecodersSrc{"uuencode"}  	 	= "base64.pl"
    unless defined($MIMEDecodersSrc{"uuencode"});

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  MIMECharSetConverters is the associative array for storing functions
##  for converting data in a particular charset to a destination format
##  within the MAILdecode_1522_str() routine. Destination format is defined
##  by the function.
##
##	Keys => charset (should be in lowercase)
##	Values => function name.
##
##  Charset values take on a form like "iso-8859-1" or "us-ascii".
##              NOTE: Values need to be in lower-case.
##
##  The key "default" can be assigned to define the default function
##  to call if no explicit charset function is defined.
##
##  The key "plain" can be set to a function for decoded regular text not
##  encoded in 1522 format.
##
##  Function names are name of defined perl function and should be
##  qualified with package identifiers. Functions are called as follows:
##
##	$converted_data = &function($data, $charset);
##
##  A function called "-pass-:function" implies that the data should be
##  passed to the converter "function" but not decoded.
##
##  A function called "-decode-" implies that the data should be
##  decoded, but no converter is to be invoked.
##
##  A function called "-ignore-" implies that the data should
##  not be decoded and converted.  Ie.  For the specified charset,
##  the encoding will stay unprocessed and passed back in the return
##  string.

%MIMECharSetConverters			= ()
    unless defined(%MIMECharSetConverters);
%MIMECharSetConvertersSrc		= ()
    unless defined(%MIMECharSetConvertersSrc);

##	Default settings:
$MIMECharSetConverters{"default"}	= "-ignore-"
    unless defined($MIMECharSetConverters{"default"});

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  MIMEFilters is the associative array for storing functions that
##  process various content-types in the MAILread_body routine.
##
##	Keys => Content-type (should be in lowercase)
##	Values => function name.
##
##  Function names should be qualified with package identifiers.
##  Functions are called as follows:
##
##	$converted_data = &function($header, *parsed_header_assoc_array,
##				    *message_data, $decoded_flag,
##				    $optional_filter_arguments);
##
##  Functions can be registered for base types.  Example:
##
##	$MIMEFilters{"image/*"} = "mypackage'function";
##
##  IMPORTANT: If a function specified is not defined when MAILread_body
##  tries to invoke it, MAILread_body will silently ignore.  Make sure
##  that all functions are defined before invoking MAILread_body.

%MIMEFilters	= ()
    unless defined(%MIMEFilters);
%MIMEFiltersSrc	= ()
    unless defined(%MIMEFiltersSrc);

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  MIMEFiltersArgs is the associative array for storing any optional
##  arguments to functions specified in MIMEFilters (the
##  $optional_filter_arguments from above).
##
##	Keys => Either one of the following: content-type, function name.
##	Values => Argument string (format determined by filter function).
##
##  Arguments listed for a content-type will be used over arguments
##  listed for a function if both are applicable.

%MIMEFiltersArgs	= ()
    unless defined(%MIMEFiltersArgs);

##---------------------------------------------------------------------------
##	Variables holding functions for generating processed output
##	for MAILread_body().  The default functions generate HTML.
##	However, the variables can be set to functions that generate
##	a different type of output.
##
##	$FormatHeaderFunc has no default, and must be defined by
##	the calling program.
##
##  Function that returns a message when failing to process a part of a
##  a multipart message.  The content-type of the message is passed
##  as an argument.

$CantProcessPartFunc		= \&cantProcessPart
    unless(defined($CantProcessPartFunc));

##  Function that returns a message when a part is unrecognized in a
##  multipart/alternative message.  I.e. No part could be processed.
##  No arguments are passed to function.

$UnrecognizedAltPartFunc	= \&unrecognizedAltPart
    unless(defined($UnrecognizedAltPartFunc));

##  Function that returns a string to go before any data generated generating
##  from processing an embedded message (message/rfc822 or message/news).
##  No arguments are passed to function.

$BeginEmbeddedMesgFunc		= \&beginEmbeddedMesg
    unless(defined($BeginEmbeddedMesgFunc));

##  Function that returns a string to go after any data generated generating
##  from processing an embedded message (message/rfc822 or message/news).
##  No arguments are passed to function.

$EndEmbeddedMesgFunc		= \&endEmbeddedMesg
    unless(defined($EndEmbeddedMesgFunc));

##  Function to return a string that is a result of the functions
##  processing of a message header.  The function is called for
##  embedded messages (message/rfc822 and message/news).  The
##  arguments to function are:
##
##   1.	Pointer to associative array representing message header
##	contents with the keys as field labels (in all lower-case)
##	and the values as field values of the labels.
##
##   2. Pointer to associative array mapping lower-case keys of
##	argument 1 to original case.
##
##  Prototype: $return_data = &function(*fields, *lower2orig_fields);

$FormatHeaderFunc		= undef
    unless(defined($FormatHeaderFunc));

###############################################################################
##	Public Routines							     ##
###############################################################################
##---------------------------------------------------------------------------##
##	MAILdecode_1522_str() decodes a string encoded in a format
##	specified by RFC 1522.  The decoded string is the return value.
##	If no MIMECharSetConverters is registered for a charset, then
##	the decoded data is returned "as-is".
##
##	Usage:
##
##	    $ret_data = &MAILdecode_1522_str($str, $justdecode);
##
##	If $justdecode is non-zero, $str will be decoded for only
##	the charsets specified as "-decode-".
##
sub MAILdecode_1522_str {
    local($str) = shift;
    local($justdecode) = shift;
    local($charset,
	  $lcharset,
	  $encoding,
	  $dec,
	  $charcnv,
	  $defcharcnv,
	  $plaincnv,
	  $strtxt,
	  $str_before
	 );
    local($ret) = ('');

    $defcharcnv = '-bogus-';

    # Get default converter
    $defcharcnv = &load_charset('default');

    # Get plain converter
    $plaincnv = &load_charset('plain');
    $plaincnv = $defcharcnv  unless $plaincnv;

    # Decode string
    while ($str =~ /=\?([^?]+)\?(.)\?([^?]*)\?=/) {

	# Grab components
	($charset, $encoding) = ($1, $2);
	$strtxt = $3; $str_before = $`; $str = $';

	# Check encoding method and grab proper decoder
	if ($encoding =~ /b/i) {
	    $dec = &load_decoder('base64');
	} else {
	    $dec = &load_decoder('quoted-printable');
	}

	# Convert before (unencoded) text
	if ($justdecode) {				# ignore if just decode
	    $ret .= $str_before;
	} elsif (defined(&$plaincnv)) {			# decode and convert
	    $ret .= &$plaincnv($str_before,'');
	} elsif (($plaincnv =~ /-pass-:(.*)/) &&	# pass
		 (defined(&${1}))) {
	    $ret .= &${1}($str_before,'');
	} else {					# ignore
	    $ret .= $str_before;
	}

	# Convert encoded text
	($lcharset = $charset) =~ tr/A-Z/a-z/;
	$charcnv = &load_charset($lcharset);
	$charcnv = $defcharcnv  unless $charcnv;

	# Decode only
	if ($charcnv eq "-decode-") {
	    $strtxt =~ s/_/ /g;
	    $ret .= &$dec($strtxt);

	# Ignore if just decoding
	} elsif ($justdecode) {
	    $ret .= "=?$charset?$encoding?$strtxt?=";

	# Decode and convert
	} elsif (defined(&$charcnv)) {
	    $strtxt =~ s/_/ /g;
	    $ret .= &$charcnv(&$dec($strtxt),$lcharset);

	# Do not decode, but convert
	} elsif (($charcnv =~ /-pass-:(.*)/) &&
		 (defined(&${1}))) {
	    $ret .= &${1}($strtxt,$lcharset);

	# Fallback is to ignore
	} else {
	    $ret .= "=?$charset?$encoding?$strtxt?=";
	}
    }

    # Convert left-over unencoded text
    if ($justdecode) {				# ignore if just decode
	$ret .= $str;
    } elsif (defined(&$plaincnv)) {		# decode and convert
	$ret .= &$plaincnv($str,'');
    } elsif (($plaincnv =~ /-pass-:(.*)/) &&	# pass
	     (defined(&${1}))) {
	$ret .= &${1}($str,'');
    } else {					# ignore
	$ret .= $str;
    }

    $ret;
}

##---------------------------------------------------------------------------##
##	MAILread_body() parses a MIME message body.  $header is the
##	header of the message.  $body is the actual message body.
##	$ctypeArg is the value of the Content-Type field and $encodingArg
##	is the value of the Content-Transfer-Encoding field (both
##	should be obtained from $header from the calling routine).  The
##	return value is an array:  The first item is the converted data
##	generated, and the other items are filenames of any derived
##	files.
##
sub MAILread_body {
    local($header, $body, $ctypeArg, $encodingArg) = @_;

    local($part, $parthead, $partcontent, $partencoding);
    local(@parts, %partfields, %partl2o) = ();
    local($tmphead, $decoded);
    my($type, $subtype, $boundary, $ret, $content, $ctype, $pos,
       $encoding, $decodefunc, $args);
    my(@files) = ();
    my(@array) = ();
    $ret = "";

    ## Get type/subtype
    $content = $ctypeArg || 'text/plain';	# Default to text/plain 
						# 	if no content-type
    ($ctype) = $content =~ m%^\s*([\w-\./]+)%;	# Extract content-type
    $ctype =~ tr/A-Z/a-z/;			# Convert to lowercase
    if ($ctype =~ m%/%) {			# Extract base and sub types
	($type,$subtype) = split(/\//, $ctype, 2);
    } elsif ($ctype =~ /text/i) {
	$ctype = 'text/plain';
	$type = 'text';  $subtype = 'plain';
    } else {
	$type = $subtype = '';
    }

    ## Load content-type filter
    $filter = &load_filter($ctype);
    $filter = &load_filter("$type/*")	unless $filter;
    $filter = &load_filter("*/*")	unless $filter;

    ## Check for filter arguments
    $args = $MIMEFiltersArgs{$ctype};
    $args = $MIMEFiltersArgs{"$type/*"} if !defined($args) or $args eq '';
    $args = $MIMEFiltersArgs{$filter}   if !defined($args) or $args eq '';

    ## Check encoding
    if (defined($encodingArg)) {
	$encoding = lc $encodingArg;
	$encoding =~ s/\s//g;
	$decodefunc = &load_decoder($encoding);
    } else {
	$encoding = undef;
	$decodefunc = undef;
    }

    ## A filter is defined for given content-type
    if ($filter && defined(&$filter)) {
	$tmphead	= $header . "\n";

	## Parse message header for filter
	&MAILread_header(*tmphead, *partfields, *partl2o);

	## decode data
	if (defined($decodefunc)) {
	    if (defined(&$decodefunc)) {
		$decoded = &$decodefunc($body);
		@array = &$filter($header, *partfields, *decoded, 1, $args);
	    } else {
		@array = &$filter($header, *partfields, *body,
				  $decodefunc =~ /as-is/i, $args);
	    }
	} else {
	    @array = &$filter($header, *partfields, *body, 0, $args);
	}

	## Setup return variables
	$ret = shift @array;				# Return string
	push(@files, @array);				# Derived files

    ## No filter defined for given content-type
    } else {
	## If multipart, recursively process each part
	if ($type =~ /multipart/i) {
	    local(%Cid) = ();
	    local($isalt) = $subtype =~ /alternative/i;

	    ## Get boundary
	    $boundary = "";
	    if ($content =~ m%boundary\s*=\s*\"([^\"]*)\"%i) {
		$boundary = $1;
	    } else {
		($boundary) = $content =~ m%boundary\s*=\s*(\S+)%i;
	    }

	    ## If boundary defined, split body into parts
	    if ($boundary =~ /\S/) {
		substr($body, 0, 0) = "\n";
		substr($boundary, 0, 0) = "\n--";
		while (($pos = index($body, $boundary, 0)) > -1) {
		    if ($isalt) {
			unshift(@parts, substr($body, 0, $pos));
			$parts[0] =~ s/^\r//;
		    } else {
			push(@parts, substr($body, 0, $pos));
			$parts[$#parts] =~ s/^\r//;
		    }
		    substr($body, 0, $pos+length($boundary)) = "";
		    last  if $body =~ /^--/;
		    $body =~ s/^\r?\n//;
		}
		# Discard front-matter
		if ($isalt) { pop(@parts); } else { shift(@parts); }

	    ## Else treat body as one part
	    } else {
		@parts = ($body);
	    }

	    ## Process parts
	    my(@entity) = ();
	    my($cid, $href);
	    while (defined($part = shift(@parts))) {
		$parthead = &MAILread_header(*part, *partfields, *partl2o);
		$cid = $partfields{'content-id'} || $partfields{'message-id'};
		$cid =~ s/[\s<>]//g;
		$href = {
		    'head'	=> $parthead,
		    'fields'	=> { %partfields },
		    'l2o'	=> { %partl2o },
		    'body'	=> $part,
		    'filtered'	=> 0,
		};
		push(@entity, $href);
		$Cid{$cid} = $href  if defined($cid);
	    }

	    my($entity);
	    foreach $entity (@entity) {
		next  if $entity->{'filtered'};

		$parthead     = $entity->{'head'};
		$part         = $entity->{'body'};
		$partcontent  = $entity->{'fields'}{'content-type'};
		$partencoding =
			$entity->{'fields'}{'content-transfer-encoding'};

		## If content-type not defined for part, then determine
		## content-type based upon multipart subtype.
		if (!$partcontent) {
		    if ($subtype =~ /digest/) {
			$partcontent = 'message/rfc822';
		    } else {
			$partcontent = 'text/plain';
		    }
		}

		## Process part
		@array = &MAILread_body($parthead, $part,
					$partcontent, $partencoding);

		## Only use last filterable part in alternate
		if ($subtype =~ /alternative/) {
		    $ret = shift @array;
		    if ($ret) {
			push(@files, @array);
			last;
		    }
		} else {
		    if (!$array[0]) {
			$array[0] = &$CantProcessPartFunc(
					$entity->{'fields'}{'content-type'});
		    }
		    $ret .= shift @array;
		}
		push(@files, @array);
		$entity->{'filtered'} = 1;
	    }

	    if (!$ret && ($subtype =~ /alternative/)) {
		$ret = &$UnrecognizedAltPartFunc();
	    }

	## Else if message/rfc822 or message/news
	} elsif ($ctype =~ m%message/(rfc822|news)%i) {
	    $parthead = &MAILread_header(*body, *partfields, *partl2o);
	    $partcontent = $partfields{'content-type'};
	    $partencoding = $partfields{'content-transfer-encoding'};

	    $ret = &$BeginEmbeddedMesgFunc();
	    if ($FormatHeaderFunc && defined(&$FormatHeaderFunc)) {
		$ret .= &$FormatHeaderFunc(*partfields, *partl2o);
	    } else {
		warn "WARNING: readmail.pl: No message header formatting ",
		     "function defined\n";
	    }
	    @array = &MAILread_body($parthead, $body,
				     $partcontent, $partencoding);
	    $ret .= shift @array ||
		    &$CantProcessPartFunc($partfields{'content-type'});
	    $ret .= &$EndEmbeddedMesgFunc();

	    push(@files, @array);

	## Else cannot handle type
	} else {
	    $ret = '';
	}
    }
    ($ret, @files);
}

##---------------------------------------------------------------------------##
##	MAILread_header reads (and strips) a mail message header from the
##	variable *mesg.  *mesg is a pointer to the mail message.
##
##	*fields is a pointer to an associative array to put field
##	values indexed by field labels that have been converted to all
##	lowercase.  If a field repeats (eg Received fields), then each
##	value in $fields{$fieldname} will be a $FieldSep separated
##	string representing the multiple values.
##
##	*l2o is an associative array to get the original label text
##	from the lowercase field label keys.
##	
##	The return value is the original (extracted) header text.
##
sub MAILread_header {
    local(*mesg, *fields, *l2o) = @_;
    local($label, $olabel, $value, $tmp, $header);

    $header = '';  %fields = ();  %l2o = ();  $label = '';

    ## Read a line at a time.
    while ($mesg =~ s/^([^\n]*\n)//) {
	$tmp = $1;			# Save off match
	last  if $tmp =~ /^[\r]?$/;	# Done if blank line

	$header .= $tmp;		# Store original text
	$tmp =~ s/[\r\n]//g;		# Delete eol characters

	## Decode text if requested
	$tmp = &MAILdecode_1522_str($tmp,1)  if $DecodeHeader;

	## Check for continuation of a field
	if ($tmp =~ s/^\s//) {
	    $fields{$label} .= $tmp  if $label;
	    next;
	}

	## Separate head from field text
	if ($tmp =~ /^([^:\s]+):\s*([\s\S]*)$/) {
	    ($olabel, $value) = ($1, $2);
	    ($label = $olabel) =~ tr/A-Z/a-z/;
	    $l2o{$label} = $olabel;
	    if ($fields{$label}) {
		$fields{$label} .= $FieldSep . $value;
	    } else {
		$fields{$label} = $value;
	    }
	}
    }
    $header;
}

##---------------------------------------------------------------------------##
##	MAILread_file_header reads (and strips) a mail message header
##	from the filehandle $handle.  The routine behaves in the
##	same manner as MAILread_header;
##	
sub MAILread_file_header {
    local($handle, *fields, *l2o) = @_;
    local($label, $olabel, $value, $tmp, $header);
    local($d) = ($/);

    $/ = "\n";  $label = '';
    $header = '';  %fields = ();  %l2o = ();
    while (($tmp = shift(@$handle)) !~ /^[\r]?$/) {

	## Store original header
	$header .= $tmp;

	## Delete eol characters
	$tmp =~ s/[\r\n]//g;

	## Decode text if requested
	$tmp = &MAILdecode_1522_str($tmp,1)  if $DecodeHeader;

	## Check for continuation of a field
	if ($tmp =~ s/^\s//) {
	    $fields{$label} .= $tmp  if $label;
	    next;
	}

	## Separate head from field text
	if ($tmp =~ /^([^:\s]+):\s*([\s\S]*)$/) {
	    ($olabel, $value) = ($1, $2);
	    ($label = $olabel) =~ tr/A-Z/a-z/;
	    $l2o{$label} = $olabel;
	    if ($fields{$label}) {
		$fields{$label} .= $FieldSep . $value;
	    } else {
		$fields{$label} = $value;
	    }
	}
    }
    $/ = $d;
    $header;
}

##---------------------------------------------------------------------------##
##	MAILhead_get_disposition gets the content disposition and
##	filename from *hfields, *hfields is a hash produced by the
##	MAILread_head* routines.
##
sub MAILhead_get_disposition {
    local(*hfields) = shift;
    local($disp, $filename) = ('', '');
    local($_);

    if ($_ = $hfields{'content-disposition'}) {
	($disp)	    = /^\s*(\S+)/;
	$disp	    =~ s/;//g;		# Remove semi-colon if grabbed
	if (/filename=\"([^\"]+)\"/i) {
	    $filename = $1;
	} elsif (/filename=(\S+)/i) {
	    ($filename = $1) =~ s/;\s*$//g;
	}
    }
    if (!$filename) {
	$_ = $hfields{'content-type'};
	if (/name=\"([^\"]+)\"/i) {
	    $filename = $1;
	} elsif (/name=(\S+)/i) {
	    ($filename = $1) =~ s/;\s*$//g;
	}
    }
    $filename =~ s%.*[/\\:]%%;	# Remove any path component
    $filename =~ s/^\s+//;	# Remove leading whitespace
    $filename =~ s/\s+$//;	# Remove trailing whitespace
    ($disp, $filename);
}

###############################################################################
##	Private Routines
###############################################################################

##---------------------------------------------------------------------------##
##	Default function for unable to process a part of a multipart
##	message.
##
sub cantProcessPart {
    local($ctype) = $_[0];

    warn "Warning: Could not process part with given Content-Type: ",
	 "$ctype\n";
    "<BR><TT>&lt;&lt;&lt; $ctype: Unrecognized &gt;&gt;&gt;</TT><BR>\n";
}
##---------------------------------------------------------------------------##
##	Default function for unrecognizeable part in multipart/alternative.
##
sub unrecognizedAltPart {
    warn "Warning: No recognizable part in multipart/alternative\n";
    "<BR><TT>&lt;&lt;&lt; multipart/alternative: ".
    "No recognizable part &gt;&gt;&gt;</TT><BR>\n";
}
##---------------------------------------------------------------------------##
##	Default function for beggining of embedded message
##	(ie message/rfc822 or message/news).
##
sub beginEmbeddedMesg {
    qq|<BLOCKQUOTE><BR><HR ALIGN="LEFT" WIDTH="80%">\n|;
}
##---------------------------------------------------------------------------##
##	Default function for end of embedded message
##	(ie message/rfc822 or message/news).
##
sub endEmbeddedMesg {
    qq|<HR ALIGN="LEFT" WIDTH="80%"></BLOCKQUOTE><BR>\n|;
	    
}

##---------------------------------------------------------------------------##

sub load_charset {
    require $MIMECharSetConvertersSrc{$_[0]}
	if defined($MIMECharSetConvertersSrc{$_[0]}) &&
	   $MIMECharSetConvertersSrc{$_[0]};
    $MIMECharSetConverters{$_[0]};
}
sub load_decoder {
    my $enc = lc shift; $enc =~ s/\s//;
    require $MIMEDecodersSrc{$enc}
	if defined($MIMEDecodersSrc{$enc}) &&
	   $MIMEDecodersSrc{$enc};
    $MIMEDecoders{$enc};
}
sub load_filter {
    require $MIMEFiltersSrc{$_[0]}
	if defined($MIMEFiltersSrc{$_[0]}) &&
	   $MIMEFiltersSrc{$_[0]};
    $MIMEFilters{$_[0]};
}

##---------------------------------------------------------------------------##
1; # for require
