function aij = C1_Aij(t,m,n)
aij = zeros(m,n);

aij(1,1) = cos(t)/(1.2+sin(t*sqrt(2)));
aij(1,2) = cos(t)/(2+cos(t*sqrt(2)));
aij(1,3) = cos(t)/(2.5+sin(t*sqrt(2)));

aij(2,1) = cos(t)/(2.1+sin(t*sqrt(2)));
aij(2,2) = 1.5*(sin(t))^2/(2+sin(t*sqrt(2)));
aij(2,3) = cos(t)/(2.8+cos(t*sqrt(2)));

aij(3,1) = (sin(t))^2/(3+sin(t*sqrt(2)));
aij(3,2) = cos(t)/(2+cos(t*sqrt(2)));
aij(3,3) = cos(t)/(1.8-cos(t*sqrt(2)));

aij = aij+22;

% aij(1,1) = cos(t)/(1.2+sin(t*sqrt(2)));
% aij(1,2) = sin(t)/(2+cos(t*sqrt(2)));
% aij(1,3) = sin(t)/(-2.5+sin(t*sqrt(2)));
% 
% aij(2,1) = cos(t)/(2.1+sin(t*sqrt(2)));
% aij(2,2) = 1.5*sin(t)/(2+sin(t*sqrt(2)));
% aij(2,3) = cos(t)/(2.8+cos(t*sqrt(2)));
% 
% aij(3,1) = sin(t)/(3+sin(t*sqrt(2)));
% aij(3,2) = cos(t)/(2+cos(t*sqrt(2)));
% aij(3,3) = sin(t)/(1.8-cos(t*sqrt(2)));
% 
% aij = aij+60;
% aij(1,1) = aij(1,1)+17;
% aij(2,2) = aij(2,2)+10;
% aij(1,2) = aij(1,2)-9;
% aij(1,3) = aij(1,3)-25;
% aij(2,1) = aij(2,1)-4;
% aij(2,3) = aij(2,3)-12;
% aij(3,1) = aij(3,1)-23;
% aij(3,2) = aij(3,2)-6;
% aij(3,3) = aij(3,3)-20;

end

