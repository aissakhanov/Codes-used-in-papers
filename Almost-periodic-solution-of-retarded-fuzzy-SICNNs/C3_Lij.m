function aij = C3_Lij(t,m,n)
%UNTITLED20 Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n);

aij(1,1) = 0.2*cos(t)/(20+sin(t*sqrt(2)));
aij(1,2) = 0.1*sin(t)/(20+cos(t*sqrt(2)));
aij(1,3) = cos(t)/(1.20+sin(t*sqrt(2)));

aij(2,1) = cos(t)/(1.20+sin(t*sqrt(2)));
aij(2,2) = sin(t)/(-20-cos(t*sqrt(2)));
aij(2,3) = 0.5*cos(t)/(20+cos(t*sqrt(2)));

aij(3,1) = -1.1*(cos(t))^2/(20+sin(t*sqrt(2)));
aij(3,2) = sin(t)/(26-cos(t*sqrt(2)));
aij(3,3) = cos(t)/(12+sin(t*sqrt(2)));

end

