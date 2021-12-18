function tao = Tao_delay()
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[m,n,R] = mnR();
tao = zeros(m*n,1);
% for i = 1:m*n
%     tao(i) = pi;
% end
tao = [0.5;pi;pi/2;pi/3;0.3;pi/6;pi/8;pi;pi/2];
end

