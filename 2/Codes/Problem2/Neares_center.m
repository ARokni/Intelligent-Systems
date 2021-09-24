function [ cent_assigned ] = Neares_center( centers,curr_point,k) %k:number of clusters
    
    for i=1:1:k
        d(i)=norm(centers(i)-curr_point);
    end
    l=min(d);
      for i=1:1:k
        if(d(i)==l)
            cent_assigned=i;
        end
      end
   
end

