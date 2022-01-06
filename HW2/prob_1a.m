% Andrew Cornelio   Feb 19, 2021

% parameters of problem
f = @(x) x^2 - 3;
a = 1;
b = 2;
tol = 1e-15;
x_store = [];

% bisection method
tic

itmax=100;

if sign(f(a))==sign(f(b))
   'failure to bracket root'
   return
end   

k=0;
[a b b-a];

while abs(b-a)>tol*max(abs(b),1.0) 
     if k+1>itmax
       break
     end
     x=(a+b)/2;
     if sign(f(x)) == sign(f(b))
        b=x;
     else
        a=x;
     end
     % store the values
     x_store = [x_store, x];
     k=k+1;
     [a b b-a];
end 

toc

fprintf("max iteration = %d\n", k);


% find e_n, e_{n+1}, plot data to verify linearity, and fit data
e_n = abs(sqrt(3) - x_store);
e_n1 = [e_n(2:k), e_n(k)];
scatter(log(e_n), log(e_n1));

coeff = polyfit(log(e_n), log(e_n1), 1);

% we solved ln(y) = p*ln(x) + ln(c)
% take exponential of second value to find c
fprintf("p = %d, c = %d\n", coeff(1), exp(coeff(2)));


