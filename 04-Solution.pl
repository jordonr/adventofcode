#!/usr/bin/perl
use Data::Dumper;
# ***
# Part 1 -
# For example:
# aa bb cc dd ee is valid.
# aa bb cc dd aa is not valid - the word aa appears more than once.
# aa bb cc dd aaa is valid - aa and aaa count as different words.
# ***

my $inputPath = "./inputs/day4.txt";
my $valid = 0;

open(my $ih, '<:encoding(UTF-8)', $inputPath) or die "Could not open file '$inputPath' $!";
my @lines = <$ih>;

for my $row (@lines) {
    my @colVals = split(/\s/, $row);
    my $count = 0;
    my $numWords = @colVals;

    for($i=0; $i<$numWords; $i++) {
        for($j=$i+1; $j<$numWords; $j++) {
            if(@colVals[$i] eq @colVals[$j]) {
                $count++;
            }
        }
    }

    if($count == 0) {
        $valid++;
    }


}

print "="x20 . "\n";
print "Part 1: $valid\n";
print "="x20 . "\n";
