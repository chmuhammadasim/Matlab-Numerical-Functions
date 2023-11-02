/**
 * This function prints out the values of a for loop from 0 to the given number.
 *
 * @param num The number to loop up to.
 */
function forloop(num)
    for a=0:num
        fprintf("value %d \n",a+1); // Print the value of a plus 1
        if(num>5)
            continue; // If num is greater than 5, skip to the next iteration of the loop
        end
    end
end
