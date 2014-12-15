%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : tsmith328@gatech.edu
% Homework     : hw02
% Course       : CS1371 (CS 1171)
% Instructor   : Smith
% Lecture Time : T 12:00
% TA's Name    : Melaena Roberts
% Section      : E1
% Collaboration: "I worked on the homework assignment alone, using
%                only course materials."
%                
%
%
% Files provided with this homework:  
%	wreckIt.p
%	marbles.p
%	oddAndDivisible.p
%	shortCuts.p
%	busInfo.p
%	cityInfo.p
%	schoolRoster.p
%	ticketPrice.p
%	tripPlanner.p
%	ABCs_functions.m
%   ABCs_hw02_pretest.p
%
% Files to submit:
%   hw02.m
%	ABCs_functions.m
%	wreckIt.m
%	marbles.m
%	oddAndDivisible.m
%	ShortCuts.m
%	tripPlanner.m
%
% Instructions:
%   1) Follow the directions for each problem very carefully or you will
%   lose points.
%   2) Make sure you name functions exactly as described in the problems or
%   you will not receive credit.
%   3) Read the announcements! Any clarifications and/or updates will be
%   announced on T-Square. Check the T-Square announcements at least once
%   a day.
%   4) You should not use any of the following functions in any file that 
%   you submit to T-Square:
%       a) clear
%       b) clc
%       c) solve
%       d) input
%       e) disp
%       f) close all
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%==========================================================================
% PART 1.  ABC Problems
%--------------------------------------------------------------------------
%
% Part of this homework is an m-file called "ABCs_functions". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_functions.m
% ABCs File Testing:
%  >> ABCs_hw02_pretest.p
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	Functions
%
% Follow the directions carefully and make sure files names as well as
% function headers are written exactly as described in the problem text. If
% your function headers are not written as specified, then you will recieve
% an automatic zero for the problem.
%
% All drill problems must be functions (i.e. contain valid function
% headers).  Any scripts turned in will be given a 0 automatically.
%
%==========================================================================
% PROBLEM 1. I'M GONNA WRECK IT!
%--------------------------------------------------------------------------
%
% Function Name: wreckIt 
% Inputs  (3): - (double)   A number depicting the force of a single hit
%              - (double)   A number depicting the total number of hits
%                               performed
%              - (double)   A number depicting the critical load of the
%                               structure
% Outputs (2): - (logical)  A logical depicting whether the building will 
%                               be wrecked.
%
% Function Description:
%
%   In Disney's game "Fix-It Felix, Jr.", "Wreck-It" Ralph aims to destroy
%   buildings by pummling them with his massive (and impressive) fists and
%   lightning speed. However, Ralph has brains as well as brawn.
%   Believe it or not, good ol' Ralph is an engineer.  He knows that he
%   needs to excert the proper amount of force in order to overcome the
%   building's critical load (the amount of load - or force - that the
%   structure can withstand before buckling - or collapsing).  A man with a
%   plan, "Wreck-It" Ralph uses MATLAB to help him figure out what he needs
%   to do for the upcoming levels.
%
%   Ralph's fists move so fast, all of his hits can be modeled as happening
%   at the same time.  Knowing the preset critical load of the building,
%   Ralph models the building as a simple column (assume end conditions are
%   taken cared of in the preset critical load).  This model system allows
%   Ralph to calculate the force of his hits as a single net load acting
%   down on the simple column (the building). Like so:
%
%       | | | (3 hits, each of force x)       | (single net load = 3 * x)
%       V V V                                 V
%       ------ (building)                     | (simple column)
%      |      |                -->            |
%      |      |             modeled as        |
%      |______|                               |
%
%   Write a function called "wreckIt" that calculates the net force of
%   Ralph's hits and compares it to the critical load of the building.  The
%   function will output a logical true if Ralph would successfully wreck
%   the building (net load is greater than the critical load), and a
%   logical false if the building withstands Ralph's efforts (net load is
%   less than the critical load).
%
% Hints:
%   - the use of logical operators might prove useful
%           == "is equal"
%           <  "is less than"
%           >  "is greater than"
%           <= "is less than or equal to"
%           >= "is greater than or equal to"
%   - logical operators *ALWAYS* return a logical
%           i.e. 4 >= 3 returns true
%                5 == 10 returns false
%   - Assume force and critical load inputs are of the same units
%
% Test Cases:
%   wrecked1 = wreckIt(900,5,3000);
%       wrecked1 => true
%
%   wrecked2 = wreckIt(874.5,12,20000);
%       wrecked2 => false
%
%   wrecked3 = wreckIt(125,25,5000);
%       wrecked3 => false
%
%==========================================================================
% PROBLEM 2. How many marbles?
%--------------------------------------------------------------------------
%
% Function Name: marbles
% Inputs  (3): - (double) height of the container
%              - (double) diameter of the container
%              - (double) estimated diameter of a marble
% Outputs (1): - (double) estimated number of marbles
%
% Function Description:
%   There is a contest in the local mall.  There is a giant cylinder shaped
%   glass container full of marbles.  The winner of the contest is the
%   person who can get the closest guess to the number of marbles is.  In
%   order to give your guess, you will use the given dimensions of the
%   cylinder containter and the estimated diameter of one marble.
%
%   Write a function named "marbles" that takes in the height of the
%   container (in inches), the diameter of the container (in inches), and
%   the estimated diameter of a marble (in inches), and use it to determine
%   the estimated number of marbles in the container (numMarblesEst).
%   Because you can't have a fraction of a marble, you should round UP to
%   the nearest marble (ie. 47.3 marbles becomes 48 marbles)
%
% Formulas Needed:
%   - You will need the following formulas for this problem:
%         ~ Volume of Cylinder: pi.*(radius.^2).*height
%         ~ Volume of Sphere: (4/3).*pi.*(radius.^3)
%   - The number of marbles is estimated to be number of marbles (volume)
%     that can fit into the total volume of the container.  Do not try to
%     account for any empty space between marbles.
%
% Test Cases:
%   heightC1 = 75;
%   diameterC1 = 10;
%   diameterMarEst1 = 3;
%
%   estNumMarbles1 = marbles(heightC1, diameterC1, diameterMarEst1);
%       estNumMarbles1 => 417
%
%   heightC2 = 30;
%   diameterC2 = 5;
%   diameterMarEst2 = 1.5;
% 
%   estNumMarbles2 = marbles(heightC2, diameterC2, diameterMarEst2);
%       estNumMarbles2 => 334
%==========================================================================
% PROBLEM 3. Oddly Invisible?
%--------------------------------------------------------------------------
% 
% Function Name: oddAndDivisible
% Inputs  (3): - (double) a number to check
%              - (double) first divisor
%              - (double) second divisor
% Outputs (1): - (logical) logical to see if the first input is odd and
%                          divisible by the second and third inputs
%
% Function Description:
%   Write a function, oddAndDivisible, that checks to see if the first
%   input is odd and divisible by the second and third inputs.  If all the
%   conditions are met, the function should output true.  If even
%   one of these conditions are not met, then the function should output
%   false.
%
% Example:
%   If the function call was:
%
%       log = oddAndDivisible(35, 5, 7)
%
%   First, it checks to see if 35 is odd (which it is).  It would then
%   check to see if 35 is divisible by 5 (which it is).  It would then
%   check to see if 35 is divisible by 7 (which it is).  Because all of
%   these conditions are true, then:
%   
%       log => true
%
%   However, if the call was:
%
%       log = oddAndDivisible(30, 5, 6)
%
%   First it checks to see if 30 is odd (which it isn't).  Therefore
%
%       log => false
%
% Notes:
%   - All numbers will be real, positive integers (Zero will not be given)
%   - logical operators will prove useful
%
%
% Test Cases:
%
%   log1 = oddAndDivisible(35, 5, 7);
%       log1 => true
%
%   log2 = oddAndDivisible(30, 5, 6);
%       log1 => false
%==========================================================================
% PROBLEM 4. Go to class, but not through the grass! Right...
%--------------------------------------------------------------------------
%
% Function Name: shortCuts 
% Inputs  (2): - (double)   A number depicting a length in feet
%              - (double)   A number depicting a second length in feet
% Outputs (2): - (double)   A difference in steps taken
%                (double)   A difference in seconds
% 
% Function Description:
%
%   Everyone knows that cutting through the grass, and taking similar
%   shortcuts, saves time and effort when getting to class.  The classic
%   idiom, "work smarter, not harder," comes to mind.  Though, how much
%   time and energy are you really saving?
%
%   Write a function called "shortCuts" that takes in two numbers, both
%   representing side lengths of a walkway, measured in feet, and outputs
%   the difference in steps taken, between walking around (the long way)
%   and cutting through in a straight line (the short way). The function's
%   second output is the time you saved by taking the shortcut, measured in
%   seconds.  Assume the walkway forms a right angle; so, the two inputs
%   will be side lengths.  When converting the lengths from feet to steps,
%   the function will utilize paces.  One pace is two steps and averages at
%   about 5 feet in length.  Steps saved should be rounded up to the next
%   whole number, and time saved should be rounded to the nearest hundreth.
%
% Notes:
%   - sqrt(), round(), and ceil() will be useful
%   - The average walking speed of a human is 3.1 miles per hour
%   - There are 5280 feet in a mile
%   - 5 feet = 1 pace = 2 steps
%
% Test Cases:
%   [step1,time1] = shortCuts(250,300); %this is tech green (approximately)
%       step1 => 64
%       time1 => 35.08
%
%   [step2,time2] = shortCuts(47,93);
%       step2 => 15
%       time2 => 7.87
%
%   [step3,time3] = shortCuts(30,40));
%       step3 => 8
%       time3 => 4.40
%
%==========================================================================
% PROBLEM 5.   The Wheels on the Bus
%--------------------------------------------------------------------------
%
% Function Name: tripPlanner
% Inputs  (3): - (double) The school code
%                (double) The area code for the city you are travelling to 
%                (double) The VIN number of the bus you are using
% 
% Outputs (1): - (double) The cost of the trip per student
%
% Function Description:
%   As the new Vice Principal at the local elementary school, you have been
%   tasked with determining how much money each student will have to pay
%   for the upcoming field trip for the second graders, so you decide to 
%   let Matlab do the work for you!
%
%   Write a function that takes in 3 inputs (listed above) and calculates
%   the price each second grade student will have to pay for the trip. 
%
%   **Your answer should also include $40 per student for food**
%
%   The following functions HAVE ALREADY BEEN WRITTEN, and should be used
%   to help you solve the problem, they have been provided in the homework
%   as .p files:
%     1. [totalSchool,secondGrade] = schoolRoster(schoolCode)
%         ->Takes in a school code and outputs the total number of kids in
%         the school, and the percent (in decimal format) that are in
%         second grade. (i.e. 20% second graders would be outputted as
%         0.20)
%
%     2. [miles,galPrice,tax] = cityInfo(areaCode)
%         ->Takes in the area code of the city you are travelling to and
%         outputs the miles from your city to the destination city, the
%         average gas price along the way, and the sales tax associated
%         with that cities ticket purchases
%
%     3. [mpg] = busInfo(miles2Travel,VIN)
%         ->Takes in the total miles the bus will travel and the VIN
%         (vehical identification number) number of the bus, and outputs
%         the mpg (miles per gallon) that the bus will average over the
%         trip
%
%     4. [price] = ticketPrice(areaCode,miles,totalPeople)
%         ->Takes in the areaCode of the city you are travelling to, the
%         total distance from your city, and the total number of people you
%         are bringing, and outputs the ticket price to the nearest theme
%         park
%
%   Your answer should be rounded UP to the nearest Dime so: 
%       If you calculate a price of 123.26 then you should output 123.30
%       If you calculate a price of 50.00 then you should output 50.00
%       If you calculate a price of 299.99 then you should output 300.00
%
% Notes: 
%   - Only the second graders are going on the trip, so you must use the
%   percentage of second graders outputted by schoolRoster, along with the
%   total number of students, to calculate how many students are going on
%   the trip. 
%   - The sales tax will ONLY be added to the price of the ticket
%   - The price of gas will be divided evenly among ALL of the second grade
%     students
%   - Do not round the price until you have calculated the final price
%   - Always round up to the nearest whole number of students when
%   calculating the total number of students attending the trip
%             i.e. If there are 400 total students, and 45.7% of them are
%             second graders, then you should round up to 183 total second
%             graders. (400*0.457=182.8)
%   - The tax will be in decimal format (a 7.5% tax will be inputted as
%   0.075)
%   - Again **Your answer should also include $40 per student for food**
%
% Hints:
%   ~ Think about how the following formula rounds up to the nearest CENT, 
%     and then apply it to our needs: 
%           rounded = ceil(price.*100) ./ 100
%   ~ You can call existing functions into the function you are writing.  
%           This includes .p files. i.e.:
%               If myFunc.p is in the current folder, out = myFunc(in) can
%               be written in a function.
%
% Test Cases:
%   price1 = tripPlanner(354,702,18316741)
%       price1 = 65.4000
% 
%   price2 = tripPlanner(001,898,14313961)
%        price2 = 121.6000
%         
%   price3 = tripPlanner(288,456,17345678)
%        price3 = 61.8000
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
