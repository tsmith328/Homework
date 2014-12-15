#Tyler Smith, Kamryn Harris, Weiyi Chen
#tsmith328@gatech.edu, kharris48@gatech.edu, wchen376@gatech.edu
#A06
#We worked on this project alone as a group, using this semester's course materials

#the second robot
from Myro import*

def waltz2():
  x=0
  while x<5:
    turnLeft(2,.5)
    forward(1,.25)
    backward(1,.1)
    forward(1,.5)
    backward(1,.25)
    forward(1,.1)
    backward(1,.5)
    x=x+1
  motor(1.5,0.1,1.5)
  motor(1.5,1.5,0.1)
  motor(1.5,-0.1,-1.5)
  motor(1.5,-1.5,-0.1)
