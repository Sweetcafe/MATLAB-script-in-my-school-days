clear;close all;clc;
death3=xlsread('附件1','A3:M93');%%导入数据
birth3=xlsread('附件1','N18:Q52');
death2=xlsread('附件1','A98:M188');
birth2=xlsread('附件1','N113:Q147');
death1=xlsread('附件1','A193:M283');
birth1=xlsread('附件1','N208:Q242');
sample3=xlsread('附件1','S2:S7');
sample2=xlsread('附件1','S97:S102');
sample1=xlsread('附件1','S192:S197');
pop3=1360720000/sum(sample3)*sample3;%%全国城镇乡男女人口数
pop2=1354040000/sum(sample2)*sample2;
pop1=1347350000/sum(sample1)*sample1;
%%比率表转化为全国数量表
num3=[death3(:,1),death3(:,2)*(pop3(1)+pop3(2))/100,death3(:,3)*pop3(1)/1000,death3(:,4)*(pop3(1)+pop3(2))/100,death3(:,5)*pop3(2)/1000,death3(:,6)*(pop3(3)+pop3(4))/100,death3(:,7)*pop3(3)/1000,death3(:,8)*(pop3(3)+pop3(4))/100,death3(:,9)*pop3(4)/1000,death3(:,10)*(pop3(5)+pop3(6))/100,death3(:,11)*pop3(5)/1000,death3(:,12)*(pop3(5)+pop3(6))/100,death3(:,13)*pop3(6)/1000];
num2=[death2(:,1),death2(:,2)*(pop2(1)+pop2(2))/100,death2(:,3)*pop2(1)/1000,death2(:,4)*(pop2(1)+pop2(2))/100,death2(:,5)*pop2(2)/1000,death2(:,6)*(pop2(3)+pop2(4))/100,death2(:,7)*pop2(3)/1000,death2(:,8)*(pop2(3)+pop2(4))/100,death2(:,9)*pop2(4)/1000,death2(:,10)*(pop2(5)+pop2(6))/100,death2(:,11)*pop2(5)/1000,death2(:,12)*(pop2(5)+pop2(6))/100,death2(:,13)*pop2(6)/1000];   
num1=[death1(:,1),death1(:,2)*(pop1(1)+pop1(2))/100,death1(:,3)*pop1(1)/1000,death1(:,4)*(pop1(1)+pop1(2))/100,death1(:,5)*pop1(2)/1000,death1(:,6)*(pop1(3)+pop1(4))/100,death1(:,7)*pop1(3)/1000,death1(:,8)*(pop1(3)+pop1(4))/100,death1(:,9)*pop1(4)/1000,death1(:,10)*(pop1(5)+pop1(6))/100,death1(:,11)*pop1(5)/1000,death1(:,12)*(pop1(5)+pop1(6))/100,death1(:,13)*pop1(6)/1000];     

%%补充2010年数据
death0=xlsread('附件1','A288:M378');
birth0=xlsread('附件1','N303:Q337');