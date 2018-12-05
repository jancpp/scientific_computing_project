function [polynomial] = vandermonde(dp)
% Vandermonde interpolation function 
% takes data points [ (t1,y1), (t2,y2), (t3,y3), ... (tn,yn) ]
% returns vector with polymonial function in form
% p(t) = x(1) + x(2)*t +...+ x(n)*t^(n-1)

    numOfPoints = length(dp); % number of data inputs
    A = zeros(numOfPoints);
    y = zeros(numOfPoints,1);
    syms t;
    for row=1:numOfPoints
        A(row, 1) = 1;
        for col=2:numOfPoints
            A(row, col) = dp(row,1).^(col-1);
        end
        y(row) = dp(row,2);
    end
    % solve using GEPP for efficency
    x = GEPP(A, y); 
    polynomial = 0;
    for i=1:numOfPoints
        polynomial = polynomial + x(i)*t^(i-1);
    end
    
end


