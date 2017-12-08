#!/usr/bin/php
<?php
//This proves I'm bad at math and should increase my knowledge of the subject

$input = 312051;
$xCord = 0;
$yCord = 0;
$val = 1;
$direction = "RIGHT";
$length = 1;

$grid[$xCord][$yCord] = $val;

//Test
$input = 9;
//print "$xCord:$yCord => $val\n";

while($input >= $val) {
    $sides = 0;
    while($sides < 2) {

        switch($direction) {
            case "RIGHT":
                $xCord++;
                break;
            case "UP":
                $yCord++;
                break;
            case "LEFT":
                $xCord--;
                break;
            case "DOWN":
                $yCord--;
                break;
        }

        $grid[$xCord][$yCord] = $val;
        print "$sides|$length => $xCord:$yCord => $val\n";

        $val++;
        $sides++;
    }

    $length++;
    $direction = nextDirection($direction);
}

function nextDirection($dir) {
    $ret = '';
    switch($dir) {
        case "RIGHT":
            $ret = "UP";
            break;
        case "UP":
            $ret = "LEFT";
            break;
        case "LEFT":
            $ret = "DOWN";
            break;
        case "DOWN":
            $ret = "RIGHT";
            break;
    }

    return $ret;
}