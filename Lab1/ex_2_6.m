



%% a) Newton's method
lam = 1;
x=1;
tol=1;
iter=0;
while tol>1e-4
    iter  = iter+1;
    f_old = fu(x)
    x     = newton_step(gradF21(x),dgradF21(x),x)
    tol   = norm(fu(x)-f_old);
end



%% b) Bisectibng search method
a=-1; b=1;
tol=1;
iter=0;
lam = (a+b)/2;
while tol>1e-4
    iter = iter+1;
    f_old = fu(lam);
    %lam_old = lam;
    if gradF21(lam)<=0
        a = lam;
    else
        b = lam;
    end
    lam = (a+b)/2;
    tol   = norm(fu(lam)-f_old);
    %tol   = norm(lam-lam_old);
end

%% Functions
function x_new = newton_step(df,ddf,x)
x_new   = x-df/ddf;
end
function F21 = fu(x)
F21 = exp(-x)+x^2;
end

function df21 = gradF21(x)
df21 = -exp(-x) + 2*x;
end

function ddf21= dgradF21(x)
ddf21 = exp(-x) + 2;
end