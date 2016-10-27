function v=fitness(x)
shape=1;%%%%%%%%%%选取形状：长方体=1，棱台=2，圆角台=3，椭圆台=4，椭圆体=5
if shape==1
    Vtub=x(1)*x(2)*x(3);
    if  x(1)>=1.5&&x(2)>=0.5&&x(3)>=0.5&&Vtub>=0.5
v=myfun(x)
    else
        v=1;
    end
end