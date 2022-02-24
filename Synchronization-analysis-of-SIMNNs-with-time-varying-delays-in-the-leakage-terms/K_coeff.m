function [K,K1,K2,mu1,mu2,k1,k2,k3, sigma] = K_coeff(t,m,n)
%% finite
K = 1;%%tunable positive constant
sigma = 0.5;%% 0 < sigma < 1
%% fixed
K1 = 1;%%tunable positive constant(used for fixed)
K2 = 1;%%tunable positive constant(used for fixed)
mu1 = 0.1;%% 0 < mu1 < 1(used for fixed)
mu2 = 2;%% mu2 > 1(used for fixed)
%% k coefficients
k1 = zeros(m,n);
k2 = zeros(m,n);
k3 = zeros(m,n);

[M,Lf] = MLf();
r = Neigh();
global aij;
global cij;

for i=1:m
   for j=1:n
      k1(i,j) =  -aij(i,j)/M;
      for h=1:m
         for l=1:n
             k1(i,j) = k1(i,j)+r(i,j,h,l)*max(cij(i,j,h,l));
             k2(i,j) = k2(i,j)+r(i,j,h,l)*max(cij(i,j,h,l));
             k3(i,j) = k3(i,j)+r(i,j,h,l)*max(cij(i,j,h,l));      
         end 
      end
      
      k1(i,j) = k1(i,j)*M;
      k2(i,j) = k2(i,j)*Lf;
      k3(i,j) = k3(i,j)*2*M;       
   end   
end
end

