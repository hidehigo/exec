use Test::More qw(no_plan);
use Test::Deep;

cmp_deeply( { one => '1one' }, { one => num(1) }, 'num' );
cmp_deeply( { one => '1one' }, { one => str('1one') }, 'str' );
cmp_deeply( { one => '1one' }, { one => bool(1) }, 'bool' );
cmp_deeply( { one => '1one' }, { one => code( sub { $_[0] } ) }, 'code' );

