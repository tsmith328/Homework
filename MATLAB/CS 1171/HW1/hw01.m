%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : tsmith328@gatech.edu
% Homework     : hw01
% Course       : CS 1171
% Instructor   : David Smith
% Lecture Time : T 12:00
% TA's Name    : Melaena Roberts
% Section      : E1
% Collaboration: "I worked on the homework assignment alone, using
%                  only course materials."
%                 
%
%
% Files provided with this homework:  
%	DistForm_soln.p
%	candy_soln.p
%	probability_soln.p
%	ABCs_functions.m
%	ABCs_pretest_functions.p
%   ABCs_HomeworkOverview.m
%   ABCs_pretest_HomeworkOverview.p
%
%       Note: ABCs_HomeworkOverview.m WILL NOT be graded.  However, it is
%       *highly* encouraged that you read the CS 1371 Homework Guide and do
%       the ABCs_HomeworkOverview.  The Homework Guide will explain what
%       you need to know to be successful on these homeworks.
%
% Files to submit:
%	ABCs_functions.m
%	DistForm.m
%	candy.m
%	probability.m
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
% SEMICOLON USE
%--------------------------------------------------------------------------
%
% From now on, you should be using semicolons at the end of each line of
% code to suppress the outputs.  This means your code will not print values
% onto the screen. By using semicolons, your code will run much faster.  In
% addition, grading your code will also take less time.  You are therefore
% strongly encouraged to use semicolons to suppress all of your outputs.
%
%==========================================================================
% COMMENTING
%--------------------------------------------------------------------------
%
% Whenever you program, it is always a good idea to comment your code.
% Commenting helps you keep track of what you are attempting to code, and 
% it helps others in understanding why you wrote various lines of code.  
% Since the AutoGrader does not give partial credit for attempting a 
% problem, we have added a commenting system to give some incentive to at 
% least attempt each problem. From now on, when you write a solution to a
% problem, you should comment your code and explain what you were 
% attempting to code. Some good places to comment would be sections of your
% code that directly relate with your algorithm. However, don't comment
% every line of code. Instead comment the lines of code that are either  
% difficult to understand or are important to solving the problem. 
%
% Commenting will purely be for extra-credit purposes, so if you don't want
% to comment your code, you don't have to. Your Section TA will grade the
% comments from each Homework and will keep track of your commenting points
% throughout the semester. Commenting points will not change the score you
% receive on a homework assignment, but they will be factored into your
% homework average at the end of the semester. 
%
% Finally, if you come to help desk, you are expected to have your code
% commented. If a TA sees that your code is not commented, he or she will
% move on to another student until you comment your code.
%
%==========================================================================
% PART 1.  ABC Problems
%--------------------------------------------------------------------------
%
% Part of this homework is in an m-file starting with ABCs_.  Open this
% file in MATLAB and complete it according to the directions contained
% within.
%
% Once you are done, you can test your ABC file by running the pretest at
% the command prompt, like so:
%
%  >> ABCs_pretest_functions
%
% Alternatively, you can right button click the file in the Current Folder
% window and click "Run".  You cannot open the file by double clicking it.
% If you have problems running the pretest, then you probably need a newer
% version of MATLAB.  Newer versions of MATLAB are available free to you.
% Please read David Smith's announcement "Matlab 'Free' Access" for further
% information.  Be sure the pretest and your ABC file are in the same
% directory.
%
% The pretest is simply an aide to help you test your code.  While we
% strive to supply a quality pretest file for you to use, a sucessful
% result with a pretest file does not ensure awarded points on the
% homework.  The pretest is merely a guide to help you complete the ABCs.
%
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
% PROBLEM 1. He's Going The Distance
%--------------------------------------------------------------------------
%
% Function Name: DistForm 
% Inputs  (4): - (double)   A number depicting the x value of the point 1
%              - (double)   A number depicting the y value of the point 1
%              - (double)   A number depicting the x value of the point 2
%              - (double)   A number depicting the y value of the point 2
% Outputs (1): - (double)   The distance between the two points
% 
% Function Description:
%
%   Write a function called "DistForm" that uses the distance formula to
%   find the distance between two points.  The points will be broken into
%   their components for the input values.  So, the first two input values
%   will be the x and y values, respectively, of the first point, and the
%   last two inputs will be the x and y values, respectively, of the second
%   point.
%
% Notes:
%   - Distance = sqrt((x1-x2)^2+(y1-y2)^2)
%
% Test Cases
%   out1 = DistForm(4,5,7,9);
%       out1 => 5
%
%   out2 = DistForm(4,3,-7,-10);
%       out2 => 17.0294
%
%   out3 = DistForm(0,0,0,0);
%       step3 => 0
%
%==========================================================================
% PROBLEM 2. Who wants some candy?
%--------------------------------------------------------------------------
% 
% Function Name: candy
% Inputs  (2): - (double) size of the bag of candy
%              - (double) number of kids
% Outputs (2): - (double) pieces of candy per kid
%              - (double) pieces of candy wasted
%
% Function Description:
%   You are at a birthday party and buy a bag of candy to hand out to each
%   of the kids who attend.  But in order to be fair, every kid has to get
%   the same number of pieces, and any pieces left over in the bag are
%   considered to be wasted.
%
%   Write a function named "candy" that takes in the number of pieces of
%   candy in a given bag and determine how many pieces of candy each kid
%   gets, and how many pieces of candy are wasted.
%
% Example:
%   If the size of the bag was 50 pieces, and there were 4 kids at the
%   party, each kid would get 12 pieces of candy while 2 pieces of candy
%   would be wasted.
%
%
% Notes:
%   - You may find the floor() and mod() functions useful
%
% Test Cases:
%   bagSize1 = 512;
%   numKids1 = 22;
%   
%   [pieces1, wasted1] = candy(bagSize1, numKids1);
%       pieces1 => 23
%       wasted1 => 6
%
%   bagSize2 = 300;
%   numKids2 = 17;
%
%   [pieces2, wasted2] = candy(bagSize2, numKids2);
%       pieces2 => 17
%       wasted2 => 11
%
%==========================================================================
% PROBLEM 3. Apples to Apples
%--------------------------------------------------------------------------
% 
% Function Name: probability
% Inputs  (4): - (double) the number of red apples in a bag
%              - (double) the number of green apples in a bag
%              - (double) the percentage of red apples that are rotten
%              - (double) the percentage of green apples that are rotten
% Outputs (2): - (double) the probability of pulling a non-rotten red apple
%              - (double) the probability of pulling a non-rotten green
%                         apple
%
% Function Description:
%   Write a function called "probability" that takes in four parameters:
%   the number of red apples in a bag, the number of green apples in a bag,
%   the percentage of red apples that are rotten, and the percentage of
%   green apples that are rotten. The function should then calculate the
%   probability of pulling a non-rotten red apple or a non-rotten green
%   apple from the bag and then output these values as percentages.
%
% Notes:
%   - You will only be pulling one apple from the bag, but you will need
%     to calculate the probability of both cases.
%   - The number of rotten apples is guaranteed to be a whole number.
%   - Percentages will be represented as a whole number, i.e. 25% will be 
%     given as 25, not .25. 
%
% Test Cases:
%   [red1 grn1] = probability(10, 10, 20, 50);
%       red1 => 40
%       grn1 => 25
%
%   [red2 grn2] = probability(35, 2, 80, 0);
%       red2 => 18.9189
%       grn2 => 5.4054
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
