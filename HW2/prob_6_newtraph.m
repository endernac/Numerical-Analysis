% Andrew Cornelio

% initialization
x = [-1; -1; 2];
f = @(x) [x(1) + cos(x(1)*x(2)*x(3))-1,
    (1-x(1))^(1/4) + x(2) + (1/20)*x(3)^2-(3/20)*x(3) - 1,
    -x(1)^2 - (1/10)*x(2)^2 + (1/100)*x(2) + x(3) - 1];

Df = @(x) [1 - x(2)*x(3)*sin(x(1)*x(2)*x(3)), -x(1)*x(3)*sin(x(1)*x(2)*x(3)), -x(1)*x(2)*sin(x(1)*x(2)*x(3));
      -1/(4*(1 - x(1))^(3/4)),               1,     x(3)/10 - 3/20;
      -2*x(1),     1/100 - x(2)/5,               1];


tol = 1e-15;


tic

n=length(x);
itmax=100;

k=0;
xold=zeros(n,1);
if x==xold
   xold=ones(n,1);
end    
x';
norm(x-xold);

while norm(x-xold)>tol*max(norm(x),1.0)
     if k+1>itmax
       break
     end 
     xold=x;
     k=k+1;
     x=x-Df(x)\f(x);
     x';
     norm(x-xold);
end  

toc

fprintf("max iteration = %d\n", k);

