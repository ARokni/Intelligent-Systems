function [ vector ] = func_vect(x,n)
    mid=x-1;
    for c=1:1:n
        vector(c)=floor(mid/(3^(n-c)));
        mid=mod(mid,3^(n-c));
    
    end


end

