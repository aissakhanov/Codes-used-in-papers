function r = Neigh()
%% neighborhood function
[m,n,R] = mnR();
r = {};
for i = 1:m
    r{i} = {};
    for j = 1:n
        r{i}{j} = {};
        for h = 1:m
            r{i}{j}{h} = {};
            for l = 1:n
                if max(abs(h-i), abs(l-j)) <= R
                    r{i}{j}{h}{l} = 1;
                else
                    r{i}{j}{h}{l} = 0; 
                end
            end
        end
    end
end

end

