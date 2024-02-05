
f = @(t,y) 1/t^2 - y/t + sin(t)*y^2;

y0 = -1;
T = 10;

h_list = 2.^(-[2:8]);

err_list = zeros(size(h_list));
for i=1:length(h_list)
    h = h_list(i);
    N = ceil(T/h);
    t = linspace(1,T,N+1);
    y = zeros(size(t));
    y(1) = y0;
    for j=1:N
        k1 = f(t(j), y(j));
        k2 = f(t(j) + h/2, y(j) + h/2*k1);
        k3 = f(t(j) + h/2, y(j) + h/2*k2);
        k4 = f(t(j) + h, y(j) + h*k3);
        y(j+1) = y(j) + h/6*(k1 + 2*k2 + 2*k3 + k4);
    end
    err_list(i) = abs(y(end) - (1+log(T))^(-1));
    
    fprintf('h = 2^-%d: y(%d) = %f\n', i+1, T, y(end));
end

p_list = zeros(size(err_list));
for i=2:length(err_list)-1
    p_list(i) = log(err_list(i-1)/err_list(i)) / log(h_list(i-1)/h_list(i));
    p_list(i) = (p_list(i) + log(err_list(i)/err_list(i+1)) / log(h_list(i)/h_list(i+1))) / 2;
end

% Print the orders of accuracy
fprintf('Order of accuracy:\n');
for i=2:length(p_list)-1
    fprintf('h = 2^-%d: p = %f\n', i+1, p_list(i));
end
