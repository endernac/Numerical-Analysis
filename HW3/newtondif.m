function d=newtondif(x,y)

n=length(x);
d=y;

for i=1:n-1
   for j=n:-1:i+1
      d(j)=(d(j)-d(j-1))/(x(j)-x(j-i));  
   end
end
    
end

