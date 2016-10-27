inputdata;
m=27
num=num3;
data=[]
for n=1:m
year=2013+n
death=zeros(91,13);%平均死亡率
death(:,1)=0:90;
for i=3:2:13
    for j=1:91
        death(j,i)=(death1(j,i)+death2(j,i)+death3(j,i))/3;       
    end
end
birth=zeros(35,4);%平均出生率
for i=1:4
   for j=1:35
       if j<=5 
           a=6.93/5.93;
       elseif j<=10
               a=71.47/69.47;
       elseif j<=15
           a=89.08/84.08;
       elseif j<=20
           a=53.84/45.84;
       elseif j<=25
           a=23.71/18.71;
       elseif j<=30
           a=8.51/7.51;
       else a=5.68/4.68;
       end
    birth(j,i)=(birth1(j,i)+birth2(j,i)+birth3(j,i))/3*a;
   end
end

fulture=death;     %%预测人口结构


Acw=zeros(1,91);%城市女性a矩阵
for i=15:49
Acw(i)=[0.46*birth(i-14,2)/1000];%%%%%%%%%%%%%缺男女比例系数
end
Bcw=zeros(90,91);%城市女性b矩阵
for j=1:90
    Bcw(j,j)=1-death(j,5)/1000;
end
Lcw=[Acw;Bcw];%城市女性莱斯利矩阵


Fcw=Lcw*num(:,4);
fulture(:,4)=Fcw;         %%更新人口结构

Atw=zeros(1,91);%城镇女性a矩阵
for i=15:49
Atw(i)=[0.46*birth(i-14,3)/1000];%%%%%%%%%%%%%缺男女比例系数
end
Btw=zeros(90,91);%城镇女性b矩阵
for j=1:90
    Btw(j,j)=1-death(j,9)/1000;
end
Ltw=[Atw;Btw];%城镇女性莱斯利矩阵


Ftw=Ltw*num(:,8);
fulture(:,8)=Ftw;          %%更新人口结构

Avw=zeros(1,91);%乡村女性a矩阵
for i=15:49
Avw(i)=[0.46*birth(i-14,4)/1000];%%%%%%%%%%%%%缺男女比例系数
end
Bvw=zeros(90,91);%乡村女性b矩阵
for j=1:90
    Bvw(j,j)=1-death(j,13)/1000;
end
Lvw=[Avw;Bvw];%乡村女性莱斯利矩阵


Fvw=Lvw*num(:,12);
fulture(:,12)=Fvw;          %%更新人口结构


Acm=zeros(1,91);%城市男性a矩阵
for i=15:49
Acm(i)=[0.54*birth(i-14,2)/1000];%%%%%%%%%%%%%缺男女比例系数
end
Bcm=zeros(90,91);%城市男性b矩阵
for j=1:90
    Bcm(j,j)=1-death(j,3)/1000;
end
Lcm=[Acm;Bcm];%城市男性莱斯利矩阵

NBcm=Acw*num(:,4)/0.46*0.54;%%城市男性新生儿
cm=Bcm*num(:,2);            %%非新生城市男性
Fcm=[NBcm;cm];                %%预测的城市男性人口数
fulture(:,2)=Fcm();           %%更新人口结构

Atm=zeros(1,91);%城镇男性a矩阵
for i=15:49
Atm(i)=[0.54*birth(i-14,3)/1000];%%%%%%%%%%%%%缺男女比例系数
end
Btm=zeros(90,91);%城镇镇男性b矩阵
for j=1:90
    Btm(j,j)=1-death(j,7)/1000;
end
Ltm=[Atm;Btm];%城镇镇男性莱斯利矩阵

NBtm=Atw*num(:,8)/0.46*0.54;%%城镇男性新生儿
tm=Btm*num(:,6);            %%非新生城镇男性
Ftm=[NBtm;tm];                %%预测的城镇男性人口数
fulture(:,6)=Ftm;           %%更新人口结构


Avm=zeros(1,91);%乡村男性a矩阵
for i=15:49
Avm(i)=[0.54*birth(i-14,4)/1000];%%%%%%%%%%%%%缺男女比例系数
end
Bvm=zeros(90,91);%乡村男性b矩阵
for j=1:90
    Bvm(j,j)=1-death(j,11)/1000;
end
Lvm=[Avm;Bvm];%莱斯利矩阵

NBvm=Avw*num(:,12)/0.46*0.54;%%乡村男性新生儿
vm=Bvm*num(:,10);            %%非新生乡村男性
Fvm=[NBvm;vm];                %%预测的乡村男性人口数
fulture(:,10)=Fvm;           %%更新人口结构

num=fulture;
%%总人口
population=sum(fulture(:,2))+sum(fulture(:,4))+sum(fulture(:,6))+sum(fulture(:,8))+sum(fulture(:,10))+sum(fulture(:,12))
data=[data;year,population];
end
plot(data(:,1),data(:,2)/10^8)%%作图
xlabel('年份（年）')
ylabel('总人口数量(亿人)')
title('总人口数量变化图')