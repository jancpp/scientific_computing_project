function [x] = forward_substitution(L,b)
% forward_substitution 

    n = length(b);

    x = zeros(n,1);

    for j=1:n
        if (L(j,j) == 0)
            break;
        end

        x(j) = b(j)/L(j,j);

        for i=j+1:n
            b(i) = b(i)-L(i,j)*x(j);
        end
    end
end

