##---------------------------------------------------------------------------##
##  File:
##	@(#) mhtxtenrich.pl 2.2 98/08/10 23:50:38
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##	Library defines a routine for MHonArc to filter text/enriched
##	data.
##
##	Filter routine can be registered with the following:
##
##	    <MIMEFILTERS>
##	    text/enriched:m2h_text_enriched'filter:mhtxtenrich.pl
##	    text/richtext:m2h_text_enriched'filter:mhtxtenrich.pl
##	    </MIMEFILTERS>
##
##---------------------------------------------------------------------------##
##    MHonArc -- Internet mail-to-HTML converter
##    Copyright (C) 1997-1998	Earl Hood, earlhood@usa.net
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

package m2h_text_enriched;

##---------------------------------------------------------------------------
##	Filter routine.
##
sub filter {
    local($header, *fields, *data, $isdecode, $args) = @_;
    local($innofill, $chunk, $ret, $charset);
    $ret  = "";
    $args = ""  unless defined($args);
    $charset = "";

    ## Grab charset parameter (if defined)
    $ctype = $fields{'content-type'} || "";
    if ($ctype =~ /charset=(\S+)/) {
	$charset = lc $1;
	$charset =~ s/['"]//g;
    }

    ## Convert specials
    $data =~ s|&|\&amp;|gi;
    $data =~ s|<<|\&lt;|gi;

    ## Translate text/enriched commands
    $innofill = 0;
    foreach $chunk (split(m|(</?nofill>)|i, $data)) {
	if ($chunk =~ m|<nofill>|i) {
	    $ret .= "<PRE>";
	    $innofill = 1;
	    next;
	}
	if ($chunk =~ m|</nofill>|i) {
	    $ret .= "</PRE>";
	    $innofill = 0;
	    next;
	}
	&convert_tags(*chunk);
	if (!$innofill) {
	    $chunk =~ s|(\r?\n\s*)|&nl_seq_to_brs($1)|gie;
	}
	$ret .= $chunk;
    }

    ## Translate 8-bit characters to entity refs based on charset
    ## 		(we already did '<' and '&' characters)
    if ($charset =~ /iso-8859-([2-9]|10)/i) {
	require 'iso8859.pl';
	$ret = &iso_8859'str2sgml($ret, $charset, 1);
    }

    $ret;
}

##---------------------------------------------------------------------------
##	convert_tags translates text/enriched commands to HTML tags.
##
sub convert_tags {
    local(*str) = shift;

    $str =~ s|<(/?)bold>|<$1B>|gi;
    $str =~ s|<(/?)italic>|<$1I>|gi;
    $str =~ s|<(/?)underline>|<$1U>|gi;
    $str =~ s|<(/?)fixed>|<$1TT>|gi;
    $str =~ s|<(/?)smaller>|<$1SMALL>|gi;
    $str =~ s|<(/?)bigger>|<$1BIG>|gi;

    $str =~ s|<fontfamily>\s*<param>([^<]+)</param>|<FONT face="$1">|gi;
    $str =~ s|</fontfamily>|</FONT>|gi;
    $str =~ s|<color>\s*<param>\s*(\S+)\s*</param>|<FONT color="$1">|gi;
    $str =~ s|</color>|</FONT>|gi;
    $str =~ s|<center>|<P align="center">|gi;
    $str =~ s|</center>|</P>|gi;
    $str =~ s|<flushleft>|<P align="left">|gi;
    $str =~ s|</flushleft>|</P>|gi;
    $str =~ s|<flushright>|<P align="right">|gi;
    $str =~ s|</flushright>|</P>|gi;
    $str =~ s|<flushboth>|<P align="both">|gi;	# Not supported in HTML
    $str =~ s|</flushboth>|</P>|gi;
    $str =~ s|<paraindent>\s*<param>([^<]*)</param>|<BLOCKQUOTE>|gi;
    $str =~ s|</paraindent>|</BLOCKQUOTE>|gi;

    $str =~ s|<excerpt>\s*(<param>([^<]*)</param>)?|<BLOCKQUOTE>|gi;
    $str =~ s|</excerpt>|</BLOCKQUOTE>|gi;

    # Not supported commands
    $str =~ s|<lang>\s*<param>([^<]*)</param>||gi;
    $str =~ s|</lang>||gi;
}

##---------------------------------------------------------------------------
##	nl_seq_to_brs returns a "<BR>" string based on the number
##	on eols in a string.
##
sub nl_seq_to_brs {
    local($str) = shift;
    local($n);

    $n = $str =~ tr/\n/\n/;
    --$n;
    if ($n <= 0) {
	return " ";
    } else {
	return "<BR>\n" x $n;
    }
}

##---------------------------------------------------------------------------
##	preserve_space returns a string with all spaces and tabs
##	converted to nbsps.
##
sub preserve_space {
    local($str) = shift;
 
    1 while
    $str =~ s/^([^\t]*)(\t+)/$1 . ' ' x (length($2) * 8 - length($1) % 8)/e;
    $str =~ s/ /\&nbsp;/g;
    $str;
}

##---------------------------------------------------------------------------
1;
