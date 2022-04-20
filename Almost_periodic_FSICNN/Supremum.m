function sup_f = Supremum(sample)
%% supremum of coefficients
[m,n,R] = mnR();
variables = {'C1_Aij','C2_Cij','C3_Lij','C4_Bij','C5_Dij','C6_Eij','C7_Tij','C8_Hij','C9_Uij'};
sup = {};
%fprintf("Computing supremum for coefficients: \n")
for coeff = 1:9
    %disp(variables{coeff})
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
vars = {'aij','cij','lij','bij','dij','eij','tij','hij','uij'};
sup_f = containers.Map(vars, sup);

end

