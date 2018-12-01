function[x] = GEPP(A, b) % Gaussian Elimination with partial pivoting % to solve linear eq's in form Ax = b
    % A - input matrix
    % b - rhs
    % x - solution vector 

    [n,~] = size(A);
    p = (1:n)'; 	
    s = max(abs(A'));
    % loop over columns
    for k = 1:(n-1)
        % search for pivot in current form
        r = abs(A(p(k),k) / s(p(k)));
        kp = k;
        for i = (k+1):1:n
            t = abs(A(p(i),k) / s(p(i))); 
            if (t > r)
                r = t;  
                kp = i;  
            end
        end
        l = p(kp);  
        p(kp) = p(k);  
        p(k) = l; 
        % complete multipliers for current column
        for i = (k+1):1:n
            A(p(i),k) = A(p(i),k) / A(p(k),k);
            % apply trnsformation to remaining submatrix
            for j = (k+1):n
                A(p(i),j) = A(p(i),j) - A(p(i),k) * A(p(k),j);
            end
        end
    end
    % rhs  
    y = zeros(n,1);      
    y(1) = b(p(1));
    for i = 2:n
        y(i) = b(p(i));
        for j = 1:1:(i-1)
            y(i) = y(i)-A(p(i),j)*y(j);
        end
    end
    % solution
    x = zeros(n,1);       
    x(n) = y(n) / A(p(n),n);
    for i = (n-1):-1:1
        x(i) = y(i);
        for j = (i+1):1:n
            x(i) = x(i) - A(p(i),j)*x(j);
        end
        x(i) = x(i) / A(p(i),i);
    end
end