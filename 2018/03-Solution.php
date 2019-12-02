#!/usr/bin/env php
<?php

$inputPath = "./inputs/Day3.txt";
#$inputPath = "./inputs/Day3-Test.txt";

$lines = file($inputPath);
$fabric[] = [];
$overlap = 0;

// Part 1:
foreach($lines as $line) {
    $cord = parseCords($line);

    for($x=0; $x < $cord['xCount']; $x++) {
        for($y=0; $y < $cord['yCount']; $y++) {
            $locX = $cord['x'] + $x;
            $locY = $cord['y'] + $y;
            
            if(isset($fabric[$locX][$locY])) {
                if($fabric[$locX][$locY] == 1) {
                    $overlap++;
                }
                $fabric[$locX][$locY]++;
            } else {
                $fabric[$locX][$locY] = 1;
            }
        }
    }
}

print("Number of overlapping claims: {$overlap}\n");

// Part 2:
foreach($lines as $line) {
    $cord = parseCords($line);

    $totalClaim = $cord['xCount'] * $cord['yCount'];
    $sharedClaim = 0;

    for($x=0; $x < $cord['xCount']; $x++) {
        for($y=0; $y < $cord['yCount']; $y++) {
            $locX = $cord['x'] + $x;
            $locY = $cord['y'] + $y;

            $sharedClaim += $fabric[$locX][$locY];
        }
    }

    if($totalClaim == $sharedClaim) {
        print("Claim without overlap: {$cord['claim']}\n");
    }
}

function parseCords($cord) {
    preg_match('/#(\d+) @ (\d+),(\d+):\s+(\d+)x(\d+)/', $cord, $parsed);

    return ['claim' => $parsed[1], 'x' => $parsed[2], 'y' => $parsed[3], 'xCount' => $parsed[4], 'yCount' => $parsed[5]];
}