function y = gauss_backward_interpolation(x, table_x, table_y)

    n = length(table_x);

    if n < 2
        error('Table must have at least two points');
    end

    i = find(table_x <= x, 1, 'last');

    if isempty(i)
        error('x must be within the range of the table');
    end

    d = zeros(n, n);
    for i = 1:n
        d(i, 1) = table_y(i);
    end

    for j = 2:n
        for i = 1:n-j+1
            d(i, j) = (d(i, j-1) - d(i+1, j-1))/(table_x(i) - table_x(i+j-1));
        end
    end

    
    y = d(n, 1);
    for j = 2:n
        term = 1;
        for k = 1:j-1
            term = term * (x - table_x(n-k+1));
        end

        y = y + d(n-j+1, j) * term;
    end
end
