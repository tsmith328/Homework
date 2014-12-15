% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A B C D] = ABCs_conditionals(x, y, z)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of Conditionals
%
% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parantheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT. 
%
% Given Input Variables:
%   1. x - any real number
%   2. y - an integer
%   3. z - a vector of logicals

% 1) if statements: x is a number. Use an if statement to set A equal to
% one of the following numbers: 1, 0, or -1 depending on whether x is 
% positive (set A to 1), zero (set A to 0), or negative (set A to -1). 
% Note that you must use an if statement. (A).

if x > 0
    A = 1;
elseif x < 0
    A = -1;
else
    A = 0;
end

% 2) switch statements: y is an integer. Use a switch statement to set B
% equal to one of the following values: true, false, or the string
% 'neither'. If y is {3, 6, 8, 9, 11}, then set B to true. If y is {2, 5,
% 7}, then set B to false. If y is neither, then set B to the string
% 'neither'. You must use a switch statement to solve this problem.(B) 

switch y
    case {3, 6, 8, 9, 11}
        B = true;
    case {2, 5, 7}
        B = false;
    otherwise
        B = 'neither';
end
% 3) any: Use the any() function to determine if any of the values in the
% vector z are true. (C)

C = any(z);
% 4) all: Use the all() function to determine if all of the values in the
% vector z are true. (D)

D = all(z);
end
