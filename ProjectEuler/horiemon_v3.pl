#!/bin/env/perl

use strict;
use Time::HiRes;
my $start = Time::HiRes::time;  
use Data::Dumper;

my $s = <STDIN>; chomp($s);
my $num = <STDIN>; chomp($num);
my @f = ();
for ( my $i = 0; $i < $num; $i++ ) {
	my $n = <STDIN>;
	chomp($n);
	push (@f, $n);
}
@f = sort {$b <=> $a} @f;

printf("%0.3f",Time::HiRes::time - $start)."\n";

my $found = 0;
my $l = 0;
my $fl = $f[0];
my $s2;
while ( $fl * 3 >= $s) {
	$s2 = $s - $fl;
	my $m = $l + 1;
	my $n = $num - 1;
	my $fm = $f[$m];
	my $fn = $f[$n];
	while ( $m < $n ) {
		my $ss = $fm + $fn;
		if ( $ss >= $s2 ) {
			if ( $ss == $s2 ) {
				$found ++;
			}
			$m++;
			$fm = $f[$m];
		} else {
			$n--;
			$fn = $f[$n];
		}
	}
	$l ++;
	$fl = $f[$l];
}

print $found."\n";
printf("%0.3f",Time::HiRes::time - $start); 

