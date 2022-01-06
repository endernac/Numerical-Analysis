% Function f and df/dy 
% (since we are iterating on y for Newton's method)
Y = @(t) exp(sin(t));
f = @(t, y) cos(t)*y;
Df = @(t, y) cos(t);

N = 10;
tspan = [0 2*pi];
Y_a = 1;

for i=1:3
    [t1,y1] = midpoint(f,tspan,Y_a,N,0);
    [t2,y2] = pece2(f,tspan,Y_a,N,0);
    [t3,y3] = trapezoid(f,Df,tspan,Y_a,N,0);
    YN = Y(t1);
    
    figure; hold on
    a1 = plot(t1,y1); M1 = "Midpoint";
    a2 = plot(t2,y2); M2 = "Pece";
    a3 = plot(t3,y3); M3 = "Trapezoid";
    legend([a1, a2, a3], [M1, M2, M3])
    hold off

    name = strcat("Solution_", num2str(N), ".png");
    saveas(gcf, name)
    
    figure; hold on
    a1 = plot(t1,y1-YN); M1 = "Midpoint";
    a2 = plot(t2,y2-YN); M2 = "Pece";
    a3 = plot(t3,y3-YN); M3 = "Trapezoid";
    legend([a1, a2, a3], [M1, M2, M3])
    hold off

    name = strcat("Error_", num2str(N), ".png");
    saveas(gcf, name)
    
    N = 10*N;
end
% 
% figure; hold on
% a1 = plot(t1,y1); M1 = "Midpoint";
% a2 = plot(t2,y2); M2 = "Pece";
% a3 = plot(t3,y3); M3 = "Trapezoid";
% legend([a1, a2, a3], [M1, M2, M3])
% hold off


% 
% disp("Trapezoid with Newton Iteration")
% [t1,y1] = trapezoid(f,Df,tspan,Y_a,N,0);
% disp("Trapezoid with Fixed Point Iteration")
% [t2,y2] = trapezoid2(f,tspan,Y_a,N,0);
% 
% 
% if all(abs(y2-y1) < tol)
%     disp("Solutions within tolerance")
% else
%     disp("Solutions outside toerance")
% end