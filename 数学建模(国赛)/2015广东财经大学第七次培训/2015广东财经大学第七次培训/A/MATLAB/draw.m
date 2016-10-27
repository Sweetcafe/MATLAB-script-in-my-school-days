loaddata
x=position(:,2);
y=position(:,3);
z=position(:,4);
a=position(:,5);
minx=min(x);
maxx=max(x);
miny=min(y);
maxy=max(y);

%%%%%%%等高线图
%[X,Y,Z]=griddata(x,y,z,linspace(minx,maxx)',linspace(miny,maxy),'cubic'); %插值
%surf(X,Y,Z,'EdgeColor','none')

%[cs,h]=contour(X,Y,Z)  
%clabel(cs, h)%, 'FontSize', 15, 'Color', 'r', 'Rotation', 0);

%%%%%%%As分布图
%[X,Y,AS]=griddata(x,y,As,linspace(minx,maxx)',linspace(miny,maxy),'cubic')
%surf(X,Y,AS,'EdgeColor','none')%%As分布图
%colormap(hsv)
%colorbar
%view(2)
%hold on
%h1=plot3(a1(:,2),a1(:,3),a1(:,6)+1,'or')%,'MarkerFaceColor','r');%%As
%h2=plot3(a2(:,2),a2(:,3),a2(:,6)+1,'*g')%,'MarkerFaceColor','g');
%h3=plot3(a3(:,2),a3(:,3),a3(:,6)+1,'sb')%,'MarkerFaceColor','b');
%h4=plot3(a4(:,2),a4(:,3),a4(:,6)+1,'pc')%,'MarkerFaceColor','c');
%h5=plot3(a5(:,2),a5(:,3),a5(:,6)+1,'^m')%,'MarkerFaceColor','m');
%legend([h1,h2,h3,h4,h5],'生活区','工业区','山区','交通区','公园绿地区',2);
%title('As分布色阶图')
%xlabel('x(m)')
%ylabel('y(m)')

%%%%%%%Cd分布图
%[X,Y,CD]=griddata(x,y,Cd,linspace(minx,maxx)',linspace(miny,maxy),'cubic')
%surf(X,Y,CD,'EdgeColor','none')
%colormap(hsv)
%colorbar
%view(2)
%hold on
%h1=plot3(a1(:,2),a1(:,3),a1(:,7)+20,'or')%,'MarkerFaceColor','r');
%h2=plot3(a2(:,2),a2(:,3),a2(:,7)+20,'*g')%,'MarkerFaceColor','g');
%h3=plot3(a3(:,2),a3(:,3),a3(:,7)+20,'sb')%,'MarkerFaceColor','b');
%h4=plot3(a4(:,2),a4(:,3),a4(:,7)+20,'pc')%,'MarkerFaceColor','c');
%h5=plot3(a5(:,2),a5(:,3),a5(:,7)+20,'^m')%,'MarkerFaceColor','m');
%legend([h1,h2,h3,h4,h5],'生活区','工业区','山区','交通区','公园绿地区',2);
%title('Cd分布色阶图')
%xlabel('x(m)')
%ylabel('y(m)')

%%%%%%%Cr分布图
%[X,Y,CR]=griddata(x,y,Cr,linspace(minx,maxx)',linspace(miny,maxy),'cubic')
%surfc(X,Y,CR,'EdgeColor','none')
%colormap(hsv)
%colorbar
%view(2)
%hold on
%h1=plot3(a1(:,2),a1(:,3),a1(:,8)+10,'or')%,'MarkerFaceColor','r');
%h2=plot3(a2(:,2),a2(:,3),a2(:,8)+10,'*g')%,'MarkerFaceColor','g');
%h3=plot3(a3(:,2),a3(:,3),a3(:,8)+10,'sb')%,'MarkerFaceColor','b');
%h4=plot3(a4(:,2),a4(:,3),a4(:,8)+10,'pc')%,'MarkerFaceColor','c');
%h5=plot3(a5(:,2),a5(:,3),a5(:,8)+10,'^m')%,'MarkerFaceColor','m');
%legend([h1,h2,h3,h4,h5],'生活区','工业区','山区','交通区','公园绿地区',2);
%title('Cr分布色阶图')
%xlabel('x(m)')
%ylabel('y(m)')

%%%%%%%Cu分布图
%[X,Y,CU]=griddata(x,y,Cu,linspace(minx,maxx)',linspace(miny,maxy),'cubic')
%surfc(X,Y,CU,'EdgeColor','none')
%colormap(hsv)
%colorbar
%view(2)
%hold on
%h1=plot3(a1(:,2),a1(:,3),a1(:,9)+10,'or')%,'MarkerFaceColor','r');
%h2=plot3(a2(:,2),a2(:,3),a2(:,9)+10,'*g')%,'MarkerFaceColor','g');
%h3=plot3(a3(:,2),a3(:,3),a3(:,9)+10,'sb')%,'MarkerFaceColor','b');
%h4=plot3(a4(:,2),a4(:,3),a4(:,9)+10,'pc')%,'MarkerFaceColor','c');
%h5=plot3(a5(:,2),a5(:,3),a5(:,9)+10,'^m')%,'MarkerFaceColor','m');
%legend([h1,h2,h3,h4,h5],'生活区','工业区','山区','交通区','公园绿地区',2);
%title('Cu分布色阶图')
%label('x(m)')
%ylabel('y(m)')

%%%%%%%Hg分布图
%[X,Y,HG]=griddata(x,y,Hg,linspace(minx,maxx)',linspace(miny,maxy),'cubic')
%surfc(X,Y,HG,'EdgeColor','none')
%colormap(hsv)
%colorbar
%view(2)
%hold on
%h1=plot3(a1(:,2),a1(:,3),a1(:,10)+50,'or')%,'MarkerFaceColor','r');
%h2=plot3(a2(:,2),a2(:,3),a2(:,10)+50,'*g')%,'MarkerFaceColor','g');
%h3=plot3(a3(:,2),a3(:,3),a3(:,10)+50,'sb')%,'MarkerFaceColor','b');
%h4=plot3(a4(:,2),a4(:,3),a4(:,10)+50,'pc')%,'MarkerFaceColor','c');
%h5=plot3(a5(:,2),a5(:,3),a5(:,10)+50,'^m')%,'MarkerFaceColor','m');
%legend([h1,h2,h3,h4,h5],'生活区','工业区','山区','交通区','公园绿地区',2);
%title('Hg分布色阶图')
%xlabel('x(m)')
%ylabel('y(m)')

%%%%%%%Ni分布图
%[X,Y,NI]=griddata(x,y,Ni,linspace(minx,maxx)',linspace(miny,maxy),'cubic')
%surfc(X,Y,NI,'EdgeColor','none')
%colormap(hsv)
%colorbar
%view(2)
%hold on
%h1=plot3(a1(:,2),a1(:,3),a1(:,11)+5,'or')%,'MarkerFaceColor','r');
%h2=plot3(a2(:,2),a2(:,3),a2(:,11)+5,'*g')%,'MarkerFaceColor','g');
%h3=plot3(a3(:,2),a3(:,3),a3(:,11)+5,'sb')%,'MarkerFaceColor','b');
%h4=plot3(a4(:,2),a4(:,3),a4(:,11)+5,'pc')%,'MarkerFaceColor','c');
%h5=plot3(a5(:,2),a5(:,3),a5(:,11)+5,'^m')%,'MarkerFaceColor','m');
%legend([h1,h2,h3,h4,h5],'生活区','工业区','山区','交通区','公园绿地区',2);
%title('Ni分布色阶图')
%xlabel('x(m)')
%ylabel('y(m)')

%%%%%%%Pb分布图
%[X,Y,PB]=griddata(x,y,Pb,linspace(minx,maxx)',linspace(miny,maxy),'cubic')
%surfc(X,Y,PB,'EdgeColor','none')
%colormap(hsv)
%colorbar
%view(2)
%hold on
%h1=plot3(a1(:,2),a1(:,3),a1(:,12)+5,'or')%,'MarkerFaceColor','r');
%h2=plot3(a2(:,2),a2(:,3),a2(:,12)+5,'*g')%,'MarkerFaceColor','g');
%h3=plot3(a3(:,2),a3(:,3),a3(:,12)+5,'sb')%,'MarkerFaceColor','b');
%h4=plot3(a4(:,2),a4(:,3),a4(:,12)+5,'pc')%,'MarkerFaceColor','c');
%h5=plot3(a5(:,2),a5(:,3),a5(:,12)+5,'^m')%,'MarkerFaceColor','m');
%legend([h1,h2,h3,h4,h5],'生活区','工业区','山区','交通区','公园绿地区',2);
%title('Pb分布色阶图')
%xlabel('x(m)')
%ylabel('y(m)')

%%%%%%%Zn分布图
[X,Y,ZN]=griddata(x,y,Zn,linspace(minx,maxx)',linspace(miny,maxy),'cubic')
surfc(X,Y,ZN,'EdgeColor','none')
colormap(hsv)
colorbar
view(2)
hold on
h1=plot3(a1(:,2),a1(:,3),a1(:,13)+10,'or')%,'MarkerFaceColor','r');
h2=plot3(a2(:,2),a2(:,3),a2(:,13)+10,'*g')%,'MarkerFaceColor','g');
h3=plot3(a3(:,2),a3(:,3),a3(:,13)+10,'sb')%,'MarkerFaceColor','b');
h4=plot3(a4(:,2),a4(:,3),a4(:,13)+10,'pc')%,'MarkerFaceColor','c');
h5=plot3(a5(:,2),a5(:,3),a5(:,13)+10,'^m')%,'MarkerFaceColor','m');
legend([h1,h2,h3,h4,h5],'生活区','工业区','山区','交通区','公园绿地区',2);
title('Zn分布色阶图')
xlabel('x(m)')
ylabel('y(m)')

