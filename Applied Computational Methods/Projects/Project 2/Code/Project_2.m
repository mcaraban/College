clear 
clc

 %u(1,:) = u(N+1,:);   
 %u(N+1,:) = u(1,:); 

%define variables 
dt = .001;          %less than equal to 1
T = 1;
t = 0:dt:T;
M = length(t);

L=2*pi;
dx = .01;
x = 0:dx:L;
N = 100; 

%initial condition
u0 = 2.5 + sin(x);
u = u0;
unpl = u0;

%loop through time 
for n = 1: M-1
    
    
    %boundary
    u(1,:) = u(end-1,:);
    u(end,:) = u(2,:);

    %upwind scheme 
    for i = 2: N+2
        unpl(i) = u(i)- dt/dx*(.5*(u(i)+abs(u(i)))*(u(i)-u(i-1)) + .5*(u(i)-abs(u(i)))*(u(i+1)-u(i)));
    end
    
    %t = t + dt;
    u = unpl;
    
    x = linspace(0, 2*pi, N+1);
    plot(x,u)

end














   