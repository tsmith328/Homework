#Tyler Smith
#tsmith328@gatech.edu
#Section A06
#I worked on this assignment alone, using this semseter's course materials.

def countChars(sentence):
    num = 0
    for x in sentence:
        if x == " ":
            num = num #Ignores spaces
        else:
            num = num + 1 #Counts number of non-spaces
    return num

def removeT(boolVal):
    userBool = True
    outStr=""
    while userBool:
        userStr = input("Enter a word or string to process")
        if userStr == 'quit':
            userBool = False
        if not userBool:
            return outStr
        if boolVal: #Checks whether it should take out lower case t's or not
            for i in range(len(userStr)): #Iterates through the string
                if userStr[i] == 'T':
                    userStr = userStr[:i] + " " + userStr[i+1:] #Removes the t and adds the space
                if userStr[i] == 't':
                    userStr = userStr[:i] + " " + userStr[i+1:]
        if not boolVal: #Other check for upper or lower-case t's
            for i in range(len(userStr)):
                if userStr[i] == 'T':
                    userStr = userStr[:i] + " " + userStr[i+1:]
        outStr = outStr + userStr #Adds the result to the final string to be returned
    return outStr