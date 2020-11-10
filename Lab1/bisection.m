function [X,N] = bisection(F,gradF,a,b,tol)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
N = 0;
lam = (a+b)/2;
while norm(b-a)>tol
    if gradF(lam)<=0
        a = lam;
    else
        b = lam; 
    end
    lam = (a+b)/2;
    N = N+1;
    X = [a,b,b-a];
end


end

