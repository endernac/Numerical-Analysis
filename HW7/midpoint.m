
function [ t,y ] = midpoint(f,tspan,y_0,N_s,yes) 

% solve the ODE dy/dt = f(t,y) by midpoint method with N_s steps 

t_0=tspan(1);
t_f=tspan(2);
D=length(y_0);

dt = (t_f - t_0)/N_s;

t = t_0:dt:t_f;
N=length(t);

j = 1; 
yj=y_0';
y(1,:) = y_0(:)';

% first step by Euler method 

j=2;
yj = yj + dt*feval(f,t(1),yj);
y(2,:) = yj';


while j < N 
yj1=y(j-1,:)';
yj=y(j,:)';
yj = yj1 + 2*dt*feval(f,t(j),yj);
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
