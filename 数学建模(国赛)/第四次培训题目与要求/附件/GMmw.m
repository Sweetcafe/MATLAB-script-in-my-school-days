syms a b; 
c=[a b]';  
A=[0.5443 0.5411 0.5408 0.5406 0.5404];% 原始序列 
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
for i=2:(n+37)      
    F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a; 
end
Gmw=[];Gmw(1)=A(1); 
for i=2:(n+37)     
    Gmw(i)=F(i)-F(i-1); 
end
t1=2009:2013;
t2=2009:2050; 
Gmw;
plot(t1,A,'r.',t2,Gmw );
