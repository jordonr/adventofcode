#!/usr/bin/php
<?php
//This proves I'm bad at math and should increase my knowledge of the subject

$input = "0	5	10	0	11	14	13	4	11	8	8	7	1	4	12	11";
//$input = "0 2   7   0"; //test data

$prevStates = [];
$banks = preg_split("/\s+/", $input);
$dupState = FALSE;
$count = 0;
$tempState = '';

while(!$dupState) {
    $key = array_search(max($banks), $banks);

    $banks = spread($key, $banks);
    $tempState = join("", $banks);

    if(in_array($tempState, $prevStates)) {
        $dupState = TRUE;
    }

    $prevStates[] = $tempState;
    $count++;
}

print "Part 1: $count\n";
$diff = $count - (array_search($tempState, $prevStates)+1);
print "Part 2: " . $diff;

function spread($startKey, $memBanks) {
    $loops = $memBanks[$startKey];
    $memBanks[$startKey] = 0;

    $c = 1;
    while($loops > 0) {
        if(isset($memBanks[$startKey+$c])) {
            $memBanks[$startKey+$c]++;
        } else {
            $c = 0; 
            $startKey = 0;
            $memBanks[0]++;
        }

        $c++;
        $loops--;
    }

    return $memBanks;
}