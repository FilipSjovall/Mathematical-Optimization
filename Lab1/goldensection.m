function [X,N] = goldensection(F,a,b,tol)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

lam = a + (1-0.618)*(b-a);
my  = a + 0.618*(b-a);

N = 0;
while norm(b-a)>tol
    N = N + 1;
    if F(lam)>F(my)
        a      = lam;
        lam    = my;
        my  = a + 0.618*(b-a);  
    else
        b      = my;
        my     = lam;
        lam = a + (1-0.618)*(b-a);
    end
end
X = [a,b,b-a];


end

