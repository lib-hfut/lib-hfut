##---------------------------------------------------------------------------##
##  File:
##	@(#) mhexternal.pl 2.5 98/10/24 17:14:01
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##	Library defines a routine for MHonArc to filter content-types
##	that cannot be directly filtered into HTML, but a linked to an
##	external file.
##
##	Filter routine can be registered with the following:
##
##		<MIMEFILTERS>
##		*/*:m2h_external'filter:mhexternal.pl
##		</MIMEFILTERS>
##
##	Where '*/*' represents various content-types.  See code below for
##	all types supported.
##
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

package m2h_external;

##---------------------------------------------------------------------------
##	Filter routine.
##
##	Argument string may contain the following values.  Each value
##	should be separated by a space:
##
##	ext=ext 	Use `ext' as the filename extension.
##
##	iconurl="url"	Use "url" for location of icon to use.
##
##	inline  	Inline image data by default if
##			content-disposition not defined.
##
##	subdir		Place derived files in a subdirectory
##
##      target=name     Set TARGET attribute for anchor link to file.
##			Defaults to not defined.
##
##	type="description"
##			Use "description" as type description of the
##			data.  The double quotes are required.
##
##	useicon		Include an icon as part of the link to the
##			extracted file.  Url for icon is obtained
##			ICONS resource or from the iconurl option.
##
##	usename 	Use (file)name attribute for determining name
##			of derived file.  Use this option with caution
##			since it can lead to filename conflicts and
##			security problems.
##
##	usenameext 	Use (file)name attribute for determining the
##			extension for the derived file.  Use this option
##			with caution since it can lead to security
##			problems.
##
sub filter {
    local($header, *fields, *data, $isdecode, $args) = @_;
    my($ret,
       $filename, $urlfile,
       $name, $nameparm,
       $path,
       $disp,
       $ctype, $type, $ext,
       $iconurl, $icon_mu,
       $inline,
       $target,
       $inext, $intype);
    my($debug) = 0;

    require 'mhmimetypes.pl';

    ## Init variables
    $args	= ''  unless defined($args);
    $name	= '';
    $ctype	= '';
    $inline	=  0;
    $inext	= '';
    $intype	= '';
    $iconurl	= '';
    $icon_mu	= '';
    $target	= '';

    if ($args =~ /debug/i) {
	$debug = 1;
    }

    ## Get content-type
    ($ctype) = $fields{'content-type'} =~ m%^\s*([\w\-\./]+)%;
    $ctype =~ tr/A-Z/a-z/;
    $type = (mhonarc::get_mime_ext($ctype))[1];

    ## Get disposition
    ($disp, $nameparm) = &readmail::MAILhead_get_disposition(*fields);

    if ($debug) {
	&debug("Content-type: $ctype",
	       "Disposition: $disp; filename=$nameparm",
	       "Arg-string: $args");
    }

    ## Check if using name
    if ($args =~ /\busename\b/i) {
	$name = $nameparm;
    } else {
	$name = '';
    }

    ## Check if file goes in a subdirectory
    if ($args =~ /\bsubdir\b/i) {
	$path = join('', $mhonarc::MsgPrefix, $mhonarc::MHAmsgnum, '.dir');
    } else {
	$path = '';
    }

    ## Check if inlining (images only)
    if ($disp) {
	$inline = ($disp =~ /\binline\b/i);
    } else {
	$inline = ($args =~ /\binline\b/i);
    }

    ## Check if extension and type description passed in
    if ($args =~ /\bext=(\S+)/i)      { $inext  = $1;  $inext =~ s/['"]//g; }
    if ($args =~ /\btype="([^"]+)"/i) { $intype = $1; }

    ## Check if utilizing extension from mail header defined filename
    if (($nameparm) &&			 # filename specified, and
	($args =~ /\busenameext\b/i) &&	 # use filename ext option set, and
	($nameparm !~ /^\./) &&		 # filename does not begin w/dot, and
	($nameparm =~ /\.(\w+)/)) {	 # filename has an extention

	$inext = $1;
    }

    ## Check if using icon
    if ($args =~ /\buseicon\b/i) {
	$iconurl = $mhonarc::Icons{$ctype} || $mhonarc::Icons{'unknown'};
	if ($args =~ /\biconurl="([^"]+)"/i) { $iconurl = $1; }
	$icon_mu = qq/<IMG SRC="$iconurl" BORDER=0 ALT=""> /
	    if $iconurl;
    }

    ## Check if target specified
    if ($args =~ /target="([^"]+)"/i) { $target = $1; }
        elsif ($args =~ /target=(\S+)/i) { $target = $1; }
    $target =~ s/['"]//g;
    $target = qq/ TARGET="$target"/  if $target;

    ## Write file
    $filename = mhonarc::write_attachment($ctype, \$data, $path, $name, $inext);
    ($urlfile = $filename) =~ s/([^\w.\-\/])/sprintf("%%%X",unpack("C",$1))/ge;
    if ($debug) {
	&debug("File-written: $filename");
    }

    ## Create HTML markup
    if ($inline && ($ctype =~ /image/i)) {
	$ret  = "<P>" . &htmlize($fields{'content-description'}) . "</P>\n"
	    if ($fields{'content-description'});
	$ret .= qq|<P><A HREF="$urlfile" $target><IMG SRC="$urlfile" | .
		qq|ALT="$type"></A></P>\n|;

    } else {
	$ret  = qq|<P><A HREF="$urlfile" $target>$icon_mu| .
		(&htmlize($fields{'content-description'}) ||
		 $nameparm || $type) .
		qq|</A></P>\n|;
    }
    ($ret, $path || $filename);
}

##---------------------------------------------------------------------------

sub htmlize {
    my $txt = shift;
    return ""  unless defined($txt);

    $txt =~ s/&/\&amp;/g;
    $txt =~ s/>/&gt;/g;
    $txt =~ s/</&lt;/g;
    $txt;
}

##---------------------------------------------------------------------------

sub debug {
    local($_);
    foreach (@_) {
	print STDERR "m2h_external: ", $_;
	print STDERR "\n"  unless /\n$/;
    }
}

##---------------------------------------------------------------------------
1;
