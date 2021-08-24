%%1. 0<= Lambda_hl(t) <= Lambda_hl
%%2. continuous fn., representing transmission delay along the axon of
%%(h,l)cell from the (i,j)th cell.
%%
function tao = Lambda_delay(t,y)
%SHALL WE DO IT TIME-DEPENDENT????
[m,n,R] = mnR();
tao = zeros(m*n,1);

for i = 1:m*n
%     tao(i) = 0.5*cos(t)+0.5;
%     tao(i) = pi;
%     tao(i) = t;
    tao(i) = i*sin(t)+i/2*cos(pi*t);
%     tao(i) = sin(t) + 1/2*cos(pi*t);
end

