%%1. aij > 0
%%2. represents the passive decay rate
%%
function aij = C1_Aij(t,m,n)
aij = zeros(m,n);

a(1,1) = 0.9;
a(1,2) = 0.4;
a(1,3) = 0.5;

a(2,1) = 0.66;
a(2,2) = 0.3;
a(2,3) = 0.1;

% a(1,1) = 1.3;
% a(2,1) = 0.1;
% a(3,1) = 0.3;


end

