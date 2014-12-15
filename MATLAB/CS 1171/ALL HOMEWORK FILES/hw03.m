%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : 902836109
% Homework     : hw03
% Course       : CS1171
% Instructor   : Smith
% Lecture Time : T 12:00
% TA's Name    : Melaena Roberts
% Section      : E1
% Collaboration: "I worked on the homework assignment alone, using
%                 only course materials."
%
%
%
% Files provided with this homework:  
%	ABCs_vectors.m
%	ABCs_arrays.m
%	RateMyProf_soln.m
%	angPlane_soln.m
%	stretchArr_soln.m
%	arrayReplace_soln.m
%	barrelShift_soln.m
%	polarVortex_soln.m
%
% Files to submit:
%   hw03.m
%	ABCs_vectors.m
%	ABCs_arrays.m
%	RateMyProf.m
%	angPlane.m
%	stretchArr.m
%	arrayReplace.m
%	barrelShift.m
%	polarVortex.m
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
%  >> ABCs_pretest_hw03
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
%	Vectors and Arrays
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
% PROBLEM 1. Rate My Professor
%--------------------------------------------------------------------------
% 
% Function Name: RateMyProf
% Inputs  (1): - (double) A 2*n array containing the student ID and their 
%                         ratings
% Outputs (2): - (double) Average of the highest three ratings 
%              - (double) A 1*3 vector containing the student ID of the
%                         three lowest ratings
%
% Function Description:
%   After weeks of class, Professor Smith is eager to know how his students
%   think of him and his class. He secretly lets n number of students rate
%   his class. After he gets all the ratings, he wants you to pick out the
%   highest three and take the average, which he would use and would be
%   published on the Gatech official website. Then you need to find the
%   lowest three scores and identify the three who are so unsatisfied with
%   his class so he could give them some special treatment.
%
%   The input array will be a 2*n array. The first row are the student IDs,
%   the second row are their corresponding ratings. The first output is a
%   the average of the higest 3 ratings, and the second output is a 1*3
%   vector containing the student IDs of whom gave the lowest three scores
%   (in ascending order based on rating given by student).
%   
%
% Notes:
%   - The number of ratings is guaranteed to be over 6.
%   - The student ID would be all different.
%   - The vector output needs to be in ascending order, based on rating.
%
% Hints:
%   - The max(), min(), and sort() functions all have two outputs.  This
%     second output should be useful.
%   - Of course, you don't need iteration to solve this question.
%
% Test Cases:
%   A = [23, 12, 24, 25, 91, 41;
%        100, 95, 90, 25, 59.9, 69];
%
%   [avg, ID] = RateMyProf(A); 
%           avg => 95
%           ID => [25, 91, 41];
%
%   B = [13,66,33,25,64,32,62,76,14;56,43,32,54,76,87,12,44,31];
%   
%   [avg2,ID2] = RateMyProf(B);
%           avg2 => 73
%           ID2 => [62 14 33]
%
%==========================================================================
% PROBLEM 2. Everything's a Little Better with Some Linear Algebra
%--------------------------------------------------------------------------
%
% Function Name: angPlane
% Inputs  (3): - (double)   A 1xn vector indicating the coordinates of the
%                           first airplane
%              - (double)   A 1xn vector indicating the coordinates of the
%                           second airplane 
%              - (double)   A 1xn vector indicating the coordinates of the
%                           airport
% Outputs (1): - (double)   Angle in degrees at which the two airplanes 
%                           left the airport
% 
% Function Description:
%       Position coordinates of two airplanes and the airport from which
%       the two airplanes left are given. Your function should compute the
%       angle between the two airplanes when they leave the airport. To do
%       so, we shall use some tricks from linear algebra.
%
%       First, we need to define the directional vectors for both airplanes
%       by subtracting the airport coordinate from each airplane
%       coordinate. Let the two resulting displacement vectors be u and v.
%
%       Next, use the following formula where th = angle between the two
%       airplane flights.
%
%                           cos(th) = u*v / (|u|*|v|)
%
%       Note that u*v is the dot product(not to be confused with the .* or
%       the * Matlab operators - this IS NOT the * MATLAB operator) of the
%       two vectors u and v, where you multiply the corresponding element
%       of each vector and sum them.
%       
%               For example, <3,-1> * <2, 7> = 3*2 + -1*7 = -1 
%
%       Futhermore, |u| is the magnitude of vector u. It is found by 
%       taking the square root of the sum of the elements squared.
%
%               For example, |<3, -4>| = sqrt(3^2 + (-4)^2) = 5 
%
% Notes:
%   - It will be useful to learn how the Matlab operators .* ./ .^ works. 
%   - The inputs vectors are NOT guaranteed to be 2 dimensional (may have
%     more than two elements).
%   - The function acosd() will be useful. It is the arccos or cos^-1
%     Matlab function.
%   - Round (using round) the final answer to nearest tenth in DEGREES.
%
% Test Cases:
%   
%   out1 = angPlane([11,0], [0 23], [0 0]);
%       out1 => 90
%
%
%   out2 = angPlane([10 9], [-2 4], [0 1]);
%       out3 => 85
%      
%
%   out2 = angPlane([12 13 89], [-23 11 -9], [0 1 -1]);
%       out3 => 111.3000
%
%  
%
% =========================================================================
% PROBLEM 3.  Hang on guys, I gotta stretch first.
% -------------------------------------------------------------------------
% 
% Function Name: stretchArr 
% Inputs  2): - (double) An MxN array
%             - (double) A scaling factor by which to stretch or compress
%                        the array
%                         
% Outputs (1): - (double) The new array with the applied factor
% 
% Function Description:
% Write a function that stretches or compresses a given array with a
% given factor. 
%   - If the factor is less than 1, the array should be compressed; 
%   - if the factor is greater than 1, the array should be stretched by 
%     adding duplicate elements;
%   - if the factor is equal to one, the array should be unchanged. 
% For example, if
%
%                        array = [45 67 23
%                                 3  12 6 ]
%               scaling factor = 2
% 
% then the dimensions of the output array should be 4x6, and filled in with
% appropriate duplicate elements:
% 
%                 output array = [45 45 67 67 23 23
%                                 45 45 67 67 23 23
%                                 3  3  12 12 6  6 
%                                 3  3  12 12 6  6 ]
% Note:
% - the input array is guaranteed to have at least one element
% - inputs are guaranteed such that the function will not return an empty
%   matrix. for example, stretchArr(1,0.5)
% 
% Hints:
% - try manipulating an index array first, rather than manipulating the
%   actual array itself
% - you may find the reshape(), linspace() and round() functions useful.
% 
% Test Cases:
%   arr1 = [45 67 12 4 ;
%           3  12 43 1 ;  
%           2  1  4  6 ;
%           34 12 7 55];
%   out1 = stretchArr(arr1, 0.5);
%       out1 => [45  4; 
%                34 55]
% 
%   arr2 = [21 3 4];
%   out2 = stretchArr(arr2, 3);
%       out2 => [21 21 3  3  3  3  4  4  4;
%                21 21 3  3  3  3  4  4  4;
%                21 21 3  3  3  3  4  4  4]
% 
%  arr3 = [240 45 56; 
%          23  5  18];
%  out3 = stretchArr(arr3, 1);
%      out3 => [240 45 56;
%               23  5  18]
%==========================================================================
% PROBLEM 4. Behind the Mask
%--------------------------------------------------------------------------
% 
% Function Name: arrayReplace
% Inputs  (3): - (double) A MxN array 
%              - (double) A MxN array
%              - (double) A number  
% Outputs (1): - (double) The original array with the replacements made
%
% Function Description:
%   Write a function called "arrayReplace" that takes two arrays and a
%   number and replaces all instances of that number in the first array
%   with the numbers in the corresponding positions of the second array. If
%   the number does not exist in the array, it should just return the
%   original array with no changes.
%
% Notes:
%   - You can assume the arrays will always be the same size. 
%
% Hints: 
%   - When you use logical indexing with an array, it returns an array of
%     logicals. This is called a "mask". See how you can use this to solve
%     the problem. 
%
% Test Cases:
%   arr1 = [9     9     9     9
%           9     7     7     9
%           9     7     7     9
%           9     9     9     9];
% 
%   arr2 = [5     5     5     5
%           5     0     1     5
%           5     2     3     5
%           5     5     5     5];
%
%   out1 = arrayReplace(arr1, arr2, 7);
%       out1 => [9     9     9     9
%                9     0     1     9
%                9     2     3     9
%                9     9     9     9]
%
%   out2 = arrayReplace(arr1, arr2, 9);
%       out2 => [5     5     5     5
%                5     7     7     5
%                5     7     7     5
%                5     5     5     5]
%
%   out3 = arrayReplace(arr1, arr2, 6);
%       out3 => [ 9     9     9     9
%                 9     7     7     9
%                 9     7     7     9
%                 9     9     9     9]
%
%==========================================================================
% PROBLEM 5.  Do a Barrel Roll!
%--------------------------------------------------------------------------
%
% Function Name: barrelShift 
% Inputs  (2): - (double) a vector
%              - (double) the number of times to shift the vector
% Outputs (1): - (double) the shifted vector
%
% Function Description:
%   Write a function called "barrelShift" that takes in a vector (first
%   input) and the number of times the vector is to be shifted (second
%   input) and outputs the vector after the given amount of shifts has been
%   performed. Each time the vector is shifted, it snakes around by going
%   down the columns. If a number is on the last column, it then shifts to
%   the first column. For example, if you have avector that looks like
%   this:
%
%                 vec =  [10 11 12 13]
%
%   it will look like this after you perform a barrel shift:
%
%                           1 time:  [13 10 11 12]
%
%                           2 times: [12 13 10 11]
%
%                           3 times: [11 12 13 10]
%
%                           4 times: [10 11 12 13]
% 
%   Basically, every time you do one barrel shift the elements are shifted
%   across the columns to the right. The number at the end is moved to the
%   front position. This process is repeated for the number of shifts
%   specified. If the number of shifts is negative, then the vector should
%   be barrel shifted to the left instead of the right.
%
% Notes:
%   - If the number of shifts is zero, then the function should return the
%     original array.
%   - You may *not* use the function 'circshift'
%
% Hints:
%   - Remember if you try to index out of an array's boundary or index 
%     with a negative number, it will produce an error.
%   - You may find the mod() and length() functions useful.
%
% Test Cases:
% 	A = [4 5 6 7 8];
%   B = [1 5 2 6 3 7 4 8];
%   C = [2 10 5 7 1 12 8 6 3 4 9 11];
%
%   shifted1 = barrelShift(A, 2);
%       shifted1 => [7 8 4 5 6]
%
%   shifted2 = barrelShift(B, 5);
%       shifted2 => [6 3 7 4 8 1 5 2]
%
%   shifted3 = barrelShift(C, 33);
%       shifted3 => [7 1 12 8 6 3 4 9 11 2 10 5]
%
%   shifted4 = barrelShift(C, -3);
%       shifted4 => [7 1 12 8 6 3 4 9 11 2 10 5]
%==========================================================================
% PROBLEM 6. Could I BE Wearing any more clothes?
%--------------------------------------------------------------------------
%
% Function Name: polarVortex
% Inputs  (1): - (double) an nxm array of temperature highs for a given 
%                         month
% Outputs (1): - (double) a 1x2 vector of the two days of the month between
%                         which the temperature drop was the greatest
%
% Function Description:
%
%   Good thing you only packed a single jacket for your Spring semester in
%   Georgia ...not. 
%
%   Now, fast forward 30 years: you have a child packing for their Spring 
%   semester at Georgia Tech and you say, "Now, pumpkin... one jacket? You
%   sure about that?" You will tell them about the time it hit negative
%   wind chills your first week back to school. They will roll their eyes
%   and not pack extra jackets. And you? Well, you will pull out this
%   homework problem!
%
%   Write a function that takes in an array of temperature highs and
%   outputs the two days between which the temperature dropped the most.
%   The input array will be formatted similarly to a calendar month. This
%   means there will be 4-6 rows and 7 columns (4-6 weeks displayed and 7
%   days per week). Here is an example:
%
%   JanHighs =
%   [   NaN   NaN   NaN    49    52    35    37
%       51    51    25    47    49    49    64
%       59    58    58    52    46    43    44
%       48    58    50    42    46    46    49
%       51    55    53    49    48    48   NaN   ]
%
%   Here, NaN represents the previous month or following month. Since our
%   function does not care about temperature data from surrounding months,
%   this is represented with NaN.
%
%   We can see by looking here that the temperature drops to from 51
%   degrees Fahrenheit to 25 degrees fahrenheit between the 6th and 7th day
%   of the month. This is the greatest drop/decrease in temperature, so our
%   output would be [6 7].
%   
% Hints:
%   - You may want to use diff() or transpose()
%   - Think carefully of what diff() does
%   - Sometimes, dealing with arrays can be tricky.  Linearizing an array
%     may make some problems a little easier. i.e.: linArr = arr(:) 
%   - NaN is a bit of an oddity when it comes to logical statements, but
%     the following may help you:
%           NaN>=0 is false
%               AND 
%           NaN<0 is false as well.
%   
%
% Test Cases:
%   temps1 = [NaN NaN NaN 49 52 35 37
%               51 51 25 47 49 49 64 
%               59 58 58 52 46 43 44 
%               48 58 50 42 46 46 49
%               51 55 53 49 48 48 NaN]
% 
%   temps2 = [NaN NaN NaN NaN NaN NaN 85;
%               82 75 76 81 73 71 74;
%               76 74 73 81 83 82 75;
%               72 74 75 48 43 56 69;
%               73 75 81 83 77 73 74;
%               78 NaN NaN NaN NaN NaN NaN]
%
%   drop1 = polarVortex(temps1);
%       => [6 7]
%
%   drop2 = polarVortex(temps2);
%       => [18 19]
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
