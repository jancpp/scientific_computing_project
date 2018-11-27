clear;
clc;

% =============================
% data point set #1: f(x)=exp(x^2), on [0.6,1], 5 equally-spaced points
% =============================

f1 = @(x) exp(x^2);
space = abs(1-0.6)/4;
dp1 = zeros(5,2);
dp1(:,1) = 0.6:space:1;
for x1=1:5
    dp1(x1,2) = f1(dp1(x1,1));
end

% Vandermonde polynomial function
subplot(3,3,1);
hold on;
title('Vandermonde #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end

fplot(vandermonde(dp1), [0.6 1]) % function

% Newton polynomial function
subplot(3,3,2);
hold on;
title('Newton #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end
newton_polynomial1 = newton_polynomial(dp1(:,1), dp1(:,2)); 
fplot(newton_polynomial1, [0.6 1]) % function

% Lagrange polynomial function
subplot(3,3,3);
hold on;
title('Lagrange #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end
lagrange_polynomial1 = lagrange(dp1(:,1), dp1(:,2)); 
fplot(lagrange_polynomial1, [0.6 1]) % function

% =============================
% data point set #2 f(x)=1/(1 + (12 * x^2)), on [-1,1], 15 equally-spaced points
% =============================

f2 = @(x) 1/(1 + (12 * x^2));
space = abs(-1-1)/14;
dp2 = zeros(15,2);
dp2(:,1) = -1:space:1;
for x2=1:15
    dp2(x2,2) = f2(dp2(x2,1));
end

% Vandermonde polynomial function
subplot(3,3,4);
hold on;
title('Vandermonde #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end
 
fplot(vandermonde(dp2), [-1 1]) % function

% Newton polynomial function
subplot(3,3,5);
hold on;
title('Newton #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end
newton_polynomial2 = newton_polynomial(dp2(:,1), dp2(:,2)); 
fplot(newton_polynomial2, [-1 1]) % function

% Lagrange polynomial function
subplot(3,3,6);
hold on;
title('Lagrange #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end
lagrange_polynomial2 = lagrange(dp2(:,1), dp2(:,2)); 
fplot(lagrange_polynomial2, [-1 1]) % function

% =============================
% data point set #3
% =============================

dp3 = [ 1994 67.052; 1995 68.008; 1996 69.803; 1997 72.024; 1998 73.400; 1999 72.063; 2000 74.669; 2001 74.487; 2002 74.065; 2003 76.777 ];


% Vandermonde polynomial function
subplot(3,3,7);
hold on;
title('Vandermonde #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end

fplot(vandermonde(dp3), [1994 2003]) % function


% Newton polynomial function
subplot(3,3,8);
hold on;
title('Newton #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end
newton_polynomial3 = newton_polynomial(dp3(:,1), dp3(:,2)); 
fplot(newton_polynomial3, [1994 2003]) % function

% Lagrange polynomial function
subplot(3,3,9);
hold on;
title('Lagrange #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end

lagrange_polynomial3 = lagrange(dp3(:,1), dp3(:,2)); 
fplot(lagrange_polynomial3, [1994 2003]) % function
