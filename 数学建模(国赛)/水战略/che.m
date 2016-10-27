clear
clc
carlength=xlsread('输入表.xls','B7:B9');%%读取小车长度
trucklength=xlsread('输入表.xls','B12:B14');%%读取货车长度
carnum=xlsread('输入表.xls','B2:B4');%%读取小车数量

x1=carlength(1);
x2=carlength(2);
x3=carlength(3);

plan11up=[];
for a=0:5
    for b=0:5
        y=a*(x1+0.1)+b*(x2+0.1)-0.1;
        if y>15.285&&y<=19;
            plan11up=[plan11up;a,b,0];
        end
    end
end

plan11down=[];
for a=0:5
    for b=0:5
        for c=0:5
            y=a*(x1+0.1)+b*(x2+0.1)+c*(x3+0.1)-0.1;
            if y>15.285&&y<=19;
            plan11down=[plan11down;a,b,c];
            end
        end
    end
end



plan12up=[];
for a=0:6
    for b=0:6
        y=a*(x1+0.1)+b*(x2+0.1);
        if y>20.585&&y<=24.3;
        plan12up=[plan12up;a*2,b*2,0];
        end
    end
end

plan12down=[];
for a=0:6
    for b=0:6
        for c=0:6
            y=a*(x1+0.1)+b*(x2+0.1)+c*(x3+0.1)-0.1;
            if y>20.585&&y<=24.3;
            plan12down=[plan12down;a,b,c];
            end
        end
    end
end

plan22updown=[];
for a=0:5
    for b=0:5
        y=a*(x1+0.1)+b*(x2+0.1)-0.1;
        if y>15.285&&y<=19;
            plan22updown=[plan22updown;a*2,b*2,0];
        end
    end
end

plan11=[];
for i=1:length(plan11up);
    for j=1:length(plan11down);
        p=[plan11up(i,:),plan11down(j,:)];
        plan11=[plan11;p];
    end
end
plan11

plan12=[];
for i=1:length(plan12up);
    for j=1:length(plan12down);
        p=[plan12up(i,:),plan12down(j,:)];
        plan12=[plan12;p];
    end
end
plan12

plan22=[];
for i=1:length(plan11up);
    for j=1:length(plan11up);
        p=[plan22updown(i,:),plan22updown(j,:)];
        plan22=[plan22;p];
    end
end
plan22

plansum=[plan11(:,1)+plan11(:,4),plan11(:,2)+plan11(:,5),plan11(:,3)+plan11(:,6);plan12(:,1)+plan12(:,4),plan12(:,2)+plan12(:,5),plan12(:,3)+plan12(:,6);plan22(:,1)+plan22(:,4),plan22(:,2)+plan22(:,5),plan22(:,3)+plan22(:,6)];
plansum1=[plan11;plan12;plan22];

f=ones(1,length(plansum));
for i=1:length(plan12)
    f(i+length(plan11))=1.00001;
end
for i=1:length(plan22)
    f(i+length(plan11)+length(plan12))=1.00003;
end
A1=-1*plansum';
B=-1*[carnum;0];
intcon=1:length(plansum);
A2=zeros(1,length(plansum));
for i=1:length(plan11)
    A2(i)=-0.2;
end
for i=1:length(plan12)
    A2(i+length(plan11))=1;
end
A=[A1;A2];
lb=zeros(length(plansum),1);
ub=20*ones(length(plansum),1);
[x, fval]=intlinprog(f,intcon,A,B,[],[],lb,ub);%%%%%%%%规划

truckmod=zeros(length(plansum),1);
truckmod(1:length(plan11))=11;
truckmod(length(plan11)+1:length(plan11)+length(plan12))=12;
truckmod(length(plan11)+length(plan12)+1:length(plansum))=22;
planall=[truckmod,x,plansum1];
[i,j,v]=find(planall(:,2)==0);
planall(i,:)=[]
clean=' ';
xlswrite('输出表.xls',clean,2,'A2:H30')
xlswrite('输出表.xls',planall,2,'A2')