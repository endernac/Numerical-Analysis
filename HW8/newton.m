function [sol] = newton(f,Df,x)

itmax=100;
tol=10e-15;

k=0;
if x ~= 0
  xold=0;
else 
  xold=1;
end

while abs(x-xold)>tol*max(abs(x),1.0)
     if k+1>itmax
       break
     end 
     xold=x;
     x=x-f(x)/Df(x);
     k=k+1;
%      [xold abs(x-xold)]
end

sol=x;

end

