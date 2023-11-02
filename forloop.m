function forloop(num)
for a=0:num
    fprintf("value %d \n",a+1);
    if(num>5)
        continue;
    end
end

end