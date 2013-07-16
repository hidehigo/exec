use warnings;
use strict;
use Test::More tests => 12;

BEGIN { use_ok('PercentOwnership'); }

can_ok ( 'PercentOwnership', 'new' );

SINGLE_UNIT: {
  my $po = PercentOwnership->new();
  isa_ok( $po, 'PercentOwnership' );

  can_ok ( $po, qw(add_unit percent_ownership) );

  ok ( $po->add_unit(
          unit_number    => 101,
          square_footage => 450,
          floor          => 1,
  ), 'unit added successfully');

  is (
    $po->percent_ownership( unit_number => 101 ),
    100,
    'single unit condo'
  );
}

TWO_UNITS: {
  my $po = PercentOwnership->new();
  isa_ok( $po, 'PercentOwnership' );

  can_ok ( $po, qw(add_unit percent_ownership) );

  ok ( $po->add_unit(
          unit_number    => 101,
          square_footage => 450,
          floor          => 1,
  ), 'first unit added successfully');

  ok ( $po->add_unit(
          unit_number    => 102,
          square_footage => 450,
          floor          => 1,
  ), 'second unit added successfully');

  is (
    $po->percent_ownership( unit_number => 101 ),
    50,
    '50/50 ownership split for unit 101'
  );

  is (
    $po->percent_ownership( unit_number => 102 ),
    50,
    '50/50 ownership split for unit 102'
  );
}

