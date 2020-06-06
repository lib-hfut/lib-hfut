##---------------------------------------------------------------------------##
##  File:
##	@(#) mhindex.pl 1.3 98/10/10 16:33:39
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##	Main index routines for mhonarc
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

package mhonarc;

##---------------------------------------------------------------------------
##	write_main_index outputs main index of archive
##
sub write_main_index {
    local($onlypg) = @_;
    local($MLCP);
    local($outhandle, $i, $i_p0, $filename, $tmpl, $isfirst, $tmp,
	  $mlfh, $mlinfh, $tmpfile, $offstart, $offend);
    local(*a);
    local($PageNum, $PageSize, $totalpgs);

    &compute_page_total();
    $PageNum    = $onlypg || 1;
    $totalpgs   = $onlypg || $NumOfPages;
    if (!scalar(@MListOrder)) {
	@MListOrder = &sort_messages();
	%Index2MLoc = ();
	@Index2MLoc{@MListOrder} = (0 .. $#MListOrder);
    }

    for ( ; $PageNum <= $totalpgs; ++$PageNum) {
	next  if $PageNum < $IdxMinPg;

	$isfirst = 1;
	$MLCP = 0;

        if ($MULTIIDX) {
            $offstart = ($PageNum-1) * $IDXSIZE;
            $offend   = $offstart + $IDXSIZE-1;
            $offend   = $#MListOrder  if $#MListOrder < $offend;
            @a        = @MListOrder[$offstart..$offend];

	    if ($PageNum > 1) {
		$IDXPATHNAME = join("", $OUTDIR, $DIRSEP,
				    $IDXPREFIX, $PageNum, ".", $HtmlExt);
	    } else {
		$IDXPATHNAME = join($DIRSEP, $OUTDIR, $IDXNAME);
	    }

	} else {
	    if ($IDXSIZE && (($i = ($#MListOrder+1) - $IDXSIZE) > 0)) {
		if ($REVSORT) {
		    splice(@MListOrder, $IDXSIZE);
		} else {
		    splice(@MListOrder, 0, $i);
		}
	    }
	    $IDXPATHNAME = join($DIRSEP, $OUTDIR, $IDXNAME);
	    *a = *MListOrder;
	}
	$PageSize = scalar(@a);
	    
	## Open/create index file
	if ($IDXONLY) {
	   $outhandle = 'STDOUT';

	} else {
	    if ($ADD && &file_exists($IDXPATHNAME)) {
		$tmpfile = join($DIRSEP, $OUTDIR, "tmp.$$");
		&file_rename($IDXPATHNAME, $tmpfile);
		($mlinfh = &file_open($tmpfile))
		    || die("ERROR: Unable to open $tmpfile\n");
		$MLCP = 1;
	    }
	    ($outhandle = &file_create($IDXPATHNAME, $GzipFiles)) ||
		die("ERROR: Unable to create $IDXPATHNAME\n");
	}
	print STDOUT "Writing $IDXPATHNAME ...\n"  unless $QUIET;

	## Print top part of index
	&output_maillist_head($outhandle, $mlinfh);

	## Output links to messages

	if ($NOSORT) {
	    foreach $index (@a) {
		($tmpl = $LITMPL) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
		push @$outhandle, $tmpl;
	    }

	} elsif ($SUBSORT) {
	    local($prevsub) = '';
	    foreach $index (@a) {
		if (($tmp = &get_base_subject($index)) ne $prevsub) {
		    $prevsub = $tmp;
		    if (!$isfirst) {
			($tmpl = $SUBJECTEND) =~
				s/$VarExp/&replace_li_var($1,$index)/geo;
			push @$outhandle, $tmpl;
		    } else {
			$isfirst = 0;
		    }
		    ($tmpl = $SUBJECTBEG) =~
			s/$VarExp/&replace_li_var($1,$index)/geo;
		    push @$outhandle, $tmpl;
		}
		($tmpl = $LITMPL) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
		push @$outhandle, $tmpl;
	    }
	    ($tmpl = $SUBJECTEND) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
	    push @$outhandle, $tmpl;

	} elsif ($AUTHSORT) {
	    local($prevauth) = '';
	    foreach $index (@a) {
		if (($tmp = &get_base_author($index)) ne $prevauth) {
		    $prevauth = $tmp;
		    if (!$isfirst) {
			($tmpl = $AUTHEND) =~
			    s/$VarExp/&replace_li_var($1,$index)/geo;
			push @$outhandle, $tmpl;
		    } else {
			$isfirst = 0;
		    }
		    ($tmpl = $AUTHBEG) =~
			s/$VarExp/&replace_li_var($1,$index)/geo;
		    push @$outhandle, $tmpl;
		}
		($tmpl = $LITMPL) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
		push @$outhandle, $tmpl;
	    }
	    ($tmpl = $AUTHEND) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
	    push @$outhandle, $tmpl;

	} else {
	    local($prevdate) = '';
	    local($time);
	    foreach $index (@a) {
		$time = &get_time_from_index($index);
		$tmp = join("", (gmtime($time))[3,4,5]);
		if ($tmp ne $prevdate) {
		    $prevdate = $tmp;
		    if (!$isfirst) {
			($tmpl = $DAYEND) =~
			    s/$VarExp/&replace_li_var($1,$index)/geo;
			push @$outhandle, $tmpl;
		    } else {
			$isfirst = 0;
		    }
		    ($tmpl = $DAYBEG) =~
			s/$VarExp/&replace_li_var($1,$index)/geo;
		    push @$outhandle, $tmpl;
		}
		($tmpl = $LITMPL) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
		push @$outhandle, $tmpl;
	    }
	    ($tmpl = $DAYEND) =~ s/$VarExp/&replace_li_var($1,$index)/geo;
	    push @$outhandle, $tmpl;
	}

	## Print bottom part of index
	&output_maillist_foot($outhandle, $mlinfh);
	if ($MLCP) {
	    &file_remove($tmpfile);
	}
    }
}

##---------------------------------------------------------------------------
##	output_maillist_head() outputs the beginning of the index page.
##
sub output_maillist_head {
    local($handle, $cphandle) = @_;
    local($tmp, $index, $headfh);
    $index = "";

    push @$handle, "<!-- ".&commentize("MHonArc v$VERSION")." -->\n";

    ## Output title
    ($tmp = $IDXPGBEG) =~ s/$VarExp/&replace_li_var($1,'')/geo;
    push @$handle, $tmp;
    push @$handle, "<!--X-ML-Title-H1-End-->\n";

    if ($MLCP) {
	while ($_ = shift(@$cphandle)) { last  if /<!--X-ML-Title-H1-End/; }
    }

    ## Output header file
    if ($HEADER) {				# Read external header
	push @$handle, "<!--X-ML-Header-->\n";
	if ($headfh = &file_open($HEADER)) {
	    while ($_ = shift(@$headfh)) { push @$handle, $_; }
	    #close($headfh);
	} else {
	    warn "Warning: Unable to open header: $HEADER\n";
	}
	if ($MLCP) {
	    while ($_ = shift(@$cphandle)) { last  if /<!--X-ML-Header-End/; }
	}
	push @$handle, "<!--X-ML-Header-End-->\n";
    } elsif ($MLCP) {				# Preserve maillist header
	while ($_ = shift(@$cphandle)) {
	    push @$handle, $_;
	    last  if /<!--X-ML-Header-End/;
	}
    } else {					# No header
	push @$handle, ("<!--X-ML-Header-->\n",
		      "<!--X-ML-Header-End-->\n");
    }

    push @$handle, "<!--X-ML-Index-->\n";
    ($tmp = $LIBEG) =~ s/$VarExp/&replace_li_var($1,'')/geo;
    push @$handle, $tmp;
}

##---------------------------------------------------------------------------
##	output_maillist_foot() outputs the end of the index page.
##
sub output_maillist_foot {
    local($handle, $cphandle) = @_;
    local($tmp, $index, $footfh);
    $index = "";

    ($tmp = $LIEND) =~ s/$VarExp/&replace_li_var($1,'')/geo;
    push @$handle, $tmp;
    push @$handle, "<!--X-ML-Index-End-->\n";

    ## Skip past index in old maillist file
    if ($MLCP) {
	while ($_ = shift(@$cphandle)) { last  if /<!--X-ML-Index-End/; }
    }

    ## Output footer file
    if ($FOOTER) {				# Read external footer
	push @$handle, "<!--X-ML-Footer-->\n";
	if ($footfh = &file_open($FOOTER)) {
	    while ($_ = shift(@$footfh)) { push @$handle, $_; }
	} else {
	    warn "Warning: Unable to open footer: $FOOTER\n";
	}
	if ($MLCP) {
	    while ($_ = shift(@$cphandle)) { last  if /<!--X-ML-Footer-End/; }
	}
	push @$handle, "<!--X-ML-Footer-End-->\n";
    } elsif ($MLCP) {				# Preserve maillist footer
	while ($_ = shift(@$cphandle)) {
	    push @$handle, $_;
	    last  if /<!--X-ML-Footer-End/;
	}
    } else {					# No footer
	push @$handle, ("<!--X-ML-Footer-->\n",
		      "<!--X-ML-Footer-End-->\n");
    }

    &output_doclink($handle);

    ## Close document
    ($tmp = $IDXPGEND) =~ s/$VarExp/&replace_li_var($1,'')/geo;
    push @$handle, $tmp;

    push @$handle, "<!-- ".&commentize("MHonArc v$VERSION")." -->\n";
}

##---------------------------------------------------------------------------
##	Output link to documentation, if specified
##
sub output_doclink {
    local($handle) = ($_[0]);
    if (!$NODOC && $DOCURL) {
	push @$handle, "<HR>\n";
	push @$handle, ("<ADDRESS>\n",
		"Mail converted by ",
		qq|<A HREF="$DOCURL"><CODE>MHonArc</CODE></A> $VERSION\n|,
		"</ADDRESS>\n");
    }
}

##---------------------------------------------------------------------------
1;
