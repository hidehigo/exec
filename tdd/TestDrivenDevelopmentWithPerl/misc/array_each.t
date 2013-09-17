use warnings;
use strict;
use Test::More qw(no_plan);
use Test::Deep;

cmp_deeply( [ 1, 2, 3 ], array_each( bool(1) ) );

