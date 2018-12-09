#!/usr/bin/env python
# Day 01, Part 1

fh = open('./inputs/Day2.txt')
#fh = open('./inputs/Day2-Test.txt')

checksumData = {'twos': 0, 'threes': 0}
fileData = []

# Function for part 2, compares two strings
def compareData(subject, compList):
    for comp in compList:
        diffCount = 0
        retData = {'subject': subject, 'comp': comp, 'diffChars': ''}
        for idx in range(0,len(comp)):
            if subject[idx] != comp[idx]:
                diffCount = diffCount + 1
                retData['diffChars'] = retData['diffChars'] + subject[idx] + comp[idx]

        if diffCount == 1:
            return retData


for line in fh:
    chars = line.strip()
    fileData.append(chars) #For Part 2
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
        prevChar = c

fh.close()
output = checksumData['twos'] * checksumData['threes']
print 'Checksum: ' + str(output)

#Part 2
for data in fileData:
    result = compareData(data, fileData)
    if result is not None:
        print result



