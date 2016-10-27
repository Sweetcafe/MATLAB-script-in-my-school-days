clc;
clear; 
syms a b; 
c=[a b]';  
A=xlsread('地价指数（灰色预测16、17年数据）.xlsx','B2:Q2')% 原始序列 
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
%预测 往后预测35个数据 
F=[];F(1)=A(1); 
for i=2:(n+2)      
    F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a; 
end
G=[];G(1)=A(1); 
for i=2:(n+2)     
    G(i)=F(i)-F(i-1); 
end
t1=2000:2015;
t2=2000:2017; 
G
plot(t1,A,'r.',t2,G )
xlswrite('地价指数（灰色预测16、17年数据）.xlsx',G,'B3:S3')
