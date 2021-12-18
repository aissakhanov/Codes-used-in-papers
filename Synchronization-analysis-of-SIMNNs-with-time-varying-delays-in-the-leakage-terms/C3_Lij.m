%%1. abs(Iij(t)) <= (Some number)ij
%%2. external input to Cij(xij(t))
%%
function aij = C3_Lij(t,m,n)
%UNTITLED20 Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n);

for i =1:m
   for j = 1:n
%        aij(i,j) = sin(pi*i*j*0.1*t)+cos(pi*t);
         aij(i,j) = cos(t)+1/2*sin(pi*t);
%          aij(i,j) = ((i-1)*m+j)*cos(t/2);
%         aij(i,j) = cos(t)+cos(2*pi*t);
   end
end
aij(1,3) = 1;
aij(2,2) = 1;
aij(2,3) = 1;
end

