use Data::Dumper;
use feature("say");

my @array = ();
my @array2;      # better

$array[0] = 1;
$array[1] = 2;
$array[7] = 5;

say $#array; # 7
say $array[`-1`]; # 5


say Dumper \@array;
# [1,2,undef,undef,undef,undef,undef,5]

