#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use feature 'say';

use FindBin;

require "$FindBin::Bin/./evalRpn.pl";

sub testEval
{
    my ($expression, $exptected) = @_;
    my $res = evalRPN(toRpn($expression));
    is( $res, $exptected, "$expression => $res");
}

my @x = tokenize("1+22+333");
my @y = ('1', '+', '22', '+', '333');
is( tokenize("1+22+333"), @y, 'OK');

is( @x, @y, 'OK');

@x = tokenize("1+22");
@y = ('1','+','22');
is( @x, @y, 'OK');

testEval("(2+3) *4", 20);

testEval("6 - 8 - 7", -9);
testEval("(6)-(8)-(7)+(1+(6))", -2);
testEval("1 - 2 + 3", 2);
testEval("((2+3)*4+(5-6)*7)-8", 5);
testEval("1 - 24 / 4 + 6", 1);
testEval("30 - 24 / 4 * 5 + 6", 6);
testEval("2 + 3", 5);
testEval("1+1", 2);
testEval("2", 2);
testEval("2 + 3 * 4 - 5", 9);
testEval("(2+3) *4", 20);
testEval("4 * (2+3)", 20);
testEval("4 * (2+3)- 4 * (2+3)", 0);
testEval("20 /5 + 20 / 5", 8);
testEval("( (2+3) *4+  (5-6) *7)-8", 5);
testEval("(1+ (4+5+2)-3)+ (6+8)", 23);
testEval("( ( (1+2)*9 - (3-4) ) + ( (5+6) - (7-8)*11 ) / 22 )", 29);

done_testing();