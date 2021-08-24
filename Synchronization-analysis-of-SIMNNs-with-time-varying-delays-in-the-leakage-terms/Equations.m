function v = Equations(t,x,Z)
[m,n,R] = mnR();
r = Neigh();
aij = C1_Aij(t,m,n);
cij = C2_Cij(t,m,n);
Lij = C3_Lij(t,m,n);
Gij = G(m,n);

c = zeros(m,n,m,n);
counter_ij = 0;
for i = 1:m
    for j = 1:n
        index = counter_ij*n + j;
        if x(index) <= Gij(i,j)
            ind = 1;
        else
            ind = 2;
        end
        for h = 1:m
           for l = 1:n
               c(i,j,h,l) = cij(i,j,h,l,ind);
           end
        end
    end
    counter_ij = counter_ij + 1;
end

vlag = {};
for i = 1:m*n
    vlag{i} = Z(:,i);
end

v = zeros(m*n, 1);
counter_ij = 0;
for i = 1:m
    for j  = 1:n
        index = counter_ij*n + j;
        v(index) = -aij(i,j)*x(index)+Lij(i,j);
        counter_hl = 0;    
        for h = 1:m
            for l = 1:n
                index_hl = counter_hl*n + l;
                vde = vlag{index_hl};
                v(index) = v(index) - r(i,j,h,l)*c(i,j,h,l)*f(vde(index_hl))*x(index);
            end
            counter_hl = counter_hl + 1;
        end    
    end
    counter_ij = counter_ij + 1;
end
disp(t)

end