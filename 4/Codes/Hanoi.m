clear all
close all
clc
% Script to do Towers of Hanoi in Matlab
n=4;
R=-1*Inf(3^n,3^n);
for i=1:1:3^n
    v1=func_vect(i,n);  %initial state is v1
    for j=1:1:3^n
      v2=func_vect(j,n); % in a row v2 shows new state
        R(i,j)=value_func(v1,v2); %ye chizo deghat kon..in matrix R... baraye halati ke be surate pishfarz tuye khune nahayi biofte -inf mide..hesam ine ghalate dar vaghe bayad 100 bde...vali github injuri zade
    end
end

% now start learning Q
gama=0.8;
alfa=0.05;
final_state=3^n;
q=zeros(3^n,3^n);
q_previous=zeros(3^n,3^n);
for iteration=1:1:5
  
  for counter=1:1:3^n  %in each iteration we must consider all initial states
  flag=1;
  initial_state_per_each_iteration=randperm(3^n); %initialization
  state=initial_state_per_each_iteration(counter);
  counting_too_long=0;
      
      
      while(flag==1) %flag will be zero when we are in final state and next
        x=find( R(state,:)>-1);
        
        %Below we want to choose nex state according to epsilon greedy
        for c=1:1:length(x)
          w1(c)= q(state,x(c));           
        end
    [mid w2]=sort(w1); %w2 is the indices of sorted vector(w1)
    for c=1:1:length(w2)
        inices_sorted(c)=x(w2(c));
    end
    
    
    for c=1:1:length(w2)  %w3 is a weight vector
          w3(c)= (10*c);          
    end

    state_next_number=inices_sorted(randsample(length(w2),1,true,w3)); %next state we have choosed(new row of R)
     q(state,state_next_number)=(1-alfa)*q(state,state_next_number)+alfa*(R(state,state_next_number)+gama*(max(q(state_next_number,:)))); 
     state=state_next_number;
     counting_too_long=counting_too_long+1;
      
      
     if(state==final_state)
        flag=0;
     
     end
     if(counting_too_long>1000)
         flag=0;
     end
      
    w1=[];w2=[];w3=[];x=[];mid=[];  
     end
  end
 
end
 




%below we want to check our score and number of moves
Total_score=0;
score_each_play=zeros(1,3^n);
final_state=3^n;
number_of_moves=zeros(1,3^n);
for i=1:1:n^3
    state=i;
        while ((state~=final_state)||( number_of_moves(i)<100))
          [maxq , next_state]=max(q(state,:));
          state=next_state;
          Total_score=Total_score+maxq;
          score_each_play(i)=score_each_play(i)+maxq;
          number_of_moves(i)=number_of_moves(i)+1;
        end
end
avreged_score= Total_score/(3^n);
t=1:1:3^n;
figure(1);
plot(t,score_each_play);
figure(2)
plot(t,number_of_moves);
