close all;clear;clc;
position=xlsread('坐标.xlsx');
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
C=[];
for i=1:length(position)
    for j=1:length(position)        
        C=[C;sqrt((position(i,1)-position(j,1))^2+(position(i,2)-position(j,2))^2)];
    end
end
D=zeros(length(position),length(position));
for i=1:length(B)
    D(B(i,1),B(i,2))=C(i,1);
    D(B(i,2),B(i,1))=C(i,1);
end

b=xlsread('b.xls');
k=1;
yunshu=31.4%%%管线运输单位成本
jinghua=8000%%污水处理或海水淡化单位成本
mark=[];
f=zeros(1,31*31)
for i=1:length(D)
    for j=1:length(D)
        if i==j
            f(k)=jinghua;
        else
        f(k)=D(i,j)*yunshu;
        end
        mark=[mark;k,i,j];
        k=k+1;
    end
end

A=zeros(31,961);
for k=1:length(mark)
    i=mark(k,2);
    j=mark(k,3);
    A(i,k)=-1;
    A(j,k)=1;
    
end
A=-1*A;
b=-1*b;
Aeq=[];
beq=[];
lb=zeros(1,961);
ub=[];
[x fval]=linprog(f,A,b,Aeq,beq,lb,ub);
[k,kk]=find(x>1);
num=x(k);
i=mark(k,2);
j=mark(k,3);
result=[i,j,num]