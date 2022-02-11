%%
format shortg
START = clock;
%%
t0 = 0;
tf = 1.2;
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
solutions = {1,1,1,1};
eqs = {@Equations, @Equations, @Equations2, @Equations3};
delays = {@Lambda_delay, @Lambda_delay, @Lambda_delay2, @Lambda_delay2};
inits = {init_0{1}, init_0{2}, init_1, init_1};
%parfor solver = 1:4
for solver = 1:4
    solutions{solver} = ddesd(eqs{solver}, delays{solver}, inits{solver}, [t0, tf]);
end
%%
% fprintf("Simulation-FIXED starts ------ \n")
% sol4 = ddesd(@Equations3,@Lambda_delay2,init_2,[t0, tf]);
% fprintf("SOLVED-FIXED ------ \n")
%%
sol2 = {solutions{1}, solutions{2}};
sol = solutions{3};
sol3 = solutions{4};

styles = {'-b','--black'};
styles2 = {'-b','--r'};
styles3 = {'-b','--g'};
for i  = 1:NUM
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
            figure(m*n+arg)
%             title('FINITE example')
%             legend('','Finite')
            plot(sol2{i}.x,sol2{i}.y(arg,:), styles2{i},'LineWidth',1.3);
            xlabel('t','fontsize',17)
            ylabel(yl,'fontsize',17)
            hold on
            plot(sol.x,sol.y(arg+m*n*(i-1),:), styles{i},'LineWidth',1.3);
            hold on
            plot(sol3.x,sol3.y(arg+m*n*(i-1),:), styles3{i},'LineWidth',1.3);          
            hold on
%             plot(sol4.x,sol4.y(arg+m*n*(i-1),:), styles3{i},'LineWidth',1.3);          
%             hold on            
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
        new_time = strrep(string(tf),'.','_');
        dist = strcat("_T_",new_time);
        dist = strcat(dist,"_COMBO");
        id = strcat(string(i),string(j));
%         saveas(figure(m*n+arg), strcat(id, dist),'png'); 
        saveas(figure(m*n+arg), strcat(header, '_x', id, dist, '_new'),'png');  
    end
    %counter = counter + 1;
end
%%
% tint = linspace(t0,tf);
% 
% yint_fixed = deval(solutions{4}, tint);
% yint_finite = deval(solutions{3},tint);
% yint_no_2 = deval(solutions{2},tint);
% yint_no = deval(solutions{1},tint);
% 
% for i = 1:m*n
%     figure(201)
%     plot(tint, yint_finite(i,:)-yint_no(i,:));
%     hold on
%     plot(tint, yint_no_2(i,:)-yint_no(i,:));
%     hold on    
% end
% saveas(figure(201), strcat(header, '_error_finite'), 'png');
% for i = 1:m*n
%     figure(301)
%     plot(tint, yint_fixed(i,:)-yint_no(i,:));
%     hold on
%     plot(tint, yint_no_2(i,:)-yint_no(i,:));
%     hold on
% end
% saveas(figure(301), strcat(header, '_error_fixed'), 'png');
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