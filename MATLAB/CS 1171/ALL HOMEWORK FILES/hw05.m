%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : tsmith328@gatech.edu
% Homework     : hw05
% Course       : CS1171
% Instructor   : Smith
% Lecture Time : T 12:00
% TA's Name    : Melaena Roberts
% Section      : E2
% Collaboration: "I worked on the homework assignment alone, using
%                 only course materials."
%
%
%
%
% Files provided with this homework:
%   hw05.m
%	ifOrSwitch_soln.p
%	compareTimes.p
%	getTimeEffects.p
%	timeToArrive.p
%	isLate_soln.p
%   myFootball_soln.p
%   switchCase_soln.p
%	ABCs_conditionals.m
%	ABCs_hw05_pretest.p
%
% Files to submit:
%   hw05.m
%	ABCs_conditionals.m
%	iforSwitch.m
%	myFootball.m
%	switchCase.m
%	islate.m
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
%  >> ABCs_pretest_hw05
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
%	Conditionals
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
% PROBLEM 1. Choices, Choices
%--------------------------------------------------------------------------
%
% Function Name: ifOrSwitch
% Inputs  (1): - (str) a single word describing the possible values used in
%               a given conditional statement
% Outputs (1): - (str) a string stating your descision as far as which
%               conditional statment to use.
%
% Background:
%   When you need to use a conditional statement, how do you decide which
%   one to use? If or switch?
%
%   SWITCH STATEMENTS
%
%   Switch statements are good for discrete or distint values. They are
%   also good when you have lots of values that lead to the same result.
%   
%   For example, if you are mapping a month name to how many days are in
%   that month, lots of months map to 30 or 31 days, so you might use
%   something like this (assuming non-leap year):
%
%   switch month
%       case {'September', 'April', 'June', 'November'}
%           numDays = 30;
%       case 'February'
%           numDays = 28;
%       otherwise
%            numDays = 31;
%   end
%   
%
%   IF STATEMENTS
%   
%   If statements are very powerful. Any switch statement can be
%   transformed into an if statement. Sometimes, though, if statments take
%   significantly more code to do the same thing that a much more concise 
%   switch statement could also do.
%
%   When can an if statement *not* be a switch statement? Generally
%   speaking, this is when the values we are evaluating can fall within a
%   certain range. In other words, when we need to use greater than (>), 
%   less than (<), etc.
%   For example, if a meal costs more than what you have in your wallet 
%   (Say, $23.45), then you can't afford it. You couldn't possibly evaluate
%   all meal prices with a switch statement. See below.
%
%   if mealPrice<=23.45
%       str = 'affordable';
%   else
%       str = 'not affordable';
%   end
%
% Function Description:
%   Write a function that takes in a word describing the values within a
%   variable you need to evaluate, and output a string decribing your
%   descision of which kind of conditional statement to use. 
%
%   From the reading above, these "values within a variable" could refer to
%   the variables <month> or <mealPrice>. The variable <month> takes on 
%   discrete values: 'January', 'February', ..., 'Decemeber', while the 
%   variable <mealPrice> can take on any double value greater than zero. 
%   
%   <mealPrice> has a wide range of values, so an if statement is better.
%
%   <month> takes on distinct values, and it also has mutliple values that
%   can map to a single answer (like the 4 months that all have 30 days),
%   so a switch statment is better.
%
%   Given an input of 'discrete', 'distinct', or 'many-to-one', your
%   function should recommend a switch statement. (Ignore case.)
%
%   Given an input of 'range' or 'continuous', your function should
%   recommend using an if statement. (Ignore case.)
%
%   Given any other descriptor, your function should admit that it is 
%   unsure, but still recommend an if statement. (This is the choice since
%   any switch can be written as an if, but not every if can written as a
%   switch.)
%
%   The output should read:
%       "My data is <>, so I'll try <an if/a switch> statement."
%
%   See test cases for examples of the specific wording of the outputs.
%   Note that the output includes the input descriptor.
%
% Hints:
%   - lower() may be useful.
%   - sprintf() will be useful as well.
%   - strcmp() your results below with those from ifOrSwitch_soln() to
%   confirm your answers.
%
% Test Cases:
%
%   out1 = ifOrSwitch('continuous');
%       => 'My data is continuous, so I''ll try an if statement.'
%
%   out2 = ifOrSwitch('many-TO-one');
%       => 'My data is many-to-one, so I''ll try a switch statement.'
%
%   out3 = ifOrSwitch('fancy');
%       => 'Unsure about my data. I''ll try an if statement.'
%
%   out4 = ifOrSwitch('Discrete');
%       => 'My data is discrete, so I'll try a switch statement.'
%
%==========================================================================
% PROBLEM 2. It's Super Bowl time!
%--------------------------------------------------------------------------
% 
% Function Name: myFootball
% Inputs  (3): - (char) A string of the two teams playing 
%              - (double) A vector containing the record of each team.              
%              - (char) A string containing the difficulty of the team's
%                       respective seasons.
%
% Outputs (1): - (char) A string declaring which team won
%
% Function Description:
%   Superbowl Sunday has finally arrived! It's time to sit back and watch
%   the biggest game of the year along with some awesome commercials.
%   In the spirit of competition,your best friend wants to bet on who wins. 
%   Being the bright GT student that you are, you decide to create a highly
%   refined algorithm using matlab to decide who wins.
%
%   Here's how it works.  First, you input a string with the names of the 
%   two teams playing separated by a semicolon. For example, an entry might
%   look like 'Seahawks;Broncos'. 
%
%   Then, you input the record of each team in a single vector, with the 
%   first and second entries representing the wins and losses of the first 
%   team and the third and fourth entries representing the wins and
%   losses of the second team.  For example, if the Seahawks went 13-3 and
%   the Broncos went 14-2, the vector would look like [13 3 14 2]. You 
%   now calculate the win/loss ratio of each team.
%
%   Finally, you input a string with the difficulty of each team's season
%   with three possible options: 'Easy','Medium',and 'Hard'.  For example,
%   if the Seawaks had a hard season and the Broncos had a medium one, the 
%   entry would look like 'Hard;Medium'.  Based on this difficulty, you will
%   then multiply the win/loss ratio by a certain factor.  For 'Easy', the 
%   factor is 50.   For 'Medium', 75.  For 'Hard', 100.  This product is 
%   the overall skill rating for the team.  
%
%   For example, if the Broncos went 12-4 and had a Medium difficulty season, 
%   their skill rating would be   12/4 .* 75 = 225.  
%
%   To decide who wins, you compare the skill rating of each team.  If one
%   team has a high score than the other, your function should output the
%   name of that team followed by the phrase ' win the Superbowl!'.  For
%   example, if the Broncos have a higher skill rating, your output should 
%   be 'Broncos win the Superbowl!'. If your teams have the same rating,
%   your function should output 'Tie Ballgame!'. 
%
% Notes:
%       If a team goes undefeated, their win/loss ratio is their number of 
%   wins by default.  For example, if the Patriots go 16-0, their win/loss 
%   ratio equals 16. 
%       Also, the formatting described will always hold.  For instance, you
%   will not be given 'easy' or 'meh' as an input. 
%       Georgia Tech will not be held responsible for any lost bets.  
%
%
% Test Cases:
%   teams1 = 'Broncos;Seahawks';
%   seasonRecord1 = [13 3 12 4];
%   seasonHardness1 = 'Medium;Hard';
%       victor1 = myFootball(teams1,seasonRecord1,seasonHardness1);
%           victor1 = 'Broncos win the Superbowl!';
%
%   teams2 = 'Falcons;49ers';
%   seasonRecord2 = [16 0 10 6];
%   seasonHardness2 = 'Medium;Easy';
%       victor2 = myFootball(teams2,seasonRecord2,seasonHardness2);
%           victor2 = 'Falcons win the Superbowl!';
%
%   teams3 = 'Panthers;Packers';
%   seasonRecord3 = [9 7 9 7];
%   seasonHardness3 = 'Easy;Easy';
%       victor3 = myFootball(teams3,seasonRecord3,seasonHardness3);
%           victor3 = 'Tie Ballgame!';
%
%==========================================================================
% PROBLEM 3.  aLl MiXeD uP
%--------------------------------------------------------------------------
%
% Function Name: switchCase
% Inputs  (2): - (char) a string containg a word or phrase
%              - (char) a string determining how to modify the previous
%                 input
% Outputs (1): - (char) the modified string
%
% Function Description:
%   Write a function called "switchCase" that takes in a string containing
%   a word or phrase and another string containing directions, and outputs
%   the modified word or phrase based on the directions. There can be 4
%   different ways of modifying the string:
%
%           - 'Title Case' -> Capitalizes the first letter of every word.
%                             Everything else is lowercase. 
%           - 'Camel Case' -> Capitalizes the first letter of every word
%                             EXCEPT the first one. Everything else is
%                             lowercase. All the spaces are removed.
%           - 'Da Vinci'   -> Reverses the string.
%           - '1337'       -> Changes each of the following letters into 
%                             it's respective number replacement.
%                             '1' should replace 'l'
%                             '2' should replace 'z'
%                             '3' should replace 'e'
%                             '4' should replace 'a'
%                             '5' should replace 's'
%                             '6' should replace 'g'
%                             '7' should replace 't'
%                             '8' should replace 'b'
%                             '9' should replace 'j'
%                             '0' should replace 'o'
%                             Each of the replacements should work for
%                             capitalized letters as well.
%
%
% Test Cases:
%   new_string = switchCase('there AND back again', 'Title Case');
%       new_string => 'There And Back Again'
%
%   new_string = switchCase('What is better than UPPER or lower case?',...
%   'Camel Case');
%       new_string => 'whatIsBetterThanUpperOrLowerCase?'
%
%   new_string = switchCase('Hannah!', 'Da Vinci');
%       new string => '!hannaH'
%
%   new_string = switchCase('Now I can talk like a REAL hacker!', '1337');
%       new_string => 'N0w I c4n 741k 1ik3 4 R341 h4ck3r!'
%==========================================================================
% PROBLEM 4. What does the clock say?
%--------------------------------------------------------------------------
%
% Function Name: isLate
% Inputs  (3): - (string) The current time
%              - (string) Your final destination
%              - (string) When you need to arrive
% Outputs (3): - (double) The earliest you can arrive
%              - (string) The mode of transportaion you will use
%              - (logical) If you will be late
%       
%
% Function Description:
%   Oh no! You stayed up late Friday night trying to complete the latest
%   homwork for CS 1371 and slept through your alarm. But you have That
%   Important Thing that you need to attend. You better text that friend of
%   yours letting them know if you will be late and your ETA (estimated
%   time of arrival). And would it be faster to drive or walk? But wait,
%   didn't you write a Matlab function to help you with that?
%
%	Given the current time, your destination, and when you need to be at
%	the destination, write a function isLate that computes the earliest
%	time you can arrive, whether or not you will be late, and what mode of
%	transportation you will be using. There are two types of
%	transportation, 'Driving' and 'Walking'. You should use the form of
%	transportation that will take the least amount of time. If they both
%	take the exact same amount of time, you should walk. 
%
%   Times will be given as a string in the format 'hh:mm a/pm'
%   Insignificant numbers will be dropped (such as the 0 in front of a
%   single digit hour). For example, 6:02 pm will be given as '6:02 pm'.
%   You are expected to output the earliest you can arrive in the same
%   format.
%
%   You have been given a few functions to help you with this task:
%
%
%       - [timeToGetReady, traffic] = getTimeEffects(time)
%           Given the current time as a string (ie '6:02 pm'),
%           getTimeEffects will return to you the time it will take you to
%           get ready as well as how heavy the traffic is as that time. 
%
%       - [time] = timeToArrive(destination, traffic, modeOfTransportation)
%           Given a destination, the traffic, and the modeOfTransportation,
%           timeToArrive will compute the time it will take you to travel
%           to that destination in minutes. There are two modes of
%           transportation available to you: 'Driving' or 'Walking'.
%
%       - [tf] = compareTimes(time1, time2)
%           Given two times in the format 'hh:mm a/pm', compareTimes() will
%           return true if the first time happens before the other time and
%           false otherwise. If the two times are the same, it will return
%           false
%
% Notes:
%   - We will not expect your code to take into account the different days.
%   For example, you will not leave on a trip at 11:00 pm that takes 3
%   hours. 
%   - Sometimes the number of minutes will be a single number, such as 4.
%   The time should still display '1:04 am', not '1:4 am'
%   - Late means late, so arriving at 6:02 pm for an event at 6:02 pm
%   should NOT be considered late
%
% Hints:
%	- You may find mod() and floor() useful.
%   - You may find sprintf() useful 
%   - It may be helpful to convert to military time to perform
%   addition. Just remember that your output must be on the 12-hour clock
%   and all of the helper functions only accept 12 hour clock times
%
% Test Cases:
%
%   [eta1, trans1, late1] = isLate('7:00 am', 'MRDC', '8:05 am');
%       eta1 => 8:15 am'
%       trans1 => 'Driving'
%       late1 => true
%
%   [eta2, trans2, late2] = isLate('12:36 pm', 'New York', '5:00 pm');
%       eta2 => '1:25 pm'
%       trans2 => 'Driving'
%       late2 => false
%
%   [eta3, trans3, late3] = isLate('11:00 am', 'Mordor', '12:01 pm');
%       eta3 => '1:08 pm'
%       trans3 => 'Walking'
%       late3 => true
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
