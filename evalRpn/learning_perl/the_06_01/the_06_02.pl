use Data::Dumper;

#print Dumper(@INC);

my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @skipper_with_name = ("Skipper", \@skipper);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @professor_with_name = ("Professor", \@professor);
my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
my @gilligan_with_name = ("Gilligan", \@gilligan);

my @all_with_names = (
  \@skipper_with_name,
  \@professor_with_name,
  \@gilligan_with_name,
);

for my $person (@all_with_names) {
  my $who = $$person[0];
  my $provisions_reference = $$person[1];
  
  print $who, " ", $provisions_reference;
#  check_required_items($who, $provisions_reference);
}

print Dumper(@all_with_names);