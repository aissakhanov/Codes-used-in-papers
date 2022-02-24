function f = f(t)
%% 
% 1. output or firing rate of Cij(t)
% Assumptions: a) satisfies Lipshitz condition; b) bounded
%%
[M,Lf] = MLf();
f = tanh(t);
end

