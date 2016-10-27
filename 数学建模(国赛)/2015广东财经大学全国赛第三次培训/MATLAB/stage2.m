clc;clear;close all; 
g=9.8/6;  %月球重力加速度 
mo=1325.3;%探测器初始质量 
Ve=2940; %比冲 
Vxo=32.1306; %水平初速度 
Vyo=47.1220; %竖直初速度 
Alpha=atan(Vyo/Vxo);%初速度与水平方向的夹角 
F=5158.6;   %推力 
t=0;          %初始时间 
T=0.1;       %时间步长 

Axo=-F*cos(-Alpha)/(mo-F/Ve*t);   %水平初加速度 
Ayo=g-F*sin(-Alpha)/(mo-F/Ve*t); %竖直初加速度 
count=0; %迭代次数
X_all=0; %初始水平位移
Y_all=0; %初始竖直位移
Result=[]; %结果记录
H=600; %快速调整阶段的下落距离 
% 迭代求 分解速度和分解位移 
while (Vxo>0.1)
        count=count+1; 
        Vx=Vxo+Axo*T; 
        Vy=Vyo+Ayo*T; 
        V_all=sqrt(Vx^2+Vy^2); 
        X=Vxo*T+0.5*Axo*T^2; 
        Y=Vyo*T+0.5*Ayo*T^2; 
        X_all=X_all+X; 
        Y_all=Y_all+Y;  
        Vxo=Vx; 
        Vyo=Vy; 
        Time=count*T;  
        Result=[Result;X_all,Y_all,Vx,Vy,V_all,Time]; 
        SIN=Vy/sqrt(Vy^2+Vx^2); 
        COS=Vx/sqrt(Vy^2+Vx^2); 
        Ay=g-F*SIN/(mo-F/Ve*Time); 
        Ax=-F*COS/(mo-F/Ve*Time); 
        Axo=Ax; 
        Ayo=Ay; 
end
X_all  %水平位移  
Y_all  %垂直位移
Time=count*T  %运动时间  
V_all=sqrt(Vx^2+Vy^2) %合速度  
jiaodu=atan(Vy/Vx)*180/pi %末速度角度。  
F/Ve*Time; %燃料消耗量
M=mo-F/Ve*Time%该阶段的末质量

%%作图 
plot(Result(:,1),15000-Result(:,2),'k','LineWidth',2); 
title('主减速段嫦娥三号运动轨迹图','FontSize',15); 
xlabel('X 轴/(m)'); 
ylabel('Y 轴/(m)'); 

