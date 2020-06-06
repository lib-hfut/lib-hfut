package SPECdiff;

#use strict;
use MD5;
#use IO::File;
#use IO::Seekable;
use IO::Scalar;

# Begin junk from util.pl

## ############
## SUB                   FROM_HMS
## ############

## takes strings of hh:mm:ss (or mm:ss) and returns number of seconds

sub from_hms {
    my ($time) = @_;
    my (@vals) = split (":", $time);
    $time = 0;
    for (@vals) {
        $time *= 60;
        $time += $_;
    }
    $time;
}

## ############
## SUB                   TO_HMS
## ############

## takes seconds and returns a string of hh:mm:ss
## optionally can take a second argument of decimal seconds

sub to_hms {
    my ($t, $t2) = @_;
    my ($h,$m,$s);
    $s = $t % 60;
    $t = int($t/60);
    $m = $t % 60;
    $h = int($t/60);
    if ($t2) {
	sprintf ("%02d:%02d:%02d.%06d", $h, $m, $s, $t2);
    } else {
	sprintf ("%02d:%02d:%02d", $h, $m, $s);
    }
}

## ############
## SUB                   READ_FILE
## ############
# IO::File will close the file when $fh goes out of scope

sub read_file {
    my($name) = @_;
    my (@temp);
    my $fh = undef;
    if (ref($::sd_files{$name}) eq 'SCALAR') {
      $fh = new IO::Scalar $::sd_files{$name};
    } else {
      $fh = new IO::Scalar \$::sd_files{$name};
    }
    return undef if !defined $fh;
    return $fh->getlines;
}

## ############
## SUB                   MIN
## ############

## takes a list of values and returns the least of them (numeric only)
sub min {
    my ($val) = @_;
    for (@_) {
        $val = $_ if $_ < $val;
    }
    return $val;
}

## ############
## SUB                   MAX
## ############

## takes a list of values and returns the greatest of them
sub max {
    my ($val) = @_;
    for (@_) {
        $val = $_ if $_ > $val;
    }
    return $val;
}

## ############
## SUB                   EXPAND_RANGES
## ############

sub expand_ranges {
    my (@data) = @_;
    my (@rc, $start, $stop, $step, $i);

    for (@data) {
	if (($start, $stop, $step) = m/^(\d+)-(\d+)(?:x(\d+))?$/) {
	    $step = 1 if $step eq '';
	    if ($start < $stop) {
		for ($i = $start; $i <= $stop; $i += $step) {
		    push (@rc, $i);
		}
	    } else {
		for ($i = $start; $i >= $stop; $i -= $step) {
		    push (@rc, $i);
		}
	    }
	} else {
	    push (@rc, $_);
	}
    }
    @rc;
}

sub center {
    my ($text, $width) = @_;
    my $len = length $text;
    $width = 78 if !defined $width;
    $width = $len if $width < $len;
    ' ' x int(($width - length $text) / 2) . $text;
}

sub bytrailingnum {
    my ($aname, $anum) = $a =~ m/^(\S+?)([\d.]*)$/;
    my ($bname, $bnum) = $b =~ m/^(\S+?)([\d.]*)$/;
    my $rc = $aname cmp $bname;
    $rc = $anum  <=> $bnum if !$rc;
    return $rc;
}

# End junk from util.pl

## ############
## SUB                   SPEC_DIFF
## ############

## compare the outputs from a benchmark that is reference and a
## recent (real) run

# arguments:
#   lines:   Number of lines of differences to print out
#   file1:   source file to compare against
#   file2:   file generated during benchmark run
#   cw:      Collapse whitespace!

sub spec_diff_get_next_line {
    my ($fh, $cw) = @_;
    my $line;
    if (ref($fh) ne 'IO::Scalar' || $fh->eof()) {
	return undef;
    }
    $line = $fh->getline;
    chomp($line); chomp($line);
    $line = '' if ($line =~ m/program\s+(stop|end|terminated)/oi);
    return $line;
}

sub spec_diff {
    my ($lines, $file1, $file2, $cw, $abstol, $reltol, $obiwan, $skiptol, $calctol) = @_;
    my (@rc, $pos, $len);
    my ($line, $line1, $line2);
    my ($fh1, $fh2);   # W.S.
    my ($max_abstol, $max_reltol);
    my $rc;

    $max_abstol = $max_reltol = 0;

    ## $ugly_pat is a constant.. a regular expression on a grand scale.
    ## It breaks the string it is looking at into the elements of a
    ## scientific notation
    ##   $1 :: any characters preceeding a floating point number (optional)
    ##   $2 :: the floating point number
    ##   $3 :: any characters after the floating point number (optional)
    ##   The decimal point is required. The floating point may include
    ##   an (optional) exponential notation as in e+23 or E-3.
    ##   
    my ($ugly_pat) = "(.*?)([+-]?(?:[0-9]+\\.[0-9]*|[0-9]*\\.[0-9]+|[0-9]+))([dDgGeE][+-][0-9]*|)(.*)";

    ## $check_floating is set if relative or absolute arguments are given
    my ($check_floating) = ((defined $reltol  && $reltol  ne '')|| 
                            (defined $abstol  && $abstol  ne '')||
			    (defined $obiwan  && $obiwan  ne ''))?1:0;
    $skiptol    = 0 if $skiptol eq '';
    $obiwan = $cw = 1 if $check_floating;
# We don't want skiptol to turn on obiwan or compress whitespace without
# the user requesting it.
    $check_floating = 1 if (defined $skiptol && $skiptol ne '');

    if (exists $::sd_files{$file1}) {
      if (ref($::sd_files{$file1}) eq 'SCALAR') {
        $fh1 = new IO::Scalar $::sd_files{$file1};
      } else {
        $fh1 = new IO::Scalar \$::sd_files{$file1};
      }
      #$fh1 = new IO::File "<$file1";
    } else {
      return ("Couldn't open '$file1': $!\n");
    }
    if (exists $::sd_files{$file2}) {
      if (ref($::sd_files{$file2}) eq 'SCALAR') {
        $fh2 = new IO::Scalar $::sd_files{$file2};
      } else {
        $fh2 = new IO::Scalar \$::sd_files{$file2};
      }
      #$fh2 = new IO::File "<$file2";
    } else {
      return ("Couldn't open '$file2': $!\n");
    }

# If we don't have to do any fancy stuff, do a quick check to see if the files
# are identical, if so then return, if not, then reset file pointers and do
# the slow check to find out where they differ
    if (!$check_floating) {
	my $md5a = new MD5;
	my $md5b = new MD5;
	$md5a->addfile($fh1);
	$md5b->addfile($fh2);

	if ($md5a->hexdigest eq $md5b->hexdigest) {
	    return ();
	}
	$fh1->seek(0, SEEK_SET);
	$fh2->seek(0, SEEK_SET);
    }

    $line = 0;
    while (1) {
	last if $fh1->eof() && $fh2->eof(); # Files were equal

	do {
	    $line1 = spec_diff_get_next_line($fh1);
	} while ($cw && defined($line1) && $line1 =~ m/^\s*$/);
	do {
	    $line++;
	    $line2 = spec_diff_get_next_line($fh2);
	} while ($cw && defined($line2) && $line2 =~ m/^\s*$/);

	last if $line1 eq '' && $line2 eq '' && $fh1->eof() && $fh2->eof();
	if ($fh1->eof() && $line1 eq '') { push (@rc, "'$file2' long");  last; }  
	if ($fh2->eof() && $line2 eq '') { push (@rc, "'$file2' short"); last; }  

	$pos = 0;
	if (!$check_floating) {
# Do the simple case here, integer file, so lines have to match
	    if ($line1 ne $line2 && defined ($rc = &diff_at($line1, $line2, $cw))) {
		$pos += $rc;
	    
		## format an output line
		push (@rc, sprintf ("%04d:  %s\n       %s\n%s", 
				    $line, $line1, $line2, " " x ($pos +6). "^"));
	    }
	} else {
# Work on temporary copies of the lines
	    my $buf1 = $line1;
	    my $buf2 = $line2;
	    my ($pre1, $mant1, $exp1, $post1, $val1, $mant1_dec);
	    my ($pre2, $mant2, $exp2, $post2, $val2, $mant2_dec);

	    my $error = 0;
	    my $isnum = 0;
	    while ($buf1 && !$error) {
		$isnum = 0;
		if ($buf1 =~ m/^$ugly_pat$/o) { ## breakup A -- there must
                                                ## be a floating point value
		    $pre1   = $1; ## string before the floating point value
		    $mant1  = $2; ## the floating point value
		    $exp1   = $3; ## the floating point value
		    $post1  = $4; ## string after the floating point value
		    if ($buf2 =~ m/^$ugly_pat$/o) { ## breakup B
			$pre2   = $1; ## string before the floating point value
			$mant2  = $2; ## the floating point value
			$exp2   = $3; ## the floating point value
			$post2  = $4; ## string after the floating point value
			$isnum  =  1;
#print "1: $line1\n";
#print "2: $line2\n";
#print "<: mant1='$mant1', exp1='$exp1'\n";
#print "<: mant2='$mant2', exp2='$exp2'\n";
#print "<: pre1='$pre1', post1='$post1'\n";
#print "<: pre2='$pre2', post2='$post2'\n";

			## the call to &diff_at() is a little bit obscured
			## by the fact that it made within a logical test,
			## but is called everytime, nonetheless.
			## the data names (_pre) must match
			if ($pre1 ne $pre2 && 
			    defined ($rc = &diff_at($pre1, $pre2, $cw))) {

			    ## first order error handling
			    $error = 1;
			    $pos += $rc; ## Increment the position
				         ## by where the difference was
			                 ## found.
			    ## end of error specific block
			} else {

			    ## normal processing
			    $pos += length $pre2;
			    $len  = length ("$mant2$exp2");
			    $error = 1;

			    $exp1=~s/^[Dd]/e/;
			    $exp2=~s/^[Dd]/e/;
                            # Get the numeric value
			    $val1 = "$mant1$exp1" + 0;
			    $val2 = "$mant2$exp2" + 0;

                            # Remove that annoying leading character
			    $exp1 = substr($exp1, 1);
			    $exp2 = substr($exp2, 1);

			    # We convert everything to doubles, which have
			    # precision limitations, so arbitrarily knock off
			    # values less than 1e-300
			    $exp1 = 0 if ($exp1 < -300);
			    $exp2 = 0 if ($exp2 < -300);

			    $error = 0 if ($val1 == $val2);
			    my $delta;

			    ## global_abolute processing
			    if ($error && defined $abstol) {
				$delta = $abstol;
				if ($val1 - $delta <= $val2 &&
				    $val1 + $delta >= $val2) {
				    $error = 0;
				}
			    }

			    ## reltol processing
			    if ($error && defined $reltol) {
				$delta = abs($val1 * $reltol);
				if ($val1 - $delta <= $val2 &&
				    $val1 + $delta >= $val2) {
				    $error = 0;
				}
			    }


			    if (defined $obiwan) {
				$mant1_dec = index($mant1, '.');
				if ($mant1_dec < 0) {
				    $mant1_dec = 0;
				} else {
				    $mant1_dec = (length $mant1) - $mant1_dec - 1;
				}
				$mant2_dec = index($mant2, '.');
				if ($mant2_dec < 0) {
				    $mant2_dec = 0;
				} else {
				    $mant2_dec = (length $mant2) - $mant2_dec - 1;
				}
				my $mant1_val = $mant1;
				my $mant2_val = $mant2;
				$delta = $mant1_dec;
				$delta = $mant2_dec if $mant2_dec > $delta;
				$mant1_val = $mant1 * (10 ** $delta);
				$mant2_val = $mant2 * (10 ** $delta);
				$delta = $exp1 - $exp2;
				if ($delta < 0) {
				    $mant2_val = $mant2_val * (10 ** -$delta);
				} else {
				    $mant1_val = $mant1_val * (10 ** $delta);
				}
				if (abs($mant1_val - $mant2_val) < 1.5) {
				    $error = 0;
				}

				## end of normal specific block
			    }

			    if ($error && $calctol) {
				my $tmp = abs($val2 - $val1);
				$max_abstol = $tmp if ($tmp > $max_abstol);
				if ($val1 != 0) {
				    $tmp = abs(abs($val1-$val2) / $val1);
				} else {
				    $tmp = 1e100;
				}
				$max_reltol = $tmp if ($tmp > $max_reltol);
			    }

			    ## error or not, this gets done...
			    $pos += $len;
			    $buf1 = $post1; ## shift fwd to string past number
			    $buf2 = $post2; ## shift fwd to string past number
			}

			## end of successful match to a floating point in $b
		    } else {

			## floating point number not found
			$error = 1;
			$pos += &diff_at($pre1, $buf2, $cw);
		    }
		    ## end of successful match to a floating point in $a

		} elsif ($buf1 ne $buf2 &&
			 defined ($rc = &diff_at($buf1, $buf2, $cw))) {
		    $error = 1;
		    $pos += $rc; ## increment position by how far diff spans
		} else {
		    $buf1 = '';
		}

		## error handling
		if ($error) {	## format an error string for output
#print "error: isnum=$isnum, skiptol=$skiptol, line=$line, buf1='$buf1', val1='$val1', val2='$val2'\n";
		    if ($isnum && $skiptol >0) {
			$skiptol --;
			$error = 0;
		    } else {
			push (@rc, sprintf ("%04d:  %s\n       %s\n%s", 
				    $line, $line1, $line2, " " x ($pos +6). "^"));
			last;
		    }
		}
	    } ## END OF while $buf1 and not error LOOP
	}

	# If we exceed the number of error lines we are interested in, then
	# don't do any more work.
	last if ($lines && @rc > $lines);
    }

    if ($calctol) {
	@rc = splice(@rc, 0, $lines) if $lines;
	#push @rc, sprintf("max abstol = %g", $max_abstol);
	#push @rc, sprintf("max reltol = %g", $max_reltol);
	push @rc, "max abstol = some number";
	push @rc, "max reltol = some number";
    }

    ## an obfusticated use of grep to add eol at end of the strings in @rc
    grep(s/$/\n/, @rc);
    return @rc;
}

## ############
## SUB                   DIFF_AT
## ############

## looks for point of differentiation in two strings (while ignoring
## white space, if that option is specified). The value returned is
## in reference to the uncolapsed second string.. 

# Fairly slow but should be adequate for our purposes
sub diff_at {
    my ($a, $b, $cw) = @_;
    if ($cw) { # If collapsing turn all whitespace into space characters
	$a =~ s/\s+$//g;
	$b =~ s/\s+$//g;
	$a =~ s/^\s+//g;
	$b =~ s/^\s+//g;
	$a =~ s/\s/ /g;
	$b =~ s/\s/ /g;
    }
    my (@a) = split (//, $a);	## create single character array out of string
    my (@b) = split (//, $b);	##                   ditto
    my ($pos) = 0;
    my $b_pos = 0;
    my $a_lastwaswhite = 0;
    my $b_lastwaswhite = 0;
    while (1) {	
	do { ## collapse white space in 
	    if (!@a) {
		return undef if (!@b);
		for (@b) {
		    return $b_pos if !m/^\s*$/;
		}
		return undef;
	    }
	    $a = shift(@a);	## reuse the $a variable to hold single char
	} while($cw && $a_lastwaswhite && $a eq ' '); 
	do { ## do the same for 
	    if (!@b) {
		return $b_pos;
	    }
	    $b = shift(@b);
	    $b_pos ++;
	} while($cw && $b_lastwaswhite && $b eq ' '); 
	return $b_pos if ($a ne $b);
	$a_lastwaswhite = $a eq ' ';
	$b_lastwaswhite = $b eq ' ';
    }
    return undef;
}

1;
