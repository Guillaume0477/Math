function tau=myFunction(x1,x2,func)
 if abs(x1-x2)>1d-9
 tau=(func(x2)-func(x1))/(x2-x1);
 end
end