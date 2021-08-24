%%Switching jumps
%%
function aij = G(m,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n);

% aij(1,1) = 0.6;
% aij(1,2) = 0.03;
% aij(1,3) = 0.002;
% 
% aij(2,1) = 0.05;
% aij(2,2) = 0.0001;
% aij(2,3) = 0.01;
for i=1:m
    for j=1:n
        aij(i,j) = 1;
    end
end

end

