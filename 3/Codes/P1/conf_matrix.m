function [ conf_matrix  ] = conf_matrix( predictedclass,trueclass  )
    conf_matrix=zeros(10,10);
    for i=1:1:10000
        conf_matrix(trueclass(i)+1,predictedclass(i))=conf_matrix(trueclass(i)+1,predictedclass(i))+1;
    end


end

