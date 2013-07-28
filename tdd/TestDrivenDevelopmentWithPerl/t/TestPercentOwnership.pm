package TestPercentOwnership;

use warnings;
use strict;
use base qw(Test::Class);
use Test::More;
use PercentOwnership;

__PACKAGE__->runtests unless caller;

#sub startup_test : Test( startup => 2 ) {
sub startup_test : Test( 2 ) {
  use_ok( 'PercentOwnership' );
  can_ok( 'PercentOwnership', 'new' );
}

sub single_unit : Test(4) {
  my ($self) = @_;
  my $po = PercentOwnership->new();
  isa_ok( $po, 'PercentOwnership' );
  can_ok( 'PercentOwnership', qw( add_unit percent_ownership ) );

  ok(
    $po->add_unit(
      unit_number  => 101,
      square_footage => 450,
      floor => 1.
    ), 'added sigle unit'
  );

  is( $po->percent_ownership( unit_number => 101 ), 100,
   'single unit condo' );
}

1;

