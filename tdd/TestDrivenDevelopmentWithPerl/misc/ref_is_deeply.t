
use warnings;
use strict;
use Test::More qw(no_plan);

my $expected = {
  name => 'Josh',
  pets => [qw( ella ginger)]
};

my $got = bless {%$expected}, 'Person';
$got->{name} = 'Heather';

is $got, $expected, 'Structures are different';

