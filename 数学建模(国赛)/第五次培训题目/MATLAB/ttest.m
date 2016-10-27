loaddata
datar=[];
m=0;
n=0;
for i=1:27
a=total1r(i,2:11);
b=total2r(i,2:11);
[h,sig,ci]=ttest2(a,b);
if h==1
if std(a)/mean(a)>=std(b)/mean(b)
    n=n+1;
    h=2;
else m=m+1;
    h=1;
end
end
datar=[datar;i,h];
end
datar
m
n

dataw=[];
m=0;
n=0;
for i=1:28
a=total1w(i,2:11);
b=total2w(i,2:11);
[h,sig,ci]=ttest2(a,b);
if h==1
if std(a)/mean(a)>=std(b)/mean(b)
    n=n+1;
    h=2;
else m=m+1;
    h=1;
end
end
dataw=[dataw;i,h];
end
dataw
m
n