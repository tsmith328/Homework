%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Tyler Smith
% GT Email     : tsmith328@gatech.edu
% Homework     : hw09
% Course       : CS1171
% Instructor   : Smith
% Lecture Time : T 12:00
% TA's Name    : Elaena Roberts
% Section      : E1
% Collaboration: "I worked on the homework assignment alone, using
%                 only course materials."
%                 
%
% Files provided with this homework:  
%	jTest1.mat
%	myOlympics_TestScript.m
%	askBud.p
%	snowDay_testCaseInputs.mat
%	weatherMan.p
%	willItStick.p
%	ABCs_structures.m
%	ABCs_structure_arrays.m
%   ABCs_hw09_pretest.p
%   evolvePokemon_soln.p
%   jeopardy_soln.p
%   mindPalace_soln.p
%   myOlympics_soln.p
%   snowDay_soln.p
%
% Files to submit:
%	ABCs_structures.m
%	ABCs_structure_arrays.m
%	mindPalace.m
%	evolvePokemon.m
%	jeopardy.m
%	myOlympics.m
%	snowDay.m
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
%  >> ABCs_pretest_hw09
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
%	Structures
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
% PROBLEM 1.  It's elementary, dear Watson.
%--------------------------------------------------------------------------
%
% Function Name: mindPalace
% Inputs  (2): -(cell)   Cell array containing various class objects.
%              -(char)   Name to assign your structure
% Outputs (1): -(struct) The newly formed structure from the cell array 
%                        input.
%				
% Function Description:
%   You've watched Sherlock recently and have decided that you are going to
%   become a genius like him by utilizing the many handy tricks he's 
%   employed on his blog.  Therefore, in order to be able to memorize any 
%   and everything you desire, you are going to store memories and 
%   experiences in a specific location in the "palace" of your mind (also 
%   known as the Method of Loci, more can be read here about this here: 
%   http://en.wikipedia.org/wiki/Method_of_loci.
%
%   Given a cell array and a name to assign to your structure, convert the 
%   cell array into a structure that contains a field for each class of 
%   object that appears in the cell array (with the field name being the 
%   class of that entry, all lower case).  The order of the fields in the 
%   structure should depend on the order the classes of objects occur in 
%   the cell array (i.e. if the first element of the cell array is of type 
%   char, then the first field in the structure will be char).  The 
%   different class types found in the cell array should all be stored in 
%   one cell in the actual structure (so that a field of the structure may 
%   be {true, [false, true], false} if three separate logical elements were
%   found in the cell array).  There will not be any structures in the cell
%   arrays, and if a certain class type does not appear in the cell array, 
%   its corresponding field should not be created.
%
%   Note:
%   - Take note of the contents of the "cell" field in the second test
%   case, and how the cell is nested.
%
%   Test Case:
%   ca1 = {{'kittens', true, [949 48 2 40]}, [true, false, true], 'up and up',...
%         'structures', [98, 0, 4], {'are', true}, 'fun', true,...
%         'souvenirs'}
%   [sa1] = mindPalace(ca1);
%   sa1 =>
%       cell: {{'kittens', true, [949 48 2 40]}, {'are', true}}
%    logical: {[true false true]  [true]}
%       char: {'up and up', 'structures', 'fun', 'souvenirs'}
%     double: {[98 0 4]}
%
%   ca2 = {'Moriarty', [true, false], false, {'Pink Suitcase'}}
%   [sa2] = mindPalace(ca2);
%   sa1 =>
%       char: {'Moriarty'}
%    logical: {[true, fasle]  [false]}
%       cell: {{'Pink Suitcase'}}
%	 
%==========================================================================
% PROBLEM 2.  What? Eevee Is Evolving!
%--------------------------------------------------------------------------
%
% Function Name: evolvePokemon
% Inputs  (2): - (struct) A structure array containing various Pokemon's
%                names and their evolutions
%              - (char) A name of a Pokemon
% Outputs (1): - (cell or char) A cell array containing the names of the 
%                input Pokemon and its evolution line, OR the string
%                '<input name> is not a Pokemon.', with <input name> being 
%                replaced by the second input.
%
% Function Description:
%   Hello, there! Glad to meet you! Welcome to the world of Pokemon! My
%   name is Professor Oak! People affectionately refer to me as the Pokemon
%   Professor.
%
%   This world is inhabited far and wide by creatures called Pokemon. Some
%   Pokemon can evolve into new, stronger Pokemon. Why, my grandson Gary 
%   started with a Squirtle, which later on evolved into a Wartortle, and 
%   then a Blastoise. Others, like Ditto, do not evolve into any other
%   Pokemon, nor do other Pokemon evolve into it. Pokemon nature truly is
%   full of mysteries, and I have spent every day trying to unravel them.
%   To make a complete guide on all the Pokemon in the world...That is my
%   dream! 
%
%   Are you interested in helping me with my Pokemon research? Excellent! 
%   But first, I need to see if your programming skills are sufficient.
%   Write a function called "evolvePokemon" that takes in a structure array
%   as an input and returns a cell array of all subsequent evolutions of
%   that pokemon. Each structure from the input structure array, which
%   we'll call a Pokedex from now on, has two fields containing information
%   about a Pokemon. The first field, "Name", contains a Pokemon's name as
%   a string. The second field, "Evolution", contains the name of the
%   Pokemon that the Pokemon indicated in the Name field evolves into, also
%   represented as a string. If a Pokemon indicated in the Name field does
%   not evolve into another Pokemon, the value for the Evolution field of
%   that structure will be an empty string.
%
%   This is an example of some structures from the Pokedex:
%
%       Name: 'Squirtle'
%       Evolution: 'Wartortle'
%
%   This structure contains information about Squirtle. We can see from the 
%   second field that Squirtle evolves into Wartortle. Now let's look at 
%   another structure:
%
%       Name: 'Wartortle'
%       Evolution: 'Blastoise'
%   
%   This is Wartortle, the evolved form of Squirtle. Here, we can see that
%   Wartortle evolves into Blastoise. Now let's wrap this example up by
%   looking at one more structure:
%
%       Name: 'Blastoise'
%       Evolution: ''
%
%   This is Blastoise, the evolved form of Wartortle. Since the Evolution
%   field has an empty string as its value, we can infer that Blastoise 
%   does not evolve into another Pokemon. We can also say that Blastoise is 
%   the fully evolved form of Squirtle.  Therefore, if given 'Squirtle' as 
%   the Pokemon's name for the second input, assuming that the Pokedex 
%   includes those three structures mentioned above, your function should 
%   return {'Squirtle', 'Wartortle', 'Blastoise'}.
%   
%   Further, if the second input cannot be found in the Name field of any 
%   structure from the Pokedex, then your function should output 
%   '<input name> is not a Pokemon.' as a string (not a cell!), with 
%   <input name> being replaced by the actual second input (i.e. an input
%   of 'Shaggy' will return 'Shaggy is not a Pokemon.').
%
%   Now, get going, and don't forget to do your best!
%
% Notes:
%   - This problem should be solved using structure concepts. Do not write 
%     a loop that contains, as of now, 719 conditionals (or 720 if you 
%     count Missingno.).
%   - If a Pokemon listed in the Pokedex can evolve, the Pokedex is 
%     guaranteed to have all structure(s) pertaining to its evolution line.
%   - Structure(s) pertaining to a Pokemon's evolution(s) will not 
%     necessarily be located next to the structure pertaining to that
%     pre-evolved Pokemon in the Pokedex, nor will these Pokemon 
%     necessarily appear in the Pokedex in order from pre-evolved to fully 
%     evolved form.
%   - If an input Pokemon's name can be found in the Name fields of the 
%     Pokedex, but that Pokemon does not evolve into any other Pokemon, 
%     then the output should just be a single cell containing the input 
%     Pokemon's name.
%   - The Evolution field of a structure will never contain names of
%     multiple Pokemon.
%
% Test Cases:
% pokedex = struct('Name', {'Charizard','Riolu','Chandelure',...
%     'Aerodactyl','Lucario','Charmeleon','Murkrow','Lombre',...
%     'Honchkrow','Litwick','Lotad','Skarmory','Lampent','Charmander',...
%     'Ludicolo'}, 'Evolution', {'','Lucario','','','','Charizard',...
%     'Honchkrow','Ludicolo','','Lampent','Lombre','','Chandelure',...
%     'Charmeleon',''});
%
%     murkrow = evolvePokemon(pokedex, 'Murkrow')
%         murkrow => {'Murkrow', 'Honchkrow'}
%
%     charmander = evolvePokemon(pokedex, 'Charmander')
%         charmander => {'Charmander', 'Charmeleon', 'Charizard'}
%
%     aerodactyl = evolvePokemon(pokedex, 'Aerodactyl')
%         aerodactyl => {'Aerodactyl'}
%
%     alwaysBetterThanYou = evolvePokemon(pokedex, 'Gary Oak')
%         alwaysBetterThanYou => 'Gary Oak is not a Pokemon.'
%
%==========================================================================
% PROBLEM 3.  I'll take Matlab for $1000, Alex
%--------------------------------------------------------------------------
%
% Function Name: jeopardy
% Inputs  (3): - (struct) Jeopardy board
%              - (struct) The players
%              - (cell) Clues in order
% Outputs (2): - (struct) The players with earnings
%              - (string) The name of the winning player
%
% Function Description:
% Given a jeopardy board, the players, and the clues in the order they are
% guessed, write a function called jeopardy that computes the earnings of
% each player and the winner. The jeopardy board will be an MxN structure 
% array with the fields 'answer' and 'value'. The 'answer' field will 
% always contain a string with the correct answer to the clue. The 'value'
% field will always contain a double that specifies the value of that clue
% in dollars. 
%
% The clues cell array will consist of the coordinates of the clues in
% order. Each coordinate will be given as a 1x2 vector [row, column]. These
% correspond to a position on the board. The player input is a 1x3
% structure array with the fields 'name', 'answer', and 'order'. The 'name'
% field contains the player's name as a string. The 'answer' field contains
% a cell array of the answers the player gives in the order they give them.
% So the nth spot in the answer cell array corresponds to the nth clue in
% the clues cell array, The 'order' field contains a vector of the order in
% which the player buzzed in. The nth position in the order field
% corresponds to the order in which they responded to the nth clue. So a
% value of 1 at index 5 would indicate that the person was the first to 
% respond to question 5. 
%
% The way jeopardy is played is that a clue is asked, and then all the
% players have the opportunity to buzz in and give the answer. The first 
% person to buzz in has an opportunity to answer the question. If they get
% the answer correct, then they get the dollar amount of the clue added on
% to their winnings. If they get the answer wrong, then the dollar amount
% of the clue is subtracted from their earnings. If a player buzzes in and
% gets the question wrong, then the other players have a chance to answer.
% For the purpose of this problem, you may assume that a player will always
% buzz in to try and answer the question if they are able to. 
%
% For this problem, you will play a round of jeopardy using all of the
% clues in the clue cell array. At the end of the game, you should output
% the structure of players with an additional field 'earnings', which
% should contain the dollar amount that player earned as a double. You
% should also output the name of the winning player. 
%
%
% Notes:
%   - Remember that a player will always answer the question if able
%   - For this problem, there are no daily doubles or final jeopardy. If
%   you don't know what this means, don't worry about it. And then go watch
%   an episode of jeopardy. (7:30 on ABC)
%   - You can assume there will never be a tie.
%   - Players can earn negative dollar amounts.
%   - Capitilization does not matter when comparing answers. So 'answer' is
%   essentially the same as 'Answer'
%
% Test Cases:
%   run this in your command window: load('jTest1.mat')
%
%   [modifiedPlayers1, winner1] = jeopardy(board1, players1, clues1)
%       [modifiedPlayers1.earnings] => [0, 300, -600]
%        winner1 => 'Cameron'
%
%   [modifiedPlayers2, winner2] = jeopardy(board2, players2, clues2)
%       [modifiedPlayers2.earnings] => [681, 281, 398]
%        winner2 => 'Watson'
%
%==========================================================================
% PROBLEM 4. Who will win? You decide! Epic Matlab Battles of Olympics
%--------------------------------------------------------------------------
% 
% Function Name: myOlympics
% Inputs  (1): - (struct) An MxN structure array with two fields: Country, 
%                         which contains the name of a country, and 
%                         Athletes, which contains a structure of the 
%                         athletes of the country along with the number 
%                         of medals they win.
%
% Outputs (2): - (struct) A structure containing the winning country
%                         along with their total medals
%              - (struct) A structure continaing the most decorated
%                         athlete,their country,and their total medals
%
% Function Description:
%   The glorious winter Olympics have sadly just come to a close.  Tears
% were shed, bragging rights were won, and dreams were fulfilled. 
% You, being the curious individual that you are, want to know which 
% country and individual won the most medals.  Realizing the unbounded 
% potential of Matlab, you decide to write a function to accomplish this
% task.  
%
%   You download off the internet an MxN structure with the two fields. The
% first field has the field name "Country" and contains the name of a
% a country (type char).  The second field has the field name "Athletes",
% and contains a 1xP structure.  This structure has 4 fields. The first
% is titled "Name", and contains the name of an athlete. The second, third,
% and fourth fields are titled 'Gold','Silver',and 'Bronze', and contain 
% the number they won of each, respectively.  
%
% You must parse through all this information and find the total number of 
% medals each country won and determine who won the most.  You must also 
% determine which athlete won the most medals of everyone.  
%
%   Your function will output two structures. The first output is a
% structure with two fields.  The first field is titled "Winning_Country"
% and contains the name of the country that won the most medals.  The
% second field is titled "Total_Medals" and contains the total number of
% medals won by the winning country.
%
%   The second output is a structure with three fields.  The first field is
% titled "Most_Decorated_Star" and contains the name of the athlete that
% won the most medals. The second field is titled "Country" and contains
% which country the winning athlete is from. The third and final field is
% titled "Medals" and contains the total number of medals the athlete won.
%
% Notes:
%   -Though an MxN structure might seem different than a 1xN structure
% you're used to seeing, it really is no different.  It just has multiple
% rows.  
%
%   -You can count on the field names being exactly as given.  So you should
% make sure your's are the exact same as well. Use isequal() to compare
% your answers.
%
%   -To load the test cases, run the script myOlympics_TestScript.m, which
%   is provided.  To find the correct solution, use the p_solution file
%   provided.
% 
%
% Test Cases:
%
% Remember,run the script to load competitors1 and competitors2.
%
%   [winningCountry1, bestAthlete1] = myOlympics(competitors1);
%
%       winningCountry1 = 
%           Winning_Country: 'America'
%              Total_Medals: 57
%       bestAthlete1 = 
%           Most_Decorated_Star: 'Michael Phlelps'
%                       Country: 'America'
%                        Medals: 24
%
%   [winningCountry2, bestAthlete2] = myOlympics(competitors2);
%
%       winningCountry2 = 
%           Winning_Country: 'America'
%              Total_Medals: 57
%       bestAthlete2 = 
%           Most_Decorated_Star: 'AndyQua'
%                       Country: 'Vietnam'
%                       Medals: 31
%
%==========================================================================
% PROBLEM 5.   OMGITSSNOWINGSHUTDOWNTHEWHOLESTATE
%--------------------------------------------------------------------------
%
% Function Name: snowDay
% Inputs  (1): - (struct) A 1x7 structure of the weather forecast for the week.
% Outputs (1): - (char) A string of when campus is closed.
%
% Function Description:
%   You are the head of Georgia Tech's campus closing council, and when a
%   forecast calls for snow, you have to prepare a report on the week and
%   submit it to President Bud Peterson so he can decided whether or not to
%   close campus. Write a function that takes in a structure of a weekly
%   weather forecast, and outputs President Peterson's decision for when
%   campus is to be closed.
%
%   The input structure has three fields:
%       Day: Contains a string of the day of the week
%       Forecast: Contains a string of the forecast (i.e. 'Sunny',
%                 'Cloudy', 'Snow', etc.)
%       High: Contains a double of the high temperature
%
%       Examples of input structure format:
%           week1(1) =>
%               Day: 'Monday'
%          Forecast: 'Sunny'
%              High: 30
%
%           week1(3) => 
%               Day: 'Wednesday'
%          Forecast: 'Cloudy'
%              High: 18
%
%   Your function will need to check if there is snow on the weekly
%   forecast given, make sure the snow will stick, and prepare a report for
%   President Peterson if so.
%
%  The following functions HAVE ALREADY BEEN WRITTEN, and should be used to
%  help you solve the problem, they have been provided in the homework .p
%  files.
%
%    1. logi = willItStick(high_temps_before_snow)
%         Takes in a vector of the high temperatures leading up to (but not
%         including) the snowday, and returns a logical for if the snow
%         will stick. This is for any length vector. For example:
%
%                logi = willItStick([60 60 60 45 30]);
%                    logi => false
%
%                logi - willItStick([25]);
%                    logi => true
%
%    2. [detailed, rate] = weatherMan(snow_forecast)
%         Takes in a 1x1 structure of the forecast on the predicted snowday
%         (with fields Day, Forecast, and High) and outputs:
%         (1) a 1x24 vector of the hour by hour chance of snowfall for the
%               day
%         (2) a number corresponding to the rate of snowfall. 
%
%          For example:
%                snowday = struct('Day', 'Monday', 'Forecast', 'Snow', ...
%                           'High', 31);
%                [detailed, rate] = weatherMan(snowday)
%                    detailed => [0 0 0 0 0 .1 .3 .5 .7 .9 .9 .9 1 1 1 ... 
%                                 1 1 0 0 0 0 0 0 0]
%                    rate => 2
%
%    3. closing = askBud(report)
%         Takes in the report prepared for President Peterson (described
%         below) and outputs his decision on whether campus will be
%         closed or not in a string.  This output will be the output of
%         the function.
%
%         The report will need to be a 1x1 structure with the following
%         fields: Week, SnowDay, PredictedSnowfall, and PredictedDuration.
%         A description of each of these fields is below:
%
%       report.Week => A 1x7 structure of the weekly forecast.
%       report.SnowDay => A string of the day that snow is forecasted.
%       report.PredictedSnowfall => A scalar of class double. The predicted
%                                   snowfall for the snowday.
%       report.PredictedDuration => A scalar of class double. The number of
%                                   days the snow is expected to remain.
%
%    -To calculate the predicted snowfall, multiply the sum of the
%     hour-by-hour's chance of snow by the rate of snowfall.
%
%    -To predict the days that the snow will remain, assume that it will
%     remain up to and through the first day that the high temperature goes
%     above freezing.
%
%    -If no snow is predicted, or if the predicted snow will not stick, then
%    no report needs to be sent to President Peterson, and your function
%    must output the string: 'Campus Will Remain Open.'
%
% Notes: 
%    - Errors have been written into the included functions, so read your
%     error messages.
%    - The days in the input will be in order, but may start on any day of
%     the week
%    - If your predicted snowfall or predicted duration in your prepared
%     report are incorrect, then the output from askBud will also be
%     incorrect.
%    - The only possible output that will not come from askBud.p will be
%     'Campus will remain open.'
%    - There will only ever be one day with a 'Snow' forecast.
%    - Snow will not occur on the first day
%    - The snow will never stay past the days in your input.
%
%
% Test Cases:
%
%    load('snowDay_testCaseInputs.mat');
% 
%    closed1 = snowDay(week1)
%        closed1 => 'Campus will remain open.'
%
%    closed2 = snowDay(week2)
%        closed2 => 'Campus will be closed on Tuesday this week, and will
%                    reopen on Friday'
%
%    closed3 = snowDay(week3)
%        closed3 => 'Classes are cancelled for the week. However, campus
%                    will remain open for skiing.'
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
