function a = elsN(g,H,d)
    x = -1*g'*d;
    y = d'*H*d;
    a = x/y;
end
