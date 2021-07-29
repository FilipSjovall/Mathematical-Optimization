function [Kloc,ff] = createData (d_h, f)
% function [Kloc,ff] = createData (d_h, f)
% d_h    :  number of intervals in partition Delta_h
% f      :  coefficient vector for f in full basis (before application of
%           b.c.)
% Kloc   :  local stiffness matrix (with beta=1, e=1) on element of length h
% ff     :  coefficient vector r.h.s.

    h = 1 / d_h; 

    % load local mass and local stiffness matrix on reference element
    S = load('lsm.mat');
    
    % scale Kref and Mref to realize transformation to element of length h
    Kloc = (1/h^3)*S.Kref;
    Mloc = h*S.Mref;

    Mglob = createMglob(Mloc, d_h);

    % Reduce force vector
    dim = 2*(d_h-1);

    %P = ... % reduction matrix (skip DOFs fixed by hom. Dirichlet)
    P = sparse(dim, 2*d_h+2);
    P(:,3:2*d_h) = eye(dim);
    
    ff = P*(Mglob*f);
end
