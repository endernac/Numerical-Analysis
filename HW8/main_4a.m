Dy = @(t, y) [77.27*(y(2)+y(1)*(1-8.375*10e-6*y(1)-y(2))); (y(3)-(1+y(1))*y(2))/77.27; 0.16*(y(1)-y(2))];
tspan = [0 5];
y0 = [1.002160094292040; 4.639479815342760e+02; 2.539215623135003e+04];

options = odeset('Stats','on', 'OutPutFcn',@odeplot, 'ABsTol',1e-16, 'RelTol',1e-8);
[t15s,y15s] = ode15s(Dy, tspan, y0, options);

plot(t15s(1:end-1), t15s(2:end)-t15s(1:end-1))