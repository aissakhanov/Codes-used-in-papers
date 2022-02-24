function r = Neigh()
%%
% neighborhood function
%%
[m,n,R] = mnR();
r = zeros(m,n,m,n);
for i = 1:m
    for j = 1:n
        for h = 1:m
            for l = 1:n
                if (max(abs(h-i), abs(l-j)) <= R)
                    r(i,j,h,l) = 1;
                end
            end
        end
    end
end
end