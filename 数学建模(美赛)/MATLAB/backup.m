clear;clc;close all;
c=4.2*10^3;
thickness=0.08;
time=60;%%预设时间1分钟
Thotwater=70;
Twater=40;
Tman=37.2;
Tair=20;
Ttub=Tair;%%待修改

hwater_man=1;
r=0.19;
hwater_air=6;
%hman_tub=0.19;
%hman_air=1;

%%%%%%%%%读取浴缸形状和人的姿势
[Vtub,Stub_air,Stub]=lifangti(2,1,1);
tang;
%%%%%%%%%
hwater_tub=r/thickness;
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
Qhotwater=Qwater_man+Qwater_air+Qwater_tub;
m=Qhotwater/(c*(Thotwater-Twater));
v=m/time

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
close all;
clear;
%进化的代数
T=100;
bound=[1.5,0.5,0.3;2,1,1];
optionsOrigin=gaoptimset('Generations',T,'PopulationSize',100,'MigrationFraction',0.2,'PopInitRange',bound,'PlotFcns',@gaplotbestf);
[x,fval,reason,output,finnal_pop]=ga(@fitness1,3,optionsOrigin);
Bestx=x
BestFval=fval


