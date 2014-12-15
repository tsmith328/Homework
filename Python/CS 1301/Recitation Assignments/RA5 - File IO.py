#Tyler Smith, Kymberly McLane, Emeke Nkadi
#tsmtih328@gatech.edu, kervin3@gatech.edu, enkadi3@gatech.edu
#A06

from Myro import *
def roboScript(fileIn):
    f = open(fileIn, 'r')
    command = f.readline()
    while len(command) > 0:
        comList = command.split()
        for i in range(len(comList)):
            try:
                comList[i] = float(comList[i])
            except:
                pass
        if comList[0] == 'fw':
            forward(comList[1],comList[2])
        elif comList[0] == 'bw':
            backward(comList[1],comList[2])
        elif comList[0] == 'tl':
            turnLeft(comList[1],comList[2])
        elif comList[0] == 'tr':
            turnRight(comList[1],comList[2])
        elif comList[0] == 'bp':
            beep(comList[2],comList[1])
        command = f.readline()
    f.close()