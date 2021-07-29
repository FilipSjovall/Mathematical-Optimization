function [ce, dce] = compliance (e,Kloc,ff) 
% function [ce, dce] = compliance (e,Kloc,ff) 
% e      :   design vector (algebraic form)
% Kloc   :   local stiffness matrix on element of length h
% ff     :   nodal force vector
% ce     :   value of compliance functional for design e
% dce    :   gradient of compliance functional evaluated at design e

    d_h = length(e);
    
    % assemble global stiffness matrix
   [Kglob] = createKglob (e, Kloc);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    % complete the codes here %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % solve equilibrium equation

    q = Kglob\ff;
    
    %q = [zeros(2,1);q;zeros(2,1)];
    
    ce = ff'*q;
    
    
    q=[0;0;q;0;0];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    % complete the codes here %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Gradient
    if nargout > 1
      dce = zeros(d_h, 1);  
      for i=1:d_h
        index = (1:4) + 2*(i-1);
        
        % compute partial derivative
        dce(i) =  -(3*e(i)^2)*q(index)'*Kloc*q(index); % complete the code here *
      end
    end
    
end
