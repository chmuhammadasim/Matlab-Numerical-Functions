% /**
%  * This function implements the bisection method to find the root of a given function.
%  *
%  * @param f The function to find the root of.
%  * @param a The lower bound of the interval to search for the root.
%  * @param b The upper bound of the interval to search for the root.
%  * @param tol The tolerance level for the root.
%  * @param max_iter The maximum number of iterations to perform.
%  *
%  * @return The root of the function.
%  */
function [c]=bisect(f,a,b,tol,max_iter);

% Prompt the user to enter the function to find the root of
fun=input('pls enter function','s');

% Convert the input function to an inline function
f=inline(fun);

% Prompt the user to enter the lower bound of the interval to search for the root
a=input("Enter initial value");

% Prompt the user to enter the upper bound of the interval to search for the root
b=input("Enter max value");

% Prompt the user to enter the tolerance level for the root
tol=input("Enter total value");

% Prompt the user to enter the maximum number of iterations to perform
a=input("Enter max inter");

% Check if the initial guess is correct
if(f(a)*f(b)>0)
    fprintf("Wrong Guess\n");
    a=input("Enter lower guess");
    b=input("Enter upper guess");
end

% Perform the bisection method to find the root of the function
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

% Return the root of the function
end
