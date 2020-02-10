clear all;close all;hold on; axis equal;

n=200;
y=randn(1,n);
x=y+2*randn(1,n);
X=x-mean(x);
Y=y-mean(y);
scatter(X,Y,20,'filled'); 
lgr=length(x);
t=-5:0.01:5;
theta=0:0.01:2*pi;
s=0;

for k=1:lgr
    s=s+(cos(theta)*X(k)+sin(theta)*Y(k)).^2;
end

theta_max=theta(find(s==max(s)));
theta_min=theta(find(s==min(s)));


D1=(sin(theta_max)/cos(theta_max))*t;
D2=(sin(theta_min)/cos(theta_min))*t;
figure(1);
plot(t,D1,'r',t,D2,'b');
axis ([-15,15,-15,15]);
axis equal;

N=[X;Y];
G=N*N';
[P,D]=eig(G);

D11=(P(2,1)/P(1,1))*t;
D22=(P(2,2)/P(1,2))*t;
figure(2);
hold on;
scatter(X,Y,20,'filled')
plot(t,D11,'b',t,D22,'r');
axis ([-15,15,-15,15])
axis equal;

theta2=atan(P(2,2)/P(1,2));
theta2
theta_max



figure (3)
hold on;
scatter(X,Y,20,'filled');
plot(t,D11,'b',t,D22,'r');
for a=0.05:0.05:0.25
    M=[a*sqrt(D(1,1))*cos(theta);a*sqrt(D(2,2))*sin(theta)];
    plot( M(2,:),(M(1,:)));
    axis ([-15,15,-15,15]);
    axis 'equal';
end


figure (4)
hold on;
scatter(X,Y,20,'filled');
plot(t,D1,'r',t,D2,'b');
for a=0.05:0.05:0.25
    M3=[a*sqrt(D(1,1))*cos(theta);a*sqrt(D(2,2))*sin(theta)];
    M2=(M3')*P;
    plot (M2(:,1),M2(:,2));
    axis ([-15,15,-15,15]);
    axis 'equal';
end

