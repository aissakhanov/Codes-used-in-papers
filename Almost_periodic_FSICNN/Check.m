%% Check whether coefficients satify A4-A6 conditions
sample = linspace(0, 100, 400);
sup = Supremum(sample);
inf_a = Infimum(sample);
%%
cij = sup('cij');
dij = sup('dij');
eij = sup('eij');
bij = sup('bij');
tij = sup('tij');
hij = sup('hij');
lij = sup('lij');
uij = sup('uij');
aij = inf_a;

[m,n,R] = mnR();
[M,Lf] = MLf();
r = Neigh();
%% A4
A4_sigma = inf_a{1}{1};
for i = 1:m
    for j = 1:n
        A4_sigma = min(A4_sigma, inf_a{i}{j});
    end
end
%% A5
ro = -1e6;
cde_max = 0;
for i = 1:m
    for j = 1:n
        cde_temp = 0;
        for h = 1:m
            for l = 1:n
                cde_temp = cde_temp + r{i}{j}{h}{l}*(cij{h}{l}+dij{h}{l}+eij{h}{l});
            end
        end
        ro = max(ro, cde_temp/aij{i}{j});
        cde_max = max(cde_max, cde_temp);
    end
end
%% A6
theta = -1e6;
for i = 1:m
    for j = 1:n
        bth_u_temp = 0;
        for h = 1:m
            for l = 1:n
                bth_u_temp = bth_u_temp + r{i}{j}{h}{l}*(bij{h}{l}+tij{h}{l}+hij{h}{l});
            end
        end
        theta = max(theta, lij{i}{j}/aij{i}{j}+uij{i}{j}*bth_u_temp/aij{i}{j});        
    end
end
P = theta/(1-M*ro);
%%

fprintf("A4\n")
fprintf("A4_sigma > 0: %.6f \n", A4_sigma);
fprintf("A5\n")
fprintf("M*ro < 1: %.6f \n", M*ro);
fprintf("A6\n")
fprintf("(M+PLf)*ro < 1: %.6f \n", (M+P*Lf)*ro);
%% conv_rate
tao_values = Tao_delay();

tao = max(tao_values);
nu = P*Lf;

sigma=1e6;
E = 0;
D = 0;
for i=1:m
    for j=1:n
        sigma = min(sigma,aij{i}{j});
        E = max(E,eij{i}{j});
        D = max(D,dij{i}{j});
    end
end

gamma = 1+tao*nu*(E+D)*exp(0.0837*tao);
%% conv_rate2
i_max = 2;
j_max = 2;
cde_temp2 = 0;
de_temp2 = 0;
for h = 1:m
    for l = 1:n
        cde_temp2 = cde_temp2 + M*r{i_max}{j_max}{h}{l}*(cij{h}{l}+dij{h}{l}+eij{h}{l})...
        +Lf*P*r{i_max}{j_max}{h}{l}*cij{h}{l};
        de_temp2 = de_temp2 + Lf*P*r{i_max}{j_max}{h}{l}*(dij{h}{l}+eij{h}{l});
    end
end
u = aij{i_max}{j_max} - cde_temp2;
v = de_temp2;
%% 