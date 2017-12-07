#!/usr/bin/perl
# ***
# Part 1 -
# For example:
# 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
# 1111 produces 4 because each digit (all 1) matches the next.
# 1234 produces 0 because no digit matches the next.
# 91212129 produces 9 because the only digit that matches the next one is the last digit, 9.
# ***

my $inputPath = "./inputs/day1.txt";
my $test = '91212129';
my $firstChar = '';
my $prevChar = '';
my $partOneTotal = 0;

open(my $ih, '<:encoding(UTF-8)', $inputPath) or die "Could not open file '$inputPath' $!";
my $inputData = <$ih>;
close($ih);

$firstChar = substr($inputData, 0, 1);

my @strValues = split(//, $inputData);

foreach my $char (@strValues) {
    if($char eq $prevChar) {
        $partOneTotal += $char;
    }

    $prevChar = $char;
}

if($firstChar eq $prevChar) {
    $partOneTotal += $prevChar;
}

print "="x20 . "\n";
print "Part 1: $partOneTotal\n";
print "="x20 . "\n";

# ***
# Part 2 -
# Now, instead of considering the next digit, it wants you to consider the digit halfway around the circular list. 
# That is, if your list contains 10 items, only include a digit in your sum if the digit 10/2 = 5 steps forward matches it. 
# Fortunately, your list has an even number of elements.
#
# For example:
# 1212 produces 6: the list contains 4 items, and all four digits match the digit 2 items ahead.
# 1221 produces 0, because every comparison is between a 1 and a 2.
# 123425 produces 4, because both 2s match each other, but no other digit has a match.
# 123123 produces 12.
# 12131415 produces 4.
# ***

my $partTwoTotal = 0;
my $dataLength = length($inputData);
my $lookAhead = $dataLength / 2;
my $curChar = '';
my $testChar = '';

for(my $i=0; $i < $dataLength; $i++) {
    $curChar = substr($inputData, $i, 1);
    $lookAheadIndex = $i+$lookAhead;

    if($lookAheadIndex >= $dataLength) {
        $lookAheadIndex = $lookAheadIndex - $dataLength;
    }

    $testChar = substr($inputData, $lookAheadIndex, 1);

    if($curChar eq $testChar) {
        $partTwoTotal += $curChar;
    }
}

print "="x20 . "\n";
print "Part 2: $partTwoTotal\n";
print "="x20 . "\n";
