% méthode de Runge-Kutta d'ordre 4
function [y,t]=fct_RK4(y0,tmin,tmax,pas,fonction)
  nbIters=floor((tmax-tmin)/pas);
  y=zeros(1,nbIters+1);
  t=zeros(1,nbIters+1);
  y(1)=y0;
  t(1)=tmin;
  for k=1:nbIters
      k1=fonction(t(k),y(k));
      k2=fonction(t(k)+pas/2,y(k)+(pas/2)*k1);
      k3=fonction(t(k)+pas/2,y(k)+(pas/2)*k2);
      k4=fonction(t(k)+pas,y(k)+pas*k1);
      y(k+1)=y(k)+(pas/6)*(k1+2*k2+2*k3+k4);
      t(k+1)=t(k)+pas;
  end