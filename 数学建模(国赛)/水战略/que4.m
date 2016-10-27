close all;clear;clc;
lifeuse=fliplr(xlsread('生活用水总量.xls',1,'B5：D35'));
induse=fliplr(xlsread('工业用水总量.xls',1,'B5：D35'));
agruse=fliplr(xlsread('农业用水总量.xls',1,'B5：D35'));
indGDP=fliplr(xlsread('工业GDP分省年度数据.xls',1,'B5：D35'));
agrGDP=fliplr(xlsread('农业GDP分省年度数据.xls',1,'B5：D35'));
iu=mean(induse')';
au=mean(agruse')';
iG=mean(indGDP')';
aG=mean(agrGDP')';
ind=[iu,iG]
arg=[au,aG]
%%%%%%%%%%%%%%%%%%%格兰杰

%%%%%%%%%%%%%%%%%%%
lniG=log(iG)
lniu=log(iu)
[P,S]=polyfit(iG,lniu,1)
x=1:max(iG)
hold on
plot(x,P(1)*x+P(2))
plot(iG,lniu,'*')