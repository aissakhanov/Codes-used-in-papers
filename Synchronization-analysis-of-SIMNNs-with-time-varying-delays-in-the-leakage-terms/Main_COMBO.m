%%
% script solving system of equations for all the cases (with and without controller)
tic;
%% INITIALIZE PARAMETERS AND COEFFICIENTS
t0 = 0;
tf = 1.2;
init_0 = Init_cond_1();
NUM = length(init);
init_1 = cat(2, init_0{1}, init_0{2});
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
%% SOLVE
solutions = {1,1,1,1};
eqs = {@Equations, @Equations, @Equations2, @Equations3};
delays = {@Lambda_delay, @Lambda_delay, @Lambda_delay2, @Lambda_delay2};
inits = {init_0{1}, init_0{2}, init_1, init_1};
%parfor solver = 1:4 In case PARALLEL option is available
for solver = 1:4
    solutions{solver} = ddesd(eqs{solver}, delays{solver}, inits{solver}, [t0, tf]);
end
%% PLOT
sol2 = {solutions{1}, solutions{2}};
sol = solutions{3};
sol3 = solutions{4};

styles = {'-b','--black'};
styles2 = {'-b','--r'};
styles3 = {'-b','--g'};
for i  = 1:NUM
    for h = 1:m
        index1 = strcat("{",string(h));
        for l = 1:n
            index2 = strcat(string(l),"}");
            index = strcat(index1, index2);
            name = strcat("x_",index);
            yl = strcat(name, "(t)");
            %arg = counter*n+l;
            arg = (h-1)*n+l;
            figure(m*n+arg)
            plot(sol2{i}.x,sol2{i}.y(arg,:), styles2{i},'LineWidth',1.3);
            xlabel('t','fontsize',17)
            ylabel(yl,'fontsize',17)
            hold on
            plot(sol.x,sol.y(arg+m*n*(i-1),:), styles{i},'LineWidth',1.3);
            hold on
            plot(sol3.x,sol3.y(arg+m*n*(i-1),:), styles3{i},'LineWidth',1.3);          
            hold on          
        end
    end
end
%% SAVE FIGURES
header = strcat('figures/','m',string(m),'n', string(n));
for i = 1:m
    for j = 1:n
        arg = (i-1)*n+j;
        new_time = strrep(string(tf),'.','_');
        dist = strcat("_T_",new_time);
        dist = strcat(dist,"_COMBO");
        id = strcat(string(i),string(j));
        saveas(figure(m*n+arg), strcat(header, '_x', id, dist, '_new'),'png');  
    end
end
%%
toc;