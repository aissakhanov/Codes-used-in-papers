function tao = Lambda_delay2(t,y)
%%
% combined initial conditions
%%
lam = Lambda_delay(t,y);
tao = cat(1, lam, lam);
end

