%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : tsmith328@gatech.edu
% Homework     : hw04
% Course       : CS1171
% Instructor   : Smith
% Lecture Time : T 12:00
% TA's Name    : Melaena Roberts
% Section      : E1
% Collaboration: "I worked on the homework assignment alone, using
%                only course materials."
%                 
%
% Files provided with this homework:
%	clueCipher.p
%	key.p
%	zoinks_soln.p
%   caesar_soln.p
%   dna2rna_soln.p
%   extrema_soln.p
%   hangman_soln.p
%   ABCs_hw04_pretest.p
%	ABCs_strings.m
%
% Files to submit:
%   hw04.m
%	ABCs_strings.m
%	hangman.m
%	dna2rna.m
%	extrema.m
%	caesar.m
%	zoinks.m
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
%  >> ABCs_pretest_hw04
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
%	strings
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
% PROBLEM 1.   To the gallows with ye!
%--------------------------------------------------------------------------
%
% Function Name: hangman
% Inputs  (2): - (char) a string representing a mystery word
%                (char) a char representing a guessed letter
% Outputs (1): - (char) a string representing a hangman board
%
% Function Description:
%   Let's play hangman! If you don't know how to play, here's how: 
%   
%   Player 1 starts by thinking of a word and creating a blank "board"
%   consisting of as many underscores as there are letters in the word.
%   Player 2 then guesses letters one at a time. If the guessed letter
%   appears in the mystery word, Player 1 replaces the corresponding
%   underscores with that letter. Player 2 continues to guess letters until
%   the word is completed or he/she is out of guesses.
%   
%   Write a function called "hangman" that simulates one guess in a game of
%   hangman by taking in the mystery word and a guessed letter and
%   outputting a board consisting of underscores and/or any occurences of
%   the guessed letter.
%
%   For example, if the mystery word is 'MATLAB' and the guessed letter is
%   'a', the output board should be '_A__A_'.
%
% Notes: 
%   - The letters of the mystery word can be uppercase or lowercase
%   - The guessed letter will always be lowercase
%   - Any letter in the output must be the same case as it is in the input
%   - This is a great opportunity to exploit logical indexing
%
% Test Cases:
%   board1 = hangman('HELLOworld', 'l');
%   board1 => '__LL____l_'
%
%   board2 = hangman('jazz', 'e');
%   board2 => '____'
%
%==========================================================================
% PROBLEM 2.  I wish I was Adenine, so I can get paired with U
%--------------------------------------------------------------------------
%
% Function Name: dna2rna
% Inputs  (1): - (char) a string representing a DNA sequence
% Outputs (1): - (char) a string representing an RNA sequence
%
% Function Description:
%   Deoxyribose Nucleic Acid (DNA) is composed of a unique sequences of
%   nucleotides that carry important genetic information. The DNA sequence
%   is transcribed into an RNA sequence, which is then translated into an
%   amino acid sequence, which then becomes one of many proteins used for a
%   variety of crucial cellular functions.
% 
%  For example, given a DNA sequence, 
% 
%  ATAGTACCGGTTACTGAAAATTGTTG
% 
%  This will get transcribed into an RNA sequence per the appropriate base
%  pairing:
% 
%     A ==> U
%     T ==> A      such that      DNA ==>  ATAGTACCGGTTACTGAAAATTGTTG
%     G ==> C                     RNA ==>  UAUCAUGGCCAAUGACUUUUAACAAC
%     C ==> G
%                                                                                                                                                                                                                                                                                                                        
%  Write a function called "dna2rna" that takes in a string
%  representing a DNA sequence and outputs a string representing a 
%  corresponding RNA sequence
%
% HINTS:
% - you might find logical indexing useful
% - It is guaranteed that all letters will be capital
%
% NOTES:
% - Make sure not to double convert! (i.e. do not reconvert G's from C's to
%   C's again)
% 
% Test Cases:
%
%  rna1 = dna2rna('ATAGTACCGGTTACTGAAAATTGTTG');
%     rna1 => 'UAUCAUGGCCAAUGACUUUUAACAAC'
%
%  rna2 = dna2rna('ATGATGGTCAGTAACGGGGCAAT');
%     rna2 = 'UACUACCAGUCAUUGCCCCGUUA'
%
%==========================================================================
% PROBLEM 3.  Extreme Matlab
%--------------------------------------------------------------------------
%
% Function Name: extrema
% Inputs  (1): - (char)  A string representing a quadratic function.
% Outputs (1): - (double)  A vector representing the [x,y] coordinates of
%                          its vertex.
%
% Function Description:
%   Let's say your little sister is taking an Algebra 1 class in middle
%   school and has this "stupid homework assignment with like a bajillion
%   problems", and she's so desperate for your help that she'll forgive all
%   the sisterly blackmail she has on you if you help her. So you write a
%   MATLAB function to do her homework for her!
%
%   Write a matlab function that takes in the string of a quadratic
%   function y (which will be of the form 'y=ax^2+bx+c'; where a, b, and c
%   are the numerical coefficients), and plugs coefficients into two simple
%   formulas for the x and y coordinates of the quadratic function's
%   vertex.
%
%   Here are the formulas you will use:
%   xcoordinate = -b./(2.*a)
%   ycoordinate = (4.*a.*c-b^2)./(4.*a)
%
%
% Hints:
%   - You will need to use strtok(), because a, b, and c are not guaranteed
%     to be 1 digit.
%   - Remember to use str2num.
%   - Don't worry about rounding.
%   - There will always be three terms
%
% Test Cases:
%   vertex = extrema('y=25x^2+0x+10');
%       vertex => [0 10]
%
%   vertex = extrema('y=500x^2+1000x+12');
%       vertex => [-1 -488]
% 
%   vertex = extrema('y=11x^2+484x+2');
%       vertex => [-22 -5322]
%
%
%==========================================================================
% PROBLEM 4. Cryptography
%--------------------------------------------------------------------------
%
% Function Name: caesar
% Inputs  (2): - (char) a string of unknown length
%              - (double) an integer describing the shift
% Outputs (1): - (char) a coded string using the Caesar cipher
%
% Caeser Cipher Information:
% 	The Caesar cipher is named after Julius Caesar, who, according to 
% 	Suetonius, used it with a shift of three to protect messages of 
% 	military significance. It is unknown how effective the Caesar cipher
% 	was at the time, but it is likely to have been reasonably secure
%   because most of Caesar's enemies would have been illiterate and
% 	others would have assumed that the messages were written in an unknown 
%   foreign language.
% 
%   Caesar ciphers can still be found today in children's toys such as
%   secret decoder rings. A Caesar shift of thirteen is also performed in
%   the ROT13 algorithm, a simple method often used to obscure text such as
%   joke punchlines and spoilers online.
%
%	In the Caesar cipher, each letter is shifted by the specified amount.
%	For example, if the shift is 3, then the letter 'a' would be coded as
%	the letter 'd'. 
%
% Function Description:
%	The function takes in a string and then uses the Caesar cipher to 
%	encode it. Only letters (both upper case and lower case) should be
%	encoded using the Caesar cipher. Any other characters such as spaces,
%	periods, etc., should not be encoded.
%
% Notes:
%   - The Caesar cipher should work for both positive and negative integers
%     that indicate the shift given by the second input.
%   - There is no limit to the value of the shift number in the second 
%     input.
% 
% Hints:
%   - The mod() function may be useful.
%
% Test Cases:
%	coded1 = caesar('Thank you Mario!', 4);
%       coded1 => 'Xlero csy Qevms!'
%
%   coded2 = caesar('Iba vby Wypujlzz pz pu huvaoly jhzasl!', -7);
%       coded2 => 'But our Princess is in another castle!'
%
%   coded3 = caesar('Uh, why isn''t this cipher working?', -26);
%       coded3 => 'Uh, why isn''t this cipher working?'
%
%   coded4 = caesar('uggcf://jjj.lbhghor.pbz/jngpu?i=9LsJE438jxt', 65);
%       coded4 => 'https://www.youtube.com/watch?v=9YfWR438wkg'
%
%==========================================================================
% PROBLEM 5.   Would you do it for a Scooby Snack...?
%--------------------------------------------------------------------------
%
% Function Name: zoinks
% Inputs  (3): - (char) A string with the name of the current suspect
%			   - (char) A string with the name of the most recent clue
%			   - (char) A 4 x m character array representing the scrap of
%                       paper found by Shaggy and Scooby
% Outputs (1): - (logical) A logical output, with true if the current
%                          suspect is guilty, and false if not
% 
% Function Description:
%   Scooby-Doo and the gang are deep into solving their latest mystery,
%   with both a suspect and a clue, but they've hit a snag.  Shaggy and
%   Scooby just found a puzzling scrap of paper that, according to
%   Velma, can tie the entire mystery together.  But in order to do that,
%   they need to use MATLAB and decode what the paper is telling them about
%   their clues.
%   Luckily, you recently joined the crew and are a MATLAB wizard, so when 
%   they asked you for help, you whipped out your clue-decoding logarithms 
%   and said you could save the day.  Don't let them down!!
%
%   You are given two char inputs for the clue and suspect, and a third
%   input that is a 4xm char array, representing the scrap of paper Shaggy
%   and Scooby found.  If the scrap is found to be useful in solving the
%   mystery (a logical true output) from the key logarithm you have, and
%   the clueValue found in your clueCipher logarithm is greater than 5,
%   then the suspect is guilty and you should output true.  Otherwise, you
%   should output false.
%
%   The following functions HAVE ALREADY BEEN WRITTEN, and should be used
%   to help you solve the problem, they have been provided in the homework 
%   as .p files: 
%     1. [log1] = key(scrapAvg)
%         -> The function key takes an input of the average character value
%         down each column of the scrap of paper (neglecting blank spaces),
%         and will output a logical output.  The input *must* be a string
%         (i.e. the average character value of 'a' and 'c' is 'b').
%
%     2. [clueValue] = clueCipher(clue, shift)
%         -> The function clueCipher will take in the clue string and
%         shift, and output a value between 1 and 10, giving the usefulness
%         of the clue.
%
%   In order to obtain the shift for the clueCipher, take the value in the
%   one's place from the length of the suspect's name (i.e. if the name is
%   'Count Dracula' the length is 13, and the shift would be 3).
%
%   Notes:
%   - Before you perform any operations on the scrap paper, you will want
%   to remove all the blank spaces in the char array.
%   - Each row in the scrap of paper will have the same number of blank
%   spaces.
%   - Think about how the mod() function may be useful in solving this
%   problem.
%
%
% Test Cases:
%   suspect1 = 'The Hotel Manager';
%   clue1 = 'Daemon Ritus';
%   scrap1 = ['a le h';'ke fd ';'zyq  b';' ner i'];
%   guilt1 = zoinks(suspect1,clue1,scrap1);
%   guilt1 >> true
%
%   suspect2 = 'Police Man';
%   clue2 = 'footprints';
%   scrap2 = ['jkopeld';'doclkse';'qqqfcre';'xiopple'];
%   guilt2 = zoinks(suspect2,clue2,scrap2);
%   guilt2 >> false
%
%   suspect3 = 'Headless Horseman';
%   clue3 = 'Plane Ticket';
%   scrap3 = ['    ';'    ';'    ';'    '];
%   guilt3 = zoinks(suspect3,clue3,scrap3);
%   guilt3 >> true
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
