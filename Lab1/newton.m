function [X,N] = newton(F,gradF,dgradF,x,tol)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
res = 1;
N   = 0;
while norm(res)>tol
   N = N + 1;
   %F_old = F(x);
   x_old = x;
   x = x_old - gradF(x)/dgradF(x)
   res = x-x_old
end
   X = x;
end

