/**
 * This function takes in five numbers and returns the maximum value among them.
 *
 * @param n1 The first number to compare.
 * @param n2 The second number to compare.
 * @param n3 The third number to compare.
 * @param n4 The fourth number to compare.
 * @param n5 The fifth number to compare.
 *
 * @return The maximum value among the five input numbers.
 */
function [max] = mymax(n1,n2,n3,n4,n5)

    max=n1;
    if(max<n2)
        max=n2;
    end
    if(max<n3)
        max=n3;
    end
    if(max<n4)
        max=n4;
    end
    if(max<n5)
        max=n5;
    end
end