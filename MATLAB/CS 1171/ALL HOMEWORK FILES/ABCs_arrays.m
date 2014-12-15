% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A B C D E F G H] = ABCs_arrays(mat1, mat2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parantheses. 
%   Ex. Add 1 + 1 and store it in (GT).
% That means store the value of 1 + 1 in the variable GT. 

% Given Input Variables:
%   1. mat1 - An array of numbers 
%   2. mat2 - An array of numbers
%
% 1. Create an array that has the numbers 3 and 7 in the first row, 4 and 5
%    in the second row, and 13 and 2 in the third row. (A)
A = [3 7; 4 5; 13 2;];
% 2. Create a array of ones that has 7 rows and 2 columns. (B)
B = ones(7,2);
% 3. Find the number of rows and columns in "mat1", and save the number of
%    rows in (C) and the number of columns in (D). 
 [C,D] = size(mat1);
% 4. Vertically concatenate the arrays "mat1" and "mat2". (E)
E = [mat1; mat2];
% 5. Take the top half of the array "mat2" - that is, take all of the 
%    columns and the first half of the rows. Assume there are an even 
%    number of rows. (F)
[rows,~] = size(mat2);
F = mat2(1:rows/2,:);
% 6. Transpose "mat2". (G)
G = mat2';
% 7. Linearize "mat1". "mat1" should go from a MxN array to a (M*N)x1
%    column vector. The new (M*N)x1 vector should be calculated by going
%    down the columns of "mat1". (H)  
[mat1m,mat1n]=size(mat1);
H = reshape(mat1,mat1m.*mat1n,1);
end