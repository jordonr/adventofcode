#!/usr/bin/perl
# ***
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
my $total = 0;

open(my $ih, '<:encoding(UTF-8)', $inputPath) or die "Could not open file '$inputPath' $!";
my $inputData = <$ih>;
close($ih);

$firstChar = substr($inputData, 0, 1);

my @strValues = split(//, $inputData);

foreach my $char (@strValues) {
    if($char eq $prevChar) {
        $total += $char;
    }

    $prevChar = $char;
}

if($firstChar eq $prevChar) {
    $total += $prevChar;
}

print "="x20 . "\n";
print $total . "\n";
print "="x20 . "\n";