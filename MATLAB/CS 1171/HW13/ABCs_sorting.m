% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A B C D E F G] = ABCs_sorting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Directions: 
% Identify the sorting algorithm described in each question by setting the 
% variables immediately following the questions with either the strings:
% - 'insertion'
% - 'bubble'
% - 'quick'
% - 'merge'
% If two or more sorting algorithms match the description in the question,
% set the variable to a cell array of strings containing the correct
% algorithms (e.g. {'insertion' 'bubble'}).
%
% Notes:
% - Make sure all strings are all lowercase and spelled correctly
% - When applicable, the order of the strings in the cell array should be
%   alphabetical (e.g. {'bubble' 'insertion' 'merge' 'quick})
%
%--------------------------------------------------------------------------
%
% This sorting algorithm(s) usually involves comparing adjacent components
% and swapping them, without using recursion.
A = 'bubble';

% This sorting algorithm(s) has a typical Big O of N^2.
B = {'bubble','insertion'};

% This sorting algorithm(s) usually begins with the creation of an empty
% vector.
C = 'insertion';

% This sorting algorithm(s) employs recursion and has a typical Big O of
% N*log(N).
D = {'merge','quick'};

% In this sorting algorithm(s), the input vector is recursively split in
% half.
E = 'merge';

% Identify the algorithm(s) based on the code shown:
%
% function ret = unknown_sort(vec)
% for i = 1:length(vec)
%     for j = 1:length(vec)-i
%         if vec(j) > vec(j+1)
%             pivot = vec(j+1);
%             vec(j+1) = vec(j);
%             vec(j) = pivot;
%         end
%     end
% end
% ret = vec;
% end
F = 'bubble';

% function ret = unknown_sort(vec)
% if isempty(vec)
%     ret = [];
% elseif length(vec) == 1
%     ret = vec;
% else
%     insert = vec(1);
%     lower = vec(vec < insert);
%     greater = vec(vec > insert);
%     inserts = vec(vec == inserts);
%     ret = [unknown_sort(lower), inserts, unknown_sort(greater)];
% end
% end
G = 'quick';


end