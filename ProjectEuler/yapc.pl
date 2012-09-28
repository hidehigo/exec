#/usr/bin/perl
use strict;
use List::Util qw(first sum);
use Time::HiRes;
#my $start = Time::HiRes::time;  

## 30以下の素数
my @primes = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29);
my $sum = sum @primes;
my $loop_cnt = 0;
my $loop_cnt2 = 0;
my $loop_cnt3 = 0;

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
  #return $now - $mod + first {$_ > $mod} @pc
}

sub is_prime {
  my $n = shift;
  my $sqrtn = int(sqrt($n));
  foreach my $p (@primes) {
    #$loop_cnt ++;
    return 1 if $p > $sqrtn;
    return 0 unless $n % $p;
  }
  return 0;
}

my $n = 31;
while (@primes < 10000) {
  #print $n."\n";
  #$loop_cnt3 ++;
  if ( is_prime($n) ) {
    push(@primes, $n);
    $sum += $n;
  }
  $n = next_prime_candidate($n);
  #print "next:".$n."\n";
}

#print $primes[-1]."\n";
print $sum."\n";
#print "loop_cnt: $loop_cnt\n";
#printf("%0.3f",Time::HiRes::time - $start); 
#print "loop_cnt: $loop_cnt2\n";
#print "loop_cnt: $loop_cnt3\n";
