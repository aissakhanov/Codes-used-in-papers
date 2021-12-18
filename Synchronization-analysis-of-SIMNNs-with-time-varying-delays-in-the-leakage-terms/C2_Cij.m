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
%       
% %       if h~=1 && l~=1
%       aij(1,1,h,l,1) = 2;
%       aij(1,1,h,l,2) = 3;
% %       end
% %       if h~=1 && l~=2
%       aij(1,2,h,l,1) = 4;
%       aij(1,2,h,l,2) = 6;
% %       end
% %       if h~=1 && l~=3
%       aij(1,3,h,l,1) = 0.5;
%       aij(1,3,h,l,2) = 0.4;
% %       end
% %       if h~=2 && l~=1
%       aij(2,1,h,l,1) = 5;
%       aij(2,1,h,l,2) = 1.2;
% %       end
% %       if h~=2 && l~=2
%       aij(2,2,h,l,1) = 0.9;
%       aij(2,2,h,l,2) = 0.2;
% %       end
% %       if h~=2 && l~=3
%       aij(2,3,h,l,1) = 0.8;
%       aij(2,3,h,l,2) = 0.1;
% %       end
%%
%OLD

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
%       
   end   
end

end

