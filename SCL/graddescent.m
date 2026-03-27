function [x,itr] = graddescent(f,gradf,hessf,x0,maxItr,tol)
    x=x0;
    itr=0;
    grad = gradf(x);
    while(itr<maxItr)
        itr = itr+1;
        alpha = (grad'*grad)/(grad'*hessf*grad);
        x = x - alpha * grad;
        if norm(grad,2)<tol
            break;
        end
        grad = gradf(x);
    end
end
