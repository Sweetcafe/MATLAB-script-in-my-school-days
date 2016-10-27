clc;clear;close all; 
g=9.8/6;  %月球重力加速度 
mo=1285.3;%探测器初始质量 
Ve=2940; %比冲 
Vxo=0; %水平初速度 
Vyo=1.8291; %竖直初速度 
Alpha=atan(Vyo/Vxo);%初速度与水平方向的夹角 
F=7500;   %推力 
t=0;          %初始时间 
T=0.1;       %时间步长 

  %水平初加速度 
Ayo=g-F/(mo-F/Ve*t); %竖直初加速度 
count=0; %迭代次数

Y_all=0; %初始竖直位移
Result=[]; %结果记录
H=2300; %粗避障阶段的下落距离 
% 迭代求 分解速度和分解位移 

Vyo=0
for F=1500:7500       
while (Y_all<2300)
        count=count+1;
        Vy=(2*g*H+Vyo^2)^0.5+Ayo*T; 
        Y=Vyo*T+0.5*Ayo*T^2; 
        Y_all=Y_all+Y;  
        Vyo=Vy; 
        Time=count*T;  
        Result=[Result;F]; 
        Ay=g-F/(mo-F/Ve*Time);        
        Ayo=Ay; 
end
   end

%F/Ve*Time; %燃料消耗量
%M=mo-F/Ve*Time%该阶段的末质量

%%作图 
%plot(Result(:,1),15000-Result(:,2),'k','LineWidth',2); 
%title('主减速段嫦娥三号运动轨迹图','FontSize',15); 
%xlabel('X 轴/(m)'); 
%ylabel('Y 轴/(m)'); 

