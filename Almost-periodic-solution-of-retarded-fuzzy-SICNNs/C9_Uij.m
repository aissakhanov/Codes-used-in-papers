function aij = C9_Uij(t,m,n)
%UNTITLED18 Summary of this function goes here
%   Detailed explanation goes here
aij = zeros(m,n);

aij(1,1) = 0.3+sin(t)/(20+sin(t*sqrt(2)));
aij(1,2) = cos(t)/(17+cos(t*sqrt(2)));
aij(1,3) = sin(t)/(14+cos(t*sqrt(2)));

aij(2,1) = sin(t)/(20+sin(t*sqrt(2)));
aij(2,2) = 0.1+cos(t)/(21+cos(t*sqrt(2)));
aij(2,3) = sin(t)/(28+cos(t*sqrt(2)));

aij(3,1) = cos(t)/(-2+sin(t*sqrt(2)));
aij(3,2) = 0.3*sin(t)/(25+cos(t*sqrt(2)));
aij(3,3) = cos(t)/(13+sin(t*sqrt(2)));


end

