A=xlsread('�ؼ�ָ������ɫԤ��16��17�����ݣ�.xlsx','B2:Q2')% ԭʼ���� 
B=zeros(1,length(A))
for i=1:length(A)
    B(1,i)=0.094^A(i)+76.101;
end
B
