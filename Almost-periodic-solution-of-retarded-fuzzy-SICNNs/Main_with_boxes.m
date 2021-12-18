t0 = 0;
tf = 100;
%%
MULT = 1e-3;
z = 1e-3;
za = 10;
zu = 15;
zqxj = 0.3;
%zqxj = zqxj*MULT;
%%
%Check NUM, init and delay
[m,n,R] = mnR();
NUM = 5;
sol = {};
init = Init_cond(NUM);
delay = Tao_delay();
%%
styles = {'-b','--g',':y','-.r',':black'};

fprintf("Simulation starts ------ \n")


for i  = 1:NUM
    fprintf("Solving for init_cond: %d \n", i)
    sol{i} = dde23(@Equations,delay,init{i},[t0, tf]);
end
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
        for i = 1:NUM
            plot(sol{i}.x,sol{i}.y(arg,:), styles{i},'LineWidth',1.3);
            hold on
        end
        xlabel('t','fontsize',17)
        ylabel(yl,'fontsize',17)
        axes('Position',[0.17 0.75 .2 .2])
        box on % put box around new pair of axes
        
        for i = 1:NUM
            indexOfInterest = (sol{i}.x <= 0.22) & (sol{i}.x >= 0); % range of t near perturbation
            results = sol{i}.y(arg,:);
            plot(sol{i}.x(indexOfInterest),results(indexOfInterest), styles{i},'LineWidth',1.3) % plot on new axes
            yticks([])
            xlabel('t')
            hold on
        end
        axis tight
    end

    counter = counter+1;
end
%%
for k = 1:m*n
    dist = strcat("_",string(tf));
   saveas(figure(k), strcat(string(k),dist),'png') 
end
