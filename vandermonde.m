function [x] = vandermonde(dp)
% interpol_vandermonde is a Vandermonde interpolation function 
% that works for any number of input data points dp
% dp  - input data points [ (t1,y1), (t2,y2), (t3,y3), ... (tn,yn) ]
% x   - coeficients that plugs in the polynomial equation 
% p(t) = x(1) + x(2)*t +...+ x(n)*t^(n-1)

    [numOfPoints,~] = size(dp); % number of data inputs
    A = zeros(numOfPoints);
    y = zeros(numOfPoints,1);
    for row=1:numOfPoints
        A(row, 1) = 1;
        for col=2:numOfPoints
            A(row, col) = dp(row,1).^(col-1);
        end
        y(row) = dp(row,2);
    end
    
    x = GEPP(A, y); 
    
end


% REMOVE:

% tests:
% dp=[ [1 2];[3 2];[5 2];[6 2];[7 2] ]
% dp=[ [-2 -27];[0 -1];[1 0] ]
% vandermonde(dp)

