use Test::More qw(no_plan);
use Test::Deep;

ARRAY: {
    my $got = [qw(one two three)];
    my $expected = [qw(one two), ignore()];
    cmp_deeply( $got, $expected, 'deeply compared array' );
}

HASH: {
    my $got = { one => 1, two => 2, three => 3 };
    my $expected = { one => 1, two => ignore(), three => 3 };
    cmp_deeply( $got , $expected, 'deeply compared hash' );
}
