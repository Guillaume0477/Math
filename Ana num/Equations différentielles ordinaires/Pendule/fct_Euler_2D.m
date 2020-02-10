function [x,y,t]=fct_Euler_2D(x0,y0,tmin,tmax,h,f,g)
    t=tmin:h:tmax;
    y=zeros(1,length(t));
    x=zeros(1,length(t));
    y(1)=y0;
    x(1)=x0;
    for k=2:length(t)
        y(k)=y(k-1)+h*g(t(k),x(k-1),y(k-1));
        x(k)=x(k-1)+h*f(t(k),x(k-1),y(k-1));
    end
end