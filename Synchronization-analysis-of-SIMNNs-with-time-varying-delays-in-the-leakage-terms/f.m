%%1. positive continuous function
%%2. output or firing rate of Cij(t)
%%Assumptions: a) satisfies Lipshitz condition; b) bounded
%%
function f = f(t)
% it should be positive cont. function
[M,Lf] = MLf();

f = tanh(t);
% f = abs(t+1) - abs(t-1)+2.001;

end

