function inf_a = Infimum(sample)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
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

