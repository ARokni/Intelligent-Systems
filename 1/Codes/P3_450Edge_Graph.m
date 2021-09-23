clear all
close all
clc

tz = readtable('54.txt');
tz2=table2array(tz(:,2));
tz3=table2array(tz(:,3));
%rt2=str2double(tz2);
%rt3=str2double(tz3);
count=0;
tzt=[tz2 tz3];
colsize=max(max(tz2),max(tz3));
edge=length(tz2);
%w1=colsize*10;
R=randi([1 260],colsize,100);
for i=1:1:100
    weight(i)=edge*10;
    for i2=1:1:edge %column
      %  for i=1:1:colsize %row
            if(R(tzt(i2,1),i)==R(tzt(i2,2),i));
                weight(i)=weight(i)-10;
            end
    end
end


for i=1:1:100
   weight2(i)=edge;
    for i2=1:1:260
       ss=length(find(R(:,i)==i2));
       weight2(i)=weight2(i)-2;
    end
end
fit=weight.*weight2;
 %reproduce
 for it3=101:2:4999
     x=randsample(it3-1,1,true,fit);
    par1=R(:,x);
    y=randsample(it3-1,1,true,fit);
    par2=R(:,y);
    r3=randi([1 450],1,1);
        for c3=1:1:450
            if(c3<r3+1)
                child1(c3)=par1(c3);
                child2(c3)=par2(c3);
            else
                child1(c3)=par2(c3);
                child2(c3)=par1(c3);
            end
        
        end
    weightrand=[1 10];
    perm3=randsample(2,1,true,weightrand);
    rperm=randi([1 359],1,1);
    if(perm3==1)
        swap=child1(rperm);
        child1(rperm)=child1(rperm+1);
        child1(rperm+1)=swap;
    end
    %weighting again
     weight(it3)=edge*10;
    for i2=1:1:edge %column
      %  for i=1:1:colsize %row
            if(child1(tzt(i2,1))==child1(tzt(i2,2)));
                weight(it3)=weight(it3)-10;
            end
    end
    weight2(it3)=edge;
    for i2=1:1:260
       ss=length(find(child1==i2));
       weight2(it3)=weight2(it3)-2;
    end
    fit(it3)=weight(it3)*weight2(it3);
    bestcost(it3)=max(fit);
    %child2
     weight(it3+1)=edge*10;
    for i2=1:1:edge %column
      %  for i=1:1:colsize %row
            if(child2(tzt(i2,1))==child2(tzt(i2,2)));
                weight(it3+1)=weight(it3+1)-10;
            end
    end
    weight2(it3+1)=edge;
    for i2=1:1:260
       ss=length(find(child2==i2));
       weight2(it3+1)=weight2(it3+1)-2;
    end
    fit(it3+1)=weight(it3)*weight2(it3);
    bestcost(it3+1)=max(fit);
    R(:,it3)=child1;
    R(:,it3+1)=child2;
 end
 t=1:1:5000;
 plot(t,fit);
 plot(t,bestcost);
 h=find(fit>5700);