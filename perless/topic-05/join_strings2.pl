#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

sub join_args {
    my ($s1, $s2) =  @_;
    return $s1 . ' ' . $s2;
}

say 'Calling with variables as arguments';
my $x = "foo"; my $y = "bar";
say "x is $x";
say join_args($x, $y);
say "x is now $x";

say 'Calling with scalars as arguments';
say join_args("this", "that");

