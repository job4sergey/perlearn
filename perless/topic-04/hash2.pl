#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';
use Data::Dump 'pp';
#use Teach::Tutor; # Don't forget to call: submit(<variable>);

my %person = (
    'Action', 'Says',
    'Height', '190cm',
    'Name', 'Simon',
    'Subject','Wash your hands!',
    'Weight' ,'75kg'
);

my $key = $ARGV[0];
say($person{$key});
submit(%person);