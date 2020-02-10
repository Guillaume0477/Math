function [x,diff]=Newton(a,f,fp,eps)
    x=a;
    diff=a;
    n=1;
    while(abs(f(x(n)))>eps)
       y=x(n)-(f(x(n))/fp(x(n)));
       x=[x,y];
       new_diff=abs(f(x(n))-y);
       diff=[diff,new_diff];
       n=n+1;
    end    
end