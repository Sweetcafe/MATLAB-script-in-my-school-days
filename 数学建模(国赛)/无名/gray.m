clc;
clear; 
syms a b; 
c=[a b]';  
X=[387
398
365
428
347
289
121
108
85
94
104
81
68
92
35
35
22
11
15
17
7
8
3
8
7
14
15
14
8
10
8
7
7
3
2
1
0
];% 原始序列 
A=X'
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
for i=2:(n+10)      
    F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a; 
end
G=[];G(1)=A(1); 
for i=2:(n+10)     
    G(i)=F(i)-F(i-1); 
end
t1=1:37;
t2=1:47; 
G
plot(t1,A,'r.',t2,G )
