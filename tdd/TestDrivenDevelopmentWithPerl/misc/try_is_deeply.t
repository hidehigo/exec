use warnings;
use strict;

package ClassA;
sub new {
  my ($class) = @_;
  my $a = "ohoho";
  my $self = bless { "hoge" => $a };
  return $self;
}

package ClassB;
sub new {
  my ($class) = @_;
  my $b = "ohoho";
  my $self = bless { "hoge" => $b };
  return $self;
}


use Test::More tests => 1;
my $a = ClassA->new;
my $b = ClassB->new;

is_deeply( $a, $b, "compare different class");
