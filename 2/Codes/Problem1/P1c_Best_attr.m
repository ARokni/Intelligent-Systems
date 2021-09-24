function [bestAttribute ] = P1c_Best_attr( currentEntropy,activeAttributes,examples )
numberAttributes = length(activeAttributes);
numberExamples = length(examples(:,1));
for i=1:numberAttributes;
    s=zeros(16,1);
        s_and_true=zeros(16,1);
    if (activeAttributes(i)) % this one is still active, update its gain
        s=zeros(16,1);
        s_and_true=zeros(16,1);
        for r=1:1:16
            for j=1:numberExamples
               if (examples(j,i)==r-1) % this instance has splitting attr. true
                    s(r)=s(r)+1;
                
                    if (examples(j, numberAttributes + 1)) %target attr is true
                     s_and_true(r) = s_and_true(r) + 1;
                    end
               end  
           end
        end
       Entf=0;
       for r=1:1:16
         Entrop(r)=Entropy( s_and_true(r),s(r) );
         Entf=Entf+(s(r)/numberExamples)*Entrop(r);
       end    
        
        
    else
     Entf=10;
   end

       gains(i) = currentEntropy-Entf;
end
              
  % Pick the attribute that maximizes gains
[~, bestAttribute] = max(gains);   %index of max(gain)     

                
                
                
                
                
                
                
 end

