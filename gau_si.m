/**
 * Solves a system of linear equations using Gaussian elimination with partial pivoting.
 *
 * @param a The coefficient matrix of the system.
 * @param b The right-hand side vector of the system.
 * @param tol The tolerance for the error between successive approximations.
 * @param p The initial approximation vector.
 * @param maxstep The maximum number of iterations to perform.
 * @param[out] x The solution vector.
 * @param[out] k The number of iterations performed.
 */
function [x,k] = gau_si(a,b,tol,p,maxstep)
n=length(b);
x=zeros(1,n);
for k=1:maxstep
    p=x;
    for j=1:n
        x(j)=(b(j)-a(j,1:j-1)*p(1:j-1)'-a(j, j+1:n)*x(j+1:n)')/a(j,j); // Solve for x_j using the previous approximation and the current row of the coefficient matrix
    end
    err=abs(p-x); // Calculate the error between the previous and current approximations
    if err<=tol // Check if the error is within the specified tolerance
        break // If the error is within the tolerance, exit the loop
    else
        continue // If the error is not within the tolerance, continue to the next iteration
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