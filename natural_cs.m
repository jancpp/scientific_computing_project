function [full] = natural_cs(dp)
% NATURAL_CS Natural cubic spline
%   dp - input data points [ (t1,y1), (t2,y2), (t3,y3), ... (tn,yn) ]
%   p  - intervals


    npoints = length(dp); % number of data inputs
    int = npoints-1;    
    size = int*4;
    A = zeros(size);
    b = zeros(size,1);
    
    j1 = 1;
    jpp = int*4;
    jn = 4;
    i1 = 1;
    in = int*2;
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
    
    j1 = 1;
    jpp = int*4;
    jn = 8;
    i1 = in+1;
    newin = in + npoints-2 % middle points
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
    
    j1 = 1;
    jpp = int*4;
    jn = 8;
    i1 = newin+1;
    in = newin + npoints-2;
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

A
dp

end
    


