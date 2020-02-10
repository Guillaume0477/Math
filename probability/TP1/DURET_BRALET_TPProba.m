clear variables;
close all;

%Nombre d'experiences
N = 1000;

%Probabilites que au moins deux dates soient les memes
Proba_meme = [];
%Probabilite que toutes les dates soient distinctes
Proba_theo = [];
%Variable permettant de determiner si deux dates sont identiques
identique = 0;

%%Mise en oeuvre de l'experience

%Choix du nombre de personnes dans l'assemblee
for nombre = 10:10:80
    
    %Nombre d'experiences ou deux dates ont ete identiques et distincts
    Meme_date = 0;
    Distincts =0;
    
    %Deroulement des N experiences
    for k = 1:N
        %Choix des dates de naissance
        Dates = randi([1,365],1,nombre);
        %Repertoire et denombrement des dates de naissance
        h = hist(Dates,365);
        
        %Recherche de deux dates identique
        for i = 1:365
            if h(i) > 1 
                identique = 1;
                break
            end
        end
        
        %Mise à jour du nombre d'experience ou les dates sont identiques ou
        %non
        if identique == 1
            Meme_date = Meme_date+1;
            identique = 0;
        else 
            Distincts = Distincts +1;
        end
    end
    
    %liste des probabilites empiriques que deux dates au moins soient identiques en
    %fonction du nombre de personnes dans l'assemblee
    Proba_meme = [Proba_meme,Meme_date/N];
    
    %liste des probabilites theoriques que deux dates au moins soient identiques en
    %fonction du nombre de personnes dans l'assemblee
    Proba_theo= [Proba_theo, 1-nchoosek(365,nombre)*factorial(nombre)/(365^nombre)];
end

%Liste du nombre de personnes dans l'assemblée
X = 10:10:80;

%Trace des probabilites empirique et theoriques
figure(1);

plot(X,Proba_meme,X,Proba_theo)
legend('Probabilite empirique', 'Probabilite theorique')



