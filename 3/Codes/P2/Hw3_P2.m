clear all
close all
clc

load data_train;
load data_test;
train=data_train;
test=data_test;
prior_sum=sum(train(:,6));
sick_prior=prior_sum/length(train); %our prior decision for diganosis
healthy_prior=1-sick_prior;
%training
%here we are extracting healthy and sick persons
sick=zeros(1,6);
healthy=zeros(1,6);
j=1;
k=1;
for i=1:1:length(train)
    if(train(i,6)==0)
        healthy(j,:)=train(i,:);
        j=j+1;
    end
    if(train(i,6)==1)
        sick(k,:)=train(i,:);
        k=k+1;
    end
end
  %mid && variance for healthy
  for i=1:1:5
   mid_healthy(i)=sum(healthy(:,i))/length(healthy);
   varn_healthy(i)=var(healthy(:,i))*(length(healthy)-1)/length(healthy);
  end
  %mid && variance for sick
  for i=1:1:5
   mid_sick(i)=sum(sick(:,i))/length(sick);
   varn_sick(i)=var(sick(:,i))*(length(sick)-1)/length(sick);
  end
  % Now we are computing probabilty for each
  for i=1:1:length(test)
        [Probabilty_healthy(i),Probabilty_sick(i)] = Probabilty_bayes( test(i,:), mid_healthy,varn_healthy,healthy_prior, mid_sick,varn_sick,sick_prior )
        if (Probabilty_healthy(i)>Probabilty_sick(i))
            test2(i)=0;
        else
            test2(i)=1;
        end
      
  end
  test22=transpose(test2);
  %partb
  I=test22-test(:,6);
  H=find(I==0);
  prob_final=length(H)/length(I);
  %partc
  n_postive_sickness=0;
  for i=1:1:length(test22)
    if((test22(i)==1)&&(test(i,6)==1))
        n_postive_sickness= n_postive_sickness+1;
    end
  end
  p_postive_sickness=n_postive_sickness/1000;
  p_positive=sum(test22)/length(test22);
  P_partc= p_postive_sickness/ p_positive;
  
  































