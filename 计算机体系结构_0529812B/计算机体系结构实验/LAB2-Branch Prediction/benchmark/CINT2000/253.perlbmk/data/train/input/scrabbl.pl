# Scrabbl.pl	-- Find all words from a collection of letters
#		- basically a simple application utilizing associative arrays




# Logic(?)
&readdict;
&makewords;

exit 0;


#
# Subroutines
#

sub readdict {
	# Read all the words in our dictionary input
	open(DICT,'dictionary') || die "Can't open dictionary 'dictionary'\n";

	while(<DICT>) {
		chop;
		next if /[^a-z]/;	# only want words w/o special chars

		$dict{$_} = $_;
	}

	close(DICT);
}


sub makewords {
	while(<>) {
		($input) = /([a-z]+)/;	# get only the letters

		$len = length($input);
		@set = ('X') x $len;
		%found = ();

		&permute($input, @set);

		foreach $word (sort keys(%found)) {
			print "$found{$word} --> $word\n";
		}
	}
}

sub permute {
	local( $letters, @set ) = @_;
	local( $char, $i );

	if( $letters eq '' ) {
		$word = join('', @set);
		if( defined($dict{$word}) ) {
			$found{$word} = $input;
		}

		return;
	}

	$char = substr($letters, 0, 1);
	$letters = substr($letters, 1);

	for( $i=0; $i<$len; $i++ ) {
		next if $set[$i] ne 'X';
		$set[$i] = $char;

		&permute($letters, @set);
		$set[$i] = 'X';
	}
}
