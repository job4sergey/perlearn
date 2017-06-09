#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my %oper2Priority = ();
$oper2Priority{"/"} = 1;
$oper2Priority{"*"} = 1;
$oper2Priority{"-"} = 0;
$oper2Priority{"+"} = 0;

sub tokenize
{
    my ($s) = @_;

    split(/\D+/, $s);
};

sub compareOpers
{
    my ($o1, $o2) = @_;
    return $oper2Priority{$o1} - $oper2Priority{$o2};
}

sub toRpn
{
    my ($s) = @_;
    my @tokens = tokenize($s);

    my @tokenzRpn;
    my @opers;

    foreach my $t (@tokens)
    {
        if (exists($oper2Priority{$t}))
        {
            while (@opers)
            {
                my $oper = $opers[-1];
                if (!("(" eq $oper))
                {
                    if (compareOpers($oper, $t) >= 0)
                    {
                        push @tokenzRpn, (pop @opers);
                    }
                    else
                    {
                        last;
                    }
                }
                else
                {
                    last;
                }
            }

            push @opers, $t;
        }
        elsif ($t eq '(')
        {
            push @opers, $t;
        }
        elsif ($t eq ')')
        {
            my $isPopped = 0;
            while (@opers)
            {
                my $oper = $opers[-1];
                if ("(" eq $oper)
                {
                    $isPopped = 1;
                    last;
                }
                else
                {
                    push @tokenzRpn, $oper;
                }

                if (!$isPopped)
                {
                    die "Syntax err";
                }
            }
        }
        else
        {
            push @tokenzRpn, $t;
        }
    }

    while (@opers) {
        my $t = pop @opers;
        if (($t eq '(') || ($t eq ')')) {
            die "Syntax err";
        }
        push @tokenzRpn, $t;
    }

    @tokenzRpn;
}

print toRpn("6 - 8 - 7");

1;