%/**
% * This function performs backward interpolation using Newton's divided difference formula.
% * It takes user inputs for x, y, and xp, and calculates the interpolated value at xp.
% */

function newt_back()
%    // User inputs
    x = input('Enter x: ');% // Input array for x values
    y = input('Enter y: ');% // Input array for y values
    xp = input('Enter xp: ');% // Input value for xp

    %// Calculate the number of rows and columns
    rows = length(y);% // Number of rows in the input array y
    cols = rows + 1;% // Number of columns in the divided difference table

    %// Calculate the step size
    h = x(2) - x(1);% // Step size between consecutive x values

    %// Initialize the divided difference table
    f = zeros(rows, cols); %// Divided difference table with zeros

   % // Fill the first two columns of the divided difference table
    for i = 1:rows 
        f(i, 1) = x(i);% // Copy x values to the first column
        f(i, 2) = y(i);% // Copy y values to the second column
    end

    %// Calculate the remaining columns of the divided difference table
    n = 1;
    for j = 3:cols 
        for i = rows:-1:n+1 
            f(i, j) = f(i, j - 1) - f(i - 1, j - 1); %// Calculate divided differences
        end
        n = n + 1;
    end

    %// Find the appropriate interval for interpolation
    p = 0;
    for i = 1:rows 
        temp = (xp - x(i)) / h;% // Calculate the normalized difference
        if (temp > 0 && temp < 1) 
            p = temp;% // Store the normalized difference
            x0 = i;% // Store the index of the interval
        end
    end

    %// Perform backward interpolation
    y0 = f(x0, 2); % // Initialize the interpolated value
    r = 1;

    for i = 2:rows 
        r = r * (p + i - 2); % // Calculate the product of differences
        y0 = y0 + (r * f(x0, i + 1))/factorial(i-1); % // Update the interpolated value
    end

    %// Display the divided difference table
    disp(f);

    %// Display the final interpolated value
    fprintf('Final Answer is: %f\n', y0);
    end
