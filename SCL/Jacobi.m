function [x] = Jacobi(A,b,maxItr,tol)
    n = length(b);
    D = zeros(n,n);
    L = zeros(n,n);
    U = zeros(n,n);
    for i = 1:n
        for j=1:n
            if i==j
                D(i,j) = A(i,j);
            elseif i>j
                L(i,j) = -1 * A(i,j);
            else
                U(i,j) = -1 * A(i,j);
            end
        end
    end
    M = D;
    N = L+U;
    invM = inv(M);
    T = invM*N;
    C = invM*b;
    x_prev = zeros(n,1);
    x_new = zeros(n,1);
    itr=0;
    while(itr<maxItr)
        itr = itr+1;
        x_new = C+T*x_prev;
        if(norm(x_new-x_prev)<tol)
            break
        end
        x_prev = x_new;
    end
    x = x_new
end


