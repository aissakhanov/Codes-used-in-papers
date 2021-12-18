function [A3_valid, delta] = check_A3()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n,R] = mnR();
[M, Lf] = MLf();
r = Neigh();

delta = Max_init_cond();

sample = linspace(0, 100, 400);
sup = Supremum(sample);

aij = C1_Aij(0,m,n);
cij = C2_Cij(0,m,n);
lij = sup('lij');

A3_valid = zeros(m,n);
for i = 1:m
    for j = 1:n
        A3_valid(i,j) = aij(i,j) - lij{i}{j};
            for h = 1:m
                for l = 1:n
                    A3_valid(i,j) = A3_valid(i,j) - M*delta*r(i,j,h,l)*max(cij(i,j,h,l));
                end
            end
    end
end

end

