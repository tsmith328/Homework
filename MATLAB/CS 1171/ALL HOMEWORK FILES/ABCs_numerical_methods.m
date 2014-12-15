% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A, B, C, D, E, F, G, H, I] = ABCs_numerical_methods(x, y, xi)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of Numerical Methods
%
% This is a multi-part problem.  Do each of the parts below.
%
% DO NOT CHANGE THE FUNCTION HEADER (the first line of code)
%
% Problem Parts:

% a) interp1. Find the y values that correspond to the xi values using
% linear interpolation from the vectors x and y. (A)
A = interp1(x,y,xi);

% b) spline. Find the y values that correspond to the xi values using
% the spline method from the vectors x and y. (B)
B = spline(x,y,xi);

% c) polyfit. Find the coefficients of the fifth order polynomial that best
% fits the points represented by vectors x and y. (C)
C = polyfit(x,y,5);

% d) polyval. Evaluate the polynomial found in part c at the points in the
% vector xi. (D)
D = polyval(C,xi);

% e) diff. Approximate the derivative, dy/dx, for the vectors x and y. (E)
%E = diff(x,y);
dx = diff(x);
dy = diff(y);
E = dy./dx;
% f) Approximate the second derivative for the vectors x and y. The
% x vector should consist of all except for the last index of the original
% x vector used in the previous part. (F)

F = diff(E)./dx(1:end-1);
% g) cumsum. Find the cumulative sum of the elements in x. (G)
G = cumsum(x);

% H) trapz. Find the area under the curve represented by x and y by using
% the trapzoidal method of approximation. (H)
H = trapz(x,y);

% I) cumtrapz. Find the cumulative area under the curve represented by x
% and y by using the trapzoidal method of approximation. (I)
I = cumtrapz(x,y);
end