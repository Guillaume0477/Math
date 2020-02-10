
clear all; close all;

%%% Question 1 %%%

Nb=10000;
%Création d'une variable suivant une loi normale
X= randn(1,Nb);
%Vecteur permettant le tracé du graphique
t=-100:200/Nb:100;
t=t(1:Nb);

hold on;

%Création de la nouvelle variable aléatoire Y = 0.3 X + 5
Y=0.3 * X + 5;

%Répertoire des résultats obtenus par ces deux variables sur des intervalles 
%de 0.2 pour X et 0.1 pour Y
hx=hist(X,-3:0.2:3);
hy = hist(Y,4.1:0.1:5.9);

%Tracé de chacune de la probabilité de chacune de ces variables
bar(-3:0.2:3,hx/Nb,'r');
bar(4.1:0.1:5.9,hy/Nb,0.6);

%légende et axes des tracés
xlabel('Valeurs prises par les lois')
ylabel('Probabilité d''apparition de chacune des valeurs')
legend('Variable initiale X', 'Variable Y = 0.3X+5')

%Calcul de l'espérance et de l'éccart type de chacune des variables
Eex=mean(X)
Eey=mean(Y)
Ecx=std(X)
Ecy=std(Y)

%%% Question 2 %%%

%Premier Test avec a = 0

N=30000;

%Coefficient multiplicateur de la variable X2
a=0;
hold on ;

%Création de deux variables aléatoires indépendantes suivant une loi normale
x1=randn(1,N);
x2=randn(1,N);

%Création de la variable Y comme combinaison linéaire des deux variables X1, X2
y=x1+a*x2;

%Calcul de la covariance de X1 ( On s'attend à avoir 1 car Y = X1 avec a = 0)
v1=cov(x1,y)

%Calcul du coefficient de corrélation (On s'attend à avoir 1 aussi car Y = X1
% avec a=0)
c1=corrcoef(x1,y) 

%%% WHYYYY ? %%%
figure(2)

N=30000;

%Coefficient multiplicateur de la variable X2
a=5;
hold on ;

%Création de deux variables aléatoires indépendantes suivant une loi normale
x1=randn(1,N);
x2=randn(1,N);

%Création de la variable Y comme combinaison linéaire des deux variables X1, X2
y=x1+a*x2;

%Tracé de la corrélation entre X2 et Y
plot(x2,y,'.r')
axis equal

%Calcul de la covariance de X1
v2=cov(x2,y)

%Calcul du coefficient de corrélation
c2=corrcoef(x2,y)

hold on; 

%Tracé de la droite d'équation y = a*X2 qui est la limite de la variable Y
plot(x2,a*x2,'b');

%Paramétrage des graphiques
xlabel('Valeurs prises par la variable X')
ylabel('Valeurs prises par la variable Y')
legend('y = f(x2)', 'y = a*x2')

%% Lors de la première partie de cette exercice, on a pu voir que les valeurs 
%% des espérances et des écarts types étaient bien prévisibles car pour X, on 
%% s'attendait à avoir une loi normale centrée réduite, soit une espérance de 0
%% et un écart type de 1 ; et pour la variable Y, chaque valeur a été "décalée"
%% de 5 soit l'espérance attendu est de 5 et chaque valeur ayant été "espacées" 
%% de 0.3, on en déduit alors que l'écart type attendu est bien de 0.3.
%% Ces attendus sont bien vérifiés par l'expérience.
%%
%% La deuxième partie traite essentiellement du coefficient de corrélation et 
%% la covariance entre deux variables aléatoires indépendantes suivant une loi
%% normale. 
%% Rappels : 
%% Si X1 et X2 sont deux variables aléatoires indépendantes alors : 
%%      cov(X1,X2) = 0
%%      V(X1 + X2) = V(X1) + V(X2)
%%      V(a*X1) = a^2 * V(X1)
%%      cov(X1, a*X1) = a V(X1)
%% Remarquons que lorsque a = 0, alors Y = X1 et dans ce cas on s'attend à ce 
%% que la covariance soit donc égale à 1 car il s'agit simplement de la 
%% variance de X1 qui est une loi normale centrée réduite, de même, le
%% coefficient de corrélation correspond à la covariance divisée par le produit
%% des écarts types ; soit on s'attend de nouveau à avoir 1 pour ce dernier.
%% Par contre, on peut constater en faisant varier le paramètre a et plus
%% particulièrement lorsque a tend vers l'infini que l'influence de la 
%% variable X1 est très négligeable, et la variable Y a donc pour limite 
%% simplement a*X2. Remarquons également que les deux variables étant 
%% indépendantes, on peut alors s'attendre à ce que la covariance de X2 et Y 
%% soit égale à la somme entre la covariance de X1 et X2 ; qui est nulle car 
%% les variables sont indépendantes ; et la variance de X2 multipliée par  
%% a, soit tout simplement a. En ce qui concerne le coefficient de 
%% corrélation et pour les mêmes raisons qui ont été évoquées précédemment,
%% on s'attend finalement à ce que celui ci vale 1. 