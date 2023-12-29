function Numerical_Diff_all()
    choice = input('Press 1 for function input, or press 2 for table input: ');

    if choice == 1
        choice2 = input('Press 1 for 1st Order Derivatives, 2 for 2nd Order Derivatives, and 3 for Both: ');

        functionx = input('Enter a function in terms of x: ', 's');
        syms x;
        userFunction = str2func(['@(x) ' functionx]);

        disp('Entered Function:');
        disp(userFunction);

        x_o = input('Enter the value of x for differentiation: ');
        h_two_point = input('Enter the step size for two-point formula: ');

        if choice2 == 1 || choice2 == 3
            derivative_two_point_forward = (userFunction(x_o + h_two_point) - userFunction(x_o)) / h_two_point;
            derivative_two_point_backward = (userFunction(x_o) - userFunction(x_o - h_two_point)) / h_two_point;
            derivative_central = (userFunction(x_o + h_two_point) - userFunction(x_o - h_two_point)) / (2 * h_two_point);
            h_three_point = input('Enter the step size for three-point formula: ');
            derivative_three_point_forward = (-3 * userFunction(x_o) + 4 * userFunction(x_o + h_three_point) - userFunction(x_o + 2 * h_three_point)) / (2 * h_three_point);
            derivative_three_point_backward = (userFunction(x_o - 2 * h_three_point) - 4 * userFunction(x_o - h_three_point) + 3 * userFunction(x_o)) / (2 * h_three_point);

            exact_derivative = diff(userFunction, x);
            exact_derivative_value = double(subs(exact_derivative, x, x_o));

            error_two_point_forward = abs(derivative_two_point_forward - exact_derivative_value);
            error_two_point_backward = abs(derivative_two_point_backward - exact_derivative_value);
            error_central = abs(derivative_central - exact_derivative_value);
            error_three_point_forward = abs(derivative_three_point_forward - exact_derivative_value);
            error_three_point_backward = abs(derivative_three_point_backward - exact_derivative_value);

            disp('First-order Derivative (Two-Point Method):');
            disp(['Two-Point Forward Difference: Derivative - ', num2str(derivative_two_point_forward), ', Error - ', num2str(error_two_point_forward)]);
            disp(['Two-Point Backward Difference: Derivative - ', num2str(derivative_two_point_backward), ', Error - ', num2str(error_two_point_backward)]);
            disp(['Central Difference: Derivative - ', num2str(derivative_central), ', Error - ', num2str(error_central)]);
            disp(['Three-Point Forward Difference: Derivative - ', num2str(derivative_three_point_forward), ', Error - ', num2str(error_three_point_forward)]);
            disp(['Three-Point Backward Difference: Derivative - ', num2str(derivative_three_point_backward), ', Error - ', num2str(error_three_point_backward)]);
        end

        if choice2 == 2 || choice2 == 3
            h_second_order = input('Enter the step size for two-point formula second-order difference: ');
            second_order_two_point_forward = (userFunction(x_o + 2 * h_second_order) - 2 * userFunction(x_o + h_second_order) + userFunction(x_o)) / (h_second_order^2);
            second_order_two_point_backward = (userFunction(x_o) - 2 * userFunction(x_o - h_second_order) + userFunction(x_o - 2 * h_second_order)) / (h_second_order^2);
            second_order_derivative_central = (userFunction(x_o + h_second_order) - 2 * userFunction(x_o) + userFunction(x_o - h_second_order)) / (h_second_order^2);
            h_second_order_three_point = input('Enter the step size for three-point formula  second order difference: ');
            second_order_three_point_forward = (-userFunction(x_o + 3 * h_second_order_three_point) + 4 * userFunction(x_o + 2 * h_second_order_three_point) - 5 * userFunction(x_o + h_second_order_three_point) + 2 * userFunction(x_o)) / (h_second_order_three_point^2);
            second_order_three_point_backward = (-2 * userFunction(x_o) + 5 * userFunction(x_o - h_second_order_three_point) - 4 * userFunction(x_o - 2 * h_second_order_three_point) + userFunction(x_o - 3 * h_second_order_three_point)) / (h_second_order_three_point^2);

            exact_second_order_derivative = diff(userFunction, x, 2);
            exact_second_order_derivative_value = double(subs(exact_second_order_derivative, x, x_o));

            error_two_point_forward = abs(second_order_two_point_forward - exact_second_order_derivative_value);
            error_two_point_backward = abs(second_order_two_point_backward - exact_second_order_derivative_value);
            error_central = abs(second_order_derivative_central - exact_second_order_derivative_value);
            error_three_point_forward = abs(second_order_three_point_forward - exact_second_order_derivative_value);
            error_three_point_backward = abs(second_order_three_point_backward - exact_second_order_derivative_value);

            disp('Second-Order Derivative (Two-Point Method):');
            disp(['Two-Point Forward Difference: Derivative - ', num2str(second_order_two_point_forward), ', Error - ', num2str(error_two_point_forward)]);
            disp(['Two-Point Backward Difference: Derivative - ', num2str(second_order_two_point_backward), ', Error - ', num2str(error_two_point_backward)]);
            disp(['Central Difference: Derivative - ', num2str(second_order_derivative_central), ', Error - ', num2str(error_central)]);
            disp(['Three-Point Forward Difference: Derivative - ', num2str(second_order_three_point_forward), ', Error - ', num2str(error_three_point_forward)]);
            disp(['Three-Point Backward Difference: Derivative - ', num2str(second_order_three_point_backward), ', Error - ', num2str(error_three_point_backward)]);
        end

        errors = [error_two_point_forward, error_two_point_backward, error_central, error_three_point_forward, error_three_point_backward];
        [~, best_method_index] = min(errors);

        if best_method_index == 1
            disp('Best Method: Two-Point Forward Difference');
        elseif best_method_index == 2
            disp('Best Method: Two-Point Backward Difference');
        elseif best_method_index == 3
            disp('Best Method: Central Difference');
        elseif best_method_index == 4
            disp('Best Method: Three-Point Forward Difference');
        else
            disp('Best Method: Three-Point Backward Difference');
        end

    elseif choice == 2
        x_values = input('Enter x values: ');
        y_values = input('Enter corresponding y values: ');

        disp('Data Points:');
        disp(['x_values: ' num2str(x_values)]);
        disp(['y_values: ' num2str(y_values)]);

        point_index_first_order = input('Enter the index for first-order differentiation (an integer): ');
        point_index_second_order = input('Enter the index for second-order differentiation (an integer): ');

        if point_index_first_order > 1 && point_index_first_order < length(x_values) && ...
                point_index_second_order > 1 && point_index_second_order < length(x_values)
            h_two_point_first_order = input('Enter the step size for two-point formula (first order): ');
            h_three_point_first_order = input('Enter the step size for three-point formula (first order): ');

            derivative_two_point_forward_first_order = (y_values(point_index_first_order + 1) - y_values(point_index_first_order)) / h_two_point_first_order;
            derivative_three_point_forward_first_order = (-y_values(point_index_first_order + 2) + 4 * y_values(point_index_first_order + 1) - 3 * y_values(point_index_first_order)) / (2 * h_three_point_first_order);

            derivative_two_point_backward_first_order = (y_values(point_index_first_order) - y_values(point_index_first_order - 1)) / h_two_point_first_order;
            derivative_three_point_backward_first_order = (3 * y_values(point_index_first_order) - 4 * y_values(point_index_first_order - 1) + y_values(point_index_first_order - 2)) / (2 * h_three_point_first_order);

            derivative_central_first_order = (y_values(point_index_first_order + 1) - y_values(point_index_first_order - 1)) / (2 * h_two_point_first_order);

            disp('First-order Derivative (Two-Point Method):');
            disp(['Two-Point Forward Difference: ', num2str(derivative_two_point_forward_first_order)]);
            disp(['Two-Point Backward Difference: ', num2str(derivative_two_point_backward_first_order)]);
            disp(['Two-Point Central Difference: ', num2str(derivative_central_first_order)]);
            disp('First-order Derivative (Three-Point Method):');
            disp(['Three-Point Forward Difference: ', num2str(derivative_three_point_forward_first_order)]);
            disp(['Three-Point Backward Difference: ', num2str(derivative_three_point_backward_first_order)]);

            h_two_point_second_order = input('Enter the step size for two-point formula (second order): ');
            h_three_point_second_order = input('Enter the step size for three-point formula (second order): ');

            second_order_derivative_two_point_forward = (y_values(point_index_second_order + 2) - 2 * y_values(point_index_second_order + 1) + y_values(point_index_second_order)) / (h_two_point_second_order^2);
            second_order_derivative_three_point_forward = (-y_values(point_index_second_order + 2) + 4 * y_values(point_index_second_order + 1) - 5 * y_values(point_index_second_order) + 2 * y_values(point_index_second_order - 1)) / (h_three_point_second_order^2);

            second_order_derivative_two_point_backward = (y_values(point_index_second_order) - 2 * y_values(point_index_second_order - 1) + y_values(point_index_second_order - 2)) / (h_two_point_second_order^2);
            second_order_derivative_three_point_backward = (-2 * y_values(point_index_second_order) + 5 * y_values(point_index_second_order - 1) - 4 * y_values(point_index_second_order - 2) + y_values(point_index_second_order - 3)) / (h_three_point_second_order^2);

            second_order_derivative_central = (y_values(point_index_second_order + 1) - 2 * y_values(point_index_second_order) + y_values(point_index_second_order - 1)) / (h_two_point_second_order^2);

            disp('Two-Point Forward Difference:');
            disp(second_order_derivative_two_point_forward);
            disp('Two-Point Backward Difference:');
            disp(second_order_derivative_two_point_backward);
            disp('Central Difference:');
            disp(second_order_derivative_central);
            disp('Second-Order Derivative (Three-Point Method):');
            disp('Three-Point Forward Difference:');
            disp(second_order_derivative_three_point_forward);
            disp('Three-Point Backward Difference:');
            disp(second_order_derivative_three_point_backward);

        else
            disp('Invalid indexes. The indexes must be within the range [2, length(x_values)].');
        end

    else
        disp('Invalid choice. Please enter 1 or 2.');
    end
end

