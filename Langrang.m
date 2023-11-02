function c= Langrang(x,y)
w=length(x);
n=w-1;
l=zeros(w,w);
for k=1:n+1
    v=1;
    for j=1:n+1
        if k~=j
            v=conv(v,poly(x(j)))/(x(k)-x(j));
        end
    end
    l(k,:)=v;
end
c=y*l;