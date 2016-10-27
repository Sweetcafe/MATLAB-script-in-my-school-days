clear
clc
syms a b; 
c=[a b]';  
A=[0.07 0 0 1.37];% 原始序列 
B=cumsum(A);%累加 
n=length(A); 
for i=1:(n-1)     
    C(i)=(B(i)+B(i+1))/2;
end
%计算待定参数
D=A; D(1)=[]; D=D'; 
E=[-C; ones(1,n-1)]; 
c=inv(E*E')*E*D;
c=c'; 
a=c(1);
b=c(2); 
%预测 往后预测20个数据 
F=[];F(1)=A(1); 
for i=2:(n+17)      
    F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a; 
end
Gbirth=[];Gbirth(1)=A(1); 
for i=2:(n+17)     
    Gbirth(i)=F(i)-F(i-1); 
end
t1=2010:2013;
t2=2010:2030; 
Gbirth
plot(t1,A,'r.',t2,Gbirth );
