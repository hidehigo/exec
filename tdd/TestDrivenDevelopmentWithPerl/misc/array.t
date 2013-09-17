use Test::More qw(no_plan);
use Test::Deep;

cmp_deeply( [1, 1, 2, 2 ], bag( 2, 1, 2, 1 ), 'bag of numbers');
cmp_deeply( [1, 1, 2, 2, 3 ], superbagof( 2, 1, 2, 1 ), 'super-bag of numbers' );
cmp_deeply( [1, 1 ], subbagof( 2, 1, 2, 1 ), 'sub-bag of numbers' );
cmp_deeply( [1, 1, 2, 2 ], set( 1, 2 ), 'set of numbers' );
cmp_deeply( [1, 1, 2, 2, 3 ], supersetof( 1, 2 ), 'super-set of numbers' );
cmp_deeply( [1, 1, 2, 2 ], subsetof( 1, 2, 3 ), 'sub-set of numbers' );
