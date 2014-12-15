#Tyler Smith
#tsmith328@gatech.edu
#Section A06
#I worked on this assignment alone, using only this semester's course materials.

from Myro import *
init()

def danceSing():
    sway('forward',3)
    dance1()
    sway('still',1)
    dance2()
    sway('backward',3)
    charleston()

def dance1():
    forward(1,.5)
    backward(1,.5)
    turnLeft(1,3)
    turnRight(1,3)

def dance2():
    backward(1,1)
    turnLeft(1,1.5)
    backward(1,1)
    turnLeft(1,1.5)
    backward(1,1)
    turnLeft(1,1.5)
    backward(1,1)
    turnLeft(1,2)

def charleston():
    s = makeSong("""f f4 1/4; rest 1/8; f f4 5/8; gb gb4 1/4; rest 1/8; gb gb4 5/8; g g4 1/4; rest 1/8; g g4 1/4; gb gb4 1/8; g g4 1/4; d6 d 1/4; rest 1/8; g g4 5/8; g4 1/4; rest 1/8; bb4 d 5/8
    g4 1/4; rest 1/8; d a4 5/8; g4 1/4; rest 1/8; bb4 5/8; a4 1/8; bb4 1/8; a4 1/8; g4 1/4; a4 1/8; g4 1/8; gb4 1/8; f4 1/4; rest 1/8; f4 5/8; gb4 1/4; rest 1/8; gb4 5/8; g4 1/4; rest 1/8; g4 1/4
    gb4 1/8; g4 1/4; d 1/4; rest 1/8; g4 5/8; rest 1/8; a4 1/8; a4 1/8; a4 1/4; g4 1/8; f4 1/4; rest 1/8; g4 1/8; g4 1/8; g4 1/4; f4 1/8; e4 1/4; rest 1/8; a4 1/8; a4 1/8; a4 1/4; g4 1/8; f#4 1/4
    rest 1/8; a4 1/8; a4 1/8; a4 1/4; g4 1/8; f4 1/4; f f4 1/4; rest 1/8; f f4 5/8; gb gb4 1/4; rest 1/8; gb gb4 5/8; g g4 1/4; rest 1/8; g g4 1/4; gb gb4 1/8; g g4 1/4; d6 d 1/4; rest 1/8; g g4 5/8
    g4 1/4; rest 1/8; bb4 d 5/8; g4 1/4; rest 1/8; d a4 5/8; g4 1/4; rest 1/8; bb4 5/8; a4 1/8; bb4 1/8; a4 1/8; g4 1/4; a4 1/8; g4 1/8; gb4 1/8; bb4 1/4; rest 1/8; bb4 5/8; rest 1/4; c 3/8; bb4 1/8
    c 1/4; bb4 1/4; rest 1/8; bb4 5/8; rest 1/4; bb4 1/8; c 1/4; bb4 1/8; c 1/4""")
    t = makeSong("""; g4 1/4; rest 1/8; g4 5/8; rest 1/8; f4 1/8; g4 1/8; a4 1/4; g4 1/8; f4 1/4; bb4 5/4""")
    playSong(s,1)
    playSong(t,1)
    #Two playSong and makeSong pairs were used due to problems I was having after a certain length of the makeSong string

def sway(direction,num):
    if direction == 'forward':
        d = 1
    elif direction == 'still':
        d = 0
    elif direction == 'backward':
        d = -1
    for n in range(num):
        move(d,1)
        if n == 0:
            wait(.75)
        else:
            wait(1.5)
        move(d,-1)
        wait(1.5)
        if n == num - 1:
            move(d,1)
            wait(.75)
    stop()

def happyBirthday():
    s = makeSong("""g4 3/12; g4 1/12; a4 1/4; g4 1/4; c 1/4; b4 2/3; g4 3/12; g4 1/12; a4 1/3; g4 1/3; d 1/3; c 2/3; g4 3/12; g4 1/12; g 1/3; e 1/3; c 1/3; b4 1/3; a 1/3; f 3/12; f 1/12; e 1/3; c 1/3; d 1/3; c 1""")
    playSong(s,2)

def menu():
    while True:
        choice = input('1. Sway forward \n2. Twist \n3. Turn-step\n4. The Charleston \n5. Happy Birthday! \n0. Exit \nPlease choose a song or dance move')
        if choice == '0':
            print('Goodbye!')
            return None
        elif choice == '1':
            sway('forward',2)
        elif choice == '2':
            sway('still',3)
        elif choice == '3':
            dance2()
        elif choice == '4':
            charleston()
        elif choice == '5':
            happyBirthday()
        else:
            print("I'm sorry, but I don't know what you mean.")