#!/usr/bin/perl

# Find some number of perfect numbers, using either native integers or
# perl BigInts

# This is a toy, and nobody would use Math::BigInt for anything performance
# critical (bindings for fast, C-based MP libraries exist), but it does
# exercise a lot of perl that *is* used in all sorts of situations.
# I'm thinking specifically of the OO stuff, overloading, and non-regexp
# string manipulation, just to name a few.

use Math::BigInt;
$^H |= 1;       # use integer;
$|=1;
$standalone = 0;

print "Args: ",join(', ', @ARGV),"\n";
while (@ARGV) {
  my ($method, $number) = splice(@ARGV, 0, 2);
  $number = (defined $number && $number > 0) ? $number : 2;

  # Do the initial set-up
  if ($method !~ /b/i) {
    ($i, $j, $m) = (2, 2, 1);
    print "Machine integers, first $number perfect numbers:\n";
  } else {
    $i = new Math::BigInt '2';
    $j = new Math::BigInt '2';
    $m = new Math::BigInt '1';
    print "Math::BigInt integers, first $number perfect numbers:\n";
  }
  if ($standalone) {
    print "Done";
    $t1 = time;
  }
  perfect($number);
  print ' in ',time - $t1," seconds\n" if $standalone;
}

sub perfect {
  my ($limit) = @_;
  my ($found) = (0);
  for (;; $i += 2) {
      for ($j = 2; $j < (1 + $i/2); $j++) {
          $m += $j if (($i % $j) == 0);
      }
      print "$i, $m, $j; found $found: " if ($j % 100 == 0);
      if ($i == $m) {
        print "perfect $i\n";
        $found++;
        return if ($found >= $limit);
      } else {
        print "nope\n" if ($j % 100 == 0);
      }
      $m = 1;
  }
}
