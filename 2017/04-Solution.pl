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

# ***
# Part 2 -
# For example:
# abcde fghij is a valid passphrase.
# abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
# a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
# iiii oiii ooii oooi oooo is valid.
# oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.
# ***

my $valid = 0;

for my $row (@lines) {
    my @colVals = split(/\s/, $row);
    my $count = 0;
    my $numWords = @colVals;
    my @sortedVals = &sortWords(@colVals);

    for($i=0; $i<$numWords; $i++) {
        for($j=$i+1; $j<$numWords; $j++) {
            if(@sortedVals[$i] eq @sortedVals[$j]) {
                $count++;
            }
        }
    }

    if($count == 0) {
        $valid++;
    }
}

sub sortWords {
    my @words = @_;
    my @sortedWords = ();

    my $c = 0;
    foreach my $w (@words) {
        push(@sortedWords, join('', sort(split(//, $w))));
        $c++;
    }

    return @sortedWords;
}

print "="x20 . "\n";
print "Part 2: $valid\n";
print "="x20 . "\n";