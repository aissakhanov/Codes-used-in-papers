function coeff = C1_Aij(t,m,n)
%% 
% 1. aij > 0
% 2. represents the passive decay rate
%%
[m,n,R] = mnR();
[M, Lf] = MLf();
r = Neigh();

global delta;
global cij;

sample = linspace(0, 100, 400);
sup = Supremum(sample);

lij = sup('lij');

coeff = zeros(m,n);
for i = 1:m
    for j = 1:n
        coeff(i,j) = 1+lij{i}{j};
            for h = 1:m
                for l = 1:n
                    coeff(i,j) = coeff(i,j) + M*delta*r(i,j,h,l)*max(cij(i,j,h,l));
                end
            end
    end
end
end

