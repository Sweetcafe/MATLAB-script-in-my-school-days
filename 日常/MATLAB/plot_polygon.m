function   plot_polygon(n,a)
%n为多边形的边数
%a为多边形的边长,默认值为1
if nargin<2
    a=1;
end
t=(0:n)*2*pi/n;
theta=(n-2)*pi/2/n;
r=a/2/cos(theta);
x=r*cos(t);
y=r*sin(t);
plot(x,y,'r-');