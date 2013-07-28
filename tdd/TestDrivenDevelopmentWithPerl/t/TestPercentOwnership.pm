package TestPercentOwnership;

use warnings;
use strict;
use base qw(Test::Class);
use Test::More;

__PACKAGE__->runtests unless caller;

#sub startup_test : Test( startup => 2 ) {
sub startup_test : Test( 2 ) {
  use_ok( 'PercentOwnership' );
  can_ok( 'PercentOwnership', 'new' );
}

1;

