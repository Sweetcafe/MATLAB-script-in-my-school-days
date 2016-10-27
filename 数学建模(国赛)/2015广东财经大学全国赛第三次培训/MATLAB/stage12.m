clear
clc
h=12000;s=0;vx=1700;vy=0;m=2400;g=1.63;T=0; %%初始条件
F=7500; %%假设为最大动力
t=1 %%步长
angle=[];
while h>0
    %%角度
    %angle=atan(vy/vx);
    Fx=F;
    Fy=m*g;
    %%angle=atan(vy/vx);
    ax=Fx/m;
    ay=Fy/m;
    m=m-F/2940*t;
 %%水平方向
 vx0=vx;
 vx=vx-ax*t;
 vxt=vx;
 s=s+(vx0+vxt)*t/2;
 %%竖直方向
 vy0=vy;
 vy=vy+ay*t;
 vyt=vy;
 h=h-(vy0+vyt)*t/2;
 T=T+t;
end
h
s
vx
vy
T
m

 
 
    