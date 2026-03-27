function[L,U] = LUByGaussElimination(A);
    [n, m] = size(A);
    L = eye(n); % Initialize L as an identity matrix
    U = A;      % Start U as the original matrix A
    for k = 1:n-1
        for i=k+1:n
            L(i,k)=U(i,k)/U(k,k);
            U(i,k:n) = U(i,k:n)-L(i,k)*U(k,k);
        end
    end
    