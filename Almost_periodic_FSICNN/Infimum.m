function inf_a = Infimum(sample)
%% function computing infimum of aij
[m,n,R] = mnR();
sup = {};   
for i = 1:m
    sup{i} = {};
    for j = 1:n
        sup{i}{j} = 1e6;
        for t = sample
            aij = C1_Aij(t,m,n);
            sup{i}{j} = min(sup{i}{j}, aij(i,j));
        end
    end
end
inf_a = sup;

end

