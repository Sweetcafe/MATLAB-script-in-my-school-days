   clear;close all;clc;
v=1.8291;  %%初速度
   g=9.8/6;    %%加速度
   t=0.01;      %%步长
   datafall=[];  %%记录数据
   dataslow=[];
   data=[]
   y=0;    %%下落距离
   m=1285.3;
   F=7500;
for T=0:t:50
    v0=v;
    v=v+g*t;
    vt=v;
    y=y+(v0+vt)/2*t;
    datafall=[datafall;T+t,v,y];
end
  i=4416 %for i=1:5000
       Y= datafall(i,3);
       V=datafall(i,2);
       time=datafall(i,1);
       m=1285.3;
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
  % end
   plot(datafall(1:4416,1),datafall(1:4416,2),'k','LineWidth',2)
   hold on 
   plot(data(:,1),data(:,2),'k','LineWidth',2)
   title ('粗避障阶段时间速度图','FontSize',15);
   xlabel('时间(s)')
   ylabel('竖直速度（m/s）')
   
   