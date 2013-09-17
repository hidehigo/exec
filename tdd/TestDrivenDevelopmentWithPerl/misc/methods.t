use Test::More qw(no_plan);
use Test::Deep;
use Test::MockObject;

my $obj = Test::MockObject->new();
$obj->mock( 'uc_it', sub { return uc $_[1] } );
$obj->mock( 'do_it', sub { return 1 } );

cmp_deeply( $obj,
  methods( do_it => 1, [qw(uc_it one)] => 'ONE' ));

