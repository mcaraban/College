% Define domain and initial parameters
L = 2*pi;          % Domain length
T = 1;             % Final time
dx = .01;         % Initial spatial step size
dt = 0.001;          % Initial time step size
N = round(L/dx);   % Number of spatial grid points
M = round(T/dt);   % Number of time grid points

% Initialize solution matrix
u = zeros(N+1, M+1);   % u(i,j) represents u at x = (i-1)*dx and t = (j-1)*dt

% Set initial condition
for j = 1:N+1
    x = (j-1)*dx;
    u(j,1) = 2.5 + sin(x);
end

% boundary condition
u(1,:) = u(end-1,:);                   
u(end,:) = u(2,:);

% Create figure and axes
fig = figure;
ax = gca;

% Set axis limits
xlim(ax, [0, L]);
ylim(ax, [1.5, 4]);

% Initialize plot and legend
h = plot(ax, linspace(0, L, N+1), u(:,1), 'LineWidth', 2, 'DisplayName', sprintf('Numerical: dt = %.4f, dx = %.4f', dt, dx));
hold(ax, 'on');
g = plot(ax, linspace(0, L, N+1), 2.5 + sin(linspace(0, L, N+1) - T), 'k--', 'LineWidth', 2, 'DisplayName', 'Analytical');
legend(ax, 'Location', 'northwest');

% Create VideoWriter object
v = VideoWriter('animate.mp4', 'MPEG-4');
v.FrameRate = 50;
open(v);

% Time-stepping loop
for j = 1:M
    for k = 2:N
        if u(k,j) >= 0
            u(k,j+1) = u(k,j) - dt*u(k,j)*(u(k,j) - u(k-1,j))/dx;
        else
            u(k,j+1) = u(k,j) - dt*u(k,j)*(u(k+1,j) - u(k,j))/dx;
        end
    end

    % boundary condition
    u(1,j+1) = u(end-1,j+1);   
    u(end,j+1) = u(2,j+1);   

    % Update plot
    set(h, 'YData', u(:,j+1));
    title(ax, sprintf('Numerical solution at T = %.3f', j*dt));

    % Write frame to video
    frame = getframe(fig);
    writeVideo(v, frame);
end

% Close video
close(v);



