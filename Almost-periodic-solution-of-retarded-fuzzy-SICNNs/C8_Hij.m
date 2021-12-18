function aij = C8_Hij(t,m,n)
%UNTITLED18 Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n);

aij(1,1) = cos(t)/(2+sin(t*sqrt(2)));
aij(1,2) = 0.3+cos(t)/(2.3+cos(t*sqrt(2)));
aij(1,3) = 0.2+(sin(t))^2/(1.2+sin(t*sqrt(2)));

aij(2,1) = 0.6*cos(t)/(2+cos(t*sqrt(2)));
aij(2,2) = cos(t)/(1.2+sin(t*sqrt(2)));
aij(2,3) = 0.4+cos(t)/(1.8+cos(t*sqrt(2)));

aij(3,1) = cos(t)/(1.2+sin(t*sqrt(2)));
aij(3,2) = cos(t)/(1.8+cos(t*sqrt(2)));
aij(3,3) = cos(t)/(2+sin(t*sqrt(2)));

% aij(1,1) = cos(t)/(2+sin(t*sqrt(2)));
% aij(1,2) = 3-sin(t)/(2.3+cos(t*sqrt(2)));
% aij(1,3) = 2+(sin(t))^2/(1.2+sin(t*sqrt(2)));
% 
% aij(2,1) = 0.6*cos(t)/(2+cos(t*sqrt(2)));
% aij(2,2) = sin(t)/(1.2+sin(t*sqrt(2)));
% aij(2,3) = 1.4+cos(t)/(1.8+cos(t*sqrt(2)));
% 
% aij(3,1) = cos(t)/(1.2+sin(t*sqrt(2)));
% aij(3,2) = sin(t)/(-2.3+cos(t*sqrt(2)));
% aij(3,3) = sin(t)/(2+sin(t*sqrt(2)));

end

