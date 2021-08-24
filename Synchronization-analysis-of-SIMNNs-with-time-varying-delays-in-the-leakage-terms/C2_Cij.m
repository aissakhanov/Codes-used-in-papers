%%1. cijhl >= 0
%%2. connection or coupling strength of the postsynaptic activity of the
%%cell Chl(xij(t)) to Cij(xij(t))
%%
function aij = C2_Cij(t,m,n)
%UNTITLED19 Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n,m,n,2);
for h = 1:m
   for l = 1:n
      
%       if h~=1 && l~=1
      aij(1,1,h,l,1) = 0.02;
      aij(1,1,h,l,2) = 0.5;
%       end
%       if h~=1 && l~=2
      aij(1,2,h,l,1) = 0.3;
      aij(1,2,h,l,2) = 0.1;
%       end
%       if h~=1 && l~=3
      aij(1,3,h,l,1) = 0.3;
      aij(1,3,h,l,2) = 0.5;
%       end
%       if h~=2 && l~=1
      aij(2,1,h,l,1) = 0.5;
      aij(2,1,h,l,2) = 0.1;
%       end
%       if h~=2 && l~=2
      aij(2,2,h,l,1) = 0.4;
      aij(2,2,h,l,2) = 0.2;
%       end
%       if h~=2 && l~=3
      aij(2,3,h,l,1) = 0.6;
      aij(2,3,h,l,2) = 0.1;
%       end
   end   
end
% aij(1,1,2,1,1) = 0.32;
% aij(1,1,2,1,2) = 0.24;
% 
% aij(1,1,3,1,1) = -0.34;
% aij(1,1,3,1,2) = 0.42;
% 
% aij(2,1,1,1,1) = 1.38;
% aij(2,1,1,1,2) = 1.1;
% 
% aij(2,1,3,1,1) = 0.15;
% aij(2,1,3,1,2) = -0.49;
% 
% aij(3,1,1,1,1) = -0.38;
% aij(3,1,1,1,2) = 0.95;
% 
% aij(3,1,2,1,1) = 0.45;
% aij(3,1,2,1,2) = 0.22;

end

