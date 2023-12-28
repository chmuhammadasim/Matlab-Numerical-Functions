function Project()
num=0;

% Display a welcome message
fprintf("\n\n\nWelcome to Program of\n");
fprintf("Interpolation (Centeral Based)\n\n\n");

while(num ~= 5)

    % Display the menu options
    fprintf("Select from following MENU \n");
    fprintf("1--Gauss Forward Interpolation\n");
    fprintf("2--Gauss Backward Interpolation\n");
    fprintf("3--Bessel Interpolation \n");
    fprintf("4--Stirling Interpolation\n");
    fprintf("5--Exit\n\n");

    try
        % Prompt the user to enter the function number
        num = input('\nEnter Funtion number you Want to Use: ');

        if (num == 1)
            % Gauss Forward Interpolation
            % Prompt the user to enter the values of x and y
            table_x = input('\nEnter Values of x: ');
            table_y = input('\nEnter Values of y: ');

            % Check if the lengths of x and y are equal
            if length(table_x) ~= length(table_y)
                fprintf('\n\nError: The lengths of x and y must be equal.\n\n');
                continue;
            end

            % Prompt the user to enter the point of interpolation
            x = input('\nEnter Values of Point of Interpolation: ');

            % Check if the point of interpolation is not 0
            if x == 0
                fprintf('\n\nError: Point of interpolation (x) cannot be 0.\n\n');
                continue;
            end

            % Calculate the divided difference table
            n = length(table_x);
            d = zeros(n, n);

            for i = 1:n
                d(i, 1) = table_y(i);
            end

            for j = 2:n
                for i = 1:n-j+1
                    d(i, j) = (d(i+1, j-1) - d(i, j-1))/(table_x(i+j-1) - table_x(i));
                end
            end

            % Calculate the interpolated value
            y = d(1, 1);
            for j = 2:n
                term = 1;
                for k = 1:j-1
                    term = term * (x - table_x(k));
                end
                y = y + d(1, j) * term;
            end

            % Display the interpolated value
            fprintf('\n\n Value of F(%d) is: %f\n', x, y);

            %Plot the graph for Gauss Forward Interpolation
            %Plot the points
            plot(table_x, table_y, 'o'); 
            hold on;
            %Highlight interpolated point
            plot(x, y, 'rx'); 
            title('Gauss Forward Interpolation');
            xlabel('x');
            ylabel('y');
            legend('Data Points', 'Interpolated point', 'Location', 'best');
            hold off;
            %show the graph
            figure;
        end

        % Gauss Backward Interpolation
        if (num == 2)
            % Prompt the user to enter the values of x and y
            table_x = input('\nEnter Values of x: ');
            table_y = input('\nEnter Values of y: ');

            % Check if the lengths of x and y are equal
            if length(table_x) ~= length(table_y)
                fprintf('\n\nError: The lengths of x and y must be equal.\n\n');
                continue;
            end

            % Prompt the user to enter the point of interpolation
            x = input('\nEnter Values of Point of Interpolation: ');

            % Check if the point of interpolation is not 0
            if x == 0
                fprintf('\n\nError: Point of interpolation (x) cannot be 0.\n\n');
                continue;
            end

            % Calculate the divided difference table
            n = length(table_x);
            d = zeros(n, n);

            for i = 1:n
                d(i, 1) = table_y(i);
            end

            for j = 2:n
                for i = 1:n-j+1
                    d(i, j) = (d(i, j-1) - d(i+1, j-1))/(table_x(i) - table_x(i+j-1));
                end
            end

            % Calculate the interpolated value
            y = d(n, 1);
            for j = 2:n
                term = 1;
                for k = 1:j-1
                    term = term * (x - table_x(n-k+1));
                end
                y = y + d(n-j+1, j) * term;
            end

            % Display the interpolated value
            fprintf('\n\n Value of F(%d) is: %f\n', x, y);

            %Plot the graph for Gauss Backward Interpolation
            %Plot the points
            plot(table_x, table_y, 'o'); 
            hold on;
            %Highlight interpolated point
            plot(x, y, 'rx'); 
            title('Gauss Backward Interpolation');
            xlabel('x');
            ylabel('y');
            legend('Data Points', 'Interpolated point', 'Location', 'best');
            hold off;
            %show the graph
            figure;
        end

        % Bessel Interpolation
        if (num == 3)
            % Prompt the user to enter the values of x and y
            table_x = input('\nEnter Values of x: ');
            table_y = input('\nEnter Values of y: ');

            % Check if the lengths of x and y are equal
            if length(table_x) ~= length(table_y)
                fprintf('\n\nError: The lengths of x and y must be equal.\n\n');
                continue;
            end

            % Prompt the user to enter the point of interpolation
            x = input('\nEnter Values of Point of Interpolation: ');

            % Check if the point of interpolation is not 0
            if x == 0
                fprintf('\n\nError: Point of interpolation (x) cannot be 0.\n\n');
                continue;
            end

            % Calculate the divided difference table
            n = length(table_x);
            d = zeros(n, n);

            for i = 1:n
                d(i, 1) = table_y(i);
            end

            for j = 2:n
                for i = 1:n-j+1
                    d(i, j) = (d(i+1, j-1) - d(i, j-1))/(table_x(i+j-1) - table_x(i));
                end
            end

            % Calculate the interpolated value
            y = d(1, 1);
            for j = 2:n
                term = 1;
                for k = 1:j-1
                    term = term * (x - table_x(k));
                    y = y + d(1, j) * term;
                end
            end

            % Display the interpolated value
            fprintf('\n\n Value of F(%d) is: %f\n', x, y);

            %Plot the graph for Bessel Interpolation
            %Plot the points
            plot(table_x, table_y, 'o'); 
            hold on;
            %Highlight interpolated point
            plot(x, y, 'rx'); 
            title('Bessel Interpolation');
            xlabel('x');
            ylabel('y');
            legend('Data Points', 'Interpolated point', 'Location', 'best');
            hold off;
            %show the graph
            figure;
        end


        if (num == 4)
            % Stirling Interpolation
            % Prompt the user to enter the values of x and y
            table_x = input('\nEnter Values of x: ');
            table_y = input('\nEnter Values of y: ');

            % Check if the lengths of x and y are equal
            if length(table_x) ~= length(table_y)
                fprintf('\n\nError: The lengths of x and y must be equal.\n\n');
                continue;
            end

            % Prompt the user to enter the point of interpolation
            x = input('\nEnter Values of Point of Interpolation: ');

            % Check if the point of interpolation is not 0
            if x == 0
                fprintf('\n\nError: Point of interpolation (x) cannot be 0.\n\n');
                continue;
            end

            % Calculate the divided difference table
            n = length(table_x);
            d = zeros(n, n + 1);

            for i = 1:n
                d(i, 1) = table_y(i);
            end

            for j = 2:n+1
                for i = 1:n-j+1
                    d(i, j) = d(i+1, j-1) - d(i, j-1);
                end
            end

            % Calculate the factorial of 0 to n-1
            fact_den = factorial(0:n-1);

            % Calculate the Stirling coefficients
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

            % Display the interpolated value
            fprintf('\n\n Value of F(%d) is: %f\n', x, y);

            %Plot the graph for Stirling Interpolation
            %Plot the points
            plot(table_x, table_y, 'o'); 
            hold on;
            %Highlight interpolated point
            plot(x, y, 'rx'); 
            title('Stirling Interpolation');
            xlabel('x');
            ylabel('y');
            legend('Data Points', 'Interpolated point', 'Location', 'best');
            hold off;
            %show the graph
            figure;
        end

    catch
        % Handle invalid input
        fprintf("\n\n\nInvalid input. Please enter a valid numeric value.\n\n\n");
        num = 0;
    end

    % Exit the program
    if num == 5
        fprintf("\n\n\nThanks for using Program\n\n\n");
    end

    % Handle wrong input
    if num < 0
        fprintf("\n\n\nWRONG Input Please Enter Correct Value\n\n\n");
    end

    if num > 6
        fprintf("\n\n\nWRONG Input Please Enter Correct Value\n\n\n");
    end
    
    end