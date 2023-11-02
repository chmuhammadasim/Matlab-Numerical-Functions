function [a,b,c,d] = operation(num1,num2)
    num1=20; num2=5;
    a = num1 + num2 ;
    fprintf('Sum:%d \n',a );
    b = num1 * num2 ;
    fprintf('Product:%d \n',b);
    c = num1 / num2 ;
    fprintf('Ratio:%d \n',c);
    d = num1 - num2 ;
    fprintf('Difference:%d \n', d);
end