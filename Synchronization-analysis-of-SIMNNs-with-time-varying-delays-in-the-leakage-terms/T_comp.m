%%
% script computing synchroniztion times
%%
NUM = 2;
[m,n,R] = mnR();
[K,K1,K2,mu1,mu2,k1,k2,k3, sigma] = K_coeff(0,m,n);
init = Init_cond_1(NUM);

T_finite = sum(abs(init{1}-init{2}))^(1-sigma)/(K*(1-sigma));

T_fixed = 2/(K1*(1-mu1))+2/(K2*(m*n)^(0.5-mu2/2)*(mu2-1));

