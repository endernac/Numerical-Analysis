g = @(x) 1+x+1/2*x.^2+1/6*x.^3+1/24*x.^4;
xspan = [-3 0];
dx = 10e-4;
xrange = -3:dx:0;


figure; hold on
a1 = plot(xrange,g(xrange)); M1 = "r_0(z)";
a2 = plot(xrange,ones(size(xrange))); M2 = "r_0=1";
a3 = plot(xrange,-ones(size(xrange))); M3 = "r_0=-1";
legend([a1, a2, a3], [M1, M2, M3])
hold off


f = @(x) x+1/2*x.^2+1/6*x.^3+1/24*x.^4;
Df = @(x) x+1/2*x.^2+1/6*x.^3;
z = newton(f, Df, -3)