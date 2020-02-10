clear all, close all;

N=100; %Nombre de^points utilisé pour calculer les TFD 

k=0:2*N-1;
i=complex(0,1);
g=cos(2*pi*k/N); % Calcul de la séquence g(k)

% affichage de la séquence g(k)
figure(1)
stem(k,g)
title(['Séquence g(k) avec 2N=',num2str(2*N),' points'])
xlabel('k')


x2=g(2:2:2*N); % x1 prend les termes d'indice pair de g(k)
x1=g(1:2:2*N); % x2 prend les termes d'indice impair de g(k)
x=x1+i.*x2; % Calcul de la séquence x(k)

X=fft(x,N); % Calcul de la fft-N-points de x
Xconj=conj([X(1),fliplr(X(2:N))]); % Calcul de la fft-N-points de x* avec la méthode de la question 1

% Calcul de X1 et X2 avec les formules de la question 2
X1=(1/2)*(X+Xconj);
X2=(1/(2*i))*(X-Xconj);

% Calcul de G avec les formules de la question 3
n=0:N-1;
G1=X1+X2.*exp(-i*pi*n/N);
G2=X1-X2.*exp(-i*pi*n/N);
G=[G1,G2];

Gn=fft(g,2*N); % Calcul direct de G

n=0:2*N-1;
figure(2)
% Affichage de la partie réelle des TFD de g avec les deux méthodes
subplot(121)
hold on
stem(n,real(G),'r','linewidth',2)
stem(n,real(Gn),'b')
title(['Parties réelles de la tfd N=',num2str(2*N),' points avec les deux méthodes'])
legend('Par la méthode de la question 3', 'Par calcul direct')
xlabel('n')

% Affichage de la partie imaginaire des TFD de g avec les deux méthodes
subplot(122)
hold on
stem(n,imag(G),'r','linewidth',2)
stem(n,imag(Gn),'b')
title(['Parties imaginaires de la tfd N=',num2str(2*N),' points avec les deux méthodes'])
legend('Par la méthode de la question 3', 'Par calcul direct')
xlabel('n')