# arrays

my @av1 = (4,8,15,16,23,42);
my @av2 = ('q','w','e');
my @av3 = (1,2,3,'q','w','e');
my @digits = 0..9;

my @simple = qw(a b c); # ('a','b','c')

my @array = (1,2,3,@simple,4,5);
my @array2 = (1,2,3,'a','b','c',4,5);

my $aref = \@array; # take ref
my $aref2 = [1,2,3,@simple,4,5]; # anon ref

my $aref4 = [@array]; # copy + anon ref
my $aref3 = [ (@array) ]; # av->list, list->aref