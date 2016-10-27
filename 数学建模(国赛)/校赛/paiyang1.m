clear;clc;close all;
W=1220-16;
H=2440-16;
dingdan=xlsread('dingdan.xls','A1:D25');
hang=[3,8,13,18,23];
sizes=dingdan(hang,:);
num=size(sizes,1);
w=sizes(:,1)+4;
h=sizes(:,2)+4;
for i=1:num
    area(i)=w(i)*h(i);
end
%areasort=sort(area,'descend')
w0=sizes(:,1);
h0=sizes(:,2);
n0=sizes(:,4);
for i=1:5
    area0(i)=w0(i)*h0(i)*n0(i);
end
areasum=sum(area0);

plan=[]
for i=0:4
    for j=0:4
        for k=0:4
            for l=0:4
                for m=0:4
                    if area(1)*i+area(2)*j+area(3)*k+area(4)*l+area(5)*m>W*H
                        break
                    end
                    plan=[plan;i,j,k,l,m];
                end
            end
        end
    end
end

pland=[]

for i=1:size(plan,1)
    if sum(plan(i,:))>4
        pland=[pland;i]
    end
end
plan(pland,:)=[]

plannot=[]
for i=1:length(plan)
    wh=[];
    [a,b,c]=find(plan(i,:));
    for j=1:length(c)
        for k=1:c(j)
           wh=[wh;sizes(j,1:2),b(j)];
        end
    end
    while size(wh,1)<4
        wh=[wh;0,0,0];
    end
    %wh(length(c):4,:)=[0,0]
    kexing=0;
    %for ii=0:3
     %   whpaixv=wh;
        %if ii>=1
         %   whp0=whpaixv(ii,:);
          %  whpaixv(ii,:)=[];
           % whpaixv=[whpaixv;whp0];
        
        %end
            
   for j=1:2
        W0=W;
        W=H;
        H=W0;
        for k=0:7
            whr=wh;
            if k>=1&&k<=4
            wh0=whr(k,1);
            whr(k,1)=whr(k,2);
            whr(k,2)=wh0;
            else if k>=5
                wh1=whr(1,1);
                whr(1,1)=whr(1,2);
                whr(1,2)=wh1;
                
                wh2=whr(k-3,1);
                whr(k-3,1)=whr(k-3,2);
                whr(k-3,2)=wh2;
                 end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%4+0
D=[1,2,3,4];
R=[0,0,0,0];
NN=1;  %NN是剩余矩形的个数.
rest(1,:)=[0,0,H,W];%样板的尺寸设为：宽15，高60.
HH=0;% 占用高度，用来求样板利用率.
re=zeros(30,4);
for ii=1:25  %放置25个矩形件
    %ii=3;
    nn=1;jj=0;
    while nn<=NN  %求能包含小矩形件的剩余矩形 re，jj表示个数.
        if rest(nn,3)>=w(ii)&&rest(nn,4)>=h(ii)
            jj=jj+1;re(jj,:)=rest(nn,:);
        end
        nn=nn+1;
    end
    kk=2;
    while kk<=jj %求用到的剩余矩形（放在re的第一行），根据BL条件.
        if re(kk,2)<re(1,2)||(re(kk,2)==re(1,2)&&re(kk,1)<re(1,1))
            re(1,:)=re(kk,:);            
        end
        kk=kk+1;
    end
    A(ii,1)=re(1,1); A(ii,2)=re(1,2);A(ii,3)=w(ii);A(ii,4)=h(ii);%第ii个矩形件的位置信息
    if HH<(A(ii,2)+A(ii,4))  % 占用高度的更新.
        HH=(A(ii,2)+A(ii,4));
    end
    %剩余矩形数组的处理更新.NN A(ii,)
    nn=1;NNow=NN;
    while nn<=NNow; 
        mm=0;
        kk=NN+1;         % 
        if (A(ii,2)>rest(nn,2))&&(A(ii,2)<(rest(nn,2)+rest(nn,4)))&&(A(ii,1)<rest(nn,1)+rest(nn,3))&&(A(ii,1)+A(ii,3)>rest(nn,1))
            NN=NN+1;
            rest(kk,1)=rest(nn,1);rest(kk,2)=rest(nn,2);
            rest(kk,3)=rest(nn,3);rest(kk,4)=A(ii,2)-rest(nn,2);
            kk=kk+1;mm=1;
        end
        if rest(nn,1)+rest(nn,3)>A(ii,1)+A(ii,3)&&A(ii,1)+A(ii,3)>rest(nn,1)&&(A(ii,2)<rest(nn,2)+rest(nn,4))&&(A(ii,2)+A(ii,4)>rest(nn,2))
            NN=NN+1;
            rest(kk,1)=A(ii,1)+A(ii,3);rest(kk,2)=rest(nn,2);
            rest(kk,3)=rest(nn,1)+rest(nn,3)-A(ii,1)-A(ii,3);
            rest(kk,4)=rest(nn,4);
            kk=kk+1;mm=1;
        end
        if A(ii,1)>rest(nn,1)&&(A(ii,1)<rest(nn,1)+rest(nn,3))&&(A(ii,2)<rest(nn,2)+rest(nn,4))&&(A(ii,2)+A(ii,4)>rest(nn,2))
            NN=NN+1;
            rest(kk,1)=rest(nn,1);rest(kk,2)=rest(nn,2);
            rest(kk,4)=rest(nn,4);rest(kk,3)=A(ii,1)-rest(nn,1);
            kk=kk+1;mm=1;
        end
        if rest(nn,2)+rest(nn,4)>A(ii,2)+A(ii,4)&&A(ii,2)+A(ii,4)>rest(nn,2)&&(A(ii,1)<rest(nn,1)+rest(nn,3))&&(A(ii,1)+A(ii,3)>rest(nn,1))
            NN=NN+1;
            rest(kk,2)=A(ii,2)+A(ii,4);rest(kk,1)=rest(nn,1);
            rest(kk,4)=rest(nn,2)+rest(nn,4)-A(ii,2)-A(ii,4);
            rest(kk,3)=rest(nn,3);
            kk=kk+1;mm=1;
        end
        if mm==0
            nn=nn+1;
        else 
            rest(nn,:)=[];NN=NN-1;NNow=NNow-1;rest(50,:)=0;%删除要注意！
        end
    end  %求出剩余矩形数组，下面要对其进行整理.
    
    nn=1;mm=0;
    while nn<=NN
        kk=ii+1;
        while kk<=25
            if (rest(nn,3)>=w(kk)&&rest(nn,4)>=h(kk))
                mm=1;break;
            else
                kk=kk+1;%
               
            end
        
        end
        if mm==1
           nn=nn+1;
        else 
            NN=NN-1;rest(nn,:)=[];rest(50,:)=0; 
             %删去面积为零的或已无法排下所剩的任何一个矩形件的剩余矩形
        end
    end
    nn=1;
    while nn<=NN
        kk=1;
        while kk<NN
            if rest(nn,1)>=rest(kk,1)&&rest(nn,2)>=rest(kk,2)&&rest(nn,1)+rest(nn,3)<=rest(kk,1)+rest(kk,3)&&rest(nn,2)+rest(nn,4)<=rest(kk,2)+rest(kk,4)
                if nn~=kk
                    NN=NN-1;mm=1;
                    rest(nn,:)=[];rest(50,:)=0;%删去被包含的剩余矩形
                    break;
                else
                    kk=kk+1;mm=0;
                end
            else
                kk=kk+1;mm=0;
            end
        end
        if mm==0
           nn=nn+1;
        end
    end  %
        
end

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        end
   end
   if kexing==0
       plannot=[plannot;i]
   end
   
end
plan(plannot,:)=[];

%%整数规划
f=ones(1,length(plan));
intcon=1:length(plan);
A=-1*plan(:,1:5)';
B=-1*sizes(:,4);
lb=zeros(length(plan),1);
ub=1000*ones(length(plan),1);
[x, fval]=intlinprog(f,intcon,A,B,[],[],lb,ub)

AREA=2440*1220*fval;
lv=areasum/AREA

%%%%%%选定切割方案
%[bianhao,y,shuliang]=find(x)

%for i=1:length(bianhao)
 %   i
%end