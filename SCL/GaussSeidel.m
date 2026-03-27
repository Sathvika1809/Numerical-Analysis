function[x] = GaussSeidel(A,b,maxItr,tol)
    n = length(b);
    D = zeros(n);
    L = zeros(n);
    U = zeros(n);
    for i = 1:n
        for j=1:n
            if i==j
                D(i,j)=A(i,j);
            elseif i>j
                L(i,j) = -1*A(i,j);
            else
                U(i,j)=-1*A(i,j);
            end
        end
    end
    M = D-L;
    N = U;
     %Mostly use M\something
    T = M\N;
    C = M\b;
    itr = 0;
    x_prev = zeros(n,1);
    x_new = zeros(n,1);
    while(itr<maxItr)
        x_new = T*x_prev+C;
        itr = itr+1;
        if(norm(x_new - x_prev)<=tol)
            break
        end
        x_prev = x_new;
    end
    x = x_new;
end

    
        
        
        
 

