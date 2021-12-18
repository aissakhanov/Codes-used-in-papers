function tao = Lambda_delay2(t,y)
%SHALL WE DO IT TIME-DEPENDENT????
% [m,n,R] = mnR();
% tao = zeros(m*n,1);
% NUM = 2;
% for i = 1:NUM*m*n
%     tao(i) = pi;
%     %tao(i) = abs(sin(t))+1;
% end
lam = Lambda_delay(t,y);
tao = cat(1, lam, lam);

