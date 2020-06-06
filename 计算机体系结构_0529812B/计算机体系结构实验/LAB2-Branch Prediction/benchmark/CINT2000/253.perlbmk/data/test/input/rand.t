#!./perl

# Test to make sure everything is ok wrt the random number files

srand(0);	# This should ensure that we get element zero in the
                # random number file.

$^H=1;	# use integer;

$num = rand(4294967295);

print "Looking for 3023170969...";
if ($num != 3023170969) {
    print "got $num\n";
    if ($num == 2709446120) {
	print "Looks like you've got an endianness mismatch!  Please look\n";
	print STDERR "at spec_config.h for details about how you might go\n";
	print STDERR "about fixing your problem.\n";
    } else {
	print STDERR "Your random numbers will be wrong.  I can't say for\n";
	print STDERR "sure that it's an endianness issue, but it might be.\n";
	print STDERR "Also, check your default int size, and if it's not 32\n";
	print STDERR "bits, you need to define SPEC_INT32_T.  See\n";
	print STDERR "spec_config.h for details.\n";
    }
} else {
    print "got it!\nRandom numbers okay!\n";
}
