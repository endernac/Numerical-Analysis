% Andrew Cornelio

%% Return coefficients

a = [1, 2, 3, 4, 5, 6, 7];
b = [16, 34, 58, -20, 4, 886, -146];

vandercoeff(a, b)
baryctrcoeff(a, b)
newtondif(a, b)

%% Timing functions

t1 = [];
t2 = [];
t3 = [];

for i=1:100
    tic
    vandercoeff(a, b);
    t = toc;
    t1 = [t1, t];
    
    tic
    baryctrcoeff(a, b);
    t = toc;
    t2 = [t2, t];
    
    tic
    newtondif(a, b);
    t = toc;
    t3 = [t3, t];
end

mean(t1)
mean(t2)
mean(t3)

%% Plotting polynomial

x = linspace(0,8); 
y = newtonint(a, b, x);
plot(x,y)
hold on
scatter(a,b)
xlim([0 8])
ylim([-1000 1500])
hold off
