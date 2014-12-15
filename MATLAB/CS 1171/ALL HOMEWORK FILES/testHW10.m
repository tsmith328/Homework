%plotStock test
load plotStock_TestCases;
cases = {GOOG_FY2013Q4, MSFT_FY2013Q4, S_FY2013Q4, TMUS_FY2013Q4, T_FY2013Q4, VZ_FY2013Q4, YHOO_FY2013Q4};
for i = 1:length(cases)
    figure
    plotStock(cases{i})
    plotStock_soln(cases{i})
end
pause;
close ALL

%howToCircle test
howToCircle([0,0],5,53.130101235)
howToCircle_soln([0,0],5,53.130101235)
figure
howToCircle([-1,6],0.5,24.3)
howToCircle_soln([-1,6],0.5,24.3)
figure
howToCircle([0,0],0,0)
howToCircle_soln([0,0],0,0)
pause;
close ALL

%labReport test
str1 = struct('Distance_Ran_in_Miles',[0,0.5,1,1.5,2],'Calories_Burned',{[0,85,126,...
 172, 250],[0,69,127,189,221],[0,73,134,165,234]});
str2 = struct('Days_Since_Sprouting',[0,20,40,60,80,100],'Height_in_Meters',{[0,...
 0.2,1.2,1.7,2.2,2.9],[0,0.3,0.9,1.9,2.1,3.1],[0,0.9,1.3,1.8,2.7,3.4],[0,0.1...
 ,0.8,1.2,1.8,2.3],[0,0.6,1.1,2.0,2.4,2.8],[0,0.3,1.3,2.0,2.7,2.9]});
labReport(str1, 'Calories Lost')
figure
labReport_soln(str1, 'Calories Lost')
figure
labReport(str2, 'Sunflower Growth')
figure
labReport_soln(str2, 'Sunflower Growth')
pause;
close ALL

%worldClock test
cities1 = {{'San Francisco' '-03:00'} {'Austin' '-01:00'} {'Moscow' '+09:00'} {'Tokyo' '+14:00'}};
time1 = '04:23';
cities2 = {{'Fairbanks' '-04:00'} {'Dubai' '+09:00'}};
time2 = '12:59';
time3 = '11:11';
cities3 = {{'Bogota' '00:00'} {'Hanoi' '+12:00'} {'Lima' '00:00'}... 
            {'Jakarta' '+12:00'} {'Montreal' '00:00'}};
worldClock(time1,cities1)
figure
worldClock_soln(time1,cities1)
figure
worldClock(time2,cities2)
figure
worldClock_soln(time2,cities2)
figure
worldClock(time3, cities3)
figure
worldClock_soln(time3,cities3)
pause;
close ALL

%ticTacToe test
game1 = ['OO ';'XXX';'   '];
game2 = ['X O';' O ';'O X'];
game3 = ['XXO';'OOX';'XOX'];
ticTacToe(game1)
ticTacToe_soln(game1)
figure
ticTacToe(game2)
ticTacToe_soln(game2)
figure
ticTacToe(game3)
ticTacToe_soln(game3)
pause;
close ALL