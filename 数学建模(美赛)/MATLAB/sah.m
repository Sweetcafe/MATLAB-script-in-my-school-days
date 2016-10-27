clear;clc;%close all;
hold on
data=[];
for p=0.8:0.1:1.2
c=4.2*10^3;
thickness=0.05;
time=60;%%预设时间1分钟

Thotwater=50;
Twater=38;
Tman=37.2;
Tair=20;
Ttub=Tair;%%待修改

%%%%%%%%%读取浴缸形状和人的姿势
x=[0.434439317394259   0.578286423889761   0.342793715722549   0.815428399381330];
[Vtub,Stub_air,Stub]=yuanjiaotai(x);

W=70;%%体重
H=1.8;%%身高
Vman=W/100;
Sman=0.0061*H*100+0.0128*W-0.1529;
Qman=1.1434*W;
Rhead=H/16;
Vhead=4/3*pi*Rhead^3;
Shead=4*pi*Rhead^2;
Sneck=2*pi*Rhead/2;
Rman=sqrt(Vman/(pi*H));
%%%%%%%%%%
qugan=13;
%shangzhi=9*2/5;
xiazhi=1*2;
tunbu=5;
Spercent=(qugan+xiazhi+tunbu)/100;

Sman_tub=Sman*Spercent;
Sman_air=Sman*0.09;
Sman_water=Sman-Sman_tub-Sman_air;
%%%%%%%%%

rman=0.6;
hwater_man=rman/Rman;

rtub=0.19;
hwater_tub=rtub/thickness;

hwater_air=6;
hwater_man=p*hwater_man
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
data=[data;p,v]
if p==1
    %plot(p,v,'s','MarkerSize',10,'MarkerFaceColor','b')
   % text(p+0.002,v,['value= ',num2str(v)],'fontsize',16)
end
end
x=data(:,1);
y=data(:,2);
sen=(y(4)-y(2))/y(3)/20
plot(x,y,'LineWidth',2)
%plot(0.8,y(1),'^','MarkerSize',10,'MarkerFaceColor','b')
xlabel('Relative Change Ratio')
ylabel('The value of hot water speed')
legend('Origin','The change of all heat tranfer coefficient','The heat tranfer coefficient change of water to air','The heat tranfer coefficient change of water to tub','The heat tranfer coefficient change of water to man',4)
%legend('The origin point without bubble','The heat tranfer coefficient change of water to air','The bubble point ','The heat tranfer coefficient change of water to man',4)

title('The sensitivity analysis on heat tranfer coefficient')
%text(0.802,y(1),['value= ',num2str(y(1))],'fontsize',16)
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号

set(get(gca,'YLabel'),'FontSize',16);

set(get(gca,'TITLE'),'FontSize',18);

set(gca,'fontsize',14);