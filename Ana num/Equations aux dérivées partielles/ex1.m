clear all; close all;

tmax=0.13;
h=0.05;
tau=0.00117;
L=1;
n=(L/h)-1;
m=round(tmax/tau);
r=tau/h^2;

M=full(gallery('tridiag',n,r,1-2*r,r));
F_tild=(zeros(n,1));
j=1:n;
F0=(-((j*h-L/2).^2)+0.25)';
F=F0;
for i=2:m
    F_new = M*F(:,i-1)+r*F_tild;
    F=[F,F_new];
end
F=[zeros(1,m);F;zeros(1,m)];
hold on

for i = 1:round(0.01/tau):m+1
    plot(0:h:L,F(:,i))
end
