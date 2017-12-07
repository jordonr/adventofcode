#!/usr/bin/perl
use Data::Dumper;
# ***
# For example, given the following spreadsheet:
# 5 1 9 5
# 7 5 3
# 2 4 6 8
# The first row's largest and smallest values are 9 and 1, and their difference is 8.
# The second row's largest and smallest values are 7 and 3, and their difference is 4.
# The third row's difference is 6.
# In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.
# ***

my $inputPath = "./inputs/day2.txt";
my $checksum = 0;

open(my $ih, '<:encoding(UTF-8)', $inputPath) or die "Could not open file '$inputPath' $!";

while(my $row = <$ih>) {

    my @colVals = sort { $a <=> $b } split(/\s+/, $row);
    $checksum += abs(@colVals[0] - @colVals[-1]);
}

print "="x20 . "\n";
print "Part 1: $checksum\n";
print "="x20 . "\n";