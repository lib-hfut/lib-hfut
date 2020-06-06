#
#  specdiff - compares files to see if results match
#  (c) Standard Performance Evaluation Corporation 1995
#
#  Author:  Christopher Chan-Nui
#
# $Id: specdiff.pm 1393 2005-06-14 15:55:21Z cloyce $

##############################################################################
# Find top of directory tree
##############################################################################

# Commented out for use in 253.perlbmk
#BEGIN { 
#    if ($ENV{'SPEC'} ne '') {
#	unshift (@INC, "$ENV{'SPEC'}/bin", "$ENV{'SPEC'}/bin/lib", 
#	               "$ENV{'SPEC'}/bin/lib/site");
#    }
#}
#
use strict;
use Cwd;
use File::Basename;

# Separate things from the driver (which lives in the main package)
package SPECdiff;

sub fileparam_val {
    my ($val, $file) = @_;
    if (ref($val) eq 'HASH') {
	if (exists $val->{$file}) {
	    $val = $val->{$file};
	} else {
	    $val = $val->{'default'};
	}
    }
    return $val;
}
sub fileparam {
    my $val = fileparam_val(@_);
    return istrue($val)?1:undef;
}

sub specdiff_main {
  # This is SPECdiff::ARGV, don'cha know
  @ARGV = @_;

  ############################################################################
  # Do real program
  ############################################################################

  require "compare.pm";
  use Getopt::Long;

  use vars qw($global_config);
  use vars qw($obiwan $reltol $abstol $compress_whitespace);

  shift @ARGV if ($ARGV[0] eq '--');

  #unshift(@ARGV, split(' ',$ENV{'SPEC_SPECDIFF'})) 
  #    if defined $ENV{'SPEC_SPECDIFF'};

  my $cl_opts={ 'lines' => 10, 'verbose' => 1 };
  Getopt::Long::config("no_ignore_case", "bundling");
  my $rc = GetOptions ($cl_opts, qw(
                      abstol|a=f
                      reltol|r=f
                      calctol|t
                      skiptol|s=i
                      mis|m
                      cw|c
                      CW|C
                      obiwan|o
                      OBIWAN|O
                      os=s
                      datadir|d
                      lines|l=i
                      quiet
                      verbose|v=i
                      help|h
                      ));

  my $verbose;
  $verbose = $cl_opts->{'verbose'};
  $verbose = 0 if $cl_opts->{'quiet'};
  my $os = $cl_opts->{'os'};
  $cl_opts->{'cw'} = 0 if $cl_opts->{'CW'};
  $cl_opts->{'obiwan'} = 0 if $cl_opts->{'OBIWAN'};

  &usage if $cl_opts->{'help'};

  if ($cl_opts->{'datadir'}) {
      print STDERR "Bad monkey!  Mustn't use the datadir option in the benchmark!\n";
      exit 1;

      my $pwd = cwd();
      my ($benchdir, $rundir, $subdir) = $pwd =~ m#(.*/\d+\.\S+)[/\\]run[/\\]([^/\\]+)(.*)#;
      my %vars;
      $subdir =~ s#^\\#/#g;
      $subdir =~ s#^/##;
      open(FILE, "<$benchdir/run/list") || die "Can't open '$benchdir/run/list': $!\n";
      while (<FILE>) {
          if (m/^$rundir\s+/) {
              my @vars = split;
              for my $pair (@vars) {
                  my ($name, $val) = $pair =~ m/([^=]+)=(.*)/;
                  $vars{$name} = $val;
              }
          }
          last if m/^__END__/;
      }
      close(FILE);

      my $size = $vars{'size'};
      require "$benchdir/Spec/object.pm";
      my ($files, $dirs) = build_tree_hash($os, "$benchdir/data/$size/output");
      if (!@ARGV) {
          push (@ARGV, keys %$files);
      }
      print join(',', @ARGV), "\n" if $verbose >= 3;
      for my $filename (@ARGV) {
          my $subfilename = $filename;
          $subfilename = "$subdir/$filename" if $subdir ne '';
          if (! exists $files->{$subfilename}) {
              print "'$subfilename' does not exist in '$size' output directory\n";
              next;
          }

          my $mycw      = fileparam($compress_whitespace, $subfilename);
          my $myobiwan  = fileparam($obiwan, $subfilename);
          my $myreltol  = fileparam_val($reltol, $subfilename);
          my $myabstol  = fileparam_val($abstol, $subfilename);
          my $mycalctol = 0;
          my $myskiptol = '';

          my $lines  = $cl_opts->{'lines'};
          $mycw      = $cl_opts->{'cw'}      if $cl_opts->{'cw'}     ne '';
          $myabstol  = $cl_opts->{'abstol'}  if $cl_opts->{'abstol'} ne '';
          $myreltol  = $cl_opts->{'reltol'}  if $cl_opts->{'reltol'} ne '';
          $myobiwan  = $cl_opts->{'obiwan'}  if $cl_opts->{'obiwan'} ne '';
          $mycalctol = $cl_opts->{'calctol'} if $cl_opts->{'calctol'} ne '';
          $myskiptol = $cl_opts->{'skiptol'} if $cl_opts->{'skiptol'} ne '';
          my @rc = &spec_diff($lines, $files->{$subfilename}, $filename,
                              $mycw, $myabstol, $myreltol, $myobiwan, $myskiptol,
                              $mycalctol);
          if (@rc) {
              print "***$filename***\n";
              print @rc;
              exit 1 
          } elsif ($verbose >= 1) {
              print "***$filename***\n";
              printf("abstol=%.09f, reltol=%.09f, cw=$mycw, obiwan=$myobiwan\n", $myabstol, $myreltol) if ($verbose >= 2);
              print @rc;
          }
      }
      exit (0);
  }

  usage() if (!@ARGV);
  my $file1 = shift(@ARGV);
  my $file2 = (@ARGV)?shift(@ARGV):"-";

  # Don't stat
  #$file2 = "$file2/".basename($file1) if -d $file2;

  my @rc = &spec_diff ($cl_opts->{'lines'}, $file1, $file2, 
                      $cl_opts->{'cw'},
                      $cl_opts->{'abstol'},
                      $cl_opts->{'reltol'},
                      $cl_opts->{'obiwan'},
                      $cl_opts->{'skiptol'},
                      $cl_opts->{'calctol'});

  if (@rc && $cl_opts->{'mis'}) {
      $::sd_files{"$file2.mis"} = join("\n", @rc);
      #open (MIS, ">$file2.mis") || die "Can't open output '$file2.mis': $!\n";
      #print MIS @rc;
      #close(MIS);
  }

  print "cw=",$cl_opts->{'cw'},", abstol=",$cl_opts->{'abstol'},", reltol=",$cl_opts->{'reltol'},", cw=",$cl_opts->{'cw'},", obiwan=",$cl_opts->{'obiwan'}, "skiptol=",$cl_opts->{'skiptol'},"\n" if ($verbose >= 2);
  print @rc if $verbose;

  # Don't exit... just return
  return 1 if @rc;
}

sub usage {
    print <<EOT;
Usage: $0 [-l #] [-q] file1 [file2]
       -l     # of lines of differences to print
       -q     don't print lines just set return code
       -a     absolute tolerance (for floating compares)
       -r     relative tolerance (for floating compares)
       -c     collapse whitespace (doesn't do what you think it does)
       -d     Compare against file(s) in data directory
EOT
    exit 1;
}

1;
