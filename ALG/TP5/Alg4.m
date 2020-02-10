clear all; close all;

A=[1,0;1,3;1,6];
Y=[1;4;5];
M=A'*A;
M1=(M^(-1))*(A'*Y);



x=0:0.01:6;
y=M1(2,1).*x + M1(1,1)
M1(1,1)

figure(1)
hold on;
plot(0,1,'p')
plot(3,4,'p')
plot(6,5,'p')
plot(x,y,'b')

title('Représentation graphique de la droite y');


A2=[1,0,0;1,1,1;1,2,4;1,3,9];
Y2=[3;2;4;4];
M2=A2'*A2
C=(M2^(-1))*(A2'*Y2)


phi=C(1,1)*1+C(2,1).*x+C(3,1).*(x.^2)



figure(2)
hold on;
plot(0,3,'p')
plot(1,2,'p')
plot(2,4,'p')
plot(3,4,'p')
plot(x,phi,'b');
title('Représentation graphique de la fonction phi');

B=[1,1;1,2];
[Ct,C]=chol(B)
D=[1,1;0,1]^(-1);
A=[1,0;0,2]
E=D'*A*D



%Exercice 5
n=10;
A=zeros(n,n);
for i=1:n
    for j=1:n
        A(i,j)=n*(1-i)+j;
    end
end
    
M=zeros(n^2,n^2)
for i=2:n-1
    for j=2:n-1
        a=A(i,j);
        h=A(i-1,j);
        d=A(i,j+1);
        b=A(i+1,j);
%         g=A(i,j-1);
%         M(a,h)
%         M(a,h)=1;
%         M(a,d)=1;
%         M(a,b)=1;
%         M(a,g)=1;
    end
end
        
N=100
T=zeros(n^2)
for k=1:N
    
N=[10.*ones(n,1),zeros(n^2-n,1)];
N




