%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : tsmith328@gatech.edu
% Homework     : hw12
% Course       : CS1171
% Instructor   : Smith
% Lecture Time : T 12:00
% TA's Name    : Melaena Roberts
% Section      : E1
% Collaboration: "I worked on the homework assignment alone, using
%                 only course materials."
%                 
% Files provided with this homework:  
%	apples.png
%	flower1.png
%	flower2.png
%	oranges.png
%	p.png
%	p1.png
%	p2.png
%	q.png
%	q1.png
%	q2.png
%	r.png
%	r1.png
%	r2.png
%	channing.png
%	jennifer.png
%	ryan.png
%	crayonBox.xls
%	mario5.png
%	spiderman2.png
%	barcode_soln.p
%   checkImage_soln.p
%   puzzle_soln.p
%   smurfed_soln.p
%   colorByNumber2_soln.p
%	yoda.png
%	zebra.png
%	ABCs_images.m
%	ABCs_hw12_pretest.p
%	abcs_pretest1.png
%
% Files to submit:
%	ABCs_images.m
%	checkImage.m
%	puzzle.m
%	smurfed.m
%	colorByNumber2.m
%	barCode.m
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
% Part of this homework is an m-file called "ABCs_strings". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_strings.m
% ABCs File Testing:
%  >> ABCs_hw04_pretest
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
% PROBLEM 1.  Look At Me Now
%--------------------------------------------------------------------------
%
% Function Name: checkImage 
% Inputs  (2): - (char) the name of an image file
%              - (char) the name of a second image file
% Outputs (1): - (char) a sentence comparing the two images
%
% Output Files (1): - (.png) An image highlighting the differences between
%                            the two imput images. Only outputted if 'The
%                            RGB vales are different.'
%
% Function Description:
%  Given two images, write a function called "checkImage" that determines 
%  if the two images are the same, and if they are different, then how. 
%
%  - If the two images are completely identical, the output should read 'The
%    images are the same.' 
%  - If the two images do not have the same dimensions, the output should
%    read 'The images have different dimensions.'
%  - If the two images have the same dimensions, but have different color
%    values at the same pixel, the output should read 'The RGB values are
%    different.'. Additionally, if the two images have different colors,
%    you should write a new image that is white everywhere the two images
%    have the same RGB values and black everywhere they are different. This
%    new image should be called <image1>VS<image2>.png. For example, if I
%    was comparing 'lilacs.png' and 'roses.png', I would call my new image
%    'lilacsVSroses.png'.
%
% Hints:
%  - You may find the function imwrite() useful.
%  - It is not necessary to use iteration for pixel-by-pixel comparisons.
%    This will make your code run very slowly and is inefficient.
%  - This function should be useful for the rest of your homework.
%  - Use a 3-layer uint8 array to write the output image.
%
% Test cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases. Any solution code
%   output files will have a '.soln' concatenated before the extension in
%   the filename.
%
%   out1 = checkImage('apples.png', 'oranges.png');
%
%   out2 = checkImage('flower1.png', 'flower2.png');
%
%   out3 = checkImage('oranges.png', 'tangerines.png'); 
%
%
%==========================================================================
% PROBLEM 2. Does it fit?
%--------------------------------------------------------------------------
%
% Function Name: puzzle 
% Inputs  (3): - (image) original image
%              - (image) piece 1
%              - (image) piece 2
% Outputs (1): - (string) Whether the piece fits or not
%
% Function Description:
%  You love jigsaw puzzles, and decided it was just about time you used
%  MATLAB to make them even more fun! You are given one piece and need to
%  figure out which of the other 2 fit, or if either of them actually do
%  fit. To determine if two pieces fit, ignore any worries about the
%  colour, and just check whitespaces. If the whitespace of the original
%  image is completely occupied by the non-whitespace of one of the pieces,
%  then that piece is the right one. so there should be no whitespaces if
%  the two images are superimposed. If piece 1 fits, your code should
%  output 'The first is the right piece'; if piece 2 fits, then 'The second
%  is the right piece'; and if neither of them do, then 'None of the pieces
%  fit'. There will not be a case where both of the two pieces fit.
%
% Notes: 
%  - Size of the image DOES matter.
%  - Logical indexing might be useful.
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases.
%
%     out1 = puzzle('p.png', 'p1.png', 'p2.png')
%
%     out2 = puzzle('q.png', 'q1.png', 'q2.png')
%
%     out3 = puzzle('r.png', 'r1.png', 'r2.png')
%
%
%==========================================================================
% PROBLEM 3. Tangled Up In Blue
%--------------------------------------------------------------------------
% 
% Function Name: smurfed
% Inputs  (1): -(char) A string of the filename of an image of a
%                      celebrity
% Outputs (0):
%
% Output Files (1): - (.png) A file containing the manipulated picture
%
% Function Description:
%   As an avid Smurf fan, you were disappointed with the latest Smurf
%   movie. Instead, you'd prefer a film with live action Smurfs. To pick
%   the perfect cast your movie, you've decided to see what some famous
%   celebrities would look like when made-up as Smurfs.
%
%   Write a function called smurfed that takes in a filename of a celebrity
%   picture. The picture will have a celebrity's picture and a pure white
%   background. In order to make the celebrity appear blue, you should
%   firstly find which pixels are not the white background (i.e.
%   are the celebrity), and divide both the red and green layers of these pixels
%   by 3. After the image has been edited, write the new image to a
%   new file. The new file will have the same name as the original file,
%   but with '_smurf' appended before the file extension.
%
%   Original File: 'channing.png'
%        New File: 'channing_smurf.png'
%
% Hints:
%   - Try using a logical mask to avoid changing the white positions 
%     when changing the red and green values. 
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases. Any solution code
%   output files will have a '.soln' concatenated before the extension in
%   the filename.
%
%   smurfed('channing.png');
%
%   smurfed('jennifer.png');
%
%   smurfed('ryan.png');
%
%
%==========================================================================
% PROBLEM 4. Color by Number 2: The Second One
%--------------------------------------------------------------------------
%
% Function Name: colorByNumber2
% Inputs  (1): - (char) name of the image file
%              - (char) name of the "crayon box" xls file
% Outputs (1): - (double) array of numbers
% Output files (1) - (.txt) list of colors by number
%
% Function Description:
%   Write a function that takes an image of color tiles and returns an 
%   array of numbers corresponding to colors listed in the output file.
%
%   In other words, you will get an image composed of nxn tiles. In this 
%   example, n=8.
%
%                    8                  8
%           |------------------|------------------|
%           |                  |                  |
%           |    red: 255      |    red: 255      |
%           |    green: 0      |    green: 255    |
%     8     |    blue: 0       |    blue: 255     |
%           |                  |                  |
%           |                  |                  |
%           |------------------|------------------|
%           |                  |                  |
%           |    red: 255      |    red: 0        |
%           |    green: 255    |    green: 0      |
%     8     |    blue: 255     |    blue: 0       |
%           |                  |                  |
%           |                  |                  |
%           |------------------|------------------|
%               
%   The "image" above contains four tiles, each tile being (8px)x(8px), 
%   which means a total of 64px per tile. Each of the pixels inside a tile
%   will have the same value, as shown above. You can see that the top left
%   tile is an entirely red tile, the top right tile is an entirely white 
%   tile (as is the bottom left), and the bottom right tile is an entirely 
%   black tile.
%
%   [Note that this image is (16px)x(16px), which is equivalent to 
%   (2 tiles)x(2 tiles) since 1 square tile = (8px)x(8px). 
%   The image given will not necessarily be a perfect square as in the
%   example above. However, its *tiles* will ALWAYS be perfectly
%   square.]
%
%
%   The provided xls file ("crayon box") will be formatted as follows, but
%   will include more colors and corresponding RGB values:
%
%       Color       R       G       B
%       White       255     255     255
%       Red         255     0       0
%       Green       0       255     0
%       Blue        0       0       255
%       Black       0       0       0
%
%
%   Your result in this example should be a file that looks like:
%
%       1: Red
%       2: White
%       3: Black
%
%   And your function would output the 2x2 array:
%
%       [1   2
%        2   3]
%
%
% Hints & specifications:
%   - The input image filename will contain a number before (and *only* 
%     before) the file extension (ex: spiderman2.png). This number indicates
%     the dimension of each tile in the image.
%   - The output file should be the name of the image file, but
%     with a .txt file extension (instead of .png) and NOT including the dimension number
%     (ex: spiderman.txt, NOT spiderman2.txt)
%   - The colors should be numbered (and listed in your output file) in the 
%     order that they are reached going across the columns of tiles left to 
%     right and then down each row in the same fashion.
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases. Any solution code
%   output files will have a '.soln' concatenated before the extension in
%   the filename.
%   
%   [nums1] = colorByNumber2('spiderman2.png','crayonBox.xls')
%  
%   [nums2] = colorByNumber2('mario5.png','crayonBox.xls')
%
%
%==========================================================================
% PROBLEM 5.  Barcode me, maybe?
%--------------------------------------------------------------------------
%
% Function Name: barcode
% Inputs  (4): - (string) item name
%              - (double) item price
%              - (string) name of image file
%              - (double) a vector location in the form [row, col]
% Outputs (0): 
% Output Files (1): - (.png) An image file of the original image with a
%                            barcode added
%
% Function Description:
%   Given the name of an item, its price, an image of the item, and a
%   location at which to place a barcode, write a function called barcode
%   that places a barcode over the image.
%
%   A barcode is just a binary representation of information. Each "bar" is
%   a column that contains either a black line, which represents a 1, or a
%   white/transparent line that represents a 0. This is a binary code, with
%   each 1 or 0 containing one bit of information. Your function needs to
%   be able to convert the information given in the problem into binary and
%   then convert the binary into a barcode.
%
%   The first step is to combine your information. In order to do this,
%   concatenate the name of the item followed by a dollar sign, followed by
%   the price as a string. So if I had an 'Apple' that cost 1.25, the
%   information I needed to encode into the barcode would be 'Apple$1.25'.
%   Additionally, your price should always have two decimal places and a
%   number in the ones place. So 'Apples$0.10' is acceptable but
%   'Apples$.1' is not.
%
%   The next step is to convert this information into binary. Since we are
%   working with characters, it is guaranteed that the ascii value of a
%   character will only have 8 bits, since the numbers range from 0 to 255.
%   Therefore all of your binary values need to be in 8 bit.
%
%   There are two ways to do this. One way is to use the function
%   dec2bin(), which will take in a char and output the ascii value of the
%   character in binary as a string. However, the binary it outputs is not
%   guaranteed to be 8 bit. So dec2bin('1') will output '110001', but you
%   need to use '00110001' in your barcode. Recall that '1' does not have
%   the ascii value of 1.
%
%   The second option is to manually convert the ascii value into binary
%   yourself. The way to do this is to divide your ascii value by 2. The
%   remainder from that operation (either 1 or 0) is your first bit (in the
%   one's place). The floored integer obtained from that division (ie, the
%   number of times 2 fit into your number) is your new number. Now you
%   divide that new number by two and the remainder from that operation is
%   your second bit (in the ten's place). And so on and so forth until you
%   have 8 bits in your remainder column. Then, reading the remainder
%   column from bottom to top gives you your binary value. An example is
%   shown below converting 117 to binary:
%                       num  |  floor(num/2)  |  remainder
%                       117  |   58           |     1        
%                        58  |   29           |     0
%                        29  |   14           |     1
%                        14  |    7           |     0
%                         7  |    3           |     1
%                         3  |    1           |     1
%                         1  |    0           |     1
%                         0  |    0           |     0 
%
%   So your final binary number is 01110101. 
%
%   If I have a string of characters I want to encode into binary, the full
%   binary number to encode will be all of the binaries for the characters
%   concatenated together. So a binary representing 'it' will look like
%   '0110100101110100'.
%
%   Now that you have your binary, you need to convert it into an image.
%   This image will need to be a 32xMx3 array where M is the number of bits
%   in your binary array (ie, each pixel will represent a bit). Everywhere
%   you had a 1 in your binary code should be a vertical black "bar" and
%   everywhere you had a zero will be "transparent" (more on this later).
%
%   Now that you have your barcode image, you need to place it over the
%   image given to you in the problem. The location provided as input
%   specifies the top left pixel of your barcode as [row, column].
%   Everywhere your barcode is black should now be black, but everywhere
%   your barcode is "transparent" should be left unchanged. You are
%   guaranteed that the given location will allocate enough room for your
%   barcode.
%
%   Your function should then write the new, barcoded image to a file
%   called 'barcoded' + imageName, where Image name is the name of the
%   image given to you. So if the image given to you was called
%   'Apples.png', you should call the new image 'barcodedApples.png'.
%
%   Notes:
%   - each "bar" in your barcode needs to be a single pixel wide and 32
%     pixels long. 
%
% Hints:
%	- You may find dec2bin() useful, just remember that each binary number
%	  must be 8 bit. 
%   - You may find sprintf() useful for formatting your strings. 
%
% Test Cases:
%   Use the included solution file to compare your own code's output to the
%   solution output for the following test cases. Any solution code
%   output files will have a '.soln' concatenated before the extension in
%   the filename.
%	
%   barcode('Apples', 1.25, 'Apples.png', [183, 149]);
%   
%   barcode('Zebra', .52, 'zebra.png', [30, 100]);
%
%   barcode('Toyota', 1, 'yoda.png', [257, 158]);
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
