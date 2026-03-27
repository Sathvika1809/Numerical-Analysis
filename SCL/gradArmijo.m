function [x,itr] = gradArmijo(f,gradf,initalpha,maxItr,tol,c,x0)
        x=x0;
        itr=0;
        tau = 0.5;
        while(itr<maxItr)
            alpha = initalpha;
            itr = itr+1;
            fx=f(x);
            gradx = gradf(x);
            if norm(gradx) < tol
                break;
            end
            d = -gradx;
            res = gradx'*d;
            while f(x+alpha*d)>fx+c*alpha*res
                 alpha = alpha*tau;
                
            end
            if alpha<0.0001
                disp('Alpha is very close to zero');
                break;
            end
            x = x+alpha*d;

        end
end

        
