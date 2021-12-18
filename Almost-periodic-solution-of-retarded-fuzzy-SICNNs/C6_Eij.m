function aij = C6_Eij(t,m,n)
%UNTITLED18 Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n);

aij(1,1) = 0.6+cos(t)/(1.01+cos(t*sqrt(2)));
aij(1,2) = cos(t)/(2+cos(t*sqrt(2)));
aij(1,3) = 0.8*cos(t)/(1.1+sin(t*sqrt(2)));

aij(2,1) = cos(t)/(2+cos(t*sqrt(2)));
aij(2,2) = cos(t)/(1.2+sin(t*sqrt(2)));
aij(2,3) = 0.5*cos(t)/(2+cos(t*sqrt(2)));

aij(3,1) = (sin(t))^2/(1.2+sin(t*sqrt(2)));
aij(3,2) = 0.1+cos(t)/(2.2+sin(t*sqrt(2)));
aij(3,3) = cos(t)/(2.3+cos(t*sqrt(2)));

aij = aij;

% aij(1,1) = 0.6-sin(t)/(1.5+cos(t*sqrt(2)));
% aij(1,2) = cos(t)/(2+cos(t*sqrt(2)));
% aij(1,3) = 0.8*sin(t)/(-3.4+sin(t*sqrt(2)));
% 
% aij(2,1) = cos(t)/(2+cos(t*sqrt(2)));
% aij(2,2) = cos(t)/(1.2+sin(t*sqrt(2)));
% aij(2,3) = 1.5*cos(t)/(2+cos(t*sqrt(2)));
% 
% aij(3,1) = sin(t)/(1.2+sin(t*sqrt(2)));
% aij(3,2) = 1+cos(t)/(2.2+sin(t*sqrt(2)));
% aij(3,3) = cos(t)/(2.3+cos(t*sqrt(2)));

end

