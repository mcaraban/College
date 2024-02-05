function x = Newtons_Method(f,fd,x0,nmax,epsilon,delta)
    x = x0;
    y= f(x);
    for n=1:nmax
        n
        x = x - y/fd(x)
        y = f(x)
        d= y/fd(x);
        if abs(y) < delta
            return;
        end
        if abs(d) < epsilon
            return;
        end
    end 
    end 
fprintf ('\n %7.2f \n\n', r (1,1));
