clear;clc;close all
houdu=0.1;
for ii=0.1:0.1:0.5
    houdu=ii
nu=-36.4;
p=7850;
c=460;
step=1;
l=60;
w=60;
q=0;
d=1;
dw=d*w;
dl=d*l;
ta=493;
tp=293
rrt;
%%%%%%%%%%%ÈÈ×è·¨
R=(1/sqrt(d)/100)/(houdu/100*(1/sqrt(d)/100)*nu);
zeta=1/R;
Q=zeta*step;
a1=Q/(c*p*houdu/100*1/d/10000);
%%%%%%%%%%%%
data=[];

%%%%%%%%%%%%
%a2=r/houdu^2/c/p;
%pana=ta*ones(w*d+2,l*d+2);
%pana(2:w*d+1,2:l*d+1)=293;
%pana=rrtt(60,40,0.5,293,473);
delta=zeros(dw+2,dl+2);
for time=0:step:1800
    time;
    delta=zeros(w*d+2,l*d+2);
    panup=[pana(end,:);pana(1:end-1,:)];
    pandown=[pana(2:end,:);pana(1,:)];
    panleft=[pana(:,end),pana(:,1:end-1)];
    panright=[pana(:,2:end),pana(:,1)];
    delta=a1*(pana*4-panup-pandown-panleft-panright)+a1/100*(pana-ta);
    delta=delta.*panl;
    pana=pana+delta;
    
end
pann=[];

pann=pana.*panl;
T=[];
for i=1:size(pann,1)
    for j=1:size(pann,2)
        if pann(i,j)~=0
            T=[T,pann(i,j)];
        end
    end
end
S=std(T);
X=mean(T);
pana(pana==493)=nan;
surf(pana)
colormap hot
shading interp
%text(0,0,493,['std= ',num2str(S)],'fontsize',16)
zlabel('temperature(K)')
title('Temperature distribution')
data=[data;houdu,X,S]
end
xlswrite(data)
