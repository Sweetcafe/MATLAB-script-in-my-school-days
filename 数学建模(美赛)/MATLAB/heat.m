clear;clc;close all;
c=4.2*10^3;
thickness=0.004;
time=60;%%Ԥ��ʱ��1����

Thotwater=50;
Twater=38;
Tman=37.2;
Tair=20;
Ttub=Tair;%%���޸�

%%%%%%%%%��ȡԡ����״���˵�����
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

%%%%���ˮ�ļ�������
Vwater=Vtub-(Vman-Vhead);
Swater_air=Stub_air-Sneck;
Swater_tub=Stub-Sman_tub;
Swater_man=Sman_water;

%%%%%%%%%%������䴫��
Qwater_man=Swater_man*hwater_man*(Twater-Tman)*time;
Qwater_air=Swater_air*hwater_air*(Twater-Tair)*time;
Qwater_tub=Swater_tub*hwater_tub*(Twater-Ttub)*time;%%%ƽ�ڴ��ȣ����޸�
%Qman_air=Sman_air*hman_air*(Tman-Tair)*time;
Qhotwater=Qwater_man+Qwater_air+Qwater_tub;
m=Qhotwater/(c*(Thotwater-Twater));
v=m/time