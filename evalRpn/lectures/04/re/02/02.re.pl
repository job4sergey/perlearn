#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use feature "say";

sub test
{
    my ($self) = @_;

    my $string = "sample string";

    $string =~  /sample/;
    $string =~ m/sample/;
    $string =~ m(sample);
}

sub test2
{
    my ($self) = @_;

    my @samples = ("my sample one","my sample two","my sample2 one");

    my @res;

    for (@samples) {
        /sample/;
        # same as $_ =~ /sample/;
        if (m/sample/) {
            push @res, $_
        }
        # if ($_ =~ /sample/) { ... }
    }

    join ":::",@res;
}

sub test3
{
    my ($self) = @_;

    my $string = "sample string";

#    $string =~ s/sample/item/;
    $string =~ s{sample}{item};
#    $string =~ s{sample}
#        (item);

    $string;
}

sub test4
{
    my ($self) = @_;

    my $s = "sample\nstring";

#    $s =~ /^(.+)$/;    # no match
#    $s =~ /^(.+)$/m;   # "sample"
    $s =~ /^(.+)$/ms;  # "sample\nstring"

    if ($1){
        $1;
    }
    else {
        "no match";
    }
}

say test4();
