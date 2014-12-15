#Tyler Smith
#tsmith328@gatech.edu
#A06
#I worked on this assignment alone, using only this semeseter's course materials.

from Myro import *

def colorSwap(pic):
    p = makePicture( pic )
    for pix in getPixels(p):
        r = getRed(pix)
        g = getGreen(pix)
        b = getBlue(pix)
        if r > g and r > b:
            setRed(pix,0)
            setGreen(pix,255)
            setBlue(pix,0)
        elif g > b and g > r:
            setRed(pix,0)
            setGreen(pix,0)
            setBlue(pix,255)
        elif b > r and b > g:
            setRed(pix,255)
            setGreen(pix,0)
            setBlue(pix,0)
    show(p)
    savePicture(p,'colorFailBoat.jpg')