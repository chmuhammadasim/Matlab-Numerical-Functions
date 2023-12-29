fun = input('Enter the function: ', 's');
f = str2func(['@(x, y) ' fun]);
h = input('Enter the step size: ');
a = input('Enter the initial: ');
b = input('Enter the endpoint: ');
M = (b - a) / h;
y = zeros(1, M+1);
x = a:h:b;
y(1) = a;
for n = 1:M
    y(n+1) = y(n) + h * f(x(n), y(n));
end

disp('Values of x:');
disp(x);
disp('Values of y:');
disp(y);
plot(x, y);
