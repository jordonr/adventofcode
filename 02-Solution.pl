#!/usr/bin/perl
use Data::Dumper;
# ***
# Part 1 -
# 1  = add
# 2  = multiply
# 99 = halt
# Chunks of 4
# For example:
# 1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
# 2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
# 2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
# 1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.

# Once you have a working computer, the first step is to restore the gravity assist program (your puzzle input) to the "1202 program alarm" 
# state it had just before the last computer caught fire. To do this, before running the program, replace position 1 with the value 12 and 
# replace position 2 with the value 2. What value is left at position 0 after the program halts?
# ***

my $inputPath = "./inputs/Day02.txt";
my $output = "";
my $answer = "";

open(my $ih, '<:encoding(UTF-8)', $inputPath) or die "Could not open file '$inputPath' $!";
my $inputData = <$ih>;
close($ih);

chomp $inputData;
#$inputData = "1,1,1,4,99,5,6,0,99"; #Test Data

my @intCodeValues = split(/,/, $inputData);
@strValues = @intCodeValues;
@strValues[1] = 12;
@strValues[2] = 2;

$output = runIntCode(@strValues);

print "="x20 . "\n";
print "Part 1: $output\n";
print "="x20 . "\n";

$answer = processIntCode(@intCodeValues);
print "="x20 . "\n";
print "Part 2: $answer\n";
print "="x20 . "\n";


sub runIntCode {
    my @intCode = @_;
    my $opsCode = 0;
    my $location = 0;

    while($opsCode != 99) {
        $opsCode = @intCode[$location];

        if($opsCode == 1) {
            @intCode[@intCode[$location+3]] = @intCode[@intCode[$location+1]] + @intCode[@intCode[$location+2]];
        } elsif ($opsCode == 2) {
            @intCode[@intCode[$location+3]] = @intCode[@intCode[$location+1]] * @intCode[@intCode[$location+2]];
        }

        $location += 4;
    }

    return @intCode[0];
}

sub processIntCode {
    my $output = "";

    for($n=0; $n<=99; $n++) {
        @intCodeValues[1] = $n;
        for($v=0; $v<=99; $v++) {
            @intCodeValues[2] = $v;

            $output = runIntCode(@intCodeValues);

            if ($output == 19690720) {
                return "Found it: 100*$n+$v = " . (100*$n+$v);
            }
        }
    }
}
