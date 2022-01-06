% Andrew Cornelio   Feb 19, 2021

%clear variables from workspace (so exist('b')==0)
clear;

% parameters of problem
f = @(x) x^2 - 3;
Df = @(x) 2*x;
a = 1;
tol = 1e-15;
x_store = [];

% secant method
tic

k=0;

if exist('b')==0
b=a-f(a)/Df(a); k=k+1;
% store values of x
x_store = [x_store, b];
end 

itmax=50;

k;
[a abs(b-a)];
fa=f(a);

while abs(b-a)>tol*max(abs(b),1.0)
     if k+1>itmax
       break
     end 
     fb=f(b);
     x = b + (b-a)/(fa/fb-1);
     a=b;
     fa=fb;
     b=x;
     % store values of x
     x_store = [x_store, x];
     k=k+1;
     [a abs(b-a)];
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
