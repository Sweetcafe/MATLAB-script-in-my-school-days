clear;clc;close all;
shape=1%%%%%%%%%%选取形状：立方体=1，棱台=2，圆角台=3，椭圆台=4，椭圆体=5
c=4.2*10^3;
thickness=0.05;
time=60;%%预设时间1分钟
Thotwater=70;
Twater=40;
Tman=37.2;
Tair=20;
Ttub=Tair;%%待修改

%%%%%%%%%读取浴缸形状和人的姿势
if shape==1
[Vtub,Stub_air,Stub]=lifangti(1.8,1,1);
%else
 %   if shape==2
end        
tang;
%%%%%%%%%

rman=0.6;
hwater_man=rman/Rman;
rtub=0.19;
hwater_tub=rtub/thickness;
hwater_air=6;
%hman_tub=0.19;
%hman_air=1;

%%%%求出水的几何数据
Vwater=Vtub-(Vman-Vhead);
Swater_air=Stub_air-Sneck;
Swater_tub=Stub-Sman_tub;
Swater_man=Sman_water;

%%%%%%%%%%算主体间传热
Qwater_man=Swater_man*hwater_man*(Twater-Tman)*time;
Qwater_air=Swater_air*hwater_air*(Twater-Tair)*time;
Qwater_tub=Swater_tub*hwater_tub*(Twater-Ttub)*time;%%%平壁传热，待修改
%Qman_air=Sman_air*hman_air*(Tman-Tair)*time;
%Qhotwater=Qwater_man+Qwater_air+Qwater_tub;
%m=Qhotwater/(c*(Thotwater-Twater));
%v=m/time
Qwarm=Qhotwater-Qwater;
Qcold=Qwater_man+Qwater_air+Qwater_tub;
