function X=NewtonVect(X0,f,g,fpx,fpy,gpx,gpy,eps)
   X=X0;
   dist=1;
   n=1;
   while(dist>eps)
      J=[fpx(X(1,n),X(2,n)),fpy(X(1,n),X(2,n));gpx(X(1,n),X(2,n)),gpy(X(1,n),X(2,n))];      
      F=[f(X(1,n),X(2,n));g(X(1,n),X(2,n))];
      Y=X(:,n)-inv(J)*F;
      X=[X,Y];
      dist=norm(X(:,n)-Y);
      n=n+1;
   end
end