use warnings;
use strict;
use Test::More tests => 4;

BEGIN { use_ok('PercentOwnership'); }

can_ok ( 'PercentOwnership', 'new' );
my $po = PercentOwnership->new();
isa_ok( $po, 'PercentOwnership' );

can_ok ( $po, qw(add_unit percent_ownership) );
