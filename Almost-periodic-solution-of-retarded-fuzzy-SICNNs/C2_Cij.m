function aij = C2_Cij(t,m,n)
%UNTITLED19 Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n);

aij(1,1) = (sin(t))^2/(1.2+sin(t*sqrt(2)));
aij(1,2) = cos(t)/(1.4+sin(t*sqrt(2)));
aij(1,3) = 0.3*(sin(t))^2/(2+cos(t*sqrt(2)));

aij(2,1) = 0.1*cos(t)/(1.2+sin(t*sqrt(2)));
aij(2,2) = cos(t)/(1.6+sin(t*sqrt(2)));
aij(2,3) = 0.5*cos(t)/(2+cos(t*sqrt(2)));

aij(3,1) = cos(t)/(1.2+sin(t*sqrt(2)));
aij(3,2) = 0.8*cos(t)/(2.3+cos(t*sqrt(2)));
aij(3,3) = cos(t)/(1.2+sin(t*sqrt(2)));

aij = aij;
% aij(1,1) = sin(t)/(1.2+sin(t*sqrt(2)));
% aij(1,2) = cos(t)/(-2.4+sin(t*sqrt(2)));
% aij(1,3) = 0.3*sin(t)/(2+cos(t*sqrt(2)));
% 
% aij(2,1) = sin(t)/(1.2+sin(t*sqrt(2)));
% aij(2,2) = cos(t)/(-1.6+sin(t*sqrt(2)));
% aij(2,3) = cos(t)/(2+cos(t*sqrt(2)));
% 
% aij(3,1) = cos(t)/(1.2+sin(t*sqrt(2)));
% aij(3,2) = 1.8*sin(t)/(2.3+cos(t*sqrt(2)));
% aij(3,3) = cos(t)/(1.2+sin(t*sqrt(2)));

%aij = aij-3;
end

