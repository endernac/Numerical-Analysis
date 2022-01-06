% based on Michael Heath, Scientific Computing, Ch.5
% Andrew Cornelio   Feb 19, 2021

%clear variables from workspace (so exist('b')==0, exist('c')==0)
clear;

% parameters of problem
f = @(x) x^2 - 3;
Df = @(x) 2*x;
a = 1;
tol = 1e-15;
x_store = [];

% secant method
tic

itmax=100;

k=0;

fa=f(a);
if exist('b')==0
b=a-fa/Df(a); k=k+1;
% store values of x
x_store = [x_store, b];
end 

fb=f(b);
if exist('c')==0
c = b + (b-a)/(fa/fb-1); k=k+1;
% store values of x
x_store = [x_store, c];
end 

k;
[a b c];


while abs(c-b)>tol*max(abs(c),1.0)
     if k+1>itmax
       break
     end 
     fc=f(c);
     u=fb/fc;
     v=fb/fa;
     w=fa/fc;
     p=w*(u-w)*(c-b)-(1-u)*(b-a);
     p=v*p;     
     q=(u-1)*(v-1)*(w-1);
     x=b+p/q;
     k=k+1;
     % store values of x
     x_store = [x_store, x];
     a=b;
     fa=fb;
     b=c;
     fb=fc;
     c=x;
     [c abs(c-b)];
end  

toc

fprintf("max iteration = %d\n", k);


% find e_n, e_{n+1}, plot data to verify linearity, and fit data
e_n = abs(sqrt(3) - x_store);
e_n1 = [e_n(2:k), e_n(k)];
scatter(log(e_n), log(e_n1));

% only use valid data
coeff = polyfit(log(e_n(1:5)), log(e_n1(1:5)), 1);

% we solved ln(y) = p*ln(x) + ln(c)
% take exponential of second value to find c
fprintf("p = %d, c = %d\n", coeff(1), exp(coeff(2)));