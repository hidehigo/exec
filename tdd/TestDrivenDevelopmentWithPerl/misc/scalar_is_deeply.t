
use Test::More qw(no_plan);

my $expected = 'This is a multiline
string of text
taht is not the easiest thing to
display';

my $got = $expected;
substr($got, 12, 1) = 'i';

is $got, $expected, 'The are who we thoght they were';

