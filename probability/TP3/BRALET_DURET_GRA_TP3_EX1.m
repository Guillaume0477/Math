
%%% TP_N°3_BRALET_DURET_EXERCICE_N°1 :

%% Code principal :

p=0.7;
n=50;
Y=[];
N=500;

for traj=1:1:N % boucle qui crée chaque trajectoire
    x=[0];
    y=[0];

    for k=1:1:n % boucle des déplacements de la particule
        nb=rand();
        if nb<= p % la particule va à droite
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

% affichage des espérances et écarts types empiriques et théoriques
espY=mean(Y)
esptheo=(n)*(1-p)
ecartY=std(Y)
ecarttheo=sqrt((n)*p*(1-p))


%% Commentaire :
%
% L'exercice 1 intitulé "marche au hasard et simulation de la loi binomiale" met en avant un problème concrêt qui est une particule qui a une probabilité p (un nombre fixé entre 0 et 1) d'aller sur la droite et une probabilité 1-p d'aller en haut.
%
% On modélise donc numériquement le chemin de la particule pour 50 déplacements avec les probabilités énoncées ci dessus et nous traçons son chemin. 
%
% On fait la même chose avec 100 particules et on peut remarquer que tous les chemins se regroupent dans une zone qui varie en fonction de n (les chemin vont plus ou moins loin si n est plus ou moins grand) et de p (les particules ont tendance à aller plus ou moins en haut selon si p est plus ou moins grand)
%
% On peut aussi remarquer que la hauteur de la particule au bout de n déplacements représente une loi binomiale de paramètre n et 1-p; en effet la hauteur représente le nombre de fois où la particule est montée autrement dit le nombre de succès obtenu avec une probabilité de 1-p au cours de n expérience.
%
% On peut ainsi tracer l'histogramme de la loi binomiale mise en évidence(inversé pour que celui-ci soit aligner avec les positions finales des particules).
%
% De plus en calculant l'espérance et l'écart type de l'expérience empirique on retrouve bien approximativement les valeurs théoriques de la loi binomiale. 

%%




