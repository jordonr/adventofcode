#!/usr/bin/php
<?php

$inputPath = "./inputs/day5.txt";

$lines = file($inputPath);

$inputs = array_map(function($v) {
    return (int) $v;
}, $lines);

$input2 = $inputs;

$index = 0;
$c = 0;
$temp = 0;
$instrLen = count($inputs);

while($index >= 0 && $index < $instrLen) {
    $temp = $inputs[$index];
    $inputs[$index]++;
    $index += $temp;
    $c++;
}

print "====================\n";
print $c;
print "\n====================\n";

$index = 0;
$c = 0;
$temp = 0;

while($index >= 0 && $index < $instrLen) {
    $temp = $input2[$index];
    $input2[$index] += ($temp >= 3 ? -1 : 1);
    $index += $temp;
    $c++;
}

print "====================\n";
print $c;
print "\n====================\n";
