function v=newtonint(x,y,u)

n=length(x);
d=newtondif(x,y);
v=d(n).*ones(size(u));

for k=n:-1:2
  v=d(k-1)+(u-x(k-1)).*v;
end
    
end