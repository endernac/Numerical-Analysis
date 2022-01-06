% Function f and df/dy 
% (since we are iterating on y for Newton's method)
f = @(t, y) -y;
Df = @(t, y) -1;

N = 5;
tspan = [0 1];
Y_a = 1;
tol= 10e-15;

disp("Trapezoid with Newton Iteration")
[t1,y1] = trapezoid(f,Df,tspan,Y_a,N,0);
disp("Trapezoid with Fixed Point Iteration")
[t2,y2] = trapezoid2(f,tspan,Y_a,N,0);


if all(abs(y2-y1) < tol)
    disp("Solutions within tolerance")
else
    disp("Solutions outside toerance")
end