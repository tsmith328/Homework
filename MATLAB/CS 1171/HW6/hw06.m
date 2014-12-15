%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : <your name>
% GT Email     : <your GT email address>
% Homework     : hw06
% Course       : CS1371
% Instructor   : Philips, Smith
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
%	ElDorado_soln.p
%	playHangman_soln.p
%	timeDoctor_soln.p
%	codon2aa.p
%	dna2protein_soln.p
%	dna2rna.p
%	mutationAlert.p
%	ABCs_iteration.m
%   ABCs_hw06_pretest.p
%
% Files to submit:
%   hw06.m
%	ABCs_iteration.m
%	ElDorado.m
%	playHangman.m
%	timeDoctor.m
%	dna2protein.m
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
%  >> ABCs_pretest_hw06
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
% PROBLEM 1.  Take a left at Albuquerque
%--------------------------------------------------------------------------
%
% Function Name: ElDorado
% Inputs  (4): - (double) A 1x2 vector representing a row and column
%              - (char) A nxm string array representing directions
%              - (double) A nxm array representing number of spaces to
%                         travel
%              - (char) A nxm string array of jumbled letters
% Outputs (1): - (char) A string found after following the directions
%                         through the array of letters.
%
% Function Description:
%   You have just recently won a high-stakes game in the underground
%   backgammon circuit.  In an attempt to get the last laugh, your
%   one-eyed, unibrowed opponent gives you a strange scroll as your
%   winnings, claiming it's a map to the City of Gold, El Dorado. Examining
%   the "map," all you see is a vector of two numbers, an array of letters
%   (N, S, E, and W), an array of numbers, and another array of jumbled
%   letters.  At the top of the page, however, is the message "The road
%   traveled reveals the key."  Suddenly it clicks.  The map is encrypted
%   inscructions!  The two numbers are your starting coordinate. The first
%   array of letters is cardinal directions to travel. The set of
%   numbers is the distance to travel, and the last set of jumbled letters
%   holds a secret message (probably a password)!
%
%   Write a function called ElDorado that follows the pattern described by
%   the clues in the given arrays to output a hidden string, found in the
%   fourth input, a string array. The first input is a 1x2 vector
%   representing the starting index.  This is the location of the first
%   letter in the string array (fourth input) and where you should begin in
%   all three input arrays.
%
%   The next step to follow will be given by the second input (a string
%   array) and the third input (numerical array). The direction will be
%   designated in the second input by 'N','S','E', or 'W', for north, south,
%   east, and west respectively.  If the direction is 'N' (north), travel
%   up, and down if the direction is 'S' (south).  Travel right if the
%   direction is 'E' (east), and left if the direction is 'W' (west).  The
%   number of steps to be taken in the direction found will be in the third
%   array.  The number of steps taken will always be positive.
%
%   Trace through all the arrays simultaneously, using the directions and
%   the distances to guide you.  Output the letter found in each step into
%   a string for the final answer. The letter to output will be the letter
%   at the new index in the fourth input array.  Include the letter in the
%   starting location. Stop when the direction is 'D' (for destination) and
%   the number of spaces is 0.
%
%   For example:
%   If you had inputs: [1,3], ['NSEW  , [4 1 1 2  , ['ZrMa
%                               NEDW']  18 1 0 2]     Qio ']
%
%   You would start at index (1,3) in the forth input ('M').  You would
%   then look at index (1,3) in the second input ('E') and in the third
%   input (1).  This tells you to go to the index that is 1 to the right of
%   your current position.  Your current position is now (1,4), and it
%   holds 'a' in the forth input.  You now have 'Ma'.  To find the next
%   index, you look at position (1,4) in the second and third inputs.
%   Follow the pattern until you find 'D' in the second input and 0 in the
%   third.  The output of this example is 'Mario'.
%
%
% Hints:
%   - The while() switch() functions should prove useful.
%   - The string array holding the password my include non-letter
%     characters (i.e., ' ' , '.' , '?' , ect.), but an apostrophe ('')
%     will not appear
%   - The correct path will not take you out of bounds, but a wrong one
%     might (possibility of certain doom of some sort)
%
% Test Cases:
%       start1 = [3,4];
%       dir1 = ['EWESSNW'; 'EWSSEEE'; 'SNSWWNS'; 'SEEWSWE';...
%               'NNWWEES'; 'SEWNDSS'];
%       space1 = [4 5 8 2 5 3 18; 20 19 72 1001 4 9 30;...
%                 2 7 5 3 6 2 1; 1 1 1 1 1 1 1; 4 10 21 18 19 17 6;
%                 6 23 9 4 0 90 5];
%       letter1 = ['dbcdefg';'hijklmn';'opqGstu';'vwxyzaq';...
%                 'lsrkmpb';'aefgnwn'];
% 
%       out1 = ElDorado(start1,dir1,space1,letter1);
%           => 'Golden'
%
%       start2 = [2,4];
%       dir2 = ['ESWENSWW';'SNSESNEW';'NSEENEDN';'NEEWWNEW'];
%       space2 = [7 2 18 42 12 1 2 6; 3 4 1 1 2 20 19 5;...
%                 30 1 4 25 15 2 0 1; 3 4 10 9 4 1 8 7];
%       letter2 = ['cocdefgr';'ijelunoe';'qudlus!p';'isabd ef'];
%       
%       out2 = ElDorado(start2,dir2,space2,letter2);
%            => 'ludicrous speed!'
%==========================================================================
% PROBLEM 2.   Don't Hang Me, Bro
%--------------------------------------------------------------------------
%
% Function Name: playHangman
% Inputs  (2): - (char) a string representing a mystery word
%                (char) a string representing guessed letters
% Outputs (3): - (char) a character array representing a list of successive
%                       hangman boards
%                (char) a string representing missed letters
%                (char) a string representing the outcome of the game
%
% Function Description:
%   You may have already created a MATLAB function that can simulate a
%   single guess in a game of hangman, but now it's time to turn it up a
%   notch . . . with ITERATION!
%   
%   A quick review of how to play:
%
%   Player 1 starts by thinking of a word and creating a blank "board"
%   consisting of as many underscores as there are letters in the word.
%   Player 2 then guesses letters one at a time. If the guessed letter
%   appears in the mystery word, Player 1 replaces the corresponding
%   underscores with that letter. Player 2 continues to guess letters until
%   the word is completed or he/she is out of guesses.
%   
%   Write a function called "playHangman" that simulates multiple guesses
%   in a game of hangman by taking in a mystery word and a string of
%   guessed letters and outputting a list of boards, a string of missed
%   letters, and the game's outcome. Each board in the list should consist
%   of underscores and/or any occurences of correctly guessed letters. Any 
%   guessed letters that do not appear in the word should be part of the
%   second output (missed letters). Our version of the game ends after 6
%   incorrect guesses (you have 6 "lives"), so if the word is completed
%   before 6 incorrect guesses have been made, the outcome should be 'You
%   win!'. If the number of incorrect guesses reaches 6, the number of
%   lives left reaches 0, and the outcome should be 'You lose!'. And if the
%   number of incorrect guesses does not reach 6, but the word is not
%   completed, the outcome should be 'You have <#> lives left.'. If the
%   number of lives left is 1, it should read 'You have 1 life left.' 
%
%   For example, if the mystery word is 'MatLab' and the string of guesses
%   is 'mobatwl', the outputs should be as follows:
%
%   boardList => ['M' '_' '_' '_' '_' '_'
%                 'M' '_' '_' '_' '_' '_'
%                 'M' '_' '_' '_' '_' 'b'
%                 'M' 'a' '_' '_' 'a' 'b'
%                 'M' 'a' 't' '_' 'a' 'b' 
%                 'M' 'a' 't' '_' 'a' 'b'
%                 'M' 'a' 't' 'L' 'a' 'b']
%
%   missed => 'ow'
%
%   outcome => 'You win!'
%
%   As another shorter example, if the inputs are 'CS' and 'abcdef', the
%   outputs should be as follows:
%
%   boardList => ['_' '_'
%                 '_' '_'
%                 'C' '_'
%                 'C' '_'
%                 'C' '_'
%                 'C' '_']
%
%   missed => 'abdef'
%
%   outcome => 'You have 1 life left.'
%
% Notes: 
%   - The letters of the mystery word can be uppercase or lowercase
%   - Guessed letters will always be lowercase
%   - Any letter in the list of boards must be the same case as it is in
%     the input
%   - No test case will have more guesses after the game ends (win or loss)
%   - No letter will be guessed more than once
%   - The outcome should be determined at the very end of the function
%   - The first output will be a char array with as many rows as guesses
%
% Test Cases:
%   [boardList1, missed1, outcome1] = playHangman('HelloWorld', 'byeworld');
%       boardList1 => ['_' '_' '_' '_' '_' '_' '_' '_' '_' '_'
%                      '_' '_' '_' '_' '_' '_' '_' '_' '_' '_'
%                      '_' 'e' '_' '_' '_' '_' '_' '_' '_' '_'
%                      '_' 'e' '_' '_' '_' 'W' '_' '_' '_' '_'
%                      '_' 'e' '_' '_' 'o' 'W' 'o' '_' '_' '_'
%                      '_' 'e' '_' '_' 'o' 'W' 'o' 'r' '_' '_'
%                      '_' 'e' 'l' 'l' 'o' 'W' 'o' 'r' 'l' '_'
%                      '_' 'e' 'l' 'l' 'o' 'W' 'o' 'r' 'l' 'd']
%       missed1 => 'by'
%       outcome1 => 'You have 4 lives left.'
%
%
%   [boardList2, missed2, outcome2] = playHangman('buzz', 'etaoin');
%       boardList2 => ['_' '_' '_' '_'
%                      '_' '_' '_' '_'
%                      '_' '_' '_' '_'
%                      '_' '_' '_' '_'
%                      '_' '_' '_' '_'
%                      '_' '_' '_' '_']
%       missed2 => 'etaoin'
%       outcome2 => 'You lose!'
%
%
%   [boardList3, missed3, outcome3] = playHangman('hangman', 'fungamesyo');
%       boardList3 => ['_' '_' '_' '_' '_' '_' '_'
%                      '_' '_' '_' '_' '_' '_' '_'
%                      '_' '_' 'n' '_' '_' '_' 'n'
%                      '_' '_' 'n' 'g' '_' '_' 'n'
%                      '_' 'a' 'n' 'g' '_' 'a' 'n'
%                      '_' 'a' 'n' 'g' 'm' 'a' 'n'
%                      '_' 'a' 'n' 'g' 'm' 'a' 'n'
%                      '_' 'a' 'n' 'g' 'm' 'a' 'n'
%                      '_' 'a' 'n' 'g' 'm' 'a' 'n'
%                      '_' 'a' 'n' 'g' 'm' 'a' 'n']
%       missed3 => 'fuesyo'
%       outcome3 => 'You lose!'
%==========================================================================
% PROBLEM 3.   Trust me, I'm the Doctor.
%--------------------------------------------------------------------------
%
% Function Name: timeDoctor
% Inputs  (2): - (char) Departure calendar date
%			   - (double) Number of days that transpire
% Outputs (1): - (char) Arrival calendar date 
% 
% Function Description:
%   You're tired of your day-to-day routine of school, work, and sleep, so 
%   when the Doctor arrives on your doorstep with the TARDIS, asking if 
%   you're interested in some adventure, you rise to the occasion.  You are
%   scheduled to land on the planet Raxacoricofallapatorius, but during the
%   time warping, the TARDIS is pulled into a worm hole and transports you
%   and the Doctor back to earth at a different time period than when you
%   two left.  
%   Now the Doctor is trying to figure out during what time period you two 
%   have arrived at on earth.  The TARDIS date instrument was broken in the
%   worm hole, so the only knowledge you have is how many days into the
%   future or past you two have travelled.
%
%   Given the date of your departure from the present earth day, and the
%   number of days that have transpired, output the date that you and the
%   Doctor have landed into on earth.  The number of days that have 
%   transpired will be a positive number if the time travel was into the
%   future, and a negative number if the time travel was into the past.
%
%   The format of the date will be as following:
%
%               '<Month> <Day>, <Year>'       (spaces included)
%
%   So if the departure date were 'January 25, 2014', and the number of 
%   days transpired were 10, the arrival date would be 'February 4, 2014'.
%   Likewise, if the departure date were 'May 5, 2010', and the number of
%   days transpired were -400, the arrival date would be output as the
%   string 'January 29, 2009'.
%
%   Note:
%   - Go by the current calendar system.  You do not need to account for
%   systems before the current one was in place.  You also do not need to
%   account for leap years (assume February will always have 28 days).
%   -Output BC years as a negative year (ie, 'February 2, 320 BC' will be 
%   expressed as 'February 2, -320')
%   - Do not try to factor in the likelihood of a global warming apocalypse
%   ocurring in the future...
%   
%   Hint:
%   - You may find the strtok() function useful.
%   - It is recommended that you utilize a counter.
%
% Test Cases:
%  
%   inDate1 = 'March 12, 2014';
%   numDays1 = 10;
%   outDate1 = timeDoctor(inDate1,numDays1);
%   outDate1 >> 'March 22, 2014'
%
%   inDate2 = 'May 28, 2014';
%   numDays2 = -366;
%   outDate2 = timeDoctor(inDate2,numDays2);
%   outDate2 >> 'May 27, 2013'
%
%   inDate3 = 'October 8, 1964';
%   numDays3 = -853462;
%   outDate3 = timeDoctor('October 8, 1964', -853462);
%   outDate3 >> 'July 8, -374'
%
%==========================================================================
% PROBLEM 4.   Yeah! Science!
%--------------------------------------------------------------------------
%
% Function Name: dna2protein
% Inputs  (1): - (char) a string representing a DNA sequence
% Outputs (1): - (char) a string representing a protein
%
% Function Description:
%   Deoxyribose Nucleic Acid (DNA) is composed of a unique sequences of
%   nucleotides that carry important genetic information. The DNA sequence
%   is transcribed into an RNA sequence, which is then translated into an
%   amino acid sequence, which then becomes one of many proteins used for a
%   variety of crucial cellular functions. 
% 
%   To understand how the process works, there are some key concepts:
%    1) After the DNA is converted to RNA, the RNA is read in CODONS.
%       Codons are sequences of *three* nucleotides.
%    2) Each codon codes for a particular AMINO ACID (AA). A sequence of
%       AA's make up a protein. 
%       *An AA can be coded from different codons*. For example, the AA
%       Alanine('Ala') can be coded from 'GCU', 'GCC', 'GCA', and 'GCG'.
%    3) AA coding starts when a start codon 'AUG' is read in the RNA
%       sequence and stops when one of three stop codons is read.
%       Everything before or after the start and stop codons is IGNORED.
%    4) Mutation can be present when the DNA sequence is altered and can
%       result in a different protein being produced.
%
%   For example, given a DNA sequence, 
%   DNA = ATAGTACCGGTTACTGAAAATTGTTG
%   The steps are:
%
%                  DNA ==>    ATAG | TAC CGG TTA CTG AAA ATT  | GTTG
%                  RNA ==>    UAUC | AUG GCC AAU GAC UUU UAA  | CAAC
%             AA chain ==> ignored | Met-Ala-Asn-Asp-Phe-stop | ignored
%              protein ==>           Met-ALA-Asn-Asp-PHE
%                                         |           |
%                                      mutated     mutated
%
%  Write a function called "dna2protein" that takes in a string
%  representing a DNA sequence and outputs a string representing a protein
%  corresponding to the input DNA sequence. Additionally, while iterating
%  through you are to use the given function mutationAlert() to mark
%  mutated AA's by capitalizing all letters of that AA (see above
%  example). Connect AA's with '-' between each AA.
%
%  The following functions HAVE ALREADY BEEN WRITTEN, and should be used to
%  help you solve the problem, they ave been provided in the homework .p
%  files.
%    1. rna = dna2rna(dna)
%         Takes in a string representing a DNA strand and converts it into
%         the corresponding RNA strand based on base pairing. For example:
%                rna = dna2rna('ATAG');
%                    rna => 'UAUC'
%
%    2. aa = codon2aa(codon)
%         Takes in a string representing a codon and translates it into the
%         respective amino acid.  If the input is a stop codon, it will 
%         return 'stop'. For example:
% 
%                aminoacid1 = codon2aa('AUG');
%                    aminoacid1 => 'Met'
%                 aminoacid2 = codon2aa('UAA');
%                    aminoacid2 => 'stop'
%
%    3. log = mutationAlert(AA,proteinlength)
%         Takes in a string representing an amino acid and the current
%         protein length and returns true if the amino acid is a mutation
%         and false if it's normal
%
% Notes:
%  - Remember that some of the DNA sequence will be ignored.
%  - Remember to connect the amino acids with '-'
%  - Remember that mutated AA need to be capitalized
%  - The input DNA sequence is guaranteed to have one stop and start codon.
%  - the function upper() might be useful in capitalizing AA's
% 
% Test Cases:
%     protein1 = dna2protein('ATAGTACCGGTTACTGAAAATTGTTG');
%          protein1 => 'Met-Ala-ASN-Asp-Phe' 
% 
%     protein2 = dna2protein('ATTTAGTACGTGCACACTATCTTTGGA');
%          protein1 => 'Met-His-Val'
% 
%     protein3 =  dna2protein('ATAGATAGTACTGAGGAGTTATC');
%          protein1 => 'Met-Thr-PRO-Gln'
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
