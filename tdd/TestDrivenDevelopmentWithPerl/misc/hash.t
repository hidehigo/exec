use Test::More qw(no_plan);
use Test::Deep;

cmp_deeply({ one => 1 }, subhashof({ two => 2, one => 1 }), 'sub-hash');
cmp_deeply({ one => 1, two => 2 }, superhashof( {one => 1} ), 'super-hash');
