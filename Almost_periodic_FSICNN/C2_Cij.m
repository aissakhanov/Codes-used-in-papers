function aij = C2_Cij(t,m,n)
%% nonnegative
aij = zeros(m,n);

aij(1,1) = (cos(t)+cos(t*sqrt(7))+2)/60;
aij(1,2) = abs(sin(t*sqrt(2)))/60;

aij(2,1) = (abs(sin(t))+cos(t*sqrt(2))^2)/60;
aij(2,2) = (abs(sin(t))+cos(t*sqrt(2))^2)/60;

end

