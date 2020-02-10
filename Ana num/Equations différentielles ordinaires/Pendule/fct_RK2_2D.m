function [x,y,t]=fct_RK2_2D(x0,y0,tmin,tmax,h,beta,f,g)
    t=tmin:h:tmax;
    y=zeros(1,length(t));
    y(1)=y0;
    x(1)=x0;
    for k=2:length(t)
        x(k)=x(k-1)+h*((1-beta)*f(t(k),x(k-1),y(k-1))+beta*f(t(k),x(k-1)+(h/(2*beta))*f(t(k),x(k-1),y(k-1)),y(k-1)+((h/(2*beta))*g(t(k),t(k-1),y(k-1)))));
        y(k)=y(k-1)+h*((1-beta)*g(t(k),x(k-1),y(k-1))+beta*g(t(k),x(k-1)+(h/(2*beta))*f(t(k),x(k-1),y(k-1)),y(k-1)+((h/(2*beta))*g(t(k),t(k-1),y(k-1)))));
end