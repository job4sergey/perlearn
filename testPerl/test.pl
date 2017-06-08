#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use feature 'say';

my %wc = ();

$wc{"aa"} = 777;

say $wc{"aa"};

say join(',',split(/\D+/, "1 2 333"));

my @anotherArray = (1, 2, 3, 4, 5);

print "Third way: ";

while (@anotherArray) {
    print pop @anotherArray;
}