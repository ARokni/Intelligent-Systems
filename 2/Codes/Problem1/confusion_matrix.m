function [ conf_matrix ] = confusion_matrix( predictedclass,trueclass )
    conf_matrix=zeros(26,26);
    for i=60:1:4000
        conf_matrix(trueclass(i),predictedclass(i))=conf_matrix(trueclass(i),predictedclass(i))+1;
    end


end

