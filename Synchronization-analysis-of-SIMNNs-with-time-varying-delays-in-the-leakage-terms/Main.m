tic;
t0 = 0;
tf = 25;
%%
%Check NUM, init and delay
NUM = 2;
sol = {};
init = Init_cond_2(NUM);
%delay = Lambda_delay();
%%
global m n R;
[m,n,R] = mnR();
global r;
r = Neigh();
global delta;
delta = Max_init_cond();
global cij;
cij = C2_Cij(0,m,n);
global aij;
aij = C1_Aij(0,m,n);
global Gij;
Gij = G(m,n);
%%
styles = {'-b','--r'};
fprintf("Simulation starts ------ \n")
for i  = 1:NUM
    fprintf("Solving for init_cond: %d \n", i)
    sol{i} = ddesd(@Equations,@Lambda_delay,init{i},[t0, tf]);
    %counter = 0;
    for h = 1:m
        index1 = strcat("{",string(h));
        for l = 1:n
            index2 = strcat(string(l),"}");
            index = strcat(index1, index2);
            name = strcat("x_",index);
            yl = strcat(name, "(t)");
            %arg = counter*n+l;
            arg = (h-1)*n+l;
            figure(arg)
            plot(sol{i}.x,sol{i}.y(arg,:), styles{i},'LineWidth',1.3);
            xlabel('t','fontsize',17)
            ylabel(yl,'fontsize',17)
            hold on
        end
        %counter = counter+1;
    end
end
%%
header = strcat('figures/','m',string(m),'n', string(n));
%counter = 0;
for i = 1:m
    for j = 1:n
        %arg = counter*n+j;
        arg = (i-1)*n+j;
        dist = strcat("_T_",string(tf));
        id = strcat(string(i),string(j));
        saveas(figure(arg), strcat(header, '_x', id, dist),'png');        
    end
    %counter = counter + 1;
end
%%
tint = linspace(t0,tf);

yint2 = deval(sol{2},tint);
yint1 = deval(sol{1},tint);
for i = 1:m*n
    figure(201)
    plot(tint, yint2(i,:)-yint1(i,:));
    hold on    
end
saveas(figure(201), strcat(header, '_error_no_contr'), 'png');
%%
figure(101)
plot3(sol{2}.y(2,:), sol{2}.y(3,:), sol{2}.y(1,:));
saveas(figure(101), strcat(header, '_phase_plot_no_contr'), 'png');
toc;