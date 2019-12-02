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
my $checksum = 0;

open(my $ih, '<:encoding(UTF-8)', $inputPath) or die "Could not open file '$inputPath' $!";
my @lines = <$ih>;
my $totalMass = 0;

for my $mass (@lines) {
    $totalMass += int($mass / 3) - 2;
}

print "="x20 . "\n";
print "Part 1: $totalMass\n";
print "="x20 . "\n";

# ***
# Part 2 -

# ***
