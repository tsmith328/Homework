#Tyler Smith
#tsmith328@gatech.edu
#A06
#I worked on this assignment alone, using only this semester's course materials.
#This program takes in a time in the format "h hours m minutes s seconds" (where h,m,s are integers)
#that determines how long after the last keystroke to wait before starting the screensaver.
#Screen saver lasts for a default of one hour. To change this, edit the variable "tim" to be the
#number of seconds desired. (Line 18)

#Example input:
    #screenSaver('2 hours 30 minutes') will wait 2.5 hours before initiating the screensaver.
    #screenSaver('5 seconds and 3 minutes') will wait 3 minutes, 5 seconds before init.

from Graphics import *
from random import randint
from Myro import timer

tim = 3

def timing(time):
    timeList = time.split(' ')

    if 'hour' in timeList:
        i = timeList.index('hour')
        hours = int(timeList[i-1])
    elif 'hours' in timeList:
        i = timeList.index('hours')
        hours = int(timeList[i-1])
    else:
        hours = 0

    if 'minute' in timeList:
        i = timeList.index('minute')
        minutes = int(timeList[i-1])
    elif 'minutes' in timeList:
        i = timeList.index('minutes')
        minutes = int(timeList[i-1])
    else:
        minutes = 0

    if 'second' in timeList:
        i = timeList.index('second')
        seconds = int(timeList[i-1])
    elif 'seconds' in timeList:
        i = timeList.index('seconds')
        seconds = int(timeList[i-1])
    else:
        seconds = 0

    numSec = (hours * 3600) + (minutes * 60) + seconds
    return numSec


def screenSaver(time):
    seconds = timing(time)
    wait(seconds)
    width = 1360
    height = 768
    win = Window('Saver',width,height)
    win.mode = 'manual'
    ballDict = {}
    ballDX = {}
    ballDY = {}
    for i in range(randint(15,25)):
        ballName = 'ball{}'.format(i)
        ball_i = Circle((randint(0,width),randint(0,height)),randint(25,100))
        ball_i.fill = Color(randint(0,256),randint(0,256),randint(0,256))
        ballDict[ballName] = ball_i
    for key in ballDict.keys():
        ballDict[key].draw(win)
        ballDX[key] = randint(-15,15)
        ballDY[key] = randint(-15,15)
    num = 0
    for t in timer(tim):
        for key in ballDict.keys():
            b = ballDict[key]
            dx = ballDX[key]
            dy = ballDY[key]
            b.move(dx,dy)
            if b.getX() > width or b.getX() < 0:
                ballDX[key] = -ballDX[key]
            if b.getY() > height or b.getY() < 0:
                ballDY[key] = -ballDY[key]
        wait(0.1)
        win.update()
    win.close()
