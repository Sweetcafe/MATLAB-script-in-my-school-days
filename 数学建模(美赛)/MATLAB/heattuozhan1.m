clear;clc;close all;
c=4.2*10^3;
thickness=0.05;
time=60;%%预设时间1分钟
dataTv=[];
for i=35:1:40
Thotwater=50;
Twater=i;
Tman=37.2;
Tair=20;
Ttub=Tair;%%待修改

%%%%%%%%%读取浴缸形状和人的姿势
x=[0.477304932990195   0.536781235500762   0.450951700992297   0.702565463029567];
[Vtub,Stub_air,Stub]=yuanjiaotai(x);
sit;
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
Qhotwater=Qwater_man+Qwater_air+Qwater_tub;
m=Qhotwater/(c*(Thotwater-Twater));
v=m/time
dataTv=[dataTv;i,v]
end
x=dataTv(:,1)
y=dataTv(:,2)
hold on

%plot(x,y,'-r','LineWidth',2)
plot(x,y,'sb','MarkerSize',10,'MarkerFaceColor','b')
set(gca,'XTick',35:1:40);
xlabel('Different temperature grade(℃)')
ylabel('The hot water speed(L/s)')
title('The water speed corresponding to different water temperature')
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号

set(get(gca,'YLabel'),'FontSize',16);

set(get(gca,'TITLE'),'FontSize',18);

set(gca,'fontsize',14);
