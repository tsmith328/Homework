#Tyler Smith, Kamryn Harris, Weiyi Chen
#tsmith328@gatech.edu, kharris48@gatech.edu, wchen376@gatech.edu
#A06
#We worked on this project alone as a group, using this semester's course materials.

from Myro import *

def film(scene):
    imgList = []
    i = 0
    while i < 25:
        p = takePicture()
        imgList.append(p)
        i = i + 1
    for i in range(len(imgList)):
        savePicture(imgList[i],'img'+scene+'{}.jpg'.format(i))


