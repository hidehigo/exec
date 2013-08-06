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

  my $adjusted_building_size = sum map {
    $self->{unit_info}->{$_}->{square_footage} * sprintf( "1.%02d", $self->{unit_info}->{$_}->{floor} )
    } keys %{ $self->{unit_info} };
  return unless exists $self->{unit_info}->{ $args{unit_number} };

  my $adjusted_unit_size = 
    $self->{unit_info}->{ $args{unit_number} }->{square_footage} * sprintf( "1.%02d", $self->{unit_info}->{  $args{unit_number}}->{floor} );

    return sprintf ( "%0.4f", $adjusted_unit_size / $adjusted_building_size ) * 100;
}

1;
