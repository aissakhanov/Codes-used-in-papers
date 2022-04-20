function aij = C5_Dij(t,m,n)
%% nonnegative
aij = zeros(m,n);

aij(1,1) = (cos(t)^2+abs(sin(t*sqrt(2))))/60;
aij(1,2) = (sin(t)+1.5)/60;

aij(2,1) = (cos(t)+3)/60;
aij(2,2) = (cos(t)+1.1)/60;

end

