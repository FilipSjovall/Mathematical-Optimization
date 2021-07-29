function [Kglob] = createKglob (e, Kloc)
% function [Kglob] = createKglob (e, Kloc)
% e      :    design vector
% Kloc   :    local stiffness matrix on element of length h
% Kglob  :    global stiffness matrix (after application of b.c.)
    
    d_h = length(e); % dimension of design space = #intervals ...
    
    h   = 1/d_h;
    
    % Initialize (full dimension *before* appl. of b.c.)
    Kglob = sparse(2*d_h+2, 2*d_h+2);
    
    % Assemble
   for l=1:d_h
       index = ( 1 : 4 ) + ( l - 1 )*2;
        % blow up local stiff mat to full dimensions and add to Kglob
        Klocfull = spalloc(2*d_h+2, 2*d_h+2,4*4);
        
        Klocfull(index, index) =  e(l)^3*Kloc ;
        
        Kglob(index,index)= Kglob(index,index) + e(l)^3*Kloc ;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
        % complete the codes here %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%
   end
    % Reduce local stiffness matrices
    % according to boundary conditions
    dim = 2*(d_h-1);
    % NN is a reduction matrix
    P = sparse(dim, 2*d_h+2);
    P(:,3:2*d_h) = eye(dim);
%     P = sparse(size(Kglob));
%     P = eye(2*d_h+2);
%     P(1:2,1:2) = 0;
%     P(end-1:end,end-1:end) = 0;
    Kglob =  P*Kglob*P';
end 