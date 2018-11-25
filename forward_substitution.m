function [x] = forward_substitution(L,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

n = length(b);

x = zeros(n,1);

for j=1:n
    if (L(j,j) == 0)
        break;
    end;
    
    x(j) = b(j)/L(j,j);
    
    for i=j+1:n
        b(i) = b(i)-L(i,j)*x(j);
    end
end
end

