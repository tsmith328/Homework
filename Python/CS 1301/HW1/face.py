#Tyler M Smith
#Section A06
#tsmith328@gatech.edu
#I worked on this assignment alone, using only this semester's course materials.

from Graphics import *

#Creates window
win = Window('Monty', 400, 400)
win.setBackground(Color('tan'))
#Creates head
head = Circle( (200 , 200) , 150)
head.setFill(Color('white'))
head.draw(win)
#Creates eyes
rightEye = Oval((250,125) , 30 , 12)
leftEye = Oval((150,125) , 30 , 12)
rightEye.setFill(Color('white'))
leftEye.setFill(Color('white'))
rightEye.draw(win)
leftEye.draw(win)
#Creates irises
rightIris = Oval((250,125) , 6 , 10)
leftIris = Oval((150,125) , 6 , 10)
rightIris.setFill(Color('brown'))
leftIris.setFill(Color('brown'))
rightIris.draw(win)
leftIris.draw(win)
#Creates pupils
rightPupil = Circle((250,125) , 2)
leftPupil = Circle((150,125) , 2)
rightPupil.setFill(Color('black'))
leftPupil.setFill(Color('black'))
rightPupil.draw(win)
leftPupil.draw(win)
#Creates nose
nose1 = Line((199,157) , (166,213))
nose2 = Line((166,213) , (199,213))
nose1.draw(win)
nose2.draw(win)
#Creates mouth
mouth = Curve((118,252),(160,296),(245,296),(287,252))
mouth.draw(win)
#Creates tattoo
tat1 = Polygon((247,218),(277,218),(262,188))
tat2 = Polygon((277,218),(307,218),(292,188))
tat3 = Polygon((262,188),(292,188),(277,158))
tat4 = Circle((277,195),39)
tat1.setFill(Color('gold'))
tat2.setFill(Color('green'))
tat3.setFill(Color('purple'))
tat4.setFill(Color('white'))
tat4.draw(win) #Drawn first to keep from covering the triangles
tat1.draw(win)
tat2.draw(win)
tat3.draw(win)