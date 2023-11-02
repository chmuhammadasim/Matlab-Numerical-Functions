/**
 * This function uses the Newton-Raphson method to find the root of a given function.
 * 
 * @param fun The function to find the root of.
 * @param mac_itr The maximum number of iterations to perform.
 * @param tol The tolerance for the root.
 * @param x The initial guess for the root.
 */
function newt_raph(fun,mac_itr,tol,x)

    % Prompt the user to enter the function to find the root of
    fun=input('pls enter your function','s')
    
    % Prompt the user to enter the initial guess for the root
    x(1)=input('Enter initial guess');
    
    % Prompt the user to enter the maximum number of iterations to perform
    max_iter =input('Enter max itera');
    
    % Prompt the user to enter the tolerance for the root
    tol=input('Enter tolerance');
    
    % Convert the function string to a function handle
    f=inline(fun);
    
    % Calculate the derivative of the function and convert it to a function handle
    der=diff(str2sym(fun))
    d=inline(der);
    
    % Display the header for the table of iteration results
    disp('i x(x+1) err(i)')
    
    % Iterate using the Newton-Raphson method until the maximum number of iterations is reached or the tolerance is met
    for i=1:max_iter
        x(i+1)=x(i)-((f(x(i))/d(x(i))));
        err(i)=abs(x(i+1)-x(i))
        if(err(i)<tol)
            break
        end
    end        
    % Display the root of the function
root=x(i+1)

end
