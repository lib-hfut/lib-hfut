#
# Make a bunch of random numbers (around 1.3 million), and print some of them
# out. That's all.
#

$^H |= 1;       # use integer;
srand(12091209);        # This is important
my $i = 1375288;
#my $i = 237528;

while($i > 0) {
  $num = rand(4294967295);
  $i--;
  next if ($i % 1000);
  print "$i: $num\n";
}
