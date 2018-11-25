function [full] = lagrange(X,Y)
% lagrange interpolation
% takes in X and Y components of several points
% returns full polynomial

num_points = length(X);
syms t
full = 0;
for i=1:num_points
    term = 1;
    for j=1:num_points
        if j~=i
        term = term.*((t-X(j))/(X(i)-X(j))); % this isnt working
        end
    end
    full = full + Y(i)*term;
end
end

