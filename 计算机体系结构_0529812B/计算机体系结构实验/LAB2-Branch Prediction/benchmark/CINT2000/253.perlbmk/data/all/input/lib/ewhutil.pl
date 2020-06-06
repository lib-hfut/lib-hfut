##---------------------------------------------------------------------------##
##  File:
##	@(#) ewhutil.pl 2.2 98/08/10 23:19:14
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      Generic utility routines
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

##---------------------------------------------------------------------------
##	Remove duplicates in an array.
##
sub remove_dups {
    local(*array) = shift;
    return ()  unless scalar(@array);
    my %dup  = ();
    @array = grep(!$dup{$_}++, @array);
}

##---------------------------------------------------------------------------
##	numerically() is used to tell 'sort' to sort by numbers.
##
sub numerically {
    $a <=> $b;
}

##---------------------------------------------------------------------------
##	"Entify" special characters

sub htmlize {			# Older name
    my($txt) = $_[0];
    $txt =~ s/&/\&amp;/g; $txt =~ s/>/&gt;/g; $txt =~ s/</&lt;/g;
    $txt;
}

sub entify {			# Newer name
    my($txt) = $_[0];
    $txt =~ s/&/\&amp;/g; $txt =~ s/>/&gt;/g; $txt =~ s/</&lt;/g;
    $txt;
}

##	commentize entifies certain characters to avoid problems when a
##	string will be included in a comment declaration

sub commentize {
    my($txt) = $_[0];
    $txt =~ s/([\-&])/'&#'.unpack('C',$1).';'/ge;
    $txt;
}

sub uncommentize {
    my($txt) = $_[0];
    $txt =~ s/&#(\d+);/pack("C",$1)/ge;
    $txt;
}

##---------------------------------------------------------------------------
##	Copy a file.
##
sub cp {
    local($src, $dst) = @_;
    return; # We don't mess with actual *files*.
}

##---------------------------------------------------------------------------
##	Translate html string back to regular string
##
sub dehtmlize {
    local($str) = shift;
    $str =~ s/\&lt;/</g;
    $str =~ s/\&gt;/>/g;
    $str =~ s/\&amp;/\&/g;
    $str;
}

##---------------------------------------------------------------------------
##	Escape special characters in string for URL use.
##
sub urlize {
    local($url) = shift;
    $url =~ s/([^\w])/sprintf("%%%X",unpack("C",$1))/ge;
    $url;
}

##---------------------------------------------------------------------------##
1;
