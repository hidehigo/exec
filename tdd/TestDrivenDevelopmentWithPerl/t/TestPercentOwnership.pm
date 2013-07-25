package TestPercentOwnership;

use warnings;
use strict;
use base qw(Test::Class);
use Test::More;

__PACKAGE__->runtests unless caller;

sub my_test : Test {
  pass;
}

1;

