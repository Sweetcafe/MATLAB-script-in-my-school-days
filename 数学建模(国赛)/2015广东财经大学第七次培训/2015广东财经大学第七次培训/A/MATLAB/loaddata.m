clear
close all
clc
position=xlsread('cumcm2011A附件_数据.xls',1,'A4:E322');
concentration=xlsread('cumcm2011A附件_数据.xls',2,'A4:I322');
back=xlsread('cumcm2011A附件_数据.xls',2,'B4:D11');
all=[position,concentration(:,2:9)];
As=concentration(:,2);
Cd=concentration(:,3);
Cr=concentration(:,4);
Cu=concentration(:,5);
Hg=concentration(:,6);
Ni=concentration(:,7);
Pb=concentration(:,8);
Zn=concentration(:,9);

[i,j,v]=find(all(:,5)==1);
a1=all(i,:);
[i,j,v]=find(all(:,5)==2);
a2=all(i,:);
[i,j,v]=find(all(:,5)==3);
a3=all(i,:);
[i,j,v]=find(all(:,5)==4);
a4=all(i,:);
[i,j,v]=find(all(:,5)==5);
a5=all(i,:);