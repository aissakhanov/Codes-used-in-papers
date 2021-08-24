attempt = 0; 
%Uncomment it initially
%%
sample = linspace(0, 100, 400);
sup = Supremum(sample);
inf_a = Infimum(sample);
attempt = attempt + 1;
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

for i = 1:m
    for j = 1:n
        cde_temp = 0;
        for h = 1:m
            for l = 1:n
                cde_temp = cde_temp + r{i}{j}{h}{l}*(cij{h}{l}+dij{h}{l}+eij{h}{l});
            end
        end
        ro = max(ro, cde_temp/aij{i}{j});        
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
fprintf("\nAttempt %d,--------- \n", attempt)
fprintf("A4\n")
fprintf("A4_sigma > 0: %.6f \n", A4_sigma);
fprintf("A5\n")
fprintf("M*ro < 1: %.6f \n", M*ro);
fprintf("A6\n")
fprintf("(M+PLf)*ro < 1: %.6f \n", (M+P*Lf)*ro);
%%