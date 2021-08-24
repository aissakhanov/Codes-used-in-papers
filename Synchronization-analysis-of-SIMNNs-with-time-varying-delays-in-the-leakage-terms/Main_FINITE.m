t0 = 0;
tf = 1;
%%
%Check NUM, init and delay
[m,n,R] = mnR();
NUM = 2;
init_2 = Init_cond(NUM);
init = cat(2, init_2{1}, init_2{2});
%delay = Lambda_delay();
%%
styles = {'-b','--g',':y','-.r',':black'};

fprintf("Simulation-FINITE starts ------ \n")

sol = ddesd(@Equations2,@Lambda_delay2,init,[t0, tf]);
fprintf("SOLVED ------ \n")
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
            plot(sol.x,sol.y(arg+m*n*(i-1),:), styles{i},'LineWidth',1.3);
            xlabel('t','fontsize',17)
            ylabel(yl,'fontsize',17)
            hold on
        end
        counter = counter+1;
    end
end
%%
counter = 0;
for i = 1:m
    for j = 1:n
        arg = counter*n+j;
        dist = strcat("_T_",string(tf));
        dist = strcat(dist,"_FINITE");
        id = strcat(string(i),string(j));
        saveas(figure(m*n+arg), strcat(id, dist),'png');        
    end
    counter = counter + 1;
end
