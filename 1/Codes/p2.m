%%
%Problem2_Training
load train_images_9;
load train_images_1;
eta2=1;
landa=10^(10);
decp2=0;
yy=0;
fout=0;
b=0;
w=sqrt(0.1).*randn(784,1);
j1=train_images_1;
j9=-1*train_images_9;
jeq=[j1 j9];
for iteration=1:1:50
    p=randperm(6000);
for i=1:1:6000
   eta=eta2/((iteration)*5000000000000);
    r=p(i);
    if(r<3001)
    deci=1-dot(jeq(:,r),w)+b;
    if(deci>0)
        p2flag=1;
    else
        p2flag=0;
    end
    y=1;
    end
    if(r>3000)
        deci=1-dot(jeq(:,r),w)-b;
        y=-1;
        if(deci>0)
            p2flag=1;
        else
            p2flag=0;
        end
    
    end
    if(p2flag==0)
        w=w-eta*2*landa*w;
        b=b;
    else
        w=w-eta*2*landa*w+(eta/6000)*(jeq(:,r));
        b=b-eta*y;
    end
    
 end
    for cp2=1:1:3000
        decp2=1-1*dot(jeq(:,cp2),w)+b;
        if (decp2>0)
            yy=decp2;
        else
            yy=0;
        end
        fout=fout+landa*norm(w)*norm(w)+(1/6000)*yy;
    end
    for cp2=3001:1:6000
        decp2=1-1*dot(jeq(:,cp2),w)-b;
        if (decp2>0)
            yy=decp2;
        else
            yy=0;
        end
        fout=fout+landa*norm(w)*norm(w)+(1/6000)*yy;
    end
fp2(iteration)=fout;    
fout=0;
end
ll=1:1:50;
figure(7)
plot(ll,fp2);

%%
%Problem2_Testing
load test_images_1;
load test_images_9;
E1=test_images_1;
E9=-1*test_images_9;
Eeq=[E1 E9];
fEout=0;
for cp2=1:1:2000
        decp2=1-1*dot(Eeq(:,cp2),w)+b;
        if (decp2>0)
            yy=decp2;
        else
            yy=0;
        end
        fout=fout+landa*norm(w)*norm(w)+(1/6000)*yy;
   end
    for cp2=2001:1:4000
        decp2=1-1*dot(Eeq(:,cp2),w)-b;
        if (decp2>0)
            yy=decp2;
        else
            yy=0;
        end
        fEout=fEout+landa*norm(w)*norm(w)+(1/6000)*yy;
    end
%%    