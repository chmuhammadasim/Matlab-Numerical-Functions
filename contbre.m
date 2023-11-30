% num=1;
% while(num<10)
%     if(num==5)
%         break;
%     else
%         fprintf("value %d \n",num);
%     end
%     num1=num+1;
%     num=num1;
% end
num=1;
while(num<10)
    if(num>5)
        continue;
    else
        fprintf("value %d \n",num);
    end
    num1=num+1;
    num=num1;
end