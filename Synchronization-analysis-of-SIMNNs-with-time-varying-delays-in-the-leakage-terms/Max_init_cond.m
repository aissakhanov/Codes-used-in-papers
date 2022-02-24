function delta = Max_init_cond()
%%
% maximum of initial conditions
%%
init = Init_cond_1();
delta1 = max(abs(init{1}));
delta2 = max(abs(init{2}));

delta = max(delta1, delta2);
end

