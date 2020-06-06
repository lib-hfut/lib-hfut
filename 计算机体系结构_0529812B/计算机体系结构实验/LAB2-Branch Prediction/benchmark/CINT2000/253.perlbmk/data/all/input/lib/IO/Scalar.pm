package IO::Scalar;


=head1 NAME

IO::Scalar - IO:: interface for reading/writing a scalar


=head1 SYNOPSIS

If you have any Perl5, you can use the basic OO interface...

    use IO::Scalar;
    
    # Open a handle on a string:
    $SH = new IO::Scalar;
    $SH->open(\$somestring);
    
    # Open a handle on a string, read it line-by-line, then close it:
    $SH = new IO::Scalar \$somestring;
    while ($_ = $SH->getline) { print "Line: $_" }
    $SH->close;
        
    # Open a handle on a string, and slurp in all the lines:
    $SH = new IO::Scalar \$somestring;
    print $SH->getlines; 
     
    # Open a handle on a string, and append to it:
    $SH = new IO::Scalar \$somestring
    $SH->print("bar\n");        ### will add "bar\n" to the end   
      
    # Get the current position:
    $pos = $SH->getpos;         ### $SH->tell() also works
     
    # Set the current position:
    $SH->setpos($pos);          ### $SH->seek(POS,WHENCE) also works
        
    # Open an anonymous temporary scalar:
    $SH = new IO::Scalar;
    $SH->print("Hi there!");
    print "I got: ", ${$SH->sref}, "\n";      ### get at value

If your Perl is 5.004 or later, you can use the TIEHANDLE
interface, and read/write scalars just like files:

    use IO::Scalar;

    # Writing to a scalar...
    my $s; 
    tie *OUT, 'IO::Scalar', \$s;
    print OUT "line 1\nline 2\n", "line 3\n";
    print "s is now... $s\n"
     
    # Reading and writing an anonymous scalar... 
    tie *OUT, 'IO::Scalar';
    print OUT "line 1\nline 2\n", "line 3\n";
    tied(OUT)->seek(0,0);
    while (<OUT>) { print "LINE: ", $_ }


=head1 DESCRIPTION

This class implements objects which behave just like FileHandle
(or IO::Handle) objects, except that you may use them to write to
(or read from) scalars.  They can be tiehandle'd as well.  

Basically, this:

    my $s;
    $SH = new IO::Scalar \$s;
    $SH->print("Hel", "lo, ");         # OO style
    $SH->print("world!\n");            # ditto

Or this (if you have 5.004 or later):

    my $s;
    $SH = tie *OUT, 'IO::Scalar', \$s;
    print OUT "Hel", "lo, ";           # non-OO style
    print OUT "world!\n";              # ditto

Or this (if you have 5.004 or later):

    my $s;
    $SH = IO::Scalar->new_tie(\$s);
    $SH->print("Hel", "lo, ");         # OO style...
    print $SH "world!\n";              # ...or non-OO style!

Causes $s to be set to:    

    "Hello, world!\n" 


=head1 PUBLIC INTERFACE

=cut

#use Carp;
#use strict;
#use vars qw($VERSION @ISA);

# The package version, both in 1.23 style *and* usable by MakeMaker:
$VERSION = substr q$Revision: 1.1 $, 10;

# Inheritance:
#require IO::WrapTie and push @ISA, 'IO::WrapTie::Slave' if ($] >= 5.004);


#==============================

=head2 Construction 

=over 4

=cut

#------------------------------

=item new [ARGS...]

I<Class method.>
Return a new, unattached scalar handle.  
If any arguments are given, they're sent to open().

=cut

sub new {
    my $self = bless {}, shift;
    $self->open(@_) if @_;
    $self;
}
sub DESTROY { 
    shift->close;
}

#------------------------------

=item open [SCALARREF]

I<Instance method.>
Open the scalar handle on a new scalar, pointed to by SCALARREF.
If no SCALARREF is given, a "private" scalar is created to hold
the file data.

Returns the self object on success, undefined on error.

=cut

sub open {
    my ($self, $sref) = @_;

    # Sanity:
    defined($sref) or do {my $s = ''; $sref = \$s};
    (ref($sref) eq "SCALAR") or die "open() needs a ref to a scalar";

    # Setup:
    $self->{Pos} = 0;
    $self->{SR} = $sref;
    $self;
}

#------------------------------

=item opened

I<Instance method.>
Is the scalar handle opened on something?

=cut

sub opened {
    shift->{SR};
}

#------------------------------

=item close

I<Instance method.>
Disassociate the scalar handle from its underlying scalar.
Done automatically on destroy.

=cut

sub close {
    my $self = shift;
    %$self = ();
    1;
}

=back

=cut



#==============================

=head2 Input and output

=over 4

=cut


#------------------------------

=item getc

I<Instance method.>
Return the next character, or undef if none remain.

=cut

sub getc {
    my $self = shift;
    
    # Return undef right away if at EOF; else, move pos forward:
    return undef if $self->eof;  
    substr(${$self->{SR}}, $self->{Pos}++, 1);
}
 
#------------------------------

=item getline

I<Instance method.>
Return the next line, or undef on end of string.  
Can safely be called in an array context.
Currently, lines are delimited by "\n".

=cut

sub getline {
    my $self = shift;

    # Return undef right away if at EOF:
    return undef if $self->eof;

    # Get next line:
    pos(${$self->{SR}}) = $self->{Pos}; # start matching at this point
    ${$self->{SR}} =~ m/(.*?)(\n|\Z)/g; # match up to newline or EOS
    my $line = $1.$2;                   # save it
    $self->{Pos} += length($line);      # everybody remember where we parked!
    return $line; 
}

#------------------------------

=item getlines

I<Instance method.>
Get all remaining lines.
It will croak() if accidentally called in a scalar context.

=cut

sub getlines {
    my $self = shift;
    wantarray or die("Can't call getlines in scalar context!");
    my ($line, @lines);
    push @lines, $line while (defined($line = $self->getline));
    @lines;
}

#------------------------------

=item print ARGS...

I<Instance method.>
Print ARGS to the underlying scalar.  

B<Warning:> Currently, this always causes a "seek to the end of the string"; 
this may change in the future.

=cut

sub print {
    my $self = shift;
    ${$self->{SR}} .= join('', @_);
    $self->{Pos} = length(${$self->{SR}});
    1;
}

#------------------------------

=item read BUF, NBYTES, [OFFSET]

I<Instance method.>
Read some bytes from the scalar.
Returns the number of bytes actually read, 0 on end-of-file, undef on error.

=cut

sub read {
    my ($self, $buf, $n, $off) = @_;
    die "OFFSET not yet supported" if defined($off);
    my $read = substr(${$self->{SR}}, $self->{Pos}, $n);
    $self->{Pos} += length($read);
    $_[1] = $read;
    return length($read);
}

=back

=cut


#==============================

=head2 Seeking and telling

=over 4

=cut


#------------------------------

=item clearerr

I<Instance method.>  Clear the error and EOF flags.  A no-op.

=cut

sub clearerr { 1 }

#------------------------------

=item eof 

I<Instance method.>  Are we at end of file?

=cut

sub eof {
    my $self = shift;
    return unless ref($self) eq 'IO::Scalar';
    ($self->{Pos} >= length(${$self->{SR}}));
}

#------------------------------

=item seek OFFSET, WHENCE

I<Instance method.>  Seek to a given position in the stream.

=cut

sub seek {
    my ($self, $pos, $whence) = @_;
    my $eofpos = length(${$self->{SR}});

    # Seek:
    if    ($whence == 0) { $self->{Pos} = $pos }             # SEEK_SET
    elsif ($whence == 1) { $self->{Pos} += $pos }            # SEEK_CUR
    elsif ($whence == 2) { $self->{Pos} = $eofpos + $pos}    # SEEK_END
    else                 { die "bad seek whence ($whence)" }

    # Fixup:
    if ($self->{Pos} < 0)       { $self->{Pos} = 0 }
    if ($self->{Pos} > $eofpos) { $self->{Pos} = $eofpos }
    1;
}

#------------------------------

=item tell

I<Instance method.>
Return the current position in the stream, as a numeric offset.

=cut

sub tell { shift->{Pos} }

#------------------------------

=item setpos POS

I<Instance method.>
Set the current position, using the opaque value returned by C<getpos()>.

=cut

sub setpos { shift->seek($_[0],0) }

#------------------------------

=item getpos 

I<Instance method.>
Return the current position in the string, as an opaque object.

=cut

*getpos = \&tell;


#------------------------------

=item sref

I<Instance method.>
Return a reference to the underlying scalar.

=cut

sub sref { shift->{SR} }


#------------------------------
# Tied handle methods...
#------------------------------

# Conventional tiehandle interface:
sub TIEHANDLE { shift->new(@_) }
sub GETC      { shift->getc(@_) }
sub PRINT     { shift->print(@_) }
sub PRINTF    { shift->print(sprintf(shift, @_)) }
sub READ      { shift->read(@_) }
sub READLINE  { wantarray ? shift->getlines(@_) : shift->getline(@_) }

#------------------------------------------------------------

1;
__END__



=back

=cut

=head1 VERSION

$Id: Scalar.pm 1393 2005-06-14 15:55:21Z cloyce $


=head1 AUTHOR

Eryq (F<eryq@zeegee.com>).
President, ZeeGee Software Inc (F<http://www.zeegee.com>).

Thanks to Andy Glew for contributing C<getc()>.

Thanks to Brandon Browning for suggesting C<opened()>.

Thanks to David Richter for finding and fixing the bug in C<PRINTF()>.

=cut

