clc;
clear; 
syms a b; 
c=[a b]';  
A=xlsread('�ؼ�ָ������ɫԤ��16��17�����ݣ�.xlsx','B2:Q2')% ԭʼ���� 
B=cumsum(A);%�ۼ� 
n=length(A); 
for i=1:(n-1)     
    C(i)=(B(i)+B(i+1))/2;
end
%�����������
D=A; D(1)=[]; D=D'; 
E=[-C; ones(1,n-1)]; 
c=inv(E*E')*E*D;
c=c'; 
a=c(1);
b=c(2); 
%Ԥ�� ����Ԥ��35������ 
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
xlswrite('�ؼ�ָ������ɫԤ��16��17�����ݣ�.xlsx',G,'B3:S3')
