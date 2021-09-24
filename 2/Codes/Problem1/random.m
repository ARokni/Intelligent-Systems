function [ y,lab ] = random(matrix,label)
h=randperm(150);
    for i=1:1:150
        y(i,:)=matrix(h(i),:);
        lab(i)=label(h(i));
    end
end

