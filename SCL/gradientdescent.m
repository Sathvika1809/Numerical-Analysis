function[x,history] = gradientdescent(g,x0,lr,maxItr,tol)
        % [f,grad]=g(x)
        % f-function val
        % g - gradient(col vector)
        %x0 = initial pt
        %lr = learning rate(step size)
        %maxItr = maxIterations
        %tol = bound on gradnorm
        x = x0;
        history.f = zeros(maxItr,1);
        history.gradnorm = zeros(maxItr,1);
        for k = 1:maxItr
            [f,grad]=g(x);
            history.f(k) = f;
            history.gradnorm(k)= norm(grad);
            if(history.gradnorm(k)<=tol)
                history.f = history.f(1:k);
                history.gradnorm = history.gradnorm(1:k);
                break
            end
            x = x - lr * grad;
        end
end





