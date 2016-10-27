close all;clear;clc;
sr=zeros(5,2)
for s=2:6
%s=5%%平缓系数
yeardata=xlsread('黄河实测流量.xls',2,'C1:N38');
seasonpercent=xlsread('season.xlsx','A2:L2')
season=seasonpercent*sum(sum(yeardata))/size(yeardata,1)/100
y=zeros(size(yeardata,1),1);
for i=1:size(yeardata,1)
    y(i)=sum(yeardata(i,:));
end
liuliang=mean(y);
hold on
moom=(0:12)
%bar(season)
dseason=[season(12),season]
plot(moom,dseason,'b','LineWidth',2)%%%%%%%

if s==inf
    goal=mean(season)*ones(1,12)
else
    goal=(season-mean(season))/s+mean(season)
end
dgoal=[goal(12),goal]
plot(moom,dgoal,'r','LineWidth',2 )%%%%%%%%

set(gca,'XTick',1:1:12);
xlabel('Month')
ylabel('Monthly average flow（m3/s）')
legend('Seasonal trend','Water storage line','fontsize',16)
title('The graph of water storage objectivec')
title('The season trend')
text(1,28000,['smooth coefficient is ',num2str(s)],'fontsize',16)
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号

set(get(gca,'YLabel'),'FontSize',16);

set(get(gca,'TITLE'),'FontSize',18);

set(gca,'fontsize',14);

grid on;
%%%%%%%%%%%%%%%%%%%
S=zeros(1,4)
%y = ( (y0-y1)*(y3-y2)*x0 + (y3-y2)*(x1-x0)*y0 + (y1-y0)*(y3-y2)*x2 + (x2-x3)*(y1-y0)*y2 ) / ( (x1-x0)*(y3-y2) + (y0-y1)*(x3-x2) );
%x = x2 + (x3-x2)*(y-y2) / (y3-y2);
x=[6 7 6 7]
y=[season(6),season(7),goal(6),goal(7)]
jiaodianY=( (y(1)-y(2))*(y(4)-y(3))*x(1) + (y(4)-y(3))*(x(2)-x(1))*y(1) + (y(2)-y(1))*(y(4)-y(3))*x(3) + (x(3)-x(4))*(y(2)-y(1))*y(3) ) / ( (x(2)-x(1))*(y(4)-y(3)) + (y(1)-y(2))*(x(4)-x(3)) );
jiaodianX=x(3) + (x(4)-x(3))*(jiaodianY-y(3)) / (y(4)-y(3));
plot(jiaodianX,jiaodianY,'*')
A = [jiaodianX,jiaodianY];
B = [7,season(7)];
C = [7,goal(7)];
% 三边长
a = sqrt((A(1)-B(1))^2+(A(2)-B(2))^2)
b = sqrt((C(1)-B(1))^2+(C(2)-B(2))^2)
c = sqrt((A(1)-C(1))^2+(A(2)-C(2))^2)
p = (a+b+c)/2;
% 三角形面积
S(1) = sqrt(p*(p-a)*(p-b)*(p-c))
%%%%%%%%%%%%%%%%%%%%
x=[9 10 9 10]
y=[season(9),season(10),goal(9),goal(10)]
%y = ( (y0-y1)*(y3-y2)*x0 + (y3-y2)*(x1-x0)*y0 + (y1-y0)*(y3-y2)*x2 + (x2-x3)*(y1-y0)*y2 ) / ( (x1-x0)*(y3-y2) + (y0-y1)*(x3-x2) );
%x = x2 + (x3-x2)*(y-y2) / (y3-y2);
jiaodianY=( (y(1)-y(2))*(y(4)-y(3))*x(1) + (y(4)-y(3))*(x(2)-x(1))*y(1) + (y(2)-y(1))*(y(4)-y(3))*x(3) + (x(3)-x(4))*(y(2)-y(1))*y(3) ) / ( (x(2)-x(1))*(y(4)-y(3)) + (y(1)-y(2))*(x(4)-x(3)) );
jiaodianX=x(3) + (x(4)-x(3))*(jiaodianY-y(3)) / (y(4)-y(3));
plot(jiaodianX,jiaodianY,'*')
A = [jiaodianX,jiaodianY];
B = [9,season(9)];
C = [9,goal(9)];
% 三边长
a = sqrt((A(1)-B(1))^2+(A(2)-B(2))^2)
b = sqrt((C(1)-B(1))^2+(C(2)-B(2))^2)
c = sqrt((A(1)-C(1))^2+(A(2)-C(2))^2)
p = (a+b+c)/2;
% 三角形面积
S(4) = sqrt(p*(p-a)*(p-b)*(p-c));
%%%%%%%%%%%%%%%%%%%
for i=7:8
    S(i-5)=(mean(season(i:i+1))-mean(goal(i:i+1)))/2;
end
rongliang=sum(S)*60*60*24*30/100000000
text(1,25000,['capacity needed ',num2str(rongliang)],'fontsize',16)
sr(s-1,:)=[s,rongliang]
end
