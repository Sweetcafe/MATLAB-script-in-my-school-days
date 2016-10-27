clear;clc;close all;
c=4.2*10^3;
thickness=0.05;
time=60;%%预设时间1分钟
data=[]
for i=40:0.1:50
Thotwater=i;
Twater=38;
Tman=37.2;
Tair=20;
Ttub=Tair;%%待修改

%%%%%%%%%读取浴缸形状和人的姿势
x=[1.5,0.6,0.448];
[Vtub,Stub_air,Stub]=lifangti(x);

      
lie;
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
v=m/time;
data=[data;i,v];
end
x=data(:,1)
y=data(:,2)
hold on
plot(x,y,'LineWidth',2)
xlabel('Temperature of hot water(℃)')
ylabel('The water-carrying capacity(L/s)')

title('The needed water with different temperature')
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号

set(get(gca,'YLabel'),'FontSize',16);

set(get(gca,'TITLE'),'FontSize',18);

set(gca,'fontsize',14);
dataint=zeros(10,2);
for i=1:10:101
    dataint((i-1)/10+1,:)=data(i,:);
end
xlswrite('dataint',dataint)
minwater=data(end,2)
plot(50,minwater,'s','MarkerSize',10,'MarkerFaceColor','r')
text(48,minwater*1.4,['Minimum value is ',num2str(minwater)],'fontsize',14)