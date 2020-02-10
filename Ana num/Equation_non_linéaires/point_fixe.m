function [x,diff]=point_fixe(a,g,eps)
    x=a;
    diff=ones(1,1);
    n=1;
  %  fprintf('n=%d, x(n)=%d   e(n)=%d  e(n+1)/e(n)=indef \n',n,x,diff)
    while(diff(n)>eps)
        y=g(x(n));
        x=[x,y];
        new_diff=abs(y-x(n));
        diff=[diff,new_diff];
        n=n+1;
 %       fprintf('n=%d, x(n)=%d   e(n)=%d  e(n+1)/e(n)=%d \n',n,x,diff,diff/old_diff)
    end
end