clear
clc
car=xlsread('前三问输入表.xls','B2:B4');%%读取小车数量
carmod=xlsread('前三问输入表.xls','B7:D9');%%读取小车型号
truckmod=xlsread('前三问输入表.xls','B12:D14');%%读取货车型号
car1=car(1);%待运Ⅰ号小车数量（默认为156）
car2=car(2);%待运Ⅱ号小车数量（默认为102）
car3=car(3);%待运Ⅲ号小车数量（默认为39）
data=[];

%while car1>0&&car2>0&&car3>0
    
    while car3>0
        plan=zeros(1,10);%记录装车方案
        plan(1)=11;%调用1-1型货车
        %%下层装车方案
        long=truckmod(1,1);%下层剩余长度（初始值为19）
        while car3>0&&long>carmod(3,1);%carmod(3,1)即Ⅲ号小车长度（默认为4.63）
            long=long-carmod(3,1)-0.1;
            car3=car3-1;%待运Ⅲ号小车数量减1
            plan(9)=plan(9)+1;%更新plan数据
        end
        while car1>0&&long>carmod(1,1);
            long=long-carmod(1,1)-0.1;
            car1=car1-1;
            plan(7)=plan(7)+1;
        end
        while car2>0&&long>carmod(2,1);
            long=long-carmod(2,1)-0.1;
            car2=car2-1;
            plan(8)=plan(8)+1;
        end
        plan(10)=long+0.1
        %%上层装车方案
        long=truckmod(1,1);%上层剩余长度（初始值为19）
        while car1>0&&long>carmod(1,1)+0.1;
            
    end
%end
data



