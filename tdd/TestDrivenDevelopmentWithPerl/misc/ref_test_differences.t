
use warnings;
use strict;
use Test::More qw(no_plan);
use Test::Differences;

my $expected = {
  name => 'Josh',
  pets => [qw( ella ginger)]
};

my $got = bless {%$expected}, 'Person';
$got->{name} = 'Heather';

eq_or_diff $got, $expected, 'Structures are different';

