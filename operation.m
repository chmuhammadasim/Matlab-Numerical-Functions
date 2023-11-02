/**
 * This function performs basic arithmetic operations on two numbers.
 *
 * @param num1 The first number to be used in the operations.
 * @param num2 The second number to be used in the operations.
 * @return Four values representing the sum, product, ratio, and difference of the two numbers.
 */
function [a,b,c,d] = operation(num1,num2)
    num1=20; num2=5; // These lines are unnecessary since num1 and num2 are already passed as parameters.
    a = num1 + num2 ; // Adds num1 and num2 and stores the result in a.
    fprintf('Sum:%d \n',a ); // Prints the sum to the console.
    b = num1 * num2 ; // Multiplies num1 and num2 and stores the result in b.
    fprintf('Product:%d \n',b); // Prints the product to the console.
    c = num1 / num2 ; // Divides num1 by num2 and stores the result in c.
    fprintf('Ratio:%d \n',c); // Prints the ratio to the console.
    d = num1 - num2 ; // Subtracts num2 from num1 and stores the result in d.
    fprintf('Difference:%d \n', d); // Prints the difference to the console.
end

