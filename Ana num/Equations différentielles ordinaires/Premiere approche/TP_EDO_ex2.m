clear variables;
close all;

tmin=0;tmax=1;
f=@(t,y)((t.^2).*exp(t)-y.*(3*t.^2-1));
yExact=@(t)(exp(t).*(1-4*exp(-t.^3))/3);
    
% condition initiale
y0=-1;

%% question 1
% 1. méthode d'Euler (h=0.1)
h=0.1;
[yEuler1,t1]=fct_Euler(y0,tmin,tmax,h,f);
eps1=abs(yEuler1-yExact(t1));   % erreur


% 2. méthode d'Euler (h=0.05)
h=0.05;
[yEuler2,t2]=fct_Euler(y0,tmin,tmax,h,f);
eps2=abs(yEuler2-yExact(t2));   % erreur


%% question 2 : méthode RK2 (h=0.1 et beta=1)
h=0.1;beta=1;
[yRK,t3]=fct_RK2(y0,tmin,tmax,h,beta,f);
eps3=abs(yRK-yExact(t3));       % erreur

figure(1)
hold on
plot(t1,yExact(t1),'g-')
plot(t1,yEuler1,'r*-')
plot(t2,yEuler2,'b*-')
plot(t3,yRK,'m*-')
legend('Exacte','Euler(h=0.1)','Euler(h=0.05)','RK2')

figure(2)
hold on
plot(t1,eps1,'r*-');
plot(t2,eps2,'b*-');
plot(t3,eps3,'m*-');
legend('Euler(h=0.1)','Euler(h=0.05)','RK2')

%% question 3 : méthode RK4 

hmin=0.02; hmax=0.1; hpas=0.01;
maxerr=zeros(1,9);
h=hmin:hpas:hmax;
for k=1:length(h)
    [yRK4,t4]=fct_RK4(y0,tmin,tmax,h(k),f);
    eps4=abs(yRK4-yExact(t4));
    maxerr(k)=max(eps4);
end
figure(3)
hold on
plot(h,maxerr,'b*')
rms=zeros(1,9);

for n=1:9
    p=polyfit(h,maxerr,n);
    pval=polyval(p,h);
    rms(n)=sqrt(sum((maxerr-pval).^2)/9);
    plot(h,pval)
end
figure(4)
plot(1:9,rms)
