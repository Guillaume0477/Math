clear variables;
close all;

Fs=500;
B=160;
nu_0=100;
T=100;
Pb=5;
sigma=sqrt(Pb);
A=1;
Fm=0.05

%Creation du signal S
figure(1);
Sp = struct('Fs',Fs,'A',A,'Fc',nu_0,'FM',Fm,'Phi',2*pi*rand(),'T',100,'W',[]);
[S,Sp,M] = OOK(Sp);

%Creation du bruit
Bp = struct('sigma',sigma,'Fs',Fs,'B',B,'T',T)
figure(2);
[B,Bp]=CGN(Bp);

%Addition des deux signaux B et S
figure(3);
[X] = AddSig(S,B);
plot(X.data)

%filtrage par F1
%parametres non modifies
figure(4);
Fp = struct('Fs',Fs,'F0',nu_0,'Dnu',16,'order',6,'class','Butterworth') ;  
[Y,Fp] = BPF(X,Fp);

%Quadrateur et Filtre H1
figure(5);
Z=SquareSig(Y);

Dnu=16;
RCDnu= 20
RC=RCDnu/Dnu;
RCFp=struct('Fs',Fs,'RC',RC);
[W,RCFp] = RCF (Z,RCFp);

%Detection binaire du signal
sigma2= mean(W.data);
Bin = zeros(1, length(W.data));
for i = 1:length(W.data)
   if W.data(i) > sigma2
       Bin(i) = 1;
   end      
end


figure(6);
subplot(411);
plot(X.time,S.data);
title 'signal S'
xlabel 't (en s)'
ylabel 'S(t)'

subplot(412);
plot(X.time,X.data);
title 'signal X'
xlabel 't (en s)'
ylabel 'X(t)'

subplot(413);
hold on
plot(X.time,W.data);
plot(X.time,sigma2)
title 'signal W'
xlabel 't (en s)'
ylabel 'W(t)'

subplot(414);
plot(X.time,Bin);
title 'Detection binaire'
xlabel 't (en s)'
axis ([0,100,-0.5,1.5])
