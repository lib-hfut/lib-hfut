##---------------------------------------------------------------------------##
##  File:
##	@(#) mhtxtplain.pl 2.3 98/10/24 17:16:20
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##	Library defines routine to filter text/plain body parts to HTML
##	for MHonArc.
##	Filter routine can be registered with the following:
##              <MIMEFILTERS>
##              text/plain:m2h_text_plain'filter:mhtxtplain.pl
##              </MIMEFILTERS>
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

package m2h_text_plain;

$Url    	= '(http://|https://|ftp://|afs://|wais://|telnet://|ldap://' .
		   '|gopher://|news:|nntp:|mid:|cid:|mailto:|prospero:)';
$UrlExp 	= $Url . q%[^\s\(\)\|<>\"\']*[^\.?!;,\"\'\|\[\]\(\)\s<>]%;
$HUrlExp	= $Url . q%[^\s\(\)\|<>\"\'\&]*[^\.?!;,\"\'\|\[\]\(\)\s<>\&]%;
$QuoteChars	= '[>\|\]+:]';
$HQuoteChars	= '&gt;|[\|\]+:]';

##---------------------------------------------------------------------------##
##	Text/plain filter for mhonarc.  The following filter arguments
##	are recognized ($args):
##
##	    asis=set1:set2:...	-- Colon separated lists of charsets
##				   to leave as-is.  Only HTML special
##				   characters will be converted into
##				   entities.
##	    default=set 	-- Default charset to use if not set.
##	    keepspace		-- Preserve whitespace if nonfixed
##	    nourl		-- Do hyperlink URLs
##	    nonfixed		-- Use normal typeface
##	    maxwidth=#		-- Set the maximum width of lines.  Lines
##				   exceeding the maxwidth will be broken
##				   up across multiple lines.
##	    quote		-- Italicize quoted message text
##	    target=name  	-- Set TARGET attribute for links if
##				   converting URLs to links.  Defaults to
##				   _top.
##
##	All arguments should be separated by at least one space
##
sub filter {
    local($header, *fields, *data, $isdecode, $args) = @_;
    my($charset, $nourl, $doquote, $igncharset, $nonfixed,
       $keepspace, $maxwidth, $target, $defset);
    my(%asis) = ();
    local($_);

    ## Parse arguments
    $args	= ""  unless defined($args);
    $nourl	= ($mhonarc::NOURL || ($args =~ /\bnourl\b/i));
    $doquote	= ($args =~ /\bquote\b/i);
    $nonfixed	= ($args =~ /\bnonfixed\b/i);
    $keepspace	= ($args =~ /\bkeepspace\b/i);
    if ($args =~ /\bmaxwidth=(\d+)/i) { $maxwidth = $1; }
	else { $maxwidth = 0; }
    if ($args =~ /\bdefault=(\S+)/i) { $defset = $1; }
	else { $defset = 'us-ascii'; }
    $target = "";
    if ($args =~ /\btarget=\"([^\"]+)\"/i) { $target = $1; }
	elsif ($args =~ /\btarget=(\S+)/i) { $target = $1; }
    $target =~ s/[\'\"]//g;
    if ($target) {
	$target = qq/TARGET="$target"/;
    }
    $defset =~ s/[\'\"]//g;

    ## Grab charset parameter (if defined)
    if (defined($fields{'content-type'}) and
	    $fields{'content-type'} =~ /\bcharset=(\S+)/i) {
	$charset = lc $1;
    } else {
	$charset = lc $defset;
    }
    $charset =~ s/[\'\";]//g;

    ## Check if certain charsets should be left alone
    if ($args =~ /\sasis=(\S+)/i) {
	my(@a) = split(':', $1);
	local($_);
	foreach (@a) {
	    s/[\"\']//g;  tr/A-Z/a-z/;
	    $asis{$_} = 1;
	}
    }

    ## Check MIMECharSetConverters if charset should be left alone
    if (defined($readmail::MIMECharSetConverters{$charset}) and
	    $readmail::MIMECharSetConverters{$charset} eq "-decode-") {
	$asis{$charset} = 1;
    }

    ## Check if max-width set
    if ($maxwidth) {
	$data =~ s/^(.*)$/&break_line($1, $maxwidth)/gem;
    }

    ## Convert data according to charset
    if (!$asis{$charset}) {
	##	Japanese message
	if ($charset =~ /iso-2022-jp/i) {
	    return (&jp2022(*data));

	##	Latin 2-6, Greek, Hebrew, Arabic
	} elsif ($charset =~ /iso-8859-([2-9]|10)/i) {
	    require "iso8859.pl";
	    $data = &iso_8859::str2sgml($data, $charset);

	##	ASCII, Latin 1, Other
	} else {
	    &esc_chars_inplace(*data);
	}
    } else {
	&esc_chars_inplace(*data);
    }

    ##	Check for quoting
    if ($doquote) {
	$data =~ s@^( ?${HQuoteChars})(.*)$@$1<I>$2</I>@gom;
    }

    ## Check if using nonfixed font
    if ($nonfixed) {
	$data =~ s/(\r?\n)/<br>$1/g;
	if ($keepspace) {
	    $data =~ s/^(.*)$/&preserve_space($1)/gem;
	}
    } else {
    	$data = "<PRE>\n" . $data . "</PRE>\n";
    }

    ## Convert URLs to hyperlinks
    $data =~ s@($HUrlExp)@<A $target HREF="$1">$1</A>@gio
	unless $nourl;

    ($data);
}

##---------------------------------------------------------------------------##
##	Function to convert ISO-2022-JP data into HTML.  Function is based
##	on the following RFCs:
##
##	RFC-1468 I
##		J. Murai, M. Crispin, E. van der Poel, "Japanese Character
##		Encoding for Internet Messages", 06/04/1993. (Pages=6)
##
##	RFC-1554  I
##		M. Ohta, K. Handa, "ISO-2022-JP-2: Multilingual Extension of  
##		ISO-2022-JP", 12/23/1993. (Pages=6)
##
##  Author of function:
##      NIIBE Yutaka	gniibe@mri.co.jp
##	(adapted for mhtxtplain.pl by Earl Hood <earlhood@usa.net>)
##	(some changes made to remove use of $& and few other optimizations)
##
sub jp2022 {
    local(*body) = shift;
    my(@lines) = split(/\r?\n/,$body);
    my($ret, $ascii_text);
    local($_);

    $ret = "<PRE>\n";
    foreach (@lines) {
	# Process preceding ASCII text
	while(1) {
	    if (s/^([^\033]+)//) {	# ASCII plain text
		$ascii_text = $1;

		# Replace meta characters in ASCII plain text
		$ascii_text =~ s%\&%\&amp;%g;
		$ascii_text =~ s%<%\&lt;%g;
		$ascii_text =~ s%>%\&gt;%g;
		## Convert URLs to hyperlinks
		$ascii_text =~ s%($HUrlExp)%<A HREF="$1">$1</A>%gio
		    unless $mhonarc::NOURL;

		$ret .= $ascii_text;
	    } elsif (s/(\033\.[A-F])//) { # G2 Designate Sequence
		$ret .= $1;
	    } elsif (s/(\033N[ -])//) { # Single Shift Sequence
		$ret .= $1;
	    } else {
		last;
	    }
	}

	# Process Each Segment
	while(1) {
	    if (s/^(\033\([BJ])//) { # Single Byte Segment
		$ret .= $1;
		while(1) {
		    if (s/^([^\033]+)//) {	# ASCII plain text
			$ascii_text = $1;

			# Replace meta characters in ASCII plain text
			$ascii_text =~ s%\&%\&amp;%g;
			$ascii_text =~ s%<%\&lt;%g;
			$ascii_text =~ s%>%\&gt;%g;
			## Convert URLs to hyperlinks
			$ascii_text =~ s%($HUrlExp)%<A HREF="$1">$1</A>%gio
			    unless $mhonarc::NOURL;

			$ret .= $ascii_text;
		    } elsif (s/(\033\.[A-F])//) { # G2 Designate Sequence
			$ret .= $1;
		    } elsif (s/(\033N[ -])//) { # Single Shift Sequence
			$ret .= $1;
		    } else {
			last;
		    }
		}
	    } elsif (s/^(\033\$[\@AB]|\033\$\([CD])//) { # Double Byte Segment
		$ret .= $1;
		while (1) {
		    if (s/^([!-~][!-~]+)//) { # Double Char plain text
			$ret .= $1;
		    } elsif (s/(\033\.[A-F])//) { # G2 Designate Sequence
			$ret .= $1;
		    } elsif (s/(\033N[ -])//) { # Single Shift Sequence
			$ret .= $1;
		    } else {
			last;
		    }
		}
	    } else {
		# Something wrong in text
		$ret .= $_;
		last;
	    }
	}

	$ret .= "\n";
    }

    $ret .= "</PRE>\n";

    ($ret);
}

##---------------------------------------------------------------------------##

sub esc_chars_inplace {
    local(*foo) = shift;
    $foo =~ s@\&@\&amp;@g;
    $foo =~ s@<@\&lt;@g;
    $foo =~ s@>@\&gt;@g;
    1;
}

##---------------------------------------------------------------------------##

sub preserve_space {
    my($str) = shift;

    1 while
    $str =~ s/^([^\t]*)(\t+)/$1 . ' ' x (length($2) * 8 - length($1) % 8)/e;
    $str =~ s/ /\&nbsp;/g;
    $str;
}

##---------------------------------------------------------------------------##

sub break_line {
    my($str) = shift;
    my($width) = shift;
    my($q, $new) = ('', '');
    my($try, $trywidth, $len);

    ## Translate tabs to spaces
    1 while
    $str =~ s/^([^\t]*)(\t+)/$1 . ' ' x (length($2) * 8 - length($1) % 8)/e;

    ## Do nothing if str <= width
    return $str  if length($str) <= $width;

    ## See if str begins with a quote char
    if ($str =~ s/^( ?$QuoteChars)//o) {
	$q = $1;
	--$width;
    }

    ## Create new string by breaking up str
    while ($str ne "") {

	# If $str less than width, break out
	if (length($str) <= $width) {
	    $new .= $q . $str;
	    last;
	}

	# handle case where no-whitespace line larger than width
	if (($str =~ /^(\S+)/) && (($len = length($1)) >= $width)) {
	    $new .= $q . $1;
	    substr($str, 0, $len) = "";
	    next;
	}

	# Break string at whitespace
	$try = '';
	$trywidth = $width;
	$try = substr($str, 0, $trywidth);
	if ($try =~ /(\S+)$/) {
	    $trywidth -= length($1);
	    $new .= $q . substr($str, 0, $trywidth);
	} else {
	    $new .= $q . $try;
	}
	substr($str, 0, $trywidth) = '';

    } continue {
	$new .= "\n"  if $str;
    }
    $new;
}

##---------------------------------------------------------------------------##
1;
