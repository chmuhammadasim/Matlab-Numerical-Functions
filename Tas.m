fun = input('Enter function:','s');
f = inline(fun);
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');
h = input('Enter step size: ');
n = (b-a)/h;
s1 = f(a);
s2 = f(b);
s = 0;

for i=1:n-1
   x= a+i*h;
  s = s + f(x);
end

area = h/2*(s1+s2+2*s)