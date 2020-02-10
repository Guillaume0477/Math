clear all; close all;

tmax=10;
h=0.02;
tau=0.005;
L=5;
n=(L/h)-1;
m=round(tmax/tau);
c=1;
r=((c*tau)/h)^2;
sigma=0.2;

M=full(gallery('tridiag',n,r,2*(1-r),r));
F_tild=(zeros(n,1));
j=1:n;
F0=(1/(sigma*sqrt(2*pi)))*(exp(-(((h*j-L/2).^2)./(2*sigma^2)))).*(sin(25*h*j*pi));
F1=(1/(sigma*sqrt(2*pi)))*(exp(-(((h*j-L/2).^2)./(2*sigma^2)))).*(sin(25*h*j*pi));
F=[F0;F1]';
for i=3:m
    F_new = (M*F(:,i-1))-F(:,i-2)+(r*F_tild);
    F=[F,F_new];
end
F=[zeros(1,m);F;zeros(1,m)];

for i = 1:round(0.1/tau):m
    plot(0:h:L,F(:,i))
    axis([0 5 -2 2])
    pause(0.05)
end
