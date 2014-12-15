# Tyler M Smith
# Section A06
# tsmith328@gatech.edu
# I worked on this assignment alone, using only this semester's course materials.

import math
def celciusToFahrenheit():
    c = float(input('Enter temperature in Celcius'))
    c1 = c / 5  #F = ((9/5) * C ) + 32
    c2 = c1 * 9
    c3 = c2 + 32
    print('The temperature in Fahrenheit is:' ,c3, 'degrees.')

def cylinderVolume():
    r = float(input('Cylinder radius (in inches)'))
    h = float(input('Cylinder height (in inches)'))
    v = math.pi * h * (r**2)
    print('The cylinder\'s volume is:' ,v, 'inches cubed.')

def timeCleanUp():
    t = int(input('Please enter a whole number of seconds'))
    seconds = t % 60 #Finds the remaining number of seconds
    t2 = t // 60  #Finds the number of whole minutes
    minutes = t2 % 60 #Finds the remaining number of minutes
    t3 = t2 // 60 #Finds the number of whole hours
    hours = t3 % 24 #Finds the number of remaining hours
    t4 = t3 // 24 #Finds the number of whole days
    days = t4 % 7 #Finds the number of remaining days
    weeks = t4 // 7 #Finds the number of whole weeks
    print('That corresponds to:', weeks, 'weeks,', days, 'days,', hours, 'hours,', minutes, 'minutes, and', seconds, 'seconds.')

def rohrerIndex():
    weight = float(input('What is your weight (in pounds)?'))
    height = float(input('How tall are you (in inches)?'))
    h = height ** 3 #Cubes height
    ratio = weight / h #Divides weight by the cube of height
    RI = ratio * 2768 #Multiplies by constant
    RI_round = round(RI,1)
    RI_str = str(RI_round) #Converts RI value to string for concatenation
    print('Your RI is', RI_str + '.')
    """Concatenation used in order to add the period at the
    end of the sentence without a space between the
    value and period."""