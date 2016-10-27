clear
clc
carsize=xlsread('表2.xlsx','E2:G46')/100;%%读取小车大小
trucksize=xlsread('表1.xlsx','C2:E11');%%读取货车大小
%carnum=xlsread('表2.xlsx','B2:B4');%%%%%%%%%%%%%%读取小车数量

for i=1:length(carsize)
    x(i)=carsize(i,1);
end


plan1up=[];
i=zeros(1,45)
  while i(1)<=6&&carsize(1,2)<=trucksize(1,2)
  while i(2)<=6&&carsize(2,2)<=trucksize(1,2)
  while i(3)<=6&&carsize(3,2)<=trucksize(1,2)
  while i(4)<=6&&carsize(4,2)<=trucksize(1,2)
  while i(5)<=6&&carsize(5,2)<=trucksize(1,2)
  while i(6)<=6&&carsize(6,2)<=trucksize(1,2)
  while i(7)<=6&&carsize(7,2)<=trucksize(1,2)
  while i(8)<=6&&carsize(8,2)<=trucksize(1,2)
  while i(9)<=6&&carsize(9,2)<=trucksize(1,2)
  while i(10)<=6&&carsize(10,2)<=trucksize(1,2)
  while i(11)<=6&&carsize(11,2)<=trucksize(1,2)
  while i(12)<=6&&carsize(12,2)<=trucksize(1,2)
  while i(13)<=6&&carsize(13,2)<=trucksize(1,2)
  while i(14)<=6&&carsize(14,2)<=trucksize(1,2)
  while i(15)<=6&&carsize(15,2)<=trucksize(1,2)
  while i(16)<=6&&carsize(16,2)<=trucksize(1,2)
  while i(17)<=6&&carsize(17,2)<=trucksize(1,2)
  while i(18)<=6&&carsize(18,2)<=trucksize(1,2)
  while i(19)<=6&&carsize(19,2)<=trucksize(1,2)
  while i(20)<=6&&carsize(20,2)<=trucksize(1,2)
  while i(21)<=6&&carsize(21,2)<=trucksize(1,2)
  while i(22)<=6&&carsize(22,2)<=trucksize(1,2)
  while i(23)<=6&&carsize(23,2)<=trucksize(1,2)
  while i(24)<=6&&carsize(24,2)<=trucksize(1,2)
  while i(25)<=6&&carsize(25,2)<=trucksize(1,2)
  while i(26)<=6&&carsize(26,2)<=trucksize(1,2)
  while i(27)<=6&&carsize(27,2)<=trucksize(1,2)
  while i(28)<=6&&carsize(28,2)<=trucksize(1,2)
  while i(29)<=6&&carsize(29,2)<=trucksize(1,2)
  while i(30)<=6&&carsize(30,2)<=trucksize(1,2)
  while i(31)<=6&&carsize(31,2)<=trucksize(1,2)
  while i(32)<=6&&carsize(32,2)<=trucksize(1,2)
  while i(33)<=6&&carsize(33,2)<=trucksize(1,2)
  while i(34)<=6&&carsize(34,2)<=trucksize(1,2)
  while i(35)<=6&&carsize(35,2)<=trucksize(1,2)
  while i(36)<=6&&carsize(36,2)<=trucksize(1,2)
  while i(37)<=6&&carsize(37,2)<=trucksize(1,2)
  while i(38)<=6&&carsize(38,2)<=trucksize(1,2)
  while i(39)<=6&&carsize(39,2)<=trucksize(1,2)
  while i(40)<=6&&carsize(40,2)<=trucksize(1,2)
  while i(41)<=6&&carsize(41,2)<=trucksize(1,2)
  while i(42)<=6&&carsize(42,2)<=trucksize(1,2)
  while i(43)<=6&&carsize(43,2)<=trucksize(1,2)
  while i(44)<=6&&carsize(44,2)<=trucksize(1,2)
  while i(45)<=6&&carsize(45,2)<=trucksize(1,2)
 
        y=i(1)*(x(1)+0.1)+i(2)*(x(2)+0.1)+i(3)*(x(3)+0.1)+i(4)*(x(4)+0.1)+i(5)*(x(5)+0.1)+i(6)*(x(6)+0.1)+i(7)*(x(7)+0.1)+i(8)*(x(8)+0.1)+i(9)*(x(9)+0.1)+i(10)*(x(10)+0.1)+i(11)*(x(11)+0.1)+i(12)*(x(12)+0.1)+i(13)*(x(13)+0.1)+i(14)*(x(14)+0.1)+i(15)*(x(15)+0.1)+i(16)*(x(16)+0.1)+i(17)*(x(17)+0.1)+i(18)*(x(18)+0.1)+i(19)*(x(19)+0.1)+i(20)*(x(20)+0.1)+i(21)*(x(21)+0.1)+i(22)*(x(22)+0.1)+i(23)*(x(23)+0.1)+i(24)*(x(24)+0.1)+i(25)*(x(25)+0.1)+i(26)*(x(26)+0.1)+i(27)*(x(27)+0.1)+i(28)*(x(28)+0.1)+i(29)*(x(29)+0.1)+i(30)*(x(30)+0.1)+i(31)*(x(31)+0.1)+i(32)*(x(32)+0.1)+i(33)*(x(33)+0.1)+i(34)*(x(34)+0.1)+i(35)*(x(35)+0.1)+i(36)*(x(36)+0.1)+i(37)*(x(37)+0.1)+i(38)*(x(38)+0.1)+i(39)*(x(39)+0.1)+i(40)*(x(40)+0.1)+i(41)*(x(41)+0.1)+i(42)*(x(42)+0.1)+i(43)*(x(43)+0.1)+i(44)*(x(44)+0.1)+i(45)*(x(45)+0.1)-0.1;
        if y>trucksize(1,1)-min(x)-0.1&&y<=trucksize(1,1);
            plan1up=[plan1up;i];
        end
i(45)=i(45)+1;
  end
i(44)=i(44)+1;
  end
i(43)=i(43)+1;
  end
i(42)=i(42)+1;
  end
i(41)=i(41)+1;
  end
i(40)=i(40)+1;
  end
i(39)=i(39)+1;
  end
i(38)=i(38)+1;
  end
i(37)=i(37)+1;
  end
i(36)=i(36)+1;
  end
i(35)=i(35)+1;
  end
i(34)=i(34)+1;
  end
i(33)=i(33)+1;
  end
i(32)=i(32)+1;
  end
i(31)=i(31)+1;
  end
i(30)=i(30)+1;
  end
i(29)=i(29)+1;
  end
i(28)=i(28)+1;
  end
i(27)=i(27)+1;
  end
i(26)=i(26)+1;
  end
i(25)=i(25)+1;
  end
i(24)=i(24)+1;
  end
i(23)=i(23)+1;
  end
i(22)=i(22)+1;
  end
i(21)=i(21)+1;
  end
i(20)=i(20)+1;
  end
i(19)=i(19)+1;
  end
i(18)=i(18)+1;
  end
i(17)=i(17)+1;
  end
i(16)=i(16)+1;
  end
i(15)=i(15)+1;
  end
i(14)=i(14)+1;
  end
i(13)=i(13)+1;
  end
i(12)=i(12)+1;
  end
i(11)=i(11)+1;
  end
i(10)=i(10)+1;
  end
i(9)=i(9)+1;
  end
i(8)=i(8)+1;
  end
i(7)=i(7)+1;
  end
i(6)=i(6)+1;
  end
i(5)=i(5)+1;
  end
i(4)=i(4)+1;
  end
i(3)=i(3)+1;
  end
i(2)=i(2)+1;
  end
i(1)=i(1)+1
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
    f(i+length(plan11))=1.1;
end
for i=1:length(plan22)
    f(i+length(plan11)+length(plan12))=1.3;
end
A1=-1*plansum';
B=-1*[carnum;0];
intcon=1:length(plansum);
A2=zeros(1,length(plansum));
for i=1:length(plan11)
    A2(i)=-0.2;0
end
for i=1:length(plan12)
    A2(i+length(plan11))=1;
end
A=[A1;A2];
lb=zeros(length(plansum),1);
ub=20*ones(length(plansum),1);
[x, fval]=intlinprog(f,intcon,A,B,[],[],lb,ub);

truckmod=zeros(length(plansum),1);
truckmod(1:length(plan11))=11;
truckmod(length(plan11)+1:length(plan11)+length(plan12))=12;
truckmod(length(plan11)+length(plan12)+1:length(plansum))=22;
planall=[truckmod,x,plansum1];
[i,j,v]=find(planall(:,2)==0);
planall(i,:)=[]
clean=' ';
xlswrite('前三问输出表.xls',clean,2,'A2:H30')
xlswrite('前三问输出表.xls',planall,2,'A2')