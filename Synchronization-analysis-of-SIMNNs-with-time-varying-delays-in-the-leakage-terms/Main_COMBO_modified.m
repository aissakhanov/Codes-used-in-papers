%%
format shortg
START = clock;
%%
t0 = 1.2;
tf = 1.202;
%%
%Check NUM, init and delay
NUM = 2;
init_0 = Init_cond_1(NUM);
init_1 = cat(2, init_0{1}, init_0{2});
init_01 = Init_cond_2(NUM);
init_2 = cat(2, init_01{1}, init_01{2});
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
global K K1 K2 mu1 mu2 k1 k2 k3 sigma;
[K,K1,K2,mu1,mu2,k1,k2,k3, sigma] = K_coeff(0,m,n);
global Gij;
Gij = G(m,n);
%% PARALLELLLLLL
%solutions = {1,1,1,1};
eqs = {@Equations, @Equations, @Equations2, @Equations3};
delays = {@Lambda_delay, @Lambda_delay, @Lambda_delay2, @Lambda_delay2};
inits = {init_0{1}, init_0{2}, init_1, init_1};
%%
if t0 == 0
%     for solver = 1:4
%         solutions{solver} = ddesd(eqs{solver}, delays{solver}, inits{solver}, [t0, tf]);
%     end
%     sol2 = {solutions{1}, solutions{2}};
%     sol = solutions{3};
%     sol3 = solutions{4};
else
    solutions_new = {1,1,1,1};
    inits_new = {solutions{1}, solutions{2}, solutions{3}, solutions{4}};
    for solver = 1:4
        solutions_new{solver} = ddesd(eqs{solver}, delays{solver}, inits_new{solver}, [t0, tf]);
    end
    sol2 = {solutions_new{1}, solutions_new{2}};
    sol = solutions_new{3};
    sol3 = solutions_new{4};
end
%%
styles = {'-b','--black'};
styles2 = {'-b','--r'};
styles3 = {'-b','--g'};
%%
for i = 1:NUM
    for h = 1:m
        index1 = strcat("{",string(h));
        for l = 1:n
            index2 = strcat(string(l),"}");
            index = strcat(index1, index2);
            name = strcat("x_",index);
            yl = strcat(name, "(t)");
            arg =(h-1)*n+l;
            figure(m*n+arg)
            legend()          
            plot(sol2{i}.x,sol2{i}.y(arg,:), styles2{i},'LineWidth',1.3, 'DisplayName','no controller');
            xlabel('t','fontsize',17)
            ylabel(yl,'fontsize',17)
            hold on
            plot(sol.x,sol.y(arg+m*n*(i-1),:), styles{i},'LineWidth',1.3, 'DisplayName','finite');
            hold on
            plot(sol3.x,sol3.y(arg+m*n*(i-1),:), styles3{i},'LineWidth',1.3, 'DisplayName','fixed');          
            hold on
        end
    end
end
%%
header = strcat('figures/','m',string(m),'n', string(n));
for i = 1:m
    for j = 1:n
        arg = (i-1)*n+j;
        new_time = strrep(string(tf),'.','_');
        dist = strcat("_T_",new_time);
        dist = strcat(dist,"_COMBO");
        id = strcat(string(i),string(j));
        saveas(figure(m*n+arg), strcat(header, '_x', id, dist),'png');  
    end
end
%%
END = clock;
for i  = 1:NUM
%    fprintf("Solving for init_cond: %d \n", i)
%     sol1_new{i} = ddesd(@Equations,@Lambda_delay,init1{i},[t0, tf]);
%    sol1{i} = ddesd(@Equations,@Lambda_delay,init_1{i},[t0, tf]);
%     sol1{i} = struct('solver', 'ddesd',...
%     'history', sol1_new{i}.history,...
%     'x', cat(2, sol1{i}.x, sol1_new{i}.x),...
%     'y', cat(2, sol1{i}.y, sol1_new{i}.y),...
%     'stats', struct('nsteps', sol1{i}.stats.nsteps+sol1_new{i}.stats.nsteps,...
%                'nfailed', sol1{i}.stats.nfailed+sol1_new{i}.stats.nfailed, ...
%                'nfevals', sol1{i}.stats.nfevals+sol1_new{i}.stats.nfevals), ...
%     'yp', cat(2, sol1{i}.yp, sol1_new{i}.yp));    
%%
% fprintf("Simulation-FINITE starts ------ \n")
% % sol2_new = ddesd(@Equations2,@Lambda_delay2,init2,[t0, tf]);
% sol2 = ddesd(@Equations2,@Lambda_delay2,init2,[t0, tf]);
% fprintf("SOLVED-FINITE ------ \n")
% sol2 = struct('solver', 'ddesd',...
%     'history', sol2_new.history,...
%     'x', cat(2, sol2.x, sol2_new.x),...
%     'y', cat(2, sol2.y, sol2_new.y),...
%     'stats', struct('nsteps', sol2.stats.nsteps+sol2_new.stats.nsteps,...
%                'nfailed', sol2.stats.nfailed+sol2_new.stats.nfailed, ...
%                'nfevals', sol2.stats.nfevals+sol2_new.stats.nfevals), ...
%     'yp', cat(2, sol2.yp, sol2_new.yp));    
%%
% fprintf("Simulation-FIXED starts ------ \n")
% % sol3_new = ddesd(@Equations3,@Lambda_delay2,init3,[t0, tf]);
% sol3 = ddesd(@Equations3,@Lambda_delay2,init3,[t0, tf]);
% fprintf("SOLVED-FIXED ------ \n")
% sol3 = struct('solver', 'ddesd',...
%     'history', sol3_new.history,...
%     'x', cat(2, sol3.x, sol3_new.x),...
%     'y', cat(2, sol3.y, sol3_new.y),...
%     'stats', struct('nsteps', sol3.stats.nsteps+sol3_new.stats.nsteps,...
%                'nfailed', sol3.stats.nfailed+sol3_new.stats.nfailed, ...
%                'nfevals', sol3.stats.nfevals+sol3_new.stats.nfevals), ...
%     'yp', cat(2, sol3.yp, sol3_new.yp));  
end