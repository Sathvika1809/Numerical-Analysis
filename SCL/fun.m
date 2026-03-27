function [B,C] = fun(A)
    [m,n]=size(A);
    B = A*A;
    C = A.^2;
    % Or also can be written as
    for i = 1:m
        for j = 1:n
            C(i,j) = A(i,j)^2;
        end
    end
    
end

