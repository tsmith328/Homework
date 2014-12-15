#Tyler Smith, Kymberly McLane, and Emeke Nkadi
#Section A06
#tsmith328@gatech.edu, kervin3@gatech.edu, enkadi3@gatech.edu
#We worked on this assignment as a group, using only this semester's resources.

from Myro import *

## Finds yellow wall by moving around taking pictures
## Celebrates when finished

def findYellowWall():
    setIRPower(140)
    avoidWalls()
    setPicSize('small')
    p = takePicture()
    p2=copyPicture(p)
    markYellow(p)
    result = pctMarked(p)
    while result < 0.20:
        show(p)
        if XDirection(p) == 'left':
            turnLeft(1,.25)
        if XDirection(p) == 'right':
            turnRight(1,.25)
        if XDirection(p) == 'center':
            while getObstacle('center') < 640:
                motors(1,1)
            stop()
        #avoidWalls()
        p = takePicture()
        markYellow(p)
        result = pctMarked(p)
    celebrate()
    return

## Moves robot away from forward or backwards obstacles once
def avoidWalls():
      v = getObstacle("center")
      o = getIR()

      if v > 2000:
        backward(1,2)
        rotate(4,1)
      elif o == [0,0]:
        forward(1,2)
        rotate(4,1)
      else:
        return

##Changes all yellow pixels to white, and others to black
def markYellow(myPic):
  for pix in getPixels(myPic):
     r = getRed(pix)
     g = getGreen(pix)
     b = getBlue(pix)
     #if r>b and g>b and r>b:
     if r > 75 and g > 75 and b<70:
        setRed(pix,255)
        setGreen(pix,255)
        setBlue(pix,255)
     else:
       setRed(pix,0)
       setGreen(pix,0)
       setBlue(pix,0)

#Returns the percentage of yellow (white) pixels in the image
def pctMarked(pic):
   totalPixels = 0
   whitePixels = 0
   for pix in getPixels(pic):
      if getRed(pix) == 255:
          whitePixels = whitePixels + 1

      totalPixels = totalPixels + 1

   result = whitePixels / totalPixels
   return result

## Finds the general direction of the white pixels in picture
def XDirection(pic):
    screenSize = getWidth(pic)
    avgX = findAvgX(pic)
    direction = ""
    result = pctMarked(pic) > .01
    if avgX < (screenSize/8) or (not result):
        direction = "left"
    if avgX > (screenSize/8) and avgX < (screenSize - screenSize/8) and result:
        direction = "center"
    if avgX >(screenSize - screenSize/8) and result:
        direction = "right"

    return direction

#Finds where the majority of white pixels are in the modified image
def findAvgX(pic):
   pixelCount  = 0
   totalXCount = 0
   for pix in getPixels(pic):
      if getRed(pix) == 255:
          x = getX(pix)
          totalXCount = totalXCount + x
          pixelCount = pixelCount + 1
   try:
      avgX = totalXCount / pixelCount
   except:
      avgX = 0
   return avgX

## celebrates after finding the Yellow wall
def celebrate():
    wheelsOnTheBus = makeSong("c 1; f 1; f 1;f 1;f 1; a 1;c 1; a 1;f 1; g 1; e 1; c 1; a 1;g 1; f 1;c 1; f 1;f 1; f 1; f 1; a 1;c 1;a 1; f 1;g 1;c 1; c 1; f 1; g 1; f 1;")
    playSong(wheelsOnTheBus)

    rotate(10,3)
    move(1,2)
    rotate(-10,3)
    move(2,1)
    backward(.5,2)
    forward(2,1)
    rotate(10,3)
    rotate(-10,3)
