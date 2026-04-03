function[x] = Qconjugate(gradf,hessf,x,tol)
        curr_grad = gradf(x);
        d = -curr_grad;
        Q = hessf;
      
        while true
            if norm(curr_grad,2) < tol
                break;
            end

            alpha = -(d)'*curr_grad/(d'*Q*d);
            x = x+alpha*d;
            new_grad = gradf(x);
            beta = -(new_grad'*Q*d)/(d'*Q*d);
            d = -new_grad+beta*d;
            curr_grad = new_grad;
        end
       
end

        