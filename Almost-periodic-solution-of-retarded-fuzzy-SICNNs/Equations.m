function v = Equations(t,x,Z)
[m,n,R] = mnR();
r = Neigh();
aij = C1_Aij(t,m,n);
cij = C2_Cij(t,m,n);
Lij = C3_Lij(t,m,n);
bij = C4_Bij(t,m,n);
dij = C5_Dij(t,m,n);
eij = C6_Eij(t,m,n);
tij = C7_Tij(t,m,n);
hij = C8_Hij(t,m,n);
uij = C9_Uij(t,m,n);

Dij = min_max(dij, m, n, r, "min");
Eij = min_max(eij, m, n, r, "max");
Tij = min_max(tij, m, n, r, "min");
Hij = min_max(hij, m, n, r, "max");
    
vlag = {};
for i = 1:m*n
    vlag{i} = Z(:,i);
end

v = zeros(m*n, 1);
counter_ij = 0;
for i = 1:m
    for j  = 1:n
        index = counter_ij*n + j;
        vde = vlag{index};
        v(index) = -aij(i,j)*x(index)+Lij(i,j);
        v(index) = v(index) - Dij{i}{j}*f(vde(index))*x(index);
        v(index) = v(index) - Eij{i}{j}*f(vde(index))*x(index);
        v(index) = v(index) + Tij{i}{j}*uij(i,j);
        v(index) = v(index) + Hij{i}{j}*uij(i,j);
        counter_hl = 0;    
        for h = 1:m
            for l = 1:n
                index_hl = counter_hl*n + l;
                v(index) = v(index) - r{i}{j}{h}{l}*cij(h,l)*f(x(index_hl))*x(index);
                v(index) = v(index) + r{i}{j}{h}{l}*bij(h,l)*uij(i,j);
            end
            counter_hl = counter_hl + 1;
        end
        
    end
    counter_ij = counter_ij + 1;
end


end