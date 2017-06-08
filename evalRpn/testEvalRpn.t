#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature 'say';

require("evalRpn.pl");

my @x = tokenize("1+22+333");
my @y = ('1','22','333');
is( tokenize("1+22+333"), @y, 'OK');

is( @x, @y, 'OK');

@x = tokenize("1+22");
@y = ('1','22');
is( @x, @y, 'OK');

done_testing();