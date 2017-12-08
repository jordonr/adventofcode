#!/usr/bin/perl
use Data::Dumper;
# ***
# Part 1 -
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
my @lines = <$ih>;

for my $row (@lines) {
    my @colVals = sort { $a <=> $b } split(/\s+/, $row);
    $checksum += abs(@colVals[0] - @colVals[-1]);
}

print "="x20 . "\n";
print "Part 1: $checksum\n";
print "="x20 . "\n";

# ***
# Part 2 -
# For example, given the following spreadsheet:
# 5 9 2 8
# 9 4 7 3
# 3 8 6 5
# In the first row, the only two numbers that evenly divide are 8 and 2; the result of this division is 4.
# In the second row, the two numbers are 9 and 3; the result is 3.
# In the third row, the result is 2.
# In this example, the sum of the results would be 4 + 3 + 2 = 9.
# ***

my $total = 0;

for my $row (@lines) {
    my @colVals = sort { $a <=> $b } split(/\s+/, $row);
    my $loops = length(\@colVals);

    print "Length: $loops\n";

    for($i=0; $i<$loops; $i++) {
        for($j=0; $j<$loops; $j++) {
            
            if(@colVals[$i] != @colVals[$j] && @colVals[$j] != 0 && @colVals[$i] % @colVals[$j] == 0) {
                $total += @colVals[$i] / @colVals[$j];
                last;
            }
        }
    }
}

print "="x20 . "\n";
print "Part 2: $total\n";
print "="x20 . "\n";
