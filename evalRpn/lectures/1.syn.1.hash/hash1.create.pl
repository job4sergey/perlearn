use Data::Dumper;
use feature("say");

my @array = qw(key1 val1 key2 val2);

my %hash = @array;
say Dumper \%hash;
#
#
my $aref = [qw(key1 val1 key2 val2)];
#my %hash2 = `@{`$aref`}`;
#
my $hashref = { @array };
#my $hashref = { @{$aref} };

my $code_ref  = sub {
		print 111; 
	 };

$code_ref->(%hash);