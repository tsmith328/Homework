% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A B C D] = ABCs_structure_arrays(str1, str2, str3, sa1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The ABCs of Structure Arrays
%
% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parantheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT. 
%
% Given Input Variables:
%   1. str1 - A structure with the same fields as str2 and str3
%   2. str2 - A structure with the same fields as str1 and str3 
%   3. str3 - A structure with the same fields as str1 and str2
%   4. sa1 - A structure array with the fields 'college' and 'state'
% In example, str1, str2, and str3 could potentially be the following
% variables
%   str1= struct('field1', value1, 'field2', value2);
%   str2= struct('field1', value3, 'field2', value4);
%   str3= struct('field1', value5, 'field2', value6);

% 1. Creating structure arrays manually. str1, str2, and str3 are three
% similar structures (similar means they have the same fields in the same
% order). Create a structure array of length three containing str3, str2, 
% and str1 in that order. Hint: Structure Concatenation. (A)
A = [str3, str2, str1];

% 2. Adding elements to a structure array. sa1 is a structure array. Two of
% its fields are 'college' and 'state'. Add another element to the end by
% setting the value of the 'college' field to 'UCLA'. Hint: First alter sa1 
% then assign the value B. Indexing with (end + 1) may be be helpful. (B)
sa1(end+1).college = 'UCLA';
B = sa1;

% 3. What value will be given when sa1(end + 1).state is called? (C)
C = [];
% d) Create a structure array of length three with the fields: 'make', 
% 'model', and 'color'. The field values for each of the three elements
% should be as follows:
%
%   1)  make: 'Honda'  model: 'Accord'     color: 'silver'
%   2)  make: 'BMW'    model: '335i'       color: 'silver'
%   3)  make: 'Volvo'  model: 'C70'        color: 'silver'
%
% Note that you *MUST* use struct() for this problem. (D)
st1 = struct('make','Honda','model','Accord','color','silver');
st2 = struct('make','BMW','model','335i','color','silver');
st3 = struct('make','Volvo','model','C70','color','silver');
D = [st1, st2, st3];
end
