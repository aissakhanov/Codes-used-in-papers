function aij = C1_Aij(t,m,n)
%% positive passive decay rate
aij = zeros(m,n);

aij(1,1) = cos(t)^2+0.8;
aij(1,2) = abs(sin(t))+0.8;

aij(2,1) = abs(sin(t*sqrt(3)))+0.8;
aij(2,2) = cos(t)^2/2+0.8;

end

