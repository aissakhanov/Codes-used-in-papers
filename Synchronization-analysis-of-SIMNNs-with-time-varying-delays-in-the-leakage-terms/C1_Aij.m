%%1. aij > 0
%%2. represents the passive decay rate
%%
function coeff = C1_Aij(t,m,n)
[m,n,R] = mnR();
[M, Lf] = MLf();
r = Neigh();

global delta;
global cij;
%delta = Max_init_cond();

sample = linspace(0, 100, 400);
sup = Supremum(sample);

%cij = C2_Cij(0,m,n);
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


% coeff(1,1) = 0.9;
% coeff(1,2) = 0.8;
% coeff(1,3) = 0.5;
% 
% coeff(2,1) = 0.66;
% coeff(2,2) = 0.3;
% coeff(2,3) = 0.1;


end

