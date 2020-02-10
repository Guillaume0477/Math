
%%% TP_N�3_BRALET_DURET_EXERCICE_N�1 :

%% Code principal :

p=0.7;
n=50;
Y=[];
N=500;

for traj=1:1:N % boucle qui cr�e chaque trajectoire
    x=[0];
    y=[0];

    for k=1:1:n % boucle des d�placements de la particule
        nb=rand();
        if nb<= p % la particule va � droite
            l=length(x);
            x=[x,(x(l)+1)]; % mise en tableau des valeurs de x
            y=[y,y(l)]; % mise en tableau des valeurs de y
        else % la particule va en haut
            l=length(y);
            y=[y,(y(l)+1)]; % mise en tableau des valeurs de y
            x=[x,x(l)]; % mise en tableau des valeurs de x

        end
    figure(2)
    hold on;
    plot(x,y)
    axis([0 50 0 50])
    if traj == 1 % permet d'afficher une seule trajectoire
        figure(1)
        plot(x,y)
        axis([0 50 0 50 ])
        title('Trajectoire d''une particule')
    end
    end
    Y=[Y,y(l+1)]; % mise en tableau des hauteurs finales des particules
end

Y2= 50*ones(1,N)-Y; % permet d'aligner l'histogramme avec les trajectoires
figure(2)
hold on
hempirique=hist(Y2,0:n);

bar(0:n,hempirique*n*2/(N));
title('Trajectoires de n particules et histogramme ')

% affichage des esp�rances et �carts types empiriques et th�oriques
espY=mean(Y)
esptheo=(n)*(1-p)
ecartY=std(Y)
ecarttheo=sqrt((n)*p*(1-p))


%% Commentaire :
%
% L'exercice 1 intitul� "marche au hasard et simulation de la loi binomiale" met en avant un probl�me concr�t qui est une particule qui a une probabilit� p (un nombre fix� entre 0 et 1) d'aller sur la droite et une probabilit� 1-p d'aller en haut.
%
% On mod�lise donc num�riquement le chemin de la particule pour 50 d�placements avec les probabilit�s �nonc�es ci dessus et nous tra�ons son chemin. 
%
% On fait la m�me chose avec 100 particules et on peut remarquer que tous les chemins se regroupent dans une zone qui varie en fonction de n (les chemin vont plus ou moins loin si n est plus ou moins grand) et de p (les particules ont tendance � aller plus ou moins en haut selon si p est plus ou moins grand)
%
% On peut aussi remarquer que la hauteur de la particule au bout de n d�placements repr�sente une loi binomiale de param�tre n et 1-p; en effet la hauteur repr�sente le nombre de fois o� la particule est mont�e autrement dit le nombre de succ�s obtenu avec une probabilit� de 1-p au cours de n exp�rience.
%
% On peut ainsi tracer l'histogramme de la loi binomiale mise en �vidence(invers� pour que celui-ci soit aligner avec les positions finales des particules).
%
% De plus en calculant l'esp�rance et l'�cart type de l'exp�rience empirique on retrouve bien approximativement les valeurs th�oriques de la loi binomiale. 

%%




