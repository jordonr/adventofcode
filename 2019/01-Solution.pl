#!/usr/bin/perl
use Data::Dumper;
# ***
# Part 1 -
# For example:
# For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2.
# For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2.
# For a mass of 1969, the fuel required is 654.
# For a mass of 100756, the fuel required is 33583.
# ***

my $inputPath = "./inputs/Day01.txt";
my $totalMass = 0;

open(my $ih, '<:encoding(UTF-8)', $inputPath) or die "Could not open file '$inputPath' $!";
my @lines = <$ih>;
close $ih;

for my $mass (@lines) {
    $totalMass += int($mass / 3) - 2;
}

print "="x20 . "\n";
print "Part 1: $totalMass\n";
print "="x20 . "\n";

# ***
# Part 2 -
# For example:
# A module of mass 14 requires 2 fuel. This fuel requires no further fuel (2 divided by 3 and rounded down is 0, which would call for a negative fuel), so the total fuel required is still just 2.
# At first, a module of mass 1969 requires 654 fuel. Then, this fuel requires 216 more fuel (654 / 3 - 2). 216 then requires 70 more fuel, which requires 21 fuel, which requires 5 fuel, which requires no further fuel. So, the total fuel required for a module of mass 1969 is 654 + 216 + 70 + 21 + 5 = 966.
# The fuel required by a module of mass 100756 and its fuel is: 33583 + 11192 + 3728 + 1240 + 411 + 135 + 43 + 12 + 2 = 50346.
# ***

my $totalFuel = 0;
for my $mass (@lines) {
   $totalFuel += additionalFuleCalc($mass);
}

print "="x20 . "\n";
print "Part 2: $totalFuel\n";
print "="x20 . "\n";

sub additionalFuleCalc {
    my ($mass) = @_;
    my $fuelReq = int($mass / 3) - 2;

    if($fuelReq <= 0) {
        return 0;
    }

    return $fuelReq + additionalFuleCalc($fuelReq);
}
