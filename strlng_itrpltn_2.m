function strlng_itrpltn_2(x,y,xp)
%x=[0 4 8 12 16];
%y=[14 24 32 35 40];
% x = input('Enter x: ');
% y = input('Enter f: ');
% 
% xp = input('Enter required xp: ');

rows = length(y);
cols = rows+1;
h = x(2) - x(1);

f = zeros(rows, cols);

% add data to the table
for i = 1:rows
    f(i, 1) = x(i);
    f(i, 2) = y(i);
end


% find the deltas
n = 1;
for j = 3:cols
    for i = 1:rows-n
        f(i, j) = f(i+1, j-1) - f(i, j-1)
    end
    n = n +1;
end
% find the y0
p = 0;
for i = 1:rows
   temp = (xp-x(i))/h;
   if(( temp > 0 && temp < 1))
       p = temp;
r=i;
origin=x(r)
end
end
p
f0=f(r,2);
df_1=f((r-1),3);
df0=f(r,3);
d2f_1=f((r-1),4);
d3f_1=f((r-2),5);
d3f_2=f((r-1),5);
d4f_1=f((r-2),6);
fp=f0+(p*(df0+df_1))/2+((p*p)*d2f_1)/2+(p*((p*p)-1)*(d3f_1+d3f_2))/12+((p*p)*((p*p)-1)*d4f_1)/24