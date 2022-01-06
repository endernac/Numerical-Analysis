Dy = @(t, y) [77.27*(y(2)+y(1)*(1-8.375*10e-6*y(1)-y(2))); (y(3)-(1+y(1))*y(2))/77.27; 0.16*(y(1)-y(2))];
tspan = [0 5];
y0 = [1.002160094292040; 4.639479815342760e+02; 2.539215623135003e+04];

options = odeset('Stats','on', 'OutPutFcn',@odeplot, 'ABsTol',1e-16, 'RelTol',1e-8);
[t,y] = ode15s(Dy, tspan, y0, options);


for i=1:length(y)
    J = [77.27*(1-2*8.375e-6*y(i,1)-y(i,2)), 77.27*(1-y(i,1)), 0;
        -y(i,2)/77.27, -(y(i,1)+1)/77.27, 1/77.27;
        0.16, 0, -0.16];
    Eig(:,i) = eig(J);
end


figure; hold on
plot(t, Eig(1 ,:))
plot(t, Eig(2 ,:))
plot(t, Eig(3 ,:))
hold off

