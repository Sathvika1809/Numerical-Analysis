function [x] = QuasiNewton(gradf,hessf,tol,x,n)
    B = eye(n);
    curr_grad = gradf(x);
    prev = x;
    while true
        d = -B*curr_grad;
        a = els(curr_grad,hessf,d);
        x = x + a*d;
        new_grad = gradf(x);
        s = x - prev;
        y = new_grad - curr_grad;
        
        m = (s*s')/(s'*y);
        if abs(s' * y)<1e-12 || abs(y'*B*y)<1e-12
            warning('Denominator becomes zero');
            break;
        end
        
        p = (B*y)*(B*y)'/(y'*B*y);
        
        B = B + m - p;
        curr_grad = new_grad;
        prev = x;
        if norm(curr_grad,2) < tol
            break;
        end
    end
    x = prev;
end