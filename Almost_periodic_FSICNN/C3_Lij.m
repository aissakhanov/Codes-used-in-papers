function aij = C3_Lij(t,m,n)
%% external bias
aij = zeros(m,n);

aij(1,1) = (2*sin(t)+sin(t*sqrt(2)))/60;
aij(1,2) = (0.3*cos(t)+cos(t*sqrt(3)))/60;

aij(2,1) = cos(t)+sin(t*sqrt(2))/60;
aij(2,2) = sin(t)/60;

end

