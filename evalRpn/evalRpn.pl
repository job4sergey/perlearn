#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub tokenize{
    my ($s) = @_;

    split(/\D+/, $s);
};

sub toRpn{
    my ($s) = @_;
    my @tokens = tokenize($s);

    my %oper2Priority = ();
    $oper2Priority{"/"} = 1;
    $oper2Priority{"*"} = 1;
    $oper2Priority{"-"} = 0;
    $oper2Priority{"+"} = 0;

#    List<String> tokenzRpn = new ArrayList<String>();
#    Stack<String> opers = new Stack<String>();

    my @tokenzRpn;
    my @opers;

    foreach $t (@tokens) {
        if (exists($oper2Priority{$t})) {
            my $priority = $oper2Priority{$t};
            while (@opers) {
            }
        }
        elsif ($t eq '(') {

        }
        elsif ($t eq ')') {

        }
        else {
        }
    }

    while (@opers) {
        my $t = pop @opers;
        if (($t eq '(') || ($t eq ')')) {
            die "Syntax err";
        }
        push @tokenzRpn, $t;
    }
}

1;