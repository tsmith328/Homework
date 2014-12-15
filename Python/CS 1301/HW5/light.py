#Tyler Smith and Kamryn Harris
#tsmith328@gatech.edu and kharris48@gatech.edu
#Section A06
#We worked on this assignment alone, using this semester's course materials.

from Myro import *

def takePic(number): #Takes the pictures and saves them to the directory
    bAvg = []
    for x in range(number):
        p = takePicture()
        savePicture(p,"pic{}.jpg".format(x))
        avg = bright()
        bAvg.append(avg)
        turnLeft(1, .5)
    return bAvg

def bright(): #Gets the brightness values, averages them, and saves the averages to a list
    bList = getLight()
    avg = (bList[0] + bList[1] + bList[2]) / 3
    return avg

def makeWebPage(numberOfPictures):
    f = open("myPage.html" , "w")
    #headStr is the header string, used for validation, the title, and the intro sentence.
    headStr = """<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Kamryn and Tyler's Picture Page</title>
</head>
<body>
<h1>Welcome to Our Python-Made Page!</h1>
<p>Made by Kamryn Harris and Tyler Smith.</p>
<table>
<tr>\n"""
    f.write(headStr)
    bAvg = takePic(numberOfPictures)#Saves the list to a variable in this function
    x = 0
    while x < numberOfPictures: #Forms the table in the page
        b = bAvg[x]
        if ((x%4 == 0) and x!=0): #Adds a new row tag in HTML every fourth picture
            f.write("</tr>\n<tr>\n")
        tableStr = '<td><img src="pic{0}.jpg" height="192px" alt="Picture {0}" /><p>Brightness level: {1}</p></td>\n'.format(x,b)
        f.write(tableStr)
        x = x+1
    f.write("</tr></table>") #Closes the table
    f.write("\n<p>Pictures taken by {}!</p>".format(getName()))
    f.write("\n</body>\n</html>")
    f.close()