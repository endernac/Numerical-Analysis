function [t, y] = rk3(f,tspan,y_0,N_s,yes)

t_0=tspan(1);
t_f=tspan(2);
D=length(y_0);

dt = (t_f - t_0)/N_s;

t = t_0:dt:t_f;
N=length(t);

j = 1;
y(1,:) = y_0(:)';

while j < N
    yj=y(j,:)';
    k1 = feval(f,t(j),yj);
    k2 = feval(f,t(j)+dt/2,yj+k1*dt/2);
    k3 = feval(f,t(j)+dt*3/4,yj+k2*dt*3/4);
    yj = yj + dt*(2*k1+3*k2+4*k3)/9;
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
