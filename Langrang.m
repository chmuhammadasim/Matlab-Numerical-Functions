/**
 * Calculates the coefficients of the Lagrange polynomial that passes through the given points.
 *
 * @param x An array of x-coordinates of the points.
 * @param y An array of y-coordinates of the points.
 * @return An array of coefficients of the Lagrange polynomial.
 */
function c= Langrang(x,y)
    w=length(x); // Get the number of points
    n=w-1; // Calculate the degree of the Lagrange polynomial
    l=zeros(w,w); // Initialize the Lagrange polynomial matrix
    for k=1:n+1 // Loop through each point
        v=1; // Initialize the Lagrange polynomial for the current point
        for j=1:n+1 // Loop through each point again
            if k~=j // If the current point is not the same as the current loop index
                v=conv(v,poly(x(j)))/(x(k)-x(j)); // Calculate the Lagrange polynomial for the current point
            end
        end
        l(k,:)=v; // Store the Lagrange polynomial for the current point in the matrix
    end
    c=y*l; // Calculate the coefficients of the Lagrange polynomial
