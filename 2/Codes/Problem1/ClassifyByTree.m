function [classifications] = ClassifyByTree(tree, attributes, instance)
%       attributes      - cell array of attribute strings 

% Store the actual classification
l_instance=size(instance);
leng_instance=l_instance(2);
actual = instance(1,leng_instance);



if (strcmp(tree.value, 'true'));
    classifications = [1, actual];
    return
end

% Current node is labeled 'false'
if (strcmp(tree.value, 'false'));
    classifications = [0, actual];
    return
end

% Case 3: Current node is labeled an attribute
index = find(ismember(attributes,tree.value)==1);
if (instance(1, index)==0) % attribute is true for this instance
    classifications = ClassifyByTree(tree.r0, attributes, instance); 
%1
elseif(instance(1, index)==1)
     classifications = ClassifyByTree(tree.r1, attributes, instance);
%2
elseif(instance(1, index)==2)
     classifications = ClassifyByTree(tree.r2, attributes, instance);
%3
elseif(instance(1, index)==3)
     classifications = ClassifyByTree(tree.r3, attributes, instance);
%4
elseif(instance(1, index)==4)
     classifications = ClassifyByTree(tree.r4, attributes, instance);
%5
elseif(instance(1, index)==5)
     classifications = ClassifyByTree(tree.r5, attributes, instance);
%6
elseif(instance(1, index)==6)
     classifications = ClassifyByTree(tree.r6, attributes, instance);
%7
elseif(instance(1, index)==7)
     classifications = ClassifyByTree(tree.r7, attributes, instance);
%8
elseif(instance(1, index)==8)
     classifications = ClassifyByTree(tree.r8, attributes, instance);
%9
elseif(instance(1, index)==9)
     classifications = ClassifyByTree(tree.r9, attributes, instance);
%10
elseif(instance(1, index)==10)
     classifications = ClassifyByTree(tree.r10, attributes, instance);
%11
elseif(instance(1, index)==11)
     classifications = ClassifyByTree(tree.r11, attributes, instance);
%12
elseif(instance(1, index)==12)
     classifications = ClassifyByTree(tree.r12, attributes, instance);
%13
elseif(instance(1, index)==13)
     classifications = ClassifyByTree(tree.r13, attributes, instance);
%14
elseif(instance(1, index)==14)
     classifications = ClassifyByTree(tree.r14, attributes, instance);
%15
else 
     classifications = ClassifyByTree(tree.r15, attributes, instance);
   
   
   
end

return
end