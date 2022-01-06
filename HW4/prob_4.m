f = @(x) sin(x.^2);
g = @(x) exp(-exp(x.^20));

[I,fcount]=romberg(f,0,4,10^(-14))
[I,fcount]=romberg(g,-2,2,10^(-14))