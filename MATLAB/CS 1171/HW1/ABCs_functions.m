% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A B C D E F G H I J K L M] = ABCs_functions()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Answer the following statements by setting the variables immediately
% following the questions with either the words 'true' or 'false' (without
% the single quotes). Note that MATLAB understands the meaning of these
% particular key words by default. This will be important later in the
% semester.

% Example.  Professor Smith teaches CS 1371.
% example = true;

%--------------------------------------------------------------------------
%Part I. Functions Versus Scripts

% Functions and scripts are both stored in M-files.
A = true

% Functions and scripts are essentially one and the same.
B = false

% Functions have their own scope; that is, variables that are defined
% inside a function cannot not access the workspace in which the function 
% is run.
C = true

% By default, functions that I write will work even if they are not in my
% current directory.
D = false

%--------------------------------------------------------------------------
% Part II. Function Headers. For the following function headers, answer
% true if they are valid, false otherwise.

% function myFunc = [in1, in2]
E = false

% function out = myFunc
F = true

% function [out two three] = myFunc(in)
G = true

% function [out] = myFunc(out)
H = true
% function (out two) = myFunc[in]
I = false

% function [out out2] = myFunc(in in2);
J = false

%--------------------------------------------------------------------------
% Part III. Function Scope

% If I have a valid function "myFunc" with the header:
%
%               function [out1 out2] = myFunc(in)
%
% and I call [a b] = myFunc(13) from the command line:

% Is "a" defined in my workspace (have I assigned it a value in the
% workspace)?
K = true

% Is "out2" defined in my workspace?
L = false

% Is "in" defined in my workspace?
M = false
end