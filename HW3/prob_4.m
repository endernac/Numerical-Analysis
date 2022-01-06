% Andrew Cornelio

%% Part b - finding coefficients

a = [1, 1.2, 1.4, 1.6, 1.8, 2, 3];
b = [17, 18.0736, 19.8416, 22.5536, 26.4976, 32, 33.73205];

% P_6(x) coefficients
newtondif(a,b)
% Q_6(y) coefficients
newtondif(b,a)

%% Part c - plotting P

x = linspace(0,5,200); 
y = newtonint(a, b, x);
plot(x,y)
xlim([0 4])
ylim([10 60])

%% Part c - plotting Q

y = linspace(0,70,200); 
x = newtonint(b, a, y);
plot(x,y)
xlim([0 4])
ylim([10 60])
