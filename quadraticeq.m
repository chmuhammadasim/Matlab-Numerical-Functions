/**
 * Solves a quadratic equation of the form ax^2 + bx + c = 0.
 *
 * @param a The coefficient of x^2.
 * @param b The coefficient of x.
 * @param c The constant term.
 * @return An array containing the two roots of the equation.
 */
function [x1,x2] = quadraticeq(a,b,c)

    % Calculate the discriminant of the quadratic equation.
    d=sqrt(b^2-4*a*c);

    % Calculate the two roots of the quadratic equation using the quadratic formula.
    x1=(-b+d)/(2*a);
    x2=(-b-d)/(2*a);
    
end
function [x1,x2] = quadraticeq(a,b,c)

d=sqrt(b^2-2*a*c);

x1=(-b+d)/(2*a);

x2=(-b-d)/(2*a);
end
