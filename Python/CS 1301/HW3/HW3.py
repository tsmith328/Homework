#Tyler Smith
#tsmtih328@gatech.edu
#Section A06
#I worked on this homework by myself, using only this semester's course materials.

def passOrNot(grade):
    if grade >= 70:
        return 'Congratulations. You passed!'
    else:
        return 'Sorry. You must have at least 70% to pass. See you next semester.'

def modulusFour(start):
    mod = start - 4
    if mod < 0:
        print(start)
        print('The remainder is the number shown above.')
    elif mod == 0:
        print(mod)
        print('The remainder is the number shown above.')
    else:
        print(start)
        modulusFour(mod)

def letterSpace(userString):
    import string
    x = 0
    while x < len(userString):
        if userString[x] not in string.ascii_letters: #Checks if a character is a letter
            userString = userString[0:x] + ' ' + userString[x+1:len(userString)] #Concatenates the string, less the non-letter character, with a space
        x = x + 1
    return userString

def complimentMaker(answer1,answer2,answer3,answer4):
    string = 'You are'
    if answer1:
        string = string + ' super'
    if answer2:
        string = string + ' nice'
    if answer3:
        string = string + ' smart'
    if answer4:
        string = string + ' cool'
    string = string + '.'
    if not (answer1 or answer2 or answer3 or answer4):
            return 'No Comment'
    return string

def wordMesh(wordA,wordB):
    string = ''
    x = 0
    while x < len(wordA):
        string = string + wordA[x] + wordB[x]
        x = x + 1
    return string

def replaceWord(oldWord,newWord,aStr):
    import string
    if oldWord in aStr:
        return aStr.replace(oldWord,newWord)
    else:
        return aStr

def numMountainRange(x):
    space = x - 1
    row = 1
    while row <= x:
        string = str(row) + (' ' * space) + str(row) * (1 + (2 * (row - 1))) + (' ' * space) + str(row)
        row = row + 1
        space = space - 1
        print(string)

def print10table():
    x = 1
    string1 = 'Times:' #Lines 73-78 create the first line
    while x <= 10:
        string1 = string1 + '\t' + str(10 * x)
        x = x + 1
    print(string1)
    N = 100
    x = 1
    string = ''
    while x <= 10: #Lines 82-88 create the rows
        string = str(10 * x)
        y = 1
        while y <= 10: #Lines 85-87 create the columns
            string = string + '\t' + str((10 * y) * (10 * x))
            y = y + 1
        x = x + 1
        print(string)

def printTimes(N,inc):
    x = 1
    string1 = 'Times:' #Lines 92-97 create the first line
    while x <= N:
        string1 = string1 + '\t' + str(x)
        x = x + inc
    print(string1)
    x = 1
    string = ''
    while x <= N: #Lines 100-107 create the rows
        string = str(x)
        y = 1
        while y <= N: #Lines 103-105 create the columns
            string = string + '\t' + str(x * y)
            y = y + inc
        x = x + inc
        print(string)