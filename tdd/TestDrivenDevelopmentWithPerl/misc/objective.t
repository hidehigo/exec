use Test::More qw(no_plan);
use Test::Deep;

cmp_deeply( bless( { name => 'x' }, 'Thing' ),
  isa('Thing'), 'looking at the isa' );
cmp_deeply(
  bless( { name => 'x' }, 'Thing' ),
  noclass( { name => 'x' } ),
  'classless compare'
);
cmp_deeply(
  bless( { name => bless( {}, 'Name' ) }, 'Thing' ),
  noclass( { name => useclass( bless( {}, 'Name' ) ) } ),
  'classless compare'
);

