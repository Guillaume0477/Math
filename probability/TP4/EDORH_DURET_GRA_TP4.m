N=50000;
Y=rand(1,N);% Y suit une loi uniforme

a=1/log(6);
X=exp(Y/a)-4 ;% = Fx-1(Y)
[h,xout]=hist(X,50); % xout sont les abscisses
pas=xout(2)-xout(1);
S=sum(h)*pas; % aire de l'histogramme
figure(1)
hold on;
bar(xout,h/S); % /S pour que l'aire des barres fasse 1
f=a./(xout+4);
plot(xout,f,'r');

esp_empi=mean(X)
esp_theo=5*a-4
ecart_empi=std(X)
ecart_theo=sqrt((16-45*a/2)-(5*a-4)^2)

lambda=3;
X2=log(-Y+1)/(-lambda) ; % = Fx-1(Y)
[h2,xout2]=hist(X2,50); % xout sont les abscisses
pas2=xout2(2)-xout2(1);
S2=sum(h)*pas2; % aire de l'histogramme
figure(2)
hold on;
bar(xout2,h2/S2); % /S pour que l'aire des barres fasse 1
f2=lambda*exp(-lambda*xout2);
plot(xout2,f2,'r');

esp_empi2=mean(X2)
esp_theo2=1/lambda
ecart_empi2=std(X2)
ecart_theo2=1/lambda









