/**
 * Performs Gauss forward interpolation to estimate the value of y at a given x.
 *
 * @param x The x value for which to estimate y.
 * @param table_x The array of x values in the table.
 * @param table_y The array of corresponding y values in the table.
 * @return The estimated value of y at x.
 */
function y = gauss_forward_interpolation(x, table_x, table_y) {
    n = length(table_x); // Get the number of points in the table.

    if n < 2 {
        error('Table must have at least two points'); // Throw an error if the table has less than two points.
    }

    i = find(table_x >= x, 1, 'first'); // Find the index of the first x value greater than or equal to x.

    if isempty(i) {
        error('x must be within the range of the table'); // Throw an error if x is outside the range of the table.
    }

    d = zeros(n, n); // Create a matrix to store the divided differences.

    for i = 1:n {
        d(i, 1) = table_y(i); // Set the first column of the matrix to the y values in the table.
    }

    for j = 2:n {
        for i = 1:n-j+1 {
            d(i, j) = (d(i+1, j-1) - d(i, j-1))/(table_x(i+j-1) - table_x(i)); // Calculate the divided differences using the previous column.
        }
    }

    y = d(1, 1); // Initialize the estimated value of y.

    for j = 2:n {
        term = 1; // Initialize the term in the interpolation formula.

        for k = 1:j-1 {
            term = term * (x - table_x(k)); // Calculate the term in the interpolation formula.
        }

        y = y + d(1, j) * term; // Add the term to the estimated value of y.
    }

    return y; // Return the estimated value of y.
}
// function y = gauss_forward_interpolation(x, table_x, table_y)

// n = length(table_x);

// if n < 2
//     error('Table must have at least two points');
// end

// i = find(table_x >= x, 1, 'first');

// if isempty(i)
//     error('x must be within the range of the table');
// end

// d = zeros(n, n);
// for i = 1:n
//     d(i, 1) = table_y(i);
// end

// for j = 2:n
//     for i = 1:n-j+1
//         d(i, j) = (d(i+1, j-1) - d(i, j-1))/(table_x(i+j-1) - table_x(i));
//     end
// end

// y = d(1, 1);
// for j = 2:n
//     term = 1;
//     for k = 1:j-1
//         term = term * (x - table_x(k));
//     end

//     y = y + d(1, j) * term;
// end

// end
