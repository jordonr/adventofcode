#!/usr/bin/php
<?php

$inputPath = "./inputs/day5.txt";
//$inputPath = "./inputs/temp.txt";

$lines = file($inputPath);

$inputs = array_map(function($v) {
    return (int) $v;
}, $lines);

$index = 0;
$c = 0;
$temp = 0;
$instrLen = count($inputs);

while($index >= 0 && $index < $instrLen) {
    $temp = $inputs[$index];
    echo "$c: $index => $temp\n";
    $inputs[$index]++;
    $index += $temp;
    $c++;
}

print $c;