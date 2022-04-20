function aij = C7_Tij(t,m,n)
%% nonnegative
aij = zeros(m,n);

aij(1,1) = (cos(t)+1.1)/60;
aij(1,2) = (cos(t)+cos(t*sqrt(5))+2.1)/60;

aij(2,1) = (cos(t)+1.1)/60;
aij(2,2) = (sin(t))^2/60;

end

