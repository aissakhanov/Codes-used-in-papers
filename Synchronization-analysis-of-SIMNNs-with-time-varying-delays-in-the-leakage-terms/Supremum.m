function sup_f = Supremum(sample)
%%
% function computing Supremum of Lij
%%
[m,n,R] = mnR();
variables = {'C3_Lij'};
sup = {};
fprintf("Computing supremum for coefficients: \n")
for coeff = 1:1
    disp(variables{coeff})
    sup{end+1} = {};
    for i = 1:m
        sup{coeff}{i} = {};
        for j = 1:n
            sup{coeff}{i}{j} = -1e6;
            for t = sample
                var = variables{coeff};
                s = strcat(var,"(t,m,n)"); 
                coeff_ij = eval(s);
                sup{coeff}{i}{j} = max(sup{coeff}{i}{j}, coeff_ij(i,j));
            end
        end
    end
end
vars = {'lij'};
sup_f = containers.Map(vars, sup);
end

