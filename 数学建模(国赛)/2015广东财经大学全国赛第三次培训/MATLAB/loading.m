I=imread('附件4 距月面100m处的数字高程图.tif');
p=I;
[y,x]=size(p);
pp=double(p);
[X,Y]=meshgrid(1:x,1:y);
pp=double(p);
mesh(X,Y,pp);
colormap gray