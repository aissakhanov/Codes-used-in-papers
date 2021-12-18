function aij = C4_Bij(t,m,n)
%UNTITLED21 Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n);

aij(1,1) = 0.5*cos(t)/(17+sin(t*sqrt(2)));
aij(1,2) = cos(t)/(12+sin(t*sqrt(2)));
aij(1,3) = cos(t)/(12+sin(t*sqrt(2)));

aij(2,1) = (sin(t))^2/(14+sin(t*sqrt(2)));
aij(2,2) = cos(t)/(12+sin(t*sqrt(2)));
aij(2,3) = (sin(t))^2/(24+cos(t*sqrt(2)));

aij(3,1) = cos(t)/(26+sin(t*sqrt(2)));
aij(3,2) = 0.2*cos(t)/(12+sin(t*sqrt(2)));
aij(3,3) = (sin(t))^2/(18+cos(t*sqrt(2)));

% aij(1,1) = 1.5*cos(t)/(1.7+sin(t*sqrt(2)));
% aij(1,2) = cos(t)/(-1.2+sin(t*sqrt(2)));
% aij(1,3) = 2*sin(t)/(1.2+sin(t*sqrt(2)));
% 
% aij(2,1) = sin(t)/(1.4+sin(t*sqrt(2)));
% aij(2,2) = cos(t)/(1.2+sin(t*sqrt(2)));
% aij(2,3) = (sin(t))^2/(2.4+cos(t*sqrt(2)));
% 
% aij(3,1) = cos(t)/(2.6+sin(t*sqrt(2)));
% aij(3,2) = 3.2*sin(t)/(1.2+sin(t*sqrt(2)));
% aij(3,3) = sin(t)/(1.8+cos(t*sqrt(2)));

end

