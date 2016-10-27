clc;clear;close all; 
g=9.8/6;  %月球重力加速度 
mo=1285.3;%探测器初始质量 
Ve=2940; %比冲 

Vyo=1.8291; %竖直初速度 


t=0;          %初始时间 
T=0.1;       %时间步长 
F=7500;
  %水平初加速度 
Ayo=g-F/(mo-F/Ve*t); %竖直初加速度 
count=0; %迭代次数

Y_all=0; %初始竖直位移
Result=[]; %结果记录
H=2300; %粗避障阶段的下落距离 
% 迭代求 分解速度和分解位移 
Vy=0
while (Y_all<H)
        count=count+1;
        Time=count*T;
        Ay=F/(mo-F/Ve*Time)-g;   
         Vy=Vy+Ay*T; 
       
         Y=Vy*T+0.5*Ayo*T^2; 
        Y_all=Y_all+Y;  
       
       
               
     
end