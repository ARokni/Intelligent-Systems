%%Problem3
%Population 
R=randi([1 6],11,20);
%fitness

for i3=1:1:20
   i=200;
    if(R(1,i3)==R(2,i3)) i=i-10; end
    if(R(1,i3)==R(4,i3)) i=i-10; end
    if(R(1,i3)==R(7,i3)) i=i-10; end
    if(R(1,i3)==R(9,i3)) i=i-10; end
    if(R(2,i3)==R(3,i3)) i=i-10; end
    if(R(2,i3)==R(6,i3)) i=i-10; end
    if(R(2,i3)==R(8,i3)) i=i-10; end
    if(R(3,i3)==R(5,i3)) i=i-10; end
    if(R(3,i3)==R(7,i3)) i=i-10; end
    if(R(3,i3)==R(10,i3)) i=i-10; end
    if(R(4,i3)==R(5,i3)) i=i-10; end
    if(R(4,i3)==R(6,i3)) i=i-10; end
    if(R(4,i3)==R(10,i3)) i=i-10; end
    if(R(5,i3)==R(8,i3)) i=i-10; end
    if(R(5,i3)==R(9,i3)) i=i-10; end
    if(R(6,i3)==R(11,i3)) i=i-10; end
    if(R(7,i3)==R(11,i3)) i=i-10; end
    if(R(8,i3)==R(11,i3)) i=i-10; end
    if(R(9,i3)==R(11,i3)) i=i-10; end
    if(R(10,i3)==R(11,i3)) i=i-10; end
    %minimun color
    s3=28;
    ss=length(find(R(:,i3)==1));
    if(ss>0) s3=s3-2; end
    ss=length(find(R(:,i3)==2));
    if(ss>0) s3=s3-2; end
    ss=length(find(R(:,i3)==3));
    if(ss>0) s3=s3-2; end
    ss=length(find(R(:,i3)==4));
    if(ss>0) s3=s3-2; end
    ss=length(find(R(:,i3)==5));
    if(ss>0) s3=s3-2; end
    ss=length(find(R(:,i3)==6));
    if(ss>0) s3=s3-2; end
    fit3(i3)=s3;
   % s3=s3/1.5;
fit(i3)=i*s3;
fit2(i3)=i;

end
for it3=21:2:9999
    %reproduce
    x=randsample(it3-1,1,true,fit);
    par1=R(:,x);
    y=randsample(it3-1,1,true,fit);
    par2=R(:,y);
    r3=randi([1 11],1,1);
        for c3=1:1:11
            if(c3<r3+1)
                child1(c3)=par1(c3);
                child2(c3)=par2(c3);
            else
                child1(c3)=par2(c3);
                child2(c3)=par1(c3);
            end
        
        end
    weight=[1 10];
    perm3=randsample(2,1,true,weight);
    rperm=randi([1 10],1,1);
    if(perm3==1)
        swap=child1(rperm);
        child1(rperm)=child1(rperm+1);
        child1(rperm+1)=swap;
    end
    
    
    
 i=200;
    if(child1(1)==child1(2)) i=i-10; end
    if(child1(1)==child1(4)) i=i-10; end
    if(child1(1)==child1(7)) i=i-10; end
    if(child1(1)==child1(9)) i=i-10; end
    if(child1(2)==child1(3)) i=i-10; end
    if(child1(2)==child1(6)) i=i-10; end
    if(child1(2)==child1(8)) i=i-10; end
    if(child1(3)==child1(5)) i=i-10; end
    if(child1(3)==child1(7)) i=i-10; end
    if(child1(3)==child1(10)) i=i-10; end
    if(child1(4)==child1(5)) i=i-10; end
    if(child1(4)==child1(6)) i=i-10; end
    if(child1(4)==child1(10)) i=i-10; end
    if(child1(5)==child1(8)) i=i-10; end
    if(child1(5)==child1(9)) i=i-10; end
    if(child1(6)==child1(11)) i=i-10; end
    if(child1(7)==child1(11)) i=i-10; end
    if(child1(8)==child1(11)) i=i-10; end
    if(child1(9)==child1(11)) i=i-10; end
    if(child1(10)==child1(11)) i=i-10; end
     s3=28;
    ss=length(find(child1==1));
    if(ss>0) s3=s3-2; end
    ss=length(find(child1==2));
    if(ss>0) s3=s3-2; end
    ss=length(find(child1==3));
    if(ss>0) s3=s3-2; end
    ss=length(find(child1==4));
    if(ss>0) s3=s3-2; end
    ss=length(find(child1==5));
    if(ss>0) s3=s3-2; end
    ss=length(find(child1==6));
    if(ss>0) s3=s3-2; end
    fit3(it3)=s3;
   % s3=s3/1.5;
    fit(it3)=i*s3;
    fit2(it3)=i;
    bestcost(it3)=max(fit);
    ro(it3)=i;
    ro2(it3)=s3;
    % fit(it3)=i;
    
  i=200;
    if(child2(1)==child2(2)) i=i-10; end
    if(child2(1)==child2(4)) i=i-10; end
    if(child2(1)==child2(7)) i=i-10; end
    if(child2(1)==child2(9)) i=i-10; end
    if(child2(2)==child2(3)) i=i-10; end
    if(child2(2)==child2(6)) i=i-10; end
    if(child2(2)==child2(8)) i=i-10; end
    if(child2(3)==child2(5)) i=i-10; end
    if(child2(3)==child2(7)) i=i-10; end
    if(child2(3)==child2(10)) i=i-10; end
    if(child2(4)==child2(5)) i=i-10; end
    if(child2(4)==child2(6)) i=i-10; end
    if(child2(4)==child2(10)) i=i-10; end
    if(child2(5)==child2(8)) i=i-10; end
    if(child2(5)==child2(9)) i=i-10; end
    if(child2(6)==child2(11)) i=i-10; end
    if(child2(7)==child2(11)) i=i-10; end
    if(child2(8)==child2(11)) i=i-10; end
    if(child2(9)==child2(11)) i=i-10; end
    if(child2(10)==child2(11)) i=i-10; end
      s3=28;
    ss=length(find(child2==1));
    if(ss>0) s3=s3-2; end
    ss=length(find(child2==2));
    if(ss>0) s3=s3-2; end
    ss=length(find(child2==3));
    if(ss>0) s3=s3-2; end
    ss=length(find(child2==4));
    if(ss>0) s3=s3-2; end
    ss=length(find(child2==5));
    if(ss>0) s3=s3-2; end
    ss=length(find(child2==6));
    if(ss>0) s3=s3-2; end
    fit3(it3)=s3;
   % s3=s3/1.5;
   ro(it3+1)=i;
   ro2(it3+1)=s3;
   fit(it3+1)=i*s3;
   fit2(it3+1)=i;
  R(:,it3)=child1;
  R(:,it3+1)=child2;
bestcost(it3+1)=max(fit);
end
I=find((fit>4.5)&(fit2>19));
I2=find(fit2>19);
I3=find(fit3<5);
J=find(fit>3200);
t3=1:1:10000;

plot(t3,fit);
figure(10);
plot(t3,bestcost);
figure(11)
plot(t3,ro);
figure(12)
plot(t3,ro2);