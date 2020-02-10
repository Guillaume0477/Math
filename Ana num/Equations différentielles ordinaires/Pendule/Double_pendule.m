clear variables;
close all;

% paramètres physiques
%double pendule 1
m11=0.1;               % masse de la bille (kg)
r11=0.1;             % rayon de la bille (m)
m21=0.1;               % masse de la bille (kg)
r21=0.1;             % rayon de la bille (m)
eta1=0.000018;        % coeff. de viscosité de l'air à 20°C (kg.m^-1.s^-1)
gamma11=6*pi*r11*eta1/m11;  % frottements (s^-1)
gamma21=6*pi*r21*eta1/m21;  % frottements (s^-1)
gr1=9.8;              % accéleration de la pesanteur (m.s^-2)
l11=2;                 % longueur du fil (m)
l21=2;                 % longueur du fil (m)
omega11=sqrt(gr1/l11);    % fréquence propre (rad.s^-1)
omega21=sqrt(gr1/l21);    % fréquence propre (rad.s^-1)
T011=2*pi/omega11;       % (pseudo-)période du pendule (s)
T021=2*pi/omega21;       % (pseudo-)période du pendule (s)

%double pendule 2
m12=0.1;               % masse de la bille (kg)
r12=0.1;             % rayon de la bille (m)
m22=0.1;               % masse de la bille (kg)
r22=0.1;             % rayon de la bille (m)
eta2=0.000018;        % coeff. de viscosité de l'air à 20°C (kg.m^-1.s^-1)
gamma12=6*pi*r12*eta2/m12;  % frottements (s^-1)
gamma22=6*pi*r22*eta2/m22;  % frottements (s^-1)
gr2=9.8;              % accéleration de la pesanteur (m.s^-2)
l12=2;                 % longueur du fil (m)
l22=2;                 % longueur du fil (m)
omega12=sqrt(gr2/l12);    % fréquence propre (rad.s^-1)
omega22=sqrt(gr2/l22);    % fréquence propre (rad.s^-1)
T012=2*pi/omega12;       % (pseudo-)période du pendule (s)
T022=2*pi/omega22;       % (pseudo-)période du pendule (s)

% conditions initiales
%double pendule 1
theta011=2*pi/3;   % angle initial (rad)
thetap011=0.1;       % vitesse angulaire initiale (rad/s)
theta021=2*pi/3;   % angle initial (rad)
thetap021=0+0.1;       % vitesse angulaire initiale (rad/s)

%double pendule 2
theta012=2*pi/3+0.01;   % angle initial (rad)
thetap012=0.1;       % vitesse angulaire initiale (rad/s)
theta022=2*pi/3+0.01;   % angle initial (rad)
thetap022=0+0.1;       % vitesse angulaire initiale (rad/s)

% autres paramètres
tmin=0;          % instant initial theta
tmax=4*T011;           % instant final
pas=0.001;           % pas de calcul
fprintf('Durée de l''expérience physique : %1.2f\n',tmax-tmin);

% fonctions Y'=F(Y) avec ici Y=(theta,z) et F(Y)=(f,g)
f1=@(t,theta1,theta2,z1,z2)(z1);
f2=@(t,theta1,theta2,z1,z2)(z2);
g1=@(t,theta1,theta2,z1,z2)-(gr1.*(2.*m11+m21).*sin(theta1)+m21.*(gr1.*sin(theta1-2.*theta2)+2.*(l21.*(z2.^2)+l11.*(z1.^2).*cos(theta1-theta2)).*sin(theta1-theta2)))./(2.*l11.*(m11+m21.*((sin(theta1-theta2)).^2)));
g2=@(t,theta1,theta2,z1,z2)sin(theta1-theta2).*(((m11+m21).*(l11.*(z1.^2)+gr1.*cos(theta1))+l21.*m21.*(z2.^2).*cos(theta1-theta2))./(l21.*(m11+m21.*(sin(theta1-theta2)).^2)));



% choix de la méthode
mod=2;   % 1 : simple double pendule % 2 : double double pendule 
            
%double pendule 1
% calculs numériques
[theta11,theta21,z11,z21,t11]=fct_RK4_4D(theta011,thetap011,theta021,thetap021,tmin,tmax,pas,f1,f2,g1,g2);
strTitle21='Runge-Kutta ordre 4';

%   énergies du pendule 1
Ec11=1/2*m11*(l11*z11).^2;    % énergie cinétique
Ep11=m11*gr1*l11*(1-cos(theta11));  % énergie potentielle
E11=Ec11+Ep11;     % énergie totale

%   énergies du pendule 2
Ec21=1/2*m21*(l21*z21).^2;    % énergie cinétique
Ep21=m21*gr1*l21*(1-cos(theta21));  % énergie potentielle
E21=Ec21+Ep21;     % énergie totale

%double pendule 2
% calculs numériques
[theta12,theta22,z12,z22,t22]=fct_RK4_4D(theta012,thetap012,theta022,thetap022,tmin,tmax,pas,f1,f2,g1,g2);
strTitle22='Runge-Kutta ordre 4';

%   énergies du pendule 1
Ec12=1/2*m12*(l12*z12).^2;    % énergie cinétique
Ep12=m12*gr2*l12*(1-cos(theta12));  % énergie potentielle
E12=Ec12+Ep12;     % énergie totale

%   énergies du pendule 2
Ec22=1/2*m22*(l22*z22).^2;    % énergie cinétique
Ep22=m22*gr2*l22*(1-cos(theta22));  % énergie potentielle
E22=Ec22+Ep22;     % énergie totale

% affichage des résultats

xmin=-l12-l22;xmax=l12+l22;
ymin=-l12-l22;ymax=l12+l22;

tic;
%affichage du pendule 1
for k=1:65:length(theta11)  % régler le pas de sorte à obtenir un mouvement réaliste
    % espace réel
    figure(1);
    if (mod==2)
        subplot(231);
    else 
        subplot(131);
    end
    
    x1=l11*sin(theta11(k));
    y1=-l11*cos(theta11(k));
    x2=l21*sin(theta21(k));
    y2=-l21*cos(theta21(k));
    plot([0,x1],[0,y1],'Marker','o','MarkerFacecolor','r','MarkerSize',10);
    hold on;
    plot([x1,x2],[y1,y2],'Marker','o','MarkerFacecolor','r','MarkerSize',10);
    hold off;
    axis('equal');
    axis(1.1*[xmin xmax ymin ymax]);
    grid 'on';
    t1=title(strTitle21);
    set(t1,'interpreter','latex');

    % espace des phases
    if mod==2
        subplot(232);
    else 
        subplot(132);
    end
    hold on;
    t3=title('Espace des phases');
    set(t3,'interpreter','latex');
    h=plot(theta11(k),z11(k),'ok');
    set(h,'MarkerSize',2);
    axis(1.1*[min(theta11),max(theta11),min(z11),max(z11)]);
    grid on;

    % énergies
    
    if mod==2
        subplot(233);
    else 
        subplot(133);
    end
       
    hold on;
    t2=title('Energies');
    set(t2,'interpreter','latex');
    h=plot(t11(k),Ec11(k),'ob-',t11(k),Ep11(k),'om-',t11(k),E11(k),'or-');
    set(h,'MarkerSize',2);
    axis(1.1*[tmin,tmax,min(Ec11),max(Ec11)]);

    %pause(0.000001);

    if mod==2
        subplot(234);
        x1=l12*sin(theta12(k));
        y1=-l12*cos(theta12(k));
        x2=l22*sin(theta22(k));
        y2=-l22*cos(theta22(k));
        plot([0,x1],[0,y1],'Marker','o','MarkerFacecolor','r','MarkerSize',10);
        hold on;
        plot([x1,x2],[y1,y2],'Marker','o','MarkerFacecolor','r','MarkerSize',10);
        hold off;
        axis('equal');
        axis(1.1*[xmin xmax ymin ymax]);
        grid 'on';
        t1=title(strTitle22);
        set(t1,'interpreter','latex');
    end
    
    % espace des phases
    if mod==2
        subplot(235);
        hold on;
        t3=title('Espace des phases');
        set(t3,'interpreter','latex');
        h=plot(theta12(k),z12(k),'ok');
        set(h,'MarkerSize',2);
        axis(1.1*[min(theta12),max(theta12),min(z12),max(z12)]);
        grid on;
    end
    
    
    % énergies
    if mod==2
        subplot(236);
        hold on;
        t2=title('Energies');
        set(t2,'interpreter','latex');
        h=plot(t22(k),Ec12(k),'ob-',t22(k),Ep12(k),'om-',t22(k),E12(k),'or-');
        set(h,'MarkerSize',2);
        axis(1.1*[tmin,tmax,min(Ec12),max(Ec12)]);
    end
end


cputime=toc;
fprintf('Durée de la simulation numérique : %1.2f\n',cputime);

% labels des axes de la figure du portrait de phase
    if mod==2
        subplot(232);
    else 
        subplot(132);
    end
l11=xlabel('$\theta(t)$','interpreter','latex');
set(l11,'FontSize',14);l21=ylabel('$\theta''(t)$','interpreter','latex');
set(l21,'FontSize',14);

% légende de la figure des énergies
    if mod==2
        subplot(233);
    else 
        subplot(133);
    end
g1=legend('Energie cinetique','Energie potentielle','Energie totale');
legend('boxoff');set(g1,'interpreter','latex');xlabel('temps','interpreter','latex');


if mod ==2 
    % labels des axes de la figure du portrait de phase
    subplot(235);
    l11=xlabel('$\theta(t)$','interpreter','latex');
    set(l11,'FontSize',14);l21=ylabel('$\theta''(t)$','interpreter','latex');
    set(l21,'FontSize',14);

    % légende de la figure des énergies
    subplot(236);
    g1=legend('Energie cinetique','Energie potentielle','Energie totale');
    legend('boxoff');set(g1,'interpreter','latex');xlabel('temps','interpreter','latex');
    
end

