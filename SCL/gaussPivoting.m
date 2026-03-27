function [x] = gaussPivoting(A)
    [n,m]=size(A);
    for i=1:n-1
        pivot=i;
        for k=i+1:n
            if(abs(A(i,k)) > abs(A(k,k)))
                pivot = k;
            end
        end
        A([i pivot],:) = A([pivot i] ,:);
        %Usual
        for k=i+1:n
            fact = A(i,k)/A(k,k);
            A(i,k:m)=A(i,k:m)-fact*A(k,k:m);
        end
    end
    %Back Substitution
    x = zeros(n,1);
    x(n)=A(n,end)/A(n,n);
    for k=n-1:-1:1
        x(k) = (A(k,m)-A(k,k+1:n)*x(k+1:n))/A(k,k);
    end
end
