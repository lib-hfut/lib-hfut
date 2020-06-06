##---------------------------------------------------------------------------##
##  File:
##	@(#) mhtxthtml.pl 2.6 98/10/25 13:58:15
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##	Library defines routine to filter text/html body parts
##	for MHonArc.
##	Filter routine can be registered with the following:
##		<MIMEFILTERS>
##		text/html:m2h_text_html'filter:mhtxthtml.pl
##		</MIMEFILTERS>
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
##    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
##---------------------------------------------------------------------------##


package m2h_text_html;

$Url	= '(\w+://|\w+:)';	# Beginning of URL match expression

##---------------------------------------------------------------------------
##	The filter must modify HTML content parts for merging into the
##	final filtered HTML messages.  Modification is needed so the
##	resulting filtered message is valid HTML.
##
sub filter {
    local($header, *fields, *data, $isdecode, $args) = @_;
    local($base, $title, $tmp);
    local(@files) = ();	# !!!Used by resolve_cid
    $base 	= '';
    $title	= '';
    $tmp	= '';

    ## Get/remove title
    if ($data =~ s%<title\s*>([^<]*)</title\s*>%%i) {
        $title = "<ADDRESS>Title: <STRONG>$1</STRONG></ADDRESS>\n";
    }
    ## Get/remove BASE url
    BASEURL: {
	if ($data =~ s|(<base\s[^>]*>)||i) {
	    $tmp = $1;
	    if ($tmp =~ m|href\s*=\s*['"]([^'"]+)['"]|i) {
		$base = $1;
	    } elsif ($tmp =~ m|href\s*=\s*([^\s>]+)|i) {
		$base = $1;
	    }
	    last BASEURL  if ($base =~ /\S/);
	} 
	if ((defined($tmp = $fields{'content-base'}) ||
	     defined($tmp = $fields{'content-location'})) && ($tmp =~ m%/%)) {
	    ($base = $tmp) =~ s/[\'\"\s]//g;
	}
    }
    $base =~ s|(.*/).*|$1|;

    ## Strip out certain elements/tags
    $data =~ s|<!doctype\s[^>]*>||i;
    $data =~ s|</?html[^>]*>||ig;
    $data =~ s|</?body[^>]*>||ig;
    $data =~ s|<head\s*>[\s\S]*</head\s*>||i;

    ## Modify relative urls to absolute using BASE
    if ($base =~ /\S/) {
        $data =~ s/((?:href|src)\s*=\s*['"])([^'"]+)(['"])/
		   join("", $1, &addbase($base,$2), $3)/geix;
    }

    ## Check for CID URLs (multipart/related HTML)
    $data =~ s/((?:href|src)\s*=\s*['"])cid:([^'"]+)(['"])/
	       join("", $1, &resolve_cid($2), $3)/geix;
    $data =~ s/((?:href|src)\s*=\s*)cid:([^\s>]+)/
	       join("", $1, '"', &resolve_cid($2), '"')/geix;

    ($title.$data, @files);
}

##---------------------------------------------------------------------------

sub addbase {
    my($b, $u) = @_;
    my($ret);
    $u =~ s/^\s+//;
    if ($u =~ m%^$Url%o || $u =~ m/^#/) {
	## Absolute URL or scroll link; do nothing
        $ret = $u;
    } else {
	## Relative URL
	if ($u =~ /^\./) {
	    ## "./---" or "../---": Need to remove and adjust base
	    ## accordingly.
	    $b =~ s/\/$//;
	    my @a = split(/\//, $b);
	    my $cnt = 0;
	    while ($u =~ s|^(\.{1,2})/||) { ++$cnt  if length($1) == 2; }
	    splice(@a, -$cnt)  if $cnt > 0;
	    $b = join('/', @a, "");

	} elsif ($u =~ m%^/%) {
	    ## "/---": Just use hostname:port of base.
	    $b =~ s%^(${Url}[^/]*)/.*%$1%o;
	}
        $ret = $b . $u;
    }
    $ret;
}

##---------------------------------------------------------------------------

sub resolve_cid {
    my $cid = shift;
    my $href = $readmail::Cid{$cid};
    if (!defined($href)) { return "cid:$cid"; }

    require 'mhmimetypes.pl';
    my $filename;
    my $decodefunc =
	readmail::load_decoder($href->{'fields'}{'content-transfer-encoding'});
    if (defined($decodefunc) && defined(&$decodefunc)) {
	my $data = &$decodefunc($href->{'body'});
	$filename = mhonarc::write_attachment(
			    $href->{'fields'}{'content-type'}, \$data);
    } else {
	$filename = mhonarc::write_attachment(
			    $href->{'fields'}{'content-type'},
			    \$href->{'body'});
    }
    $href->{'filtered'} = 1;
    push(@files, $filename); # @files defined in filter
    $filename;
}

##---------------------------------------------------------------------------

1;
