%%1. 0<= Lambda_hl(t) <= Lambda_hl
%%2. continuous fn., representing transmission delay along the axon of
%%(h,l)cell from the (i,j)th cell.
%%
function tao = Lambda_delay(t,y)
%SHALL WE DO IT TIME-DEPENDENT????
[m,n,R] = mnR();
tao = zeros(m*n,1);

for i = 1:m*n
%     tao(i) = pi;
%     tao(i) = 0.5+0.5*sin(pi*t);
    tao(i) = i*sin(t)+0.5*i*cos(pi*t);
end

