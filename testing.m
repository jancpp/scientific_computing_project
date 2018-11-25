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
x = vandermonde(dp1);
vandermonde_polynomial1 = @(t) x(1) + x(2)*t + x(3)*(t^2) + x(4)*(t^3) + x(5)*(t^4);

subplot(3,2,1);
hold on;
title('Vandermonde #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end

xx = linspace(0.6,1,10);
for i=1:10
    yy(i) = vandermonde_polynomial1(xx(i));
end
plot(xx,yy,'-g'); % function


% Newton polynomial function

% Lagrange polynomial function
hold on;
title('Lagrange #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end
lagrange_polynomial1 = lagrange(dp1(:,1), dp1(:,2)); 
fplot(lagrange_polynomial1, [0.6 1])

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
x = vandermonde(dp2);
vandermonde_polynomial2 = @(t) x(1) + x(2)*t + x(3)*(t^2) + x(4)*(t^3) + x(5)*(t^4) + x(6)*(t^5) + x(7)*(t^6) + x(8)*(t^7)+ x(9)*(t^8) + x(10)*(t^9) + x(11)*(t^10) + x(12)*(t^11) + x(13)*(t^12) + x(14)*(t^13) + x(15)*(t^14);

subplot(3,2,3);
hold on;
title('Vandermonde #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end

xx = linspace(-1,1,15);
for i=1:15
    yy(i) = vandermonde_polynomial1(xx(i));
end
plot(xx,yy,'-g'); % function

% Newton polynomial function

% Lagrange polynomial function
hold on;
title('Lagrange #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end
lagrange_polynomial2 = lagrange(dp2(:,1), dp2(:,2)); 
fplot(lagrange_polynomial2, [-1 1])

% =============================
% data point set #3
% =============================

dp3 = [ 1994 67.052; 1995 68.008; 1996 69.803; 1997 72.024; 1998 73.400; 1999 72.063; 2000 74.669; 2001 74.487; 2002 74.065; 2003 76.777 ];


% Vandermonde polynomial function
x3 = vandermonde(dp3); % Fix  Error  Error  Error  Error  Error  Error  Error  Error  Error  Error  Error  Error
vandermonde_polynomial3 = @(t) x3(1) + x3(2)*t + x3(3)*(t^2) + x3(4)*(t^3) + x3(5)*(t^4) + x3(6)*(t^5) + x3(7)*(t^6) + x3(8)*(t^7) + x3(9)*(t^8) + x3(10)*(t^9) ;

subplot(3,2,5);
hold on;
title('Vandermonde #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end

xx = linspace(1994,2003,100);
for i=1:100
    yy(i) = vandermonde_polynomial3(xx(i));
end
plot(xx,yy,'-g'); % function


% Newton polynomial function

% Lagrange polynomial function
hold on;
title('Lagrange #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end

lagrange_polynomial2 = lagrange(dp3(:,1), dp3(:,2)); 
fplot(lagrange_polynomial2, [1994 2003])
