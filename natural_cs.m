function [polynomial_vec] = natural_cs(dp)
% Natural cubic spline
% takes data points [ (t1,y1), (t2,y2), (t3,y3), ... (tn,yn) ]
% returns vector with polymonial functions in form
% p(t) = x(1) + x(2)*t +...+ x(n)*t^(n-1)

nPoints = length(dp); % number of data inputs
ints = nPoints-1;
size = ints*4;
A = zeros(size); % matrix with coeficients
b = zeros(size,1); % rhs

% cubic equations
j1 = 1;
jpp = ints*4;
jn = 4;
i1 = 1;
in = ints*2;
dpi = 1;
offset=0;

for i=i1:2:in
    if ((jn+offset-1)<= size)
        j1 = j1+offset;
        jn = jn+offset;
    end
    for j=j1:jpp:jn
        
        A(i,j)= 1;
        A(i,j+1)= dp(dpi,1);
        A(i,j+2)= dp(dpi,1)^2;
        A(i,j+3)= dp(dpi,1)^3;
        b(i,1) = dp(dpi,2);
        
        A(i+1,j)= 1;
        A(i+1,j+1)= dp(dpi+1,1);
        A(i+1,j+2)= dp(dpi+1,1)^2;
        A(i+1,j+3)= dp(dpi+1,1)^3;
        b(i+1,1) = dp(dpi+1,2);
    end
    dpi=dpi+1;
    offset=4;
end

% first derivatives
j1 = 1;
jpp = ints*4;
jn = 8;
i1 = in+1;
newin = in + nPoints-2; % middle Points
dpi = 1;
offset=0;

for i=i1:1:newin
    if ((jn+offset-1)<= size)
        dpi=dpi+1;
        j1 = j1+offset;
        jn = jn+offset;
    end
    for j=j1:jpp:jn
        
        A(i,j+1)= 1;
        A(i,j+2)= 2*dp(dpi,1);
        A(i,j+3)= 3*dp(dpi,1)^2;
        
        A(i,j+5)= -1;
        A(i,j+6)= -2*dp(dpi,1);
        A(i,j+7)= -3*dp(dpi,1)^2;
    end
    offset=4;
end

% second derivatives
j1 = 1;
jpp = ints*4;
jn = 8;
i1 = newin+1;
in = newin + nPoints-2;
dpi = 1;
offset=0;

for i=i1:1:in
    if ((jn+offset-1)<= size)
        dpi=dpi+1;
        j1 = j1+offset;
        jn = jn+offset;
    end
    for j=j1:jpp:jn
        
        A(i,j+2)= 2;
        A(i,j+3)= 6*dp(dpi,1);
        
        A(i,j+6)= -2;
        A(i,j+7)= -6*dp(dpi,1);
    end
    offset=4;
end

% end Points (natural spline part)

j1 = 1;
jn = size;
i1 = in+1;

A(i1,j1+2)= 2;
A(i1,j1+3)= 6*dp(1,1);

A(i1+1,jn-1)= 2;
A(i1+1,jn)= 6*dp(nPoints,1);
% solve using GEPP for efficency
vec = GEPP(A,b);

syms t;
polynomial_vec = sym('polynomial_vec',[ints 1]);
i1=1;
in=4;
offset=0;

for n=1:ints
    if ((in+4)<= size)
        i1 = i1+offset;
        in = in+offset;
    end
    for i=i1:4:in
        polynomial_vec(n) = vec(i) + vec(i+1)*t + vec(i+2)*t^2 + vec(i+3)*t^3;
    end
    offset=4;
end
end


