function qx = evalq(x,coeff)
% function qx = evalq(x,coeff)
% x      :  evaluation point
% coeff  :  coefficient vector (= displacement vector, algebraic form)
% qx     :  function value evaluated at x

qx = 0;

if x >= 1
    return;
elseif x <= 0
    return;
end

n_h = length(coeff)/2 - 1;
h = 1/n_h;

%
% add code for evaluation of p.w. hermite polynomial here
%

qx = ...

end