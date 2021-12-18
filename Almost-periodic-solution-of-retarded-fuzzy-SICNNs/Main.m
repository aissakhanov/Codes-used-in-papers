t0 = 0;
tf = 1;
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
            plot(sol{i}.x,sol{i}.y(arg,:), styles{i},'LineWidth',1.3);
            plot(sol{i}.x,0.12*exp(-0.0837*sol{i}.x), 'b','LineWidth',1.3)
            xlabel('t','fontsize',17)
            ylabel(yl,'fontsize',17)
            hold on
        end
        counter = counter+1;
    end
end
%%
for k = 1:m*n
    dist = strcat("_",string(tf));
   saveas(figure(k), strcat(string(k),dist),'png') 
end
