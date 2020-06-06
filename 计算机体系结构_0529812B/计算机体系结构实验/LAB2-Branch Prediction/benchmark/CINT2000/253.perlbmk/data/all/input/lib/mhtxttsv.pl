##---------------------------------------------------------------------------##
##  File:
##	@(#) mhtxttsv.pl 2.2 98/08/10 23:53:24
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##	Library defines routine to filter text/tab-separated-values body
##	parts to HTML
##	for MHonArc.
##	Filter routine can be registered with the following:
##              <MIMEFILTERS>
##              text/tab-separated-values:m2h_text_plain'filter:mhtxttsv.pl
##              </MIMEFILTERS>
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

package m2h_text_tsv;

##---------------------------------------------------------------------------##
##	Text/tab-separated-values filter for mhonarc.
##
sub filter {
    local($header, *fields, *data, $isdecode, $args) = @_;
    local($field, $line, $ret);
    local($_);

    $data =~ s/^\s+//;
    $ret  = "<TABLE BORDER=1>\n";
    foreach $line (split(/\r?\n/, $data)) {
	$ret .= "<TR>";
	foreach $field (split(/\t/, $line)) {
	    $ret .= "<TD>$field</TD>";
	}
	$ret .= "</TR>\n";
    }
    $ret .= "</TABLE>\n";
    ($ret);
}

##---------------------------------------------------------------------------##
1;
