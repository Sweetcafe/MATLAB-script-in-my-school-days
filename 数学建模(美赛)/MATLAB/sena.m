clear;clc;close all;
x=[2.850093093	0.605827992	1.118808188	0.269507886	0.856287435	-0.353687223	-0.084793595	-0.177331132	-0.572448713	1	0.119621344	0.868067931	0.012310725];
stem(x,'fill')
set(gca,'XTick',1:1:12);
%xlabel('Parameter names')
ylabel('Sensitivity(%)')


title('Sensitivity of different parameter')

set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号

set(get(gca,'YLabel'),'FontSize',16);

set(get(gca,'TITLE'),'FontSize',18);

set(gca,'fontsize',14);
set(gca,'xticklabel','');
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13]);%在X轴上设置刻度
set(gca,'XTicklabel',{'size','surface length','upper surface width ','bottom surface width ','height of bathtub','height of man','weight','contracting area','temperature of man','heat trandfer of water','h water-air','h water-tub','h water-man'},'FontSize',15)
h = gca; 
rotateticklabel(gca,'x',-20)
