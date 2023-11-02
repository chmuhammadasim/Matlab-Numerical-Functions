% function newt_for(x,y,xp)
% x=input("Enter x");
% y=input("Enter y");
% xp=input("Enter xp");
% rows=length(y);
% cols=rows+1;
% h=x(2)-x(1);
% f=zeros(rows,cols);
% for i=1:rows
%     f(i,1)=x(i);
%     f(i,2)=y(i);
% end
% 
% n=1;
% for j=3:cols
%     for i=rows-n
%         f(i,j)=f(i+1,j-1)-f(i,j-1);
%     end
%     n=n+1;
% end
%  p=0;
%  for i=1:rows
%      temp=(xp-x(i))/h;
%      if(temp>0 && temp<1)
%          p=temp;
%          x0=i;
%      end
%  end
%  y0=f(x0,2);
%  r=1;
%  for i=2:rows
%      r=r*(p-i+2);
%      y0=y0+(r*(f(x0,i+1)/factorial(i-1)));
%  end
%  disp(f);
%  fprintf("Final Answer is: %f\n",y0);


/**
 * This function implements Newton's Forward Interpolation method to find the value of a function at a given point.
 * It takes user input for the values of x, y, and xp, and then calculates the value of the function at xp using the Newton's Forward Interpolation formula.
 * @param None
 * @return None
 */
function newt_for()
    // Take user input for x, y, and xp
    x = input("Enter x: ");
    y = input("Enter y: ");
    xp = input("Enter xp: ");

    // Calculate the number of rows and columns in the f matrix
    rows = length(y);
    cols = rows + 1;

    // Calculate the value of h
    h = x(2) - x(1);

    // Initialize the f matrix with zeros
    f = zeros(rows, cols);

    // Fill the first two columns of the f matrix with x and y values
    for i = 1:rows
        f(i, 1) = x(i);
        f(i, 2) = y(i);
    end

    // Calculate the remaining columns of the f matrix using the Newton's Forward Interpolation formula
    n = 1;
    for j = 3:cols
        for i = 1:rows - n
            f(i, j) = (f(i + 1, j - 1) - f(i, j - 1)) / (x(i + n) - x(i));
        end
        n = n + 1;
    end

    // Find the value of p and x0
    p = 0;
    for i = 1:rows
        temp = (xp - x(i)) / h;
        if (temp > 0 && temp < 1)
            p = temp;
            x0 = i;
        end
    end

    // Find the value of y0 using the Newton's Forward Interpolation formula
    y0 = f(x0, 2);
    r = 1;

    for i = 2:rows
        r = r * (p - i + 2);
        y0 = y0 + (r * f(x0, i + 1));
    end

    // Display the f matrix and the final answer
    disp(f);
    fprintf("Final Answer is: %f\n", y0);
end
