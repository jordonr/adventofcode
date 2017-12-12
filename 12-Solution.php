#!/usr/bin/php
<?php

$inputPath = "./inputs/day12.txt";
//$inputPath = "./inputs/temp.txt";
$lines = file($inputPath);
$pInput = parseInput($lines);
$connections = [];

$connections = countConnections(0, []);
print "Part 1: " . count($connections);

$connections = [];
foreach($pInput as $comp => $pipe) {
    if(!twoLevelSearch($comp, $connections)) {
        $connections[] = countConnections($comp, []);
    }
}

print "\nPart 2: " . count($connections);

function countConnections($computer, $pipeList) {
    global $pInput;
    $pipeList[] = $computer;
    foreach($pInput[$computer] as $p) {
        if(!in_array($p, $pipeList)) {
            $pipeList = countConnections($p, $pipeList);
        }
    }

    return $pipeList;
}

function parseInput($data) {
    $retStruct = [];

    foreach($data as $line) {
        $temp = explode('<->', $line);
        $retStruct[(int) $temp[0]] = array_map(function($v) {
            return (int) $v;
        }, explode(',', $temp[1]));
    }

    return $retStruct;
}

function twoLevelSearch($needle, $haystack) {
    foreach($haystack as $hay) {
        if(in_array($needle, $hay)) {
            return TRUE;
        }
    }

    return FALSE;
}
