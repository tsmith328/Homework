#Tyler Smith
#A06
#tsmith328@gatech.edu
#I worked on this assignment alone, using only this sememster's course materials.

from Myro import *

def getValues(numSamples):
    rList = []
    for x in range(numSamples):
        val = getLight('center')
        rList.append(val)
        turnLeft(1, .25)
    return rList

def printStatistics(numbers): #Using predefined functions is boring
    #Calculates the average
    add = 0
    for x in numbers:
        add = add + x
    avg = add / len(numbers)
    #Calculates the minimum value
    minNum = numbers[0]
    for i in range(len(numbers)):
        if minNum > numbers[i]:
            minNum = numbers[i]
    #Calculates the maximum value
    maxNum = numbers[0]
    for i in range(len(numbers)):
        if maxNum < numbers[i]:
            maxNum = numbers[i]
    #Calculates the number of even numbers in the list
    even = 0
    for x in numbers:
        if x % 2 == 0:
            even = even + 1
    #Determines if the word 'only' should be used.
    if even < (len(numbers) / 2):
        onlyVar = 'only '
    else:
        onlyVar = ''
    #Prints the final answer
    ansStr ="You gave me a list of {0} numbers. The average value was {1:.2f}. The smallest number was {2}; the largest: {3}. Out of {0} numbers, {4}{5} were even."
    print(ansStr.format(len(numbers),avg,minNum,maxNum,onlyVar,even))