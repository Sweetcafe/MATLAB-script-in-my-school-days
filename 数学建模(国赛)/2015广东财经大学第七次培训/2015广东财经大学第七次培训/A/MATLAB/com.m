loaddata
w=[3;3;3;3;2;2;2;2];
for i=1:8
    avg1(i)=mean(a1(:,i+5));
    P1(i)=avg1(i)/back(i,1);
end
Pavg1=P1*w/sum(w);
Pcom1=((Pavg1^2+(max(P1))^2)^0.5)/2;

for i=1:8
    avg2(i)=mean(a2(:,i+5));
    P2(i)=avg2(i)/back(i,1);
end
Pavg2=P2*w/sum(w);
Pcom2=((Pavg1^2+(max(P2))^2)^0.5)/2;

for i=1:8
    avg3(i)=mean(a3(:,i+5));
    P3(i)=avg3(i)/back(i,1);
end
Pavg3=P3*w/sum(w);
Pcom3=((Pavg3^2+(max(P3))^2)^0.5)/2;

for i=1:8
    avg4(i)=mean(a4(:,i+5));
    P4(i)=avg4(i)/back(i,1);
end
Pavg4=P4*w/sum(w);
Pcom4=((Pavg4^2+(max(P4))^2)^0.5)/2;

for i=1:8
    avg5(i)=mean(a5(:,i+5));
    P5(i)=avg5(i)/back(i,1);
end
Pavg5=P5*w/sum(w);
Pcom5=((Pavg5^2+(max(P5))^2)^0.5)/2;

Pcom=[Pcom1,Pcom2,Pcom3,Pcom4,Pcom5]

for i=1:8
    all(:,i+5)=all(:,i+5)/back(i);
end
for i=1:length(all)
    pa(i,1)=all(i,6:13)*w/sum(w);
    p(i,1)=((pa(i,1)^2+(max(all(i,6:13)))^2)/2)^0.5;
    all(i,14)=p(i,1);
end

    
[i,j,v]=find(As>=(max(As)+min(As))/2);
As_max=As(i);
As_xy=[];
for n=1:length(i)
As_xy=[As_xy;position(find(position(:,1)==i(n)),2:3)];
end
As_po=[i,As_xy,As_max];

[i,j,v]=find(Cd>=(max(Cd)+min(Cd))/2);
Cd_max=Cd(i);
Cd_xy=[];
for n=1:length(i)
Cd_xy=[Cd_xy;position(find(position(:,1)==i(n)),2:3)];
end
Cd_po=[i,Cd_xy,Cd_max];

[i,j,v]=find(Cr>=(max(Cr)+min(Cr))/2);
Cr_max=Cr(i);
Cr_xy=[];
for n=1:length(i)
Cr_xy=[Cr_xy;position(find(position(:,1)==i(n)),2:3)];
end
Cr_po=[i,Cr_xy,Cr_max];

[i,j,v]=find(Cu>=(max(Cu)+min(Cu))/2);
Cu_max=Cu(i);
Cu_xy=[];
for n=1:length(i)
Cu_xy=[Cu_xy;position(find(position(:,1)==i(n)),2:3)];
end
Cu_po=[i,Cu_xy,Cu_max];

[i,j,v]=find(Hg>=(max(Hg)+min(Hg))/2);
Hg_max=Hg(i);
Hg_xy=[];
for n=1:length(i)
Hg_xy=[Hg_xy;position(find(position(:,1)==i(n)),2:3)];
end
Hg_po=[i,Hg_xy,Hg_max];

[i,j,v]=find(Ni>=(max(Ni)+min(Ni))/2);
Ni_max=Ni(i);
Ni_xy=[];
for n=1:length(i)
Ni_xy=[Ni_xy;position(find(position(:,1)==i(n)),2:3)];
end
Ni_po=[i,Ni_xy,Ni_max];

[i,j,v]=find(Pb>=(max(Pb)+min(Pb))/2);
Pb_max=Pb(i);
Pb_xy=[];
for n=1:length(i)
Pb_xy=[Pb_xy;position(find(position(:,1)==i(n)),2:3)];
end
Pb_po=[i,Pb_xy,Pb_max];

[i,j,v]=find(Zn>=(max(Zn)+min(Zn))/2);
Zn_max=Zn(i);
Zn_xy=[];
for n=1:length(i)
Zn_xy=[Zn_xy;position(find(position(:,1)==i(n)),2:3)];
end
Zn_po=[i,Zn_xy,Zn_max];

xy=[As_po;Cd_po;Cr_po;Cu_po;Hg_po;Ni_po;Pb_po;Zn_po]

