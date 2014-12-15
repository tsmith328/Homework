%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : tsmith328@gatech.edu
% Homework     : hw13
% Course       : CS1171
% Instructor   : Smith
% Lecture Time : T 12:00
% TA's Name    : Melaena Roberts
% Section      : E1
% Collaboration: "I worked on the homework assignment alone, using
%                 only course materials."
%
% Files provided with this homework:  
%	ABCs_graphTheory.m
%   ABCs_sorting.m
%   ABCs_hw13_pretest.m
%   interweave_soln.p
%   acronym_soln.p
%   rpsls_soln.p
%   multitable_soln.p
%   LLcsvread_soln.p
%   sortByHeader_soln.p
%   whichWand_soln.p
%   UniqueBestFit_soln.p
%   colorScreen_soln.p
%   csvTest1.csv
%   csvTest2.csv
%   techScores.xls
%   smith.bmp
%   Superman.bmp
%   lion.bmp
%   tiger.bmp
%
% Files to submit:
%	ABCs_graphTheory.m
%   ABCs_sorting.m
%	interweave.m
%	acronym.m
%   rpsls.m
%   multitable.m
%   LLcsvread.m
%   sortByHeader.m
%   whichWand.m
%   UniqueBestFit.m
%   colorScreen.m
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
% Part of this homework are two m-file's called "ABCs_graphTheory" and
% "ABCs_sorting". Open these files in MATLAB and complete them according to
% the directions contained within.
%
% Files to Complete: 
%       - ABCs_graphTheory
%       - ABCs_sorting
% ABCs File Testing:
%  >> ABCs_hw13_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	Vectors and Arrays
%   Strings
%   Conditionals
%   Iteration
%   Low Level File I/O
%   High Level File I/O
%   Structures
%   Numerical Methods
%   Images
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
% PROBLEM 1.  Underwater Vector Basketweaving 101
%--------------------------------------------------------------------------
%
% Function Name: interweave
% Inputs  (2): - (double) A 1xN vector of numbers
%              - (double) A 1xN vector of numbers
% Outputs (1): - (double) A vector of the two vectors mixed together
% 
% Function Description:
%   Write a function called "interweave" that takes in two vectors and then
%   outputs another vector where odd indices correspond to the first input
%   vector and even indices correspond to the second input vector. If the
%   lengths of the two inputs are not the same, then zeros should be used
%   to fill in what would otherwise be 'empty' indices in the output.
%
% Hints:
%   - The length of the final vector should be twice the length of the
%     longest vector.
%   - You may find the max() and zeros() function useful.
%   - Though you know iteration now because this is an extra credit
%     homework at the end of the course, this problem is intended to test
%     your indexing and Vectors/Arrays ability. So: YOU SHOULD BE ABLE TO
%     CODE THIS WITHOUT ITERATION. ANY SUBMISSION USING A LOOP WILL NOT
%     RECEIVE POINTS FOR EXTRA CREDIT. That would defeat the point of the
%     problem.
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases:
%
%   mixed1 = interweave([1 2 3 4],[6 7 8 9]);
%
%   mixed2 = interweave([2 6 1 0 4], [3 5 9]);
%
%   mixed3 = interweave([5 1 2], [0 1 4 5]);
%
%
%==========================================================================
% PROBLEM 2. M.A.A. (Make An Acronym)
%--------------------------------------------------------------------------
% 
% Function Name: acronym
% Inputs  (1): - (string) a 1xM string containing a phrase
% Outputs (1): - (string) A 1xN string containing an acronym of the given
%                         phrase
%
% Function Description:
%   Write a function called "acronym" that takes in a phrase and outputs
%   an acronym of the phrase.  The output should contain only the first 
%   letter of every word and only if the first letter is capitalized.
%   There will always be a phrase, and the phrase can contain any number of
%   words.
%
%   Example:
%       input: 'Boy Scouts of America'
%       output: 'BSA'
%  
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases:
%
%   out1 = acronym('game of thrones');
%
%   out2 = acronym('THIS STRING iS VALID');
%
%   out3 = acronym('Time And Relative Dimension In Space');
%
%
%==========================================================================
% PROBLEM 3.  Bazinga!
%--------------------------------------------------------------------------
%
% Function Name: rpsls
% Inputs  (2): - (string) Player 1's move 
%              - (string) Player 2's move
% Outputs (1): - (string) A sentence describing who won 
%
% Function Description:
%   Let's play a game of rock-paper-scissors-lizard-spock! Given the moves
%   of two players, write a function called rpsls that determines who wins
%   the game of rpsls! The function should output:
%                'Player 1 wins!' if player 1 wins
%                'Player 2 wins!' if player 2 wins 
%                'It''s a tie!' if both players choose the same move.
%
%   In rpssl, there are five possible moves: 'rock', 'paper', 'scissors',
%   'lizard', and 'spock'. You are guaranteed that the two inputs will be
%   lower case and one of these five moves. Each move can beat two moves and
%   be beaten by two moves. The criteria are as follows:
%   
%   1. Rock beats scissors or lizard
%   2. Paper beats rock or spock
%   3. Scissors beats paper or lizard
%   4. Lizard beats paper or spock
%   5. Spock beats rock or scissors
%
%   More information on rpsls can be found here:
%   http://en.wikipedia.org/wiki/Rock-paper-scissors-lizard-Spock
%
% Hints:
%	- You might find strcmp useful.
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases:
%
%   [game1] = rpsls('spock','rock');
%
%	[game2] = rpsls('lizard','scissors');
%
%	[game3] = rpsls('paper','paper');
%
%
%==========================================================================
% PROBLEM 4.   "The Root of All Evil"
%--------------------------------------------------------------------------
%
% Function Name: multiTable
% Inputs  (1): - (double) A number, n, representing the uppper value of a
%                         multiplication table
% Outputs (1): - (double) An (n+1)x(n+1) array, where n is the input. A
%                         multiplication table with an upper value of n.
%
% Function Description:
%   Your younger brother is having trouble with his fourth grade
%   multiplication, and since you don't want him to end up at U[sic]GA, you
%   volunteer to help. You decide to write a MATLAB function that makes a
%   multiplication table to help him finish his homework! 
%
%   Write a function that takes in a number and outputs a multiplication
%   table with the input number being the maximum value. 
%   Example: If the input number was 7, the output array would be of
%   dimension 8x8 and would look like: 
%                       0   1    2    3    4    5    6    7
%                       1   1    2    3    4    5    6    7
%                       2   2    4    6    8   10   12   14 
%                       3   3    6    9   12   15   18   21
%                       4   4    8   12   16   20   24   28
%                       5   5   10   15   20   25   30   35
%                       6   6   12   18   24   30   36   42
%                       7   7   14   21   28   35   42   49
% Notes: 
%   - A zero must be included in the top left corner
%   - An input of zero will output the double 0
%
% Hints:
%   - Think about creating the inside portion then adding the first row and
%     first column 
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases:
%
%   out1 = multiTable(5)
% 
%   out2 = multiTable(2)
%         
%   out3 = multiTable(0)
%
%
%==========================================================================
% PROBLEM 5.  Reading a CSV File Using Low-level File I/O
%--------------------------------------------------------------------------
%
% Function Name: LLcsvread
% Inputs  (1): - (char) name of a csv file containing various data
% Outputs (1): - (cell) a cell array where each comma separated value
%                       is its own cell
%
% Function Description:
%   In MATLAB, we've learned the built-in csvread function, which reads in
%   numeric data from a comma separated value file and outputs the numeric
%   data in an array. However, csvread cannot handle files with non-numeric
%   data. So... Write a function called "LLcsvread" that will take in a .txt file
%   and return all the data from the file as strings in a cell array. 
%   Numbers may appear in the csv data, but they should be kept as strings.
%  
%
%   The layout of the data in the csv file should be preserved in the cell
%   array.  Data appearing on the second line of the csv file, for
%   instance, should appear in the second row of the cell array.  You may
%   need to use empty cells to complete a square cell array.
%
% Hints:
%   - The functions you learned in this course for operations with .txt
%     files may also be used with .csv files.
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases:	
%
%   a = LLcsvread('csvTest1.csv')
%
%   b = LLcsv('csvTest2.csv')
%
%
%==========================================================================
% PROBLEM 6.  Sorting an Excel File
%--------------------------------------------------------------------------
%
% Function Name: sortByHeader
% Inputs  (2): - (char) The file name of an Excel file
%              - (char) The name of a header of a column in the
%                       Excel file
% Outputs (1): - (cell) Cell array containing the sorted Excel data 
%
% Function Description:   
%	Given the file name of an Excel file, write a function called
%	sortByHeader that takes in an excel filename and a name of a header in
%	that excel file. Sort the rows of the excel file by the data contained
%	in the column of the excel file corresponding to the second input. If
%	the data in the specified column if numeric, then sort it in ascending
%	order. If the data is not numerica, then sort it alphabetically. Output
%	the newly sorted data in a cell array.
%
%   Remember when you are sorting that the entire array must be sorted, not
%   just the single column.
% 
% Notes:
%    -The function should work for any excel file, not just techScores.xls 
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test case:
%
%   x = 'techScores.xls';
%   scores = sortHeader(x, 'Opponent');
%
%
%==========================================================================
% PROBLEM 7. Which Wand?
%--------------------------------------------------------------------------
%
% Function Name: whichWand
% Inputs  (2): - (struct) an 1xN structure array
%              - (char) a field name that may or may not be in the
%                structure array
% Outputs (1): - an 1xN array of structures that is the original structure
%                array sorted by the values in the specified input field, 
%                if the specified field existed in the structure array
%
% Function Description:
%   Ollivander is trying to sort the wands in his shop based off one of the
%   characteristics of each wand, like 'Core Material', 'Length', 'Price',
%   'Type of Wood', etc...
%
%   He wants you to write a MATLAB function (because matlab is basically
%   the same as magic, right?) that takes in a structure array and then
%   sorts that structure array by the values in whichever field is
%   inputted. If the values are numeric, then the sort them from
%   lowest to highest. If the values are characters, then the structure
%   sorts the *words* alphabetically (with case mattering, e.g. 'Phoenix'
%   is before 'phoenix'). If the field does not exist in the structure
%   array, then the function should return the string 'Invalid Field Name'.
%
% Note:
%   - You may assume that each field in the input structure will have
%     the same data type for its contents at every index.
%
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases:
%
%   strArr = struct('Type_of_Wood', {'Holly', 'hazel', 'Oak',... 
%               'ivy','hawthorn'},'Price', {7, 5, 8, 6, 10},... 
%               'Core_Material', {'phoenix feather', 'dragon heartstring',... 
%               'Phoenix feather', 'unicorn hair', 'Thestral tail hair'});
%
%   whichWandArr1 = whichWand(strArr, 'Type_of_Wood')
%
%   whichWandArr2 = whichWand(strArr, 'Price')
%
%   whichWandArr3 = whichWand(strArr, 'Core_Material')
%
%   whichWandArr4 = whichWand(strArr, 'Power')
%
%
%==========================================================================
% PROBLEM 8.   If The Data Fits...
%--------------------------------------------------------------------------
%
% Function Name: UniqueBestFit
% Inputs  (2): - (double) x-data
%              - (double) y-data 
% Outputs (0): - None
% Output Plots (1): - A plot of the different subplots leading to a unique fit
%
% Function Description:
%   Write a function called UniqueBestFit that takes in x and y data of
%   some number of data points, and plots the polynomial fit generated by
%   matlab of every order starting at first order and up to and including
%   the Unique fit (order of one less than the number of data point). For
%   each fit, analyze the error by finding the Average Absolute Distance
%   between the y-values estimated by your fit and the actual y-values.
%   (Absolute Average Distance is just a concise way of saying the average
%   of all the absolute values of the distances between estimated y's and
%   actual y's.) The threshold average absolute distance value is .75; so plot
%   the lowest order curve with an average absolute distance of less than
%   .75 in blue. Every polynomial fit up to this order should be plotted in
%   black, and every polynomial fit after this order and up to the unique
%   fit should also be plotted in black. Plot the original data
%   points as red x's.
%
%   Plot your polynomial fits on an Nx2 subplot, with the number of rows
%   varying to accomodate the number of fits you must do, with a title on
%   each subplot. The title of each subplot should tell which order fit
%   that subplot is, for example: "Order 1 Fit", or "Order 2 Fit". You do
%   not need to label the axes.
%
%   Specifics:
%   - The Average Absolute Difference must be strictly less than .75. There
%     is not guaranteed to be a fitted curve that matches this; if so, then
%     all curves should be plotted in black.
%   - Plot all the original points in each subplot with red "x"s.
%   - If the average absolute difference (mean absolute difference)
%     is less than 0.75, plot it in blue, otherwise, plot it in black.
%     NOTE: only plot the FIRST subplot with absolute difference less than
%     0.75 in blue. All others will be black.
%   - Use 100 linearly spaced points between the smallest and largest x 
%     value for new x values when you are plotting the polynomial fit
%     curves.
%   - The title of the fitted plots should read 'Order __ Fit', where the
%     blank is the ordinal number of the fit. Example, a first order fit
%     should read 'Order 1 Fit', while second order fit will read 'Order 2
%     Fit' and so on.
%   - x-values are not guaranteed to be in any particular order, but the
%     1st x-value will correspond to the 1st y-value and so on.
%   - There is not guaranteed to be a fit with average absolute difference
%     strictly less than 0.75.
%   - You should continue plotting until you have reached the last *UNIQUE*
%     polynomial, even after you have found the first polynomial with AAD
%     less than 0.75.
%
% Constraints:
%   - You may assume that you are to begin with a 1st order fit, i.e. that
%     the input vector is a length of at least 2. Note that even though
%     only one plot will exist when the input vector is of length 2, you
%     must still adhere to the rule that there are to be enough space for
%     two subplots per row.
%   - You may assume that the input vectors are the same size.
%
% Hints:
%   - The number of rows you will need is related to how many subplots you
%     need to reach a unique fit, and this is related to how many data
%     points you have.
%   - If you're having difficulty understanding the problem, run one of the
%     test cases for the solution file and look at its output plot.
%
%
% Test Cases:
%   Use the included solution file to compare your own code's output plot
%   to the solution output plot for the following test cases:
%
%   UniqueBestFit(1:5,[5 1 15 9 8])
%
%   UniqueBestFit([1 6 2 4 9 8 5 3], [0.5 0.9 1.5 2.0 0.1 0.1 1.3 0.2])
%
%   UniqueBestFit([0.2 0.5 1.2 1.6 2.6 9.6],[1 3 1 6 7 0.1])
%
%
%==========================================================================
% PROBLEM 9.  Chroma Keying
%--------------------------------------------------------------------------
%
% Function Name: colorScreen
% Inputs  (3): - (char) a filename of a foreground image
%              - (char) a filename of a background image
%              - (double) a vector of length three of RGB values to replace
%              - (double) a tolerance for what is considered a match
% Outputs (0):
% Output files (1): - (.png) a new image made from combining the foreground
%                            and background images
%
% Function Description:
%   Given two images, write a function called "colorScreen" that replaces
%   all the pixels in the first image (foreground) that match a given RGB
%   value with the corresponding pixels in the second image (background).
%   The 4th input gives you a a tolerance for what is considered a "match"
%   with the given RBG value. As in: if your tolerance is 2, and the R
%   value from the given RGB is 200, any R value for a pixel that is
%   between 198 and 202 (including 198 and 202!) would be cosidered a
%   match. The new image should be written to a file whose name is the name
%   of the first (foreground) image with '_new' appended before the
%   extension. For example, if  the following is called:
%
%               colorScreen('img1.bmp','img2.bmp', [2 253 2], 2);
%
%   A new image file called 'img1_new.bmp' should be created that looks
%   like 'img1.bmp', but with all of the pixels whose RBG values are in the
%   inclusive range of [0, 251, 0] to [4, 255, 4] should be replaced with
%   their corresponding pixels in img2.bmp.
%
% Notes:
%   - You do not have to use a for loop in this problem. For loops are a
%     very slow and inefficent due to the size of the images that must be
%     looped though. Consider logical indexing instead.
%   - The two input images will always be the same size.
%   - The pixel range will never cause the pixel values to be above 255 or
%     below 0
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases. Any solution code
%   output files will have a '.soln' concatenated before the extension in
%   the filename.
%
%   colorScreen('smith.bmp','Superman.bmp',[252, 242, 3], 3);
%
%   colorScreen('lion.bmp','tiger.bmp',[253, 127, 38], 2);
%
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.