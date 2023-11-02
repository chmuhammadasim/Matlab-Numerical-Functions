% /**
%  * Solves a system of linear equations using the Jacobi iterative method.
%  *
%  * @param a The coefficient matrix of the system.
%  * @param b The constant vector of the system.
%  * @param tol The tolerance for the error between iterations.
%  * @param p The initial guess for the solution vector.
%  * @param maxstep The maximum number of iterations to perform.
%  * @param x The solution vector.
%  * @param k The number of iterations performed.
%  *
%  * @return The solution vector and the number of iterations performed.
%  */
function [x,k] = jacobi_i(a,b,tol,p,maxstep)

% Get the length of the constant vector b
n=length(b);

% Initialize the solution vector x to all zeros
x=zeros(1,n);

% Iterate up to the maximum number of iterations
for k=1:maxstep
    
    % Set the previous solution vector p to the current solution vector x
    p=x;
    
    % Iterate over each row of the coefficient matrix a
    for j=1:n
        
        % Calculate the new value of the jth element of the solution vector x
        x(j)=(b(j)-a(j,1:j-1)*p(1:j-1)-a(j, j+1:n)*p(j+1:n))/a(j,j);
    end
    
    % Calculate the error between the previous solution vector p and the current solution vector x
    err=abs(p-x);
    
    % If the error is less than or equal to the tolerance, exit the loop
    if err<=tol
        break
    else
        % Otherwise, continue to the next iteration
        continue
    end
end

% Return the solution vector x and the number of iterations performed k
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