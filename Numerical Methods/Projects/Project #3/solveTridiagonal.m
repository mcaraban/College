function [x, r] = solveTridiagonal(a, d, c, b)
    n = length(b);
    x = zeros(n,1);
    r = zeros(n,1);
    for i = 2:n
        m = a(i) / d(i-1);
        d(i) = d(i) - m*c(i-1);
        b(i) = b(i) - m*b(i-1);
    end

    x(n) = b(n) / d(n);
    for i = n-1:-1:1
        x(i) = (b(i) - c(i)*b(i+1)) / d(i);
    end
   r = (a.*[0;x(1:end-1)] + d.*x + c.*[x(2:end);0]) - b;
end










