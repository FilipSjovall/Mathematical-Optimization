
clc; clear all;
%% a) Golden section search
a = -1; b=1;
[lam,my] = golden_sec(a,b);
for k=1:5
    Fl = fu(lam);
    Fm = fu(my);
    if Fl>Fm
        a      = lam;
        lam    = my;
        [~,my] = golden_sec(a,b);    
    else
        b        = my;
        my       = lam;
        [lam,~] = golden_sec(a,b);
    end
end

[a,lam,my,b]

%% Dichotomous search
a = -1; b=1;
h = 0.01;
[lam,my] = dichot(a,b,h);
for k=1:5
    Fl = fu(lam);
    Fm = fu(my);
    if Fl>Fm
        a=lam;
    else
        b=my;
    end
    [lam,my] = dichot(a,b,h);
end

[a,lam,my,b]
%% Functions
function F21 = fu(x)
    F21 = exp(-x)+x^2;
end

function [lam,my] = golden_sec(a,b)

lam = a + (1-0.618)*(b-a);

my  = a + 0.618*(b-a);

end

function [lam,my] = dichot(a,b,h)
    lam = 0.5*(a+b)-h;
    my  = 0.5*(a+b)+h;
end