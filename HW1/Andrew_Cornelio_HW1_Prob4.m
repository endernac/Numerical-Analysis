% Andrew Cornelio. Feb 5, 2021

%% Problem 4a. Create and plot polynomial 
p = [1 -6 15 -20 15 -6 1];
f1 = @(x) polyval(p, x);
fplot(f1, [0.995,1.005]);


%% Problem 4b. Calculate and display roots of polynomial
r = roots(p);
disp(r)

%% Problem 4c. Create polynomial as a product and display
f2 = @(x) (1 - x)^6;
fplot(f2, [0.995,1.005]);

%% Problem 4d. Create polynomials and calculate roots
q = [1 0 0 0 0 0 0];
r = roots(q);
disp(r)
