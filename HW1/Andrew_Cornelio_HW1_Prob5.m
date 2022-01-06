% Andrew Cornelio. Feb 5, 2021

a = 1-1e-8;
A = [1 a; a 1];
b = [1; 0];

r = A\b;
z1 = r(1) + r(2)

z2 = 1/(1 + a)

diff = z2 - z1



