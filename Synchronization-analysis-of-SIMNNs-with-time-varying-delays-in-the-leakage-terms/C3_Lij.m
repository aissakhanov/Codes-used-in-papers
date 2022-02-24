function aij = C3_Lij(t,m,n)
%%
% 1. abs(Iij(t)) <= (Some number)ij
% 2. external input to Cij(xij(t))
%%
aij = zeros(m,n);
for i =1:m
   for j = 1:n
         aij(i,j) = cos(t)+1/2*sin(pi*t);
   end
end
aij(1,3) = 1;
aij(2,2) = 1;
aij(2,3) = 1;
end

