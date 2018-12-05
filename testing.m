clear;
clc;

% data point set #1: f(x)=exp(x^2), on [0.6,1], 5 equally-spaced points

f1 = @(x) exp(x^2);
space = abs(1-0.6)/4;
dp1 = zeros(5,2);
dp1(:,1) = 0.6:space:1;
for x1=1:5
    dp1(x1,2) = f1(dp1(x1,1));
end

subplot(2,3,1);
hold on;
title('Vandermonde #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end
fplot(vandermonde(dp1), [0.6 1]) % function

subplot(2,3,2);
hold on;
title('Newton #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end
newton_polynomial1 = newton_polynomial(dp1(:,1), dp1(:,2)); 
fplot(newton_polynomial1, [0.6 1]) % function

subplot(2,3,3);
hold on;
title('Lagrange #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end
lagrange_polynomial1 = lagrange(dp1(:,1), dp1(:,2)); 
fplot(lagrange_polynomial1, [0.6 1]) % function

subplot(2,3,4);
hold on;
title('Natural CS #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end
natural_cs_vec1 =  natural_cs(dp1);
for i=1:4
    fplot(natural_cs_vec1(i), [dp1(i,1),dp1(i+1,1)]); % functions
    hold on;
end

subplot(2,3,5);
hold on;
title('Complete CS #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end
complete_cs_vec1 =  complete_cs(dp1);
for i=1:4
    fplot(complete_cs_vec1(i), [dp1(i,1),dp1(i+1,1)]); % functions
    hold on;
end

subplot(2,3,6);
hold on;
title('Not-a-knot CS #1');
for i=1:5
    xdp1 = dp1(i,1);
    ydp1 = dp1(i,2);
    plot(xdp1,ydp1,'ro'); % data points
end
% CSf = CS(dp1(:,1), dp1(:,2)); 
% fplot(CSf, [0.6 1]) % function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data point set #2 f(x)=1/(1 + (12 * x^2)), on [-1,1], 15 equally-spaced points

f2 = @(x) 1/(1 + (12 * x^2));
space = abs(-1-1)/14;
dp2 = zeros(15,2);
dp2(:,1) = -1:space:1;
for x2=1:15
    dp2(x2,2) = f2(dp2(x2,1));
end

subplot(2,3,1);
hold on;
title('Vandermonde #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end
fplot(vandermonde(dp2), [-1 1]) % function

subplot(2,3,2);
hold on;
title('Newton #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end
newton_polynomial2 = newton_polynomial(dp2(:,1), dp2(:,2)); 
fplot(newton_polynomial2, [-1 1]) % function

subplot(2,3,3);
hold on;
title('Lagrange #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end
lagrange_polynomial2 = lagrange(dp2(:,1), dp2(:,2)); 
fplot(lagrange_polynomial2, [-1 1]) % function

subplot(2,3,4);
hold on;
title('Natural CS #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end
natural_cs_vec2 =  natural_cs(dp2);
for i=1:14
    fplot(natural_cs_vec2(i), [dp2(i,1),dp2(i+1,1)]); % functions
    hold on;
end

subplot(2,3,5);
hold on;
title('Complete CS #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end
complete_cs_vec2 =  complete_cs(dp2);
for i=1:14
    fplot(complete_cs_vec2(i), [dp2(i,1),dp2(i+1,1)]); % functions
    hold on;
end

subplot(2,3,6);
hold on;
title('Not-a-knot CS #2');
for i=1:15
    xdp2 = dp2(i,1);
    ydp2 = dp2(i,2);
    plot(xdp2,ydp2,'ro'); % data points
end
% CSf = CS(dp2(:,1), dp2(:,2)); 
% fplot(CSf, [-1 1]) % function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data point set #3
dp3 = [ 1994 67.052; 1995 68.008; 
        1996 69.803; 1997 72.024; 
        1998 73.400; 1999 72.063; 
        2000 74.669; 2001 74.487; 
        2002 74.065; 2003 76.777 ];
    
subplot(2,3,1);
hold on;
title('Vandermonde #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end
fplot(vandermonde(dp3), [1994 2003]) % function

subplot(2,3,2);
hold on;
title('Newton #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end
newton_polynomial3 = newton_polynomial(dp3(:,1), dp3(:,2)); 
fplot(newton_polynomial3, [1994 2003]) % function

subplot(2,3,3);
hold on;
title('Lagrange #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end
lagrange_polynomial3 = lagrange(dp3(:,1), dp3(:,2)); 
fplot(lagrange_polynomial3, [1994 2003]) % function

subplot(2,3,4);
hold on;
title('Natural CS #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end
natural_cs_vec3 =  natural_cs(dp3);
for i=1:1:9
    fplot(natural_cs_vec3(i), [dp3(i,1),dp3(i+1,1)]); % functions
    hold on;
end

subplot(2,3,5);
hold on;
title('Complete CS #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end
complete_cs_vec3 =  complete_cs(dp3);
for i=1:1:9
    fplot(complete_cs_vec3(i), [dp3(i,1),dp3(i+1,1)]); % functions
    hold on;
end

subplot(2,3,6);
hold on;
title('Not-a-knot CS #3');
for i=1:1:10
    xdp3 = dp3(i,1);
    ydp3 = dp3(i,2);
    plot(xdp3,ydp3,'ro'); % data points
end

% CSf = CS(dp3(:,1), dp3(:,2)); 
% fplot(CSf, [1994 2003]) % function


% ===========================
% Pt 3: Weather Application
% ===========================

% Daily highs for first 101 days on 2018
jan  = [ 9.0 21.9 26.1 26.1 28.9 37.9 37.9 48.0 43.0 53.1 28.9 18.0 18.0 33.1 14.0 10.0 24.1 39.0 46.0 51.1 62.1 37.0 35.1 51.1 64.9 57.0 55.0 39.0 30.0 48.9 50.0 ];
feb = [ 28.9 37.0 48.0 21.9 21.9 19.0 28.9 54.0 28.9 19.9 32.0 36.0 48.0 60.1 63.0 36.0 54.0 62.1 64.0 28.9 25.0 32.0 33.1 37.9 48.9 60.1 66.9 57.0];
mar = [ 53.1 57.9 66.9 64.0 54.0 37.9 43.0 45.0 61.0 57.0 41.0 51.1 51.1 64.0 73.9 64.9 44.1 53.1 46.0 44.1 54.0 68.0 62.1 48.0 50.0 57.90 57.9 57.9 43.0 57.0 60.1];
april = [ 28.0 36.0 39.9 45.0 68.0 43.0 43.0 36.0 46.9 62.1 80.1];
temps = [ jan, feb, mar, april];

% 21 point Newton polynomial through every 5th point
% Create every 5th point data set
xdp4=0:5:100;
ydp4=zeros(1,20);
j = 1;
for i=1:5:101
    ydp4(j) = temps(i);
    j=j+1;
end

% Using 21 point Newton Polynomial
hold on;
title('Weather using Newton');
xfull = 1:1:101;
for i=1:1:101
    x = xfull(i);
    y = temps(i);
    plot(x,y,'ro'); % data points
end
newton_polynomial4 = newton_polynomial(xdp4, ydp4); 
fplot(newton_polynomial4, [0 101]) % function
% Max Interpolation Error
syms t;
biggest = 0;
for i=1:1:101
    int = subs(newton_polynomial4,t,i);
    int = double(int);
    real = temps(i);
    new = abs(int - real);
    if new > biggest
        biggest = new;
    end
end
biggest


% Using 21 point Natural Cubic Spline
dp4 = [xdp4',ydp4'];
hold on;
title('Weather using Natural Cubic Spline');
xfull = 1:1:101;
for i=1:1:101
    x = xfull(i);
    y = temps(i);
    plot(x,y,'ro'); % data points
end
natural_cs_vec4 =  natural_cs(dp4);
for i=1:1:20
    fplot(natural_cs_vec4(i), [dp4(i,1),dp4(i+1,1)]); % functions
    hold on;
end
% Max Interpolation Error
syms t;
biggest = 0;
interval_count = 1;
for i=1:1:101
    int = subs(natural_cs_vec4(interval_count),t,i);
    int = double(int); 
    real = temps(i);
    new = abs(int - real);
    if new > biggest
        biggest = new;
    end
    if rem(i,5) == 0 & i<100
        interval_count = interval_count+1;
    end
    
end
biggest

% Max daily rainfall for first 101 days of 2018
jan_rain = [0 0 0 0 0 0.01 0.03 0 0.02 0.15 0.23 0 0.40 1.03 0 0 0 0 0 0 0.10 0.10 0 0 0 0 0 0 0 0 0];
feb_rain = [0 0 0 2.11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.27 0.02 0 0.09 0.19 0.05 0 0 0.03 0];
march_rain = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.11 0.06 0 0.61 0.50 0 0 0 0 0 0.28 0.13 0 0 0 0 0];
april_rain = [0.22  0.16 0 0.03 0 0.21 0 0.11 0 0 0];
rains = [jan_rain, feb_rain, march_rain, april_rain];

% 21 point Newton polynomial through every 5th point
% Create every 5th point data set
xdp5=0:5:100;
ydp5=zeros(1,20);
j = 1;
for i=1:5:101
    ydp5(j) = rains(i);
    j=j+1;
end

hold on;
title('Rainfall using Newton');
for i=1:1:101
    x = xfull(i);
    y = rains(i);
    plot(x,y,'ro'); % data points
end
newton_polynomial5 = newton_polynomial(xdp5, ydp5); 
fplot(newton_polynomial5, [0 101]) % function
% Max Interpolation Error
syms t;
biggest = 0;
for i=1:1:101
    int = subs(newton_polynomial5,t,i);
    int = double(int);
    real = rains(i);
    new = abs(int - real);
    if new > biggest
        biggest = new;
    end
end
biggest


% Using 21 point Natural Cubic Spline
dp5 = [xdp5',ydp5'];
hold on;
title('Rainfall using Natural Cubic Spline');
xfull = 1:1:101;
for i=1:1:101
    x = xfull(i);
    y = rains(i);
    plot(x,y,'ro'); % data points
end
natural_cs_vec5 =  natural_cs(dp5);
for i=1:1:20
    fplot(natural_cs_vec5(i), [dp5(i,1),dp5(i+1,1)]); % functions
    hold on;
end
% Max Interpolation Error
syms t;
biggest = 0;
interval_count = 1;
for i=1:1:101
    int = subs(natural_cs_vec5(interval_count),t,i);
    int = double(int);
    real = rains(i);
    new = abs(int - real);
    if new > biggest
        biggest = new;
    end
    if rem(i,5) == 0 & i<100
        interval_count = interval_count+1;
    end
    
end
biggest
