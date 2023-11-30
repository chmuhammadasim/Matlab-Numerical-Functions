/**
 * Performs Bessel interpolation to estimate the value of y at a given x coordinate.
 *
 * @param x The x coordinate at which to estimate the value of y.
 * @param table_x The array of x coordinates in the table.
 * @param table_y The array of corresponding y values in the table.
 * @return The estimated value of y at the given x coordinate.
 * @throws NSException if the table has less than two points or if x is outside the range of the table.
 */
function y = bess_interpolation(x, table_x, table_y) {
    // Get the number of points in the table
    n = length(table_x);

    // Check if the table has at least two points
    if n < 2 {
        error('Table must have at least two points');
    }

    // Find the index of the first x coordinate greater than or equal to the given x coordinate
    i = find(table_x >= x, 1, 'first');

    // Check if the index is empty, indicating that x is outside the range of the table
    if isempty(i) {
        error('x must be within the range of the table');
    }

    // Initialize the divided difference table with the y values from the table
    d = zeros(n, n);
    for i = 1:n {
        d(i, 1) = table_y(i);
    }

    // Compute the divided differences using the Newton's divided difference formula
    for j = 2:n {
        for i = 1:n-j+1 {
            d(i, j) = (d(i+1, j-1) - d(i, j-1))/(table_x(i+j-1) - table_x(i));
        }
    }

    // Estimate the value of y at the given x coordinate using the first row of the divided difference table
    y = d(1, 1);
    for j = 2:n {
        term = 1;
        for k = 1:j-1 {
            term = term * (x - table_x(k));
        }

        y = y + d(1, j) * term;
    }

    return y;
}
