/**
 * This function implements the secant method for finding the root of a given function.
 * The user is prompted to enter the function, initial guesses, maximum number of iterations, and tolerance.
 * The function is then evaluated at the initial guesses, and the secant method is used to iteratively
 * approximate the root of the function until the desired tolerance is reached or the maximum number of
 * iterations is exceeded.
 *
 * @param none
 * @return none
 */
function secent()
{
    // Prompt the user to enter the function to be evaluated
    fun = input('Please enter your function: ', 's');

    // Prompt the user to enter the initial guesses for the root
    x(1) = input('Enter initial guess x0: ');
    x(2) = input('Enter the second initial guess x1: ');

    // Prompt the user to enter the maximum number of iterations and the desired tolerance
    max_iter = input('Enter max iterations: ');
    tol = input('Enter tolerance: ');

    // Define the function to be evaluated using the inline function
    f = inline(fun);

    // Print the table header
    disp('i x(i) x(i+1) err(i)')

    // Iterate using the secant method until the desired tolerance is reached or the maximum number of iterations is exceeded
    for i = 1:max_iter
    {
        // Calculate the next approximation of the root using the secant method
        x(i+2)=x(i+1)-(f(x(i+1))*(x(i +1)-x(i))/(f(x(i+1))-f(x(i))));

        // Calculate the error of the current approximation
        err(i)=abs(x(i+2)-x(i+1));

        // Print the current iteration, the current approximation of the root, the next approximation of the root, and the error
        fprintf('%d %.6f %.6f %.6f\n', i, x(i + 1), x(i + 2), err(i));

        // Check if the desired tolerance has been reached
        if err(i) < tol
        {
            break;
        }
    }

    // Print the final approximation of the root
    root = x(i + 2);
    fprintf('Approximate root: %.6f\n', root);
}
