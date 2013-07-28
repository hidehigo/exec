package TestPercentOwnership;

use warnings;
use strict;
use base qw(Test::Class);
use Test::More;
use PercentOwnership;
use List::MoreUtils qw(pairwise);

our ( $a, $b );

__PACKAGE__->runtests unless caller;

sub unit_adder {
  my ( $self, @args ) = @_;
  my @arg_names = qw(unit_number square_footage floor);
  $self->{po}->add_unit(
    pairwise { ( $a, $b ) } @arg_names, @args );
}

sub startup_test : Test( startup => 2 ) {
  use_ok( 'PercentOwnership' );
  can_ok( 'PercentOwnership', 'new' );
}

sub setup_test : Test( setup => 2 ) {
  my ($self) = @_;
  $self->{po} = PercentOwnership->new();
  isa_ok( $self->{po}, 'PercentOwnership' );
  can_ok( $self->{po}, qw(add_unit percent_ownership) );
}

sub single_unit : Test(2) {
  my ($self) = @_;
  my $po = $self->{po};

  ok( $self->unit_adder( 101, 450, 1 ), 'added the only unit' );

  is( $po->percent_ownership( unit_number => 101 ), 100,
   'single unit condo' );
}

sub two_units : Test(4) {
  my ($self) = @_;
  my $po = $self->{po};

  ok( $self->unit_adder( 101, 450, 1 ), 'added the first unit' );
  ok( $self->unit_adder( 102, 450, 1 ), 'added the second unit' );

  is( $po->percent_ownership( unit_number => 101 ), 50,
   'unit 101 got the correct percentage' );
  
  is( $po->percent_ownership( unit_number => 102 ), 50,
   'unit 102 got the correct percentage' );
}


1;
