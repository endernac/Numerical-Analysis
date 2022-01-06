
function [t,y] = trapezoid(f,J,tspan,y_0,N_s,yes)

% solve the ODE dy/dt = f(t,y) with Jacobian matrix J(t,y)
% by the trapezoidal method with N_s steps

tol=1e-15;
itmax=100;
it=0;

t_0=tspan(1);
t_f=tspan(2);
D=length(y_0);

dt = (t_f - t_0)/N_s;

t = t_0:dt:t_f;
N=length(t);

j = 1;
y(1,:) = y_0(:)';

while j < N
    yj0=y(j,:)';
    fj0=feval(f,t(j),yj0);
    
    % begin Newton iteration with forward Euler
    k=0;
    yjold=yj0;
    yj = yj0 + dt*fj0;
    
    % Newton iteration for update
    while norm(yj-yjold)>tol*max(abs(yj),1)
        if k+1>itmax
            break
        end
        yjold=yj;
        Fj=yj-yj0-dt*(fj0+feval(f,t(j+1),yj))/2;
        DFj=eye(D)-dt*feval(J,t(j+1),yj)/2;
        k=k+1;
        yj=yj-DFj\Fj;
    end
    it=it+k;
    
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

it=it/(N-1);

return
