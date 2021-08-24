%%
format shortg
START = clock;
%%
t0 = 0;
tf = 0.5;
%%
%Check NUM, init and delay
[m,n,R] = mnR();
NUM = 2;
init_2 = Init_cond(NUM);
init = cat(2, init_2{1}, init_2{2});
%delay = Lambda_delay();
%%
sol2 = {};
for i  = 1:NUM
    fprintf("Solving for init_cond: %d \n", i)
    sol2{i} = ddesd(@Equations,@Lambda_delay,init_2{i},[t0, tf]);
end
%%
fprintf("Simulation-FINITE starts ------ \n")
sol = ddesd(@Equations2,@Lambda_delay2,init,[t0, tf]);
fprintf("SOLVED ------ \n")
%%
styles2 = {'-b','--r'};
styles = {'-b','--g'};
for i  = 1:NUM
    counter = 0;
    for h = 1:m
        index1 = strcat("{",string(h));
        for l = 1:n
            index2 = strcat(string(l),"}");
            index = strcat(index1, index2);
            name = strcat("x_",index);
            yl = strcat(name, "(t)-FINITE");
            arg = counter*n+l;
            figure(m*n+arg)
            title('FINITE example')
            plot(sol.x,sol.y(arg+m*n*(i-1),:), styles{i},'LineWidth',1.3);
            xlabel('t','fontsize',17)
            ylabel(yl,'fontsize',17)
            hold on
            plot(sol2{i}.x,sol2{i}.y(arg,:), styles2{i},'LineWidth',1.3);
            hold on
        end
        counter = counter+1;
    end
end
%%
header = strcat('figures/','m',string(m),'n', string(n));
counter = 0;
for i = 1:m
    for j = 1:n
        arg = counter*n+j;
        new_time = strrep(string(tf),'.','_');
        dist = strcat("_T_",new_time);
        dist = strcat(dist,"_FINITE_combined");
        id = strcat(string(i),string(j)); 
        saveas(figure(m*n+arg), strcat(header, '_x', id, dist),'png');  
    end
    counter = counter + 1;
end
%%
tint = linspace(t0,tf);

yint2 = deval(sol,tint);
yint1 = deval(sol, tint);
for i = 1:m*n
    figure(201)
    plot(tint, yint2(m*n+i,:)-yint1(i,:));
    hold on    
end
saveas(figure(201), strcat(header, '_FINITE_error'), 'png');
%%
figure(101)
plot3(sol.y(m*n+2,:), sol.y(m*n+3,:), sol.y(m*n+1,:));
saveas(figure(101), strcat(header, '_FINITE_phase_plot'), 'png');
%%
END = clock;