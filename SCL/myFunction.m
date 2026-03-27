function [f,grad] = myFunction(x)
    f=x.^4-4*x.^2;
    grad = 4*x.^3-8*x;
end
