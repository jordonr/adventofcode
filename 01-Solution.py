#!/usr/bin/env python
# Day 01, Part 1 and 2

fh = open('./inputs/Day1.txt')
#fh = open('./inputs/Day1-Test.txt')
frequency = 0
frequencyList = []
frequencyTracking = [0]
frequencyFound = False

for line in fh:
    f = int(line.strip())
    frequency += f
    frequencyList.append(f)
    frequencyTracking.append(frequency)

fh.close()
print 'Final frequency: ' + str(frequency)

f = 0
r = 0
while not frequencyFound:
    frequency += frequencyList[f]
    if frequency in frequencyTracking:
            print 'First reaches ' + str(frequency) + ' twice.'
            frequencyFound = True

    frequencyTracking.append(frequency)
    f += 1
    if f >= len(frequencyList):
        f = 0
        r += 1
        print 'Restart Input: ' + str(r)