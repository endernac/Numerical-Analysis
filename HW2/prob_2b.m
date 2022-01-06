% Andrew Cornelio   Feb 19, 2021

% parameters of problem
f = @(x) x^2/(x^2+1);
Df = @(x) 2*x/(x^2+1)^2;
x = 0.33;
tol = 1e-15;
x_store = [x];

% newton method
tic

itmax=9;

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
     % store values of x
     x_store = [x_store, x];
     k=k+1;
     [xold abs(x-xold)];
end

toc


% find e_n, e_{n+1}, plot data to verify linearity, and fit data
e_n = abs(0 - x_store);
e_n1 = [e_n(2:k+1), e_n(k+1)];
scatter(log(e_n), log(e_n1));

% only use valid data
coeff = polyfit(log(e_n(1:8)), log(e_n1(1:8)), 1);

% we solved ln(y) = p*ln(x) + ln(c)
% take exponential of second value to find c
fprintf("p = %d, c = %d\n", coeff(1), exp(coeff(2)));



