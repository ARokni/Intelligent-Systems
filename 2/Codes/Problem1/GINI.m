function [ currentGINI ] = GINI( lastColumnSum,numberExamples )
    if (numberExamples==0)
         p1=0.5;
    else
         p1 = lastColumnSum / numberExamples;
    end
    p2=1-p1;
    currentGINI=1-(p1^2)-(p2^2);
end
