function aij = C9_Uij(t,m,n)
%% external input
aij = zeros(m,n);

aij(1,1) = (0.3+sin(t))/60;
aij(1,2) = cos(t)/60;

aij(2,1) = sin(t)/60;
aij(2,2) = (0.1+cos(t))/60;

end

