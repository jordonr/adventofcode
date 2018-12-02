#!/usr/bin/env python

fh = open('./inputs/Day1.txt')
frequency = 0

for line in fh:
    frequency += int(line.strip())
    
print frequency