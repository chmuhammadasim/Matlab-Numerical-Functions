function [x,k] = jacobi_i(a,b,tol,p,maxstep)
n=length(b);
x=zeros(1,n);
for k=1:maxstep
    p=x;
    for j=1:n
        x(j)=(b(j)-a(j,1:j-1)*p(1:j-1)'-a(j, j+1:n)*p(j+1:n)')/a(j,j)
    end
    err=abs(p-x);
    if err<=tol
        break
    else
        continue
    end
end
end
% function [x,k] = jacobi_i(a,b,tol,p,maxstep)
% n=length(b);
% x=zeros(1,n);
% for k=1:maxstep
%     p=x;
%     for j=1:n
%         x(j)=((b(j)-a(j,1:j-1))*(p(1:j-1)-a(j,j+1:n))*(p(j+1:n)))/a(j,j);
%     end
%     err=abs(p-x);
%     if err<=tol
%         break
%     else
%         continue
%     end
% end
% end