% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A B C D E F G H I J K] = ABCs_structures(a_time, a_date, b_time, b_date, str1, str2, f1, var1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of Structures
%
%
% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parentheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT. 
%
% Given Input Variables:
%   1. a_time - A string of some time
%   2. a_date - Some numerical date
%   3. b_time - A string of some time
%   4. b_date - Some numerical date
%   5. str1 - A structure with at least the field 'City'
%   6. str2 - A structure with at least the fields 'State' and 'TimeZone'
%   7. f1 - A string of a fieldname in the structure str2
%   8. var1 - An unknown value

% 1. Creating structures manually. Create a structure with two fields: 
% 'time' and 'date'. In the first field, 'time', store the value
% contained in the variable "a_time". In the second field, 'date', store 
% the value contained in the variable "a_date". Do *NOT* use the 
% functions struct() or setfield() for this problem. (A)
A.time = a_time;
A.date = a_date;

% 2. Creating structures using struct(). Create a structure with two
% fields: 'time' and 'date'. In the first field, 'time', store the value
% contained in the variable "b_time". In the second field, 'date', store 
% the value contained in the variable "b_date". You *MUST* use the 
% function struct() for this problem. (B)
B = struct('time',b_time,'date',b_date);

% 3. setfield(). Create a structure that is the same as str1, but the field
% named 'City' should have the value of 'Atlanta'. You should not be 
% changing the original structure str1. You *MUST* use setfield() for this 
% problem. (C)
C = str1;
setfield(C,'City','Atlanta');


% 4. getfield(). What is the value of the field named 'City' in str1? You
% *MUST* use getfield() for this problem. (D)
D = getfield(str1,'City');

% 5. Accessing. What is the value of the field named 'State' in str2? You
% may *NOT* use getfield() for this problem. (E)
E = str2.State;

% 6. Accessing indirectly. The variable f1 contains a string representing a
% fieldname. What is the value in the field whose name is given in f1 in
% the structure str2? You may *NOT* use getfield() for this problem. (F)
F = str2.(f1);

% 7. fieldnames(). Use the function fieldnames() to create a cell array
% containing a list of all the fields from str2. (G)
G = fieldnames(str2);

% 8. rmfield(). Use the function rmfield() to create a structure equal to
% str2 with the field named 'TimeZone' removed. The original structure str2 
% should not be changed. (H)
H = rmfield(str2,'TimeZone');

% 9. After running the following line of code, will the field named 'City'
% exist within str1? If yes, the answer should yield the logical true, and
% if no, the answer should yield the logical value false. (I)
%
%           rmfield(str1,'City')
% Important Note: This is not the same as str1 = rmfield(str1,'City')
I = true;

% 10. isstruct(). Is the value of var1 a structure? You answer should be
% either the logical true if var1 is a structure and false otherwise. (J)
J = isstruct(var1);

% 11. isfield(). Does str1 have a field named 'Major'? You answer should be
% either the logical value true if str1 does have a field named 'Major' and 
% false otherwise. (K)
K = isfield(str1,'Major');

end
