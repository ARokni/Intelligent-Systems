clear all
close all
clc

load mnist;

t2=zeros(10,60000);
tt=transpose(trainY);
for j=1:1:60000
    t2(trainY(j)+1,j)=1;
end

ttest=zeros(10,10000);
tttest=transpose(testY);

for i=1:1:10
    Itest=find(tttest==(i-1));
    ttest(i,Itest)=1;
end

nhid=70;
input_layer=zeros(784,20000);
output_layer=zeros(10,20000);
hidden_layer=zeros(nhid,20000);

%Weight matrix initialization
Vv=rand(nhid,784);
prev=zeros(nhid,784);
Ww=rand(10,nhid);
prew=zeros(10,nhid);

for i=1:1:nhid
   for j=1:1:784
       v(i,j)=normrnd(0,0.1); 
   end
end

epsilon=sqrt(6)/(sqrt(nhid+784));

for i=1:1:10
    for j=1:1:nhid
       w(i,j)=normrnd(0,0.1); 
   end
end

epsilon2=sqrt(6)/(sqrt(nhid+10));

%normalization of inputs
for i=1:1:784
    if((max(trainX(:,i))-min(trainX(:,i)))>0)
        trainxx(:,i)=double((trainX(:,i)))/double((max(trainX(:,i))-min(trainX(:,i))));
    else
         trainxx(:,i)=double(trainX(:,i));
   end
end

trainxx=trainxx/2;
for i=1:1:784
   if((max(testX(:,i))-min(testX(:,i)))>0)
    testx(:,i)=double(testX(:,i))/double((max(testX(:,i))-min(testX(:,i))));
   else
       testx(:,i)=double(testX(:,i));
   end
end

testx=testx/2;
trainyy=transpose(trainY);
testy=transpose(testY);







%Training
for iteration=1:1:400%I see this from a site with 0.83 precesion  for iteration=1:1:15000%be nazaram felan yebaresh kon bebin natije chie badan tedado ziad kon
    Ih=randperm(3)
    for batch=1:1:3 % a for_loop for stochastic
    %here we are doing stochastic
    trainx=trainxx((Ih-1)*20000+1:Ih*20000,1:784);
    trainy=trainyy((Ih-1)*20000+1:Ih*20000,1);
    t=t2(1:10,(Ih-1)*20000+1:Ih*20000)
    
    
    %once again gradient decent on each batch
    delta_w=zeros(10,nhid); %Weigh changing matrix
    delta_v=zeros(nhid,784);%Weigh changing matrix
    %An epoch for all data 
        input_layer=double(trainx'); %take input(i)

        %calculate the output
        mid_calculation=v*input_layer;
        hidden_layer=(Sigmoid(mid_calculation,nhid));
        mid2_calculation=w*hidden_layer;

        output_layer=(Sigmoid(mid2_calculation,10)); %output is here
        delta_out=output_layer.*(ones(10,20000)-output_layer).*(t-output_layer);%delta_out hamed
    
        %compute delta Hidden Layer
        delta_hidden=w'*delta_out.*(hidden_layer.*(ones(nhid,20000)-hidden_layer));
        
        %compute weight change for w matrix
        delta_w=double((delta_out*hidden_layer'))/20000;%in va paeeni taghsim bar hezar
        %compute weight change for v matrix
        delta_v=double((delta_hidden*input_layer'))/20000;

     %now we must update our weights
  if((iteration>70)&&(iteration<100))  
   eta=0.01;
  end
   if(iteration>99)
          eta=0.001;
      
  else
    eta=0.2;
  end

     v=v+eta*delta_v+0.0001*prev;
     w=w+eta*delta_w+0.0001*prew;
     prev=delta_v;
     prew=delta_w;
     prew_deltaout=delta_out;
     prew_outputlayer=output_layer;
     premid2_calculation=mid2_calculation;
     prehidden_layer=hidden_layer;
     
 %cost_function
 for j=1:1:10
     Error_matrix(j,:)= (t(j,:)-output_layer(j,:));
  end
  Err=Error_matrix*transpose(Error_matrix);
  error_train(iteration)=sqrt(norm(Err));
  
  
  
  
  %classification
  accuracy_train2=0;
  for rt=1:1:20000
    [d,l]=max(output_layer(:,rt));
    label_train=l;
    accuracy_train1=label_train-trainy(rt)-1;
    if (accuracy_train1==0)
        accuracy_train2=accuracy_train2+1;
    end
  end
   accuracy_train3(iteration)=accuracy_train2/20000;
    
 
   
   
   
   %Now for test data
   input_layert=transpose(testx); %take input(i)
        %calculate the output
        mid_calculationt=v*input_layert;
        hidden_layert=(Sigmoid(mid_calculationt,nhid));
        mid2_calculationt=w*hidden_layert;
        output_layert=(Sigmoid(mid2_calculationt,10)); %output is here
   
        
        
  %cost_function
    for j=1:1:10
     Error_matrixt(j,:)= (ttest(j,:)-output_layert(j,:));
    end
  Errt=Error_matrixt*transpose(Error_matrixt);
  error_test(iteration)=sqrt(norm(Errt));
  
  
  
  %classification
  accuracy_test2=0;
  for rt=1:1:10000
    [dt,lt]=max(output_layert(:,rt));
    label_test=lt;
     predictedclass(rt)=lt;
    accuracy_test1=label_test-testy(rt)-1;
    if (accuracy_test1==0)
        accuracy_test2=accuracy_test2+1;
    end
  end
   accuracy_test3(iteration)=accuracy_test2/10000;
    end
end
irt=1:1:iteration;
figure(1)
plot(irt,error_train);
figure(2)
plot(irt,error_test);
figure(3)
plot(irt,accuracy_train3);
figure(4)
plot(irt,accuracy_test3);
[ conf_matrix  ] = conf_matrix( predictedclass,testy  );


