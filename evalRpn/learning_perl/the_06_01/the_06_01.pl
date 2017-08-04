use Data::Dumper;

while (defined($_ = <STDIN>)) {
  print Dumper(@INC);
  print "\n";
  print "I saw $_";
}