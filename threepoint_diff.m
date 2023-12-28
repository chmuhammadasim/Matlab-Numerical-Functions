function threepoint_diff(f,x,h)
fun = input("Enter function");
f= inline(fun);
x = input("Enter x");
h = input("Enter y");
forward2p = (f(x+h)-f(x))/h;
backward2p = (f(x)-f(x-h))/h;
central2p = (f(x+h)-f(x-h))/(2*h);

forward3p = (f(x+2*h)+(4*f(x+h))-(3*f(x)))/(2*h);
backwar3p = (f(x-2*h)-(4*f(x-h))+(3*f(x)))/(2*h);
end