function [ min ] = mymin( a,b,c,d,e )
    a=3; b=4; c=5; d=6; e=7;
    min=a;
if (min>b)
    min=b;
end
if (min>c)
    min=c;
end
if (min>d)
    min=d;
end
if (min>e)
    min=e;
end
    fprintf('Minimum number: %d', min);
end