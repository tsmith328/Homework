#Tyler Smith, Kymberly McLane, and Emeke Nkadi
#A06
#tsmith328@gatech.edu, kervin3@gatech.edu, enkadi3@gatech.edu
#We worked on this assignment alone as a group, using only this semester's course materials.
#Unicorn image from jeffgothelf.com
#Volcano image from European Geosciences Union
#Girl in boxing gloves posted to reddit.com/r/no_sob_story
#Failboat from Recitation Assignment
#Dog stealing a poptart from http://imgur.com/ZJX6k
#Girl hit by snow from http://guyism.com/wp-content/uploads/2013/10/she-hates-balls-in-her-face.gif
#TMZ .gif from http://nextimpulsesports.com/2013/11/01/iwoz-meet-dmx/
#The .zip files contain the separate images that make up the .gif inputs.
from Myro import *

def specialFX():
    seeingRed(makePicture('failboat.jpg'))
    wait(5)
    seeingRed(makePicture('girl.jpg'))
    wait(5)
    fade(makePicList('output',94))
    multipleExposure('girl.jpg','failboat.jpg')
    multipleExposure(makePicList('multi1',13),makePicList('multi2',13))
    splitScreen(makePicList('multi1',13),makePicList('multi2',13))
    greenScreen('Unicorn.jpg','volcano.jpg')

def seeingRed(pic):
    p = copyPicture(pic)
    show(p,"Without tint")
    for pix in getPixels(pic):
        if getRed(pix) < 240: #Tests for pixels that aren't fully red
            newRed = getRed(pix) + 75
            setRed(pix,newRed)
        else:
            setRed(pix,255)
        if getRed(pix) >=250 and getBlue(pix) >= 250 and getGreen(pix) >= 250: #Test for white pixels
            setBlue(pix,180) #Adds a tint to white pixels
            setRed(pix,255)
            setGreen(pix,180)
    show(pic,"With tint")
    savePicture(pic,'redTintOut.jpg')

def fade(picList):
    length = len(picList)
    fadeStep = 255 // (length - (length // 5)) #Determines how fast the image will fade according to how long the .gif plays
    picList2 = []
    for i in range(length):
        fadeAmt = fadeStep * i
        p = makePicture(picList[i])
        for pix in getPixels(p):
            r = getRed(pix)
            g = getGreen(pix)
            b = getBlue(pix)
            setRed(pix, r - fadeAmt) #Darkens the image
            setGreen(pix, g - fadeAmt)
            setBlue(pix, b - fadeAmt)
        picList2.append(p) #Creates a list of pictures
    savePicture(picList2,'fadeGIFOut.gif')

def makePicList(string,length): #Makes a list of pictures to return to other functions;allows for directory changes and different .gif lengths
    picList = []
    picStr = string+"/{}.gif"
    for i in range(0,length + 1):
        picList.append(picStr.format(i))
    return picList

def multipleExposure(pic1,pic2):
    if type(pic1) != list: #Allows for input to be single images or a list of images; assumes images are the same size, and lists are the same size
        if type(pic2) != list:
            p1 = makePicture(pic1)
            p2 = makePicture(pic2)

            pix1 = []
            pix2 = []

            for pix in getPixels(p1): #Stores the pixels in p1 as a list
                pix1.append(pix)

            for pix in getPixels(p2): #Stores the pixels in p2 as a list
                pix2.append(pix)

            for i in range(len(pix1)): #Averages the two images pixel-wise to create a double-exposure effect
                r1 = getRed(pix1[i])
                r2 = getRed(pix2[i])
                g1 = getGreen(pix1[i])
                g2 = getGreen(pix2[i])
                b1 = getBlue(pix1[i])
                b2 = getBlue(pix2[i])
                newR = ((r1 + r2) // 2)
                newG = ((g1 + g2) // 2)
                newB = ((b1 + b2) // 2)
                setRGB(pix1[i],newR,newG,newB)
            savePicture(p1,'multiOut.jpg')
        else:
            print("Those are not of the same type.")
            return
    elif type(pic1) == list:
        if type(pic2) != list:
            print("Those are not of the same type.")
            return
        elif type(pic2) == list:
            length = len(pic1)
            listReturn = []
            for i in range(length): #Performs the same action as above, but for lists of images to make animated .gif files
                p1 = makePicture(pic1[i])
                p2 = makePicture(pic2[i])

                pix1 = []
                pix2 = []

                for pix in getPixels(p1):
                    pix1.append(pix)

                for pix in getPixels(p2):
                    pix2.append(pix)

                for i in range(len(pix1)):
                    r1 = getRed(pix1[i])
                    r2 = getRed(pix2[i])
                    g1 = getGreen(pix1[i])
                    g2 = getGreen(pix2[i])
                    b1 = getBlue(pix1[i])
                    b2 = getBlue(pix2[i])
                    newR = ((r1 + r2) // 2)
                    newG = ((g1 + g2) // 2)
                    newB = ((b1 + b2) // 2)
                    setRGB(pix1[i],newR,newG,newB)

                listReturn.append(p1)
            savePicture(listReturn,'multiOut.gif')

def splitScreen(pic1,pic2):
    pic = makePicture(pic1[0])
    h = getHeight(pic)
#    w = getWidth(pic)
#    pixNum = h * w
    outList = []
    for i in range(len(pic1)):
         p1 = makePicture(pic1[i])
         p2 = makePicture(pic2[i])
##         Look at all of these lines of code we didn't need!!!!!!!!!!!!!!!!!!!!!!!!
##         pixDict1 = {}
##         for pix in getPixels(p1):
##             r = getRed(pix)
##             g = getGreen(pix)
##             b = getBlue(pix)
##             pixDict1[pix] = [r,g,b]
##         pixDict2={}
##         for pix in getPixels(p2):
##             r = getRed(pix)
##             g = getGreen(pix)
##             b = getBlue(pix)
##             pixDict2[pix] = [r,g,b]
##         pDict = {}
##         keyList = []
##         for key in pixDict1:
##             keyList.append(key)
##         keyList = keyList[:pixNum//2]
        #Life lesson: READ THE MANUAL!!!!
         for p in getPixels(p1):
            if getY(p) < (h//2):
                setColor(getPixel(p2, getX(p), getY(p)), getColor(p))
         outList.append(p2)
    savePicture(outList,"splitOut.gif")

def greenScreen(foreground,background):
    p1 = makePicture(foreground)
    p2 = makePicture(background)
    pixList1 = []
    pixList2 = []
    for pix in getPixels(p1):
        pixList1.append(pix)
    for pix in getPixels(p2):
        pixList2.append(pix)
    for i in range(len(pixList1)):
        r = getRed(pixList1[i])
        g = getGreen(pixList1[i])
        b = getBlue(pixList1[i])
        if r >= 230 and g <= 30 and b <= 30:
            r2 = getRed(pixList2[i])
            g2 = getGreen(pixList2[i])
            b2 = getBlue(pixList2[i])
            setRGB(pixList1[i],r2,g2,b2)
    savePicture(p1,'greenScreenOut.jpg')