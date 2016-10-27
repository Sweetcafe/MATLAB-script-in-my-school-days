clear all;clc;
[data,textdata]=xlsread('凌仁乐考勤',3);
data1=textdata(4:length(textdata)-2,[2,4,9,12]);
OTday=xlsread('凌仁乐考勤',3,'R4:R33');
%data2= cell2mat(data1)
l=length(data1);
data2=zeros(l,8);
%data2(:,1)=data1(:,1)
%name=data1(:,1)

a=data1(:,1);
[b,i,j] = unique(a);
name=a(sort(i));

for i=1:l
    n=data1(i,1);
    [no,j]=find(strcmp(name,n));
    data2(i,1)=no;
    
    a=data1(i,2);
    b=cell2mat(a);
    c=str2num(b(9:10));
    data2(i,2)=c;
    
    d=strcmpi(data1(i,3),'-');
    if d==1
        data2(i,3)=0;
    else
        e=data1(i,3);
        f=cell2mat(e);
        h=str2num(f(1:2));
        m=str2num(f(4:5))/60;
        t=h+m;
        data2(i,3)=t;
    end
    
    d=strcmpi(data1(i,4),'-');
    if d==1
        data2(i,4)=0;
    else
        e=data1(i,4);
        f=cell2mat(e);
        h=str2num(f(1:2));
        m=str2num(f(4:5))/60;
        t=h+m;
        data2(i,4)=t;
    end    
end

absenteeism=[];
for i=1:l
    if data2(i,3)==0&&data2(i,4)>0
        data2(i,3)=9+10/60;
    end
    if data2(i,4)==0&&data2(i,3)>0
        data2(i,4)=18;
    end
    
    if data2(i,3)==0
        absenteeism=[absenteeism;i];
    end
end
data1(absenteeism,:)=[];
data2(absenteeism,:)=[];

data2(:,5)=data2(:,4)-data2(:,3);
[i,j,v]=find(data2(:,3)>(9+10/60));
data2(i,6)=data2(i,3)-(9+10/60);
[i,j,v]=find(data2(:,4)<18);
data2(i,7)=18-data2(i,4);
[i,j,v]=find(data2(:,4)>19&data2(:,5)>10);
data2(i,8)=data2(i,4)-18;

tab = {'姓名','日期','上班时间','下班时间','工作时长','迟到时长','早退时长','加班时长'}
%biaotou=cell('姓名','日期','上班时间','下班时间')
W=round(data2(:,5:8),1)
xlswrite('考勤明细',tab,1)
xlswrite('考勤明细',data1,1,'A2')
xlswrite('考勤明细',W,1,'E2')

check=zeros(length(name),6)
for i=1:length(name)
    check(i,1)=i
    [a,b,c]=find(data2(:,1)==i)
    %check(i,2)=length(a)
    %[a,b,c]=find(data2(:,1).==OTday(:))
    c = intersect(data2(a,2),OTday);
    check(i,3)=length(c)
    check(i,2)=length(a)-length(c)
    [d,e,f]=find(data2(a,8)>0)
    check(i,4)=length(d)
    check(i,5)=sum(data2(a,6))
    check(i,6)=sum(data2(a,7))
    check(i,7)=sum(data2(a,8))
end
tabb={'姓名','出勤天数','休息日加班天数','夜加班天数','迟到时长','早退时长','加班时长','签名确认'}
WW=round(check(:,2:7))
xlswrite('考勤明细',tabb,2)
xlswrite('考勤明细',name,2,'A2')
xlswrite('考勤明细',WW,2,'B2')