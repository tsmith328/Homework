#Kamryn Harris and Tyler Smith
#kharris48@gatech.edu , tsmith328@gatech.edu
#We worked on this assignment alone, using only this semester's course materials.

def circleArea(radius):
    import math
    area = math.pi * (radius ** 2)
    print( "The circle's area is" , area )

def circleCircumference(diameter):
    import math
    radius = diameter / 2
    circumference = 2 * math.pi * radius
    return circumference