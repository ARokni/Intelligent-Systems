function [ y ] = Knn_cos( k_fold,k_nearest,x,vect,lable)
upper_bound=150-(150/k_fold)
    for i=1:1:upper_bound
        h=abs(dot(x,vect(i,:)));
        l(i)=1-h;
    end
[y1,I]=sort(l);
    for i=1:1:k_nearest
        y(i)=lable(I(i));
    end
end

