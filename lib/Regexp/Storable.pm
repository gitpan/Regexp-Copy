package Regexp::Storable;

our $VERSION = '0.04';

package Regexp;


sub STORABLE_freeze {
  my $serialized = substr($_[0], rindex($_[0],':')+1, -1);
  return $serialized;
}

sub STORABLE_thaw {
  my ( $original, $cloning, $thaw ) = @_;
  return unless $thaw;
  my $final = qr/$thaw/;
  Regexp::Copy::re_copy($final, $original);
}

1;
