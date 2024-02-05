function romberg_value = Romberg_Func (expression, a, b, n)
 f = inline (expression);
 
 h = b-a;
 r = zeros (2, n + 1);
 r (1,1) = (f (a) + f (b)) / 2 * h;
 fprintf('\nRomberg integration table:\n')
 fprintf ('\n %7.2f \n\n', r (1,1));
 for i = 2: n
    romberg_value = 0;
    for k = 1: 2 ^ (i-2)
       romberg_value = romberg_value + f (a + (k-0.5) * h);
    end
    r(2,1) = (r(1,1) + h * romberg_value) / 2;

   for j = 2: i
      l = 2 ^ (2 * (j-1));
      r (2, j) = r (2, j-1) + (r (2, j-1) -r (1, j-1)) / (l-1);
   end
   for k = 1: i
      fprintf ('% 7.5f', r (2, k));
   end

    fprintf ('\n\n');
    h = h / 2;
    for j = 1: i
       r (1, j) = r (2, j);
    end
 end