function [ currentEntropy ] = Entropy( lastColumnSum,numberExamples )
 if (numberExamples==0)
        p1=0.5;
    else
        p1 = lastColumnSum / numberExamples;
 end
if (p1 == 0);
    p1_eq = 0;
else
    p1_eq = -1*p1*log2(p1);
end
if (numberExamples==0)
        p0=0.5;
    else
        p0 = (numberExamples - lastColumnSum) / numberExamples;
 end



if (p0 == 0);
    p0_eq = 0;
else
    p0_eq = -1*p0*log2(p0);
end
currentEntropy = p1_eq + p0_eq;


end

