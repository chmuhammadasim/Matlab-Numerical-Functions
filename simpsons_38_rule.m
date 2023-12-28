% func_str = input('Enter the function to be integrated (e.g., x^2): ', 's');
% func_str = ['@(x) ', func_str];
% func = str2func(func_str);
% 
% a = input('Enter the lower limit of integration: ');
% b = input('Enter the upper limit of integration: ');
% n = input('Enter the number of intervals: ');
% result = simpsons_38_rule(func, a, b, n);
% disp(['The result of integration is: ', num2str(result)]);
function result = simpsons_38_rule(func, a, b, n)
    h = (b - a) / n;
    fa = func(a);
    fb = func(b);
    x = a + h : h : b - h;
    fx = func(x);
    result = (3 * h / 8) * (fa + 3 * sum(fx(1:3:end-1)) + 3 * sum(fx(2:3:end-2)) + 2 * sum(fx(3:3:end-3)) + fb);
end