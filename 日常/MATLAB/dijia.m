A=xlsread('地价指数（灰色预测16、17年数据）.xlsx','B2:Q2')% 原始序列 
B=zeros(1,length(A))
for i=1:length(A)
    B(1,i)=0.094^A(i)+76.101;
end
B
