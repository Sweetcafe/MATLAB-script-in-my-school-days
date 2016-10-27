%%体表面积（m2）= 0.0061×身长（cm）＋0.0128×体重（kg）－0.1529
W=70;%%体重
H=1.8;%%身高
Vman=W/1000;
Sman=0.0061*H*100+0.0128*W-0.1529;
Qman=1.1434*W;
Rhead=H/16;
Vhead=4/3*pi*Rhead^3;
Shead=4*pi*Rhead^2;
Sneck=2*pi*Rhead/2;
Rman=sqrt(Vman/(pi*H));
%%%%%%%%%%躺姿
qugan=13;
%shangzhi=9*2/5;
xiazhi=(6.5*2+10.5*2+1)/4;
tunbu=5;
Spercent=(qugan+xiazhi+tunbu)/100;

Sman_tub=Sman*Spercent;
Sman_air=Sman*0.09;
Sman_water=Sman-Sman_tub-Sman_air;
