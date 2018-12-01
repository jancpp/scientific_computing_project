function [full_vec] = complete_cs(dp)
% COMPLETE_CS Complete cubic spline
%   dp - input data Points [ (t1,y1), (t2,y2), (t3,y3), ... (tn,yn) ]


    nPoints = length(dp); % number of data inputs
    ints = nPoints-1;    
    size = ints*4;
    A = zeros(size);
    b = zeros(size,1);
   
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
    
    A(i1,j1+1)= 1;
    A(i1,j1+2)= 2*dp(1,1);
    A(i1,j1+3)= 3*dp(1,1)^2;
    b(i1,1) = dp(1,2);

    A(i1+1,jn-2)= 1;
    A(i1+1,jn-1)= 2*dp(nPoints,1);
    A(i1+1,jn)  = 3*dp(nPoints,1)^2;
    b(i1+1,1) = dp(nPoints,2);
    
    vec = GEPP(A,b);
    
    syms t;
    full_vec = sym('full_vec',[ints 1]);
    i1=1;
    in=4;
    offset=0;
    
    for n=1:ints;
        if ((in+4)<= size) 
            i1 = i1+offset;
            in = in+offset;
        end
        for i=i1:4:in
            full_vec(n) = vec(i) + vec(i+1)*t + vec(i+2)*t^2 + vec(i+3)*t^3;
        end
        offset=4;
    end
end
    


