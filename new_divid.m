% function new_divid()
%     x = input('Enter x: ');% // Input array for x values
%     y = input('Enter y: ');% // Input array for y values
%     xp = input('Enter xp: ');% // Input value for xp
% 
%     n=length(y);
%     f= zeros(n,n);
%     f(:,1)=y;
% 
%     for j=2:n
%         for i=j:n
%             f(i,j)=(f(i,j-1)-f(i-1,j-1))/(x(i)-x(i-j+1))
%         end
%     end
%     inter_value=f(1,1);
%     for j=2:n
%         prev=1;
%         for i=1:j-1
%             prev = prev * (xp-x(i));
%         end
%         inter_value=inter_value+ f(j,j)*prev
%     end
% end
function interpolated_value = newton_interpolation(x, y, xp)
    x = input('Enter x: ');
    y = input('Enter y: ');
    xp = input('Enter xp: ');

    n = length(y);
    f = zeros(n, n);
    f(:, 1) = y;

    for j = 2:n
        for i = j:n
            f(i, j) = (f(i, j-1) - f(i-1, j-1)) / (x(i) - x(i-j+1));
        end
    end
    
    c=f(n,n);
    for k=n-1:-1:1
        c=conv(c,poly(c(k)));
        m=length(c);
        c(m)=c(m)+f(k,k);
    end
    
    X=linspace(x(1),x(n),100);
    Y=polyval(x,y,"k");
    hold on
    plot(X,Y,"*");
end