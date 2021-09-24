function [tree] = ID3_by_GINI(examples, attributes, activeAttributes)

%       examples            the last value in each row being the value of the classifying attribute
%       attributes          attribue strings



if (isempty(examples));
    error('Must provide examples');
end
numberAttributes = length(activeAttributes);
numberExamples = length(examples(:,1));
% Create the tree node
tree = struct('value', 'null', 'r0', 'null',  'r1', 'null', 'r2', 'null', 'r3', 'null', 'r4', 'null', 'r5', 'null', 'r6', 'null', 'r7', 'null', 'r8', 'null', 'r9', 'null', 'r10', 'null', 'r11', 'null', 'r12', 'null', 'r13', 'null', 'r14', 'null','r15', 'null');
% If last value of all rows in examples is 1, return tree labeled 'true'
lastColumnSum = sum(examples(:, numberAttributes + 1));
if (lastColumnSum == numberExamples);
    tree.value = 'true';
    return
end
% If last value of all rows in examples is 0, return tree labeled 'false'
if (lastColumnSum == 0);
    tree.value = 'false';
    return
end
% If activeAttributes is empty, then return tree with label as most common
% value
if (sum(activeAttributes) == 0);
    if (lastColumnSum >= numberExamples / 2);
        tree.value = 'true';
    else
        tree.value = 'false';
    end
    return
end
% Find the current entropy
currentGINI= GINI( lastColumnSum,numberExamples );
bestAttribute=Best_attr_GINI( currentGINI,activeAttributes,examples );%Best_attr_GINI( currentGINI,activeAttributes,examples )
% Set tree.value to bestAttribute's relevant string
tree.value = attributes{bestAttribute};
% Remove splitting attribute from activeAttributes
activeAttributes(bestAttribute) = 0;
% Initialize and create the new example matrices
ex_cell=cell(16,1);
examples_index=zeros(16,1);
    for r=1:1:16
        Mid=[];
        for i=1:1:numberExamples
            if (examples(i, bestAttribute)==r-1); % this instance has it as r/true
                examples_index(r)=examples_index(r)+1;
                Mid(examples_index(r),:)=examples(i, :); 
            end
        end
        ex_cell{r,1}=Mid;
       
    end
    % For 15th values of the splitting attribute
   % for r=1:1:15
       ex_mid= cell2mat(ex_cell(1,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r0 = leaf;
else
    % Here is were we can recur
    tree.r0 = ID3( ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
  % end
  
  
  
%2
   ex_mid= cell2mat(ex_cell(2,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r1 = leaf;
else
    % Here is were we can recur
    tree.r1 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
    
    
%3
   ex_mid= cell2mat(ex_cell(3,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r2 = leaf;
else
    % Here is were we can recur
    tree.r2 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
    
%4
   ex_mid= cell2mat(ex_cell(4,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r3 = leaf;
else
    % Here is were we can recur
    tree.r3 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];

    
%5
   ex_mid= cell2mat(ex_cell(5,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r4 = leaf;
else
    % Here is were we can recur
    tree.r4 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
    
%6
   ex_mid= cell2mat(ex_cell(6,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r5 = leaf;
else
    % Here is were we can recur
    tree.r5 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
    
%7
  


ex_mid= cell2mat(ex_cell(7,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r6 = leaf;
else
    % Here is were we can recur
    tree.r6 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
   
    
    
    
 %8
 
    ex_mid= cell2mat(ex_cell(8,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r7 = leaf;
else
    % Here is were we can recur
    tree.r7 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
    
    
 %9
 
 
    ex_mid= cell2mat(ex_cell(9,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r8 = leaf;
else
    % Here is were we can recur
    tree.r8 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
    
    %10
    
    
    ex_mid= cell2mat(ex_cell(10,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r9 = leaf;
else
    % Here is were we can recur
    tree.r9 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
    
 
  %11
  
     ex_mid= cell2mat(ex_cell(11,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r10 = leaf;
else
    % Here is were we can recur
    tree.r10 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
    
    
%12


   ex_mid= cell2mat(ex_cell(12,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r11 = leaf;
else
    % Here is were we can recur
    tree.r11 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];

    
%13   
    
ex_mid= cell2mat(ex_cell(13,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r12 = leaf;
else
    % Here is were we can recur
    tree.r12 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];

    
   
%14
   ex_mid= cell2mat(ex_cell(14,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r13 = leaf;
else
    % Here is were we can recur
    tree.r13 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
    
    
    
 %15
 
 
    ex_mid= cell2mat(ex_cell(15,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r14 = leaf;
else
    % Here is were we can recur
    tree.r14 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];


    
    
    
    
 %16
 
 
    ex_mid= cell2mat(ex_cell(16,1));
       if (isempty(ex_mid))
    leaf = struct('value', 'null', 'left', 'null', 'right', 'null');
    if (lastColumnSum >= numberExamples / 2); % for matrix examples
        leaf.value = 'true';
    else
        leaf.value = 'false';
    end
    tree.r15 = leaf;
else
    % Here is were we can recur
    tree.r15 = ID3(ex_mid, attributes, activeAttributes);
       end
    ex_mid=[];
    % Now we can return tree
return
   
    




end

