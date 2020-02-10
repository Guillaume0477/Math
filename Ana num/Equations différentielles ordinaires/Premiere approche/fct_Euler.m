function [y,t]=fct_Euler(y0,tmin,tmax,h,f)
    %todo
    t=tmin:h:tmax;
    y=zeros(1,length(t));
    y(1)=y0;
    for k=2:length(t)
        y(k)=y(k-1)+h*f(t(k-1),y(k-1));
    end
end
