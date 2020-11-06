% Golden section search
clc; clear all;


a = 0; b=2;
[lam,my] = golden_sec(a,b);

for k=1:4
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

function [lam,my] = golden_sec(a,b)

lam = a + (1-0.618)*(b-a);

my  = a + 0.618*(b-a);

end

function F21 = fu(x)
    F21 = 1-x*exp(-x);
end
