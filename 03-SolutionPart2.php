#!/usr/bin/php
<?php
//This proves I'm bad at math and should increase my knowledge of the subject

$input = 312051;
$xCord = 0;
$yCord = 0;
$val = 1;
$direction = "RIGHT";
$length = 1;


//Test
$grid[$xCord][$yCord] = $val;
print "$xCord:$yCord => $val\n";
$val++;

while($input >= $val) {
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

    $grid[$xCord][$yCord] = getValue($grid, $xCord, $yCord);
    print "$xCord:$yCord => " . $grid[$xCord][$yCord];

    if($input < $grid[$xCord][$yCord]) {
        print "\n\n$input < " . $grid[$xCord][$yCord] . "\n";
        break;
    }

    $testDirection = nextDirection($direction);
    //Get test direciton coords
    $tx = $xCord;
    $ty = $yCord;
    switch($testDirection) {
        case "RIGHT":
            $tx++;
            break;
        case "UP":
            $ty++;
            break;
        case "LEFT":
            $tx--;
            break;
        case "DOWN":
            $ty--;
            break;
    }

    print " | Next: $tx:$ty\n";

    if(!isset($grid[$tx][$ty])) {
        $direction = nextDirection($direction);
    }

    $val++;
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

function getValue($myGrid, $myX, $myY) {
    $retValue = 0;

    $retValue += isset($myGrid[$myX-1][$myY]) ? $myGrid[$myX-1][$myY] : 0;
    $retValue += isset($myGrid[$myX+1][$myY]) ? $myGrid[$myX+1][$myY] : 0;
    $retValue += isset($myGrid[$myX][$myY-1]) ? $myGrid[$myX][$myY-1] : 0;
    $retValue += isset($myGrid[$myX][$myY+1]) ? $myGrid[$myX][$myY+1] : 0;
    $retValue += isset($myGrid[$myX-1][$myY-1]) ? $myGrid[$myX-1][$myY-1] : 0;
    $retValue += isset($myGrid[$myX+1][$myY+1]) ? $myGrid[$myX+1][$myY+1] : 0;
    $retValue += isset($myGrid[$myX-1][$myY+1]) ? $myGrid[$myX-1][$myY+1] : 0;
    $retValue += isset($myGrid[$myX+1][$myY-1]) ? $myGrid[$myX+1][$myY-1] : 0;

    return $retValue;
}