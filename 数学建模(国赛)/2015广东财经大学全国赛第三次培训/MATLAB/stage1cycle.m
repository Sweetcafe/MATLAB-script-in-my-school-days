clear
clc
h=12000;s=0;vx=1700;vy=0;m=2400;g=1.63; %%初始条件
F=7500 %%假设为最大动力
t=0.01 %%步长

data=[];
for i=0:(pi/18000):(pi/4)
h=12000;s=0;vx=1700;vy=0;m=2400;g=1.633333; %%初始化
i
     for  T=0:t:750
    %%角度
    %m=m-F/2940*t;
    angle=atan(vy/vx)+i;
    Fx=F*cos(angle);
    Fy=m*g-F*sin(angle);
    ax=Fx/m;
    ay=Fy/m;
    m=m-F/2940*t;
 %%水平方向
 vx0=vx;
 vx=vx-ax*t;
 vxt=vx;
 %%s=s+vx*t-0.5*ax*t^2;
 s=s+(vx0+vxt)*t/2;
 %%竖直方向
 vy0=vy;
 vy=vy+ay*t;
 vyt=vy;
 %%h=h-(vy*t+0.5*ay*t^2); 
 h=h-(vy0+vyt)*t/2;
 %%总体
 v=(vx^2+vy^2)^0.5;
 if h<=10
     break
     
 end
     end
     
 %if abs(h-0)<100&&abs(v-57)<13
     
     data(end+1,1)=h;
     data(end,2)=angle;
     data(end,3)=T;
     data(end,4)=vx;
     data(end,5)=vy;
     data(end,6)=v;
     %data(end,7)=;
     %data(end,8)=;
 end

       



data

 
 
    