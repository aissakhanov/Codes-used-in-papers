NUM = 5;
t0 = 0;
tf = 0.2;

tint = linspace(t0,tf);
[m,n,R] = mnR();

yint1 = deval(sol{3},tint);
yint2 = deval(sol{4}, tint);

for i = 1:m*n
    figure(201)
    legend()
    plot(tint, abs(yint2(i,:)-yint1(i,:)), 'DisplayName', string(i));
    hold on
end
hold off
saveas(figure(201), strcat('error'), 'png');
%% 
%1-3 -- 3
%2-3 -- 3
%4-3 -- 5
%5-3 -- 9
%%
counter = 0;
for h = 1:m
    index1 = strcat("{",string(h));
    for l = 1:n
        index2 = strcat(string(l),"}");
        index = strcat(index1, index2);
        name = strcat("x_",index);
        yl = strcat(name, "(t)");
        arg = counter*n+l;
        figure(arg)
        int1 = (sol{1}.x <= 0.22) & (sol{1}.x >= 0); % range of t near perturbation
        int2 = (sol{2}.x <= 0.22) & (sol{2}.x >= 0); % range of t near perturbation
        res1 = sol{1}.y(arg,:);
        plot(sol{1}.x(int1),res1(int1), styles{1},'LineWidth',1.3);
        hold on
        res2 = sol{2}.y(arg,:);
        plot(sol{2}.x(int2),res2(int2), styles{2},'LineWidth',1.3);
        hold on
        res3 = abs(init{1}(3)-init{2}(3))*exp(-0.8042*sol{2}.x);
        plot(sol{2}.x(int2),res3(int2));
        xlabel('t','fontsize',17)
        ylabel(yl,'fontsize',17)
    end
    counter = counter+1;
end
