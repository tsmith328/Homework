%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : tsmith328@gatech.edu
% Homework     : hw10
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
%	GOOG_soln.png
%	MSFT_soln.png
%	YHOO_soln.png
%	plotStock_TestCases.mat
%	circle1.png
%	circle2.png
%	circle3.png
%	worldClock_1.jpg
%	worldClock_2.JPG
%	worldClock_3.JPG
%	getWinner.p
%	plotTicTacToeGrid.p
%	tictactoe1.png
%	tictactoe2.png
%	tictactoe3.png
%   howToCircle_soln.p
%   labReport_soln.p
%   plotStock_soln.p
%   ticTacToe_soln.p
%   worldClock_soln.p
%
% Files to submit:
%	plotStock.m
%	howToCircle.m
%	labReport.m
%	worldClock.m
%	ticTacToe.m
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
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	Plotting
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
% PROBLEM 1.   Buy Low, Sell High
%--------------------------------------------------------------------------
%
% Function Name: plotStock
% Inputs  (1): - (char) a 1xN cell array representing stock data
% Outputs (0):
% Plots   (1): - A plot of the stock data
%
% Function Description:
%   You are a stock market analyst and your boss has told you to analyze
%   the closing prices of several stocks and to make charts showing the
%   price change over time. What are you waiting for? Fire up MATLAB and
%   get to work!
%
%   Write a function called "plotStock" that takes in a 1xN cell array
%   containing ordered pairs of a day number followed by a closing price
%   and plots the points. The cell array will look something like this:
%   {[1, 31.4], [2, 42], [3, 55]}. But that's not all! Your function must
%   complete the following steps:
%
%   1) Plot a horizontal line segment that starts at the first point and
%      extends until it reaches the x-value of the last point. You should
%      use only TWO points to plot this line and the line should be BLACK.
%      This line represents a threshold price.
%   2) Starting with the second day, plot a line segment connecting each
%      day's price with the previous day's price. Again, only plot using
%      TWO points at a time. If the current day's price is greater than the
%      threshold price, the line segment should be GREEN. If not, the line
%      segment should be RED.
%   3) Label the x-axis 'Trading Day' and label the y-axis 'Closing Price
%      (USD)'.
%
% Notes: 
%   - Use the plot() function's third input to color each line segment
%   - Don't forget to hold on
%   - Do not worry about formatting the axis
%   - The order in which you plot line segments does not matter
%
% Test Cases:
%   Run the following command or double click on 'plotStock_TestCases.mat'
%   to get the test case variables
%
%   load plotStock_TestCases;
%
%   plotStock(GOOG_FY2013Q4);
%   => plot should look like 'GOOG_soln.png'
%
%   plotStock(MSFT_FY2013Q4);
%   => plot should look like 'MSFT_soln.png'
%
%   plotStock(YHOO_FY2013Q4);
%   => plot should look like 'YHOO_soln.png'
%
%==========================================================================
% PROBLEM 2. Heigh-ho, the derry-O, the farmer plots a circle.
%--------------------------------------------------------------------------
%
% Function Name: howToCircle
% Inputs  (1): - (double) center (vector of coordinates)
%                (double) radius
%                (double) angle (in degrees)
% Outputs (0): -  None
%
% Output plots (1): plot showing how to plot a circle (as described below)
%
% Function Description:
% Write a function, howToCircle, that plots the following:
%   1. a circle
%   2. center of the circle
%   3. point on circle at given angle
%   4. radius from center to point
%   5. horizontal line from center to x coord of point
%   6. vertical line from center to y coord of point
%   7. arc from horizontal line to radius line
%
% At this point, you should probably view an example. Take a look at
% circle2.png.
%
% The point of this problem is the break down and display the parts that
% make up plotting a circle in Matlab.
%
% Specifications:
%   1. center of the circle 
%       - style: black star
%       - label:
%           'center: (<x coord*>,<ycoord*>)'
%   2. a circle 
%       - style: black line
%       - label: 
%           'circle perimeter'
%       - additional details:
%           Plot the circle with 100 evenly spaced points.
%   3. point on circle at given angle
%       - style: magenta star
%       - label:
%           '(<x coord*>,<ycoord*>)'
%   4. radius from center to point
%       - style: blue line
%       - label:
%           'radius = <radius>'
%       - additional details:
%           Plot an arc with 25 evenly spaced points (#7).
%           The radius of this arc should be 1/3 of the length of the 
%            horizontal line (#5).
%   5. horizontal line from center to x coord of point
%       - style: green dashed line
%       - label:
%           'r*cos(th)'
%   6. vertical line from end of the horizontal line (#5) to y coord of point
%       - style: cyan dashed line
%       - label:
%           'r*sin(th)'
%   7. arc from horizontal line to radius line
%       - style: red dashed line
%       - label:
%           'th = <angle> degrees'
%       - additional details:
%           The radiys of this arc should be 1/3 of the length of the
%           horizontal line (#5)
%
% More details & hints:
%   - round the coordinates of the point on the circle to the nearest
%       hundredth place
%   - When using sprintf(), use %g for numbers to display without trailing
%       zeros.
%   - The given angle will be between 0 and 90, and it will be given in
%       degrees, not radians. When finding/plotting the point on the circle
%       and the arc, convert the angle to radians.
%   - Set axis equal.
%   - The title of the plot should be 'How to Circle'.
%   - The axes should not be lableled.
%   - The function legend() will be useful.
%   - The legend should be placed in the lower-right corner of the plot.
%   - The contents of the legend should be in the order of the descriptions
%       above
%
% Notes on legend:
%     legend(string1,string2,string3, ...) puts a legend on the current plot
%     using the specified strings as labels. LEGEND works on line graphs,
%     bar graphs, pie graphs, ribbon plots, etc.  You can label any
%     solid-colored patch or surface object.  The fontsize and fontname for
%     the legend strings matches the axes fontsize and fontname.
% 
%     legend(...,'Location',LOC) adds a legend in the specified
%     location, LOC, with respect to the axes.  LOC may be either a
%     1x4 position vector or one of the following strings:
%         'North'              inside plot box near top
%         'South'              inside bottom
%         'East'               inside right
%         'West'               inside left
%         'NorthEast'          inside top right (default for 2-D plots)
%         'NorthWest'          inside top left
%     --> 'SouthEast'          inside bottom right <--
%         'SouthWest'          inside bottom left
%
% Test Cases:
%
%   howToCircle([0,0],5,53.13010235)
%           => plot should be identical to result from
%               howToCircle_soln([0,0],5,53.13010235)
%             (You can also reference the screenshot of the figure provided
%             in circle1.png)
%
%   howToCircle([-1,6],0.5,24.3)
%           => plot should be identical to result from
%               howToCircle_soln([-1,6],0.5,24.3)
%             (You can also reference the screenshot of the figure provided
%             in circle2.png)
%
%   howToCircle([0,0],0,0)
%           => plot should be identical to result from
%               howToCircle_soln([0,0],0,0)
%             (You can also reference the screenshot of the figure provided
%             in circle3.png)
%
%==========================================================================
% PROBLEM 3. Deedee! Get out of my laboratory!
%--------------------------------------------------------------------------
%
% Function Name: labReport
% Inputs  (2): - (struct) a structure array containing sets of plot data
%              - (str) a string representing a graph title
% Outputs (0): 
% Plots   (1): - a 2xN subplot containing each structure plotted
%
% Function Description:
%   Write a function that takes in a 1xN structure array. Each structure in
%   the array will contain two fields, representing x-data and y-data. The
%   first field will represent the x-data, and the second field the y-data.
%   Each field will have a 1xN vector of equal lengths. Each structure in the
%   array represents an individual set of data that needs to be graphed. In
%   order to better organize and compare your plots, each graph will be
%   placed into a single subplot. Create the smallest 2xN subplot possible
%   that will still be able to hold all of the graphs. Place each graph
%   into the subplot in the same order they appear in the structure array.
%   For example, the first structure in the array will be placed in the
%   first subplot position. The second structure in the array in the second
%   position, etc. Each graph needs to be formatted as follows:
%
%   Formatting:
%      - set all axes from the minimum to the maximum of each set of data
%        i.e. the x-axis should go from the minimum x-value to the
%        maximumx-value and the same with the y-axis.
%      - title each graph with the second input
%        concatenated with ': Trial #'. For example, if the second input
%        was 'Rainwater Measurements', the second subplot graph would be
%        titled 'Rainwater Measurements: Trial 2'.
%      - label each axis after the fieldname which held its data. So, the
%        x-axis should be named after the field which held the x-data.
%        Also, replace each underscore in the field name with a space. 
%
% Hints:
%   - the fieldnames( ) function will be useful
%   - review how subplot orders graphs
%   - Use the solution file to see an example of how the graphs should
%     look
%
% Test Cases:
%
% str1 = struct('Distance_Ran_in_Miles',[0,0.5,1,1.5,2],'Calories_Burned',{[0,85,126,...
% 172, 250],[0,69,127,189,221],[0,73,134,165,234]});
% 
% str2 = struct('Days_Since_Sprouting',[0,20,40,60,80,100],'Height_in_Meters',{[0,...
% 0.2,1.2,1.7,2.2,2.9],[0,0.3,0.9,1.9,2.1,3.1],[0,0.9,1.3,1.8,2.7,3.4],[0,0.1...
% ,0.8,1.2,1.8,2.3],[0,0.6,1.1,2.0,2.4,2.8],[0,0.3,1.3,2.0,2.7,2.9]});
%
% Test Case 1:
% labReport(str1,'Calories Lost')
% ---> should look like the output of labReport_soln(str1,'Calories Lost')
%
% Test Case 2:
% labReport(str2,'Sunflower Growth')
% ---> should look like the output of labReport_soln(str1,'Sunflower Growth')
%
%
%==========================================================================
% PROBLEM 4.  Tick Tock On The Clock But The Coding Don't Stop
%--------------------------------------------------------------------------
%
% Function Name: worldClock
%   Inputs  (2): - (char) A string containing the time in 12-hour format
%                - (cell) A 1xN cell array (with 1x2 cells for all of its
%                         indices), containing the name and corresponding
%                         time shift for N cities around the world.
%   Outputs (0): - none 
%   Plots   (1): - A 1xN subplot of analog clocks displaying times from
%                  around the world.
%
% Function Description:
%   Write a function called "worldClock" that creates a 1XN subplot of
%   analog clocks displaying the time of the cities. Your inputs need to be
%   a string containing the time in Atlanta, in the standard 12-hour format
%   (hh:mm), and a 1xN cell array. This 1xN cell array has 1x2 cells for
%   all of its indices. For example, if your input was 1x2, it could be:
%            { {'San Francisco', '-3:00'} , {'Austin','-1:00'} }
%   Where each index in you input cell contains a city and that city's
%   corresponding time shift from Atlanta's time.
%
%   Here are some instructions and specifications of your plot:
%   - The perimiter of the clock should be black and consist of 100 evenly 
%     spaced points using linspace()
%   - Create the circle at the center of the clock by plotting a single
%     point at (0,0) as a black circle.
%   - The length of the hour markers is .1 radially inwards from the edge
%     of the clock. That is, .1 units towards the center of the clock from
%     the edge. These will all be evenly spaced.
%   - The hour markers should be black, and correspond to the correct 
%     locations on a normal clock, where 12 o'clock is 90 degrees, and 6 
%     o'clock is 270 degrees, etc.
%   - The hour hand should point to the actual hour marker; you do not
%     need to account for how the hour hand would shift based on the minute
%     time in a real clock.
%   - The length of the hour hand should be .6 units.
%   - The length of the minute hand should be .9 units.
%   - The hour hand should be blue.
%   - The minute hand should be red.
%   - The title of each plot should be the city.
%   - The axis should be square and turned off.
%   - The subplot should have the same dimensions as the input cell array,
%     with each city and time appearing in the same order as they did in
%     the cell array.
%
% Hints:
%  - Keep in mind that the sin() and cos() functions take in radians
%  - Whether a time is AM/PM will not matter, but your times are still on a
%    12 hour scale. As in: if Atlanta's time is 11:00, a shift of +2:00
%    will yield a time of 1:00, but it will not matter which of these is AM
%    or PM. You do not need to keep track of this. Shifts of greater than
%    12 hours are possible.
%  - The rotation matrix could be useful for parts of this problem.
%
% Test Cases:
%
%  time1 = '04:23'
%  cities1 = {{'San Francisco' '-03:00'} {'Austin' '-01:00'}... 
%            {'Moscow' '+09:00'} {'Tokyo' '+14:00'}};
%  worldClock(time1,cities1);
%       => should look like worldClock_1.jpg.
%
%  time2 = '12:59'
%  cities2 = {{'Fairbanks' '-04:00'} {'Dubai' '+09:00'}};
%  worldClock(time2,cities2);
%       => should look like worldClock_2.jpg
%
%  time3 = '11:11'
%  cities3 = {{'Bogota' '00:00'} {'Hanoi' '+12:00'} {'Lima' '00:00'}... 
%            {'Jakarta' '+12:00'} {'Montreal' '00:00'}};
%  worldClock(time3,cities3);
%       => should look like worldClock_3.jpg
%
%==========================================================================
% PROBLEM 5. Just a game of hugs and kisses
%--------------------------------------------------------------------------
%
% Function Name: ticTacToe
% Inputs  (1): - (char) a character array of X's, O's, and spaces
%                       representing the game
% Outputs (0): -  None
%
% Output plots (1): plot showing how to plot a circle (as described below)
%
% Function Description:
%     Write a function that takes an already-played tic-tac-toe
%     game as a character array, plots it, and outputs the plot and the
%     winner of the game. Use the helper function provided to plot a
%     tic-tac-toe board, and plot the X's and O's of the game onto this
%     board. See the specifications section of this problem statement for
%     the specifications of your plot. Then find the winner of the game.
%
%     An example output plot is shown in tictactoe1.png.
%
% Provided functions:
%   - plotTicTacToeGrid(x,y)
%       This function plots a game grid about a central point, provided
%       with an x-coordinate (x) and a y-coordinate (y) of that central
%       point. Each square of the game board is 1x1.
%
%   - winner = getWinner(game)
%       This function returns the winner of the game (a character array) as
%       either 'X', 'O', or 'tie'.
%
% Specifications:
%   - The (x,y) coordinates at the center of the board are the coordinates
%     at the center of the center box. The boxes are each a 1x1 size, so if
%     your board is centered at (2,2), then the coordinates (1,2) are the
%     center of the box to the left of the center.
%   - To place the X's and O's on the board, imagine a .6x.6 square
%     centered around the center of each board spot. The X's would be the
%     diagonals of this imaginary .6x.6 square, and the O's will be a
%     circle inscribed into it.
%   - X's should be black. O's should be red.
%   - O's should be plotted with 100 evenly spaced points.
%   - Title the plot based on who wins, either 'Player X wins!' or 'Player
%     O wins!'. If there is a tie, title the plot 'Cat's game.'. You will
%     get the problem incorrect if your title's format does not match the
%     solution file's. So check this.
%   - Turn axis off when finished plotting.
%
% Hints:
%   - Think about how to easily change indices into coordinates. It isn't
%     a seamless transition. You may want to center your game board at
%     (2,2).
%   - You may want to wait to turn axis off until you have your code
%     working, so that you can see where everything is being plotted if
%     something goes wrong.
%
% Test Cases:
%
%   ticTacToe(['OO ';'XXX';'   '])
%           => plot should be identical to result from
%               ticTacToe_soln(['OO ';'XXX';'   '])
%             (You can also reference the screenshot of the figure provided
%             in tictactoe1.png)
%
%   ticTacToe(['X O';' O ';'O X'])
%           => plot should be identical to result from
%               ticTacToe_soln(['X O';' O ';'O X'])
%             (You can also reference the screenshot of the figure provided
%             in tictactoe2.png)
%
%   ticTacToe(['XXO';'OOX';'XOX'])
%           => plot should be identical to result from
%               ticTacToe_soln(['XXO';'OOX';'XOX'])
%             (You can also reference the screenshot of the figure provided
%             in tictactoe3.png)
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
