function aij = C6_Eij(t,m,n)
%% nonnegative
aij = zeros(m,n);

aij(1,1) = (cos(t)+4+sin(t*sqrt(5)))/60;
aij(1,2) = cos(t)^2/60;

aij(2,1) = (cos(t)^2+abs(sin(t)))/60;
aij(2,2) = (cos(t)+1.5)/60;

end

