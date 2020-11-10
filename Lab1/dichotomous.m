function [X,N] = dichotomous(F,a,b,tol)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
N = 0;
h = 1e-3;
while norm(b-a) > tol && N<5
    lam = 0.5*(a+b)-h;
    my  = 0.5*(a+b)+h;
    if F(lam)>F(my)
        a = lam; 
    else
        b = my;
    end
    X = [a,b,a-b]
    N = N+1
end
    %X = [a,b,a-b];

end

