function r = Neigh()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m,n,R] = mnR();
r = zeros(m,n,m,n);
for i = 1:m
    for j = 1:n
        for h = 1:m
            for l = 1:n
%                 if (max(abs(h-i), abs(l-j))> 0) &&  (max(abs(h-i), abs(l-j)) <= R)
                if (max(abs(h-i), abs(l-j)) <= R)
                    r(i,j,h,l) = 1;
%                 else
%                     r(i,j,h,l) = 0; 
                end
            end
        end
    end
end

end