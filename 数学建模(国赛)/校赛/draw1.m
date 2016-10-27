paiyang
hold on
d=6;%plan(planNo(No),6):plan(planNo(No),6)
for i=plan(planNo(d),6):plan(planNo(d),6)
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
            
   for j=plan(planNo(d),7):plan(planNo(d),7)
       W=W0;
       H=H0;
       if j==2
        W0=W;
        W=H;
        H=W0;
       end
        for k=plan(planNo(d),8):plan(planNo(d),8)
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
            for n=plan(planNo(d),9):plan(planNo(d),9)
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
                r(5,:)=[wwhh(1,1)+wwhh(2,1)+wwhh(3,1)+wwhh(4,1),0,wwhh(4,1),wwhh(4,2)];
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
                    xxx=rlv(m,1);
                    yyy=rlv(m,2);
                    www=rlv(m,3);
                    hhh=rlv(m,4);
                    ooo=rlv(m,5);
                    ppp=rlv(m,6);
                    
                    if ooo==3
                        f=fix(www/ppp);
                        for q=1:f
                            xxxx(q,1)=xxx+(q-1)*ppp;
                            yyyy(q,1)=yyy;
                            wwww(q,1)=ppp;
                            hhhh(q,1)=hhh;
                            r=[r;xxxx,yyyy,wwww,hhhh];
                        end
                        for s=6:length(r)
                            rectangle('position',r(s,1:4),'FaceColor','r')
                        end
                    end
                    if ooo==4
                        f=fix(hhh/ppp)
                        for q=1:f
                            xxxx(q,1)=xxx;
                            yyyy(q,1)=yyy+(q-1)*ppp;
                            wwww(q,1)=www;
                            hhhh(q,1)=ppp;
                            r=[r;xxxx,yyyy,wwww,hhhh];
                        end
                        for s=6:length(r)
                            rectangle('position',r(s,1:4),'FaceColor','r')
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
            for l=plan(planNo(d),10):plan(planNo(d),10)
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
                    xxx=rlv(m,1);
                    yyy=rlv(m,2);
                    www=rlv(m,3);
                    hhh=rlv(m,4);
                    ooo=rlv(m,5);
                    ppp=rlv(m,6);
                    
                    if ooo==3
                        f=fix(www/ppp);
                        for q=1:f
                            xxxx(q,1)=xxx+(q-1)*ppp;
                            yyyy(q,1)=yyy;
                            wwww(q,1)=ppp;
                            hhhh(q,1)=hhh;
                            r=[r;xxxx,yyyy,wwww,hhhh];
                        end
                        for s=6:length(r)
                            rectangle('position',r(s,1:4),'FaceColor','r')
                        end
                    end
                    if ooo==4
                        f=fix(hhh/ppp);
                        for q=1:f
                            xxxx(q,1)=xxx;
                            yyyy(q,1)=yyy+(q-1)*ppp;
                            wwww(q,1)=www;
                            hhhh(q,1)=ppp;
                            r=[r;xxxx,yyyy,wwww,hhhh];
                        end
                        for s=6:length(r)
                            rectangle('position',r(s,1:4),'FaceColor','r')
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
            for l=plan(planNo(d),10):plan(planNo(d),10)
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
                    xxx=rlv(m,1);
                    yyy=rlv(m,2);
                    www=rlv(m,3);
                    hhh=rlv(m,4);
                    ooo=rlv(m,5);
                    ppp=rlv(m,6);
                    
                    if ooo==3
                        f=fix(www/ppp);
                        for q=1:f
                            xxxx(q,1)=xxx+(q-1)*ppp;
                            yyyy(q,1)=yyy;
                            wwww(q,1)=ppp;
                            hhhh(q,1)=hhh;
                            r=[r;xxxx,yyyy,wwww,hhhh];
                        end
                        for s=6:length(r)
                            rectangle('position',r(s,1:4),'FaceColor','r')
                        end
                    end
                    if ooo==4
                        f=fix(hhh/ppp);
                        for q=1:f
                            xxxx(q,1)=xxx;
                            yyyy(q,1)=yyy+(q-1)*ppp;
                            wwww(q,1)=www;
                            hhhh(q,1)=ppp;
                            r=[r;xxxx,yyyy,wwww,hhhh];
                        end
                        for s=6:length(r)
                            rectangle('position',r(s,1:4),'FaceColor','r')
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
hold on
set(gca,'DataAspectRatio',[1 1 1])
rectangle('position',[0,0,W,H],'linewidth',3)
for i=1:4
rectangle('position',t(i,1:4),'FaceColor','g');
text(t(i,1)+t(i,3)/2,t(i,2)+t(i,4)/2,num2str(t(i,5)));
end
a=planNo(d)
b=shuliang(d)
title([num2str(houdu) '毫米切割方案' num2str(a) ': 切割' num2str(b) '块' ])
xlabel(['原材料利用率=',num2str(lv*100),'%','    余料利用率=',num2str(ylv*100),'%'])