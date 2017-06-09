#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use feature 'say';

my %wc = ();

$wc{"aa"} = 777;

say $wc{"aa"};

say join(',',split(/\D+/, "1 2 333"));

my @anotherArray = (1, 2, 3, 4, 5);

say $anotherArray[-1] . "--";

print "Third way: ";

push @anotherArray, 6;

while (@anotherArray) {
    my $xx = pop @anotherArray;
    print $xx;
#    last if $xx % 2 == 0;
}