clear;clc;close all;

houdu=25

W=1220-16;
H=2440-16;
W0=W;
H0=H;
dingdan=xlsread('dingdan.xls','A1:D25');
if houdu==25
hang=[3,8,13,18,23];
end
if houdu==9
    hang=[2,7,12,17,22];
end
if houdu==18
    hang=[1,6,11,16,21];
end
    
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

plan=[];
for i=0:4
    for j=0:4
        for k=0:4
            for l=0:4
                for m=0:4
                    if area(1)*i+area(2)*j+area(3)*k+area(4)*l+area(5)*m>W*H
                        break
                    end
                    plan=[plan;i,j,k,l,m,0,0,0,0,0,0];
                end
            end
        end
    end
end

pland=[];

for i=1:size(plan,1)
    if sum(plan(i,:))>4
        pland=[pland;i];
    end
end
plan(pland,:)=[];

plannot=[];
for i=1:length(plan)
    wh=[];
    [a,b,c]=find(plan(i,1:5));
    for jj=1:length(c)
        for k=1:c(jj)
           wh=[wh;sizes(jj,1:2),b(jj)];
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
       W=W0
       H=H0
       if j==2
        W0=W;
        W=H;
        H=W0;
       end
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
            for n=1:3
            %%%%%%%%%%%4+0
            if n==1
            wwhh=whr;
            t=zeros(4,5);
            r=zeros(5,4);
            l=1;
            
            if wwhh(1,1)+wwhh(2,1)+wwhh(3,1)+wwhh(4,1)<=W&&wwhh(1,2)<=H&&wwhh(2,2)<=H&&wwhh(3,2)<=H&&wwhh(4,2)<=H
                kexing=1;
                t(1,:)=[0,0,wwhh(1,1),wwhh(1,2),wwhh(1,3)];
                t(2,:)=[wwhh(1,1),0,wwhh(2,1),wwhh(2,2),wwhh(2,3)];
                t(3,:)=[wwhh(1,1)+wwhh(2,1),0,wwhh(3,1),wwhh(3,2),wwhh(3,3)];
                t(4,:)=[wwhh(1,1)+wwhh(2,1)+wwhh(3,1),0,wwhh(4,1),wwhh(4,2),wwhh(4,3)];
                r(1,:)=[0,wwhh(1,2),wwhh(1,1),H-wwhh(1,2)];
                r(2,:)=[wwhh(1,1),wwhh(2,2),wwhh(2,1),H-wwhh(2,2)];
                r(3,:)=[wwhh(1,1)+wwhh(2,1),wwhh(3,2),wwhh(3,1),H-wwhh(3,2)];
                r(4,:)=[wwhh(1,1)+wwhh(2,1)+wwhh(3,1),wwhh(4,2),wwhh(4,1),H-wwhh(4,2)];
                r(5,:)=[wwhh(1,1)+wwhh(2,1)+wwhh(3,1)+wwhh(4,1),0,W-wwhh(1,1)-wwhh(2,1)-wwhh(3,1)-wwhh(4,1),H];
                rlv=zeros(5,7);
                for m=1:5
                    for o=3:4
                        for p=62:40:102
                            v=1-mod(r(m,o),p)/r(m,o);
                            if v>rlv(m,7)
                               rlv(m,1:7)=[r(m,1:4),o,p,v];
                            end
                        end
                    end
                   
                end
                rrlv=zeros(5,1);
                rr=zeros(5,1);
                for m=1:5
                    rrlv(m)=rlv(m,7)*r(m,3)*r(m,4);
                    rr(m)=r(m,3)*r(m,4);
                end
                Rlv=sum(rrlv)/sum(rr);
                if Rlv>plan(i,11)
                    plan(i,6:11)=[i,j,k,n,l,Rlv];
                end
            end
            end
            %%%%%%%%%%%%3+1
            if n==2
            t=zeros(4,5);
            r=zeros(5,4);
            for l=0:3
                wwhh=whr;
                if l>=1
                   whp0=wwhh(l,:);
                   wwhh(l,:)=[];
                   wwhh=[wwhh;whp0];
                end
            
            if wwhh(1,1)+wwhh(4,1)<=W&&wwhh(2,1)+wwhh(4,1)<=W&&wwhh(3,1)+wwhh(4,1)<=W&&wwhh(1,2)+wwhh(2,2)+wwhh(3,2)<=H&&wwhh(4,2)<=H
                kexing=1;
                t(1,:)=[0,0,wwhh(1,1),wwhh(1,2),wwhh(1,3)];
                t(2,:)=[0,wwhh(1,2),wwhh(2,1),wwhh(2,2),wwhh(2,3)];
                t(3,:)=[0,wwhh(1,2)+wwhh(2,2),wwhh(3,1),wwhh(3,2),wwhh(3,3)];
                t(4,:)=[W-wwhh(4,1),0,wwhh(4,1),wwhh(4,2),wwhh(4,3)];
                r(1,:)=[wwhh(1,1),0,W-wwhh(1,1)-wwhh(4,1),wwhh(1,2)];
                r(2,:)=[wwhh(2,1),wwhh(1,2),W-wwhh(4,1)-wwhh(2,1),wwhh(2,2)];
                r(3,:)=[wwhh(3,1),wwhh(1,2)+wwhh(2,2),W-wwhh(4,1)-wwhh(3,1),wwhh(3,2)];
                r(4,:)=[0,wwhh(1,2)+wwhh(2,2)+wwhh(3,2),W-wwhh(4,1),H-wwhh(1,2)-wwhh(2,2)-wwhh(3,2)];
                r(5,:)=[W-wwhh(4,1),wwhh(4,2),wwhh(4,1),H-wwhh(4,2)];
                rlv=zeros(5,7);
                for m=1:5
                    for o=3:4
                        for p=62:40:102
                            v=1-mod(r(m,o),p)/r(m,o);
                            if v>rlv(m,7)
                               rlv(m,1:7)=[r(m,1:4),o,p,v];
                            end
                        end
                    end
                   
                end
                rrlv=zeros(5,1);
                rr=zeros(5,1);
                for m=1:5
                    rrlv(m)=rlv(m,7)*r(m,3)*r(m,4);
                    rr(m)=r(m,3)*r(m,4);
                end
                Rlv=sum(rrlv)/sum(rr);
                if Rlv>plan(i,11)
                    plan(i,6:11)=[i,j,k,n,l,Rlv];
                end
            end
            end
            end
            %%%%%%%%%%%%2+2
            if n==3
            t=zeros(4,5);
            r=zeros(5,4);
            for l=4:6
                wwhh=whr;
                if l-3>=2
                    whp0=wwhh(4,:);
                    wwhh(4,:)=wwhh(l-3,:);
                    wwhh(l-3,:)=whp0;
                end
                if wwhh(1,1)+wwhh(3,1)<=W&&wwhh(2,1)+wwhh(4,1)<=W&&wwhh(1,2)+wwhh(2,2)<=H&&wwhh(3,2)+wwhh(4,2)<=H
                    kexing=1;
                    t(1,:)=[0,0,wwhh(1,1),wwhh(1,2),wwhh(1,3)];
                    t(2,:)=[0,H-wwhh(2,2),wwhh(2,1),wwhh(2,2),wwhh(2,3)];
                    t(3,:)=[W-wwhh(3,1),0,wwhh(3,1),wwhh(3,2),wwhh(3,3)];
                    t(4,:)=[W-wwhh(4,1),H-wwhh(4,2),wwhh(4,1),wwhh(4,2),wwhh(4,3)];
                    r(1,:)=[0,wwhh(1,2),W-wwhh(3,1),H-wwhh(1,2)-wwhh(2,2)];
                    r(2,:)=[wwhh(1,1),0,W-wwhh(1,1)-wwhh(3,1),wwhh(1,2)];
                    r(3,:)=[wwhh(2,1),H-wwhh(2,2),W-wwhh(2,1)-wwhh(4,1),wwhh(2,2)];
                    r(4,:)=[W-wwhh(3,1),H-wwhh(4,2),wwhh(3,1)-wwhh(4,1),wwhh(4,2)-wwhh(2,2)];
                    r(5,:)=[W-wwhh(3,1),wwhh(3,2),wwhh(3,1),H-wwhh(3,2)-wwhh(4,2)];
                    rlv=zeros(5,7);
                for m=1:5
                    for o=3:4
                        for p=62:40:102
                            v=1-mod(r(m,o),p)/r(m,o);
                            if v>rlv(m,7)
                               rlv(m,1:7)=[r(m,1:4),o,p,v];
                            end
                        end
                    end
                   
                end
                rrlv=zeros(5,1);
                rr=zeros(5,1);
                for m=1:5
                    rrlv(m)=rlv(m,7)*r(m,3)*r(m,4);
                    rr(m)=r(m,3)*r(m,4);
                end
                Rlv=sum(rrlv)/sum(rr);
                if Rlv>plan(i,11)
                    plan(i,6:11)=[i,j,k,n,l,Rlv];
                end
                    
                end
            end
            end 
            end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
   end
   if kexing==0
       plannot=[plannot;i];
   end
   
end
%plan(plannot,:)=[];

%%%%%整数规划
f=ones(1,length(plan));
f(plannot)=10000000000000000;
intcon=1:length(plan);
A=-1*plan(:,1:5)';
B=-1*sizes(:,4);
lb=zeros(length(plan),1);
ub=1000*ones(length(plan),1);
[x, fval]=intlinprog(f,intcon,A,B,[],[],lb,[]);

AREA=2440*1220*fval;
lv=areasum/AREA


[planNo,y,shuliang]=find(x);
llvv=zeros(length(planNo),1);
for i=1:length(planNo)
    llvv(i)=plan(planNo(i),11)*shuliang(i);
end
ylv=sum(llvv)/sum(shuliang)
