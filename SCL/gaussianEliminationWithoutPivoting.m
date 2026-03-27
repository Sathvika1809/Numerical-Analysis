function [x] = gaussianEliminationWithoutPivoting(A)
    [n,m]=size(A)
    %Forward Elimination
    for k=1:n-1
        for i=k+1:n
            fact = A(i,k)/A(k,k);
            A(i,k:m) = A(i,k:m)-fact*A(k,k:m);
        end
    end
    %Back Substitution
    x = zeros(n,1);
    for i = n:-1:1
        sumVal = A(i,i+1:n)*x(i+1:n);
        x(i)=(A(i,m)-sumVal)/A(i,i);
    end
end
