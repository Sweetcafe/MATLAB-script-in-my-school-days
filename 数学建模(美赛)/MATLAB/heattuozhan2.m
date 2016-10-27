clear;clc;close all;

c=4.2*10^3;
thickness=0.05;
time=0;%%预设时间1分钟

Thotwater=38;
Twater=38;
Tman=37.2;
Tair=20;
Ttub=Tair;%%待修改

%%%%%%%%%读取浴缸形状和人的姿势
x=[0.434439317394259   0.578286423889761   0.342793715722549   0.815428399381330];
[Vtub,Stub_air,Stub]=yuanjiaotai(x);
Sunder=x(1)*x(3)+pi*(x(3)/2)^2;
Cunder=2*x(1)+pi*x(3);
sit;
%%%%%%%%%

rman=0.6;
hwater_man=rman/Rman;
rtub=0.19;
hwater_tub=rtub/thickness;
hwater_air=6;
hwater_air=hwater_air*0.8;
%hman_tub=0.19;
%hman_air=1;
%%%%%%%%%
Vwater=0;
step=0.1;
Vgoal=Vtub-Vman;
v=Vgoal/1200*1000;
m=v*step;
Twater=Thotwater;

data=[];
while Vwater<Vgoal
%%%%求出水的几何数据
Vwater=Vwater+v*step/1000;
H=Vwater/Sunder;
Swater_air=Sunder;
Swater_tub=Sunder+Cunder*H;
%Swater_air=Stub_air-Sneck;
%Swater_tub=Stub-Sman_tub;
%Swater_man=Sman_water;

%%%%%%%%%%算主体间传热
%Qwater_man=Swater_man*hwater_man*(Twater-Tman)*time;
Qwater_air=Swater_air*hwater_air*(Twater-Tair)*step;
Qwater_tub=Swater_tub*hwater_tub*(Twater-Ttub)*step;%%%平壁传热，待修改
%Qman_air=Sman_air*hman_air*(Tman-Tair)*time;
Qcool=Qwater_air+Qwater_tub;
Qwarm=c*m*(Thotwater-Twater);
deltaQ=Qwarm-Qcool;
deltaT=deltaQ/(c*Vwater*1000);
Twater=Twater+deltaT;
time=time+step;
data=[data;time,Vwater,Twater,deltaT,deltaQ];
end
x=data(:,1);
y=data(:,2)*1000;
z=data(:,3);
hold on
plot(x,y,'-b','LineWidth',2)
plot(x,z,'-r','LineWidth',2)

xlabel('Time(s)')
ylabel('The value')
legend('The change of temperature(℃)','The change of water yield（L）','fontsize',16)
title('Waterflooding')
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号

set(get(gca,'YLabel'),'FontSize',16);

set(get(gca,'TITLE'),'FontSize',18);

set(gca,'fontsize',14);
