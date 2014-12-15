#Tyler Smith and Kamryn Harris
#tsmith328@gatech.edu and kharris48@gatech.edu
#CS 1301 Section A06
#We worked on this assignment alone, using only the semester's course materials.

def mass(kg):
    stone = kg * 0.157
    return stone

def volume(liter):
    pint = liter * 2.11
    print('There are %.2f' % pint , 'US pints in %.2f' % liter , 'liters.')

def monkeys(monkeys):
    hockeyPucks = monkeys * 37.62533333333
    print('There are %.4f' % hockeyPucks , 'hockey pucks in %.6f' % monkeys , 'average spider monkeys.')

def tipCalculator():
    import math
    bill = input('How much is your bill?')
    tip = input('What percent do you want to leave your server? Do not include the percentage sign.')
    bill = float(bill)
    tip = float(tip) / 100  #tip as a percent
    tipAmount = bill * tip
    tipAmount = math.ceil(tipAmount) #Rounds tip to next dollar
    taxAmount = bill * 0.078 #calculates tax
    taxAmount = round(taxAmount , 2) #Rounds to cents
    total = bill + tipAmount + taxAmount #Calculates total bill
    print('Tax is: $%.2f' % taxAmount) #formats amounts to two decimals
    print('Tip is: $%.2f' % tipAmount)
    print('Total is: $%.2f' % total)