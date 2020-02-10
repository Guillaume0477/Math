% méthode de Runge-Kutta d'ordre 4
function [x,y,t]=fct_RK4_2D(x0,y0,tmin,tmax,pas,f,g)
  nbIters=floor((tmax-tmin)/pas);
  x=zeros(1,nbIters+1);
  y=zeros(1,nbIters+1);
  t=zeros(1,nbIters+1);
  y(1)=y0;
  x(1)=x0;
  t(1)=tmin;
  for k=1:nbIters
      k1f=f(t(k),x(k),y(k));
      k1g=g(t(k),x(k),y(k));
      
      k2f=f(t(k)+pas/2,x(k)+(pas/2)*k1f,y(k)+(pas/2)*k1g);
      k2g=g(t(k)+pas/2,x(k)+(pas/2)*k1f,y(k)+(pas/2)*k1g);
      
      k3f=f(t(k)+pas/2,x(k)+(pas/2)*k2f,y(k)+(pas/2)*k2g);
      k3g=g(t(k)+pas/2,x(k)+(pas/2)*k2f,y(k)+(pas/2)*k2g);
      
      k4f=f(t(k)+pas,x(k)+pas*k3f,y(k)+pas*k3g);
      k4g=g(t(k)+pas,x(k)+pas*k3f,y(k)+pas*k3g);
      
      y(k+1)=y(k)+(pas/6)*(k1g+2*k2g+2*k3g+k4g);
      x(k+1)=x(k)+(pas/6)*(k1f+2*k2f+2*k3f+k4f); 
      
      t(k+1)=t(k)+pas;
  end