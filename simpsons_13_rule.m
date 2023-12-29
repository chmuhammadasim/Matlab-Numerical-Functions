fun = input('Enter the function: ', 's');
f = str2func(['@(x) ' fun]);
a = input('Enter the lower limit of integration: ');
b = input('Enter the upper limit of integration: ');
n = input('Enter the number of subintervals (must be even): ');

h = (b - a) / n;
x = a:h:b;

sum_odd = sum(f(x(1:2:end-1)));
sum_even = sum(f(x(2:2:end-2)));

integral_approximation = (h/3) * (f(a) + 4*sum_odd + 2*sum_even + f(b));

disp('Approximate integral using Simpson''s 1/3 rule:');
disp(integral_approximation);
