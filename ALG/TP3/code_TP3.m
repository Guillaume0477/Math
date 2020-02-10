
figure(1)
hold on;
x=-5:0.01:10;
y1=(-3/4)*x+3;
y2=0*x;
plot(y1,x,'b')
axis([-5,5,-5,5])
axis 'equal'

plot(x,y2,'b')

D1=-2*x+3;
D2=(1/2)*x+3;

plot(D1,x,'r',D2,x,'r')


figure(2)
hold on
x=-2:0.01:2;
y1= 0.25*x.^2 +1; 
plot(x,y1,'r')
for m=0:0.1:2
    y2=(x*(m-1)+m*(2-m));
    plot(x,y2)
end



