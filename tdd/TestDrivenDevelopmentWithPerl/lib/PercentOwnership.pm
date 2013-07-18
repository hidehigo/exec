package PercentOwnership;

use warnings;
use strict;
use List::Util qw(sum);

sub new {
  my ($class) = @_;
  my $self = bless {}, $class;
  return $self;
}

sub add_unit { 
  my ( $self, %unit_info ) = @_;

  $self->{unit_info}->{ $unit_info{unit_number} } = \%unit_info;
}

sub percent_ownership { 
  my ( $self, %args ) = @_;

  return unless exists $self->{unit_info}->{ $args{unit_number} };
  my $building_size = sum map {
    $self->{unit_info}->{$_}->{square_footage} }
    keys %{ $self->{unit_info} };

  my $unit_size = 
    $self->{unit_info}->{ $args{unit_number} }->{square_footage};

    return sprintf ( "%0.4f", $unit_size / $building_size ) * 100;
}

1;
