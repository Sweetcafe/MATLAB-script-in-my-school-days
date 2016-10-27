t=7%for t=1:20
luguojiedian=find(D(32,:)<=30+10*t);
luguojuli=D(32,luguojiedian);
luguo=[luguojiedian;luguojuli];

[i,fengsuo,v]=find(a(luguojiedian,:)<inf);
fengsuo=unique(fengsuo);
fengsuo=setdiff(fengsuo, luguojiedian);
C=D(fengsuo,P)
c=zeros(size(C))

for i=1:size(C,1)
for j=1:80
    if C(i,j)>10*t
        c(i,j)=0;
    else c(i,j)=1;
    end
end
end


%[h,s]=Edmonds(c)



