% Andrew Cornelio

% define grid
n = 50; %10, 20, 30, 40, 50
k = linspace(1,n,n);
% xk = cos((2*k-1)/(2*n)*pi);     % Part A
xk = (2*k - (n+1))/(2*(n+1));   % Part B

% define function
f = @(x) (1./(1+400*abs(x).^3)).^(1/3)

% interpolation
d = linspace(-2,2,500);
y = newtonint(xk, f(xk), d);

% plotting
plot(d,y)
xlim([-2 2])
ylim([-10 10])