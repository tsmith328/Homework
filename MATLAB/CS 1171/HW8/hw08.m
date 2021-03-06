%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : <your name>
% GT Email     : <your GT email address>
% Homework     : hw08
% Course       : CS1371
% Instructor   : Omojokun, Smith
% Lecture Time : MWF <10:00, 2:00, 3:00, 4:00>
% TA's Name    : <Your TA's Name>
% Section      : <Your Section>
% Collaboration: <place here one of the following:
%                 "I worked on the homework assignment alone, using
%                  only course materials."
%                 OR
%                 "I worked on this homework with <give the names of the
%                  people you worked with>, used solutions or partial
%                  solutions provided by <name the people or other
%                  sources>, and referred to <cite any texts, web sites, or
%                  other materials not provided as course materials for CS
%                  1371.>"
%
%
% Files provided with this homework:  
%	cabbages.xls
%	cabbages_soln.xls
%	number.xls
%	number_soln.xls
%	voltages.xls
%	voltages_soln.xls
%	data1.csv
%	data1_soln.xls
%	data2.csv
%	data2_soln.xls
%	data3.csv
%	data3_soln.xls
%	title1.txt
%	title2.txt
%	title3.txt
%	Fight Club Elections 2014_sol.txt
%	Glee Club Elections 2014_sol.txt
%	list1.txt
%	list2.txt
%	TimeTable.xlsx
%	ABCs_cell_arrays.m
%	ABCs_HighLevelFileIO.m
%   ABCs_hw08_pretest.p
%   csv2xls_soln.p
%   iceSkate_soln.p
%   scheduler_soln.p
%   voteCounter_soln.p
%   xlsFormula_soln.p
%
% Files to submit:
%	ABCs_cell_arrays.m
%	ABCs_HighLevelFileIO.m
%	xlsFormula.m
%	iceSkate.m
%	csv2xls.m
%	voteCounter.m
%	schedulizer.m
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
%  >> ABCs_pretest_hw08
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
%   Cell Arrays
%	High Level File I/O
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
% PROBLEM 1.   Plug and Chug
%--------------------------------------------------------------------------
%
% Function Name: xlsFormula
% Inputs  (2): - (char) a string representing the name of a .xls file
%                (char) a string representing a formula to compute
% Outputs (0):
%
% Output files (1): - A .xls file that contains a new column of values
%                     computed from the formula
%
% Function Description:
%   One of the great things about Excel is how easy it is to manipulate
%   data using the formula feature. For example, typing '= A2 + B2' in the
%   cell C2 will insert the sum of the values contained in A2 and B2 into
%   C2. Then, clicking and dragging C2 down column C will populate the rest
%   of column C with the sums of the corresponding values in column A and 
%   column B (C3 will be '= A3 + B3', and so on). So in the tradition of CS
%   1371, you must accomplish this very same task using Matlab!
%   
%   Write a function called "xlsFormula" that populates a column of an
%   Excel spreadsheet using a given formula. The following provides a
%   simple example.
%
%   Input spreadsheet is called 'example.xls' and looks like:
%
%   Header A | Header B | Header C | Header D
%          1 |      1.1 |        0 |      2.5
%        3.9 |      4.4 |        0 |        6
%
%   The input formula will be formatted as <col3>=<col1><operator><col2>,
%   where col1, col2, and col3 are given as capital letters and the
%   operator can be '+', '-', '*', or '/'. In this example, let's have the
%   formula be 'C=A+D'.
%
%   Input formula: 'C=A+D'
%
%   Your job is to read the input file into Matlab, populate column C with
%   the values from column A added to the values from column D, and output
%   a new spreadsheet called 'example_new.xls'.
%
%   Output spreadsheet is called 'example_new.xls' and looks like:
%
%   Header A | Header B | Header C | Header D
%          1 |      1.1 |      3.5 |      2.5
%        3.9 |      4.4 |      9.9 |        6
%
% Notes: 
%   - The first row will always consist of header names
%   - The following rows will only contain numbers and none will be blank
%   - There will always be at least 2 columns and 2 rows
%   - You may find strtok(), switch statements, and num2cell() useful
%
% Test Cases:
%   xlsFormula('voltages.xls', 'D=C-B');
%     Output file should be named 'voltages_new.xls' and look like
%     'voltages_soln.xls'
%
%   xlsFormula('number.xls', 'B=A*A');
%     Output file should be named 'number_new.xls' and look like
%     'number_soln.xls'
%
%   xlsFormula('cabbages.xls', 'D=B/C');
%     Output file should be named 'cabbages_new.xls' and look like
%     'cabbages_soln.xls'
%
%==========================================================================
% PROBLEM 2.  Figure-eight out!
%--------------------------------------------------------------------------
%
% Function Name: iceSkate
% Inputs  (1): - (cell)   An N x 4 cell array representing ice skaters and 
%                         the scores given to them by three judges for each
%                         of three different events     
% Outputs (2): - (cell)   A cell array identical to the input cell array
%                         but with a column for overall scores appended
%              - (char)   The name of the skater with the highest overall
%                         score
%
% Function Description:
%   Write a function named "iceSkate" that takes in a cell array
%   representing a group of ice skaters and their scores in three events
%   and outputs the same cell array with a column appended showing each
%   skater's overall score. The function should also output the name of the
%   winning skater, that is, the skater with the highest overall score.
%
%   The input cell array will be given in the following format:
%   [{'Skater'}   {<Event1>}        {<Event2>}        {<Event3>}; 
%    {<Skater1>}  {<Score Vector>}  {<Score Vector>}  {<Score Vector>};
%    {<Skater2>}  {<Score Vector>}  {<Score Vector>}  {<Score Vector>}...]
%   
%   The three events are guaranteed to be the strings 'Short Program',
%   'Long Program', and 'Bonus Event', though they may appear in any order
%   in the second, third, and fourth columns. The skaters will be strings
%   representing the skaters' names. Finally, each score vector will
%   contain three double values, representing three judge's scores for a
%   given event. 
%
%   Each of the three judges scores for a given event are weighted equally
%   when determining a skater's average score for that event. However,the
%   scores for the three different events are weighted differently into a
%   skater's total score. In this function, the Short Program will be 
%   weighted 30% of a skater's overall score, the Long Program will be 
%   weighted 60%, and the Bonus Event will be weighted 10%.
% 
%   For example, consider the cell array:
%   [{'Skater'}  {'Long Program'}  {'Short Program'}  {'Bonus Event'};
%    {'Juliet'}  {[10, 9.5, 9]}    {[8, 9, 8.5]}      {[10, 10, 10]}]
%
%   Juliet's average scores for each event are 9.5, 8.5, and 10 for the
%   Long Program, Short Program, and Bonus Event, respectively. To
%   calculate her overall score, we can add:
%   9.5*0.6 + 8.5*0.3 + 10*0.1 = 9.25
%
%   All skaters' overall scores should be appended in a column titled
%   'Overall Score'.
%
%   Note:
%   -There may be any number of skaters.
%
%   Hint:
%   -You may find the function cell2mat() useful when determining the
%   winning skater.
%
% Test Cases:
%   ca1 = [{'Skater'}, {'Long Program'}, {'Short Program'}, {'Bonus Event'};...
%   {'Rachel'}, {[6 7 7]}, {[7 7 7.5]}, {[8.5 8 7.5]};...
%   {'Tara'}, {[9 8 7]}, {[8 8 8]}, {[9.5 9.5 8.5]};...
%   {'Anu'} {[10 10 9]}, {[9 9 8]}, {[4 5 5]}]
%
%  ca2 = [{'Skater'}, {'Bonus Event'}, {'Short Program'}, {'Long Program'};...
%   {'Nancy'}, {[10 7.5 8]}, {[8 9 9.5]}, {[8.5 8.5 8.5]};...
%   {'George'} {[10 8.5 9]}, {[9 9.5 8]}, {[10 10 10]}]
%
%	[newca1 winner1] = iceSkate(ca1)
%       newca1 => [{'Skater'}, {'Long Program'}, {'Short Program'},...
%                 {'Bonus Event'}, {'Overall Score'};...
%                 {'Rachel'}, {[6 7 7]}, {[7 7 7.5]}, {[8.5 8 7.5]} {6.95};...
%                 {'Tara'}, {[9 8 7]}, {[8 8 8]}, {[9.5 9.5 8.5]} {8.1167};...
%                 {'Anu'} {[10 10 9]}, {[9 9 8]}, {[4 5 5]} {8.8667}]
%       winner1 => 'Anu'
%
%	[newca2 winner2] = iceSkate(ca2)
%       newca2 => [{'Skater'}, {'Bonus Event'}, {'Short Program'},...
%                 {'Long Program'}, {'Overall Score'};...
%                 {'Nancy'}, {[10 7.5 8]}, {[8 9 9.5]}, {[8.5 8.5 8.5]}...
%                 {8.6};...
%                 {'George'} {[10 8.5 9]}, {[9 9.5 8]}, {[10 10 10]} {9.5667}]
%       winner2 => 'George'
%==========================================================================
% PROBLEM 3. CSV to Excel Export
%--------------------------------------------------------------------------
%
% Function Name: csv2xls
% Inputs  (2): - (char)   A string of the file name that contains the data
%                          
%              - (char)   A string of the file name that contains the
%                           column headers
%                          
% Outputs (0): 
%
% Output files (1): - a .xls file that contains the sorted column headers
%                       and the data
% 
% Function Description:
%       You are given a csv file. It contains data but no headers. You are
%       given another text file that contains the corresponding headers of
%       the columns of data. Write a function that places the corresponding
%       headers on to the data and then sort the columns alphabetically
%       (a-z). The final data should be exported as a .xls file with the 
%       same name as the original csv file. The function num2cell may be
%       useful.
% 
%
%
% Test Cases:
%   
%   csv2xls('data1.csv', 'title1.txt');
%       output file should look like data1_soln.xls
%
%   
%   csv2xls('data2.csv', 'title2.txt');
%       output file should look like data2_soln.xls
%      
% 
%   csv2xls('data3.csv', 'title3.txt');
%       output file should look like data3_soln.xls
%
%  
%
%==========================================================================
% PROBLEM 4.  You don't get to vote in Fight Club
%--------------------------------------------------------------------------
%
% Function Name: voteCounter
% Inputs  (1): - (char) filename of votes
% Outputs (0): 
%
% Output files (1): - a text file containing the candidates and their
%                     tallied votes
%
% Function Description:
%   You use the brand new VoteMaster 3000 to tally up votes in the recent
%   elections of some of your extracurricular organizations. To your dismay,
%   it only outputs a txt file with a title describing the election and a
%   list of the candidates' names, with each line representing a vote for
%   that candidate.
% 
%   In addition to suing the VoteMaster 3000 makers for false advertising,
%   you now have to create a MATLAB function named voteCounter that takes in
%   the txt file of names and writes another txt file containing the
%   candidates and their respective votes, in descending order. Furthermore,
%   the filename of the written txt file should be the first line of the
%   input txt file.
% 
% For example, if the input txt file contained
% 
% ------------------------------
% 1371 Head TA Elections
% 
% McGraw
% Carter
% McGraw
% Bragg
% Carter
% ------------------------------
%
% Your written text file should be named "1371 Head TA Elections.txt" and 
% contain
% 
% ------------------------------
% McGraw 2
% Carter 2
% Bragg 1
% ------------------------------
% 
% Notes:
%   - In the written text file, there is a space between the candidate name
%   and his/her number of votes
%   - In the event of a tie, the candidate who appears first in the input
%   file wins (the sort function should take care of this)
%   - There should be no empty line at the end of your written file (i.e.
%   the last line of your written file should be the candidate who received
%   the least number of votes)
%   - Open the txt files in MATLAB to avoid confusion with new lines.
% 
% Test Cases:
%   voteCounter('list1.txt')
%       => Fight Club Elections 2014.txt should look like 
%               'Fight Club Elections 2014_sol.txt'
%   voteCounter('list2.txt')
%       => Glee Club Elections 2014.txt should look like 
%               'Glee Club Elections 2014_sol.txt'
% 
%==========================================================================
% PROBLEM 5. Clocks 'tick' me of....
%--------------------------------------------------------------------------
% Function Name: schedulizer 
% Inputs  (3): - (char) the name of an excel file
%              - (char) the time span you need to check for
%              - (char) the day you need to check for
% Outputs (3): - (log) a logical which says if you're free or not
%              - (char) an output which says if you're free or if not.
%              - (cell) a cell array either diplaying 'None' or your busy 
%                       timeslots and what you'd be doing then. 
%                       
% Function Description:
%   You are an extremely busy student and find managing time a huge pain at 
%   Georgia Tech. You're never able to keep tabs on what you have to do and
%   when you have to do it. You almost wished you had a personal assistant 
%   who kept your time. That, you can't afford(as of now). But what you can 
%   afford to do is write a MATLAB program to do so (the joy!). 
%   Write a function that takes in a timetable and finds out whether you'd  
%   be free in a given time slot. 
%   If you are free in all of the time slots, it should output : 
%       - A true logical output
%       - An output string saying 'Free in all slots'
%       - An output cell saying 'None' 
%   If you aren't free in all of the time slots, it should output :
%       - A false logical output
%       - An output string 'Not free'                                    
%       - An output cell ARRAY with the timeslots you're busy in the
%       first column and what you're doing in the second column.
% Notes:
%   - The first line of the timetable will be days and first column will
%     always be time.
%   - The time will always have a one hour slot on the time table.         
%   - Time slots aren't inclusive. If you are asked to check from 5 a.m. 
%     7 a.m. , you will check for time slots 5 a.m. and 6 a.m. on the time 
%     table.
%   E.g. : The time Table looks like:
%                'Sunday'       'Monday'
%   '5 a.m.'     'Jog'          'Sleep'                
%   '6 a.m.'     'Sleep'        'Sleep'                
%   '7 a.m.'     'Eat'          'Sleep'  
%   If we ask you to check what you're doing on Monday from 5 a.m. - 7 a.m,
%   it should check for only the cell corresponding to 5 a.m. and 6 a.m.
%
%   - If we give you a timeslot which starts from the middle of one hour to
%     the middle of the other, check for the entire timeslot of each of the
%     hours. Eg. If given time range is 7:30 - 9:15, you will check for 7 -
%     10.
%   - The time on the timetable is of the format : <hr><space><a.m./p.m.>
%     eg: '7 p.m.' or '10 a.m.'. On the other hand the time given in the test
%     cases will be <hr>:<minutes><space><a.m./p.m.>. You want to keep that
%     in mind.
%   - The hours of the day start at 12 a.m. and end at 11 p.m. (see
%     TimeTable.xlsx)
%   - If the time duration goes past 12 a.m., you will have to continue
%     checking times on the next day.
%           i.e.: If the time to check is Monday from 10 p.m. to 3 a.m.,
%           you will check 10 p.m. and 11 p.m. on Monday and 12, 1, and 2
%           a.m. on Tuesday
%   - The time duration to check may go from Saturday to Sunday
%
%  Hints:
%  - strcmp() might prove useful
%  - You might want to look at the excel file before you start coding.
% 
% Test Cases:
%   file = 'Timetable.xlsx'
%   timespan1 = '10:00 p.m. - 1:00 a.m.'
%   day1 = 'Saturday'
%   [log1, out1, busySlots1 ] = schedulizer(file, timespan1 , day1);
%       log1 => true
%       out1 => 'Free in all slots'
%       busySlots1 => 'None'
%
%
%   file = 'Timetable.xlsx'
%   timespan2 = '7:00 a.m. - 10:00 a.m.'
%   day2 = 'Monday'
%   [log2, out2, busySlots2 ] = schedulizer(file, timespan2 , day2);
%       log2 => false
%       out2 => 'Not free'
%       busySlots2 => {'9 a.m.', 'Breakfast'}
%
%
%   file = 'Timetable.xlsx'
%   timespan3 = '10:00 p.m. - 12:15 a.m.'
%   day3 = 'Friday'
%   [log3, out3, busySlots3 ] = schedulizer(file, timespan3 , day3);
%       log3 => false
%       out3 => 'Not free'
%       busySlots3 =>     '10 p.m.'    'Cs1371 Hw'                  
%                         '11 p.m.'    'Cs1371 Hw'                  
%                         '12 a.m.'    'Post submission celebration'
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
