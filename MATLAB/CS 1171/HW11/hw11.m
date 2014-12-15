%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : tsmith328@gatech.edu
% Homework     : hw11
% Course       : CS1171
% Instructor   : Smith
% Lecture Time : T 12:00
% TA's Name    : Melaena Roberts
% Section      : E1
% Collaboration: "I worked on the homework assignment alone, using
%                 only course materials."
%
%
% Files provided with this homework:  
%	exp.csv
%	sin.csv
%	AAPL_FY2013.xls
%	AMZN_FY2013.xls
%	MSFT_FY2013.xls
%	movingAverage.p
%	processSlopes.p
%	getCoefficients.p
%	getEquation.p
%	ABCs_numerical_methods.m
%	ABCs_pretest_hw13.p
%   buySellOrHold_soln.p
%   calculus_soln.p
%   compareExtrap_soln.p
%   heartbeat_soln.p
%   linFit_soln.p
%
% Files to submit:
%	ABCs_numerical_methods.m
%	compareExtrap.m
%	linFit.m
%	heartbeat.m
%	buySellOrHold.m
%	calculus.m
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
% Part of this homework is in an m-file starting with ABCs_.  Open this
% file in MATLAB and complete it according to the directions contained
% within.
%
% Once you are done, you can test your ABC file by running the pretest at
% the command prompt, like so:
%
%  >> ABCs_pretest_hw11
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
%	Numerical Methods
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
% PROBLEM 1.   There are two types of people: Those who can extrapolate
%--------------------------------------------------------------------------
%
% Function Name: compareExtrap
% Inputs  (3): - (double) a vector containing x values
%              - (double) a vector containing y values
%              - (double) a double, D, to specify the extrapolated domain
% Outputs (0):
% Plots   (1): - A plot comparing extrapolation methods
%
% Function Description:
%  Write a function "compareExtrap" that takes in x and y values and
%  plots an interp1, spline, and cubic polynomial to compare extrapolation
%  methods. To do so, plot the following on the same plot:
%   1) the original x and y values with blue stars ('b*')
%   2) extrapolation with 100 evenly spaced points from the minimum of the
%      original x values minus D to the maximum of the original x
%      values plus D, where D is an input. The following plots
%      should be:
%        a) interp1 -> plot with a green line
%        b) spline -> plot with a red line
%        c) third order fit -> plot with a black line
%
% Hints:
%  - the linspace() function will be useful in creating evenly spaced
%    points.
%
% Test Cases:
%  x1 = 1:10;
%  y1 = [6 5 9 3 7 8 4 6 1 0.5];
%  x2 = [-10.2 -7 -6.9 -2.5 1.3 5.2];
%  y2 = [4 14 8 -1.2 -6 4.21];
%  x3 = 11:20;
%  y3 = x3.^3 + 2.*x3.^2;
%
% Test Cases:
%   Compare your answers to the answers given by the solution file provided.
%
%  compareExtrap(x1,y1,1)
%
%  compareExtrap(x2,y2,1)
%
%  compareExtrap(x3,y3,5)
%
%==========================================================================
% PROBLEM 2. Let's get linearly fit.
%--------------------------------------------------------------------------
%
% Function Name: linFit
% Inputs  (3): - (string) filename of csv containing all the data points
%              - (double) lower bound x value of linear fit region
%              - (double) upper bound x value of linear fit region
% Outputs (1): - (double) the slope of the linear fit 
% Plots   (1): - A Plot of the data with the linear fit.
% 
% Function Description:
%   Write a function that takes in the name of a csv file containing x-data
%   in the first column and y-data in the second column, and a lower and
%   upper bound of a region over which to do a linear fit. Output the slope
%   of the linear fit and also plot the original data in blue circles and
%   the linear fit with a red line. The plotted linear fit should span from
%   the minimum x of the data to the maximum x (use 100 linearly spaced
%   points to plot it).
%
% Notes:
%   - The lower/upper bound values are independent of the data points. As
%   in, they are not guaranteed to correspond to specific data points.
%   - Round the slope to the nearest thousandths place
%
% Test Cases:
% Compare your answers to the answers given by the solution file provided.
%       slope1 = linFit('sin.csv', -pi/4, pi/4)
%
%       slope2 = linFit('exp.csv', 0,.5)
%==========================================================================
% PROBLEM 3. HeartBeat
%--------------------------------------------------------------------------
%
% Function Name: heartbeat 
% Inputs  (3): - (double) x values for the plot of a patient's heartbeat
%              - (double) y values for the plot of a patient's heartbeat
%              - (double) A 1x2 vector of the range describing normal
%                         blood pressure.
% Outputs (2): - (double) The area under the plot of the heartbeat.
%              - (string) Blood pressure condtion
%
% Function Description:
%    You are a doctor who has discovered a new way of determining a
%    patient's blood pressure condition from the absolute area under a plot
%    of their heartbeat. This is what you have discovered: depending on
%    certain factors in the patient, there is a range for what the healthy
%    area under a heartbeat plot should be. For demonstration, let's say
%    this range is from x1 to x2. Then let A represent the patient's actual
%    area under their heartbeat plot:
%
%       If A < x1, then this patient has 'Low Blood Pressure'.
%       If x1 <= A <= x2, then this patient has 'Normal Blood Pressure'.
%       If x2 < A, then this patient has 'High Blood Pressure'.
%
%    Write a function that takes in the x and y data for a plot of a
%    patient's heartbeat, the range of that patient's healthy range, and
%    outputs the area under their heartbeat plot and their blood pressure
%    condition. The area under the heartbeat plot should be a scalar
%    double, and the blood pressure condition will be one of the three
%    conditions in apostrophes above: 'Low Blood Pressure', 'Normal Blood
%    Pressure', 'High Blood Pressure'.
%
% Hints:
%  - This function requires the absolute area under the plot. So if there
%    are any "negative areas" below the x axis, then these will need to be
%    made positive in your calculations.
%  - Though this function analyzes plot data, and it may help you to look
%    at a plot of the data, there is no output plot of this function.
%  - This function is not intended to be medically accurate. Do not
%    use it diagnose your grandmother's blood pressure.
%
% Test Cases:
%    Compare your answers to the answers given by the solution file
%    provided.
%
%    x1 = [ 0 , 1, 1.5, 2, 3, 4, 5, 6 , 6.5 ,7]; 
%    y1 = [ 0 , 0 , -1, 0 , 5 , 0 , -3 , 0, 1.5, 0];
%    tr1 = [9.250 10.000];
%    [area1,  cond1] = heartbeat(x1,y1,tr1);
%
%    x2 = [ 0 , 1, 1.5, 2, 3, 4, 5, 6 , 6.5 ,7];
%    y2 = [ 0 , 0 , -1, 0 , 8 , 0 , -4 , 0, 2, 0];
%    tr2 = [10 13];
%    [area2,  cond2] = heartbeat(x2,y2,tr2);
%
%
%    x3 = [ 0 , 1, 1.5, 2, 3, 4, 5, 6 , 6.5 ,7]; 
%    y3 = [ 0 , 0 , -1, 0 , 8 , 0 , -4 , 0, 2, 0];
%    tr3 = [13.6 16];
%    [area3,  cond3] = heartbeat(x3,y3,tr3)
%
%==========================================================================
% PROBLEM 4.   Invest with Matlab! (This is not a real investment tool)
%--------------------------------------------------------------------------
%
% Function Name: buySellOrHold
% Inputs  (1): - (char) a string representing the name of a .xls file
% Outputs (1): - (char) a string representing a stock investment decision
% Plots   (1): - A 2x1 subplot of stock analysis data.
%
% Function Description:
%   Your boss was so impressed with your last assignment that she has asked
%   you to write a Matlab function called "buySellOrHold" that will output
%   a stock investment decision (buy, sell, or hold) based on a stock's
%   historical closing prices. She wants the program to function according
%   to the following steps:
% 
%    1) Read in a stock's historical closing prices from an Excel
%       spreadsheet. The prices will be listed under a header called
%       'Close'.
%    2) Compute the 22-point moving average of the stock prices using the
%       movingAverage() function (given).
%    3) Compute the numerical derivative of the moving average.
%    4) Compute the 22-point moving average of the derivative.
%    5) Compute three best fit lines, one for each of the following:
%       i) the last 65 values of the moving average of the stock data
%       ii) the last 130 values of the moving average of the stock data
%       iii) all the values of the moving average of the derivative
%    6) Make two plots using subplot(). In the top subplot, plot the
%       following vectors against trading day number (1, 2, 3, etc.):
%       i) the original stock price in blue
%       ii) the moving average of the stock price in red
%       iii) the 65-point best fit line in black
%       iv) the 130-point best fit line in black
%    7) In the bottom subplot, plot the following against trading day
%       number (2, 3, 4, etc.):
%       i) the numerical derivative in cyan
%       ii) the moving average of the derivative in magenta
%       iii) the best fit line of the moving average of the derivative in 
%            black
%    8) Output a stock decision using the processSlopes() function (given).
%
%  The following functions HAVE ALREADY BEEN WRITTEN, and should be used to
%  help you solve the problem. They are provided in the homework as .p
%  files:
%
%    1. vec_avg = movingAverage(vec, n)
%         Takes in a vector and a number n and outputs the n-point moving
%         average of the input vector. There is some extrapolation at the
%         beginning of the vector.
%
%    2. decision = processSlopes(slope_65, slope_130, slope_d)
%         Takes in three slopes, the first corresponding to the 65-point
%         best fit line, the second corresponding to the 130-point best fit
%         line, and the third corresponding to the best fit line of the
%         moving average of the derivative, and outputs a stock decision
%         ('Buy!', 'Sell!', or 'Hold!').
% 
% Notes:
%  - The 'Close' header may not always be in the same place in the
%    spreadsheet, but it will always be named 'Close'.
%  - The 'Date' header will always be the leftmost.
%  - The number of stock prices in each spreadsheet will be at least 130.
%  - Use the given movingAverage() function. Do not write your own.
%  - Each derivative value should correspond to the later stock price
%    average. For example, if the ordered pairs of the moving average of
%    the stock price are (1,1), (2,1.1), and (3,0.9), then the ordered
%    pairs of the derivative should be (2,0.1) and (3,-0.2).
%  - Don't worry about formatting the plot axes but do make sure to plot
%    every line in the right place.
%  - You may find the diff(), polyfit(), and polyval() functions useful.
%  - Do not interpret the outputs of this function as legitimate investment
%    decisions. This is simply a homework problem.
% 
%   Clarifications after update:
%   1) The excel files have been updated to have the earlier dates first and
%       the most recent dates last. This way, the plot will come out in
%       chronological order.
%   2) The best fit lines should be plotted using the same x-values that they
%       were estimated with. For example, the 65-point best fit line should use the
%       last 65 points of the data vector to estimate a first degree polynomial.
%       Then you should use polyval() to evaluate the 65 y-values corresponding to
%       these 65 x-values and plot the line in black.
% 
% Test Cases:
%   Compare your answers to the answers given by the solution file provided.
%     decision1 = buySellOrHold('AAPL_FY2013.xls')
% 
%     decision2 = buySellOrHold('MSFT_FY2013.xls')
% 
%     decision3 = buySellOrHold('AMZN_FY2013.xls')
%==========================================================================
% PROBLEM 5. MATH 1371
%--------------------------------------------------------------------------
%
% Function Name: calculus
% Inputs  (1): - (char) a polynomial equation
%             
% Outputs (1): - (char) the differentiated polynomial equation
%              - (char) the integrated polynomial equation
%
% Function Description:
%   Write a function that takes in a string of a polynomial equation in the form below
%
%       y=Ax^3+Bx^2+Cx+D
%
%   and returns a string of the differentiated and integrated equation.
%
%   All equations given to you will be in the form above, except that there
%   could be any number of coefficients, as long as there is at least one.
%   Examples:
%       y=4
%       y=7x^19-3x^2
%
% Provided Functions:
%   getCoefficients()
%       This function takes in an equation (as a string) in the
%       'y=Ax^3+Bx^2+Cx+D' format and outputs a vector [A B C D], of class
%       double.
%
%   getEquation()
%       This function takes in a vector of coefficients [A B C D] and
%       outputs a string in the 'y=Ax^3+Bx^2+Cx+D' format. Your input to
%       this must be a vector of doubles.
%
% Specifications:
%   - Make sure you include add a constant "C" when integrating.
%     getEquation() will not do this for you.
%
% Test Cases:
%	Compare your answers to the answers given by the solution file provided. (calculus_soln.p)   
%
%   [diffEq1 intEq1] = calculus('y=8x^3-4x+16')
%  
%   [diffEq2 intEq2] = calculus('y=7')
%
%   [diffEq3 intEq3] = calculus('y=72x^11')
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
