
function [ t,y ] = pece2(f,tspan,y_0,N_s,yes)

% solve the ODE dy/dt = f(t,y) by 2nd-order PECE method in N_s steps,
% with midpoint rule as predictor and trapezoid rule as corrector

t_0=tspan(1);
t_f=tspan(2);
D=length(y_0);

dt = (t_f - t_0)/N_s;

t = t_0:dt:t_f;
N=length(t);

yj=y_0';
y(1,:) = y_0;
j = 1;

% first step by Euler method
yd(1,:)=feval(f,t(1),yj)';
yj = yj + dt*yd(1,:)';
y(2,:) = yj';
fj0=feval(f,t(2),yj);
j=2;

while j < N
    yj1=y(j-1,:)';
    yj0=y(j,:)';
    % midpoint predictor
    yj = yj1 + 2*dt*fj0;
    fj=feval(f,t(j+1),yj);
    % trapezoidal corrector
    yj = yj0 + dt*(fj0+fj)/2;
    % optional evaluation
    % fj0=feval(f,t(j+1),yj);
    fj0=fj;
    y(j+1,:) = yj';
    j = j + 1;
end

if yes==1
    
    for k=1:D,
        
        figure
        z=y(:,k);
        plot(t,z)
        xlabel('time t')
        ylabel(sprintf('y_%d', k))
        
        
    end
    
end


t=t';


return
