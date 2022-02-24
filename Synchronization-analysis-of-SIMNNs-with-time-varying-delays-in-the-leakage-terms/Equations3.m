function v = Equations3(t,x,Z)
%%
% fixed-time case
%% INITIALIZE PARAMETERS
global m n;
global r;
global aij;
global cij;
global Gij;
global K1 K2 mu1 mu2 k1 k2 k3;
global delta;
global NUM;
Lij = C3_Lij(t,m,n);
%% INCORPORATE SWITCHING JUMP
c = zeros(m,n,m,n);
c2 = zeros(m,n,m,n);
for k = 1:NUM
    for i = 1:m
        for j = 1:n
            index = m*n*(k-1)+(i-1)*n+j;
            if abs(x(index)) <= Gij(i,j)
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
    end
end
%% MAIN EQUATION
vlag = {};
for i = 1:NUM*m*n
    vlag{i} = Z(:,i);
end

v = zeros(NUM*m*n, 1);
for i = 1:m
    for j  = 1:n
        index = (i-1)*n+j;
        v(index) = -aij(i,j)*x(index)+Lij(i,j);   
        for h = 1:m
            for l = 1:n
                index_hl = (h-1)*n+l;
                vde = vlag{index_hl};
                v(index) = v(index) - r(i,j,h,l)*c(i,j,h,l)*f(vde(index_hl))*x(index);
            end
        end    
    end
end
%% CONTROLLER
for i = 1:m
    for j  = 1:n
        index = m*n*(NUM-1)+(i-1)*n+j;
        old_index = (i-1)*n+j;
        e_ij = x(index)-x(old_index);
        
        v(index) = -aij(i,j)*x(index)+Lij(i,j);
        v(index) = v(index)-k1(i,j)*e_ij-k3(i,j)*sign(e_ij)*delta;
        v(index) = v(index) - K1*sign(e_ij)*(abs(e_ij))^mu1 - K2*sign(e_ij)*(abs(e_ij))^mu2; 
        for h = 1:m
            for l = 1:n
                index_hl = m*n*(NUM-1)+(h-1)*n+l;
                old_index_hl = (h-1)*n+l;
                
                vde = vlag{index_hl};
                old_vde = vlag{old_index_hl};
                e_hl = vde(index_hl) - old_vde(old_index_hl);
                v(index) = v(index) - r(i,j,h,l)*c2(i,j,h,l)*f(vde(index_hl))*x(index);
                v(index) = v(index) - r(i,j,h,l)*k2(i,j)*sign(e_ij)*delta*abs(e_hl);
            end
        end    
    end
end
disp(t)
end