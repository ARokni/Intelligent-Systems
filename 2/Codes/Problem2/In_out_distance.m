function [ inclusters] = In_out_distance( clusters)
s1=size(clusters);
d=0;
    for i1=1:1:s1
        for i2=1:1:s1
            d=d+norm(clusters(i1,:)-clusters(i2,:));
        end
    end
inclusters=d/2;    
    
end

