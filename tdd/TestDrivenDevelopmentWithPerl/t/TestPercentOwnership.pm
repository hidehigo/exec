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

sub multiple_floors : Test(2) {
  my ($self) = @_;

  $self->unit_adder( @{$_} )
      for ( [ 101, 500, 1 ], [201, 500, 2] );

  is(
    $self->{po}->percent_ownership( unit_number => 101 ),
    49.75,
    'multiple floors - 101'
  );

  is(
    $self->{po}->percent_ownership( unit_number => 201 ),
    50.25,
    'multiple floors - 201'
  );
}

sub basement_units : Test(2) {
  my ($self) = @_;
  $self->unit_adder( @{$_} ) for ( ['001', 500, 0], ['101', 500, 1], );

  is(
    $self->{po}->percent_ownership( unit_number => '001' ),
    49.75,
    'basement units - 001'
  );

  is(
    $self->{po}->percent_ownership( unit_number => '101' ),
    50.25,
    'basement units - 101'
  );
}

sub subbasement_units : Test(2) {
  my ($self) = @_;
  $self->unit_adder( @{$_} ) for ( ['001', 500, -1], ['101', 500, 1], );

  is(
    $self->{po}->percent_ownership( unit_number => '001' ),
    49.75,
    'basement units - 001'
  );

  is(
    $self->{po}->percent_ownership( unit_number => '101' ),
    50.25,
    'basement units - 101'
  );
}

sub non_existant_unit : Test(1) {
  my ($self) = @_;
  $self->unit_adder( 100, 500, 1 );
  is(
    $self->{po}->percent_ownership( unit_number => 0 ),
    undef,
    'return undef for non-existant units'
  );
}

sub add_unit_with_no_arguments : Test(1) {
  my ($self) = @_;
  is(
    $self->{po}->add_unit,
    undef,
    'no arguments provided to add_unit'
  );
}

sub percent_ownership_with_no_arguments : Test(1) {
  my ($self) = @_;
  $self->unit_adder( 100, 500, 1 );
  is(
    $self->{po}->percent_ownership,
    undef,
    'no arguments provided to percent_ownership'
  );
}

sub add_unit_with_invalid_square_footage : Test(1) {
  my ($self) = @_;
  is(
    $self->unit_adder( 100, -500, 1 ),
    undef,
    'negative square footage'
  );
}

sub add_unit_with_string_square_footage : Test(1) {
  my ($self) = @_;
  is(
    $self->unit_adder( 100, 'oops', 1 ),
    undef,
    'string square footage'
  );
}
1;

