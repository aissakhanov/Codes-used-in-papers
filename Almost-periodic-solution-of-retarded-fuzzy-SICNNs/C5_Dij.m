function aij = C5_Dij(t,m,n)
%UNTITLED22 Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n);

aij(1,1) = cos(t)/(2.3+sin(t*sqrt(2)));
aij(1,2) = 0.2*(sin(t))^2/(2.3+cos(t*sqrt(2)));
aij(1,3) = cos(t)/(1.3+sin(t*sqrt(2)));

aij(2,1) = 0.2+cos(t)/(1.2+sin(t*sqrt(2)));
aij(2,2) = cos(t)/(3.4+cos(t*sqrt(2)));
aij(2,3) = cos(t)/(1.6+sin(t*sqrt(2)));

aij(3,1) = cos(t)/(2+sin(t*sqrt(2)));
aij(3,2) = 0.1+(sin(t))^2/(1.2+sin(t*sqrt(2)));
aij(3,3) = cos(t)/(2.1+cos(t*sqrt(2)));

aij = aij;

% aij(1,1) = cos(t)/(2.3+sin(t*sqrt(2)));
% aij(1,2) = sin(t)/(-2.3+cos(t*sqrt(2)));
% aij(1,3) = sin(t)/(2.3+sin(t*sqrt(2)));
% 
% aij(2,1) = -0.2-cos(t)/(1.2+sin(t*sqrt(2)));
% aij(2,2) = cos(t)/(3.4+cos(t*sqrt(2)));
% aij(2,3) = cos(t)/(1.6+sin(t*sqrt(2)));
% 
% aij(3,1) = cos(t)/(2+sin(t*sqrt(2)));
% aij(3,2) = 2+sin(t)/(1.2+sin(t*sqrt(2)));
% aij(3,3) = cos(t)/(2.1+cos(t*sqrt(2)));

% aij = aij-2;
end

