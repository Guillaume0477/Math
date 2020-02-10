
%%% TP3 EXERCICE n°2:
%% 
figure(1)
n_cases=24;
cx=[0:n_cases];
cy=[0:n_cases];
[CX,CY]=meshgrid(cx,cy);
mesh(CX,CY,zeros(n_cases+1,n_cases+1))
axis([0 n_cases 0 n_cases])

figure(3)
n_cases=24;
cx=[0:n_cases];
cy=[0:n_cases];
[CX,CY]=meshgrid(cx,cy);
mesh(CX,CY,zeros(n_cases+1,n_cases+1))
axis([0 n_cases 0 n_cases])

M = zeros(n_cases,n_cases);
M_cible = zeros(n_cases,n_cases);

n_impacts = 537;

p = 0.2;

for impact = 1:n_impacts
    x = n_cases*rand();
    y = n_cases*rand();
    
    a = rand();
    if a < p
        x_cible = x*0.5+10;
        y_cible = y*0.5+6;
    else 
        x_cible = x;
        y_cible = y;
    end
    figure(1)
    hold on
    plot(x,y,'*r')
    figure(3)
    hold on
    plot(x_cible,y_cible,'*r')
    for ligne = 1:n_cases
        if ceil(y) == ligne
            for colonne = 1:n_cases
                if ceil(x) == colonne
                    M(colonne,ligne) = M(colonne,ligne) + 1;
                end
            end
        end
        if ceil(y_cible) == ligne
            for colonne = 1:n_cases
                if ceil(x_cible) == colonne
                    M_cible(colonne,ligne) = M(colonne,ligne) + 1;
                end
            end
        end
    end
end
M = M(:);
maxi=max(M);
hcases_impact = hist(M',0:maxi);
figure(2)
bar(0:maxi,hcases_impact/n_cases^2)



M_cible = M_cible(:);
maxi_cible=max(M_cible);
hcases_impact_cible = hist(M_cible',0:maxi_cible);
figure(4)
bar(0:maxi_cible,hcases_impact_cible/n_cases^2)


%%
nb_imp_moy = mean(M);
Poi = [];
for k = 0:maxi
    Poi = [Poi, exp(-nb_imp_moy)*nb_imp_moy^k*1/factorial(k)];
end
figure(2)
hold on
bar(0:maxi,Poi, 0.3,'r')

ecarttheo = sqrt(nb_imp_moy)
ecartempi = std (M)

nb_imp_moy_cible = mean(M_cible);
Poi_cible = [];
for k = 0:maxi_cible
    Poi_cible = [Poi_cible, exp(-nb_imp_moy_cible)*nb_imp_moy_cible^k*1/factorial(k)];
end
figure(4)
hold on
bar(0:maxi_cible,Poi_cible, 0.3,'r')























