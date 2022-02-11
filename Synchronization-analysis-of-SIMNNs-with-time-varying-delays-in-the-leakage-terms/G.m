%%Switching jumps
%%
function aij = G(m,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n);


for i=1:m
    for j=1:n
        aij(i,j) = 0.3;
    end
end

% aij(1,1) = 0.1;
% aij(1,2) = 0.15;
% aij(1,3) = 0.25;
% aij(2,1) = 0.35;
% aij(2,2) = 0.45;
% aij(2,3) = 0.55;

% for i=1:m
%     for j=1:n
%         aij(i,j) = 0.05;
%     end
% end

end

