% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A B] = ABCs_iteration(vec, num)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of Iteration
%
% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parentheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT. 
%
% Given Input Variables:
%   1. vec - a vector of numbers
%   2. num - an integer greater than 1

% 1. for loops. Fix the following for loop so that A is the vector vec in
% reverse order. Replace every ? with the necessary code. You must utilize
% the for loop to receive credit. (A)

% If vec is [3 2 6 8 2], then A should look like this after each iteration:
% [3]
% [2 3]
% [6 2 3]
% [8 6 2 3]
% [2 8 6 2 3]

A=[];
% for ind=?                    % ind are the indices of vec
%     A=[vec(?) ?];            % Puts the next element from vec before 
% end                          % everything in A

% 2. while loops. Use the following while loop to count the number of
% perfect squares between 1 and num inclusive. Store your answer in the
% variable B. Replace every ? with the necessary code. You must utilize
% this while loop to receive any credit. (B)
i = 1;                       % Start from 1
B = 0;                       % Initializes a counting variable
while i<=num                      % When i is less than or equal to num
    if mod(sqrt(i),1)==0     % Checks to see if sqrt(i) is an integer root
        B=B+1;               % Increment the counter if an integer is found
    end
    i = i+1;                 % Moves to the next index position
end
end
