x1 = 1:10;
y1 = [6 5 9 3 7 8 4 6 1 0.5];
x2 = [-10.2 -7 -6.9 -2.5 1.3 5.2];
y2 = [4 14 8 -1.2 -6 4.21];
x3 = 11:20;
y3 = x3.^3 + 2.*x3.^2;

linFit11 = 'sin.csv';
linFit12 = -pi/4;
linFit13 = pi/4;
linFit21 = 'exp.csv';
linFit22 = 0;
linFit23 = 0.5;

bpx1 = [ 0 , 1, 1.5, 2, 3, 4, 5, 6 , 6.5 ,7]; 
bpy1 = [ 0 , 0 , -1, 0 , 5 , 0 , -3 , 0, 1.5, 0];
bptr1 = [9.250 10.000];
bpx2 = [ 0 , 1, 1.5, 2, 3, 4, 5, 6 , 6.5 ,7];
bpy2 = [ 0 , 0 , -1, 0 , 8 , 0 , -4 , 0, 2, 0];
bptr2 = [10 13];
bpx3 = [ 0 , 1, 1.5, 2, 3, 4, 5, 6 , 6.5 ,7]; 
bpy3 = [ 0 , 0 , -1, 0 , 8 , 0 , -4 , 0, 2, 0];
bptr3 = [13.6 16];

%compareExtrap test
compareExtrap(x1,y1,1)
compareExtrap_soln(x1,y1,1)
figure
compareExtrap(x2,y2,1)
compareExtrap_soln(x2,y2,1)
figure
compareExtrap(x3,y3,5)
compareExtrap_soln(x3,y3,5)
pause;
close ALL

%linFit test
slope1 = linFit(linFit11,linFit12,linFit13);
slope1soln = linFit_soln(linFit11,linFit12,linFit13);
figure;
slope2 = linFit(linFit21,linFit22,linFit23);
slope2soln = linFit_soln(linFit21,linFit22,linFit23);
if (slope1==slope1soln&&slope2==slope2soln)
    linFitTest = true;
else
    linFitTest = false;
end
pause;
close ALL;

%heartbeat test
[area1,  cond1] = heartbeat(bpx1,bpy1,bptr1);
[area1soln,cond1soln] = heartbeat_soln(bpx1,bpy1,bptr1);
[area2,  cond2] = heartbeat(bpx2,bpy2,bptr2);
[area2soln,cond2soln] = heartbeat_soln(bpx2,bpy2,bptr2);
[area3,  cond3] = heartbeat(bpx3,bpy3,bptr3);
[area3soln,cond3soln] = heartbeat_soln(bpx3,bpy3,bptr3);

test1 = (area1 == area1soln) && isequal(cond1,cond1soln);
test2 = (area2 == area2soln) && isequal(cond2,cond2soln);
test3 = (area3 == area3soln) && isequal(cond3,cond3soln);
if (test1 && test2 && test3)
    heartbeatAns = true;
else
    heartbeatAns = false;
end
pause;
close ALL

%buySellOrHold test
d1 = buySellOrHold('AAPL_FY2013.xls');
d1s = buySellOrHold_soln('AAPL_FY2013.xls');
figure;
d2 = buySellOrHold('MSFT_FY2013.xls');
d2s = buySellOrHold_soln('MSFT_FY2013.xls');
figure;
d3 = buySellOrHold('AMZN_FY2013.xls');
d3s = buySellOrHold_soln('AMZN_FY2013.xls');
if(isequal(d1,d1s)&&isequal(d2,d2s)&&isequal(d3,d3s))
    buyAns = true;
else
    buyAns = false;
end
pause;
close ALL

%calculus test
[diffEq1, intEq1] = calculus('y=8x^3-4x+16');
[diffEq1soln, intEq1soln] = calculus_soln('y=8x^3-4x+16');
[diffEq2, intEq2] = calculus('y=7');
[diffEq2soln, intEq2soln] = calculus_soln('y=7');
[diffEq3, intEq3] = calculus('y=72x^11');
[diffEq3soln, intEq3soln] = calculus_soln('y=72x^11');
a = isequal(diffEq1,diffEq1soln)&&isequal(diffEq2soln,diffEq2)&&isequal(diffEq3,diffEq3soln);
b = isequal(intEq1,intEq1soln)&&isequal(intEq2,intEq2soln)&&isequal(intEq3,intEq3soln);
if a&&b
    calcTest = true;
else
    calcTest = false;
end

if linFitTest&&heartbeatAns&&calcTest&&buyAns
    val = true
else
    val = false
end