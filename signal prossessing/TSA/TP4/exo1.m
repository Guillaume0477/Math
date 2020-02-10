clear variables;
close all;

%%
%2.1 Signal et Contexte
[s,Fs]= audioread('ProtestMonoBruit.wav');
%Creation vecteur de temps 
t=0:1/Fs:(length(s)-1)/Fs;

%Reduction du vecteur de temps et du signal a t allant de 60s a 70s
t_int=t(60*Fs:70*Fs);
s_int=s(60*Fs:70*Fs);

%Affichage du signal
figure(1);
hold on;
plot(t,s)
plot(t_int,s_int,'r')
axis([0 max(t) min(s) max(s)]);
title 'Signal';
xlabel 't (en s)';
ylabel('s(t)')
legend ('Signal de base','Signal reduit')

%%
%2.2 Estimation de la fonction d autocorrelation
K=200;
[R,lags]=xcorr(s_int,K,'biased'); %Calcul des vecteurs d autocorrelation
constante = zeros(1,length(lags))+0.0003363;

%Affichage 
figure(2);
hold on
plot(lags,R);
plot(lags,constante)
title ('Fonction d autocorrelation');
xlabel 'retard k';
ylabel '\gamma_S[k]';


%%
%2.3 Identification du modele AR(M)
M=20;
%Calcul de la matrice symetrique des Gamma_S
gamma_s=toeplitz(R(201:201+M));

%Vecteur colonne [1 0 0 ...0]
Resultat=eye(M+1,1);
%Pseudo-Inversion de la matrice des Gamma_S 
gamma_s_inv=pinv(gamma_s);

%Calcul du vecteur solution des PHI
phi=gamma_s_inv*Resultat;
%calcul du vecteur solution des h
h=-(phi(2:M+1))./phi(1);


%%
%2.4 Prediction lineaire
%Calcul de la prediction s_n_chapeau (causal)
N=length(s_int);
s_chapeau = zeros(1,N);
for n = M+1:N ;
    for k = 1:M;
        s_chapeau(n) = s_chapeau(n) + h(k)*s_int(n-k);
    end
end

%Affichage
figure(3)
subplot(211)
%Affichage du signal obtenu et du signal de base entre 60s et 70s
hold on
plot(t_int,s_chapeau,'m') 
plot(t_int,s_int,'g')
axis([t(62.05*Fs) t(62.07*Fs) min(s_int) max(s_int)]);
title 'Superposition des signaux de base et reconstitue'
xlabel 't (en s)'
ylabel 's(t)'
legend ('prediction de s','s')
%affichage de l erreur de prediction
subplot(212)
%Calcul de l erreur de prediction
eps=abs(s_chapeau-s_int');
plot(t_int,eps)
title 'erreur de prediction'
xlabel 't (en s)'
ylabel '\epsilon(t)'
axis([min(t_int) max(t_int) min(abs(eps)) max(abs(eps))]);


%%
%2.5 Restauration par seuillage
seuil=0.8;
Bin = s_int;
%Boucle for pour trouver les indices de s_k a modifier dans le signal de base
for i = 1:length(t_int)
   if eps(i) > seuil
       Bin(i) = median([s_int(i-10:i-1);s_int(i+1:i+10)]);
       
   end      
end

%Affichage du signal restauré superposé au signal d'origine
figure(4)
hold on
plot(t_int,s_int)
plot(t_int,Bin)


axis([min(t_int) max(t_int) min(s_int) max(s_int)]);
title (['Signaux de base et restaure par prediction causale avec un seuil =',num2str(seuil)])
xlabel 't (en s)'
ylabel 's(t)'
legend ('s','s restaure causal')
%sound(Bin,Fs)


%%
%2.6 Restauration par prédiction causale/anticausale
%Calcul de la prediction s_n_chapeau (anticausal)
s_chapeau2 = zeros(1,N);
for n = 1:N-M;
    for k = 1:M;
        s_chapeau2(n) = s_chapeau2(n) + h(k)*s_int(n+k);
    end
end

%Boucle for pour trouver les indices de s_k a modifier dans le signal de base
seuil2 = 0.5;
eps2 = abs(s_chapeau2-s_int');
Bin2 = s_int;
for i = 1:length(s_int)
   if eps2(i) > seuil2;
       if eps(i) > seuil2;
            L2 = zeros(1,M+1);
            L3 = zeros(1,M+1);
            for k = -10:1:10;
                L2(k+11) = Bin(i+k);
                L3(k+11) = Bin2(i+k);
            end
       med2 = median(L2);
       med3 = median(L3);
       %Modification du signal de base
       Bin2(i) = (med2(1)+med3(1))/2;
       end
   end      
end

%Affichage
figure(5)
hold on
plot(t_int,Bin)
plot(t_int,Bin2)
title (['Signaux de base et restaure par prediction causale/anticausale avec un seuil =',num2str(seuil2)])
xlabel 't (en s)'
ylabel 's(t)'
legend ('s restaure causal','s restaure causal/anticausal')
axis([min(t_int) max(t_int) min(s_int) max(s_int)]);
