function aij = C2_Cij(t,m,n)
%% 
% 1. cijhl >= 0
% 2. connection or coupling strength of the postsynaptic activity of the
% cell Chl(xij(t)) to Cij(xij(t))
%%
aij = zeros(m,n,m,n,2);
for h = 1:m
   for l = 1:n
      aij(1,1,h,l,1) = 0.02;
      aij(1,1,h,l,2) = 0.5;

      aij(1,2,h,l,1) = 0.3;
      aij(1,2,h,l,2) = 0.1;

      aij(1,3,h,l,1) = 0.3;
      aij(1,3,h,l,2) = 0.5;

      aij(2,1,h,l,1) = 0.5;
      aij(2,1,h,l,2) = 0.1;

      aij(2,2,h,l,1) = 0.4;
      aij(2,2,h,l,2) = 0.2;

      aij(2,3,h,l,1) = 0.6;
      aij(2,3,h,l,2) = 0.1;     
   end   
end
end

