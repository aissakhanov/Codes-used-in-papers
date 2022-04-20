function aij = C4_Bij(t,m,n)
%% nonnegative
aij = zeros(m,n);

aij(1,1) = (0.5*cos(t)+0.6)/60;
aij(1,2) = abs(sin(2*t))/60;

aij(2,1) = cos(t)^2/60;
aij(2,2) = (cos(t)+sin(t*sqrt(6))+2)/60;

end

