%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : tsmith328@gatech.edu
% Homework     : hw07
% Course       : CS1171
% Instructor   : Smith
% Lecture Time : T 12:00
% TA's Name    : Melaena Roberts
% Section      : E2
% Collaboration: "I worked on the homework assignment alone, using
%                only course materials."
%           
%
%
% Files provided with this homework:  
%	GT_theratio_uga.txt
%	favoriteSongs_soln.p
%	pokemon_rockstar_oops.txt
%	TMNT_soln.p
%	coffee1.txt
%	coffee1_soln.txt
%	coffee2.txt
%	coffee2_soln.txt
%	pizza1.txt
%	pizza1_soln.txt
%	pizza2.txt
%	pizza2_soln.txt
%	convo1.txt
%	convo2.txt
%	convo3.txt
%	convo5.txt
%	powerHolder_soln.p
%	madLibs_soln.p
%	snowpocalypseMadlib.txt
%	snowpocalypseMadlib_fixedSOLN.txt
%	valentineMadlib.txt
%	valentineMadlib_fixedSOLN.txt
%	wordlist1.txt
%	wordlist2.txt
%	essay1.txt
%	essay2.txt
%	gradeEssay_soln.p
%	plagiarized.p
%	scoreSentence.p
%	ABCs_LowLevelFileIO.m
%	abcs_lights.txt
%
% Files to submit:
%   hw07.m
%	ABCs_LowLevelFileIO.m
%	favoriteSongs.m
%	TMNT.m
%	powerHolder.m
%	madLibs.m
%	gradeEssay.m
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
%  >> ABCs_pretest_hw07
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
%	Low-Level File I/O
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
% PROBLEM 1.   Matlab Music Reviews
%--------------------------------------------------------------------------
%
% Function Name: favoriteSongs
% Inputs  (4): - (char) A string of the first favorite song.
%                (char) A string of the second favorite song.
%                (char) A string of the third favorite song.
%                (char) A string representing the filename of a .txt
%                       file with song review scores.
% Outputs (2): - (char) A string of the most well-reviewed song.
%                (double) The cumulative review score of that song.
%
% Function Description:
%   Write a function that will take 4 inputs: one of them will be a .txt
%   file with three songs and various ratings they received from song
%   reviews (an example is shown below). The other three inputs will be
%   strings of the song names that are in the .txt file. This function will
%   calculate the cumulative review score for each song (just add up all
%   the ratings they got), and output a string of the song name that had
%   the highest cumulative review score and the score that that song
%   received.
%
%   For example, if this is your .txt file:
%
%           Royals: 2
%           Thrift Shop: 3
%           Get Lucky: 5
%           Thrift Shop: 4
%           Get Lucky: 3
%           Royals: 5
%
%   'Royals', 'Thrift Shop', and 'Get Lucky' would be the first three
%   inputs used with this file. 'Royals' would have a cumulative score of
%   7, because it had ratings of 2 and 5; 'Thrift Shop' would similarly have a
%   cumulative score of 7; and 'Get Lucky' would have a cumulative score of
%   8. So your function would output 'Get Lucky' as a string, and 8 as a
%   double.
%
% Notes: 
%   - The songs are guaranteed to be reviewed the same number of times.
%   - There will not be a tie for the highest score.
%
% Hints:
%   - Switch statements will be helpful.
%
% Test Cases:
%
%   song1 = 'GT Fight Song';
%   song2 = 'The Ratio';
%   song3 = 'uga fight song';
%   filename1 = 'GT_theratio_uga.txt';
%   [bestSong1, score1] = favoriteSongs(song1,song2,song3,filename1);
%       bestSong1 => 'The Ratio'
%       score1 => 18
% 
%   song4 = 'Pokemon Theme Song';
%   song5 = 'Rockstar';
%   song6 = 'Oops I Did It Again';
%   filename2 = 'pokemon_rockstar_oops.txt';
%    [bestSong2, score2] = favoriteSongs(song4,song5,song6,filename2)
%       bestSong2 => 'Pokemon Theme Song'
%       score2 => 30
%
%==========================================================================
% PROBLEM 2.   "I have always liked... Cowabunga."
%--------------------------------------------------------------------------
%
% Function Name: TMNT
% Inputs  (2): - (char) Name of input '.txt' file
%			   - (char) Price limit for order
% Outputs (0): -  None
%
% Output files (1): a .txt file containing a list of what items the turtles
%                   are able to order
% 
% Function Description:
%   The Teenage Mutant Ninja Turtles like to order take-out.  Whether it be
%   pizza, muffins, cupcakes, or coffee: if they can order it, they want 
%   it.  Recently, their constant ordering out has drawn attention to the
%   fact that people are delivering food to a sewer, so Splinter gives the
%   turtles a limit for the amount they can spend on food.  So that they
%   are able to focus on their martial arts training, you decide to help 
%   them figure out what they are able to get from a restaurant with their 
%   given price limit.
%
%   You are given the name of a file; the file contains the title of a 
%   location the turtles are ordering from, a blank line, and then a list 
%	of the items they can order next to the price of those items.  Each 
%	item will have its price, a dash, and then the item.  An example of the 
%	first three lines of a file is as follows:
%
%	Ex:
%	Geoff's Joint
%
%   $12.50 - Cheese Pizza
%   
%
%   If the price of the item is less than or equal to the price limit 
%   given, then print the item name (only the item name) into a new file 
%   with '_order' appended to the name of the original file before the 
%   '.txt'.  So if the file was named 'food.txt', the new file would be 
%   named 'food_order.txt'.  This file will contain the names of the items 
%   the turtles are able to order.  The first two lines of the output file 
%   should be the title of the location the turtles are ordering from and 
%   the space between the title and the items, just like that which is 
%   found in the input file.  Each new item should be printed on a new
%   line.
%
%   Notes:
%   - You do not need to factor any sort of sales tax into the price of
%      the items.
%   - You may find the strtok() function useful.
%	- There will be no space on the last line of the file
%	There will be exactly two spaces and a dash between the price and the 
%	item to order (ie. ' - ')
%   - The actual solution pcode will append '_order', so be aware of that 
%   when you are running your files.
%
% Test Cases:
%   
%   fname = 'pizza1.txt';
%   priceLimit = '$10.00';
%   TMNT(fname, priceLimit);
%   >> Looks like 'pizza1_soln.txt'
%
%   fname = 'pizza2.txt';
%   priceLimit = '$15.00';
%   TMNT(fname, priceLimit);
%   >> Looks like 'pizza2_soln.txt'
%   
%   fname = 'coffee1.txt';
%   priceLimit = '$1.00';
%   TMNT(fname, priceLimit);
%   >> Looks like 'coffee1_soln.txt'
% 
%   fname = 'coffee2.txt';
%   priceLimit = '$3.15';
%   TMNT(fname, priceLimit);
%   >> Looks like 'coffee2_soln.txt'
%
%==========================================================================
% PROBLEM 3. Who wears the pants?
%--------------------------------------------------------------------------
%
% Function Name: powerHolder
% Inputs  (1): - (str) filename of a file containing a instant
%                      messaging/text conversation between two people dating
% Outputs (1): - (str) the name of the person who holds the power in the
%                      relationship
%
% Function Description:
% Write a function, powerHolder, that takes in a instant messaging/text
% conversation between two people in a relationship and outputs who 
% speaking in that conversation holds the power in the relationship. This
% is defined simply by who says goodnight to the other first.
%
% Guaruntees:
%   - Someone will say goodnight. (Ignore case.)
%   - Between each speaker there will be exactly one blank line.
%
% Hints:
%   - It may be easier to use fgetl() instead of fgets() for ease in blank
%   line detection.
%   - Do NOT use fclose all or fclose('all'), just close files you open.
%
% Test Cases:
%
%   out1 = powerHolder('convo1.txt');
%           => 'Brittany'
%
%   out2 = powerHolder('convo2.txt');
%           => 'Alice'
%
%   out3 = powerHolder('convo3.txt');
%           => 'Leon'
%
%   out4 = powerHolder('convo5.txt');
%           => 'Edward R. Morrow'
%
%==========================================================================
% PROBLEM 4. Wait...What'd that say?!
%--------------------------------------------------------------------------
% 
% Function Name: madLibs
% Inputs  (2): - (char) name of txt file with missing nouns, verbs, and 
%                       adjectives 
%              - (char) name of txt file with a list of nouns, verbs and
%                       adjectives
% Outputs (0): - None
%
% Output files  (1): a .txt file containing the completed text
% 
% Function Description:
%   Write a function called "madLibs" where the first input is the name of 
%   a text file containing a story with the keys: %n, %v, or %a, and the
%   second input is a the name of a text file with a comma-delimited list
%   of nouns on the first line, verbs on the second line, and adjectives on
%   the third line.
%
%   Replace the keys in the first text file with their corresponding part 
%   of speech from the seond text file, and write the result to a new file 
%   named the same as the original text file with the suffix '_fixed.txt'.
%
%   Use the words from the words txt file in the order they are listed.
%
%   For example, if the first file contains:
%
%       'The %n and %n %v up the %a hill.'
%
%   and the second file contains:
%
%   'pig,dolphin,sandwich,house'  (on the first line)
%   'party,fall,eat,play'         (on the second line)
%   'haunted,round,big,yellow'    (on the third line)
%
%   The output of of the function will be a text file that reads:
%
%       'The pig and dolphin party up the haunted hill.'
%
% Notes: 
%   - the second text file is guaranteed to always have three lines only,
%     with the first, second, and third lines containing the nouns, verbs,
%     and adjectives, respectively.
%   - All the words won't be used, but you are guaranteed enough words to
%     fill in the keys.
%
% Test Cases:
%
% madLibs('valentineMadlib.txt','wordlist1.txt')
%   -> should create a file 'valentineMadlib_fixed.txt' that looks like
%      'valentineMadlib_fixedSOLN.txt'
%
% madLibs('snowpocalypseMadlib.txt','wordlist2.txt')
%   -> should create a file 'snowpocalypseMadlib_fixed.txt' that looks like
%      'snowpocalypseMadlib_fixedSOLN.txt'
%
%==========================================================================
% PROBLEM 5.  Something, Something essay 
%--------------------------------------------------------------------------
%
% Function Name: gradeEssay
% Inputs  (2): - (string) Filename of the essay
%              - (double) The desired word count
% Outputs (1): - (double) Essay Score
%
% Function Description:
%   Given the filename of a text file containing an essay and a desired
%   word count, write a function gradeEssay that computes the score an
%   essay should receive on a scale from 0 to 100. The first line of the
%   essay will always be the essay's title. Several factors will used to
%   compute the essay's score. One of these factors is called the "word
%   count factor". The equation for the word count factor is given below:
%
%                                   essayWordCount - desiredWordCount
%   wcf = 120 - 120 *absolute value(----------------------------------)
%                                             desiredWordCount
%  The final wcf should always be a positive value or 0. Additionally, the
%  words in the title do not contribute to the total word count.
%
%   Another factor to take into consideration is the average sentence
%   length and the sentence complexity. There is a function to help you
%   with this:
%       
%       - [score, isSentence] = scoreSentence(sentence)
%           This function takes in a sentence (period and all) and outputs
%           the sentence score (as a double) and whether or not the
%           sentence is a true sentence (as a logical). Each sentence will
%           end in a period, question mark, or exclamation point.
%
%  The sentence score will be given from 0 to 100. The ssf (sentence score
%  factor) for the entire essay will be the average of all the sentence
%  scores. If a sentence is not a valid sentence (i.e. scoreSentence
%  outputs a false) then you should average in 0 instead of the score for
%  that sentence. For example, I have two sentences. One of them is a real
%  sentence and has a score of 98. The other one is not a real sentence and
%  has a score of 24. My ssf is (98 +0)/2 = 49
%
%  You also only want to submit original work, so there is a plagiarism
%  factor, pf. The first line of every essay will be a title. The following
%  function has been provided to assist you in recognizing plagiarism
%
%           - [tf] = plagiarized(title)
%               Given the title of a work, plagiarized will return true if
%               the essay is plagiarized and false otherwise.
%
%  If an essay is plagiarized, its score should be a 0. Otherwise, the score
%  should be an average of the sentence factor (sf) and the word count
%  factor (wcf). Additionally, the maximum essay score an essay can receive
%  is a 100, so, for example, a final score of 105 should be rounded down
%  to 100. The final score should also be rounded to the nearest ones
%  places. 
%
% Notes:
%   - It is guaranteed that all words will be separated by at least a
%   space, even if they are on different lines. 
%
% Hints:
%   - In order to find the word count, you don't have to strtok() out every
%   word. There is a more efficient way to do this. 
%
% Test Cases:
%   [score1] = gradeEssay('essay1.txt', 350)
%       score1 => 0
%
%   [score2] = gradeEssay('essay2.txt', 150)
%       score2 => 79
%
%   [score3] = gradeEssay('essay2.txt', 750)
%       score3 => 42
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
