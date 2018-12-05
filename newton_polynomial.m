function [polynomial] = newton(X,Y)
% Newton Interpolation
% takes data points
% returns polynomial function in form
% p(t) = x(1) + x(2)*t +...+ x(n)*t^(n-1)

% Define general Pi equations
num_points = length(X);
syms t;
pi = cell(1,num_points);
for i=1:num_points
    pi{i}=1;
end

for i=2:num_points
    for j=1:(i-1)
        pi{i}= pi{i}.*(t-X(j));
    end
end

% Set up system to solve
A=zeros(num_points, num_points);
A(:,1)=1;
for i=1:num_points
    for j=2:num_points
        A(i,j)=subs(pi{j},t,X(i));
    end
end

% Solve system Ac=Y for coefficients using backsubstitution
C = forward_substitution(A,Y);

% Construct final polynomial
polynomial = 0;
for i=1:num_points
    polynomial = polynomial + C(i)*pi{i};
end    

end