#/usr/bin/perl
use strict;

#start = Time.now
my @primes = (2, 3, 5, 7);
my $loop_cnt = 0;
my $loop_cnt2 = 0;
my $loop_cnt3 = 0;
my $sum = 2 + 3 + 5 + 7;

## 素数の候補を返す。30(2*3*5)で割った余りが以下のものが素数の候補
my @pc = (1, 7, 11, 13, 17, 19, 23, 29,
       31); #←繰り上がり対応用

sub next_prime_candidate {
  my $now = shift;
  my $mod = $now % 30;
  my $idx;
  for ( my $i=0; $i<=@pc; $i++) {
    if ( $pc[$i] == $mod ) {
      $idx = $i;
      last;
    }
  }
  return $now - $mod + $pc[$idx + 1]
}

sub is_prime {
  my $n = shift;
  foreach my $p (@primes) {
    last if $p * $p > $n;
    $loop_cnt ++;
    return 0 unless $n % $p;
  }
  for (my $i = $primes[-1]; $i < $n; $i ++) {
    $loop_cnt2 ++;
    return 1 if $i * $i > $n;
    return 0 unless $n % $i;
  }
  return 0;
}

my $n = 8;
while (@primes < 10000) {
  $loop_cnt3 ++;
  if ( is_prime($n) ) {
    push(@primes, $n);
    $sum += $n;
    $n = next_prime_candidate($n);
    next;
  }
  $n ++;
}

#print $primes[-1]."\n";
print $sum."\n";
#print "loop_cnt: $loop_cnt\n";
#print "loop_cnt: $loop_cnt2\n";
#print "loop_cnt: $loop_cnt3\n";
#print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
