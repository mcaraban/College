%% Case 1. Numerical solution of the PDE Ut=-Ux+Uxx-U using the explicit FDM
%  Written by Viridiana Salazar
%  Edited by Davide Masiello
clear,clc
%% Parameters
B2 = 1/878;
%% Space steps
Lx = 1;                                                                     % Max value of x
dx = 1/40;                                                                 % Space step
N  = Lx/dx+1;                                                               % Number of space steps
x  = 0:dx:Lx;
%% Time steps
tf  = 0.5;                                                                   % Final time
dt  = 0.9*0.5*dx^2;                                                          % Time step such that dt/dx^2<=0.5
t   = 0:dt:tf;
M   = length(t);                                                               % Number of time of steps
%% Initial and Boundary Conditions
U       = zeros(N,M);                                                       % Create a Matrix of NxM
U(:,1)  = 0;                                                                % Initial conditions
U(1,:)  = 1;                                                                % Boundary conditions at the left side
%% Explicit Method
for j = 1:M-1                                                               %Time Loop
   U(2:end-1,j+1) = -(U(2:end-1,j)-U(1:end-2,j))*dt/(dx)+B2*(U(3:end,j)-2*U(2:end-1,j)+U(1:end-2,j))*dt/(dx^2)+U(2:end-1,j);
   U(end,j)       = U(end-1,j);
end
%% Analytical Solution
Ur      = zeros(N,M);
Ur(:,1) = 0;                                                                % Initial conditions
Ur(1,:) = 1;                                                                % Boundary conditions at the left side
for j = 1:M-1                                                               %Time Loop
   Ur(:,j+1) = 0.5*erfc((x-t(j+1))/(2*B2*t(j+1)^0.5))+0.5*exp(x/B2).*erfc((x+t(j+1))/(2*B2*t(j+1)^0.5));
end 
%% Error
Error = abs(Ur-U);
%% Plots
figure(1)
for idx = 1:50:length(t)
    
    subplot(3,1,1)
    plot(x,U(:,idx));
    hold on
    xlabel('x-values')
    ylabel('U-values')
    
    subplot(3,1,2)
    plot(x,Ur(:,idx));
    hold on
    title('Analytical Solution')
    xlabel('x-values')
    ylabel('U-values')
    hold on
    
    subplot(3,1,3)
    plot(x,Error(:,idx));
    title('Error')
    xlabel('x-values')
    ylabel('Error')
    hold on
    
end