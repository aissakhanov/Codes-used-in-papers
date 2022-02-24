%%
% script solving system of equations for the case without any controllers
tic;
%% INITIALIZE COEFFICIENTS AND PARAMETERS
t0 = 0;
tf = 25;
sol = {}; % prepare dictionary for solutions
init = Init_cond_1(); % initial conditions
global NUM;
NUM = length(init);
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
%% SOLVE and PLOT
styles = {'-b','--r'};
fprintf("Simulation starts ------ \n")
for i  = 1:NUM
    fprintf("Solving for init_cond: %d \n", i)
    sol{i} = ddesd(@Equations,@Lambda_delay,init{i},[t0, tf]);
    for h = 1:m
        index1 = strcat("{",string(h));
        for l = 1:n
            index2 = strcat(string(l),"}");
            index = strcat(index1, index2);
            name = strcat("x_",index);
            yl = strcat(name, "(t)");
            arg = (h-1)*n+l;
            figure(arg)
            plot(sol{i}.x,sol{i}.y(arg,:), styles{i},'LineWidth',1.3);
            xlabel('t','fontsize',17)
            ylabel(yl,'fontsize',17)
            hold on
        end
    end
end
%% SAVE FIGURES
header = strcat('figures/','m',string(m),'n', string(n));
for i = 1:m
    for j = 1:n
        arg = (i-1)*n+j;
        dist = strcat("_T_",string(tf));
        id = strcat(string(i),string(j));
        saveas(figure(arg), strcat(header, '_x', id, dist),'png');        
    end
end
%%
toc;