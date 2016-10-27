X=xlsread('单因子法污染指数',1,'C12:J16')
R=zeros(8,8)
for i=1:8
    for j=1:8
        R(i,j)=min(min(corrcoef(X(:,i),X(:,j))));
    end
end

[V,D]=eig(R);

gongxianlv=zeros(1,8)
for i=1:8
    gongxianlv(i)=D(i,i)/sum(sum(D));
end
