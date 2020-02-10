%% point_fixe
clear all;close all;

g=@(x)(sqrt(x+5));
prec=3;
a=1;
[sol,diff_tab]=point_fixe(1,g,10^-prec);
for n=1:length(sol)-1
    fprintf('n=%d, x(n)=%d   e(n)=%d  e(n+1)/e(n)=%d \n',n,sol (n),diff_tab(n),diff_tab(n+1)/diff_tab(n))
end
fprintf('n=%d, x(n)=%d   e(n)=%d  e(n+1)/e(n)=%d \n',n+1,sol (n+1),diff_tab(n+1),diff_tab(n+1)/diff_tab(n))

%% Newton
clear all;close all;
prec=12;
f=@(x)(x^2-x-5);
fp=@(x)(2*x-1);
[sol2,diff_tab2]=Newton(3,f,fp,10^-prec);
for n=1:length(sol2)-1
    fprintf('n=%d, x(n)=%d   e(n)=%d  e(n+1)/e(n)^2=%d \n',n,sol2(n),diff_tab2(n),diff_tab2(n+1)/(diff_tab2(n))^2)
end
fprintf('n=%d, x(n)=%d   e(n)=%d  e(n+1)/e(n)^2=%d \n\n',n+1,sol2(n+1),diff_tab2(n+1),diff_tab2(n+1)/(diff_tab2(n))^2)

%% Newton vect
clear all; close all;
prec=6;
f=@(x,y)(x^2-(4/3)*x*y+y^2-1);
g=@(x,y)(x^2-2*x+y^2-2*y+3/2);
fpx=@(x,y)(2*x-(4/3)*y);
fpy=@(x,y)(2*y-(4/3)*x);
gpx=@(x,y)(2*x-2);
gpy=@(x,y)(2*y-2);
hold on;
ezplot(f);
ezplot(g);
X0=[2;0];
X=NewtonVect(X0,f,g,fpx,fpy,gpx,gpy,10^-prec);
hold on
plot(X(1,:),X(2,:),'--rs','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
