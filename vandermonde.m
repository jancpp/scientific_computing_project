function [full] = vandermonde(dp)
% interpol_vandermonde is a Vandermonde interpolation function 
% that works for any number of input data points dp
% dp  - input data points [ (t1,y1), (t2,y2), (t3,y3), ... (tn,yn) ]
% x   - coeficients that plugs in the polynomial equation 
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
    
    x = GEPP(A, y); 
    full = 0;
    for i=1:numOfPoints
        full = full + x(i)*t^(i-1);
    end
    
end


