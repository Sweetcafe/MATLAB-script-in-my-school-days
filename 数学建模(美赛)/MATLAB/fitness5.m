function v=fitness5(x)
Vtub=1/3*pi*x(4)*((x(2)/2)^2+(x(3)/2)^2+x(2)/2*x(3)/2)+1/3*x(4)*(x(1)*x(2)+x(1)*x(3)+sqrt(x(1)*x(2)*x(1)*x(3)));
if x(1)+x(2)>=1&&x(1)+x(3)>=0.7&&x(2)>=0.45&&x(3)>=0.3&&x(4)>=0.7&&Vtub>=0.3&&x(2)>=x(3)

c=4.2*10^3;
thickness=0.05;
time=60;%%预设时间1分钟

Thotwater=50;
Twater=38;
Tman=37.2;
Tair=20;
Ttub=Tair;%%待修改

%%%%%%%%%读取浴缸形状和人的姿势
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
v=m/time;
else
    v=0.01;
end
