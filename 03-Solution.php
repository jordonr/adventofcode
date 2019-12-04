#!/usr/bin/env php
<?php

# ***
# Part 1 -
# Here are a few more examples:
#     R75,D30,R83,U83,L12,D49,R71,U7,L72
#     U62,R66,U55,R34,D71,R55,D58,R83 = distance 159
#     R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
#     U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = distance 135
# ***

$inputPath = "./inputs/Day03.txt";

$lines = file($inputPath);
$wires = [];

// Part 1:
$wc = 0;
foreach($lines as $wire) {
    $commands = explode(",", $wire);

    $wires[$wc][] = [0, 0];

    foreach($commands as $command) {
        $dir = substr($command, 0, 1);
        $steps = substr($command, 1);

        for($i=1; $i<=$steps; $i++) {
            if($dir == "U") {
                $wires[$wc][] = [$wires[$wc][count($wires[$wc])-1][0], $wires[$wc][count($wires[$wc])-1][1] + 1];
            } elseif($dir == "D") {
                $wires[$wc][] = [$wires[$wc][count($wires[$wc])-1][0], $wires[$wc][count($wires[$wc])-1][1] - 1];
            } elseif($dir == "L") {
                $wires[$wc][] = [$wires[$wc][count($wires[$wc])-1][0] - 1, $wires[$wc][count($wires[$wc])-1][1]];
            } elseif($dir == "R") {
                $wires[$wc][] = [$wires[$wc][count($wires[$wc])-1][0] + 1, $wires[$wc][count($wires[$wc])-1][1]];
            }
        }
    }

    $wc++;
}

$collisions = [];
$minDistance = null;
for($i=0; $i<count($wires)-1;$i++) {
    foreach($wires[$i] as $w) {
        if(array_search($w, $wires[$i+1])) {
            $collisions[] = $w;
            $dist = abs($w[0]) + abs($w[1]);
            if(is_null($minDistance) || $minDistance > $dist) {
                $minDistance = $dist;
            }
        }
    }
}

print("====================\n");
print("Part 1: {$minDistance}\n");
print("====================\n");
