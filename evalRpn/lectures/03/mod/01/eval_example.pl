#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use feature "say";

my $a = 122;
my $b = 2;

my $code = <<CODE;
    warn "Loading...\n";
    sub pow { $_[0] ** $_[1]; }
    $E = 2.71828183;
    my $PI = 3.14159265;
    sub pi { $PI }
CODE

my $e = eval("
    $a*$b;
"
);
say $e;



