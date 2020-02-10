clear all;
close all;
hold on;
signal=[0.5000 0.5100 0.5200 0.5300 0.5400 0.5500 0.5600 0.5700 0.5800 0.5900 0.6000 0.6100 0.6200 0.6300 0.6400 0.6500 0.6600 0.6700 0.6800 0.6900 0.7000 0.7100 0.7200 0.7300 0.7400 0.7500 0.7600 0.7700 0.7800 0.7900 0.8000 0.8100 0.8200 0.8300 0.8400 0.8500 0.8600 0.8700 0.8800 0.8900 0.9000 0.9100 0.9200 0.9300 0.9400 0.9500 0.9600 0.9700 0.9800 0.9900 1.0000 1.0100 1.0200 1.0300 1.0400 1.0500 1.0600 1.0700 1.0800 1.0900 1.1000 1.1100 1.1200 1.1300 1.1400 1.1500 1.1600 1.1700 1.1800 1.1900 1.2000 1.2100 1.2200 1.2300 1.2400 1.2500 1.2600 1.2700 1.2800 1.2900 1.3000 1.3100 1.3200 1.3300 1.3400 1.3500 1.3600 1.3700 1.3800 1.3900 1.4000 1.4100 1.4200 1.4300 1.4400 1.4500 1.4600 1.4700 1.4800 1.4900 1.5000 1.5100 1.5200 1.5300 1.5400 1.5500 1.5600 1.5700 1.5800 1.5900 1.6000 1.6100 1.6200 1.6300 1.6400 1.6500 1.6600 1.6700 1.6800 1.6900 1.7000 1.7100 1.7200 1.7300 1.7400 1.7500 1.7600 1.7700 1.7800 1.7900 1.8000 1.8100 1.8200 1.8300 1.8400 1.8500 1.8600 1.8700 1.8800 1.8900 1.9000 1.9100 1.9200 1.9300 1.9400 1.9500 1.9600 1.9700 1.9800 1.9900 2.0000 2.0100 2.0200 2.0300 2.0400 2.0500 2.0600 2.0700 2.0800 2.0900 2.1000 2.1100 2.1200 2.1300 2.1400 2.1500 2.1600 2.1700 2.1800 2.1900 2.2000 2.2100 2.2200 2.2300 2.2400 2.2500 2.2600 2.2700 2.2800 2.2900 2.3000 2.3100 2.3200 2.3300 2.3400 2.3500 2.3600 2.3700 2.3800 2.3900 2.4000 2.4100 2.4200 2.4300 2.4400 2.4500 2.4600 2.4700 2.4800 2.4900 2.5000 ; 0.2506 0.2607 0.2710 0.2815 0.2922 0.3030 0.3141 0.3254 0.3369 0.3486 0.3605 0.3725 0.3848 0.3973 0.4100 0.4229 0.4360 0.4493 0.4628 0.4764 0.4903 0.5044 0.5187 0.5332 0.5479 0.5628 0.5779 0.5931 0.6086 0.6243 0.6402 0.6563 0.6726 0.6891 0.7058 0.7227 0.7397 0.7570 0.7745 0.7922 0.8101 0.8282 0.8465 0.8650 0.8837 0.9026 0.9216 0.9409 0.9604 0.9801 1.0000 1.0201 1.0404 1.0609 1.0816 1.1025 1.1235 1.1448 1.1663 1.1880 1.2099 1.2320 1.2543 1.2768 1.2995 1.3223 1.3454 1.3687 1.3922 1.4159 1.4398 1.4639 1.4882 1.5127 1.5373 1.5622 1.5873 1.6126 1.6381 1.6638 1.6897 1.7158 1.7421 1.7685 1.7952 1.8221 1.8492 1.8765 1.9040 1.9317 1.9595 1.9876 2.0159 2.0444 2.0731 2.1020 2.1310 2.1603 2.1898 2.2195 2.2494 2.2794 2.3097 2.3402 2.3709 2.4018 2.4328 2.4641 2.4956 2.5273 2.5591 2.5912 2.6235 2.6559 2.6886 2.7215 2.7545 2.7878 2.8212 2.8549 2.8888 2.9228 2.9570 2.9915 3.0261 3.0610 3.0960 3.1312 3.1666 3.2022 3.2380 3.2740 3.3102 3.3466 3.3831 3.4198 3.4568 3.4938 3.5311 3.5685 3.6060 3.6436 3.6814 3.7191 3.7569 3.7944 3.8315 3.8674 3.9002 3.9197 1.9996 0.0405 0.0206 0.0144 0.0117 0.0106 0.0103 0.0107 0.0114 0.0126 0.0140 0.0157 0.0177 0.0200 0.0224 0.0252 0.0281 0.0312 0.0346 0.0382 0.0420 0.0460 0.0502 0.0546 0.0592 0.0640 0.0691 0.0743 0.0798 0.0854 0.0912 0.0973 0.1036 0.1100 0.1167 0.1235 0.1306 0.1379 0.1453 0.1530 0.1609 0.1689 0.1772 0.1857 0.1944 0.2032 0.2123 0.2216 0.2311 0.2408 0.2506 ];

t=signal(1,:);
f=signal(2,:);
n=length(t);
T=t(n)-t(1);                %P�riode du signal
nu=1/T;                     %Fr�quence (�gale � l'inverse de la p�riode)
N=20;                       %Nombre d'harmoniques
w=2*pi/T;                   %Omega
nun=zeros(1,N);             %Matrice de 1 colonne contenant les fr�quences
An=zeros(1,N);              %Matrice de 1 colonne contenant les amplitudes
a0=(1/T)*trapz(t,f);        %Valeur de a0 (coefficients de Fourier)
Tf=a0;
energie=a0^2;

%Calcul des coefficients de Fourier
for k=1:1:N
   an=(2/T)*trapz(f.*cos(k*w*t))*(t(2)-t(1));      %Calcul des an
   bn=(2/T)*trapz(f.*sin(k*w*t))*(t(2)-t(1));      %Calcul des bn
   An(k)=sqrt(an^2+bn^2);              %Calcul de l'amplitude
   nun(k)=k*nu;
   
   Tf=Tf+an*cos(k*w*t)+bn*sin(k*w*t);  %Reconstruction du signal
   
   energie=energie+(1/2)*An(k)^2;    %Partie de droite de la formule de Parseval
end
 
%Affichage de la courbe representative du signal
figure(1);
subplot(121);
plot(t, f, 'r');
hold on;
title('Courbe representative du signal (N=5)');
plot(t, Tf,'b');
legend('Signal trac� � partir du tableau','Signal reconstruit');
xlabel('t');
ylabel('f(t)');

% Trac� de l'amplitude An en fonction de la fr�quence nun
subplot(122);
bar(nun, An, 'm');
title('Spectre pour 20 harmoniques');
xlabel('V\fontsize{7}n');
ylabel('A\fontsize{7}n');

% Energie transport�e par N harmoniques
energie