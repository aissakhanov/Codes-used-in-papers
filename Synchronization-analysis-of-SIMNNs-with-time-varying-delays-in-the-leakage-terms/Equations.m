function v = Equations(t,x,Z)
%%
% equations wiht no controller
%% INITIALIZE PARAMETERS
global m n R;
global r;
global aij;
global cij;
global Gij;
Lij = C3_Lij(t,m,n);
%% INCORPORATE SWITCHING JUMP
c = zeros(m,n,m,n);
for i = 1:m
    for j = 1:n
        index = (i-1)*n+j;
        if abs(x(index)) <= Gij(i,j)
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
end
%% MAIN EQUATION
vlag = {};
for i = 1:m*n
    vlag{i} = Z(:,i);
end

v = zeros(m*n, 1);
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
disp(t)
end