# Mail::Util.pm
#
# Copyright (c) 1995-7 Graham Barr <gbarr@pobox.com>. All rights reserved.
# This program is free software; you can redistribute it and/or
# modify it under the same terms as Perl itself.

package Mail::Util;
#use strict;

#use vars qw($VERSION @ISA @EXPORT_OK);

#use Carp;
require Exporter;
$VERSION = "1.11";
@ISA	= qw(Exporter);
@EXPORT	= qw(read_random_mbox read_random_mbox_msgs);

BEGIN {
    require 5.000;

    $VERSION = "1.14";

}

1;

sub Version { $VERSION }

=head1 NAME

Mail::Util - mail utility functions

=head1 SYNOPSIS

use Mail::Util qw( ... );

=head1 DESCRIPTION

This package provides several mail related utility functions. Any function
required must by explicitly listed on the use line to be exported into
the calling package.

=head2 read_mbox( $file )

Read C<$file>, a binmail mailbox file, and return a list of  references.
Each reference is a reference to an array containg one message.

=head1 AUTHOR

Graham Barr <gbarr@pobox.com>

=head1 COPYRIGHT

Copyright (c) 1995-8 Graham Barr. All rights reserved. This program is free
software; you can redistribute it and/or modify it under the same terms
as Perl itself.

=cut

sub read_random_mbox;
# This wasn't part of the original Mail::Util, but this seemed like a nice
# place to put it.
sub read_random_mbox_msgs;    

sub read_random_mbox {
 my @mail  = ();
 my $mail  = [];
 my $blank = 1;

 local $_;

 while(defined($_ = &::get_msg_line)) {
  if($blank && /\AFrom .*\d{4}/) {
   push(@mail, $mail) if scalar(@{$mail});
   $mail = [ $_ ];
   $blank = 0;
  }
  else {
   $blank = m#\A\Z#o ? 1 : 0;
   push(@{$mail}, $_);
  }
 }

 push(@mail, $mail) if scalar(@{$mail});

 return wantarray ? @mail : \@mail;
}

sub read_random_mbox_msgs {
 my @mail  = ();
 my $mail  = '';
 my $blank = 1;

 local $_;

 while(defined($_ = &::get_msg_line)) {
  if($blank && /\AFrom .*\d{4}/) {
   push @mail, $mail if ($mail ne '');
   $mail = $_;
   $blank = 0;
  }
  else {
   $blank = m#\A\Z#o ? 1 : 0;
   $mail .= $_;
  }
 }

 push @mail, $mail if ($mail ne '');

 return wantarray ? @mail : \@mail;
}

