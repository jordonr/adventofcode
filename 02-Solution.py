#!/usr/bin/env python
# Day 01, Part 1

fh = open('./inputs/Day2.txt')
#fh = open('./inputs/Day2-Test.txt')

checksumData = {'twos': 0, 'threes': 0}

for line in fh:
    chars = line.strip()
    sChars = sorted(chars)
    sChars.append("|")

    count = 1
    didTwo = False
    didThree = False
    prevChar = ''
    for c in sChars:
        if prevChar != '':
            if prevChar == c:
                count += 1
            else:
                if count == 2 and not didTwo:
                    didTwo = True
                    checksumData['twos'] += 1
                elif count == 3 and not didThree:
                    didThree = True
                    checksumData['threes'] += 1
                count = 1
        else:
            didTwo = False
            didThree = False

        prevChar = c

output = checksumData['twos'] * checksumData['threes']
print 'Checksum: ' + str(output)