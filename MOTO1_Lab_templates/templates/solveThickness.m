function [eopt, qopt] = solveThickness (d_h, f, L, gamma, emin, emax)
% function solveThickness (d_h, f, L0, gamma0, emin0, emax0)
% d_h       :   number of intervals in partition of Delta_h
% f         :   force function mapping from [0,1] -> R implemented as Matlab function,
%               which returns function value and first derivative at a given point (see,
%               e.g. fex1.m)
% L         :   uniform Lipschitz constant for design
% gamma     :   prescribed total volume
% emin,emax :   lower and upper bounds for design
% e0        :   initial design (optional)0.0000
% eopt      :   optimal design vector (algebraic form)
% qopt      :   corresponding optimal state vector (algebraic form)

% compute interval length from # elements
h = 1/d_h;

% assemble local stiffness matrix and right hand side

% use/complete function createF for to evaluate f at nodes
% (function values and first derivatives) 
ftmp = createF(d_h, f);

% use/complete function createData to assmble Kloc and r.h.s. ff
[Kloc, ff] = createData(d_h, ftmp);

if nargin < 7
    % set initial thickness (compatible with volume constraint)
    e0 = 0.5*ones(d_h,1);
end

% set box constraints

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% complete the codes here %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%define inequality (=slope) constraints

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% complete the codes here %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%define equality (=volume) constraint

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% complete the codes here %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set options for fmincon
options = optimset('Display','iter','LargeScale','off','TolX',1.0e-5,...
    'GradObj','on','DerivativeCheck','off',...
    'MaxFunEvals',100000,'Diagnostics','off');

% Call fmincon
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% complete the codes here %
%
% note: use function compliance.m as objective (to get rid of additional
%       parameters you may use the concept of anonymous functions)
%
lb = emin; % "e_min"
ub = emax;    % "e_max"
A  = -eye(d_h);
idx = [1:d_h-1;2:d_h]';
for i = 2:d_h-1
    A(i-1,i) = 1;
end
A   = A(1:d_h-1,:);
A(d_h-1,d_h) = 1;
A   = [A;-A];
b   = L*h*ones(d_h-1,1);
b   = [b;b];
Aeq= ones(d_h,1)';
Beq= gamma/h;
eopt = fmincon(@(e) compliance(e,Kloc,ff),e0,A,b,Aeq,Beq,lb,ub,[],options);
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% compute deformation associated with optimal design eopt
% (solve one more state problem for this)
[Kglob] = createKglob (eopt, Kloc);
qopt = Kglob\ff;

% display eopt, qopt
hold off;
plot([0,1],[0,0],'r')
ylim([-1.5 10])
hold on;

% add zeroes for b.c.
q=[0;0;qopt;0;0];
% scale deformation (for visualization)
q=q/max(abs(q));

% use/complete interpolation function evalq to plot state
qq = @(x) feval(@evalq, x, q);
fplot(qq, [0 1]);

% use/complete interpolation function evale to plot design
ee = @(x) feval(@evale, x, eopt);
fplot(ee, [0 1], 'r');

legend('design','displaced design','Location','EastOutside');

end
