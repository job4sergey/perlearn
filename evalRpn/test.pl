#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub tokenize {
	my ($word) = @_;
	
	for ( my $key = 0 ; $key < length($word) ; $key++ ) {
		print substr( $word, $key, 1 ) . "\n";
	}
}

print $ARGV[0],"\n";

tokenize("abvc");

#strings

my $one    = "string";
my $two    = 'quoted';
my $wrap   = "wrapped
           string";
my $join   = "prefix:$one\r\n";

my $q_1    = q/single-'quoted'/;
my $qq_2   = qq(double-"quoted"-$two);
my $smile  = ":) -> \x{263A}";

my $here   = <<END;
some data
END

my $ver    = v1.2.3.599;


