clear all;
close all;
hold on;

D=4;
N=2^16;
t=linspace(-D,D,N+1);
t=t(1:N);


%Fonction g
g=@(t,sig)(1/(sig*sqrt(2*pi)))*(exp(-t.^2/(2*sig^2)));

%Fonction g(t, sigma)
figure(1);
for k=1:5
    sig=2^(-2*k);
    g1=g(t,sig);
    plot(t,g1);
    title('Représentation de la fonction g(t)');
    legend('sigma=2**(-2)', 'sigma=2**(-4)', 'sigma=2**(-6)', 'sigma=2**(-8)', 'sigma=2**(-10)');
    axis([-1,1,0,30]);
    xlabel('t');
    ylabel('g(t,sigma)');
end

%Transformée de Fourier de g
figure(2);
for k=1:5
    sig=2^(-2*k);
    f=g(t,sig);
    [S,Tf]=TransFourier(f,t);
    hold on;
    plot(Tf,S);
    title('Transformée de Fourier de la fonction g');
    legend('sigma=2**(-2)', 'sigma=2**(-4)', 'sigma=2**(-6)', 'sigma=2**(-8)', 'sigma=2**(-10)');
    axis([-100,100,0,1.5]);
    xlabel('f');
    ylabel('G(f,sigma)');
end


%Fonction s
f0=5;
s=@(t)(exp(-pi*t.^2).*cos(2*pi*f0.*t));


%Calcul de la transformée de Fourier de s
s1=s(t);
[S1,Tf1]=TransFourier(s1,t);

figure(3);
%Représentation de s(t)
subplot(211);
plot(t,s1);
title('Fonction s');
axis([-4,4,-2,2]);
xlabel('t');
ylabel('s(t)');

%Représentation de S(f)
subplot(212);
plot(Tf1,S1);
title('Transformée de Fourier de s');
axis([-10,10,0,1]);
xlabel('f');
ylabel('S(f)');

%produit de convolution
figure(4);
for k=1:5
    sig=2^(-2*k);
    g1=g(t,sig);
    s1=s(t);    
    hold on;
    PC=conv(s1,g1,'same');
    plot(t,PC);
    title('Produit de convolution entre s et g');
    legend('sigma=2**(-2)', 'sigma=2**(-4)', 'sigma=2**(-6)', 'sigma=2**(-8)', 'sigma=2**(-10)');
    xlabel('t');
    ylabel('conv(s,g)');
    axis([-4,4,-8000,8000]);
end


figure(5);
for k=1:5
    sig=2^(-2*k);
    s1=s(t);
    diff=abs(s1-PC);
    hold on;
    semilogy(t,diff);
    title('Différence');
    xlabel('t');
    ylabel('abs(s1-PC)');
    legend('sigma=2**(-2)', 'sigma=2**(-4)', 'sigma=2**(-6)', 'sigma=2**(-8)', 'sigma=2**(-10)');
end


%Peigne de Dirac
T0=2^(-7);
p=peigne(T0,t);

%Transformée de Fourier du peigne de Dirac
[S,f]=TransFourier(p,t);


figure(6);
%Représentation du peigne de Dirac
subplot(211);
plot(t,p);
title('Peigne de Dirac');
xlabel('t');
ylabel('p(t)');

%Représentation de la transformée de Fourier du peigne
subplot(212);
plot(f,S);
title('Transformée de Fourier du peigne de Dirac');
xlabel('f');
ylabel('P(f)');


%Produit
s1=s(t);
pr=s1.*p;

%Transformée de Fourier du produit
[PR,f]=TransFourier(pr,t);

%Représentation
figure(7);
subplot(211);
plot(t,pr);
title('Produit de s(t) avec peigne(T0,t)');
xlabel('t');
ylabel('s(t)*peigne(T0,t)');

subplot(212);
plot(f,PR);
title('Transformée de Fourier du produit');
xlabel('f');
ylabel('PR(f)');


