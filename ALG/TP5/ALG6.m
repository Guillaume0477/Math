%ex6


A=[2,3;4,6];


expm(A) ;% =Exp(A)

ex=zeros(2,2);
for k=0:100
    ex=ex+(1/factorial(k))*A^k;
end

ex
expm(A) %ok


B=[5,9;13,18]
expm(A)*expm(B)
expm(A*B)  % ok differant


figure(1)
x=0:0.01:1;
y=0:0.01:1;
u=x.^2-y.^2;
v=2.*x.*y;
quiver(x,y,u,v)

M=[1,-1;1,1]; %=2/srt(2)*[sqrt(2)/2,sqrt(2)/2;sqrt(2)/2,sqrt(2)/2,]

X0=[5,8];

t=0:0.01:10;
[x1,y1]=expm(t*M)*X0;

plot(y1,x1)












