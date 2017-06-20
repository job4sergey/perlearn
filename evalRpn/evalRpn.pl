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
    
    my $state = 0; # ready
    my $current = "";
    my @tokens;
    
    for ( my $key = 0 ; $key < length($s) ; $key++ ) {
    	my $c = substr( $s, $key, 1 );
    	if ($c =~ /\s/) 
    	{
    		next;    		
    	}
    	
    	if ($state == 0) 
    	{
    		if ($c =~ /\d/) 
	    	{
	    		$state = 1;
	    		$current = $current.$c;
	    	}
	    	else 
	    	{
	    		push @tokens, $c;
	    	}
    	}
    	else 
    	{
    		if (!($c =~ /\d/))
    		{
    			$state = 0;
    			push @tokens, $current;
    			$current = "";
    			push @tokens, $c;
    		}
    		else 
    		{
    			$current = $current.$c;
    		}
    	}
	}
	
	if ($state == 1) 
	{
		push @tokens, $current;
	}
	
	@tokens;
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
                my $oper = pop @opers;
                if ("(" eq $oper)
                {
                    $isPopped = 1;
                    last;
                }
                else
                {
                    push @tokenzRpn, $oper;
                }
            }
            if (!$isPopped)
            {
                die "Syntax err";
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

sub evalRPN
{
	my (@tokens) = @_;
	my @rpn;
	
	foreach my $t (@tokens)
	{
		if (exists($oper2Priority{$t}))
        {
        	push @rpn, $t;
        }
        else
        {
        	push @rpn, 0+$t;
        }
	};

    while ($#rpn > 1)
    {
        my $j = 0;
        for my $i (0 .. $#rpn)
        {
            my $o = $rpn[$i];
            if (!($o =~ /\d+/))
            {
            	$j = $i;
                last;
            }
        }

        my $op = (splice @rpn, $j, 1)[0];
        my $operand2 = (splice @rpn, $j-1, 1)[0];
        my $operand1 = (splice @rpn, $j-2, 1)[0];

        my $result = 0;
        if ($op eq '+')
        {
            $result = $operand1 + $operand2;
        }
        elsif ($op eq '-')
        {
            $result = $operand1 - $operand2;
        }
        elsif ($op eq '*')
        {
            $result = $operand1 * $operand2;
        }
        elsif ($op eq '/')
        {
            $result = $operand1 / $operand2;
        }

        splice @rpn, $j-2, 0, $result;
    }

    $rpn[0];
}

#print evalRPN(toRpn("(2+3) *4"));

if ($#ARGV > -1)
{
	print evalRPN(toRpn($ARGV[0])), "\n";
}

1;