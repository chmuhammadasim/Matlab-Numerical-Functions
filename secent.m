function secent()
fun = input('Please enter your function: ', 's');
x(1) = input('Enter initial guess x0: ');
x(2) = input('Enter the second initial guess x1: ');
max_iter = input('Enter max iterations: ');
tol = input('Enter tolerance: ');
f = inline(fun);

disp('i x(i) x(i+1) err(i)')
for i = 1:max_iter
    x(i+2)=x(i+1)-(f(x(i+1))*(x(i +1)-x(i))/(f(x(i+1))-f(x(i))));
    err(i)=abs(x(i+2)-x(i+1));
    fprintf('%d %.6f %.6f %.6f\n', i, x(i + 1), x(i + 2), err(i));

    if err(i) < tol
        break
    end
end

root = x(i + 2);
fprintf('Approximate root: %.6f\n', root);
