function delta = Max_init_cond()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
init = Init_cond_1(2);
delta1 = max(abs(init{1}));
delta2 = max(abs(init{2}));

delta = max(delta1, delta2);
end

