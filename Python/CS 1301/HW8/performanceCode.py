#Tyler Smith, Kamryn Harris, Weiyi Chen
#tsmith328@gatech.edu, kharris48@gatech.edu, wchen376@gatech.edu
#A06
#We worked on this project alone as a group, using this semester's course materials.

#Performance Code
from Myro import *
import random


def movie():
    fadeInLoop(7, "Intro")
    imgList = []
    for i in range(8,25):
        img = "img"+"Intro"+"{}.jpg".format(i)
        pic = makePicture(img)
        imgList.append(pic)
    savePicture(imgList, "Intro_cont.gif")

    colorsFlash(15, "doggieDance")

    imgList2 = []
    for i in range(10):
        img = "img"+"resolution"+"{}.jpg".format(i)
        pic = makePicture(img)
        imgList2.append(pic)
    savePicture(imgList2, "resolution.gif")

    splitScreenLoop(10, "MoonwalkCat", "MoonwalkDog")

    colorsFlash(25, "Finale")



#Importing was causing problems with our code
def fadeIn(imgFile, percent):
    p = makePicture(imgFile)
    for pix in getPixels(p):
        r = getRed(pix)
        g = getGreen(pix)
        b = getBlue(pix)

        newR = r * percent
        newG = g * percent
        newB = b * percent

        setRed(pix, newR)
        setGreen(pix, newG)
        setBlue(pix, newB)

    return p

def fadeInLoop(numPics,moviePart):
    imgList = []
    for i in range(numPics):
        img = "img"+moviePart+"{}.jpg".format(i)
        percent = i/numPics
        f = fadeIn(img, percent)
        imgList.append(f)

    savePicture(imgList,"Intro.gif")

def seeingColor(color, pic):
    pic = makePicture(pic)
    redVal = 0
    blueVal = 0
    greenVal = 0
    if color == "red":
        redVal = 1
    if color == "blue":
        blueVal = 1
    if color == "green":
        greenVal = 1
    for pix in getPixels(pic):
        r = getRed(pix)
        g = getGreen(pix)
        b = getBlue(pix)

        newR = r + 70*redVal
        newB = b + 70*blueVal
        newG = g + 70*greenVal

        setRed(pix, newR)
        setBlue(pix, newB)
        setGreen(pix, newG)

    return pic

def colorsFlash(numPics,moviePart):
    imgList = []
    for i in range(numPics):
        img = "img"+moviePart+"{}.jpg".format(i)
        colorList = ["red", "green", "blue"]
        color = colorList[random.randint(0,2)]
        f = seeingColor(color, img)
        imgList.append(f)

    savePicture(imgList, moviePart+".gif")

def splitScreen(pic1, pic2):
    p = makePicture(pic1)
    p2 = makePicture(pic2)
    width= int(getWidth(p))
    for x in range(width):
        height=int(getHeight(p))
        halfHeight= int(getHeight(p)/2)

    for x in range(getWidth(p)):
        for y in range(halfHeight):
           pix = getPixel(p,x,y)
           pix2 = getPixel(p2,x,y)
           setRed(pix, getRed(pix2) )
           setGreen(pix,getGreen(pix2) )
           setBlue(pix,getBlue(pix2) )
    return p

def splitScreenLoop(numPics,moviePart1, moviePart2):
    imgList = []
    for i in range(numPics):
        img = "img"+moviePart1+"{}.jpg".format(i)
        img2 = "img"+moviePart2+"{}.jpg".format(i)
        f = splitScreen(img, img2)
        imgList.append(f)

    savePicture(imgList,"splitScreen.gif")

def moveUp(numPics,moviePart):
    imgList = []
    for i in range(numPics):
        pic = makePicture('img'+moviePart+'{}.jpg'.format(i))
        imgList.append(pic)
    for pic in imgList:
        height = getHeight(pic)
        width = getWidth(pic)
        halfHeight = height//2
        for x in range(width):
            for y in range(height):
                pix = getPixel(pic,x,y)
                pix2 = getPixel(pic,x,y+halfHeight)
                setRed(pix,getRed(pix2))
                setGreen(pix,getGreen(pix2))
                setBlue(pix,getBlue(pix2))
    for i in range(len(imgList)):
        savePicture(imgList[i],'img'+moviePart+'{}.jpg'.format(i))