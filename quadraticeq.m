function [x1,x2] = quadraticeq(a,b,c)

d=sqrt(b^2-2*a*c);

x1=(-b+d)/(2*a);

x2=(-b-d)/(2*a);
end
