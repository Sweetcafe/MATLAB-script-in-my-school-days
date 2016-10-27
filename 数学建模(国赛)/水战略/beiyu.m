clc
clear all
% 本程序主要用来计算根据灰色理论建立的模型的预测值。
% 应用的数学模型是 GM(1,1)。
% 原始数据的处理方法是一次累加法。
 y=[100.946802	116.72938	132.950715	145.142419	157.111452	167.130486	161.678592	144.602746	135.497816	119.68671	133.273396	151.229988	183.582546	215.245396	258.530112	306.232706	320.195745	354.282822	394.632823	414.907024
];%已知数据
n=length(y);
yy=ones(n,1);
yy(1)=y(1);
for i=2:n
    yy(i)=yy(i-1)+y(i);
end
B=ones(n-1,2);
for i=1:(n-1)
    B(i,1)=-(yy(i)+yy(i+1))/2;
    B(i,2)=1;
end
BT=B';
for j=1:n-1
    YN(j)=y(j+1);
end
YN=YN';
A=inv(BT*B)*BT*YN;
a=A(1);
u=A(2);
t=u/a;
t_test=11;  %需要预测个数
i=1:t_test+n;
yys(i+1)=(y(1)-t).*exp(-a.*i)+t;
yys(1)=y(1);
for j=n+t_test:-1:2
    ys(j)=yys(j)-yys(j-1);
end
x=1995:1994+n;
xs=2:n+t_test;
yn=ys(2:n+t_test);
plot(x,y,'^r',xs+1994,yn,'*-b');
det=0;
for i=2:n
    det=det+abs(yn(i)-y(i));
end
det=det/(n-1);
disp(['百分绝对误差为：',num2str(det),'%']);
disp(['预测值为： ',num2str(ys(n+1:n+t_test))]);
axis([1995 2025 0 1000])
set(gca,'XTick',1995:1:2025);
set(gca,'YTick',0:50:1000);
