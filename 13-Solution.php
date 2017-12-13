#!/usr/bin/php
<?php
/*
Wrong:
4268
4236
174
172
*/
$inputPath = "./inputs/day13.txt";
//$inputPath = "./inputs/temp.txt";

$lines = file($inputPath);
$pInput = parseInput($lines);
$severity = 0;
$wait = 0;
$test = 1;


while($test != 0) {
    $result = runThrough($pInput, $wait);
    if($wait == 0 || $result['caught'] == 0) {
        print "Wait $wait: Severity = " . $result['severity'] . ", Caught = " . $result['caught'] . "\n";
    }

    $test = $result['caught'];
    
    $wait++;
}

function parseInput($data) {
    $retStruct = [];

    foreach($data as $line) {
        $temp = explode(': ', $line);
        $retStruct[(int) $temp[0]] = (int) $temp[1];
    }

    return $retStruct;
}

function runThrough($firewall, $delay) {
    $severity = 0;
    $caught = 0;

    foreach($firewall as $depth => $range) {
        if(($depth+$delay) % (2 * ($range-1)) == 0) {
            $severity += $range * $depth;
            $caught++;
        }
    }

    return ["severity" => $severity, "caught" => $caught];
}