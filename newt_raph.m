function newt_raph(fun,mac_itr,tol,x)
fun=input('pls enter your function','s')
x(1)=input('Enter initial guess');
max_iter =input('Enter max itera');
tol=input('Enter tolerance');
f=inline(fun);
der=diff(str2sym(fun))
d=inline(der);
disp('i x(x+1) err(i)')
for i=1:max_iter
    x(i+1)=x(i)-((f(x(i))/d(x(i))));
    err(i)=abs(x(i+1)-x(i))
    if(err(i)<tol)
        break
    end
end
root=x(i+1)