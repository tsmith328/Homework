#Weiyi Chen, Tyler Smith, Kamryn Harris
#tsmith328@gatech.edu, kharris48@gatech.edu, wchen376@gatech.edu
#A06
#We worked on this project alone as a group, using this semester's course materials.


#the robot with hello kitty robot
from Myro import*
#init("/dev/tty.scribbler")

def helloKitty():
   i=0
   while i<5:
     turnLeft(1,0.5)
     turnRight(1,0.5)
     i=i+1
def motor(t,l,r): #helper function
     motors(l,r)
     wait(t)
     stop()

def excited():
    for i in timer(2):
       forward(1,0.1)
       backward(1,.1)


def waltz1():
  #forward(2,2)
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

def moonwalk():
    for t in timer(10):
        backward(1)
        rotate(.5)
        rotate(-.5)
        stop()

def sprinkler():
    for t in timer(10):
        turnLeft(1,.2)
        turnRight(1,.2)
        turnLeft(1,.2)
        turnRight(1,.2)
        turnLeft(1,.2)
        turnRight(1,.2)
        turnLeft(1,.2)

