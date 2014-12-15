#Tyler Smith and Kamryn Harris
#tsmith328@gatech.edu and kharris48@gatech.edu
#Section A06
#We worked on this assignment alone, using only this semester's course materials except where specifically stated.


from Myro import *
init()

def avoidWalls():
    for t in timer(60):
        motors(1,1)
        if getObstacle('right') > 2000:
            backward(.5,.25)
            turnLeft(.5,.5)
        if getObstacle('left') > 2000:
            backward(.5,.25)
            turnLeft(.5,.5)
    stop()

    #Note values in Hertz (data from: http://en.wikipedia.org/wiki/Piano_key_frequencies)
    e = 659.255
    f = 698.456
    g = 783.991
    a = 880
    b = 987.767
    c = 1046.50
    d = 1174.66
    e2 = 1318.51
    f2 = 1396.91
    g2 = 1567.98
    a2 = 1760
    
    #Eigth note in seconds
    th = 0.275
    
    #Budweiser Song
    forward(1,.125)
    forward(0,.125)
    backward(1,.125)
    backward(0,.125)
    forward(1,.125)
    forward(0,.125)
    backward(1,.125)
    backward(0,.125)
    forward(1,.125)
    forward(0,.125)
    backward(1,.125)
    backward(0,.125)
    forward(1,.125)
    forward(0,.125)
    backward(1,.125)
    backward(0,.125)

    pitch = (e,f,g,a,0,0,0,0,a,b,c,d,c,c,b,b,a,a,g,g,e2,0,0,0,e2,f2,e2,d,d,d,d,d,d,e2,f2,e2,e2,e2,e2,e2,e2,f2,e2,f2,f2,f2,f2,f2,f2,d,e2,f2,e2,e2,e2,e2,e2,e2,f2,g2,a2,a2,a2,a2,a2,g2,0,0,0,a2,f2,d,c)
    for i in pitch:
        beep(th,i)