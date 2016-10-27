clear;clc;close all
houdu=0.1;
nu=-36.4
p=7850
c=460
step=1;
w=40;
l=60;
d=2;
dw=d*w
dl=d*l
ta=439;
rrt
%%%%%%%%%%%ÈÈ×è·¨
R=(1/sqrt(d)/100)/(houdu/100*(1/sqrt(d)/100))/nu;
zeta=1/R;
Q=zeta*step;
a1=Q/(c*p*houdu/100*1/d/10000);
%%%%%%%%%%%%

%a2=r/houdu^2/c/p;
%pana=ta*ones(w*d+2,l*d+2);
%pana(2:w*d+1,2:l*d+1)=293;
%pana=rrtt(60,40,0.5,293,473);
delta=zeros(dw+2,dl+2);
for time=0:step:180
    time;
    delta=zeros(w*d+2,l*d+2);
for i=1:dw+2
    for j=1:dl+2
        if pana(i,j)==ta
            continue
        end
        delta(i,j)=(pana(i,j)-pana(i-1,j))*a1+(pana(i,j)-pana(i+1,j))*a1+(pana(i,j)-pana(i,j-1))*a1+(pana(i,j)-pana(i,j+1))*a1;%+(pana(i,j)-air)*a1;
        pana(i,j)=pana(i,j)+delta(i,j);
    end
end
end
pann=[]
pann=pana(2:w*d+1,2:l*d+1);
surf(pann)
colormap hot
shading interp

    
