fun = input('Enter the function: ', 's');
f = str2func(['@(x) ' fun]);
a = input('Enter the lower limit of integration: ');
b = input('Enter the upper limit of integration: ');
n = input('Enter the number of subintervals: ');

h = (b - a) / n;
x = a:h:b;

integral_approximation = h * (0.5 * (f(a) + f(b)) + sum(f(x(2:end-1))));

disp('Approximate integral using the Trapezoidal rule:');
disp(integral_approximation);
