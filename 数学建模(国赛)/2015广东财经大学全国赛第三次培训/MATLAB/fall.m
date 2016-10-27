   clear;close all;clc;%粗避障：由主减速阶段的数据可知，做先加速后减速运动最节省燃料，先关闭主发动机做自由落体（加速运动），一段时间后再开启主发动机进行减速运动。
v=1.8291;  %%初速度
   g=9.8/6;    %%加速度
   t=0.01;      %%步长
   datafall=[];  %%记录数据，自由落体
   dataslow=[];%%开启主发动机进行减速运动
   data=[];
   y=0;    %%下落距离
   m=1285.3;%%粗避障阶段的初质量
   F=7500;%%代入不同的F，通过比较末质量来确定最大末质量对应的F，即最省燃料的推力
for T=0:t:50%%自由落体阶段 步长：t=0.01
    v0=v;
    v=v+g*t;
    vt=v;
    y=y+(v0+vt)/2*t;
    datafall=[datafall;T+t,v,y];
end
   for i=1:5000   %%开启主发动机，做减速运动，i为自由落体的某一行信息，5000=0.01*50
       Y= datafall(i,3);
       V=datafall(i,2);
       time=datafall(i,1);%%自由落体阶段的某一行的信息
       m=1285.3;%%减速运动的初质量
while Y<2300
    %m=m-F/m*t;
    a=(F-m*g)/m;
    m=m-F/m*t;
    V0=V;
    V=V-a*t;
    Vt=V;
    Y=Y+(V0+Vt)/2*t;
    %Y=Y+V0*t+1/2*a*t^2;
    time=time+t;
    data=[data;time,V];%%作图
end
dataslow=[dataslow;i*t,time,V,Y,m];
   end