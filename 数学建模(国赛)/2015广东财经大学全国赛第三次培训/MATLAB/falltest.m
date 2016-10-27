   clear;close all;clc;
v=1.8291;  %%初速度
   g=9.8/6;    %%加速度
   t=0.1;      %%步长
   datafall=[];  %%记录数据
   dataslow=[];
   y=0;    %%下落距离
   count=0;
   m=1285.3;
   F=7500;
for T=0:t:50
    v0=v;
    v=v+g*t;
    vt=v;
    y=y+(v0+vt)/2*t;
    datafall=[datafall;T+t,v,y];
end
   i=413
       Y= datafall(i,3);
       V=datafall(i,2);
       time=datafall(i,1);
while Y<2300
    %m=m-F/m*t;
    a=(7500-m*g)/m;
    m=m-F/m*t;
    V0=V;
    V=V-a*t;
    Vt=V;
    Y=Y+(V0+Vt)/2*t;
    %Y=Y+V0*t+1/2*a*t^2;
end
dataslow=[dataslow;i,V,Y];
   