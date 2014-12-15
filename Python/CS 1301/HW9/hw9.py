#Tyler Smith
#tsmith328@gatech.edu
#A06
#I worked on this assignment alone, using only this semester's provided materials.

from Myro import *
import random
from math import *
from os import listdir
from os import path

#Part 1
def addition(aNum, bNum): #Used in reduce
    return aNum + bNum

def avgObstacleValues(numSec):
    leftValues = []
    centerValues = []
    rightValues = []
    for t in timer(numSec):
        sensor = getObstacle() #Lines 21-24 collect and sort sensor values
        leftValues.append(sensor[0])
        centerValues.append(sensor[1])
        rightValues.append(sensor[2])
        direction = random.randint(0,1) #Randomly chooses a direction and time duration to turn
        if direction == 0:
            turnLeft(1,random.random())
        else:
            turnRight(1,random.random())
    leftAvg = reduce(addition,leftValues)/len(leftValues) #Finds the average of each list
    centerAvg = reduce(addition,centerValues)/len(centerValues)
    rightAvg = reduce(addition,rightValues)/len(rightValues)
    return (leftAvg, centerAvg, rightAvg) #Returns the tuple

#Part 2
def distance(aList): #Takes in a list of four numbers as strings
    x1 = float(aList[0]) #Casts each number as a float
    x2 = float(aList[1])
    y1 = float(aList[2])
    y2 = float(aList[3])
    d = sqrt((x1 - x2)**2 + (y1-y2)**2) #Distance equation
    return d

def findDistances(fileIn, fileOut):
    f = open(fileIn,'r') #Open and read the file one line at a time
    line = f.readline()
    pointsList = []
    while len(line) > 0:
        points = line.split(' ') #Creates a list of the two points (four numbers) on the line
        pointsList.append(points) #Appends the list to an inclusive list for storage and mapping
        line = f.readline()
    distances = map(distance,pointsList) #Find the distance
    f.close
    f = open(fileOut,'w') #Creates the file to write to
    for i in range(len(distances)):
        f.write(str(distances[i])) #Writes the distance out separately on new lines
        f.write('\n \n')
    f.close()

#Part 3
def isPic(f): #Tests files for image extentions (.jpg,.bmp,.gif, or .png)
    fList = f.split('.')
    ext = fList[len(fList) - 1] #In case the file name has periods in it: only looks for the last section of the file name (extension)
    if ext == 'bmp' or ext == 'jpg' or ext == 'gif' or ext == 'png':
        return True
    else:
        return False

def findImages(directory):
    files = listdir(directory) #Lists all files in the path
    pics = filter(isPic,files) #Checks each file for being a picture
    return pics

#Part 4
def generateFileSystemDictionary(directory):
    files = listdir(directory) #Creates a list of files and folders in the path
    filesDict = {} #The dictionary with paths as keys
    filesDict[directory] = files #Root directory
    for i in range(len(files)):
        newDir = directory+'/'+files[i] #Append file/folder name to root to test for directory
        if path.isdir(newDir): #Returns True for folders
            subDir = generateFileSystemDictionary(newDir) #Recursively goes through the path tree to find files and folders
            keyList = subDir.keys() #List of paths
            valList = subDir.values() #List of files and subfolders
            for i in range(len(keyList)):
                filesDict[keyList[i]] = subDir[keyList[i]] #Appends subfolders and paths to the dictionary
                if len(valList) == 0: #Put in place for empty folders: I was having trouble when it saw empty folders
                    filesDict[keyList[i]] = []
    return filesDict