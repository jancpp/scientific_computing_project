function [polynomial] = lagrange(X,Y)
% Lagrange interpolation
% takes in X and Y components of several points
% returns polynomial function in form
% p(t) = x(1) + x(2)*t +...+ x(n)*t^(n-1)

    num_points = length(X);
    syms t;
    polynomial = 0;
    for i=1:num_points
        term = 1;
        for j=1:num_points
            if j~=i
            term = term.*((t-X(j))/(X(i)-X(j))); 
            end
        end
        polynomial = polynomial + Y(i)*term;
    end
end

