function [c]=bisecttest()
fu = @(x) sin(x)-(5*x) +2;
a=0.4;
b=0.6;
tol=10^-3;
max=3;
for k=1:max
    c=((a+b)/2);
    if ((fu(a)*fu(c))<0)
        b=c;
    end
    if ((fu(c)*fu(b))<0)
        a=c;
    end
    if (abs(fu(c))<tol)
        break;
    end
end
