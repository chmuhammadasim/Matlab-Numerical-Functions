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
function newt_for()
x = input("Enter x: ");
y = input("Enter y: ");
xp = input("Enter xp: ");

rows = length(y);
cols = rows + 1;
h = x(2) - x(1);
f = zeros(rows, cols);

for i = 1:rows
    f(i, 1) = x(i);
    f(i, 2) = y(i);
end

n = 1;
for j = 3:cols
    for i = 1:rows - n
        f(i, j) = (f(i + 1, j - 1) - f(i, j - 1)) / (x(i + n) - x(i));
    end
    n = n + 1;
end

p = 0;
for i = 1:rows
    temp = (xp - x(i)) / h;
    if (temp > 0 && temp < 1)
        p = temp;
        x0 = i;
    end
end

y0 = f(x0, 2);
r = 1;

for i = 2:rows
    r = r * (p - i + 2);
    y0 = y0 + (r * f(x0, i + 1));
end

disp(f);
fprintf("Final Answer is: %f\n", y0);
