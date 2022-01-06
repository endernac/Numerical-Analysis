% Andrew Cornelio

x = [4.0000000, 0.2893402, 0.7303450, 0.5920853, 0.6253791, 0.6168039, 0.6189751, 0.6184230];
lambda = [0];

for i = 3:8
    l = (x(i) - x(i-1))/(x(i-1) - x(i-2));
    lambda = [lambda, l];
end

rate = lambda(7)
error = (x(8) - x(7)) / (1 - lambda(7))
x_star = x(8) - error

