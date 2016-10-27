clear
clc
x1=xlsread('附件2-指标提取.xls','C3:AF29');
y1=xlsread('附件2-指标提取.xls','B3:B29');
[b,bint,r,rint,stats]=regress(y1,x1)

for i=1:27
    se(i)=(r(i))^2;
end
Se=sum(se);
for i=1:27
    sr(i)=(y1(i)-r(i)-mean(y1))^2;
end
Sr=sum(sr);
R=1-Se/(Se+Sr)
aR=1-Se/(27-30-1)/(Sr/27-1)

x2=xlsread('附件2-指标提取.xls','C34:AF61');
y2=xlsread('附件2-指标提取.xls','B34:B61');
[b,bint,r,rint,stats]=regress(y2,x2)
for i=1:27
    se(i)=(r(i))^2;
end
Se=sum(se);
for i=1:27
    sr(i)=(y1(i)-r(i)-mean(y1))^2;
end
Sr=sum(sr);
R=1-Se/(Se+Sr)
aR=1-Se/(27-30-1)/(Sr/27-1)