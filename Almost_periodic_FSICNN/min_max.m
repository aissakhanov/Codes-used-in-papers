function Cij = min_max(cij, m, n, r, MM)
%% incorporate fuzziness
Cij = {};
for i = 1:m
    Cij{i} = {};
    for j = 1:n
        if MM == "min"
            temp = [1e6];
        else
            temp = [-1e6];
        end
        for h = 1:m
            for l = 1:n
                if r{i}{j}{h}{l} ~= 0
                    temp(end+1) = cij(h,l);
                end
            end
        end    
        if MM == "min"
            Cij{i}{j} = min(temp);
        else
            Cij{i}{j} = max(temp);
        end
    end
end


end

