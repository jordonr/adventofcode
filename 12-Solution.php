#!/usr/bin/php
<?php

$inputPath = "./inputs/day12.txt";
//$inputPath = "./inputs/temp.txt";
$lines = file($inputPath);
$pInput = parseInput($lines);

$connections = countConnections(0, []);

var_dump($connections);
print count($connections);

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
