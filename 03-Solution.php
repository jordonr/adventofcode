#!/usr/bin/php
<?php
//This proves I'm bad at math and should increase my knowledge of the subject

$input = 312051;
$xCord = 0;
$yCord = 0;
$grid[0][0] = 1;
$direction = "RIGHT";

//Test
$input = 25;

for($i=2; $i<=$input; $i++) {

    switch($direction) {
        case "RIGHT":
            $xCord++;
            echo "$xCord:$yCord => $i\n";
            if($xCord > $yCord) {
                $direction = "UP";
            }
            break;
        case "UP": 
            $yCord++;
            echo "$xCord:$yCord => $i\n";
            if($xCord === $yCord) {
                $direction = "LEFT";
            }
            break;
        case "LEFT": 
            $xCord--;
            echo "$xCord:$yCord => $i\n";
            if(abs($xCord) === $yCord) {
                $direction = "DOWN";
            }
            break;
        case "DOWN": 
            $yCord--;
            echo "$xCord:$yCord => $i\n";
            if($xCord === $yCord) {
                $direction = "RIGHT";
            }
            break;
    }

    $grid["$xCord"]["$yCord"] = $i;
}