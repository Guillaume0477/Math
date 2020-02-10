clear all; close all;

%% Parametres

t_final=4; %temps final
tau=0.2; %Pas du faux temps
n=300; %taille de l'image
alpha=2; 
%% Image 1 

   %croix bizarre

  u=make_your_image(n);

       %lena

% u=imread('Lena.jpg');
% u=im2double(rgb2gray(u));

% Joyeux Anniversaire

%u=im2double(imread('JoyeuxAnniversaire.gif'));

[w,h]=size(u);
figure(1)
%subplot(221)
imshow(u,[])
title('Image originale')
%% Bruitage

% b=wgn(w,h,30);
% I_bruit=I-b;

u0=imnoise(u,'gaussian');

%subplot(222)
figure(2)
imshow(u0,[])
title('Image bruitée')

%% dÃ©bruitage Ã  l'aide de l'Ã©quation de la chaleur

u_debruite=u0;
for m=1:tau:t_final
    for i=2:w-1
        for j=2:h-1
            derive_sud=u_debruite(i+1,j)-u_debruite(i,j);
            derive_nord=u_debruite(i-1,j)-u_debruite(i,j);
            derive_ouest=u_debruite(i,j+1)-u_debruite(i,j);
            derive_est=u_debruite(i,j-1)-u_debruite(i,j);
            u_debruite(i,j)=u_debruite(i,j)+tau.*(derive_sud+derive_nord+derive_ouest+derive_est);
        end
    end
end

%subplot(234)
figure(3)
imshow(u_debruite,[])
title(['image débruitée'])
xlabel('equation de la chaleur simple')

%% Perona-malik gaussienne
alpha = 0.2;
D=@(x) exp(-x.^2./(2*alpha^2));

u_gauss=u0;
for m=1:tau:t_final %temps 
    for i=2:w-1 %ligne
        for j=2:h-1 %colonne
            derive_sud=u_gauss(i+1,j)-u_gauss(i,j);
            derive_nord=u_gauss(i-1,j)-u_gauss(i,j);
            derive_ouest=u_gauss(i,j+1)-u_gauss(i,j);
            derive_est=u_gauss(i,j-1)-u_gauss(i,j);
            u_gauss(i,j)=u_gauss(i,j)+tau*(D(derive_sud)*derive_sud+D(derive_nord)*derive_nord+D(derive_ouest)*derive_ouest+D(derive_est)*derive_est);
        end
    end
end

%subplot(235)
figure(4)
imshow(u_gauss,[])
title(['image débruitée pour \alpha =',num2str(alpha) ])
xlabel('Perona-malik gaussienne')

%% Perona-malik lorentzienne
alpha = 0.1;
D=@(x) 1/(1+(x.^2./alpha^2));

u_loren=u0;
for m=1:tau:t_final % temps 
    for i=2:w-1 % lignes
        for j=2:h-1 % colonne
            derive_sud=u_loren(i+1,j)-u_loren(i,j);
            derive_nord=u_loren(i-1,j)-u_loren(i,j);
            derive_ouest=u_loren(i,j+1)-u_loren(i,j);
            derive_est=u_loren(i,j-1)-u_loren(i,j);
            u_loren(i,j)=u_loren(i,j)+tau*(D(derive_sud)*derive_sud+D(derive_nord)*derive_nord+D(derive_ouest)*derive_ouest+D(derive_est)*derive_est);
        end
    end
end

%subplot(236)
figure(5)
imshow(u_loren,[])
title(['image débruitée pour \alpha =',num2str(alpha) ])
xlabel('Perona-malik lorentzienne')