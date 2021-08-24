%%
format shortg
START = clock;
%%
t0 = 1;
tf = 1.6;
%%
%Check NUM, init and delay
[m,n,R] = mnR();
NUM = 2;
init_2 = Init_cond(NUM);
init = cat(2, init_2{1}, init_2{2});
%delay = Lambda_delay();
%%
sol2_e = {};
for i  = 1:NUM
    fprintf("Solving for init_cond: %d \n", i)
    sol2_e{i} = ddesd(@Equations,@Lambda_delay,sol2{i},[t0, tf]);
end
%%
fprintf("Simulation-FINITE starts ------ \n")
sol_e = ddesd(@Equations2,@Lambda_delay2,sol,[t0, tf]);
fprintf("SOLVED-FINITE ------ \n")
%%
%%fprintf("Simulation-FIXED starts ------ \n")
%%sol3_e = ddesd(@Equations3,@Lambda_delay2,sol3,[t0, tf]);
%%fprintf("SOLVED-FIXED ------ \n")
%%
styles = {'-b','--black'};
styles2 = {'-b','--r'};
styles3 = {'-b','--g'};
for i  = 1:NUM
    counter = 0;
    for h = 1:m
        index1 = strcat("{",string(h));
        for l = 1:n
            index2 = strcat(string(l),"}");
            index = strcat(index1, index2);
            name = strcat("x_",index);
            yl = strcat(name, "(t)");
            arg = counter*n+l;
            figure(m*n+arg)
%             title('FINITE example')
%             legend('','Finite')
            
            plot(sol2{i}.x,sol2{i}.y(arg,:), styles2{i},'LineWidth',1.3);
            plot(sol2_e{i}.x,sol2_e{i}.y(arg,:), styles2{i},'LineWidth',1.3);
            
            xlabel('t','fontsize',17)
            ylabel(yl,'fontsize',17)
            hold on
            
            plot(sol.x,sol.y(arg+m*n*(i-1),:), styles{i},'LineWidth',1.3);
            plot(sol_e.x,sol_e.y(arg+m*n*(i-1),:), styles{i},'LineWidth',1.3);
            
            hold on
            plot(sol3.x,sol3.y(arg+m*n*(i-1),:), styles3{i},'LineWidth',1.3);          
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
        dist = strcat(dist,"_COMBO");
        id = strcat(string(i),string(j));
%         saveas(figure(m*n+arg), strcat(id, dist),'png'); 
        saveas(figure(m*n+arg), strcat(header, '_x', id, dist),'png');  
    end
    counter = counter + 1;
end
%%
% figure(101)
% plot3(sol2.y(m*n+2,:), sol2.y(m*n+3,:), sol2.y(m*n+1,:), 'r');
% hold on
% plot3(sol.y(m*n+2,:), sol.y(m*n+3,:), sol.y(m*n+1,:), 'black');
% hold on
% plot3(sol3.y(m*n+2,:), sol3.y(m*n+3,:), sol3.y(m*n+1,:), 'g');
% saveas(figure(101), strcat(header, '_COMBO_phase_plot'), 'png');
%%
END = clock;