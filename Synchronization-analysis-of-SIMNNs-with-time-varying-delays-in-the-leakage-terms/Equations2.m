function v = Equations2(t,x,Z)
[m,n,R] = mnR();
r = Neigh();
aij = C1_Aij(t,m,n);
cij = C2_Cij(t,m,n);
Lij = C3_Lij(t,m,n);
Gij = G(m,n);
[K,K1,K2,mu1,mu2,k1,k2,k3, delta] = K_coeff(t,m,n);
NUM = 2;
c = zeros(m,n,m,n);
c2 = zeros(m,n,m,n);
for k = 1:NUM
    counter_ij = 0;
    for i = 1:m
        for j = 1:n
            index = m*n*(k-1)+counter_ij*n + j;
            if x(index) <= Gij(i,j)
                ind = 1;
            else
                ind = 2;
            end
            for h = 1:m
               for l = 1:n
                   if k == 1
                       c(i,j,h,l) = cij(i,j,h,l,ind);
                   else
                       c2(i,j,h,l) = cij(i,j,h,l,ind);
                   end
               end
            end
        end
        counter_ij = counter_ij + 1;
    end
end
vlag = {};
for i = 1:NUM*m*n
    vlag{i} = Z(:,i);
end

v = zeros(NUM*m*n, 1);
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

counter_ij = 0;
for i = 1:m
    for j  = 1:n
        index = m*n*(NUM-1)+counter_ij*n + j;
        old_index = counter_ij*n + j;
        e_ij = x(index)-x(old_index);
        
        v(index) = -aij(i,j)*x(index)+Lij(i,j);
        v(index) = v(index)-k1(i,j)*e_ij-k3(i,j)*sign(e_ij)*abs(x(index)) - K*sign(e_ij)*(abs(e_ij))^delta;
        counter_hl = 0;    
        for h = 1:m
            for l = 1:n
                index_hl = m*n*(NUM-1)+counter_hl*n + l;
                old_index_hl = counter_hl*n + l;
                
                vde = vlag{index_hl};
                old_vde = vlag{old_index_hl};
                e_hl = vde(index_hl) - old_vde(old_index_hl);
                v(index) = v(index) - r(i,j,h,l)*c2(i,j,h,l)*f(vde(index_hl))*x(index);
                v(index) = v(index) - r(i,j,h,l)*k2(i,j)*sign(e_ij)*abs(x(index))*abs(e_hl);
            end
            counter_hl = counter_hl + 1;
        end    
    end
    counter_ij = counter_ij + 1;
end
disp(t)

end