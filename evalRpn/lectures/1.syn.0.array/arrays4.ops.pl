use feature("say");

my @a;
push @a, 1;
push @a, 2,3,4;
my $x = pop @a;
my $x2 = shift @a;
unshift @a, 7,8;

my @array = (4,8,15,16,23,42);

while (my ($i,$v) = each @array) {
    say "$i: $v";                    # 0: 4
    $v++;                            # 1: 8
}                                    # 2: 15
                                     # 3: 16
say "@array";                        # 4: 23
# 4 8 15 16 23 42                    # 5: 42