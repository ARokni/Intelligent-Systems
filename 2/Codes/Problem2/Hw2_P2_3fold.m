clear all
close all
clc

load iris;
acc_epoch=0;
ir=[data labels];
for epoch=1:1:500
[data2,labels_2]=random(data,labels);
labels2=transpose(labels_2);
k=9; %k_nearest
for i=1:1:3
    for c=(i-1)*50+1:1:i*50
     if(i>1)    %we are partioning our space in to train and test data base
        A1=data2(1:(i-1)*50,1:4);
        lab1=labels2(1:(i-1)*50)
     else
         A1=zeros(0);
         lab1=zeros(0);
     end
      if(i<3)
          A2=data2(i*50+1:150,1:4);
          lab2=labels2(i*50+1:150);
      else
          A2=zeros(0);
          lab2=zeros(0);
      end                              %end partioning
    A=vertcat(A1,A2);                  %our training data(Dt)
    lab=vertcat(lab1,lab2);
    y=Knn(3,k,data2(c,:),A,lab);               %this function calculte the lables of k most nearest data
    predict_lab(c)=mode(y);             %this will predict the lable for a test(by taking the most frequent lable)
  end
end
%Accuracy calculation
ac=0;   
   for i=1:1:150                          
        if(predict_lab(i)==labels2(i))
            ac=ac+1;
        end
   end
   acc_epoch=ac+acc_epoch;
end  
   ac_final=acc_epoch/(50*3*500);