function y =Sigmoid(x,n)
  xx=transpose(x); 
  for i=1:1:n 
    y (i,:)= 1./(1 + exp(-xx(:,i)));
  end
end