clear;clc;

x1=xlsread('附件2-指标提取.xls','C3:AF29');
y1=xlsread('附件2-指标提取.xls','B3:B29');
[b1,bint,r,rint,stats]=regress(y1,x1);

redgrape=xlsread('附件2-指标提取.xls','A3:AF29');
whitegrape=xlsread('附件2-指标提取.xls','A34:AF61');
redwine=xlsread('附件2-指标提取.xls',2,'B3:P29');
whitewine=xlsread('附件2-指标提取.xls',2,'C33:P60');

x2=redwine;
y2=redgrape(:,2);
[b2,bint,r,rint,stats]=regress(y2,x2);

x3=xlsread('附件2-指标提取.xls','C34:AF61');
y3=xlsread('附件2-指标提取.xls','B34:B61');
[b3,bint,r,rint,stats]=regress(y3,x3);

x4=whitewine;
y4=whitegrape(:,2);
[b4,bint,r,rint,stats]=regress(y4,x4);



b1
b2
b3
b4
