use Test::More qw(no_plan);
use Test::Deep;

my $obj = bless { name => 'x' }, 'Thing';

cmp_deeply( $obj,
  all( isa('Thing'),
  noclass( subhashof( { name => 'x', rank => 'y' } )
  ) ) );

cmp_deeply( $obj, any( isa('Thing'), isa('OthreThing') ) );
 
