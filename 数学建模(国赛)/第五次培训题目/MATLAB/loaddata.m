clear
close all
clc

read=xlsread('����1-���Ѿ�Ʒ�����ֱ�.xls',1);
total1r=[];
for i=1:27
    a=read(14*i-11,1);
    b=read(14*i+1,3:12);
    c=mean(b);
    total1r=[total1r;a,b,c];
end
total1r=sortrows(total1r,1);  %%��һ��Ժ����ѾƵ������ܷ�
    
read=xlsread('����1-���Ѿ�Ʒ�����ֱ�.xls',3);
total2r=[];
for i=1:27
    a=read(14*i-11,1);
    b=read(14*i+1,3:12);
    c=mean(b);
    total2r=[total2r;a,b,c];
end
total2r=sortrows(total2r,1);  %%�ڶ���Ժ����ѾƵ������ܷ�
    
read=xlsread('����1-���Ѿ�Ʒ�����ֱ�.xls',2);
total1w=[];
for i=1:28
    a=read(13*i-9,1);
    b=read(13*i+2,4:13);
    c=mean(b);
    total1w=[total1w;a,b,c];
end
total1w=sortrows(total1w,1);  %%��һ��԰����ѾƵ������ܷ�

read=xlsread('����1-���Ѿ�Ʒ�����ֱ�.xls',4);
total2w=[];
for i=1:28
    a=read(12*i-8,1);
    b=read(12*i+2,5:14);
    c=mean(b);
    total2w=[total2w;a,b,c];
end
total2w=sortrows(total2w,1);  %%�ڶ���԰����ѾƵ������ܷ�