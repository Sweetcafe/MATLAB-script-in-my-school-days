close all;clear;clc;
position=xlsread('����.xlsx')
juli=zeros(31,31);
for i=1:length(position)
    for j=1:length(position)
        juli(i,j)=sqrt((position(i,1)-position(j,1))^2+(position(i,2)-position(j,2))^2);
    end
end
B=[];
for i=1:length(position)
    for j=1:length(position)
        B=[B;i,j];
    end
end
C=[]
for i=1:length(position)
    for j=1:length(position)        
        C=[C;sqrt((position(i,1)-position(j,1))^2+(position(i,2)-position(j,2))^2)];
    end
end
for i=1:length(B)
    D(B(i,1),B(i,2))=C(i,1);
    D(B(i,2),B(i,1))=C(i,1);
end
