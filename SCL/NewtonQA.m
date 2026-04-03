function [x] = NewtonQA(gradf,hessf,x,tol)
    prev = x;

    while true
        curr_grad = gradf(prev);
        d = -1*hessf\curr_grad;
        if norm(curr_grad,2) < tol
            break;
        end
        a = elsN(curr_grad,hessf,d); % Direct exact line search
        curr = prev+(a*d);
        if norm(curr-prev,2)<tol
            break
        end
        prev = curr;
    end
    x = prev;
    
end
