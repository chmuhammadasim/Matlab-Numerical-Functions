function [c]=bisect(f,a,b,tol,max_iter)
fun=input('pls enter function','s')
f=inline(fun)
a=input("Enter initial value")
b=input("Enter max value")
tol=input("Enter total value")
a=input("Enter max inter")
if(f(a)*f(b)>0)
    fprintf("Wrong Guess\n");
    a=input("Enter lower guess")
    b=input("Enter upper guess")
end

    for k=1:max_iter
        c=((a+b)/2);
        if ((f(a)*f(c))<0)
            b=c;
        end
        if ((f(c)*f(b))<0)
            a=c;
        end
        if (abs(f(c))<tol)
            break;
        end
    end
end
