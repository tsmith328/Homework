function [steps, time] = shortCuts(side1,side2)
    %This function calculates the amount of time and number of steps saved
    %by taking short cuts.
    speed = 3.1; %In mph
    usefulSpd = (speed .* 5280) ./ 3600; %Speed in ft/s
    shortCut = sqrt((side1 .^ 2) + (side2 .^ 2)); %Length of shortcut
    
    longTime = (side1 + side2) ./ usefulSpd; %Time for long way
    shortTime = shortCut ./ usefulSpd; %Time for short way
    
    time = 100 .\ round(100 .*(longTime - shortTime)); %Time saved
    
    steps1 = side1 ./ 2.5; %Number of steps in each path
    steps2 = side2 ./ 2.5;
    shortSteps = shortCut ./ 2.5;
    longSteps = steps1+steps2;
    
    steps = ceil(longSteps - shortSteps);
end