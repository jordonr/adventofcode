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

foreach($pInput as $depth => $range) {
    if($depth % (2 * ($range-1)) == 0) {
        $severity += $range * $depth;
    }
}

print "Part 1: $severity\n";

function parseInput($data) {
    $retStruct = [];

    foreach($data as $line) {
        $temp = explode(': ', $line);
        $retStruct[(int) $temp[0]] = (int) $temp[1];
    }

    return $retStruct;
}