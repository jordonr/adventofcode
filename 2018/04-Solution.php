#!/usr/bin/env php
<?php

$inputPath = "./inputs/Day4.txt";
// $inputPath = "./inputs/Day4-Test.txt";

$lines = file($inputPath);
$guardInfo[] = [];

asort($lines);

// Part 1:
$guardId = 0;
$sleepMinute = 0;

foreach($lines as $line) {
    preg_match('/\sGuard\s\#(\d+)/', $line, $parsed);
    if(count($parsed) > 0) {
        $guardId = $parsed[1];
    }

    preg_match('/00:(\d{2})]\sfalls asleep/', $line, $parsed);
    if(count($parsed) > 0) {
        $sleepMinute = intval($parsed[1]);
    }

    preg_match('/00:(\d{2})]\swakes up/', $line, $parsed);
    if(count($parsed) > 0) {
        while($sleepMinute < $parsed[1]) {
            if(isset($guardInfo[$guardId][$sleepMinute])) {
                $guardInfo[$guardId][$sleepMinute]++;
            } else {
                $guardInfo[$guardId][$sleepMinute] = 1;
            }
            $sleepMinute++;
        }

        $sleepMinute = 0;
    }
}

$sleepyGuard = 0;
$snoozingGuard = 0;
foreach($guardInfo as $guard => $info) {
    $guardInfo[$guard]['most_time'] = array_reduce($info, function($carry, $item) {
        return ($carry > $item ? $carry : $item);
    }, 0);

    $guardInfo[$guard]['total_time'] = array_reduce($info, function($carry, $item) {
        return $carry + $item;
    }, 0);

    $guardInfo[$guard]['common_minute'] = array_search($guardInfo[$guard]['most_time'], $guardInfo[$guard]);    
    $sleepyGuard = ($guardInfo[$sleepyGuard]['total_time'] > $guardInfo[$guard]['total_time'] ? $sleepyGuard : $guard);
    $snoozingGuard = ($guardInfo[$snoozingGuard]['most_time'] > $guardInfo[$guard]['most_time'] ? $snoozingGuard : $guard);
}

$guardCode = $sleepyGuard * $guardInfo[$sleepyGuard]['common_minute'];
print("Part 1 Guard {$sleepyGuard}\nTotal time: {$guardInfo[$sleepyGuard]['total_time']} - Minute: {$guardInfo[$sleepyGuard]['common_minute']} = {$guardInfo[$sleepyGuard]['most_time']} | {$guardCode}\n");

$guardCode = $snoozingGuard * $guardInfo[$snoozingGuard]['common_minute'];
print("Part 2 Guard {$snoozingGuard}\nTotal time: {$guardInfo[$snoozingGuard]['total_time']} - Minute: {$guardInfo[$snoozingGuard]['common_minute']} = {$guardInfo[$snoozingGuard]['most_time']} | {$guardCode}\n");
