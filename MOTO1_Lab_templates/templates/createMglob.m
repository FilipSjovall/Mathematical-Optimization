function [Mglob] = createMglob (Mloc, d_h)
% function [Mglob] = createMglob (Mloc, d_h)
% Mloc   :    local stiffness matrix on element of length h
% d_h    :    number of intervals in partition Delta_h
% Mglob  :    global mass matrix (after application of b.c.)

% Initialize
Mglob = sparse(2*(d_h+1), 2*(d_h+1));
% h   = 1/d_h;
% Assemble
for l=1:d_h
    index = ( 1 : 4 ) + ( l - 1 )*2;
    Mlocfull = spalloc(2*d_h+2, 2*d_h+2,4*4);
    
    Mlocfull(index, index) =  Mloc ;
    
    Mglob(index, index) = Mglob(index, index) + Mloc;
    
end

% Mglob = Mglob;
% Reduce local stiffness matrices
% according to boundary conditions
dim = 2*(d_h-1);
% NN is a reduction matrix
% P = sparse(dim, 2*d_h+2);
% P(:,3:2*d_h) = eye(dim);
% P = sparse(size(Mglob));
% P = eye(2*d_h+2);
% P(1:2,1:2) = 0;
% P(end-1:end,end-1:end) = 0;
% Mglob = P*Mglob*P';
Mglob(1:2,:) = 0;
Mglob(:,1:2) = 0;
Mglob(end-1:end,:) = 0;
Mglob(:,end-1:end) = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% complete the codes here %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
