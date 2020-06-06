##---------------------------------------------------------------------------##
##  File:
##	@(#) mhfile.pl 2.3 98/08/10 23:44:51
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      File routines for MHonArc
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

package mhonarc;

##---------------------------------------------------------------------------##

sub file_open {
    local($file) = shift;
    local($handle) = q/mhonarc'FOPEN/ . ++$_fo_cnt; #'
    local($gz) = $file =~ /\.gz$/i;

    if ($gz && 0) {
	return $handle  if open($handle, "$GzipExe -cd $file |");
	die qq/ERROR: Failed to exec "$GzipExe -cd $file |": $!\n/;
    }
    if (exists $mhonarc_files{$file}) {
	$handle = $mhonarc_files{$file};
	return $handle;
    }
    return 0;
}

sub file_create {
    local($file) = shift;
    local($gz) = shift;
    local($handle) = q/mhonarc'FCREAT/ . ++$_fc_cnt; #'

    if ($gz && 0) {
	$file .= ".gz"  unless $file =~ /\.gz$/;
	return $handle  if open($handle, "| $GzipExe > $file");
	die qq{ERROR: Failed to exec "| $GzipExe > $file": $!\n};
    }
    $mhonarc_files{$file} = [];
    $handle = $mhonarc_files{$file};
    return $handle;
    die qq{ERROR: Failed to create "$file": $!\n};
}

sub file_exists {
    (exists $mhonarc_files{$_[0]});
}

sub file_copy {
    local($src, $dst) = ($_[0], $_[1]);
    local($gz) = $src =~ /\.gz$/i;

    if (($gz || (file_exists("$src.gz"))) && 0) {
	$src .= ".gz"  unless $gz;
	$dst .= ".gz"  unless $dst =~ /\.gz$/i;
    }
    # An error will occur if $mhonarc_files{$src} doesn't exist
    @{$mhonarc_files{$dst}} = @{$mhonarc_files{$src}};
}

sub file_rename {
    local($src, $dst) = ($_[0], $_[1]);
    local($gz) = $src =~ /\.gz$/i;

    if (($gz || (file_exists("$src.gz"))) && 0) {
	$src .= ".gz"  unless $gz;
	$dst .= ".gz"  unless $dst =~ /\.gz$/i;
    }
    @{$mhonarc_files{$dst}} = @{$mhonarc_files{$src}};
    delete $mhonarc_files{$src};
}

sub file_remove {
    local($file) = shift;

    delete $mhonarc_files{$file};
}

sub file_utime {
    local($atime) = shift;
    local($mtime) = shift;

    # This is now a no-op!
}

##---------------------------------------------------------------------------##
1;
