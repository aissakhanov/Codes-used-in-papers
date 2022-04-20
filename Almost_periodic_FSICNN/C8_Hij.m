function aij = C8_Hij(t,m,n)
%% nonnegative
aij = zeros(m,n);

aij(1,1) = (sin(t*sqrt(6))+cos(t)+5)/60;
aij(1,2) = (1+cos(t))/60;

aij(2,1) = (cos(t)+1)/100;
aij(2,2) = (cos(t)+sin(t*sqrt(3))+2)/60;

end

