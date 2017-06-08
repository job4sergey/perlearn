use strict;
use warnings FATAL => 'all';

use feature qw(say);

open my $in, "<", "text.txt";

my $line;
my @parts;
my %wc = ();

while ($line = <$in>)
{
    chomp $line;
    @parts = split(/\W+/, $line);
    foreach my $p (@parts)
    {
        if (!exists($wc{$p})) {
            $wc{$p} = 1;
        }
        else {
            my $cnt = $wc{$p};
            $cnt = $cnt + 1;
            $wc{$p} = $cnt;
        }
    }
#    print join(' ', @parts),"\n";
}
close ($in);

my @words = sort(keys(%wc));

foreach my $word (@words) {
    print $word, ":", $wc{$word}, "\n";
}

say qw(hello bye )