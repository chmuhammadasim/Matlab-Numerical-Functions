function y = stirling_interpolation(x, table_x, table_y)
    n = length(table_x);
    d = zeros(n, n + 1);

    for i = 1:n
        d(i, 1) = table_y(i);
    end

    % Calculate the forward differences
    for j = 2:n+1
        for i = 1:n-j+1
            d(i, j) = d(i+1, j-1) - d(i, j-1);
        end
    end

    % Calculate the Stirling coefficients
    fact_den = factorial(0:n-1);
    stirling_coeff = zeros(n, n);

    for i = 1:n
        for j = 1:i
            stirling_coeff(i, j) = d(i, j) / (fact_den(j) * prod(x - table_x(1:i-1)));
        end
    end

    % Calculate the interpolated value
    y = d(1, 1);
    for j = 2:n
        term = 1;
        for k = 1:j-1
            term = term * (x - table_x(k));
        end

        y = y + stirling_coeff(j, j) * term;
    end
end
