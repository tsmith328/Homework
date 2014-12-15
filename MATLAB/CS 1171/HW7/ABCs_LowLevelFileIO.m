% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [line1, line2, A, B] = ABCs_LowLevelFileIO(f1, f2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of Lower-Level File I/O
%
%
% Directions:
% Write the code to satisfy the following directions. For each part, store
% your answer in the variable that is specified within the parentheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT. 
%
% Given Input Variables:
%   1. f1 - A file name (including the extension .txt) of a given text file
%           (char)
%   2. f2 - A file name (including the extension .txt) of a text file that 
%           should be written (char)

% 1. fopen(). Open f1 for read access and store the file handle in (fh1)
fh1 = fopen(f1, 'r');
% 2. fgets(). Read in the first line of fh1 using fgets(). (line1)
line1 = fgets(fh1);
% 3. fgetl(). Read in second line of f1 using fgetl(). (line2)
line2 = fgetl(fh1);
% 4. What is the new line character in MatLab? Express answer as a string.
% (A)
A = '\n';
% 5. true or false. When applicable, fgets() will return the new line
% character at the end of the string whereas fgetl() will NOT return the
% new line character. Answer should be the class logical. (B)
B = true;
% 5. fprintf(). Write line2 to a file with a file name specified by the
% variable f2. You will first need to open the file with write access.
fh2 = fopen(f2, 'w');
fprintf(fh2, line2);
% 6. fclose(). Use fclose() to close the files given in f1 and f2.
% Do NOT use fclose all. 
fclose(fh1);
fclose(fh2);
end
