NUM = 2;
[m,n,R] = mnR();
[K,K1,K2,mu1,mu2,k1,k2,k3, delta] = K_coeff(0,m,n);
init = Init_cond(NUM);

T_finite = sum(abs(init{1}-init{2}))^(1-delta)/(K*(1-delta));

T_fixed = 2/(K1*(1-mu1)*(m*n)^(0.5-mu1/2))+2/(K2*(mu2-1));

