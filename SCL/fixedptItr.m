function [p,itr] = fixedptItr(g,InitGuess,maxItr,err)
    prev=InitGuess;
    p=0;
    itr=0;
    curr = prev;
    while itr<maxItr 
        itr = itr+1;
        curr = g(prev);
        if abs(curr-prev)<err
            break;
        end
        prev = curr;
    end
    p=curr;
end

%Fixed pt iteration will only work if |f'(x)|<1 near the solution otherwise
%it may diverge