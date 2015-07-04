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
my $fl = shift(@f);
my $s2;
while ( $fl * 3 >= $s) {
	$s2 = $s - $fl;
	my @ff = @f;
	my $fm = shift(@ff);
	my $fn = pop(@ff);
	while ( $fn && $fm > $fn ) {
		my $ss = $fm + $fn;
		if ( $ss >= $s2 ) {
			if ( $ss == $s2 ) {
				$found ++;
			}
			$fm = shift(@ff);
		} else {
			$fn = pop(@ff);
		}
	}
	$fl = shift(@f);
}

print $found."\n";
printf("%0.3f",Time::HiRes::time - $start); 

