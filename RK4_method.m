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
    k1 = h*f(x(n),y(n));
    k2 = h*f(x(n)+ h/2, y(n)+ k1/2);
    k3 = h*f(x(n)+ h/2, y(n)+ k2/2);
    k4 = h*f(x(n)+ h, y(n)+ k3);
    y(n+1) = y(n) +(1/6)*(k1+2*k2+2*k3+k4);
end

disp('Values of x:');
disp(x);
disp('Values of y:');
disp(y);
plot(x,y)