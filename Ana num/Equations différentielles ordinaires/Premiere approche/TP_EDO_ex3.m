
% CPE - 4ETI - 28/02/2017
% Module "Analyse Numérique"
% EDO-EDP
% Travaux pratiques
% Exercice 2 : résolution de l'éq. diff. de Lokta-Volterra (modèle
% proies-prédateurs : (x',y')=(f(t,x,y),g(t,x,y))) par les méthodes d'Euler
% et de Runge-Kutta d'ordre 2, visualisation des résultats sous forme de 
% trajectoire tangente au champ de vecteurs defini par (x,y)->(f(t,x,y),g(t,x,y)))

function TP_EDO_ex3()

tmin=0;
tmax=15;

% paramètres du modèle proies-prédateurs
alpha=1;  % taux de reproduction des proies
beta=0.5; % taux de mortalité des proies
gamma=2;  % taux de reproduction des prédateurs
delta=1;  % taux de mortalité des prédateurs

% conditions initiales
x0=2;     % proies
y0=0.5;   % predateurs

% second membre de l'équ. diff. (x',y')=(f(t,x,y),g(t,x,y))
f=@(t,x,y)(x*(alpha-beta*y));
g=@(t,x,y)(-y*(gamma-delta*x));

% Calcul des populations des proies et des prédateurs
h=0.01;   % pas temporel
% 1. méthode d'Euler
[xEuler,yEuler,t]=fct_Euler_2D(x0,y0,tmin,tmax,h,f,g);
% % 2. méthode RK2
% beta=1;
% [xRK2,yRK2,t]=???;


% Affichage des populations des proies et des prédateurs
% en fonction du temps
figure(1);hold on;
plot(t,xEuler,'r',t,yEuler,'b')






% affichage de la trajectoire proies-prédateurs (tangente au champ de
% vecteurs défini par la fonction (x,y)->(f(t,x,y),g(t,x,y))
figure(2);hold on;

% champ de vecteurs (x,y)->(f(t,x,y),g(t,x,y))
% N=40;
% ux=linspace(0,7,N);
% uy=linspace(0,7,N);
% [x,y]=meshgrid(ux,uy);       % grille de coordonnées (ux,uy)
% fxy=f(t,x,y);gxy=g(t,x,y);   % calcul du champ de vecteurs
% norme=(fxy.^2+gxy.^2).^0.5;  % normalisation des vecteurs
% fxy=fxy./norme;gxy=gxy./norme;
% quiver(x,y,fxy,gxy);         % affichage de fxy et gxy sous forme
%                              % de champ de vecteurs


% trajectoires proies-prédateurs
% 1. méthode de d'Euler



% 2a. méthode RK2 
figure(3);hold on;



% 2b. méthode RK2 et nouvelles conditions initiales







% Méthode d'Euler
function [x,y,t]=Euler_2D(x0,y0,tmin,tmax,pas,F,G)
    x=0;
    y=0;
    t=0;

% Méthode de Runge-Kutta d'ordre 2
function [x,y,t]=RK2_2D(x0,y0,tmin,tmax,pas,beta,F,G)
    x=0;
    y=0;
    t=0;
  