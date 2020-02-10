function [x,y,z,a,t]=fct_RK4_4D(x0,y0,z0,a0,tmin,tmax,pas,f,g,h,i)
  nbIters=floor((tmax-tmin)/pas);
  x=zeros(1,nbIters+1);
  y=zeros(1,nbIters+1);
  z=zeros(1,nbIters+1);
  a=zeros(1,nbIters+1);
  t=zeros(1,nbIters+1);
  y(1)=y0;
  x(1)=x0;
  z(1)=z0;
  a(1)=a0;
  t(1)=tmin;
  for k=1:nbIters
      k1f=f(t(k),x(k),y(k),z(k),a(k));
      k1g=g(t(k),x(k),y(k),z(k),a(k));
      k1h=h(t(k),x(k),y(k),z(k),a(k));
      k1i=i(t(k),x(k),y(k),z(k),a(k));
      
      k2f=f(t(k)+pas/2,x(k)+(pas/2)*k1f,y(k)+(pas/2)*k1g,z(k)+(pas/2)*k1h,a(k)+(pas/2)*k1i);
      k2g=g(t(k)+pas/2,x(k)+(pas/2)*k1f,y(k)+(pas/2)*k1g,z(k)+(pas/2)*k1h,a(k)+(pas/2)*k1i);
      k2h=h(t(k)+pas/2,x(k)+(pas/2)*k1f,y(k)+(pas/2)*k1g,z(k)+(pas/2)*k1h,a(k)+(pas/2)*k1i);
      k2i=i(t(k)+pas/2,x(k)+(pas/2)*k1f,y(k)+(pas/2)*k1g,z(k)+(pas/2)*k1h,a(k)+(pas/2)*k1i);
      
      k3f=f(t(k)+pas/2,x(k)+(pas/2)*k2f,y(k)+(pas/2)*k2g,z(k)+(pas/2)*k2h,a(k)+(pas/2)*k2i);
      k3g=g(t(k)+pas/2,x(k)+(pas/2)*k2f,y(k)+(pas/2)*k2g,z(k)+(pas/2)*k2h,a(k)+(pas/2)*k2i);
      k3h=h(t(k)+pas/2,x(k)+(pas/2)*k2f,y(k)+(pas/2)*k2g,z(k)+(pas/2)*k2h,a(k)+(pas/2)*k2i);
      k3i=i(t(k)+pas/2,x(k)+(pas/2)*k2f,y(k)+(pas/2)*k2g,z(k)+(pas/2)*k2h,a(k)+(pas/2)*k2i);
      
      k4f=f(t(k)+pas,x(k)+pas*k3f,y(k)+pas*k3g,z(k)+(pas/2)*k3h,a(k)+(pas/2)*k3i);
      k4g=g(t(k)+pas,x(k)+pas*k3f,y(k)+pas*k3g,z(k)+(pas/2)*k3h,a(k)+(pas/2)*k3i);
      k4h=h(t(k)+pas,x(k)+pas*k3f,y(k)+pas*k3g,z(k)+(pas/2)*k3h,a(k)+(pas/2)*k3i);
      k4i=i(t(k)+pas,x(k)+pas*k3f,y(k)+pas*k3g,z(k)+(pas/2)*k3h,a(k)+(pas/2)*k3i);
      
      y(k+1)=y(k)+(pas/6)*(k1g+2*k2g+2*k3g+k4g);
      x(k+1)=x(k)+(pas/6)*(k1f+2*k2f+2*k3f+k4f); 
      z(k+1)=z(k)+(pas/6)*(k1h+2*k2h+2*k3h+k4h);
      a(k+1)=a(k)+(pas/6)*(k1i+2*k2i+2*k3i+k4i);
      
      t(k+1)=t(k)+pas;
      end