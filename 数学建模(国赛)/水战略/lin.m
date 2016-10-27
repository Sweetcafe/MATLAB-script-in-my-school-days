close all;clear;clc
D=xlsread('D.xls')
b=xlsread('b.xls');
R=xlsread('R.xls');
PindD=xlsread('PindD.xls')
k=1;
yunshu=0.3019%0.03116%%%管线运输单位成本
jinghua=1.56%%污水处理单位成本
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
yuandi=[]
A=zeros(31,961);
for k=1:length(mark)
    i=mark(k,2);
    j=mark(k,3);
    A(i,k)=-1;
    A(j,k)=1;
    if i==j
        yuandi=[yuandi;k]
    end
end

A=-1*A;
b=-1*b;
Aeq=[];
beq=[];
lb=zeros(1,961);
ub=100*ones(1,961);
ub(yuandi)=PindD/2
[x fval]=linprog(f,A,b,Aeq,beq,lb,ub);
[k,kk]=find(x>1);
num=x(k);
df=f(k)
df=df'
i=mark(k,2);
j=mark(k,3);
result=[k,i,j,num,df]
Route=[];
for k=1:length(result)
    route=zeros(1,10)
    i=result(k,2);
    j=result(k,3);
    n=1;
    route(n)=i;
    while i~=j
        n=n+1;
        i=R(i,j);
        route(n)=i;
    end
    Route=[Route;route];
end
finalresult=[result,Route]
xlswrite('result',result)