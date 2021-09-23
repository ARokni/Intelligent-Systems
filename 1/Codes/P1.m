clear all
close all
clc
%%
%Problem1.drawing
x=-5:0.01:5;
f=-(10*(x.^3)+60*x-2*(x.^6)-3*(x.^4)-12*(x.^2));
figure(1)
plot(x,f);
%%
%Problem1.Backtrcking Line Search
xk=-7;
for i=0:1:100
    flag=1;
    a=1;
    p=0.2;
    c=0.0001;
     while flag
        df=-1*(30*xk^2+60-12*xk^5-12*xk^3-24*xk);
        pk=((30*xk^2+60-12*xk^5-12*xk^3-24*xk))/(-1*(60*xk-60*xk^4-36*xk^2-24));
        x=xk+a*pk;
        f1=-1*(10*x^3+60*x-2*x^6-3*x^4-12*x^2);
        %f1=(f(xk+a*Pk(xk)));
        f2=-1*(10*xk^3+60*xk-2*xk^6-3*xk^4-12*xk^2)+c*a*pk*df
        % f2=(f(xk)+c*a*Pk(xk)*df(xk));
         condition= (f1<=f2);
         if condition 
            flag=0;
            xk=xk+a*pk;
         else
            a=p*a;
         end
     end
r(i+1)=-1*(10*xk^3+60*xk-2*x^6-3*xk^4-12*xk^2);
u(i+1)=xk;
s(i+1)=a;
end
figure(2)
t=0:1:100;
plot(t,r);
figure(3)
plot(t,u);
figure(4)
plot(t,s);
%%