use feature("say");

my %first = (
    key1 => "value1",
    key2 => "value2",
);
my %second = (
    'key3', "value3",
    'key4', "value4",
);
my %third = qw(key5 value5 key6 value6);
my %all = (%first, %second, %third);

my $href = \%all;
my $href2 = {
    key1 => "value1",
    key2 => "value2",
};

say 1;