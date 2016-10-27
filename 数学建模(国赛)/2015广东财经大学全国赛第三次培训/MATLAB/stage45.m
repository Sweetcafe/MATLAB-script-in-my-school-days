   clear;close all;clc;
v=0;  %%初速度
   g=9.8/6;    %%加速度
   t=0.1;      %%步长
   datafall=[];  %%记录数据
   dataslow=[];
   data=[];
   y=0;    %%下落距离
   m=1187.6;
   F=7500;
   
for T=0:t:10
    v0=v;
    v=v+g*t;
    vt=v;
    y=y+(v0+vt)/2*t;
    datafall=[datafall;T+t,v,y];
end
for i=1:100
       Y= datafall(i,3);
       V=datafall(i,2);
       time=datafall(i,1);
       m=1187.6;
while Y<96
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
   
   %作图
% plot(datafall(1:935,1),datafall(1:935,2),'k','LineWidth',2)
 %  hold on 
  % plot(data(:,1),data(:,2),'k','LineWidth',2)
   %title ('精避障阶段与缓速下降阶段时间速度图','FontSize',15)
   %xlabel('时间(s)')
   %ylabel('竖直速度（m/s）')
   