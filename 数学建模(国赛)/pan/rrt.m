%clear;clc;close all
%l=60;
%w=40;
%q=0;
%tp=293;
%ta=493;
r=w*q/2;
d=1;
dw=d*w;
dl=d*l;
dr=d*r;
pann=tp*ones(dw,dl);
for i=1:dw
    for j=1:dl
        D=[];
        if i<=dr&&j<=dr
           D=sqrt((i-dr-1)^2+(j-dr-1)^2);
           if D>=dr
              pann(i,j)=ta;
           end
        end
        if i<=dr&&j>=dl-dr
           D=sqrt((i-dr-1)^2+(j-(dl-dr))^2);
           if D>=dr
              pann(i,j)=ta;
           end
        end
        if i>=dw-dr&&j<=dr
           D=sqrt((i-(dw-dr))^2+(j-dr-1)^2);
           if D>=dr
              pann(i,j)=ta;
           end
        end
        if i>=dw-dr&&j>=dl-dr
           D=sqrt((i-(dw-dr))^2+(j-(dl-dr))^2);
           if D>dr
              pann(i,j)=ta;
           end
        end
    end
end
pana=ta*ones(dw+2,dl+2);
pana(2:dw+1,2:dl+1)=pann;
panl=zeros(dw+2,dl+2);
panl(2:dw+1,2:dl+1)=(pann==tp);
surf(panl);
colormap hot
shading interp
axis equal
%panal=(panl-1)*0.1
%panup=[panal(end,:);panal(1:end-1,:)];
%pandown=[panal(2:end,:);panal(1,:)];
%panleft=[panal(:,end),panal(:,1:end-1)];
%panright=[panal(:,2:end),panal(:,1)];
%delta=(panl*4-panup-pandown-panleft-panright)
%panedge=zeros(dw+2,dl+2)
%panedge(find(delta<=4.2&delta>=4.1))=1

